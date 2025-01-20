@interface NIServerCarKeySession
+ (JobConfig)_aopJobConfigWithTimeouts;
- (NICarKeyConfiguration)configuration;
- (NIServerCarKeySession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5;
- (NIServerDataResponse)processDCKMessage:(id)a3;
- (NIServerNumberResponse)isRangingLimitExceeded;
- (RequestConstructionDebugParams)_ownerDeviceServiceRequestDebugParams:(SEL)a3;
- (Result<rose::RoseServiceRequest>)_passthroughSessionServiceRequest:(SEL)a3;
- (duration<long)nominalCycleRate;
- (id).cxx_construct;
- (id)_configureForLabTestModeSession;
- (id)_configureForOwnerDevice;
- (id)_configureForPassthroughSession;
- (id)_pauseOwnerSession;
- (id)_pausePassthroughOrLabTestModeSession;
- (id)_processCarKeyEvent:(id)a3;
- (id)_runLabTestModeSession;
- (id)_runOwnerSession;
- (id)_runPassthroughSession;
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
- (void)_relayDCKMessageInternal:(const void *)a3;
- (void)invalidate;
- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4;
@end

@implementation NIServerCarKeySession

- (NIServerCarKeySession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = objc_opt_class();
  if (v11 != objc_opt_class())
  {
    v31 = +[NSAssertionHandler currentHandler];
    [v31 handleFailureInMethod:a2 object:self file:@"NIServerCarKeySession.mm" lineNumber:332 description:@"NIServerCarKeySession given invalid configuration."];
  }
  v12 = [v9 serverSessionIdentifier];

  if (!v12)
  {
    v32 = +[NSAssertionHandler currentHandler];
    [v32 handleFailureInMethod:a2, self, @"NIServerCarKeySession.mm", 333, @"Invalid parameter not satisfying: %@", @"resourcesManager.serverSessionIdentifier" object file lineNumber description];
  }
  v13 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#ses-carkey,initWithResourcesManager. Configuration: %@", buf, 0xCu);
  }
  v33.receiver = self;
  v33.super_class = (Class)NIServerCarKeySession;
  v14 = [(NIServerBaseSession *)&v33 initWithResourcesManager:v9 configuration:v10 error:a5];
  if (v14)
  {
    if (v9)
    {
      [v9 protobufLogger];
      long long v15 = *(_OWORD *)buf;
    }
    else
    {
      long long v15 = 0uLL;
    }
    memset(buf, 0, sizeof(buf));
    v16 = (std::__shared_weak_count *)*((void *)v14 + 7);
    *((_OWORD *)v14 + 3) = v15;
    if (v16)
    {
      sub_10001A970(v16);
      if (*(void *)&buf[8]) {
        sub_10001A970(*(std::__shared_weak_count **)&buf[8]);
      }
    }
    uint64_t v17 = [v9 clientConnectionQueue];
    v18 = (void *)*((void *)v14 + 8);
    *((void *)v14 + 8) = v17;

    id v19 = [v10 copy];
    v20 = (void *)*((void *)v14 + 53);
    *((void *)v14 + 53) = v19;

    v21 = [v9 serverSessionIdentifier];
    uint64_t v22 = [v21 UUIDString];
    v23 = (void *)*((void *)v14 + 9);
    *((void *)v14 + 9) = v22;

    if (v9)
    {
      [v9 powerBudgetProvider];
      long long v24 = *(_OWORD *)buf;
    }
    else
    {
      long long v24 = 0uLL;
    }
    memset(buf, 0, sizeof(buf));
    v25 = (std::__shared_weak_count *)*((void *)v14 + 52);
    *(_OWORD *)(v14 + 408) = v24;
    if (v25)
    {
      sub_10001A970(v25);
      if (*(void *)&buf[8]) {
        sub_10001A970(*(std::__shared_weak_count **)&buf[8]);
      }
    }
    v26 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = sub_10018ADD0();
      CFStringRef v28 = @"No";
      if (v27) {
        CFStringRef v28 = @"Yes";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#ses-carkey,Power budget reporting to CPMS is supported: %@", buf, 0xCu);
    }

    v29 = v14;
  }

  return (NIServerCarKeySession *)v14;
}

- (id)lastConfiguration
{
  return self->_configuration;
}

- (void)invalidate
{
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-carkey,invalidate.", buf, 2u);
  }
  id v4 = [(NIServerCarKeySession *)self disableAllServices];
  v5.receiver = self;
  v5.super_class = (Class)NIServerCarKeySession;
  [(NIServerBaseSession *)&v5 invalidate];
}

- (id)disableAllServices
{
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-carkey,disableAllServices.", buf, 2u);
  }
  v19.receiver = self;
  v19.super_class = (Class)NIServerCarKeySession;
  id v4 = [(NIServerBaseSession *)&v19 disableAllServices];
  ptr = self->_alishaManager.__ptr_;
  if (ptr)
  {
    sub_100339940(ptr);
    cntrl = (std::__shared_weak_count *)self->_alishaManager.__cntrl_;
    self->_alishaManager.__ptr_ = 0;
    self->_alishaManager.__cntrl_ = 0;
    if (cntrl) {
      sub_10001A970(cntrl);
    }
  }
  v7 = self->_standaloneAlishaSession.__ptr_;
  if (v7)
  {
    sub_1002D8288((uint64_t)v7);
    v8 = (std::__shared_weak_count *)self->_standaloneAlishaSession.__cntrl_;
    self->_standaloneAlishaSession.__ptr_ = 0;
    self->_standaloneAlishaSession.__cntrl_ = 0;
    if (v8) {
      sub_10001A970(v8);
    }
  }
  id v9 = self->_timeoutManager.__ptr_;
  if (v9)
  {
    sub_1001FED90((uint64_t)v9);
    id v10 = (std::__shared_weak_count *)self->_timeoutManager.__cntrl_;
    self->_timeoutManager.__ptr_ = 0;
    self->_timeoutManager.__cntrl_ = 0;
    if (v10) {
      sub_10001A970(v10);
    }
  }
  uint64_t v11 = (std::__shared_weak_count *)self->_certLogger.__cntrl_;
  self->_certLogger.__ptr_ = 0;
  self->_certLogger.__cntrl_ = 0;
  if (v11) {
    sub_10001A970(v11);
  }
  configuration = self->_configuration;
  if (configuration && (id)[(NICarKeyConfiguration *)configuration configurationType] == (id)3)
  {
    v13 = sub_1002F6464();
    sub_1002F66B0((uint64_t)v13, 0);
    v14 = sub_1002F6464();
    unint64_t v15 = sub_1002F66B8((uint64_t)v14);
    if (v15)
    {
      v16 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#ses-carkey,#lab-test Test mode after invalidation: unknown", buf, 2u);
      }
    }
    else
    {
      if ((v15 & 0xFF0000000000) == 0) {
        __assert_rtn("-[NIServerCarKeySession disableAllServices]", "NIServerCarKeySession.mm", 390, "alishaTestModeResult.payload.has_value()");
      }
      uint64_t v17 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v21 = BYTE4(v15);
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#ses-carkey,#lab-test Test mode after invalidation: %d", buf, 8u);
      }
      if ((v15 & 0xFF00000000) != 0 && os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100426D00();
      }
    }
  }

  return v4;
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)3000;
}

- (unint64_t)requiresUWBToRun
{
  return 2;
}

- (id)configure
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!self->_configuration) {
    sub_100426D34();
  }
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-carkey,configure", buf, 2u);
  }
  id v4 = [(NICarKeyConfiguration *)self->_configuration vehicleIdentifier];
  BOOL v5 = v4 == 0;

  if (v5)
  {
    v18 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100426D60(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
    CFStringRef v46 = @"Vehicle identifier nil or invalid.";
    v26 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    uint64_t v17 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:v26];
  }
  else
  {
    if (!self->_alishaSystem.__ptr_)
    {
      v6 = (char *)operator new(0x20uLL);
      *((void *)v6 + 1) = 0;
      *((void *)v6 + 2) = 0;
      *(void *)v6 = off_100857AF8;
      *((void *)v6 + 3) = off_10085EFA8;
      cntrl = (std::__shared_weak_count *)self->_alishaSystem.__cntrl_;
      self->_alishaSystem.__ptr_ = (AlishaSubsystem *)(v6 + 24);
      self->_alishaSystem.__cntrl_ = (__shared_weak_count *)v6;
      if (cntrl) {
        sub_10001A970(cntrl);
      }
    }
    sub_1002DC17C((uint64_t)buf);
    if (*(_DWORD *)buf)
    {
      v8 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100426DD8(v8, v9, v10, v11, v12, v13, v14, v15);
      }
      NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
      CFStringRef v42 = @"Failed to query device capabilities.";
      v16 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      uint64_t v17 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v16];
    }
    else
    {
      if (!v40) {
        __assert_rtn("-[NIServerCarKeySession configure]", "NIServerCarKeySession.mm", 431, "response.payload.has_value()");
      }
      int v27 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        if (!v40) {
          sub_10000AE44();
        }
        sub_100330480(v39);
        if (v37 >= 0) {
          p_p = &__p;
        }
        else {
          p_p = __p;
        }
        *(_DWORD *)v43 = 136315138;
        v44 = p_p;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#ses-carkey,Alisha Capabilities: %s", v43, 0xCu);
        if (v37 < 0) {
          operator delete(__p);
        }
      }

      sub_1001D08D4((uint64_t)&self->_cachedCapabilities, (uint64_t)v39);
      if ((id)[(NICarKeyConfiguration *)self->_configuration configurationType] == (id)3)
      {
        uint64_t v29 = [(NIServerCarKeySession *)self _configureForLabTestModeSession];
      }
      else
      {
        v30 = [(NICarKeyConfiguration *)self->_configuration debugOptions];
        v31 = [v30 objectForKeyedSubscript:@"PassthroughSession"];
        unsigned int v32 = [v31 BOOLValue];

        int64_t v33 = [(NICarKeyConfiguration *)self->_configuration configurationType];
        if (v33 == 2) {
          int v34 = 1;
        }
        else {
          int v34 = v32;
        }
        if (v34 == 1)
        {
          self->_passthroughParams.isPassthroughSession = 1;
          self->_passthroughParams.anchorSimulation = v33 == 2;
          uint64_t v29 = [(NIServerCarKeySession *)self _configureForPassthroughSession];
        }
        else
        {
          if ((id)[(NICarKeyConfiguration *)self->_configuration configurationType] != (id)1) {
            __assert_rtn("-[NIServerCarKeySession configure]", "NIServerCarKeySession.mm", 457, "_configuration.configurationType == _NICarKeyConfigurationTypeOwner");
          }
          uint64_t v29 = [(NIServerCarKeySession *)self _configureForOwnerDevice];
        }
      }
      uint64_t v17 = (void *)v29;
    }
    sub_1001D0BEC((uint64_t)v39);
  }

  return v17;
}

- (id)run
{
  if ((id)[(NICarKeyConfiguration *)self->_configuration configurationType] == (id)3)
  {
    v3 = [(NIServerCarKeySession *)self _runLabTestModeSession];
  }
  else
  {
    if (self->_passthroughParams.isPassthroughSession) {
      [(NIServerCarKeySession *)self _runPassthroughSession];
    }
    else {
    v3 = [(NIServerCarKeySession *)self _runOwnerSession];
    }
  }

  return v3;
}

- (id)pauseWithSource:(int64_t)a3
{
  if (self->_passthroughParams.isPassthroughSession
    || (id)[(NICarKeyConfiguration *)self->_configuration configurationType] == (id)3)
  {
    id v4 = [(NIServerCarKeySession *)self _pausePassthroughOrLabTestModeSession];
  }
  else
  {
    id v4 = [(NIServerCarKeySession *)self _pauseOwnerSession];
  }

  return v4;
}

- (NIServerDataResponse)processDCKMessage:(id)a3
{
  id v4 = a3;
  BOOL v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)__p = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-carkey,processDCKMessage got dckMessage: %@", buf, 0xCu);
  }
  if (!self->_alishaManager.__ptr_)
  {
    uint64_t v11 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100426E50(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
    CFStringRef v49 = @"State error: No alisha manager when processing DCK message.";
    uint64_t v19 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    uint64_t v10 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v19];

    goto LABEL_16;
  }
  id v6 = [v4 length];
  if (!v4 || (id v7 = v6) == 0)
  {
    uint64_t v20 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100426EC8(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
    CFStringRef v47 = @"Received nil or empty DCK message.";
    CFStringRef v28 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    uint64_t v10 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-19889 userInfo:v28];

LABEL_16:
    uint64_t v8 = 0;
    goto LABEL_38;
  }
  sub_10002DB50(v37, (size_t)v6);
  [v4 getBytes:v37[0] length:v7];
  sub_10033A0E0((uint64_t *)self->_alishaManager.__ptr_, (uint64_t *)v37, (uint64_t)buf);
  if (v45)
  {
    uint64_t v8 = +[NSData dataWithBytes:*(void *)&__p[4] length:v44 - *(void *)&__p[4]];
    uint64_t v9 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)char v40 = 138412290;
      *(void *)&v40[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ses-carkey,DCK processing succeeded and requires sending a response: %@", v40, 0xCu);
    }
    uint64_t v10 = 0;
  }
  else
  {
    if (*(_DWORD *)buf)
    {
      sub_100333FC8(*(int *)buf, v40);
      if (v41 >= 0) {
        uint64_t v29 = v40;
      }
      else {
        uint64_t v29 = *(unsigned char **)v40;
      }
      v30 = +[NSString stringWithFormat:@"DCK processing failed. %s", v29];
      if (v41 < 0) {
        operator delete(*(void **)v40);
      }
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100426F40();
      }
      int v31 = *(_DWORD *)buf;
      NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
      v39 = v30;
      unsigned int v32 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      if ((v31 + 1016) < 3) {
        uint64_t v33 = -5888;
      }
      else {
        uint64_t v33 = -5887;
      }
      uint64_t v10 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:v33 userInfo:v32];
    }
    else
    {
      int v34 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v40 = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "#ses-carkey,DCK processing succeeded and does not require sending a response.", v40, 2u);
      }
      uint64_t v10 = 0;
    }
    uint64_t v8 = 0;
  }
  if (v45 && *(void *)&__p[4])
  {
    uint64_t v44 = *(void *)&__p[4];
    operator delete(*(void **)&__p[4]);
  }
  if (v37[0])
  {
    v37[1] = v37[0];
    operator delete(v37[0]);
  }
LABEL_38:

  v35 = (void *)v8;
  v36 = (void *)v10;
  result.var1 = v36;
  result.var0 = v35;
  return result;
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
    uint64_t v15 = v14;
    *(_DWORD *)buf = 138413058;
    v61 = v15;
    __int16 v62 = 2048;
    unint64_t v63 = a4;
    __int16 v64 = 2048;
    unint64_t v65 = a5;
    __int16 v66 = 2048;
    *(double *)v67 = a6;
    uint64_t v16 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#ses-carkey,processBluetoothHostTimeSyncWithType got event: %@, btc clock ticks: %llu, event counter: %llu, monotonic time: %f [s]", buf, 0x2Au);
  }
  *a7 = 0;
  if (self->_alishaManager.__ptr_)
  {
    if (a3 == 12 || a3 == 138)
    {
      if (a3 == 12) {
        int v17 = 12;
      }
      else {
        int v17 = 138;
      }
      uint64_t v18 = sub_100007D00();
      BOOL v19 = sub_1003D2EDC((uint64_t)v18);
      unint64_t v20 = 7500 * a4;
      if (v19) {
        unint64_t v20 = a4;
      }
      *(_DWORD *)buf = v17;
      LODWORD(v61) = 1;
      BYTE4(v61) = 0;
      BYTE2(v63) = 0;
      unint64_t v65 = v20;
      LOBYTE(v66) = 1;
      *(void *)&v67[3] = a5;
      *(double *)&v67[7] = a6;
      LOBYTE(v51[0]) = 0;
      char v57 = 0;
      sub_10033A824((uint64_t)self->_alishaManager.__ptr_, (unsigned int *)buf, (uint64_t)v51, &v48);
      if (v48)
      {
        sub_100333FC8(v48, __p);
        if (v47 >= 0) {
          uint64_t v21 = __p;
        }
        else {
          uint64_t v21 = (void **)__p[0];
        }
        uint64_t v22 = +[NSString stringWithFormat:@"Failed to process Bluetooth host time sync. %s", v21];
        if (v47 < 0) {
          operator delete(__p[0]);
        }
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_100426F40();
        }
        NSErrorUserInfoKey v58 = NSLocalizedDescriptionKey;
        v59 = v22;
        uint64_t v23 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        uint64_t v24 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-19887 userInfo:v23];
      }
      else
      {
        if (v57)
        {
          v43 = [NIBluetoothHostTimeSyncResponse alloc];
          LOWORD(v45) = v56;
          *a7 = [(NIBluetoothHostTimeSyncResponse *)v43 initWithDeviceEventCount:v51[0] uwbDeviceTimeUs:v51[1] uwbDeviceTimeUncertainty:v52 uwbClockSkewMeasurementAvailable:v53 deviceMaxPpm:v54 success:v55 retryDelay:v45];
        }
        if (v50) {
          [(NIServerCarKeySession *)self _relayDCKMessageInternal:v49];
        }
        uint64_t v24 = 0;
      }
      if (v50 && v49[0])
      {
        v49[1] = v49[0];
        operator delete(v49[0]);
      }
    }
    else
    {
      int v34 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100427020(v34, v35, v36, v37, v38, v39, v40, v41);
      }
      NSErrorUserInfoKey v68 = NSLocalizedDescriptionKey;
      CFStringRef v69 = @"Invalid Bluetooth Host Time Sync Event type. See the NIBluetoothHostTimeSyncType enum for valid options.";
      CFStringRef v42 = +[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
      uint64_t v24 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-19887 userInfo:v42];
    }
  }
  else
  {
    uint64_t v25 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100426FA8(v25, v26, v27, v28, v29, v30, v31, v32);
    }
    NSErrorUserInfoKey v70 = NSLocalizedDescriptionKey;
    CFStringRef v71 = @"State error: No alisha manager when processing Bluetooth Host Time Sync Event.";
    uint64_t v33 = +[NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
    uint64_t v24 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v33];
  }

  return v24;
}

- (NIServerNumberResponse)isRangingLimitExceeded
{
  v2 = sub_1002D162C();
  int v3 = sub_1002D2FCC((NSObject **)v2, 5);
  id v4 = &__kCFBooleanFalse;
  if (v3) {
    id v4 = &__kCFBooleanTrue;
  }
  id v5 = v4;
  id v6 = 0;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (id)deleteURSKs
{
  ptr = self->_alishaManager.__ptr_;
  if (!ptr)
  {
    uint64_t v8 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100427098(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    CFStringRef v22 = @"State error: No alisha manager when deleting URSKs.";
    id v5 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v7 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v5];
    goto LABEL_14;
  }
  int v3 = sub_10033AC90((uint64_t)ptr);
  if (v3)
  {
    sub_100333FC8(v3, __p);
    if (v18 >= 0) {
      id v4 = __p;
    }
    else {
      id v4 = (void **)__p[0];
    }
    id v5 = +[NSString stringWithFormat:@"Failed to delete keys. %s", v4];
    if (v18 < 0) {
      operator delete(__p[0]);
    }
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100426F40();
    }
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    unint64_t v20 = v5;
    id v6 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v7 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-19883 userInfo:v6];

LABEL_14:
    goto LABEL_16;
  }
  id v7 = 0;
LABEL_16:

  return v7;
}

- (id)_setDebugURSK:(id)a3 transactionIdentifier:(unsigned int)a4
{
  id v6 = a3;
  [@"com.apple.nearbyd" UTF8String];
  if (os_variant_allows_internal_security_policies())
  {
    if (v6 && [v6 length] == (id)32)
    {
      [v6 getBytes:v29 length:32];
      unsigned int v26 = a4;
      long long v27 = v29[0];
      long long v28 = v29[1];
      int v7 = sub_1002DC7BC((uint64_t)self->_alishaSystem.__ptr_, (uint64_t)&v26);
      if (v7)
      {
        sub_100333FC8(v7, __p);
        if (v23 >= 0) {
          uint64_t v8 = __p;
        }
        else {
          uint64_t v8 = (void **)__p[0];
        }
        uint64_t v9 = +[NSString stringWithFormat:@"Failed to set debug key. %s", v8];
        if (v23 < 0) {
          operator delete(__p[0]);
        }
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_100426F40();
        }
        NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
        uint64_t v25 = v9;
        uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
        uint64_t v11 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-19886 userInfo:v10];
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
    else
    {
      uint64_t v12 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100427110(v12, v13, v14, v15, v16, v17, v18, v19);
      }
      NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
      CFStringRef v31 = @"Nil or invalid length URSK.";
      unint64_t v20 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      uint64_t v11 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-19886 userInfo:v20];
    }
  }
  else
  {
    uint64_t v11 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
  }

  return v11;
}

- (id)_setURSKTTL:(unint64_t)a3
{
  [@"com.apple.nearbyd" UTF8String];
  if (os_variant_allows_internal_security_policies())
  {
    int v5 = sub_1002DC964((uint64_t)self->_alishaSystem.__ptr_, a3);
    if (v5)
    {
      sub_100333FC8(v5, __p);
      if (v12 >= 0) {
        id v6 = __p;
      }
      else {
        id v6 = (void **)__p[0];
      }
      int v7 = +[NSString stringWithFormat:@"Failed to set URSK TTL. %s", v6];
      if (v12 < 0) {
        operator delete(__p[0]);
      }
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100426F40();
      }
      NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
      uint64_t v14 = v7;
      uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      uint64_t v9 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-18889 userInfo:v8];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
  }

  return v9;
}

- (id)_processCarKeyEvent:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    id v6 = [v4 objectForKey:@"CarKeyEventType"];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v7 = [v6 integerValue];
      uint64_t v8 = [v5 objectForKey:@"CarKeyEventReason"];
      id v9 = [v8 integerValue];

      switch((unint64_t)v7)
      {
        case 1uLL:
          uint64_t v10 = (id)qword_1008ABDE0;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v11 = [(NICarKeyConfiguration *)self->_configuration vehicleIdentifier];
            *(_DWORD *)buf = 67109378;
            int v44 = (int)v9;
            LOWORD(v45) = 2112;
            *(void *)((char *)&v45 + 2) = v11;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-carkey,_processCarKeyEvent: vehicle unlocked (reason %d) for vehicle identifier: %@", buf, 0x12u);
          }
          ptr = self->_analyticsManager.__ptr_;
          if (ptr) {
            sub_1001C18E0((uint64_t)ptr);
          }
          goto LABEL_62;
        case 2uLL:
          uint64_t v17 = (id)qword_1008ABDE0;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v18 = [(NICarKeyConfiguration *)self->_configuration vehicleIdentifier];
            *(_DWORD *)buf = 67109378;
            int v44 = (int)v9;
            LOWORD(v45) = 2112;
            *(void *)((char *)&v45 + 2) = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#ses-carkey,_processCarKeyEvent: vehicle locked (reason %d) for vehicle identifier: %@", buf, 0x12u);
          }
          uint64_t v19 = self->_analyticsManager.__ptr_;
          if (v19) {
            sub_1001C1710((uint64_t)v19);
          }
          goto LABEL_62;
        case 3uLL:
          unint64_t v20 = (id)qword_1008ABDE0;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            NSErrorUserInfoKey v21 = [(NICarKeyConfiguration *)self->_configuration vehicleIdentifier];
            *(_DWORD *)buf = 67109378;
            int v44 = (int)v9;
            LOWORD(v45) = 2112;
            *(void *)((char *)&v45 + 2) = v21;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#ses-carkey,_processCarKeyEvent: vehicle ready to drive (reason %d) for vehicle identifier: %@", buf, 0x12u);
          }
          CFStringRef v22 = self->_analyticsManager.__ptr_;
          if (v22) {
            sub_1001C1AD4((uint64_t)v22);
          }
          goto LABEL_62;
        case 4uLL:
          char v23 = (id)qword_1008ABDE0;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            NSErrorUserInfoKey v24 = [(NICarKeyConfiguration *)self->_configuration vehicleIdentifier];
            *(_DWORD *)buf = 67109378;
            int v44 = (int)v9;
            LOWORD(v45) = 2112;
            *(void *)((char *)&v45 + 2) = v24;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#ses-carkey,_processCarKeyEvent: ranging intent sent to vehicle (reason %d) for vehicle identifier: %@", buf, 0x12u);
          }
          uint64_t v25 = self->_analyticsManager.__ptr_;
          if (v25)
          {
            if (v9 == (id)2)
            {
              sub_1001C155C((uint64_t)v25);
            }
            else if (v9 == (id)1)
            {
              sub_1001C13AC((uint64_t)v25);
            }
            else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
            {
              sub_100427258();
            }
          }
          goto LABEL_62;
        case 5uLL:
          unsigned int v26 = self->_alishaManager.__ptr_;
          if (v26)
          {
            sub_100339F5C((uint64_t)v26, buf);
            long long v27 = (id)qword_1008ABDE0;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              long long v28 = [(NICarKeyConfiguration *)self->_configuration vehicleIdentifier];
              sub_100333FC8(*(int *)buf, __p);
              if (v38 >= 0) {
                uint64_t v29 = __p;
              }
              else {
                uint64_t v29 = (void **)__p[0];
              }
              *(_DWORD *)uint64_t v39 = 138412546;
              uint64_t v40 = v28;
              __int16 v41 = 2080;
              CFStringRef v42 = v29;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#ses-carkey,_processCarKeyEvent: vehicle sent ranging terminated sub-event. Vehicle identifier: %@. Stop ranging status: %s", v39, 0x16u);
              if (v38 < 0) {
                operator delete(__p[0]);
              }
            }
            goto LABEL_50;
          }
          uint64_t v33 = (id)qword_1008ABDE0;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
          {
            int v34 = [(NICarKeyConfiguration *)self->_configuration vehicleIdentifier];
            sub_10042728C(v34, buf, v33);
          }
          goto LABEL_55;
        case 6uLL:
          NSErrorUserInfoKey v30 = self->_alishaManager.__ptr_;
          if (v30)
          {
            sub_100339F5C((uint64_t)v30, buf);
            long long v27 = (id)qword_1008ABDE0;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              CFStringRef v31 = [(NICarKeyConfiguration *)self->_configuration vehicleIdentifier];
              sub_100333FC8(*(int *)buf, __p);
              if (v38 >= 0) {
                uint64_t v32 = __p;
              }
              else {
                uint64_t v32 = (void **)__p[0];
              }
              *(_DWORD *)uint64_t v39 = 138412546;
              uint64_t v40 = v31;
              __int16 v41 = 2080;
              CFStringRef v42 = v32;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#ses-carkey,_processCarKeyEvent: vehicle sent ranging suspension sub-event. Vehicle identifier: %@. Stop ranging status: %s", v39, 0x16u);
              if (v38 < 0) {
                operator delete(__p[0]);
              }
            }
LABEL_50:

            if (v46 && (void)v45)
            {
              *((void *)&v45 + 1) = v45;
              operator delete((void *)v45);
            }
          }
          else
          {
            uint64_t v33 = (id)qword_1008ABDE0;
            if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
            {
              uint64_t v35 = [(NICarKeyConfiguration *)self->_configuration vehicleIdentifier];
              sub_1004272E4(v35, buf, v33);
            }
LABEL_55:
          }
LABEL_62:
          uint64_t v14 = 0;
          break;
        default:
          uint64_t v15 = (id)qword_1008ABDE0;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            uint64_t v16 = [(NICarKeyConfiguration *)self->_configuration vehicleIdentifier];
            sub_1004271F0((int)v7, v16, buf, v15);
          }

          uint64_t v13 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-19881 userInfo:0];
          goto LABEL_12;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_1004271BC();
      }
      uint64_t v13 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-19881 userInfo:0];
LABEL_12:
      uint64_t v14 = (void *)v13;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100427188();
    }
    uint64_t v14 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-19881 userInfo:0];
  }

  return v14;
}

- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4
{
  if (a3 == 4)
  {
    ptr = self->_alishaManager.__ptr_;
    if (ptr) {
      sub_10033ACE8((uint64_t)ptr);
    }
  }
}

- (shared_ptr<rose::objects::AlishaSession>)_buildAlishaSession:(const void *)a3
{
  int v5 = v3;
  id v6 = self;
  sub_100004950(__p, (char *)[(NSString *)v6->_containerUniqueIdentifier UTF8String]);
  id v7 = operator new(0x5D8uLL);
  v7[1] = 0;
  v7[2] = 0;
  void *v7 = off_100857B48;
  uint64_t v8 = v7 + 3;
  id v9 = v6;
  *(void *)buf = off_10085C3E8;
  uint64_t v33 = v9;
  int v34 = buf;
  uint64_t v10 = v9;
  v31[0] = off_10085C468;
  v31[1] = v10;
  v31[3] = v31;
  uint64_t v11 = v10;
  v30[0] = off_10085C4E8;
  v30[1] = v11;
  v30[3] = v30;
  v29[3] = 0;
  char v12 = v11;
  v28[0] = off_10085C568;
  v28[1] = v12;
  v28[3] = v28;
  uint64_t v13 = v12;
  v27[0] = off_10085C5E8;
  v27[1] = v13;
  v27[3] = v27;
  uint64_t v14 = v13;
  v26[0] = off_10085C668;
  v26[1] = v14;
  v26[3] = v26;
  ptr = v6->_pbLogger.__ptr_;
  cntrl = (std::__shared_weak_count *)v6->_pbLogger.__cntrl_;
  uint64_t v25 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit(&cntrl->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_1002DCE4C(v8, (long long *)__p, (void *)a3, (uint64_t)buf, (uint64_t)v31, (uint64_t)v30, (uint64_t)v29, (uint64_t)v28, (uint64_t)v27, (uint64_t)v26, &ptr);
  if (v25) {
    sub_10001A970(v25);
  }
  sub_1001D29EC(v26);
  sub_1001D2A70(v27);
  sub_1001D2AF4(v28);
  sub_1001D2B78(v29);
  sub_1001D2BFC(v30);
  sub_1001D2C80(v31);
  sub_1001D2D04(buf);
  *(void *)&long long v21 = v7 + 3;
  *((void *)&v21 + 1) = v7;
  sub_10001ABCC((uint64_t)&v21, v7 + 5, (uint64_t)v8);
  uint64_t v16 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#ses-carkey,Registering for Alisha service.", buf, 2u);
  }
  int v17 = sub_1002D85F4(v21);
  if (v17)
  {
    uint64_t v18 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      sub_1002DE064(v17, buf);
      sub_10042733C();
    }

    *int v5 = 0;
    v5[1] = 0;
    if (*((void *)&v21 + 1)) {
      sub_10001A970(*((std::__shared_weak_count **)&v21 + 1));
    }
  }
  else
  {
    *(_OWORD *)int v5 = v21;
  }
  if (v23 < 0) {
    operator delete(__p[0]);
  }

  result.__cntrl_ = v20;
  result.__ptr_ = v19;
  return result;
}

- (void)_alishaSessionInvalidatedWithReason:(int)a3
{
  int v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_1002DE0A8(a3, v9);
    sub_1004273A0();
  }

  [(NIServerCarKeySession *)self invalidate];
  v8.receiver = self;
  v8.super_class = (Class)NIServerCarKeySession;
  id v6 = [(NIServerBaseSession *)&v8 invalidationHandler];
  id v7 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:0];
  ((void (**)(void, void *))v6)[2](v6, v7);
}

- (id)_configureForOwnerDevice
{
  p_cachedCapabilities = &self->_cachedCapabilities;
  if (!self->_cachedCapabilities.__engaged_)
  {
    int v44 = +[NSAssertionHandler currentHandler];
    [v44 handleFailureInMethod:a2, self, @"NIServerCarKeySession.mm", 876, @"Invalid parameter not satisfying: %@", @"_cachedCapabilities.has_value()" object file lineNumber description];
  }
  id v4 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-carkey,_configureForOwnerDevice", buf, 2u);
  }
  if (self->_passthroughParams.isPassthroughSession) {
    sub_100427430();
  }
  if (self->_passthroughParams.anchorSimulation) {
    sub_100427404();
  }
  int v5 = self;
  p_dckCoder = &v5->_dckCoder;
  if (!v5->_dckCoder.__ptr_)
  {
    sub_100282FD4(word_1004BCA80, buf);
    shared_ptr<rose::alisha::dck::Coder> v32 = *(shared_ptr<rose::alisha::dck::Coder> *)buf;
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = 0;
    cntrl = (std::__shared_weak_count *)v5->_dckCoder.__cntrl_;
    shared_ptr<rose::alisha::dck::Coder> *p_dckCoder = v32;
    if (cntrl)
    {
      sub_10001A970(cntrl);
      if (*(void *)&buf[8]) {
        sub_10001A970(*(std::__shared_weak_count **)&buf[8]);
      }
    }
  }
  p_configProvider = &v5->_configProvider;
  if (!v5->_configProvider.__ptr_)
  {
    LOBYTE(ptr) = 0;
    int v34 = [(NICarKeyConfiguration *)v5->_configuration debugOptions];
    uint64_t v35 = [v34 objectForKeyedSubscript:@"BypassBluetoothTimesync"];
    unsigned __int8 v36 = [v35 BOOLValue];

    LOBYTE(ptr) = v36;
    sub_10028310C((char *)&ptr, buf);
    shared_ptr<AlishaConfigProvider> v37 = *(shared_ptr<AlishaConfigProvider> *)buf;
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = 0;
    char v38 = (std::__shared_weak_count *)v5->_configProvider.__cntrl_;
    shared_ptr<AlishaConfigProvider> *p_configProvider = v37;
    if (v38)
    {
      sub_10001A970(v38);
      if (*(void *)&buf[8]) {
        sub_10001A970(*(std::__shared_weak_count **)&buf[8]);
      }
    }
  }
  p_paramNegotiator = &v5->_paramNegotiator;
  if (!v5->_paramNegotiator.__ptr_)
  {
    if (!p_cachedCapabilities->__engaged_) {
      sub_10000AE44();
    }
    id v9 = operator new(0xE8uLL);
    uint64_t v10 = (__shared_weak_count *)v9;
    v9[1] = 0;
    v9[2] = 0;
    *id v9 = off_100858108;
    uint64_t v11 = (ParameterNegotiator *)(v9 + 3);
    *(void *)&long long v58 = v5->_alishaSystem.__ptr_;
    char v12 = v5->_alishaSystem.__cntrl_;
    *((void *)&v58 + 1) = v12;
    if (v12) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)v12 + 1, 1uLL, memory_order_relaxed);
    }
    ptr = p_configProvider->__ptr_;
    uint64_t v13 = (std::__shared_weak_count *)v5->_configProvider.__cntrl_;
    char v57 = v13;
    if (v13) {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    *(void *)buf = off_10085C868;
    v61 = buf;
    sub_10032A340(v9 + 3, p_cachedCapabilities, &v58, &ptr, buf);
    sub_1001D3C34(buf);
    if (v57) {
      sub_10001A970(v57);
    }
    if (*((void *)&v58 + 1)) {
      sub_10001A970(*((std::__shared_weak_count **)&v58 + 1));
    }
    uint64_t v14 = (std::__shared_weak_count *)v5->_paramNegotiator.__cntrl_;
    p_paramNegotiator->__ptr_ = v11;
    v5->_paramNegotiator.__cntrl_ = v10;
    if (v14) {
      sub_10001A970(v14);
    }
  }
  uint64_t v15 = v5;
  p_analyticsManager = &v15->_analyticsManager;
  if (!v15->_analyticsManager.__ptr_)
  {
    int v17 = (__shared_weak_count *)operator new(0xE0uLL);
    *((void *)v17 + 1) = 0;
    *((void *)v17 + 2) = 0;
    *(void *)int v17 = off_10085C8E8;
    sub_1001BF604((uint64_t)v17 + 24, v15->_clientQueue);
    uint64_t v18 = (std::__shared_weak_count *)v15->_analyticsManager.__cntrl_;
    p_analyticsManager->__ptr_ = (AnalyticsManager *)((char *)v17 + 24);
    v15->_analyticsManager.__cntrl_ = v17;
    if (v18) {
      sub_10001A970(v18);
    }
  }
  if (!v15->_certLogger.__ptr_)
  {
    id v46 = [(NICarKeyConfiguration *)v15->_configuration vehicleIdentifier];
    sub_100284008(&v46, buf);
    shared_ptr<NIServerCarKeyCertificationLogger> v19 = *(shared_ptr<NIServerCarKeyCertificationLogger> *)buf;
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = 0;
    unint64_t v20 = (std::__shared_weak_count *)v15->_certLogger.__cntrl_;
    v15->_certLogger = v19;
    if (v20)
    {
      sub_10001A970(v20);
      if (*(void *)&buf[8]) {
        sub_10001A970(*(std::__shared_weak_count **)&buf[8]);
      }
    }
  }
  if (!v15->_alishaManager.__ptr_)
  {
    sub_1002D162C();
    sub_1002D2F30(5, v15->_containerUniqueIdentifier, v15->_clientQueue, &v45);
    long long v21 = operator new(0x100uLL);
    v21[1] = 0;
    v21[2] = 0;
    void *v21 = off_10085C988;
    CFStringRef v22 = v15;
    *(void *)buf = off_10085C9D8;
    *(void *)&uint8_t buf[8] = v22;
    v61 = buf;
    char v23 = v22;
    *(void *)&long long v58 = off_10085CA58;
    *((void *)&v58 + 1) = v23;
    v59 = &v58;
    ptr = v15->_alishaSystem.__ptr_;
    NSErrorUserInfoKey v24 = (std::__shared_weak_count *)v15->_alishaSystem.__cntrl_;
    char v57 = v24;
    if (v24) {
      atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    unsigned __int16 v54 = p_dckCoder->__ptr_;
    uint64_t v25 = (std::__shared_weak_count *)v5->_dckCoder.__cntrl_;
    unsigned __int8 v55 = v25;
    if (v25) {
      atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    unsigned __int8 v52 = p_paramNegotiator->__ptr_;
    unsigned int v26 = (std::__shared_weak_count *)v5->_paramNegotiator.__cntrl_;
    unsigned __int8 v53 = v26;
    if (v26) {
      atomic_fetch_add_explicit(&v26->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    long long v51 = v45;
    if (*((void *)&v45 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v45 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    CFStringRef v49 = v15->_pbLogger.__ptr_;
    long long v27 = (std::__shared_weak_count *)v15->_pbLogger.__cntrl_;
    char v50 = v27;
    if (v27) {
      atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    char v47 = p_analyticsManager->__ptr_;
    long long v28 = (std::__shared_weak_count *)v15->_analyticsManager.__cntrl_;
    int v48 = v28;
    if (v28) {
      atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    sub_100339864((uint64_t)(v21 + 3), (uint64_t)buf, (uint64_t)&v58, &ptr, &v54, &v52, &v51, &v49, &v47);
    if (v48) {
      sub_10001A970(v48);
    }
    if (v50) {
      sub_10001A970(v50);
    }
    if (*((void *)&v51 + 1)) {
      sub_10001A970(*((std::__shared_weak_count **)&v51 + 1));
    }
    if (v53) {
      sub_10001A970(v53);
    }
    if (v55) {
      sub_10001A970(v55);
    }
    if (v57) {
      sub_10001A970(v57);
    }
    sub_1001D43C0(&v58);
    sub_1001D4444(buf);
    uint64_t v29 = (std::__shared_weak_count *)v15->_alishaManager.__cntrl_;
    v15->_alishaManager.__ptr_ = (AlishaManager *)(v21 + 3);
    v15->_alishaManager.__cntrl_ = (__shared_weak_count *)v21;
    if (v29) {
      sub_10001A970(v29);
    }
    if (*((void *)&v45 + 1)) {
      sub_10001A970(*((std::__shared_weak_count **)&v45 + 1));
    }
  }
  NSErrorUserInfoKey v30 = v15;
  if (!v30->_timeoutManager.__ptr_)
  {
    uint64_t v39 = operator new(0x78uLL);
    v39[1] = 0;
    v39[2] = 0;
    void *v39 = off_10085CAD8;
    uint64_t v40 = v30;
    *(void *)buf = off_10085CB28;
    *(void *)&uint8_t buf[8] = v40;
    v61 = buf;
    sub_1001FEC4C((uint64_t)(v39 + 3), (uint64_t)buf, v30->_clientQueue, v30->_containerUniqueIdentifier);
    sub_1001D29EC(buf);
    *(void *)&long long v58 = v39 + 3;
    *((void *)&v58 + 1) = v39;
    sub_10001ABCC((uint64_t)&v58, (void *)v58, v58);
    shared_ptr<rose::timeout_management::CarKeyTimeoutManager> v41 = (shared_ptr<rose::timeout_management::CarKeyTimeoutManager>)v58;
    long long v58 = 0uLL;
    CFStringRef v42 = (std::__shared_weak_count *)v30->_timeoutManager.__cntrl_;
    v30->_timeoutManager = v41;
    if (v42)
    {
      sub_10001A970(v42);
      if (*((void *)&v58 + 1)) {
        sub_10001A970(*((std::__shared_weak_count **)&v58 + 1));
      }
    }
  }

  return 0;
}

- (id)_configureForPassthroughSession
{
  [@"com.apple.nearbyd" UTF8String];
  if ((os_variant_allows_internal_security_policies() & 1) == 0)
  {
    shared_ptr<NIServerCarKeyCertificationLogger> v19 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
    goto LABEL_68;
  }
  id v4 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    BOOL anchorSimulation = self->_passthroughParams.anchorSimulation;
    *(_DWORD *)buf = 67109120;
    BOOL v82 = anchorSimulation;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-carkey,_configureForPassthroughSession. Anchor: %d", buf, 8u);
  }
  if (!self->_configuration)
  {
    v72 = +[NSAssertionHandler currentHandler];
    [v72 handleFailureInMethod:a2, self, @"NIServerCarKeySession.mm", 968, @"Invalid parameter not satisfying: %@", @"_configuration" object file lineNumber description];
  }
  if (!self->_cachedCapabilities.__engaged_)
  {
    v73 = +[NSAssertionHandler currentHandler];
    [v73 handleFailureInMethod:a2, self, @"NIServerCarKeySession.mm", 969, @"Invalid parameter not satisfying: %@", @"_cachedCapabilities.has_value()" object file lineNumber description];
  }
  id v6 = [(NICarKeyConfiguration *)self->_configuration debugOptions];
  BOOL v7 = v6 == 0;

  if (v7)
  {
    NSErrorUserInfoKey v91 = NSLocalizedDescriptionKey;
    CFStringRef v92 = @"Passthrough configuration must have debugOptions.";
    unint64_t v20 = +[NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
    shared_ptr<NIServerCarKeyCertificationLogger> v19 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:v20];

    goto LABEL_68;
  }
  objc_super v8 = [(NICarKeyConfiguration *)self->_configuration debugOptions];
  id v9 = [v8 objectForKeyedSubscript:@"BypassBluetoothTimesync"];
  self->_passthroughParams.bypassBluetoothTimesync = [v9 BOOLValue];

  if (self->_passthroughParams.anchorSimulation)
  {
    if (!self->_passthroughParams.bypassBluetoothTimesync)
    {
      uint64_t v10 = [(NICarKeyConfiguration *)self->_configuration debugOptions];
      uint64_t v11 = [v10 objectForKeyedSubscript:@"DckTimeSyncBtEventLocalClock"];

      if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        uint64_t v35 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10042754C(v35, v36, v37, v38, v39, v40, v41, v42);
        }
        NSErrorUserInfoKey v87 = NSLocalizedDescriptionKey;
        CFStringRef v88 = @"Anchor simulation must provide DckTimeSyncBtEventLocalClock in debug options.";
        v43 = +[NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1];
        shared_ptr<NIServerCarKeyCertificationLogger> v19 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:v43];

        goto LABEL_68;
      }
      unint64_t v12 = (unint64_t)[v11 unsignedLongLongValue];
      uint64_t v13 = sub_100007D00();
      BOOL v14 = sub_1003D2EDC((uint64_t)v13);
      BOOL engaged = self->_passthroughParams.dckTimeSyncBtEvent.__engaged_;
      unint64_t v16 = 7500 * v12;
      if (v14) {
        unint64_t v16 = v12;
      }
      *(void *)&self->_passthroughParams.dckTimeSyncBtEvent.var0.__null_state_ = 0x10000008ALL;
      self->_passthroughParams.dckTimeSyncBtEvent.var0.__val_.bluetoothTicks.var0.__null_state_ = 0;
      self->_passthroughParams.dckTimeSyncBtEvent.var0.__val_.bluetoothTicks.__engaged_ = 0;
      self->_passthroughParams.dckTimeSyncBtEvent.var0.__val_.gtbTicks.var0.__val_.__rep_ = v16;
      self->_passthroughParams.dckTimeSyncBtEvent.var0.__val_.gtbTicks.__engaged_ = 1;
      self->_passthroughParams.dckTimeSyncBtEvent.var0.__val_.eventCounter = 0;
      self->_passthroughParams.dckTimeSyncBtEvent.var0.__val_.monotonicTimeSec = 0.0;
      if (!engaged) {
        self->_passthroughParams.dckTimeSyncBtEvent.__engaged_ = 1;
      }
      int v17 = [(NICarKeyConfiguration *)self->_configuration debugOptions];
      uint64_t v18 = [v17 objectForKeyedSubscript:@"DckTimeSyncUwbDeviceTime"];

      if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        __int16 v62 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_1004275C4(v62, v63, v64, v65, v66, v67, v68, v69);
        }
        NSErrorUserInfoKey v85 = NSLocalizedDescriptionKey;
        CFStringRef v86 = @"Anchor simulation must provide DckTimeSyncUwbDeviceTime in debug options.";
        NSErrorUserInfoKey v70 = +[NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];
        shared_ptr<NIServerCarKeyCertificationLogger> v19 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:v70];

        goto LABEL_68;
      }
      self->_passthroughParams.dckTimeSyncUwbDeviceTimeUsec.var0.__val_ = (unint64_t)[v18 unsignedLongLongValue];
      self->_passthroughParams.dckTimeSyncUwbDeviceTimeUsec.__engaged_ = 1;
    }
  }
  else if (!self->_passthroughParams.bypassBluetoothTimesync)
  {
    int v44 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10042745C(v44, v45, v46, v47, v48, v49, v50, v51);
    }
    NSErrorUserInfoKey v89 = NSLocalizedDescriptionKey;
    CFStringRef v90 = @"Passthrough session in mobile role must bypass BT timesync.";
    unsigned __int8 v52 = +[NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
    shared_ptr<NIServerCarKeyCertificationLogger> v19 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:v52];

    goto LABEL_68;
  }
  long long v21 = [(NICarKeyConfiguration *)self->_configuration debugOptions];
  [(NIServerCarKeySession *)self _passthroughSessionServiceRequest:v21];

  if (v84) {
    int v22 = 0;
  }
  else {
    int v22 = -1004;
  }
  if (*(_DWORD *)buf) {
    int v23 = *(_DWORD *)buf;
  }
  else {
    int v23 = v22;
  }
  if (v23)
  {
    sub_100333FC8(v23, __p);
    if (v76 >= 0) {
      NSErrorUserInfoKey v24 = __p;
    }
    else {
      NSErrorUserInfoKey v24 = (void **)__p[0];
    }
    uint64_t v25 = +[NSString stringWithFormat:@"Failed to create alisha service request. %s", v24];
    if (v76 < 0) {
      operator delete(__p[0]);
    }
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100426F40();
    }
    NSErrorUserInfoKey v79 = NSLocalizedDescriptionKey;
    v80 = v25;
    unsigned int v26 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
    if ((v23 + 1016) < 3) {
      uint64_t v27 = -5888;
    }
    else {
      uint64_t v27 = -5887;
    }
    shared_ptr<NIServerCarKeyCertificationLogger> v19 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:v27 userInfo:v26];

    goto LABEL_68;
  }
  p_standaloneAlishaSession = &self->_standaloneAlishaSession;
  ptr = self->_standaloneAlishaSession.__ptr_;
  if (ptr)
  {
    sub_1002D8288((uint64_t)ptr);
    cntrl = (std::__shared_weak_count *)self->_standaloneAlishaSession.__cntrl_;
    p_standaloneAlishaSession->__ptr_ = 0;
    self->_standaloneAlishaSession.__cntrl_ = 0;
    if (cntrl) {
      sub_10001A970(cntrl);
    }
  }
  if (!v84) {
    sub_10000AE44();
  }
  [(NIServerCarKeySession *)self _buildAlishaSession:&v83];
  shared_ptr<rose::objects::AlishaSession> v31 = *(shared_ptr<rose::objects::AlishaSession> *)__p;
  __p[0] = 0;
  __p[1] = 0;
  shared_ptr<rose::alisha::dck::Coder> v32 = (std::__shared_weak_count *)self->_standaloneAlishaSession.__cntrl_;
  shared_ptr<rose::objects::AlishaSession> *p_standaloneAlishaSession = v31;
  if (v32)
  {
    sub_10001A970(v32);
    if (__p[1]) {
      sub_10001A970((std::__shared_weak_count *)__p[1]);
    }
    if (p_standaloneAlishaSession->__ptr_) {
      goto LABEL_49;
    }
  }
  else if (v31.__ptr_)
  {
LABEL_49:
    if (!self->_certLogger.__ptr_)
    {
      id v74 = [(NICarKeyConfiguration *)self->_configuration vehicleIdentifier];
      sub_100284008(&v74, __p);
      shared_ptr<NIServerCarKeyCertificationLogger> v33 = *(shared_ptr<NIServerCarKeyCertificationLogger> *)__p;
      __p[0] = 0;
      __p[1] = 0;
      int v34 = (std::__shared_weak_count *)self->_certLogger.__cntrl_;
      self->_certLogger = v33;
      if (v34)
      {
        sub_10001A970(v34);
        if (__p[1]) {
          sub_10001A970((std::__shared_weak_count *)__p[1]);
        }
      }
    }
    shared_ptr<NIServerCarKeyCertificationLogger> v19 = 0;
    goto LABEL_68;
  }
  unsigned __int8 v53 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_1004274D4(v53, v54, v55, v56, v57, v58, v59, v60);
  }
  NSErrorUserInfoKey v77 = NSLocalizedDescriptionKey;
  CFStringRef v78 = @"Failed to create alisha standalone session.";
  v61 = +[NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
  shared_ptr<NIServerCarKeyCertificationLogger> v19 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v61];

LABEL_68:

  return v19;
}

- (id)_configureForLabTestModeSession
{
  id v4 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-carkey,#lab-test _configure", buf, 2u);
  }
  configuration = self->_configuration;
  if (!configuration)
  {
    v103 = +[NSAssertionHandler currentHandler];
    [v103 handleFailureInMethod:a2, self, @"NIServerCarKeySession.mm", 1055, @"Invalid parameter not satisfying: %@", @"_configuration" object file lineNumber description];

    configuration = self->_configuration;
  }
  if ((id)[(NICarKeyConfiguration *)configuration configurationType] != (id)3)
  {
    v104 = +[NSAssertionHandler currentHandler];
    [v104 handleFailureInMethod:a2, self, @"NIServerCarKeySession.mm", 1056, @"Invalid parameter not satisfying: %@", @"_configuration.configurationType == _NICarKeyConfigurationTypeLabTestMode" object file lineNumber description];
  }
  if (!self->_alishaSystem.__ptr_)
  {
    v105 = +[NSAssertionHandler currentHandler];
    [v105 handleFailureInMethod:a2, self, @"NIServerCarKeySession.mm", 1057, @"Invalid parameter not satisfying: %@", @"_alishaSystem" object file lineNumber description];
  }
  v143.receiver = self;
  v143.super_class = (Class)NIServerCarKeySession;
  id v6 = [(NIServerBaseSession *)&v143 resourcesManager];
  if ([v6 entitlementGranted:7])
  {
    BOOL v7 = sub_1002F6464();
    unint64_t v8 = sub_1002F66B8((uint64_t)v7);
    if (v8)
    {
      id v9 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100427884(v9, v10, v11, v12, v13, v14, v15, v16);
      }
      NSErrorUserInfoKey v156 = NSLocalizedDescriptionKey;
      CFStringRef v157 = @"Current test mode undetermined.";
      int v17 = +[NSDictionary dictionaryWithObjects:&v157 forKeys:&v156 count:1];
      uint64_t v18 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v17];

      goto LABEL_17;
    }
    if ((v8 & 0xFF0000000000) == 0) {
      __assert_rtn("-[NIServerCarKeySession _configureForLabTestModeSession]", "NIServerCarKeySession.mm", 1077, "alishaTestModeResult.payload.has_value()");
    }
    uint64_t v29 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v147 = BYTE4(v8);
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "#ses-carkey,#lab-test current test mode: %d", buf, 8u);
    }
    if ((v8 & 0xFF00000000) != 0) {
      goto LABEL_24;
    }
    if (sub_1002DC428())
    {
      uint64_t v54 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10042780C(v54, v55, v56, v57, v58, v59, v60, v61);
      }
      NSErrorUserInfoKey v154 = NSLocalizedDescriptionKey;
      CFStringRef v155 = @"Failed to delete keys.";
      __int16 v62 = +[NSDictionary dictionaryWithObjects:&v155 forKeys:&v154 count:1];
      uint64_t v18 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v62];

      goto LABEL_17;
    }
    uint64_t v65 = sub_1002F6464();
    if (sub_1002F66B0((uint64_t)v65, 1))
    {
      uint64_t v66 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100427794(v66, v67, v68, v69, v70, v71, v72, v73);
      }
      NSErrorUserInfoKey v152 = NSLocalizedDescriptionKey;
      CFStringRef v153 = @"Failed to set test mode.";
      id v74 = +[NSDictionary dictionaryWithObjects:&v153 forKeys:&v152 count:1];
      uint64_t v18 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v74];

      goto LABEL_17;
    }
    CFStringRef v92 = sub_1002F6464();
    unint64_t v93 = sub_1002F66B8((uint64_t)v92);
    if (!v93 && (v93 & 0xFF0000000000) != 0 && (v93 & 0xFF00000000) != 0)
    {
LABEL_24:
      NSErrorUserInfoKey v30 = [(NICarKeyConfiguration *)self->_configuration debugOptions];
      unsigned __int16 v117 = (unsigned __int16)sub_10027EFC0(v30, @"AlishaProtocolVersion", (id)0x100);

      shared_ptr<rose::objects::AlishaSession> v31 = [(NICarKeyConfiguration *)self->_configuration debugOptions];
      unsigned __int16 v116 = (unsigned __int16)sub_10027EFC0(v31, @"UWBConfigId", (id)1);

      shared_ptr<rose::alisha::dck::Coder> v32 = [(NICarKeyConfiguration *)self->_configuration debugOptions];
      unsigned __int8 v115 = sub_10027EFC0(v32, @"PulseShapeCombo", 0);

      shared_ptr<NIServerCarKeyCertificationLogger> v33 = [(NICarKeyConfiguration *)self->_configuration debugOptions];
      unsigned __int8 v114 = sub_10027EFC0(v33, @"HopConfigBitmask", (id)0x80);

      int v34 = [(NICarKeyConfiguration *)self->_configuration debugOptions];
      unsigned int v113 = sub_10027EFC0(v34, @"AnchorHopKey", 0);

      uint64_t v35 = [(NICarKeyConfiguration *)self->_configuration debugOptions];
      unsigned __int8 v112 = sub_10027EFC0(v35, @"RFChannel", (id)1);

      uint64_t v36 = [(NICarKeyConfiguration *)self->_configuration debugOptions];
      id v37 = sub_10027EFC0(v36, @"SyncCodeIndex", (id)9);

      uint64_t v38 = [(NICarKeyConfiguration *)self->_configuration debugOptions];
      unsigned __int8 v111 = sub_10027EFC0(v38, @"SessionRANMultiplier", (id)1);

      uint64_t v39 = [(NICarKeyConfiguration *)self->_configuration debugOptions];
      unsigned __int8 v110 = sub_10027EFC0(v39, @"ChapsPerSlot", (id)6);

      uint64_t v40 = [(NICarKeyConfiguration *)self->_configuration debugOptions];
      unsigned __int8 v109 = sub_10027EFC0(v40, @"SlotsPerRound", (id)0xC);

      uint64_t v41 = [(NICarKeyConfiguration *)self->_configuration debugOptions];
      unsigned __int8 v108 = sub_10027EFC0(v41, @"NumResponderNodes", (id)6);

      char v42 = (_BYTE)v37 - 9;
      if (((_BYTE)v37 - 9) >= 4u)
      {
        uint64_t v63 = +[NSString stringWithFormat:@"Invalid sync code index %d", v37];
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10042772C();
        }
        NSErrorUserInfoKey v148 = NSLocalizedDescriptionKey;
        v149 = v63;
        uint64_t v64 = +[NSDictionary dictionaryWithObjects:&v149 forKeys:&v148 count:1];
        uint64_t v18 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:v64];
      }
      else
      {
        v43 = [(NICarKeyConfiguration *)self->_configuration debugOptions];
        BOOL v107 = sub_10027EFC0(v43, @"DisableUWBEncryption", 0) != 0;

        int v44 = [(NICarKeyConfiguration *)self->_configuration debugOptions];
        BOOL v106 = sub_10027EFC0(v44, @"DisableSecureToF", 0) != 0;

        uint64_t v45 = [(NICarKeyConfiguration *)self->_configuration debugOptions];
        BOOL v46 = sub_10027EFC0(v45, @"ForceAntennaSelection", 0) != 0;

        if (v46)
        {
          uint64_t v47 = [(NICarKeyConfiguration *)self->_configuration debugOptions];
          unsigned __int8 v48 = sub_10027EFC0(v47, @"TxAntennaMask", 0);

          uint64_t v49 = [(NICarKeyConfiguration *)self->_configuration debugOptions];
          unsigned __int8 v50 = sub_10027EFC0(v49, @"RxAntennaMask", 0);

          uint64_t v51 = [(NICarKeyConfiguration *)self->_configuration debugOptions];
          unsigned __int8 v52 = sub_10027EFC0(v51, @"RxSyncSearchAntennaMask", 0);

          __int16 v53 = 1;
        }
        else
        {
          unsigned __int8 v52 = 0;
          __int16 v53 = 0;
          unsigned __int8 v50 = 0;
          unsigned __int8 v48 = 0;
        }
        v132[0] = 0x1000000;
        v132[1] = 305419896;
        char v133 = 1;
        unsigned int v134 = v113;
        char v135 = 1;
        BOOL v136 = v46;
        __int16 v137 = v48 | ((v53 & 1) << 8);
        __int16 v138 = v50 | ((v53 & 1) << 8);
        __int16 v139 = v52 | (unsigned __int16)(v53 << 8);
        BOOL v140 = v107;
        BOOL v141 = v106;
        int v142 = 5;
        int v120 = -2023406815;
        unsigned __int8 v121 = v112;
        char v122 = v42;
        unsigned __int16 v123 = v117;
        unsigned __int16 v124 = v116;
        unsigned __int8 v125 = v111;
        unsigned __int8 v126 = v110;
        unsigned __int8 v127 = v109;
        unsigned __int8 v128 = v108;
        unsigned __int8 v129 = v114;
        unsigned __int8 v130 = v115;
        int v131 = 0;
        +[NIServerCarKeySession _aopJobConfigWithTimeouts];
        *(void *)&double v75 = sub_100180238(&v120, 102, (uint64_t)v119, (unsigned __int8 *)v132, (uint64_t)buf).n128_u64[0];
        p_standaloneAlishaSession = &self->_standaloneAlishaSession;
        ptr = self->_standaloneAlishaSession.__ptr_;
        if (ptr)
        {
          sub_1002D8288((uint64_t)ptr);
          cntrl = (std::__shared_weak_count *)self->_standaloneAlishaSession.__cntrl_;
          p_standaloneAlishaSession->__ptr_ = 0;
          self->_standaloneAlishaSession.__cntrl_ = 0;
          if (cntrl) {
            sub_10001A970(cntrl);
          }
        }
        -[NIServerCarKeySession _buildAlishaSession:](self, "_buildAlishaSession:", buf, v75);
        shared_ptr<rose::objects::AlishaSession> v79 = (shared_ptr<rose::objects::AlishaSession>)v119[0];
        v119[0] = 0uLL;
        v80 = (std::__shared_weak_count *)self->_standaloneAlishaSession.__cntrl_;
        shared_ptr<rose::objects::AlishaSession> *p_standaloneAlishaSession = v79;
        if (v80)
        {
          sub_10001A970(v80);
          if (*((void *)&v119[0] + 1)) {
            sub_10001A970(*((std::__shared_weak_count **)&v119[0] + 1));
          }
          if (p_standaloneAlishaSession->__ptr_) {
            goto LABEL_46;
          }
        }
        else if (v79.__ptr_)
        {
LABEL_46:
          if (!self->_certLogger.__ptr_)
          {
            id v118 = [(NICarKeyConfiguration *)self->_configuration vehicleIdentifier];
            sub_100284008(&v118, v119);
            shared_ptr<NIServerCarKeyCertificationLogger> v81 = (shared_ptr<NIServerCarKeyCertificationLogger>)v119[0];
            v119[0] = 0uLL;
            BOOL v82 = (std::__shared_weak_count *)self->_certLogger.__cntrl_;
            self->_certLogger = v81;
            if (v82)
            {
              sub_10001A970(v82);
              if (*((void *)&v119[0] + 1)) {
                sub_10001A970(*((std::__shared_weak_count **)&v119[0] + 1));
              }
            }
          }
          uint64_t v18 = 0;
          goto LABEL_17;
        }
        uint64_t v83 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_1004276B4(v83, v84, v85, v86, v87, v88, v89, v90);
        }
        NSErrorUserInfoKey v144 = NSLocalizedDescriptionKey;
        CFStringRef v145 = @"Failed to create standalone session.";
        NSErrorUserInfoKey v91 = +[NSDictionary dictionaryWithObjects:&v145 forKeys:&v144 count:1];
        uint64_t v18 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v91];
      }
    }
    else
    {
      v94 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10042763C(v94, v95, v96, v97, v98, v99, v100, v101);
      }
      NSErrorUserInfoKey v150 = NSLocalizedDescriptionKey;
      CFStringRef v151 = @"Failed to enable test mode.";
      v102 = +[NSDictionary dictionaryWithObjects:&v151 forKeys:&v150 count:1];
      uint64_t v18 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v102];
    }
  }
  else
  {
    shared_ptr<NIServerCarKeyCertificationLogger> v19 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_1004278FC(v19, v20, v21, v22, v23, v24, v25, v26);
    }
    NSErrorUserInfoKey v158 = NSLocalizedDescriptionKey;
    CFStringRef v159 = @"Not authorized.";
    uint64_t v27 = +[NSDictionary dictionaryWithObjects:&v159 forKeys:&v158 count:1];
    uint64_t v18 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:v27];
  }
LABEL_17:

  return v18;
}

- (id)_runLabTestModeSession
{
  id v4 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-carkey,#lab-test _run", buf, 2u);
  }
  configuration = self->_configuration;
  if (!configuration)
  {
    uint64_t v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, self, @"NIServerCarKeySession.mm", 1197, @"Invalid parameter not satisfying: %@", @"_configuration" object file lineNumber description];

    configuration = self->_configuration;
  }
  if ((id)[(NICarKeyConfiguration *)configuration configurationType] != (id)3)
  {
    uint64_t v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"NIServerCarKeySession.mm", 1198, @"Invalid parameter not satisfying: %@", @"_configuration.configurationType == _NICarKeyConfigurationTypeLabTestMode" object file lineNumber description];
  }
  ptr = self->_standaloneAlishaSession.__ptr_;
  if (!ptr)
  {
    uint64_t v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, self, @"NIServerCarKeySession.mm", 1199, @"Invalid parameter not satisfying: %@", @"_standaloneAlishaSession" object file lineNumber description];

    ptr = self->_standaloneAlishaSession.__ptr_;
  }
  sub_1002DCEA8((uint64_t)ptr, llround(3000000.0), (uint64_t)buf);
  if (*(_DWORD *)buf)
  {
    sub_100333FC8(*(int *)buf, __p);
    if (v16 >= 0) {
      BOOL v7 = __p;
    }
    else {
      BOOL v7 = (void **)__p[0];
    }
    unint64_t v8 = +[NSString stringWithFormat:@"Failed to run standalone session. Error: %s", v7];
    if (v16 < 0) {
      operator delete(__p[0]);
    }
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10042772C();
    }
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    shared_ptr<NIServerCarKeyCertificationLogger> v19 = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    uint64_t v10 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_runOwnerSession
{
  int v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-carkey,run owner session", buf, 2u);
  }
  ptr = self->_alishaManager.__ptr_;
  if (!ptr) {
    sub_100427974();
  }
  int v5 = sub_100339B24((uint64_t)ptr);
  if (v5)
  {
    sub_100333FC8(v5, buf);
    if (v12 >= 0) {
      id v6 = buf;
    }
    else {
      id v6 = *(uint8_t **)buf;
    }
    BOOL v7 = +[NSString stringWithFormat:@"Failed to run NI CarKey owner session. Error: %s", v6];
    if (v12 < 0) {
      operator delete(*(void **)buf);
    }
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_1004279A0();
    }
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    uint64_t v14 = v7;
    unint64_t v8 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v9 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_runPassthroughSession
{
  [@"com.apple.nearbyd" UTF8String];
  if ((os_variant_allows_internal_security_policies() & 1) == 0)
  {
    BOOL v7 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
    goto LABEL_16;
  }
  int v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-carkey,_runPassthroughSession", buf, 2u);
  }
  if (!self->_standaloneAlishaSession.__ptr_) {
    sub_100427A08();
  }
  if (!self->_passthroughParams.passthroughUwbSessionId.__engaged_) {
    sub_100427A34();
  }
  sub_1002DBCC0(self->_passthroughParams.passthroughUwbSessionId.var0.__val_, (uint64_t)v32);
  if (v32[0])
  {
    sub_100333FC8(v32[0], buf);
    if (v38 >= 0) {
      id v4 = buf;
    }
    else {
      id v4 = *(unsigned char **)buf;
    }
    int v5 = +[NSString stringWithFormat:@"Failed to get key for passthrough session. Error: %s", v4];
    if (SHIBYTE(v38) < 0) {
      operator delete(*(void **)buf);
    }
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100426F40();
    }
    NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
    v43 = v5;
    id v6 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    BOOL v7 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v6];

    goto LABEL_16;
  }
  id v9 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ses-carkey,GetKey operation succeeded. Proceeding.", buf, 2u);
  }
  if (self->_passthroughParams.bypassBluetoothTimesync)
  {
    uint64_t v10 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-carkey,DCK time sync bypass", buf, 2u);
    }
    sub_1002DCEA8((uint64_t)self->_standaloneAlishaSession.__ptr_, llround(dbl_1004BCA40[!self->_passthroughParams.anchorSimulation]), (uint64_t)buf);
    int v11 = *(_DWORD *)buf;
    if (*(_DWORD *)buf)
    {
LABEL_25:
      sub_100333FC8(v11, buf);
      if (v38 >= 0) {
        char v12 = buf;
      }
      else {
        char v12 = *(unsigned char **)buf;
      }
      NSErrorUserInfoKey v13 = +[NSString stringWithFormat:@"Failed to start Alisha standalone ranging session. Error: %s", v12];
      if (SHIBYTE(v38) < 0) {
        operator delete(*(void **)buf);
      }
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100427B5C();
      }
      NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
      int v34 = v13;
      uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      BOOL v7 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v14];

      goto LABEL_16;
    }
    goto LABEL_49;
  }
  if (!self->_passthroughParams.dckTimeSyncBtEvent.__engaged_) {
    sub_100427A60();
  }
  if (!self->_passthroughParams.dckTimeSyncUwbDeviceTimeUsec.__engaged_) {
    sub_100427A8C();
  }
  if (!self->_passthroughParams.passthroughUwbTime0.__engaged_) {
    sub_100427AB8();
  }
  unint64_t v15 = sub_10027FBF4((uint64_t)&self->_passthroughParams.dckTimeSyncBtEvent, self->_passthroughParams.passthroughUwbTime0.__engaged_);
  if (!self->_passthroughParams.dckTimeSyncUwbDeviceTimeUsec.__engaged_) {
    sub_10000AE44();
  }
  if (!self->_passthroughParams.passthroughUwbTime0.__engaged_) {
    sub_10000AE44();
  }
  unint64_t val = self->_passthroughParams.dckTimeSyncUwbDeviceTimeUsec.var0.__val_;
  unint64_t v17 = self->_passthroughParams.passthroughUwbTime0.var0.__val_;
  if (v17 >= val)
  {
    unint64_t v27 = v15;
    long long v28 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = v27;
      __int16 v36 = 2048;
      unint64_t v37 = val;
      __int16 v38 = 2048;
      unint64_t v39 = v17;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#ses-carkey,DCK time sync BT event = %lluus, DCK time sync UWB device time = %lluus, UWB Time 0 = %lluus", buf, 0x20u);
    }
    uint64_t v29 = v17 - val + v27;
    if (self->_passthroughParams.anchorSimulation)
    {
      NSErrorUserInfoKey v30 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = 20000;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#ses-carkey,Anchor simulation start time leeway of %lluus", buf, 0xCu);
      }
      v29 -= 20000;
    }
    int v11 = sub_1002DDB40((uint64_t)self->_standaloneAlishaSession.__ptr_, v29);
    if (v11) {
      goto LABEL_25;
    }
LABEL_49:
    shared_ptr<rose::objects::AlishaSession> v31 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "#ses-carkey,Range enable succeeded.", buf, 2u);
    }
    BOOL v7 = 0;
    goto LABEL_16;
  }
  NSErrorUserInfoKey v18 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_100427AE4(v18, v19, v20, v21, v22, v23, v24, v25);
  }
  NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
  CFStringRef v41 = @"UWB Time 0 must be greater than UWB Device Time from the DCK time sync event.";
  uint64_t v26 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
  BOOL v7 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v26];

LABEL_16:

  return v7;
}

- (id)_pausePassthroughOrLabTestModeSession
{
  int v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-carkey,_pausePassthroughOrLabTestModeSession", buf, 2u);
  }
  ptr = self->_standaloneAlishaSession.__ptr_;
  if (!ptr) {
    sub_100427C1C();
  }
  sub_1002DD6A0((uint64_t)ptr, (uint64_t)buf);
  if (*(_DWORD *)buf)
  {
    sub_100333FC8(*(int *)buf, __p);
    if (v11 >= 0) {
      int v5 = __p;
    }
    else {
      int v5 = (void **)__p[0];
    }
    id v6 = +[NSString stringWithFormat:@"Failed to stop Alisha standalone ranging session. Error: %s", v5];
    if (v11 < 0) {
      operator delete(__p[0]);
    }
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100426F40();
    }
    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    unint64_t v17 = v6;
    BOOL v7 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    unint64_t v8 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v7];
  }
  else
  {
    unint64_t v8 = 0;
  }
  if (v15 && v13)
  {
    uint64_t v14 = v13;
    operator delete(v13);
  }

  return v8;
}

- (id)_pauseOwnerSession
{
  int v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-carkey,pause owner session", buf, 2u);
  }
  ptr = self->_alishaManager.__ptr_;
  if (ptr)
  {
    sub_100339F5C((uint64_t)ptr, buf);
    if (*(_DWORD *)buf)
    {
      sub_100333FC8(*(int *)buf, __p);
      if (v12 >= 0) {
        int v5 = __p;
      }
      else {
        int v5 = (void **)__p[0];
      }
      id v6 = +[NSString stringWithFormat:@"Failed to stop ranging when pausing NI CarKey owner session. Error: %s", v5];
      if (v12 < 0) {
        operator delete(__p[0]);
      }
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_1004279A0();
      }
      NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
      unint64_t v17 = v6;
      BOOL v7 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      unint64_t v8 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v7];
    }
    else
    {
      if (v15) {
        [(NIServerCarKeySession *)self _relayDCKMessageInternal:v14];
      }
      unint64_t v8 = 0;
    }
    if (v15 && v14[0])
    {
      v14[1] = v14[0];
      operator delete(v14[0]);
    }
  }
  else
  {
    id v9 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ses-carkey,Pause but no Alisha manager. Returning.", buf, 2u);
    }
    unint64_t v8 = 0;
  }

  return v8;
}

+ (JobConfig)_aopJobConfigWithTimeouts
{
  *(void *)&retstr->peerDiscoveryTimeoutSeconds = -1;
  retstr->timeoutRefirePeriodSeconds = -1;
  retstr->maxTimeoutRefires = 0;
  *(void *)(&retstr->maxTimeoutRefires + 1) = 0xFFFFFFFFLL;
  *(_WORD *)((char *)&retstr->subratingConfigs[0].var0.var0 + 3) = 0;
  retstr->optionsBitmap = 1;
  unsigned __int16 v4 = (unsigned __int16)sub_1002801C8(@"AlishaTimeoutAOverrideSeconds", (id)0x3C);
  unsigned __int16 v5 = (unsigned __int16)sub_1002801C8(@"AlishaTimeoutBOverrideSeconds", (id)0x96);
  unsigned __int16 v6 = (unsigned __int16)sub_1002801C8(@"AlishaTimeoutRefirePeriodOverrideSeconds", (id)0x96);
  shared_ptr<rose::objects::AlishaSession> result = (JobConfig *)sub_1002801C8(@"AlishaMaxTimeoutRefiresOverride", (id)2);
  retstr->peerDiscoveryTimeoutSeconds = v4;
  retstr->peerReacquisitionTimeoutSeconds = v4;
  retstr->trackingTimeoutSeconds = -1;
  retstr->jobTimeoutSeconds = v5;
  retstr->timeoutRefirePeriodSeconds = v6;
  retstr->maxTimeoutRefires = result;
  *(_WORD *)(&retstr->maxTimeoutRefires + 1) = -1;
  return result;
}

- (RequestConstructionDebugParams)_ownerDeviceServiceRequestDebugParams:(SEL)a3
{
  id v6 = a4;
  BOOL v7 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-carkey,Debug params for owner device service request. Debug options: %@", (uint8_t *)&v22, 0xCu);
  }
  if (self->_passthroughParams.isPassthroughSession)
  {
    uint64_t v20 = "!_passthroughParams.isPassthroughSession";
    int v21 = 1392;
    goto LABEL_12;
  }
  if (self->_passthroughParams.anchorSimulation)
  {
    uint64_t v20 = "!_passthroughParams.anchorSimulation";
    int v21 = 1393;
LABEL_12:
    __assert_rtn("-[NIServerCarKeySession _ownerDeviceServiceRequestDebugParams:]", "NIServerCarKeySession.mm", v21, v20);
  }
  retstr->var3.__engaged_ = 0;
  retstr->var4.var0.__null_state_ = 0;
  retstr->var4.__engaged_ = 0;
  retstr->var11 = 0;
  *(void *)&retstr->var5 = 0;
  retstr->var10 = 0;
  *(_DWORD *)&retstr->var0 = 0;
  retstr->var3.var0.__null_state_ = 0;
  unint64_t v8 = [v6 objectForKeyedSubscript:@"DebugSTSIndex0"];
  if (!v8
    || ([v6 objectForKeyedSubscript:@"AnchorHopKey"],
        id v9 = objc_claimAutoreleasedReturnValue(),
        BOOL v10 = v9 == 0,
        v9,
        v8,
        v10))
  {
    retstr->var2 = 0;
  }
  else
  {
    char v11 = [v6 objectForKeyedSubscript:@"DebugSTSIndex0"];
    unsigned int v12 = [v11 unsignedIntegerValue];

    NSErrorUserInfoKey v13 = [v6 objectForKeyedSubscript:@"AnchorHopKey"];
    unsigned int v14 = [v13 unsignedIntegerValue];

    retstr->var2 = 1;
    retstr->var3.__engaged_ = 1;
    retstr->var3.var0.__val_ = v12;
    retstr->var4.__engaged_ = 1;
    retstr->var4.var0.__val_ = v14;
  }
  char v15 = [v6 objectForKeyedSubscript:@"DisableUWBEncryption"];
  unsigned __int8 v16 = [v15 BOOLValue];

  unint64_t v17 = [v6 objectForKeyedSubscript:@"DisableSecureToF"];
  unsigned __int8 v18 = [v17 BOOLValue];

  retstr->var9 = v16;
  retstr->var10 = v18;
  retstr->var11 = 5;

  return result;
}

- (void)_relayDCKMessageInternal:(const void *)a3
{
  unsigned __int16 v4 = +[NSData dataWithBytes:*(void *)a3 length:*((void *)a3 + 1) - *(void *)a3];
  unsigned __int16 v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    BOOL v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-carkey,Relaying DCK message: %@", buf, 0xCu);
  }
  v8.receiver = self;
  v8.super_class = (Class)NIServerCarKeySession;
  id v6 = [(NIServerBaseSession *)&v8 resourcesManager];
  BOOL v7 = [v6 remote];
  [v7 relayDCKMessage:v4];
}

- (Result<rose::RoseServiceRequest>)_passthroughSessionServiceRequest:(SEL)a3
{
  id v6 = a4;
  [@"com.apple.nearbyd" UTF8String];
  if (os_variant_allows_internal_security_policies())
  {
    BOOL v7 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      BOOL anchorSimulation = self->_passthroughParams.anchorSimulation;
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = anchorSimulation;
      *(_WORD *)&uint8_t buf[8] = 2112;
      *(void *)&buf[10] = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-carkey,Passthrough session service request. Anchor: %d. Debug options: %@", buf, 0x12u);
    }
    p_passthroughParams = &self->_passthroughParams;
    if (!self->_passthroughParams.isPassthroughSession) {
      __assert_rtn("-[NIServerCarKeySession _passthroughSessionServiceRequest:]", "NIServerCarKeySession.mm", 1438, "_passthroughParams.isPassthroughSession");
    }
    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    id v9 = [&off_100878568 countByEnumeratingWithState:&v123 objects:v130 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v124;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v124 != v10) {
            objc_enumerationMutation(&off_100878568);
          }
          uint64_t v12 = *(void *)(*((void *)&v123 + 1) + 8 * i);
          NSErrorUserInfoKey v13 = [v6 objectForKey:v12];
          if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            int v44 = +[NSString stringWithFormat:@"Missing mandatory passthrough session key or not an NSNumber: {%@: %@}", v12, v13];
            if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
              sub_100426F40();
            }
            retstr->var0 = -1014;
            retstr->var1.var0.__null_state_ = 0;
            retstr->var1.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;

            goto LABEL_34;
          }
        }
        id v9 = [&off_100878568 countByEnumeratingWithState:&v123 objects:v130 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    if (p_passthroughParams->anchorSimulation)
    {
      long long v121 = 0u;
      long long v122 = 0u;
      long long v119 = 0u;
      long long v120 = 0u;
      id v14 = [&off_100878580 countByEnumeratingWithState:&v119 objects:v129 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v120;
        while (2)
        {
          for (j = 0; j != v14; j = (char *)j + 1)
          {
            if (*(void *)v120 != v15) {
              objc_enumerationMutation(&off_100878580);
            }
            uint64_t v17 = *(void *)(*((void *)&v119 + 1) + 8 * (void)j);
            unsigned __int8 v18 = [v6 objectForKey:v17];
            if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              BOOL v46 = +[NSString stringWithFormat:@"Missing mandatory anchor simulation key or not an NSNumber: {%@: %@}", v17, v18];
              if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
                sub_100426F40();
              }
              retstr->var0 = -1015;
              retstr->var1.var0.__null_state_ = 0;
              retstr->var1.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;

              goto LABEL_34;
            }
          }
          id v14 = [&off_100878580 countByEnumeratingWithState:&v119 objects:v129 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
    }
    uint64_t v19 = [v6 objectForKeyedSubscript:@"UWBSessionId"];
    unsigned int v86 = [v19 unsignedIntegerValue];

    p_passthroughParams->passthroughUwbSessionId.var0.__val_ = v86;
    p_passthroughParams->passthroughUwbSessionId.__engaged_ = 1;
    uint64_t v20 = [v6 objectForKeyedSubscript:@"RFChannel"];
    unsigned __int8 v85 = [v20 unsignedIntegerValue];

    int v21 = [v6 objectForKeyedSubscript:@"SyncCodeIndex"];
    id v22 = [v21 unsignedIntegerValue];

    id v23 = [v6 objectForKeyedSubscript:@"AlishaProtocolVersion"];
    unsigned __int16 v84 = (unsigned __int16)[v23 unsignedIntegerValue];

    uint64_t v24 = [v6 objectForKeyedSubscript:@"UWBConfigId"];
    unsigned __int16 v83 = (unsigned __int16)[v24 unsignedIntegerValue];

    uint64_t v25 = [v6 objectForKeyedSubscript:@"SessionRANMultiplier"];
    unsigned __int8 v82 = [v25 unsignedIntegerValue];

    uint64_t v26 = [v6 objectForKeyedSubscript:@"ChapsPerSlot"];
    unsigned __int8 v81 = [v26 unsignedIntegerValue];

    unint64_t v27 = [v6 objectForKeyedSubscript:@"SlotsPerRound"];
    unsigned __int8 v80 = [v27 unsignedIntegerValue];

    long long v28 = [v6 objectForKeyedSubscript:@"NumResponderNodes"];
    unsigned __int8 v79 = [v28 unsignedIntegerValue];

    uint64_t v29 = [v6 objectForKeyedSubscript:@"HopConfigBitmask"];
    unsigned __int8 v78 = [v29 unsignedIntegerValue];

    NSErrorUserInfoKey v30 = [v6 objectForKeyedSubscript:@"PulseShapeCombo"];
    unsigned __int8 v77 = [v30 unsignedIntegerValue];

    if (((_BYTE)v22 - 9) >= 4u)
    {
      uint64_t v47 = +[NSString stringWithFormat:@"Invalid Sync Code Index: %lu", v22];
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100426F40();
      }
      retstr->var0 = -1016;
      retstr->var1.var0.__null_state_ = 0;
      retstr->var1.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
    }
    else
    {
      char v69 = (_BYTE)v22 - 9;
      shared_ptr<rose::objects::AlishaSession> v31 = [v6 objectForKeyedSubscript:@"ACWGMacMode"];

      shared_ptr<rose::alisha::dck::Coder> v32 = [v6 objectForKeyedSubscript:@"ACWGMacMode"];
      unsigned int v33 = [v32 unsignedIntValue];

      int v34 = [v6 objectForKeyedSubscript:@"ACWGMacMode"];
      unsigned __int8 v68 = [v34 unsignedIntValue];

      uint64_t v35 = [v6 objectForKeyedSubscript:@"ACWGFinalData2Bitmask"];
      unsigned __int8 v36 = [v35 unsignedIntValue];
      BOOL v67 = (v33 & 0xFFFFFFC0) == 64;
      BOOL v76 = v31 != 0;

      if (v31) {
        int v37 = ((v36 & 3) << 16) | 0x1000000;
      }
      else {
        int v37 = 0;
      }
      __int16 v38 = [v6 objectForKeyedSubscript:@"DebugSTSIndex0"];
      int v66 = v37;
      unsigned int v75 = [v38 unsignedIntegerValue];

      unint64_t v39 = [v6 objectForKeyedSubscript:@"AnchorHopKey"];
      unsigned int v74 = [v39 unsignedIntegerValue];

      NSErrorUserInfoKey v40 = [v6 objectForKeyedSubscript:@"DisableUWBEncryption"];
      unsigned __int8 v73 = [v40 BOOLValue];

      CFStringRef v41 = [v6 objectForKeyedSubscript:@"DisableSecureToF"];
      unsigned __int8 v72 = [v41 BOOLValue];

      if (p_passthroughParams->anchorSimulation)
      {
        NSErrorUserInfoKey v42 = [v6 objectForKeyedSubscript:@"AnchorResponderIndex"];
        unsigned __int8 v71 = [v42 unsignedIntegerValue];

        __int16 v43 = 1;
      }
      else
      {
        unsigned __int8 v71 = 0;
        __int16 v43 = 0;
      }
      unsigned __int8 v48 = [v6 objectForKeyedSubscript:@"ForceAntennaSelection"];
      __int16 v70 = v43;
      unsigned int v49 = [v48 BOOLValue];

      if (v49)
      {
        long long v118 = 0u;
        long long v116 = 0u;
        long long v117 = 0u;
        long long v115 = 0u;
        id v50 = [&off_100878598 countByEnumeratingWithState:&v115 objects:v128 count:16];
        if (v50)
        {
          uint64_t v51 = *(void *)v116;
          while (2)
          {
            for (k = 0; k != v50; k = (char *)k + 1)
            {
              if (*(void *)v116 != v51) {
                objc_enumerationMutation(&off_100878598);
              }
              uint64_t v53 = *(void *)(*((void *)&v115 + 1) + 8 * (void)k);
              uint64_t v54 = [v6 objectForKey:v53];
              if (!v54 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                uint64_t v65 = +[NSString stringWithFormat:@"Missing mandatory antenna mask key or not an NSNumber: {%@: %@}", v53, v54];
                if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
                  sub_100426F40();
                }
                retstr->var0 = -1015;
                retstr->var1.var0.__null_state_ = 0;
                retstr->var1.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;

                goto LABEL_34;
              }
            }
            id v50 = [&off_100878598 countByEnumeratingWithState:&v115 objects:v128 count:16];
            if (v50) {
              continue;
            }
            break;
          }
        }
        uint64_t v55 = [v6 objectForKeyedSubscript:@"TxAntennaMask"];
        unsigned __int8 v56 = [v55 unsignedIntValue];

        uint64_t v57 = [v6 objectForKeyedSubscript:@"RxAntennaMask"];
        unsigned __int8 v58 = [v57 unsignedIntValue];

        uint64_t v59 = [v6 objectForKeyedSubscript:@"RxSyncSearchAntennaMask"];
        unsigned __int8 v60 = [v59 unsignedIntValue];

        __int16 v61 = 1;
      }
      else
      {
        __int16 v61 = 0;
        unsigned __int8 v56 = 0;
        unsigned __int8 v58 = 0;
        unsigned __int8 v60 = 0;
      }
      BOOL v101 = p_passthroughParams->anchorSimulation;
      __int16 v102 = v71 | (unsigned __int16)(v70 << 8);
      char v103 = 1;
      unsigned int v104 = v75;
      char v105 = 1;
      unsigned int v106 = v74;
      char v107 = 1;
      char v108 = v49;
      __int16 v109 = v56 | ((v61 & 1) << 8);
      __int16 v110 = v58 | ((v61 & 1) << 8);
      __int16 v111 = v60 | (unsigned __int16)(v61 << 8);
      unsigned __int8 v112 = v73;
      unsigned __int8 v113 = v72;
      int v114 = 5;
      if (!p_passthroughParams->bypassBluetoothTimesync)
      {
        __int16 v62 = [v6 objectForKeyedSubscript:@"UWBTime0"];
        if (!v62) {
          __assert_rtn("-[NIServerCarKeySession _passthroughSessionServiceRequest:]", "NIServerCarKeySession.mm", 1574, "debugOptions[@\"UWBTime0\"] != nil");
        }

        uint64_t v63 = [v6 objectForKeyedSubscript:@"UWBTime0"];
        id v64 = [v63 unsignedLongLongValue];

        p_passthroughParams->passthroughUwbTime0.var0.__val_ = (unint64_t)v64;
        p_passthroughParams->passthroughUwbTime0.__engaged_ = 1;
      }
      unsigned int v89 = v86;
      unsigned __int8 v90 = v85;
      char v91 = v69;
      unsigned __int16 v92 = v84;
      unsigned __int16 v93 = v83;
      unsigned __int8 v94 = v82;
      unsigned __int8 v95 = v81;
      unsigned __int8 v96 = v80;
      unsigned __int8 v97 = v79;
      unsigned __int8 v98 = v78;
      unsigned __int8 v99 = v77;
      unsigned int v100 = (v76 && v67) & 0xFFFFC0FF | ((v68 & 0x3F) << 8) | v66;
      +[NIServerCarKeySession _aopJobConfigWithTimeouts];
      sub_100180238((int *)&v89, 102, (uint64_t)v88, (unsigned __int8 *)&v101, (uint64_t)buf);
      memcpy(&retstr->var1, buf, 0x1F8uLL);
      retstr->var0 = 0;
      retstr->var1.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 1;
    }
  }
  else
  {
    retstr->var0 = -1000;
    retstr->var1.var0.__null_state_ = 0;
    retstr->var1.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
  }
LABEL_34:

  return result;
}

- (void)_alishaStateChangedFromState:(unsigned __int8)a3 toNewState:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  unsigned int v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  BOOL v7 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    sub_100334B30(v5, v20);
    int v8 = v21;
    id v9 = (void **)v20[0];
    sub_100334B30(v4, __p);
    uint64_t v10 = v20;
    if (v8 < 0) {
      uint64_t v10 = v9;
    }
    if (v19 >= 0) {
      char v11 = __p;
    }
    else {
      char v11 = (void **)__p[0];
    }
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    *(_DWORD *)buf = 136315650;
    id v23 = v10;
    __int16 v24 = 2080;
    uint64_t v25 = v11;
    __int16 v26 = 2112;
    unint64_t v27 = containerUniqueIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-carkey,State changed from %s to %s, session container ID: %@", buf, 0x20u);
    if (v19 < 0) {
      operator delete(__p[0]);
    }
    if (v21 < 0) {
      operator delete(v20[0]);
    }
  }

  ptr = self->_timeoutManager.__ptr_;
  if (ptr) {
    sub_1001FEEA4((uint64_t)ptr, v5, v4);
  }
  int v14 = sub_100337114(v5);
  if (((v14 ^ 1 | sub_100337114(v4)) & 1) == 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)NIServerCarKeySession;
    uint64_t v15 = [(NIServerBaseSession *)&v17 resourcesManager];
    unsigned __int8 v16 = [v15 remote];
    [v16 didUpdateHealthStatus:4];
  }
}

- (void)_handleInitiatorRangingBlockUpdate:(InitiatorRangingBlockSummary *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  ptr = self->_certLogger.__ptr_;
  if (ptr)
  {
    sub_100277EC0((uint64_t)ptr, &a3->var0);
  }
}

- (void)_handleSessionStats:(SessionStats *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (a3->var1)
  {
    ptr = self->_analyticsManager.__ptr_;
    if (ptr)
    {
      sub_1001C2088((uint64_t)ptr, (uint64_t)a3);
    }
  }
}

- (void)_handleHealthChanged:(int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  unsigned int v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sub_100004950(__p, (&off_10085CC78)[a3]);
    if (v13 >= 0) {
      id v6 = __p;
    }
    else {
      id v6 = (void **)__p[0];
    }
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    objc_super v17 = containerUniqueIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-carkey,Health changed to %s, session container ID: %@", buf, 0x16u);
    if (v13 < 0) {
      operator delete(__p[0]);
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)NIServerCarKeySession;
  int v8 = [(NIServerBaseSession *)&v11 resourcesManager];
  id v9 = v8;
  switch(a3)
  {
    case 2:
      uint64_t v10 = [v8 remote];
      [v10 didUpdateHealthStatus:3];
      goto LABEL_13;
    case 1:
      uint64_t v10 = [v8 remote];
      [v10 didUpdateHealthStatus:2];
      goto LABEL_13;
    case 0:
      uint64_t v10 = [v8 remote];
      [v10 didUpdateHealthStatus:1];
LABEL_13:

      break;
  }
}

- (void)_handleTimeoutEvent:(int)a3 time:(double)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  BOOL v7 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    sub_100004950(__p, (&off_10085CC90)[a3]);
    int v8 = v20 >= 0 ? __p : (void **)__p[0];
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    *(_DWORD *)buf = 136315650;
    *(void *)__int16 v24 = v8;
    *(_WORD *)&v24[8] = 2048;
    *(double *)&v24[10] = a4;
    *(_WORD *)&v24[18] = 2112;
    uint64_t v25 = containerUniqueIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-carkey,Received timeout event %s at %f sec, session container ID: %@", buf, 0x20u);
    if (v20 < 0) {
      operator delete(__p[0]);
    }
  }

  ptr = self->_alishaManager.__ptr_;
  if (ptr)
  {
    sub_10033A95C((uint64_t)ptr, a3, buf);
    int v11 = *(_DWORD *)buf;
    if (*(_DWORD *)buf)
    {
      NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
      CFStringRef v22 = @"processing timeout events failed";
      uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      if ((v11 + 1016) < 3) {
        uint64_t v13 = -5888;
      }
      else {
        uint64_t v13 = -5887;
      }
      int v14 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:v13 userInfo:v12];

      v18.receiver = self;
      v18.super_class = (Class)NIServerCarKeySession;
      uint64_t v15 = [(NIServerBaseSession *)&v18 resourcesManager];
      __int16 v16 = [v15 remote];
      [v16 uwbSessionDidInvalidateWithError:v14];
    }
    else if (v26)
    {
      [(NIServerCarKeySession *)self _relayDCKMessageInternal:&v24[4]];
    }
    if (v26)
    {
      if (*(void *)&v24[4])
      {
        *(void *)&v24[12] = *(void *)&v24[4];
        operator delete(*(void **)&v24[4]);
      }
    }
  }
  else
  {
    objc_super v17 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#ses-carkey,No Alisha manager. Ignoring timeout event", buf, 2u);
    }
  }
}

- (NICarKeyConfiguration)configuration
{
  return (NICarKeyConfiguration *)objc_getProperty(self, a2, 424, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  cntrl = (std::__shared_weak_count *)self->_powerBudgetProvider.__cntrl_;
  if (cntrl) {
    sub_10001A970(cntrl);
  }
  unsigned int v4 = (std::__shared_weak_count *)self->_timeoutManager.__cntrl_;
  if (v4) {
    sub_10001A970(v4);
  }
  unsigned int v5 = (std::__shared_weak_count *)self->_standaloneAlishaSession.__cntrl_;
  if (v5) {
    sub_10001A970(v5);
  }
  sub_1001D0BEC((uint64_t)&self->_cachedCapabilities);
  id v6 = (std::__shared_weak_count *)self->_certLogger.__cntrl_;
  if (v6) {
    sub_10001A970(v6);
  }
  BOOL v7 = (std::__shared_weak_count *)self->_analyticsManager.__cntrl_;
  if (v7) {
    sub_10001A970(v7);
  }
  int v8 = (std::__shared_weak_count *)self->_paramNegotiator.__cntrl_;
  if (v8) {
    sub_10001A970(v8);
  }
  id v9 = (std::__shared_weak_count *)self->_configProvider.__cntrl_;
  if (v9) {
    sub_10001A970(v9);
  }
  uint64_t v10 = (std::__shared_weak_count *)self->_dckCoder.__cntrl_;
  if (v10) {
    sub_10001A970(v10);
  }
  int v11 = (std::__shared_weak_count *)self->_alishaSystem.__cntrl_;
  if (v11) {
    sub_10001A970(v11);
  }
  uint64_t v12 = (std::__shared_weak_count *)self->_alishaManager.__cntrl_;
  if (v12) {
    sub_10001A970(v12);
  }
  objc_storeStrong((id *)&self->_containerUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  uint64_t v13 = (std::__shared_weak_count *)self->_pbLogger.__cntrl_;
  if (v13)
  {
    sub_10001A970(v13);
  }
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 19) = 0;
  *((void *)self + 20) = 0;
  *((void *)self + 21) = 0;
  *((void *)self + 22) = 0;
  *((void *)self + 23) = 0;
  *((unsigned char *)self + 192) = 0;
  *((unsigned char *)self + 256) = 0;
  *((void *)self + 33) = 0;
  *((void *)self + 34) = 0;
  *((_WORD *)self + 140) = 0;
  *((unsigned char *)self + 282) = 0;
  *((unsigned char *)self + 288) = 0;
  *((unsigned char *)self + 344) = 0;
  *((unsigned char *)self + 352) = 0;
  *((unsigned char *)self + 360) = 0;
  *((unsigned char *)self + 368) = 0;
  *((unsigned char *)self + 372) = 0;
  *((unsigned char *)self + 376) = 0;
  *((unsigned char *)self + 384) = 0;
  *((void *)self + 49) = 0;
  *((void *)self + 50) = 0;
  *((void *)self + 51) = 0;
  *((void *)self + 52) = 0;
  return self;
}

@end