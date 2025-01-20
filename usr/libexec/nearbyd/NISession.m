@interface NISession
+ (BOOL)_supportedPlatform:(id)a3;
+ (BOOL)isSupported;
+ (NIInternalDeviceCapability)internalDeviceCapabilities;
+ (NSArray)activelyInteractingDiscoveryTokens;
+ (NSArray)interactableDiscoveryTokens;
+ (NSDictionary)cachedPlatformCapabilities;
+ (id)_localDeviceLogger;
+ (id)deviceCapabilities;
+ (id)generateBluetoothDeviceTokenWithPublicAddress:(id)a3 IRK:(id)a4;
+ (id)generateFindingDiscoveryToken;
+ (id)generateFindingDiscoveryTokenWithIdentityResolvingKey:(id)a3;
+ (id)generateFindingDiscoveryTokenWithSharedSecret:(id)a3;
+ (id)localDevicePrintableState;
+ (id)observerSession;
+ (id)setLocalDeviceCanInteract:(BOOL)a3 withDiscoveryTokens:(id)a4;
+ (id)setLocalDeviceDebugParameters:(id)a3;
+ (id)setLocalDeviceInteractableDiscoveryTokens:(id)a3;
+ (void)_queryAndCacheCapabilities;
+ (void)getAsyncActivelyInteractingDiscoveryTokens:(id)a3;
+ (void)getAsyncInteractableDiscoveryTokens:(id)a3;
+ (void)setAsyncLocalDeviceInteractableDiscoveryTokens:(id)a3 completion:(id)a4;
+ (void)setCachedPlatformCapabilities:(id)a3;
- (BOOL)_isInternalClient;
- (BOOL)_isValidARSession:(id)a3 andConfiguration:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExtendedDistanceMeasurementAllowed;
- (BOOL)isPreciseRangingAllowed;
- (BOOL)isRangingLimitExceeded;
- (NIAcwgEventNotifier)acwgEventNotifier;
- (NICarKeyEventNotifier)carKeyEventNotifier;
- (NIConfiguration)configuration;
- (NIDevicePresenceNotifier)devicePresenceNotifier;
- (NIDiscoveryToken)discoveryToken;
- (NIFindingNotifier)findingNotifier;
- (NIInternalSessionDelegate)internalDelegate;
- (NISession)init;
- (NISystemEventNotifier)systemEventNotifier;
- (NSDictionary)activationResponse;
- (NSError)invalidationError;
- (NSString)description;
- (dispatch_queue_t)delegateQueue;
- (double)lightEstimateFromARLightEstimate:(id)a3;
- (id).cxx_construct;
- (id)_getSessionFailureError;
- (id)_initAndConnectToServerWithOptions:(unint64_t)a3;
- (id)_remoteObject;
- (id)_setDebugURSK:(id)a3 transactionIdentifier:(unsigned int)a4;
- (id)_setURSKTTL:(unint64_t)a3;
- (id)_synchronousRemoteObject;
- (id)_verifyError:(id)a3;
- (id)delegate;
- (id)deleteURSKs;
- (id)getInternalConnectionQueue;
- (id)getInternalIdentifier;
- (id)getInternalLogObject;
- (int)internalState;
- (int64_t)motionState;
- (int64_t)niVisionInputTrackingStateFromARTRackingState:(int64_t)a3;
- (simd_float4x4)worldTransformForObject:(NINearbyObject *)object;
- (unint64_t)hash;
- (void)_addObject:(id)a3;
- (void)_addRegionPredicate:(id)a3;
- (void)_configureAndRunInternalARSession;
- (void)_handleARSession:(id)a3 willRunWithConfiguration:(id)a4;
- (void)_handleARSessionDidChangeState:(unint64_t)a3;
- (void)_handleARSessionDidFailWithError:(id)a3;
- (void)_handleARSessionDidUpdateFrame:(id)a3;
- (void)_handleARSessionInterruptionEnded;
- (void)_handleARSessionWasInterrupted;
- (void)_handleActivationError:(id)a3;
- (void)_handleActivationSuccess:(id)a3;
- (void)_handlePauseSessionError:(id)a3;
- (void)_handlePauseSessionSuccess;
- (void)_handleRunSessionError:(id)a3;
- (void)_handleRunSessionSuccess;
- (void)_interruptSessionWithInternalReason:(int64_t)a3 cachedInterruption:(BOOL)a4;
- (void)_invalidateInternal;
- (void)_invalidateInternalARSessionIfNeeded;
- (void)_invalidateSessionAndNotifyError:(id)a3;
- (void)_logDurationAndSubmit:(BOOL)a3;
- (void)_logTime;
- (void)_notifyDidInvalidateWithError:(id)a3;
- (void)_osLogNearbyObjectUpdate:(id)a3;
- (void)_pauseInternalARSessionIfNeeded;
- (void)_performBlockOnDelegateQueue:(id)a3 ifRespondsToSelector:(SEL)a4;
- (void)_performBlockOnDelegateQueue:(id)a3 ifRespondsToSelector:(SEL)a4 evenIfNotRunning:(BOOL)a5;
- (void)_processUpdatedLockState:(unsigned __int16)a3;
- (void)_provideTruthTag:(id)a3;
- (void)_reinterruptSessionWithCachedInterruption;
- (void)_removeObject:(id)a3;
- (void)_removeRegionPredicate:(id)a3;
- (void)_serverConnectionInterrupted;
- (void)_serverConnectionInvalidated;
- (void)_setARSessionInternal:(id)a3;
- (void)_submitErrorMetric:(id)a3;
- (void)dealloc;
- (void)didDiscoverNearbyObject:(id)a3;
- (void)didGenerateShareableConfigurationData:(id)a3 forObject:(id)a4;
- (void)didPrefetchAcwgUrsk:(unsigned int)a3 error:(id)a4;
- (void)didProcessAcwgM1MsgWithResponse:(id)a3 error:(id)a4;
- (void)didProcessAcwgM3MsgWithResponse:(id)a3 error:(id)a4;
- (void)didProcessAcwgRangingSessionResumeRequestMsgWithResponse:(id)a3 error:(id)a4;
- (void)didReceiveRangingAuthRecommendation:(BOOL)a3 forObject:(id)a4;
- (void)didRemoveNearbyObjects:(id)a3 withReason:(unint64_t)a4;
- (void)didStartAcwgRanging:(int64_t)a3;
- (void)didSuspendAcwgRanging:(int64_t)a3;
- (void)didUpdateAlgorithmState:(id)a3 forObject:(id)a4;
- (void)didUpdateHealthStatus:(int64_t)a3;
- (void)didUpdateHomeDeviceUWBRangingAvailability:(BOOL)a3;
- (void)didUpdateLocalDiscoveryToken:(id)a3;
- (void)didUpdateMotionState:(int64_t)a3;
- (void)didUpdateNearbyObjects:(id)a3;
- (void)invalidate;
- (void)object:(id)a3 didUpdateRegion:(id)a4 previousRegion:(id)a5;
- (void)pause;
- (void)prefetchAcwgUrsk:(unsigned int)a3;
- (void)processAcwgM1Msg:(id)a3 withSessionTriggerReason:(int64_t)a4;
- (void)processAcwgM3Msg:(id)a3;
- (void)processAcwgRangingSessionResumeRequestMsg:(unsigned int)a3 withResumeTriggerReason:(int64_t)a4;
- (void)processBluetoothEventWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4;
- (void)processBluetoothEventWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4 eventCounter:(unint64_t)a5;
- (void)processBluetoothHostTimeSyncWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4 eventCounter:(unint64_t)a5;
- (void)processDCKMessage:(id)a3 responseCallback:(id)a4;
- (void)processVisionInput:(id)a3;
- (void)relayDCKMessage:(id)a3;
- (void)requestAcwgRangingSessionSuspend:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4;
- (void)runWithConfiguration:(NIConfiguration *)configuration;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)session:(id)a3 willRunWithConfiguration:(id)a4;
- (void)sessionInterruptionEnded:(id)a3;
- (void)sessionShouldAttemptRelocalization:(id)a3 completion:(id)a4;
- (void)sessionWasInterrupted:(id)a3;
- (void)setARSession:(ARSession *)session;
- (void)setActivationResponse:(id)a3;
- (void)setConfigurationForTesting:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setDelegateQueue:(dispatch_queue_t)delegateQueue;
- (void)setInternalDelegate:(id)a3;
- (void)setInternalState:(int)a3;
- (void)setInvalidationError:(id)a3;
- (void)suspendAcwgRanging:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4;
- (void)systemDidUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationTypeWithName:(id)a4;
- (void)systemDidUpdateState:(id)a3;
- (void)updateResponderDeviceIdentifier:(id)a3 completionHandler:(id)a4;
- (void)uwbSessionDidFailWithError:(id)a3;
- (void)uwbSessionDidInvalidateWithError:(id)a3;
- (void)uwbSessionInterruptedWithReason:(int64_t)a3 timestamp:(double)a4;
- (void)uwbSessionInterruptionReasonEnded:(int64_t)a3 timestamp:(double)a4;
@end

@implementation NISession

+ (id)_localDeviceLogger
{
  if (qword_1008A7130 != -1) {
    dispatch_once(&qword_1008A7130, &stru_10085D250);
  }
  v2 = (void *)qword_1008A7128;

  return v2;
}

+ (void)setAsyncLocalDeviceInteractableDiscoveryTokens:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 copy];
  v8 = +[NISession _localDeviceLogger];
  if (+[NIPlatformInfo isInternalBuild])
  {
    v9 = v8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v20 = [v7 count];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "setAsyncLocalDeviceInteractableDiscoveryTokens:completion: with %d tokens", buf, 8u);
    }
  }
  v10 = +[NIServerConnection createOneShotConnectionAndResume:1];
  v11 = [v10 remoteObjectProxy];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10029119C;
  v15[3] = &unk_10085D278;
  id v12 = v8;
  id v16 = v12;
  id v13 = v6;
  id v18 = v13;
  id v14 = v10;
  id v17 = v14;
  [v11 setLocalDeviceInteractableDiscoveryTokens:v7 reply:v15];
}

+ (void)getAsyncInteractableDiscoveryTokens:(id)a3
{
  id v3 = a3;
  v4 = +[NISession _localDeviceLogger];
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "getAsyncInteractableDiscoveryTokens:", buf, 2u);
  }
  id v5 = +[NIServerConnection createOneShotConnectionAndResume:1];
  id v6 = [v5 remoteObjectProxy];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100291444;
  v10[3] = &unk_10085D2A0;
  id v7 = v4;
  v11 = v7;
  id v8 = v3;
  id v13 = v8;
  id v9 = v5;
  id v12 = v9;
  [v6 getInteractableDiscoveryTokens:v10];
}

+ (void)getAsyncActivelyInteractingDiscoveryTokens:(id)a3
{
  id v3 = a3;
  v4 = +[NISession _localDeviceLogger];
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "getAsyncActivelyInteractingDiscoveryTokens:", buf, 2u);
  }
  id v5 = +[NIServerConnection createOneShotConnectionAndResume:1];
  id v6 = [v5 remoteObjectProxy];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10029172C;
  v10[3] = &unk_10085D2A0;
  id v7 = v4;
  v11 = v7;
  id v8 = v3;
  id v13 = v8;
  id v9 = v5;
  id v12 = v9;
  [v6 getActivelyInteractingDiscoveryTokens:v10];
}

+ (id)setLocalDeviceCanInteract:(BOOL)a3 withDiscoveryTokens:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [v5 copy];
  id v7 = +[NISession _localDeviceLogger];
  if (v4) {
    id v8 = "YES";
  }
  else {
    id v8 = "NO";
  }
  if (+[NIPlatformInfo isInternalBuild])
  {
    id v9 = v7;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = [v6 count];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "setLocalDeviceCanInteract:%s with %d tokens", buf, 0x12u);
    }
  }
  v10 = +[NIServerConnection createOneShotConnectionAndResume:1];
  v11 = [v10 remoteObjectProxy];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v35 = sub_100291C78;
  v36 = sub_100291C88;
  id v37 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100291C90;
  v20[3] = &unk_10085D2C8;
  v22 = &v24;
  v23 = buf;
  id v12 = dispatch_semaphore_create(0);
  v21 = v12;
  [v11 setLocalDeviceCanInteract:v4 withDiscoveryTokens:v6 reply:v20];
  dispatch_time_t v13 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v12, v13);
  [v10 invalidate];
  if (!*((unsigned char *)v25 + 24))
  {
    NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
    CFStringRef v33 = @"Server did not reply.";
    id v14 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    uint64_t v15 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v14];
    id v16 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v15;
  }
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(*(void *)&buf[8] + 40);
    *(_DWORD *)v28 = 136315394;
    v29 = v8;
    __int16 v30 = 2112;
    uint64_t v31 = v17;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "setLocalDeviceCanInteract:%s return error: %@", v28, 0x16u);
  }
  id v18 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v24, 8);

  return v18;
}

+ (id)setLocalDeviceDebugParameters:(id)a3
{
  id v3 = a3;
  id v4 = [v3 copy];
  id v5 = +[NISession _localDeviceLogger];
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setLocalDeviceDebugParameters:%@", (uint8_t *)&buf, 0xCu);
  }
  id v6 = +[NIServerConnection createOneShotConnectionAndResume:1];
  id v7 = [v6 remoteObjectProxy];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x3032000000;
  __int16 v30 = sub_100291C78;
  uint64_t v31 = sub_100291C88;
  id v32 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1002920BC;
  v16[3] = &unk_10085D2C8;
  id v18 = &v20;
  p_long long buf = &buf;
  id v8 = dispatch_semaphore_create(0);
  uint64_t v17 = v8;
  [v7 setLocalDeviceDebugParameters:v4 reply:v16];
  dispatch_time_t v9 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v8, v9);
  [v6 invalidate];
  if (!*((unsigned char *)v21 + 24))
  {
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    CFStringRef v27 = @"Server did not reply.";
    v10 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    uint64_t v11 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v10];
    id v12 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v11;
  }
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)uint64_t v24 = 138412290;
    uint64_t v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setLocalDeviceDebugParameters return error: %@", v24, 0xCu);
  }
  id v14 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v20, 8);

  return v14;
}

+ (id)setLocalDeviceInteractableDiscoveryTokens:(id)a3
{
  id v3 = a3;
  id v4 = [v3 copy];
  id v5 = +[NISession _localDeviceLogger];
  if (+[NIPlatformInfo isInternalBuild])
  {
    id v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = [v4 count];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "setLocalDeviceInteractableDiscoveryTokens with %d tokens", buf, 8u);
    }
  }
  id v7 = +[NIServerConnection createOneShotConnectionAndResume:1];
  id v8 = [v7 remoteObjectProxy];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  *(void *)long long buf = 0;
  __int16 v30 = buf;
  uint64_t v31 = 0x3032000000;
  id v32 = sub_100291C78;
  CFStringRef v33 = sub_100291C88;
  id v34 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100292504;
  v17[3] = &unk_10085D2C8;
  v19 = &v21;
  uint64_t v20 = buf;
  dispatch_time_t v9 = dispatch_semaphore_create(0);
  id v18 = v9;
  [v8 setLocalDeviceInteractableDiscoveryTokens:v4 reply:v17];
  dispatch_time_t v10 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v9, v10);
  [v7 invalidate];
  if (!*((unsigned char *)v22 + 24))
  {
    NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
    CFStringRef v28 = @"Server did not reply.";
    uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    uint64_t v12 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v11];
    uint64_t v13 = (void *)*((void *)v30 + 5);
    *((void *)v30 + 5) = v12;
  }
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *((void *)v30 + 5);
    *(_DWORD *)uint64_t v25 = 138412290;
    uint64_t v26 = v14;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setLocalDeviceInteractableDiscoveryTokens return error: %@", v25, 0xCu);
  }
  id v15 = *((id *)v30 + 5);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v21, 8);

  return v15;
}

+ (NSArray)interactableDiscoveryTokens
{
  v2 = +[NISession _localDeviceLogger];
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "interactableDiscoveryTokens", buf, 2u);
  }
  id v3 = +[NIServerConnection createOneShotConnectionAndResume:1];
  id v4 = [v3 remoteObjectProxy];
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  *(void *)long long buf = 0;
  uint64_t v31 = buf;
  uint64_t v32 = 0x3032000000;
  CFStringRef v33 = sub_100291C78;
  id v34 = sub_100291C88;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  NSErrorUserInfoKey v27 = sub_100291C78;
  CFStringRef v28 = sub_100291C88;
  id v29 = 0;
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  id v18 = sub_100292988;
  v19 = &unk_10085D2F0;
  uint64_t v21 = &v36;
  uint64_t v22 = buf;
  uint64_t v23 = &v24;
  id v5 = dispatch_semaphore_create(0);
  uint64_t v20 = v5;
  [v4 getInteractableDiscoveryTokens:&v16];
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v5, v6);
  [v3 invalidate:v16, v17, v18, v19];
  if (!*((unsigned char *)v37 + 24))
  {
    id v7 = (void *)*((void *)v31 + 5);
    *((void *)v31 + 5) = 0;

    NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
    CFStringRef v45 = @"Server did not reply.";
    id v8 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    uint64_t v9 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v8];
    dispatch_time_t v10 = (void *)v25[5];
    v25[5] = v9;
  }
  if (+[NIPlatformInfo isInternalBuild])
  {
    uint64_t v11 = v2;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = [*((id *)v31 + 5) count];
      uint64_t v13 = v25[5];
      *(_DWORD *)v40 = 67109378;
      unsigned int v41 = v12;
      __int16 v42 = 2112;
      uint64_t v43 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "interactableDiscoveryTokens return %d tokens. Server error: %@", v40, 0x12u);
    }
  }
  id v14 = *((id *)v31 + 5);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v36, 8);

  return (NSArray *)v14;
}

+ (NSArray)activelyInteractingDiscoveryTokens
{
  v2 = +[NISession _localDeviceLogger];
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "activelyInteractingDiscoveryTokens", buf, 2u);
  }
  id v3 = +[NIServerConnection createOneShotConnectionAndResume:1];
  id v4 = [v3 remoteObjectProxy];
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  *(void *)long long buf = 0;
  uint64_t v31 = buf;
  uint64_t v32 = 0x3032000000;
  CFStringRef v33 = sub_100291C78;
  id v34 = sub_100291C88;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  NSErrorUserInfoKey v27 = sub_100291C78;
  CFStringRef v28 = sub_100291C88;
  id v29 = 0;
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  id v18 = sub_100292E48;
  v19 = &unk_10085D2F0;
  uint64_t v21 = &v36;
  uint64_t v22 = buf;
  uint64_t v23 = &v24;
  id v5 = dispatch_semaphore_create(0);
  uint64_t v20 = v5;
  [v4 getActivelyInteractingDiscoveryTokens:&v16];
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v5, v6);
  [v3 invalidate:v16, v17, v18, v19];
  if (!*((unsigned char *)v37 + 24))
  {
    id v7 = (void *)*((void *)v31 + 5);
    *((void *)v31 + 5) = 0;

    NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
    CFStringRef v45 = @"Server did not reply.";
    id v8 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    uint64_t v9 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v8];
    dispatch_time_t v10 = (void *)v25[5];
    v25[5] = v9;
  }
  if (+[NIPlatformInfo isInternalBuild])
  {
    uint64_t v11 = v2;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = [*((id *)v31 + 5) count];
      uint64_t v13 = v25[5];
      *(_DWORD *)v40 = 67109378;
      unsigned int v41 = v12;
      __int16 v42 = 2112;
      uint64_t v43 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "activelyInteractingDiscoveryTokens return %d tokens. Server error: %@", v40, 0x12u);
    }
  }
  id v14 = *((id *)v31 + 5);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v36, 8);

  return (NSArray *)v14;
}

+ (id)localDevicePrintableState
{
  v2 = +[NISession _localDeviceLogger];
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "localDevicePrintableState", buf, 2u);
  }
  id v3 = +[NIServerConnection createOneShotConnectionAndResume:1];
  id v4 = [v3 remoteObjectProxy];
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  *(void *)long long buf = 0;
  id v29 = buf;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = sub_100291C78;
  uint64_t v32 = sub_100291C88;
  id v33 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = sub_100291C78;
  uint64_t v26 = sub_100291C88;
  id v27 = 0;
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_1002932D8;
  uint64_t v17 = &unk_10085D318;
  v19 = &v34;
  uint64_t v20 = buf;
  uint64_t v21 = &v22;
  id v5 = dispatch_semaphore_create(0);
  id v18 = v5;
  [v4 getLocalDevicePrintableState:&v14];
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v5, v6);
  [v3 invalidate:v14, v15, v16, v17];
  if (!*((unsigned char *)v35 + 24))
  {
    id v7 = (void *)*((void *)v29 + 5);
    *((void *)v29 + 5) = 0;

    NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
    CFStringRef v41 = @"Server did not reply.";
    id v8 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    uint64_t v9 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v8];
    dispatch_time_t v10 = (void *)v23[5];
    v23[5] = v9;
  }
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v23[5];
    *(_DWORD *)uint64_t v38 = 138412290;
    uint64_t v39 = v11;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "localDevicePrintableState error: %@", v38, 0xCu);
  }
  id v12 = *((id *)v29 + 5);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v34, 8);

  return v12;
}

+ (NSDictionary)cachedPlatformCapabilities
{
  return (NSDictionary *)(id)qword_1008A8040;
}

+ (void)setCachedPlatformCapabilities:(id)a3
{
}

- (int64_t)motionState
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002E2DD0;
  v5[3] = &unk_100856C00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_initAndConnectToServerWithOptions:(unint64_t)a3
{
  v34.receiver = self;
  v34.super_class = (Class)NISession;
  id v4 = [(NISession *)&v34 init];
  id v5 = v4;
  if (v4)
  {
    v4->_connectionOptions = a3;
    uint64_t v6 = +[NSUUID UUID];
    internalID = v5->_internalID;
    v5->_internalID = (NSUUID *)v6;

    atomic_store(0, (unsigned __int8 *)&v5->_readyForCallbacks);
    v5->_startTime = 0.0;
    v5->_duration = 0.0;
    v5->_updatedNearbyObjects = 0;
    os_log_t v8 = os_log_create("com.apple.NearbyInteraction", "NISession");
    log = v5->_log;
    v5->_log = (OS_os_log *)v8;

    dispatch_time_t v10 = objc_alloc_init(NISessionVisionContext);
    visionContext = v5->_visionContext;
    v5->_visionContext = v10;

    [(NISession *)v5 setInternalState:0];
    [(NISession *)v5 setInvalidationError:0];
    id v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.NearbyInteraction", v12);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v5->_delegateQueue, &_dispatch_main_q);
    uint64_t v15 = [[NIExportedObjectForwarder alloc] initWithExportedObject:v5];
    exportedObjectForwarder = v5->_exportedObjectForwarder;
    v5->_exportedObjectForwarder = v15;

    atomic_store(a3 & 1, (unsigned __int8 *)&v5->_isObserverSession);
    uint64_t v17 = [[NIServerConnection alloc] initWithSessionID:v5->_internalID queue:v5->_queue exportedObject:v5->_exportedObjectForwarder options:a3];
    connection = v5->_connection;
    v5->_connection = v17;

    dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
    discoveryTokenSemaphore = v5->_discoveryTokenSemaphore;
    v5->_discoveryTokenSemaphore = (OS_dispatch_semaphore *)v19;

    objc_initWeak(&location, v5);
    uint64_t v21 = v5->_connection;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1002E31DC;
    v31[3] = &unk_1008460E8;
    objc_copyWeak(&v32, &location);
    [(NIServerConnection *)v21 setInterruptionHandler:v31];
    uint64_t v22 = v5->_connection;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1002E3238;
    v29[3] = &unk_1008460E8;
    objc_copyWeak(&v30, &location);
    [(NIServerConnection *)v22 setInvalidationHandler:v29];
    [(NIServerConnection *)v5->_connection resume];
    if (+[NIPlatformInfo isInternalBuild])
    {
      uint64_t v23 = v5->_log;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = v5->_internalID;
        *(_DWORD *)long long buf = 138412290;
        uint64_t v36 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "NISession init [%@]", buf, 0xCu);
      }
    }
    uint64_t v25 = [(NISession *)v5 _remoteObject];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1002E3294;
    v27[3] = &unk_10085F540;
    CFStringRef v28 = v5;
    [v25 activate:v27];

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  return v5;
}

+ (BOOL)_supportedPlatform:(id)a3
{
  int64_t v3 = [a3 objectForKey:@"SupportedPlatform"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

+ (void)_queryAndCacheCapabilities
{
  v2 = +[NIServerConnection createOneShotConnectionAndResume:1];
  int64_t v3 = [v2 remoteObjectProxy];
  uint64_t v12 = 0;
  dispatch_queue_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_1002E3508;
  id v16 = sub_1002E3518;
  id v17 = 0;
  uint64_t v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  os_log_t v8 = sub_1002E3520;
  uint64_t v9 = &unk_10085F568;
  uint64_t v11 = &v12;
  unsigned __int8 v4 = dispatch_semaphore_create(0);
  dispatch_time_t v10 = v4;
  [v3 queryDeviceCapabilities:&v6];
  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v4, v5);
  [v2 invalidate:v6, v7, v8, v9];
  +[NISession setCachedPlatformCapabilities:v13[5]];

  _Block_object_dispose(&v12, 8);
}

- (void)_osLogNearbyObjectUpdate:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = +[NSDate now];
  ++self->_objectUpdateLogging.totalUpdates;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1002E380C;
  v14[3] = &unk_10085A5B0;
  v14[4] = self;
  [v4 enumerateObjectsUsingBlock:v14];
  if (self->_lastObjectUpdateLogTime)
  {
    [v5 timeIntervalSinceDate:];
    double v7 = v6;
    if (v6 < 5.0) {
      goto LABEL_13;
    }
  }
  else
  {
    double v7 = 0.0;
  }
  objc_storeStrong((id *)&self->_lastObjectUpdateLogTime, v5);
  id v8 = [objc_alloc((Class)NSMutableString) initWithFormat:@"DelegateProxy: nearbyObjectUpdates [last %0.1f s]. Updates %d, objects %d, w/dist %d, w/HA %d.", *(void *)&v7, self->_objectUpdateLogging.totalUpdates, self->_objectUpdateLogging.totalObjects, self->_objectUpdateLogging.objectsWithDistance, self->_objectUpdateLogging.objectsWithHorizontalAngle];
  uint64_t v9 = v8;
  if (self->_objectUpdateLogging.objectsWithDistance >= 1) {
    [v8 appendFormat:@" Distance: first %0.2f m, last %0.2f m, min %0.2f m, max %0.2f m.", self->_objectUpdateLogging.firstDistance, self->_objectUpdateLogging.lastDistance, self->_objectUpdateLogging.minDistance, self->_objectUpdateLogging.maxDistance];
  }
  if (self->_objectUpdateLogging.objectsWithHorizontalAngle >= 1) {
    [v9 appendFormat:@" HA: first %0.1f deg, last %0.1f deg.", self->_objectUpdateLogging.firstHorizontalAngleRad * 57.2957795, self->_objectUpdateLogging.lastHorizontalAngleRad * 57.2957795];
  }
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138477827;
      id v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);
    }
  }
  uint64_t v11 = &NINearbyObjectDistanceNotAvailable;
  float v12 = NINearbyObjectAngleNotAvailable;
  *(void *)&self->_objectUpdateLogging.totalUpdates = 0;
  *(void *)&self->_objectUpdateLogging.objectsWithDistance = 0;
  float32x4_t v13 = vld1q_dup_f32(v11);
  *(float32x4_t *)&self->_objectUpdateLogging.firstDistance = v13;
  self->_objectUpdateLogging.firstHorizontalAngleRad = v12;
  self->_objectUpdateLogging.lastHorizontalAngleRad = v12;

LABEL_13:
}

- (void)_logTime
{
  +[NSDate timeIntervalSinceReferenceDate];
  double v4 = v3;
  double startTime = self->_startTime;
  if (startTime != 0.0)
  {
    self->_duration = v4 - startTime + self->_duration;
    AnalyticsSendEventLazy();
  }
  self->_double startTime = v4;
}

- (void)_logDurationAndSubmit:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_startTime != 0.0)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    self->_duration = self->_duration + v5 - self->_startTime;
    self->_double startTime = 0.0;
  }
  if (v3) {
    AnalyticsSendEventLazy();
  }
}

- (void)_submitErrorMetric:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (v3)
  {
    double v5 = [v3 userInfo];

    if (v5)
    {
      double v6 = [v4 userInfo];
      double v7 = [v6 objectForKeyedSubscript:NSLocalizedFailureReasonErrorKey];

      if (!v7)
      {
        id v8 = [v4 userInfo];
        double v7 = [v8 objectForKeyedSubscript:NSLocalizedDescriptionKey];

        if (!v7) {
          double v7 = &stru_100869B68;
        }
      }
    }
    else
    {
      double v7 = &stru_100869B68;
    }
    id v10 = v4;
    uint64_t v11 = v7;
    uint64_t v9 = v7;
    AnalyticsSendEventLazy();
  }
}

- (void)setDelegate:(id)delegate
{
  id v4 = delegate;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002E3FC0;
  v7[3] = &unk_100846588;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (void)setDelegateQueue:(dispatch_queue_t)delegateQueue
{
  double v5 = delegateQueue;
  if (!v5)
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"NISession.mm", 509, @"Invalid parameter not satisfying: %@", @"delegateQueue" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E4184;
  block[3] = &unk_100846588;
  block[4] = self;
  id v10 = v5;
  double v7 = v5;
  dispatch_sync((dispatch_queue_t)queue, block);
}

+ (BOOL)isSupported
{
  if (+[NIPlatformInfo supportsUWB]) {
    return 1;
  }
  id v3 = +[NISession cachedPlatformCapabilities];

  if (!v3) {
    +[NISession _queryAndCacheCapabilities];
  }
  id v4 = +[NISession cachedPlatformCapabilities];
  BOOL v2 = +[NISession _supportedPlatform:v4];

  return v2;
}

+ (id)deviceCapabilities
{
  BOOL v2 = [[NIDeviceCapabilities alloc] initWithFineRangingSupport:+[NIPlatformInfo supportsUWB](NIPlatformInfo, "supportsUWB") aoaSupport:+[NIPlatformInfo supportsAoA](NIPlatformInfo, "supportsAoA") extendedDistanceMeasurementSupport:+[NIPlatformInfo supportsNBAMMS](NIPlatformInfo, "supportsNBAMMS") syntheticApertureSupport:+[NIPlatformInfo supportsSyntheticAperture]];

  return v2;
}

- (NIConfiguration)configuration
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1002E3508;
  id v10 = sub_1002E3518;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002E445C;
  v5[3] = &unk_100856C00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NIConfiguration *)v3;
}

- (NIDiscoveryToken)discoveryToken
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_1002E3508;
  id v18 = sub_1002E3518;
  id v19 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E4694;
  block[3] = &unk_100856C00;
  block[4] = self;
  void block[5] = &v14;
  dispatch_sync((dispatch_queue_t)queue, block);
  id v4 = (void *)v15[5];
  if (!v4)
  {
    double v5 = self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1002E46A8;
    v12[3] = &unk_1008473B0;
    v12[4] = self;
    dispatch_sync((dispatch_queue_t)v5, v12);
    discoveryTokenSemaphore = self->_discoveryTokenSemaphore;
    dispatch_time_t v7 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(discoveryTokenSemaphore, v7);
    uint64_t v8 = self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1002E4708;
    v11[3] = &unk_100856C00;
    v11[4] = self;
    v11[5] = &v14;
    dispatch_sync((dispatch_queue_t)v8, v11);
    if (!v15[5]
      && +[NIPlatformInfo isInternalBuild]
      && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_10042D468();
    }
    id v4 = (void *)v15[5];
  }
  id v9 = v4;
  _Block_object_dispose(&v14, 8);

  return (NIDiscoveryToken *)v9;
}

- (BOOL)_isInternalClient
{
  BOOL v2 = [(NISession *)self activationResponse];
  id v3 = [v2 objectForKey:@"InternalClient"];

  BOOL v4 = 0;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v3 BOOLValue]) {
      BOOL v4 = 1;
    }
  }

  return v4;
}

- (NISession)init
{
  return (NISession *)[(NISession *)self _initAndConnectToServerWithOptions:0];
}

- (void)runWithConfiguration:(NIConfiguration *)configuration
{
  double v5 = configuration;
  if (!v5)
  {
    uint64_t v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"NISession.mm", 626, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E48CC;
  block[3] = &unk_100846588;
  block[4] = self;
  id v10 = v5;
  dispatch_time_t v7 = v5;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)pause
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E4DB0;
  block[3] = &unk_1008473B0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E50C0;
  block[3] = &unk_1008473B0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)dealloc
{
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      *(_DWORD *)long long buf = 138412290;
      dispatch_time_t v7 = internalID;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Client: dealloc [%@]", buf, 0xCu);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)NISession;
  [(NISession *)&v5 dealloc];
}

- (void)setARSession:(ARSession *)session
{
  BOOL v4 = session;
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "setARSession", buf, 2u);
    }
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002E53EC;
  v8[3] = &unk_100846588;
  v8[4] = self;
  id v9 = v4;
  dispatch_time_t v7 = v4;
  dispatch_sync((dispatch_queue_t)queue, v8);
}

- (void)_setARSessionInternal:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v4 state] == (id)1)
  {
    objc_super v5 = [v4 configuration];
    [(NISession *)self _handleARSession:v4 willRunWithConfiguration:v5];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [(NISessionVisionContext *)self->_visionContext arSession];
    if ([v6 state] == (id)2)
    {
      id v7 = [v4 state];

      if (v7 != (id)2)
      {
        if (+[NIPlatformInfo isInternalBuild])
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v10 = 0;
            _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "_setARSessionInternal: ARSession was interrupted, new ARSession created in uninterrupted state.", v10, 2u);
          }
        }
        [(NISession *)self _handleARSessionInterruptionEnded];
      }
    }
    else
    {
    }
  }
  [(NISessionVisionContext *)self->_visionContext setArSession:v4];
  id v9 = [(NISessionVisionContext *)self->_visionContext arSession];
  [v9 _addObserver:self];
}

- (simd_float4x4)worldTransformForObject:(NINearbyObject *)object
{
  id v4 = object;
  uint64_t v18 = 0;
  id v19 = (simd_float4 *)&v18;
  uint64_t v20 = 0x7012000000;
  uint64_t v21 = sub_1002E569C;
  uint64_t v22 = nullsub_129;
  uint64_t v23 = &unk_10080DAFA;
  simd_float4x4 v24 = NINearbyObjectWorldTransformNotAvailable;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E56B4;
  block[3] = &unk_100858E40;
  block[4] = self;
  uint64_t v16 = v4;
  id v17 = &v18;
  uint64_t v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  simd_float4 v13 = v19[5];
  simd_float4 v14 = v19[6];
  simd_float4 v11 = v19[3];
  simd_float4 v12 = v19[4];

  _Block_object_dispose(&v18, 8);
  simd_float4 v7 = v11;
  simd_float4 v8 = v12;
  simd_float4 v9 = v13;
  simd_float4 v10 = v14;
  result.columns[3] = v10;
  result.columns[2] = v9;
  result.columns[1] = v8;
  result.columns[0] = v7;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NISession *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v4 == self) {
      unsigned __int8 v5 = 1;
    }
    else {
      unsigned __int8 v5 = [(NSUUID *)self->_internalID isEqual:v4->_internalID];
    }
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSUUID *)self->_internalID hash];
}

- (NSString)description
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_1002E3508;
  uint64_t v21 = sub_1002E3518;
  id v3 = objc_alloc((Class)NSMutableString);
  id v4 = (objc_class *)objc_opt_class();
  unsigned __int8 v5 = NSStringFromClass(v4);
  id v22 = [v3 initWithFormat:@"<%@: %@", v5, self->_internalID];

  uint64_t v6 = +[NISession deviceCapabilities];
  simd_float4 v7 = (void *)v18[5];
  if ([v6 supportsPreciseDistanceMeasurement]) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  [v7 appendFormat:@", preciseDistance: %@", v8];
  simd_float4 v9 = (void *)v18[5];
  if ([v6 supportsDirectionMeasurement]) {
    CFStringRef v10 = @"YES";
  }
  else {
    CFStringRef v10 = @"NO";
  }
  [v9 appendFormat:@", direction: %@", v10];
  simd_float4 v11 = (void *)v18[5];
  if ([v6 supportsCameraAssistance]) {
    CFStringRef v12 = @"YES";
  }
  else {
    CFStringRef v12 = @"NO";
  }
  [v11 appendFormat:@", cameraAssistance: %@", v12];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E5A74;
  block[3] = &unk_100856C00;
  block[4] = self;
  void block[5] = &v17;
  dispatch_sync((dispatch_queue_t)queue, block);
  [(id)v18[5] appendString:@">"];
  id v14 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return (NSString *)v14;
}

- (void)setConfigurationForTesting:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002E5BC0;
  v7[3] = &unk_100846588;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (id)getInternalIdentifier
{
  return self->_internalID;
}

- (id)getInternalLogObject
{
  return self->_log;
}

- (id)getInternalConnectionQueue
{
  return self->_queue;
}

- (void)_serverConnectionInvalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unsigned int v3 = [(NISession *)self internalState];
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      if (v3 - 1 > 7) {
        CFStringRef v6 = @"Activating";
      }
      else {
        CFStringRef v6 = off_10085F9D0[v3 - 1];
      }
      *(_DWORD *)simd_float4 v9 = 138412546;
      *(void *)&v9[4] = internalID;
      *(_WORD *)&v9[12] = 2112;
      *(void *)&v9[14] = v6;
      simd_float4 v7 = log;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Server connection invalidated [%@]. State: %@.", v9, 0x16u);
    }
  }
  -[NISession setInternalState:](self, "setInternalState:", 8, *(_OWORD *)v9, *(void *)&v9[16]);
  if (v3 != 7)
  {
    id v8 = [(NISession *)self _getSessionFailureError];
    [(NISession *)self _notifyDidInvalidateWithError:v8];
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_discoveryTokenSemaphore);
}

- (void)_serverConnectionInterrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild])
  {
    unsigned int v3 = self->_log;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      unsigned int v5 = [(NISession *)self internalState] - 1;
      if (v5 > 7) {
        CFStringRef v6 = @"Activating";
      }
      else {
        CFStringRef v6 = off_10085F9D0[v5];
      }
      *(_DWORD *)long long buf = 138412546;
      CFStringRef v12 = internalID;
      __int16 v13 = 2112;
      CFStringRef v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Server connection interrupted [%@]. State: %@.", buf, 0x16u);
    }
  }
  v9[0] = NSLocalizedFailureReasonErrorKey;
  v9[1] = NSLocalizedRecoverySuggestionErrorKey;
  v10[0] = @"The session token has been invalidated. This session cannot be restarted.";
  v10[1] = @"Create a new session and exchange token again.";
  simd_float4 v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v8 = sub_1001DB2B8(-5887, v7);

  [(NISession *)self _invalidateSessionAndNotifyError:v8];
}

- (id)_remoteObject
{
  return [(NIServerConnection *)self->_connection remoteObjectProxy];
}

- (id)_synchronousRemoteObject
{
  return [(NIServerConnection *)self->_connection synchronousRemoteObjectProxy];
}

- (void)didRemoveNearbyObjects:(id)a3 withReason:(unint64_t)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109379;
      int v12 = a4;
      __int16 v13 = 2113;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: removed objects with reason: %d. Objects: %{private}@", buf, 0x12u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [(NISession *)self _pauseInternalARSessionIfNeeded];
    [(NISession *)self setInternalState:5];
  }
  if (a4 == 1)
  {
    id v8 = v9;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    void v9[2] = sub_1002E6204;
    v9[3] = &unk_100846588;
    v9[4] = self;
    v9[5] = v6;
    [(NISession *)self _performBlockOnDelegateQueue:v9 ifRespondsToSelector:"session:didRemoveNearbyObjects:withReason:"];
    goto LABEL_11;
  }
  if (!a4)
  {
    id v8 = v10;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    void v10[2] = sub_1002E6198;
    v10[3] = &unk_100846588;
    void v10[4] = self;
    v10[5] = v6;
    [(NISession *)self _performBlockOnDelegateQueue:v10 ifRespondsToSelector:"session:didRemoveNearbyObjects:withReason:"];
LABEL_11:
  }
  AnalyticsSendEventLazy();
}

- (void)didUpdateNearbyObjects:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  uint64_t v17 = sub_1002E65C8;
  uint64_t v18 = &unk_100846588;
  uint64_t v19 = self;
  id v5 = v4;
  id v20 = v5;
  [(NISession *)self _performBlockOnDelegateQueue:&v15 ifRespondsToSelector:"session:didUpdateNearbyObjects:"];
  self->_updatedNearbyObjects = 1;
  -[NISession _osLogNearbyObjectUpdate:](self, "_osLogNearbyObjectUpdate:", v5, v15, v16, v17, v18, v19);
  id v6 = [v5 firstObject];
  unsigned int v7 = [v6 resetARSession];

  if (v7)
  {
    id v8 = [(NISessionVisionContext *)self->_visionContext arSession];

    simd_float4 v9 = [(NISessionVisionContext *)self->_visionContext arSession];
    id v10 = [v9 state];

    if (+[NIPlatformInfo isInternalBuild])
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67109376;
        BOOL v22 = v8 != 0;
        __int16 v23 = 1024;
        BOOL v24 = v10 == (id)1;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: reset ARSession (Exists: %d. Running: %d)", buf, 0xEu);
      }
    }
    if (v8 && v10 == (id)1)
    {
      int v12 = [(NISessionVisionContext *)self->_visionContext arSession];
      __int16 v13 = [(NISessionVisionContext *)self->_visionContext arSession];
      id v14 = [v13 configuration];
      [v12 runWithConfiguration:v14 options:15];
    }
  }
}

- (void)uwbSessionDidFailWithError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_10042D49C();
  }
  [(NISession *)self _invalidateSessionAndNotifyError:v4];
}

- (void)uwbSessionDidInvalidateWithError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_10042D504();
  }
  [(NISession *)self _invalidateSessionAndNotifyError:v4];
}

- (void)uwbSessionInterruptedWithReason:(int64_t)a3 timestamp:(double)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild])
  {
    unsigned int v7 = self->_log;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = [(NISession *)self internalState] - 1;
      if (v8 > 7) {
        CFStringRef v9 = @"Activating";
      }
      else {
        CFStringRef v9 = off_10085F9D0[v8];
      }
      id v10 = sub_10030432C(a3);
      *(_DWORD *)long long buf = 138478339;
      CFStringRef v27 = v9;
      __int16 v28 = 2113;
      id v29 = v10;
      __int16 v30 = 2048;
      double v31 = a4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "DelegateProxy: suspension reason started. State: %{private}@. Reason: %{private}@. Timestamp: %f", buf, 0x20u);
    }
  }
  begin = (unint64_t *)self->_interruptions.__begin_;
  p_interruptions = &self->_interruptions;
  if (begin == (unint64_t *)self->_interruptions.__end_)
  {
    __int16 v13 = &stru_100869B68;
    end = self->_interruptions.__begin_;
  }
  else
  {
    sub_10030432C(*begin);
    __int16 v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    end = self->_interruptions.__end_;
  }
  value = self->_interruptions.__end_cap_.__value_;
  if (end >= value)
  {
    uint64_t v17 = p_interruptions->__begin_;
    uint64_t v18 = (end - p_interruptions->__begin_) >> 4;
    unint64_t v19 = v18 + 1;
    if ((unint64_t)(v18 + 1) >> 60) {
      sub_1000267C4();
    }
    uint64_t v20 = value - v17;
    if (v20 >> 3 > v19) {
      unint64_t v19 = v20 >> 3;
    }
    if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v21 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v21 = v19;
    }
    if (v21)
    {
      BOOL v22 = (char *)sub_10015344C((uint64_t)&self->_interruptions.__end_cap_, v21);
      uint64_t v17 = self->_interruptions.__begin_;
      end = self->_interruptions.__end_;
    }
    else
    {
      BOOL v22 = 0;
    }
    __int16 v23 = &v22[16 * v18];
    BOOL v24 = (UWBSessionInterruptionBookkeeping *)&v22[16 * v21];
    *(void *)__int16 v23 = a3;
    *((double *)v23 + 1) = a4;
    uint64_t v16 = (UWBSessionInterruptionBookkeeping *)(v23 + 16);
    if (end != v17)
    {
      do
      {
        *((_OWORD *)v23 - 1) = *((_OWORD *)end - 1);
        v23 -= 16;
        end = (UWBSessionInterruptionBookkeeping *)((char *)end - 16);
      }
      while (end != v17);
      uint64_t v17 = p_interruptions->__begin_;
    }
    self->_interruptions.__begin_ = (UWBSessionInterruptionBookkeeping *)v23;
    self->_interruptions.__end_ = v16;
    self->_interruptions.__end_cap_.__value_ = v24;
    if (v17) {
      operator delete(v17);
    }
  }
  else
  {
    *(void *)end = a3;
    *((double *)end + 1) = a4;
    uint64_t v16 = (UWBSessionInterruptionBookkeeping *)((char *)end + 16);
  }
  self->_interruptions.__end_ = v16;
  uint64_t v25 = v13;
  AnalyticsSendEventLazy();
  [(NISession *)self _interruptSessionWithInternalReason:a3 cachedInterruption:0];
}

- (void)uwbSessionInterruptionReasonEnded:(int64_t)a3 timestamp:(double)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild])
  {
    unsigned int v7 = self->_log;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = [(NISession *)self internalState] - 1;
      if (v8 > 7) {
        CFStringRef v9 = @"Activating";
      }
      else {
        CFStringRef v9 = off_10085F9D0[v8];
      }
      id v10 = sub_10030432C(a3);
      *(_DWORD *)long long buf = 138478339;
      uint64_t v26 = (void *)v9;
      __int16 v27 = 2113;
      __int16 v28 = v10;
      __int16 v29 = 2048;
      double v30 = a4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "DelegateProxy: suspension reason ended. State: %{private}@. Reason: %{private}@. Timestamp: %f", buf, 0x20u);
    }
  }
  begin = self->_interruptions.__begin_;
  end = self->_interruptions.__end_;
  if (begin == end)
  {
LABEL_12:
    if (+[NIPlatformInfo isInternalBuild])
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        sub_10042D56C();
      }
    }
  }
  else
  {
    uint64_t v13 = 0;
    while (*(void *)((char *)begin + v13) != a3)
    {
      v13 += 16;
      if ((UWBSessionInterruptionBookkeeping *)((char *)begin + v13) == end) {
        goto LABEL_12;
      }
    }
    id v14 = (char *)begin + v13;
    uint64_t v15 = *(void *)((char *)begin + v13 + 8);
    uint64_t v16 = (UWBSessionInterruptionBookkeeping *)((char *)begin + v13 + 16);
    int64_t v17 = end - v16;
    if (end != v16)
    {
      memmove((char *)begin + v13, v16, end - v16);
      begin = self->_interruptions.__begin_;
    }
    self->_interruptions.__end_ = (UWBSessionInterruptionBookkeeping *)&v14[v17];
    v24[5] = _NSConcreteStackBlock;
    v24[6] = 3221225472;
    v24[7] = sub_1002E6F08;
    v24[8] = &unk_100846828;
    BOOL v18 = begin == (UWBSessionInterruptionBookkeeping *)&v14[v17];
    v24[9] = a3;
    *(double *)&v24[10] = a4;
    v24[11] = v15;
    AnalyticsSendEventLazy();
    if (v18)
    {
      [(NISession *)self setInternalState:5];
      if (+[NIPlatformInfo isInternalBuild])
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          internalID = self->_internalID;
          *(_DWORD *)long long buf = 138412290;
          uint64_t v26 = internalID;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Delegate: notify suspension ended [%@]", buf, 0xCu);
        }
      }
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1002E7010;
      v24[3] = &unk_1008473B0;
      uint8_t v24[4] = self;
      [(NISession *)self _performBlockOnDelegateQueue:v24 ifRespondsToSelector:"sessionSuspensionEnded:"];
    }
    if ((unint64_t)(a3 - 1) > 6) {
      uint64_t v21 = 0;
    }
    else {
      uint64_t v21 = qword_1004BF3E0[a3 - 1];
    }
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1002E7078;
    v22[3] = &unk_10085CFA0;
    v22[4] = self;
    v22[5] = v21;
    BOOL v23 = v18;
    [(NISession *)self _performBlockOnDelegateQueue:v22 ifRespondsToSelector:"session:suspensionReasonEnded:isNoLongerSuspended:"];
  }
}

- (void)didUpdateLocalDiscoveryToken:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138477827;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: updated token %{private}@", buf, 0xCu);
    }
  }
  objc_storeStrong((id *)&self->_discoveryToken, a3);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_discoveryTokenSemaphore);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002E723C;
  v7[3] = &unk_1008473B0;
  v7[4] = self;
  [(NISession *)self _performBlockOnDelegateQueue:v7 ifRespondsToSelector:"sessionDidUpdateDiscoveryToken:"];
}

- (void)didReceiveRangingAuthRecommendation:(BOOL)a3 forObject:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002E7380;
  v8[3] = &unk_100856158;
  v8[4] = self;
  BOOL v10 = a3;
  id v7 = v6;
  id v9 = v7;
  [(NISession *)self _performBlockOnDelegateQueue:v8 ifRespondsToSelector:"session:didReceiveRangingAuthRecommendation:forObject:"];
}

- (void)didDiscoverNearbyObject:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138477827;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: discovered object: %{private}@", buf, 0xCu);
    }
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002E754C;
  v7[3] = &unk_100846588;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [(NISession *)self _performBlockOnDelegateQueue:v7 ifRespondsToSelector:"session:didDiscoverNearbyObject:"];
}

- (void)object:(id)a3 didUpdateRegion:(id)a4 previousRegion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138478339;
      id v20 = v9;
      __int16 v21 = 2113;
      id v22 = v10;
      __int16 v23 = 2113;
      id v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: updated region %{private}@ (previous: %{private}@). Object: %{private}@", buf, 0x20u);
    }
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002E7798;
  v15[3] = &unk_1008565C8;
  void v15[4] = self;
  id v12 = v8;
  id v16 = v12;
  id v13 = v9;
  id v17 = v13;
  id v14 = v10;
  id v18 = v14;
  [(NISession *)self _performBlockOnDelegateQueue:v15 ifRespondsToSelector:"session:object:didUpdateRegion:previousRegion:"];
}

- (void)didUpdateMotionState:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_motionState = a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002E789C;
  v5[3] = &unk_100855ED8;
  v5[4] = self;
  v5[5] = a3;
  [(NISession *)self _performBlockOnDelegateQueue:v5 ifRespondsToSelector:"session:didUpdateLocalMotionState:"];
}

- (void)didUpdateHomeDeviceUWBRangingAvailability:(BOOL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002E799C;
  v5[3] = &unk_10085F608;
  v5[4] = self;
  BOOL v6 = a3;
  [(NISession *)self _performBlockOnDelegateQueue:v5 ifRespondsToSelector:"session:didUpdateHomeDeviceUWBRangingAvailability:"];
}

- (void)relayDCKMessage:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002E7AC8;
  v4[3] = &unk_100846588;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(NISession *)v5 _performBlockOnDelegateQueue:v4 ifRespondsToSelector:"session:relayDCKMessage:"];
}

- (void)didUpdateHealthStatus:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1002E7BA8;
  v3[3] = &unk_100855ED8;
  v3[4] = self;
  v3[5] = a3;
  [(NISession *)self _performBlockOnDelegateQueue:v3 ifRespondsToSelector:"session:didUpdateHealthStatus:"];
}

- (void)didProcessAcwgM1MsgWithResponse:(id)a3 error:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002E7D08;
  v7[3] = &unk_100855EB0;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(NISession *)v8 _performBlockOnDelegateQueue:v7 ifRespondsToSelector:"session:didProcessAcwgM1MsgWithResponse:error:"];
}

- (void)didProcessAcwgM3MsgWithResponse:(id)a3 error:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002E7E6C;
  v7[3] = &unk_100855EB0;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(NISession *)v8 _performBlockOnDelegateQueue:v7 ifRespondsToSelector:"session:didProcessAcwgM3MsgWithResponse:error:"];
}

- (void)didProcessAcwgRangingSessionResumeRequestMsgWithResponse:(id)a3 error:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002E7FD0;
  v7[3] = &unk_100855EB0;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(NISession *)v8 _performBlockOnDelegateQueue:v7 ifRespondsToSelector:"session:didProcessAcwgRangingSessionResumeRequestMsgWithResponse:error:"];
}

- (void)requestAcwgRangingSessionSuspend:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002E80B8;
  v4[3] = &unk_100857C10;
  unsigned int v5 = a3;
  void v4[4] = self;
  v4[5] = a4;
  [(NISession *)self _performBlockOnDelegateQueue:v4 ifRespondsToSelector:"session:requestAcwgRangingSessionSuspend:withSuspendTriggerReason:"];
}

- (void)didStartAcwgRanging:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1002E819C;
  v3[3] = &unk_100855ED8;
  v3[4] = self;
  v3[5] = a3;
  [(NISession *)self _performBlockOnDelegateQueue:v3 ifRespondsToSelector:"session:didStartAcwgRanging:"];
}

- (void)didSuspendAcwgRanging:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1002E827C;
  v3[3] = &unk_100855ED8;
  v3[4] = self;
  v3[5] = a3;
  [(NISession *)self _performBlockOnDelegateQueue:v3 ifRespondsToSelector:"session:didSuspendAcwgRanging:"];
}

- (void)didPrefetchAcwgUrsk:(unsigned int)a3 error:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002E83AC;
  v5[3] = &unk_10085B8F8;
  unsigned int v8 = a3;
  id v6 = self;
  id v7 = a4;
  id v4 = v7;
  [(NISession *)v6 _performBlockOnDelegateQueue:v5 ifRespondsToSelector:"session:didPrefetchAcwgUrsk:error:"];
}

- (void)didGenerateShareableConfigurationData:(id)a3 forObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138478083;
      id v15 = v6;
      __int16 v16 = 2113;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: generated shareable config: %{private}@. Object: %{private}@", buf, 0x16u);
    }
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002E85B4;
  v11[3] = &unk_100855EB0;
  v11[4] = self;
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [(NISession *)self _performBlockOnDelegateQueue:v11 ifRespondsToSelector:"session:didGenerateShareableConfigurationData:forObject:"];
}

- (void)systemDidUpdateState:(id)a3
{
  id v4 = a3;
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138477827;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: system updated state: %{private}@", buf, 0xCu);
    }
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002E8778;
  v7[3] = &unk_100846588;
  void v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [(NISession *)self _performBlockOnDelegateQueue:v7 ifRespondsToSelector:"systemConfigurator:didUpdateState:"];
}

- (void)systemDidUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationTypeWithName:(id)a4
{
  BOOL v4 = a3;
  id v6 = (NSString *)a4;
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67174915;
      BOOL v12 = v4;
      __int16 v13 = 2113;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: system updated resource usage limit exceeded: %{private}d. Configuration type: %{private}@", buf, 0x12u);
    }
  }
  Class v8 = NSClassFromString(v6);
  if (v8)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    void v9[2] = sub_1002E893C;
    v9[3] = &unk_1008585D8;
    BOOL v10 = v4;
    v9[4] = self;
    v9[5] = v8;
    [(NISession *)self _performBlockOnDelegateQueue:v9 ifRespondsToSelector:"systemConfigurator:didUpdateResourceUsageLimitExceeded:forSessionConfigurationType:"];
  }
}

- (void)didUpdateAlgorithmState:(id)a3 forObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 convergence];
  id v9 = objc_opt_new();
  if ([v6 insufficientSignalStrength]) {
    [v9 addObject:@"insufficientSignalStrength"];
  }
  if ([v6 insufficientHorizontalSweep]) {
    [v9 addObject:@"insufficientHorizontalSweep"];
  }
  if ([v6 insufficientVerticalSweep]) {
    [v9 addObject:@"insufficientVerticalSweep"];
  }
  if ([v6 insufficientMovement]) {
    [v9 addObject:@"insufficientMovement"];
  }
  if ([v6 insufficientLighting]) {
    [v9 addObject:@"insufficientLighting"];
  }
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109635;
      int v23 = (int)v8;
      __int16 v24 = 2113;
      id v25 = v7;
      __int16 v26 = 2113;
      __int16 v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: algorithm convergence status: %d. Object: %{private}@. Reasons: %{private}@", buf, 0x1Cu);
    }
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1002E8CC4;
  v18[3] = &unk_10085F630;
  v18[4] = self;
  id v21 = v8;
  id v11 = v9;
  id v19 = v11;
  id v12 = v7;
  id v20 = v12;
  [(NISession *)self _performBlockOnDelegateQueue:v18 ifRespondsToSelector:"session:didUpdateAlgorithmConvergence:forObject:"];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002E8D70;
  v15[3] = &unk_100855EB0;
  void v15[4] = self;
  id v13 = v6;
  id v16 = v13;
  id v14 = v12;
  id v17 = v14;
  [(NISession *)self _performBlockOnDelegateQueue:v15 ifRespondsToSelector:"session:didUpdateAlgorithmState:forObject:"];
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002E8E74;
  v8[3] = &unk_100846588;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)queue, v8);
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002E8F18;
  v8[3] = &unk_100846588;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)queue, v8);
}

- (void)sessionWasInterrupted:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E8F98;
  block[3] = &unk_1008473B0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)sessionInterruptionEnded:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E9014;
  block[3] = &unk_1008473B0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002E9090;
  v5[3] = &unk_100855ED8;
  void v5[4] = self;
  void v5[5] = a4;
  dispatch_async((dispatch_queue_t)queue, v5);
}

- (void)session:(id)a3 willRunWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E9164;
  block[3] = &unk_100855EB0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)sessionShouldAttemptRelocalization:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (!v6)
  {
    id v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2, self, @"NISession.mm", 1439, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E9278;
  block[3] = &unk_10085F658;
  block[4] = self;
  id v11 = v6;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_handleARSessionDidUpdateFrame:(id)a3
{
  id v26 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NISession *)self internalState] == 3)
  {
    [(NISessionVisionContext *)self->_visionContext setLatestARFrame:v26];
    BOOL v4 = [v26 camera];
    int64_t v5 = -[NISession niVisionInputTrackingStateFromARTRackingState:](self, "niVisionInputTrackingStateFromARTRackingState:", [v4 trackingState]);

    id v6 = [v26 worldTrackingState];

    if (v6)
    {
      id v7 = [v26 worldTrackingState];
      id v6 = [v7 majorRelocalization];

      id v8 = [v26 worldTrackingState];
      id v9 = [v8 minorRelocalization];
    }
    else
    {
      id v9 = 0;
    }
    id v10 = [NIVisionInput alloc];
    [v26 timestamp];
    double v12 = v11;
    id v13 = [v26 camera];
    [v13 transform];
    double v24 = v15;
    double v25 = v14;
    double v22 = v17;
    double v23 = v16;
    id v18 = [v26 lightEstimate];
    [(NISession *)self lightEstimateFromARLightEstimate:v18];
    id v20 = -[NIVisionInput initWithTimestamp:devicePose:trackingState:lightEstimate:majorRelocalization:minorRelocalization:](v10, "initWithTimestamp:devicePose:trackingState:lightEstimate:majorRelocalization:minorRelocalization:", v5, v6, v9, v12, v25, v24, v23, v22, v19);

    id v21 = [(NISession *)self _remoteObject];
    [v21 processVisionInput:v20];
  }
}

- (void)_handleARSessionDidFailWithError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_10042D5A0();
  }
  int64_t v5 = [(NISession *)self _remoteObject];
  [v5 arSessionDidFailWithError:v4];
}

- (void)_handleARSessionWasInterrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "ARSession: interrupted", v5, 2u);
    }
  }
  id v4 = [(NISession *)self _remoteObject];
  [v4 arSessionWasInterrupted];
}

- (void)_handleARSessionInterruptionEnded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "ARSession: interruption ended", v5, 2u);
    }
  }
  id v4 = [(NISession *)self _remoteObject];
  [v4 arSessionInterruptionEnded];
}

- (void)_handleARSessionDidChangeState:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = a3;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "ARSession: changed state: %d", (uint8_t *)v6, 8u);
    }
  }
  [(NISessionVisionContext *)self->_visionContext setArSessionState:a3];
}

- (void)_handleARSession:(id)a3 willRunWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (![(NISession *)self _isValidARSession:v6 andConfiguration:v7])
  {
    if (+[NIPlatformInfo isInternalBuild]
      && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_10042D608();
    }
    id v8 = [(NISession *)self _remoteObject];
    [v8 arSessionWillRunWithInvalidConfiguration];
  }
}

- (void)_configureAndRunInternalARSession
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(NISessionVisionContext *)self->_visionContext arSession];

  unsigned int v4 = [(NIConfiguration *)self->_currentConfiguration _internalIsCameraAssistanceInClientProcess];
  unsigned int v5 = +[NIPlatformInfo isInternalBuild];
  if (!v3)
  {
    if (v4)
    {
      if (v5)
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Created new internal ARSession in client process", buf, 2u);
        }
      }
      id v9 = objc_alloc_init((Class)ARSession);
      [(NISession *)self _setARSessionInternal:v9];

      queue = self->_queue;
      double v11 = [(NISessionVisionContext *)self->_visionContext arSession];
      [v11 setDelegateQueue:queue];

      uint64_t v7 = 1;
      [(NISessionVisionContext *)self->_visionContext setCameraAssistanceEnabled:1];
      [(NISessionVisionContext *)self->_visionContext setArSessionInternal:1];
    }
    else
    {
      if (v5)
      {
        id v13 = self->_log;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Internal ARSession will be created in server process", buf, 2u);
        }
      }
      [(NISessionVisionContext *)self->_visionContext setCameraAssistanceEnabled:1];
      [(NISessionVisionContext *)self->_visionContext setArSessionInternal:1];
      uint64_t v7 = 0;
    }
    goto LABEL_20;
  }
  if (v4)
  {
    if (v5)
    {
      id v6 = self->_log;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Using external ARSession", buf, 2u);
      }
    }
    uint64_t v7 = 1;
LABEL_20:
    [(NISessionVisionContext *)self->_visionContext setArSessionInClientProcess:v7];
    if ([(NISessionVisionContext *)self->_visionContext isARSessionInternal]
      && [(NISessionVisionContext *)self->_visionContext isARSessionInClientProcess]
      && ([(NISessionVisionContext *)self->_visionContext arSessionState] & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      if (+[NIPlatformInfo isInternalBuild])
      {
        double v14 = self->_log;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Run internal ARSession", buf, 2u);
        }
      }
      id v15 = objc_alloc_init((Class)ARWorldTrackingConfiguration);
      double v16 = [(NISessionVisionContext *)self->_visionContext arSession];
      [v16 runWithConfiguration:v15 options:1];
    }
    return;
  }
  if (v5 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
    sub_10042D670();
  }
  double v12 = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E9BB0;
  block[3] = &unk_1008473B0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)v12, block);
}

- (BOOL)_isValidARSession:(id)a3 andConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v6)
  {
    if (+[NIPlatformInfo isInternalBuild])
    {
      log = self->_log;
      BOOL v12 = 0;
      if (!os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      *(_WORD *)long long buf = 0;
      id v15 = "_isValidARSession returning NO: session is nil";
LABEL_32:
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
    }
LABEL_33:
    BOOL v12 = 0;
    goto LABEL_34;
  }
  visionContext = self->_visionContext;
  if (!visionContext
    || ![(NISessionVisionContext *)visionContext isARSessionInClientProcess])
  {
    __assert_rtn("-[NISession _isValidARSession:andConfiguration:]", "NISession.mm", 1573, "_visionContext && _visionContext.isARSessionInClientProcess");
  }
  if ([(NISessionVisionContext *)self->_visionContext isARSessionInternal])
  {
    id v9 = [(NISessionVisionContext *)self->_visionContext arSession];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1002EA198;
    v25[3] = &unk_10085F680;
    uint8_t v25[4] = self;
    [(NISession *)self sessionShouldAttemptRelocalization:v9 completion:v25];

    goto LABEL_6;
  }
  double v16 = [v6 delegate];
  if (!v16)
  {
    if (!+[NIPlatformInfo isInternalBuild]) {
      goto LABEL_28;
    }
    double v17 = self->_log;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    *(_WORD *)long long buf = 0;
    id v18 = "_isValidARSession returning NO: session.delegate is nil";
    goto LABEL_27;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || [v16 sessionShouldAttemptRelocalization:v6])
  {
    if (!+[NIPlatformInfo isInternalBuild]) {
      goto LABEL_28;
    }
    double v17 = self->_log;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    *(_WORD *)long long buf = 0;
    id v18 = "_isValidARSession returning NO: attempting relocalization is not disabled";
LABEL_27:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
LABEL_28:

    goto LABEL_33;
  }
  if (+[NIPlatformInfo isInternalBuild])
  {
    id v20 = self->_log;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v21 = [v16 sessionShouldAttemptRelocalization:v6];
      double v22 = "NO";
      if (v21) {
        double v22 = "YES";
      }
      *(_DWORD *)long long buf = 136315138;
      __int16 v27 = v22;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "_isValidARSession got %s from sessionShouldAttemptRelocalization", buf, 0xCu);
    }
  }
LABEL_6:
  if (!v7)
  {
    if (+[NIPlatformInfo isInternalBuild])
    {
      log = self->_log;
      BOOL v12 = 0;
      if (!os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      *(_WORD *)long long buf = 0;
      id v15 = "_isValidARSession returning NO: configuration is nil";
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v7;
    if ([v10 worldAlignment])
    {
      if (+[NIPlatformInfo isInternalBuild])
      {
        double v11 = self->_log;
        BOOL v12 = 0;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          id v13 = "_isValidARSession returning NO: world alignment is not gravity";
LABEL_50:
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
          goto LABEL_51;
        }
        goto LABEL_52;
      }
    }
    else
    {
      double v23 = [v10 initialWorldMap];
      BOOL v24 = v23 == 0;

      if (v24)
      {
        if (![v10 isCollaborationEnabled])
        {
          BOOL v12 = 1;
          goto LABEL_52;
        }
        if (!+[NIPlatformInfo isInternalBuild]) {
          goto LABEL_51;
        }
        double v11 = self->_log;
        BOOL v12 = 0;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          id v13 = "_isValidARSession returning NO: collaboration is not disabled";
          goto LABEL_50;
        }
        goto LABEL_52;
      }
      if (+[NIPlatformInfo isInternalBuild])
      {
        double v11 = self->_log;
        BOOL v12 = 0;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          id v13 = "_isValidARSession returning NO: initial world map is non-nil";
          goto LABEL_50;
        }
LABEL_52:

        goto LABEL_34;
      }
    }
LABEL_51:
    BOOL v12 = 0;
    goto LABEL_52;
  }
  if (!+[NIPlatformInfo isInternalBuild]) {
    goto LABEL_33;
  }
  log = self->_log;
  BOOL v12 = 0;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    id v15 = "_isValidARSession returning NO: configuration is not ARWorldTrackingConfiguration";
    goto LABEL_32;
  }
LABEL_34:

  return v12;
}

- (void)_pauseInternalARSessionIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NISessionVisionContext *)self->_visionContext isARSessionInternal]
    && [(NISessionVisionContext *)self->_visionContext isARSessionInClientProcess])
  {
    id v3 = [(NISessionVisionContext *)self->_visionContext arSession];
    [v3 pause];
  }
}

- (void)_invalidateInternalARSessionIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NISessionVisionContext *)self->_visionContext isARSessionInternal]
    && [(NISessionVisionContext *)self->_visionContext isARSessionInClientProcess])
  {
    id v3 = [(NISessionVisionContext *)self->_visionContext arSession];
    [v3 pause];

    unsigned int v4 = [(NISessionVisionContext *)self->_visionContext arSession];
    [v4 _removeObserver:self];

    visionContext = self->_visionContext;
    self->_visionContext = 0;
  }
}

- (int64_t)niVisionInputTrackingStateFromARTRackingState:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (double)lightEstimateFromARLightEstimate:(id)a3
{
  id v3 = a3;
  unsigned int v4 = v3;
  if (v3)
  {
    [v3 ambientIntensity];
    double v6 = v5;
  }
  else
  {
    double v6 = *(double *)&NIARLightEstimateNotAvailable;
  }

  return v6;
}

- (void)_invalidateSessionAndNotifyError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NISession *)self _notifyDidInvalidateWithError:v4];
  [(NISession *)self _invalidateInternal];
}

- (void)_interruptSessionWithInternalReason:(int64_t)a3 cachedInterruption:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NISession *)self internalState] != 6 || v4)
  {
    [(NISession *)self setInternalState:6];
    if (+[NIPlatformInfo isInternalBuild])
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        internalID = self->_internalID;
        *(_DWORD *)long long buf = 138412290;
        id v13 = internalID;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Delegate: notify suspension started [%@]", buf, 0xCu);
      }
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1002EA628;
    v11[3] = &unk_1008473B0;
    v11[4] = self;
    [(NISession *)self _performBlockOnDelegateQueue:v11 ifRespondsToSelector:"sessionWasSuspended:"];
  }
  if ((unint64_t)(a3 - 1) > 6) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = qword_1004BF3E0[a3 - 1];
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_1002EA690;
  v10[3] = &unk_100855ED8;
  void v10[4] = self;
  v10[5] = v9;
  [(NISession *)self _performBlockOnDelegateQueue:v10 ifRespondsToSelector:"session:suspendedWithReason:"];
}

- (void)_reinterruptSessionWithCachedInterruption
{
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      int v6 = 138412290;
      id v7 = internalID;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Reinterrupting session [%@]", (uint8_t *)&v6, 0xCu);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  begin = self->_interruptions.__begin_;
  if (begin == self->_interruptions.__end_)
  {
    if (+[NIPlatformInfo isInternalBuild])
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        sub_10042D6A4();
      }
    }
  }
  else
  {
    [(NISession *)self _interruptSessionWithInternalReason:*(void *)begin cachedInterruption:1];
  }
}

- (void)_invalidateInternal
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unsigned int v3 = [(NISession *)self internalState];
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      if (v3 - 1 > 7) {
        CFStringRef v6 = @"Activating";
      }
      else {
        CFStringRef v6 = off_10085F9D0[v3 - 1];
      }
      int v9 = 138412546;
      id v10 = internalID;
      __int16 v11 = 2112;
      CFStringRef v12 = v6;
      id v7 = log;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "invalidateInternal [%@]. State: %@.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (v3 <= 6)
  {
    [(NISession *)self _logDurationAndSubmit:self->_updatedNearbyObjects];
    [(NISession *)self setInternalState:7];
    [(NIServerConnection *)self->_connection invalidate];
    currentConfiguration = self->_currentConfiguration;
    self->_currentConfiguration = 0;

    [(NISession *)self _invalidateInternalARSessionIfNeeded];
  }
}

- (void)_handleActivationError:(id)a3
{
  id v4 = a3;
  if (+[NIPlatformInfo isInternalBuild])
  {
    double v5 = self->_log;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      unsigned int v7 = [(NISession *)self internalState] - 1;
      if (v7 > 7) {
        CFStringRef v8 = @"Activating";
      }
      else {
        CFStringRef v8 = off_10085F9D0[v7];
      }
      int v9 = 138412802;
      id v10 = internalID;
      __int16 v11 = 2112;
      CFStringRef v12 = v8;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Activation error [%@]. State: %@. Error: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NISession *)self _invalidateSessionAndNotifyError:v4];
}

- (void)_handleActivationSuccess:(id)a3
{
  id v4 = a3;
  if (+[NIPlatformInfo isInternalBuild])
  {
    double v5 = self->_log;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      unsigned int v7 = [(NISession *)self internalState] - 1;
      if (v7 > 7) {
        CFStringRef v8 = @"Activating";
      }
      else {
        CFStringRef v8 = off_10085F9D0[v7];
      }
      int v9 = 138412802;
      id v10 = internalID;
      __int16 v11 = 2112;
      CFStringRef v12 = v8;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Activation success [%@]. State: %@. Response: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (![(NISession *)self internalState]) {
    [(NISession *)self setInternalState:1];
  }
  if (!v4) {
    __assert_rtn("-[NISession _handleActivationSuccess:]", "NISession.mm", 1772, "activationResponse != nil");
  }
  [(NISession *)self setActivationResponse:v4];
}

- (void)_handleRunSessionError:(id)a3
{
  id v4 = a3;
  if (+[NIPlatformInfo isInternalBuild])
  {
    double v5 = self->_log;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      unsigned int v7 = [(NISession *)self internalState] - 1;
      if (v7 > 7) {
        CFStringRef v8 = @"Activating";
      }
      else {
        CFStringRef v8 = off_10085F9D0[v7];
      }
      int v9 = 138412802;
      id v10 = internalID;
      __int16 v11 = 2112;
      CFStringRef v12 = v8;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Run session error [%@]. State: %@. Error: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NISession *)self _invalidateSessionAndNotifyError:v4];
}

- (void)_handleRunSessionSuccess
{
  if (+[NIPlatformInfo isInternalBuild])
  {
    unsigned int v3 = self->_log;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      unsigned int v5 = [(NISession *)self internalState] - 1;
      if (v5 > 7) {
        CFStringRef v6 = @"Activating";
      }
      else {
        CFStringRef v6 = off_10085F9D0[v5];
      }
      *(_DWORD *)long long buf = 138412546;
      int v9 = internalID;
      __int16 v10 = 2112;
      CFStringRef v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Run session succeeded [%@]. State: %@", buf, 0x16u);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NISession *)self internalState] == 2)
  {
    [(NISession *)self setInternalState:3];
    if ([(NIConfiguration *)self->_currentConfiguration _internalIsCameraAssistanceEnabled])
    {
      [(NISession *)self _configureAndRunInternalARSession];
    }
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002EAF00;
    v7[3] = &unk_1008473B0;
    void v7[4] = self;
    [(NISession *)self _performBlockOnDelegateQueue:v7 ifRespondsToSelector:"sessionDidStartRunning:"];
  }
}

- (void)_handlePauseSessionError:(id)a3
{
  id v4 = a3;
  if (+[NIPlatformInfo isInternalBuild])
  {
    unsigned int v5 = self->_log;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      unsigned int v7 = [(NISession *)self internalState] - 1;
      if (v7 > 7) {
        CFStringRef v8 = @"Activating";
      }
      else {
        CFStringRef v8 = off_10085F9D0[v7];
      }
      int v9 = 138412802;
      __int16 v10 = internalID;
      __int16 v11 = 2112;
      CFStringRef v12 = v8;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Pause session error [%@]. State: %@. Error: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NISession *)self _invalidateSessionAndNotifyError:v4];
}

- (void)_handlePauseSessionSuccess
{
  if (+[NIPlatformInfo isInternalBuild])
  {
    unsigned int v3 = self->_log;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      unsigned int v5 = [(NISession *)self internalState] - 1;
      if (v5 > 7) {
        CFStringRef v6 = @"Activating";
      }
      else {
        CFStringRef v6 = off_10085F9D0[v5];
      }
      int v7 = 138412546;
      CFStringRef v8 = internalID;
      __int16 v9 = 2112;
      CFStringRef v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Pause session success [%@]. State: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NISession *)self internalState] == 4)
  {
    [(NISession *)self setInternalState:5];
    [(NISession *)self _logDurationAndSubmit:0];
  }
}

- (void)_performBlockOnDelegateQueue:(id)a3 ifRespondsToSelector:(SEL)a4
{
}

- (void)_performBlockOnDelegateQueue:(id)a3 ifRespondsToSelector:(SEL)a4 evenIfNotRunning:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  __int16 v9 = v8;
  unsigned __int8 v10 = atomic_load((unsigned __int8 *)&self->_readyForCallbacks);
  if ((v10 & 1) != 0 || v5)
  {
    dispatch_block_t block = v8;
    if (a4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {

        goto LABEL_10;
      }
      delegateQueue = self->_delegateQueue;

      __int16 v9 = block;
      if (!delegateQueue) {
        goto LABEL_11;
      }
      __int16 v13 = self->_delegateQueue;
    }
    else
    {
      __int16 v13 = self->_delegateQueue;
      if (!v13) {
        goto LABEL_11;
      }
    }
    dispatch_async((dispatch_queue_t)v13, block);
LABEL_10:
    __int16 v9 = block;
  }
LABEL_11:
}

- (id)_verifyError:(id)a3
{
  id v4 = a3;
  id v5 = [v4 code];
  if ((unint64_t)v5 + 5889 < 8)
  {
    id v6 = [v4 code];
    int v7 = [v4 userInfo];
    uint64_t v8 = sub_1001DB2B8((uint64_t)v6, v7);
LABEL_5:
    __int16 v9 = (void *)v8;

    goto LABEL_6;
  }
  if ((unint64_t)v5 + 10017 < 2)
  {
    int v7 = [v4 userInfo];
    uint64_t v8 = sub_1001DB2B8(-5887, v7);
    goto LABEL_5;
  }
  if (+[NIPlatformInfo isInternalBuild])
  {
    __int16 v11 = self->_log;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v12 = +[NSString stringWithFormat:@"Invalid error code blocked from being sent to NISessionDelegate.  Error: %@", v4];
      sub_10042D6D8(v12, buf, (os_log_t)v11);
    }
  }
  __int16 v9 = sub_1001DB2B8(-5887, 0);
LABEL_6:

  return v9;
}

- (void)_notifyDidInvalidateWithError:(id)a3
{
  id v4 = a3;
  if ([(NISession *)self _isInternalClient])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(NISession *)self _verifyError:v4];
  }
  id v6 = v5;
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_10042D730();
  }
  [(NISession *)self setInvalidationError:v6];
  uint64_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  unsigned __int8 v10 = sub_1002EB5A8;
  __int16 v11 = &unk_100846588;
  CFStringRef v12 = self;
  id v7 = v6;
  id v13 = v7;
  [(NISession *)self _performBlockOnDelegateQueue:&v8 ifRespondsToSelector:"session:didInvalidateWithError:"];
  -[NISession _submitErrorMetric:](self, "_submitErrorMetric:", v4, v8, v9, v10, v11, v12);
}

- (id)_getSessionFailureError
{
  NSErrorUserInfoKey v5 = NSLocalizedFailureReasonErrorKey;
  CFStringRef v6 = @"This session object is invalidated. Dispose of it and create a new one instead.";
  BOOL v2 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  unsigned int v3 = sub_1001DB2B8(-5887, v2);

  return v3;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (dispatch_queue_t)delegateQueue
{
  return (dispatch_queue_t)self->_delegateQueue;
}

- (int)internalState
{
  return self->_internalState;
}

- (void)setInternalState:(int)a3
{
  self->_internalState = a3;
}

- (NSError)invalidationError
{
  return (NSError *)objc_getProperty(self, a2, 272, 1);
}

- (void)setInvalidationError:(id)a3
{
}

- (NSDictionary)activationResponse
{
  return (NSDictionary *)objc_getProperty(self, a2, 280, 1);
}

- (void)setActivationResponse:(id)a3
{
}

- (NIInternalSessionDelegate)internalDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);

  return (NIInternalSessionDelegate *)WeakRetained;
}

- (void)setInternalDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_internalDelegate);
  objc_storeStrong((id *)&self->_activationResponse, 0);
  objc_storeStrong((id *)&self->_invalidationError, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastObjectUpdateLogTime, 0);
  objc_storeStrong((id *)&self->_visionContext, 0);
  objc_storeStrong((id *)&self->_systemEventNotifier, 0);
  objc_storeStrong((id *)&self->_findingNotifier, 0);
  objc_storeStrong((id *)&self->_devicePresenceNotifier, 0);
  objc_storeStrong((id *)&self->_acwgEventNotifier, 0);
  objc_storeStrong((id *)&self->_carKeyEventNotifier, 0);
  objc_storeStrong((id *)&self->_discoveryToken, 0);
  objc_storeStrong((id *)&self->_log, 0);
  begin = self->_interruptions.__begin_;
  if (begin)
  {
    self->_interruptions.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_discoveryTokenSemaphore, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_exportedObjectForwarder, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_internalID, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 26) = 0;
  *((void *)self + 27) = 0;
  BOOL v2 = &NINearbyObjectDistanceNotAvailable;
  float32x4_t v3 = vld1q_dup_f32(v2);
  *((float32x4_t *)self + 14) = v3;
  v3.f32[0] = NINearbyObjectAngleNotAvailable;
  *((float *)self + 60) = NINearbyObjectAngleNotAvailable;
  *((_DWORD *)self + 61) = v3.i32[0];
  return self;
}

+ (NIInternalDeviceCapability)internalDeviceCapabilities
{
  BOOL v2 = +[NISession cachedPlatformCapabilities];

  if (!v2) {
    +[NISession _queryAndCacheCapabilities];
  }
  float32x4_t v3 = +[NISession cachedPlatformCapabilities];
  id v4 = [v3 objectForKey:@"UWBSupportedPlatform"];
  id v5 = [v4 BOOLValue];

  CFStringRef v6 = +[NISession cachedPlatformCapabilities];
  id v7 = [v6 objectForKey:@"WifiSupportedPlatform"];
  id v8 = [v7 BOOLValue];

  uint64_t v9 = +[NISession cachedPlatformCapabilities];
  unsigned __int8 v10 = [v9 objectForKey:@"UWBSupportedPlatformPDOA"];
  id v11 = [v10 BOOLValue];

  CFStringRef v12 = +[NISession cachedPlatformCapabilities];
  id v13 = [v12 objectForKey:@"UWBSupportedPlatformSyntheticAperture"];
  id v14 = [v13 BOOLValue];

  id v15 = +[NISession cachedPlatformCapabilities];
  double v16 = [v15 objectForKey:@"UWBSupportedPlatformExtendedDistance"];
  id v17 = [v16 BOOLValue];

  id v18 = [[NIDeviceCapabilities alloc] initWithFineRangingSupport:v5 coarseRangingSupport:v8 aoaSupport:v11 extendedDistanceMeasurementSupport:v17 syntheticApertureSupport:v14];

  return (NIInternalDeviceCapability *)v18;
}

- (void)_addObject:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"NISession.mm", 1982, @"Invalid parameter not satisfying: %@", @"discoveryToken" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002EC0B4;
  block[3] = &unk_100846588;
  block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)_removeObject:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"NISession.mm", 1996, @"Invalid parameter not satisfying: %@", @"discoveryToken" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002EC38C;
  block[3] = &unk_100846588;
  block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)_addRegionPredicate:(id)a3
{
  id v5 = +[NSAssertionHandler currentHandler];
  [v5 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2010 description:@"_addRegionPredicate is deprecated"];
}

- (void)_removeRegionPredicate:(id)a3
{
  id v5 = +[NSAssertionHandler currentHandler];
  [v5 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2014 description:@"_removeRegionPredicate is deprecated"];
}

+ (id)observerSession
{
  id v2 = [[NISession alloc] _initAndConnectToServerWithOptions:1];

  return v2;
}

- (BOOL)isPreciseRangingAllowed
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002EC754;
  v5[3] = &unk_10085F6D0;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isExtendedDistanceMeasurementAllowed
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002EC920;
  v5[3] = &unk_10085F6D0;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)processBluetoothHostTimeSyncWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4 eventCounter:(unint64_t)a5
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_1002ECAB8;
  v6[3] = &unk_10085F720;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_sync((dispatch_queue_t)queue, v6);
}

- (void)processDCKMessage:(id)a3 responseCallback:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  char v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2, self, @"NISession.mm", 2182, @"Invalid parameter not satisfying: %@", @"dckMessage" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  double v16 = +[NSAssertionHandler currentHandler];
  [v16 handleFailureInMethod:a2, self, @"NISession.mm", 2183, @"Invalid parameter not satisfying: %@", @"responseCallback" object file lineNumber description];

LABEL_3:
  if ([v7 length])
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002EDE04;
    block[3] = &unk_10085F858;
    block[4] = self;
    id v18 = v7;
    id v19 = v9;
    id v11 = v9;
    dispatch_sync((dispatch_queue_t)queue, block);

    CFStringRef v12 = v18;
  }
  else
  {
    delegateQueue = self->_delegateQueue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1002EDD00;
    v20[3] = &unk_100856F48;
    unsigned int v21 = v9;
    id v14 = v9;
    dispatch_async((dispatch_queue_t)delegateQueue, v20);
    CFStringRef v12 = v21;
  }
}

- (void)processBluetoothEventWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4 eventCounter:(unint64_t)a5
{
}

- (void)processBluetoothEventWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4
{
}

- (id)deleteURSKs
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = sub_1002E3508;
  id v10 = sub_1002E3518;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002EE0C4;
  v5[3] = &unk_10085F6D0;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_setDebugURSK:(id)a3 transactionIdentifier:(unsigned int)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000;
    id v19 = sub_1002E3508;
    id v20 = sub_1002E3518;
    id v21 = 0;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002EE354;
    block[3] = &unk_10085F880;
    block[4] = self;
    unsigned int v15 = a4;
    id v13 = v6;
    id v14 = &v16;
    dispatch_sync((dispatch_queue_t)queue, block);
    id v9 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
    CFStringRef v23 = @"Given nil URSK.";
    id v10 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v9 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-19886 userInfo:v10];
  }

  return v9;
}

- (BOOL)isRangingLimitExceeded
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002EE4B4;
  v5[3] = &unk_10085F6D0;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NICarKeyEventNotifier)carKeyEventNotifier
{
  carKeyEventNotifier = self->_carKeyEventNotifier;
  if (!carKeyEventNotifier)
  {
    id v4 = [[NICarKeyEventNotifier alloc] initWithParentSession:self];
    id v5 = self->_carKeyEventNotifier;
    self->_carKeyEventNotifier = v4;

    carKeyEventNotifier = self->_carKeyEventNotifier;
  }

  return carKeyEventNotifier;
}

- (id)_setURSKTTL:(unint64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1002E3508;
  id v11 = sub_1002E3518;
  id v12 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002EE724;
  block[3] = &unk_10085F8A8;
  void block[5] = &v7;
  void block[6] = a3;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (NIAcwgEventNotifier)acwgEventNotifier
{
  acwgEventNotifier = self->_acwgEventNotifier;
  if (!acwgEventNotifier)
  {
    id v4 = [[NIAcwgEventNotifier alloc] initWithParentSession:self];
    id v5 = self->_acwgEventNotifier;
    self->_acwgEventNotifier = v4;

    acwgEventNotifier = self->_acwgEventNotifier;
  }

  return acwgEventNotifier;
}

- (void)processAcwgM1Msg:(id)a3 withSessionTriggerReason:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2, self, @"NISession.mm", 2355, @"Invalid parameter not satisfying: %@", @"m1Msg" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002EEB44;
  block[3] = &unk_10085B6E0;
  block[4] = self;
  id v12 = v7;
  int64_t v13 = a4;
  id v9 = v7;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)processAcwgM3Msg:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"NISession.mm", 2365, @"Invalid parameter not satisfying: %@", @"m3Msg" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002EECB0;
  block[3] = &unk_100846588;
  block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)suspendAcwgRanging:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002EED90;
  block[3] = &unk_100857C10;
  unsigned int v6 = a3;
  block[4] = self;
  void block[5] = a4;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)processAcwgRangingSessionResumeRequestMsg:(unsigned int)a3 withResumeTriggerReason:(int64_t)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002EEE74;
  block[3] = &unk_100857C10;
  unsigned int v6 = a3;
  block[4] = self;
  void block[5] = a4;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)prefetchAcwgUrsk:(unsigned int)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002EEF58;
  v4[3] = &unk_100857CC8;
  void v4[4] = self;
  unsigned int v5 = a3;
  dispatch_sync((dispatch_queue_t)queue, v4);
}

- (void)_processUpdatedLockState:(unsigned __int16)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002EF038;
  v4[3] = &unk_10085F8D0;
  void v4[4] = self;
  unsigned __int16 v5 = a3;
  dispatch_sync((dispatch_queue_t)queue, v4);
}

- (void)updateResponderDeviceIdentifier:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  if (v10)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"NISession.mm", 2410, @"Invalid parameter not satisfying: %@", @"deviceIdentifier" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v9 = +[NSAssertionHandler currentHandler];
  [v9 handleFailureInMethod:a2, self, @"NISession.mm", 2411, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  v7[2](v7, 1, 0);
}

- (void)processVisionInput:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002EF274;
  v7[3] = &unk_100846588;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (NIDevicePresenceNotifier)devicePresenceNotifier
{
  devicePresenceNotifier = self->_devicePresenceNotifier;
  if (!devicePresenceNotifier)
  {
    id v4 = [[NIDevicePresenceNotifier alloc] initWithParentSession:self];
    unsigned __int16 v5 = self->_devicePresenceNotifier;
    self->_devicePresenceNotifier = v4;

    devicePresenceNotifier = self->_devicePresenceNotifier;
  }

  return devicePresenceNotifier;
}

+ (id)generateBluetoothDeviceTokenWithPublicAddress:(id)a3 IRK:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    int64_t v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"NISession.mm", 2471, @"Invalid parameter not satisfying: %@", @"IRK" object file lineNumber description];
  }
  if ([v8 length] != (id)16)
  {
    id v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"NISession.mm", 2472, @"Invalid parameter not satisfying: %@", @"[IRK length] == NIDiscoveryTokenIRKLengthBytes" object file lineNumber description];
  }
  v16[0] = &off_1008789E8;
  v16[1] = &off_100878A00;
  v17[0] = v8;
  v17[1] = v7;
  id v9 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  Data = (void *)OPACKEncoderCreateData();
  if (!Data)
  {
    unsigned int v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"NISession.mm", 2478, @"Invalid parameter not satisfying: %@", @"tokenData" object file lineNumber description];
  }
  id v11 = [[NIDiscoveryToken alloc] initWithBytes:Data];

  return v11;
}

+ (id)generateFindingDiscoveryToken
{
  id v2 = NSRandomData();
  char v3 = +[NIDiscoveryToken generateFindingTokenWithIRK:v2];

  return v3;
}

+ (id)generateFindingDiscoveryTokenWithSharedSecret:(id)a3
{
  id v3 = a3;
  if ([v3 length] == (id)16)
  {
    id v4 = +[NIDiscoveryToken generateFindingTokenWithIRK:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)generateFindingDiscoveryTokenWithIdentityResolvingKey:(id)a3
{
  id v3 = +[NISession generateFindingDiscoveryTokenWithSharedSecret:a3];

  return v3;
}

- (NIFindingNotifier)findingNotifier
{
  findingNotifier = self->_findingNotifier;
  if (!findingNotifier)
  {
    id v4 = [[NIFindingNotifier alloc] initWithParentSession:self];
    unsigned __int16 v5 = self->_findingNotifier;
    self->_findingNotifier = v4;

    findingNotifier = self->_findingNotifier;
  }

  return findingNotifier;
}

- (void)_provideTruthTag:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002F0B88;
  v7[3] = &unk_100846588;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (NISystemEventNotifier)systemEventNotifier
{
  systemEventNotifier = self->_systemEventNotifier;
  if (!systemEventNotifier)
  {
    id v4 = [[NISystemEventNotifier alloc] initWithParentSession:self];
    unsigned __int16 v5 = self->_systemEventNotifier;
    self->_systemEventNotifier = v4;

    systemEventNotifier = self->_systemEventNotifier;
  }

  return systemEventNotifier;
}

@end