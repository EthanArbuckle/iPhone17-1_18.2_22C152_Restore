@interface NIServerBaseSession
- (BOOL)adoptVoucher;
- (BOOL)isInteresetedInSample:(id)a3;
- (BOOL)isInterestedInSamplesForDevice:(id)a3;
- (BOOL)releaseVoucher;
- (BOOL)supportsBackgroundedClients;
- (BOOL)supportsCameraAssistance;
- (BOOL)supportsDevicePresence;
- (BOOL)supportsSessionObservers;
- (BOOL)updateConfiguration:(id)a3;
- (NIServerBaseSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5;
- (NIServerDataResponse)processDCKMessage:(id)a3;
- (NIServerNumberResponse)isRangingLimitExceeded;
- (NIServerSessionResourceManager)resourcesManager;
- (basic_string<char,)uniqueIdentifierForEngine:(std::allocator<char>> *__return_ptr)retstr;
- (duration<long)nominalCycleRate;
- (id)_processCarKeyEvent:(id)a3;
- (id)_processFindingEvent:(id)a3;
- (id)_processSystemEvent:(id)a3;
- (id)_setDebugURSK:(id)a3 transactionIdentifier:(unsigned int)a4;
- (id)addObject:(id)a3;
- (id)backgroundSupportUpdateHandler;
- (id)configure;
- (id)deleteURSKs;
- (id)disableAllServices;
- (id)discoveryTokenFromIdentifier:(unint64_t)a3;
- (id)getQueueForInputingData;
- (id)invalidationHandler;
- (id)lastConfiguration;
- (id)objectFromIdentifier:(unint64_t)a3;
- (id)pauseWithSource:(int64_t)a3;
- (id)printableState;
- (id)processBluetoothHostTimeSyncWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4 eventCounter:(unint64_t)a5 monotonicTimeSec:(double)a6 response:(id *)a7;
- (id)removeObject:(id)a3;
- (id)run;
- (optional<unsigned)identifierFromDiscoveryToken:(id)a3;
- (unint64_t)requiresNarrowbandToRun;
- (unint64_t)requiresSpatialInteractionBluetoothResource;
- (unint64_t)requiresUWBToRun;
- (void)invalidate;
- (void)peerInactivityPeriodExceeded:(id)a3;
- (void)prefetchAcwgUrsk:(unsigned int)a3;
- (void)processAcwgM1Msg:(id)a3 withSessionTriggerReason:(int64_t)a4;
- (void)processAcwgM3Msg:(id)a3;
- (void)processAcwgRangingSessionResumeRequestMsg:(unsigned int)a3 withResumeTriggerReason:(int64_t)a4;
- (void)processUpdatedLockState:(unsigned __int16)a3;
- (void)serviceRequestDidUpdateStatus:(ServiceRequestStatusUpdate)a3;
- (void)setBackgroundSupportUpdateHandler:(id)a3;
- (void)setClientVoucher:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)suspendAcwgRanging:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4;
@end

@implementation NIServerBaseSession

- (NIServerBaseSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2, self, @"NIServerBaseSession.mm", 47, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];

    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v15 = +[NSAssertionHandler currentHandler];
  [v15 handleFailureInMethod:a2, self, @"NIServerBaseSession.mm", 46, @"Invalid parameter not satisfying: %@", @"resourcesManager" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (a5) {
    goto LABEL_4;
  }
LABEL_9:
  v17 = +[NSAssertionHandler currentHandler];
  [v17 handleFailureInMethod:a2, self, @"NIServerBaseSession.mm", 49, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];

LABEL_4:
  v18.receiver = self;
  v18.super_class = (Class)NIServerBaseSession;
  v12 = [(NIServerBaseSession *)&v18 init];
  v13 = v12;
  if (v12)
  {
    v12->_isVoucherSet = 0;
    objc_storeWeak((id *)&v12->_resourcesManager, v9);
  }

  return v13;
}

- (duration<long)nominalCycleRate
{
  v2 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v4) = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "#ses-base,Must be implemented in the subclass", (uint8_t *)&v4, 2u);
  }
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315650;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerBaseSession.mm";
    __int16 v6 = 1024;
    int v7 = 60;
    __int16 v8 = 2080;
    id v9 = "-[NIServerBaseSession nominalCycleRate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "#ses-base,%s:%d: assertion failure in %s", (uint8_t *)&v4, 0x1Cu);
  }
  abort();
}

- (id)lastConfiguration
{
  v2 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v4) = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "#ses-base,Must be implemented in the subclass", (uint8_t *)&v4, 2u);
  }
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315650;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerBaseSession.mm";
    __int16 v6 = 1024;
    int v7 = 65;
    __int16 v8 = 2080;
    id v9 = "-[NIServerBaseSession lastConfiguration]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "#ses-base,%s:%d: assertion failure in %s", (uint8_t *)&v4, 0x1Cu);
  }
  abort();
}

- (id)configure
{
  v2 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v4) = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "#ses-base,Must be implemented in the subclass", (uint8_t *)&v4, 2u);
  }
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315650;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerBaseSession.mm";
    __int16 v6 = 1024;
    int v7 = 70;
    __int16 v8 = 2080;
    id v9 = "-[NIServerBaseSession configure]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "#ses-base,%s:%d: assertion failure in %s", (uint8_t *)&v4, 0x1Cu);
  }
  abort();
}

- (id)run
{
  v2 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v4) = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "#ses-base,Must be implemented in the subclass", (uint8_t *)&v4, 2u);
  }
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315650;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerBaseSession.mm";
    __int16 v6 = 1024;
    int v7 = 75;
    __int16 v8 = 2080;
    id v9 = "-[NIServerBaseSession run]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "#ses-base,%s:%d: assertion failure in %s", (uint8_t *)&v4, 0x1Cu);
  }
  abort();
}

- (id)pauseWithSource:(int64_t)a3
{
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v5) = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "#ses-base,Must be implemented in the subclass", (uint8_t *)&v5, 2u);
  }
  int v4 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315650;
    __int16 v6 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerBaseSession.mm";
    __int16 v7 = 1024;
    int v8 = 80;
    __int16 v9 = 2080;
    id v10 = "-[NIServerBaseSession pauseWithSource:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "#ses-base,%s:%d: assertion failure in %s", (uint8_t *)&v5, 0x1Cu);
  }
  abort();
}

- (BOOL)updateConfiguration:(id)a3
{
  return 0;
}

- (BOOL)supportsSessionObservers
{
  return 0;
}

- (BOOL)supportsBackgroundedClients
{
  return 0;
}

- (BOOL)supportsCameraAssistance
{
  return 0;
}

- (unint64_t)requiresUWBToRun
{
  return 0;
}

- (unint64_t)requiresNarrowbandToRun
{
  return 0;
}

- (unint64_t)requiresSpatialInteractionBluetoothResource
{
  return 0;
}

- (id)disableAllServices
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resourcesManager);
  v3 = [WeakRetained btResource];
  [v3 stopAndClearState];

  int v4 = [WeakRetained lifecycleSupervisor];
  [v4 stoppedDiscoveringAllPeers];

  return 0;
}

- (void)invalidate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resourcesManager);
  int v4 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [WeakRetained serverSessionIdentifier];
    int v10 = 138412290;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-base,Terminating NIServerBaseSession. Session identifier: %@", (uint8_t *)&v10, 0xCu);
  }
  __int16 v6 = [(NIServerBaseSession *)self disableAllServices];
  if (v6)
  {
    __int16 v7 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = [WeakRetained serverSessionIdentifier];
      sub_10042A8F8(v8, (uint64_t)v6, (uint8_t *)&v10, v7);
    }
  }
  __int16 v9 = [WeakRetained lifecycleSupervisor];
  [v9 invalidateCalled];
}

- (id)addObject:(id)a3
{
  v3 = -[NIServerBaseSession deleteURSKs]_0();

  return v3;
}

- (id)deleteURSKs
{
  NSErrorUserInfoKey v3 = NSLocalizedDescriptionKey;
  CFStringRef v4 = @"This function is not supported for this configuration.";
  v0 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];
  v1 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5889 userInfo:v0];

  return v1;
}

- (id)removeObject:(id)a3
{
  NSErrorUserInfoKey v3 = -[NIServerBaseSession deleteURSKs]_0();

  return v3;
}

- (NIServerDataResponse)processDCKMessage:(id)a3
{
  NSErrorUserInfoKey v3 = -[NIServerBaseSession deleteURSKs]_0();
  CFStringRef v4 = 0;
  result.var1 = v3;
  result.var0 = v4;
  return result;
}

- (id)processBluetoothHostTimeSyncWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4 eventCounter:(unint64_t)a5 monotonicTimeSec:(double)a6 response:(id *)a7
{
  *a7 = 0;
  return -[NIServerBaseSession deleteURSKs]_0();
}

- (NIServerNumberResponse)isRangingLimitExceeded
{
  v2 = -[NIServerBaseSession deleteURSKs]_0();
  NSErrorUserInfoKey v3 = 0;
  result.var1 = v2;
  result.var0 = v3;
  return result;
}

- (id)_setDebugURSK:(id)a3 transactionIdentifier:(unsigned int)a4
{
  CFStringRef v4 = -[NIServerBaseSession deleteURSKs]_0();

  return v4;
}

- (id)_processCarKeyEvent:(id)a3
{
  NSErrorUserInfoKey v3 = -[NIServerBaseSession deleteURSKs]_0();

  return v3;
}

- (id)_processFindingEvent:(id)a3
{
  NSErrorUserInfoKey v3 = -[NIServerBaseSession deleteURSKs]_0();

  return v3;
}

- (id)_processSystemEvent:(id)a3
{
  NSErrorUserInfoKey v3 = -[NIServerBaseSession deleteURSKs]_0();

  return v3;
}

- (void)processAcwgM1Msg:(id)a3 withSessionTriggerReason:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resourcesManager);
  int v5 = [WeakRetained remote];
  __int16 v6 = sub_1002B70F0(a2);
  [v5 uwbSessionDidFailWithError:v6];
}

- (void)processAcwgM3Msg:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resourcesManager);
  CFStringRef v4 = [WeakRetained remote];
  int v5 = sub_1002B70F0(a2);
  [v4 uwbSessionDidFailWithError:v5];
}

- (void)processAcwgRangingSessionResumeRequestMsg:(unsigned int)a3 withResumeTriggerReason:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resourcesManager);
  int v5 = [WeakRetained remote];
  __int16 v6 = sub_1002B70F0(a2);
  [v5 uwbSessionDidFailWithError:v6];
}

- (void)suspendAcwgRanging:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resourcesManager);
  int v5 = [WeakRetained remote];
  __int16 v6 = sub_1002B70F0(a2);
  [v5 uwbSessionDidFailWithError:v6];
}

- (void)prefetchAcwgUrsk:(unsigned int)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resourcesManager);
  CFStringRef v4 = [WeakRetained remote];
  int v5 = sub_1002B70F0(a2);
  [v4 uwbSessionDidFailWithError:v5];
}

- (void)processUpdatedLockState:(unsigned __int16)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resourcesManager);
  CFStringRef v4 = [WeakRetained remote];
  int v5 = sub_1002B70F0(a2);
  [v4 uwbSessionDidFailWithError:v5];
}

- (BOOL)isInterestedInSamplesForDevice:(id)a3
{
  return 0;
}

- (BOOL)isInteresetedInSample:(id)a3
{
  return 0;
}

- (BOOL)supportsDevicePresence
{
  return 0;
}

- (id)getQueueForInputingData
{
  v2 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v4) = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "#ses-base,Must be implemented in the subclass", (uint8_t *)&v4, 2u);
  }
  NSErrorUserInfoKey v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315650;
    int v5 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerBaseSession.mm";
    __int16 v6 = 1024;
    int v7 = 277;
    __int16 v8 = 2080;
    __int16 v9 = "-[NIServerBaseSession getQueueForInputingData]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "#ses-base,%s:%d: assertion failure in %s", (uint8_t *)&v4, 0x1Cu);
  }
  abort();
}

- (id)printableState
{
  v2 = objc_opt_new();

  return v2;
}

- (void)serviceRequestDidUpdateStatus:(ServiceRequestStatusUpdate)a3
{
  unint64_t v3 = *(void *)&a3.var0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resourcesManager);
  id v7 = [WeakRetained lifecycleSupervisor];
  unint64_t v5 = HIDWORD(v3);

  if (v5 == 3)
  {
    [v7 positioningSensorSessionStopped];
    __int16 v6 = v7;
  }
  else if (v5 == 5)
  {
    [v7 positioningSensorSessionStarted];
    __int16 v6 = v7;
  }
  else
  {
    __int16 v6 = v7;
    if (v5 == 6)
    {
      [v7 stoppedDiscoveringAllPeers];
      __int16 v6 = v7;
    }
  }
}

- (id)discoveryTokenFromIdentifier:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resourcesManager);
  unint64_t v5 = [WeakRetained btResource];
  __int16 v6 = [v5 deviceCache];
  id v7 = [v6 deviceForIdentifier:a3];

  if (v7)
  {
    __int16 v8 = [NIDiscoveryToken alloc];
    __int16 v9 = [v7 discoveryTokenData];
    int v10 = [(NIDiscoveryToken *)v8 initWithBytes:v9];
  }
  else
  {
    v11 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10042A960(a3, v11);
    }
    int v10 = 0;
  }

  return v10;
}

- (optional<unsigned)identifierFromDiscoveryToken:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resourcesManager);
  __int16 v6 = [WeakRetained btResource];
  id v7 = [v6 deviceCache];
  __int16 v8 = [v4 rawToken];
  __int16 v9 = [v7 deviceForTokenData:v8];

  if (v9)
  {
    unint64_t v10 = (unint64_t)[v9 u64Identifier];
    unint64_t v11 = v10 & 0xFFFFFFFFFFFFFF00;
    uint64_t v12 = v10;
    uint64_t v13 = 1;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v12 = 0;
    unint64_t v11 = 0;
  }

  v14.__val_ = v11 | v12;
  BOOL v15 = v13;
  result.__engaged_ = v15;
  result.var0 = v14;
  return result;
}

- (id)objectFromIdentifier:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resourcesManager);
  unint64_t v5 = [WeakRetained btResource];
  __int16 v6 = [v5 deviceCache];
  id v7 = [v6 deviceForIdentifier:a3];

  if (v7)
  {
    __int16 v8 = +[NINearbyObject objectFromBluetoothDevice:v7];
  }
  else
  {
    __int16 v9 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10042A960(a3, v9);
    }
    __int16 v8 = 0;
  }

  return v8;
}

- (basic_string<char,)uniqueIdentifierForEngine:(std::allocator<char>> *__return_ptr)retstr
{
  uint64_t v3 = v1;
  id v9 = v2;
  id WeakRetained = objc_loadWeakRetained((id *)(v3 + 24));
  __int16 v6 = [WeakRetained serverSessionIdentifier];

  if (!v6) {
    __assert_rtn("-[NIServerBaseSession uniqueIdentifierForEngine:]", "NIServerBaseSession.mm", 363, "identifier != nil");
  }
  id v7 = [v6 UUIDString];
  sub_100004950(retstr, (char *)[v7 UTF8String]);

  return result;
}

- (void)peerInactivityPeriodExceeded:(id)a3
{
  id v3 = a3;
  id v4 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v6) = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "#ses-base,Must be implemented in the subclass", (uint8_t *)&v6, 2u);
  }
  unint64_t v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerBaseSession.mm";
    __int16 v8 = 1024;
    int v9 = 374;
    __int16 v10 = 2080;
    unint64_t v11 = "-[NIServerBaseSession peerInactivityPeriodExceeded:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#ses-base,%s:%d: assertion failure in %s", (uint8_t *)&v6, 0x1Cu);
  }
  abort();
}

- (void)setClientVoucher:(id)a3
{
  self->_isVoucherSet = 1;
}

- (BOOL)adoptVoucher
{
  return 0;
}

- (BOOL)releaseVoucher
{
  return 0;
}

- (NIServerSessionResourceManager)resourcesManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resourcesManager);

  return (NIServerSessionResourceManager *)WeakRetained;
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)backgroundSupportUpdateHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setBackgroundSupportUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_backgroundSupportUpdateHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_destroyWeak((id *)&self->_resourcesManager);

  objc_storeStrong((id *)&self->_clientVoucher, 0);
}

@end