@interface _NFHardwareManager
+ (id)sharedHardwareManager;
- (BOOL)_syncResumeSession:(id)a3;
- (BOOL)_syncResumeSession:(id)a3 field:(id)a4;
- (BOOL)configureECPPolling:(id)a3;
- (BOOL)configureExpressFelicaEntry:(int)a3;
- (BOOL)hasSession;
- (BOOL)isFirstInQueue;
- (BOOL)isRecoveryInProgress;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)refreshSecureElementInfo;
- (BOOL)restartDiscovery;
- (BOOL)userInitiatedShutdown;
- (NFDriverWrapper)driverWrapper;
- (NFHardwareControllerInfo)controllerInfo;
- (NFRoutingConfig)lastKnownRoutingConfig;
- (NFSecureElementWrapper)secureElementWrapper;
- (NFXPCEventPublisher)sesdEventPublisher;
- (OS_dispatch_queue)xpcEventNotificationQueue;
- (_NFHardwareManager)init;
- (id)_updateAllPowerCounters;
- (id)combineFlashWriteCounters:(id)a3 with:(id)a4 overflow:(BOOL)a5;
- (id)defaultRoutingConfig:(unint64_t)a3;
- (id)openStackAndUpdateAllWriteCounters:(id *)a3;
- (id)powerCycleSE:(id)a3;
- (id)secureElementDidExitRestrictedMode:(id)a3 os:(int64_t)a4;
- (id)setHostEmulationEnabled:(BOOL)a3;
- (id)setRoutingConfig:(id)a3;
- (id)softResetSE:(id)a3;
- (id)switchToSession:(id)a3 withToken:(id)a4;
- (id)triggerHammerfestRecoveryAt:(id)a3;
- (id)updateAllPowerCounters;
- (int64_t)nfcRadioEnabled:(id *)a3 showUIPopup:(BOOL)a4;
- (uint64_t)getPrimaryHardwareState;
- (void)_sync_getFlashWriteCountersForConnection:(id)a3 completion:(id)a4;
- (void)_sync_getPowerCountersForConnection:(id)a3 completion:(id)a4;
- (void)actOnUserInitiatedSystemShutDown:(unsigned int)a3 completion:(id)a4;
- (void)areFeaturesSupported:(unint64_t)a3 completion:(id)a4;
- (void)areSessionsAllowedWithCompletion:(id)a3;
- (void)cachedEmbeddedSecureElementSerialNumber:(id)a3;
- (void)cancelSinglePollExpressModeAssertionWithCompletion:(id)a3;
- (void)checkExpressPassCompatibility:(id)a3 callback:(id)a4;
- (void)checkExpressPassCompatibilityDeprecated:(id)a3 callback:(id)a4;
- (void)clientAppIsSuspended:(id)a3;
- (void)configureHeadlessFactoryMode:(BOOL)a3 completion:(id)a4;
- (void)configureReaderModeRFForTransitPartner:(BOOL)a3 transitPartner:(unsigned int)a4 completion:(id)a5;
- (void)controllerInfoWithCompletion:(id)a3;
- (void)currentInMetroStatus:(id)a3;
- (void)dealloc;
- (void)dequeueSession:(id)a3;
- (void)didCameraStateChange:(BOOL)a3;
- (void)disableHeadlessMiniNVWithCompletion:(id)a3;
- (void)disableLPEMFeature:(unint64_t)a3 completion:(id)a4;
- (void)dumpLPMDebugLogWithCompletion:(id)a3;
- (void)enableHeadlessTestMode:(unsigned __int16)a3 completion:(id)a4;
- (void)enableLPEMFeature:(unint64_t)a3 completion:(id)a4;
- (void)enablePowerCountersLogging:(BOOL)a3;
- (void)enableRadio:(BOOL)a3 completion:(id)a4;
- (void)expressModesInfoWithOption:(unsigned int)a3 completion:(id)a4;
- (void)furyDelegateRegistered:(id)a3;
- (void)getDieIDWithCompletion:(id)a3;
- (void)getFlashWriteCountersWithCompletion:(id)a3;
- (void)getHostCardEmulationLogWithCompletion:(id)a3;
- (void)getLPEMFTALoggingWithCompletion:(id)a3;
- (void)getPowerCountersWithCompletion:(id)a3;
- (void)getReaderProhibitTimer:(id)a3;
- (void)getTemperatureWithCompletion:(id)a3;
- (void)getUniqueFDRKeyWithCompletion:(id)a3;
- (void)handleAppletInactivityTimeout:(id)a3 atlData:(id)a4 caData:(id)a5;
- (void)handleEMVCOCollisionDetected;
- (void)handleEraseCounterExceeded;
- (void)handleExpressModeExited;
- (void)handleExpressModeStarted;
- (void)handleExpressModeTimeout;
- (void)handleFailForwardCompleted;
- (void)handleFelicaStateEvent:(id)a3 appletAID:(id)a4;
- (void)handleFieldChanged:(BOOL)a3;
- (void)handleFieldNotification:(id)a3;
- (void)handleFieldReset;
- (void)handleFilteredFieldNotification:(id)a3;
- (void)handleForceExpressModeEndEvent;
- (void)handleHWRecoveryCompletion:(BOOL)a3;
- (void)handleHWRecoveryStarted;
- (void)handleHardwareReset:(const char *)a3;
- (void)handleHceTargetLost;
- (void)handleHostCardReaderDetected:(id)a3;
- (void)handleReaderBurnoutCleared;
- (void)handleReaderBurnoutTimer;
- (void)handleReaderModeProhibitTimerEvent:(unint64_t)a3;
- (void)handleRemoteTagsDetected:(id)a3 dropAndRestartDiscovery:(BOOL)a4;
- (void)handleRequestService:(id)a3 inExpress:(BOOL)a4;
- (void)handleRestartDiscovery;
- (void)handleSecureElementEndOfOperation;
- (void)handleSecureElementEnteredRestrictedMode:(int)a3 os:(int64_t)a4;
- (void)handleSecureElementEnteredRestrictedModeExit:(int)a3 os:(int64_t)a4;
- (void)handleSecureElementOSReset:(int64_t)a3 withReason:(unsigned int)a4;
- (void)handleSecureElementReaderModeEnded:(id)a3;
- (void)handleSecureElementReaderModeStarted:(id)a3;
- (void)handleSecureElementRemoved:(int)a3 withReason:(unsigned int)a4;
- (void)handleSecureElementTransactionData:(id)a3 appletIdentifier:(id)a4;
- (void)handleSelectEvent:(id)a3;
- (void)handleStackLoad;
- (void)handleStackUnload;
- (void)handleStepUpEvent:(id)a3 forApplet:(id)a4;
- (void)handleTemperatureChange:(double)a3;
- (void)handleTimerExpiredEvent:(id)a3;
- (void)handleTransactionEndEvent:(id)a3 atlData:(id)a4 caData:(id)a5;
- (void)handleTransactionStartEvent:(id)a3 atlData:(id)a4 caData:(id)a5;
- (void)headlessFactoryModeWithCompletion:(id)a3;
- (void)isCardSessionEligibleWithCompletion:(id)a3;
- (void)isHWSupportedWithCompletion:(id)a3;
- (void)logLPCDFalseDetects:(int)a3;
- (void)managedConfigChanged:(BOOL)a3;
- (void)markApplicationForDelete:(id)a3;
- (void)maybeStartNextSession;
- (void)notifyReaderModeActivityEnd;
- (void)notifyReaderModeActivityStart;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)openSinglePollExpressModeAssertion:(double)a3 completion:(id)a4;
- (void)postEventForPublisher:(id)a3 event:(const char *)a4 objectString:(id)a5;
- (void)powerObserverSystemHasPoweredOn:(id)a3;
- (void)powerObserverSystemWillSleep:(id)a3;
- (void)preWarmWithCompletion:(id)a3;
- (void)preferencesDidChange;
- (void)prioritizeSession:(id)a3;
- (void)pushSignedRF:(id)a3 completion:(id)a4;
- (void)queueCardFieldDetectSession:(id)a3 completion:(id)a4;
- (void)queueCardSession:(id)a3 sessionConfig:(id)a4 completion:(id)a5;
- (void)queueContactlessPaymentSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5;
- (void)queueContactlessSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5;
- (void)queueCredentialSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5;
- (void)queueECommercePaymentSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5;
- (void)queueFieldDetectSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5;
- (void)queueHostEmulationSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5;
- (void)queueLPEMConfigSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5;
- (void)queueLoyaltyAndPaymentSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5;
- (void)queueNdefTagSession:(id)a3 sessionAttribute:(id)a4 data:(id)a5 completion:(id)a6;
- (void)queuePeerPaymentSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5;
- (void)queueReaderSession:(id)a3 sessionConfig:(id)a4 completion:(id)a5;
- (void)queueReaderSessionInternal:(id)a3 sessionAttribute:(id)a4 completion:(id)a5;
- (void)queueSecureElementAndHostEmulationSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5;
- (void)queueSecureElementLoggingSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5;
- (void)queueSecureElementManagerSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5;
- (void)queueSecureElementReaderSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5;
- (void)queueSecureTransactionServicesHybridSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5;
- (void)queueSecureTransactionServicesSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5;
- (void)queueSeshatSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5;
- (void)queueSession:(id)a3;
- (void)queueTrustSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5;
- (void)queueUnifiedAccessSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5;
- (void)radioEnableStateWithCompletion:(id)a3;
- (void)reconfigureDynamicTransitRF:(unint64_t)a3 withOverride:(BOOL)a4;
- (void)registerForCallbacks:(id)a3;
- (void)releaseAssertion:(id)a3 completion:(id)a4;
- (void)releaseSuppressPresentmentAssertion:(id)a3 completion:(id)a4;
- (void)requestAssertion:(unint64_t)a3 completion:(id)a4;
- (void)requestSuppressPresentmentWithCompletion:(id)a3;
- (void)rfSettingsWithCompletion:(id)a3;
- (void)secureElementReturnedRestrictedMode:(id)a3 os:(int64_t)a4;
- (void)secureElementsWithCompletion:(id)a3;
- (void)setAntiRelayRID:(id)a3 completion:(id)a4;
- (void)setChipscope:(BOOL)a3 completion:(id)a4;
- (void)setFieldDetectEnabled:(BOOL)a3 completion:(id)a4;
- (void)start;
- (void)stateInfoWithCompletion:(id)a3;
- (void)stop;
- (void)stopFury;
- (void)toggleGPIO:(unsigned __int16)a3 completion:(id)a4;
- (void)triggerCrash:(unsigned __int16)a3 completion:(id)a4;
- (void)triggerDelayedWake:(unsigned __int8)a3 completion:(id)a4;
- (void)unregisterForCallbacks:(id)a3;
- (void)updateBackgroundTagReading:(unsigned int)a3 completion:(id)a4;
- (void)updateSeInfo:(id)a3;
- (void)waitForHWSupportedWithCompletion:(id)a3;
@end

@implementation _NFHardwareManager

- (void)requestAssertion:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = +[NSXPCConnection currentConnection];
  workQueue = self->_workQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000B9B0;
  v11[3] = &unk_100301D60;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  unint64_t v14 = a3;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(workQueue, v11);
}

- (void)secureElementsWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100009858;
  v7[3] = &unk_100302390;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)controllerInfoWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000096C4;
  v7[3] = &unk_100302390;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)cachedEmbeddedSecureElementSerialNumber:(id)a3
{
  v5 = (void (**)(id, id, void))a3;
  if (self && (seSerialFromFDR = self->_seSerialFromFDR) != 0)
  {
    id v7 = [(NSData *)seSerialFromFDR NF_asHexString];
    v5[2](v5, v7, 0);
  }
  else
  {
    id v16 = 0;
    BOOL v8 = sub_100029FA4((uint64_t)NFDriverWrapper, &v16);
    id v7 = v16;
    if (v8)
    {
      v5[2](v5, v7, 0);
    }
    else
    {
      id v9 = objc_alloc((Class)NSError);
      id v10 = +[NSString stringWithUTF8String:"nfcd"];
      v17[0] = NSLocalizedDescriptionKey;
      v11 = +[NSString stringWithUTF8String:"Not found"];
      v18[0] = v11;
      v18[1] = &off_10031B8B0;
      v17[1] = @"Line";
      v17[2] = @"Method";
      id v12 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v18[2] = v12;
      v17[3] = NSDebugDescriptionErrorKey;
      id v13 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 3250];
      v18[3] = v13;
      unint64_t v14 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
      id v15 = [v9 initWithDomain:v10 code:65 userInfo:v14];
      ((void (**)(id, id, id))v5)[2](v5, v7, v15);
    }
  }
}

- (void)handleTemperatureChange:(double)a3
{
  workQueue = self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000A814;
  v4[3] = &unk_100301C40;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(workQueue, v4);
}

- (void)handleFieldChanged:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    sub_10000292C(self);
  }
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
    v7(6, "%c[%{public}s %{public}s]:%i fieldPresent=%d", v10, ClassName, Name, 6742, v3);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v42 = v13;
    *(_WORD *)&v42[4] = 2082;
    *(void *)&v42[6] = object_getClassName(self);
    __int16 v43 = 2082;
    v44 = sel_getName(a2);
    __int16 v45 = 1024;
    int v46 = 6742;
    __int16 v47 = 1024;
    BOOL v48 = v3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i fieldPresent=%d", buf, 0x28u);
  }

  uint64_t v14 = sub_10000C050();
  id v15 = (void *)v14;
  if (v3) {
    sub_1000019DC(v14);
  }
  else {
    sub_10000427C(v14);
  }

  kdebug_trace();
  id v16 = NFSharedSignpostLog();
  if (os_signpost_enabled(v16))
  {
    CFStringRef v17 = @"OFF";
    if (v3) {
      CFStringRef v17 = @"ON";
    }
    *(_DWORD *)buf = 138412290;
    *(void *)v42 = v17;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FIELD_CHANGE_NOTIF", "field %@", buf, 0xCu);
  }

  if (!v3)
  {
    v19 = "com.apple.stockholm.field.off";
    goto LABEL_24;
  }
  driverWrapper = self->_driverWrapper;
  if (!driverWrapper || (driverWrapper->_flags & 0x400) == 0)
  {
    v19 = "com.apple.stockholm.field.on";
LABEL_24:
    sub_100003C44(self, v19);
    v20 = NFSharedSignpostLog();
    if (os_signpost_enabled(v20))
    {
      v21 = "OFF";
      if (v3) {
        v21 = "ON";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)v42 = v21;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FIELD_DETECT_NOTIFICATION", "field %s", buf, 0xCu);
    }

    if (!v3) {
      sub_10000BAF0((uint64_t)self);
    }
    if (objc_opt_respondsToSelector()) {
      [(_NFSession *)self->_currentSecureElementSession handleFieldChanged:v3];
    }
    char v22 = sub_100003110((uint64_t)self);
    fieldDetectManager = self->_fieldDetectManager;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100120B08;
    v38[3] = &unk_1003048F8;
    char v39 = v22;
    v38[4] = self;
    v38[5] = a2;
    BOOL v40 = v3;
    [(NFFieldDetectManager *)fieldDetectManager enumerateFieldDetectSessionsUsingBlock:v38];
    return;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v24 = NFLogGetLogger();
  if (v24)
  {
    v25 = (void (*)(uint64_t, const char *, ...))v24;
    v26 = object_getClass(self);
    BOOL v27 = class_isMetaClass(v26);
    v28 = object_getClassName(self);
    v37 = sel_getName(a2);
    uint64_t v29 = 45;
    if (v27) {
      uint64_t v29 = 43;
    }
    v25(4, "%c[%{public}s %{public}s]:%i Ignoring field on event due to ExpressModeDebug setting!", v29, v28, v37, 6755);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v30 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    v31 = object_getClass(self);
    if (class_isMetaClass(v31)) {
      int v32 = 43;
    }
    else {
      int v32 = 45;
    }
    v33 = object_getClassName(self);
    v34 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v42 = v32;
    *(_WORD *)&v42[4] = 2082;
    *(void *)&v42[6] = v33;
    __int16 v43 = 2082;
    v44 = v34;
    __int16 v45 = 1024;
    int v46 = 6755;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Ignoring field on event due to ExpressModeDebug setting!", buf, 0x22u);
  }
}

- (void)handleFieldReset
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000243C;
  block[3] = &unk_100301C68;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)unregisterForCallbacks:(id)a3
{
  id v4 = +[NSXPCConnection currentConnection];
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B958;
  v7[3] = &unk_100301CB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)registerForCallbacks:(id)a3
{
  id v4 = a3;
  v5 = +[NSXPCConnection currentConnection];
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000092D4;
  block[3] = &unk_100304628;
  block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(workQueue, block);
}

- (void)waitForHWSupportedWithCompletion:(id)a3
{
  v5 = (void (**)(id, void))a3;
  id v6 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    if (class_isMetaClass(Class)) {
      uint64_t v10 = 43;
    }
    else {
      uint64_t v10 = 45;
    }
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    int v13 = [v6 NF_userInfo];
    uint64_t v14 = [v13 objectForKeyedSubscript:@"ClientName"];
    v8(6, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 1607, v14);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = object_getClass(self);
    if (class_isMetaClass(v16)) {
      int v17 = 43;
    }
    else {
      int v17 = 45;
    }
    v18 = object_getClassName(self);
    v19 = sel_getName(a2);
    v20 = [v6 NF_userInfo];
    v21 = [v20 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    int v49 = v17;
    __int16 v50 = 2082;
    v51 = v18;
    __int16 v52 = 2082;
    v53 = v19;
    __int16 v54 = 1024;
    int v55 = 1607;
    __int16 v56 = 2114;
    v57 = v21;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  uint64_t v44 = 0;
  __int16 v45 = &v44;
  uint64_t v46 = 0x2020000000;
  int v47 = 0;
  int v47 = -[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self);
  int v22 = *((_DWORD *)v45 + 6);
  if (v22 == 4 || v22 == 2)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v23 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v23)
    {
      uint64_t v24 = object_getClass(self);
      if (class_isMetaClass(v24)) {
        uint64_t v25 = 43;
      }
      else {
        uint64_t v25 = 45;
      }
      v26 = object_getClassName(self);
      BOOL v27 = sel_getName(a2);
      v28 = [v6 NF_userInfo];
      uint64_t v29 = [v28 objectForKeyedSubscript:@"ClientName"];
      v23(6, "%c[%{public}s %{public}s]:%i Processing %{public}@ : Known HW state = %u", v25, v26, v27, 1611, v29, *((unsigned int *)v45 + 6));
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v30 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = object_getClass(self);
      if (class_isMetaClass(v31)) {
        int v32 = 43;
      }
      else {
        int v32 = 45;
      }
      v33 = object_getClassName(self);
      v34 = sel_getName(a2);
      v35 = [v6 NF_userInfo];
      v36 = [v35 objectForKeyedSubscript:@"ClientName"];
      int v37 = *((_DWORD *)v45 + 6);
      *(_DWORD *)buf = 67110402;
      int v49 = v32;
      __int16 v50 = 2082;
      v51 = v33;
      __int16 v52 = 2082;
      v53 = v34;
      __int16 v54 = 1024;
      int v55 = 1611;
      __int16 v56 = 2114;
      v57 = v36;
      __int16 v58 = 1024;
      int v59 = v37;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Processing %{public}@ : Known HW state = %u", buf, 0x32u);
    }
    v5[2](v5, *((unsigned int *)v45 + 6));
  }
  else
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009A24;
    block[3] = &unk_1003044E8;
    v42 = &v44;
    SEL v43 = a2;
    block[4] = self;
    id v40 = v6;
    v41 = v5;
    dispatch_async(workQueue, block);
  }
  _Block_object_dispose(&v44, 8);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = qword_100347738;
  v120 = v6;
  uint64_t v9 = 1;
  if ((id)qword_100347738 == v6) {
    uint64_t v9 = 2;
  }
  uint64_t v118 = v9;
  id v10 = [objc_alloc((Class)NFServiceWhitelistChecker) initWithConnection:v7 coreNFCConnection:qword_100347738 == (void)v6];
  kdebug_trace();
  id v11 = NFSharedSignpostLog();
  if (os_signpost_enabled(v11))
  {
    id v12 = [v10 clientName];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v12;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "XPC_CONNECT", "XPC connection from %@", buf, 0xCu);
  }
  if ((id)v8 != v6 && ([v10 internalAccess] & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(self);
      if (class_isMetaClass(Class)) {
        uint64_t v29 = 43;
      }
      else {
        uint64_t v29 = 45;
      }
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      id v32 = [v7 processIdentifier];
      v33 = [v10 clientName];
      Logger(3, "%c[%{public}s %{public}s]:%i PID %d (%{public}@) missing entitlement: %s", v29, ClassName, Name, 125, v32, v33, "com.apple.nfcd.hwmanager");
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v34 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = object_getClass(self);
      if (class_isMetaClass(v35)) {
        int v36 = 43;
      }
      else {
        int v36 = 45;
      }
      int v37 = object_getClassName(self);
      v38 = sel_getName(a2);
      unsigned int v39 = [v7 processIdentifier];
      id v40 = [v10 clientName];
      *(_DWORD *)buf = 67110658;
      *(_DWORD *)&uint8_t buf[4] = v36;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = v37;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = v38;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = 125;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = v39;
      *(_WORD *)&buf[40] = 2114;
      *(void *)&buf[42] = v40;
      *(_WORD *)&buf[50] = 2080;
      *(void *)&buf[52] = "com.apple.nfcd.hwmanager";
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i PID %d (%{public}@) missing entitlement: %s", buf, 0x3Cu);
    }
    goto LABEL_29;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v13)
  {
    uint64_t v14 = object_getClass(self);
    if (class_isMetaClass(v14)) {
      uint64_t v15 = 43;
    }
    else {
      uint64_t v15 = 45;
    }
    id v16 = object_getClassName(self);
    int v17 = sel_getName(a2);
    v18 = [v10 clientName];
    v13(6, "%c[%{public}s %{public}s]:%i Added connection from %{public}@ : %{public}@", v15, v16, v17, 129, v18, v7);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v19 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = object_getClass(self);
    if (class_isMetaClass(v20)) {
      int v21 = 43;
    }
    else {
      int v21 = 45;
    }
    int v22 = object_getClassName(self);
    v23 = sel_getName(a2);
    uint64_t v24 = [v10 clientName];
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)&uint8_t buf[4] = v21;
    *(_WORD *)&buf[8] = 2082;
    *(void *)&buf[10] = v22;
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = v23;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = 129;
    *(_WORD *)&buf[34] = 2114;
    *(void *)&buf[36] = v24;
    *(_WORD *)&buf[44] = 2114;
    *(void *)&buf[46] = v7;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Added connection from %{public}@ : %{public}@", buf, 0x36u);
  }
  if ((void *)v8 == v120)
  {
    if (v7)
    {
      [v7 auditToken];
      if (!self) {
        goto LABEL_50;
      }
    }
    else
    {
      long long v123 = 0u;
      long long v124 = 0u;
      if (!self)
      {
LABEL_50:
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v57 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v57)
        {
          __int16 v58 = object_getClass(self);
          if (class_isMetaClass(v58)) {
            uint64_t v59 = 43;
          }
          else {
            uint64_t v59 = 45;
          }
          v60 = object_getClassName(self);
          v61 = sel_getName(a2);
          v57(3, "%c[%{public}s %{public}s]:%i Client is not supported by CoreNFC", v59, v60, v61, 138);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v34 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v62 = object_getClass(self);
          if (class_isMetaClass(v62)) {
            int v63 = 43;
          }
          else {
            int v63 = 45;
          }
          v64 = object_getClassName(self);
          v65 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&uint8_t buf[4] = v63;
          *(_WORD *)&buf[8] = 2082;
          *(void *)&buf[10] = v64;
          *(_WORD *)&buf[18] = 2082;
          *(void *)&buf[20] = v65;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = 138;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Client is not supported by CoreNFC", buf, 0x22u);
        }
LABEL_29:
        BOOL v41 = 0;
        goto LABEL_108;
      }
    }
    *(_OWORD *)buf = v123;
    *(_OWORD *)&buf[16] = v124;
    v42 = +[LSBundleRecord bundleRecordForAuditToken:buf error:0];
    SEL v43 = v42;
    if (v42)
    {
      if ([v42 developerType] == 1)
      {
LABEL_96:

        v98 = +[NFCHardwareManagerCallbacks interface];
        [v7 setRemoteObjectInterface:v98];

        v99 = +[NFCHardwareManagerInterface interface];
        [v7 setExportedInterface:v99];

        v26 = [v7 remoteObjectProxy];
        sub_10012B370((uint64_t)self, v26);
        goto LABEL_97;
      }
      if ([v43 developerType] == 3)
      {
        id v44 = objc_alloc((Class)LSApplicationExtensionRecord);
        __int16 v45 = [v43 URL];
        id v125 = 0;
        id v117 = [v44 initWithURL:v45 requireValid:1 error:&v125];
        id v46 = v125;

        if (v117 && !v46)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          int v47 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v47)
          {
            BOOL v48 = object_getClass(self);
            if (class_isMetaClass(v48)) {
              uint64_t v49 = 43;
            }
            else {
              uint64_t v49 = 45;
            }
            __int16 v50 = object_getClassName(self);
            v51 = sel_getName("_isValidClient:");
            v47(6, "%c[%{public}s %{public}s]:%i Client is ExtensionKit extension", v49, v50, v51, 84);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          __int16 v52 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            v53 = object_getClass(self);
            if (class_isMetaClass(v53)) {
              int v54 = 43;
            }
            else {
              int v54 = 45;
            }
            int v55 = object_getClassName(self);
            __int16 v56 = sel_getName("_isValidClient:");
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)&uint8_t buf[4] = v54;
            *(_WORD *)&buf[8] = 2082;
            *(void *)&buf[10] = v55;
            *(_WORD *)&buf[18] = 2082;
            *(void *)&buf[20] = v56;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = 84;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Client is ExtensionKit extension", buf, 0x22u);
          }

          goto LABEL_50;
        }
        if (v46 && [v46 code] != (id)-10814)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v79 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v79)
          {
            v80 = object_getClass(self);
            if (class_isMetaClass(v80)) {
              uint64_t v81 = 43;
            }
            else {
              uint64_t v81 = 45;
            }
            v82 = object_getClassName(self);
            v83 = sel_getName("_isValidClient:");
            v79(3, "%c[%{public}s %{public}s]:%i Record error=%{public}@", v81, v82, v83, 90, v46);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v84 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
          {
            v85 = object_getClass(self);
            if (class_isMetaClass(v85)) {
              int v86 = 43;
            }
            else {
              int v86 = 45;
            }
            v87 = object_getClassName(self);
            v88 = sel_getName("_isValidClient:");
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)&uint8_t buf[4] = v86;
            *(_WORD *)&buf[8] = 2082;
            *(void *)&buf[10] = v87;
            *(_WORD *)&buf[18] = 2082;
            *(void *)&buf[20] = v88;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = 90;
            *(_WORD *)&buf[34] = 2114;
            *(void *)&buf[36] = v46;
            _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Record error=%{public}@", buf, 0x2Cu);
          }
        }
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v89 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v89)
      {
        v90 = object_getClass(self);
        if (class_isMetaClass(v90)) {
          uint64_t v91 = 43;
        }
        else {
          uint64_t v91 = 45;
        }
        v92 = object_getClassName(self);
        v93 = sel_getName("_isValidClient:");
        v89(6, "%c[%{public}s %{public}s]:%i Valid CoreNFC client", v91, v92, v93, 95);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v71 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
LABEL_95:

        goto LABEL_96;
      }
      v94 = object_getClass(self);
      if (class_isMetaClass(v94)) {
        int v95 = 43;
      }
      else {
        int v95 = 45;
      }
      v96 = object_getClassName(self);
      v97 = sel_getName("_isValidClient:");
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&uint8_t buf[4] = v95;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = v96;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = v97;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = 95;
      v76 = "%c[%{public}s %{public}s]:%i Valid CoreNFC client";
      v77 = v71;
      os_log_type_t v78 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v66 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v66)
      {
        v67 = object_getClass(self);
        if (class_isMetaClass(v67)) {
          uint64_t v68 = 43;
        }
        else {
          uint64_t v68 = 45;
        }
        v69 = object_getClassName(self);
        v70 = sel_getName("_isValidClient:");
        v66(3, "%c[%{public}s %{public}s]:%i Non-bundle process", v68, v69, v70, 70);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v71 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
        goto LABEL_95;
      }
      v72 = object_getClass(self);
      if (class_isMetaClass(v72)) {
        int v73 = 43;
      }
      else {
        int v73 = 45;
      }
      v74 = object_getClassName(self);
      v75 = sel_getName("_isValidClient:");
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&uint8_t buf[4] = v73;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = v74;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = v75;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = 70;
      v76 = "%c[%{public}s %{public}s]:%i Non-bundle process";
      v77 = v71;
      os_log_type_t v78 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl((void *)&_mh_execute_header, v77, v78, v76, buf, 0x22u);
    goto LABEL_95;
  }
  uint64_t v25 = sub_10000A1BC();
  [v7 setRemoteObjectInterface:v25];

  v26 = sub_10000A164();
  [v7 setExportedInterface:v26];
LABEL_97:

  [v7 setExportedObject:self];
  v100 = objc_opt_new();
  v34 = +[NSMutableDictionary dictionaryWithObject:v100 forKey:@"ProxyObjects"];

  v101 = +[NSNumber numberWithUnsignedInteger:v118];
  [v34 setObject:v101 forKeyedSubscript:@"serviceType"];

  [v34 setObject:v10 forKey:@"ServiceWhitelist"];
  v102 = [v10 clientName];
  [v34 setObject:v102 forKey:@"ClientName"];

  v103 = sub_10000A214((uint64_t)NFClientAppStateObserver, v7, 0);
  if ([v103 lengthOfBytesUsingEncoding:4]) {
    [v34 setObject:v103 forKey:@"BundleIdentifier"];
  }
  [v7 setUserInfo:v34];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = sub_10000B7C8;
  *(void *)&buf[32] = sub_10002CDD0;
  id v104 = v7;
  *(void *)&buf[40] = v104;
  v122[0] = _NSConcreteStackBlock;
  v122[1] = 3221225472;
  v122[2] = sub_10002CDD8;
  v122[3] = &unk_1003015D8;
  v122[4] = self;
  v122[5] = buf;
  [v104 setInvalidationHandler:v122];
  v121[0] = _NSConcreteStackBlock;
  v121[1] = 3221225472;
  v121[2] = sub_10002CE4C;
  v121[3] = &unk_1003015D8;
  v121[4] = self;
  v121[5] = buf;
  [v104 setInterruptionHandler:v121];
  if (self) {
    id Property = objc_getProperty(self, v105, 240, 1);
  }
  else {
    id Property = 0;
  }
  id v107 = Property;
  [v104 _setQueue:v107];

  if (self) {
    appStateObserver = self->_appStateObserver;
  }
  else {
    appStateObserver = 0;
  }
  v109 = appStateObserver;
  sub_100009CB8((uint64_t)v109, v104);

  [v104 resume];
  if (self) {
    id v111 = objc_getProperty(self, v110, 176, 1);
  }
  else {
    id v111 = 0;
  }
  id v112 = v111;
  objc_sync_enter(v112);
  if (self) {
    id v114 = objc_getProperty(self, v113, 176, 1);
  }
  else {
    id v114 = 0;
  }
  id v115 = v114;
  [v115 addObject:v104];

  objc_sync_exit(v112);
  _Block_object_dispose(buf, 8);

  BOOL v41 = 1;
LABEL_108:

  return v41;
}

- (uint64_t)getPrimaryHardwareState
{
  if (result)
  {
    v1 = (id)result;
    objc_sync_enter(v1);
    uint64_t v2 = v1[35];
    objc_sync_exit(v1);

    if ((unint64_t)(v2 - 1) <= 3) {
      return (v2 + 1);
    }
    else {
      return 1;
    }
  }
  return result;
}

+ (id)sharedHardwareManager
{
  if (qword_100347450 != -1) {
    dispatch_once(&qword_100347450, &stru_1003041B8);
  }
  uint64_t v2 = (void *)qword_100347448;

  return v2;
}

- (_NFHardwareManager)init
{
  v59.receiver = self;
  v59.super_class = (Class)_NFHardwareManager;
  id v3 = [(_NFHardwareManager *)&v59 init];
  if (v3)
  {
    id v4 = +[NSUserDefaults standardUserDefaults];
    *((_WORD *)v3 + 167) = 0;
    *((void *)v3 + 35) = 0;
    *((void *)v3 + 36) = 1;
    uint64_t v5 = objc_opt_new();
    id v6 = (void *)*((void *)v3 + 2);
    *((void *)v3 + 2) = v5;

    uint64_t v7 = NFCreateWorkLoop();
    uint64_t v8 = (void *)*((void *)v3 + 30);
    *((void *)v3 + 30) = v7;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v3 + 30), kNFLOG_DISPATCH_SPECIFIC_KEY, 0, 0);
    uint64_t v9 = NFCreateWorkLoop();
    id v10 = (void *)*((void *)v3 + 29);
    *((void *)v3 + 29) = v9;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v3 + 29), kNFLOG_DISPATCH_SPECIFIC_KEY, 0, 0);
    uint64_t v11 = objc_opt_new();
    id v12 = (void *)*((void *)v3 + 22);
    *((void *)v3 + 22) = v11;

    int v13 = sub_10020E878((id *)[NFDriverWrapper alloc], *((void **)v3 + 29));
    uint64_t v14 = (void *)*((void *)v3 + 46);
    *((void *)v3 + 46) = v13;

    uint64_t v15 = *((void *)v3 + 46);
    if (v15)
    {
      *(void *)(v15 + 248) = v3;
      id v16 = (void *)*((void *)v3 + 46);
    }
    else
    {
      id v16 = 0;
    }
    *((unsigned char *)v3 + 342) = 0;
    id v17 = sub_100219938(v16, (unsigned char *)v3 + 342);
    v18 = [[_NFControllerManager alloc] initWithQueue:*((void *)v3 + 29) driverWrapper:*((void *)v3 + 46)];
    v19 = (void *)*((void *)v3 + 1);
    *((void *)v3 + 1) = v18;

    id v20 = [objc_alloc((Class)NFPowerObserver) initWithDelegate:v3];
    int v21 = (void *)*((void *)v3 + 7);
    *((void *)v3 + 7) = v20;

    int v22 = sub_100052B70([NFClientAppStateObserver alloc], v3);
    v23 = (void *)*((void *)v3 + 9);
    *((void *)v3 + 9) = v22;

    id v24 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v25 = (void *)*((void *)v3 + 20);
    *((void *)v3 + 20) = v24;

    id v26 = objc_alloc_init((Class)NSMutableArray);
    BOOL v27 = (void *)*((void *)v3 + 23);
    *((void *)v3 + 23) = v26;

    id v28 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v29 = (void *)*((void *)v3 + 24);
    *((void *)v3 + 24) = v28;

    *((unsigned char *)v3 + 345) = 0;
    *((unsigned char *)v3 + 351) = 0;
    *((_DWORD *)v3 + 81) = -1;
    objc_storeStrong((id *)v3 + 50, *((id *)v3 + 29));
    id v30 = [objc_alloc((Class)NFXPCEventPublisher) initWithStreamName:@"com.apple.nfcd.homekit.field" queue:*((void *)v3 + 50)];
    v31 = (void *)*((void *)v3 + 13);
    *((void *)v3 + 13) = v30;

    id v32 = [objc_alloc((Class)NFXPCEventPublisher) initWithStreamName:@"com.apple.nfcd.xpc.sesd.events" queue:*((void *)v3 + 50)];
    v33 = (void *)*((void *)v3 + 49);
    *((void *)v3 + 49) = v32;

    int v34 = NFIsInternalBuild();
    if (v34) {
      LOBYTE(v34) = [v4 BOOLForKey:@"DisableFailForward"];
    }
    *((unsigned char *)v3 + 354) = v34;
    objc_initWeak(&location, v3);
    id v35 = objc_alloc((Class)NFTimer);
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_1000E95CC;
    v55[3] = &unk_100301E90;
    objc_copyWeak(v57, &location);
    int v36 = v3;
    id v56 = v36;
    v57[1] = (id)a2;
    id v37 = [v35 initSleepTimerWithCallback:v55 queue:*((void *)v3 + 29)];
    v38 = (void *)v36[16];
    v36[16] = v37;

    id v54 = 0;
    BOOL v39 = sub_100029FA4((uint64_t)NFDriverWrapper, &v54);
    id v40 = v54;
    if (v39)
    {
      uint64_t v41 = +[NSData NF_dataWithHexString:v40];
      v42 = (void *)v36[53];
      v36[53] = v41;

      if (!v36[53])
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger)
        {
          Class = object_getClass(v36);
          if (class_isMetaClass(Class)) {
            uint64_t v45 = 43;
          }
          else {
            uint64_t v45 = 45;
          }
          ClassName = object_getClassName(v36);
          Name = sel_getName(a2);
          Logger(3, "%c[%{public}s %{public}s]:%i Serial from FDR is invalid; %{public}@",
            v45,
            ClassName,
            Name,
            427,
            v40);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        BOOL v48 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          uint64_t v49 = object_getClass(v36);
          if (class_isMetaClass(v49)) {
            int v50 = 43;
          }
          else {
            int v50 = 45;
          }
          v51 = object_getClassName(v36);
          __int16 v52 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          int v61 = v50;
          __int16 v62 = 2082;
          int v63 = v51;
          __int16 v64 = 2082;
          v65 = v52;
          __int16 v66 = 1024;
          int v67 = 427;
          __int16 v68 = 2114;
          id v69 = v40;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Serial from FDR is invalid; %{public}@",
            buf,
            0x2Cu);
        }
      }
    }

    objc_destroyWeak(v57);
    objc_destroyWeak(&location);
  }
  return (_NFHardwareManager *)v3;
}

- (void)dealloc
{
  workQueue = self->_workQueue;
  self->_workQueue = 0;

  driverWrapper = self->_driverWrapper;
  if (driverWrapper) {
    driverWrapper->_delegate = 0;
  }
  sharedWalletPresentationService = self->_sharedWalletPresentationService;
  if (sharedWalletPresentationService) {
    [(NFWalletPresentationService *)sharedWalletPresentationService removeObserver:self forKeyPath:@"walletDomain"];
  }
  v6.receiver = self;
  v6.super_class = (Class)_NFHardwareManager;
  [(_NFHardwareManager *)&v6 dealloc];
}

- (void)start
{
  id v4 = _os_activity_create((void *)&_mh_execute_header, "_NFHardwareManager started", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(void *)state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v4, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
  {
    Class = object_getClass(self);
    if (class_isMetaClass(Class)) {
      uint64_t v7 = 43;
    }
    else {
      uint64_t v7 = 45;
    }
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    Logger(6, "%c[%{public}s %{public}s]:%i Nfcd started", v7, ClassName, Name, 455);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    int v13 = object_getClassName(self);
    uint64_t v14 = sel_getName(a2);
    *(_DWORD *)state = 67109890;
    *(_DWORD *)&state[4] = v12;
    *(_WORD *)&state[8] = 2082;
    *(void *)&state[10] = v13;
    __int16 v25 = 2082;
    id v26 = v14;
    __int16 v27 = 1024;
    int v28 = 455;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Nfcd started", state, 0x22u);
  }

  kdebug_trace();
  uint64_t v15 = NFSharedSignpostLog();
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)state = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HWMANAGER_START", (const char *)&unk_100286819, state, 2u);
  }

  id v16 = self;
  objc_sync_enter(v16);
  if (v16->_isRunning)
  {
    objc_sync_exit(v16);
  }
  else
  {
    id v17 = sub_10002CC88(v16, v16->_xpcConnectionQueue);
    [v17 resume];
    v18 = sub_10002CD2C(v16, v16->_xpcConnectionQueue);
    [v18 resume];

    v16->_isRunning = 1;
    block[6] = _NSConcreteStackBlock;
    block[7] = 3221225472;
    block[8] = sub_1000EA19C;
    block[9] = &unk_1003041E0;
    block[10] = v16;
    v16->_stateCaptureHandle = os_state_add_handler();
    objc_sync_exit(v16);

    v19 = v16->_secureElementSessionQueue;
    objc_sync_enter(v19);
    sub_1000EA4BC(v16, 0);
    objc_sync_exit(v19);

    id v20 = sub_10020A934();
    sub_10020A9C8(v20, v16);

    int v21 = +[NFPowerAssertion sharedPowerAssertion];
    [v21 setEnableDebug:NFIsInternalBuild()];

    workQueue = v16->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000EA94C;
    block[3] = &unk_100301C40;
    block[4] = v16;
    void block[5] = a2;
    dispatch_async(workQueue, block);
  }
}

- (void)stop
{
  id v4 = _os_activity_create((void *)&_mh_execute_header, "_NFHardwareManger stopped", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(void *)state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v4, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
  {
    Class = object_getClass(self);
    if (class_isMetaClass(Class)) {
      uint64_t v7 = 43;
    }
    else {
      uint64_t v7 = 45;
    }
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    Logger(6, "%c[%{public}s %{public}s]:%i Nfcd stopping", v7, ClassName, Name, 580);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    int v13 = object_getClassName(self);
    uint64_t v14 = sel_getName(a2);
    *(_DWORD *)state = 67109890;
    *(_DWORD *)&state[4] = v12;
    *(_WORD *)&state[8] = 2082;
    *(void *)&state[10] = v13;
    __int16 v43 = 2082;
    id v44 = v14;
    __int16 v45 = 1024;
    int v46 = 580;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Nfcd stopping", state, 0x22u);
  }

  uint64_t v15 = NFSharedSignpostLog();
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)state = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HWMANAGER_STOP", (const char *)&unk_100286819, state, 2u);
  }

  id v16 = self;
  objc_sync_enter(v16);
  if (v16->_isRunning)
  {
    v16->_isRunning = 0;
    powerCountersTimer = v16->_powerCountersTimer;
    if (powerCountersTimer) {
      [(NFTimer *)powerCountersTimer stopTimer];
    }
    sub_100201390(v16->_keyBag);
    [(NFPowerObserver *)v16->_powerObserver unregisterForEvents];
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v18)
    {
      v19 = object_getClass(v16);
      if (class_isMetaClass(v19)) {
        uint64_t v20 = 43;
      }
      else {
        uint64_t v20 = 45;
      }
      int v21 = object_getClassName(v16);
      int v22 = sel_getName("_unloadService");
      v18(6, "%c[%{public}s %{public}s]:%i Invalidating XPC", v20, v21, v22, 1500);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = object_getClass(v16);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      id v26 = object_getClassName(v16);
      __int16 v27 = sel_getName("_unloadService");
      *(_DWORD *)state = 67109890;
      *(_DWORD *)&state[4] = v25;
      *(_WORD *)&state[8] = 2082;
      *(void *)&state[10] = v26;
      __int16 v43 = 2082;
      id v44 = v27;
      __int16 v45 = 1024;
      int v46 = 1500;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalidating XPC", state, 0x22u);
    }

    [(id)qword_100347730 invalidate];
    [(id)qword_100347730 setDelegate:0];
    int v28 = (void *)qword_100347730;
    qword_100347730 = 0;

    [(id)qword_100347738 invalidate];
    [(id)qword_100347738 setDelegate:0];
    uint64_t v29 = (void *)qword_100347738;
    qword_100347738 = 0;

    if (v16->_userInitiatedShutdown
      || ![(NFHardwareControllerInfo *)v16->_controllerInfo hasLPEMSupport]
      || ([(_NFHardwareManager *)v16 driverWrapper],
          id v30 = objc_claimAutoreleasedReturnValue(),
          BOOL v31 = sub_1001AA1B4((uint64_t)v30) == 0,
          v30,
          v31))
    {
      sub_100211BA0(v16->_driverWrapper);
    }
    objc_sync_exit(v16);

    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v32 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v32)
    {
      v33 = object_getClass(v16);
      if (class_isMetaClass(v33)) {
        uint64_t v34 = 43;
      }
      else {
        uint64_t v34 = 45;
      }
      id v35 = object_getClassName(v16);
      int v36 = sel_getName(a2);
      v32(6, "%c[%{public}s %{public}s]:%i Nfcd stopped", v34, v35, v36, 621);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    p_super = NFSharedLogGetLogger();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      v38 = object_getClass(v16);
      if (class_isMetaClass(v38)) {
        int v39 = 43;
      }
      else {
        int v39 = 45;
      }
      id v40 = object_getClassName(v16);
      uint64_t v41 = sel_getName(a2);
      *(_DWORD *)state = 67109890;
      *(_DWORD *)&state[4] = v39;
      *(_WORD *)&state[8] = 2082;
      *(void *)&state[10] = v40;
      __int16 v43 = 2082;
      id v44 = v41;
      __int16 v45 = 1024;
      int v46 = 621;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Nfcd stopped", state, 0x22u);
    }
  }
  else
  {
    objc_sync_exit(v16);
    p_super = &v16->super;
  }
}

- (void)managedConfigChanged:(BOOL)a3
{
}

- (BOOL)refreshSecureElementInfo
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  driverWrapper = self->_driverWrapper;
  id v25 = 0;
  int v5 = sub_100029574(driverWrapper, 1, &v25);
  id v6 = v25;
  id v7 = v25;
  if (v5)
  {
    objc_storeStrong((id *)&self->_secureElementInfo, v6);
    secureElementInfo = self->_secureElementInfo;
    uint64_t v9 = +[NSUserDefaults standardUserDefaults];
    id v10 = [v9 arrayForKey:@"BootHistory"];
    [(NFHardwareSecureElementInfo *)secureElementInfo setBootHistory:v10];

    uint64_t v11 = self->_secureElementInfo;
    int v12 = [(NFSecureElementWrapper *)self->_secureElementWrapper handle];
    [v12 setInfo:v11];
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v14 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v18 = 45;
      if (isMetaClass) {
        uint64_t v18 = 43;
      }
      v14(3, "%c[%{public}s %{public}s]:%i Failed to get secure element info", v18, ClassName, Name, 1443);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v19 = object_getClass(self);
      if (class_isMetaClass(v19)) {
        int v20 = 43;
      }
      else {
        int v20 = 45;
      }
      int v21 = object_getClassName(self);
      int v22 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v27 = v20;
      __int16 v28 = 2082;
      uint64_t v29 = v21;
      __int16 v30 = 2082;
      BOOL v31 = v22;
      __int16 v32 = 1024;
      int v33 = 1443;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get secure element info", buf, 0x22u);
    }
  }

  return v5;
}

- (int64_t)nfcRadioEnabled:(id *)a3 showUIPopup:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = self;
  objc_sync_enter(v6);
  int64_t nfcRadioEnabled = v6->_nfcRadioEnabled;
  if (nfcRadioEnabled)
  {
    if (!v4) {
      goto LABEL_19;
    }
  }
  else
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
      Logger(6, "%c[%{public}s %{public}s]:%i _int64_t nfcRadioEnabled = %d", v10, ClassName, Name, 1461, v6->_nfcRadioEnabled);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = object_getClass(v6);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      id v16 = object_getClassName(v6);
      id v17 = sel_getName(a2);
      int64_t v18 = v6->_nfcRadioEnabled;
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)&uint8_t buf[4] = v15;
      *(_WORD *)uint64_t v34 = 2082;
      *(void *)&v34[2] = v16;
      *(_WORD *)&v34[10] = 2082;
      *(void *)&v34[12] = v17;
      *(_WORD *)&v34[20] = 1024;
      *(_DWORD *)&v34[22] = 1461;
      __int16 v35 = 1024;
      int v36 = v18;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i _int64_t nfcRadioEnabled = %d", buf, 0x28u);
    }

    int64_t nfcRadioEnabled = v6->_nfcRadioEnabled;
    if (!v4)
    {
LABEL_19:
      objc_sync_exit(v6);

      if (nfcRadioEnabled == 1) {
        return nfcRadioEnabled;
      }
      goto LABEL_20;
    }
  }
  if (nfcRadioEnabled == 1) {
    goto LABEL_19;
  }
  v19 = v6;
  objc_sync_enter(v19);
  objc_initWeak(&location, v19);
  if (!v19->_radioDisabledNotificationPopup)
  {
    v19->_radioDisabledNotificationPopup = 1;
    int v20 = objc_opt_new();
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)uint64_t v34 = 3221225472;
    *(void *)&v34[8] = sub_1000F310C;
    *(void *)&v34[16] = &unk_1003044C0;
    objc_copyWeak((id *)&v34[24], &location);
    [v20 requestUserSettingsNotificationWithCompletion:buf popupInterval:0.0];

    objc_destroyWeak((id *)&v34[24]);
  }
  objc_destroyWeak(&location);
  objc_sync_exit(v19);

  objc_sync_exit(v19);
LABEL_20:
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v21)
  {
    int v22 = object_getClass(v6);
    if (class_isMetaClass(v22)) {
      uint64_t v23 = 43;
    }
    else {
      uint64_t v23 = 45;
    }
    id v24 = object_getClassName(v6);
    id v25 = sel_getName(a2);
    v21(6, "%c[%{public}s %{public}s]:%i state = %d", v23, v24, v25, 1478, nfcRadioEnabled);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v26 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = object_getClass(v6);
    if (class_isMetaClass(v27)) {
      int v28 = 43;
    }
    else {
      int v28 = 45;
    }
    uint64_t v29 = object_getClassName(v6);
    __int16 v30 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)&uint8_t buf[4] = v28;
    *(_WORD *)uint64_t v34 = 2082;
    *(void *)&v34[2] = v29;
    *(_WORD *)&v34[10] = 2082;
    *(void *)&v34[12] = v30;
    *(_WORD *)&v34[20] = 1024;
    *(_DWORD *)&v34[22] = 1478;
    __int16 v35 = 1024;
    int v36 = nfcRadioEnabled;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i state = %d", buf, 0x28u);
  }

  return nfcRadioEnabled;
}

- (void)isHWSupportedWithCompletion:(id)a3
{
  int v5 = (void (**)(id, uint64_t))a3;
  uint64_t v6 = -[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self);
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    int v12 = +[NSXPCConnection currentConnection];
    int v13 = [v12 NF_userInfo];
    [v13 objectForKeyedSubscript:@"ClientName"];
    uint64_t v14 = v5;
    v16 = int v15 = a2;
    uint64_t v17 = 45;
    if (isMetaClass) {
      uint64_t v17 = 43;
    }
    v8(6, "%c[%{public}s %{public}s]:%i %{public}@ : HW state = %u", v17, ClassName, Name, 1599, v16, v6);

    a2 = v15;
    int v5 = v14;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int64_t v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = object_getClass(self);
    if (class_isMetaClass(v19)) {
      int v20 = 43;
    }
    else {
      int v20 = 45;
    }
    int v21 = object_getClassName(self);
    int v22 = sel_getName(a2);
    uint64_t v23 = +[NSXPCConnection currentConnection];
    id v24 = [v23 NF_userInfo];
    id v25 = [v24 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110402;
    int v28 = v20;
    __int16 v29 = 2082;
    __int16 v30 = v21;
    __int16 v31 = 2082;
    __int16 v32 = v22;
    __int16 v33 = 1024;
    int v34 = 1599;
    __int16 v35 = 2114;
    int v36 = v25;
    __int16 v37 = 1024;
    int v38 = v6;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ : HW state = %u", buf, 0x32u);
  }
  v5[2](v5, v6);
}

- (BOOL)hasSession
{
  id v3 = self->_secureElementSessionQueue;
  objc_sync_enter(v3);
  if (self->_currentSecureElementSession) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(NSMutableArray *)self->_secureElementSessionQueue count] != 0;
  }
  objc_sync_exit(v3);

  return v4;
}

- (void)maybeStartNextSession
{
}

- (id)secureElementDidExitRestrictedMode:(id)a3 os:(int64_t)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 isEqual:self->_secureElementWrapper];
  if (v7) {
    CFStringRef v8 = @"embedded";
  }
  else {
    CFStringRef v8 = 0;
  }
  uint64_t v9 = [(_NFHardwareManager *)self powerCycleSE:v6];
  id v10 = (id)v9;
  if (v7) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    int v12 = +[NFRoutingConfig embeddedWiredMode];
    int v13 = [(_NFHardwareManager *)self setRoutingConfig:v12];

    if (v13)
    {
      id v14 = objc_alloc((Class)NSError);
      int v15 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v56 = NSLocalizedDescriptionKey;
      id v16 = +[NSString stringWithUTF8String:"Stack Error"];
      v57 = v16;
      uint64_t v17 = &v57;
      int64_t v18 = &v56;
    }
    else
    {
      if ([(_NFHardwareManager *)self refreshSecureElementInfo])
      {
        id v19 = sub_10024379C(self->_secureElementWrapper);
        id v10 = 0;
        goto LABEL_15;
      }
      id v14 = objc_alloc((Class)NSError);
      int v15 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v54 = NSLocalizedDescriptionKey;
      id v16 = +[NSString stringWithUTF8String:"Stack Error"];
      int v55 = v16;
      uint64_t v17 = &v55;
      int64_t v18 = &v54;
    }
    int v20 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v18 count:1];
    id v10 = [v14 initWithDomain:v15 code:15 userInfo:v20];
  }
LABEL_15:
  int v21 = sub_10000B134((id *)&self->super.isa);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  int v22 = [v21 allValues];
  id v23 = [v22 countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v42;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v42 != v25) {
          objc_enumerationMutation(v22);
        }
        [*(id *)(*((void *)&v41 + 1) + 8 * i) secureElementWithIdentifier:v8 didChangeRestrictedMode:0];
      }
      id v24 = [v22 countByEnumeratingWithState:&v41 objects:v53 count:16];
    }
    while (v24);
  }

  if (v10)
  {
    self->_restrictedModeBroadcasted = 0;
    int v27 = +[NSString stringWithFormat:@"Failed to exit restricted mode. Returned with error %@", v10];
    sub_1001990A4((uint64_t)NFBugCapture, @"Failed to exit restricted mode", v27, 0);
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      __int16 v29 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v33 = 45;
      if (isMetaClass) {
        uint64_t v33 = 43;
      }
      v29(6, "%c[%{public}s %{public}s]:%i Device exited Restricted Mode and we are posting events", v33, ClassName, Name, 2433);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v34 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v35 = object_getClass(self);
      if (class_isMetaClass(v35)) {
        int v36 = 43;
      }
      else {
        int v36 = 45;
      }
      __int16 v37 = object_getClassName(self);
      int v38 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v46 = v36;
      __int16 v47 = 2082;
      BOOL v48 = v37;
      __int16 v49 = 2082;
      int v50 = v38;
      __int16 v51 = 1024;
      int v52 = 2433;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Device exited Restricted Mode and we are posting events", buf, 0x22u);
    }

    +[NFExceptionsCALogger postAnalyticsSERestrictedModeExited:sub_1000EE260((uint64_t)self)];
    self->_restrictedModeBroadcasted = 0;
  }

  return v10;
}

- (void)postEventForPublisher:(id)a3 event:(const char *)a4 objectString:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  int v12 = (void (*)(uint64_t, const char *, ...))Logger;
  if (v9)
  {
    if (Logger)
    {
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v15 = 45;
      if (isMetaClass) {
        uint64_t v15 = 43;
      }
      v12(6, "%c[%{public}s %{public}s]:%i posting notification: %s", v15, ClassName, Name, 2736, a4);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = object_getClass(self);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v31 = v18;
      __int16 v32 = 2082;
      uint64_t v33 = object_getClassName(self);
      __int16 v34 = 2082;
      __int16 v35 = sel_getName(a2);
      __int16 v36 = 1024;
      int v37 = 2736;
      __int16 v38 = 2080;
      int v39 = a4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i posting notification: %s", buf, 0x2Cu);
    }

    id v19 = [objc_alloc((Class)NSString) initWithUTF8String:a4];
    int v20 = +[NSDistributedNotificationCenter defaultCenter];
    [v20 postNotificationName:v19 object:v10 userInfo:0 options:3];

    if (v10) {
      [v9 sendSimpleEvent:v19 objectString:v10];
    }
    else {
      [v9 sendSimpleEvent:v19];
    }
  }
  else
  {
    if (Logger)
    {
      int v21 = object_getClass(self);
      BOOL v22 = class_isMetaClass(v21);
      id v23 = object_getClassName(self);
      __int16 v29 = sel_getName(a2);
      uint64_t v24 = 45;
      if (v22) {
        uint64_t v24 = 43;
      }
      v12(6, "%c[%{public}s %{public}s]:%i Invalid event publisher. ", v24, v23, v29, 2733);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v19 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = object_getClass(self);
      if (class_isMetaClass(v25)) {
        int v26 = 43;
      }
      else {
        int v26 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v31 = v26;
      __int16 v32 = 2082;
      uint64_t v33 = object_getClassName(self);
      __int16 v34 = 2082;
      __int16 v35 = sel_getName(a2);
      __int16 v36 = 1024;
      int v37 = 2733;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid event publisher. ", buf, 0x22u);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11 = a5;
  int v12 = v11;
  if (off_100346250 == a6)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000FB434;
    block[3] = &unk_100301C90;
    block[4] = self;
    SEL v17 = a2;
    id v16 = v11;
    dispatch_async(workQueue, block);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_NFHardwareManager;
    [(_NFHardwareManager *)&v14 observeValueForKeyPath:a3 ofObject:a4 change:v11 context:a6];
  }
}

- (void)expressModesInfoWithOption:(unsigned int)a3 completion:(id)a4
{
  id v6 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FB698;
  block[3] = &unk_100304538;
  unsigned int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(workQueue, block);
}

- (void)checkExpressPassCompatibilityDeprecated:(id)a3 callback:(id)a4
{
  id v22 = 0;
  unsigned int v7 = (void (**)(id, void *, id))a4;
  id v8 = sub_100252958((uint64_t)NFSecureElementWrapper, a3, &v22);
  id v9 = v22;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    unsigned int v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v14 = 45;
    if (isMetaClass) {
      uint64_t v14 = 43;
    }
    v11(6, "%c[%{public}s %{public}s]:%i incompatibles: %{public}@", v14, ClassName, Name, 2866, v8);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = object_getClass(self);
    if (class_isMetaClass(v16)) {
      int v17 = 43;
    }
    else {
      int v17 = 45;
    }
    int v18 = object_getClassName(self);
    id v19 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    int v24 = v17;
    __int16 v25 = 2082;
    int v26 = v18;
    __int16 v27 = 2082;
    int v28 = v19;
    __int16 v29 = 1024;
    int v30 = 2866;
    __int16 v31 = 2114;
    __int16 v32 = v8;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i incompatibles: %{public}@", buf, 0x2Cu);
  }

  v7[2](v7, v8, v9);
}

- (void)checkExpressPassCompatibility:(id)a3 callback:(id)a4
{
  id v22 = 0;
  unsigned int v7 = (void (**)(id, void *, id))a4;
  id v8 = sub_100252D84((uint64_t)NFSecureElementWrapper, a3, &v22);
  id v9 = v22;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    unsigned int v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v14 = 45;
    if (isMetaClass) {
      uint64_t v14 = 43;
    }
    v11(6, "%c[%{public}s %{public}s]:%i incompatibles: %{public}@", v14, ClassName, Name, 2876, v8);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = object_getClass(self);
    if (class_isMetaClass(v16)) {
      int v17 = 43;
    }
    else {
      int v17 = 45;
    }
    int v18 = object_getClassName(self);
    id v19 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    int v24 = v17;
    __int16 v25 = 2082;
    int v26 = v18;
    __int16 v27 = 2082;
    int v28 = v19;
    __int16 v29 = 1024;
    int v30 = 2876;
    __int16 v31 = 2114;
    __int16 v32 = v8;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i incompatibles: %{public}@", buf, 0x2Cu);
  }

  v7[2](v7, v8, v9);
}

- (void)currentInMetroStatus:(id)a3
{
  id v20 = 0;
  int v5 = (void (**)(id, id, id))a3;
  id v6 = sub_1002531F0((uint64_t)NFSecureElementWrapper, (uint64_t)&v20);
  id v7 = v20;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v13 = 45;
    if (isMetaClass) {
      uint64_t v13 = 43;
    }
    v9(6, "%c[%{public}s %{public}s]:%i currentInMetroStatus %d (error %@)", v13, ClassName, Name, 2886, v6, v7);
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
    int v17 = object_getClassName(self);
    int v18 = sel_getName(a2);
    *(_DWORD *)buf = 67110402;
    int v22 = v16;
    __int16 v23 = 2082;
    int v24 = v17;
    __int16 v25 = 2082;
    int v26 = v18;
    __int16 v27 = 1024;
    int v28 = 2886;
    __int16 v29 = 1024;
    int v30 = (int)v6;
    __int16 v31 = 2112;
    id v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i currentInMetroStatus %d (error %@)", buf, 0x32u);
  }

  v5[2](v5, v6, v7);
}

- (void)setAntiRelayRID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FC31C;
  block[3] = &unk_100304588;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)rfSettingsWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FC51C;
  v7[3] = &unk_100302390;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)getDieIDWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FCE28;
  v7[3] = &unk_100302390;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)getUniqueFDRKeyWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FD52C;
  v7[3] = &unk_100302390;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)stateInfoWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FDAF0;
  v7[3] = &unk_1003045D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)pushSignedRF:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FEA54;
  block[3] = &unk_100304588;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)setFieldDetectEnabled:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = +[NSXPCConnection currentConnection];
  workQueue = self->_workQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000FF030;
  v11[3] = &unk_100304600;
  BOOL v14 = a3;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(workQueue, v11);
}

- (void)triggerDelayedWake:(unsigned __int8)a3 completion:(id)a4
{
  id v6 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FF668;
  block[3] = &unk_100304650;
  unsigned __int8 v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(workQueue, block);
}

- (void)triggerCrash:(unsigned __int16)a3 completion:(id)a4
{
  id v6 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FFF54;
  block[3] = &unk_100304678;
  unsigned __int16 v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(workQueue, block);
}

- (void)toggleGPIO:(unsigned __int16)a3 completion:(id)a4
{
  id v6 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001005CC;
  block[3] = &unk_100304678;
  unsigned __int16 v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(workQueue, block);
}

- (void)getHostCardEmulationLogWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = +[NSXPCConnection currentConnection];
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100100CD8;
  block[3] = &unk_100304588;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(workQueue, block);
}

- (BOOL)isRecoveryInProgress
{
  uint64_t v2 = [(_NFHardwareManager *)self driverWrapper];
  unsigned __int8 v3 = sub_10015CBB4(v2);

  return v3;
}

- (id)triggerHammerfestRecoveryAt:(id)a3
{
  id v5 = a3;
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_10000B858;
  id v20 = sub_1000F2378;
  id v21 = 0;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100101498;
  block[3] = &unk_1003046A0;
  BOOL v14 = &v16;
  SEL v15 = a2;
  block[4] = self;
  id v13 = v5;
  id v7 = v5;
  dispatch_async_and_wait(workQueue, block);
  id v8 = self->_workQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100101638;
  v11[3] = &unk_100301C68;
  v11[4] = self;
  dispatch_async(v8, v11);
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v9;
}

- (void)furyDelegateRegistered:(id)a3
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
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 3424);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v14 = object_getClass(self);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v19 = v15;
    __int16 v20 = 2082;
    id v21 = object_getClassName(self);
    __int16 v22 = 2082;
    __int16 v23 = sel_getName(a2);
    __int16 v24 = 1024;
    int v25 = 3424;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  uint64_t v16 = self;
  objc_sync_enter(v16);
  objc_storeWeak((id *)&v16->_ffDelegate, v6);

  objc_sync_exit(v16);
}

- (id)powerCycleSE:(id)a3
{
  id v5 = a3;
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x3032000000;
  long long v42 = sub_10000B858;
  long long v43 = sub_1000F2378;
  id v44 = 0;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
  {
    Class = object_getClass(self);
    if (class_isMetaClass(Class)) {
      uint64_t v8 = 43;
    }
    else {
      uint64_t v8 = 45;
    }
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    Logger(6, "%c[%{public}s %{public}s]:%i Power cycling SE :(", v8, ClassName, Name, 3818);
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
    BOOL v14 = object_getClassName(self);
    int v15 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v46 = v13;
    __int16 v47 = 2082;
    BOOL v48 = v14;
    __int16 v49 = 2082;
    int v50 = v15;
    __int16 v51 = 1024;
    int v52 = 3818;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Power cycling SE :(", buf, 0x22u);
  }

  id v32 = _NSConcreteStackBlock;
  uint64_t v33 = 3221225472;
  __int16 v34 = sub_100101C14;
  __int16 v35 = &unk_100304718;
  id v16 = v5;
  id v36 = v16;
  int v37 = self;
  __int16 v38 = &v39;
  int v17 = +[NFRoutingConfig routingOffWithFD:0];
  char v18 = sub_1000F23D8((void **)&self->super.isa, &v32, @"PowerCycleSE", v17);

  if ((v18 & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v19)
    {
      __int16 v20 = object_getClass(self);
      if (class_isMetaClass(v20)) {
        uint64_t v21 = 43;
      }
      else {
        uint64_t v21 = 45;
      }
      __int16 v22 = object_getClassName(self);
      __int16 v23 = sel_getName(a2);
      v19(3, "%c[%{public}s %{public}s]:%i Failed to powercycle SE: %{public}@", v21, v22, v23, 3834, v40[5], v32, v33, v34, v35);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v24 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v25 = object_getClass(self);
      if (class_isMetaClass(v25)) {
        int v26 = 43;
      }
      else {
        int v26 = 45;
      }
      __int16 v27 = object_getClassName(self);
      int v28 = sel_getName(a2);
      uint64_t v29 = v40[5];
      *(_DWORD *)buf = 67110146;
      int v46 = v26;
      __int16 v47 = 2082;
      BOOL v48 = v27;
      __int16 v49 = 2082;
      int v50 = v28;
      __int16 v51 = 1024;
      int v52 = 3834;
      __int16 v53 = 2114;
      uint64_t v54 = v29;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to powercycle SE: %{public}@", buf, 0x2Cu);
    }
  }
  id v30 = (id)v40[5];

  _Block_object_dispose(&v39, 8);

  return v30;
}

- (void)enablePowerCountersLogging:(BOOL)a3
{
}

- (void)openSinglePollExpressModeAssertion:(double)a3 completion:(id)a4
{
  id v5 = a4;
  workQueue = self->_workQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100101E18;
  v8[3] = &unk_100302390;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(workQueue, v8);
}

- (void)cancelSinglePollExpressModeAssertionWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100102090;
  v7[3] = &unk_100302390;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)radioEnableStateWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100102308;
  v7[3] = &unk_100302390;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)enableRadio:(BOOL)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = +[NSXPCConnection currentConnection];
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100102558;
  block[3] = &unk_100304740;
  block[4] = self;
  id v13 = v8;
  id v14 = v7;
  SEL v15 = a2;
  BOOL v16 = a3;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(workQueue, block);
}

- (void)getTemperatureWithCompletion:(id)a3
{
  id v5 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100103148;
  block[3] = &unk_100301D38;
  block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_async(workQueue, block);
}

- (void)getReaderProhibitTimer:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100103894;
  v7[3] = &unk_100302390;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)dumpLPMDebugLogWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010400C;
  v7[3] = &unk_100302390;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)setChipscope:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001045A8;
  block[3] = &unk_100304650;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(workQueue, block);
}

- (void)getLPEMFTALoggingWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100104A74;
  v7[3] = &unk_100302390;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)releaseAssertion:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSXPCConnection currentConnection];
  workQueue = self->_workQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100104D00;
  v13[3] = &unk_100304768;
  v13[4] = self;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  dispatch_async(workQueue, v13);
}

- (void)requestSuppressPresentmentWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void, void *))a3;
  id v6 = +[NSXPCConnection currentConnection];
  id v7 = [v6 NF_userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"ServiceWhitelist"];
  id v9 = +[_NFCardSession validateEntitlements:v8];

  if (v9)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      id v14 = v9;
      id v15 = v5;
      id v16 = a2;
      Name = sel_getName(a2);
      char v18 = [v6 NF_userInfo];
      int v19 = [v18 objectForKeyedSubscript:@"ClientName"];
      id v29 = [v6 processIdentifier];
      int v28 = Name;
      a2 = v16;
      id v5 = v15;
      id v9 = v14;
      uint64_t v20 = 45;
      if (isMetaClass) {
        uint64_t v20 = 43;
      }
      v11(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %{public}d)", v20, ClassName, v28, 4151, v19, v29);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v21 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = object_getClass(self);
      if (class_isMetaClass(v22)) {
        int v23 = 43;
      }
      else {
        int v23 = 45;
      }
      __int16 v24 = object_getClassName(self);
      int v25 = sel_getName(a2);
      int v26 = [v6 NF_userInfo];
      __int16 v27 = [v26 objectForKeyedSubscript:@"ClientName"];
      *(_DWORD *)buf = 67110402;
      int v37 = v23;
      __int16 v38 = 2082;
      uint64_t v39 = v24;
      __int16 v40 = 2082;
      uint64_t v41 = v25;
      __int16 v42 = 1024;
      int v43 = 4151;
      __int16 v44 = 2114;
      __int16 v45 = v27;
      __int16 v46 = 1026;
      unsigned int v47 = [v6 processIdentifier];
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %{public}d)", buf, 0x32u);
    }
    v5[2](v5, 0, v9);
  }
  else
  {
    if (v6) {
      [v6 auditToken];
    }
    else {
      memset(v35, 0, sizeof(v35));
    }
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100105080;
    v31[3] = &unk_100304790;
    uint64_t v33 = v5;
    SEL v34 = a2;
    v31[4] = self;
    id v32 = v6;
    +[_NFCardSession isEligibleWithUserPrompt:1 auditToken:v35 completion:v31];
  }
}

- (void)releaseSuppressPresentmentAssertion:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[NSXPCConnection currentConnection];
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010565C;
  block[3] = &unk_1003046F0;
  id v15 = v7;
  id v16 = self;
  id v18 = v8;
  SEL v19 = a2;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(workQueue, block);
}

- (void)queueFieldDetectSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v103 = a3;
  id v104 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  v105 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    if (class_isMetaClass(Class)) {
      uint64_t v13 = 43;
    }
    else {
      uint64_t v13 = 45;
    }
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    id v16 = [v105 NF_userInfo];
    id v17 = [v16 objectForKeyedSubscript:@"ClientName"];
    v11(6, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 4199, v17);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    SEL v19 = object_getClass(self);
    if (class_isMetaClass(v19)) {
      int v20 = 43;
    }
    else {
      int v20 = 45;
    }
    uint64_t v21 = object_getClassName(self);
    __int16 v22 = sel_getName(a2);
    int v23 = [v105 NF_userInfo];
    __int16 v24 = [v23 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    int v109 = v20;
    __int16 v110 = 2082;
    id v111 = v21;
    __int16 v112 = 2082;
    v113 = v22;
    __int16 v114 = 1024;
    int v115 = 4199;
    __int16 v116 = 2114;
    id v117 = v24;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 2)
  {
    driverWrapper = self->_driverWrapper;
    if (driverWrapper && driverWrapper->_hasAntenna)
    {
      if ((id)[(_NFHardwareManager *)self nfcRadioEnabled:0 showUIPopup:0] == (id)1)
      {
        __int16 v49 = [v105 NF_userInfo];
        int v50 = [v49 objectForKeyedSubscript:@"ServiceWhitelist"];
        uint64_t v41 = +[_NFFieldDetectSession validateEntitlements:v50];

        if (v41)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          __int16 v51 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v51)
          {
            int v52 = object_getClass(self);
            if (class_isMetaClass(v52)) {
              uint64_t v53 = 43;
            }
            else {
              uint64_t v53 = 45;
            }
            v102 = object_getClassName(self);
            uint64_t v54 = sel_getName(a2);
            int v55 = [v105 NF_userInfo];
            NSErrorUserInfoKey v56 = [v55 objectForKeyedSubscript:@"ClientName"];
            v51(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v53, v102, v54, 4220, v56, [v105 processIdentifier]);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v57 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            __int16 v58 = object_getClass(self);
            if (class_isMetaClass(v58)) {
              int v59 = 43;
            }
            else {
              int v59 = 45;
            }
            v60 = object_getClassName(self);
            int v61 = sel_getName(a2);
            __int16 v62 = [v105 NF_userInfo];
            int v63 = [v62 objectForKeyedSubscript:@"ClientName"];
            unsigned int v64 = [v105 processIdentifier];
            *(_DWORD *)buf = 67110402;
            int v109 = v59;
            __int16 v110 = 2082;
            id v111 = v60;
            __int16 v112 = 2082;
            v113 = v61;
            __int16 v114 = 1024;
            int v115 = 4220;
            __int16 v116 = 2114;
            id v117 = v63;
            __int16 v118 = 1024;
            unsigned int v119 = v64;
            _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);
          }
          v9[2](v9, 0, v41);
        }
        else
        {
          v79 = [[_NFFieldDetectSession alloc] initWithRemoteObject:v103 workQueue:self->_workQueue];
          v80 = v79;
          if (v79)
          {
            [(_NFSession *)v79 setQueue:self];
            [(_NFXPCSession *)v80 setConnection:v105];
            [(_NFSession *)v80 setUid:0xFFFFFFFFLL];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v81 = [v104 objectForKey:@"session.fd.unfiltered"];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if (isKindOfClass)
              {
                v83 = [v104 objectForKey:@"session.fd.unfiltered"];
                -[_NFFieldDetectSession setUnfiltered:](v80, "setUnfiltered:", [v83 BOOLValue]);
              }
            }
            v84 = self->_secureElementSessionQueue;
            objc_sync_enter(v84);
            v85 = [v105 NF_userInfo];
            int v86 = [v85 objectForKeyedSubscript:@"ProxyObjects"];
            [v86 addObject:v80];

            objc_sync_exit(v84);
            ((void (**)(id, _NFFieldDetectSession *, void *))v9)[2](v9, v80, 0);
            sub_1000A6270((uint64_t)self, v80, 0, (int)[v105 processIdentifier], 0);
          }
          else
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v87 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
            if (v87)
            {
              v88 = object_getClass(self);
              if (class_isMetaClass(v88)) {
                uint64_t v89 = 43;
              }
              else {
                uint64_t v89 = 45;
              }
              v90 = object_getClassName(self);
              uint64_t v91 = sel_getName(a2);
              v87(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v89, v90, v91, 4227);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v92 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
            {
              v93 = object_getClass(self);
              if (class_isMetaClass(v93)) {
                int v94 = 43;
              }
              else {
                int v94 = 45;
              }
              int v95 = object_getClassName(self);
              v96 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              int v109 = v94;
              __int16 v110 = 2082;
              id v111 = v95;
              __int16 v112 = 2082;
              v113 = v96;
              __int16 v114 = 1024;
              int v115 = 4227;
              _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
            }

            id v97 = objc_alloc((Class)NSError);
            v98 = +[NSString stringWithUTF8String:"nfcd"];
            NSErrorUserInfoKey v106 = NSLocalizedDescriptionKey;
            v99 = +[NSString stringWithUTF8String:"Unexpected Result"];
            id v107 = v99;
            v100 = +[NSDictionary dictionaryWithObjects:&v107 forKeys:&v106 count:1];
            id v101 = [v97 initWithDomain:v98 code:13 userInfo:v100];
            v9[2](v9, 0, v101);
          }
          uint64_t v41 = 0;
        }
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v65 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v65)
        {
          __int16 v66 = object_getClass(self);
          if (class_isMetaClass(v66)) {
            uint64_t v67 = 43;
          }
          else {
            uint64_t v67 = 45;
          }
          __int16 v68 = object_getClassName(self);
          id v69 = sel_getName(a2);
          v65(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v67, v68, v69, 4213);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v70 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          v71 = object_getClass(self);
          if (class_isMetaClass(v71)) {
            int v72 = 43;
          }
          else {
            int v72 = 45;
          }
          int v73 = object_getClassName(self);
          v74 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v109 = v72;
          __int16 v110 = 2082;
          id v111 = v73;
          __int16 v112 = 2082;
          v113 = v74;
          __int16 v114 = 1024;
          int v115 = 4213;
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
        }

        id v75 = objc_alloc((Class)NSError);
        uint64_t v41 = +[NSString stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v120 = NSLocalizedDescriptionKey;
        v76 = +[NSString stringWithUTF8String:"NFC radio disabled"];
        v121 = v76;
        v77 = +[NSDictionary dictionaryWithObjects:&v121 forKeys:&v120 count:1];
        id v78 = [v75 initWithDomain:v41 code:50 userInfo:v77];
        v9[2](v9, 0, v78);
      }
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v26 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v26)
      {
        __int16 v27 = object_getClass(self);
        if (class_isMetaClass(v27)) {
          uint64_t v28 = 43;
        }
        else {
          uint64_t v28 = 45;
        }
        id v29 = object_getClassName(self);
        id v30 = sel_getName(a2);
        __int16 v31 = [v105 NF_userInfo];
        id v32 = [v31 objectForKeyedSubscript:@"ClientName"];
        v26(6, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", v28, v29, v30, 4207, v32);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v33 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        SEL v34 = object_getClass(self);
        if (class_isMetaClass(v34)) {
          int v35 = 43;
        }
        else {
          int v35 = 45;
        }
        id v36 = object_getClassName(self);
        int v37 = sel_getName(a2);
        __int16 v38 = [v105 NF_userInfo];
        uint64_t v39 = [v38 objectForKeyedSubscript:@"ClientName"];
        *(_DWORD *)buf = 67110146;
        int v109 = v35;
        __int16 v110 = 2082;
        id v111 = v36;
        __int16 v112 = 2082;
        v113 = v37;
        __int16 v114 = 1024;
        int v115 = 4207;
        __int16 v116 = 2114;
        id v117 = v39;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", buf, 0x2Cu);
      }
      id v40 = objc_alloc((Class)NSError);
      uint64_t v41 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v122 = NSLocalizedDescriptionKey;
      __int16 v42 = +[NSString stringWithUTF8String:"Feature Not Supported"];
      long long v123 = v42;
      int v43 = +[NSDictionary dictionaryWithObjects:&v123 forKeys:&v122 count:1];
      id v44 = [v40 initWithDomain:v41 code:14 userInfo:v43];
      v9[2](v9, 0, v44);
    }
  }
  else
  {
    id v45 = objc_alloc((Class)NSError);
    uint64_t v41 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v124 = NSLocalizedDescriptionKey;
    __int16 v46 = +[NSString stringWithUTF8String:"Unresponsive hardware"];
    id v125 = v46;
    unsigned int v47 = +[NSDictionary dictionaryWithObjects:&v125 forKeys:&v124 count:1];
    id v48 = [v45 initWithDomain:v41 code:58 userInfo:v47];
    v9[2](v9, 0, v48);
  }
}

- (void)queueECommercePaymentSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v72 = a3;
  id v71 = a5;
  id v8 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    id v15 = [v8 NF_userInfo];
    id v16 = [v15 objectForKeyedSubscript:@"ClientName"];
    uint64_t v17 = 45;
    if (isMetaClass) {
      uint64_t v17 = 43;
    }
    v10(6, "%c[%{public}s %{public}s]:%i %{public}@", v17, ClassName, Name, 4261, v16);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    SEL v19 = object_getClass(self);
    if (class_isMetaClass(v19)) {
      int v20 = 43;
    }
    else {
      int v20 = 45;
    }
    uint64_t v21 = object_getClassName(self);
    __int16 v22 = sel_getName(a2);
    int v23 = [v8 NF_userInfo];
    __int16 v24 = [v23 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    int v80 = v20;
    __int16 v81 = 2082;
    v82 = v21;
    __int16 v83 = 2082;
    v84 = v22;
    __int16 v85 = 1024;
    int v86 = 4261;
    __int16 v87 = 2114;
    v88 = v24;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 2
    || -[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 5)
  {
    int v25 = [v8 NF_userInfo];
    int v26 = [v25 objectForKeyedSubscript:@"ServiceWhitelist"];
    __int16 v27 = +[_NFECommercePaymentSession validateEntitlements:v26];

    if (v27)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v28 = NFLogGetLogger();
      if (v28)
      {
        id v29 = (void (*)(uint64_t, const char *, ...))v28;
        id v30 = object_getClass(self);
        BOOL v31 = class_isMetaClass(v30);
        id v32 = object_getClassName(self);
        uint64_t v33 = sel_getName(a2);
        SEL v34 = [v8 NF_userInfo];
        int v35 = [v34 objectForKeyedSubscript:@"ClientName"];
        id v70 = [v8 processIdentifier];
        uint64_t v36 = 45;
        if (v31) {
          uint64_t v36 = 43;
        }
        v29(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v36, v32, v33, 4280, v35, v70);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v37 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        __int16 v38 = object_getClass(self);
        if (class_isMetaClass(v38)) {
          int v39 = 43;
        }
        else {
          int v39 = 45;
        }
        id v40 = object_getClassName(self);
        uint64_t v41 = sel_getName(a2);
        __int16 v42 = [v8 NF_userInfo];
        int v43 = [v42 objectForKeyedSubscript:@"ClientName"];
        unsigned int v44 = [v8 processIdentifier];
        *(_DWORD *)buf = 67110402;
        int v80 = v39;
        __int16 v81 = 2082;
        v82 = v40;
        __int16 v83 = 2082;
        v84 = v41;
        __int16 v85 = 1024;
        int v86 = 4280;
        __int16 v87 = 2114;
        v88 = v43;
        __int16 v89 = 1024;
        unsigned int v90 = v44;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);
      }
      id v45 = v71;
      (*((void (**)(id, void, void, void *))v71 + 2))(v71, 0, 0, v27);
    }
    else
    {
      __int16 v46 = [(_NFXPCSession *)[_NFECommercePaymentSession alloc] initWithRemoteObject:v72 workQueue:self->_workQueue];
      unsigned int v47 = v46;
      if (v46)
      {
        [(_NFSession *)v46 setQueue:self];
        [(_NFXPCSession *)v47 setConnection:v8];
        [(_NFSession *)v47 setUid:0xFFFFFFFFLL];
        id v45 = v71;
        (*((void (**)(id, _NFECommercePaymentSession *, BOOL, void))v71 + 2))(v71, v47, [(_NFHardwareManager *)self isFirstInQueue], 0);
        workQueue = self->_workQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100106E10;
        block[3] = &unk_100301CE0;
        void block[4] = self;
        v74 = v47;
        SEL v76 = a2;
        id v75 = v8;
        dispatch_async(workQueue, block);
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v53 = NFLogGetLogger();
        if (v53)
        {
          uint64_t v54 = (void (*)(uint64_t, const char *, ...))v53;
          int v55 = object_getClass(self);
          BOOL v56 = class_isMetaClass(v55);
          v57 = object_getClassName(self);
          id v69 = sel_getName(a2);
          uint64_t v58 = 45;
          if (v56) {
            uint64_t v58 = 43;
          }
          v54(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v58, v57, v69, 4287);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        int v59 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          v60 = object_getClass(self);
          if (class_isMetaClass(v60)) {
            int v61 = 43;
          }
          else {
            int v61 = 45;
          }
          __int16 v62 = object_getClassName(self);
          int v63 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v80 = v61;
          __int16 v81 = 2082;
          v82 = v62;
          __int16 v83 = 2082;
          v84 = v63;
          __int16 v85 = 1024;
          int v86 = 4287;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
        }

        id v64 = objc_alloc((Class)NSError);
        v65 = +[NSString stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v77 = NSLocalizedDescriptionKey;
        __int16 v66 = +[NSString stringWithUTF8String:"Unexpected Result"];
        id v78 = v66;
        uint64_t v67 = +[NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
        id v68 = [v64 initWithDomain:v65 code:13 userInfo:v67];
        id v45 = v71;
        (*((void (**)(id, void, void, id))v71 + 2))(v71, 0, 0, v68);
      }
      __int16 v27 = 0;
    }
  }
  else
  {
    id v49 = objc_alloc((Class)NSError);
    __int16 v27 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v91 = NSLocalizedDescriptionKey;
    int v50 = +[NSString stringWithUTF8String:"Unresponsive hardware"];
    v92 = v50;
    __int16 v51 = +[NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
    id v52 = [v49 initWithDomain:v27 code:58 userInfo:v51];
    id v45 = v71;
    (*((void (**)(id, void, void, id))v71 + 2))(v71, 0, 0, v52);
  }
}

- (void)queueContactlessPaymentSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v122 = a5;
  id v11 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  sel = a2;
  if (Logger)
  {
    uint64_t v13 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    id v17 = v9;
    Name = sel_getName(a2);
    SEL v19 = [v11 NF_userInfo];
    int v20 = [v19 objectForKeyedSubscript:@"ClientName"];
    id v117 = Name;
    id v9 = v17;
    uint64_t v21 = 45;
    if (isMetaClass) {
      uint64_t v21 = 43;
    }
    v13(6, "%c[%{public}s %{public}s]:%i %{public}@", v21, ClassName, v117, 4332, v20);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  __int16 v22 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = object_getClass(self);
    if (class_isMetaClass(v23)) {
      int v24 = 43;
    }
    else {
      int v24 = 45;
    }
    int v25 = object_getClassName(self);
    int v26 = sel_getName(sel);
    __int16 v27 = [v11 NF_userInfo];
    uint64_t v28 = [v27 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    int v136 = v24;
    __int16 v137 = 2082;
    v138 = v25;
    __int16 v139 = 2082;
    v140 = v26;
    __int16 v141 = 1024;
    int v142 = 4332;
    __int16 v143 = 2114;
    v144 = v28;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) != 2)
  {
    id v52 = objc_alloc((Class)NSError);
    BOOL v31 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v147 = NSLocalizedDescriptionKey;
    uint64_t v53 = +[NSString stringWithUTF8String:"Unresponsive hardware"];
    v148 = v53;
    +[NSDictionary dictionaryWithObjects:&v148 forKeys:&v147 count:1];
    v55 = uint64_t v54 = v11;
    id v56 = [v52 initWithDomain:v31 code:58 userInfo:v55];
    __int16 v51 = v122;
    (*((void (**)(id, void, void, id))v122 + 2))(v122, 0, 0, v56);

    id v11 = v54;
    goto LABEL_60;
  }
  id v29 = [v11 NF_userInfo];
  id v30 = [v29 objectForKeyedSubscript:@"ServiceWhitelist"];
  BOOL v31 = +[_NFContactlessSession validateEntitlements:v30];

  if (v31)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v32 = NFLogGetLogger();
    if (v32)
    {
      uint64_t v33 = (void (*)(uint64_t, const char *, ...))v32;
      SEL v34 = object_getClass(self);
      BOOL v35 = class_isMetaClass(v34);
      uint64_t v36 = object_getClassName(self);
      int v37 = sel_getName(sel);
      [v11 NF_userInfo];
      id v121 = v10;
      int v39 = v38 = v9;
      id v40 = [v39 objectForKeyedSubscript:@"ClientName"];
      id v120 = [v11 processIdentifier];
      uint64_t v41 = 45;
      if (v35) {
        uint64_t v41 = 43;
      }
      v33(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v41, v36, v37, 4351, v40, v120);

      id v9 = v38;
      id v10 = v121;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v42 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      int v43 = object_getClass(self);
      if (class_isMetaClass(v43)) {
        int v44 = 43;
      }
      else {
        int v44 = 45;
      }
      id v45 = object_getClassName(self);
      __int16 v46 = sel_getName(sel);
      [v11 NF_userInfo];
      v48 = unsigned int v47 = v11;
      id v49 = [v48 objectForKeyedSubscript:@"ClientName"];
      unsigned int v50 = [v47 processIdentifier];
      *(_DWORD *)buf = 67110402;
      int v136 = v44;
      __int16 v137 = 2082;
      v138 = v45;
      __int16 v139 = 2082;
      v140 = v46;
      __int16 v141 = 1024;
      int v142 = 4351;
      __int16 v143 = 2114;
      v144 = v49;
      __int16 v145 = 1024;
      unsigned int v146 = v50;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);

      id v11 = v47;
    }

    __int16 v51 = v122;
    (*((void (**)(id, void, void, void *))v122 + 2))(v122, 0, 0, v31);
    goto LABEL_60;
  }
  driverWrapper = self->_driverWrapper;
  if (!driverWrapper || !driverWrapper->_hasAntenna)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v58 = NFLogGetLogger();
    if (v58)
    {
      int v59 = (void (*)(uint64_t, const char *, ...))v58;
      v60 = object_getClass(self);
      BOOL v61 = class_isMetaClass(v60);
      __int16 v62 = object_getClassName(self);
      int v63 = sel_getName(sel);
      id v64 = [v11 NF_userInfo];
      v65 = [v64 objectForKeyedSubscript:@"ClientName"];
      uint64_t v66 = 45;
      if (v61) {
        uint64_t v66 = 43;
      }
      v59(6, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", v66, v62, v63, 4357, v65);
    }
    uint64_t v67 = v11;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v68 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      id v69 = object_getClass(self);
      if (class_isMetaClass(v69)) {
        int v70 = 43;
      }
      else {
        int v70 = 45;
      }
      id v71 = object_getClassName(self);
      id v72 = sel_getName(sel);
      int v73 = [v11 NF_userInfo];
      v74 = [v73 objectForKeyedSubscript:@"ClientName"];
      *(_DWORD *)buf = 67110146;
      int v136 = v70;
      __int16 v137 = 2082;
      v138 = v71;
      __int16 v139 = 2082;
      v140 = v72;
      __int16 v141 = 1024;
      int v142 = 4357;
      __int16 v143 = 2114;
      v144 = v74;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", buf, 0x2Cu);
    }
    id v75 = objc_alloc((Class)NSError);
    SEL v76 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v133 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v77 = +[NSString stringWithUTF8String:"Feature Not Supported"];
    v134 = v77;
    id v78 = +[NSDictionary dictionaryWithObjects:&v134 forKeys:&v133 count:1];
    id v79 = [v75 initWithDomain:v76 code:14 userInfo:v78];
    __int16 v51 = v122;
    (*((void (**)(id, void, void, id))v122 + 2))(v122, 0, 0, v79);

LABEL_59:
    BOOL v31 = 0;
    id v11 = v67;
    goto LABEL_60;
  }
  if ((id)[(_NFHardwareManager *)self nfcRadioEnabled:0 showUIPopup:sub_1000FAEAC((uint64_t)self, v10)] == (id)1)
  {
    int v80 = [(_NFXPCSession *)[_NFContactlessPaymentSession alloc] initWithRemoteObject:v9 workQueue:self->_workQueue expressModeManager:self->_expressModeManager];
    __int16 v81 = v80;
    if (v80)
    {
      [(_NFSession *)v80 setQueue:self];
      [(_NFXPCSession *)v81 setConnection:v11];
      [(_NFSession *)v81 setUid:0xFFFFFFFFLL];
      v82 = [v11 exportedInterface];
      sub_10006E854((uint64_t)NFHardwareManagerInterface, v82);

      (*((void (**)(id, _NFContactlessPaymentSession *, BOOL, void))v122 + 2))(v122, v81, [(_NFHardwareManager *)self isFirstInQueue], 0);
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001081F8;
      block[3] = &unk_100301CE0;
      id v125 = v81;
      v126 = self;
      __int16 v51 = v122;
      v128 = sel;
      uint64_t v67 = v11;
      id v127 = v11;
      dispatch_async(workQueue, block);

      v84 = v125;
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v102 = NFLogGetLogger();
      if (v102)
      {
        id v103 = (void (*)(uint64_t, const char *, ...))v102;
        id v104 = object_getClass(self);
        BOOL v105 = class_isMetaClass(v104);
        NSErrorUserInfoKey v106 = object_getClassName(self);
        unsigned int v119 = sel_getName(sel);
        uint64_t v107 = 45;
        if (v105) {
          uint64_t v107 = 43;
        }
        v103(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v107, v106, v119, 4372);
      }
      uint64_t v67 = v11;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v108 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
      {
        int v109 = object_getClass(self);
        if (class_isMetaClass(v109)) {
          int v110 = 43;
        }
        else {
          int v110 = 45;
        }
        id v111 = object_getClassName(self);
        __int16 v112 = sel_getName(sel);
        *(_DWORD *)buf = 67109890;
        int v136 = v110;
        __int16 v137 = 2082;
        v138 = v111;
        __int16 v139 = 2082;
        v140 = v112;
        __int16 v141 = 1024;
        int v142 = 4372;
        _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
      }

      id v113 = objc_alloc((Class)NSError);
      v84 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v129 = NSLocalizedDescriptionKey;
      __int16 v114 = +[NSString stringWithUTF8String:"Unexpected Result"];
      v130 = v114;
      int v115 = +[NSDictionary dictionaryWithObjects:&v130 forKeys:&v129 count:1];
      id v116 = [v113 initWithDomain:v84 code:13 userInfo:v115];
      __int16 v51 = v122;
      (*((void (**)(id, void, void, id))v122 + 2))(v122, 0, 0, v116);
    }
    goto LABEL_59;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v85 = NFLogGetLogger();
  if (v85)
  {
    int v86 = (void (*)(uint64_t, const char *, ...))v85;
    __int16 v87 = object_getClass(self);
    BOOL v88 = class_isMetaClass(v87);
    __int16 v89 = object_getClassName(self);
    __int16 v118 = sel_getName(sel);
    uint64_t v90 = 45;
    if (v88) {
      uint64_t v90 = 43;
    }
    v86(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v90, v89, v118, 4363);
  }
  NSErrorUserInfoKey v91 = v11;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v92 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
  {
    v93 = object_getClass(self);
    if (class_isMetaClass(v93)) {
      int v94 = 43;
    }
    else {
      int v94 = 45;
    }
    int v95 = object_getClassName(self);
    v96 = sel_getName(sel);
    *(_DWORD *)buf = 67109890;
    int v136 = v94;
    __int16 v137 = 2082;
    v138 = v95;
    __int16 v139 = 2082;
    v140 = v96;
    __int16 v141 = 1024;
    int v142 = 4363;
    _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
  }

  id v97 = objc_alloc((Class)NSError);
  v98 = +[NSString stringWithUTF8String:"nfcd"];
  NSErrorUserInfoKey v131 = NSLocalizedDescriptionKey;
  v99 = +[NSString stringWithUTF8String:"NFC radio disabled"];
  v132 = v99;
  v100 = +[NSDictionary dictionaryWithObjects:&v132 forKeys:&v131 count:1];
  id v101 = [v97 initWithDomain:v98 code:50 userInfo:v100];
  __int16 v51 = v122;
  (*((void (**)(id, void, void, id))v122 + 2))(v122, 0, 0, v101);

  BOOL v31 = 0;
  id v11 = v91;
LABEL_60:
}

- (void)queueContactlessSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v123 = a4;
  id v122 = a5;
  id v10 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v12 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    id v16 = v9;
    Name = sel_getName(a2);
    id v18 = [v10 NF_userInfo];
    SEL v19 = [v18 objectForKeyedSubscript:@"ClientName"];
    id v117 = Name;
    id v9 = v16;
    uint64_t v20 = 45;
    if (isMetaClass) {
      uint64_t v20 = 43;
    }
    v12(6, "%c[%{public}s %{public}s]:%i %{public}@", v20, ClassName, v117, 4420, v19);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v21 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v22 = object_getClass(self);
    if (class_isMetaClass(v22)) {
      int v23 = 43;
    }
    else {
      int v23 = 45;
    }
    int v24 = object_getClassName(self);
    int v25 = sel_getName(a2);
    int v26 = [v10 NF_userInfo];
    __int16 v27 = [v26 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    int v136 = v23;
    __int16 v137 = 2082;
    v138 = v24;
    __int16 v139 = 2082;
    v140 = v25;
    __int16 v141 = 1024;
    int v142 = 4420;
    __int16 v143 = 2114;
    v144 = v27;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) != 2)
  {
    id v52 = objc_alloc((Class)NSError);
    id v30 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v147 = NSLocalizedDescriptionKey;
    uint64_t v53 = +[NSString stringWithUTF8String:"Unresponsive hardware"];
    v148 = v53;
    +[NSDictionary dictionaryWithObjects:&v148 forKeys:&v147 count:1];
    v55 = uint64_t v54 = v10;
    id v56 = [v52 initWithDomain:v30 code:58 userInfo:v55];
    __int16 v51 = v122;
    (*((void (**)(id, void, void, id))v122 + 2))(v122, 0, 0, v56);

    id v10 = v54;
    goto LABEL_60;
  }
  uint64_t v28 = [v10 NF_userInfo];
  id v29 = [v28 objectForKeyedSubscript:@"ServiceWhitelist"];
  id v30 = +[_NFContactlessSession validateEntitlements:v29];

  if (v30)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v31 = NFLogGetLogger();
    if (v31)
    {
      uint64_t v32 = (void (*)(uint64_t, const char *, ...))v31;
      uint64_t v33 = object_getClass(self);
      BOOL v34 = class_isMetaClass(v33);
      BOOL v35 = object_getClassName(self);
      uint64_t v36 = sel_getName(a2);
      [v10 NF_userInfo];
      id v121 = a2;
      v38 = id v37 = v9;
      int v39 = [v38 objectForKeyedSubscript:@"ClientName"];
      id v120 = [v10 processIdentifier];
      uint64_t v40 = 45;
      if (v34) {
        uint64_t v40 = 43;
      }
      v32(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v40, v35, v36, 4439, v39, v120);

      id v9 = v37;
      a2 = v121;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v41 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      __int16 v42 = object_getClass(self);
      int v43 = a2;
      if (class_isMetaClass(v42)) {
        int v44 = 43;
      }
      else {
        int v44 = 45;
      }
      id v45 = object_getClassName(self);
      __int16 v46 = sel_getName(v43);
      [v10 NF_userInfo];
      v48 = unsigned int v47 = v10;
      id v49 = [v48 objectForKeyedSubscript:@"ClientName"];
      unsigned int v50 = [v47 processIdentifier];
      *(_DWORD *)buf = 67110402;
      int v136 = v44;
      __int16 v137 = 2082;
      v138 = v45;
      __int16 v139 = 2082;
      v140 = v46;
      __int16 v141 = 1024;
      int v142 = 4439;
      __int16 v143 = 2114;
      v144 = v49;
      __int16 v145 = 1024;
      unsigned int v146 = v50;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);

      id v10 = v47;
    }

    __int16 v51 = v122;
    (*((void (**)(id, void, void, void *))v122 + 2))(v122, 0, 0, v30);
    goto LABEL_60;
  }
  driverWrapper = self->_driverWrapper;
  if (!driverWrapper || !driverWrapper->_hasAntenna)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v58 = NFLogGetLogger();
    if (v58)
    {
      int v59 = (void (*)(uint64_t, const char *, ...))v58;
      v60 = object_getClass(self);
      BOOL v61 = class_isMetaClass(v60);
      __int16 v62 = object_getClassName(self);
      int v63 = sel_getName(a2);
      id v64 = [v10 NF_userInfo];
      v65 = [v64 objectForKeyedSubscript:@"ClientName"];
      uint64_t v66 = 45;
      if (v61) {
        uint64_t v66 = 43;
      }
      v59(3, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", v66, v62, v63, 4445, v65);
    }
    uint64_t v67 = v10;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v68 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      id v69 = object_getClass(self);
      int v70 = a2;
      if (class_isMetaClass(v69)) {
        int v71 = 43;
      }
      else {
        int v71 = 45;
      }
      id v72 = object_getClassName(self);
      int v73 = sel_getName(v70);
      v74 = [v10 NF_userInfo];
      id v75 = [v74 objectForKeyedSubscript:@"ClientName"];
      *(_DWORD *)buf = 67110146;
      int v136 = v71;
      __int16 v137 = 2082;
      v138 = v72;
      __int16 v139 = 2082;
      v140 = v73;
      __int16 v141 = 1024;
      int v142 = 4445;
      __int16 v143 = 2114;
      v144 = v75;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", buf, 0x2Cu);
    }
    id v76 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v77 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v133 = NSLocalizedDescriptionKey;
    id v78 = +[NSString stringWithUTF8String:"Feature Not Supported"];
    v134 = v78;
    id v79 = +[NSDictionary dictionaryWithObjects:&v134 forKeys:&v133 count:1];
    int v80 = v76;
    __int16 v81 = v77;
    uint64_t v82 = 14;
LABEL_48:
    id v101 = [v80 initWithDomain:v81 code:v82 userInfo:v79];
    __int16 v51 = v122;
    (*((void (**)(id, void, void, id))v122 + 2))(v122, 0, 0, v101);

    id v30 = 0;
    id v10 = v67;
    goto LABEL_60;
  }
  if ((id)[(_NFHardwareManager *)self nfcRadioEnabled:0 showUIPopup:sub_1000FAEAC((uint64_t)self, v123)] != (id)1)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v89 = NFLogGetLogger();
    if (v89)
    {
      uint64_t v90 = (void (*)(uint64_t, const char *, ...))v89;
      NSErrorUserInfoKey v91 = object_getClass(self);
      BOOL v92 = class_isMetaClass(v91);
      v93 = object_getClassName(self);
      __int16 v118 = sel_getName(a2);
      uint64_t v94 = 45;
      if (v92) {
        uint64_t v94 = 43;
      }
      v90(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v94, v93, v118, 4451);
    }
    uint64_t v67 = v10;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v95 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
    {
      v96 = object_getClass(self);
      if (class_isMetaClass(v96)) {
        int v97 = 43;
      }
      else {
        int v97 = 45;
      }
      v98 = object_getClassName(self);
      v99 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v136 = v97;
      __int16 v137 = 2082;
      v138 = v98;
      __int16 v139 = 2082;
      v140 = v99;
      __int16 v141 = 1024;
      int v142 = 4451;
      _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
    }

    id v100 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v77 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v131 = NSLocalizedDescriptionKey;
    id v78 = +[NSString stringWithUTF8String:"NFC radio disabled"];
    v132 = v78;
    id v79 = +[NSDictionary dictionaryWithObjects:&v132 forKeys:&v131 count:1];
    int v80 = v100;
    __int16 v81 = v77;
    uint64_t v82 = 50;
    goto LABEL_48;
  }
  __int16 v83 = [(_NFXPCSession *)[_NFContactlessSession alloc] initWithRemoteObject:v9 workQueue:self->_workQueue expressModeManager:self->_expressModeManager];
  v84 = v83;
  if (v83)
  {
    [(_NFSession *)v83 setQueue:self];
    [(_NFXPCSession *)v84 setConnection:v10];
    [(_NFSession *)v84 setUid:0xFFFFFFFFLL];
    SEL v85 = a2;
    __int16 v51 = v122;
    (*((void (**)(id, _NFContactlessSession *, BOOL, void))v122 + 2))(v122, v84, [(_NFHardwareManager *)self isFirstInQueue], 0);
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001095A4;
    block[3] = &unk_100301CE0;
    id v125 = v84;
    v126 = self;
    SEL v128 = v85;
    __int16 v87 = v10;
    id v127 = v10;
    dispatch_async(workQueue, block);

    BOOL v88 = v125;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v102 = NFLogGetLogger();
    if (v102)
    {
      id v103 = (void (*)(uint64_t, const char *, ...))v102;
      id v104 = object_getClass(self);
      BOOL v105 = class_isMetaClass(v104);
      NSErrorUserInfoKey v106 = object_getClassName(self);
      unsigned int v119 = sel_getName(a2);
      uint64_t v107 = 45;
      if (v105) {
        uint64_t v107 = 43;
      }
      v103(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v107, v106, v119, 4461);
    }
    __int16 v87 = v10;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v108 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
    {
      int v109 = object_getClass(self);
      if (class_isMetaClass(v109)) {
        int v110 = 43;
      }
      else {
        int v110 = 45;
      }
      id v111 = object_getClassName(self);
      __int16 v112 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v136 = v110;
      __int16 v137 = 2082;
      v138 = v111;
      __int16 v139 = 2082;
      v140 = v112;
      __int16 v141 = 1024;
      int v142 = 4461;
      _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
    }

    id v113 = objc_alloc((Class)NSError);
    BOOL v88 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v129 = NSLocalizedDescriptionKey;
    __int16 v114 = +[NSString stringWithUTF8String:"Unexpected Result"];
    v130 = v114;
    int v115 = +[NSDictionary dictionaryWithObjects:&v130 forKeys:&v129 count:1];
    id v116 = [v113 initWithDomain:v88 code:13 userInfo:v115];
    __int16 v51 = v122;
    (*((void (**)(id, void, void, id))v122 + 2))(v122, 0, 0, v116);
  }
  id v30 = 0;
  id v10 = v87;
LABEL_60:
}

- (void)queueSecureElementManagerSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v88 = a5;
  id v11 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v13 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    id v17 = v9;
    Name = sel_getName(a2);
    [v11 NF_userInfo];
    uint64_t v89 = a2;
    uint64_t v20 = v19 = v10;
    uint64_t v21 = [v20 objectForKeyedSubscript:@"ClientName"];
    v84 = Name;
    id v9 = v17;
    uint64_t v22 = 45;
    if (isMetaClass) {
      uint64_t v22 = 43;
    }
    v13(6, "%c[%{public}s %{public}s]:%i %{public}@", v22, ClassName, v84, 4508, v21);

    id v10 = v19;
    a2 = v89;
  }
  uint64_t v90 = v10;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v23 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
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
    uint64_t v28 = [v11 NF_userInfo];
    id v29 = [v28 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    int v100 = v25;
    __int16 v101 = 2082;
    uint64_t v102 = v26;
    __int16 v103 = 2082;
    id v104 = v27;
    __int16 v105 = 1024;
    int v106 = 4508;
    __int16 v107 = 2114;
    v108 = v29;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 2
    || -[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 5)
  {
    id v30 = [v11 NF_userInfo];
    uint64_t v31 = [v30 objectForKeyedSubscript:@"ServiceWhitelist"];
    uint64_t v32 = +[_NFSecureElementManagerSession validateEntitlements:v31];

    if (v32)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v33 = NFLogGetLogger();
      if (v33)
      {
        BOOL v34 = (void (*)(uint64_t, const char *, ...))v33;
        BOOL v35 = object_getClass(self);
        BOOL v36 = class_isMetaClass(v35);
        id v37 = object_getClassName(self);
        id v38 = sel_getName(a2);
        [v11 NF_userInfo];
        __int16 v87 = self;
        int v39 = v11;
        uint64_t v40 = a2;
        v42 = id v41 = v9;
        int v43 = [v42 objectForKeyedSubscript:@"ClientName"];
        id v86 = [v39 processIdentifier];
        uint64_t v44 = 45;
        if (v36) {
          uint64_t v44 = 43;
        }
        v34(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v44, v37, v38, 4533, v43, v86);

        id v9 = v41;
        a2 = v40;
        id v11 = v39;
        self = v87;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v45 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        __int16 v46 = object_getClass(self);
        if (class_isMetaClass(v46)) {
          int v47 = 43;
        }
        else {
          int v47 = 45;
        }
        id v48 = object_getClassName(self);
        id v49 = sel_getName(a2);
        unsigned int v50 = [v11 NF_userInfo];
        __int16 v51 = [v50 objectForKeyedSubscript:@"ClientName"];
        unsigned int v52 = [v11 processIdentifier];
        *(_DWORD *)buf = 67110402;
        int v100 = v47;
        __int16 v101 = 2082;
        uint64_t v102 = v48;
        __int16 v103 = 2082;
        id v104 = v49;
        __int16 v105 = 1024;
        int v106 = 4533;
        __int16 v107 = 2114;
        v108 = v51;
        __int16 v109 = 1024;
        unsigned int v110 = v52;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);
      }
      uint64_t v53 = v88;
      (*((void (**)(id, void, void, void *))v88 + 2))(v88, 0, 0, v32);
    }
    else
    {
      uint64_t v54 = [v11 NF_userInfo];
      int v55 = [v54 objectForKeyedSubscript:@"ServiceWhitelist"];
      id v56 = [v55 allowBackgroundedSession];

      v57 = [[_NFSecureElementManagerSession alloc] initWithRemoteObject:v9 workQueue:self->_workQueue expressModeManager:self->_expressModeManager allowsBackgroundMode:v56];
      uint64_t v58 = v57;
      if (v57)
      {
        [(_NFSession *)v57 setQueue:self];
        [(_NFXPCSession *)v58 setConnection:v11];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v59 = [v90 objectForKey:@"session.high.priority"];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            BOOL v61 = [v90 objectForKeyedSubscript:@"session.high.priority"];
            -[_NFSession setPriority:](v58, "setPriority:", [v61 BOOLValue]);
          }
        }
        [(_NFSession *)v58 setUid:0xFFFFFFFFLL];
        [(_NFSecureElementManagerSession *)v58 setDriverWrapper:self->_driverWrapper];
        __int16 v62 = [v11 exportedInterface];
        sub_10006E6D4((uint64_t)NFHardwareManagerInterface, v62);

        (*((void (**)(id, _NFSecureElementManagerSession *, BOOL, void))v88 + 2))(v88, v58, [(_NFHardwareManager *)self isFirstInQueue], 0);
        workQueue = self->_workQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10010A630;
        block[3] = &unk_1003047B8;
        id v92 = v90;
        v93 = self;
        uint64_t v53 = v88;
        uint64_t v94 = v58;
        SEL v96 = a2;
        id v95 = v11;
        dispatch_async(workQueue, block);

        id v64 = v92;
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v69 = NFLogGetLogger();
        if (v69)
        {
          int v70 = (void (*)(uint64_t, const char *, ...))v69;
          int v71 = object_getClass(self);
          BOOL v72 = class_isMetaClass(v71);
          int v73 = object_getClassName(self);
          SEL v85 = sel_getName(a2);
          uint64_t v74 = 45;
          if (v72) {
            uint64_t v74 = 43;
          }
          v70(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v74, v73, v85, 4544);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        id v75 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        {
          id v76 = object_getClass(self);
          if (class_isMetaClass(v76)) {
            int v77 = 43;
          }
          else {
            int v77 = 45;
          }
          id v78 = object_getClassName(self);
          id v79 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v100 = v77;
          __int16 v101 = 2082;
          uint64_t v102 = v78;
          __int16 v103 = 2082;
          id v104 = v79;
          __int16 v105 = 1024;
          int v106 = 4544;
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
        }

        id v80 = objc_alloc((Class)NSError);
        id v64 = +[NSString stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v97 = NSLocalizedDescriptionKey;
        __int16 v81 = +[NSString stringWithUTF8String:"Unexpected Result"];
        v98 = v81;
        uint64_t v82 = +[NSDictionary dictionaryWithObjects:&v98 forKeys:&v97 count:1];
        id v83 = [v80 initWithDomain:v64 code:13 userInfo:v82];
        uint64_t v53 = v88;
        (*((void (**)(id, void, void, id))v88 + 2))(v88, 0, 0, v83);
      }
      uint64_t v32 = 0;
    }
  }
  else
  {
    id v65 = objc_alloc((Class)NSError);
    uint64_t v32 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v111 = NSLocalizedDescriptionKey;
    uint64_t v66 = +[NSString stringWithUTF8String:"Unresponsive hardware"];
    __int16 v112 = v66;
    uint64_t v67 = +[NSDictionary dictionaryWithObjects:&v112 forKeys:&v111 count:1];
    id v68 = [v65 initWithDomain:v32 code:58 userInfo:v67];
    uint64_t v53 = v88;
    (*((void (**)(id, void, void, id))v88 + 2))(v88, 0, 0, v68);
  }
}

- (void)queueLoyaltyAndPaymentSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v125 = a5;
  id v11 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  sel = a2;
  if (Logger)
  {
    uint64_t v13 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    id v17 = v9;
    Name = sel_getName(a2);
    id v19 = [v11 NF_userInfo];
    uint64_t v20 = [v19 objectForKeyedSubscript:@"ClientName"];
    id v120 = Name;
    id v9 = v17;
    uint64_t v21 = 45;
    if (isMetaClass) {
      uint64_t v21 = 43;
    }
    v13(6, "%c[%{public}s %{public}s]:%i %{public}@", v21, ClassName, v120, 4595, v20);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v22 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = object_getClass(self);
    if (class_isMetaClass(v23)) {
      int v24 = 43;
    }
    else {
      int v24 = 45;
    }
    int v25 = object_getClassName(self);
    int v26 = sel_getName(sel);
    __int16 v27 = [v11 NF_userInfo];
    uint64_t v28 = [v27 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    int v139 = v24;
    __int16 v140 = 2082;
    __int16 v141 = v25;
    __int16 v142 = 2082;
    __int16 v143 = v26;
    __int16 v144 = 1024;
    int v145 = 4595;
    __int16 v146 = 2114;
    NSErrorUserInfoKey v147 = v28;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) != 2)
  {
    id v52 = objc_alloc((Class)NSError);
    uint64_t v31 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v150 = NSLocalizedDescriptionKey;
    uint64_t v53 = +[NSString stringWithUTF8String:"Unresponsive hardware"];
    v151 = v53;
    +[NSDictionary dictionaryWithObjects:&v151 forKeys:&v150 count:1];
    v55 = uint64_t v54 = v11;
    id v56 = [v52 initWithDomain:v31 code:58 userInfo:v55];
    __int16 v51 = v125;
    (*((void (**)(id, void, void, id))v125 + 2))(v125, 0, 0, v56);

    id v11 = v54;
    goto LABEL_63;
  }
  id v29 = [v11 NF_userInfo];
  id v30 = [v29 objectForKeyedSubscript:@"ServiceWhitelist"];
  uint64_t v31 = +[_NFLoyaltyAndPaymentSession validateEntitlements:v30];

  if (v31)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v32 = NFLogGetLogger();
    if (v32)
    {
      uint64_t v33 = (void (*)(uint64_t, const char *, ...))v32;
      BOOL v34 = object_getClass(self);
      BOOL v35 = class_isMetaClass(v34);
      BOOL v36 = object_getClassName(self);
      id v37 = sel_getName(sel);
      [v11 NF_userInfo];
      id v124 = v10;
      int v39 = v38 = v9;
      uint64_t v40 = [v39 objectForKeyedSubscript:@"ClientName"];
      id v123 = [v11 processIdentifier];
      uint64_t v41 = 45;
      if (v35) {
        uint64_t v41 = 43;
      }
      v33(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v41, v36, v37, 4614, v40, v123);

      id v9 = v38;
      id v10 = v124;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v42 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      int v43 = object_getClass(self);
      if (class_isMetaClass(v43)) {
        int v44 = 43;
      }
      else {
        int v44 = 45;
      }
      id v45 = object_getClassName(self);
      __int16 v46 = sel_getName(sel);
      [v11 NF_userInfo];
      v48 = int v47 = v11;
      id v49 = [v48 objectForKeyedSubscript:@"ClientName"];
      unsigned int v50 = [v47 processIdentifier];
      *(_DWORD *)buf = 67110402;
      int v139 = v44;
      __int16 v140 = 2082;
      __int16 v141 = v45;
      __int16 v142 = 2082;
      __int16 v143 = v46;
      __int16 v144 = 1024;
      int v145 = 4614;
      __int16 v146 = 2114;
      NSErrorUserInfoKey v147 = v49;
      __int16 v148 = 1024;
      unsigned int v149 = v50;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);

      id v11 = v47;
    }

    __int16 v51 = v125;
    (*((void (**)(id, void, void, void *))v125 + 2))(v125, 0, 0, v31);
    goto LABEL_63;
  }
  driverWrapper = self->_driverWrapper;
  if (!driverWrapper || !driverWrapper->_hasAntenna)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v58 = NFLogGetLogger();
    if (v58)
    {
      int v59 = (void (*)(uint64_t, const char *, ...))v58;
      v60 = object_getClass(self);
      BOOL v61 = class_isMetaClass(v60);
      __int16 v62 = object_getClassName(self);
      int v63 = sel_getName(sel);
      id v64 = [v11 NF_userInfo];
      id v65 = [v64 objectForKeyedSubscript:@"ClientName"];
      uint64_t v66 = 45;
      if (v61) {
        uint64_t v66 = 43;
      }
      v59(6, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", v66, v62, v63, 4620, v65);
    }
    uint64_t v67 = v11;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v68 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v69 = object_getClass(self);
      if (class_isMetaClass(v69)) {
        int v70 = 43;
      }
      else {
        int v70 = 45;
      }
      int v71 = object_getClassName(self);
      BOOL v72 = sel_getName(sel);
      int v73 = [v11 NF_userInfo];
      uint64_t v74 = [v73 objectForKeyedSubscript:@"ClientName"];
      *(_DWORD *)buf = 67110146;
      int v139 = v70;
      __int16 v140 = 2082;
      __int16 v141 = v71;
      __int16 v142 = 2082;
      __int16 v143 = v72;
      __int16 v144 = 1024;
      int v145 = 4620;
      __int16 v146 = 2114;
      NSErrorUserInfoKey v147 = v74;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", buf, 0x2Cu);
    }
    id v75 = objc_alloc((Class)NSError);
    id v76 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v136 = NSLocalizedDescriptionKey;
    int v77 = +[NSString stringWithUTF8String:"Feature Not Supported"];
    __int16 v137 = v77;
    id v78 = +[NSDictionary dictionaryWithObjects:&v137 forKeys:&v136 count:1];
    id v79 = [v75 initWithDomain:v76 code:14 userInfo:v78];
    __int16 v51 = v125;
    (*((void (**)(id, void, void, id))v125 + 2))(v125, 0, 0, v79);

LABEL_62:
    uint64_t v31 = 0;
    id v11 = v67;
    goto LABEL_63;
  }
  if ((id)[(_NFHardwareManager *)self nfcRadioEnabled:0 showUIPopup:sub_1000FAEAC((uint64_t)self, v10)] == (id)1)
  {
    id v80 = [(_NFXPCSession *)[_NFLoyaltyAndPaymentSession alloc] initWithRemoteObject:v9 workQueue:self->_workQueue expressModeManager:self->_expressModeManager];
    __int16 v81 = v80;
    if (v80)
    {
      [(_NFSession *)v80 setQueue:self];
      [(_NFXPCSession *)v81 setConnection:v11];
      [(_NFSession *)v81 setUid:0xFFFFFFFFLL];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v82 = [v10 objectForKey:@"session.force.express.exit"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v84 = [v10 objectForKeyedSubscript:@"session.force.express.exit"];
          -[_NFSession setForceExpressExit:](v81, "setForceExpressExit:", [v84 BOOLValue]);
        }
      }
      SEL v85 = [v11 exportedInterface];
      sub_10006E854((uint64_t)NFHardwareManagerInterface, v85);

      (*((void (**)(id, _NFLoyaltyAndPaymentSession *, BOOL, void))v125 + 2))(v125, v81, [(_NFHardwareManager *)self isFirstInQueue], 0);
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10010B784;
      block[3] = &unk_100301CE0;
      SEL v128 = v81;
      NSErrorUserInfoKey v129 = self;
      __int16 v51 = v125;
      NSErrorUserInfoKey v131 = sel;
      uint64_t v67 = v11;
      id v130 = v11;
      dispatch_async(workQueue, block);

      __int16 v87 = v128;
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v105 = NFLogGetLogger();
      if (v105)
      {
        int v106 = (void (*)(uint64_t, const char *, ...))v105;
        __int16 v107 = object_getClass(self);
        BOOL v108 = class_isMetaClass(v107);
        __int16 v109 = object_getClassName(self);
        id v122 = sel_getName(sel);
        uint64_t v110 = 45;
        if (v108) {
          uint64_t v110 = 43;
        }
        v106(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v110, v109, v122, 4636);
      }
      uint64_t v67 = v11;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      NSErrorUserInfoKey v111 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
      {
        __int16 v112 = object_getClass(self);
        if (class_isMetaClass(v112)) {
          int v113 = 43;
        }
        else {
          int v113 = 45;
        }
        __int16 v114 = object_getClassName(self);
        int v115 = sel_getName(sel);
        *(_DWORD *)buf = 67109890;
        int v139 = v113;
        __int16 v140 = 2082;
        __int16 v141 = v114;
        __int16 v142 = 2082;
        __int16 v143 = v115;
        __int16 v144 = 1024;
        int v145 = 4636;
        _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
      }

      id v116 = objc_alloc((Class)NSError);
      __int16 v87 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v132 = NSLocalizedDescriptionKey;
      id v117 = +[NSString stringWithUTF8String:"Unexpected Result"];
      NSErrorUserInfoKey v133 = v117;
      __int16 v118 = +[NSDictionary dictionaryWithObjects:&v133 forKeys:&v132 count:1];
      id v119 = [v116 initWithDomain:v87 code:13 userInfo:v118];
      __int16 v51 = v125;
      (*((void (**)(id, void, void, id))v125 + 2))(v125, 0, 0, v119);
    }
    goto LABEL_62;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v88 = NFLogGetLogger();
  if (v88)
  {
    uint64_t v89 = (void (*)(uint64_t, const char *, ...))v88;
    uint64_t v90 = object_getClass(self);
    BOOL v91 = class_isMetaClass(v90);
    id v92 = object_getClassName(self);
    id v121 = sel_getName(sel);
    uint64_t v93 = 45;
    if (v91) {
      uint64_t v93 = 43;
    }
    v89(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v93, v92, v121, 4626);
  }
  uint64_t v94 = v11;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v95 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
  {
    SEL v96 = object_getClass(self);
    if (class_isMetaClass(v96)) {
      int v97 = 43;
    }
    else {
      int v97 = 45;
    }
    v98 = object_getClassName(self);
    v99 = sel_getName(sel);
    *(_DWORD *)buf = 67109890;
    int v139 = v97;
    __int16 v140 = 2082;
    __int16 v141 = v98;
    __int16 v142 = 2082;
    __int16 v143 = v99;
    __int16 v144 = 1024;
    int v145 = 4626;
    _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
  }

  id v100 = objc_alloc((Class)NSError);
  __int16 v101 = +[NSString stringWithUTF8String:"nfcd"];
  NSErrorUserInfoKey v134 = NSLocalizedDescriptionKey;
  uint64_t v102 = +[NSString stringWithUTF8String:"NFC radio disabled"];
  v135 = v102;
  __int16 v103 = +[NSDictionary dictionaryWithObjects:&v135 forKeys:&v134 count:1];
  id v104 = [v100 initWithDomain:v101 code:50 userInfo:v103];
  __int16 v51 = v125;
  (*((void (**)(id, void, void, id))v125 + 2))(v125, 0, 0, v104);

  uint64_t v31 = 0;
  id v11 = v94;
LABEL_63:
}

- (void)queueReaderSession:(id)a3 sessionConfig:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v170 = +[NSXPCConnection currentConnection];
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v39 = objc_alloc((Class)NSError);
      uint64_t v31 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v199 = NSLocalizedDescriptionKey;
      uint64_t v32 = +[NSString stringWithUTF8String:"Invalid Parameter"];
      v200 = v32;
      uint64_t v33 = +[NSDictionary dictionaryWithObjects:&v200 forKeys:&v199 count:1];
      id v40 = [v39 initWithDomain:v31 code:10 userInfo:v33];
      (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v40);

      goto LABEL_92;
    }
  }
  id v169 = v9;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  id v166 = v10;
  id v167 = v8;
  if (Logger)
  {
    id v12 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    id v17 = [v170 NF_userInfo];
    id v18 = [v17 objectForKeyedSubscript:@"ClientName"];
    id v19 = +[NFReaderSessionConfig sessionTypeString:](NFReaderSessionConfig, "sessionTypeString:", [v9 sessionType]);
    v155 = Name;
    id v10 = v166;
    uint64_t v20 = 45;
    if (isMetaClass) {
      uint64_t v20 = 43;
    }
    v12(6, "%c[%{public}s %{public}s]:%i %{public}@, type:%{public}@", v20, ClassName, v155, 4704, v18, v19);

    id v8 = v167;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v21 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = object_getClass(self);
    if (class_isMetaClass(v22)) {
      int v23 = 43;
    }
    else {
      int v23 = 45;
    }
    int v24 = object_getClassName(self);
    int v25 = sel_getName(a2);
    int v26 = [v170 NF_userInfo];
    __int16 v27 = [v26 objectForKeyedSubscript:@"ClientName"];
    uint64_t v28 = +[NFReaderSessionConfig sessionTypeString:](NFReaderSessionConfig, "sessionTypeString:", [v9 sessionType]);
    *(_DWORD *)buf = 67110402;
    int v182 = v23;
    id v10 = v166;
    __int16 v183 = 2082;
    v184 = v24;
    __int16 v185 = 2082;
    v186 = v25;
    __int16 v187 = 1024;
    int v188 = 4704;
    __int16 v189 = 2114;
    *(void *)v190 = v27;
    *(_WORD *)&v190[8] = 2114;
    *(void *)&v190[10] = v28;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@, type:%{public}@", buf, 0x36u);

    id v8 = v167;
  }

  int v29 = -[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self);
  if ((v29 & 5) != 1)
  {
    if (v29 == 4)
    {
      id v37 = objc_alloc((Class)NSError);
      uint64_t v31 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v195 = NSLocalizedDescriptionKey;
      uint64_t v32 = +[NSString stringWithUTF8String:"No NFC on device"];
      v196 = v32;
      uint64_t v33 = +[NSDictionary dictionaryWithObjects:&v196 forKeys:&v195 count:1];
      BOOL v34 = v37;
      BOOL v35 = v31;
      uint64_t v36 = 57;
      goto LABEL_16;
    }
    if ([(NFHardwareControllerInfo *)self->_controllerInfo hasReaderModeSupport])
    {
      uint64_t v31 = [v170 NF_whitelistChecker];
      if (([v31 externalReaderAccessAllow] & 1) == 0)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v75 = NFLogGetLogger();
        if (v75)
        {
          id v76 = (void (*)(uint64_t, const char *, ...))v75;
          int v77 = object_getClass(self);
          BOOL v78 = class_isMetaClass(v77);
          id v79 = object_getClassName(self);
          id v80 = sel_getName(a2);
          id v81 = [v170 processIdentifier];
          uint64_t v82 = [v31 clientName];
          v158 = v80;
          id v8 = v167;
          uint64_t v83 = 45;
          if (v78) {
            uint64_t v83 = 43;
          }
          v76(5, "%c[%{public}s %{public}s]:%i PID %d (%{public}@) is missing the required entitlement.", v83, v79, v158, 4724, v81, v82);

          id v10 = v166;
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v84 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          SEL v85 = object_getClass(self);
          if (class_isMetaClass(v85)) {
            int v86 = 43;
          }
          else {
            int v86 = 45;
          }
          __int16 v87 = object_getClassName(self);
          uint64_t v88 = sel_getName(a2);
          unsigned int v89 = [v170 processIdentifier];
          uint64_t v90 = [v31 clientName];
          *(_DWORD *)buf = 67110402;
          int v182 = v86;
          __int16 v183 = 2082;
          v184 = v87;
          __int16 v185 = 2082;
          v186 = v88;
          __int16 v187 = 1024;
          int v188 = 4724;
          __int16 v189 = 1024;
          *(_DWORD *)v190 = v89;
          *(_WORD *)&v190[4] = 2114;
          *(void *)&v190[6] = v90;
          _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i PID %d (%{public}@) is missing the required entitlement.", buf, 0x32u);

          id v8 = v167;
        }

        id v91 = objc_alloc((Class)NSError);
        uint64_t v32 = +[NSString stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v191 = NSLocalizedDescriptionKey;
        uint64_t v33 = +[NSString stringWithUTF8String:"Not entitled"];
        v192 = v33;
        id v92 = +[NSDictionary dictionaryWithObjects:&v192 forKeys:&v191 count:1];
        id v93 = [v91 initWithDomain:v32 code:32 userInfo:v92];
        (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v93);

        goto LABEL_17;
      }
      uint64_t v41 = [v31 readerPurposeString];
      id v42 = [v41 length];

      if (!v42)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v94 = NFLogGetLogger();
        if (v94)
        {
          id v95 = (void (*)(uint64_t, const char *, ...))v94;
          SEL v96 = object_getClass(self);
          BOOL v97 = class_isMetaClass(v96);
          v98 = object_getClassName(self);
          v99 = sel_getName(a2);
          id v100 = [v170 processIdentifier];
          __int16 v101 = [v31 clientName];
          v159 = v99;
          id v8 = v167;
          uint64_t v102 = 43;
          if (!v97) {
            uint64_t v102 = 45;
          }
          v95(5, "%c[%{public}s %{public}s]:%i PID %d (%{public}@) is missing the required %{public}@ key.", v102, v98, v159, 4730, v100, v101, NFReaderPurposeStringKey);

          id v10 = v166;
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        __int16 v103 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
        {
          id v104 = object_getClass(self);
          if (class_isMetaClass(v104)) {
            int v105 = 43;
          }
          else {
            int v105 = 45;
          }
          int v106 = object_getClassName(self);
          __int16 v107 = sel_getName(a2);
          unsigned int v108 = [v170 processIdentifier];
          __int16 v109 = [v31 clientName];
          *(_DWORD *)buf = 67110658;
          int v182 = v105;
          __int16 v183 = 2082;
          v184 = v106;
          __int16 v185 = 2082;
          v186 = v107;
          __int16 v187 = 1024;
          int v188 = 4730;
          __int16 v189 = 1024;
          *(_DWORD *)v190 = v108;
          *(_WORD *)&v190[4] = 2114;
          *(void *)&v190[6] = v109;
          *(_WORD *)&v190[14] = 2114;
          *(void *)&v190[16] = NFReaderPurposeStringKey;
          _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i PID %d (%{public}@) is missing the required %{public}@ key.", buf, 0x3Cu);

          id v8 = v167;
        }

        id v110 = objc_alloc((Class)NSError);
        uint64_t v32 = +[NSString stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v179 = NSLocalizedDescriptionKey;
        CFStringRef v180 = @"This app has crashed because it attempted to access NFC NDEF reader without a usage description.  The app's Info.plist must contain an NFCReaderUsageDescription key with a string value explaining to the user how the app uses the NFC NDEF reader.";
        uint64_t v33 = +[NSDictionary dictionaryWithObjects:&v180 forKeys:&v179 count:1];
        BOOL v34 = v110;
        BOOL v35 = v32;
        uint64_t v36 = 36;
        goto LABEL_16;
      }
      if ((id)[(_NFHardwareManager *)self nfcRadioEnabled:0 showUIPopup:1] == (id)1)
      {
        int v43 = [v170 NF_userInfo];
        uint64_t v32 = [v43 objectForKeyedSubscript:@"serviceType"];

        if (v32
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && [v32 unsignedIntegerValue] == (id)2)
        {
          if ([v9 sessionType] != (id)3
            || ([v9 vasPasses],
                int v44 = objc_claimAutoreleasedReturnValue(),
                id v45 = [v44 count],
                v44,
                v45))
          {
            uint64_t v46 = +[_NFSession validateEntitlements:v31];
            if (v46)
            {
              uint64_t v33 = (void *)v46;
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v47 = NFLogGetLogger();
              if (v47)
              {
                id v48 = (void (*)(uint64_t, const char *, ...))v47;
                id v49 = object_getClass(self);
                BOOL v164 = class_isMetaClass(v49);
                v165 = object_getClassName(self);
                unsigned int v50 = sel_getName(a2);
                __int16 v51 = [v170 NF_userInfo];
                id v52 = [v51 objectForKeyedSubscript:@"ClientName"];
                id v163 = [v170 processIdentifier];
                v156 = v50;
                id v8 = v167;
                uint64_t v53 = 45;
                if (v164) {
                  uint64_t v53 = 43;
                }
                v48(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v53, v165, v156, 4760, v52, v163);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v54 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
              {
                int v55 = object_getClass(self);
                if (class_isMetaClass(v55)) {
                  int v56 = 43;
                }
                else {
                  int v56 = 45;
                }
                v57 = object_getClassName(self);
                uint64_t v58 = sel_getName(a2);
                int v59 = [v170 NF_userInfo];
                v60 = [v59 objectForKeyedSubscript:@"ClientName"];
                unsigned int v61 = [v170 processIdentifier];
                *(_DWORD *)buf = 67110402;
                int v182 = v56;
                __int16 v183 = 2082;
                v184 = v57;
                __int16 v185 = 2082;
                v186 = v58;
                __int16 v187 = 1024;
                int v188 = 4760;
                __int16 v189 = 2114;
                *(void *)v190 = v60;
                *(_WORD *)&v190[8] = 1024;
                *(_DWORD *)&v190[10] = v61;
                _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);

                id v8 = v167;
              }

              id v10 = v166;
              (*((void (**)(id, void, void, void *))v166 + 2))(v166, 0, 0, v33);
              goto LABEL_17;
            }
            buf[0] = 0;
            id v172 = 0;
            uint64_t v33 = sub_1000F8B98(self, v8, v9, (uint64_t)[v32 unsignedIntegerValue], v31, v170, buf, &v172);
            id v74 = v172;
            (*((void (**)(id, id, void, void *))v10 + 2))(v10, v74, buf[0], v33);
            workQueue = self->_workQueue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10010D3FC;
            block[3] = &unk_100301C68;
            void block[4] = self;
            dispatch_async(workQueue, block);
LABEL_49:

            goto LABEL_92;
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v142 = NFLogGetLogger();
          if (v142)
          {
            __int16 v143 = (void (*)(uint64_t, const char *, ...))v142;
            __int16 v144 = object_getClass(self);
            BOOL v145 = class_isMetaClass(v144);
            __int16 v146 = object_getClassName(self);
            v162 = sel_getName(a2);
            uint64_t v147 = 45;
            if (v145) {
              uint64_t v147 = 43;
            }
            v143(4, "%c[%{public}s %{public}s]:%i Missing VAS pass configuration", v147, v146, v162, 4752);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          __int16 v148 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
          {
            unsigned int v149 = object_getClass(self);
            if (class_isMetaClass(v149)) {
              int v150 = 43;
            }
            else {
              int v150 = 45;
            }
            v151 = object_getClassName(self);
            v152 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            int v182 = v150;
            __int16 v183 = 2082;
            v184 = v151;
            __int16 v185 = 2082;
            v186 = v152;
            __int16 v187 = 1024;
            int v188 = 4752;
            _os_log_impl((void *)&_mh_execute_header, v148, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing VAS pass configuration", buf, 0x22u);
          }

          id v153 = objc_alloc((Class)NSError);
          uint64_t v33 = +[NSString stringWithUTF8String:"nfcd"];
          NSErrorUserInfoKey v173 = NSLocalizedDescriptionKey;
          id v123 = +[NSString stringWithUTF8String:"Invalid Parameter"];
          v174 = v123;
          NSErrorUserInfoKey v136 = +[NSDictionary dictionaryWithObjects:&v174 forKeys:&v173 count:1];
          __int16 v137 = v153;
          v138 = v33;
          uint64_t v139 = 10;
        }
        else
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v125 = NFLogGetLogger();
          if (v125)
          {
            v126 = (void (*)(uint64_t, const char *, ...))v125;
            id v127 = object_getClass(self);
            BOOL v128 = class_isMetaClass(v127);
            v154 = object_getClassName(self);
            v161 = sel_getName(a2);
            uint64_t v129 = 45;
            if (v128) {
              uint64_t v129 = 43;
            }
            v126(4, "%c[%{public}s %{public}s]:%i Invalid service type: %{public}@", v129, v154, v161, 4745, v32);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          id v130 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
          {
            NSErrorUserInfoKey v131 = object_getClass(self);
            if (class_isMetaClass(v131)) {
              int v132 = 43;
            }
            else {
              int v132 = 45;
            }
            NSErrorUserInfoKey v133 = object_getClassName(self);
            NSErrorUserInfoKey v134 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            int v182 = v132;
            __int16 v183 = 2082;
            v184 = v133;
            __int16 v185 = 2082;
            v186 = v134;
            __int16 v187 = 1024;
            int v188 = 4745;
            __int16 v189 = 2114;
            *(void *)v190 = v32;
            _os_log_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid service type: %{public}@", buf, 0x2Cu);
          }

          id v135 = objc_alloc((Class)NSError);
          uint64_t v33 = +[NSString stringWithUTF8String:"nfcd"];
          NSErrorUserInfoKey v175 = NSLocalizedDescriptionKey;
          id v123 = +[NSString stringWithUTF8String:"Invalid State"];
          v176 = v123;
          NSErrorUserInfoKey v136 = +[NSDictionary dictionaryWithObjects:&v176 forKeys:&v175 count:1];
          __int16 v137 = v135;
          v138 = v33;
          uint64_t v139 = 12;
        }
        id v140 = [v137 initWithDomain:v138 code:v139 userInfo:v136];
        (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v140);
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v111 = NFLogGetLogger();
        if (v111)
        {
          __int16 v112 = (void (*)(uint64_t, const char *, ...))v111;
          int v113 = object_getClass(self);
          BOOL v114 = class_isMetaClass(v113);
          int v115 = object_getClassName(self);
          v160 = sel_getName(a2);
          uint64_t v116 = 45;
          if (v114) {
            uint64_t v116 = 43;
          }
          v112(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v116, v115, v160, 4737);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        id v117 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
        {
          __int16 v118 = object_getClass(self);
          if (class_isMetaClass(v118)) {
            int v119 = 43;
          }
          else {
            int v119 = 45;
          }
          id v120 = object_getClassName(self);
          id v121 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v182 = v119;
          __int16 v183 = 2082;
          v184 = v120;
          __int16 v185 = 2082;
          v186 = v121;
          __int16 v187 = 1024;
          int v188 = 4737;
          _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
        }

        id v122 = objc_alloc((Class)NSError);
        uint64_t v32 = +[NSString stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v177 = NSLocalizedDescriptionKey;
        uint64_t v33 = +[NSString stringWithUTF8String:"NFC radio disabled"];
        v178 = v33;
        id v123 = +[NSDictionary dictionaryWithObjects:&v178 forKeys:&v177 count:1];
        id v124 = [v122 initWithDomain:v32 code:50 userInfo:v123];
        (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v124);
      }
      goto LABEL_92;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v62 = NFLogGetLogger();
    if (v62)
    {
      int v63 = (void (*)(uint64_t, const char *, ...))v62;
      id v64 = object_getClass(self);
      BOOL v65 = class_isMetaClass(v64);
      uint64_t v66 = object_getClassName(self);
      v157 = sel_getName(a2);
      uint64_t v67 = 45;
      if (v65) {
        uint64_t v67 = 43;
      }
      v63(3, "%c[%{public}s %{public}s]:%i ReaderMode Not Supported.", v67, v66, v157, 4716);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v68 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      uint64_t v69 = object_getClass(self);
      if (class_isMetaClass(v69)) {
        int v70 = 43;
      }
      else {
        int v70 = 45;
      }
      int v71 = object_getClassName(self);
      BOOL v72 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v182 = v70;
      __int16 v183 = 2082;
      v184 = v71;
      __int16 v185 = 2082;
      v186 = v72;
      __int16 v187 = 1024;
      int v188 = 4716;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i ReaderMode Not Supported.", buf, 0x22u);
    }

    id v73 = objc_alloc((Class)NSError);
    uint64_t v31 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v193 = NSLocalizedDescriptionKey;
    uint64_t v32 = +[NSString stringWithUTF8String:"Feature Not Supported"];
    v194 = v32;
    uint64_t v33 = +[NSDictionary dictionaryWithObjects:&v194 forKeys:&v193 count:1];
    id v74 = [v73 initWithDomain:v31 code:14 userInfo:v33];
    (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v74);
    goto LABEL_49;
  }
  id v30 = objc_alloc((Class)NSError);
  uint64_t v31 = +[NSString stringWithUTF8String:"nfcd"];
  NSErrorUserInfoKey v197 = NSLocalizedDescriptionKey;
  uint64_t v32 = +[NSString stringWithUTF8String:"Unresponsive hardware"];
  v198 = v32;
  uint64_t v33 = +[NSDictionary dictionaryWithObjects:&v198 forKeys:&v197 count:1];
  BOOL v34 = v30;
  BOOL v35 = v31;
  uint64_t v36 = 58;
LABEL_16:
  id v38 = [v34 initWithDomain:v35 code:v36 userInfo:v33];
  (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v38);

LABEL_17:
  id v9 = v169;
LABEL_92:
}

- (void)areFeaturesSupported:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = +[NSXPCConnection currentConnection];
  workQueue = self->_workQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10010D4D4;
  v11[3] = &unk_100302278;
  id v13 = v6;
  unint64_t v14 = a3;
  v11[4] = self;
  id v12 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, v11);
}

- (void)configureReaderModeRFForTransitPartner:(BOOL)a3 transitPartner:(unsigned int)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = +[NSXPCConnection currentConnection];
  workQueue = self->_workQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10010D9C4;
  v13[3] = &unk_1003047E0;
  BOOL v17 = a3;
  unsigned int v16 = a4;
  v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(workQueue, v13);
}

- (void)queueReaderSessionInternal:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v148 = a4;
  id v146 = a5;
  id v10 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v12 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    [v10 NF_userInfo];
    v18 = BOOL v17 = v10;
    id v19 = [v18 objectForKeyedSubscript:@"ClientName"];
    uint64_t v20 = 45;
    if (isMetaClass) {
      uint64_t v20 = 43;
    }
    v12(6, "%c[%{public}s %{public}s]:%i %{public}@", v20, ClassName, Name, 4881, v19);

    id v10 = v17;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v21 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = object_getClass(self);
    id v23 = v9;
    if (class_isMetaClass(v22)) {
      int v24 = 43;
    }
    else {
      int v24 = 45;
    }
    int v25 = object_getClassName(self);
    int v26 = sel_getName(a2);
    __int16 v27 = [v10 NF_userInfo];
    uint64_t v28 = [v27 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    int v165 = v24;
    id v9 = v23;
    __int16 v166 = 2082;
    id v167 = v25;
    __int16 v168 = 2082;
    id v169 = v26;
    __int16 v170 = 1024;
    int v171 = 4881;
    __int16 v172 = 2114;
    *(void *)NSErrorUserInfoKey v173 = v28;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  int v29 = [v10 NF_whitelistChecker];
  uint64_t v147 = v9;
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) != 2)
  {
    BOOL v35 = v29;
    id v52 = objc_alloc((Class)NSError);
    uint64_t v53 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v176 = NSLocalizedDescriptionKey;
    uint64_t v32 = +[NSString stringWithUTF8String:"Unresponsive hardware"];
    NSErrorUserInfoKey v177 = v32;
    uint64_t v54 = +[NSDictionary dictionaryWithObjects:&v177 forKeys:&v176 count:1];
    int v55 = v52;
    int v56 = v53;
    uint64_t v57 = 58;
LABEL_50:
    id v89 = [v55 initWithDomain:v56 code:v57 userInfo:v54];
    unsigned int v50 = v146;
    (*((void (**)(id, void, void, id))v146 + 2))(v146, 0, 0, v89);

    __int16 v51 = v148;
    goto LABEL_51;
  }
  if (![(NFHardwareControllerInfo *)self->_controllerInfo hasReaderModeSupport])
  {
    BOOL v35 = v29;
    id v58 = objc_alloc((Class)NSError);
    uint64_t v53 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v174 = NSLocalizedDescriptionKey;
    uint64_t v32 = +[NSString stringWithUTF8String:"Feature Not Supported"];
    NSErrorUserInfoKey v175 = v32;
    uint64_t v54 = +[NSDictionary dictionaryWithObjects:&v175 forKeys:&v174 count:1];
    int v55 = v58;
    int v56 = v53;
    uint64_t v57 = 14;
    goto LABEL_50;
  }
  if (([v29 readerInternalAccess] & 1) == 0)
  {
    BOOL v35 = v29;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v59 = NFLogGetLogger();
    if (v59)
    {
      v60 = (void (*)(uint64_t, const char *, ...))v59;
      unsigned int v61 = object_getClass(self);
      BOOL v62 = class_isMetaClass(v61);
      int v63 = object_getClassName(self);
      id v64 = sel_getName(a2);
      BOOL v65 = v10;
      id v66 = [v10 processIdentifier];
      uint64_t v67 = [v29 clientName];
      id v137 = v66;
      id v10 = v65;
      uint64_t v68 = 45;
      if (v62) {
        uint64_t v68 = 43;
      }
      v60(5, "%c[%{public}s %{public}s]:%i PID %d (%{public}@) is missing the required entitlement.", v68, v63, v64, 4896, v137, v67);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v69 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      int v70 = object_getClass(self);
      if (class_isMetaClass(v70)) {
        int v71 = 43;
      }
      else {
        int v71 = 45;
      }
      BOOL v72 = object_getClassName(self);
      id v73 = sel_getName(a2);
      unsigned int v74 = [v10 processIdentifier];
      uint64_t v75 = [v35 clientName];
      *(_DWORD *)buf = 67110402;
      int v165 = v71;
      __int16 v166 = 2082;
      id v167 = v72;
      __int16 v168 = 2082;
      id v169 = v73;
      __int16 v170 = 1024;
      int v171 = 4896;
      __int16 v172 = 1024;
      *(_DWORD *)NSErrorUserInfoKey v173 = v74;
      *(_WORD *)&v173[4] = 2114;
      *(void *)&v173[6] = v75;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i PID %d (%{public}@) is missing the required entitlement.", buf, 0x32u);
    }
    id v76 = objc_alloc((Class)NSError);
    uint64_t v53 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v162 = NSLocalizedDescriptionKey;
    uint64_t v32 = +[NSString stringWithUTF8String:"Not entitled"];
    id v163 = v32;
    uint64_t v54 = +[NSDictionary dictionaryWithObjects:&v163 forKeys:&v162 count:1];
    int v55 = v76;
    int v56 = v53;
    uint64_t v57 = 32;
    goto LABEL_50;
  }
  if ((id)[(_NFHardwareManager *)self nfcRadioEnabled:0 showUIPopup:sub_1000FAEAC((uint64_t)self, v148)] != (id)1)
  {
    BOOL v35 = v29;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v77 = NFLogGetLogger();
    if (v77)
    {
      BOOL v78 = (void (*)(uint64_t, const char *, ...))v77;
      id v79 = object_getClass(self);
      BOOL v80 = class_isMetaClass(v79);
      id v81 = object_getClassName(self);
      NSErrorUserInfoKey v134 = sel_getName(a2);
      uint64_t v82 = 45;
      if (v80) {
        uint64_t v82 = 43;
      }
      v78(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v82, v81, v134, 4902);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v83 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      v84 = object_getClass(self);
      if (class_isMetaClass(v84)) {
        int v85 = 43;
      }
      else {
        int v85 = 45;
      }
      int v86 = object_getClassName(self);
      __int16 v87 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v165 = v85;
      __int16 v166 = 2082;
      id v167 = v86;
      __int16 v168 = 2082;
      id v169 = v87;
      __int16 v170 = 1024;
      int v171 = 4902;
      _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
    }

    id v88 = objc_alloc((Class)NSError);
    uint64_t v53 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v160 = NSLocalizedDescriptionKey;
    uint64_t v32 = +[NSString stringWithUTF8String:"NFC radio disabled"];
    v161 = v32;
    uint64_t v54 = +[NSDictionary dictionaryWithObjects:&v161 forKeys:&v160 count:1];
    int v55 = v88;
    int v56 = v53;
    uint64_t v57 = 50;
    goto LABEL_50;
  }
  id v30 = [v10 NF_userInfo];
  uint64_t v31 = [v30 objectForKeyedSubscript:@"serviceType"];

  uint64_t v142 = v31;
  if (v31
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [v31 unsignedIntegerValue] == (id)1)
  {
    __int16 v141 = v10;
    uint64_t v32 = +[_NFSession validateEntitlements:v29];
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v33 = NFLogGetLogger();
    BOOL v34 = (void (*)(uint64_t, const char *, ...))v33;
    if (v32)
    {
      BOOL v35 = v29;
      if (v33)
      {
        uint64_t v36 = object_getClass(self);
        BOOL v143 = class_isMetaClass(v36);
        id v37 = object_getClassName(self);
        id v38 = sel_getName(a2);
        id v39 = [v141 NF_userInfo];
        id v40 = [v39 objectForKeyedSubscript:@"ClientName"];
        id v138 = [v141 processIdentifier];
        uint64_t v41 = 45;
        if (v143) {
          uint64_t v41 = 43;
        }
        v34(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v41, v37, v38, 4917, v40, v138);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v42 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        int v43 = object_getClass(self);
        if (class_isMetaClass(v43)) {
          int v44 = 43;
        }
        else {
          int v44 = 45;
        }
        int v144 = v44;
        id v45 = object_getClassName(self);
        uint64_t v46 = sel_getName(a2);
        uint64_t v47 = [v141 NF_userInfo];
        id v48 = [v47 objectForKeyedSubscript:@"ClientName"];
        unsigned int v49 = [v141 processIdentifier];
        *(_DWORD *)buf = 67110402;
        int v165 = v144;
        __int16 v166 = 2082;
        id v167 = v45;
        __int16 v168 = 2082;
        id v169 = v46;
        __int16 v170 = 1024;
        int v171 = 4917;
        __int16 v172 = 2114;
        *(void *)NSErrorUserInfoKey v173 = v48;
        *(_WORD *)&v173[8] = 1024;
        *(_DWORD *)&v173[10] = v49;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);
      }
      unsigned int v50 = v146;
      (*((void (**)(id, void, void, void *))v146 + 2))(v146, 0, 0, v32);
      __int16 v51 = v148;
      id v10 = v141;
    }
    else
    {
      if (v33)
      {
        id v104 = object_getClass(self);
        BOOL v105 = class_isMetaClass(v104);
        NSErrorUserInfoKey v133 = object_getClassName(self);
        NSErrorUserInfoKey v136 = sel_getName(a2);
        uint64_t v106 = 45;
        if (v105) {
          uint64_t v106 = 43;
        }
        v34(6, "%c[%{public}s %{public}s]:%i attribute=%{public}@", v106, v133, v136, 4922, v148);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v107 = NFSharedLogGetLogger();
      __int16 v51 = v148;
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v108 = object_getClass(self);
        if (class_isMetaClass(v108)) {
          int v109 = 43;
        }
        else {
          int v109 = 45;
        }
        id v110 = object_getClassName(self);
        uint64_t v111 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v165 = v109;
        __int16 v166 = 2082;
        id v167 = v110;
        __int16 v168 = 2082;
        id v169 = v111;
        __int16 v170 = 1024;
        int v171 = 4922;
        __int16 v172 = 2114;
        *(void *)NSErrorUserInfoKey v173 = v148;
        _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i attribute=%{public}@", buf, 0x2Cu);
      }

      __int16 v112 = [v148 NF_arrayForKey:@"session.suspendOnECP"];
      BOOL v145 = objc_opt_new();
      id v140 = v112;
      if ([v112 count])
      {
        uint64_t v139 = v29;
        long long v153 = 0u;
        long long v154 = 0u;
        long long v151 = 0u;
        long long v152 = 0u;
        id v113 = v112;
        id v114 = [v113 countByEnumeratingWithState:&v151 objects:v157 count:16];
        if (v114)
        {
          id v115 = v114;
          uint64_t v116 = *(void *)v152;
          do
          {
            for (i = 0; i != v115; i = (char *)i + 1)
            {
              if (*(void *)v152 != v116) {
                objc_enumerationMutation(v113);
              }
              __int16 v118 = *(void **)(*((void *)&v151 + 1) + 8 * i);
              if ([v118 length])
              {
                v155[0] = @"ECPData";
                v155[1] = @"IgnoreRFTechOnIsEqual";
                v156[0] = v118;
                v156[1] = &off_10031B748;
                int v119 = +[NSDictionary dictionaryWithObjects:v156 forKeys:v155 count:2];
                id v120 = +[NFFieldNotification notificationWithDictionary:v119];

                if (v120) {
                  [v145 addObject:v120];
                }
              }
            }
            id v115 = [v113 countByEnumeratingWithState:&v151 objects:v157 count:16];
          }
          while (v115);
        }

        __int16 v51 = v148;
        int v29 = v139;
      }
      buf[0] = 0;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v121 = [v51 objectForKey:@"session.show.corenfc.ui"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        id v10 = v141;
        if (isKindOfClass)
        {
          id v123 = [v51 objectForKeyedSubscript:@"session.show.corenfc.ui"];
          if ([v123 BOOLValue]) {
            uint64_t v124 = 3;
          }
          else {
            uint64_t v124 = 0;
          }
        }
        else
        {
          uint64_t v124 = 0;
        }
      }
      else
      {
        uint64_t v124 = 0;
        id v10 = v141;
      }
      uint64_t v125 = +[NFReaderSessionConfig sessionConfigWithUIMode:v124 sessionType:4 initialScanText:0 vasPass:0];
      id v126 = [v142 unsignedIntegerValue];
      id v150 = 0;
      id v127 = v9;
      BOOL v35 = v29;
      uint64_t v32 = sub_1000F8B98(self, v127, v125, (uint64_t)v126, v29, v10, buf, &v150);
      id v128 = v150;
      uint64_t v129 = v128;
      if (!v32) {
        [v128 setSuspendOnFieldList:v145];
      }
      id v130 = [v10 exportedInterface];
      sub_10006E7D4((uint64_t)NFHardwareManagerInterface, v130);

      unsigned int v50 = v146;
      (*((void (**)(id, void *, void, void *))v146 + 2))(v146, v129, buf[0], v32);
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10010F120;
      block[3] = &unk_100301C68;
      void block[4] = self;
      dispatch_async(workQueue, block);
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v90 = NFLogGetLogger();
    if (v90)
    {
      id v91 = (void (*)(uint64_t, const char *, ...))v90;
      id v92 = object_getClass(self);
      BOOL v93 = class_isMetaClass(v92);
      int v132 = object_getClassName(self);
      id v135 = sel_getName(a2);
      uint64_t v94 = 45;
      if (v93) {
        uint64_t v94 = 43;
      }
      v91(4, "%c[%{public}s %{public}s]:%i Invalid service type: %{public}@", v94, v132, v135, 4910, v31);
    }
    BOOL v35 = v29;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v95 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
    {
      SEL v96 = object_getClass(self);
      if (class_isMetaClass(v96)) {
        int v97 = 43;
      }
      else {
        int v97 = 45;
      }
      v98 = object_getClassName(self);
      v99 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v165 = v97;
      __int16 v166 = 2082;
      id v167 = v98;
      __int16 v168 = 2082;
      id v169 = v99;
      __int16 v170 = 1024;
      int v171 = 4910;
      __int16 v172 = 2114;
      *(void *)NSErrorUserInfoKey v173 = v142;
      _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid service type: %{public}@", buf, 0x2Cu);
    }

    id v100 = objc_alloc((Class)NSError);
    uint64_t v32 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v158 = NSLocalizedDescriptionKey;
    __int16 v101 = +[NSString stringWithUTF8String:"Invalid State"];
    v159 = v101;
    uint64_t v102 = +[NSDictionary dictionaryWithObjects:&v159 forKeys:&v158 count:1];
    id v103 = [v100 initWithDomain:v32 code:12 userInfo:v102];
    unsigned int v50 = v146;
    (*((void (**)(id, void, void, id))v146 + 2))(v146, 0, 0, v103);

    __int16 v51 = v148;
  }
  uint64_t v53 = v142;
LABEL_51:
}

- (void)queueSeshatSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v71 = a3;
  id v70 = a4;
  id v73 = (void (**)(id, void, void *))a5;
  id v8 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    if (class_isMetaClass(Class)) {
      uint64_t v12 = 43;
    }
    else {
      uint64_t v12 = 45;
    }
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    id v15 = [v8 NF_userInfo];
    unsigned int v16 = [v15 objectForKeyedSubscript:@"ClientName"];
    v10(6, "%c[%{public}s %{public}s]:%i %{public}@", v12, ClassName, Name, 4986, v16);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  BOOL v17 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = object_getClass(self);
    if (class_isMetaClass(v18)) {
      int v19 = 43;
    }
    else {
      int v19 = 45;
    }
    uint64_t v20 = object_getClassName(self);
    uint64_t v21 = sel_getName(a2);
    uint64_t v22 = [v8 NF_userInfo];
    id v23 = [v22 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    int v78 = v19;
    __int16 v79 = 2082;
    BOOL v80 = v20;
    __int16 v81 = 2082;
    uint64_t v82 = v21;
    __int16 v83 = 1024;
    int v84 = 4986;
    __int16 v85 = 2114;
    int v86 = v23;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 2
    || -[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 5)
  {
    int v24 = [v8 NF_userInfo];
    int v25 = [v24 objectForKeyedSubscript:@"ServiceWhitelist"];
    int v26 = +[_NFSeshatSession validateEntitlements:v25];

    if (v26)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v27 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v27)
      {
        uint64_t v28 = object_getClass(self);
        if (class_isMetaClass(v28)) {
          uint64_t v29 = 43;
        }
        else {
          uint64_t v29 = 45;
        }
        id v30 = object_getClassName(self);
        uint64_t v31 = sel_getName(a2);
        uint64_t v32 = [v8 NF_userInfo];
        uint64_t v33 = [v32 objectForKeyedSubscript:@"ClientName"];
        v27(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v29, v30, v31, 4995, v33, [v8 processIdentifier]);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      BOOL v34 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        BOOL v35 = object_getClass(self);
        if (class_isMetaClass(v35)) {
          int v36 = 43;
        }
        else {
          int v36 = 45;
        }
        id v37 = object_getClassName(self);
        id v38 = sel_getName(a2);
        id v39 = [v8 NF_userInfo];
        id v40 = [v39 objectForKeyedSubscript:@"ClientName"];
        unsigned int v41 = [v8 processIdentifier];
        *(_DWORD *)buf = 67110402;
        int v78 = v36;
        __int16 v79 = 2082;
        BOOL v80 = v37;
        __int16 v81 = 2082;
        uint64_t v82 = v38;
        __int16 v83 = 1024;
        int v84 = 4995;
        __int16 v85 = 2114;
        int v86 = v40;
        __int16 v87 = 1024;
        unsigned int v88 = v41;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);
      }
      v73[2](v73, 0, v26);
    }
    else
    {
      id v42 = [(_NFXPCSession *)[_NFSeshatSession alloc] initWithRemoteObject:v71 workQueue:self->_workQueue];
      int v43 = v42;
      if (v42)
      {
        [(_NFSession *)v42 setQueue:self];
        [(_NFXPCSession *)v43 setConnection:v8];
        [(_NFSession *)v43 setUid:0xFFFFFFFFLL];
        [(_NFSeshatSession *)v43 setDriverWrapper:self->_driverWrapper];
        int v44 = self->_secureElementSessionQueue;
        objc_sync_enter(v44);
        id v45 = [v8 NF_userInfo];
        uint64_t v46 = [v45 objectForKeyedSubscript:@"ProxyObjects"];
        [v46 addObject:v43];

        if (!self->_currentSecureElementSession && ![(NSMutableArray *)self->_secureElementSessionQueue count]) {
          sub_1000EA4BC(self, 1);
        }
        [(NSMutableArray *)self->_secureElementSessionQueue insertObject:v43 atIndex:0];
        objc_sync_exit(v44);

        uint64_t v47 = [v8 exportedInterface];
        sub_10006E754((uint64_t)NFHardwareManagerInterface, v47);

        ((void (**)(id, _NFSeshatSession *, void *))v73)[2](v73, v43, 0);
        workQueue = self->_workQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10010FA48;
        block[3] = &unk_100301C68;
        void block[4] = self;
        dispatch_async(workQueue, block);
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v53 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v53)
        {
          uint64_t v54 = object_getClass(self);
          if (class_isMetaClass(v54)) {
            uint64_t v55 = 43;
          }
          else {
            uint64_t v55 = 45;
          }
          int v56 = object_getClassName(self);
          uint64_t v57 = sel_getName(a2);
          v53(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v55, v56, v57, 5002);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        id v58 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          uint64_t v59 = object_getClass(self);
          if (class_isMetaClass(v59)) {
            int v60 = 43;
          }
          else {
            int v60 = 45;
          }
          unsigned int v61 = object_getClassName(self);
          BOOL v62 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v78 = v60;
          __int16 v79 = 2082;
          BOOL v80 = v61;
          __int16 v81 = 2082;
          uint64_t v82 = v62;
          __int16 v83 = 1024;
          int v84 = 5002;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
        }

        id v63 = objc_alloc((Class)NSError);
        id v64 = +[NSString stringWithUTF8String:"nfcd"];
        v75[0] = NSLocalizedDescriptionKey;
        BOOL v65 = +[NSString stringWithUTF8String:"Unexpected Result"];
        v76[0] = v65;
        v76[1] = &off_10031BCD0;
        v75[1] = @"Line";
        v75[2] = @"Method";
        id v66 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v76[2] = v66;
        v75[3] = NSDebugDescriptionErrorKey;
        id v67 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 5003];
        v76[3] = v67;
        uint64_t v68 = +[NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:4];
        id v69 = [v63 initWithDomain:v64 code:13 userInfo:v68];
        v73[2](v73, 0, v69);
      }
      int v26 = 0;
    }
  }
  else
  {
    id v49 = objc_alloc((Class)NSError);
    int v26 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v89 = NSLocalizedDescriptionKey;
    unsigned int v50 = +[NSString stringWithUTF8String:"Unresponsive hardware"];
    uint64_t v90 = v50;
    __int16 v51 = +[NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
    id v52 = [v49 initWithDomain:v26 code:58 userInfo:v51];
    v73[2](v73, 0, v52);
  }
}

- (void)areSessionsAllowedWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = +[NSXPCConnection currentConnection];
  workQueue = self->_workQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10010FB20;
  v10[3] = &unk_100302278;
  id v12 = v5;
  SEL v13 = a2;
  v10[4] = self;
  id v11 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(workQueue, v10);
}

- (void)queuePeerPaymentSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v72 = a3;
  id v71 = a5;
  id v8 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    id v15 = [v8 NF_userInfo];
    unsigned int v16 = [v15 objectForKeyedSubscript:@"ClientName"];
    uint64_t v17 = 45;
    if (isMetaClass) {
      uint64_t v17 = 43;
    }
    v10(6, "%c[%{public}s %{public}s]:%i %{public}@", v17, ClassName, Name, 5065, v16);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = object_getClass(self);
    if (class_isMetaClass(v19)) {
      int v20 = 43;
    }
    else {
      int v20 = 45;
    }
    uint64_t v21 = object_getClassName(self);
    uint64_t v22 = sel_getName(a2);
    id v23 = [v8 NF_userInfo];
    int v24 = [v23 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    int v80 = v20;
    __int16 v81 = 2082;
    uint64_t v82 = v21;
    __int16 v83 = 2082;
    int v84 = v22;
    __int16 v85 = 1024;
    int v86 = 5065;
    __int16 v87 = 2114;
    unsigned int v88 = v24;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 2
    || -[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 5)
  {
    int v25 = [v8 NF_userInfo];
    int v26 = [v25 objectForKeyedSubscript:@"ServiceWhitelist"];
    __int16 v27 = +[_NFPeerPaymentSession validateEntitlements:v26];

    if (v27)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v28 = NFLogGetLogger();
      if (v28)
      {
        uint64_t v29 = (void (*)(uint64_t, const char *, ...))v28;
        id v30 = object_getClass(self);
        BOOL v31 = class_isMetaClass(v30);
        uint64_t v32 = object_getClassName(self);
        uint64_t v33 = sel_getName(a2);
        BOOL v34 = [v8 NF_userInfo];
        BOOL v35 = [v34 objectForKeyedSubscript:@"ClientName"];
        id v70 = [v8 processIdentifier];
        uint64_t v36 = 45;
        if (v31) {
          uint64_t v36 = 43;
        }
        v29(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v36, v32, v33, 5084, v35, v70);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v37 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        id v38 = object_getClass(self);
        if (class_isMetaClass(v38)) {
          int v39 = 43;
        }
        else {
          int v39 = 45;
        }
        id v40 = object_getClassName(self);
        unsigned int v41 = sel_getName(a2);
        id v42 = [v8 NF_userInfo];
        int v43 = [v42 objectForKeyedSubscript:@"ClientName"];
        unsigned int v44 = [v8 processIdentifier];
        *(_DWORD *)buf = 67110402;
        int v80 = v39;
        __int16 v81 = 2082;
        uint64_t v82 = v40;
        __int16 v83 = 2082;
        int v84 = v41;
        __int16 v85 = 1024;
        int v86 = 5084;
        __int16 v87 = 2114;
        unsigned int v88 = v43;
        __int16 v89 = 1024;
        unsigned int v90 = v44;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);
      }
      id v45 = v71;
      (*((void (**)(id, void, void, void *))v71 + 2))(v71, 0, 0, v27);
    }
    else
    {
      uint64_t v46 = [(_NFXPCSession *)[_NFPeerPaymentSession alloc] initWithRemoteObject:v72 workQueue:self->_workQueue];
      uint64_t v47 = v46;
      if (v46)
      {
        [(_NFSession *)v46 setQueue:self];
        [(_NFXPCSession *)v47 setConnection:v8];
        [(_NFSession *)v47 setUid:0xFFFFFFFFLL];
        id v45 = v71;
        (*((void (**)(id, _NFPeerPaymentSession *, BOOL, void))v71 + 2))(v71, v47, [(_NFHardwareManager *)self isFirstInQueue], 0);
        workQueue = self->_workQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1001105DC;
        block[3] = &unk_100301CE0;
        void block[4] = self;
        unsigned int v74 = v47;
        SEL v76 = a2;
        id v75 = v8;
        dispatch_async(workQueue, block);
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v53 = NFLogGetLogger();
        if (v53)
        {
          uint64_t v54 = (void (*)(uint64_t, const char *, ...))v53;
          uint64_t v55 = object_getClass(self);
          BOOL v56 = class_isMetaClass(v55);
          uint64_t v57 = object_getClassName(self);
          id v69 = sel_getName(a2);
          uint64_t v58 = 45;
          if (v56) {
            uint64_t v58 = 43;
          }
          v54(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v58, v57, v69, 5091);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v59 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          int v60 = object_getClass(self);
          if (class_isMetaClass(v60)) {
            int v61 = 43;
          }
          else {
            int v61 = 45;
          }
          BOOL v62 = object_getClassName(self);
          id v63 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v80 = v61;
          __int16 v81 = 2082;
          uint64_t v82 = v62;
          __int16 v83 = 2082;
          int v84 = v63;
          __int16 v85 = 1024;
          int v86 = 5091;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
        }

        id v64 = objc_alloc((Class)NSError);
        BOOL v65 = +[NSString stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v77 = NSLocalizedDescriptionKey;
        id v66 = +[NSString stringWithUTF8String:"Unexpected Result"];
        int v78 = v66;
        id v67 = +[NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
        id v68 = [v64 initWithDomain:v65 code:13 userInfo:v67];
        id v45 = v71;
        (*((void (**)(id, void, void, id))v71 + 2))(v71, 0, 0, v68);
      }
      __int16 v27 = 0;
    }
  }
  else
  {
    id v49 = objc_alloc((Class)NSError);
    __int16 v27 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v91 = NSLocalizedDescriptionKey;
    unsigned int v50 = +[NSString stringWithUTF8String:"Unresponsive hardware"];
    id v92 = v50;
    __int16 v51 = +[NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
    id v52 = [v49 initWithDomain:v27 code:58 userInfo:v51];
    id v45 = v71;
    (*((void (**)(id, void, void, id))v71 + 2))(v71, 0, 0, v52);
  }
}

- (void)queueTrustSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v63 = a3;
  id v62 = a5;
  id v8 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    id v15 = [v8 NF_userInfo];
    unsigned int v16 = [v15 objectForKeyedSubscript:@"ClientName"];
    uint64_t v17 = 45;
    if (isMetaClass) {
      uint64_t v17 = 43;
    }
    v10(6, "%c[%{public}s %{public}s]:%i %{public}@", v17, ClassName, Name, 5135, v16);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = object_getClass(self);
    if (class_isMetaClass(v19)) {
      int v20 = 43;
    }
    else {
      int v20 = 45;
    }
    uint64_t v21 = object_getClassName(self);
    uint64_t v22 = sel_getName(a2);
    id v23 = [v8 NF_userInfo];
    int v24 = [v23 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    int v71 = v20;
    __int16 v72 = 2082;
    id v73 = v21;
    __int16 v74 = 2082;
    id v75 = v22;
    __int16 v76 = 1024;
    int v77 = 5135;
    __int16 v78 = 2114;
    __int16 v79 = v24;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 2
    || -[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 5)
  {
    int v25 = [v8 NF_userInfo];
    int v26 = [v25 objectForKeyedSubscript:@"ServiceWhitelist"];
    __int16 v27 = +[_NFTrustSession validateEntitlements:v26];

    if (v27)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v28 = NFLogGetLogger();
      if (v28)
      {
        uint64_t v29 = (void (*)(uint64_t, const char *, ...))v28;
        id v30 = object_getClass(self);
        BOOL v31 = class_isMetaClass(v30);
        uint64_t v32 = object_getClassName(self);
        uint64_t v33 = sel_getName(a2);
        BOOL v34 = [v8 NF_userInfo];
        BOOL v35 = [v34 objectForKeyedSubscript:@"ClientName"];
        id v61 = [v8 processIdentifier];
        uint64_t v36 = 45;
        if (v31) {
          uint64_t v36 = 43;
        }
        v29(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v36, v32, v33, 5154, v35, v61);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v37 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        id v38 = object_getClass(self);
        if (class_isMetaClass(v38)) {
          int v39 = 43;
        }
        else {
          int v39 = 45;
        }
        id v40 = object_getClassName(self);
        unsigned int v41 = sel_getName(a2);
        id v42 = [v8 NF_userInfo];
        int v43 = [v42 objectForKeyedSubscript:@"ClientName"];
        unsigned int v44 = [v8 processIdentifier];
        *(_DWORD *)buf = 67110402;
        int v71 = v39;
        __int16 v72 = 2082;
        id v73 = v40;
        __int16 v74 = 2082;
        id v75 = v41;
        __int16 v76 = 1024;
        int v77 = 5154;
        __int16 v78 = 2114;
        __int16 v79 = v43;
        __int16 v80 = 1024;
        unsigned int v81 = v44;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);
      }
      id v45 = v62;
      (*((void (**)(id, void, void, void *))v62 + 2))(v62, 0, 0, v27);
    }
    else
    {
      uint64_t v46 = [[_NFTrustSession alloc] initWithRemoteObject:v63 workQueue:self->_workQueue];
      uint64_t v47 = v46;
      if (v46)
      {
        [(_NFSession *)v46 setQueue:self];
        [(_NFXPCSession *)v47 setConnection:v8];
        id v48 = [v8 NF_userInfo];
        id v49 = [v48 objectForKeyedSubscript:@"ServiceWhitelist"];
        unsigned int v50 = [v49 applicationIdentifier];
        [(_NFTrustSession *)v47 setApplicationIdentifier:v50];

        [(_NFSession *)v47 setUid:0xFFFFFFFFLL];
        id v45 = v62;
        (*((void (**)(id, _NFTrustSession *, BOOL, void))v62 + 2))(v62, v47, [(_NFHardwareManager *)self isFirstInQueue], 0);
        workQueue = self->_workQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100111428;
        block[3] = &unk_100301CE0;
        void block[4] = self;
        BOOL v65 = v47;
        SEL v67 = a2;
        id v66 = v8;
        dispatch_async(workQueue, block);
      }
      else
      {
        id v56 = objc_alloc((Class)NSError);
        uint64_t v57 = +[NSString stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v68 = NSLocalizedDescriptionKey;
        uint64_t v58 = +[NSString stringWithUTF8String:"Unknown Error"];
        id v69 = v58;
        uint64_t v59 = +[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
        id v60 = [v56 initWithDomain:v57 code:6 userInfo:v59];
        id v45 = v62;
        (*((void (**)(id, void, void, id))v62 + 2))(v62, 0, 0, v60);
      }
      __int16 v27 = 0;
    }
  }
  else
  {
    id v52 = objc_alloc((Class)NSError);
    __int16 v27 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v82 = NSLocalizedDescriptionKey;
    uint64_t v53 = +[NSString stringWithUTF8String:"Unresponsive hardware"];
    __int16 v83 = v53;
    uint64_t v54 = +[NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
    id v55 = [v52 initWithDomain:v27 code:58 userInfo:v54];
    id v45 = v62;
    (*((void (**)(id, void, void, id))v62 + 2))(v62, 0, 0, v55);
  }
}

- (void)queueNdefTagSession:(id)a3 sessionAttribute:(id)a4 data:(id)a5 completion:(id)a6
{
  id v98 = a3;
  id v99 = a4;
  id v97 = a5;
  id v96 = a6;
  id v11 = +[NSXPCConnection currentConnection];
  kdebug_trace();
  id v12 = NFSharedSignpostLog();
  if (os_signpost_enabled(v12))
  {
    SEL v13 = [v11 NF_userInfo];
    id v14 = [v13 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 138412290;
    *(void *)uint64_t v102 = v14;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_REQUESTED", "Tag session requested from %@", buf, 0xCu);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    unsigned int v16 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v21 = [v11 NF_userInfo];
    uint64_t v22 = [v21 objectForKeyedSubscript:@"ClientName"];
    uint64_t v23 = 45;
    if (isMetaClass) {
      uint64_t v23 = 43;
    }
    v16(6, "%c[%{public}s %{public}s]:%i %{public}@", v23, ClassName, Name, 5214, v22);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v24 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = object_getClass(self);
    if (class_isMetaClass(v25)) {
      int v26 = 43;
    }
    else {
      int v26 = 45;
    }
    __int16 v27 = object_getClassName(self);
    uint64_t v28 = sel_getName(a2);
    uint64_t v29 = [v11 NF_userInfo];
    id v30 = [v29 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)uint64_t v102 = v26;
    *(_WORD *)&v102[4] = 2082;
    *(void *)&v102[6] = v27;
    __int16 v103 = 2082;
    id v104 = v28;
    __int16 v105 = 1024;
    int v106 = 5214;
    __int16 v107 = 2114;
    unsigned int v108 = v30;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) != 2)
  {
    id v55 = objc_alloc((Class)NSError);
    id v49 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v115 = NSLocalizedDescriptionKey;
    unsigned int v50 = +[NSString stringWithUTF8String:"Unresponsive hardware"];
    uint64_t v116 = v50;
    __int16 v51 = +[NSDictionary dictionaryWithObjects:&v116 forKeys:&v115 count:1];
    id v52 = v55;
    uint64_t v53 = v49;
    uint64_t v54 = 58;
LABEL_26:
    id v56 = [v52 initWithDomain:v53 code:v54 userInfo:v51];
    uint64_t v57 = v96;
    (*((void (**)(id, void, void, id))v96 + 2))(v96, 0, 0, v56);

LABEL_27:
    uint64_t v59 = v97;
    uint64_t v58 = v98;
    goto LABEL_28;
  }
  driverWrapper = self->_driverWrapper;
  if (!driverWrapper || !driverWrapper->_hasAntenna)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v32 = NFLogGetLogger();
    if (v32)
    {
      uint64_t v33 = (void (*)(uint64_t, const char *, ...))v32;
      BOOL v34 = object_getClass(self);
      BOOL v35 = class_isMetaClass(v34);
      uint64_t v36 = object_getClassName(self);
      id v37 = sel_getName(a2);
      id v38 = [v11 NF_userInfo];
      int v39 = [v38 objectForKeyedSubscript:@"ClientName"];
      uint64_t v40 = 45;
      if (v35) {
        uint64_t v40 = 43;
      }
      v33(3, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", v40, v36, v37, 5222, v39);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    unsigned int v41 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      id v42 = object_getClass(self);
      if (class_isMetaClass(v42)) {
        int v43 = 43;
      }
      else {
        int v43 = 45;
      }
      unsigned int v44 = object_getClassName(self);
      id v45 = sel_getName(a2);
      uint64_t v46 = [v11 NF_userInfo];
      uint64_t v47 = [v46 objectForKeyedSubscript:@"ClientName"];
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)uint64_t v102 = v43;
      *(_WORD *)&v102[4] = 2082;
      *(void *)&v102[6] = v44;
      __int16 v103 = 2082;
      id v104 = v45;
      __int16 v105 = 1024;
      int v106 = 5222;
      __int16 v107 = 2114;
      unsigned int v108 = v47;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", buf, 0x2Cu);
    }
    id v48 = objc_alloc((Class)NSError);
    id v49 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v113 = NSLocalizedDescriptionKey;
    unsigned int v50 = +[NSString stringWithUTF8String:"Feature Not Supported"];
    id v114 = v50;
    __int16 v51 = +[NSDictionary dictionaryWithObjects:&v114 forKeys:&v113 count:1];
    id v52 = v48;
    uint64_t v53 = v49;
    uint64_t v54 = 14;
    goto LABEL_26;
  }
  if ((id)[(_NFHardwareManager *)self nfcRadioEnabled:0 showUIPopup:sub_1000FAEAC((uint64_t)self, v99)] != (id)1)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v78 = NFLogGetLogger();
    if (v78)
    {
      __int16 v79 = (void (*)(uint64_t, const char *, ...))v78;
      __int16 v80 = object_getClass(self);
      BOOL v81 = class_isMetaClass(v80);
      NSErrorUserInfoKey v82 = object_getClassName(self);
      BOOL v93 = sel_getName(a2);
      uint64_t v83 = 45;
      if (v81) {
        uint64_t v83 = 43;
      }
      v79(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v83, v82, v93, 5228);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v84 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
    {
      __int16 v85 = object_getClass(self);
      if (class_isMetaClass(v85)) {
        int v86 = 43;
      }
      else {
        int v86 = 45;
      }
      __int16 v87 = object_getClassName(self);
      unsigned int v88 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)uint64_t v102 = v86;
      *(_WORD *)&v102[4] = 2082;
      *(void *)&v102[6] = v87;
      __int16 v103 = 2082;
      id v104 = v88;
      __int16 v105 = 1024;
      int v106 = 5228;
      _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
    }

    id v89 = objc_alloc((Class)NSError);
    id v49 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v111 = NSLocalizedDescriptionKey;
    unsigned int v50 = +[NSString stringWithUTF8String:"NFC radio disabled"];
    __int16 v112 = v50;
    __int16 v51 = +[NSDictionary dictionaryWithObjects:&v112 forKeys:&v111 count:1];
    id v52 = v89;
    uint64_t v53 = v49;
    uint64_t v54 = 50;
    goto LABEL_26;
  }
  id v60 = [v11 NF_userInfo];
  id v61 = [v60 objectForKeyedSubscript:@"ServiceWhitelist"];
  id v49 = +[_NFTagSession validateEntitlements:v61];

  if (v49)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v62 = NFLogGetLogger();
    if (v62)
    {
      id v63 = (void (*)(uint64_t, const char *, ...))v62;
      id v64 = object_getClass(self);
      BOOL v65 = class_isMetaClass(v64);
      id v95 = object_getClassName(self);
      id v66 = sel_getName(a2);
      SEL v67 = [v11 NF_userInfo];
      NSErrorUserInfoKey v68 = [v67 objectForKeyedSubscript:@"ClientName"];
      id v94 = [v11 processIdentifier];
      uint64_t v69 = 45;
      if (v65) {
        uint64_t v69 = 43;
      }
      v63(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v69, v95, v66, 5236, v68, v94);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v70 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      int v71 = object_getClass(self);
      if (class_isMetaClass(v71)) {
        int v72 = 43;
      }
      else {
        int v72 = 45;
      }
      id v73 = object_getClassName(self);
      __int16 v74 = sel_getName(a2);
      id v75 = [v11 NF_userInfo];
      __int16 v76 = [v75 objectForKeyedSubscript:@"ClientName"];
      unsigned int v77 = [v11 processIdentifier];
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)uint64_t v102 = v72;
      *(_WORD *)&v102[4] = 2082;
      *(void *)&v102[6] = v73;
      __int16 v103 = 2082;
      id v104 = v74;
      __int16 v105 = 1024;
      int v106 = 5236;
      __int16 v107 = 2114;
      unsigned int v108 = v76;
      __int16 v109 = 1024;
      unsigned int v110 = v77;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);
    }
    uint64_t v57 = v96;
    (*((void (**)(id, void, void, void *))v96 + 2))(v96, 0, 0, v49);
    goto LABEL_27;
  }
  uint64_t v58 = v98;
  unsigned int v90 = [(_NFXPCSession *)[_NFTagSession alloc] initWithRemoteObject:v98 workQueue:self->_workQueue];
  [(_NFSession *)v90 setQueue:self];
  [(_NFXPCSession *)v90 setConnection:v11];
  uint64_t v59 = v97;
  if (v97) {
    [(_NFTagSession *)v90 setInitialPayload:v97];
  }
  [(_NFSession *)v90 setUid:0xFFFFFFFFLL];
  buf[0] = 0;
  NSErrorUserInfoKey v91 = sub_1001DBA28((id *)&self->super.isa, v90, v11, buf);
  uint64_t v57 = v96;
  if (v91)
  {
    (*((void (**)(id, void, void, void *))v96 + 2))(v96, 0, 0, v91);
  }
  else
  {
    (*((void (**)(id, _NFTagSession *, void, void))v96 + 2))(v96, v90, buf[0], 0);
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001125FC;
    block[3] = &unk_100301C68;
    void block[4] = self;
    dispatch_async(workQueue, block);
  }

  id v49 = 0;
LABEL_28:
}

- (void)queueHostEmulationSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v187 = objc_opt_new();
  int v188 = +[NSXPCConnection currentConnection];
  kdebug_trace();
  id v11 = NFSharedSignpostLog();
  if (os_signpost_enabled(v11))
  {
    id v12 = [v188 NF_userInfo];
    SEL v13 = [v12 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 138412290;
    *(void *)v204 = v13;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_REQUESTED", "HCE session requested from %@", buf, 0xCu);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v15 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    int v20 = [v188 NF_userInfo];
    [v20 objectForKeyedSubscript:@"ClientName"];
    uint64_t v22 = v21 = v10;
    uint64_t v23 = 45;
    if (isMetaClass) {
      uint64_t v23 = 43;
    }
    v15(6, "%c[%{public}s %{public}s]:%i %{public}@", v23, ClassName, Name, 5290, v22);

    id v10 = v21;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v24 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = object_getClass(self);
    if (class_isMetaClass(v25)) {
      int v26 = 43;
    }
    else {
      int v26 = 45;
    }
    __int16 v27 = object_getClassName(self);
    uint64_t v28 = sel_getName(a2);
    uint64_t v29 = [v188 NF_userInfo];
    id v30 = [v29 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v204 = v26;
    *(_WORD *)&v204[4] = 2082;
    *(void *)&v204[6] = v27;
    __int16 v205 = 2082;
    v206 = v28;
    __int16 v207 = 1024;
    int v208 = 5290;
    __int16 v209 = 2114;
    id v210 = v30;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) != 2)
  {
    id v56 = objc_alloc((Class)NSError);
    unsigned int v50 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v217 = NSLocalizedDescriptionKey;
    __int16 v51 = +[NSString stringWithUTF8String:"Unresponsive hardware"];
    v218 = v51;
    id v52 = +[NSDictionary dictionaryWithObjects:&v218 forKeys:&v217 count:1];
    uint64_t v53 = v56;
    uint64_t v54 = v50;
    uint64_t v55 = 58;
LABEL_26:
    id v57 = [v53 initWithDomain:v54 code:v55 userInfo:v52];
    (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v57);

    goto LABEL_27;
  }
  driverWrapper = self->_driverWrapper;
  if (!driverWrapper || !driverWrapper->_hasAntenna)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v32 = NFLogGetLogger();
    if (v32)
    {
      uint64_t v33 = (void (*)(uint64_t, const char *, ...))v32;
      BOOL v34 = object_getClass(self);
      BOOL v35 = class_isMetaClass(v34);
      uint64_t v36 = object_getClassName(self);
      id v37 = sel_getName(a2);
      id v38 = [v188 NF_userInfo];
      [v38 objectForKeyedSubscript:@"ClientName"];
      v40 = id v39 = v10;
      uint64_t v41 = 45;
      if (v35) {
        uint64_t v41 = 43;
      }
      v33(3, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", v41, v36, v37, 5298, v40);

      id v10 = v39;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v42 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      int v43 = object_getClass(self);
      if (class_isMetaClass(v43)) {
        int v44 = 43;
      }
      else {
        int v44 = 45;
      }
      id v45 = object_getClassName(self);
      uint64_t v46 = sel_getName(a2);
      uint64_t v47 = [v188 NF_userInfo];
      id v48 = [v47 objectForKeyedSubscript:@"ClientName"];
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v204 = v44;
      *(_WORD *)&v204[4] = 2082;
      *(void *)&v204[6] = v45;
      __int16 v205 = 2082;
      v206 = v46;
      __int16 v207 = 1024;
      int v208 = 5298;
      __int16 v209 = 2114;
      id v210 = v48;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", buf, 0x2Cu);
    }
    id v49 = objc_alloc((Class)NSError);
    unsigned int v50 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v215 = NSLocalizedDescriptionKey;
    __int16 v51 = +[NSString stringWithUTF8String:"Feature Not Supported"];
    v216 = v51;
    id v52 = +[NSDictionary dictionaryWithObjects:&v216 forKeys:&v215 count:1];
    uint64_t v53 = v49;
    uint64_t v54 = v50;
    uint64_t v55 = 14;
    goto LABEL_26;
  }
  if ((id)[(_NFHardwareManager *)self nfcRadioEnabled:0 showUIPopup:sub_1000FAEAC((uint64_t)self, v9)] != (id)1)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v77 = NFLogGetLogger();
    if (v77)
    {
      uint64_t v78 = (void (*)(uint64_t, const char *, ...))v77;
      __int16 v79 = object_getClass(self);
      BOOL v80 = class_isMetaClass(v79);
      BOOL v81 = object_getClassName(self);
      __int16 v166 = sel_getName(a2);
      uint64_t v82 = 45;
      if (v80) {
        uint64_t v82 = 43;
      }
      v78(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v82, v81, v166, 5304);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v83 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      int v84 = object_getClass(self);
      if (class_isMetaClass(v84)) {
        int v85 = 43;
      }
      else {
        int v85 = 45;
      }
      int v86 = object_getClassName(self);
      __int16 v87 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v204 = v85;
      *(_WORD *)&v204[4] = 2082;
      *(void *)&v204[6] = v86;
      __int16 v205 = 2082;
      v206 = v87;
      __int16 v207 = 1024;
      int v208 = 5304;
      _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
    }

    id v88 = objc_alloc((Class)NSError);
    unsigned int v50 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v213 = NSLocalizedDescriptionKey;
    __int16 v51 = +[NSString stringWithUTF8String:"NFC radio disabled"];
    v214 = v51;
    id v52 = +[NSDictionary dictionaryWithObjects:&v214 forKeys:&v213 count:1];
    uint64_t v53 = v88;
    uint64_t v54 = v50;
    uint64_t v55 = 50;
    goto LABEL_26;
  }
  uint64_t v58 = [v188 NF_userInfo];
  uint64_t v59 = [v58 objectForKeyedSubscript:@"ServiceWhitelist"];
  unsigned int v50 = +[_NFHCESession validateEntitlements:v59];

  __int16 v189 = self;
  if (v50)
  {
    id v184 = v10;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v60 = NFLogGetLogger();
    if (v60)
    {
      id v61 = (void (*)(uint64_t, const char *, ...))v60;
      uint64_t v62 = object_getClass(self);
      BOOL v63 = class_isMetaClass(v62);
      id v64 = object_getClassName(self);
      BOOL v65 = sel_getName(a2);
      id v66 = [v188 NF_userInfo];
      SEL v67 = [v66 objectForKeyedSubscript:@"ClientName"];
      id v171 = [v188 processIdentifier];
      uint64_t v68 = 45;
      if (v63) {
        uint64_t v68 = 43;
      }
      v61(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v68, v64, v65, 5312, v67, v171);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v69 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      id v70 = object_getClass(self);
      if (class_isMetaClass(v70)) {
        int v71 = 43;
      }
      else {
        int v71 = 45;
      }
      int v72 = object_getClassName(self);
      id v73 = sel_getName(a2);
      __int16 v74 = [v188 NF_userInfo];
      id v75 = [v74 objectForKeyedSubscript:@"ClientName"];
      unsigned int v76 = [v188 processIdentifier];
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)v204 = v71;
      *(_WORD *)&v204[4] = 2082;
      *(void *)&v204[6] = v72;
      __int16 v205 = 2082;
      v206 = v73;
      __int16 v207 = 1024;
      int v208 = 5312;
      __int16 v209 = 2114;
      id v210 = v75;
      __int16 v211 = 1024;
      unsigned int v212 = v76;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);
    }
    id v10 = v184;
    (*((void (**)(id, void, void, void *))v184 + 2))(v184, 0, 0, v50);
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v186 = 0;
    NSErrorUserInfoKey v177 = 0;
    v178 = 0;
    v181 = 0;
    __int16 v183 = 0;
    NSErrorUserInfoKey v179 = 0;
    CFStringRef v180 = 0;
    unsigned int v108 = 0;
    __int16 v107 = 0;
    id v89 = 0;
    goto LABEL_89;
  }
  id v89 = [v9 NF_arrayForKey:@"StartOnECP"];
  if (![v89 count]) {
    goto LABEL_74;
  }
  id v182 = v8;
  id v185 = v10;
  long long v196 = 0u;
  long long v197 = 0u;
  long long v194 = 0u;
  long long v195 = 0u;
  NSErrorUserInfoKey v173 = v89;
  id v90 = v89;
  id v91 = [v90 countByEnumeratingWithState:&v194 objects:v202 count:16];
  if (!v91) {
    goto LABEL_73;
  }
  id v92 = v91;
  uint64_t v93 = *(void *)v195;
  do
  {
    for (i = 0; i != v92; i = (char *)i + 1)
    {
      if (*(void *)v195 != v93) {
        objc_enumerationMutation(v90);
      }
      id v95 = *(void **)(*((void *)&v194 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (![v95 length]) {
          continue;
        }
        v200[0] = @"ECPData";
        v200[1] = @"IgnoreRFTechOnIsEqual";
        v201[0] = v95;
        v201[1] = &off_10031B748;
        id v96 = +[NSDictionary dictionaryWithObjects:v201 forKeys:v200 count:2];
        id v97 = +[NFFieldNotification notificationWithDictionary:v96];

        if (v97) {
          [v187 addObject:v97];
        }
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v98 = NFLogGetLogger();
        if (v98)
        {
          id v99 = (void (*)(uint64_t, const char *, ...))v98;
          id v100 = object_getClass(self);
          BOOL v101 = class_isMetaClass(v100);
          BOOL v164 = object_getClassName(self);
          id v167 = sel_getName(a2);
          uint64_t v102 = 45;
          if (v101) {
            uint64_t v102 = 43;
          }
          self = v189;
          v99(3, "%c[%{public}s %{public}s]:%i Invalid ECP data: %{public}@", v102, v164, v167, 5322, v95);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        id v97 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
        {
          __int16 v103 = object_getClass(self);
          if (class_isMetaClass(v103)) {
            int v104 = 43;
          }
          else {
            int v104 = 45;
          }
          __int16 v105 = object_getClassName(v189);
          int v106 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)v204 = v104;
          self = v189;
          *(_WORD *)&v204[4] = 2082;
          *(void *)&v204[6] = v105;
          __int16 v205 = 2082;
          v206 = v106;
          __int16 v207 = 1024;
          int v208 = 5322;
          __int16 v209 = 2114;
          id v210 = v95;
          _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid ECP data: %{public}@", buf, 0x2Cu);
        }
      }
    }
    id v92 = [v90 countByEnumeratingWithState:&v194 objects:v202 count:16];
  }
  while (v92);
LABEL_73:

  id v8 = v182;
  id v10 = v185;
  id v89 = v173;
LABEL_74:
  v181 = [v9 NF_numberForKey:@"EmulationOnSessionStart"];
  __int16 v107 = [v9 NF_numberForKey:@"ReadOnReaderConnected"];
  unsigned int v108 = [v9 NF_numberForKey:@"SuspendOnDisconnect"];
  CFStringRef v180 = [v9 NF_numberForKey:@"BackgroundTagReadingECP"];
  NSErrorUserInfoKey v179 = [v9 NF_numberForKey:@"ListenOnAllField"];
  v178 = [v9 NF_numberForKey:@"FDRestartOnMatchingECPTermInfo"];
  __int16 v183 = [v9 NF_dataForKey:@"ECPBroadcast"];
  NSErrorUserInfoKey v177 = [v9 NF_numberForKey:@"disableAutostartOnField"];
  __int16 v109 = [v9 NF_dataForKey:@"bkgTagReadECPOverride"];
  if (v109)
  {
    unsigned int v110 = v109;
    v186 = v109;
    if (![v109 length] || (unint64_t)objc_msgSend(v110, "length") >= 0x15)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v111 = NFLogGetLogger();
      if (v111)
      {
        __int16 v112 = (void (*)(uint64_t, const char *, ...))v111;
        NSErrorUserInfoKey v113 = object_getClass(self);
        BOOL v114 = class_isMetaClass(v113);
        NSErrorUserInfoKey v115 = object_getClassName(self);
        __int16 v168 = sel_getName(a2);
        uint64_t v116 = 45;
        if (v114) {
          uint64_t v116 = 43;
        }
        v112(3, "%c[%{public}s %{public}s]:%i Invalid override; dropping", v116, v115, v168, 5348);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v117 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
      {
        __int16 v118 = object_getClass(self);
        if (class_isMetaClass(v118)) {
          int v119 = 43;
        }
        else {
          int v119 = 45;
        }
        id v120 = object_getClassName(self);
        id v121 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v204 = v119;
        *(_WORD *)&v204[4] = 2082;
        *(void *)&v204[6] = v120;
        __int16 v205 = 2082;
        v206 = v121;
        __int16 v207 = 1024;
        int v208 = 5348;
        _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid override; dropping",
          buf,
          0x22u);
      }

      goto LABEL_87;
    }
  }
  else
  {
LABEL_87:
    v186 = 0;
  }
LABEL_89:
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v122 = NFLogGetLogger();
  if (v122)
  {
    id v123 = (void (*)(uint64_t, const char *, ...))v122;
    uint64_t v124 = object_getClass(self);
    BOOL v125 = class_isMetaClass(v124);
    int v165 = object_getClassName(self);
    id v169 = sel_getName(a2);
    uint64_t v126 = 45;
    if (v125) {
      uint64_t v126 = 43;
    }
    v123(6, "%c[%{public}s %{public}s]:%i attribute=%{public}@", v126, v165, v169, 5354, v9);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v127 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
  {
    id v128 = object_getClass(self);
    if (class_isMetaClass(v128)) {
      int v129 = 43;
    }
    else {
      int v129 = 45;
    }
    id v130 = object_getClassName(self);
    NSErrorUserInfoKey v131 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v204 = v129;
    *(_WORD *)&v204[4] = 2082;
    *(void *)&v204[6] = v130;
    __int16 v205 = 2082;
    v206 = v131;
    __int16 v207 = 1024;
    int v208 = 5354;
    __int16 v209 = 2114;
    id v210 = v9;
    _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i attribute=%{public}@", buf, 0x2Cu);
  }

  int v132 = [(_NFXPCSession *)[_NFHCESession alloc] initWithRemoteObject:v8 workQueue:self->_workQueue];
  NSErrorUserInfoKey v133 = self;
  NSErrorUserInfoKey v134 = v132;
  if (v132)
  {
    [(_NFSession *)v132 setQueue:v133];
    [(_NFXPCSession *)v134 setConnection:v188];
    -[_NFHCESession setReadOnConnected:](v134, "setReadOnConnected:", [v107 BOOLValue]);
    if ([v187 count]) {
      id v135 = v187;
    }
    else {
      id v135 = 0;
    }
    [(_NFSession *)v134 setStartOnFieldList:v135];
    -[_NFHCESession setEmulationOnSessionStart:](v134, "setEmulationOnSessionStart:", [v181 BOOLValue]);
    -[_NFHCESession setSuspendOnDisconnect:](v134, "setSuspendOnDisconnect:", [v108 BOOLValue]);
    [(_NFSession *)v134 setBackgroundTagReadEcpOption:0];
    if ([v180 BOOLValue])
    {
      if (v186) {
        uint64_t v136 = 2;
      }
      else {
        uint64_t v136 = 1;
      }
      [(_NFSession *)v134 setBackgroundTagReadEcpOption:v136];
      [(_NFSession *)v134 setBackgroundTagReadCustomECP:v186];
    }
    -[_NFHCESession setDisableAutoStartOnField:](v134, "setDisableAutoStartOnField:", [v177 BOOLValue]);
    if ([v179 BOOLValue]) {
      [(_NFSession *)v134 setFieldHandlingInSuspension:[(_NFSession *)v134 fieldHandlingInSuspension] | 1];
    }
    if ([v178 BOOLValue]) {
      [(_NFSession *)v134 setFieldHandlingInSuspension:[(_NFSession *)v134 fieldHandlingInSuspension] | 2];
    }
    if ([v183 length])
    {
      id v137 = [v9 NF_arrayForKey:@"ECPBroadcastFieldMatch"];
      __int16 v172 = v107;
      if (v137)
      {
        id v138 = sub_1000FB150((uint64_t)v189, v137);
      }
      else
      {
        id v138 = 0;
      }
      NSErrorUserInfoKey v174 = v89;
      NSErrorUserInfoKey v176 = v108;
      v156 = [v9 NF_numberForKey:@"ECPBroadcastInterval"];
      v157 = [v9 NF_numberForKey:@"ECPBroadcastPollDuration"];
      NSErrorUserInfoKey v158 = v157;
      if (v157) {
        int v159 = [v157 unsignedLongValue];
      }
      else {
        int v159 = 0;
      }
      if (v156) {
        int v160 = [v156 unsignedLongValue];
      }
      else {
        int v160 = 3000;
      }
      v161 = sub_1000901A4((uint64_t)NFHCEBroadcastECPConfig, v183, v159, v160, v138);
      [(_NFHCESession *)v134 setEcpBroadcastConfig:v161];

      __int16 v107 = v172;
      id v89 = v174;
      unsigned int v108 = v176;
    }
    [(_NFSession *)v134 setUid:0xFFFFFFFFLL];
    buf[0] = 0;
    NSErrorUserInfoKey v162 = sub_1001DBA28((id *)&v189->super.isa, v134, v188, buf);
    if (v162)
    {
      (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v162);
    }
    else
    {
      (*((void (**)(id, _NFHCESession *, void, void))v10 + 2))(v10, v134, buf[0], 0);
      workQueue = v189->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100113B9C;
      block[3] = &unk_100301C90;
      void block[4] = v189;
      id v192 = v187;
      SEL v193 = a2;
      dispatch_async(workQueue, block);
    }
  }
  else
  {
    NSErrorUserInfoKey v175 = v108;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v139 = NFLogGetLogger();
    if (v139)
    {
      id v140 = (void (*)(uint64_t, const char *, ...))v139;
      __int16 v141 = object_getClass(v189);
      BOOL v142 = class_isMetaClass(v141);
      BOOL v143 = object_getClassName(v189);
      __int16 v170 = sel_getName(a2);
      uint64_t v144 = 45;
      if (v142) {
        uint64_t v144 = 43;
      }
      v140(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v144, v143, v170, 5358);
    }
    BOOL v145 = v107;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v146 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
    {
      uint64_t v147 = object_getClass(v189);
      if (class_isMetaClass(v147)) {
        int v148 = 43;
      }
      else {
        int v148 = 45;
      }
      unsigned int v149 = object_getClassName(v189);
      id v150 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v204 = v148;
      *(_WORD *)&v204[4] = 2082;
      *(void *)&v204[6] = v149;
      __int16 v205 = 2082;
      v206 = v150;
      __int16 v207 = 1024;
      int v208 = 5358;
      _os_log_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
    }

    id v151 = objc_alloc((Class)NSError);
    long long v152 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v198 = NSLocalizedDescriptionKey;
    long long v153 = +[NSString stringWithUTF8String:"Unexpected Result"];
    NSErrorUserInfoKey v199 = v153;
    long long v154 = +[NSDictionary dictionaryWithObjects:&v199 forKeys:&v198 count:1];
    id v155 = [v151 initWithDomain:v152 code:13 userInfo:v154];
    (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v155);

    __int16 v107 = v145;
    unsigned int v108 = v175;
  }

  unsigned int v50 = 0;
LABEL_27:
}

- (void)queueSecureElementAndHostEmulationSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v113 = a3;
  id v114 = a4;
  id v112 = a5;
  id v9 = +[NSXPCConnection currentConnection];
  kdebug_trace();
  id v10 = NFSharedSignpostLog();
  if (os_signpost_enabled(v10))
  {
    id v11 = [v9 NF_userInfo];
    id v12 = [v11 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 138412290;
    *(void *)int v119 = v12;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_REQUESTED", "SE+HCE session requested from %@", buf, 0xCu);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v14 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    int v19 = [v9 NF_userInfo];
    int v20 = [v19 objectForKeyedSubscript:@"ClientName"];
    uint64_t v21 = 45;
    if (isMetaClass) {
      uint64_t v21 = 43;
    }
    v14(6, "%c[%{public}s %{public}s]:%i %{public}@", v21, ClassName, Name, 5460, v20);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v22 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = object_getClass(self);
    if (class_isMetaClass(v23)) {
      int v24 = 43;
    }
    else {
      int v24 = 45;
    }
    int v25 = object_getClassName(self);
    int v26 = sel_getName(a2);
    __int16 v27 = [v9 NF_userInfo];
    uint64_t v28 = [v27 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)int v119 = v24;
    *(_WORD *)&v119[4] = 2082;
    *(void *)&v119[6] = v25;
    __int16 v120 = 2082;
    id v121 = v26;
    __int16 v122 = 1024;
    int v123 = 5460;
    __int16 v124 = 2114;
    BOOL v125 = v28;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) != 2)
  {
    id v53 = objc_alloc((Class)NSError);
    uint64_t v47 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v132 = NSLocalizedDescriptionKey;
    id v48 = +[NSString stringWithUTF8String:"Unresponsive hardware"];
    NSErrorUserInfoKey v133 = v48;
    id v49 = +[NSDictionary dictionaryWithObjects:&v133 forKeys:&v132 count:1];
    unsigned int v50 = v53;
    __int16 v51 = v47;
    uint64_t v52 = 58;
LABEL_26:
    id v54 = [v50 initWithDomain:v51 code:v52 userInfo:v49];
    uint64_t v55 = v112;
    (*((void (**)(id, void, void, id))v112 + 2))(v112, 0, 0, v54);

LABEL_27:
    id v56 = v113;
    goto LABEL_28;
  }
  driverWrapper = self->_driverWrapper;
  if (!driverWrapper || !driverWrapper->_hasAntenna)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v30 = NFLogGetLogger();
    if (v30)
    {
      BOOL v31 = (void (*)(uint64_t, const char *, ...))v30;
      uint64_t v32 = object_getClass(self);
      BOOL v33 = class_isMetaClass(v32);
      BOOL v34 = object_getClassName(self);
      BOOL v35 = sel_getName(a2);
      uint64_t v36 = [v9 NF_userInfo];
      id v37 = [v36 objectForKeyedSubscript:@"ClientName"];
      uint64_t v38 = 45;
      if (v33) {
        uint64_t v38 = 43;
      }
      v31(3, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", v38, v34, v35, 5468, v37);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v39 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = object_getClass(self);
      if (class_isMetaClass(v40)) {
        int v41 = 43;
      }
      else {
        int v41 = 45;
      }
      id v42 = object_getClassName(self);
      int v43 = sel_getName(a2);
      int v44 = [v9 NF_userInfo];
      id v45 = [v44 objectForKeyedSubscript:@"ClientName"];
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)int v119 = v41;
      *(_WORD *)&v119[4] = 2082;
      *(void *)&v119[6] = v42;
      __int16 v120 = 2082;
      id v121 = v43;
      __int16 v122 = 1024;
      int v123 = 5468;
      __int16 v124 = 2114;
      BOOL v125 = v45;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", buf, 0x2Cu);
    }
    id v46 = objc_alloc((Class)NSError);
    uint64_t v47 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v130 = NSLocalizedDescriptionKey;
    id v48 = +[NSString stringWithUTF8String:"Feature Not Supported"];
    NSErrorUserInfoKey v131 = v48;
    id v49 = +[NSDictionary dictionaryWithObjects:&v131 forKeys:&v130 count:1];
    unsigned int v50 = v46;
    __int16 v51 = v47;
    uint64_t v52 = 14;
    goto LABEL_26;
  }
  if ((id)[(_NFHardwareManager *)self nfcRadioEnabled:0 showUIPopup:sub_1000FAEAC((uint64_t)self, v114)] != (id)1)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v75 = NFLogGetLogger();
    if (v75)
    {
      unsigned int v76 = (void (*)(uint64_t, const char *, ...))v75;
      uint64_t v77 = object_getClass(self);
      BOOL v78 = class_isMetaClass(v77);
      __int16 v79 = object_getClassName(self);
      unsigned int v108 = sel_getName(a2);
      uint64_t v80 = 45;
      if (v78) {
        uint64_t v80 = 43;
      }
      v76(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v80, v79, v108, 5474);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v81 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
    {
      uint64_t v82 = object_getClass(self);
      if (class_isMetaClass(v82)) {
        int v83 = 43;
      }
      else {
        int v83 = 45;
      }
      int v84 = object_getClassName(self);
      int v85 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)int v119 = v83;
      *(_WORD *)&v119[4] = 2082;
      *(void *)&v119[6] = v84;
      __int16 v120 = 2082;
      id v121 = v85;
      __int16 v122 = 1024;
      int v123 = 5474;
      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
    }

    id v86 = objc_alloc((Class)NSError);
    uint64_t v47 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v128 = NSLocalizedDescriptionKey;
    id v48 = +[NSString stringWithUTF8String:"NFC radio disabled"];
    int v129 = v48;
    id v49 = +[NSDictionary dictionaryWithObjects:&v129 forKeys:&v128 count:1];
    unsigned int v50 = v86;
    __int16 v51 = v47;
    uint64_t v52 = 50;
    goto LABEL_26;
  }
  id v57 = [v9 NF_userInfo];
  uint64_t v58 = [v57 objectForKeyedSubscript:@"ServiceWhitelist"];
  uint64_t v47 = +[_NFSecureElementAndHostCardEmulationSession validateEntitlements:v58];

  if (v47)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v59 = NFLogGetLogger();
    if (v59)
    {
      uint64_t v60 = (void (*)(uint64_t, const char *, ...))v59;
      id v61 = object_getClass(self);
      BOOL v62 = class_isMetaClass(v61);
      uint64_t v111 = object_getClassName(self);
      BOOL v63 = sel_getName(a2);
      id v64 = [v9 NF_userInfo];
      BOOL v65 = [v64 objectForKeyedSubscript:@"ClientName"];
      id v110 = [v9 processIdentifier];
      uint64_t v66 = 45;
      if (v62) {
        uint64_t v66 = 43;
      }
      v60(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v66, v111, v63, 5482, v65, v110);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    SEL v67 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      uint64_t v68 = object_getClass(self);
      if (class_isMetaClass(v68)) {
        int v69 = 43;
      }
      else {
        int v69 = 45;
      }
      id v70 = object_getClassName(self);
      int v71 = sel_getName(a2);
      int v72 = [v9 NF_userInfo];
      id v73 = [v72 objectForKeyedSubscript:@"ClientName"];
      unsigned int v74 = [v9 processIdentifier];
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)int v119 = v69;
      *(_WORD *)&v119[4] = 2082;
      *(void *)&v119[6] = v70;
      __int16 v120 = 2082;
      id v121 = v71;
      __int16 v122 = 1024;
      int v123 = 5482;
      __int16 v124 = 2114;
      BOOL v125 = v73;
      __int16 v126 = 1024;
      unsigned int v127 = v74;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);
    }
    uint64_t v55 = v112;
    (*((void (**)(id, void, void, void *))v112 + 2))(v112, 0, 0, v47);
    goto LABEL_27;
  }
  objc_opt_class();
  id v56 = v113;
  if (objc_opt_isKindOfClass())
  {
    __int16 v87 = [v114 NF_numberForKey:@"EmulationOnSessionStart"];
  }
  else
  {
    __int16 v87 = 0;
  }
  id v88 = [(_NFXPCSession *)[_NFSecureElementAndHostCardEmulationSession alloc] initWithRemoteObject:v113 workQueue:self->_workQueue];
  id v89 = v88;
  if (v88)
  {
    [(_NFSession *)v88 setQueue:self];
    [(_NFXPCSession *)v89 setConnection:v9];
    -[_NFHCESession setEmulationOnSessionStart:](v89, "setEmulationOnSessionStart:", [v87 BOOLValue]);
    [(_NFSession *)v89 setUid:0xFFFFFFFFLL];
    buf[0] = 0;
    id v90 = sub_1001DBA28((id *)&self->super.isa, v89, v9, buf);
    uint64_t v55 = v112;
    if (v90)
    {
      (*((void (**)(id, void, void, void *))v112 + 2))(v112, 0, 0, v90);
    }
    else
    {
      (*((void (**)(id, _NFSecureElementAndHostCardEmulationSession *, void, void))v112 + 2))(v112, v89, buf[0], 0);
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100114AA4;
      block[3] = &unk_100301C68;
      void block[4] = self;
      dispatch_async(workQueue, block);
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v91 = NFLogGetLogger();
    if (v91)
    {
      id v92 = (void (*)(uint64_t, const char *, ...))v91;
      uint64_t v93 = object_getClass(self);
      BOOL v94 = class_isMetaClass(v93);
      id v95 = object_getClassName(self);
      __int16 v109 = sel_getName(a2);
      uint64_t v96 = 45;
      if (v94) {
        uint64_t v96 = 43;
      }
      v92(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v96, v95, v109, 5493);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v97 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
    {
      uint64_t v98 = object_getClass(self);
      if (class_isMetaClass(v98)) {
        int v99 = 43;
      }
      else {
        int v99 = 45;
      }
      id v100 = object_getClassName(self);
      BOOL v101 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)int v119 = v99;
      *(_WORD *)&v119[4] = 2082;
      *(void *)&v119[6] = v100;
      __int16 v120 = 2082;
      id v121 = v101;
      __int16 v122 = 1024;
      int v123 = 5493;
      _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
    }

    id v102 = objc_alloc((Class)NSError);
    __int16 v103 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v116 = NSLocalizedDescriptionKey;
    int v104 = +[NSString stringWithUTF8String:"Unexpected Result"];
    id v117 = v104;
    __int16 v105 = +[NSDictionary dictionaryWithObjects:&v117 forKeys:&v116 count:1];
    id v106 = [v102 initWithDomain:v103 code:13 userInfo:v105];
    uint64_t v55 = v112;
    (*((void (**)(id, void, void, id))v112 + 2))(v112, 0, 0, v106);

    id v56 = v113;
  }

  uint64_t v47 = 0;
LABEL_28:
}

- (void)queueSecureElementReaderSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v113 = a3;
  id v114 = a4;
  id v112 = a5;
  id v9 = +[NSXPCConnection currentConnection];
  kdebug_trace();
  id v10 = NFSharedSignpostLog();
  if (os_signpost_enabled(v10))
  {
    id v11 = [v9 NF_userInfo];
    id v12 = [v11 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 138412290;
    *(void *)int v119 = v12;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_REQUESTED", "SE+Reader session requested from %@", buf, 0xCu);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v14 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    int v19 = [v9 NF_userInfo];
    int v20 = [v19 objectForKeyedSubscript:@"ClientName"];
    uint64_t v21 = 45;
    if (isMetaClass) {
      uint64_t v21 = 43;
    }
    v14(6, "%c[%{public}s %{public}s]:%i %{public}@", v21, ClassName, Name, 5533, v20);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v22 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = object_getClass(self);
    if (class_isMetaClass(v23)) {
      int v24 = 43;
    }
    else {
      int v24 = 45;
    }
    int v25 = object_getClassName(self);
    int v26 = sel_getName(a2);
    __int16 v27 = [v9 NF_userInfo];
    uint64_t v28 = [v27 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)int v119 = v24;
    *(_WORD *)&v119[4] = 2082;
    *(void *)&v119[6] = v25;
    __int16 v120 = 2082;
    id v121 = v26;
    __int16 v122 = 1024;
    int v123 = 5533;
    __int16 v124 = 2114;
    BOOL v125 = v28;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) != 2)
  {
    id v53 = objc_alloc((Class)NSError);
    uint64_t v47 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v132 = NSLocalizedDescriptionKey;
    id v48 = +[NSString stringWithUTF8String:"Unresponsive hardware"];
    NSErrorUserInfoKey v133 = v48;
    id v49 = +[NSDictionary dictionaryWithObjects:&v133 forKeys:&v132 count:1];
    unsigned int v50 = v53;
    __int16 v51 = v47;
    uint64_t v52 = 58;
LABEL_26:
    id v54 = [v50 initWithDomain:v51 code:v52 userInfo:v49];
    uint64_t v55 = v112;
    (*((void (**)(id, void, void, id))v112 + 2))(v112, 0, 0, v54);

LABEL_27:
    id v56 = v113;
    goto LABEL_28;
  }
  driverWrapper = self->_driverWrapper;
  if (!driverWrapper || !driverWrapper->_hasAntenna)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v30 = NFLogGetLogger();
    if (v30)
    {
      BOOL v31 = (void (*)(uint64_t, const char *, ...))v30;
      uint64_t v32 = object_getClass(self);
      BOOL v33 = class_isMetaClass(v32);
      BOOL v34 = object_getClassName(self);
      BOOL v35 = sel_getName(a2);
      uint64_t v36 = [v9 NF_userInfo];
      id v37 = [v36 objectForKeyedSubscript:@"ClientName"];
      uint64_t v38 = 45;
      if (v33) {
        uint64_t v38 = 43;
      }
      v31(3, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", v38, v34, v35, 5541, v37);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v39 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = object_getClass(self);
      if (class_isMetaClass(v40)) {
        int v41 = 43;
      }
      else {
        int v41 = 45;
      }
      id v42 = object_getClassName(self);
      int v43 = sel_getName(a2);
      int v44 = [v9 NF_userInfo];
      id v45 = [v44 objectForKeyedSubscript:@"ClientName"];
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)int v119 = v41;
      *(_WORD *)&v119[4] = 2082;
      *(void *)&v119[6] = v42;
      __int16 v120 = 2082;
      id v121 = v43;
      __int16 v122 = 1024;
      int v123 = 5541;
      __int16 v124 = 2114;
      BOOL v125 = v45;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i API not supported on this platform, client = %{public}@", buf, 0x2Cu);
    }
    id v46 = objc_alloc((Class)NSError);
    uint64_t v47 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v130 = NSLocalizedDescriptionKey;
    id v48 = +[NSString stringWithUTF8String:"Feature Not Supported"];
    NSErrorUserInfoKey v131 = v48;
    id v49 = +[NSDictionary dictionaryWithObjects:&v131 forKeys:&v130 count:1];
    unsigned int v50 = v46;
    __int16 v51 = v47;
    uint64_t v52 = 14;
    goto LABEL_26;
  }
  if ((id)[(_NFHardwareManager *)self nfcRadioEnabled:0 showUIPopup:sub_1000FAEAC((uint64_t)self, v114)] != (id)1)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v75 = NFLogGetLogger();
    if (v75)
    {
      unsigned int v76 = (void (*)(uint64_t, const char *, ...))v75;
      uint64_t v77 = object_getClass(self);
      BOOL v78 = class_isMetaClass(v77);
      __int16 v79 = object_getClassName(self);
      unsigned int v108 = sel_getName(a2);
      uint64_t v80 = 45;
      if (v78) {
        uint64_t v80 = 43;
      }
      v76(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v80, v79, v108, 5547);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v81 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
    {
      uint64_t v82 = object_getClass(self);
      if (class_isMetaClass(v82)) {
        int v83 = 43;
      }
      else {
        int v83 = 45;
      }
      int v84 = object_getClassName(self);
      int v85 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)int v119 = v83;
      *(_WORD *)&v119[4] = 2082;
      *(void *)&v119[6] = v84;
      __int16 v120 = 2082;
      id v121 = v85;
      __int16 v122 = 1024;
      int v123 = 5547;
      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
    }

    id v86 = objc_alloc((Class)NSError);
    uint64_t v47 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v128 = NSLocalizedDescriptionKey;
    id v48 = +[NSString stringWithUTF8String:"NFC radio disabled"];
    int v129 = v48;
    id v49 = +[NSDictionary dictionaryWithObjects:&v129 forKeys:&v128 count:1];
    unsigned int v50 = v86;
    __int16 v51 = v47;
    uint64_t v52 = 50;
    goto LABEL_26;
  }
  id v57 = [v9 NF_userInfo];
  uint64_t v58 = [v57 objectForKeyedSubscript:@"ServiceWhitelist"];
  uint64_t v47 = +[_NFSecureElementReaderSession validateEntitlements:v58];

  if (v47)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v59 = NFLogGetLogger();
    if (v59)
    {
      uint64_t v60 = (void (*)(uint64_t, const char *, ...))v59;
      id v61 = object_getClass(self);
      BOOL v62 = class_isMetaClass(v61);
      uint64_t v111 = object_getClassName(self);
      BOOL v63 = sel_getName(a2);
      id v64 = [v9 NF_userInfo];
      BOOL v65 = [v64 objectForKeyedSubscript:@"ClientName"];
      id v110 = [v9 processIdentifier];
      uint64_t v66 = 45;
      if (v62) {
        uint64_t v66 = 43;
      }
      v60(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v66, v111, v63, 5555, v65, v110);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    SEL v67 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      uint64_t v68 = object_getClass(self);
      if (class_isMetaClass(v68)) {
        int v69 = 43;
      }
      else {
        int v69 = 45;
      }
      id v70 = object_getClassName(self);
      int v71 = sel_getName(a2);
      int v72 = [v9 NF_userInfo];
      id v73 = [v72 objectForKeyedSubscript:@"ClientName"];
      unsigned int v74 = [v9 processIdentifier];
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)int v119 = v69;
      *(_WORD *)&v119[4] = 2082;
      *(void *)&v119[6] = v70;
      __int16 v120 = 2082;
      id v121 = v71;
      __int16 v122 = 1024;
      int v123 = 5555;
      __int16 v124 = 2114;
      BOOL v125 = v73;
      __int16 v126 = 1024;
      unsigned int v127 = v74;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);
    }
    uint64_t v55 = v112;
    (*((void (**)(id, void, void, void *))v112 + 2))(v112, 0, 0, v47);
    goto LABEL_27;
  }
  id v56 = v113;
  __int16 v87 = [(_NFXPCSession *)[_NFSecureElementReaderSession alloc] initWithRemoteObject:v113 workQueue:self->_workQueue];
  id v88 = v87;
  if (v87)
  {
    [(_NFSession *)v87 setQueue:self];
    [(_NFXPCSession *)v88 setConnection:v9];
    [(_NFSession *)v88 setUid:0xFFFFFFFFLL];
    [(_NFSecureElementReaderSession *)v88 setDriverWrapper:self->_driverWrapper];
    id v89 = sub_1001AED74();
    [(_NFSecureElementReaderSession *)v88 setPowerConsumptionReporter:v89];

    buf[0] = 0;
    id v90 = sub_1001DBA28((id *)&self->super.isa, v88, v9, buf);
    uint64_t v55 = v112;
    if (v90)
    {
      (*((void (**)(id, void, void, void *))v112 + 2))(v112, 0, 0, v90);
    }
    else
    {
      (*((void (**)(id, _NFSecureElementReaderSession *, void, void))v112 + 2))(v112, v88, buf[0], 0);
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100115760;
      block[3] = &unk_100301C68;
      void block[4] = self;
      dispatch_async(workQueue, block);
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v91 = NFLogGetLogger();
    if (v91)
    {
      id v92 = (void (*)(uint64_t, const char *, ...))v91;
      uint64_t v93 = object_getClass(self);
      BOOL v94 = class_isMetaClass(v93);
      id v95 = object_getClassName(self);
      __int16 v109 = sel_getName(a2);
      uint64_t v96 = 45;
      if (v94) {
        uint64_t v96 = 43;
      }
      v92(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v96, v95, v109, 5562);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v97 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
    {
      uint64_t v98 = object_getClass(self);
      if (class_isMetaClass(v98)) {
        int v99 = 43;
      }
      else {
        int v99 = 45;
      }
      id v100 = object_getClassName(self);
      BOOL v101 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)int v119 = v99;
      *(_WORD *)&v119[4] = 2082;
      *(void *)&v119[6] = v100;
      __int16 v120 = 2082;
      id v121 = v101;
      __int16 v122 = 1024;
      int v123 = 5562;
      _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
    }

    id v102 = objc_alloc((Class)NSError);
    __int16 v103 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v116 = NSLocalizedDescriptionKey;
    int v104 = +[NSString stringWithUTF8String:"Unexpected Result"];
    id v117 = v104;
    __int16 v105 = +[NSDictionary dictionaryWithObjects:&v117 forKeys:&v116 count:1];
    id v106 = [v102 initWithDomain:v103 code:13 userInfo:v105];
    uint64_t v55 = v112;
    (*((void (**)(id, void, void, id))v112 + 2))(v112, 0, 0, v106);

    id v56 = v113;
  }

  uint64_t v47 = 0;
LABEL_28:
}

- (void)queueSecureTransactionServicesSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = +[NSXPCConnection currentConnection];
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 2)
  {
    id v113 = v11;
    p_vtable = &OBJC_METACLASS___NFAppletExtraInfo.vtable;
    id v14 = [v12 NF_userInfo];
    id v15 = [v14 objectForKeyedSubscript:@"ServiceWhitelist"];
    unsigned int v16 = +[_NFSecureTransactionServicesHandoverSession validateEntitlements:v15];

    if (v16)
    {
      id v111 = v10;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        id v18 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        id v109 = v9;
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v23 = [v12 NF_userInfo];
        [v23 objectForKeyedSubscript:@"ClientName"];
        int v24 = self;
        v26 = int v25 = a2;
        id v106 = [v12 processIdentifier];
        uint64_t v27 = 45;
        if (isMetaClass) {
          uint64_t v27 = 43;
        }
        id v102 = ClassName;
        id v9 = v109;
        v18(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v27, v102, Name, 5605, v26, v106);

        a2 = v25;
        self = v24;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v28 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = object_getClass(self);
        if (class_isMetaClass(v29)) {
          int v30 = 43;
        }
        else {
          int v30 = 45;
        }
        BOOL v31 = object_getClassName(self);
        uint64_t v32 = sel_getName(a2);
        BOOL v33 = [v12 NF_userInfo];
        BOOL v34 = [v33 objectForKeyedSubscript:@"ClientName"];
        *(_DWORD *)buf = 67110402;
        int v118 = v30;
        __int16 v119 = 2082;
        __int16 v120 = v31;
        __int16 v121 = 2082;
        __int16 v122 = v32;
        __int16 v123 = 1024;
        int v124 = 5605;
        __int16 v125 = 2114;
        __int16 v126 = v34;
        __int16 v127 = 1024;
        LODWORD(v128) = [v12 processIdentifier];
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);
      }
      id v11 = v113;
      (*((void (**)(id, void, void, void *))v113 + 2))(v113, 0, 0, v16);
      id v10 = v111;
    }
    else if ((id)[(_NFHardwareManager *)self nfcRadioEnabled:0 showUIPopup:sub_1000FAEAC((uint64_t)self, v10)] == (id)1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v39 = [v10 objectForKeyedSubscript:@"session.sts.handover.role"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          int v41 = [v10 objectForKeyedSubscript:@"session.sts.handover.role"];
          unint64_t v112 = (unint64_t)[v41 unsignedIntegerValue];
        }
        else
        {
          unint64_t v112 = -1;
        }
        id v56 = [v10 objectForKeyedSubscript:@"session.sts.handover.type"];
        objc_opt_class();
        char v57 = objc_opt_isKindOfClass();

        if (v57)
        {
          uint64_t v58 = [v10 objectForKeyedSubscript:@"session.sts.handover.type"];
          id v110 = [v58 unsignedIntegerValue];
        }
        else
        {
          id v110 = 0;
        }
        p_vtable = (void **)(&OBJC_METACLASS___NFAppletExtraInfo + 24);
      }
      else
      {
        id v110 = 0;
        unint64_t v112 = -1;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v59 = NFLogGetLogger();
      unsigned int v108 = v12;
      if (v59)
      {
        uint64_t v60 = (void (*)(uint64_t, const char *, ...))v59;
        id v61 = object_getClass(self);
        BOOL v62 = class_isMetaClass(v61);
        BOOL v63 = object_getClassName(self);
        id v64 = self;
        BOOL v65 = a2;
        uint64_t v66 = sel_getName(a2);
        [v12 NF_userInfo];
        uint64_t v68 = v67 = v9;
        int v69 = [v68 objectForKeyedSubscript:@"ClientName"];
        BOOL v70 = !v62;
        p_vtable = (void **)(&OBJC_METACLASS___NFAppletExtraInfo + 24);
        int v104 = v66;
        a2 = v65;
        self = v64;
        uint64_t v71 = 43;
        if (v70) {
          uint64_t v71 = 45;
        }
        v60(6, "%c[%{public}s %{public}s]:%i %{public}@, role=0x%lx, type=0x%lx", v71, v63, v104, 5627, v69, v112, v110);

        id v9 = v67;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v72 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        id v73 = object_getClass(self);
        id v74 = v10;
        if (class_isMetaClass(v73)) {
          int v75 = 43;
        }
        else {
          int v75 = 45;
        }
        unsigned int v76 = object_getClassName(self);
        uint64_t v77 = sel_getName(a2);
        [v108 NF_userInfo];
        BOOL v78 = v107 = a2;
        __int16 v79 = [v78 objectForKeyedSubscript:@"ClientName"];
        *(_DWORD *)buf = 67110658;
        int v118 = v75;
        id v10 = v74;
        __int16 v119 = 2082;
        __int16 v120 = v76;
        p_vtable = &OBJC_METACLASS___NFAppletExtraInfo.vtable;
        __int16 v121 = 2082;
        __int16 v122 = v77;
        __int16 v123 = 1024;
        int v124 = 5627;
        __int16 v125 = 2114;
        __int16 v126 = v79;
        __int16 v127 = 2048;
        unint64_t v128 = v112;
        __int16 v129 = 2048;
        id v130 = v110;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@, role=0x%lx, type=0x%lx", buf, 0x40u);

        a2 = v107;
      }

      self;
      if (v112 <= 4 && v110)
      {
        uint64_t v80 = sub_10005AA18(objc_alloc((Class)(p_vtable + 162)), (uint64_t)v9, (void *)v112, v110, (uint64_t)self->_expressModeManager, self->_secureElementWrapper, self->_driverWrapper, (uint64_t)self->_workQueue);
        id v12 = v108;
        [v80 setConnection:v108];
        [v80 setQueue:self];
        [v80 setUid:0xFFFFFFFFLL];
        uint64_t v82 = sub_1001AED74();
        id v11 = v113;
        if (v80) {
          objc_setProperty_atomic(v80, v81, v82, 176);
        }

        int v83 = [v108 exportedInterface];
        sub_10006E93C((uint64_t)NFHardwareManagerInterface, v83);

        buf[0] = 0;
        int v84 = sub_1001DBA28((id *)&self->super.isa, v80, v108, buf);
        if (v84)
        {
          (*((void (**)(id, void, void, void *))v113 + 2))(v113, 0, 0, v84);
        }
        else
        {
          (*((void (**)(id, id *, void, void))v113 + 2))(v113, v80, buf[0], 0);
          workQueue = self->_workQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100116394;
          block[3] = &unk_100301C68;
          void block[4] = self;
          dispatch_async(workQueue, block);
        }
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v85 = NFLogGetLogger();
        id v11 = v113;
        id v12 = v108;
        if (v85)
        {
          id v86 = (void (*)(uint64_t, const char *, ...))v85;
          __int16 v87 = object_getClass(self);
          BOOL v88 = class_isMetaClass(v87);
          id v89 = object_getClassName(self);
          __int16 v105 = sel_getName(a2);
          uint64_t v90 = 45;
          if (v88) {
            uint64_t v90 = 43;
          }
          v86(3, "%c[%{public}s %{public}s]:%i Role or type mismatch", v90, v89, v105, 5630);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v91 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        {
          id v92 = object_getClass(self);
          if (class_isMetaClass(v92)) {
            int v93 = 43;
          }
          else {
            int v93 = 45;
          }
          BOOL v94 = object_getClassName(self);
          id v95 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v118 = v93;
          __int16 v119 = 2082;
          __int16 v120 = v94;
          __int16 v121 = 2082;
          __int16 v122 = v95;
          __int16 v123 = 1024;
          int v124 = 5630;
          _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Role or type mismatch", buf, 0x22u);
        }

        id v96 = objc_alloc((Class)NSError);
        id v97 = +[NSString stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v115 = NSLocalizedDescriptionKey;
        uint64_t v98 = +[NSString stringWithUTF8String:"Invalid Parameter"];
        NSErrorUserInfoKey v116 = v98;
        int v99 = +[NSDictionary dictionaryWithObjects:&v116 forKeys:&v115 count:1];
        id v100 = [v96 initWithDomain:v97 code:10 userInfo:v99];
        (*((void (**)(id, void, void, id))v113 + 2))(v113, 0, 0, v100);
      }
      unsigned int v16 = 0;
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v42 = NFLogGetLogger();
      id v11 = v113;
      if (v42)
      {
        int v43 = (void (*)(uint64_t, const char *, ...))v42;
        int v44 = object_getClass(self);
        BOOL v45 = class_isMetaClass(v44);
        id v46 = object_getClassName(self);
        __int16 v103 = sel_getName(a2);
        uint64_t v47 = 45;
        if (v45) {
          uint64_t v47 = 43;
        }
        v43(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v47, v46, v103, 5611);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v48 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        id v49 = object_getClass(self);
        if (class_isMetaClass(v49)) {
          int v50 = 43;
        }
        else {
          int v50 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v118 = v50;
        __int16 v119 = 2082;
        __int16 v120 = object_getClassName(self);
        __int16 v121 = 2082;
        __int16 v122 = sel_getName(a2);
        __int16 v123 = 1024;
        int v124 = 5611;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
      }

      id v51 = objc_alloc((Class)NSError);
      uint64_t v52 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v131 = NSLocalizedDescriptionKey;
      id v53 = +[NSString stringWithUTF8String:"NFC radio disabled"];
      NSErrorUserInfoKey v132 = v53;
      id v54 = +[NSDictionary dictionaryWithObjects:&v132 forKeys:&v131 count:1];
      id v55 = [v51 initWithDomain:v52 code:50 userInfo:v54];
      (*((void (**)(id, void, void, id))v113 + 2))(v113, 0, 0, v55);

      unsigned int v16 = 0;
    }
  }
  else
  {
    id v35 = objc_alloc((Class)NSError);
    unsigned int v16 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v133 = NSLocalizedDescriptionKey;
    uint64_t v36 = +[NSString stringWithUTF8String:"Unresponsive hardware"];
    NSErrorUserInfoKey v134 = v36;
    id v37 = +[NSDictionary dictionaryWithObjects:&v134 forKeys:&v133 count:1];
    id v38 = [v35 initWithDomain:v16 code:58 userInfo:v37];
    (*((void (**)(id, void, void, id))v11 + 2))(v11, 0, 0, v38);
  }
}

- (void)queueSecureTransactionServicesHybridSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = +[NSXPCConnection currentConnection];
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 2)
  {
    id v112 = v11;
    p_info = NFHeadlessModeController.info;
    id v14 = [v12 NF_userInfo];
    id v15 = [v14 objectForKeyedSubscript:@"ServiceWhitelist"];
    unsigned int v16 = +[_NFSecureTransactionServicesHandoverHybridSession validateEntitlements:v15];

    if (v16)
    {
      id v110 = v10;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        id v18 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        id v108 = v9;
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v23 = [v12 NF_userInfo];
        [v23 objectForKeyedSubscript:@"ClientName"];
        int v24 = self;
        v26 = int v25 = a2;
        id v105 = [v12 processIdentifier];
        uint64_t v27 = 45;
        if (isMetaClass) {
          uint64_t v27 = 43;
        }
        BOOL v101 = ClassName;
        id v9 = v108;
        v18(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v27, v101, Name, 5677, v26, v105);

        a2 = v25;
        self = v24;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v28 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = object_getClass(self);
        if (class_isMetaClass(v29)) {
          int v30 = 43;
        }
        else {
          int v30 = 45;
        }
        BOOL v31 = object_getClassName(self);
        uint64_t v32 = sel_getName(a2);
        BOOL v33 = [v12 NF_userInfo];
        BOOL v34 = [v33 objectForKeyedSubscript:@"ClientName"];
        *(_DWORD *)buf = 67110402;
        int v117 = v30;
        __int16 v118 = 2082;
        __int16 v119 = v31;
        __int16 v120 = 2082;
        __int16 v121 = v32;
        __int16 v122 = 1024;
        int v123 = 5677;
        __int16 v124 = 2114;
        __int16 v125 = v34;
        __int16 v126 = 1024;
        LODWORD(v127) = [v12 processIdentifier];
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);
      }
      id v11 = v112;
      (*((void (**)(id, void, void, void *))v112 + 2))(v112, 0, 0, v16);
      id v10 = v110;
    }
    else if ((id)[(_NFHardwareManager *)self nfcRadioEnabled:0 showUIPopup:sub_1000FAEAC((uint64_t)self, v10)] == (id)1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v39 = [v10 objectForKeyedSubscript:@"session.sts.handover.role"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          int v41 = [v10 objectForKeyedSubscript:@"session.sts.handover.role"];
          uint64_t v111 = (uint64_t)[v41 unsignedIntegerValue];
        }
        else
        {
          uint64_t v111 = -1;
        }
        id v56 = [v10 objectForKeyedSubscript:@"session.sts.handover.type"];
        objc_opt_class();
        char v57 = objc_opt_isKindOfClass();

        if (v57)
        {
          uint64_t v58 = [v10 objectForKeyedSubscript:@"session.sts.handover.type"];
          id v109 = [v58 unsignedIntegerValue];
        }
        else
        {
          id v109 = 0;
        }
        p_info = (__objc2_class_ro **)(NFHeadlessModeController + 32);
      }
      else
      {
        id v109 = 0;
        uint64_t v111 = -1;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v59 = NFLogGetLogger();
      __int16 v107 = v12;
      if (v59)
      {
        uint64_t v60 = (void (*)(uint64_t, const char *, ...))v59;
        id v61 = object_getClass(self);
        BOOL v62 = class_isMetaClass(v61);
        BOOL v63 = object_getClassName(self);
        id v64 = self;
        BOOL v65 = a2;
        uint64_t v66 = sel_getName(a2);
        [v12 NF_userInfo];
        uint64_t v68 = v67 = v9;
        int v69 = [v68 objectForKeyedSubscript:@"ClientName"];
        BOOL v70 = !v62;
        p_info = (__objc2_class_ro **)(NFHeadlessModeController + 32);
        __int16 v103 = v66;
        a2 = v65;
        self = v64;
        uint64_t v71 = 43;
        if (v70) {
          uint64_t v71 = 45;
        }
        v60(6, "%c[%{public}s %{public}s]:%i %{public}@, role=0x%lx, type=0x%lx", v71, v63, v103, 5699, v69, v111, v109);

        id v9 = v67;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v72 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        id v73 = object_getClass(self);
        id v74 = v10;
        if (class_isMetaClass(v73)) {
          int v75 = 43;
        }
        else {
          int v75 = 45;
        }
        unsigned int v76 = object_getClassName(self);
        uint64_t v77 = sel_getName(a2);
        [v107 NF_userInfo];
        BOOL v78 = v106 = a2;
        __int16 v79 = [v78 objectForKeyedSubscript:@"ClientName"];
        *(_DWORD *)buf = 67110658;
        int v117 = v75;
        id v10 = v74;
        __int16 v118 = 2082;
        __int16 v119 = v76;
        p_info = NFHeadlessModeController.info;
        __int16 v120 = 2082;
        __int16 v121 = v77;
        __int16 v122 = 1024;
        int v123 = 5699;
        __int16 v124 = 2114;
        __int16 v125 = v79;
        __int16 v126 = 2048;
        uint64_t v127 = v111;
        __int16 v128 = 2048;
        id v129 = v109;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@, role=0x%lx, type=0x%lx", buf, 0x40u);

        a2 = v106;
      }

      if ([p_info + 86 isRoleValid:v111] && v109)
      {
        id v80 = [objc_alloc((Class)(p_info + 86)) initWithRemoteObject:v9 role:v111 type:v109 expressModeManager:self->_expressModeManager seWrapper:self->_secureElementWrapper driverWrapper:self->_driverWrapper workQueue:self->_workQueue];
        id v12 = v107;
        [v80 setConnection:v107];
        [v80 setQueue:self];
        [v80 setUid:0xFFFFFFFFLL];
        BOOL v81 = sub_1001AED74();
        [v80 setPowerConsumptionReporter:v81];

        uint64_t v82 = [v107 exportedInterface];
        sub_10006E93C((uint64_t)NFHardwareManagerInterface, v82);

        buf[0] = 0;
        int v83 = sub_1001DBA28((id *)&self->super.isa, v80, v107, buf);
        id v11 = v112;
        if (v83)
        {
          (*((void (**)(id, void, void, void *))v112 + 2))(v112, 0, 0, v83);
        }
        else
        {
          (*((void (**)(id, id, void, void))v112 + 2))(v112, v80, buf[0], 0);
          workQueue = self->_workQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100116FBC;
          block[3] = &unk_100301C68;
          void block[4] = self;
          dispatch_async(workQueue, block);
        }
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v84 = NFLogGetLogger();
        id v11 = v112;
        id v12 = v107;
        if (v84)
        {
          uint64_t v85 = (void (*)(uint64_t, const char *, ...))v84;
          id v86 = object_getClass(self);
          BOOL v87 = class_isMetaClass(v86);
          BOOL v88 = object_getClassName(self);
          int v104 = sel_getName(a2);
          uint64_t v89 = 45;
          if (v87) {
            uint64_t v89 = 43;
          }
          v85(3, "%c[%{public}s %{public}s]:%i Role or type mismatch", v89, v88, v104, 5702);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v90 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
        {
          uint64_t v91 = object_getClass(self);
          if (class_isMetaClass(v91)) {
            int v92 = 43;
          }
          else {
            int v92 = 45;
          }
          int v93 = object_getClassName(self);
          BOOL v94 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v117 = v92;
          __int16 v118 = 2082;
          __int16 v119 = v93;
          __int16 v120 = 2082;
          __int16 v121 = v94;
          __int16 v122 = 1024;
          int v123 = 5702;
          _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Role or type mismatch", buf, 0x22u);
        }

        id v95 = objc_alloc((Class)NSError);
        id v96 = +[NSString stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v114 = NSLocalizedDescriptionKey;
        id v97 = +[NSString stringWithUTF8String:"Invalid Parameter"];
        NSErrorUserInfoKey v115 = v97;
        uint64_t v98 = +[NSDictionary dictionaryWithObjects:&v115 forKeys:&v114 count:1];
        id v99 = [v95 initWithDomain:v96 code:10 userInfo:v98];
        (*((void (**)(id, void, void, id))v112 + 2))(v112, 0, 0, v99);
      }
      unsigned int v16 = 0;
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v42 = NFLogGetLogger();
      id v11 = v112;
      if (v42)
      {
        int v43 = (void (*)(uint64_t, const char *, ...))v42;
        int v44 = object_getClass(self);
        BOOL v45 = class_isMetaClass(v44);
        id v46 = object_getClassName(self);
        id v102 = sel_getName(a2);
        uint64_t v47 = 45;
        if (v45) {
          uint64_t v47 = 43;
        }
        v43(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v47, v46, v102, 5683);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v48 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        id v49 = object_getClass(self);
        if (class_isMetaClass(v49)) {
          int v50 = 43;
        }
        else {
          int v50 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v117 = v50;
        __int16 v118 = 2082;
        __int16 v119 = object_getClassName(self);
        __int16 v120 = 2082;
        __int16 v121 = sel_getName(a2);
        __int16 v122 = 1024;
        int v123 = 5683;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
      }

      id v51 = objc_alloc((Class)NSError);
      uint64_t v52 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v130 = NSLocalizedDescriptionKey;
      id v53 = +[NSString stringWithUTF8String:"NFC radio disabled"];
      NSErrorUserInfoKey v131 = v53;
      id v54 = +[NSDictionary dictionaryWithObjects:&v131 forKeys:&v130 count:1];
      id v55 = [v51 initWithDomain:v52 code:50 userInfo:v54];
      (*((void (**)(id, void, void, id))v112 + 2))(v112, 0, 0, v55);

      unsigned int v16 = 0;
    }
  }
  else
  {
    id v35 = objc_alloc((Class)NSError);
    unsigned int v16 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v132 = NSLocalizedDescriptionKey;
    uint64_t v36 = +[NSString stringWithUTF8String:"Unresponsive hardware"];
    NSErrorUserInfoKey v133 = v36;
    id v37 = +[NSDictionary dictionaryWithObjects:&v133 forKeys:&v132 count:1];
    id v38 = [v35 initWithDomain:v16 code:58 userInfo:v37];
    (*((void (**)(id, void, void, id))v11 + 2))(v11, 0, 0, v38);
  }
}

- (void)queueUnifiedAccessSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v103 = a4;
  id v101 = a5;
  id v10 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  sel = a2;
  if (Logger)
  {
    id v12 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    id v16 = v9;
    Name = sel_getName(a2);
    id v18 = [v10 NF_userInfo];
    int v19 = [v18 objectForKeyedSubscript:@"ClientName"];
    id v97 = Name;
    id v9 = v16;
    uint64_t v20 = 45;
    if (isMetaClass) {
      uint64_t v20 = 43;
    }
    v12(6, "%c[%{public}s %{public}s]:%i %{public}@", v20, ClassName, v97, 5743, v19);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v21 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = object_getClass(self);
    if (class_isMetaClass(v22)) {
      int v23 = 43;
    }
    else {
      int v23 = 45;
    }
    int v24 = object_getClassName(self);
    int v25 = sel_getName(sel);
    int v26 = [v10 NF_userInfo];
    uint64_t v27 = [v26 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    int v115 = v23;
    __int16 v116 = 2082;
    int v117 = v24;
    __int16 v118 = 2082;
    __int16 v119 = v25;
    __int16 v120 = 1024;
    int v121 = 5743;
    __int16 v122 = 2114;
    int v123 = v27;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 2)
  {
    uint64_t v28 = [v10 NF_userInfo];
    uint64_t v29 = [v28 objectForKeyedSubscript:@"ServiceWhitelist"];
    int v30 = +[_NFUnifiedAccessSession validateEntitlements:v29];

    if (v30)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v31 = NFLogGetLogger();
      if (v31)
      {
        uint64_t v32 = (void (*)(uint64_t, const char *, ...))v31;
        BOOL v33 = object_getClass(self);
        BOOL v34 = class_isMetaClass(v33);
        id v35 = object_getClassName(self);
        uint64_t v36 = sel_getName(sel);
        [v10 NF_userInfo];
        v38 = id v37 = v9;
        id v39 = [v38 objectForKeyedSubscript:@"ClientName"];
        id v100 = [v10 processIdentifier];
        uint64_t v40 = 45;
        if (v34) {
          uint64_t v40 = 43;
        }
        v32(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v40, v35, v36, 5752, v39, v100);

        id v9 = v37;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v41 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        uint64_t v42 = object_getClass(self);
        if (class_isMetaClass(v42)) {
          int v43 = 43;
        }
        else {
          int v43 = 45;
        }
        int v44 = object_getClassName(self);
        BOOL v45 = sel_getName(sel);
        [v10 NF_userInfo];
        v47 = id v46 = v10;
        id v48 = [v47 objectForKeyedSubscript:@"ClientName"];
        unsigned int v49 = [v46 processIdentifier];
        *(_DWORD *)buf = 67110402;
        int v115 = v43;
        __int16 v116 = 2082;
        int v117 = v44;
        __int16 v118 = 2082;
        __int16 v119 = v45;
        __int16 v120 = 1024;
        int v121 = 5752;
        __int16 v122 = 2114;
        int v123 = v48;
        __int16 v124 = 1024;
        unsigned int v125 = v49;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);

        id v10 = v46;
      }

      int v50 = v101;
      (*((void (**)(id, void, void, void *))v101 + 2))(v101, 0, 0, v30);
    }
    else if ((id)[(_NFHardwareManager *)self nfcRadioEnabled:0 showUIPopup:sub_1000FAEAC((uint64_t)self, v103)] == (id)1)
    {
      id v56 = [[_NFUnifiedAccessSession alloc] initWithRemoteObject:v9 expressModeManager:self->_expressModeManager driverWrapper:self->_driverWrapper workQueue:self->_workQueue];
      char v57 = v56;
      if (v56)
      {
        [(_NFSession *)v56 setQueue:self];
        [(_NFXPCSession *)v57 setConnection:v10];
        [(_NFSession *)v57 setUid:0xFFFFFFFFLL];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v58 = [v103 objectForKeyedSubscript:@"session.force.express.exit"];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            uint64_t v60 = [v103 objectForKeyedSubscript:@"session.force.express.exit"];
            -[_NFSession setForceExpressExit:](v57, "setForceExpressExit:", [v60 BOOLValue]);
          }
        }
        id v61 = [v10 exportedInterface];
        sub_10006E854((uint64_t)NFHardwareManagerInterface, v61);

        (*((void (**)(id, _NFUnifiedAccessSession *, BOOL, void))v101 + 2))(v101, v57, [(_NFHardwareManager *)self isFirstInQueue], 0);
        workQueue = self->_workQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100117AC0;
        block[3] = &unk_100304830;
        id v105 = v57;
        id v106 = self;
        int v50 = v101;
        BOOL v63 = v10;
        id v107 = v10;
        id v108 = sel;
        char v109 = 0;
        dispatch_async(workQueue, block);

        id v64 = v105;
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v82 = NFLogGetLogger();
        if (v82)
        {
          int v83 = (void (*)(uint64_t, const char *, ...))v82;
          uint64_t v84 = object_getClass(self);
          BOOL v85 = class_isMetaClass(v84);
          id v86 = object_getClassName(self);
          id v99 = sel_getName(sel);
          uint64_t v87 = 45;
          if (v85) {
            uint64_t v87 = 43;
          }
          v83(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v87, v86, v99, 5768);
        }
        BOOL v63 = v10;
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        BOOL v88 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
        {
          uint64_t v89 = object_getClass(self);
          if (class_isMetaClass(v89)) {
            int v90 = 43;
          }
          else {
            int v90 = 45;
          }
          uint64_t v91 = object_getClassName(self);
          int v92 = sel_getName(sel);
          *(_DWORD *)buf = 67109890;
          int v115 = v90;
          __int16 v116 = 2082;
          int v117 = v91;
          __int16 v118 = 2082;
          __int16 v119 = v92;
          __int16 v120 = 1024;
          int v121 = 5768;
          _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
        }

        id v93 = objc_alloc((Class)NSError);
        id v64 = +[NSString stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v110 = NSLocalizedDescriptionKey;
        BOOL v94 = +[NSString stringWithUTF8String:"Unexpected Result"];
        uint64_t v111 = v94;
        id v95 = +[NSDictionary dictionaryWithObjects:&v111 forKeys:&v110 count:1];
        id v96 = [v93 initWithDomain:v64 code:13 userInfo:v95];
        int v50 = v101;
        (*((void (**)(id, void, void, id))v101 + 2))(v101, 0, 0, v96);
      }
      int v30 = 0;
      id v10 = v63;
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v65 = NFLogGetLogger();
      if (v65)
      {
        uint64_t v66 = (void (*)(uint64_t, const char *, ...))v65;
        id v67 = object_getClass(self);
        BOOL v68 = class_isMetaClass(v67);
        int v69 = object_getClassName(self);
        uint64_t v98 = sel_getName(sel);
        uint64_t v70 = 45;
        if (v68) {
          uint64_t v70 = 43;
        }
        v66(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v70, v69, v98, 5758);
      }
      uint64_t v71 = v10;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v72 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        id v73 = object_getClass(self);
        if (class_isMetaClass(v73)) {
          int v74 = 43;
        }
        else {
          int v74 = 45;
        }
        int v75 = object_getClassName(self);
        unsigned int v76 = sel_getName(sel);
        *(_DWORD *)buf = 67109890;
        int v115 = v74;
        __int16 v116 = 2082;
        int v117 = v75;
        __int16 v118 = 2082;
        __int16 v119 = v76;
        __int16 v120 = 1024;
        int v121 = 5758;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
      }

      id v77 = objc_alloc((Class)NSError);
      BOOL v78 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v112 = NSLocalizedDescriptionKey;
      __int16 v79 = +[NSString stringWithUTF8String:"NFC radio disabled"];
      id v113 = v79;
      id v80 = +[NSDictionary dictionaryWithObjects:&v113 forKeys:&v112 count:1];
      id v81 = [v77 initWithDomain:v78 code:50 userInfo:v80];
      int v50 = v101;
      (*((void (**)(id, void, void, id))v101 + 2))(v101, 0, 0, v81);

      int v30 = 0;
      id v10 = v71;
    }
  }
  else
  {
    id v51 = objc_alloc((Class)NSError);
    int v30 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v126 = NSLocalizedDescriptionKey;
    uint64_t v52 = +[NSString stringWithUTF8String:"Unresponsive hardware"];
    uint64_t v127 = v52;
    +[NSDictionary dictionaryWithObjects:&v127 forKeys:&v126 count:1];
    id v54 = v53 = v10;
    id v55 = [v51 initWithDomain:v30 code:58 userInfo:v54];
    int v50 = v101;
    (*((void (**)(id, void, void, id))v101 + 2))(v101, 0, 0, v55);

    id v10 = v53;
  }
}

- (void)queueSecureElementLoggingSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v73 = a3;
  id v72 = a5;
  id v8 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    id v15 = [v8 NF_userInfo];
    id v16 = [v15 objectForKeyedSubscript:@"ClientName"];
    uint64_t v17 = 45;
    if (isMetaClass) {
      uint64_t v17 = 43;
    }
    v10(6, "%c[%{public}s %{public}s]:%i %{public}@", v17, ClassName, Name, 5814, v16);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = object_getClass(self);
    if (class_isMetaClass(v19)) {
      int v20 = 43;
    }
    else {
      int v20 = 45;
    }
    uint64_t v21 = object_getClassName(self);
    uint64_t v22 = sel_getName(a2);
    int v23 = [v8 NF_userInfo];
    int v24 = [v23 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    int v78 = v20;
    __int16 v79 = 2082;
    id v80 = v21;
    __int16 v81 = 2082;
    uint64_t v82 = v22;
    __int16 v83 = 1024;
    int v84 = 5814;
    __int16 v85 = 2114;
    id v86 = v24;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 2
    || -[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 5)
  {
    int v25 = [v8 NF_userInfo];
    int v26 = [v25 objectForKeyedSubscript:@"ServiceWhitelist"];
    uint64_t v27 = +[_NFSecureElementLoggingSession validateEntitlements:v26];

    if (v27)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v28 = NFLogGetLogger();
      if (v28)
      {
        uint64_t v29 = (void (*)(uint64_t, const char *, ...))v28;
        int v30 = object_getClass(self);
        BOOL v31 = class_isMetaClass(v30);
        uint64_t v32 = object_getClassName(self);
        BOOL v33 = sel_getName(a2);
        BOOL v34 = [v8 NF_userInfo];
        id v35 = [v34 objectForKeyedSubscript:@"ClientName"];
        id v71 = [v8 processIdentifier];
        uint64_t v36 = 45;
        if (v31) {
          uint64_t v36 = 43;
        }
        v29(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v36, v32, v33, 5823, v35, v71);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v37 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        id v38 = object_getClass(self);
        if (class_isMetaClass(v38)) {
          int v39 = 43;
        }
        else {
          int v39 = 45;
        }
        uint64_t v40 = object_getClassName(self);
        int v41 = sel_getName(a2);
        uint64_t v42 = [v8 NF_userInfo];
        int v43 = [v42 objectForKeyedSubscript:@"ClientName"];
        unsigned int v44 = [v8 processIdentifier];
        *(_DWORD *)buf = 67110402;
        int v78 = v39;
        __int16 v79 = 2082;
        id v80 = v40;
        __int16 v81 = 2082;
        uint64_t v82 = v41;
        __int16 v83 = 1024;
        int v84 = 5823;
        __int16 v85 = 2114;
        id v86 = v43;
        __int16 v87 = 1024;
        unsigned int v88 = v44;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);
      }
      BOOL v45 = v72;
      (*((void (**)(id, void, void, void *))v72 + 2))(v72, 0, 0, v27);
    }
    else
    {
      id v46 = [(_NFXPCSession *)[_NFSecureElementLoggingSession alloc] initWithRemoteObject:v73 workQueue:self->_workQueue];
      uint64_t v47 = v46;
      if (v46)
      {
        [(_NFSession *)v46 setQueue:self];
        [(_NFXPCSession *)v47 setConnection:v8];
        [(_NFSession *)v47 setUid:0xFFFFFFFFLL];
        [(_NFSecureElementLoggingSession *)v47 setDriverWrapper:self->_driverWrapper];
        buf[0] = 0;
        id v48 = sub_1001DBA28((id *)&self->super.isa, v47, v8, buf);
        BOOL v45 = v72;
        if (v48)
        {
          (*((void (**)(id, void, void, void *))v72 + 2))(v72, 0, 0, v48);
        }
        else
        {
          (*((void (**)(id, _NFSecureElementLoggingSession *, void, void))v72 + 2))(v72, v47, buf[0], 0);
          workQueue = self->_workQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100118684;
          block[3] = &unk_100301C68;
          void block[4] = self;
          dispatch_async(workQueue, block);
        }
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v53 = NFLogGetLogger();
        if (v53)
        {
          id v54 = (void (*)(uint64_t, const char *, ...))v53;
          id v55 = object_getClass(self);
          BOOL v56 = class_isMetaClass(v55);
          char v57 = object_getClassName(self);
          uint64_t v70 = sel_getName(a2);
          uint64_t v58 = 45;
          if (v56) {
            uint64_t v58 = 43;
          }
          v54(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v58, v57, v70, 5830);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v59 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          uint64_t v60 = object_getClass(self);
          if (class_isMetaClass(v60)) {
            int v61 = 43;
          }
          else {
            int v61 = 45;
          }
          BOOL v62 = object_getClassName(self);
          BOOL v63 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v78 = v61;
          __int16 v79 = 2082;
          id v80 = v62;
          __int16 v81 = 2082;
          uint64_t v82 = v63;
          __int16 v83 = 1024;
          int v84 = 5830;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
        }

        id v64 = objc_alloc((Class)NSError);
        uint64_t v65 = +[NSString stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v75 = NSLocalizedDescriptionKey;
        uint64_t v66 = +[NSString stringWithUTF8String:"Unexpected Result"];
        unsigned int v76 = v66;
        id v67 = +[NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
        id v68 = [v64 initWithDomain:v65 code:13 userInfo:v67];
        BOOL v45 = v72;
        (*((void (**)(id, void, void, id))v72 + 2))(v72, 0, 0, v68);
      }
      uint64_t v27 = 0;
    }
  }
  else
  {
    id v49 = objc_alloc((Class)NSError);
    uint64_t v27 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v89 = NSLocalizedDescriptionKey;
    int v50 = +[NSString stringWithUTF8String:"Unresponsive hardware"];
    int v90 = v50;
    id v51 = +[NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
    id v52 = [v49 initWithDomain:v27 code:58 userInfo:v51];
    BOOL v45 = v72;
    (*((void (**)(id, void, void, id))v72 + 2))(v72, 0, 0, v52);
  }
}

- (void)queueLPEMConfigSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v54 = a3;
  id v53 = a5;
  id v8 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    [v8 NF_userInfo];
    v16 = id v15 = a2;
    uint64_t v17 = [v16 objectForKeyedSubscript:@"ClientName"];
    uint64_t v18 = 45;
    if (isMetaClass) {
      uint64_t v18 = 43;
    }
    v10(6, "%c[%{public}s %{public}s]:%i %{public}@", v18, ClassName, Name, 5863, v17);

    a2 = v15;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v19 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = object_getClass(self);
    if (class_isMetaClass(v20)) {
      int v21 = 43;
    }
    else {
      int v21 = 45;
    }
    uint64_t v22 = object_getClassName(self);
    int v23 = sel_getName(a2);
    int v24 = [v8 NF_userInfo];
    int v25 = [v24 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    int v57 = v21;
    __int16 v58 = 2082;
    uint64_t v59 = v22;
    __int16 v60 = 2082;
    int v61 = v23;
    __int16 v62 = 1024;
    int v63 = 5863;
    __int16 v64 = 2114;
    uint64_t v65 = v25;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  int v26 = [v8 NF_userInfo];
  uint64_t v27 = [v26 objectForKeyedSubscript:@"ServiceWhitelist"];
  uint64_t v28 = +[_NFLPEMConfigSession validateEntitlements:v27];

  if (v28)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v29 = NFLogGetLogger();
    if (v29)
    {
      int v30 = (void (*)(uint64_t, const char *, ...))v29;
      BOOL v31 = object_getClass(self);
      BOOL v32 = class_isMetaClass(v31);
      BOOL v33 = object_getClassName(self);
      BOOL v34 = sel_getName(a2);
      [v8 NF_userInfo];
      uint64_t v36 = v35 = a2;
      id v37 = [v36 objectForKeyedSubscript:@"ClientName"];
      id v52 = [v8 processIdentifier];
      uint64_t v38 = 45;
      if (v32) {
        uint64_t v38 = 43;
      }
      v30(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", v38, v33, v34, 5867, v37, v52);

      a2 = v35;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v39 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = object_getClass(self);
      if (class_isMetaClass(v40)) {
        int v41 = 43;
      }
      else {
        int v41 = 45;
      }
      uint64_t v42 = object_getClassName(self);
      int v43 = sel_getName(a2);
      unsigned int v44 = [v8 NF_userInfo];
      BOOL v45 = [v44 objectForKeyedSubscript:@"ClientName"];
      unsigned int v46 = [v8 processIdentifier];
      *(_DWORD *)buf = 67110402;
      int v57 = v41;
      __int16 v58 = 2082;
      uint64_t v59 = v42;
      __int16 v60 = 2082;
      int v61 = v43;
      __int16 v62 = 1024;
      int v63 = 5867;
      __int16 v64 = 2114;
      uint64_t v65 = v45;
      __int16 v66 = 1024;
      unsigned int v67 = v46;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %d)", buf, 0x32u);
    }
    uint64_t v47 = v53;
    (*((void (**)(id, void, void, void *))v53 + 2))(v53, 0, 0, v28);
    id v48 = v54;
  }
  else
  {
    id v48 = v54;
    id v49 = [(_NFXPCSession *)[_NFLPEMConfigSession alloc] initWithRemoteObject:v54 workQueue:self->_workQueue];
    [(_NFSession *)v49 setQueue:self];
    [(_NFXPCSession *)v49 setConnection:v8];
    [(_NFSession *)v49 setUid:0xFFFFFFFFLL];
    [(_NFLPEMConfigSession *)v49 setDriverWrapper:self->_driverWrapper];
    buf[0] = 0;
    int v50 = sub_1001DBA28((id *)&self->super.isa, v49, v8, buf);
    uint64_t v47 = v53;
    if (v50)
    {
      (*((void (**)(id, void, void, void *))v53 + 2))(v53, 0, 0, v50);
    }
    else
    {
      (*((void (**)(id, _NFLPEMConfigSession *, void, void))v53 + 2))(v53, v49, buf[0], 0);
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100118BFC;
      block[3] = &unk_100301C68;
      void block[4] = self;
      dispatch_async(workQueue, block);
    }
  }
}

- (void)queueCredentialSession:(id)a3 sessionAttribute:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[NSXPCConnection currentConnection];
  unsigned int v63 = -1;
  uint64_t v11 = sub_1001DAE10(self, v10, 1, &v63);
  if (v11)
  {
    id v12 = (id *)v11;
LABEL_14:
    (*((void (**)(id, void, void, id *))v9 + 2))(v9, 0, 0, v12);
    goto LABEL_15;
  }
  SEL v13 = [v10 NF_userInfo];
  id v14 = [v13 objectForKeyedSubscript:@"ServiceWhitelist"];
  id v12 = +[_NFCredentialSession validateEntitlements:v14];

  if (v12)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v16 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      int v19 = a2;
      id v20 = v8;
      int v21 = Name;
      uint64_t v22 = [v10 NF_userInfo];
      int v23 = [v22 objectForKeyedSubscript:@"ClientName"];
      id v59 = [v10 processIdentifier];
      int v57 = v21;
      id v8 = v20;
      a2 = v19;
      uint64_t v24 = 45;
      if (isMetaClass) {
        uint64_t v24 = 43;
      }
      v16(3, "%c[%{public}s %{public}s]:%i Session not allowed from %@ (pid %d)", v24, ClassName, v57, 5918, v23, v59);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v25 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v26 = object_getClass(self);
      uint64_t v27 = a2;
      if (class_isMetaClass(v26)) {
        int v28 = 43;
      }
      else {
        int v28 = 45;
      }
      uint64_t v29 = object_getClassName(self);
      int v30 = sel_getName(v27);
      BOOL v31 = [v10 NF_userInfo];
      BOOL v32 = [v31 objectForKeyedSubscript:@"ClientName"];
      unsigned int v33 = [v10 processIdentifier];
      *(_DWORD *)buf = 67110402;
      int v67 = v28;
      __int16 v68 = 2082;
      int v69 = v29;
      __int16 v70 = 2082;
      id v71 = v30;
      __int16 v72 = 1024;
      int v73 = 5918;
      __int16 v74 = 2112;
      NSErrorUserInfoKey v75 = v32;
      __int16 v76 = 1024;
      unsigned int v77 = v33;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %@ (pid %d)", buf, 0x32u);
    }
    goto LABEL_14;
  }
  BOOL v34 = [_NFCredentialSession alloc];
  id v35 = sub_10012050C((id *)&self->super.isa);
  id v12 = [(_NFXPCSession *)v34 initWithRemoteObject:v8 workQueue:v35];

  if (v12)
  {
    [v12 setQueue:self];
    [v12 setConnection:v10];
    uint64_t v36 = [(_NFHardwareManager *)self driverWrapper];
    objc_storeStrong(v12 + 21, v36);

    [v12 setUid:v63];
    buf[0] = 0;
    id v37 = sub_1001DBA28((id *)&self->super.isa, v12, v10, buf);
    if (v37)
    {
      (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v37);
    }
    else
    {
      (*((void (**)(id, id *, void, void))v9 + 2))(v9, v12, buf[0], 0);
      BOOL v56 = sub_10012050C((id *)&self->super.isa);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001192D4;
      block[3] = &unk_100301C68;
      void block[4] = self;
      dispatch_async(v56, block);
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v38 = NFLogGetLogger();
    if (v38)
    {
      int v39 = (void (*)(uint64_t, const char *, ...))v38;
      uint64_t v40 = object_getClass(self);
      BOOL v41 = class_isMetaClass(v40);
      uint64_t v42 = object_getClassName(self);
      __int16 v58 = sel_getName(a2);
      uint64_t v43 = 45;
      if (v41) {
        uint64_t v43 = 43;
      }
      v39(3, "%c[%{public}s %{public}s]:%i Session creation failed.", v43, v42, v58, 5927);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    unsigned int v44 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      BOOL v45 = object_getClass(self);
      if (class_isMetaClass(v45)) {
        int v46 = 43;
      }
      else {
        int v46 = 45;
      }
      uint64_t v47 = object_getClassName(self);
      id v48 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v67 = v46;
      __int16 v68 = 2082;
      int v69 = v47;
      __int16 v70 = 2082;
      id v71 = v48;
      __int16 v72 = 1024;
      int v73 = 5927;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session creation failed.", buf, 0x22u);
    }

    id v49 = objc_alloc((Class)NSError);
    int v50 = +[NSString stringWithUTF8String:"nfcd"];
    v64[0] = NSLocalizedDescriptionKey;
    id v51 = +[NSString stringWithUTF8String:"Unexpected Result"];
    v65[0] = v51;
    v65[1] = &off_10031BDF0;
    v64[1] = @"Line";
    v64[2] = @"Method";
    id v52 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v65[2] = v52;
    v64[3] = NSDebugDescriptionErrorKey;
    id v53 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 5928];
    v65[3] = v53;
    id v54 = +[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:4];
    id v55 = [v49 initWithDomain:v50 code:13 userInfo:v54];
    (*((void (**)(id, void, void, id))v9 + 2))(v9, 0, 0, v55);

    id v12 = 0;
  }
LABEL_15:
}

- (void)queueCardSession:(id)a3 sessionConfig:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = +[NSXPCConnection currentConnection];
  int v88 = -1;
  uint64_t v13 = sub_1001DAE10(self, v12, 0, &v88);
  if (v13)
  {
    id v14 = (void *)v13;
    (*((void (**)(id, void, void, uint64_t))v11 + 2))(v11, 0, 0, v13);
    goto LABEL_43;
  }
  id v15 = [(_NFHardwareManager *)self driverWrapper];
  if (!v15 || (char v16 = v15[218], v15, (v16 & 1) == 0))
  {
    id v17 = objc_alloc((Class)NSError);
    id v14 = +[NSString stringWithUTF8String:"nfcd"];
    v105[0] = NSLocalizedDescriptionKey;
    uint64_t v18 = +[NSString stringWithUTF8String:"Feature Not Supported"];
    v106[0] = v18;
    v106[1] = &off_10031BE08;
    v105[1] = @"Line";
    v105[2] = @"Method";
    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v106[2] = v19;
    v105[3] = NSDebugDescriptionErrorKey;
    id v20 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 5969];
    v106[3] = v20;
    int v21 = +[NSDictionary dictionaryWithObjects:v106 forKeys:v105 count:4];
    id v22 = [v17 initWithDomain:v14 code:14 userInfo:v21];
    (*((void (**)(id, void, void, id))v11 + 2))(v11, 0, 0, v22);

LABEL_31:
    goto LABEL_43;
  }
  if ((id)[(_NFHardwareManager *)self nfcRadioEnabled:0 showUIPopup:1] != (id)1)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v40 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v44 = 45;
      if (isMetaClass) {
        uint64_t v44 = 43;
      }
      v40(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v44, ClassName, Name, 5974);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v45 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      int v46 = object_getClass(self);
      if (class_isMetaClass(v46)) {
        int v47 = 43;
      }
      else {
        int v47 = 45;
      }
      id v48 = object_getClassName(self);
      id v49 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v90 = v47;
      __int16 v91 = 2082;
      int v92 = v48;
      __int16 v93 = 2082;
      BOOL v94 = v49;
      __int16 v95 = 1024;
      int v96 = 5974;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
    }

    id v50 = objc_alloc((Class)NSError);
    id v14 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v103 = NSLocalizedDescriptionKey;
    uint64_t v18 = +[NSString stringWithUTF8String:"NFC radio disabled"];
    int v104 = v18;
    id v51 = +[NSDictionary dictionaryWithObjects:&v104 forKeys:&v103 count:1];
    id v52 = [v50 initWithDomain:v14 code:50 userInfo:v51];
    (*((void (**)(id, void, void, id))v11 + 2))(v11, 0, 0, v52);

    goto LABEL_31;
  }
  int v23 = [v12 NF_userInfo];
  id v14 = [v23 objectForKeyedSubscript:@"serviceType"];

  if (v14
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [v14 unsignedIntegerValue] == (id)2)
  {
    uint64_t v24 = [v12 NF_userInfo];
    int v25 = [v24 objectForKeyedSubscript:@"ServiceWhitelist"];
    id v26 = +[_NFCardSession validateEntitlements:v25];

    if (v26)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v27 = NFLogGetLogger();
      if (v27)
      {
        int v28 = (void (*)(uint64_t, const char *, ...))v27;
        uint64_t v29 = object_getClass(self);
        BOOL v73 = class_isMetaClass(v29);
        __int16 v76 = object_getClassName(self);
        __int16 v72 = sel_getName(a2);
        __int16 v74 = [v12 NF_userInfo];
        int v30 = [v74 objectForKeyedSubscript:@"ClientName"];
        id v71 = [v12 processIdentifier];
        uint64_t v31 = 45;
        if (v73) {
          uint64_t v31 = 43;
        }
        v28(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %{public}d)", v31, v76, v72, 5990, v30, v71);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      BOOL v32 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        unsigned int v33 = object_getClass(self);
        if (class_isMetaClass(v33)) {
          int v34 = 43;
        }
        else {
          int v34 = 45;
        }
        int v77 = v34;
        NSErrorUserInfoKey v75 = object_getClassName(self);
        id v35 = sel_getName(a2);
        uint64_t v36 = [v12 NF_userInfo];
        id v37 = [v36 objectForKeyedSubscript:@"ClientName"];
        unsigned int v38 = [v12 processIdentifier];
        *(_DWORD *)buf = 67110402;
        int v90 = v77;
        __int16 v91 = 2082;
        int v92 = v75;
        __int16 v93 = 2082;
        BOOL v94 = v35;
        __int16 v95 = 1024;
        int v96 = 5990;
        __int16 v97 = 2114;
        uint64_t v98 = v37;
        __int16 v99 = 1026;
        unsigned int v100 = v38;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %{public}d)", buf, 0x32u);
      }
      (*((void (**)(id, void, void, id))v11 + 2))(v11, 0, 0, v26);
    }
    else
    {
      __int16 v68 = [v12 NF_whitelistChecker];
      if (v12) {
        [v12 auditToken];
      }
      else {
        memset(v87, 0, sizeof(v87));
      }
      v78[0] = _NSConcreteStackBlock;
      v78[1] = 3221225472;
      v78[2] = sub_100119CB4;
      v78[3] = &unk_100304858;
      id v84 = v11;
      SEL v85 = a2;
      v78[4] = self;
      id v79 = v10;
      id v80 = v68;
      id v81 = v9;
      uint64_t v82 = v12;
      int v86 = v88;
      id v83 = v14;
      id v26 = v68;
      +[_NFCardSession isEligibleWithUserPrompt:1 auditToken:v87 completion:v78];
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v53 = NFLogGetLogger();
    if (v53)
    {
      id v54 = (void (*)(uint64_t, const char *, ...))v53;
      id v55 = object_getClass(self);
      BOOL v56 = class_isMetaClass(v55);
      int v57 = object_getClassName(self);
      __int16 v70 = sel_getName(a2);
      uint64_t v58 = 45;
      if (v56) {
        uint64_t v58 = 43;
      }
      v54(4, "%c[%{public}s %{public}s]:%i Invalid service type: %{public}@", v58, v57, v70, 5981, v14);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v59 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      __int16 v60 = object_getClass(self);
      if (class_isMetaClass(v60)) {
        int v61 = 43;
      }
      else {
        int v61 = 45;
      }
      __int16 v62 = object_getClassName(self);
      unsigned int v63 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v90 = v61;
      __int16 v91 = 2082;
      int v92 = v62;
      __int16 v93 = 2082;
      BOOL v94 = v63;
      __int16 v95 = 1024;
      int v96 = 5981;
      __int16 v97 = 2114;
      uint64_t v98 = v14;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid service type: %{public}@", buf, 0x2Cu);
    }

    id v64 = objc_alloc((Class)NSError);
    id v26 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v101 = NSLocalizedDescriptionKey;
    uint64_t v65 = +[NSString stringWithUTF8String:"Invalid State"];
    id v102 = v65;
    __int16 v66 = +[NSDictionary dictionaryWithObjects:&v102 forKeys:&v101 count:1];
    id v67 = [v64 initWithDomain:v26 code:12 userInfo:v66];
    (*((void (**)(id, void, void, id))v11 + 2))(v11, 0, 0, v67);
  }
LABEL_43:
}

- (void)queueCardFieldDetectSession:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, uint64_t))a4;
  id v9 = +[NSXPCConnection currentConnection];
  int v83 = -1;
  uint64_t v10 = sub_1001DAE10(self, v9, 0, &v83);
  if (v10)
  {
    id v11 = (void *)v10;
    v8[2](v8, 0, v10);
    goto LABEL_43;
  }
  id v12 = [(_NFHardwareManager *)self driverWrapper];
  if (!v12 || (char v13 = v12[218], v12, (v13 & 1) == 0))
  {
    id v14 = objc_alloc((Class)NSError);
    id v11 = +[NSString stringWithUTF8String:"nfcd"];
    v100[0] = NSLocalizedDescriptionKey;
    id v15 = +[NSString stringWithUTF8String:"Feature Not Supported"];
    v101[0] = v15;
    v101[1] = &off_10031BE80;
    v100[1] = @"Line";
    v100[2] = @"Method";
    id v16 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v101[2] = v16;
    v100[3] = NSDebugDescriptionErrorKey;
    id v17 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 6058];
    v101[3] = v17;
    uint64_t v18 = +[NSDictionary dictionaryWithObjects:v101 forKeys:v100 count:4];
    id v19 = [v14 initWithDomain:v11 code:14 userInfo:v18];
    v8[2](v8, 0, (uint64_t)v19);

LABEL_31:
    goto LABEL_43;
  }
  if ((id)[(_NFHardwareManager *)self nfcRadioEnabled:0 showUIPopup:1] != (id)1)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      unsigned int v38 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v42 = 45;
      if (isMetaClass) {
        uint64_t v42 = 43;
      }
      v38(3, "%c[%{public}s %{public}s]:%i NFC radio is disabled", v42, ClassName, Name, 6063);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v43 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      uint64_t v44 = object_getClass(self);
      if (class_isMetaClass(v44)) {
        int v45 = 43;
      }
      else {
        int v45 = 45;
      }
      int v46 = object_getClassName(self);
      int v47 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v85 = v45;
      __int16 v86 = 2082;
      __int16 v87 = v46;
      __int16 v88 = 2082;
      NSErrorUserInfoKey v89 = v47;
      __int16 v90 = 1024;
      int v91 = 6063;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NFC radio is disabled", buf, 0x22u);
    }

    id v48 = objc_alloc((Class)NSError);
    id v11 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v98 = NSLocalizedDescriptionKey;
    id v15 = +[NSString stringWithUTF8String:"NFC radio disabled"];
    __int16 v99 = v15;
    id v49 = +[NSDictionary dictionaryWithObjects:&v99 forKeys:&v98 count:1];
    id v50 = [v48 initWithDomain:v11 code:50 userInfo:v49];
    v8[2](v8, 0, (uint64_t)v50);

    goto LABEL_31;
  }
  id v20 = [v9 NF_userInfo];
  id v11 = [v20 objectForKeyedSubscript:@"serviceType"];

  if (v11
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [v11 unsignedIntegerValue] == (id)2)
  {
    int v21 = [v9 NF_userInfo];
    id v22 = [v21 objectForKeyedSubscript:@"ServiceWhitelist"];
    int v23 = +[_NFCardSession validateEntitlements:v22];

    if (v23)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v24 = NFLogGetLogger();
      if (v24)
      {
        int v25 = (void (*)(uint64_t, const char *, ...))v24;
        id v26 = object_getClass(self);
        BOOL v71 = class_isMetaClass(v26);
        __int16 v72 = object_getClassName(self);
        __int16 v70 = sel_getName(a2);
        uint64_t v27 = [v9 NF_userInfo];
        int v28 = [v27 objectForKeyedSubscript:@"ClientName"];
        id v69 = [v9 processIdentifier];
        uint64_t v29 = 45;
        if (v71) {
          uint64_t v29 = 43;
        }
        v25(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %{public}d)", v29, v72, v70, 6079, v28, v69);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v30 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = object_getClass(self);
        if (class_isMetaClass(v31)) {
          int v32 = 43;
        }
        else {
          int v32 = 45;
        }
        BOOL v73 = object_getClassName(self);
        unsigned int v33 = sel_getName(a2);
        int v34 = [v9 NF_userInfo];
        id v35 = [v34 objectForKeyedSubscript:@"ClientName"];
        unsigned int v36 = [v9 processIdentifier];
        *(_DWORD *)buf = 67110402;
        int v85 = v32;
        __int16 v86 = 2082;
        __int16 v87 = v73;
        __int16 v88 = 2082;
        NSErrorUserInfoKey v89 = v33;
        __int16 v90 = 1024;
        int v91 = 6079;
        __int16 v92 = 2114;
        __int16 v93 = v35;
        __int16 v94 = 1026;
        unsigned int v95 = v36;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %{public}d)", buf, 0x32u);
      }
      v8[2](v8, 0, (uint64_t)v23);
    }
    else
    {
      unsigned int v65 = [v9 processIdentifier];
      if (v9) {
        [v9 auditToken];
      }
      else {
        memset(v82, 0, sizeof(v82));
      }
      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472;
      v74[2] = sub_10011AE54;
      v74[3] = &unk_100304880;
      int v78 = v8;
      SEL v79 = a2;
      v74[4] = self;
      id v75 = v7;
      __int16 v76 = v9;
      int v80 = v83;
      id v77 = v11;
      unsigned int v81 = v65;
      +[_NFCardSession isEligibleWithUserPrompt:1 auditToken:v82 completion:v74];

      int v23 = v78;
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v51 = NFLogGetLogger();
    if (v51)
    {
      id v52 = (void (*)(uint64_t, const char *, ...))v51;
      uint64_t v53 = object_getClass(self);
      BOOL v54 = class_isMetaClass(v53);
      __int16 v66 = object_getClassName(self);
      __int16 v68 = sel_getName(a2);
      uint64_t v55 = 45;
      if (v54) {
        uint64_t v55 = 43;
      }
      v52(4, "%c[%{public}s %{public}s]:%i Invalid service type: %{public}@", v55, v66, v68, 6070, v11);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v56 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      int v57 = object_getClass(self);
      if (class_isMetaClass(v57)) {
        int v58 = 43;
      }
      else {
        int v58 = 45;
      }
      id v59 = object_getClassName(self);
      __int16 v60 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v85 = v58;
      __int16 v86 = 2082;
      __int16 v87 = v59;
      __int16 v88 = 2082;
      NSErrorUserInfoKey v89 = v60;
      __int16 v90 = 1024;
      int v91 = 6070;
      __int16 v92 = 2114;
      __int16 v93 = v11;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid service type: %{public}@", buf, 0x2Cu);
    }

    id v61 = objc_alloc((Class)NSError);
    int v23 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v96 = NSLocalizedDescriptionKey;
    __int16 v62 = +[NSString stringWithUTF8String:"Invalid State"];
    __int16 v97 = v62;
    unsigned int v63 = +[NSDictionary dictionaryWithObjects:&v97 forKeys:&v96 count:1];
    id v64 = [v61 initWithDomain:v23 code:12 userInfo:v63];
    v8[2](v8, 0, (uint64_t)v64);
  }
LABEL_43:
}

- (void)isCardSessionEligibleWithCompletion:(id)a3
{
  id v5 = (void (**)(id, uint64_t, void *))a3;
  id v6 = +[NSXPCConnection currentConnection];
  id v7 = [v6 NF_userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"serviceType"];

  if (v8
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [v8 unsignedIntegerValue] == (id)2)
  {
    id v9 = [v6 NF_userInfo];
    uint64_t v10 = [v9 objectForKeyedSubscript:@"ServiceWhitelist"];
    id v11 = +[_NFCardSession validateEntitlements:v10];

    if (v11)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        char v13 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        id v16 = [v6 NF_userInfo];
        id v17 = [v16 objectForKeyedSubscript:@"ClientName"];
        id v40 = [v6 processIdentifier];
        uint64_t v18 = 45;
        if (isMetaClass) {
          uint64_t v18 = 43;
        }
        v13(3, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %{public}d)", v18, ClassName, Name, 6136, v17, v40);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v19 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = object_getClass(self);
        if (class_isMetaClass(v20)) {
          int v21 = 43;
        }
        else {
          int v21 = 45;
        }
        id v22 = object_getClassName(self);
        int v23 = sel_getName(a2);
        uint64_t v24 = [v6 NF_userInfo];
        int v25 = [v24 objectForKeyedSubscript:@"ClientName"];
        *(_DWORD *)buf = 67110402;
        int v48 = v21;
        __int16 v49 = 2082;
        id v50 = v22;
        __int16 v51 = 2082;
        id v52 = v23;
        __int16 v53 = 1024;
        int v54 = 6136;
        __int16 v55 = 2114;
        BOOL v56 = v25;
        __int16 v57 = 1026;
        unsigned int v58 = [v6 processIdentifier];
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session not allowed from %{public}@ (pid %{public}d)", buf, 0x32u);
      }
      v5[2](v5, 3, v11);
    }
    else
    {
      if (v6) {
        [v6 auditToken];
      }
      else {
        memset(v46, 0, sizeof(v46));
      }
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_10011BB3C;
      v43[3] = &unk_1003048A8;
      v43[4] = self;
      SEL v45 = a2;
      uint64_t v44 = v5;
      +[_NFCardSession isEligibleWithUserPrompt:0 auditToken:v46 completion:v43];

      id v11 = 0;
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v26 = NFLogGetLogger();
    if (v26)
    {
      uint64_t v27 = (void (*)(uint64_t, const char *, ...))v26;
      int v28 = object_getClass(self);
      BOOL v29 = class_isMetaClass(v28);
      unsigned int v38 = object_getClassName(self);
      int v39 = sel_getName(a2);
      uint64_t v30 = 45;
      if (v29) {
        uint64_t v30 = 43;
      }
      v27(4, "%c[%{public}s %{public}s]:%i Invalid service type: %{public}@", v30, v38, v39, 6127, v8);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v31 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      int v32 = object_getClass(self);
      if (class_isMetaClass(v32)) {
        int v33 = 43;
      }
      else {
        int v33 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v48 = v33;
      __int16 v49 = 2082;
      id v50 = object_getClassName(self);
      __int16 v51 = 2082;
      id v52 = sel_getName(a2);
      __int16 v53 = 1024;
      int v54 = 6127;
      __int16 v55 = 2114;
      BOOL v56 = v8;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid service type: %{public}@", buf, 0x2Cu);
    }

    id v34 = objc_alloc((Class)NSError);
    id v11 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v59 = NSLocalizedDescriptionKey;
    id v35 = +[NSString stringWithUTF8String:"Invalid State"];
    __int16 v60 = v35;
    unsigned int v36 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
    id v37 = [v34 initWithDomain:v11 code:12 userInfo:v36];
    v5[2](v5, 3, v37);
  }
}

- (void)preWarmWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[NSXPCConnection currentConnection];
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011BDB4;
  block[3] = &unk_100304588;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(workQueue, block);
}

- (void)updateBackgroundTagReading:(unsigned int)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = +[NSXPCConnection currentConnection];
  workQueue = self->_workQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10011C5EC;
  v11[3] = &unk_1003048D0;
  unsigned int v14 = a3;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(workQueue, v11);
}

- (void)actOnUserInitiatedSystemShutDown:(unsigned int)a3 completion:(id)a4
{
  id v6 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011CC04;
  block[3] = &unk_100304538;
  unsigned int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(workQueue, block);
}

- (void)handleRestartDiscovery
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i handleRestartDiscovery", v9, ClassName, Name, 6349);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = object_getClass(self);
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
    int v23 = 6349;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i handleRestartDiscovery", buf, 0x22u);
  }

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011D6FC;
  block[3] = &unk_100301C40;
  void block[4] = self;
  void block[5] = a2;
  dispatch_async(workQueue, block);
}

- (void)handleHardwareReset:(const char *)a3
{
  workQueue = self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10011D9F8;
  v4[3] = &unk_100301C40;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(workQueue, v4);
}

- (void)handleStackLoad
{
  uint64_t v4 = NFGetProductType();
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(6, "%c[%{public}s %{public}s]:%i ptype = %d", v9, ClassName, Name, 6373, v4);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v71 = v12;
    __int16 v72 = 2082;
    BOOL v73 = object_getClassName(self);
    __int16 v74 = 2082;
    id v75 = sel_getName(a2);
    __int16 v76 = 1024;
    int v77 = 6373;
    __int16 v78 = 1024;
    int v79 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ptype = %d", buf, 0x28u);
  }

  driverWrapper = self->_driverWrapper;
  id v69 = 0;
  char v14 = sub_100212C64(driverWrapper, &v69);
  id v15 = v69;
  id v16 = v15;
  if (v14)
  {
    int v17 = (NFHardwareControllerInfo *)v15;
    p_super = &self->_controllerInfo->super;
    self->_controllerInfo = v17;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v19 = NFLogGetLogger();
    if (v19)
    {
      __int16 v20 = (void (*)(uint64_t, const char *, ...))v19;
      int v21 = object_getClass(self);
      BOOL v22 = class_isMetaClass(v21);
      int v23 = object_getClassName(self);
      unsigned int v65 = sel_getName(a2);
      uint64_t v24 = 45;
      if (v22) {
        uint64_t v24 = 43;
      }
      v20(3, "%c[%{public}s %{public}s]:%i Failed to get controller info", v24, v23, v65, 6376);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    p_super = NFSharedLogGetLogger();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      int v25 = object_getClass(self);
      if (class_isMetaClass(v25)) {
        int v26 = 43;
      }
      else {
        int v26 = 45;
      }
      uint64_t v27 = object_getClassName(self);
      int v28 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v71 = v26;
      __int16 v72 = 2082;
      BOOL v73 = v27;
      __int16 v74 = 2082;
      id v75 = v28;
      __int16 v76 = 1024;
      int v77 = 6376;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get controller info", buf, 0x22u);
    }
  }

  if ([(NFHardwareControllerInfo *)self->_controllerInfo hasAntenna])
  {
    uint64_t v29 = sub_1001ABC30((uint64_t)NFPowerTrackingConsumer, [(NFHardwareControllerInfo *)self->_controllerInfo siliconName]);
    uint64_t v30 = (void *)v29;
    if (v29) {
      *(unsigned char *)(v29 + 16) = 1;
    }
    uint64_t v31 = sub_1001AED74();
    sub_1001AED00((uint64_t)v31, v30);

    int v32 = self->_driverWrapper;
    int v33 = sub_1001AED74();
    sub_1002193BC((uint64_t)v32, v33);
  }
  if (self->_secureElementWrapper)
  {
    id v34 = +[NFRoutingConfig embeddedWiredMode];
    id v35 = [(_NFHardwareManager *)self setRoutingConfig:v34];

    if (v35)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v36 = NFLogGetLogger();
      if (v36)
      {
        id v37 = (void (*)(uint64_t, const char *, ...))v36;
        unsigned int v38 = object_getClass(self);
        BOOL v39 = class_isMetaClass(v38);
        id v40 = object_getClassName(self);
        __int16 v66 = sel_getName(a2);
        uint64_t v41 = 45;
        if (v39) {
          uint64_t v41 = 43;
        }
        v37(3, "%c[%{public}s %{public}s]:%i Failed to set routing mode", v41, v40, v66, 6392);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v42 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        uint64_t v43 = object_getClass(self);
        if (class_isMetaClass(v43)) {
          int v44 = 43;
        }
        else {
          int v44 = 45;
        }
        SEL v45 = object_getClassName(self);
        int v46 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v71 = v44;
        __int16 v72 = 2082;
        BOOL v73 = v45;
        __int16 v74 = 2082;
        id v75 = v46;
        __int16 v76 = 1024;
        int v77 = 6392;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set routing mode", buf, 0x22u);
      }
    }
    else
    {
      [(_NFHardwareManager *)self refreshSecureElementInfo];
      uint64_t v42 = +[NFRoutingConfig routingOff];
      id v47 = [(_NFHardwareManager *)self setRoutingConfig:v42];
    }
  }
  [(_NFControllerManager *)self->_controllerManager initSETransactionsStates];
  int v48 = self->_driverWrapper;
  if (v48 && v48->_hwState == 1) {
    sub_100040040(self->_expressModeManager);
  }
  if (self->_prefObserver)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v49 = NFLogGetLogger();
    if (v49)
    {
      id v50 = (void (*)(uint64_t, const char *, ...))v49;
      __int16 v51 = object_getClass(self);
      BOOL v52 = class_isMetaClass(v51);
      __int16 v53 = object_getClassName(self);
      id v67 = sel_getName(a2);
      uint64_t v54 = 45;
      if (v52) {
        uint64_t v54 = 43;
      }
      v50(3, "%c[%{public}s %{public}s]:%i Error ! prefs observer still present", v54, v53, v67, 6406);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v55 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      BOOL v56 = object_getClass(self);
      if (class_isMetaClass(v56)) {
        int v57 = 43;
      }
      else {
        int v57 = 45;
      }
      unsigned int v58 = object_getClassName(self);
      NSErrorUserInfoKey v59 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v71 = v57;
      __int16 v72 = 2082;
      BOOL v73 = v58;
      __int16 v74 = 2082;
      id v75 = v59;
      __int16 v76 = 1024;
      int v77 = 6406;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error ! prefs observer still present", buf, 0x22u);
    }

    [(NFPreferenceObserver *)self->_prefObserver stop];
  }
  __int16 v60 = (NFPreferenceObserver *)objc_opt_new();
  prefObserver = self->_prefObserver;
  self->_prefObserver = v60;

  __int16 v62 = self->_prefObserver;
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_10011E0F4;
  v68[3] = &unk_100301C68;
  v68[4] = self;
  [(NFPreferenceObserver *)v62 start:v68];
}

- (void)handleHWRecoveryStarted
{
}

- (void)handleHWRecoveryCompletion:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = -[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self);
    sub_1000EC9F8((id *)&self->super.isa, v4);
  }
}

- (void)handleStackUnload
{
  sub_100040BCC(&self->_expressModeManager->super.isa);
  sub_100043854((uint64_t)self->_expressModeManager);
  [(NFPreferenceObserver *)self->_prefObserver stop];
  prefObserver = self->_prefObserver;
  self->_prefObserver = 0;

  id v4 = sub_100207BA8(self);
}

- (void)handleExpressModeStarted
{
  sub_10000292C(self);
  id v4 = objc_opt_new();
  [(NFSecureElementWrapper *)self->_secureElementWrapper setActiveApplet:v4];

  id v5 = +[NFPowerAssertion sharedPowerAssertion];
  [v5 holdPowerAssertion:@"ExpressMode"];

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
    v7(6, "%c[%{public}s %{public}s]:%i NFC emulation mode activated: nfcd", v11, ClassName, Name, 6447);
  }
  int v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)__int16 v76 = v14;
    *(_WORD *)&void v76[4] = 2082;
    *(void *)&v76[6] = object_getClassName(self);
    *(_WORD *)&v76[14] = 2082;
    *(void *)&v76[16] = sel_getName(a2);
    __int16 v77 = 1024;
    int v78 = 6447;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NFC emulation mode activated: nfcd", buf, 0x22u);
  }

  id v15 = [(_NFHardwareManager *)self lastKnownRoutingConfig];
  unsigned __int8 v16 = [v15 wantsExpress];

  if (v16)
  {
    kdebug_trace();
    int v17 = NFSharedSignpostLog();
    if (os_signpost_enabled(v17))
    {
      __int16 v18 = sub_10003EF24((__CFString *)self->_expressModeManager);
      *(_DWORD *)buf = 138412290;
      *(void *)__int16 v76 = v18;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_ENTERED", "Express type %@", buf, 0xCu);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v19 = NFLogGetLogger();
    if (v19)
    {
      __int16 v20 = (void (*)(uint64_t, const char *, ...))v19;
      int v21 = object_getClass(self);
      BOOL v22 = class_isMetaClass(v21);
      int v23 = object_getClassName(self);
      __int16 v66 = sel_getName(a2);
      uint64_t v24 = 45;
      if (v22) {
        uint64_t v24 = 43;
      }
      v20(6, "%c[%{public}s %{public}s]:%i express mode started", v24, v23, v66, 6460);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v25 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = object_getClass(self);
      if (class_isMetaClass(v26)) {
        int v27 = 43;
      }
      else {
        int v27 = 45;
      }
      int v28 = object_getClassName(self);
      uint64_t v29 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)__int16 v76 = v27;
      *(_WORD *)&void v76[4] = 2082;
      *(void *)&v76[6] = v28;
      *(_WORD *)&v76[14] = 2082;
      *(void *)&v76[16] = v29;
      __int16 v77 = 1024;
      int v78 = 6460;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i express mode started", buf, 0x22u);
    }

    if (objc_opt_respondsToSelector())
    {
      self->_inSessionExpressSessionID = [(_NFSession *)self->_currentSecureElementSession sessionID];
      [(_NFSession *)self->_currentSecureElementSession handleExpressModeStarted];
      if (![(_NFSession *)self->_currentSecureElementSession isMemberOfClass:objc_opt_class()])return; {
      uint64_t v30 = sub_10003EF24((__CFString *)self->_expressModeManager);
      }
      sub_1000FA94C(self, (uint64_t)"com.apple.stockholm.express.enter", v30);
    }
    else
    {
      self->_inSessionExpressSessionID = -1;
      uint64_t v42 = sub_10003EF24((__CFString *)self->_expressModeManager);
      sub_1000FA94C(self, (uint64_t)"com.apple.stockholm.express.enter", v42);

      uint64_t v43 = NFSharedSignpostLog();
      if (os_signpost_enabled(v43))
      {
        int v44 = sub_10003EF24((__CFString *)self->_expressModeManager);
        *(_DWORD *)buf = 136315394;
        *(void *)__int16 v76 = "com.apple.stockholm.express.enter";
        *(_WORD *)&v76[8] = 2112;
        *(void *)&v76[10] = v44;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_MODE_ENTERED_NOTIFICATION", "%s, type: %@", buf, 0x16u);
      }
      uint64_t v30 = objc_opt_new();
      SEL v45 = sub_1002125C8((uint64_t)self->_driverWrapper);
      if ([v45 notificationType] == (id)3)
      {
        id v46 = v45;
        uint64_t v47 = [v46 tciArray];
        if (v47)
        {
          int v48 = (void *)v47;
          uint64_t v49 = [v46 tciArray];
          id v50 = [v49 count];

          if (v50)
          {
            long long v70 = 0u;
            long long v71 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            __int16 v51 = [v46 tciArray];
            id v52 = [v51 countByEnumeratingWithState:&v68 objects:v74 count:16];
            if (v52)
            {
              id v53 = v52;
              uint64_t v54 = *(void *)v69;
              do
              {
                for (i = 0; i != v53; i = (char *)i + 1)
                {
                  if (*(void *)v69 != v54) {
                    objc_enumerationMutation(v51);
                  }
                  BOOL v56 = *(void **)(*((void *)&v68 + 1) + 8 * i);
                  if ([v30 length]) {
                    [v30 appendString:@","];
                  }
                  int v57 = [v56 NF_asHexString];
                  [v30 appendString:v57];
                }
                id v53 = [v51 countByEnumeratingWithState:&v68 objects:v74 count:16];
              }
              while (v53);
            }

            sub_1000FA94C(self, (uint64_t)"com.apple.stockholm.express.field.ecp2.tci", v30);
            unsigned int v58 = NFSharedSignpostLog();
            if (os_signpost_enabled(v58))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v58, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_MOD_ECP2_FIELD_TCI_NOTIFICATION", "com.apple.stockholm.express.field.ecp2.tci", buf, 2u);
            }
          }
        }
      }
      id v59 = objc_alloc((Class)NSMutableDictionary);
      v72[0] = @"xpcEventName";
      v72[1] = @"Type";
      v73[0] = @"com.apple.stockholm.express.enterV2";
      __int16 v60 = sub_10003EF24((__CFString *)self->_expressModeManager);
      v73[1] = v60;
      id v61 = +[NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:2];
      id v62 = [v59 initWithDictionary:v61];

      if ([v30 length]) {
        [v62 setObject:v30 forKeyedSubscript:@"Ecp2TCI"];
      }
      unsigned int v63 = +[NFSecureXPCEventPublisherManager sharedManager];
      id v64 = [v63 wallet];
      [v64 sendDictionary:v62];
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v31 = NFLogGetLogger();
    if (v31)
    {
      int v32 = (void (*)(uint64_t, const char *, ...))v31;
      int v33 = object_getClass(self);
      BOOL v34 = class_isMetaClass(v33);
      id v35 = object_getClassName(self);
      id v67 = sel_getName(a2);
      uint64_t v36 = 45;
      if (v34) {
        uint64_t v36 = 43;
      }
      v32(4, "%c[%{public}s %{public}s]:%i Routing no longer in express mode; dropping signal", v36, v35, v67, 6450);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v37 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      unsigned int v38 = object_getClass(self);
      if (class_isMetaClass(v38)) {
        int v39 = 43;
      }
      else {
        int v39 = 45;
      }
      id v40 = object_getClassName(self);
      uint64_t v41 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)__int16 v76 = v39;
      *(_WORD *)&void v76[4] = 2082;
      *(void *)&v76[6] = v40;
      *(_WORD *)&v76[14] = 2082;
      *(void *)&v76[16] = v41;
      __int16 v77 = 1024;
      int v78 = 6450;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Routing no longer in express mode; dropping signal",
        buf,
        0x22u);
    }

    sub_100040C1C(self->_expressModeManager);
    uint64_t v30 = +[NFPowerAssertion sharedPowerAssertion];
    [v30 releasePowerAssertion:@"ExpressMode"];
  }
}

- (void)handleExpressModeExited
{
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i NFC emulation mode terminated: nfcd", v9, ClassName, Name, 6517);
  }
  id v10 = NFSharedLogGetLogger();
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
    int v60 = v12;
    __int16 v61 = 2082;
    id v62 = object_getClassName(self);
    __int16 v63 = 2082;
    id v64 = sel_getName(a2);
    __int16 v65 = 1024;
    int v66 = 6517;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NFC emulation mode terminated: nfcd", buf, 0x22u);
  }

  kdebug_trace();
  id v13 = NFSharedSignpostLog();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_EXITED", (const char *)&unk_100286819, buf, 2u);
  }

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v14 = NFLogGetLogger();
  if (v14)
  {
    id v15 = (void (*)(uint64_t, const char *, ...))v14;
    unsigned __int8 v16 = object_getClass(self);
    BOOL v17 = class_isMetaClass(v16);
    __int16 v18 = object_getClassName(self);
    BOOL v56 = sel_getName(a2);
    uint64_t v19 = 45;
    if (v17) {
      uint64_t v19 = 43;
    }
    v15(6, "%c[%{public}s %{public}s]:%i express mode exited", v19, v18, v56, 6522);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  __int16 v20 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = object_getClass(self);
    if (class_isMetaClass(v21)) {
      int v22 = 43;
    }
    else {
      int v22 = 45;
    }
    int v23 = object_getClassName(self);
    uint64_t v24 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v60 = v22;
    __int16 v61 = 2082;
    id v62 = v23;
    __int16 v63 = 2082;
    id v64 = v24;
    __int16 v65 = 1024;
    int v66 = 6522;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i express mode exited", buf, 0x22u);
  }

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    sub_1000FA94C(self, (uint64_t)"com.apple.stockholm.express.exit", 0);
    int v26 = NFSharedSignpostLog();
    if (!os_signpost_enabled(v26))
    {
LABEL_28:

      goto LABEL_40;
    }
    *(_WORD *)buf = 0;
LABEL_27:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_MODE_EXITED_NOTIFICATION", "com.apple.stockholm.express.exit", buf, 2u);
    goto LABEL_28;
  }
  int inSessionExpressSessionID = self->_inSessionExpressSessionID;
  if (inSessionExpressSessionID == [(_NFSession *)self->_currentSecureElementSession sessionID])
  {
    [(_NFSession *)self->_currentSecureElementSession handleExpressModeExited];
    if ([(_NFSession *)self->_currentSecureElementSession isMemberOfClass:objc_opt_class()])sub_1000FA94C(self, (uint64_t)"com.apple.stockholm.express.exit", 0); {
    goto LABEL_40;
    }
  }
  int v27 = self->_inSessionExpressSessionID;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v28 = NFLogGetLogger();
  uint64_t v29 = (void (*)(uint64_t, const char *, ...))v28;
  if (v27 == -1)
  {
    if (v28)
    {
      int v44 = object_getClass(self);
      BOOL v45 = class_isMetaClass(v44);
      id v46 = object_getClassName(self);
      uint64_t v47 = sel_getName(a2);
      uint64_t v48 = 45;
      if (v45) {
        uint64_t v48 = 43;
      }
      v29(6, "%c[%{public}s %{public}s]:%i in session but express started before (%d)", v48, v46, v47, 6536, self->_inSessionExpressSessionID);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v49 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      id v50 = object_getClass(self);
      if (class_isMetaClass(v50)) {
        int v51 = 43;
      }
      else {
        int v51 = 45;
      }
      id v52 = object_getClassName(self);
      id v53 = sel_getName(a2);
      int v54 = self->_inSessionExpressSessionID;
      *(_DWORD *)buf = 67110146;
      int v60 = v51;
      __int16 v61 = 2082;
      id v62 = v52;
      __int16 v63 = 2082;
      id v64 = v53;
      __int16 v65 = 1024;
      int v66 = 6536;
      __int16 v67 = 1024;
      int v68 = v54;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i in session but express started before (%d)", buf, 0x28u);
    }

    sub_1000FA94C(self, (uint64_t)"com.apple.stockholm.express.exit", 0);
    int v26 = NFSharedSignpostLog();
    if (!os_signpost_enabled(v26)) {
      goto LABEL_28;
    }
    *(_WORD *)buf = 0;
    goto LABEL_27;
  }
  if (v28)
  {
    uint64_t v30 = object_getClass(self);
    BOOL v31 = class_isMetaClass(v30);
    int v32 = object_getClassName(self);
    int v33 = sel_getName(a2);
    uint64_t v57 = self->_inSessionExpressSessionID;
    uint64_t v58 = [(_NFSession *)self->_currentSecureElementSession sessionID];
    uint64_t v34 = 45;
    if (v31) {
      uint64_t v34 = 43;
    }
    v29(5, "%c[%{public}s %{public}s]:%i in-session express but wrong session ID (%d vs %d) - dropping", v34, v32, v33, 6541, v57, v58);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v35 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v36 = object_getClass(self);
    if (class_isMetaClass(v36)) {
      int v37 = 43;
    }
    else {
      int v37 = 45;
    }
    unsigned int v38 = object_getClassName(self);
    int v39 = sel_getName(a2);
    int v40 = self->_inSessionExpressSessionID;
    unsigned int v41 = [(_NFSession *)self->_currentSecureElementSession sessionID];
    *(_DWORD *)buf = 67110402;
    int v60 = v37;
    __int16 v61 = 2082;
    id v62 = v38;
    __int16 v63 = 2082;
    id v64 = v39;
    __int16 v65 = 1024;
    int v66 = 6541;
    __int16 v67 = 1024;
    int v68 = v40;
    __int16 v69 = 1024;
    unsigned int v70 = v41;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i in-session express but wrong session ID (%d vs %d) - dropping", buf, 0x2Eu);
  }

LABEL_40:
  [(_NFHardwareManager *)self maybeStartNextSession];
  sub_10004EF9C((uint64_t)self->_expressModeManager, 2.0);
  uint64_t v42 = +[NFPowerAssertion sharedPowerAssertion];
  [v42 releasePowerAssertion:@"ExpressMode"];

  self->_int inSessionExpressSessionID = -1;
  if (self->_systemWillSleep)
  {
    uint64_t v43 = NFSharedSignpostLog();
    if (os_signpost_enabled(v43))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "handleExpressModeExited: allowing to sleep", (const char *)&unk_100286819, buf, 2u);
    }

    [(NFPowerObserver *)self->_powerObserver allowSleep];
  }
}

- (void)handleExpressModeTimeout
{
  kdebug_trace();
  id v4 = NFSharedSignpostLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_TIMEOUT", (const char *)&unk_100286819, buf, 2u);
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
    v6(6, "%c[%{public}s %{public}s]:%i Express mode timer fired", v10, ClassName, Name, 6575);
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
    uint64_t v14 = object_getClassName(self);
    id v15 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v48 = v13;
    __int16 v49 = 2082;
    id v50 = v14;
    __int16 v51 = 2082;
    id v52 = v15;
    __int16 v53 = 1024;
    int v54 = 6575;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Express mode timer fired", buf, 0x22u);
  }

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    sub_1000FA94C(self, (uint64_t)"com.apple.stockholm.express.transaction.timeout", 0);
    BOOL v17 = NFSharedSignpostLog();
    if (!os_signpost_enabled(v17))
    {
LABEL_19:

      return;
    }
    *(_WORD *)buf = 0;
LABEL_18:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_TRANSIT_TIMEOUT_NOTIFICATION", "com.apple.stockholm.express.transaction.timeout", buf, 2u);
    goto LABEL_19;
  }
  int inSessionExpressSessionID = self->_inSessionExpressSessionID;
  if (inSessionExpressSessionID == [(_NFSession *)self->_currentSecureElementSession sessionID])
  {
    [(_NFSession *)self->_currentSecureElementSession handleExpressModeTimeout];
    if ([(_NFSession *)self->_currentSecureElementSession isMemberOfClass:objc_opt_class()])sub_1000FA94C(self, (uint64_t)"com.apple.stockholm.express.transaction.timeout", 0); {
    return;
    }
  }
  int v18 = self->_inSessionExpressSessionID;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v19 = NFLogGetLogger();
  __int16 v20 = (void (*)(uint64_t, const char *, ...))v19;
  if (v18 == -1)
  {
    if (v19)
    {
      int v33 = object_getClass(self);
      BOOL v34 = class_isMetaClass(v33);
      id v35 = object_getClassName(self);
      uint64_t v36 = sel_getName(a2);
      uint64_t v37 = 45;
      if (v34) {
        uint64_t v37 = 43;
      }
      v20(6, "%c[%{public}s %{public}s]:%i in session but express started before (%d)", v37, v35, v36, 6589, self->_inSessionExpressSessionID);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    unsigned int v38 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = object_getClass(self);
      if (class_isMetaClass(v39)) {
        int v40 = 43;
      }
      else {
        int v40 = 45;
      }
      unsigned int v41 = object_getClassName(self);
      uint64_t v42 = sel_getName(a2);
      int v43 = self->_inSessionExpressSessionID;
      *(_DWORD *)buf = 67110146;
      int v48 = v40;
      __int16 v49 = 2082;
      id v50 = v41;
      __int16 v51 = 2082;
      id v52 = v42;
      __int16 v53 = 1024;
      int v54 = 6589;
      __int16 v55 = 1024;
      int v56 = v43;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i in session but express started before (%d)", buf, 0x28u);
    }

    sub_1000FA94C(self, (uint64_t)"com.apple.stockholm.express.transaction.timeout", 0);
    BOOL v17 = NFSharedSignpostLog();
    if (!os_signpost_enabled(v17)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    goto LABEL_18;
  }
  if (v19)
  {
    int v21 = object_getClass(self);
    BOOL v22 = class_isMetaClass(v21);
    int v23 = object_getClassName(self);
    uint64_t v24 = sel_getName(a2);
    uint64_t v45 = self->_inSessionExpressSessionID;
    uint64_t v46 = [(_NFSession *)self->_currentSecureElementSession sessionID];
    uint64_t v25 = 45;
    if (v22) {
      uint64_t v25 = 43;
    }
    v20(5, "%c[%{public}s %{public}s]:%i in-session express but wrong session ID (%d vs %d)", v25, v23, v24, 6594, v45, v46);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v26 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = object_getClass(self);
    if (class_isMetaClass(v27)) {
      int v28 = 43;
    }
    else {
      int v28 = 45;
    }
    uint64_t v29 = object_getClassName(self);
    uint64_t v30 = sel_getName(a2);
    int v31 = self->_inSessionExpressSessionID;
    unsigned int v32 = [(_NFSession *)self->_currentSecureElementSession sessionID];
    *(_DWORD *)buf = 67110402;
    int v48 = v28;
    __int16 v49 = 2082;
    id v50 = v29;
    __int16 v51 = 2082;
    id v52 = v30;
    __int16 v53 = 1024;
    int v54 = 6594;
    __int16 v55 = 1024;
    int v56 = v31;
    __int16 v57 = 1024;
    unsigned int v58 = v32;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i in-session express but wrong session ID (%d vs %d)", buf, 0x2Eu);
  }
}

- (void)handleAppletInactivityTimeout:(id)a3 atlData:(id)a4 caData:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    int v13 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v16 = 45;
    if (isMetaClass) {
      uint64_t v16 = 43;
    }
    v13(6, "%c[%{public}s %{public}s]:%i Applet Inactivity Timeout : %{public}@", v16, ClassName, Name, 6605, v9);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  BOOL v17 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = object_getClass(self);
    if (class_isMetaClass(v18)) {
      int v19 = 43;
    }
    else {
      int v19 = 45;
    }
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)__int16 v65 = v19;
    *(_WORD *)&void v65[4] = 2082;
    *(void *)&v65[6] = object_getClassName(self);
    *(_WORD *)&v65[14] = 2082;
    *(void *)&v65[16] = sel_getName(a2);
    __int16 v66 = 1024;
    int v67 = 6605;
    __int16 v68 = 2114;
    v69[0] = v9;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Applet Inactivity Timeout : %{public}@", buf, 0x2Cu);
  }

  if (v9)
  {
    __int16 v20 = [v9 objectForKeyedSubscript:@"applet"];
  }
  else
  {
    __int16 v20 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    int v26 = [v20 identifier];
    sub_1000FA94C(self, (uint64_t)"com.apple.stockholm.express.transaction.timeout", v26);

    int v27 = NFSharedSignpostLog();
    if (!os_signpost_enabled(v27))
    {
LABEL_22:

      goto LABEL_23;
    }
LABEL_21:
    int v28 = [v20 identifier];
    *(_DWORD *)buf = 136315394;
    *(void *)__int16 v65 = "com.apple.stockholm.express.transaction.timeout";
    *(_WORD *)&v65[8] = 2112;
    *(void *)&v65[10] = v28;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_APPLET_INACTIVITY_TIMEOUT_NOTIFICATION", "%s, aid: %@", buf, 0x16u);

    goto LABEL_22;
  }
  expressModeManager = self->_expressModeManager;
  if (!expressModeManager
    || !expressModeManager->_expressModeInProgress
    || (int inSessionExpressSessionID = self->_inSessionExpressSessionID,
        inSessionExpressSessionID == [(_NFSession *)self->_currentSecureElementSession sessionID]))
  {
    currentSecureElementSession = self->_currentSecureElementSession;
    uint64_t v24 = [v9 objectForKeyedSubscript:@"result"];
    [(_NFSession *)currentSecureElementSession handleAppletInactivityTimeout:v24];

    if ([(_NFSession *)self->_currentSecureElementSession isMemberOfClass:objc_opt_class()])
    {
      uint64_t v25 = [v20 identifier];
      sub_1000FA94C(self, (uint64_t)"com.apple.stockholm.express.transaction.timeout", v25);

      sub_1000B6368((uint64_t)NFUnifiedAccessTransactionCALogger, v10);
      if (!v11) {
        goto LABEL_42;
      }
      goto LABEL_24;
    }
LABEL_23:
    if (!v11) {
      goto LABEL_42;
    }
    goto LABEL_24;
  }
  int v33 = self->_inSessionExpressSessionID;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v34 = NFLogGetLogger();
  id v35 = (void (*)(uint64_t, const char *, ...))v34;
  if (v33 == -1)
  {
    if (v34)
    {
      uint64_t v46 = object_getClass(self);
      BOOL v47 = class_isMetaClass(v46);
      int v48 = object_getClassName(self);
      __int16 v49 = sel_getName(a2);
      uint64_t v50 = 45;
      if (v47) {
        uint64_t v50 = 43;
      }
      v35(6, "%c[%{public}s %{public}s]:%i in session but express started before (sessionID:%d)", v50, v48, v49, 6627, self->_inSessionExpressSessionID);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v51 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      id v52 = object_getClass(self);
      if (class_isMetaClass(v52)) {
        int v53 = 43;
      }
      else {
        int v53 = 45;
      }
      int v54 = object_getClassName(self);
      __int16 v55 = sel_getName(a2);
      int v56 = self->_inSessionExpressSessionID;
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)__int16 v65 = v53;
      *(_WORD *)&void v65[4] = 2082;
      *(void *)&v65[6] = v54;
      *(_WORD *)&v65[14] = 2082;
      *(void *)&v65[16] = v55;
      __int16 v66 = 1024;
      int v67 = 6627;
      __int16 v68 = 1024;
      LODWORD(v69[0]) = v56;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i in session but express started before (sessionID:%d)", buf, 0x28u);
    }

    __int16 v57 = [v20 identifier];
    sub_1000FA94C(self, (uint64_t)"com.apple.stockholm.express.transaction.timeout", v57);

    int v27 = NFSharedSignpostLog();
    if (!os_signpost_enabled(v27)) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (v34)
  {
    uint64_t v36 = object_getClass(self);
    BOOL v62 = class_isMetaClass(v36);
    __int16 v63 = object_getClassName(self);
    uint64_t v37 = sel_getName(a2);
    uint64_t v60 = self->_inSessionExpressSessionID;
    uint64_t v61 = [(_NFSession *)self->_currentSecureElementSession sessionID];
    uint64_t v38 = 45;
    if (v62) {
      uint64_t v38 = 43;
    }
    v35(5, "%c[%{public}s %{public}s]:%i in-session express but wrong session ID (%d vs %d)", v38, v63, v37, 6633, v60, v61);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v39 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    int v40 = object_getClass(self);
    if (class_isMetaClass(v40)) {
      int v41 = 43;
    }
    else {
      int v41 = 45;
    }
    uint64_t v42 = object_getClassName(self);
    int v43 = sel_getName(a2);
    int v44 = self->_inSessionExpressSessionID;
    unsigned int v45 = [(_NFSession *)self->_currentSecureElementSession sessionID];
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)__int16 v65 = v41;
    *(_WORD *)&void v65[4] = 2082;
    *(void *)&v65[6] = v42;
    *(_WORD *)&v65[14] = 2082;
    *(void *)&v65[16] = v43;
    __int16 v66 = 1024;
    int v67 = 6633;
    __int16 v68 = 1024;
    LODWORD(v69[0]) = v44;
    WORD2(v69[0]) = 1024;
    *(_DWORD *)((char *)v69 + 6) = v45;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i in-session express but wrong session ID (%d vs %d)", buf, 0x2Eu);
  }

  if (v11)
  {
LABEL_24:
    uint64_t v29 = [(_NFHardwareManager *)self lastKnownRoutingConfig];
    id v30 = [v29 embeddedMode];

    if (v30 != (id)1)
    {
      int v31 = self->_expressModeManager;
      if (v31)
      {
        if (v31->_expressModeInProgress)
        {
          unsigned int v32 = [v20 identifier];
          LOBYTE(v31) = sub_100046A30((uint64_t)v31, v32);
        }
        else
        {
          LOBYTE(v31) = 0;
        }
      }
      sub_10023E848((uint64_t)NFHciTransactionEventCALogger, v11, v10, (char)v31, 1);
    }
  }
LABEL_42:
}

- (void)handleRequestService:(id)a3 inExpress:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v13 = 45;
    if (isMetaClass) {
      uint64_t v13 = 43;
    }
    v9(6, "%c[%{public}s %{public}s]:%i express=%d, %{public}@", v13, ClassName, Name, 6656, v4, v7);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    *(_DWORD *)buf = 67110402;
    int v37 = v16;
    __int16 v38 = 2082;
    int v39 = object_getClassName(self);
    __int16 v40 = 2082;
    int v41 = sel_getName(a2);
    __int16 v42 = 1024;
    int v43 = 6656;
    __int16 v44 = 1024;
    int v45 = v4;
    __int16 v46 = 2114;
    id v47 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i express=%d, %{public}@", buf, 0x32u);
  }

  if (objc_opt_respondsToSelector())
  {
    expressModeManager = self->_expressModeManager;
    if (expressModeManager)
    {
      if (expressModeManager->_expressModeInProgress)
      {
        int inSessionExpressSessionID = self->_inSessionExpressSessionID;
        if (inSessionExpressSessionID != [(_NFSession *)self->_currentSecureElementSession sessionID])
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v19 = NFLogGetLogger();
          if (v19)
          {
            __int16 v20 = (void (*)(uint64_t, const char *, ...))v19;
            int v21 = object_getClass(self);
            BOOL v22 = class_isMetaClass(v21);
            int v23 = object_getClassName(self);
            uint64_t v24 = sel_getName(a2);
            uint64_t v34 = self->_inSessionExpressSessionID;
            uint64_t v35 = [(_NFSession *)self->_currentSecureElementSession sessionID];
            uint64_t v25 = 45;
            if (v22) {
              uint64_t v25 = 43;
            }
            v20(5, "%c[%{public}s %{public}s]:%i in-session express but wrong session ID (%d vs %d)", v25, v23, v24, 6663, v34, v35);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          int v26 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            int v27 = object_getClass(self);
            if (class_isMetaClass(v27)) {
              int v28 = 43;
            }
            else {
              int v28 = 45;
            }
            uint64_t v29 = object_getClassName(self);
            id v30 = sel_getName(a2);
            int v31 = self->_inSessionExpressSessionID;
            unsigned int v32 = [(_NFSession *)self->_currentSecureElementSession sessionID];
            *(_DWORD *)buf = 67110402;
            int v37 = v28;
            __int16 v38 = 2082;
            int v39 = v29;
            __int16 v40 = 2082;
            int v41 = v30;
            __int16 v42 = 1024;
            int v43 = 6663;
            __int16 v44 = 1024;
            int v45 = v31;
            __int16 v46 = 1024;
            LODWORD(v47) = v32;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i in-session express but wrong session ID (%d vs %d)", buf, 0x2Eu);
          }

          if (v4) {
            goto LABEL_16;
          }
          goto LABEL_17;
        }
      }
    }
    [(_NFSession *)self->_currentSecureElementSession handleRequestService:v7];
  }
  if (v4) {
LABEL_16:
  }
    +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:&off_1003230A0];
LABEL_17:
}

- (void)handleForceExpressModeEndEvent
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i Switching to NFSecureElementRoutingModeNone", v9, ClassName, Name, 6680);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v42 = v12;
    __int16 v43 = 2082;
    __int16 v44 = object_getClassName(self);
    __int16 v45 = 2082;
    __int16 v46 = sel_getName(a2);
    __int16 v47 = 1024;
    int v48 = 6680;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Switching to NFSecureElementRoutingModeNone", buf, 0x22u);
  }

  uint64_t v13 = sub_10020EC8C(self->_driverWrapper, @"Force Express End Event", 1uLL);
  if (v13)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v14 = NFLogGetLogger();
    if (v14)
    {
      id v15 = (void (*)(uint64_t, const char *, ...))v14;
      int v16 = object_getClass(self);
      BOOL v17 = class_isMetaClass(v16);
      int v37 = object_getClassName(self);
      int v39 = sel_getName(a2);
      uint64_t v18 = 45;
      if (v17) {
        uint64_t v18 = 43;
      }
      v15(4, "%c[%{public}s %{public}s]:%i Failed to open session : %@", v18, v37, v39, 6683, v13);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v19 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = object_getClass(self);
      if (class_isMetaClass(v20)) {
        int v21 = 43;
      }
      else {
        int v21 = 45;
      }
      BOOL v22 = object_getClassName(self);
      int v23 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v42 = v21;
      __int16 v43 = 2082;
      __int16 v44 = v22;
      __int16 v45 = 2082;
      __int16 v46 = v23;
      __int16 v47 = 1024;
      int v48 = 6683;
      __int16 v49 = 2112;
      uint64_t v50 = v13;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open session : %@", buf, 0x2Cu);
    }
  }
  else
  {
    uint64_t v24 = +[NFRoutingConfig routingOff];
    uint64_t v25 = [(_NFHardwareManager *)self setRoutingConfig:v24];

    if (v25)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v26 = NFLogGetLogger();
      if (v26)
      {
        int v27 = (void (*)(uint64_t, const char *, ...))v26;
        int v28 = object_getClass(self);
        BOOL v29 = class_isMetaClass(v28);
        id v30 = object_getClassName(self);
        __int16 v40 = sel_getName(a2);
        uint64_t v31 = 45;
        if (v29) {
          uint64_t v31 = 43;
        }
        v27(4, "%c[%{public}s %{public}s]:%i Unable to switch to NFSecureElementRoutingModeNone", v31, v30, v40, 6688);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      unsigned int v32 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        int v33 = object_getClass(self);
        if (class_isMetaClass(v33)) {
          int v34 = 43;
        }
        else {
          int v34 = 45;
        }
        uint64_t v35 = object_getClassName(self);
        uint64_t v36 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v42 = v34;
        __int16 v43 = 2082;
        __int16 v44 = v35;
        __int16 v45 = 2082;
        __int16 v46 = v36;
        __int16 v47 = 1024;
        int v48 = 6688;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unable to switch to NFSecureElementRoutingModeNone", buf, 0x22u);
      }
    }
    sub_1002114AC(self->_driverWrapper, @"Force Express End Event");
  }
}

- (id)softResetSE:(id)a3
{
  id v5 = a3;
  uint64_t v42 = 0;
  __int16 v43 = &v42;
  uint64_t v44 = 0x3032000000;
  __int16 v45 = sub_10000B858;
  __int16 v46 = sub_1000F2378;
  id v47 = 0;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
  {
    Class = object_getClass(self);
    if (class_isMetaClass(Class)) {
      uint64_t v8 = 43;
    }
    else {
      uint64_t v8 = 45;
    }
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    Logger(6, "%c[%{public}s %{public}s]:%i Soft reset of SE :(", v8, ClassName, Name, 6713);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    uint64_t v14 = object_getClassName(self);
    id v15 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v49 = v13;
    __int16 v50 = 2082;
    __int16 v51 = v14;
    __int16 v52 = 2082;
    int v53 = v15;
    __int16 v54 = 1024;
    int v55 = 6713;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Soft reset of SE :(", buf, 0x22u);
  }

  if ([v5 isEqual:self->_secureElementWrapper])
  {
    int v16 = +[NFRoutingConfig embeddedWiredModeWithFD:0];
    uint64_t v35 = _NSConcreteStackBlock;
    uint64_t v36 = 3221225472;
    int v37 = sub_100120A8C;
    __int16 v38 = &unk_100304718;
    int v41 = &v42;
    int v39 = self;
    id v40 = v5;
    if ((sub_1000F23D8((void **)&self->super.isa, &v35, @"SoftResetSE", v16) & 1) == 0)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      BOOL v17 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v17)
      {
        uint64_t v18 = object_getClass(self);
        if (class_isMetaClass(v18)) {
          uint64_t v19 = 43;
        }
        else {
          uint64_t v19 = 45;
        }
        __int16 v20 = object_getClassName(self);
        int v21 = sel_getName(a2);
        v17(3, "%c[%{public}s %{public}s]:%i Failed to soft reset SE: %{public}@", v19, v20, v21, 6727, v43[5], v35, v36, v37, v38, v39);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      BOOL v22 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v23 = object_getClass(self);
        if (class_isMetaClass(v23)) {
          int v24 = 43;
        }
        else {
          int v24 = 45;
        }
        uint64_t v25 = object_getClassName(self);
        uint64_t v26 = sel_getName(a2);
        uint64_t v27 = v43[5];
        *(_DWORD *)buf = 67110146;
        int v49 = v24;
        __int16 v50 = 2082;
        __int16 v51 = v25;
        __int16 v52 = 2082;
        int v53 = v26;
        __int16 v54 = 1024;
        int v55 = 6727;
        __int16 v56 = 2114;
        uint64_t v57 = v27;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to soft reset SE: %{public}@", buf, 0x2Cu);
      }
    }
    id v28 = (id)v43[5];
  }
  else
  {
    id v29 = objc_alloc((Class)NSError);
    int v16 = +[NSString stringWithUTF8String:"nfcd"];
    v58[0] = NSLocalizedDescriptionKey;
    id v30 = +[NSString stringWithUTF8String:"SE not available"];
    v59[0] = v30;
    v59[1] = &off_10031BF10;
    v58[1] = @"Line";
    v58[2] = @"Method";
    id v31 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v59[2] = v31;
    v58[3] = NSDebugDescriptionErrorKey;
    id v32 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 6718];
    v59[3] = v32;
    int v33 = +[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:4];
    id v28 = [v29 initWithDomain:v16 code:35 userInfo:v33];
  }
  _Block_object_dispose(&v42, 8);

  return v28;
}

- (void)handleFilteredFieldNotification:(id)a3
{
  id v5 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100120E50;
  block[3] = &unk_100301C90;
  id v9 = v5;
  SEL v10 = a2;
  void block[4] = self;
  id v7 = v5;
  dispatch_async(workQueue, block);
}

- (void)handleFieldNotification:(id)a3
{
  id v5 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001216AC;
  block[3] = &unk_100301C90;
  id v9 = v5;
  SEL v10 = a2;
  void block[4] = self;
  id v7 = v5;
  dispatch_async(workQueue, block);
}

- (void)handleSecureElementEndOfOperation
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001223BC;
  block[3] = &unk_100301C68;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)handleSecureElementEnteredRestrictedMode:(int)a3 os:(int64_t)a4
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100122490;
  block[3] = &unk_100304970;
  int v6 = a3;
  void block[4] = self;
  void block[5] = a4;
  dispatch_async(workQueue, block);
}

- (void)handleSecureElementEnteredRestrictedModeExit:(int)a3 os:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  if (-[NFSecureElementWrapper isSecureElement:](self->_secureElementWrapper, "isSecureElement:"))
  {
    if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        id v9 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v12 = 45;
        if (isMetaClass) {
          uint64_t v12 = 43;
        }
        v9(6, "%c[%{public}s %{public}s]:%i Ignoring restricted mode for %ld", v12, ClassName, Name, 7020, a4);
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
        *(_DWORD *)buf = 67110146;
        int v31 = v15;
        __int16 v32 = 2082;
        int v33 = object_getClassName(self);
        __int16 v34 = 2082;
        uint64_t v35 = sel_getName(a2);
        __int16 v36 = 1024;
        int v37 = 7020;
        __int16 v38 = 2048;
        int64_t v39 = a4;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Ignoring restricted mode for %ld", buf, 0x2Cu);
      }
    }
    else
    {
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001227D8;
      block[3] = &unk_100304108;
      void block[4] = self;
      void block[5] = a2;
      void block[6] = a4;
      dispatch_async(workQueue, block);
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v16 = NFLogGetLogger();
    if (v16)
    {
      BOOL v17 = (void (*)(uint64_t, const char *, ...))v16;
      uint64_t v18 = object_getClass(self);
      BOOL v19 = class_isMetaClass(v18);
      uint64_t v26 = object_getClassName(self);
      id v28 = sel_getName(a2);
      uint64_t v20 = 45;
      if (v19) {
        uint64_t v20 = 43;
      }
      v17(6, "%c[%{public}s %{public}s]:%i Ignoring restricted mode for se ID %d", v20, v26, v28, 7015, v5);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v21 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v22 = object_getClass(self);
      if (class_isMetaClass(v22)) {
        int v23 = 43;
      }
      else {
        int v23 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v31 = v23;
      __int16 v32 = 2082;
      int v33 = object_getClassName(self);
      __int16 v34 = 2082;
      uint64_t v35 = sel_getName(a2);
      __int16 v36 = 1024;
      int v37 = 7015;
      __int16 v38 = 1024;
      LODWORD(v39) = v5;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Ignoring restricted mode for se ID %d", buf, 0x28u);
    }
  }
}

- (void)handleSelectEvent:(id)a3
{
  id v5 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100122AD8;
  block[3] = &unk_100301C90;
  id v9 = v5;
  SEL v10 = a2;
  void block[4] = self;
  id v7 = v5;
  dispatch_async(workQueue, block);
}

- (void)handleEraseCounterExceeded
{
  unsigned __int8 v3 = [(_NFHardwareManager *)self lastKnownRoutingConfig];
  if (!v3)
  {
    unsigned __int8 v3 = [(_NFHardwareManager *)self defaultRoutingConfig:3];
  }
  workQueue = self->_workQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100122D90;
  v6[3] = &unk_100301C68;
  v6[4] = self;
  id v5 = +[_NFBuiltinSession createSessionWithWorkQueue:workQueue routing:v3 sessionQueuer:self didStartWork:v6];
}

- (void)handleSecureElementReaderModeStarted:(id)a3
{
  id v5 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100122F08;
  block[3] = &unk_100301C90;
  id v9 = v5;
  SEL v10 = a2;
  void block[4] = self;
  id v7 = v5;
  dispatch_async(workQueue, block);
}

- (void)handleSecureElementReaderModeEnded:(id)a3
{
  id v5 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001231AC;
  block[3] = &unk_100301C90;
  id v9 = v5;
  SEL v10 = a2;
  void block[4] = self;
  id v7 = v5;
  dispatch_async(workQueue, block);
}

- (void)handleReaderModeProhibitTimerEvent:(unint64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    void block[5] = v3;
    void block[6] = v4;
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10012342C;
    block[3] = &unk_100301C68;
    void block[4] = self;
    dispatch_async(workQueue, block);
  }
}

- (void)handleEMVCOCollisionDetected
{
  workQueue = self->_workQueue;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001235A8;
  v3[3] = &unk_100301C40;
  v3[4] = self;
  v3[5] = a2;
  dispatch_async(workQueue, v3);
}

- (void)handleSecureElementTransactionData:(id)a3 appletIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  workQueue = self->_workQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001239A4;
  v12[3] = &unk_100301CE0;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  SEL v15 = a2;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(workQueue, v12);
}

- (void)handleTimerExpiredEvent:(id)a3
{
  id v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    [(_NFSession *)self->_currentSecureElementSession handleTimerExpiredEvent:v5];
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
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v7(4, "%c[%{public}s %{public}s]:%i Unexpected active session: %{public}@", v12, ClassName, Name, 7159, self->_currentSecureElementSession);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = object_getClass(self);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      uint64_t v16 = object_getClassName(self);
      BOOL v17 = sel_getName(a2);
      currentSecureElementSession = self->_currentSecureElementSession;
      *(_DWORD *)buf = 67110146;
      int v20 = v15;
      __int16 v21 = 2082;
      BOOL v22 = v16;
      __int16 v23 = 2082;
      int v24 = v17;
      __int16 v25 = 1024;
      int v26 = 7159;
      __int16 v27 = 2114;
      id v28 = currentSecureElementSession;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected active session: %{public}@", buf, 0x2Cu);
    }
  }
}

- (void)handleTransactionStartEvent:(id)a3 atlData:(id)a4 caData:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  expressModeManager = self->_expressModeManager;
  if (expressModeManager
    && expressModeManager->_expressModeInProgress
    && !expressModeManager->_didPerformExpressTransaction)
  {
    kdebug_trace();
    id v13 = NFSharedSignpostLog();
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_TX_START", (const char *)&unk_100286819, buf, 2u);
    }
  }
  id v14 = [v9 keyIdentifier];

  if (v14)
  {
    id v15 = objc_alloc((Class)NSString);
    uint64_t v16 = [v9 appletIdentifier];
    BOOL v17 = [v9 keyIdentifier];
    id v18 = [v15 initWithFormat:@"%@:%@", v16, v17];
  }
  else
  {
    id v18 = [v9 appletIdentifier];
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (!self->_currentSecureElementSession)
    {
LABEL_32:
      sub_100123D74(self, v9, v18);
      goto LABEL_33;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      __int16 v23 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v28 = 45;
      if (isMetaClass) {
        uint64_t v28 = 43;
      }
      v23(4, "%c[%{public}s %{public}s]:%i Unexpected active session: %{public}@", v28, ClassName, Name, 7218, self->_currentSecureElementSession);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v29 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
LABEL_31:

      goto LABEL_32;
    }
    id v30 = object_getClass(self);
    if (class_isMetaClass(v30)) {
      int v31 = 43;
    }
    else {
      int v31 = 45;
    }
    __int16 v32 = object_getClassName(self);
    int v33 = sel_getName(a2);
    currentSecureElementSession = self->_currentSecureElementSession;
    *(_DWORD *)buf = 67110146;
    int v78 = v31;
    __int16 v79 = 2082;
    int v80 = v32;
    __int16 v81 = 2082;
    uint64_t v82 = v33;
    __int16 v83 = 1024;
    int v84 = 7218;
    __int16 v85 = 2114;
    v86[0] = currentSecureElementSession;
    uint64_t v35 = "%c[%{public}s %{public}s]:%i Unexpected active session: %{public}@";
    __int16 v36 = v29;
    os_log_type_t v37 = OS_LOG_TYPE_ERROR;
    uint32_t v38 = 44;
LABEL_30:
    _os_log_impl((void *)&_mh_execute_header, v36, v37, v35, buf, v38);
    goto LABEL_31;
  }
  BOOL v19 = self->_expressModeManager;
  if (!v19
    || !v19->_expressModeInProgress
    || (int inSessionExpressSessionID = self->_inSessionExpressSessionID,
        inSessionExpressSessionID == [(_NFSession *)self->_currentSecureElementSession sessionID]))
  {
    [(_NFSession *)self->_currentSecureElementSession handleTransactionStartEvent:v9 atlData:v10];
    if ([(_NFSession *)self->_currentSecureElementSession isMemberOfClass:objc_opt_class()])
    {
      __int16 v21 = self->_expressModeManager;
      if (v21)
      {
        if (v21->_expressModeInProgress && !v21->_didPerformExpressTransaction)
        {
          sub_1000FA94C(self, (uint64_t)"com.apple.stockholm.express.transaction.start", v18);
          if (!v10) {
            goto LABEL_36;
          }
          goto LABEL_34;
        }
      }
    }
LABEL_33:
    if (!v10) {
      goto LABEL_36;
    }
    goto LABEL_34;
  }
  int v45 = self->_inSessionExpressSessionID;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v46 = NFLogGetLogger();
  id v47 = (void (*)(uint64_t, const char *, ...))v46;
  if (v45 == -1)
  {
    if (v46)
    {
      id v64 = object_getClass(self);
      BOOL v65 = class_isMetaClass(v64);
      __int16 v66 = object_getClassName(self);
      int v67 = sel_getName(a2);
      uint64_t v68 = 45;
      if (v65) {
        uint64_t v68 = 43;
      }
      v47(6, "%c[%{public}s %{public}s]:%i in session but express started before (%d)", v68, v66, v67, 7209, self->_inSessionExpressSessionID);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v29 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    __int16 v69 = object_getClass(self);
    if (class_isMetaClass(v69)) {
      int v70 = 43;
    }
    else {
      int v70 = 45;
    }
    long long v71 = object_getClassName(self);
    __int16 v72 = sel_getName(a2);
    int v73 = self->_inSessionExpressSessionID;
    *(_DWORD *)buf = 67110146;
    int v78 = v70;
    __int16 v79 = 2082;
    int v80 = v71;
    __int16 v81 = 2082;
    uint64_t v82 = v72;
    __int16 v83 = 1024;
    int v84 = 7209;
    __int16 v85 = 1024;
    LODWORD(v86[0]) = v73;
    uint64_t v35 = "%c[%{public}s %{public}s]:%i in session but express started before (%d)";
    __int16 v36 = v29;
    os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
    uint32_t v38 = 40;
    goto LABEL_30;
  }
  if (v46)
  {
    int v48 = object_getClass(self);
    BOOL v49 = class_isMetaClass(v48);
    __int16 v76 = object_getClassName(self);
    __int16 v50 = sel_getName(a2);
    uint64_t v74 = self->_inSessionExpressSessionID;
    uint64_t v75 = [(_NFSession *)self->_currentSecureElementSession sessionID];
    uint64_t v51 = 45;
    if (v49) {
      uint64_t v51 = 43;
    }
    v47(5, "%c[%{public}s %{public}s]:%i in-session express but wrong session ID (%d vs %d) - drop", v51, v76, v50, 7213, v74, v75);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  __int16 v52 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    int v53 = object_getClass(self);
    if (class_isMetaClass(v53)) {
      int v54 = 43;
    }
    else {
      int v54 = 45;
    }
    int v55 = object_getClassName(self);
    __int16 v56 = sel_getName(a2);
    int v57 = self->_inSessionExpressSessionID;
    unsigned int v58 = [(_NFSession *)self->_currentSecureElementSession sessionID];
    *(_DWORD *)buf = 67110402;
    int v78 = v54;
    __int16 v79 = 2082;
    int v80 = v55;
    __int16 v81 = 2082;
    uint64_t v82 = v56;
    __int16 v83 = 1024;
    int v84 = 7213;
    __int16 v85 = 1024;
    LODWORD(v86[0]) = v57;
    WORD2(v86[0]) = 1024;
    *(_DWORD *)((char *)v86 + 6) = v58;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i in-session express but wrong session ID (%d vs %d) - drop", buf, 0x2Eu);
  }

  if (v10)
  {
LABEL_34:
    int64_t v39 = [v10 objectForKey:@"RequiresPowerCycle"];
    unsigned int v40 = [v39 BOOLValue];

    if (v40) {
      self->_powerCycleAfterThisSession = 1;
    }
  }
LABEL_36:
  if (v11)
  {
    int v41 = [(_NFHardwareManager *)self lastKnownRoutingConfig];
    id v42 = [v41 embeddedMode];

    if (v42 != (id)1)
    {
      __int16 v43 = self->_expressModeManager;
      if (v43)
      {
        if (v43->_expressModeInProgress)
        {
          uint64_t v44 = [v9 appletIdentifier];
          LOBYTE(v43) = sub_100046A30((uint64_t)v43, v44);
        }
        else
        {
          LOBYTE(v43) = 0;
        }
      }
      id v59 = sub_1002125C8((uint64_t)self->_driverWrapper);
      uint64_t v60 = v59;
      if (v59 && [v59 notificationType] == (id)3)
      {
        id v61 = [v11 mutableCopy];
        id v62 = v60;
        __int16 v63 = [NSNumber numberWithUnsignedInt:][v62 terminalSubType] | (objc_msgSend(v62, "terminalType") << 8);
        [v61 setObject:v63 forKeyedSubscript:@"terminalType"];

        if (v10) {
          sub_10023E848((uint64_t)NFHciTransactionEventCALogger, v61, v10, (char)v43, 1);
        }
      }
      else if (v10)
      {
        sub_10023E848((uint64_t)NFHciTransactionEventCALogger, v11, v10, (char)v43, 1);
      }
    }
  }
}

- (void)handleTransactionEndEvent:(id)a3 atlData:(id)a4 caData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(_NFHardwareManager *)self lastKnownRoutingConfig];
  id v117 = [v11 embeddedMode];

  expressModeManager = self->_expressModeManager;
  if (expressModeManager
    && expressModeManager->_expressModeInProgress
    && !expressModeManager->_didPerformExpressTransaction)
  {
    kdebug_trace();
    id v13 = NFSharedSignpostLog();
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EXPRESS_TX_END", (const char *)&unk_100286819, buf, 2u);
    }
  }
  int v121 = v10;
  id v14 = [v9 objectForKeyedSubscript:@"appletIdentifier"];
  if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned int v15 = [(_NFControllerManager *)self->_controllerManager isUnifiedAccess:v14];
    int v16 = v15;
    __int16 v120 = 0;
    if (v9 && v15)
    {
      BOOL v17 = [v9 objectForKeyedSubscript:@"endPointIdentifier"];

      if (v17)
      {
        id v18 = [v9 objectForKeyedSubscript:@"endPointIdentifier"];
        unsigned int v19 = [v8 didError];
        CFStringRef v20 = @"noError";
        if (v19) {
          CFStringRef v20 = @"withError";
        }
        __int16 v120 = +[NSString stringWithFormat:@"%@/%@", v18, v20];
      }
      else
      {
        __int16 v120 = 0;
      }
      int v16 = 1;
    }
  }
  else
  {
    int v16 = 0;
    __int16 v120 = 0;
  }
  if ([v8 didError])
  {
    if ([v8 result] == 61444)
    {
      __int16 v21 = "com.apple.stockholm.express.transaction.end.incompatible";
    }
    else if ([v8 result] == 61446)
    {
      __int16 v21 = "com.apple.stockholm.express.transaction.end.keypairingmode";
    }
    else
    {
      unsigned int v22 = [v8 result];
      __int16 v21 = "com.apple.stockholm.express.transaction.end.failed";
      if (v22 == 61445) {
        __int16 v21 = "com.apple.stockholm.express.transaction.notfound";
      }
    }
  }
  else
  {
    __int16 v21 = "com.apple.stockholm.express.transaction.end";
  }
  __int16 v116 = (char *)v21;
  __int16 v23 = [v8 keyIdentifier];

  if (v23)
  {
    id v24 = objc_alloc((Class)NSString);
    __int16 v25 = [v8 appletIdentifier];
    int v26 = [v8 keyIdentifier];
    id v119 = [v24 initWithFormat:@"%@:%@", v25, v26];
  }
  else
  {
    id v119 = [v8 appletIdentifier];
  }
  uint64_t v27 = [v8 parsedInfo];
  if (v27)
  {
    uint64_t v28 = (void *)v27;
    id v29 = [v8 parsedInfo];
    id v30 = [v29 objectForKeyedSubscript:@"PairingModeBrandCode"];

    if (v30)
    {
      int v31 = [v8 parsedInfo];
      __int16 v32 = [v31 objectForKeyedSubscript:@"PairingModeBrandCode"];
      [0 setObject:v32 forKeyedSubscript:@"PairingModeBrandCode"];
    }
  }
  int v33 = +[NSMutableDictionary dictionaryWithDictionary:v9];
  id v34 = [objc_alloc((Class)NSData) initWithBytes:&unk_1002840BC length:9];
  uint64_t v35 = [v34 NF_asHexString];
  unsigned int v36 = [v14 hasPrefix:v35];

  if (v36)
  {
    os_log_type_t v37 = sub_100044350(&self->_expressModeManager->super.isa, v14);
    uint32_t v38 = +[NSNumber numberWithUnsignedInt:sub_1000B5C98((uint64_t)NFUnifiedAccessTransactionCALogger, v37, v9)];
    [v33 setObject:v38 forKeyedSubscript:@"keyType"];

    if ([v8 didError])
    {
      int64_t v39 = [v9 objectForKeyedSubscript:@"command"];
      unsigned int v40 = [v39 unsignedIntValue];

      if (v40 == 22)
      {
        int v41 = [v9 objectForKeyedSubscript:@"informative"];

        if (v41)
        {
          id v42 = [v9 objectForKeyedSubscript:@"command"];
          [0 setObject:v42 forKeyedSubscript:@"command"];

          __int16 v43 = [v9 objectForKeyedSubscript:@"informative"];
          [0 setObject:v43 forKeyedSubscript:@"informative"];
        }
      }
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (self->_currentSecureElementSession)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        BOOL v49 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v54 = 45;
        if (isMetaClass) {
          uint64_t v54 = 43;
        }
        v49(6, "%c[%{public}s %{public}s]:%i Unexpected active session: %{public}@", v54, ClassName, Name, 7447, self->_currentSecureElementSession);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v55 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v56 = object_getClass(self);
        if (class_isMetaClass(v56)) {
          int v57 = 43;
        }
        else {
          int v57 = 45;
        }
        unsigned int v58 = object_getClassName(self);
        id v59 = sel_getName(a2);
        currentSecureElementSession = self->_currentSecureElementSession;
        *(_DWORD *)buf = 67110146;
        int v123 = v57;
        __int16 v124 = 2082;
        unsigned int v125 = v58;
        __int16 v126 = 2082;
        uint64_t v127 = v59;
        __int16 v128 = 1024;
        int v129 = 7447;
        __int16 v130 = 2114;
        *(void *)NSErrorUserInfoKey v131 = currentSecureElementSession;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Unexpected active session: %{public}@", buf, 0x2Cu);
      }
    }
    if (self->_inSessionExpressSessionID != -1)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v61 = NFLogGetLogger();
      if (v61)
      {
        id v62 = (void (*)(uint64_t, const char *, ...))v61;
        __int16 v63 = object_getClass(self);
        BOOL v64 = class_isMetaClass(v63);
        BOOL v65 = object_getClassName(self);
        __int16 v66 = sel_getName(a2);
        uint64_t v67 = 45;
        if (v64) {
          uint64_t v67 = 43;
        }
        v62(6, "%c[%{public}s %{public}s]:%i in-session express (ID:%d) but session got closed", v67, v65, v66, 7452, self->_inSessionExpressSessionID);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v68 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_78;
      }
      __int16 v69 = object_getClass(self);
      if (class_isMetaClass(v69)) {
        int v70 = 43;
      }
      else {
        int v70 = 45;
      }
      long long v71 = object_getClassName(self);
      __int16 v72 = sel_getName(a2);
      int inSessionExpressSessionID = self->_inSessionExpressSessionID;
      *(_DWORD *)buf = 67110146;
      int v123 = v70;
      __int16 v124 = 2082;
      unsigned int v125 = v71;
      __int16 v126 = 2082;
      uint64_t v127 = v72;
      __int16 v128 = 1024;
      int v129 = 7452;
      __int16 v130 = 1024;
      *(_DWORD *)NSErrorUserInfoKey v131 = inSessionExpressSessionID;
      uint64_t v74 = "%c[%{public}s %{public}s]:%i in-session express (ID:%d) but session got closed";
      uint64_t v75 = v68;
      uint32_t v76 = 40;
      goto LABEL_77;
    }
LABEL_91:
    sub_100124868(self, v8, v33, v119, v116, v16, v120);
    goto LABEL_102;
  }
  uint64_t v44 = self->_expressModeManager;
  if (!v44
    || !v44->_expressModeInProgress
    || (int v45 = self->_inSessionExpressSessionID,
        v45 == [(_NFSession *)self->_currentSecureElementSession sessionID]))
  {
    if ([(_NFSession *)self->_currentSecureElementSession isMemberOfClass:objc_opt_class()])
    {
      uint64_t v46 = self->_expressModeManager;
      if (!v46 || !v46->_expressModeInProgress || v46->_didPerformExpressTransaction)
      {
        uint64_t v47 = 2;
        if (!v16) {
          goto LABEL_101;
        }
LABEL_93:
        if (v33)
        {
          id v102 = [v33 objectForKeyedSubscript:@"EventType"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && [v102 isEqualToString:@"EndEvent"])
          {
            NSErrorUserInfoKey v103 = +[NFSecureXPCEventPublisherManager sharedManager];
            int v104 = [v103 homed];
            [(_NFHardwareManager *)self postEventForPublisher:v104 event:"com.apple.stockholm.forHome.transaction.end" objectString:v120];

            sub_1000B4830((uint64_t)NFUnifiedAccessTransactionCALogger, v33, v47, 0);
          }
        }
        id v105 = NFSharedSignpostLog();
        if (os_signpost_enabled(v105))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v105, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AtlEvent", "AtlEndEventComplete", buf, 2u);
        }

        goto LABEL_101;
      }
      sub_1000FA5C8(self, v116, v119);
      uint64_t v47 = 3;
      if (v16) {
        goto LABEL_93;
      }
    }
LABEL_101:
    [(_NFSession *)self->_currentSecureElementSession handleTransactionEndEvent:v8 atlData:v9];
    goto LABEL_102;
  }
  int v77 = self->_inSessionExpressSessionID;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v78 = NFLogGetLogger();
  __int16 v79 = (void (*)(uint64_t, const char *, ...))v78;
  if (v77 == -1)
  {
    if (v78)
    {
      int v91 = object_getClass(self);
      BOOL v92 = class_isMetaClass(v91);
      __int16 v93 = object_getClassName(self);
      __int16 v94 = sel_getName(a2);
      uint64_t v95 = 45;
      if (v92) {
        uint64_t v95 = 43;
      }
      v79(6, "%c[%{public}s %{public}s]:%i in session but express started before (%d)", v95, v93, v94, 7428, self->_inSessionExpressSessionID);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    NSErrorUserInfoKey v96 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v97 = object_getClass(self);
      if (class_isMetaClass(v97)) {
        int v98 = 43;
      }
      else {
        int v98 = 45;
      }
      __int16 v99 = object_getClassName(self);
      unsigned int v100 = sel_getName(a2);
      int v101 = self->_inSessionExpressSessionID;
      *(_DWORD *)buf = 67110146;
      int v123 = v98;
      __int16 v124 = 2082;
      unsigned int v125 = v99;
      __int16 v126 = 2082;
      uint64_t v127 = v100;
      __int16 v128 = 1024;
      int v129 = 7428;
      __int16 v130 = 1024;
      *(_DWORD *)NSErrorUserInfoKey v131 = v101;
      _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i in session but express started before (%d)", buf, 0x28u);
    }

    goto LABEL_91;
  }
  if (v78)
  {
    int v80 = object_getClass(self);
    BOOL v81 = class_isMetaClass(v80);
    uint64_t v82 = object_getClassName(self);
    __int16 v83 = sel_getName(a2);
    uint64_t v114 = self->_inSessionExpressSessionID;
    uint64_t v115 = [(_NFSession *)self->_currentSecureElementSession sessionID];
    uint64_t v84 = 45;
    if (v81) {
      uint64_t v84 = 43;
    }
    v79(5, "%c[%{public}s %{public}s]:%i in-session express but wrong session ID (%d vs %d)", v84, v82, v83, 7442, v114, v115);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v68 = NFSharedLogGetLogger();
  if (!os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_78;
  }
  __int16 v85 = object_getClass(self);
  if (class_isMetaClass(v85)) {
    int v86 = 43;
  }
  else {
    int v86 = 45;
  }
  __int16 v87 = object_getClassName(self);
  __int16 v88 = sel_getName(a2);
  int v89 = self->_inSessionExpressSessionID;
  unsigned int v90 = [(_NFSession *)self->_currentSecureElementSession sessionID];
  *(_DWORD *)buf = 67110402;
  int v123 = v86;
  __int16 v124 = 2082;
  unsigned int v125 = v87;
  __int16 v126 = 2082;
  uint64_t v127 = v88;
  __int16 v128 = 1024;
  int v129 = 7442;
  __int16 v130 = 1024;
  *(_DWORD *)NSErrorUserInfoKey v131 = v89;
  *(_WORD *)&v131[4] = 1024;
  *(_DWORD *)&v131[6] = v90;
  uint64_t v74 = "%c[%{public}s %{public}s]:%i in-session express but wrong session ID (%d vs %d)";
  uint64_t v75 = v68;
  uint32_t v76 = 46;
LABEL_77:
  _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, v74, buf, v76);
LABEL_78:

LABEL_102:
  id v106 = v121;
  if (v121 && v117 != (id)1)
  {
    id v107 = [v9 objectForKeyedSubscript:@"endPointIdentifier"];
    id v108 = sub_10004673C((uint64_t)self->_expressModeManager, v14, v107);
    id v109 = [v121 mutableCopy];
    NSErrorUserInfoKey v110 = v109;
    if (v108) {
      [v109 addEntriesFromDictionary:v108];
    }
    uint64_t v111 = self->_expressModeManager;
    NSErrorUserInfoKey v112 = [v8 appletIdentifier];
    char v113 = sub_100046A30((uint64_t)v111, v112);
    sub_10023E848((uint64_t)NFHciTransactionEventCALogger, v110, v9, v113, 0);

    id v106 = v121;
  }
}

- (void)handleFelicaStateEvent:(id)a3 appletAID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (objc_opt_respondsToSelector())
  {
    [(_NFSession *)self->_currentSecureElementSession handleFelicaStateEvent:v7 appletAID:v8];
  }
  else
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
      uint64_t v15 = 45;
      if (isMetaClass) {
        uint64_t v15 = 43;
      }
      v10(4, "%c[%{public}s %{public}s]:%i Unexpected active session: %{public}@", v15, ClassName, Name, 7486, self->_currentSecureElementSession);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      BOOL v17 = object_getClass(self);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      unsigned int v19 = object_getClassName(self);
      CFStringRef v20 = sel_getName(a2);
      currentSecureElementSession = self->_currentSecureElementSession;
      *(_DWORD *)buf = 67110146;
      int v23 = v18;
      __int16 v24 = 2082;
      __int16 v25 = v19;
      __int16 v26 = 2082;
      uint64_t v27 = v20;
      __int16 v28 = 1024;
      int v29 = 7486;
      __int16 v30 = 2114;
      int v31 = currentSecureElementSession;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected active session: %{public}@", buf, 0x2Cu);
    }
  }
}

- (void)handleStepUpEvent:(id)a3 forApplet:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (objc_opt_respondsToSelector())
  {
    expressModeManager = self->_expressModeManager;
    uint64_t v10 = 5;
    if (expressModeManager)
    {
      if (expressModeManager->_expressModeInProgress) {
        uint64_t v10 = 6;
      }
      else {
        uint64_t v10 = 5;
      }
    }
    [(_NFSession *)self->_currentSecureElementSession handleStepUpEvent:v7 transactionType:v10 forApplet:v8];
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v17 = 45;
      if (isMetaClass) {
        uint64_t v17 = 43;
      }
      v12(4, "%c[%{public}s %{public}s]:%i Unexpected active session: %{public}@", v17, ClassName, Name, 7498, self->_currentSecureElementSession);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v18 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      unsigned int v19 = object_getClass(self);
      if (class_isMetaClass(v19)) {
        int v20 = 43;
      }
      else {
        int v20 = 45;
      }
      __int16 v21 = object_getClassName(self);
      unsigned int v22 = sel_getName(a2);
      currentSecureElementSession = self->_currentSecureElementSession;
      *(_DWORD *)buf = 67110146;
      int v25 = v20;
      __int16 v26 = 2082;
      uint64_t v27 = v21;
      __int16 v28 = 2082;
      int v29 = v22;
      __int16 v30 = 1024;
      int v31 = 7498;
      __int16 v32 = 2114;
      int v33 = currentSecureElementSession;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected active session: %{public}@", buf, 0x2Cu);
    }
  }
}

- (void)handleHostCardReaderDetected:(id)a3
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
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 7518);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v21 = v14;
    __int16 v22 = 2082;
    int v23 = object_getClassName(self);
    __int16 v24 = 2082;
    int v25 = sel_getName(a2);
    __int16 v26 = 1024;
    int v27 = 7518;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100125F64;
  block[3] = &unk_100301CB8;
  void block[4] = self;
  id v19 = v5;
  id v16 = v5;
  dispatch_async(workQueue, block);
}

- (void)handleRemoteTagsDetected:(id)a3 dropAndRestartDiscovery:(BOOL)a4
{
  id v7 = a3;
  workQueue = self->_workQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100126098;
  v10[3] = &unk_100304998;
  BOOL v13 = a4;
  id v11 = v7;
  SEL v12 = a2;
  v10[4] = self;
  id v9 = v7;
  dispatch_async(workQueue, v10);
}

- (void)handleReaderBurnoutTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v4 = NFSharedSignpostLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "READER_MODE_BURNOUT", (const char *)&unk_100286819, buf, 2u);
  }

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    int v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(6, "%c[%{public}s %{public}s]:%i Reader mode must stop", v10, ClassName, Name, 7550);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    SEL v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    int v14 = object_getClassName(self);
    uint64_t v15 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v20 = v13;
    __int16 v21 = 2082;
    __int16 v22 = v14;
    __int16 v23 = 2082;
    __int16 v24 = v15;
    __int16 v25 = 1024;
    int v26 = 7550;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Reader mode must stop", buf, 0x22u);
  }

  if (self->_currentSecureElementSession)
  {
    if (objc_opt_respondsToSelector()) {
      [(_NFSession *)self->_currentSecureElementSession handleReaderBurnoutTimer];
    }
  }
  else
  {
    [(NFBackgroundTagReadingManager *)self->_backgroundTagReadingManager stop];
    id v16 = [(_NFHardwareManager *)self defaultRoutingConfig:3];
    id v17 = [(_NFHardwareManager *)self setRoutingConfig:v16];
  }
}

- (void)handleReaderBurnoutCleared
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v4 = NFSharedSignpostLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "READER_MODE_BURNOUT_CLEARED", (const char *)&unk_100286819, buf, 2u);
  }

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    int v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(6, "%c[%{public}s %{public}s]:%i Reader mode can resume", v10, ClassName, Name, 7569);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    SEL v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    int v14 = object_getClassName(self);
    uint64_t v15 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v19 = v13;
    __int16 v20 = 2082;
    __int16 v21 = v14;
    __int16 v22 = 2082;
    __int16 v23 = v15;
    __int16 v24 = 1024;
    int v25 = 7569;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Reader mode can resume", buf, 0x22u);
  }

  if (self->_currentSecureElementSession)
  {
    if (objc_opt_respondsToSelector()) {
      [(_NFSession *)self->_currentSecureElementSession handleReaderBurnoutCleared];
    }
  }
  else
  {
    id v16 = +[NSDistributedNotificationCenter defaultCenter];
    [v16 postNotificationName:@"com.apple.nfcd.burnout.cleared" object:0 userInfo:0 options:3];

    [(_NFHardwareManager *)self maybeStartNextSession];
  }
}

- (void)handleSecureElementRemoved:(int)a3 withReason:(unsigned int)a4
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001268BC;
  block[3] = &unk_100304970;
  void block[4] = self;
  void block[5] = a2;
  int v6 = a3;
  dispatch_async(workQueue, block);
}

- (void)handleSecureElementOSReset:(int64_t)a3 withReason:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Unexpected OS reset notification : %ld, reason %d.", v13, ClassName, Name, 7646, a3, v4);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = object_getClass(self);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      *(_DWORD *)buf = 67110402;
      int v21 = v16;
      __int16 v22 = 2082;
      __int16 v23 = object_getClassName(self);
      __int16 v24 = 2082;
      int v25 = sel_getName(a2);
      __int16 v26 = 1024;
      int v27 = 7646;
      __int16 v28 = 2048;
      int64_t v29 = a3;
      __int16 v30 = 1024;
      int v31 = v4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected OS reset notification : %ld, reason %d.", buf, 0x32u);
    }
  }
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100126E44;
  block[3] = &unk_100304108;
  void block[4] = self;
  void block[5] = a2;
  void block[6] = a3;
  dispatch_async(workQueue, block);
  +[NFExceptionsCALogger postAnalyticsOsResetEvent:v4 osID:a3 hardwareType:sub_1000EE260((uint64_t)self)];
}

- (void)stopFury
{
  uint64_t v3 = self;
  objc_sync_enter(v3);
  id WeakRetained = objc_loadWeakRetained((id *)&v3->_ffDelegate);
  objc_sync_exit(v3);

  if (!WeakRetained)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(v3);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(v3);
      Name = sel_getName(a2);
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i delegate not set?!", v10, ClassName, Name, 7717);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      SEL v12 = object_getClass(v3);
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v16 = v13;
      __int16 v17 = 2082;
      int v18 = object_getClassName(v3);
      __int16 v19 = 2082;
      __int16 v20 = sel_getName(a2);
      __int16 v21 = 1024;
      int v22 = 7717;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i delegate not set?!", buf, 0x22u);
    }
  }
  [WeakRetained stopFury];
}

- (void)handleFailForwardCompleted
{
  uint64_t v3 = self;
  objc_sync_enter(v3);
  id WeakRetained = objc_loadWeakRetained((id *)&v3->_ffDelegate);
  objc_sync_exit(v3);

  if (!WeakRetained)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(v3);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(v3);
      Name = sel_getName(a2);
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i delegate not set?!", v10, ClassName, Name, 7731);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      SEL v12 = object_getClass(v3);
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v16 = v13;
      __int16 v17 = 2082;
      int v18 = object_getClassName(v3);
      __int16 v19 = 2082;
      __int16 v20 = sel_getName(a2);
      __int16 v21 = 1024;
      int v22 = 7731;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i delegate not set?!", buf, 0x22u);
    }
  }
  [WeakRetained handleFailForwardCompleted];
}

- (void)handleHceTargetLost
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012788C;
  block[3] = &unk_100301C68;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)secureElementReturnedRestrictedMode:(id)a3 os:(int64_t)a4
{
  workQueue = self->_workQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100127980;
  v5[3] = &unk_100301C40;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(workQueue, v5);
}

- (void)updateSeInfo:(id)a3
{
  sub_100040C1C(self->_expressModeManager);
  id v5 = +[NFRoutingConfig embeddedWiredModeWithFD:0];
  int v6 = [(_NFHardwareManager *)self setRoutingConfig:v5];

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
      v8(3, "%c[%{public}s %{public}s]:%i Failed to set routing mode", v12, ClassName, Name, 7764);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = object_getClass(self);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v18 = v15;
      __int16 v19 = 2082;
      __int16 v20 = object_getClassName(self);
      __int16 v21 = 2082;
      int v22 = sel_getName(a2);
      __int16 v23 = 1024;
      int v24 = 7764;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set routing mode", buf, 0x22u);
    }
  }
  else
  {
    [(_NFHardwareManager *)self refreshSecureElementInfo];
  }
}

- (void)markApplicationForDelete:(id)a3
{
  id v3 = a3;
  sub_100032D1C();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  sub_100030690((uint64_t)v4, v3);
}

- (void)powerObserverSystemWillSleep:(id)a3
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    int v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 7779);
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
    *(_DWORD *)buf = 67109890;
    int v20 = v13;
    __int16 v21 = 2082;
    int v22 = object_getClassName(self);
    __int16 v23 = 2082;
    int v24 = sel_getName(a2);
    __int16 v25 = 1024;
    int v26 = 7779;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  int v14 = NFSharedSignpostLog();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "powerObserverSystemWillSleep:", (const char *)&unk_100286819, buf, 2u);
  }

  int v15 = self->_secureElementSessionQueue;
  objc_sync_enter(v15);
  self->_systemWillSleep = 1;
  objc_sync_exit(v15);

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100127E14;
  block[3] = &unk_100301C40;
  void block[4] = self;
  void block[5] = a2;
  dispatch_async_and_wait(workQueue, block);
}

- (void)powerObserverSystemHasPoweredOn:(id)a3
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    int v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 7863);
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
    *(_DWORD *)buf = 67109890;
    int v18 = v13;
    __int16 v19 = 2082;
    int v20 = object_getClassName(self);
    __int16 v21 = 2082;
    int v22 = sel_getName(a2);
    __int16 v23 = 1024;
    int v24 = 7863;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100128D08;
  block[3] = &unk_100301C40;
  void block[4] = self;
  void block[5] = a2;
  dispatch_async(workQueue, block);
}

- (void)clientAppIsSuspended:(id)a3
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
    uint64_t v12 = [v5 NF_userInfo];
    int v13 = [v12 objectForKeyedSubscript:@"ClientName"];
    uint64_t v14 = 45;
    if (isMetaClass) {
      uint64_t v14 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i %{public}@", v14, ClassName, Name, 7919, v13);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = object_getClass(self);
    if (class_isMetaClass(v16)) {
      int v17 = 43;
    }
    else {
      int v17 = 45;
    }
    int v18 = object_getClassName(self);
    __int16 v19 = sel_getName(a2);
    int v20 = [v5 NF_userInfo];
    __int16 v21 = [v20 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)__int16 v32 = v17;
    *(_WORD *)&v32[4] = 2082;
    *(void *)&v32[6] = v18;
    __int16 v33 = 2082;
    id v34 = v19;
    __int16 v35 = 1024;
    int v36 = 7919;
    __int16 v37 = 2114;
    uint32_t v38 = v21;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  [v5 processIdentifier];
  kdebug_trace();
  int v22 = NFSharedSignpostLog();
  if (os_signpost_enabled(v22))
  {
    __int16 v23 = [v5 NF_userInfo];
    int v24 = [v23 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 138412290;
    *(void *)__int16 v32 = v24;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLIENT_APP_SUSPENDED", "client app %@ suspended", buf, 0xCu);
  }
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100129384;
  block[3] = &unk_100301C90;
  id v28 = v5;
  int64_t v29 = self;
  SEL v30 = a2;
  id v26 = v5;
  dispatch_async(workQueue, block);
}

- (void)preferencesDidChange
{
  workQueue = self->_workQueue;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100129B74;
  v3[3] = &unk_100301C40;
  v3[4] = self;
  v3[5] = a2;
  dispatch_async(workQueue, v3);
}

- (id)setHostEmulationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    uint64_t v6 = 2;
  }
  else
  {
    id v7 = [(_NFHardwareManager *)self defaultRoutingConfig:3];
    uint64_t v6 = (uint64_t)[v7 hostMode];
  }
  id v8 = [(_NFHardwareManager *)self lastKnownRoutingConfig];
  id v9 = [v8 hostMode];

  if ((id)v6 == v9)
  {
    id v10 = 0;
    goto LABEL_21;
  }
  id v11 = [(_NFHardwareManager *)self lastKnownRoutingConfig];
  if ([v11 embeddedMode] != (id)2 || (driverWrapper = self->_driverWrapper) == 0)
  {

    goto LABEL_20;
  }
  [(NSLock *)driverWrapper->_fieldPresentLock lock];
  BOOL fieldPresent = driverWrapper->_fieldPresent;
  [(NSLock *)driverWrapper->_fieldPresentLock unlock];

  if (!fieldPresent)
  {
LABEL_20:
    id v26 = [(_NFHardwareManager *)self lastKnownRoutingConfig];
    int v27 = [v26 cloneWithHCE:v3];

    sub_10012A06C((uint64_t)self, v27);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    int v15 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v18 = 45;
    if (isMetaClass) {
      uint64_t v18 = 43;
    }
    v15(3, "%c[%{public}s %{public}s]:%i Host Card Emulation can not be modified while SE emulation is active and field is present: requested change= %d", v18, ClassName, Name, 8277, v3);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  __int16 v19 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    int v20 = object_getClass(self);
    if (class_isMetaClass(v20)) {
      int v21 = 43;
    }
    else {
      int v21 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v34 = v21;
    __int16 v35 = 2082;
    int v36 = object_getClassName(self);
    __int16 v37 = 2082;
    uint32_t v38 = sel_getName(a2);
    __int16 v39 = 1024;
    int v40 = 8277;
    __int16 v41 = 1024;
    BOOL v42 = v3;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Host Card Emulation can not be modified while SE emulation is active and field is present: requested change= %d", buf, 0x28u);
  }

  id v22 = objc_alloc((Class)NSError);
  __int16 v23 = +[NSString stringWithUTF8String:"nfcd"];
  NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
  int v24 = +[NSString stringWithUTF8String:"Invalid State"];
  __int16 v32 = v24;
  __int16 v25 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  id v10 = [v22 initWithDomain:v23 code:12 userInfo:v25];

LABEL_21:

  return v10;
}

- (void)reconfigureDynamicTransitRF:(unint64_t)a3 withOverride:(BOOL)a4
{
  BOOL v4 = a4;
  int v8 = sub_10004BEE0((id *)&self->_expressModeManager->super.isa);
  expressModeManager = self->_expressModeManager;
  if (expressModeManager) {
    unint64_t dynamicTransitConfiguration = expressModeManager->_dynamicTransitConfiguration;
  }
  else {
    unint64_t dynamicTransitConfiguration = 0;
  }
  if ([(NFHardwareControllerInfo *)self->_controllerInfo hasAntenna]
    && ((id)[(NFHardwareControllerInfo *)self->_controllerInfo siliconName] == (id)8
     || [(NFHardwareControllerInfo *)self->_controllerInfo siliconName] >= 0xA))
  {
    if (v4)
    {
      BOOL v11 = dynamicTransitConfiguration != a3;
      int v12 = a3 == 2;
    }
    else
    {
      BOOL v13 = dynamicTransitConfiguration != 2;
      if (!v8) {
        BOOL v13 = dynamicTransitConfiguration != 1;
      }
      BOOL v14 = dynamicTransitConfiguration == 2;
      if (dynamicTransitConfiguration == 2) {
        int v15 = 0;
      }
      else {
        int v15 = v8;
      }
      if (v8) {
        BOOL v14 = dynamicTransitConfiguration != 2;
      }
      BOOL v11 = v13 && v14;
      int v12 = v13 ? v15 : 0;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int v17 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      if (v4) {
        CFStringRef v22 = @"YES";
      }
      else {
        CFStringRef v22 = @"NO";
      }
      if (v11) {
        CFStringRef v23 = @"YES";
      }
      else {
        CFStringRef v23 = @"NO";
      }
      if (v12) {
        CFStringRef v24 = @"YES";
      }
      else {
        CFStringRef v24 = @"NO";
      }
      uint64_t v25 = 43;
      if (!isMetaClass) {
        uint64_t v25 = 45;
      }
      v17(6, "%c[%{public}s %{public}s]:%i RF override : %{public}@, update : %{public}@, alternate FDT : %{public}@", v25, ClassName, Name, 8373, v22, v23, v24);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v26 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = object_getClass(self);
      if (class_isMetaClass(v27)) {
        int v28 = 43;
      }
      else {
        int v28 = 45;
      }
      int64_t v29 = object_getClassName(self);
      SEL v30 = sel_getName(a2);
      *(_DWORD *)buf = 67110658;
      CFStringRef v31 = @"YES";
      if (v4) {
        CFStringRef v32 = @"YES";
      }
      else {
        CFStringRef v32 = @"NO";
      }
      int v38 = v28;
      if (v11) {
        CFStringRef v33 = @"YES";
      }
      else {
        CFStringRef v33 = @"NO";
      }
      __int16 v39 = 2082;
      if (!v12) {
        CFStringRef v31 = @"NO";
      }
      int v40 = v29;
      __int16 v41 = 2082;
      BOOL v42 = v30;
      __int16 v43 = 1024;
      int v44 = 8373;
      __int16 v45 = 2114;
      CFStringRef v46 = v32;
      __int16 v47 = 2114;
      CFStringRef v48 = v33;
      __int16 v49 = 2114;
      CFStringRef v50 = v31;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i RF override : %{public}@, update : %{public}@, alternate FDT : %{public}@", buf, 0x40u);
    }

    if (v11)
    {
      if ([(NFHardwareControllerInfo *)self->_controllerInfo hasAntenna]
        && [(NFHardwareControllerInfo *)self->_controllerInfo siliconName] >= 8)
      {
        if (!v4) {
          return;
        }
        id v34 = sub_1001E0C8C(self->_driverWrapper);
      }
      __int16 v35 = self->_expressModeManager;
      if (v35)
      {
        uint64_t v36 = 1;
        if (v12) {
          uint64_t v36 = 2;
        }
        v35->_unint64_t dynamicTransitConfiguration = v36;
      }
    }
  }
}

- (BOOL)configureECPPolling:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10012A770;
  v8[3] = &unk_1003049C0;
  id v9 = self;
  id v10 = a3;
  SEL v11 = a2;
  id v4 = v10;
  id v5 = +[NFRoutingConfig routingOffWithFD:0];
  char v6 = sub_1000F23D8((void **)&v9->super.isa, v8, @"Config ECP Polling", v5);

  return v6;
}

- (id)setRoutingConfig:(id)a3
{
  id v5 = a3;
  id v6 = [v5 fieldDetectType];
  id v7 = NFSharedSignpostLog();
  if (os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)__int16 v49 = v5;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SetRoutingConfig", "begin; config = %@",
      buf,
      0xCu);
  }

  if (![v5 wantsExpress]) {
    goto LABEL_35;
  }
  int v8 = [(_NFHardwareManager *)self lastKnownRoutingConfig];
  unsigned __int8 v9 = [v5 isEquivalentRouting:v8];

  if ((v9 & 1) == 0)
  {
    [(_NFHardwareManager *)self reconfigureDynamicTransitRF:1 withOverride:0];
    driverWrapper = self->_driverWrapper;
    expressModeManager = self->_expressModeManager;
    if (!expressModeManager)
    {
      uint64_t modeConfig = 0;
      if (!driverWrapper) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    if (expressModeManager->_factoryTestMode)
    {
      if (expressModeManager->_testModeECP2) {
        uint64_t modeConfig = 16;
      }
      else {
        uint64_t modeConfig = 4;
      }
      if (!driverWrapper) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    uint64_t modeConfig = expressModeManager->_modeConfig;
    if (driverWrapper) {
LABEL_13:
    }
      sub_1002155FC(driverWrapper, modeConfig, 0);
  }
LABEL_14:
  id v13 = [v5 embeddedMode];
  BOOL v14 = [(NFSecureElementWrapper *)self->_secureElementWrapper handle];
  int v15 = [v14 info];
  unsigned int v16 = [v15 restrictedMode];

  if (v16)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v18 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v22 = 45;
      if (isMetaClass) {
        uint64_t v22 = 43;
      }
      v18(4, "%c[%{public}s %{public}s]:%i Bypassing express mode due to SE in restricted mode", v22, ClassName, Name, 8450);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    CFStringRef v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v24 = object_getClass(self);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      id v26 = object_getClassName(self);
      int v27 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)__int16 v49 = v25;
      *(_WORD *)&v49[4] = 2082;
      *(void *)&v49[6] = v26;
      __int16 v50 = 2082;
      uint64_t v51 = v27;
      __int16 v52 = 1024;
      int v53 = 8450;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Bypassing express mode due to SE in restricted mode", buf, 0x22u);
    }

    uint64_t v28 = sub_1000452C8((uint64_t)self->_expressModeManager);
LABEL_25:
    BOOL v29 = 0;
LABEL_34:
    id v34 = [v5 wantsLPCD];
    __int16 v35 = [v5 lpcdEcpFrame];
    uint64_t v36 = +[NFRoutingConfig wantsLPCD:v34 expressForEmbedded:v29 hostCardEmulation:v28 fieldDetect:v6 lpcdEcpFrame:v35];

    id v5 = (id)v36;
    goto LABEL_35;
  }
  SEL v30 = self->_expressModeManager;
  BOOL v31 = v13 == (id)2;
  BOOL v29 = v13 == (id)2;
  if (v31)
  {
    BOOL v32 = sub_100047694((BOOL)v30);
    if ((sub_1000452C8((uint64_t)self->_expressModeManager) & 1) == 0)
    {
      if (v32) {
        goto LABEL_35;
      }
      uint64_t v28 = 0;
      goto LABEL_25;
    }
    if (!v32)
    {
      BOOL v29 = 0;
LABEL_33:
      uint64_t v28 = 1;
      goto LABEL_34;
    }
  }
  else
  {
    char v33 = sub_1000452C8((uint64_t)v30);
    if ((v33 & 1) == 0) {
      goto LABEL_35;
    }
  }
  if ([v5 hostMode] != (id)2) {
    goto LABEL_33;
  }
LABEL_35:
  if ([v5 cardEmulationType] || !objc_msgSend(v5, "contactlessOnAny"))
  {
    sub_10012A06C((uint64_t)self, v5);
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v39 = NFSharedSignpostLog();
    if (os_signpost_enabled(v39))
    {
      __int16 v43 = "Failed";
      if (!v42) {
        __int16 v43 = "Success";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)__int16 v49 = v43;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SetRoutingConfig", "%s", buf, 0xCu);
    }
  }
  else
  {
    __int16 v37 = +[NSAssertionHandler currentHandler];
    [v37 handleFailureInMethod:a2, self, @"_NFHardwareManager.m", 8491, @"Unexpected config: %@", v5 object file lineNumber description];

    id v38 = objc_alloc((Class)NSError);
    __int16 v39 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
    int v40 = +[NSString stringWithUTF8String:"Unexpected Result"];
    __int16 v47 = v40;
    __int16 v41 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    id v42 = [v38 initWithDomain:v39 code:13 userInfo:v41];
  }

  return v42;
}

- (BOOL)restartDiscovery
{
  return sub_1002128B4(self->_driverWrapper);
}

- (id)defaultRoutingConfig:(unint64_t)a3
{
  return sub_1000F86B8((uint64_t)self, a3, 0);
}

- (void)notifyReaderModeActivityEnd
{
  if (self->_readerUserNotified)
  {
    sub_100003C44(self, "com.apple.stockholm.reader.cardLost");
    self->_readerUserNotified = 0;
  }
}

- (void)notifyReaderModeActivityStart
{
  if (!self->_readerUserNotified)
  {
    sub_100003C44(self, "com.apple.stockholm.reader.cardDetected");
    self->_readerUserNotified = 1;
  }
}

- (BOOL)configureExpressFelicaEntry:(int)a3
{
  BOOL v3 = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10012AF6C;
  v6[3] = &unk_1003049E8;
  int v7 = a3;
  v6[4] = self;
  void v6[5] = a2;
  id v4 = +[NFRoutingConfig routingOffWithFD:0];
  LOBYTE(v3) = sub_1000F23D8((void **)&v3->super.isa, v6, @"Configure ExpressFelica entry", v4);

  return (char)v3;
}

- (NFRoutingConfig)lastKnownRoutingConfig
{
  driverWrapper = self->_driverWrapper;
  if (!driverWrapper
    || (sub_10020EC44((id *)&driverWrapper->super.isa), (BOOL v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    BOOL v3 = +[NFRoutingConfig routingOffWithFD:0];
  }

  return (NFRoutingConfig *)v3;
}

- (NFDriverWrapper)driverWrapper
{
  return (NFDriverWrapper *)objc_getProperty(self, a2, 368, 1);
}

- (NFSecureElementWrapper)secureElementWrapper
{
  return (NFSecureElementWrapper *)objc_getProperty(self, a2, 376, 1);
}

- (NFHardwareControllerInfo)controllerInfo
{
  return (NFHardwareControllerInfo *)objc_getProperty(self, a2, 384, 1);
}

- (NFXPCEventPublisher)sesdEventPublisher
{
  return self->_sesdEventPublisher;
}

- (OS_dispatch_queue)xpcEventNotificationQueue
{
  return self->_xpcEventNotificationQueue;
}

- (BOOL)userInitiatedShutdown
{
  return self->_userInitiatedShutdown;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seSerialFromFDR, 0);
  objc_storeStrong((id *)&self->_connectionHandoverAssertionForCamera, 0);
  objc_storeStrong((id *)&self->_backgroundTagReadingManager, 0);
  objc_storeStrong((id *)&self->_xpcEventNotificationQueue, 0);
  objc_storeStrong((id *)&self->_sesdEventPublisher, 0);
  objc_storeStrong((id *)&self->_controllerInfo, 0);
  objc_storeStrong((id *)&self->_secureElementWrapper, 0);
  objc_storeStrong((id *)&self->_driverWrapper, 0);
  objc_storeStrong((id *)&self->_keepAliveTransaction, 0);
  objc_storeStrong((id *)&self->_keepAliveForFieldDetect, 0);
  objc_storeStrong((id *)&self->_fieldDetectTransaction, 0);
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_lastOSReset, 0);
  objc_storeStrong((id *)&self->_lpcdCountersLoggingURL, 0);
  objc_storeStrong((id *)&self->_ftaLPEMLogging, 0);
  objc_storeStrong((id *)&self->_hostEmulationLog, 0);
  objc_storeStrong((id *)&self->_suspendedSessionQueue, 0);
  objc_storeStrong((id *)&self->_secureElementSessionQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_corenfcHWCallbackHandler, 0);
  objc_storeStrong((id *)&self->_callbackHandlers, 0);
  objc_destroyWeak((id *)&self->_ffDelegate);
  objc_storeStrong((id *)&self->_delayCheckSEDPDTimer, 0);
  objc_storeStrong((id *)&self->_powerCountersTimer, 0);
  objc_storeStrong((id *)&self->_stockholmDispatchOnceTimer, 0);
  objc_storeStrong((id *)&self->_currentSecureElementSession, 0);
  objc_storeStrong((id *)&self->_hkEventPublisher, 0);
  objc_storeStrong((id *)&self->_schedulingDailyUpdating, 0);
  objc_storeStrong((id *)&self->_keyBag, 0);
  objc_storeStrong((id *)&self->_managedConfigMonitor, 0);
  objc_storeStrong((id *)&self->_appStateObserver, 0);
  objc_storeStrong((id *)&self->_prefObserver, 0);
  objc_storeStrong((id *)&self->_powerObserver, 0);
  objc_storeStrong((id *)&self->_lastKnownRoutingConfig, 0);
  objc_storeStrong((id *)&self->_secureElementInfo, 0);
  objc_storeStrong((id *)&self->_expressModeManager, 0);
  objc_storeStrong((id *)&self->_fieldDetectManager, 0);

  objc_storeStrong((id *)&self->_controllerManager, 0);
}

- (void)didCameraStateChange:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  int v7 = (void (*)(uint64_t, const char *, ...))Logger;
  if (v3)
  {
    if (Logger)
    {
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v7(6, "%c[%{public}s %{public}s]:%i Request assertion", v11, ClassName, Name, 327);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = object_getClass(self);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v25 = v14;
      __int16 v26 = 2082;
      int v27 = object_getClassName(self);
      __int16 v28 = 2082;
      BOOL v29 = sel_getName(a2);
      __int16 v30 = 1024;
      int v31 = 327;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Request assertion", buf, 0x22u);
    }

    sub_100180030((uint64_t)self, @"NFCameraStateMonitor");
  }
  else
  {
    if (Logger)
    {
      int v15 = object_getClass(self);
      BOOL v16 = class_isMetaClass(v15);
      int v17 = object_getClassName(self);
      CFStringRef v23 = sel_getName(a2);
      uint64_t v18 = 45;
      if (v16) {
        uint64_t v18 = 43;
      }
      v7(6, "%c[%{public}s %{public}s]:%i Release assertion", v18, v17, v23, 330);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v19 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = object_getClass(self);
      if (class_isMetaClass(v20)) {
        int v21 = 43;
      }
      else {
        int v21 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v25 = v21;
      __int16 v26 = 2082;
      int v27 = object_getClassName(self);
      __int16 v28 = 2082;
      BOOL v29 = sel_getName(a2);
      __int16 v30 = 1024;
      int v31 = 330;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Release assertion", buf, 0x22u);
    }

    sub_100180404((uint64_t)self, @"NFCameraStateMonitor");
  }
}

- (void)disableLPEMFeature:(unint64_t)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = sub_10000B8D8;
  v15[4] = sub_10019BB10;
  id v16 = +[NSXPCConnection currentConnection];
  int v8 = sub_10012050C((id *)&self->super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10019BB18;
  block[3] = &unk_100306708;
  void block[4] = self;
  id v11 = v7;
  SEL v13 = a2;
  unint64_t v14 = a3;
  int v12 = v15;
  id v9 = v7;
  dispatch_async(v8, block);

  _Block_object_dispose(v15, 8);
}

- (void)enableLPEMFeature:(unint64_t)a3 completion:(id)a4
{
}

- (void)enableHeadlessTestMode:(unsigned __int16)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = sub_10012050C((id *)&self->super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10019DF44;
  block[3] = &unk_100304678;
  unsigned __int16 v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)configureHeadlessFactoryMode:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_10000B8D8;
  v13[4] = sub_10019BB10;
  id v14 = +[NSXPCConnection currentConnection];
  id v7 = sub_10012050C((id *)&self->super.isa);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10019E84C;
  v9[3] = &unk_100306780;
  BOOL v12 = a3;
  id v10 = v6;
  unsigned __int16 v11 = v13;
  v9[4] = self;
  id v8 = v6;
  dispatch_async(v7, v9);

  _Block_object_dispose(v13, 8);
}

- (void)headlessFactoryModeWithCompletion:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_10000B8D8;
  v10[4] = sub_10019BB10;
  id v11 = +[NSXPCConnection currentConnection];
  id v5 = sub_10012050C((id *)&self->super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10019F854;
  block[3] = &unk_1003067A8;
  id v8 = v4;
  id v9 = v10;
  void block[4] = self;
  id v6 = v4;
  dispatch_async(v5, block);

  _Block_object_dispose(v10, 8);
}

- (void)disableHeadlessMiniNVWithCompletion:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_10000B8D8;
  v10[4] = sub_10019BB10;
  id v11 = +[NSXPCConnection currentConnection];
  id v5 = sub_10012050C((id *)&self->super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A04E4;
  block[3] = &unk_1003067A8;
  id v8 = v4;
  id v9 = v10;
  void block[4] = self;
  id v6 = v4;
  dispatch_async(v5, block);

  _Block_object_dispose(v10, 8);
}

- (BOOL)isFirstInQueue
{
  if (self)
  {
    id v4 = self->_currentSecureElementSession;
    BOOL v5 = v4 == 0;
    if (v4)
    {
      uint64_t v2 = self->_currentSecureElementSession;
      if (![(_NFSession *)v2 isEnding])
      {
        BOOL v6 = 0;
LABEL_7:

        goto LABEL_8;
      }
    }
    secureElementSessionQueue = self->_secureElementSessionQueue;
  }
  else
  {
    id v4 = 0;
    secureElementSessionQueue = 0;
    BOOL v5 = 1;
  }
  id v8 = secureElementSessionQueue;
  BOOL v6 = [(NSMutableArray *)v8 count] == 0;

  if (!v5) {
    goto LABEL_7;
  }
LABEL_8:

  return v6;
}

- (BOOL)_syncResumeSession:(id)a3
{
  return [(_NFHardwareManager *)self _syncResumeSession:a3 field:0];
}

- (BOOL)_syncResumeSession:(id)a3 field:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (self) {
    suspendedSessionQueue = self->_suspendedSessionQueue;
  }
  else {
    suspendedSessionQueue = 0;
  }
  id v10 = suspendedSessionQueue;
  id v11 = [(NSMutableArray *)v10 indexOfObject:v7];

  if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      SEL v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v16 = 45;
      if (isMetaClass) {
        uint64_t v16 = 43;
      }
      v13(6, "%c[%{public}s %{public}s]:%i %{public}@ is not in suspended state", v16, ClassName, Name, 429, v7);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v17 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = object_getClass(self);
      if (class_isMetaClass(v18)) {
        int v19 = 43;
      }
      else {
        int v19 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v50 = v19;
      __int16 v51 = 2082;
      __int16 v52 = object_getClassName(self);
      __int16 v53 = 2082;
      uint64_t v54 = sel_getName(a2);
      __int16 v55 = 1024;
      int v56 = 429;
      __int16 v57 = 2114;
      id v58 = v7;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ is not in suspended state", buf, 0x2Cu);
    }
LABEL_26:
    BOOL v32 = 0;
    goto LABEL_27;
  }
  unsigned int v20 = [v7 isSessionSEOnly];
  int v21 = [(_NFHardwareManager *)self driverWrapper];
  int v17 = sub_10020EC8C(v21, @"Session", v20 ^ 1);

  if (v17)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v22 = NFLogGetLogger();
    if (v22)
    {
      CFStringRef v23 = (void (*)(uint64_t, const char *, ...))v22;
      CFStringRef v24 = object_getClass(self);
      BOOL v25 = class_isMetaClass(v24);
      __int16 v26 = object_getClassName(self);
      CFStringRef v48 = sel_getName(a2);
      uint64_t v27 = 45;
      if (v25) {
        uint64_t v27 = 43;
      }
      v23(3, "%c[%{public}s %{public}s]:%i Error - failed to restart parent session", v27, v26, v48, 459);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v28 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      BOOL v29 = object_getClass(self);
      if (class_isMetaClass(v29)) {
        int v30 = 43;
      }
      else {
        int v30 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v50 = v30;
      __int16 v51 = 2082;
      __int16 v52 = object_getClassName(self);
      __int16 v53 = 2082;
      uint64_t v54 = sel_getName(a2);
      __int16 v55 = 1024;
      int v56 = 459;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error - failed to restart parent session", buf, 0x22u);
    }

    int v31 = [(_NFHardwareManager *)self driverWrapper];
    if (v31) {
      NFDriverSimulateCrash();
    }

    goto LABEL_26;
  }
  if (self)
  {
    id v34 = self->_suspendedSessionQueue;
    [(NSMutableArray *)v34 removeObjectAtIndex:v11];

    sub_10012B380((uint64_t)self, v7);
    currentSecureElementSession = self->_currentSecureElementSession;
  }
  else
  {
    [0 removeObjectAtIndex:v11];
    sub_10012B380(0, v7);
    currentSecureElementSession = 0;
  }
  uint64_t v36 = currentSecureElementSession;
  __int16 v37 = [(_NFSession *)v36 initialECPConfig];

  if ([v37 length]) {
    [(_NFHardwareManager *)self configureECPPolling:v37];
  }
  if (self)
  {
    id v38 = self->_currentSecureElementSession;
    __int16 v39 = [(_NFSession *)v38 initialRoutingConfigWithField:v8];
    id v40 = [(_NFHardwareManager *)self setRoutingConfig:v39];

    [v7 resume];
    sub_1000F59BC((uint64_t)self);
    sub_1001DD0C8((uint64_t)self);
    secureElementSessionQueue = self->_secureElementSessionQueue;
  }
  else
  {
    int v44 = [0 initialRoutingConfigWithField:v8];
    id v45 = [0 setRoutingConfig:v44];

    [v7 resume];
    sub_1000F59BC(0);
    sub_1001DD0C8(0);
    secureElementSessionQueue = 0;
  }
  id v42 = secureElementSessionQueue;
  id v43 = [(NSMutableArray *)v42 count];

  if (!v43) {
    sub_1000EA4BC(self, 1);
  }

  int v17 = 0;
  BOOL v32 = 1;
LABEL_27:

  return v32;
}

- (void)dequeueSession:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_10012050C((id *)&self->super.isa);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001DF454;
  v7[3] = &unk_100301CB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)queueSession:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_10012050C((id *)&self->super.isa);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001DF518;
  v7[3] = &unk_100301CB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)prioritizeSession:(id)a3
{
  id v5 = a3;
  id v6 = sub_10012050C((id *)&self->super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001DF624;
  block[3] = &unk_100301C90;
  void block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (id)switchToSession:(id)a3 withToken:(id)a4
{
  id v76 = a3;
  id v7 = a4;
  if (self) {
    secureElementSessionQueue = self->_secureElementSessionQueue;
  }
  else {
    secureElementSessionQueue = 0;
  }
  obj = secureElementSessionQueue;
  objc_sync_enter(obj);
  if (self) {
    currentSecureElementSession = self->_currentSecureElementSession;
  }
  else {
    currentSecureElementSession = 0;
  }
  SEL v10 = currentSecureElementSession;
  id v11 = [(_NFSession *)v10 token];
  unsigned __int8 v12 = [v11 isEqualToData:v7];

  if ((v12 & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(self);
      if (class_isMetaClass(Class)) {
        uint64_t v53 = 43;
      }
      else {
        uint64_t v53 = 45;
      }
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      Logger(3, "%c[%{public}s %{public}s]:%i Current session token doesn't match %{public}@", v53, ClassName, Name, 536, v7);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v56 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      __int16 v57 = object_getClass(self);
      if (class_isMetaClass(v57)) {
        int v58 = 43;
      }
      else {
        int v58 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v80 = v58;
      __int16 v81 = 2082;
      uint64_t v82 = object_getClassName(self);
      __int16 v83 = 2082;
      uint64_t v84 = sel_getName(a2);
      __int16 v85 = 1024;
      int v86 = 536;
      __int16 v87 = 2114;
      id v88 = v7;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Current session token doesn't match %{public}@", buf, 0x2Cu);
    }

    id v59 = objc_alloc((Class)NSError);
    int v17 = +[NSString stringWithUTF8String:"nfcd"];
    v93[0] = NSLocalizedDescriptionKey;
    __int16 v49 = +[NSString stringWithUTF8String:"Invalid State"];
    v94[0] = v49;
    v94[1] = &off_10031F4C8;
    v93[1] = @"Line";
    v93[2] = @"Method";
    id v60 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v94[2] = v60;
    v93[3] = NSDebugDescriptionErrorKey;
    id v61 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 537];
    v94[3] = v61;
    id v62 = +[NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:4];
    __int16 v63 = (const char *)[v59 initWithDomain:v17 code:12 userInfo:v62];
    goto LABEL_60;
  }
  if (self) {
    SEL v13 = self->_secureElementSessionQueue;
  }
  else {
    SEL v13 = 0;
  }
  id v14 = v13;
  unsigned __int8 v15 = [(NSMutableArray *)v14 containsObject:v76];

  if ((v15 & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v64 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v64)
    {
      BOOL v65 = object_getClass(self);
      if (class_isMetaClass(v65)) {
        uint64_t v66 = 43;
      }
      else {
        uint64_t v66 = 45;
      }
      uint64_t v67 = object_getClassName(self);
      uint64_t v68 = sel_getName(a2);
      v64(3, "%c[%{public}s %{public}s]:%i Session isn't queued !", v66, v67, v68, 541);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v69 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      int v70 = object_getClass(self);
      if (class_isMetaClass(v70)) {
        int v71 = 43;
      }
      else {
        int v71 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v80 = v71;
      __int16 v81 = 2082;
      uint64_t v82 = object_getClassName(self);
      __int16 v83 = 2082;
      uint64_t v84 = sel_getName(a2);
      __int16 v85 = 1024;
      int v86 = 541;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session isn't queued !", buf, 0x22u);
    }

    id v72 = objc_alloc((Class)NSError);
    int v17 = +[NSString stringWithUTF8String:"nfcd"];
    v91[0] = NSLocalizedDescriptionKey;
    __int16 v49 = +[NSString stringWithUTF8String:"Invalid State"];
    v92[0] = v49;
    v92[1] = &off_10031F4E0;
    v91[1] = @"Line";
    v91[2] = @"Method";
    id v60 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v92[2] = v60;
    v91[3] = NSDebugDescriptionErrorKey;
    id v61 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 542];
    v92[3] = v61;
    id v62 = +[NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:4];
    __int16 v63 = (const char *)[v72 initWithDomain:v17 code:12 userInfo:v62];
LABEL_60:
    a2 = v63;

    int v50 = 0;
    goto LABEL_61;
  }
  if (self) {
    uint64_t v16 = self->_currentSecureElementSession;
  }
  else {
    uint64_t v16 = 0;
  }
  int v17 = v16;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v18)
  {
    int v19 = object_getClass(self);
    if (class_isMetaClass(v19)) {
      uint64_t v20 = 43;
    }
    else {
      uint64_t v20 = 45;
    }
    int v21 = object_getClassName(self);
    uint64_t v22 = sel_getName(a2);
    CFStringRef v23 = [v76 sessionUID];
    v18(6, "%c[%{public}s %{public}s]:%i Assigning parent token %{public}@ to %{public}@", v20, v21, v22, 546, v7, v23);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  CFStringRef v24 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v25 = object_getClass(self);
    if (class_isMetaClass(v25)) {
      int v26 = 43;
    }
    else {
      int v26 = 45;
    }
    uint64_t v27 = object_getClassName(self);
    __int16 v28 = sel_getName(a2);
    BOOL v29 = [v76 sessionUID];
    *(_DWORD *)buf = 67110402;
    int v80 = v26;
    __int16 v81 = 2082;
    uint64_t v82 = v27;
    __int16 v83 = 2082;
    uint64_t v84 = v28;
    __int16 v85 = 1024;
    int v86 = 546;
    __int16 v87 = 2114;
    id v88 = v7;
    __int16 v89 = 2114;
    SEL v90 = v29;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Assigning parent token %{public}@ to %{public}@", buf, 0x36u);
  }
  [v76 setParentToken:v7];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v30 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v30)
  {
    int v31 = object_getClass(self);
    if (class_isMetaClass(v31)) {
      uint64_t v32 = 43;
    }
    else {
      uint64_t v32 = 45;
    }
    char v33 = object_getClassName(self);
    id v34 = sel_getName(a2);
    __int16 v35 = [(_NFSession *)v17 sessionUID];
    uint64_t v36 = [v76 sessionUID];
    v30(6, "%c[%{public}s %{public}s]:%i Switching from %{public}@ to %{public}@", v32, v33, v34, 549, v35, v36);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  __int16 v37 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    id v38 = object_getClass(self);
    if (class_isMetaClass(v38)) {
      int v39 = 43;
    }
    else {
      int v39 = 45;
    }
    id v40 = object_getClassName(self);
    __int16 v41 = sel_getName(a2);
    id v42 = [(_NFSession *)v17 sessionUID];
    a2 = [v76 sessionUID];
    *(_DWORD *)buf = 67110402;
    int v80 = v39;
    __int16 v81 = 2082;
    uint64_t v82 = v40;
    __int16 v83 = 2082;
    uint64_t v84 = v41;
    __int16 v85 = 1024;
    int v86 = 549;
    __int16 v87 = 2114;
    id v88 = v42;
    __int16 v89 = 2114;
    SEL v90 = a2;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Switching from %{public}@ to %{public}@", buf, 0x36u);
  }
  if (self) {
    id v43 = self->_secureElementSessionQueue;
  }
  else {
    id v43 = 0;
  }
  int v44 = v43;
  [(NSMutableArray *)v44 removeObject:v76];

  if (self) {
    id v45 = self->_secureElementSessionQueue;
  }
  else {
    id v45 = 0;
  }
  NSErrorUserInfoKey v46 = v45;
  [(NSMutableArray *)v46 insertObject:v76 atIndex:0];

  sub_10012B380((uint64_t)self, 0);
  if (self) {
    suspendedSessionQueue = self->_suspendedSessionQueue;
  }
  else {
    suspendedSessionQueue = 0;
  }
  CFStringRef v48 = suspendedSessionQueue;
  [(NSMutableArray *)v48 addObject:v17];

  v77[0] = @"ReasonCode";
  v77[1] = @"Token";
  v78[0] = &off_10031F4F8;
  v78[1] = v7;
  __int16 v49 = +[NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:2];
  [(_NFSession *)v17 suspendWithInfo:v49];
  int v50 = 1;
LABEL_61:

  objc_sync_exit(obj);
  if (v50)
  {
    [(_NFHardwareManager *)self maybeStartNextSession];
    int v73 = [(_NFHardwareManager *)self driverWrapper];
    sub_1002114AC(v73, @"Session");

    a2 = 0;
  }

  return (id)(id)a2;
}

- (void)logLPCDFalseDetects:(int)a3
{
  if (a3)
  {
    uint64_t v3 = *(void *)&a3;
    id v6 = +[NSDate date];
    id v7 = +[NSLocale currentLocale];
    id v8 = [v6 descriptionWithLocale:v7];

    if (v8)
    {
      if (self) {
        lpcdCountersLoggingURL = self->_lpcdCountersLoggingURL;
      }
      else {
        lpcdCountersLoggingURL = 0;
      }
      SEL v10 = lpcdCountersLoggingURL;
      unsigned int v11 = [(NSURL *)v10 checkResourceIsReachableAndReturnError:0];

      if (v11)
      {
        id v12 = objc_alloc((Class)NSMutableDictionary);
        if (self) {
          SEL v13 = self->_lpcdCountersLoggingURL;
        }
        else {
          SEL v13 = 0;
        }
        id v14 = v13;
        id v15 = [v12 initWithContentsOfURL:v14];
      }
      else
      {
        id v15 = (id)objc_opt_new();
      }
      int v50 = v8;
      uint64_t v16 = +[NSNumber numberWithInt:v3];
      __int16 v51 = v16;
      int v17 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      [v15 addEntriesFromDictionary:v17];

      if (self) {
        uint64_t v18 = self->_lpcdCountersLoggingURL;
      }
      else {
        uint64_t v18 = 0;
      }
      int v19 = v18;
      id v37 = 0;
      unsigned __int8 v20 = [v15 writeToURL:v19 error:&v37];
      id v21 = v37;

      if ((v20 & 1) == 0 && v21)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          CFStringRef v23 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          if (class_isMetaClass(Class)) {
            uint64_t v25 = 43;
          }
          else {
            uint64_t v25 = 45;
          }
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          if (self) {
            __int16 v28 = self->_lpcdCountersLoggingURL;
          }
          else {
            __int16 v28 = 0;
          }
          BOOL v29 = v28;
          v23(3, "%c[%{public}s %{public}s]:%i failed to write to URL:%{public}@  error:%{public}@", v25, ClassName, Name, 37, v29, v21);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        int v30 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          int v31 = object_getClass(self);
          if (class_isMetaClass(v31)) {
            int v32 = 43;
          }
          else {
            int v32 = 45;
          }
          char v33 = object_getClassName(self);
          id v34 = sel_getName(a2);
          if (self) {
            __int16 v35 = self->_lpcdCountersLoggingURL;
          }
          else {
            __int16 v35 = 0;
          }
          uint64_t v36 = v35;
          *(_DWORD *)buf = 67110402;
          int v39 = v32;
          __int16 v40 = 2082;
          __int16 v41 = v33;
          __int16 v42 = 2082;
          id v43 = v34;
          __int16 v44 = 1024;
          int v45 = 37;
          __int16 v46 = 2114;
          __int16 v47 = v36;
          __int16 v48 = 2114;
          id v49 = v21;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i failed to write to URL:%{public}@  error:%{public}@", buf, 0x36u);
        }
      }
    }
  }
}

- (id)_updateAllPowerCounters
{
  uint64_t v3 = [(_NFHardwareManager *)self driverWrapper];
  id v44 = 0;
  id v38 = sub_1001E73CC(v3, &v44);
  id v37 = v44;

  if (v38)
  {
    if ([v38 code] != (id)45)
    {
      int v32 = v38;
      id v31 = v38;
      goto LABEL_43;
    }
    if (!self) {
      goto LABEL_46;
    }
  }
  else
  {
    if (!self)
    {
LABEL_46:
      id Property = 0;
      char v7 = 1;
      goto LABEL_10;
    }
    if (self->_lpcdFalseDetectLoggingEnabled && [v37 count])
    {
      id v5 = [v37 objectForKeyedSubscript:@"lpcdFalseDetectCount"];
      -[_NFHardwareManager logLPCDFalseDetects:](self, "logLPCDFalseDetects:", [v5 intValue]);
    }
  }
  id Property = objc_getProperty(self, v4, 176, 1);
  char v7 = 0;
LABEL_10:
  id v34 = Property;
  objc_sync_enter(v34);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  if (v7) {
    id v9 = 0;
  }
  else {
    id v9 = objc_getProperty(self, v8, 176, 1);
  }
  id obj = v9;
  id v10 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  char v36 = v7;
  if (v10)
  {
    uint64_t v39 = *(void *)v41;
    do
    {
      unsigned int v11 = 0;
      do
      {
        if (*(void *)v41 != v39) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v40 + 1) + 8 * (void)v11);
        SEL v13 = [v12 NF_userInfo:v34];
        id v14 = [v13 objectForKeyedSubscript:@"powerCounters"];

        if (v14)
        {
          id v15 = [(_NFHardwareManager *)self controllerInfo];
          if ([v15 siliconName] == (id)14)
          {
            BOOL v16 = 1;
          }
          else
          {
            int v17 = [(_NFHardwareManager *)self controllerInfo];
            if ([v17 siliconName] == (id)15)
            {
              BOOL v16 = 1;
            }
            else
            {
              uint64_t v18 = [(_NFHardwareManager *)self controllerInfo];
              if ([v18 siliconName] == (id)16)
              {
                BOOL v16 = 1;
              }
              else
              {
                int v19 = [(_NFHardwareManager *)self controllerInfo];
                BOOL v16 = [v19 siliconName] == (id)17;
              }
            }
          }
          if (v36) {
            id v21 = 0;
          }
          else {
            id v21 = objc_getProperty(self, v20, 40, 1);
          }
          id v22 = v21;
          CFStringRef v23 = [v22 sequenceCounter];
          unsigned int v24 = [v23 unsignedIntValue];

          uint64_t v25 = [(_NFHardwareManager *)self driverWrapper];
          if (v38) {
            BOOL v26 = [v38 code] == (id)45;
          }
          else {
            BOOL v26 = 0;
          }
          int v27 = v24 < 0x212 && v16;
          __int16 v28 = sub_1001E8404((uint64_t)v25, v14, v37, v26, v27);

          if (v28)
          {
            BOOL v29 = [v12 NF_userInfo];
            [v29 setObject:v28 forKeyedSubscript:@"powerCounters"];
          }
        }
        unsigned int v11 = (char *)v11 + 1;
      }
      while (v10 != v11);
      id v30 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
      id v10 = v30;
    }
    while (v30);
  }

  objc_sync_exit(v34);
  id v31 = 0;
  int v32 = v38;
LABEL_43:

  return v31;
}

- (id)updateAllPowerCounters
{
  if (self && self->_systemWillSleep)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int v19 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v23 = 45;
      if (isMetaClass) {
        uint64_t v23 = 43;
      }
      v19(3, "%c[%{public}s %{public}s]:%i Cannot fetch power counters when device is going to sleep", v23, ClassName, Name, 94);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    unsigned int v24 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = object_getClass(self);
      if (class_isMetaClass(v25)) {
        int v26 = 43;
      }
      else {
        int v26 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v70 = v26;
      __int16 v71 = 2082;
      id v72 = object_getClassName(self);
      __int16 v73 = 2082;
      uint64_t v74 = sel_getName(a2);
      __int16 v75 = 1024;
      int v76 = 94;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Cannot fetch power counters when device is going to sleep", buf, 0x22u);
    }

    id v27 = objc_alloc((Class)NSError);
    id v5 = +[NSString stringWithUTF8String:"nfcd"];
    v79[0] = NSLocalizedDescriptionKey;
    id v15 = +[NSString stringWithUTF8String:"Busy"];
    v80[0] = v15;
    v80[1] = &off_10031F720;
    v79[1] = @"Line";
    v79[2] = @"Method";
    id v28 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v80[2] = v28;
    v79[3] = NSDebugDescriptionErrorKey;
    id v29 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 95];
    v80[3] = v29;
    id v30 = +[NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:4];
    id v31 = [v27 initWithDomain:v5 code:2 userInfo:v30];

    goto LABEL_40;
  }
  id v4 = [(_NFHardwareManager *)self driverWrapper];
  id v5 = sub_10020EC8C(v4, @"Power Counters", 1uLL);

  if (v5)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v6 = NFLogGetLogger();
    if (v6)
    {
      char v7 = (void (*)(uint64_t, const char *, ...))v6;
      id v8 = object_getClass(self);
      BOOL v9 = class_isMetaClass(v8);
      id v59 = object_getClassName(self);
      id v60 = sel_getName(a2);
      uint64_t v10 = 45;
      if (v9) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i Failed to open session : %@", v10, v59, v60, 100, v5);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    unsigned int v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = object_getClass(self);
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v70 = v13;
      __int16 v71 = 2082;
      id v72 = object_getClassName(self);
      __int16 v73 = 2082;
      uint64_t v74 = sel_getName(a2);
      __int16 v75 = 1024;
      int v76 = 100;
      __int16 v77 = 2112;
      uint64_t v78 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open session : %@", buf, 0x2Cu);
    }

    id v14 = objc_alloc((Class)NSError);
    id v15 = +[NSString stringWithUTF8String:"nfcd"];
    id v16 = [v5 code];
    v67[0] = NSLocalizedDescriptionKey;
    if ((uint64_t)[v5 code] > 70) {
      uint64_t v17 = 71;
    }
    else {
      uint64_t v17 = (uint64_t)[v5 code];
    }
    id v49 = +[NSString stringWithUTF8String:(&off_100307310)[v17]];
    v68[0] = v49;
    v68[1] = v5;
    v67[1] = NSUnderlyingErrorKey;
    v67[2] = @"Line";
    v68[2] = &off_10031F738;
    v67[3] = @"Method";
    id v50 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v68[3] = v50;
    v67[4] = NSDebugDescriptionErrorKey;
    id v51 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 101];
    v68[4] = v51;
    __int16 v52 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:5];
    id v31 = [v14 initWithDomain:v15 code:v16 userInfo:v52];

LABEL_40:
    goto LABEL_41;
  }
  if (self)
  {
    int v32 = self->_expressModeManager;
    if (v32)
    {
      BOOL expressModeInProgress = v32->_expressModeInProgress;

      if (expressModeInProgress)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v34 = NFLogGetLogger();
        if (v34)
        {
          __int16 v35 = (void (*)(uint64_t, const char *, ...))v34;
          char v36 = object_getClass(self);
          BOOL v37 = class_isMetaClass(v36);
          id v38 = object_getClassName(self);
          id v62 = sel_getName(a2);
          uint64_t v39 = 45;
          if (v37) {
            uint64_t v39 = 43;
          }
          v35(5, "%c[%{public}s %{public}s]:%i Cannot fetch power counters when express mode is active", v39, v38, v62, 106);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        long long v40 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          long long v41 = object_getClass(self);
          if (class_isMetaClass(v41)) {
            int v42 = 43;
          }
          else {
            int v42 = 45;
          }
          *(_DWORD *)buf = 67109890;
          int v70 = v42;
          __int16 v71 = 2082;
          id v72 = object_getClassName(self);
          __int16 v73 = 2082;
          uint64_t v74 = sel_getName(a2);
          __int16 v75 = 1024;
          int v76 = 106;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Cannot fetch power counters when express mode is active", buf, 0x22u);
        }

        id v43 = objc_alloc((Class)NSError);
        id v44 = +[NSString stringWithUTF8String:"nfcd"];
        v65[0] = NSLocalizedDescriptionKey;
        int v45 = +[NSString stringWithUTF8String:"Busy"];
        v66[0] = v45;
        v66[1] = &off_10031F750;
        v65[1] = @"Line";
        v65[2] = @"Method";
        id v46 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v66[2] = v46;
        v65[3] = NSDebugDescriptionErrorKey;
        id v47 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 107];
        v66[3] = v47;
        __int16 v48 = +[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:4];
        id v31 = [v43 initWithDomain:v44 code:2 userInfo:v48];
        goto LABEL_50;
      }
    }
  }
  uint64_t v54 = [(_NFHardwareManager *)self _updateAllPowerCounters];
  if (v54)
  {
    __int16 v55 = (void *)v54;
    id v56 = objc_alloc((Class)NSError);
    id v44 = +[NSString stringWithUTF8String:"nfcd"];
    id v57 = [v55 code];
    v63[0] = NSLocalizedDescriptionKey;
    if ((uint64_t)[v55 code] > 70) {
      uint64_t v58 = 71;
    }
    else {
      uint64_t v58 = (uint64_t)[v55 code];
    }
    int v45 = +[NSString stringWithUTF8String:(&off_100307310)[v58]];
    v64[0] = v45;
    v64[1] = v55;
    v63[1] = NSUnderlyingErrorKey;
    v63[2] = @"Line";
    v64[2] = &off_10031F768;
    v63[3] = @"Method";
    id v46 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v64[3] = v46;
    v63[4] = NSDebugDescriptionErrorKey;
    id v47 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 111];
    void v64[4] = v47;
    __int16 v48 = +[NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:5];
    id v31 = [v56 initWithDomain:v44 code:v57 userInfo:v48];

LABEL_50:
    goto LABEL_51;
  }
  id v31 = 0;
LABEL_51:
  id v5 = [(_NFHardwareManager *)self driverWrapper];
  sub_1002114AC(v5, @"Power Counters");
LABEL_41:

  return v31;
}

- (void)getPowerCountersWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[NSXPCConnection currentConnection];
  uint64_t v6 = sub_10012050C((id *)&self->super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002077A0;
  block[3] = &unk_100304588;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

- (void)_sync_getPowerCountersForConnection:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *))a4;
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 2)
  {
    id v8 = [v6 NF_userInfo];
    BOOL v9 = [v8 objectForKeyedSubscript:@"powerCounters"];

    if (!v9)
    {
      id v10 = objc_opt_new();
      id v11 = [v6 NF_userInfo];
      [v11 setObject:v10 forKeyedSubscript:@"powerCounters"];
    }
    id v12 = [(_NFHardwareManager *)self updateAllPowerCounters];
    if (v12)
    {
      int v13 = 0;
    }
    else
    {
      uint64_t v18 = [v6 NF_userInfo];
      int v13 = [v18 objectForKeyedSubscript:@"powerCounters"];

      int v19 = objc_opt_new();
      unsigned __int8 v20 = [v6 NF_userInfo];
      [v20 setObject:v19 forKeyedSubscript:@"powerCounters"];
    }
    v7[2](v7, v12, v13);
  }
  else
  {
    id v14 = objc_alloc((Class)NSError);
    id v12 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    id v15 = +[NSString stringWithUTF8String:"Unresponsive hardware"];
    id v22 = v15;
    id v16 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v17 = [v14 initWithDomain:v12 code:58 userInfo:v16];
    v7[2](v7, v17, 0);
  }
}

- (id)combineFlashWriteCounters:(id)a3 with:(id)a4 overflow:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = +[NSMutableDictionary dictionary];
  if ([v7 count])
  {
    id v10 = [v7 objectForKeyedSubscript:@"NFCC Write Counters"];
    unsigned int v11 = [v10 intValue];
    id v12 = [v8 objectForKeyedSubscript:@"NFCC Write Counters"];
    uint64_t v13 = [v12 intValue] + v11;

    id v14 = +[NSNumber numberWithUnsignedInt:v13];
    [v9 setObject:v14 forKeyedSubscript:@"NFCC Write Counters"];

    if (v5)
    {
      id v15 = +[NSNumber numberWithBool:1];
      [v9 setObject:v15 forKeyedSubscript:@"NFCC Write Counters Overflow"];
    }
    id v16 = [v9 copy];
  }
  else
  {
    if (v5)
    {
      [v9 addEntriesFromDictionary:v8];
      id v17 = +[NSNumber numberWithBool:1];
      [v9 setObject:v17 forKeyedSubscript:@"NFCC Write Counters Overflow"];

      id v18 = v9;
    }
    else
    {
      id v18 = v8;
    }
    id v16 = +[NSDictionary dictionaryWithDictionary:v18];
  }
  int v19 = v16;

  return v19;
}

- (id)openStackAndUpdateAllWriteCounters:(id *)a3
{
  if (self && self->_systemWillSleep)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      NSErrorUserInfoKey v21 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v25 = 45;
      if (isMetaClass) {
        uint64_t v25 = 43;
      }
      v21(3, "%c[%{public}s %{public}s]:%i Cannot fetch write counters when device is going to sleep", v25, ClassName, Name, 265);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v26 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = object_getClass(self);
      if (class_isMetaClass(v27)) {
        int v28 = 43;
      }
      else {
        int v28 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v80 = v28;
      __int16 v81 = 2082;
      uint64_t v82 = object_getClassName(self);
      __int16 v83 = 2082;
      uint64_t v84 = sel_getName(a2);
      __int16 v85 = 1024;
      int v86 = 265;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Cannot fetch write counters when device is going to sleep", buf, 0x22u);
    }

    if (!a3)
    {
      id v35 = 0;
      id v7 = 0;
      goto LABEL_55;
    }
    id v29 = objc_alloc((Class)NSError);
    id v30 = +[NSString stringWithUTF8String:"nfcd"];
    v89[0] = NSLocalizedDescriptionKey;
    id v31 = +[NSString stringWithUTF8String:"Busy"];
    v90[0] = v31;
    v90[1] = &off_10031F7B0;
    v89[1] = @"Line";
    v89[2] = @"Method";
    id v32 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v90[2] = v32;
    v89[3] = NSDebugDescriptionErrorKey;
    id v33 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 266];
    v90[3] = v33;
    uint64_t v34 = +[NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:4];
    *a3 = [v29 initWithDomain:v30 code:2 userInfo:v34];

    id v35 = 0;
    id v7 = 0;
LABEL_54:
    a3 = 0;
    goto LABEL_55;
  }
  id v6 = [(_NFHardwareManager *)self driverWrapper];
  sub_10020EC8C(v6, @"Write Counters", 1uLL);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v8 = NFLogGetLogger();
    if (v8)
    {
      BOOL v9 = (void (*)(uint64_t, const char *, ...))v8;
      id v10 = object_getClass(self);
      BOOL v11 = class_isMetaClass(v10);
      uint64_t v68 = object_getClassName(self);
      __int16 v69 = sel_getName(a2);
      uint64_t v12 = 45;
      if (v11) {
        uint64_t v12 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Failed to open session : %@", v12, v68, v69, 272, v7);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = object_getClass(self);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v80 = v15;
      __int16 v81 = 2082;
      uint64_t v82 = object_getClassName(self);
      __int16 v83 = 2082;
      uint64_t v84 = sel_getName(a2);
      __int16 v85 = 1024;
      int v86 = 272;
      __int16 v87 = 2112;
      id v88 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open session : %@", buf, 0x2Cu);
    }

    if (!a3)
    {
      id v35 = 0;
      goto LABEL_55;
    }
    id v16 = objc_alloc((Class)NSError);
    id v17 = +[NSString stringWithUTF8String:"nfcd"];
    id v18 = [v7 code];
    v77[0] = NSLocalizedDescriptionKey;
    if ((uint64_t)[v7 code] > 70) {
      uint64_t v19 = 71;
    }
    else {
      uint64_t v19 = (uint64_t)[v7 code];
    }
    uint64_t v53 = +[NSString stringWithUTF8String:(&off_100307310)[v19]];
    v78[0] = v53;
    v78[1] = v7;
    v77[1] = NSUnderlyingErrorKey;
    void v77[2] = @"Line";
    void v78[2] = &off_10031F7C8;
    v77[3] = @"Method";
    id v54 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v78[3] = v54;
    v77[4] = NSDebugDescriptionErrorKey;
    id v55 = [[objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 273];
    v78[4] = v55;
    id v56 = +[NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:5];
    *a3 = [v16 initWithDomain:v17 code:v18 userInfo:v56];

    id v35 = 0;
    goto LABEL_54;
  }
  if (self
    && (char v36 = self->_expressModeManager) != 0
    && (BOOL expressModeInProgress = v36->_expressModeInProgress, v36, expressModeInProgress))
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v38 = NFLogGetLogger();
    if (v38)
    {
      uint64_t v39 = (void (*)(uint64_t, const char *, ...))v38;
      long long v40 = object_getClass(self);
      BOOL v41 = class_isMetaClass(v40);
      int v42 = object_getClassName(self);
      __int16 v71 = sel_getName(a2);
      uint64_t v43 = 45;
      if (v41) {
        uint64_t v43 = 43;
      }
      v39(5, "%c[%{public}s %{public}s]:%i Cannot fetch write counters when express mode is active", v43, v42, v71, 279);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v44 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      int v45 = object_getClass(self);
      if (class_isMetaClass(v45)) {
        int v46 = 43;
      }
      else {
        int v46 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v80 = v46;
      __int16 v81 = 2082;
      uint64_t v82 = object_getClassName(self);
      __int16 v83 = 2082;
      uint64_t v84 = sel_getName(a2);
      __int16 v85 = 1024;
      int v86 = 279;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Cannot fetch write counters when express mode is active", buf, 0x22u);
    }

    id v47 = objc_alloc((Class)NSError);
    __int16 v48 = +[NSString stringWithUTF8String:"nfcd"];
    v75[0] = NSLocalizedDescriptionKey;
    id v49 = +[NSString stringWithUTF8String:"Busy"];
    v76[0] = v49;
    v76[1] = &off_10031F7E0;
    v75[1] = @"Line";
    v75[2] = @"Method";
    id v50 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v76[2] = v50;
    v75[3] = NSDebugDescriptionErrorKey;
    id v51 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 280];
    v76[3] = v51;
    __int16 v52 = +[NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:4];
    id v7 = [v47 initWithDomain:v48 code:2 userInfo:v52];

    id v35 = 0;
  }
  else
  {
    id v57 = sub_100207BA8(self);
    __int16 v48 = [(_NFHardwareManager *)self driverWrapper];
    id v72 = 0;
    sub_1001E8EC0(v48, &v72);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v35 = v72;
  }

  uint64_t v58 = [(_NFHardwareManager *)self driverWrapper];
  sub_1002114AC(v58, @"Write Counters");

  if (v7)
  {
    if (!a3) {
      goto LABEL_55;
    }
    id v59 = objc_alloc((Class)NSError);
    id v60 = +[NSString stringWithUTF8String:"nfcd"];
    id v61 = [v7 code];
    v73[0] = NSLocalizedDescriptionKey;
    if ((uint64_t)[v7 code] > 70) {
      uint64_t v62 = 71;
    }
    else {
      uint64_t v62 = (uint64_t)[v7 code];
    }
    __int16 v63 = +[NSString stringWithUTF8String:(&off_100307310)[v62]];
    v74[0] = v63;
    v74[1] = v7;
    v73[1] = NSUnderlyingErrorKey;
    void v73[2] = @"Line";
    v74[2] = &off_10031F7F8;
    v73[3] = @"Method";
    id v64 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v74[3] = v64;
    v73[4] = NSDebugDescriptionErrorKey;
    id v65 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 289];
    v74[4] = v65;
    uint64_t v66 = +[NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:5];
    *a3 = [v59 initWithDomain:v60 code:v61 userInfo:v66];

    goto LABEL_54;
  }
  if (a3) {
    *a3 = 0;
  }
  id v35 = v35;
  id v7 = 0;
  a3 = (id *)v35;
LABEL_55:

  return a3;
}

- (void)getFlashWriteCountersWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NSXPCConnection currentConnection];
  id v6 = sub_10012050C((id *)&self->super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100208C50;
  block[3] = &unk_100304588;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

- (void)_sync_getFlashWriteCountersForConnection:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, id, void *))a4;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    [v7 NF_userInfo];
    int v15 = a2;
    id v16 = v7;
    v18 = id v17 = v8;
    uint64_t v19 = [v18 objectForKeyedSubscript:@"ClientName"];
    uint64_t v20 = 45;
    if (isMetaClass) {
      uint64_t v20 = 43;
    }
    v10(6, "%c[%{public}s %{public}s]:%i %{public}@ requesting write counters", v20, ClassName, Name, 309, v19);

    id v8 = v17;
    id v7 = v16;
    a2 = v15;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  NSErrorUserInfoKey v21 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = object_getClass(self);
    if (class_isMetaClass(v22)) {
      int v23 = 43;
    }
    else {
      int v23 = 45;
    }
    unsigned int v24 = object_getClassName(self);
    uint64_t v25 = sel_getName(a2);
    int v26 = [v7 NF_userInfo];
    id v27 = [v26 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    int v45 = v23;
    __int16 v46 = 2082;
    id v47 = v24;
    __int16 v48 = 2082;
    id v49 = v25;
    __int16 v50 = 1024;
    int v51 = 309;
    __int16 v52 = 2114;
    uint64_t v53 = v27;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ requesting write counters", buf, 0x2Cu);
  }
  if (-[_NFHardwareManager getPrimaryHardwareState]_0((uint64_t)self) == 2)
  {
    int v28 = [v7 NF_userInfo];
    id v29 = [v28 objectForKeyedSubscript:@"flashWriteCounters"];

    if (!v29)
    {
      id v30 = +[NSDictionary dictionary];
      id v31 = [v7 NF_userInfo];
      [v31 setObject:v30 forKeyedSubscript:@"flashWriteCounters"];
    }
    id v32 = objc_opt_new();
    id v41 = 0;
    id v33 = [(_NFHardwareManager *)self openStackAndUpdateAllWriteCounters:&v41];
    id v34 = v41;
    if (!v34)
    {
      id v35 = [v7 NF_userInfo];
      char v36 = [v35 objectForKeyedSubscript:@"flashWriteCounters"];
      [v32 addEntriesFromDictionary:v36];

      BOOL v37 = +[NSDictionary dictionary];
      uint64_t v38 = [v7 NF_userInfo];
      [v38 setObject:v37 forKeyedSubscript:@"flashWriteCounters"];

      if ([v33 count]) {
        [v32 setObject:v33 forKeyedSubscript:@"NFCC Page Erase Counters"];
      }
    }
    v8[2](v8, v34, v32);
  }
  else
  {
    id v39 = objc_alloc((Class)NSError);
    id v34 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
    id v32 = +[NSString stringWithUTF8String:"Unresponsive hardware"];
    uint64_t v43 = v32;
    id v33 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    id v40 = [v39 initWithDomain:v34 code:58 userInfo:v33];
    v8[2](v8, v40, 0);
  }
}

@end