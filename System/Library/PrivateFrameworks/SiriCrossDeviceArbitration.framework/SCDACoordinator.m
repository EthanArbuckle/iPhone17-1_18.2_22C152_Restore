@interface SCDACoordinator
+ (id)currentCoordinator;
+ (void)clearCurrentCoordinator;
+ (void)didChangeDefaults;
+ (void)initialize;
- (BOOL)_deviceShouldContinue:(id)a3;
- (BOOL)_isAPhone:(unsigned __int8)a3;
- (BOOL)_okayToSuppressOnOutput;
- (BOOL)_shouldContinueFor:(id)a3;
- (BOOL)_shouldHandleEmergency;
- (BOOL)_shouldStopListeningBeforeAdvertising;
- (BOOL)_shouldUseContextCollector;
- (BOOL)_testAndUpdateWedgeFilter:(id)a3;
- (BOOL)endWaitingForEmergency;
- (BOOL)inTask;
- (SCDACoordinator)initWithDelegate:(id)a3;
- (double)_contextFetchDelayForAdvertimentInterval:(double)a3 advertisementDelay:(double)a4;
- (float)deviceTrumpDelay;
- (id)_myriadSession;
- (id)_phsSetupRecord;
- (id)_sortedReplies;
- (id)_sortedReplies:(id)a3;
- (id)_stateAsString;
- (id)_stateAsString:(unint64_t)a3;
- (id)_testAndFilterAdvertisementsFromContextCollector:(id)a3 voiceTriggerEndTime:(double)a4 advertisementDispatchTime:(double)a5 advertisement:(id)a6;
- (id)continuationRecord;
- (id)directTriggerRecord;
- (id)emergencyHandledRecord;
- (id)emergencyRecord;
- (id)emptyRecord;
- (id)lateSuppressionRecord;
- (id)responseObject:(unsigned __int16)a3;
- (id)slowdownRecord:(unsigned __int16)a3;
- (id)voiceTriggerRecord;
- (int)_cdaParticipantForDeviceClass:(unsigned __int8)a3 andProducType:(unsigned __int8)a4;
- (int)_myriadStateForSelf:(unint64_t)a3;
- (unint64_t)_nextElectionPublisherState;
- (unsigned)deviceClass;
- (unsigned)deviceGroup;
- (void)_addElectionAdvertisementDataToMyriadSession:(id)a3;
- (void)_adjustActionWindowsFromSlowdown:(int)a3;
- (void)_advertise:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5 voiceTriggerLatency:(float)a6 andMoveTo:(unint64_t)a7;
- (void)_advertise:(id)a3 andMoveTo:(unint64_t)a4;
- (void)_advertiseIndefinite:(id)a3;
- (void)_advertiseSlowdown;
- (void)_advertiseSuppressTriggerInOutput;
- (void)_advertiseTrigger;
- (void)_advertiseWith:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5 voiceTriggerLatency:(float)a6 thenExecute:(id)a7;
- (void)_ageWedgeFilter;
- (void)_cancelOverallTimeout;
- (void)_cancelTimer;
- (void)_clearMyriadSession;
- (void)_clearWiProxReadinessTimer;
- (void)_computeElectionParticipantIds:(id)a3;
- (void)_createDispatchTimerFor:(double)a3 toExecute:(id)a4;
- (void)_createDispatchTimerForEvent:(id)a3 toExecute:(id)a4;
- (void)_createDispatchTimerWithTime:(unint64_t)a3 toExecute:(id)a4;
- (void)_createElectionParticipantIdVendorIfRequired;
- (void)_createMyriadSessionIfRequired;
- (void)_createWaitWiProxTimer:(int64_t)a3 waitBlock:(id)a4;
- (void)_duringNextWindowEnterState:(unint64_t)a3;
- (void)_duringNextWindowExecute:(id)a3;
- (void)_endAdvertising:(id)a3;
- (void)_endAdvertisingAnalyticsContext:(BOOL)a3;
- (void)_endAdvertisingWithDeviceProhibitions:(id)a3;
- (void)_enterBLEDiagnosticMode;
- (void)_enterState:(unint64_t)a3;
- (void)_enteringIntoState:(unint64_t)a3 fromState:(unint64_t)a4;
- (void)_forceLocalWinner:(id)a3;
- (void)_handleStateMachineErrorIfNeeded;
- (void)_initDeviceClassAndAdjustments;
- (void)_initializeTimer;
- (void)_initializeWiProxReadinessTimer;
- (void)_leaveBLEDiagnosticMode;
- (void)_loseElection;
- (void)_pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:(double)a3 advertisementDelay:(double)a4;
- (void)_readDefaults;
- (void)_resetActionWindows;
- (void)_resetAdvertisementTimings;
- (void)_resetAudioData;
- (void)_resumeWiProxReadinessTimer;
- (void)_setMyriadContext:(id)a3;
- (void)_setOverallTimeout;
- (void)_setupActionWindows;
- (void)_signalEmergencyCallHandled;
- (void)_startAdvertising:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5;
- (void)_startAdvertisingFromInTaskVoiceTrigger;
- (void)_startAdvertisingFromVoiceTrigger;
- (void)_startListenTimer;
- (void)_startListening:(id)a3;
- (void)_startListeningAfterWiProxIsReady:(BOOL)a3 inState:(unint64_t)a4 completion:(id)a5;
- (void)_startTimer:(id)a3 for:(float)a4 thenEnterState:(unint64_t)a5;
- (void)_startTimer:(id)a3 for:(float)a4 thenExecute:(id)a5;
- (void)_stopAdvertising:(id)a3;
- (void)_stopAdvertisingAndListening;
- (void)_stopListening:(id)a3;
- (void)_suppressDeviceIfNeededWithVoiceTriggerEndTime:(double)a3 adverisementDispatchTime:(double)a4;
- (void)_suspendWiProxReadinessTimer;
- (void)_trackHeySiriStartedAdvertisingAt:(unint64_t)a3;
- (void)_triggerABCForType:(id)a3 context:(id)a4;
- (void)_unduck;
- (void)_updateRepliesWith:(id)a3 id:(id)a4 data:(id)a5;
- (void)_updateVoiceTriggerTimeFromFile;
- (void)_waitWiProx:(int64_t)a3 andExecute:(id)a4;
- (void)_waitWiProxAndExecute:(id)a3;
- (void)_winElection;
- (void)advertiseWith:(id)a3;
- (void)advertiseWith:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5;
- (void)dealloc;
- (void)endAdvertising;
- (void)endAdvertising:(id)a3;
- (void)endAdvertisingAfterDelay:(float)a3;
- (void)endAdvertisingWithDeviceProhibitions:(id)a3;
- (void)endTask;
- (void)enterState:(unint64_t)a3;
- (void)faceDetectedBoostWithContext:(id)a3;
- (void)heySiri:(id)a3 failedToStartAdvertisingWithError:(id)a4;
- (void)heySiri:(id)a3 failedToStartScanningWithError:(id)a4;
- (void)heySiri:(id)a3 foundDevice:(id)a4 withInfo:(id)a5;
- (void)heySiriAdvertisingPending:(id)a3;
- (void)heySiriDidUpdateState:(id)a3;
- (void)heySiriStartedAdvertising:(id)a3;
- (void)heySiriStartedAdvertisingAt:(id)a3 timeStamp:(unint64_t)a4;
- (void)heySiriStartedScanning:(id)a3;
- (void)heySiriStoppedAdvertising:(id)a3;
- (void)heySiriStoppedScanning:(id)a3;
- (void)injectAdvertisementForTesting:(id)a3 forDevice:(id)a4;
- (void)instrumentationUpdateBoost:(unsigned __int8)a3 value:(unsigned int)a4;
- (void)myriadSession:(id)a3;
- (void)notifyCurrentDecisionResult;
- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4;
- (void)preheatWiProx;
- (void)readDefaults;
- (void)resetMyriadCoordinator:(id)a3;
- (void)resetReplies;
- (void)resetStateMachine;
- (void)setCurrentRequestId:(id)a3;
- (void)setInTask:(BOOL)a3;
- (void)setupAdvIntervalsInDelay:(float *)a3 interval:(float *)a4 voiceTriggerLatency:(float *)a5 withSlowdown:(int)a6;
- (void)setupEnabled:(BOOL)a3;
- (void)startAdvertising:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5;
- (void)startAdvertisingEmergency;
- (void)startAdvertisingEmergencyHandled;
- (void)startAdvertisingEmergencySignal;
- (void)startAdvertisingForPHSSetupAfterDelay:(float)a3 maxInterval:(float)a4;
- (void)startAdvertisingFromAlertFiringVoiceTrigger;
- (void)startAdvertisingFromAlertFiringVoiceTriggerWithContext:(id)a3;
- (void)startAdvertisingFromCarPlayTrigger;
- (void)startAdvertisingFromDirectTrigger;
- (void)startAdvertisingFromDirectTriggerWithContext:(id)a3;
- (void)startAdvertisingFromInEarTrigger;
- (void)startAdvertisingFromInTaskVoiceTrigger;
- (void)startAdvertisingFromInTaskVoiceTriggerWithContext:(id)a3;
- (void)startAdvertisingFromOutgoingTrigger;
- (void)startAdvertisingFromOutgoingTriggerWithContext:(id)a3;
- (void)startAdvertisingFromVoiceTrigger;
- (void)startAdvertisingFromVoiceTriggerAdjusted:(char)a3;
- (void)startAdvertisingFromVoiceTriggerAdjusted:(char)a3 withContext:(id)a4;
- (void)startAdvertisingFromVoiceTriggerWithContext:(id)a3;
- (void)startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:(id)a3 withContext:(id)a4;
- (void)startAdvertisingSlowdown:(unsigned __int16)a3;
- (void)startListening;
- (void)startListening:(id)a3;
- (void)startListeningToEmergencySignal;
- (void)startResponseAdvertising:(unsigned __int16)a3;
- (void)startWatchAdvertisingFromDirectTrigger;
- (void)startWatchAdvertisingFromDirectTriggerWithContext:(id)a3;
- (void)startWatchAdvertisingFromVoiceTrigger;
- (void)startWatchAdvertisingFromVoiceTriggerWithContext:(id)a3;
- (void)stopListening;
- (void)stopListening:(id)a3;
- (void)updateRequestId:(id)a3;
- (void)waitWiProx:(int64_t)a3 andExecute:(id)a4;
@end

@implementation SCDACoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastWonBySmallAmountDate, 0);
  objc_storeStrong((id *)&self->_currentRequestId, 0);
  objc_storeStrong((id *)&self->_myriadInstrumentation, 0);
  objc_storeStrong((id *)&self->_currentMyriadContext, 0);
  objc_storeStrong(&self->_waitForWiproxReadinessToScan, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_myriadStateMachineForceNoActivityObserver, 0);
  objc_storeStrong((id *)&self->_preferencesChangedNotification, 0);
  objc_storeStrong((id *)&self->_electionRepostWinDecisionPublisher, 0);
  objc_storeStrong((id *)&self->_electionLossPublisher, 0);
  objc_storeStrong((id *)&self->_electionWinPublisher, 0);
  objc_storeStrong((id *)&self->_electionBeginPublisher, 0);
  objc_storeStrong((id *)&self->_myriadSession, 0);
  objc_storeStrong((id *)&self->_goodnessScoreEvaluator, 0);
  objc_storeStrong((id *)&self->_contextRecord, 0);
  objc_storeStrong((id *)&self->_advContextManager, 0);

  objc_storeStrong((id *)&self->_sfDiagnosticsTimer, 0);
  objc_storeStrong((id *)&self->_sfdiagnostics, 0);
  objc_storeStrong((id *)&self->_callPunchout, 0);
  objc_storeStrong((id *)&self->_triggerTime, 0);
  objc_storeStrong((id *)&self->_designatedSelfID, 0);
  objc_storeStrong((id *)&self->_electionParticipantIds, 0);
  objc_storeStrong((id *)&self->_electionParticipantIdVendor, 0);
  objc_storeStrong((id *)&self->_heySiriBTLE, 0);
  objc_storeStrong((id *)&self->_dateFormat, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_maxSlowdownRecord, 0);
  objc_storeStrong((id *)&self->_overrideMyriadRecord, 0);
  objc_storeStrong((id *)&self->_triggerRecord, 0);
  objc_storeStrong((id *)&self->_powerAssertionManager, 0);
  objc_storeStrong((id *)&self->_overallTimeout, 0);
  objc_storeStrong((id *)&self->_eventToken, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_timerLabel, 0);
  objc_storeStrong((id *)&self->_myriadAdvertisementContextQueue, 0);
  objc_storeStrong((id *)&self->_myriadWorkQueue, 0);
  objc_storeStrong((id *)&self->_productTypeName, 0);
  objc_storeStrong((id *)&self->_deviceClassName, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_multipleContinuations, 0);
  objc_storeStrong((id *)&self->_incomingTrumps, 0);
  objc_storeStrong((id *)&self->_previousTrumps, 0);
  objc_storeStrong((id *)&self->_repliesBeforeDecision, 0);
  objc_storeStrong((id *)&self->_replyCounts, 0);
  objc_storeStrong((id *)&self->_replies, 0);
  objc_storeStrong((id *)&self->_previousAdvertisedData, 0);
}

- (void)resetMyriadCoordinator:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__SCDACoordinator_resetMyriadCoordinator___block_invoke;
  v7[3] = &unk_2654B8100;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

uint64_t __42__SCDACoordinator_resetMyriadCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _enterState:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)myriadSession:(id)a3
{
  if (a3) {
    (*((void (**)(id, SCDASession *))a3 + 2))(a3, self->_myriadSession);
  }
}

- (unsigned)deviceGroup
{
  return self->_deviceGroup;
}

- (unsigned)deviceClass
{
  return self->_deviceClass;
}

- (float)deviceTrumpDelay
{
  return self->_deviceTrumpDelay;
}

- (void)startAdvertisingEmergencySignal
{
  [(SCDACoordinator *)self _setupActionWindows];
  [(SCDACoordinator *)self _enterState:8];
}

- (BOOL)endWaitingForEmergency
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!+[SCDAUtilities isCommunal]) {
    return 0;
  }
  unint64_t myriadState = self->_myriadState;
  if (myriadState != 5 && self->_nextState != 5)
  {
    id v6 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      id v8 = [(SCDACoordinator *)self _stateAsString:myriadState];
      int v10 = 136315394;
      v11 = "-[SCDACoordinator endWaitingForEmergency]";
      __int16 v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_25C707000, v7, OS_LOG_TYPE_INFO, "%s endWaitingForEmergency called from invalid state: %@", (uint8_t *)&v10, 0x16u);
    }
    return 0;
  }
  [(SCDACoordinator *)self resetStateMachine];
  id v4 = SCDALogContextCore;
  BOOL v5 = 1;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    v11 = "-[SCDACoordinator endWaitingForEmergency]";
    _os_log_impl(&dword_25C707000, v4, OS_LOG_TYPE_INFO, "%s Ending Continuation Early", (uint8_t *)&v10, 0xCu);
  }
  return v5;
}

- (void)startListeningToEmergencySignal
{
  [(SCDACoordinator *)self _setupActionWindows];
  [(SCDACoordinator *)self _enterState:7];
}

- (void)injectAdvertisementForTesting:(id)a3 forDevice:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    uint64_t v9 = getWPHeySiriKeyManufacturerData();
    int v10 = (void *)v9;
    if (v9)
    {
      uint64_t v12 = v9;
      v13[0] = v6;
      v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
      [(SCDACoordinator *)self heySiri:self->_heySiriBTLE foundDevice:v8 withInfo:v11];
    }
  }
}

- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = (SCDANotifyObserver *)a3;
  id v7 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    uint64_t v9 = [(SCDANotifyObserver *)v6 name];
    int v10 = 136315650;
    v11 = "-[SCDACoordinator notifyObserver:didReceiveNotificationWithToken:]";
    __int16 v12 = 2112;
    v13 = v9;
    __int16 v14 = 1024;
    int v15 = a4;
    _os_log_impl(&dword_25C707000, v8, OS_LOG_TYPE_INFO, "%s Notification received: %@ (%d)", (uint8_t *)&v10, 0x1Cu);
  }
  if (self->_preferencesChangedNotification == v6)
  {
    [(SCDACoordinator *)self _readDefaults];
  }
  else if (self->_myriadStateMachineForceNoActivityObserver == v6)
  {
    if (SCDAIsInternalInstall_onceToken != -1) {
      dispatch_once(&SCDAIsInternalInstall_onceToken, &__block_literal_global_1260);
    }
    if (SCDAIsInternalInstall_isInternal) {
      [(SCDACoordinator *)self _enterState:0];
    }
  }
}

- (void)_signalEmergencyCallHandled
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    id v8 = "-[SCDACoordinator _signalEmergencyCallHandled]";
    _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained(&self->_delegate);
    [v6 scdaCoordinatorDidHandleEmergency:self];
  }
}

- (void)heySiri:(id)a3 failedToStartScanningWithError:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  kdebug_trace();
  id v6 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[SCDACoordinator heySiri:failedToStartScanningWithError:]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_error_impl(&dword_25C707000, v6, OS_LOG_TYPE_ERROR, "%s BTLE daemon failed to start scanning with error %@", (uint8_t *)&v7, 0x16u);
  }
  [(SCDACoordinator *)self _leaveBLEDiagnosticMode];
}

- (void)heySiriStoppedScanning:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[SCDACoordinator heySiriStoppedScanning:]";
    _os_log_impl(&dword_25C707000, v5, OS_LOG_TYPE_INFO, "%s BTLE daemon scanning ends", (uint8_t *)&v9, 0xCu);
  }
  [(SCDACoordinator *)self _leaveBLEDiagnosticMode];
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained(&self->_delegate);
    [v8 myriadCoordinatorBTLEDidEndScanning:self];
  }
}

- (void)heySiriStartedScanning:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[SCDACoordinator heySiriStartedScanning:]";
    _os_log_impl(&dword_25C707000, v5, OS_LOG_TYPE_INFO, "%s BTLE daemon scanning begins", (uint8_t *)&v9, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained(&self->_delegate);
    [v8 myriadCoordinatorBTLEDidStartScanning:self];
  }
}

- (void)heySiri:(id)a3 failedToStartAdvertisingWithError:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a4;
  id v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    char v7 = "-[SCDACoordinator heySiri:failedToStartAdvertisingWithError:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_error_impl(&dword_25C707000, v5, OS_LOG_TYPE_ERROR, "%s BTLE daemon failed to start advertising with error %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)heySiriStoppedAdvertising:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  kdebug_trace();
  if (self->_myriadState != 5)
  {
    myriadInstrumentation = self->_myriadInstrumentation;
    uint64_t v5 = -[SCDACoordinator _myriadStateForSelf:](self, "_myriadStateForSelf:");
    int v6 = [(SCDASession *)self->_myriadSession sessionId];
    [(SCDAInstrumentation *)myriadInstrumentation logCDAElectionAdvertisingEnded:v5 withCdaId:v6 withTimestamp:mach_absolute_time()];
  }
  char v7 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    __int16 v8 = v7;
    uint64_t v9 = mach_absolute_time();
    int v13 = 136315394;
    __int16 v14 = "-[SCDACoordinator heySiriStoppedAdvertising:]";
    __int16 v15 = 2048;
    unint64_t Milliseconds = SCDAMachAbsoluteTimeGetMilliseconds(v9);
    _os_log_impl(&dword_25C707000, v8, OS_LOG_TYPE_INFO, "%s BTLE daemon advertising ends at: %lld", (uint8_t *)&v13, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained(&self->_delegate);
    [v12 myriadCoordinatorBTLEDidEndAdvertising:self];
  }
}

- (void)heySiriAdvertisingPending:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[SCDACoordinator heySiriAdvertisingPending:]";
    _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s BTLE daemon advertising overridden and now pending", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_trackHeySiriStartedAdvertisingAt:(unint64_t)a3
{
  kdebug_trace();
  if (self->_myriadState != 5)
  {
    myriadInstrumentation = self->_myriadInstrumentation;
    uint64_t v6 = -[SCDACoordinator _myriadStateForSelf:](self, "_myriadStateForSelf:");
    char v7 = [(SCDASession *)self->_myriadSession sessionId];
    [(SCDAInstrumentation *)myriadInstrumentation logCDAElectionAdvertisingStarted:v6 withCdaId:v7 withTimestamp:a3];
  }
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained(&self->_delegate);
    [v10 myriadCoordinatorBTLEDidStartAdvertising:self];
  }
}

- (void)heySiriStartedAdvertising:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (+[SCDAUtilities isHorseman]
    || +[SCDAUtilities isATV]
    || +[SCDAUtilities isNano])
  {
    int v4 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      char v9 = "-[SCDACoordinator heySiriStartedAdvertising:]";
      _os_log_impl(&dword_25C707000, v4, OS_LOG_TYPE_INFO, "%s No longer used by this device.", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    uint64_t v5 = mach_absolute_time();
    uint64_t v6 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      char v7 = v6;
      int v8 = 136315394;
      char v9 = "-[SCDACoordinator heySiriStartedAdvertising:]";
      __int16 v10 = 2048;
      unint64_t Milliseconds = SCDAMachAbsoluteTimeGetMilliseconds(v5);
      _os_log_impl(&dword_25C707000, v7, OS_LOG_TYPE_INFO, "%s BTLE daemon advertising begins at: %lld", (uint8_t *)&v8, 0x16u);
    }
    [(SCDACoordinator *)self _trackHeySiriStartedAdvertisingAt:v5];
  }
}

- (void)heySiriStartedAdvertisingAt:(id)a3 timeStamp:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (+[SCDAUtilities isHorseman]
    || +[SCDAUtilities isATV]
    || +[SCDAUtilities isNano])
  {
    uint64_t v6 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      char v7 = v6;
      int v9 = 136315394;
      __int16 v10 = "-[SCDACoordinator heySiriStartedAdvertisingAt:timeStamp:]";
      __int16 v11 = 2048;
      unint64_t Milliseconds = SCDAMachAbsoluteTimeGetMilliseconds(a4);
      _os_log_impl(&dword_25C707000, v7, OS_LOG_TYPE_INFO, "%s BTLE daemon advertising begins at: %lld", (uint8_t *)&v9, 0x16u);
    }
    [(SCDACoordinator *)self _trackHeySiriStartedAdvertisingAt:a4];
  }
  else
  {
    int v8 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      __int16 v10 = "-[SCDACoordinator heySiriStartedAdvertisingAt:timeStamp:]";
      _os_log_impl(&dword_25C707000, v8, OS_LOG_TYPE_INFO, "%s Not yet supported on this device.", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)heySiri:(id)a3 foundDevice:(id)a4 withInfo:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v28 = a3;
  id v30 = a4;
  id v29 = a5;
  [(SCDACoordinator *)self _createElectionParticipantIdVendorIfRequired];
  [(SCDAElectionParticipantIdVendor *)self->_electionParticipantIdVendor fetchBTLEAddressIfRequired];
  int v8 = getWPHeySiriKeyManufacturerData();
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  int v9 = (id *)getWPHeySiriKeyDeviceAddressSymbolLoc_ptr;
  uint64_t v41 = getWPHeySiriKeyDeviceAddressSymbolLoc_ptr;
  if (!getWPHeySiriKeyDeviceAddressSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getWPHeySiriKeyDeviceAddressSymbolLoc_block_invoke;
    *(void *)&buf[24] = &unk_2654B7FF8;
    *(void *)&buf[32] = &v38;
    __int16 v10 = (void *)WirelessProximityLibrary();
    __int16 v11 = dlsym(v10, "WPHeySiriKeyDeviceAddress");
    *(void *)(*(void *)(*(void *)&buf[32] + 8) + 24) = v11;
    getWPHeySiriKeyDeviceAddressSymbolLoc_ptr = *(void *)(*(void *)(*(void *)&buf[32] + 8) + 24);
    int v9 = (id *)v39[3];
  }
  _Block_object_dispose(&v38, 8);
  if (!v9)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  id v12 = *v9;
  uint64_t v13 = v12;
  if (v8)
  {
    __int16 v14 = [v29 objectForKey:v8];
    if (v13)
    {
LABEL_6:
      __int16 v15 = [v29 objectForKey:v13];
      goto LABEL_9;
    }
  }
  else
  {
    __int16 v14 = 0;
    if (v12) {
      goto LABEL_6;
    }
  }
  __int16 v15 = 0;
LABEL_9:
  uint64_t v16 = +[SCDAElectionParticipantIdVendor computeId:v15 withPayload:v14];
  uint64_t v17 = [[SCDARecord alloc] initWithDeviceID:v30 data:v14 electionParticipantId:v16];
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    id v20 = objc_loadWeakRetained(&self->_delegate);
    [v20 myriadCoordinator:self didReceiveAdvertisment:v17];
  }
  if ([(SCDARecord *)v17 deviceGroup] == self->_deviceGroup)
  {
    v21 = [(SCDARecord *)v17 deviceID];
    v22 = [v21 UUIDString];

    myriadWorkQueue = self->_myriadWorkQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__SCDACoordinator_heySiri_foundDevice_withInfo___block_invoke;
    block[3] = &unk_2654B7FD0;
    v32 = v17;
    v33 = self;
    id v34 = v30;
    id v35 = v15;
    id v36 = v14;
    id v37 = v22;
    id v24 = v22;
    dispatch_async(myriadWorkQueue, block);
  }
  else
  {
    v25 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v26 = v25;
      int v27 = [(SCDARecord *)v17 deviceGroup];
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = "-[SCDACoordinator heySiri:foundDevice:withInfo:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v27;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v30;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v14;
      _os_log_impl(&dword_25C707000, v26, OS_LOG_TYPE_INFO, "%s BTLE ignoring advert from other deviceGroup %d: %@ data= %@", buf, 0x26u);
    }
  }
}

void __48__SCDACoordinator_heySiri_foundDevice_withInfo___block_invoke(uint64_t a1)
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) pHash];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = *(void **)(v3 + 40);
  uint64_t v5 = [*(id *)(v3 + 376) UUIDString];
  uint64_t v6 = [v4 valueForKey:v5];
  int v7 = 0;
  for (int i = [v6 pHash] ^ v2; i; i &= i - 1)
    ++v7;

  int v9 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    __int16 v10 = *(void **)(a1 + 40);
    uint64_t v11 = v10[1];
    id v12 = v9;
    uint64_t v13 = [v10 _stateAsString:v11];
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 56);
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 64);
    int v63 = 136316418;
    v64 = "-[SCDACoordinator heySiri:foundDevice:withInfo:]_block_invoke";
    __int16 v65 = 2112;
    v66 = v13;
    __int16 v67 = 2112;
    uint64_t v68 = v14;
    __int16 v69 = 2112;
    uint64_t v70 = v15;
    __int16 v71 = 2112;
    uint64_t v72 = v16;
    __int16 v73 = 2112;
    uint64_t v74 = v17;
    _os_log_impl(&dword_25C707000, v12, OS_LOG_TYPE_INFO, "%s #scda BTLE processing advert in state: %@ from: %@ BTLE address= %@ record= %@ advData= %@", (uint8_t *)&v63, 0x3Eu);
  }
  v18 = *(void **)(a1 + 40);
  switch(v18[1])
  {
    case 0:
    case 3:
    case 4:
    case 6:
    case 9:
    case 0xBLL:
    case 0xDLL:
    case 0x10:
      char v19 = (void *)SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        id v20 = v19;
        v21 = [v18 _stateAsString];
        uint64_t v22 = *(void *)(a1 + 48);
        uint64_t v23 = *(void *)(a1 + 64);
        int v63 = 136315906;
        v64 = "-[SCDACoordinator heySiri:foundDevice:withInfo:]_block_invoke";
        __int16 v65 = 2112;
        v66 = v21;
        __int16 v67 = 2112;
        uint64_t v68 = v22;
        __int16 v69 = 2112;
        uint64_t v70 = v23;
        _os_log_impl(&dword_25C707000, v20, OS_LOG_TYPE_INFO, "%s BTLE ignoring advert while in state %@: %@ data= %@", (uint8_t *)&v63, 0x2Au);
      }
      return;
    case 1:
    case 0xELL:
    case 0xFLL:
      if (![*(id *)(a1 + 40) _testAndUpdateWedgeFilter:*(void *)(a1 + 32)]) {
        return;
      }
      id v24 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKey:*(void *)(a1 + 72)];

      if (v24)
      {
        v25 = *(void **)(*(void *)(a1 + 40) + 48);
        v26 = NSNumber;
        int v27 = [v25 objectForKey:*(void *)(a1 + 72)];
        id v28 = objc_msgSend(v26, "numberWithInteger:", objc_msgSend(v27, "integerValue") + 1);
        [v25 setObject:v28 forKey:*(void *)(a1 + 72)];
      }
      else
      {
        v46 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
        {
          v47 = *(void **)(a1 + 48);
          uint64_t v48 = *(void *)(a1 + 64);
          int v63 = 136315650;
          v64 = "-[SCDACoordinator heySiri:foundDevice:withInfo:]_block_invoke";
          __int16 v65 = 2112;
          v66 = v47;
          __int16 v67 = 2112;
          uint64_t v68 = v48;
          _os_log_impl(&dword_25C707000, v46, OS_LOG_TYPE_INFO, "%s BTLE heard advert from: %@ data= %@", (uint8_t *)&v63, 0x20u);
        }
        v49 = *(void **)(*(void *)(a1 + 40) + 48);
        int v27 = [NSNumber numberWithInteger:1];
        [v49 setObject:v27 forKey:*(void *)(a1 + 72)];
      }

      if (![*(id *)(a1 + 32) isSlowdown]) {
        goto LABEL_42;
      }
      uint64_t v50 = *(void *)(a1 + 40);
      v51 = *(void **)(v50 + 304);
      if (!v51) {
        goto LABEL_39;
      }
      int v52 = [v51 slowdownDelay];
      if (v52 < (int)[*(id *)(a1 + 32) slowdownDelay])
      {
        uint64_t v50 = *(void *)(a1 + 40);
LABEL_39:
        objc_storeStrong((id *)(v50 + 304), *(id *)(a1 + 32));
        *(unsigned char *)(*(void *)(a1 + 40) + 328) = 1;
        v53 = (void *)SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
        {
          uint64_t v54 = *(void *)(a1 + 64);
          v55 = *(void **)(a1 + 48);
          v56 = *(void **)(*(void *)(a1 + 40) + 304);
          v57 = v53;
          int v58 = [v56 slowdownDelay];
          int v63 = 136315906;
          v64 = "-[SCDACoordinator heySiri:foundDevice:withInfo:]_block_invoke";
          __int16 v65 = 2112;
          v66 = v55;
          __int16 v67 = 2112;
          uint64_t v68 = v54;
          __int16 v69 = 1024;
          LODWORD(v70) = v58;
          _os_log_impl(&dword_25C707000, v57, OS_LOG_TYPE_INFO, "%s BTLE heard slowdown advert from: %@ data= %@, max delay is now %d msecs", (uint8_t *)&v63, 0x26u);
        }
        kdebug_trace();
      }
LABEL_42:
      if (v7 <= 16)
      {
        *(void *)(*(void *)(a1 + 40) + 608) = mach_absolute_time();
        goto LABEL_52;
      }
      v59 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        int v63 = 136315394;
        v64 = "-[SCDACoordinator heySiri:foundDevice:withInfo:]_block_invoke";
        __int16 v65 = 1024;
        LODWORD(v66) = v7;
        _os_log_impl(&dword_25C707000, v59, OS_LOG_TYPE_INFO, "%s BTLE editDist: %d > allowed, ignoring this advert ", (uint8_t *)&v63, 0x12u);
      }
      return;
    case 2:
      id v36 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        id v37 = *(void **)(a1 + 48);
        uint64_t v38 = *(void *)(a1 + 64);
        int v63 = 136315650;
        v64 = "-[SCDACoordinator heySiri:foundDevice:withInfo:]_block_invoke";
        __int16 v65 = 2112;
        v66 = v37;
        __int16 v67 = 2112;
        uint64_t v68 = v38;
        _os_log_impl(&dword_25C707000, v36, OS_LOG_TYPE_INFO, "%s BTLE suppressing straggler response to: %@ data= %@", (uint8_t *)&v63, 0x20u);
        v18 = *(void **)(a1 + 40);
      }
      id v34 = v18;
      uint64_t v35 = 3;
      goto LABEL_51;
    case 5:
      if ([*(id *)(a1 + 32) isAContinuation])
      {
        v39 = [*(id *)(*(void *)(a1 + 40) + 80) objectForKey:*(void *)(a1 + 72)];

        if (!v39)
        {
          uint64_t v40 = SCDALogContextCore;
          if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
          {
            uint64_t v41 = *(void **)(a1 + 48);
            uint64_t v42 = *(void *)(a1 + 64);
            int v63 = 136315650;
            v64 = "-[SCDACoordinator heySiri:foundDevice:withInfo:]_block_invoke";
            __int16 v65 = 2112;
            v66 = v41;
            __int16 v67 = 2112;
            uint64_t v68 = v42;
            _os_log_impl(&dword_25C707000, v40, OS_LOG_TYPE_INFO, "%s BTLE heard another device sending continuation: %@ data= %@", (uint8_t *)&v63, 0x20u);
          }
        }
        [*(id *)(*(void *)(a1 + 40) + 80) setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 72)];
      }
      return;
    case 7:
      if ([*(id *)(a1 + 32) isAnEmergency]) {
        goto LABEL_49;
      }
      return;
    case 8:
    case 0xCLL:
      id v29 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        id v30 = *(void **)(a1 + 32);
        int v63 = 136315394;
        v64 = "-[SCDACoordinator heySiri:foundDevice:withInfo:]_block_invoke";
        __int16 v65 = 2112;
        v66 = v30;
        _os_log_impl(&dword_25C707000, v29, OS_LOG_TYPE_INFO, "%s BTLE heard a record waiting for a emergency handled notice: %@ ", (uint8_t *)&v63, 0x16u);
      }
      if (![*(id *)(a1 + 32) isAnEmergencyHandled]) {
        return;
      }
      v31 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        v32 = *(void **)(a1 + 48);
        uint64_t v33 = *(void *)(a1 + 64);
        int v63 = 136315650;
        v64 = "-[SCDACoordinator heySiri:foundDevice:withInfo:]_block_invoke";
        __int16 v65 = 2112;
        v66 = v32;
        __int16 v67 = 2112;
        uint64_t v68 = v33;
        _os_log_impl(&dword_25C707000, v31, OS_LOG_TYPE_INFO, "%s BTLE heard an emergency declaration was handled: %@ data= %@", (uint8_t *)&v63, 0x20u);
      }
      [*(id *)(a1 + 40) _signalEmergencyCallHandled];
      id v34 = *(void **)(a1 + 40);
      uint64_t v35 = 4;
      goto LABEL_51;
    case 0xALL:
      if ([*(id *)(a1 + 32) isAContinuation])
      {
        uint64_t v43 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
        {
          v44 = *(void **)(a1 + 48);
          uint64_t v45 = *(void *)(a1 + 64);
          int v63 = 136315650;
          v64 = "-[SCDACoordinator heySiri:foundDevice:withInfo:]_block_invoke";
          __int16 v65 = 2112;
          v66 = v44;
          __int16 v67 = 2112;
          uint64_t v68 = v45;
          _os_log_impl(&dword_25C707000, v43, OS_LOG_TYPE_INFO, "%s BTLE heard a continuation: %@ data= %@", (uint8_t *)&v63, 0x20u);
        }
        [*(id *)(a1 + 40) _stopListening:0];
        [*(id *)(a1 + 40) _enterState:7];
      }
      else if ([*(id *)(a1 + 32) isAnEmergency])
      {
        v60 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
        {
          v61 = *(void **)(a1 + 48);
          uint64_t v62 = *(void *)(a1 + 64);
          int v63 = 136315650;
          v64 = "-[SCDACoordinator heySiri:foundDevice:withInfo:]_block_invoke";
          __int16 v65 = 2112;
          v66 = v61;
          __int16 v67 = 2112;
          uint64_t v68 = v62;
          _os_log_impl(&dword_25C707000, v60, OS_LOG_TYPE_INFO, "%s BTLE heard an emergency declaration: %@ data= %@", (uint8_t *)&v63, 0x20u);
        }
LABEL_49:
        if ([*(id *)(a1 + 40) _shouldHandleEmergency])
        {
          id v34 = *(void **)(a1 + 40);
          uint64_t v35 = 9;
LABEL_51:
          [v34 enterState:v35];
        }
      }
      else
      {
LABEL_52:
        [*(id *)(a1 + 40) _updateRepliesWith:*(void *)(a1 + 32) id:*(void *)(a1 + 72) data:*(void *)(a1 + 64)];
      }
      return;
    case 0x11:
      [*(id *)(a1 + 40) _testAndUpdateWedgeFilter:*(void *)(a1 + 32)];
      return;
    default:
      return;
  }
}

- (void)heySiriDidUpdateState:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = v5;
    *(_DWORD *)buf = 136315394;
    id v12 = "-[SCDACoordinator heySiriDidUpdateState:]";
    __int16 v13 = 2048;
    uint64_t v14 = [v4 state];
    _os_log_impl(&dword_25C707000, v6, OS_LOG_TYPE_INFO, "%s BTLE daemon state changed to: %ld", buf, 0x16u);
  }
  myriadWorkQueue = self->_myriadWorkQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__SCDACoordinator_heySiriDidUpdateState___block_invoke;
  v9[3] = &unk_2654B7BB8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(myriadWorkQueue, v9);
}

void __41__SCDACoordinator_heySiriDidUpdateState___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(a1 + 32) + 312) = [*(id *)(a1 + 40) state] == 3;
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 312))
  {
    uint64_t v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      int v9 = "-[SCDACoordinator heySiriDidUpdateState:]_block_invoke";
      _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s BTLE daemon wiprox state signalling", (uint8_t *)&v8, 0xCu);
      uint64_t v2 = *(void *)(a1 + 32);
    }
    id v4 = (void (**)(void))MEMORY[0x261192180](*(void *)(v2 + 472));
    [*(id *)(a1 + 32) _clearWiProxReadinessTimer];
    if (v4) {
      v4[2](v4);
    }
    if (*(void *)(*(void *)(a1 + 32) + 600))
    {
      uint64_t v5 = (void (**)(void))MEMORY[0x261192180]();
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = *(void **)(v6 + 600);
      *(void *)(v6 + 600) = 0;

      if (v5) {
        v5[2](v5);
      }
    }
  }
}

- (void)_triggerABCForType:(id)a3 context:(id)a4
{
  advContextManager = self->_advContextManager;
  if (advContextManager) {
    [(SCDAAdvertisementContextManager *)advContextManager triggerABCForType:@"Myriad" subType:a3 context:a4];
  }
}

- (void)_leaveBLEDiagnosticMode
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!self->_myriadWorkQueue) {
    __assert_rtn("-[SCDACoordinator _leaveBLEDiagnosticMode]", "SCDACoordinator.m", 3957, "_myriadWorkQueue");
  }
  if (self->_sfdiagnostics && !+[SCDAUtilities isHorseman])
  {
    uint64_t v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      int v9 = "-[SCDACoordinator _leaveBLEDiagnosticMode]";
      _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s BTLE leaving diagnostic mode", (uint8_t *)&v8, 0xCu);
    }
    [(SFDiagnostics *)self->_sfdiagnostics invalidate];
    sfdiagnostics = self->_sfdiagnostics;
    self->_sfdiagnostics = 0;

    uint64_t v5 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      sfDiagnosticsTimer = self->_sfDiagnosticsTimer;
      int v8 = 136315650;
      int v9 = "-[SCDACoordinator _leaveBLEDiagnosticMode]";
      __int16 v10 = 2048;
      uint64_t v11 = 0x3FF7333340000000;
      __int16 v12 = 2112;
      __int16 v13 = sfDiagnosticsTimer;
      _os_log_impl(&dword_25C707000, v5, OS_LOG_TYPE_INFO, "%s BTLE cancelling diagnostic mode timer for %f seconds %@", (uint8_t *)&v8, 0x20u);
    }
    [(SCDAWatchdogTimer *)self->_sfDiagnosticsTimer cancel];
    int v7 = self->_sfDiagnosticsTimer;
    self->_sfDiagnosticsTimer = 0;
  }
}

- (void)_enterBLEDiagnosticMode
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (!self->_myriadWorkQueue) {
    __assert_rtn("-[SCDACoordinator _enterBLEDiagnosticMode]", "SCDACoordinator.m", 3927, "_myriadWorkQueue");
  }
  if (!+[SCDAUtilities isHorseman])
  {
    [(SCDACoordinator *)self _leaveBLEDiagnosticMode];
    uint64_t v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[SCDACoordinator _enterBLEDiagnosticMode]";
      _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s BTLE entering diagnostic mode", buf, 0xCu);
    }
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2050000000;
    id v4 = (void *)getSFDiagnosticsClass_softClass;
    uint64_t v19 = getSFDiagnosticsClass_softClass;
    if (!getSFDiagnosticsClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getSFDiagnosticsClass_block_invoke;
      v21 = (SCDAWatchdogTimer *)&unk_2654B7FF8;
      uint64_t v22 = &v16;
      __getSFDiagnosticsClass_block_invoke((uint64_t)buf);
      id v4 = (void *)v17[3];
    }
    uint64_t v5 = v4;
    _Block_object_dispose(&v16, 8);
    uint64_t v6 = (SFDiagnostics *)objc_alloc_init(v5);
    sfdiagnostics = self->_sfdiagnostics;
    self->_sfdiagnostics = v6;

    [(SFDiagnostics *)self->_sfdiagnostics setDispatchQueue:self->_myriadWorkQueue];
    int v8 = self->_sfdiagnostics;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __42__SCDACoordinator__enterBLEDiagnosticMode__block_invoke;
    v15[3] = &unk_2654B7FA8;
    v15[4] = self;
    [(SFDiagnostics *)v8 diagnosticBLEModeWithCompletion:v15];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __42__SCDACoordinator__enterBLEDiagnosticMode__block_invoke_395;
    v14[3] = &unk_2654B81C8;
    v14[4] = self;
    int v9 = (void *)MEMORY[0x261192180](v14);
    __int16 v10 = [[SCDAWatchdogTimer alloc] initWithTimeoutInterval:self->_myriadWorkQueue onQueue:v9 timeoutHandler:1.45000005];
    sfDiagnosticsTimer = self->_sfDiagnosticsTimer;
    self->_sfDiagnosticsTimer = v10;

    [(SCDAWatchdogTimer *)self->_sfDiagnosticsTimer start];
    __int16 v12 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = self->_sfDiagnosticsTimer;
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[SCDACoordinator _enterBLEDiagnosticMode]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 0x3FF7333340000000;
      *(_WORD *)&buf[22] = 2112;
      v21 = v13;
      _os_log_impl(&dword_25C707000, v12, OS_LOG_TYPE_INFO, "%s BTLE added diagnostic mode timer for %f seconds %@", buf, 0x20u);
    }
  }
}

void __42__SCDACoordinator__enterBLEDiagnosticMode__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315394;
      uint64_t v6 = "-[SCDACoordinator _enterBLEDiagnosticMode]_block_invoke";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_25C707000, v4, OS_LOG_TYPE_INFO, "%s BTLE failed to enter diagnostic mode %@", (uint8_t *)&v5, 0x16u);
    }
    [*(id *)(a1 + 32) _leaveBLEDiagnosticMode];
  }
}

uint64_t __42__SCDACoordinator__enterBLEDiagnosticMode__block_invoke_395(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    int v5 = "-[SCDACoordinator _enterBLEDiagnosticMode]_block_invoke";
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s BTLE diagnostic mode timer fired", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _leaveBLEDiagnosticMode];
}

- (void)_waitWiProxAndExecute:(id)a3
{
}

- (void)waitWiProx:(int64_t)a3 andExecute:(id)a4
{
  id v6 = a4;
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SCDACoordinator_waitWiProx_andExecute___block_invoke;
  block[3] = &unk_2654B7F80;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(myriadWorkQueue, block);
}

uint64_t __41__SCDACoordinator_waitWiProx_andExecute___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _waitWiProx:*(void *)(a1 + 48) andExecute:*(void *)(a1 + 40)];
}

- (void)_waitWiProx:(int64_t)a3 andExecute:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  BOOL BTLEReady = self->_BTLEReady;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __42__SCDACoordinator__waitWiProx_andExecute___block_invoke;
  uint64_t v17 = &unk_2654B8100;
  uint64_t v18 = self;
  id v8 = v6;
  id v19 = v8;
  uint64_t v9 = (void (**)(void))MEMORY[0x261192180](&v14);
  uint64_t v10 = [(WPHeySiri *)self->_heySiriBTLE state];
  uint64_t v11 = v10;
  if (!BTLEReady && v10 == 3)
  {
    if (self->_BLEActivityEnabled)
    {
      __int16 v12 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[SCDACoordinator _waitWiProx:andExecute:]";
        _os_log_error_impl(&dword_25C707000, v12, OS_LOG_TYPE_ERROR, "%s #scda BTLE became ready without updateState call, updating state then dispatching completion", buf, 0xCu);
      }
      [(SCDACoordinator *)self heySiriDidUpdateState:self->_heySiriBTLE];
    }
    goto LABEL_8;
  }
  if (BTLEReady || !self->_BLEActivityEnabled)
  {
LABEL_8:
    v9[2](v9);
    goto LABEL_9;
  }
  __int16 v13 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "-[SCDACoordinator _waitWiProx:andExecute:]";
    __int16 v22 = 2048;
    int64_t v23 = a3;
    __int16 v24 = 2048;
    uint64_t v25 = v11;
    _os_log_impl(&dword_25C707000, v13, OS_LOG_TYPE_INFO, "%s #scda BTLE not ready, waiting to execute for up to %ld msecs (current HeySiri WPState %ld)", buf, 0x20u);
  }
  [(SCDACoordinator *)self _createWaitWiProxTimer:a3 waitBlock:v9];
LABEL_9:
}

void __42__SCDACoordinator__waitWiProx_andExecute___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 456);
  int v4 = *(unsigned __int8 *)(v2 + 457);
  label = dispatch_queue_get_label(0);
  id v6 = label;
  if (label && !strcmp(label, (const char *)scda_work_queue_label))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(void))(v10 + 16))();
    }
    uint64_t v11 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      __int16 v12 = "YES";
      if (v4) {
        __int16 v13 = "YES";
      }
      else {
        __int16 v13 = "NO";
      }
      uint64_t v14 = *(void *)(a1 + 32);
      __int16 v24 = "-[SCDACoordinator _waitWiProx:andExecute:]_block_invoke";
      int v15 = *(unsigned __int8 *)(v14 + 457);
      int v16 = *(unsigned __int8 *)(v14 + 456);
      if (v15) {
        uint64_t v17 = "YES";
      }
      else {
        uint64_t v17 = "NO";
      }
      *(_DWORD *)buf = 136316162;
      if (v3) {
        uint64_t v18 = "YES";
      }
      else {
        uint64_t v18 = "NO";
      }
      __int16 v25 = 2080;
      uint64_t v26 = v13;
      if (!v16) {
        __int16 v12 = "NO";
      }
      __int16 v27 = 2080;
      uint64_t v28 = (uint64_t)v17;
      __int16 v29 = 2080;
      id v30 = v18;
      __int16 v31 = 2080;
      v32 = v12;
      _os_log_impl(&dword_25C707000, v11, OS_LOG_TYPE_INFO, "%s #scda didRequestForBTLEAdvertisement: %s -> %s, didRequestForBTLEScan: %s -> %s", buf, 0x34u);
    }
  }
  else
  {
    __int16 v7 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315651;
      __int16 v24 = "-[SCDACoordinator _waitWiProx:andExecute:]_block_invoke";
      __int16 v25 = 2081;
      uint64_t v26 = v6;
      __int16 v27 = 2081;
      uint64_t v28 = scda_work_queue_label;
      _os_log_error_impl(&dword_25C707000, v7, OS_LOG_TYPE_ERROR, "%s #scda Method called on unexpected thread (curr:%{private}s expected:%{private}s)", buf, 0x20u);
      uint64_t v2 = *(void *)(a1 + 32);
    }
    id v8 = *(NSObject **)(v2 + 176);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__SCDACoordinator__waitWiProx_andExecute___block_invoke_389;
    block[3] = &unk_2654B7F58;
    id v9 = *(id *)(a1 + 40);
    char v21 = v4;
    void block[4] = *(void *)(a1 + 32);
    id v20 = v9;
    char v22 = v3;
    dispatch_async(v8, block);
  }
}

void __42__SCDACoordinator__waitWiProx_andExecute___block_invoke_389(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  int v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v4 = "YES";
    if (*(unsigned char *)(a1 + 48)) {
      int v5 = "YES";
    }
    else {
      int v5 = "NO";
    }
    uint64_t v6 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v6 + 457)) {
      __int16 v7 = "YES";
    }
    else {
      __int16 v7 = "NO";
    }
    if (*(unsigned char *)(a1 + 49)) {
      id v8 = "YES";
    }
    else {
      id v8 = "NO";
    }
    if (!*(unsigned char *)(v6 + 456)) {
      int v4 = "NO";
    }
    int v9 = 136316162;
    uint64_t v10 = "-[SCDACoordinator _waitWiProx:andExecute:]_block_invoke";
    __int16 v11 = 2080;
    __int16 v12 = v5;
    __int16 v13 = 2080;
    uint64_t v14 = v7;
    __int16 v15 = 2080;
    int v16 = v8;
    __int16 v17 = 2080;
    uint64_t v18 = v4;
    _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s #scda didRequestForBTLEAdvertisement: %s -> %s, didRequestForBTLEScan: %s -> %s", (uint8_t *)&v9, 0x34u);
  }
}

- (void)_createWaitWiProxTimer:(int64_t)a3 waitBlock:(id)a4
{
  id v6 = a4;
  [(SCDACoordinator *)self _suspendWiProxReadinessTimer];
  waitTimer = self->_wiproxReadinessTimer.waitTimer;
  dispatch_time_t v8 = dispatch_time(0, 1000000 * a3);
  dispatch_source_set_timer(waitTimer, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __52__SCDACoordinator__createWaitWiProxTimer_waitBlock___block_invoke;
  v18[3] = &unk_2654B81C8;
  v18[4] = self;
  int v9 = (void *)MEMORY[0x261192180](v18);
  dispatch_source_set_event_handler((dispatch_source_t)self->_wiproxReadinessTimer.waitTimer, v9);
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  __int16 v15 = __52__SCDACoordinator__createWaitWiProxTimer_waitBlock___block_invoke_388;
  int v16 = &unk_2654B7F30;
  id v17 = v6;
  id v10 = v6;
  __int16 v11 = (void *)MEMORY[0x261192180](&v13);
  id waitBlock = self->_wiproxReadinessTimer.waitBlock;
  self->_wiproxReadinessTimer.id waitBlock = v11;

  [(SCDACoordinator *)self _resumeWiProxReadinessTimer];
}

uint64_t __52__SCDACoordinator__createWaitWiProxTimer_waitBlock___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    int v5 = "-[SCDACoordinator _createWaitWiProxTimer:waitBlock:]_block_invoke";
    _os_log_error_impl(&dword_25C707000, v2, OS_LOG_TYPE_ERROR, "%s #scda BTLE WiProx readiness timer timed out, WiProx not called", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _clearWiProxReadinessTimer];
}

uint64_t __52__SCDACoordinator__createWaitWiProxTimer_waitBlock___block_invoke_388(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    int v5 = "-[SCDACoordinator _createWaitWiProxTimer:waitBlock:]_block_invoke";
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s #scda BTLE done waiting on WiProx to execute", (uint8_t *)&v4, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_clearWiProxReadinessTimer
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (self->_wiproxReadinessTimer.waitTimer)
  {
    int v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[SCDACoordinator _clearWiProxReadinessTimer]";
      _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s #scda WiProx readiness timer wait block cleared", (uint8_t *)&v5, 0xCu);
    }
    id waitBlock = self->_wiproxReadinessTimer.waitBlock;
    self->_wiproxReadinessTimer.id waitBlock = 0;
  }
}

- (void)_suspendWiProxReadinessTimer
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (!self->_wiproxReadinessTimer.isWaitTimerSuspended)
  {
    int v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      int v5 = "-[SCDACoordinator _suspendWiProxReadinessTimer]";
      _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s #scda WiProx readiness timer suspended", (uint8_t *)&v4, 0xCu);
    }
    self->_wiproxReadinessTimer.isWaitTimerSuspended = 1;
    dispatch_suspend((dispatch_object_t)self->_wiproxReadinessTimer.waitTimer);
  }
}

- (void)_resumeWiProxReadinessTimer
{
  self->_wiproxReadinessTimer.isWaitTimerSuspended = 0;
}

- (void)_initializeWiProxReadinessTimer
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[SCDACoordinator _initializeWiProxReadinessTimer]";
    _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s #scda WiProx readiness timer initialized", (uint8_t *)&v6, 0xCu);
  }
  int v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_myriadWorkQueue);
  waitTimer = self->_wiproxReadinessTimer.waitTimer;
  self->_wiproxReadinessTimer.waitTimer = v4;

  dispatch_source_set_event_handler((dispatch_source_t)self->_wiproxReadinessTimer.waitTimer, &__block_literal_global_387);
  [(SCDACoordinator *)self _resumeWiProxReadinessTimer];
}

- (void)_ageWedgeFilter
{
  p_previousTrumps = &self->_previousTrumps;
  previousTrumps = self->_previousTrumps;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__SCDACoordinator__ageWedgeFilter__block_invoke;
  v7[3] = &unk_2654B7F08;
  v7[4] = self;
  [(NSMutableDictionary *)previousTrumps enumerateKeysAndObjectsUsingBlock:v7];
  objc_storeStrong((id *)p_previousTrumps, self->_incomingTrumps);
  int v5 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:10];
  incomingTrumps = self->_incomingTrumps;
  self->_incomingTrumps = v5;
}

void __34__SCDACoordinator__ageWedgeFilter__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  int v5 = [a3 intValue];
  if (v5 >= 2)
  {
    int v6 = v5;
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:v10];

    if (!v7)
    {
      uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 72);
      int v9 = [NSNumber numberWithInt:(v6 - 1)];
      [v8 setObject:v9 forKey:v10];
    }
  }
}

- (BOOL)_testAndUpdateWedgeFilter:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "userConfidence") | (objc_msgSend(v4, "tieBreaker") << 8));
  if (![v4 isATrump]) {
    goto LABEL_12;
  }
  incomingTrumps = self->_incomingTrumps;
  uint64_t v7 = [NSNumber numberWithInt:20];
  [(NSMutableDictionary *)incomingTrumps setObject:v7 forKey:v5];

  int v8 = [v4 deviceClass];
  int v9 = [v4 productType];
  if (+[SCDAUtilities isHorseman] && v8 == 6 && !v9)
  {
    id v10 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      int v15 = 136315394;
      int v16 = "-[SCDACoordinator _testAndUpdateWedgeFilter:]";
      __int16 v17 = 2112;
      id v18 = v4;
      __int16 v11 = "%s BTLE ignoring incoming event bad device class (watch) for Horseman %@";
LABEL_10:
      _os_log_impl(&dword_25C707000, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v15, 0x16u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  __int16 v12 = [(NSMutableDictionary *)self->_previousTrumps objectForKeyedSubscript:v5];

  if (!v12)
  {
LABEL_12:
    char v13 = [v4 isSane];
    goto LABEL_13;
  }
  id v10 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315394;
    int v16 = "-[SCDACoordinator _testAndUpdateWedgeFilter:]";
    __int16 v17 = 2112;
    id v18 = v4;
    __int16 v11 = "%s BTLE ignoring as wedged suppress %@";
    goto LABEL_10;
  }
LABEL_11:
  char v13 = 0;
LABEL_13:

  return v13;
}

- (int)_myriadStateForSelf:(unint64_t)a3
{
  if (a3 < 0x12) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

- (unint64_t)_nextElectionPublisherState
{
  unint64_t electionPublisherState = self->_electionPublisherState;
  if (electionPublisherState) {
    unint64_t v3 = (electionPublisherState + 1) % 0x3D;
  }
  else {
    unint64_t v3 = 1;
  }
  self->_unint64_t electionPublisherState = v3;
  return v3;
}

- (void)notifyCurrentDecisionResult
{
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SCDACoordinator_notifyCurrentDecisionResult__block_invoke;
  block[3] = &unk_2654B81C8;
  void block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

void __46__SCDACoordinator_notifyCurrentDecisionResult__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 8);
  if (v2 == 14 || v2 == 1)
  {
    id v4 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      int v5 = v4;
      int v6 = [(id)v1 _stateAsString:v2];
      int v11 = 136315394;
      __int16 v12 = "-[SCDACoordinator notifyCurrentDecisionResult]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      _os_log_impl(&dword_25C707000, v5, OS_LOG_TYPE_INFO, "%s BTLE ignoring decision result callback (state = %@)", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (*(unsigned char *)(v1 + 416))
  {
    int v8 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      int v9 = v8;
      id v10 = [(id)v1 _stateAsString:v2];
      int v11 = 136315394;
      __int16 v12 = "-[SCDACoordinator notifyCurrentDecisionResult]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      _os_log_impl(&dword_25C707000, v9, OS_LOG_TYPE_INFO, "%s BTLE reposting result win (state = %@)", (uint8_t *)&v11, 0x16u);

      uint64_t v1 = *(void *)(a1 + 32);
    }
    objc_msgSend(*(id *)(v1 + 560), "publishState:", objc_msgSend((id)v1, "_nextElectionPublisherState"));
  }
}

- (void)_updateRepliesWith:(id)a3 id:(id)a4 data:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(NSMutableDictionary *)self->_replies objectForKey:v9];
  __int16 v12 = v11;
  if (!v11)
  {
    uint64_t v15 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO)) {
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if ([v11 isAContinuation] && (objc_msgSend(v8, "isAContinuation") & 1) == 0)
  {
    uint64_t v15 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
LABEL_10:
      *(_DWORD *)int v16 = 136315650;
      *(void *)&v16[4] = "-[SCDACoordinator _updateRepliesWith:id:data:]";
      *(_WORD *)&v16[12] = 2112;
      *(void *)&v16[14] = v10;
      *(_WORD *)&v16[22] = 2112;
      *(void *)__int16 v17 = v9;
      _os_log_impl(&dword_25C707000, v15, OS_LOG_TYPE_INFO, "%s BTLE Updating record table, data= %@, for %@", v16, 0x20u);
    }
LABEL_11:
    -[NSMutableDictionary setObject:forKey:](self->_replies, "setObject:forKey:", v8, v9, *(_OWORD *)v16, *(void *)&v16[16], *(void *)v17);
    goto LABEL_12;
  }
  if ([v8 isALateSupressionTrumpFor:v12])
  {
    __int16 v13 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = v13;
      *(_DWORD *)int v16 = 136316162;
      *(void *)&v16[4] = "-[SCDACoordinator _updateRepliesWith:id:data:]";
      *(_WORD *)&v16[12] = 1024;
      *(_DWORD *)&v16[14] = [v12 goodness];
      *(_WORD *)&v16[18] = 1024;
      *(_DWORD *)&v16[20] = [v8 goodness];
      *(_WORD *)__int16 v17 = 2112;
      *(void *)&v17[2] = v10;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl(&dword_25C707000, v14, OS_LOG_TYPE_INFO, "%s BTLE Updating record table with a late supression(%hhu -> %hhu), data= %@, for %@", v16, 0x2Cu);
    }
    goto LABEL_11;
  }
LABEL_12:
}

- (id)_sortedReplies:(id)a3
{
  unint64_t v3 = [a3 allValues];
  id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_383];

  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ((unint64_t)[v4 count] < 2)
  {
    [v5 addObjectsFromArray:v4];
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __34__SCDACoordinator__sortedReplies___block_invoke_2;
    v9[3] = &unk_2654B7EE0;
    id v10 = v6;
    id v11 = v5;
    id v7 = v6;
    [v4 enumerateObjectsUsingBlock:v9];
  }
  return v5;
}

void __34__SCDACoordinator__sortedReplies___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  unint64_t v3 = [v4 asAdvertisementData];
  if ([v4 isCollectedFromContextCollector])
  {
    if ([*(id *)(a1 + 32) containsObject:v3]) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v3)
  {
LABEL_3:
    [*(id *)(a1 + 32) addObject:v3];
    [*(id *)(a1 + 40) addObject:v4];
  }
LABEL_4:
}

uint64_t __34__SCDACoordinator__sortedReplies___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  int v8 = [v6 deviceClass];
  if ((v8 == 10 || v8 == 6)
    && [v6 isATrump]
    && [v7 deviceClass] == 7
    && ([v7 isATrump] & 1) != 0)
  {
    goto LABEL_23;
  }
  if ([v6 deviceClass] == 7)
  {
    if ([v6 isATrump])
    {
      int v9 = [v7 deviceClass];
      if (v9 == 10 || v9 == 6) && ([v7 isATrump])
      {
        uint64_t v10 = -1;
        goto LABEL_22;
      }
    }
  }
  int v11 = [v6 goodness];
  if (v11 == [v7 goodness])
  {
    unsigned int v12 = [v6 userConfidence];
    unsigned int v13 = [v7 userConfidence];
  }
  else
  {
    unsigned int v12 = [v6 goodness];
    unsigned int v13 = [v7 goodness];
  }
  unsigned int v14 = v13;
  if (v12 == v13)
  {
    unsigned int v12 = [v6 tieBreaker];
    unsigned int v14 = [v7 tieBreaker];
    if ([v6 hasEqualAdvertismentData:v7])
    {
      if ([v6 isCollectedFromContextCollector]
        && ![v7 isCollectedFromContextCollector])
      {
LABEL_23:
        uint64_t v10 = 1;
        goto LABEL_22;
      }
    }
  }
  if (v12 < v14) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = -1;
  }
LABEL_22:

  return v10;
}

- (id)_sortedReplies
{
  return [(SCDACoordinator *)self _sortedReplies:self->_replies];
}

- (BOOL)_isAPhone:(unsigned __int8)a3
{
  return a3 == 2;
}

- (BOOL)_shouldHandleEmergency
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(SCDACoordinator *)self _sortedReplies:self->_repliesBeforeDecision];
  id v4 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    replies = self->_replies;
    *(_DWORD *)buf = 136315394;
    __int16 v24 = "-[SCDACoordinator _shouldHandleEmergency]";
    __int16 v25 = 2112;
    uint64_t v26 = replies;
    _os_log_impl(&dword_25C707000, v4, OS_LOG_TYPE_INFO, "%s BTLE emergencyCallSummary: %@", buf, 0x16u);
  }
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_380];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
LABEL_5:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v6);
      }
      int v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
      if (-[SCDACoordinator _isAPhone:](self, "_isAPhone:", objc_msgSend(v11, "deviceClass", (void)v18))) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    int v13 = [v11 isMe];
    unsigned int v14 = SCDALogContextCore;
    BOOL v15 = os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v15)
      {
        *(_DWORD *)buf = 136315138;
        __int16 v24 = "-[SCDACoordinator _shouldHandleEmergency]";
        int v16 = "%s BTLE Emergency call: this device should handle";
LABEL_19:
        _os_log_impl(&dword_25C707000, v14, OS_LOG_TYPE_INFO, v16, buf, 0xCu);
      }
    }
    else if (v15)
    {
      *(_DWORD *)buf = 136315138;
      __int16 v24 = "-[SCDACoordinator _shouldHandleEmergency]";
      int v16 = "%s BTLE Emergency call: This device should NOT handle, another is better";
      goto LABEL_19;
    }

    goto LABEL_21;
  }
LABEL_11:

  unsigned int v12 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v24 = "-[SCDACoordinator _shouldHandleEmergency]";
    _os_log_impl(&dword_25C707000, v12, OS_LOG_TYPE_INFO, "%s BTLE Emergency Call: No device available to handle this call", buf, 0xCu);
  }
  LOBYTE(v13) = 0;
LABEL_21:

  return v13;
}

void __41__SCDACoordinator__shouldHandleEmergency__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    uint64_t v7 = "-[SCDACoordinator _shouldHandleEmergency]_block_invoke";
    __int16 v8 = 2048;
    uint64_t v9 = a3;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_25C707000, v5, OS_LOG_TYPE_INFO, "%s BTLE EmergencyCallSummary %lu: %@", (uint8_t *)&v6, 0x20u);
  }
}

- (BOOL)_shouldContinueFor:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SCDACoordinator *)self _sortedReplies];
  int v6 = SCDALogForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 firstObject];
    replies = self->_replies;
    *(_DWORD *)buf = 138412546;
    id v37 = v7;
    __int16 v38 = 2112;
    v39 = replies;
    _os_log_impl(&dword_25C707000, v6, OS_LOG_TYPE_DEFAULT, "BTLE end advertising.\nPotential winner = %@\nSummary: %@", buf, 0x16u);
  }
  lastWonBySmallAmountDate = self->_lastWonBySmallAmountDate;
  self->_lastWonBySmallAmountDate = 0;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v32;
LABEL_5:
    uint64_t v15 = 0;
    uint64_t v30 = v13 + v12;
    while (1)
    {
      if (*(void *)v32 != v14) {
        objc_enumerationMutation(v10);
      }
      if (v4)
      {
        int v16 = *(void **)(*((void *)&v31 + 1) + 8 * v15);
        __int16 v17 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v16, "deviceClass"));
        int v18 = [v4 containsObject:v17];

        if (!v18) {
          break;
        }
      }
      if (v12 == ++v15)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
        uint64_t v13 = v30;
        if (v12) {
          goto LABEL_5;
        }
        goto LABEL_12;
      }
    }
    char v21 = [v16 isATrump];
    int v22 = [v16 isMe];
    char v20 = v21 & v22;
    if ((v21 & 1) == 0)
    {
      long long v19 = v10;
      if (!v22) {
        goto LABEL_29;
      }
      if (v13 + v15 + 1 < (unint64_t)[v10 count])
      {
        int64_t v23 = [v10 objectAtIndex:v13 + v15 + 1];
        int v24 = [v16 goodness];
        if ((int)(v24 - [v23 goodness]) <= 2)
        {
          __int16 v25 = SCDALogContextCore;
          if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            id v37 = "-[SCDACoordinator _shouldContinueFor:]";
            _os_log_impl(&dword_25C707000, v25, OS_LOG_TYPE_INFO, "%s #scda Won by a small margin, storing state to mitigate recency boost", buf, 0xCu);
          }
          uint64_t v26 = objc_msgSend(MEMORY[0x263EFF910], "date", self);
          uint64_t v27 = *(void **)(v29 + 640);
          *(void *)(v29 + 640) = v26;
        }
      }
      char v20 = 1;
    }
    long long v19 = v10;
  }
  else
  {
LABEL_12:

    long long v19 = [v10 firstObject];
    if ([v19 isATrump]) {
      self->_clientLostDueToTrumping = 1;
    }
    if ((objc_msgSend(v19, "isMe", self) & 1) == 0
      && [v19 isInEarTrump]
      && [(SCDARecord *)self->_triggerRecord isInEarTrump])
    {
      char v20 = 1;
    }
    else
    {
      char v20 = [v19 isMe];
    }
  }
LABEL_29:

  return v20;
}

- (id)emptyRecord
{
  unint64_t v3 = objc_alloc_init(SCDARecord);
  [(SCDARecord *)v3 setPHash:0];
  [(SCDARecord *)v3 setIsMe:1];
  [(SCDARecord *)v3 setTieBreaker:0];
  [(SCDARecord *)v3 setRawAudioGoodnessScore:0 withBump:0];
  [(SCDARecord *)v3 setDeviceID:self->_designatedSelfID];
  [(SCDARecord *)v3 setDeviceGroup:self->_deviceGroup];
  [(SCDARecord *)v3 setDeviceClass:self->_deviceClass];
  [(SCDARecord *)v3 setProductType:self->_productType];
  id v4 = +[SCDAElectionParticipantIdVendor nullId];
  [(SCDARecord *)v3 setElectionParticipantId:v4];

  return v3;
}

- (id)slowdownRecord:(unsigned __int16)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ((a3 >> 3) >= 0xFF) {
    uint64_t v4 = 255;
  }
  else {
    uint64_t v4 = a3 >> 3;
  }
  id v5 = objc_alloc_init(SCDARecord);
  [(SCDARecord *)v5 setPHash:0];
  [(SCDARecord *)v5 setIsMe:1];
  [(SCDARecord *)v5 setUserConfidence:v4];
  [(SCDARecord *)v5 generateTiebreaker];
  [(SCDARecord *)v5 setRawAudioGoodnessScore:0 withBump:208];
  [(SCDARecord *)v5 setDeviceID:self->_designatedSelfID];
  [(SCDARecord *)v5 setDeviceGroup:self->_deviceGroup];
  [(SCDARecord *)v5 setDeviceClass:self->_deviceClass];
  [(SCDARecord *)v5 setProductType:self->_productType];
  int v6 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[SCDACoordinator slowdownRecord:]";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_25C707000, v6, OS_LOG_TYPE_INFO, "%s BTLE created slowdown record %@", (uint8_t *)&v8, 0x16u);
  }
  return v5;
}

- (id)responseObject:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v5 = objc_alloc_init(SCDARecord);
  [(SCDARecord *)v5 setPHash:v3];
  [(SCDARecord *)v5 setIsMe:1];
  [(SCDARecord *)v5 generateTiebreaker];
  [(SCDARecord *)v5 setRawAudioGoodnessScore:0 withBump:255];
  [(SCDARecord *)v5 setDeviceID:self->_designatedSelfID];
  [(SCDARecord *)v5 setDeviceGroup:self->_deviceGroup];
  [(SCDARecord *)v5 setDeviceClass:self->_deviceClass];
  [(SCDARecord *)v5 setProductType:self->_productType];
  return v5;
}

- (id)emergencyHandledRecord
{
  uint64_t v3 = objc_alloc_init(SCDARecord);
  [(SCDARecord *)v3 setPHash:0];
  [(SCDARecord *)v3 setIsMe:1];
  [(SCDARecord *)v3 generateTiebreaker];
  [(SCDARecord *)v3 setRawAudioGoodnessScore:0 withBump:224];
  [(SCDARecord *)v3 setDeviceID:self->_designatedSelfID];
  [(SCDARecord *)v3 setDeviceGroup:self->_deviceGroup];
  [(SCDARecord *)v3 setDeviceClass:self->_deviceClass];
  [(SCDARecord *)v3 setProductType:self->_productType];
  return v3;
}

- (id)emergencyRecord
{
  uint64_t v3 = objc_alloc_init(SCDARecord);
  [(SCDARecord *)v3 setPHash:0];
  [(SCDARecord *)v3 setIsMe:1];
  [(SCDARecord *)v3 generateTiebreaker];
  [(SCDARecord *)v3 setRawAudioGoodnessScore:0 withBump:239];
  [(SCDARecord *)v3 setDeviceID:self->_designatedSelfID];
  [(SCDARecord *)v3 setDeviceGroup:self->_deviceGroup];
  [(SCDARecord *)v3 setDeviceClass:self->_deviceClass];
  [(SCDARecord *)v3 setProductType:self->_productType];
  return v3;
}

- (id)continuationRecord
{
  uint64_t v3 = objc_alloc_init(SCDARecord);
  [(SCDARecord *)v3 setPHash:0xFFFFLL];
  [(SCDARecord *)v3 setIsMe:1];
  [(SCDARecord *)v3 generateTiebreaker];
  [(SCDARecord *)v3 setRawAudioGoodnessScore:0 withBump:0];
  [(SCDARecord *)v3 setDeviceID:self->_designatedSelfID];
  [(SCDARecord *)v3 setDeviceGroup:self->_deviceGroup];
  [(SCDARecord *)v3 setDeviceClass:self->_deviceClass];
  [(SCDARecord *)v3 setProductType:self->_productType];
  return v3;
}

- (id)lateSuppressionRecord
{
  uint64_t v3 = objc_alloc_init(SCDARecord);
  [(SCDARecord *)v3 setPHash:self->_lastPHash];
  [(SCDARecord *)v3 setIsMe:1];
  [(SCDARecord *)v3 generateTiebreaker];
  [(SCDARecord *)v3 generateRandomConfidence];
  [(SCDARecord *)v3 setRawAudioGoodnessScore:0 withBump:255];
  [(SCDARecord *)v3 setDeviceID:self->_designatedSelfID];
  [(SCDARecord *)v3 setDeviceGroup:self->_deviceGroup];
  [(SCDARecord *)v3 setDeviceClass:self->_deviceClass];
  [(SCDARecord *)v3 setProductType:self->_productType];
  return v3;
}

- (id)directTriggerRecord
{
  uint64_t v3 = [(SCDAContext *)self->_currentMyriadContext perceptualAudioHash];
  uint64_t v4 = [v3 data];

  if ([v4 length] == 12)
  {
    p_voiceTriggerTime = &self->_voiceTriggerTime;
LABEL_4:
    objc_msgSend(v4, "getBytes:range:", p_voiceTriggerTime, 4, 8);
    goto LABEL_6;
  }
  uint64_t v6 = [v4 length];
  p_voiceTriggerTime = &self->_voiceTriggerTime;
  if (v6 == 13) {
    goto LABEL_4;
  }
  unint64_t *p_voiceTriggerTime = 0;
LABEL_6:
  uint64_t v7 = objc_alloc_init(SCDARecord);
  [(SCDARecord *)v7 setPHash:0xFFFFLL];
  [(SCDARecord *)v7 setIsMe:1];
  [(SCDARecord *)v7 generateTiebreaker];
  [(SCDARecord *)v7 generateRandomConfidence];
  [(SCDARecord *)v7 setRawAudioGoodnessScore:0 withBump:255];
  [(SCDARecord *)v7 setDeviceID:self->_designatedSelfID];
  [(SCDARecord *)v7 setDeviceGroup:self->_deviceGroup];
  [(SCDARecord *)v7 setDeviceClass:self->_deviceClass];
  [(SCDARecord *)v7 setProductType:self->_productType];

  return v7;
}

- (id)_phsSetupRecord
{
  uint64_t v3 = objc_alloc_init(SCDARecord);
  [(SCDARecord *)v3 setPHash:63993];
  [(SCDARecord *)v3 setIsMe:1];
  [(SCDARecord *)v3 generateTiebreaker];
  [(SCDARecord *)v3 generateRandomConfidence];
  [(SCDARecord *)v3 setRawAudioGoodnessScore:0 withBump:249];
  [(SCDARecord *)v3 setDeviceID:self->_designatedSelfID];
  [(SCDARecord *)v3 setDeviceGroup:self->_deviceGroup];
  [(SCDARecord *)v3 setDeviceClass:self->_deviceClass];
  [(SCDARecord *)v3 setProductType:self->_productType];
  return v3;
}

- (id)voiceTriggerRecord
{
  uint64_t v3 = [(SCDAContext *)self->_currentMyriadContext perceptualAudioHash];
  uint64_t v4 = [v3 data];

  id v5 = [[SCDARecord alloc] initWithAudioData:v4];
  if ([v4 length] == 12)
  {
    objc_msgSend(v4, "getBytes:range:", &self->_voiceTriggerTime, 4, 8);
LABEL_3:
    [(SCDARecord *)v5 generateTiebreaker];
    goto LABEL_11;
  }
  p_voiceTriggerTime = &self->_voiceTriggerTime;
  if ([v4 length] == 13)
  {
    objc_msgSend(v4, "getBytes:range:", &self->_voiceTriggerTime, 4, 8);
  }
  else
  {
    if (!*p_voiceTriggerTime)
    {
      unint64_t *p_voiceTriggerTime = 0;
      goto LABEL_3;
    }
    uint64_t v7 = mach_absolute_time();
    if (_SCDAMachAbsoluteTimeRate_onceToken != -1)
    {
      uint64_t v9 = v7;
      dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_36);
      uint64_t v7 = v9;
    }
    if (*(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)v7 / 1000000000.0
       - *(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)*p_voiceTriggerTime / 1000000000.0 > 1.45000005)
      unint64_t *p_voiceTriggerTime = 0;
  }
LABEL_11:
  [(SCDARecord *)v5 setIsMe:1];
  [(SCDARecord *)v5 setDeviceID:self->_designatedSelfID];
  [(SCDARecord *)v5 setDeviceGroup:self->_deviceGroup];
  [(SCDARecord *)v5 setDeviceClass:self->_deviceClass];
  [(SCDARecord *)v5 setProductType:self->_productType];

  return v5;
}

- (void)_advertiseWith:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5 voiceTriggerLatency:(float)a6 thenExecute:(id)a7
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a7;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __89__SCDACoordinator__advertiseWith_afterDelay_maxInterval_voiceTriggerLatency_thenExecute___block_invoke;
  v36[3] = &unk_2654B7E50;
  v36[4] = self;
  id v14 = v12;
  id v37 = v14;
  float v38 = a5;
  float v39 = a4;
  float v40 = a6;
  uint64_t v15 = (void (**)(void, void, void))MEMORY[0x261192180](v36);
  previousAdvertisedData = self->_previousAdvertisedData;
  if (previousAdvertisedData && [(NSData *)previousAdvertisedData isEqualToData:v14])
  {
    __int16 v17 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = self->_previousAdvertisedData;
      uint64_t v28 = v17;
      double v29 = [(NSData *)v27 description];
      *(_DWORD *)buf = 136315394;
      uint64_t v42 = "-[SCDACoordinator _advertiseWith:afterDelay:maxInterval:voiceTriggerLatency:thenExecute:]";
      __int16 v43 = 2112;
      double v44 = v29;
      _os_log_error_impl(&dword_25C707000, v28, OS_LOG_TYPE_ERROR, "%s BTLE error: attempting to readvertise %@", buf, 0x16u);
    }
    self->_stateMachineEncounteredError = 1;
    [(SCDACoordinator *)self _enterState:0];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if (WeakRetained)
    {
      long long v19 = WeakRetained;
      id v20 = objc_loadWeakRetained(&self->_delegate);
      char v21 = objc_opt_respondsToSelector();

      if (v21)
      {
        id v22 = objc_loadWeakRetained(&self->_delegate);
        *(float *)&double v23 = a4;
        *(float *)&double v24 = a5;
        [v22 scdaAdvertisingWillBeginWithDelay:v23 advertisingInterval:v24];
      }
    }
    __int16 v25 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v42 = "-[SCDACoordinator _advertiseWith:afterDelay:maxInterval:voiceTriggerLatency:thenExecute:]";
      __int16 v43 = 2048;
      double v44 = a4;
      _os_log_impl(&dword_25C707000, v25, OS_LOG_TYPE_INFO, "%s BTLE starting advert delay timer for %f secs", buf, 0x16u);
    }
    if (a4 == 0.0)
    {
      ((void (**)(void, id, id))v15)[2](v15, v14, v13);
    }
    else
    {
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __89__SCDACoordinator__advertiseWith_afterDelay_maxInterval_voiceTriggerLatency_thenExecute___block_invoke_375;
      v30[3] = &unk_2654B7E78;
      v30[4] = self;
      float v34 = a4;
      float v35 = a5;
      long long v32 = v15;
      id v31 = v14;
      id v33 = v13;
      *(float *)&double v26 = a4;
      [(SCDACoordinator *)self _startTimer:@"advert delay" for:v30 thenExecute:v26];
    }
  }
}

void __89__SCDACoordinator__advertiseWith_afterDelay_maxInterval_voiceTriggerLatency_thenExecute___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  *(unsigned char *)(*(void *)(a1 + 32) + 324) = 0;
  uint64_t v7 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    v47 = "-[SCDACoordinator _advertiseWith:afterDelay:maxInterval:voiceTriggerLatency:thenExecute:]_block_invoke";
    __int16 v48 = 2112;
    uint64_t v49 = v8;
    _os_log_impl(&dword_25C707000, v7, OS_LOG_TYPE_INFO, "%s #scda BTLE delay finished, advertising: %@", buf, 0x16u);
  }
  [*(id *)(a1 + 32) _createElectionParticipantIdVendorIfRequired];
  [*(id *)(*(void *)(a1 + 32) + 360) fetchBTLEAddressIfRequired];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
    [v11 myriadCoordinator:*(void *)(a1 + 32) willStartAdvertisingUsingData:v5];
  }
  if ([*(id *)(a1 + 32) _shouldUseContextCollector]) {
    [*(id *)(a1 + 32) _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:*(float *)(a1 + 48) advertisementDelay:*(float *)(a1 + 52)];
  }
  id v12 = *(void **)(a1 + 32);
  int v13 = *(_DWORD *)(a1 + 48);
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __89__SCDACoordinator__advertiseWith_afterDelay_maxInterval_voiceTriggerLatency_thenExecute___block_invoke_366;
  v44[3] = &unk_2654B8100;
  v44[4] = v12;
  id v14 = v6;
  id v45 = v14;
  LODWORD(v15) = v13;
  [v12 _startTimer:@"advertise" for:v44 thenExecute:v15];
  kdebug_trace();
  int v16 = *(void **)(a1 + 32);
  if (v16[1] != 5)
  {
    __int16 v17 = (void *)v16[78];
    uint64_t v18 = objc_msgSend(v16, "_myriadStateForSelf:");
    int v20 = *(_DWORD *)(a1 + 48);
    int v19 = *(_DWORD *)(a1 + 52);
    int v21 = *(_DWORD *)(a1 + 56);
    id v22 = [*(id *)(*(void *)(a1 + 32) + 528) sessionId];
    uint64_t v23 = mach_absolute_time();
    LODWORD(v24) = v19;
    LODWORD(v25) = v20;
    LODWORD(v26) = v21;
    [v17 logCDAElectionAdvertisingStarting:v18 withDelay:v22 withInterval:v23 withVoiceTriggerLatency:v24 withCdaId:v25 withTimestamp:v26];
  }
  uint64_t v27 = getWPHeySiriAdvertisingData();
  id v28 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  double v29 = v28;
  if (v27) {
    [v28 setObject:v5 forKey:v27];
  }
  [*(id *)(a1 + 32) _enterBLEDiagnosticMode];
  uint64_t v30 = *(void **)(a1 + 32);
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __89__SCDACoordinator__advertiseWith_afterDelay_maxInterval_voiceTriggerLatency_thenExecute___block_invoke_2;
  v41[3] = &unk_2654B7BE0;
  v41[4] = v30;
  id v31 = v5;
  id v42 = v31;
  id v32 = v29;
  id v43 = v32;
  [v30 _waitWiProxAndExecute:v41];
  id v33 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
  if (v33)
  {
    float v34 = v33;
    id v35 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
    char v36 = objc_opt_respondsToSelector();

    if (v36)
    {
      id v37 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
      [v37 scdaAdvertisingDidBegin:*(void *)(a1 + 32)];
    }
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  uint64_t v38 = *(void *)(a1 + 32);
  float v39 = *(void **)(v38 + 240);
  if (v39)
  {
    float v40 = [*(id *)(v38 + 368) electionParticipantId];
    [v39 setElectionParticipantId:v40];
  }
}

uint64_t __89__SCDACoordinator__advertiseWith_afterDelay_maxInterval_voiceTriggerLatency_thenExecute___block_invoke_375(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v2 + 320) || *(unsigned char *)(v2 + 322)) && *(void *)(v2 + 8) == 1)
  {
    uint64_t v3 = [MEMORY[0x263EFF910] date];
    uint64_t v4 = [v3 dateByAddingTimeInterval:*(float *)(a1 + 64)];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 488);
    *(void *)(v5 + 488) = v4;

    uint64_t v7 = [MEMORY[0x263EFF910] date];
    uint64_t v8 = [v7 dateByAddingTimeInterval:(float)(*(float *)(a1 + 64) + *(float *)(a1 + 68))];
    uint64_t v9 = *(void *)(a1 + 32);
    char v10 = *(void **)(v9 + 496);
    *(void *)(v9 + 496) = v8;
  }
  id v11 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v11();
}

uint64_t __89__SCDACoordinator__advertiseWith_afterDelay_maxInterval_voiceTriggerLatency_thenExecute___block_invoke_366(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[1] == 1)
  {
    uint64_t v3 = (void *)v2[78];
    uint64_t v4 = [v2 _myriadStateForSelf:1];
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 528) sessionId];
    [v3 logCDAElectionTimerEnded:v4 withCdaId:v5 withTimestamp:mach_absolute_time()];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

uint64_t __89__SCDACoordinator__advertiseWith_afterDelay_maxInterval_voiceTriggerLatency_thenExecute___block_invoke_2(uint64_t result)
{
  uint64_t v1 = (void *)result;
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(result + 32);
  if (*(unsigned char *)(v2 + 319) || *(unsigned char *)(v2 + 314))
  {
    uint64_t v3 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = v3;
      uint64_t v5 = mach_absolute_time();
      unint64_t Milliseconds = SCDAMachAbsoluteTimeGetMilliseconds(v5);
      uint64_t v7 = v1[5];
      int v8 = 136315650;
      uint64_t v9 = "-[SCDACoordinator _advertiseWith:afterDelay:maxInterval:voiceTriggerLatency:thenExecute:]_block_invoke_2";
      __int16 v10 = 2048;
      unint64_t v11 = Milliseconds;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_25C707000, v4, OS_LOG_TYPE_INFO, "%s BTLE daemon asked to start advertise at: %lld %@", (uint8_t *)&v8, 0x20u);

      uint64_t v2 = v1[4];
    }
    [*(id *)(v2 + 352) startScanningAndAdvertisingWithData:v1[6]];
    *(unsigned char *)(v1[4] + 456) = 1;
    *(unsigned char *)(v1[4] + 457) = 1;
    return [*(id *)(v1[4] + 360) fetchBTLEAddressIfRequired];
  }
  return result;
}

- (void)_computeElectionParticipantIds:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  electionParticipantIdVendor = self->_electionParticipantIdVendor;
  if (!electionParticipantIdVendor)
  {
    int v8 = SCDALogContextCore;
    if (!os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_7;
    }
    int v11 = 136315138;
    __int16 v12 = "-[SCDACoordinator _computeElectionParticipantIds:]";
    uint64_t v9 = "%s #scda No electionParticipantIdVendor. ElectionParticipantId will not be created!";
LABEL_9:
    _os_log_debug_impl(&dword_25C707000, v8, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v11, 0xCu);
    goto LABEL_7;
  }
  if (!v4)
  {
    electionParticipantIds = self->_electionParticipantIds;
    self->_electionParticipantIds = 0;

    int v8 = SCDALogContextCore;
    if (!os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_7;
    }
    int v11 = 136315138;
    __int16 v12 = "-[SCDACoordinator _computeElectionParticipantIds:]";
    uint64_t v9 = "%s #scda No advertisement data. ElectionParticipantId will not be created!";
    goto LABEL_9;
  }
  id v6 = [(SCDAElectionParticipantIdVendor *)electionParticipantIdVendor computeIds:v4];
  uint64_t v7 = self->_electionParticipantIds;
  self->_electionParticipantIds = v6;

LABEL_7:
}

- (void)_createElectionParticipantIdVendorIfRequired
{
  obj = self;
  objc_sync_enter(obj);
  uint64_t v2 = obj;
  if (!obj->_electionParticipantIdVendor)
  {
    uint64_t v3 = objc_alloc_init(SCDAElectionParticipantIdVendor);
    electionParticipantIdVendor = obj->_electionParticipantIdVendor;
    obj->_electionParticipantIdVendor = v3;

    uint64_t v2 = obj;
  }
  objc_sync_exit(v2);
}

- (void)advertiseWith:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5
{
  id v8 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SCDACoordinator_advertiseWith_afterDelay_maxInterval___block_invoke;
  block[3] = &unk_2654B8178;
  void block[4] = self;
  id v12 = v8;
  float v13 = a4;
  float v14 = a5;
  id v10 = v8;
  dispatch_async(myriadWorkQueue, block);
}

uint64_t __56__SCDACoordinator_advertiseWith_afterDelay_maxInterval___block_invoke(uint64_t a1, double a2, double a3)
{
  *(void *)(*(void *)(a1 + 32) + 248) = 7;
  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  LODWORD(a3) = *(_DWORD *)(a1 + 52);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__SCDACoordinator_advertiseWith_afterDelay_maxInterval___block_invoke_2;
  v6[3] = &unk_2654B81C8;
  v6[4] = v4;
  return [v4 _advertiseWith:v3 afterDelay:v6 maxInterval:a2 voiceTriggerLatency:a3 thenExecute:0.0];
}

void __56__SCDACoordinator_advertiseWith_afterDelay_maxInterval___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 176);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SCDACoordinator_advertiseWith_afterDelay_maxInterval___block_invoke_3;
  block[3] = &unk_2654B81C8;
  void block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __56__SCDACoordinator_advertiseWith_afterDelay_maxInterval___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopAdvertisingAndListening];
}

- (void)advertiseWith:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__SCDACoordinator_advertiseWith___block_invoke;
  v7[3] = &unk_2654B7BB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

uint64_t __33__SCDACoordinator_advertiseWith___block_invoke(uint64_t a1, double a2, double a3)
{
  *(void *)(*(void *)(a1 + 32) + 248) = 7;
  LODWORD(a3) = 0.5;
  return [*(id *)(a1 + 32) _advertiseWith:*(void *)(a1 + 40) afterDelay:0 maxInterval:0.0 voiceTriggerLatency:a3 thenExecute:0.0];
}

- (void)_startAdvertising:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5
{
  self->_recordType = 7;
  id v10 = [a3 asAdvertisementData];
  *(float *)&double v8 = a4;
  *(float *)&double v9 = a5;
  [(SCDACoordinator *)self _advertiseWith:v10 afterDelay:0 maxInterval:v8 voiceTriggerLatency:v9 thenExecute:0.0];
}

- (void)startAdvertising:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5
{
  id v8 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SCDACoordinator_startAdvertising_afterDelay_maxInterval___block_invoke;
  block[3] = &unk_2654B8178;
  void block[4] = self;
  id v12 = v8;
  float v13 = a4;
  float v14 = a5;
  id v10 = v8;
  dispatch_async(myriadWorkQueue, block);
}

uint64_t __59__SCDACoordinator_startAdvertising_afterDelay_maxInterval___block_invoke(uint64_t a1, double a2, double a3)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  LODWORD(a3) = *(_DWORD *)(a1 + 52);
  return [*(id *)(a1 + 32) _startAdvertising:*(void *)(a1 + 40) afterDelay:a2 maxInterval:a3];
}

- (void)_advertiseIndefinite:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__SCDACoordinator__advertiseIndefinite___block_invoke;
  v6[3] = &unk_2654B7BB8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(SCDACoordinator *)self _waitWiProxAndExecute:v6];
}

void __40__SCDACoordinator__advertiseIndefinite___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = getWPHeySiriAdvertisingData();
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [*(id *)(a1 + 32) asAdvertisementData];
  if (v2) {
    [v3 setObject:v4 forKey:v2];
  }
  [*(id *)(a1 + 40) _enterBLEDiagnosticMode];
  uint64_t v5 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v5 + 319))
  {
    id v6 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      id v7 = v6;
      uint64_t v8 = mach_absolute_time();
      int v9 = 136315650;
      id v10 = "-[SCDACoordinator _advertiseIndefinite:]_block_invoke";
      __int16 v11 = 2048;
      unint64_t Milliseconds = SCDAMachAbsoluteTimeGetMilliseconds(v8);
      __int16 v13 = 2112;
      float v14 = v4;
      _os_log_impl(&dword_25C707000, v7, OS_LOG_TYPE_INFO, "%s BTLE daemon asked to start advertise at: %lld %@", (uint8_t *)&v9, 0x20u);

      uint64_t v5 = *(void *)(a1 + 40);
    }
    [*(id *)(v5 + 352) startScanningAndAdvertisingWithData:v3];
    *(unsigned char *)(*(void *)(a1 + 40) + 456) = 1;
    *(unsigned char *)(*(void *)(a1 + 40) + 457) = 1;
    [*(id *)(a1 + 40) _createElectionParticipantIdVendorIfRequired];
    [*(id *)(*(void *)(a1 + 40) + 360) fetchBTLEAddressIfRequired];
  }
}

- (void)_advertise:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5 voiceTriggerLatency:(float)a6 andMoveTo:(unint64_t)a7
{
  self->_nextState = a7;
  __int16 v11 = [a3 asAdvertisementData];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __83__SCDACoordinator__advertise_afterDelay_maxInterval_voiceTriggerLatency_andMoveTo___block_invoke;
  v14[3] = &unk_2654B81C8;
  v14[4] = self;
  *(float *)&double v12 = a5;
  *(float *)&double v13 = a6;
  [(SCDACoordinator *)self _advertiseWith:v11 afterDelay:v14 maxInterval:COERCE_DOUBLE((unint64_t)LODWORD(a4)) voiceTriggerLatency:v12 thenExecute:v13];
}

uint64_t __83__SCDACoordinator__advertise_afterDelay_maxInterval_voiceTriggerLatency_andMoveTo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) enterState:*(void *)(*(void *)(a1 + 32) + 16)];
}

- (void)_advertise:(id)a3 andMoveTo:(unint64_t)a4
{
  LODWORD(v4) = 0.75;
  [(SCDACoordinator *)self _advertise:a3 afterDelay:a4 maxInterval:0.0 voiceTriggerLatency:v4 andMoveTo:0.0];
}

- (void)_advertiseSuppressTriggerInOutput
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v3 = mach_absolute_time();
  if (_SCDAMachAbsoluteTimeRate_onceToken != -1) {
    dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_36);
  }
  double v4 = *(double *)&_SCDAMachAbsoluteTimeRate_rate;
  unint64_t voiceTriggerTime = self->_voiceTriggerTime;
  id v6 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    double v12 = v4 * (double)v3 / 1000000000.0
        - *(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)voiceTriggerTime / 1000000000.0;
    unint64_t previousState = self->_previousState;
    float v14 = v6;
    uint64_t v15 = [(SCDACoordinator *)self _stateAsString:previousState];
    int v16 = [(SCDACoordinator *)self _stateAsString:self->_myriadState];
    BOOL clientIsDeciding = self->_clientIsDeciding;
    unint64_t v18 = self->_voiceTriggerTime;
    *(_DWORD *)buf = 136316418;
    uint64_t v23 = "-[SCDACoordinator _advertiseSuppressTriggerInOutput]";
    __int16 v24 = 2112;
    double v25 = v15;
    __int16 v26 = 2112;
    uint64_t v27 = v16;
    __int16 v28 = 1024;
    BOOL v29 = clientIsDeciding;
    __int16 v30 = 2048;
    unint64_t v31 = v18;
    __int16 v32 = 2048;
    double v33 = v12;
    _os_log_debug_impl(&dword_25C707000, v14, OS_LOG_TYPE_DEBUG, "%s fromState: %@, myriadState: %@, is _clientIsDeciding: %d, _voiceTriggerTime: %llu, secondsSinceVoiceTrigger: %f", buf, 0x3Au);
  }
  if ([(SCDACoordinator *)self _okayToSuppressOnOutput])
  {
    float v21 = 0.5;
    *(_DWORD *)buf = 0;
    if (self->_outgoingTrigger)
    {
      float v21 = 1.0;
      self->_outgoingTrigger = 0;
    }
    if (self->_clientRespondingToCarPlay)
    {
      *(_DWORD *)buf = 0;
      float deviceInEarInterval = self->_deviceInEarInterval;
      float v21 = deviceInEarInterval;
    }
    int v20 = 0;
    if (self->_voiceTriggerTime) {
      [(SCDACoordinator *)self setupAdvIntervalsInDelay:buf interval:&v21 voiceTriggerLatency:&v20 withSlowdown:0];
    }
    uint64_t v8 = [(SCDARecord *)self->_triggerRecord asAdvertisementData];
    [(SCDACoordinator *)self _createMyriadSessionIfRequired];
    [(SCDACoordinator *)self _addElectionAdvertisementDataToMyriadSession:v8];
    *(float *)&double v10 = v21;
    LODWORD(v9) = *(_DWORD *)buf;
    LODWORD(v11) = v20;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __52__SCDACoordinator__advertiseSuppressTriggerInOutput__block_invoke;
    v19[3] = &unk_2654B81C8;
    v19[4] = self;
    [(SCDACoordinator *)self _advertiseWith:v8 afterDelay:v19 maxInterval:v9 voiceTriggerLatency:v10 thenExecute:v11];
  }
}

uint64_t __52__SCDACoordinator__advertiseSuppressTriggerInOutput__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _endAdvertising:0];
  [*(id *)(a1 + 32) _resetAudioData];
  uint64_t v2 = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 24);
  switch(v4)
  {
    case 0:
      goto LABEL_8;
    case 1:
    case 14:
      uint64_t v5 = (void *)SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
      {
        id v7 = v5;
        uint64_t v8 = [(id)v3 _stateAsString:v4];
        double v9 = [*(id *)(a1 + 32) _stateAsString:*(void *)(*(void *)(a1 + 32) + 8)];
        int v10 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 331);
        int v11 = 136315906;
        double v12 = "-[SCDACoordinator _advertiseSuppressTriggerInOutput]_block_invoke";
        __int16 v13 = 2112;
        float v14 = v8;
        __int16 v15 = 2112;
        int v16 = v9;
        __int16 v17 = 1024;
        int v18 = v10;
        _os_log_debug_impl(&dword_25C707000, v7, OS_LOG_TYPE_DEBUG, "%s fromState: %@, myriadState: %@, is _clientIsDeciding: %d", (uint8_t *)&v11, 0x26u);

        uint64_t v3 = *(void *)(a1 + 32);
      }
      if (*(unsigned char *)(v3 + 331)) {
        [(id)v3 _winElection];
      }
LABEL_8:
      uint64_t v2 = 2;
      break;
    case 2:
    case 6:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 16:
    case 17:
      uint64_t v2 = *(void *)(v3 + 24);
      break;
    case 3:
    case 4:
    case 5:
      objc_msgSend(*(id *)(a1 + 32), "_winElection", 0);
      uint64_t v2 = 4;
      break;
    case 7:
      uint64_t v2 = 10;
      break;
    default:
      return [*(id *)(a1 + 32) enterState:v2];
  }
  return [*(id *)(a1 + 32) enterState:v2];
}

- (BOOL)_okayToSuppressOnOutput
{
  return (self->_myriadState > 0x11) | (0x54B5u >> self->_myriadState) & 1;
}

- (void)_advertiseSlowdown
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  *(void *)&self->_delayTarget = 0x3F8000003EE66668;
  uint64_t v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    int v11 = "-[SCDACoordinator _advertiseSlowdown]";
    __int16 v12 = 2048;
    uint64_t v13 = 0x3FDCCCCD00000000;
    __int16 v14 = 2048;
    uint64_t v15 = 0x3FF0000000000000;
    _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s BTLE slowdown advertising delay: %f finished, interval: %f", buf, 0x20u);
  }
  self->_clientDoneRespondingToSlowdown = 0;
  maxSlowdownRecord = self->_maxSlowdownRecord;
  self->_maxSlowdownRecord = 0;

  kdebug_trace();
  uint64_t v5 = [(SCDACoordinator *)self slowdownRecord:LOWORD(self->_slowdownMsecs)];
  id v6 = [v5 asAdvertisementData];
  *(float *)&double v7 = self->_delayTarget;
  *(float *)&double v8 = self->_advertInterval;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__SCDACoordinator__advertiseSlowdown__block_invoke;
  v9[3] = &unk_2654B81C8;
  void v9[4] = self;
  [(SCDACoordinator *)self _advertiseWith:v6 afterDelay:v9 maxInterval:v7 voiceTriggerLatency:v8 thenExecute:COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(-2.0))];
}

uint64_t __37__SCDACoordinator__advertiseSlowdown__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    double v7 = "-[SCDACoordinator _advertiseSlowdown]_block_invoke";
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s BTLE ending slowdown advertising, 2nd pass not seen", (uint8_t *)&v6, 0xCu);
  }
  [*(id *)(a1 + 32) _endAdvertising:0];
  *(_DWORD *)(*(void *)(a1 + 32) + 296) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 328) = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 304);
  *(void *)(v3 + 304) = 0;

  return [*(id *)(a1 + 32) enterState:0];
}

- (void)_advertiseTrigger
{
  v46[2] = *(double *)MEMORY[0x263EF8340];
  float v40 = 0.5;
  float v41 = 0.0;
  int v39 = 0;
  if (self->_clientIsWatchTrumpPromote)
  {
    if (!self->_voiceTriggerTime) {
      goto LABEL_11;
    }
    goto LABEL_3;
  }
  if (self->_clientIsDirectActivating)
  {
    float deviceTrumpDelay = self->_deviceTrumpDelay;
    float v41 = deviceTrumpDelay;
    if (+[SCDAUtilities isATV]
      || +[SCDAUtilities isNano])
    {
      float v40 = 0.75;
    }
  }
  else if (self->_clientIsInEarActivation || self->_clientRespondingToCarPlay)
  {
    float deviceInEarDelay = self->_deviceInEarDelay;
    float deviceInEarInterval = self->_deviceInEarInterval;
    float v40 = deviceInEarInterval;
    float v41 = deviceInEarDelay;
  }
  else
  {
    if (self->_voiceTriggerTime)
    {
LABEL_3:
      [(SCDACoordinator *)self setupAdvIntervalsInDelay:&v41 interval:&v40 voiceTriggerLatency:&v39 withSlowdown:0];
      goto LABEL_11;
    }
    __int16 v30 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v43 = "-[SCDACoordinator _advertiseTrigger]";
      _os_log_error_impl(&dword_25C707000, v30, OS_LOG_TYPE_ERROR, "%s Undefined voice trigger time found, advertising for default interval.", buf, 0xCu);
    }
  }
LABEL_11:
  if (!self->_clientIsDirectActivating) {
    [(SCDANotifyStatePublisher *)self->_electionBeginPublisher publishState:[(SCDACoordinator *)self _nextElectionPublisherState]];
  }
  int v6 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int testInducedSlowdownMsecs = self->_testInducedSlowdownMsecs;
    int slowdownMsecs = self->_slowdownMsecs;
    double v9 = v6;
    int v10 = [(SCDACoordinator *)self _stateAsString];
    *(_DWORD *)buf = 136315906;
    id v43 = "-[SCDACoordinator _advertiseTrigger]";
    __int16 v44 = 1024;
    *(_DWORD *)id v45 = testInducedSlowdownMsecs;
    *(_WORD *)&v45[4] = 1024;
    *(_DWORD *)&v45[6] = slowdownMsecs;
    LOWORD(v46[0]) = 2112;
    *(void *)((char *)v46 + 2) = v10;
    _os_log_impl(&dword_25C707000, v9, OS_LOG_TYPE_INFO, "%s BTLE checking if slowdown needed testmsecs=%d msecs=%d state=%@", buf, 0x22u);
  }
  int v11 = self->_testInducedSlowdownMsecs;
  if (v11 < 1 || self->_clientDoneRespondingToSlowdown)
  {
    uint64_t v12 = self->_slowdownMsecs;
    if ((int)v12 <= 0)
    {
      uint64_t v13 = SCDALogContextCore;
    }
    else
    {
      uint64_t v13 = SCDALogContextCore;
      if (self->_clientIsRespondingToSlowdown)
      {
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          id v43 = "-[SCDACoordinator _advertiseTrigger]";
          _os_log_impl(&dword_25C707000, v13, OS_LOG_TYPE_INFO, "%s BTLE advertising slowdown delay, 2nd pass seen", buf, 0xCu);
          uint64_t v12 = self->_slowdownMsecs;
        }
        *(_DWORD *)buf = 0;
        int v33 = 0;
        int v34 = 1056964608;
        [(SCDACoordinator *)self setupAdvIntervalsInDelay:buf interval:&v34 voiceTriggerLatency:&v33 withSlowdown:v12];
        [(SCDACoordinator *)self _adjustActionWindowsFromSlowdown:self->_slowdownMsecs];
        id WeakRetained = objc_loadWeakRetained(&self->_delegate);
        char v15 = objc_opt_respondsToSelector();

        if (v15)
        {
          id v16 = objc_loadWeakRetained(&self->_delegate);
          *(float *)&double v17 = (float)self->_slowdownMsecs;
          [v16 myriadCoordinator:self willStartAdvertisingWithSlowDownInterval:v17];
        }
        self->_int slowdownMsecs = 0;
        self->_clientIsRespondingToSlowdown = 0;
        maxSlowdownRecord = self->_maxSlowdownRecord;
        self->_maxSlowdownRecord = 0;

        [(SCDARecord *)self->_triggerRecord generateTiebreaker];
        uint64_t v19 = [(SCDARecord *)self->_triggerRecord asAdvertisementData];
        LODWORD(v20) = *(_DWORD *)buf;
        LODWORD(v22) = v33;
        LODWORD(v21) = v34;
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __36__SCDACoordinator__advertiseTrigger__block_invoke_358;
        v32[3] = &unk_2654B81C8;
        v32[4] = self;
        uint64_t v23 = v32;
LABEL_28:
        [(SCDACoordinator *)self _advertiseWith:v19 afterDelay:v23 maxInterval:v20 voiceTriggerLatency:v21 thenExecute:v22];

        return;
      }
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      id v43 = "-[SCDACoordinator _advertiseTrigger]";
      __int16 v44 = 2048;
      *(double *)id v45 = v41;
      *(_WORD *)&v45[8] = 2048;
      v46[0] = v40;
      _os_log_impl(&dword_25C707000, v13, OS_LOG_TYPE_INFO, "%s BTLE computed advertising delay: %f finished, interval: %f", buf, 0x20u);
    }
    uint64_t v19 = [(SCDARecord *)self->_triggerRecord asAdvertisementData];
    *(float *)&double v21 = v40;
    *(float *)&double v20 = v41;
    LODWORD(v22) = v39;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __36__SCDACoordinator__advertiseTrigger__block_invoke_359;
    v31[3] = &unk_2654B81C8;
    v31[4] = self;
    uint64_t v23 = v31;
    goto LABEL_28;
  }
  __int16 v24 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v43 = "-[SCDACoordinator _advertiseTrigger]";
    _os_log_impl(&dword_25C707000, v24, OS_LOG_TYPE_INFO, "%s BTLE advertising TEST INDUCED slowdown delay, 2nd pass seen", buf, 0xCu);
    int v11 = self->_testInducedSlowdownMsecs;
  }
  self->_delayTarget = v41;
  self->_advertInterval = v40;
  double v25 = [(SCDACoordinator *)self slowdownRecord:(unsigned __int16)v11];
  __int16 v26 = [v25 asAdvertisementData];

  self->_int slowdownMsecs = 0;
  self->_clientIsRespondingToSlowdown = 0;
  uint64_t v27 = self->_maxSlowdownRecord;
  self->_maxSlowdownRecord = 0;

  *(float *)&double v28 = self->_delayTarget;
  *(float *)&double v29 = self->_advertInterval;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __36__SCDACoordinator__advertiseTrigger__block_invoke;
  v35[3] = &unk_2654B7E28;
  float v36 = v41;
  float v37 = v40;
  int v38 = v39;
  v35[4] = self;
  [(SCDACoordinator *)self _advertiseWith:v26 afterDelay:v35 maxInterval:v28 voiceTriggerLatency:v29 thenExecute:COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(-3.0))];
}

void __36__SCDACoordinator__advertiseTrigger__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(a1 + 40);
  int v11 = *(_DWORD *)(a1 + 44);
  int v12 = v2;
  int v10 = *(_DWORD *)(a1 + 48);
  [*(id *)(a1 + 32) setupAdvIntervalsInDelay:&v12 interval:&v11 voiceTriggerLatency:&v10 withSlowdown:*(unsigned int *)(*(void *)(a1 + 32) + 300)];
  [*(id *)(a1 + 32) _adjustActionWindowsFromSlowdown:*(unsigned int *)(*(void *)(a1 + 32) + 300)];
  [*(id *)(*(void *)(a1 + 32) + 240) generateTiebreaker];
  uint64_t v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v14 = "-[SCDACoordinator _advertiseTrigger]_block_invoke";
    _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s BTLE advertising slowdown finished, advertising delayed trigger", buf, 0xCu);
  }
  uint64_t v4 = *(id **)(a1 + 32);
  uint64_t v5 = [v4[30] asAdvertisementData];
  LODWORD(v7) = v11;
  LODWORD(v6) = v12;
  LODWORD(v8) = v10;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __36__SCDACoordinator__advertiseTrigger__block_invoke_354;
  v9[3] = &unk_2654B81C8;
  void v9[4] = *(void *)(a1 + 32);
  [v4 _advertiseWith:v5 afterDelay:v9 maxInterval:v6 voiceTriggerLatency:v7 thenExecute:v8];
}

void __36__SCDACoordinator__advertiseTrigger__block_invoke_358(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = objc_alloc_init(MEMORY[0x263EFFA08]);
  [v1 _endAdvertisingWithDeviceProhibitions:v2];
}

void __36__SCDACoordinator__advertiseTrigger__block_invoke_359(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = objc_alloc_init(MEMORY[0x263EFFA08]);
  [v1 _endAdvertisingWithDeviceProhibitions:v2];
}

void __36__SCDACoordinator__advertiseTrigger__block_invoke_354(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = objc_alloc_init(MEMORY[0x263EFFA08]);
  [v1 _endAdvertisingWithDeviceProhibitions:v2];
}

- (void)_resetAdvertisementTimings
{
  advertTriggerAdvStartTime = self->_advTiming.advertTriggerAdvStartTime;
  self->_advTiming.advertTriggerAdvStartTime = 0;

  advertTriggerEndTime = self->_advTiming.advertTriggerEndTime;
  self->_advTiming.advertTriggerEndTime = 0;
}

- (void)setupAdvIntervalsInDelay:(float *)a3 interval:(float *)a4 voiceTriggerLatency:(float *)a5 withSlowdown:(int)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  double v11 = (double)a6 / 1000.0;
  unint64_t voiceTriggerTime = self->_voiceTriggerTime;
  if (_SCDAMachAbsoluteTimeRate_onceToken != -1) {
    dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_36);
  }
  float v13 = v11;
  double v14 = *(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)voiceTriggerTime / 1000000000.0;
  uint64_t v15 = mach_absolute_time();
  if (_SCDAMachAbsoluteTimeRate_onceToken != -1) {
    dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_36);
  }
  double v16 = *(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)v15 / 1000000000.0;
  double v17 = v16 - v14;
  double v18 = v13;
  float v19 = v14 + 1.45000005 + v18 - v16;
  double v20 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v27 = 136316674;
    double v28 = "-[SCDACoordinator setupAdvIntervalsInDelay:interval:voiceTriggerLatency:withSlowdown:]";
    __int16 v29 = 2048;
    double v30 = v14;
    __int16 v31 = 2048;
    double v32 = v16 - v14;
    __int16 v33 = 2048;
    double v34 = v14 + 1.45000005 + v18;
    __int16 v35 = 2048;
    double v36 = v19;
    __int16 v37 = 1024;
    int v38 = a6;
    __int16 v39 = 2048;
    double v40 = v16;
    _os_log_impl(&dword_25C707000, v20, OS_LOG_TYPE_INFO, "%s endTime: %f, timeSinceVoiceTrigger: %f, targetTime: %f, advInterval: %f, slowDown: %d (ms), timeSinceDeviceBoot: %f", (uint8_t *)&v27, 0x44u);
  }
  float v21 = 1.0;
  if (v19 <= 1.0)
  {
    float v22 = 0.0;
    float v21 = 0.5;
    if (v19 >= 0.5) {
      float v21 = v19;
    }
  }
  else if ((float)(v19 + -1.0) <= 0.45)
  {
    float v22 = v19 + -1.0;
  }
  else
  {
    float v22 = 0.0;
  }
  if (SCDAIsInternalInstall_onceToken != -1) {
    dispatch_once(&SCDAIsInternalInstall_onceToken, &__block_literal_global_1260);
  }
  if (SCDAIsInternalInstall_isInternal)
  {
    [(SCDAPreferences *)self->_preferences testDeviceDelay];
    if (v23 != 0.0) {
      float v22 = v23;
    }
    __int16 v24 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      int v27 = 136315906;
      double v28 = "-[SCDACoordinator setupAdvIntervalsInDelay:interval:voiceTriggerLatency:withSlowdown:]";
      __int16 v29 = 2048;
      double v30 = v21;
      __int16 v31 = 2048;
      double v32 = v22;
      __int16 v33 = 2048;
      double v34 = v18;
      double v25 = "%s adjusted advInterval: %f (secs) device delay: %f (secs), slowDown: %f (secs)";
LABEL_22:
      _os_log_impl(&dword_25C707000, v24, OS_LOG_TYPE_INFO, v25, (uint8_t *)&v27, 0x2Au);
    }
  }
  else
  {
    __int16 v24 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      int v27 = 136315906;
      double v28 = "-[SCDACoordinator setupAdvIntervalsInDelay:interval:voiceTriggerLatency:withSlowdown:]";
      __int16 v29 = 2048;
      double v30 = v21;
      __int16 v31 = 2048;
      double v32 = v22;
      __int16 v33 = 2048;
      double v34 = v18;
      double v25 = "%s adjusted advInterval: %f (secs) adjusted delay: %f (secs), slowDown: %f (secs)";
      goto LABEL_22;
    }
  }
  *a3 = v22;
  *a4 = v21;
  float v26 = v17;
  *a5 = v26;
}

- (void)_duringNextWindowEnterState:(unint64_t)a3
{
  self->_nextState = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__SCDACoordinator__duringNextWindowEnterState___block_invoke;
  v5[3] = &unk_2654B7D38;
  objc_copyWeak(v6, &location);
  v6[1] = (id)a3;
  [(SCDACoordinator *)self _duringNextWindowExecute:v5];
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __47__SCDACoordinator__duringNextWindowEnterState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained enterState:*(void *)(a1 + 40)];
}

- (void)_duringNextWindowExecute:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_triggerTime)
  {
    uint64_t v5 = [MEMORY[0x263EFF910] date];
    double v6 = [MEMORY[0x263EFF910] dateWithTimeInterval:self->_triggerTime sinceDate:(float)((float)self->_nDeltaTs * 1.5)];
    if ([v6 compare:v5] == -1)
    {
      do
      {
        int v8 = self->_nDeltaTs + 1;
        self->_nDeltaTs = v8;
        double v7 = [MEMORY[0x263EFF910] dateWithTimeInterval:self->_triggerTime sinceDate:(float)((float)v8 * 1.5)];

        double v6 = v7;
      }
      while ([v7 compare:v5] == -1);
    }
    else
    {
      double v7 = v6;
    }
    double v9 = [(NSDateFormatter *)self->_dateFormat stringFromDate:v7];
    int v10 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315394;
      float v13 = "-[SCDACoordinator _duringNextWindowExecute:]";
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_25C707000, v10, OS_LOG_TYPE_INFO, "%s BTLE next action window: %@", (uint8_t *)&v12, 0x16u);
    }
    [(SCDACoordinator *)self _createDispatchTimerForEvent:v7 toExecute:v4];
  }
  else
  {
    double v11 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      float v13 = "-[SCDACoordinator _duringNextWindowExecute:]";
      _os_log_error_impl(&dword_25C707000, v11, OS_LOG_TYPE_ERROR, "%s BTLE Attempt to execute time windowed action when trigger time not initialized", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)_adjustActionWindowsFromSlowdown:(int)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v5 = [(NSDate *)self->_triggerTime dateByAddingTimeInterval:(double)a3 / 1000.0];
    triggerTime = self->_triggerTime;
    self->_triggerTime = v5;

    double v7 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      dateFormat = self->_dateFormat;
      double v9 = self->_triggerTime;
      int v10 = v7;
      double v11 = [(NSDateFormatter *)dateFormat stringFromDate:v9];
      int v12 = 136315650;
      float v13 = "-[SCDACoordinator _adjustActionWindowsFromSlowdown:]";
      __int16 v14 = 1024;
      int v15 = a3;
      __int16 v16 = 2112;
      double v17 = v11;
      _os_log_debug_impl(&dword_25C707000, v10, OS_LOG_TYPE_DEBUG, "%s BTLE action window adjusted by slowdown signal %d msecs new time: %@", (uint8_t *)&v12, 0x1Cu);
    }
  }
}

- (void)_resetActionWindows
{
  triggerTime = self->_triggerTime;
  self->_triggerTime = 0;

  self->_int slowdownMsecs = 0;
}

- (void)_setupActionWindows
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF910] date];
  triggerTime = self->_triggerTime;
  self->_triggerTime = v3;

  self->_nDeltaTs = 0;
  uint64_t v5 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    dateFormat = self->_dateFormat;
    double v7 = self->_triggerTime;
    int v8 = v5;
    double v9 = [(NSDateFormatter *)dateFormat stringFromDate:v7];
    int v10 = 136315394;
    double v11 = "-[SCDACoordinator _setupActionWindows]";
    __int16 v12 = 2112;
    float v13 = v9;
    _os_log_debug_impl(&dword_25C707000, v8, OS_LOG_TYPE_DEBUG, "%s BTLE action window trigger time: %@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)_resetAudioData
{
  self->_unint64_t voiceTriggerTime = 0;
}

- (void)_pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:(double)a3 advertisementDelay:(double)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  BOOL v7 = +[SCDAUtilities isNano];
  if (v7 || self->_clientIsDirectActivating || self->_clientIsInEarActivation)
  {
    int v8 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      BOOL clientIsDirectActivating = self->_clientIsDirectActivating;
      *(_DWORD *)buf = 136315650;
      __int16 v39 = "-[SCDACoordinator _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertisementDelay:]";
      __int16 v40 = 1024;
      *(_DWORD *)uint64_t v41 = !v7;
      *(_WORD *)&v41[4] = 1024;
      *(_DWORD *)&v41[6] = clientIsDirectActivating;
      _os_log_impl(&dword_25C707000, v8, OS_LOG_TYPE_INFO, "%s #scda Not pushing myriad advertisement context - HAL enabled: %d, direct activation: %d", buf, 0x18u);
    }
  }
  else
  {
    uint64_t v10 = mach_absolute_time();
    if (_SCDAMachAbsoluteTimeRate_onceToken != -1) {
      dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_36);
    }
    double v11 = *(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)v10 / 1000000000.0
        - *(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)self->_voiceTriggerTime / 1000000000.0;
    if (v11 >= 0.0)
    {
      __int16 v12 = [MEMORY[0x263EFF910] date];
      [v12 timeIntervalSinceReferenceDate];
      double v14 = v13;
      double v15 = v13 - v11;
      __int16 v16 = [(SCDASession *)self->_myriadSession currentElectionAdvertisementData];
      double v17 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        unint64_t voiceTriggerTime = self->_voiceTriggerTime;
        *(_DWORD *)buf = 136316674;
        __int16 v39 = "-[SCDACoordinator _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertisementDelay:]";
        __int16 v40 = 2048;
        *(double *)uint64_t v41 = v14;
        *(_WORD *)&v41[8] = 2048;
        *(double *)&v41[10] = v15;
        *(_WORD *)&v41[18] = 2048;
        *(double *)&v41[20] = v11;
        __int16 v42 = 2048;
        unint64_t v43 = voiceTriggerTime;
        __int16 v44 = 2048;
        uint64_t v45 = v10;
        __int16 v46 = 2112;
        v47 = v16;
        _os_log_impl(&dword_25C707000, v17, OS_LOG_TYPE_INFO, "%s #scda adv dispatch time: %f, voice trigger end time: %f, time since voice trigger: %f (curr time: %llu, time since device boot: %llu), advertisment: %@", buf, 0x48u);
      }
      if (v16)
      {
        float v19 = [SCDAAdvertisementContextRecord alloc];
        int64_t recordType = self->_recordType;
        designatedSelfID = self->_designatedSelfID;
        float v22 = [(SCDAElectionParticipantIds *)self->_electionParticipantIds electionParticipantId];
        double v23 = [(SCDAAdvertisementContextRecord *)v19 initWithAdvertisementRecordType:recordType voiceTriggerEndTime:v16 advertisementPayload:designatedSelfID deviceID:v22 electionParticipantId:v15];
        contextRecord = self->_contextRecord;
        self->_contextRecord = v23;

        [(SCDAAdvertisementContextRecord *)self->_contextRecord setAdvertisementDispatchTime:v14];
        double v25 = [(SCDAAdvertisementContextRecord *)self->_contextRecord myriadAdvertisementContextAsData];
        float v26 = [(SCDASession *)self->_myriadSession currentElectionAdvertisementId];
        int v27 = [SCDAAdvertisementContext alloc];
        [(SCDACoordinator *)self _contextFetchDelayForAdvertimentInterval:a3 advertisementDelay:a4];
        double v28 = -[SCDAAdvertisementContext initWithGeneration:contextData:contextFetchDelay:](v27, "initWithGeneration:contextData:contextFetchDelay:", 0, v25);
        advContextManager = self->_advContextManager;
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __113__SCDACoordinator__pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval_advertisementDelay___block_invoke;
        v33[3] = &unk_2654B7E00;
        v33[4] = self;
        id v34 = v26;
        double v36 = v15;
        double v37 = v14;
        id v35 = v16;
        id v30 = v26;
        [(SCDAAdvertisementContextManager *)advContextManager pushSCDAAdvertisementContext:v28 completionHandler:v33];
      }
      else
      {
        __int16 v31 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
        {
          unint64_t v32 = self->_voiceTriggerTime;
          *(_DWORD *)buf = 136315906;
          __int16 v39 = "-[SCDACoordinator _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertisementDelay:]";
          __int16 v40 = 1024;
          *(_DWORD *)uint64_t v41 = 1;
          *(_WORD *)&v41[4] = 2048;
          *(void *)&v41[6] = v32;
          *(_WORD *)&v41[14] = 2048;
          *(void *)&v41[16] = v10;
          _os_log_impl(&dword_25C707000, v31, OS_LOG_TYPE_INFO, "%s #scda Not pushing myriad advertisement context - Valid voicetrigger endtime: %d (curr time: %llu, time since device boot: %llu)", buf, 0x26u);
        }
      }
    }
  }
}

void __113__SCDACoordinator__pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval_advertisementDelay___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  int v8 = *(NSObject **)(v7 + 176);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __113__SCDACoordinator__pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval_advertisementDelay___block_invoke_2;
  block[3] = &unk_2654B7DD8;
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = *(id *)(a1 + 40);
  id v15 = v5;
  long long v17 = *(_OWORD *)(a1 + 56);
  id v16 = *(id *)(a1 + 48);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __113__SCDACoordinator__pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval_advertisementDelay___block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v27 = "-[SCDACoordinator _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertisementDela"
          "y:]_block_invoke_2";
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s #scda Pushing Myriad advertisement context is complete", buf, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v4 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v27 = "-[SCDACoordinator _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertisementDe"
            "lay:]_block_invoke";
      __int16 v28 = 2112;
      uint64_t v29 = v3;
      _os_log_error_impl(&dword_25C707000, v4, OS_LOG_TYPE_ERROR, "%s #scda Error: %@", buf, 0x16u);
    }
  }
  else
  {
    id v5 = [*(id *)(*(void *)(a1 + 40) + 528) currentElectionAdvertisementId];
    id v6 = *(void **)(a1 + 48);
    if (v6 && v5 && ([v6 isEqual:v5] & 1) != 0)
    {
      if ([*(id *)(a1 + 40) _shouldUseContextCollector])
      {
        double v20 = v5;
        uint64_t v7 = [*(id *)(a1 + 40) _testAndFilterAdvertisementsFromContextCollector:*(void *)(a1 + 56) voiceTriggerEndTime:*(void *)(a1 + 64) advertisementDispatchTime:*(double *)(a1 + 72) advertisement:*(double *)(a1 + 80)];
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v22 != v10) {
                objc_enumerationMutation(v7);
              }
              id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              if ([*(id *)(a1 + 40) _testAndUpdateWedgeFilter:v12])
              {
                uint64_t v13 = *(void **)(a1 + 40);
                id v14 = [v12 deviceID];
                id v15 = [v14 UUIDString];
                id v16 = [v12 asAdvertisementData];
                [v13 _updateRepliesWith:v12 id:v15 data:v16];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
          }
          while (v9);
        }
        [*(id *)(a1 + 40) _suppressDeviceIfNeededWithVoiceTriggerEndTime:*(double *)(a1 + 72) adverisementDispatchTime:*(double *)(a1 + 80)];

        id v5 = v20;
      }
      else
      {
        float v19 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          int v27 = "-[SCDACoordinator _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertiseme"
                "ntDelay:]_block_invoke";
          _os_log_debug_impl(&dword_25C707000, v19, OS_LOG_TYPE_DEBUG, "%s #scda _shouldUseContextCollector is fslse", buf, 0xCu);
        }
      }
    }
    else
    {
      long long v17 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 136315650;
        int v27 = "-[SCDACoordinator _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertisement"
              "Delay:]_block_invoke";
        __int16 v28 = 2112;
        uint64_t v29 = v18;
        __int16 v30 = 2112;
        __int16 v31 = v5;
        _os_log_impl(&dword_25C707000, v17, OS_LOG_TYPE_INFO, "%s #scda current advId: %@ is different from the advId for which the myriad context was dispatched: %@", buf, 0x20u);
      }
    }
  }
}

- (void)_suppressDeviceIfNeededWithVoiceTriggerEndTime:(double)a3 adverisementDispatchTime:(double)a4
{
  double v7 = a4 - a3;
  if (v7 >= 0.0) {
    double v8 = v7;
  }
  else {
    double v8 = -v7;
  }
  uint64_t v9 = [(NSMutableDictionary *)self->_replies count];
  if (v8 > 1.45000005 && v9 != 0)
  {
    replies = self->_replies;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __91__SCDACoordinator__suppressDeviceIfNeededWithVoiceTriggerEndTime_adverisementDispatchTime___block_invoke;
    v20[3] = &unk_2654B7DB0;
    *(double *)&v20[5] = a3;
    *(double *)&v20[6] = a4;
    *(double *)&v20[7] = v8;
    v20[8] = v9;
    v20[4] = self;
    [(NSMutableDictionary *)replies enumerateKeysAndObjectsUsingBlock:v20];
  }
  if (self->_suppressLateTrigger)
  {
    myriadInstrumentation = self->_myriadInstrumentation;
    uint64_t v13 = [(SCDACoordinator *)self _myriadStateForSelf:self->_myriadState];
    id v15 = [(SCDASession *)self->_myriadSession sessionId];
    uint64_t v16 = mach_absolute_time();
    LODWORD(v17) = -1.0;
    LODWORD(v18) = 0.75;
    float v14 = v8;
    *(float *)&double v19 = v14;
    [(SCDAInstrumentation *)myriadInstrumentation logCDAElectionAdvertisingStarting:v13 withDelay:v15 withInterval:v16 withVoiceTriggerLatency:v17 withCdaId:v18 withTimestamp:v19];
  }
}

void __91__SCDACoordinator__suppressDeviceIfNeededWithVoiceTriggerEndTime_adverisementDispatchTime___block_invoke(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (([a3 isMe] & 1) == 0)
  {
    id v6 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = a1[5];
      uint64_t v8 = a1[6];
      uint64_t v9 = a1[7];
      uint64_t v10 = a1[8];
      int v11 = 136316162;
      id v12 = "-[SCDACoordinator _suppressDeviceIfNeededWithVoiceTriggerEndTime:adverisementDispatchTime:]_block_invoke";
      __int16 v13 = 2048;
      uint64_t v14 = v7;
      __int16 v15 = 2048;
      uint64_t v16 = v8;
      __int16 v17 = 2048;
      uint64_t v18 = v9;
      __int16 v19 = 2048;
      uint64_t v20 = v10;
      _os_log_impl(&dword_25C707000, v6, OS_LOG_TYPE_INFO, "%s #scda Suppressing the current device due to late trigger (voicetrigger endtime: %f, advertisement dispatch time: %f, advertisement delay: %f, myriad record count: %ld)", (uint8_t *)&v11, 0x34u);
    }
    *(unsigned char *)(a1[4] + 433) = 1;
    *a4 = 1;
  }
}

- (id)_testAndFilterAdvertisementsFromContextCollector:(id)a3 voiceTriggerEndTime:(double)a4 advertisementDispatchTime:(double)a5 advertisement:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a6;
  if (v9 && [v9 count])
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __128__SCDACoordinator__testAndFilterAdvertisementsFromContextCollector_voiceTriggerEndTime_advertisementDispatchTime_advertisement___block_invoke;
    v29[3] = &unk_2654B7D88;
    double v32 = a4;
    v29[4] = self;
    id v30 = v10;
    id v12 = v11;
    id v31 = v12;
    id v24 = v9;
    [v9 enumerateKeysAndObjectsUsingBlock:v29];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = SCDALogContextCore;
          if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
          {
            uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8 * i);
            *(_DWORD *)buf = 136315394;
            id v34 = "-[SCDACoordinator _testAndFilterAdvertisementsFromContextCollector:voiceTriggerEndTime:advertisementDi"
                  "spatchTime:advertisement:]";
            __int16 v35 = 2112;
            uint64_t v36 = v19;
            _os_log_impl(&dword_25C707000, v18, OS_LOG_TYPE_INFO, "%s #scda %@", buf, 0x16u);
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v37 count:16];
      }
      while (v15);
    }

    uint64_t v20 = v31;
    id v21 = v13;

    id v9 = v24;
  }
  else
  {
    long long v22 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v34 = "-[SCDACoordinator _testAndFilterAdvertisementsFromContextCollector:voiceTriggerEndTime:advertisementDispatch"
            "Time:advertisement:]";
      _os_log_impl(&dword_25C707000, v22, OS_LOG_TYPE_INFO, "%s #scda Context collector returned 0 SCDAAdvertisementContextRecords instances", buf, 0xCu);
    }
    id v21 = 0;
  }

  return v21;
}

void __128__SCDACoordinator__testAndFilterAdvertisementsFromContextCollector_voiceTriggerEndTime_advertisementDispatchTime_advertisement___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v6 isSaneForVoiceTriggerEndTime:*(double *)(a1 + 56) endtimeDistanceThreshold:*(double *)(*(void *)(a1 + 32) + 144)])
  {
    uint64_t v7 = [v6 recordForDeviceId:v5];
    uint64_t v8 = v7;
    if (v7)
    {
      if ([v7 deviceGroup] == *(unsigned __int8 *)(*(void *)(a1 + 32) + 168))
      {
        id v9 = [v8 deviceID];
        if ([v9 isEqual:*(void *)(*(void *)(a1 + 32) + 376)])
        {
        }
        else
        {
          char v15 = [v6 compareAdvertisementPayload:*(void *)(a1 + 40)];

          if ((v15 & 1) == 0) {
            [*(id *)(a1 + 48) addObject:v8];
          }
        }
      }
      else
      {
        id v10 = (void *)SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
        {
          id v11 = v10;
          int v12 = [v8 deviceGroup];
          id v13 = [v8 deviceID];
          uint64_t v14 = [v6 advertisementPayload];
          int v16 = 136315906;
          __int16 v17 = "-[SCDACoordinator _testAndFilterAdvertisementsFromContextCollector:voiceTriggerEndTime:advertisementDisp"
                "atchTime:advertisement:]_block_invoke";
          __int16 v18 = 1024;
          int v19 = v12;
          __int16 v20 = 2112;
          id v21 = v13;
          __int16 v22 = 2112;
          long long v23 = v14;
          _os_log_impl(&dword_25C707000, v11, OS_LOG_TYPE_INFO, "%s #scda ignoring advert from other deviceGroup %d: %@ data=%@", (uint8_t *)&v16, 0x26u);
        }
      }
    }
  }
}

- (BOOL)_shouldUseContextCollector
{
  unint64_t myriadState = self->_myriadState;
  return myriadState == 1 || myriadState == 14;
}

- (double)_contextFetchDelayForAdvertimentInterval:(double)a3 advertisementDelay:(double)a4
{
  return a3 + -0.2;
}

- (void)_handleStateMachineErrorIfNeeded
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (self->_stateMachineEncounteredError)
  {
    uint64_t v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      id v11 = "-[SCDACoordinator _handleStateMachineErrorIfNeeded]";
      _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s BTLE notify Myriad win due to state machine error", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v4 = mach_absolute_time();
    if (_SCDAMachAbsoluteTimeRate_onceToken != -1) {
      dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_36);
    }
    self->_lastDecisionTime = (unint64_t)(*(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)v4);
    if (SCDAIsInternalInstall_onceToken != -1) {
      dispatch_once(&SCDAIsInternalInstall_onceToken, &__block_literal_global_1260);
    }
    if (SCDAIsInternalInstall_isInternal) {
      [(SCDACoordinator *)self _triggerABCForType:@"state_machine_error" context:0];
    }
    self->_lastDecision = 1;
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if (WeakRetained)
    {
      id v6 = WeakRetained;
      id v7 = objc_loadWeakRetained(&self->_delegate);
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        id v9 = objc_loadWeakRetained(&self->_delegate);
        [v9 scdaShouldContinue:self];
      }
    }
    kdebug_trace();
    [(SCDANotifyStatePublisher *)self->_electionWinPublisher publishState:[(SCDACoordinator *)self _nextElectionPublisherState]];
    self->_stateMachineEncounteredError = 0;
  }
}

- (void)_unduck
{
  if (self->_coordinationEnabled)
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if (WeakRetained)
    {
      id v5 = WeakRetained;
      id v6 = objc_loadWeakRetained(p_delegate);
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = objc_loadWeakRetained(p_delegate);
        [v8 scdaShouldUnduck:self];
      }
    }
  }
}

- (void)_stopAdvertisingAndListening
{
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __47__SCDACoordinator__stopAdvertisingAndListening__block_invoke;
  v13[3] = &unk_2654B81C8;
  v13[4] = self;
  [(SCDACoordinator *)self _waitWiProx:2000 andExecute:v13];
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained(&self->_delegate);
      [v7 scdaAdvertisingDidEnd:self];
    }
  }
  id v8 = objc_loadWeakRetained(&self->_delegate);
  if (v8)
  {
    id v9 = v8;
    id v10 = objc_loadWeakRetained(&self->_delegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_loadWeakRetained(&self->_delegate);
      [v12 scdaListeningDidEnd:self];
    }
  }
}

void __47__SCDACoordinator__stopAdvertisingAndListening__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[SCDACoordinator _stopAdvertisingAndListening]_block_invoke";
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s BTLE stopping advertising and scanning of HeySiri advertisements", (uint8_t *)&v4, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 319))
  {
    [*(id *)(v3 + 352) stopScanningAndAdvertising];
    *(unsigned char *)(*(void *)(a1 + 32) + 456) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 457) = 0;
  }
}

- (void)stopListening:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__SCDACoordinator_stopListening___block_invoke;
  v7[3] = &unk_2654B8100;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

uint64_t __33__SCDACoordinator_stopListening___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopListening:*(void *)(a1 + 40)];
}

- (void)stopListening
{
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__SCDACoordinator_stopListening__block_invoke;
  block[3] = &unk_2654B81C8;
  void block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

uint64_t __32__SCDACoordinator_stopListening__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopListening:0];
}

- (void)_stopListening:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    int v19 = "-[SCDACoordinator _stopListening:]";
    _os_log_debug_impl(&dword_25C707000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __34__SCDACoordinator__stopListening___block_invoke;
  char v15 = &unk_2654B8100;
  int v16 = self;
  id v6 = v4;
  id v17 = v6;
  [(SCDACoordinator *)self _waitWiProxAndExecute:&v12];
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v9 = objc_loadWeakRetained(&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v11, "scdaListeningDidEnd:", self, v12, v13, v14, v15, v16);
    }
  }
}

uint64_t __34__SCDACoordinator__stopListening___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[SCDACoordinator _stopListening:]_block_invoke";
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s BTLE stopping to scan HeySiri advertisements", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 319))
  {
    [*(id *)(v3 + 352) stopScanning];
    *(unsigned char *)(*(void *)(a1 + 32) + 456) = 0;
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_stopAdvertising:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    int v19 = "-[SCDACoordinator _stopAdvertising:]";
    _os_log_debug_impl(&dword_25C707000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __36__SCDACoordinator__stopAdvertising___block_invoke;
  char v15 = &unk_2654B8100;
  int v16 = self;
  id v6 = v4;
  id v17 = v6;
  [(SCDACoordinator *)self _waitWiProxAndExecute:&v12];
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v9 = objc_loadWeakRetained(&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v11, "scdaAdvertisingDidEnd:", self, v12, v13, v14, v15, v16);
    }
  }
}

uint64_t __36__SCDACoordinator__stopAdvertising___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[SCDACoordinator _stopAdvertising:]_block_invoke";
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s BTLE stopping advertising HeySiri advertisements", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 319))
  {
    [*(id *)(v3 + 352) stopAdvertising];
    *(unsigned char *)(*(void *)(a1 + 32) + 457) = 0;
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)_shouldStopListeningBeforeAdvertising
{
  return (self->_previousState < 0x12) & (0x37FFCu >> self->_previousState);
}

- (void)startListening:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__SCDACoordinator_startListening___block_invoke;
  v7[3] = &unk_2654B8100;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

uint64_t __34__SCDACoordinator_startListening___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startListening:*(void *)(a1 + 40)];
}

- (void)startListening
{
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SCDACoordinator_startListening__block_invoke;
  block[3] = &unk_2654B81C8;
  void block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

uint64_t __33__SCDACoordinator_startListening__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startListening:0];
}

- (void)_startListeningAfterWiProxIsReady:(BOOL)a3 inState:(unint64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a5;
  if (v6 && !self->_BTLEReady)
  {
    id v9 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int v16 = "-[SCDACoordinator _startListeningAfterWiProxIsReady:inState:completion:]";
      __int16 v17 = 2048;
      unint64_t v18 = a4;
      _os_log_impl(&dword_25C707000, v9, OS_LOG_TYPE_INFO, "%s Waiting for wiprox to be ready in state: %lu", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __72__SCDACoordinator__startListeningAfterWiProxIsReady_inState_completion___block_invoke;
    v12[3] = &unk_2654B7D60;
    objc_copyWeak(v14, (id *)buf);
    v14[1] = (id)a4;
    id v13 = v8;
    char v10 = (void *)MEMORY[0x261192180](v12);
    id waitForWiproxReadinessToScan = self->_waitForWiproxReadinessToScan;
    self->_id waitForWiproxReadinessToScan = v10;

    objc_destroyWeak(v14);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(SCDACoordinator *)self _startListening:v8];
  }
}

void __72__SCDACoordinator__startListeningAfterWiProxIsReady_inState_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *((void *)WeakRetained + 1);
    if (v4 == *(void *)(a1 + 48))
    {
      int v5 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        int v6 = 136315394;
        uint64_t v7 = "-[SCDACoordinator _startListeningAfterWiProxIsReady:inState:completion:]_block_invoke";
        __int16 v8 = 2048;
        uint64_t v9 = v4;
        _os_log_impl(&dword_25C707000, v5, OS_LOG_TYPE_INFO, "%s starting to scan in state: %lu", (uint8_t *)&v6, 0x16u);
      }
      [v3 _startListening:*(void *)(a1 + 32)];
    }
  }
}

- (void)_startListening:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v19 = "-[SCDACoordinator _startListening:]";
    _os_log_debug_impl(&dword_25C707000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  [(SCDACoordinator *)self _enterBLEDiagnosticMode];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __35__SCDACoordinator__startListening___block_invoke;
  char v15 = &unk_2654B8100;
  int v16 = self;
  id v6 = v4;
  id v17 = v6;
  [(SCDACoordinator *)self _waitWiProxAndExecute:&v12];
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    __int16 v8 = WeakRetained;
    id v9 = objc_loadWeakRetained(&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v11, "scdaListeningDidBegin:", self, v12, v13, v14, v15, v16);
    }
  }
}

uint64_t __35__SCDACoordinator__startListening___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 319))
  {
    [*(id *)(v2 + 352) startScanning];
    *(unsigned char *)(*(void *)(a1 + 32) + 456) = 1;
    [*(id *)(a1 + 32) _createElectionParticipantIdVendorIfRequired];
    [*(id *)(*(void *)(a1 + 32) + 360) fetchBTLEAddressIfRequired];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)resetReplies
{
  objc_storeStrong((id *)&self->_repliesBeforeDecision, self->_replies);
  uint64_t v3 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:10];
  replies = self->_replies;
  self->_replies = v3;

  self->_replyCounts = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:10];
  MEMORY[0x270F9A758]();
}

- (void)_enteringIntoState:(unint64_t)a3 fromState:(unint64_t)a4
{
  if (a4 == 1)
  {
    self->_BOOL clientIsDeciding = 0;
    [(SCDACoordinator *)self _resetAdvertisementTimings];
  }
}

- (id)_stateAsString:(unint64_t)a3
{
  if (a3 > 0x11) {
    return @"<SCDA_State_ERROR>";
  }
  else {
    return off_2654B8068[a3];
  }
}

- (id)_stateAsString
{
  return [(SCDACoordinator *)self _stateAsString:self->_myriadState];
}

- (void)enterState:(unint64_t)a3
{
  myriadWorkQueue = self->_myriadWorkQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__SCDACoordinator_enterState___block_invoke;
  v4[3] = &unk_2654B7CA8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(myriadWorkQueue, v4);
}

uint64_t __30__SCDACoordinator_enterState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enterState:*(void *)(a1 + 40)];
}

- (void)_enterState:(unint64_t)a3
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  int v5 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    uint64_t v7 = [(SCDACoordinator *)self _stateAsString];
    __int16 v8 = [(SCDACoordinator *)self _stateAsString:a3];
    *(_DWORD *)buf = 136315650;
    uint64_t v70 = "-[SCDACoordinator _enterState:]";
    __int16 v71 = 2112;
    *(void *)uint64_t v72 = v7;
    *(_WORD *)&v72[8] = 2112;
    double v73 = *(double *)&v8;
    _os_log_impl(&dword_25C707000, v6, OS_LOG_TYPE_INFO, "%s BTLE Coordinator altered state: %@ -> %@", buf, 0x20u);
  }
  self->_unint64_t previousState = self->_myriadState;
  self->_unint64_t myriadState = a3;
  -[SCDACoordinator _enteringIntoState:fromState:](self, "_enteringIntoState:fromState:", a3);
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v12 = objc_loadWeakRetained(&self->_delegate);
    [v12 myriadCoordinator:self didEnterState:self->_myriadState fromState:self->_previousState];
  }
  switch(a3)
  {
    case 0uLL:
      [(SCDACoordinator *)self _leaveBLEDiagnosticMode];
      [(SCDAPowerAssertionManager *)self->_powerAssertionManager releaseAllPowerAssertions];
      self->_inTask = 0;
      self->_ignoreInTaskTimer = 0;
      overrideMyriadRecord = self->_overrideMyriadRecord;
      self->_overrideMyriadRecord = 0;

      *(_WORD *)&self->_clientIsWatchActivation = 0;
      self->_clientIsInEarActivation = 0;
      *(_WORD *)&self->_clientRespondingToCarPlay = 0;
      [(SCDACoordinator *)self _stopAdvertisingAndListening];
      [(SCDACoordinator *)self _resetActionWindows];
      if (self->_ducking) {
        [(SCDACoordinator *)self _unduck];
      }
      if ([(NSMutableDictionary *)self->_multipleContinuations count])
      {
        uint64_t v14 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:10];
        multipleContinuations = self->_multipleContinuations;
        self->_multipleContinuations = v14;
      }
      [(SCDACoordinator *)self _cancelTimer];
      [(SCDACoordinator *)self _cancelOverallTimeout];
      [(SCDACoordinator *)self _clearWiProxReadinessTimer];
      [(SCDACoordinator *)self resetReplies];
      int v16 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:10];
      repliesBeforeDecision = self->_repliesBeforeDecision;
      self->_repliesBeforeDecision = v16;

      [(SCDACoordinator *)self _handleStateMachineErrorIfNeeded];
      eventToken = self->_eventToken;
      self->_eventToken = 0;

      self->_int64_t recordType = 0;
      self->_unint64_t previousState = 0;
      self->_suppressLateTrigger = 0;
      [(SCDACoordinator *)self _resetAdvertisementTimings];
      [(SCDACoordinator *)self _resetAudioData];
      myriadInstrumentation = self->_myriadInstrumentation;
      uint64_t v20 = [(SCDACoordinator *)self _myriadStateForSelf:self->_myriadState];
      id v21 = [(SCDASession *)self->_myriadSession sessionId];
      [(SCDAInstrumentation *)myriadInstrumentation logCDADeviceStateActivityEnded:v20 withCdaId:v21 withTimestamp:mach_absolute_time()];

      [(SCDACoordinator *)self _clearMyriadSession];
      [(SCDAAdvertisementContextManager *)self->_advContextManager reset];
      currentMyriadContext = self->_currentMyriadContext;
      self->_currentMyriadContext = 0;

      id waitForWiproxReadinessToScan = self->_waitForWiproxReadinessToScan;
      self->_id waitForWiproxReadinessToScan = 0;

      return;
    case 1uLL:
      uint64_t v24 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        BOOL coordinationEnabled = self->_coordinationEnabled;
        BOOL BLEActivityEnabled = self->_BLEActivityEnabled;
        *(_DWORD *)buf = 136315650;
        uint64_t v70 = "-[SCDACoordinator _enterState:]";
        __int16 v71 = 1024;
        *(_DWORD *)uint64_t v72 = coordinationEnabled;
        *(_WORD *)&v72[4] = 1024;
        *(_DWORD *)&v72[6] = BLEActivityEnabled;
        _os_log_impl(&dword_25C707000, v24, OS_LOG_TYPE_INFO, "%s #scda coordinationEnabled=%d, BLEActivityEnabled=%d ", buf, 0x18u);
      }
      if ([(SCDACoordinator *)self _shouldStopListeningBeforeAdvertising])
      {
        long long v27 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v70 = "-[SCDACoordinator _enterState:]";
          _os_log_impl(&dword_25C707000, v27, OS_LOG_TYPE_INFO, "%s #scda Force stopping BTLE scan", buf, 0xCu);
        }
        [(SCDACoordinator *)self _stopListening:0];
      }
      if ([(SCDAContext *)self->_currentMyriadContext activationSource] != 13
        || self->_clientIsDirectActivating)
      {
        goto LABEL_24;
      }
      uint64_t v28 = mach_absolute_time();
      double TimeInterval = SCDAMachAbsoluteTimeGetTimeInterval(v28 - self->_voiceTriggerTime);
      id v30 = (void *)SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        unint64_t latestRecordReceivedTime = self->_latestRecordReceivedTime;
        double v32 = self->_currentMyriadContext;
        __int16 v33 = v30;
        uint64_t v34 = [(SCDAContext *)v32 activationExpirationTime];
        *(_DWORD *)buf = 136316418;
        uint64_t v70 = "-[SCDACoordinator _enterState:]";
        __int16 v71 = 2048;
        *(void *)uint64_t v72 = 13;
        *(_WORD *)&v72[8] = 2048;
        double v73 = TimeInterval;
        __int16 v74 = 2048;
        unint64_t v75 = latestRecordReceivedTime;
        __int16 v76 = 2048;
        uint64_t v77 = v28;
        __int16 v78 = 2048;
        uint64_t v79 = v34;
        _os_log_impl(&dword_25C707000, v33, OS_LOG_TYPE_INFO, "%s Activation source: %ld, Time since activation: %f, last election record received time: %llu, current time: %llu, activation expiration time: %llu", buf, 0x3Eu);
      }
      if (TimeInterval > 0.949999988
        && v28 < [(SCDAContext *)self->_currentMyriadContext activationExpirationTime]
        && self->_latestRecordReceivedTime >= self->_voiceTriggerTime)
      {
        myriadWorkQueue = self->_myriadWorkQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __31__SCDACoordinator__enterState___block_invoke;
        block[3] = &unk_2654B81C8;
        void block[4] = self;
        dispatch_async(myriadWorkQueue, block);
      }
      else
      {
LABEL_24:
        self->_inTask = 1;
        self->_ducking = 1;
        self->_int nTimesContinued = 0;
        replies = self->_replies;
        triggerRecord = self->_triggerRecord;
        double v37 = [(SCDARecord *)triggerRecord deviceID];
        uint64_t v38 = [v37 UUIDString];
        [(NSMutableDictionary *)replies setObject:triggerRecord forKey:v38];

        self->_lastPHash = [(SCDARecord *)self->_triggerRecord pHash];
        [(SCDACoordinator *)self _createMyriadSessionIfRequired];
        __int16 v39 = [(SCDARecord *)self->_triggerRecord asAdvertisementData];
        [(SCDACoordinator *)self _addElectionAdvertisementDataToMyriadSession:v39];

        [(SCDACoordinator *)self _setupActionWindows];
        [(SCDACoordinator *)self _setOverallTimeout];
        [(SCDACoordinator *)self _advertiseTrigger];
      }
      return;
    case 2uLL:
      self->_int slowdownMsecs = 0;
      __int16 v40 = @"listen late";
      LODWORD(v11) = 1.0;
      uint64_t v41 = self;
      uint64_t v42 = 4;
      goto LABEL_64;
    case 3uLL:
      self->_int64_t recordType = 9;
      uint64_t v43 = [(SCDACoordinator *)self lateSuppressionRecord];
      goto LABEL_38;
    case 4uLL:
      if (self->_nTimesContinued >= 5) {
        [(SCDAPowerAssertionManager *)self->_powerAssertionManager releaseAllPowerAssertions];
      }
      if ((self->_inSetupMode || self->_inTask)
        && (int nTimesContinued = self->_nTimesContinued, self->_int nTimesContinued = nTimesContinued + 1, nTimesContinued < 20))
      {
        [(SCDACoordinator *)self _stopAdvertisingAndListening];
        uint64_t v49 = self;
        uint64_t v50 = 5;
LABEL_69:
        [(SCDACoordinator *)v49 _duringNextWindowEnterState:v50];
      }
      else
      {
        [(SCDACoordinator *)self _enterState:0];
      }
      return;
    case 5uLL:
      uint64_t v45 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        int v46 = self->_nTimesContinued;
        *(_DWORD *)buf = 136315394;
        uint64_t v70 = "-[SCDACoordinator _enterState:]";
        __int16 v71 = 1024;
        *(_DWORD *)uint64_t v72 = v46;
        _os_log_impl(&dword_25C707000, v45, OS_LOG_TYPE_INFO, "%s BTLE task continuation: %d", buf, 0x12u);
      }
      if (!+[SCDAUtilities isCommunal])
      {
        __int16 v65 = self;
        uint64_t v66 = 4;
        goto LABEL_67;
      }
      self->_int64_t recordType = 2;
      uint64_t v43 = [(SCDACoordinator *)self continuationRecord];
LABEL_38:
      v47 = (void *)v43;
      [(SCDACoordinator *)self _advertise:v43 andMoveTo:4];
LABEL_56:

      break;
    case 6uLL:
      uint64_t v43 = [(SCDACoordinator *)self directTriggerRecord];
      goto LABEL_38;
    case 7uLL:
      uint64_t v48 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v70 = "-[SCDACoordinator _enterState:]";
        _os_log_impl(&dword_25C707000, v48, OS_LOG_TYPE_INFO, "%s BTLE task SCDA_WAIT_EMERGENCY_OR_TASK only stopping advertising, not listening", buf, 0xCu);
      }
      [(SCDACoordinator *)self _stopAdvertising:0];
      [(SCDACoordinator *)self _startListening:0];
      [(SCDAPowerAssertionManager *)self->_powerAssertionManager releaseAllPowerAssertions];
      self->_int slowdownMsecs = 0;
      self->_inTask = 0;
      self->_ignoreInTaskTimer = 0;
      uint64_t v49 = self;
      uint64_t v50 = 10;
      goto LABEL_69;
    case 8uLL:
      self->_int64_t recordType = 4;
      v51 = [(SCDACoordinator *)self emergencyRecord];
      [(SCDACoordinator *)self _advertise:v51 andMoveTo:11];

      id v52 = objc_loadWeakRetained(&self->_delegate);
      char v53 = objc_opt_respondsToSelector();

      if ((v53 & 1) == 0) {
        return;
      }
      v47 = objc_loadWeakRetained(&self->_delegate);
      [v47 myriadCoordinatorIsAdvertisingEmergency:self];
      goto LABEL_56;
    case 9uLL:
      uint64_t v54 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v70 = "-[SCDACoordinator _enterState:]";
        _os_log_impl(&dword_25C707000, v54, OS_LOG_TYPE_INFO, "%s BTLE emergency is being handled", buf, 0xCu);
      }
      self->_int64_t recordType = 5;
      v55 = [(SCDACoordinator *)self emergencyHandledRecord];
      [(SCDACoordinator *)self _advertise:v55 andMoveTo:4];

      [(SCDAEmergencyCallPunchout *)self->_callPunchout initiateEmergencyCallMyriad];
      id v56 = objc_loadWeakRetained(&self->_delegate);
      char v57 = objc_opt_respondsToSelector();

      if ((v57 & 1) == 0) {
        return;
      }
      v47 = objc_loadWeakRetained(&self->_delegate);
      [v47 scdaCoordinatorWillHandleEmergency:self];
      goto LABEL_56;
    case 0xAuLL:
      int nTimesExtended = self->_nTimesExtended;
      self->_int nTimesExtended = nTimesExtended + 1;
      if (nTimesExtended > 18) {
        goto LABEL_65;
      }
      [(SCDACoordinator *)self _startListening:0];
      __int16 v40 = @"listen wait/emergency";
      LODWORD(v11) = 0.75;
      goto LABEL_63;
    case 0xBuLL:
      v59 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v70 = "-[SCDACoordinator _enterState:]";
        _os_log_impl(&dword_25C707000, v59, OS_LOG_TYPE_INFO, "%s BTLE task SCDA_WAIT_EMERGENCY_HANDLED only stopping advertising, not listening", buf, 0xCu);
      }
      [(SCDACoordinator *)self _stopAdvertising:0];
      uint64_t v49 = self;
      uint64_t v50 = 12;
      goto LABEL_69;
    case 0xCuLL:
      int v60 = self->_nTimesExtended;
      self->_int nTimesExtended = v60 + 1;
      if (v60 > 18)
      {
LABEL_65:
        __int16 v65 = self;
        uint64_t v66 = 0;
LABEL_67:
        [(SCDACoordinator *)v65 enterState:v66];
      }
      else
      {
        [(SCDACoordinator *)self _startListening:0];
        __int16 v40 = @"listen emergency handled";
        LODWORD(v11) = 0.75;
        uint64_t v41 = self;
        uint64_t v42 = 11;
LABEL_64:
        [(SCDACoordinator *)v41 _startTimer:v40 for:v42 thenEnterState:v11];
      }
      break;
    case 0xDuLL:
      v47 = [(SCDACoordinator *)self directTriggerRecord];
      [(SCDACoordinator *)self _advertiseIndefinite:v47];
      goto LABEL_56;
    case 0xEuLL:
      v61 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        BOOL v62 = self->_coordinationEnabled;
        BOOL v63 = self->_BLEActivityEnabled;
        *(_DWORD *)buf = 136315650;
        uint64_t v70 = "-[SCDACoordinator _enterState:]";
        __int16 v71 = 1024;
        *(_DWORD *)uint64_t v72 = v62;
        *(_WORD *)&v72[4] = 1024;
        *(_DWORD *)&v72[6] = v63;
        _os_log_impl(&dword_25C707000, v61, OS_LOG_TYPE_INFO, "%s #scda coordinationEnabled=%d, BLEActivityEnabled=%d ", buf, 0x18u);
      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.siri.myriad.decision.won", 0, 0, 1u);
      [(SCDACoordinator *)self _cancelOverallTimeout];
      [(SCDACoordinator *)self _advertiseSuppressTriggerInOutput];
      return;
    case 0xFuLL:
      [(SCDACoordinator *)self resetReplies];
      [(SCDACoordinator *)self _createMyriadSessionIfRequired];
      [(SCDACoordinator *)self _startListeningAfterWiProxIsReady:+[SCDAUtilities isMac] inState:15 completion:0];
      __int16 v40 = @"preheat timer";
      LODWORD(v11) = 2.0;
      goto LABEL_63;
    case 0x10uLL:
      self->_int64_t recordType = 8;
      [(SCDACoordinator *)self _advertiseSlowdown];
      return;
    case 0x11uLL:
      [(SCDACoordinator *)self _createMyriadSessionIfRequired];
      [(SCDACoordinator *)self _startListening:0];
      __int16 v40 = @"filter initialization timer";
      LODWORD(v11) = 1.0;
LABEL_63:
      uint64_t v41 = self;
      uint64_t v42 = 0;
      goto LABEL_64;
    default:
      return;
  }
}

uint64_t __31__SCDACoordinator__enterState___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loseElection];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _enterState:0];
}

- (void)_cancelOverallTimeout
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  overallTimeout = self->_overallTimeout;
  if (overallTimeout)
  {
    id v4 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      char v10 = "-[SCDACoordinator _cancelOverallTimeout]";
      _os_log_impl(&dword_25C707000, v4, OS_LOG_TYPE_INFO, "%s BTLE Coordinator cancelling overall timeout", (uint8_t *)&v9, 0xCu);
      overallTimeout = self->_overallTimeout;
    }
    [(SCDAWatchdogTimer *)overallTimeout cancelIfNotAlreadyCanceled];
    int v5 = self->_overallTimeout;
    self->_overallTimeout = 0;

    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained(&self->_delegate);
      [v8 myriadCoordinatorOverallTimerCancelled:self];
    }
  }
}

- (void)_setOverallTimeout
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (self->_overallTimeout) {
    [(SCDACoordinator *)self _cancelOverallTimeout];
  }
  uint64_t v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    char v10 = "-[SCDACoordinator _setOverallTimeout]";
    _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s BTLE Coordinator setting overall timeout", buf, 0xCu);
  }
  id v4 = [SCDAWatchdogTimer alloc];
  myriadWorkQueue = self->_myriadWorkQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__SCDACoordinator__setOverallTimeout__block_invoke;
  v8[3] = &unk_2654B81C8;
  v8[4] = self;
  id v6 = [(SCDAWatchdogTimer *)v4 initWithTimeoutInterval:myriadWorkQueue onQueue:v8 timeoutHandler:31.0];
  overallTimeout = self->_overallTimeout;
  self->_overallTimeout = v6;
}

uint64_t __37__SCDACoordinator__setOverallTimeout__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[SCDACoordinator _setOverallTimeout]_block_invoke";
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s BTLE Coordinator hitting overall timeout, resetting to NoActivity and declaring loss", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3[1])
  {
    [v3 _loseElection];
    uint64_t v3 = *(void **)(a1 + 32);
  }
  return [v3 _enterState:0];
}

- (void)_cancelTimer
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  timer = self->_timer;
  if (timer && !dispatch_source_testcancel((dispatch_source_t)self->_timer))
  {
    dispatch_source_cancel(timer);
    id v4 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      timerLabel = self->_timerLabel;
      unint64_t myriadState = self->_myriadState;
      uint64_t v7 = v4;
      id v8 = [(SCDACoordinator *)self _stateAsString:myriadState];
      int v9 = 136315650;
      char v10 = "-[SCDACoordinator _cancelTimer]";
      __int16 v11 = 2112;
      id v12 = timerLabel;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_impl(&dword_25C707000, v7, OS_LOG_TYPE_INFO, "%s BTLE timer %@ cancelled (%@)", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)_startTimer:(id)a3 for:(float)a4 thenEnterState:(unint64_t)a5
{
  id v8 = a3;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__SCDACoordinator__startTimer_for_thenEnterState___block_invoke;
  v10[3] = &unk_2654B7D38;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a5;
  *(float *)&double v9 = a4;
  [(SCDACoordinator *)self _startTimer:v8 for:v10 thenExecute:v9];
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __50__SCDACoordinator__startTimer_for_thenEnterState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _enterState:*(void *)(a1 + 40)];
}

- (void)_startTimer:(id)a3 for:(float)a4 thenExecute:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = (NSString *)a3;
  id v9 = a5;
  char v10 = SCDALogContextCore;
  double v11 = a4;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    unint64_t v18 = "-[SCDACoordinator _startTimer:for:thenExecute:]";
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    __int16 v21 = 2048;
    double v22 = v11;
    _os_log_impl(&dword_25C707000, v10, OS_LOG_TYPE_INFO, "%s BTLE starting %@ timer for %f secs", buf, 0x20u);
  }
  timerLabel = self->_timerLabel;
  self->_timerLabel = v8;
  __int16 v13 = v8;

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __47__SCDACoordinator__startTimer_for_thenExecute___block_invoke;
  v15[3] = &unk_2654B8100;
  v15[4] = self;
  id v16 = v9;
  id v14 = v9;
  [(SCDACoordinator *)self _createDispatchTimerFor:v15 toExecute:v11];
}

uint64_t __47__SCDACoordinator__startTimer_for_thenExecute___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 192);
    int v5 = 136315394;
    id v6 = "-[SCDACoordinator _startTimer:for:thenExecute:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s BTLE %@ timer fires", (uint8_t *)&v5, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_startListenTimer
{
  LODWORD(v2) = 0.5;
  [(SCDACoordinator *)self _startTimer:@"listen" for:0 thenExecute:v2];
}

- (void)_createDispatchTimerForEvent:(id)a3 toExecute:(id)a4
{
  id v6 = a4;
  [a3 timeIntervalSince1970];
  v8.tv_sec = (int)v7;
  v8.tv_nsec = (uint64_t)((v7 - (double)(int)v7) * 1000000000.0);
  [(SCDACoordinator *)self _createDispatchTimerWithTime:dispatch_walltime(&v8, 0) toExecute:v6];
}

- (void)_createDispatchTimerFor:(double)a3 toExecute:(id)a4
{
  int64_t v5 = (uint64_t)(a3 * 1000000000.0);
  id v6 = a4;
  [(SCDACoordinator *)self _createDispatchTimerWithTime:dispatch_time(0, v5) toExecute:v6];
}

- (void)_createDispatchTimerWithTime:(unint64_t)a3 toExecute:(id)a4
{
  id v6 = a4;
  dispatch_suspend((dispatch_object_t)self->_timer);
  dispatch_source_set_timer((dispatch_source_t)self->_timer, a3, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  double v7 = [MEMORY[0x263F08C38] UUID];
  objc_storeStrong((id *)&self->_eventToken, v7);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  id v11[2] = __58__SCDACoordinator__createDispatchTimerWithTime_toExecute___block_invoke;
  v11[3] = &unk_2654B8150;
  id v12 = v7;
  __int16 v13 = self;
  id v14 = v6;
  id v8 = v6;
  id v9 = v7;
  char v10 = (void *)MEMORY[0x261192180](v11);
  dispatch_source_set_event_handler((dispatch_source_t)self->_timer, v10);
  dispatch_resume((dispatch_object_t)self->_timer);
}

void __58__SCDACoordinator__createDispatchTimerWithTime_toExecute___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  double v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 208);
    int v6 = 136315650;
    double v7 = "-[SCDACoordinator _createDispatchTimerWithTime:toExecute:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s #scda Event token: %@, current event token: %@", (uint8_t *)&v6, 0x20u);
  }
  if (*(void *)(*(void *)(a1 + 40) + 208) && objc_msgSend(*(id *)(a1 + 32), "isEqual:"))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      (*(void (**)(void))(v5 + 16))();
    }
  }
}

- (void)_initializeTimer
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[SCDACoordinator _initializeTimer]";
    _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  timer = self->_timer;
  if (timer) {
    dispatch_source_cancel(timer);
  }
  uint64_t v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_myriadWorkQueue);
  int v6 = self->_timer;
  self->_timer = v5;

  dispatch_source_set_event_handler((dispatch_source_t)self->_timer, &__block_literal_global_251);
  dispatch_resume((dispatch_object_t)self->_timer);
  eventToken = self->_eventToken;
  self->_eventToken = 0;
}

- (void)_clearMyriadSession
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_myriadSession)
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained(p_delegate);
      [v6 scdaWillEndSession:self->_myriadSession];
    }
    double v7 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      myriadSession = self->_myriadSession;
      uint64_t v9 = v7;
      uint64_t v10 = [(SCDASession *)myriadSession sessionId];
      int v13 = 136315394;
      id v14 = "-[SCDACoordinator _clearMyriadSession]";
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl(&dword_25C707000, v9, OS_LOG_TYPE_INFO, "%s #scda Clearing myriad session %@", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v11 = [(SCDASession *)self->_myriadSession electionAdvertisementDataByIds];
    [v11 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_249];

    uint64_t v12 = self->_myriadSession;
    self->_myriadSession = 0;
  }
}

void __38__SCDACoordinator__clearMyriadSession__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  id v6 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315650;
    int v8 = "-[SCDACoordinator _clearMyriadSession]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v4;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_25C707000, v6, OS_LOG_TYPE_INFO, "%s #scda Election advertisement %@ -> %@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)updateRequestId:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__SCDACoordinator_updateRequestId___block_invoke;
  v7[3] = &unk_2654B7BB8;
  id v8 = v4;
  __int16 v9 = self;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

void __35__SCDACoordinator_updateRequestId___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  double v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 136315394;
    id v10 = "-[SCDACoordinator updateRequestId:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_debug_impl(&dword_25C707000, v2, OS_LOG_TYPE_DEBUG, "%s #scda requestIdNotification: %@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = objc_alloc(MEMORY[0x263F08C38]);
  id v5 = [*(id *)(a1 + 32) userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"requestId"];
  int v7 = (void *)[v4 initWithUUIDString:v6];
  [v3 setCurrentRequestId:v7];
}

- (void)_createMyriadSessionIfRequired
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (self->_myriadSession
    || ((v7 = self->_myriadState, BOOL v8 = v7 > 0x11, v9 = (1 << v7) & 0x2C003, !v8) ? (v10 = v9 == 0) : (v10 = 1), v10))
  {
    uint64_t v3 = (void *)SCDALogContextCore;
    if (!os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO)) {
      return;
    }
    unint64_t myriadState = self->_myriadState;
    id v5 = v3;
    id v6 = [(SCDACoordinator *)self _stateAsString:myriadState];
    int v20 = 136315394;
    __int16 v21 = "-[SCDACoordinator _createMyriadSessionIfRequired]";
    __int16 v22 = 2112;
    uint64_t v23 = v6;
    _os_log_impl(&dword_25C707000, v5, OS_LOG_TYPE_INFO, "%s #scda not initializing myriad session, myriad is in state %@", (uint8_t *)&v20, 0x16u);

    goto LABEL_12;
  }
  __int16 v11 = +[SCDASession newWithBuilder:&__block_literal_global_2356];
  myriadSession = self->_myriadSession;
  self->_myriadSession = v11;

  uint64_t v13 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    id v14 = self->_myriadSession;
    __int16 v15 = v13;
    id v16 = [(SCDASession *)v14 sessionId];
    uint64_t v17 = [(SCDACoordinator *)self _stateAsString:self->_myriadState];
    int v20 = 136315650;
    __int16 v21 = "-[SCDACoordinator _createMyriadSessionIfRequired]";
    __int16 v22 = 2112;
    uint64_t v23 = v16;
    __int16 v24 = 2112;
    long long v25 = v17;
    _os_log_impl(&dword_25C707000, v15, OS_LOG_TYPE_INFO, "%s #scda Initialized myriad session %@ when myriad is in state %@", (uint8_t *)&v20, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    id v5 = objc_loadWeakRetained(&self->_delegate);
    [v5 scdaWillStartWithSession:self->_myriadSession];
LABEL_12:
  }
}

void __49__SCDACoordinator__createMyriadSessionIfRequired__block_invoke(uint64_t a1, void *a2)
{
  double v2 = (void *)MEMORY[0x263F08C38];
  id v3 = a2;
  id v4 = [v2 UUID];
  [v3 setSessionId:v4];
}

- (void)_addElectionAdvertisementDataToMyriadSession:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x263F08C38] UUID];
    id v6 = [(SCDACoordinator *)self _myriadSession];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __64__SCDACoordinator__addElectionAdvertisementDataToMyriadSession___block_invoke;
    v18[3] = &unk_2654B7CD0;
    v18[4] = self;
    id v7 = v4;
    id v19 = v7;
    id v8 = v5;
    id v20 = v8;
    uint64_t v9 = [v6 mutatedCopyWithMutator:v18];

    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_loadWeakRetained(&self->_delegate);
      [v12 myriadCoordinator:self didAddAdvertisement:v7 toSession:self->_myriadSession];
    }
    p_myriadSession = &self->_myriadSession;
    objc_storeStrong((id *)p_myriadSession, v9);
    id v14 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = *p_myriadSession;
      id v16 = v14;
      uint64_t v17 = [(SCDASession *)v15 sessionId];
      *(_DWORD *)buf = 136315650;
      __int16 v22 = "-[SCDACoordinator _addElectionAdvertisementDataToMyriadSession:]";
      __int16 v23 = 2112;
      id v24 = v7;
      __int16 v25 = 2112;
      uint64_t v26 = v17;
      _os_log_impl(&dword_25C707000, v16, OS_LOG_TYPE_INFO, "%s #scda Election advertisement %@ added to myriad session %@", buf, 0x20u);
    }
  }
}

void __64__SCDACoordinator__addElectionAdvertisementDataToMyriadSession___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 _myriadSession];
  id v7 = [v5 electionAdvertisementDataByIds];

  id v6 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v7];
  [v6 setObject:a1[5] forKey:a1[6]];
  [v4 setCurrentElectionAdvertisementId:a1[6]];
  [v4 setCurrentElectionAdvertisementData:a1[5]];
  [v4 setElectionAdvertisementDataByIds:v6];
}

- (id)_myriadSession
{
  return self->_myriadSession;
}

- (void)_loseElection
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[SCDACoordinator _loseElection]";
    _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s BTLE notify myriad loss", (uint8_t *)&v12, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained
    && (id v5 = WeakRetained,
        id v6 = objc_loadWeakRetained(&self->_delegate),
        char v7 = objc_opt_respondsToSelector(),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    id v8 = objc_loadWeakRetained(&self->_delegate);
    [v8 scdaShouldAbortAnotherDeviceBetter:self];

    self->_int nTimesExtended = 0;
  }
  else
  {
    uint64_t v9 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = v9;
      id v11 = objc_loadWeakRetained(&self->_delegate);
      int v12 = 136315394;
      uint64_t v13 = "-[SCDACoordinator _loseElection]";
      __int16 v14 = 2112;
      id v15 = v11;
      _os_log_impl(&dword_25C707000, v10, OS_LOG_TYPE_INFO, "%s BTLE unable to cancel against: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  [(SCDACoordinator *)self _endAdvertisingAnalyticsContext:0];
  kdebug_trace();
  [(SCDANotifyStatePublisher *)self->_electionLossPublisher publishState:[(SCDACoordinator *)self _nextElectionPublisherState]];
  [(SCDAGoodnessScoreEvaluator *)self->_goodnessScoreEvaluator setLastActivationTime:0.0];
  self->_lastDecision = 0;
  self->_inTask = 0;
  self->_ignoreInTaskTimer = 0;
}

- (void)_winElection
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[SCDACoordinator _winElection]";
    _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s BTLE notify myriad won", (uint8_t *)&v12, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v6 = objc_loadWeakRetained(&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained(&self->_delegate);
      [v8 scdaShouldContinue:self];
    }
  }
  self->_clientIsListeningAfterRecentWin = 1;
  [(SCDACoordinator *)self _endAdvertisingAnalyticsContext:1];
  kdebug_trace();
  uint64_t v9 = [MEMORY[0x263F08AB0] processInfo];
  [v9 systemUptime];
  double v11 = v10;

  [(SCDAGoodnessScoreEvaluator *)self->_goodnessScoreEvaluator setLastActivationTime:v11];
  self->_lastDecision = 1;
}

- (BOOL)_deviceShouldContinue:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315138;
    id v20 = "-[SCDACoordinator _deviceShouldContinue:]";
    _os_log_impl(&dword_25C707000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v19, 0xCu);
  }
  if (self->_coordinationEnabled)
  {
    if (self->_clientIsInEarActivation && [(SCDARecord *)self->_triggerRecord isATrump]) {
      int v6 = ![(SCDARecord *)self->_triggerRecord isInEarTrump];
    }
    else {
      int v6 = 0;
    }
    BOOL v7 = self->_suppressLateTrigger && !self->_clientIsDirectActivating;
    BOOL v13 = [(SCDACoordinator *)self _shouldContinueFor:v4];
    BOOL clientIsDirectActivating = self->_clientIsDirectActivating;
    if (self->_clientIsDirectActivating) {
      int v15 = 1;
    }
    else {
      int v15 = v6;
    }
    BOOL v9 = (v15 | v13) & !v7;
    uint64_t v16 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      BOOL clientIsInEarActivation = self->_clientIsInEarActivation;
      int v19 = 136316418;
      id v20 = "-[SCDACoordinator _deviceShouldContinue:]";
      __int16 v21 = 2048;
      BOOL v22 = v9;
      __int16 v23 = 2048;
      uint64_t v24 = 0;
      __int16 v25 = 2048;
      BOOL v26 = clientIsDirectActivating;
      __int16 v27 = 2048;
      BOOL v28 = clientIsInEarActivation;
      __int16 v29 = 2048;
      BOOL v30 = v7;
      double v10 = "%s BTLE deviceShouldContinue:%ld (coordinationDisabled:%ld, isDirectlyActivating:%ld, isInEarTrigger:%ld, su"
            "ppressLateTrigger:%ld.";
      double v11 = v16;
      uint32_t v12 = 62;
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v8 = SCDALogContextCore;
    LOBYTE(v9) = 1;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315138;
      id v20 = "-[SCDACoordinator _deviceShouldContinue:]";
      double v10 = "%s Coordination disabled, continuing with the request)";
      LOBYTE(v9) = 1;
      double v11 = v8;
      uint32_t v12 = 12;
LABEL_18:
      _os_log_impl(&dword_25C707000, v11, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v19, v12);
    }
  }

  return v9;
}

- (void)_forceLocalWinner:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__SCDACoordinator__forceLocalWinner___block_invoke;
  v7[3] = &unk_2654B7BB8;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

uint64_t __37__SCDACoordinator__forceLocalWinner___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  double v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 240);
    int v16 = 136315650;
    uint64_t v17 = "-[SCDACoordinator _forceLocalWinner:]_block_invoke";
    __int16 v18 = 2112;
    uint64_t v19 = v3;
    __int16 v20 = 2112;
    uint64_t v21 = v4;
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s #scda force win on this device with context: %@, triggerRecord: %@", (uint8_t *)&v16, 0x20u);
  }
  id v5 = *(unsigned char **)(a1 + 40);
  if (v5[319])
  {
    [v5 _createElectionParticipantIdVendorIfRequired];
    [*(id *)(*(void *)(a1 + 40) + 360) fetchBTLEAddressIfRequired];
    id v5 = *(unsigned char **)(a1 + 40);
  }
  [v5 _winElection];
  *(unsigned char *)(*(void *)(a1 + 40) + 331) = 0;
  [*(id *)(a1 + 40) _setMyriadContext:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) _createMyriadSessionIfRequired];
  id v6 = *(void **)(a1 + 40);
  BOOL v7 = (void *)v6[78];
  uint64_t v8 = [v6 _myriadStateForSelf:v6[1]];
  BOOL v9 = [*(id *)(*(void *)(a1 + 40) + 528) sessionId];
  [v7 logCDADeviceStateActivityStartedOrChanged:v8 withTrigger:5 withCdaId:v9 withTimestamp:mach_absolute_time()];

  [*(id *)(*(void *)(a1 + 40) + 624) updateIsTrump:1 withReason:5];
  double v10 = *(id **)(a1 + 40);
  id v11 = v10[30];
  if (v11)
  {
    objc_msgSend(v11, "setRawAudioGoodnessScore:withBump:", objc_msgSend(v10[30], "rawAudioGoodnessScore"), 255);
  }
  else
  {
    uint64_t v12 = [v10 directTriggerRecord];
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = *(void **)(v13 + 240);
    *(void *)(v13 + 240) = v12;
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 320) = 0;
  *(void *)(*(void *)(a1 + 40) + 248) = 3;
  return [*(id *)(a1 + 40) _enterState:14];
}

- (void)faceDetectedBoostWithContext:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__SCDACoordinator_faceDetectedBoostWithContext___block_invoke;
  v7[3] = &unk_2654B7BB8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

void __48__SCDACoordinator_faceDetectedBoostWithContext___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 8);
  if (v2 == 1)
  {
    uint64_t v4 = [*(id *)(v1 + 240) rawAudioGoodnessScore];
    id v5 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315138;
      double v10 = "-[SCDACoordinator faceDetectedBoostWithContext:]_block_invoke";
      _os_log_debug_impl(&dword_25C707000, v5, OS_LOG_TYPE_DEBUG, "%s #scda attention boost arrived, reformulating record", (uint8_t *)&v9, 0xCu);
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 240), "setRawAudioGoodnessScore:withBump:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 240), "rawAudioGoodnessScore"), 255);
    [*(id *)(*(void *)(a1 + 32) + 240) setUserConfidence:v4];
    [*(id *)(*(void *)(a1 + 32) + 624) updateIsTrump:1 withReason:8];
    [*(id *)(a1 + 32) _enterState:1];
  }
  else
  {
    id v6 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = v6;
      id v8 = [(id)v1 stateAsString:v2];
      int v9 = 136315394;
      double v10 = "-[SCDACoordinator faceDetectedBoostWithContext:]_block_invoke";
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_error_impl(&dword_25C707000, v7, OS_LOG_TYPE_ERROR, "%s #scda attention boost arrived in wrong state: %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)setCurrentRequestId:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__SCDACoordinator_setCurrentRequestId___block_invoke;
  v7[3] = &unk_2654B7BB8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

void __39__SCDACoordinator_setCurrentRequestId___block_invoke(uint64_t a1)
{
}

- (void)instrumentationUpdateBoost:(unsigned __int8)a3 value:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = a3;
  myriadInstrumentation = self->_myriadInstrumentation;
  if (!myriadInstrumentation)
  {
    id v8 = objc_alloc_init(SCDAInstrumentation);
    int v9 = self->_myriadInstrumentation;
    self->_myriadInstrumentation = v8;

    myriadInstrumentation = self->_myriadInstrumentation;
  }
  [(SCDAInstrumentation *)myriadInstrumentation updateBoost:v5 value:v4];
}

- (void)setupEnabled:(BOOL)a3
{
  myriadWorkQueue = self->_myriadWorkQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __32__SCDACoordinator_setupEnabled___block_invoke;
  v4[3] = &unk_2654B81A0;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(myriadWorkQueue, v4);
}

void __32__SCDACoordinator_setupEnabled___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v4 = *(void **)(a1 + 32);
    BOOL v5 = v2;
    id v6 = [v4 _stateAsString];
    int v8 = 136315650;
    int v9 = "-[SCDACoordinator setupEnabled:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_25C707000, v5, OS_LOG_TYPE_INFO, "%s #scda setupEnabled: %d, current state: %@", (uint8_t *)&v8, 0x1Cu);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    *(unsigned char *)(v7 + 318) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 314) = 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 318) = [*(id *)(v7 + 592) coordinationEnabled];
    *(unsigned char *)(*(void *)(a1 + 32) + 314) = 0;
    [*(id *)(a1 + 32) _enterState:0];
  }
}

- (void)setInTask:(BOOL)a3
{
  myriadWorkQueue = self->_myriadWorkQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__SCDACoordinator_setInTask___block_invoke;
  v4[3] = &unk_2654B81A0;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(myriadWorkQueue, v4);
}

void __29__SCDACoordinator_setInTask___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    int v4 = 136315394;
    BOOL v5 = "-[SCDACoordinator setInTask:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = v3;
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s inTask=%d", (uint8_t *)&v4, 0x12u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 313) = *(unsigned char *)(a1 + 40);
}

- (BOOL)inTask
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  myriadWorkQueue = self->_myriadWorkQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __25__SCDACoordinator_inTask__block_invoke;
  v5[3] = &unk_2654B81F0;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(myriadWorkQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __25__SCDACoordinator_inTask__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 313);
  return result;
}

- (void)endTask
{
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__SCDACoordinator_endTask__block_invoke;
  block[3] = &unk_2654B81C8;
  void block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

uint64_t __26__SCDACoordinator_endTask__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    BOOL v5 = "-[SCDACoordinator endTask]_block_invoke";
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 313) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 434) = 0;
  return [*(id *)(*(void *)(a1 + 32) + 224) releaseAllPowerAssertions];
}

- (void)endAdvertisingWithDeviceProhibitions:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__SCDACoordinator_endAdvertisingWithDeviceProhibitions___block_invoke;
  v7[3] = &unk_2654B7BB8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

uint64_t __56__SCDACoordinator_endAdvertisingWithDeviceProhibitions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endAdvertisingWithDeviceProhibitions:*(void *)(a1 + 40)];
}

- (void)_endAdvertisingWithDeviceProhibitions:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_coordinationEnabled)
  {
    BOOL v5 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v17 = "-[SCDACoordinator _endAdvertisingWithDeviceProhibitions:]";
      _os_log_impl(&dword_25C707000, v5, OS_LOG_TYPE_INFO, "%s BTLE advertising is being ignored", buf, 0xCu);
    }
  }
  maxSlowdownRecord = self->_maxSlowdownRecord;
  if (maxSlowdownRecord
    && (int v7 = [(SCDARecord *)maxSlowdownRecord slowdownDelay]) != 0
    && self->_clientIsRespondingToSlowdown
    && !self->_clientDoneRespondingToSlowdown)
  {
    self->_int slowdownMsecs = v7;
    uint64_t v14 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = "-[SCDACoordinator _endAdvertisingWithDeviceProhibitions:]";
      __int16 v18 = 1024;
      int v19 = v7;
      _os_log_impl(&dword_25C707000, v14, OS_LOG_TYPE_INFO, "%s BTLE detected a slowdown signal for %d msecs, resetting election for later time", buf, 0x12u);
    }
    [(SCDACoordinator *)self _advertiseTrigger];
  }
  else
  {
    self->_BOOL clientIsDeciding = 1;
    if ([(SCDACoordinator *)self _deviceShouldContinue:v4])
    {
      if ((unint64_t)[(NSMutableDictionary *)self->_replies count] >= 2) {
        [(SCDAPowerAssertionManager *)self->_powerAssertionManager takePowerAssertionWithName:0];
      }
      [(SCDACoordinator *)self _winElection];
      [(SCDANotifyStatePublisher *)self->_electionWinPublisher publishState:[(SCDACoordinator *)self _nextElectionPublisherState]];
      id v8 = @"listening late";
      float v9 = 0.0;
      uint64_t v10 = 2;
    }
    else
    {
      [(SCDACoordinator *)self _loseElection];
      if (+[SCDAUtilities deviceCanMakeEmergencyCall])
      {
        id v8 = @"wait until after suppress";
        float v9 = 1.0;
        uint64_t v10 = 7;
      }
      else
      {
        [(SCDACoordinator *)self _stopListening:0];
        int v11 = SCDALogContextCore;
        float v9 = 0.0;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v17 = "-[SCDACoordinator _endAdvertisingWithDeviceProhibitions:]";
          _os_log_debug_impl(&dword_25C707000, v11, OS_LOG_TYPE_DEBUG, "%s #scda lost and no need to wait for emergency", buf, 0xCu);
        }
        uint64_t v10 = 0;
        id v8 = &stru_2709D13B0;
      }
    }
    uint64_t v12 = mach_absolute_time();
    if (_SCDAMachAbsoluteTimeRate_onceToken != -1) {
      dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_36);
    }
    self->_lastDecisionTime = (unint64_t)(*(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)v12);
    self->_clientDoneRespondingToSlowdown = 0;
    [(SCDACoordinator *)self _cancelOverallTimeout];
    [(SCDACoordinator *)self _endAdvertising:0];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __57__SCDACoordinator__endAdvertisingWithDeviceProhibitions___block_invoke;
    v15[3] = &unk_2654B7CA8;
    v15[4] = self;
    void v15[5] = v10;
    [(SCDACoordinator *)self _startTimer:v8 for:v15 thenExecute:COERCE_DOUBLE((unint64_t)LODWORD(v9))];
    [(SCDACoordinator *)self _ageWedgeFilter];
    [(SCDACoordinator *)self resetReplies];
    [(SCDACoordinator *)self _resetAudioData];
    self->_BOOL clientIsDirectActivating = 0;
    self->_BOOL clientIsInEarActivation = 0;
    uint64_t v13 = self->_maxSlowdownRecord;
    self->_maxSlowdownRecord = 0;

    self->_clientIsRespondingToSlowdown = 0;
    self->_suppressLateTrigger = 0;
    [(SCDACoordinator *)self _resetAdvertisementTimings];
  }
}

uint64_t __57__SCDACoordinator__endAdvertisingWithDeviceProhibitions___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 331) = 0;
  return [*(id *)(a1 + 32) _enterState:*(void *)(a1 + 40)];
}

- (int)_cdaParticipantForDeviceClass:(unsigned __int8)a3 andProducType:(unsigned __int8)a4
{
  return a3;
}

- (void)_endAdvertisingAnalyticsContext:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v94 = *MEMORY[0x263EF8340];
  p_triggerRecord = &self->_triggerRecord;
  id v6 = [(SCDARecord *)self->_triggerRecord asAdvertisementData];
  [(SCDACoordinator *)self _computeElectionParticipantIds:v6];

  int v7 = *p_triggerRecord;
  id v8 = [(SCDAElectionParticipantIds *)self->_electionParticipantIds electionParticipantId];
  [(SCDARecord *)v7 setElectionParticipantId:v8];

  BOOL v62 = [(SCDACoordinator *)self _sortedReplies];
  uint64_t v86 = 0;
  v87 = &v86;
  uint64_t v88 = 0x3032000000;
  v89 = __Block_byref_object_copy__2362;
  v90 = __Block_byref_object_dispose__2363;
  id v91 = 0;
  uint64_t v80 = 0;
  v81 = (id *)&v80;
  uint64_t v82 = 0x3032000000;
  v83 = __Block_byref_object_copy__2362;
  v84 = __Block_byref_object_dispose__2363;
  id v85 = 0;
  uint64_t v74 = 0;
  unint64_t v75 = &v74;
  uint64_t v76 = 0x3032000000;
  uint64_t v77 = __Block_byref_object_copy__2362;
  __int16 v78 = __Block_byref_object_dispose__2363;
  id v79 = 0;
  uint64_t v70 = 0;
  __int16 v71 = &v70;
  uint64_t v72 = 0x2020000000;
  int v73 = 0;
  if (v62 && [v62 count])
  {
    if (!v3)
    {
      uint64_t v9 = [v62 firstObject];
      uint64_t v10 = (void *)v87[5];
      v87[5] = v9;

      int v11 = [(id)v87[5] rawAudioGoodnessScore];
      *((_DWORD *)v71 + 6) = v11;
    }
    v68[0] = MEMORY[0x263EF8330];
    v68[1] = 3221225472;
    v68[2] = __51__SCDACoordinator__endAdvertisingAnalyticsContext___block_invoke;
    v68[3] = &unk_2654B7C58;
    v68[4] = self;
    v68[5] = &v74;
    BOOL v69 = v3;
    v68[6] = &v80;
    v68[7] = &v86;
    v68[8] = &v70;
    [v62 enumerateObjectsUsingBlock:v68];
    if (!v75[5])
    {
      uint64_t v12 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v93 = "-[SCDACoordinator _endAdvertisingAnalyticsContext:]";
        uint64_t v13 = "%s Myriad record for this device is missing!";
LABEL_37:
        _os_log_error_impl(&dword_25C707000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v12 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v93 = "-[SCDACoordinator _endAdvertisingAnalyticsContext:]";
      uint64_t v13 = "%s Myriad decision is based on 0 replies";
      goto LABEL_37;
    }
  }
  uint64_t v14 = v75;
  if (!v75[5])
  {
    id v15 = objc_alloc_init(MEMORY[0x263F6DA80]);
    int v16 = (void *)v75[5];
    v75[5] = (uint64_t)v15;

    objc_msgSend((id)v75[5], "setDeviceClass:", -[SCDACoordinator _cdaParticipantForDeviceClass:andProducType:](self, "_cdaParticipantForDeviceClass:andProducType:", self->_deviceClass, self->_productType));
    [(id)v75[5] setProductType:self->_productType];
    [(id)v75[5] setGoodnessScore:0];
    uint64_t v14 = v75;
    if (v3)
    {
      objc_storeStrong(v81 + 5, (id)v75[5]);
      uint64_t v14 = v75;
    }
  }
  uint64_t v17 = [(id)v14[5] electionParticipantId];
  BOOL v18 = v17 == 0;

  if (v18)
  {
    int v19 = (void *)v75[5];
    uint64_t v20 = [(SCDAElectionParticipantIds *)self->_electionParticipantIds electionParticipantId];
    uint64_t v21 = SCDAToSISchemaUUID(v20);
    [v19 setElectionParticipantId:v21];
  }
  uint64_t v22 = (void *)v75[5];
  __int16 v23 = [(SCDAElectionParticipantIds *)self->_electionParticipantIds rotatedElectionParticipantId];
  uint64_t v24 = SCDAToSISchemaUUID(v23);
  [v22 setRotatedElectionParticipantId:v24];

  if (!v87[5])
  {
    uint64_t v25 = [(SCDACoordinator *)self emptyRecord];
    BOOL v26 = (void *)v87[5];
    v87[5] = v25;
  }
  if (!v81[5])
  {
    id v27 = objc_alloc_init(MEMORY[0x263F6DA80]);
    id v28 = v81[5];
    v81[5] = v27;

    id v29 = v81[5];
    uint64_t v30 = [(id)v87[5] deviceClass];
    objc_msgSend(v29, "setDeviceClass:", -[SCDACoordinator _cdaParticipantForDeviceClass:andProducType:](self, "_cdaParticipantForDeviceClass:andProducType:", v30, objc_msgSend((id)v87[5], "productType")));
    objc_msgSend(v81[5], "setProductType:", objc_msgSend((id)v87[5], "productType"));
    objc_msgSend(v81[5], "setGoodnessScore:", objc_msgSend((id)v87[5], "goodness"));
    id v31 = v81[5];
    double v32 = [(id)v87[5] electionParticipantId];
    __int16 v33 = SCDAToSISchemaUUID(v32);
    [v31 setElectionParticipantId:v33];
  }
  uint64_t v34 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:10];
  if (SCDAIsInternalInstall_onceToken != -1) {
    dispatch_once(&SCDAIsInternalInstall_onceToken, &__block_literal_global_1260);
  }
  if (SCDAIsInternalInstall_isInternal) {
    __int16 v35 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:10];
  }
  else {
    __int16 v35 = 0;
  }
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __51__SCDACoordinator__endAdvertisingAnalyticsContext___block_invoke_223;
  v63[3] = &unk_2654B7C80;
  id v60 = v35;
  id v64 = v60;
  __int16 v65 = self;
  __int16 v67 = &v74;
  id v61 = v34;
  id v66 = v61;
  [v62 enumerateObjectsUsingBlock:v63];
  if (SCDAIsInternalInstall_onceToken != -1) {
    dispatch_once(&SCDAIsInternalInstall_onceToken, &__block_literal_global_1260);
  }
  if (SCDAIsInternalInstall_isInternal)
  {
    uint64_t v36 = [SCDAArbitrationParticipationContext alloc];
    triggerTime = self->_triggerTime;
    uint64_t v38 = [(SCDASession *)self->_myriadSession sessionId];
    __int16 v39 = [v38 UUIDString];
    id v40 = [(SCDAArbitrationParticipationContext *)v36 initAdvertisements:v62 decision:v3 requestStartDate:triggerTime session:v39 voiceTriggerTime:v87[5] winnerAdvertisement:(double)self->_voiceTriggerTime];

    [(SCDAInstrumentation *)self->_myriadInstrumentation userFeedbackPublishArbitrationParticipationContext:v40];
    myriadInstrumentation = self->_myriadInstrumentation;
    uint64_t v42 = [(SCDACoordinator *)self _myriadStateForSelf:self->_myriadState];
    BOOL coordinationEnabled = self->_coordinationEnabled;
    uint64_t deviceGroup = self->_deviceGroup;
    uint64_t v45 = [(SCDASession *)self->_myriadSession sessionId];
    [(SCDAInstrumentation *)myriadInstrumentation logCDAElectionDecisionMadeDebug:v42 withCrossDeviceArbitrationAllowed:coordinationEnabled advertisementData:v60 withDeviceGroup:deviceGroup withCdaId:v45 withTimestamp:mach_absolute_time()];
  }
  uint64_t v59 = mach_absolute_time();
  if (_SCDAMachAbsoluteTimeRate_onceToken != -1) {
    dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_36);
  }
  double v46 = *(double *)&_SCDAMachAbsoluteTimeRate_rate;
  unint64_t lastDecisionTime = self->_lastDecisionTime;
  uint64_t v48 = (void *)[(NSUUID *)self->_currentRequestId copy];
  int v58 = self->_myriadInstrumentation;
  uint64_t v49 = [(SCDACoordinator *)self _myriadStateForSelf:self->_myriadState];
  if (v3) {
    uint64_t v50 = 1;
  }
  else {
    uint64_t v50 = 2;
  }
  if (self->_lastDecision) {
    uint64_t v51 = 1;
  }
  else {
    uint64_t v51 = 2;
  }
  id v52 = v81[5];
  uint64_t v53 = v75[5];
  int v54 = *((_DWORD *)v71 + 6);
  v55 = [(SCDASession *)self->_myriadSession sessionId];
  LODWORD(v57) = v54;
  [(SCDAInstrumentation *)v58 logCDAElectionDecisionMade:v49 withDecision:v50 withPreviousDecision:v51 timeSincePreviousDecision:((unint64_t)(v46 * (double)v59) - lastDecisionTime) / 0xF4240 withWinningDevice:v52 withThisDevice:v53 withParticipants:v61 withRawScore:v57 withBoost:0 withCdaId:v55 currentRequestId:v48 withTimestamp:mach_absolute_time()];

  currentRequestId = self->_currentRequestId;
  self->_currentRequestId = 0;

  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);

  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v86, 8);
}

void __51__SCDACoordinator__endAdvertisingAnalyticsContext___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a2;
  if ([v7 isMe])
  {
    id v8 = objc_alloc_init(MEMORY[0x263F6DA80]);
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setDeviceClass:", objc_msgSend(*(id *)(a1 + 32), "_cdaParticipantForDeviceClass:andProducType:", objc_msgSend(v7, "deviceClass"), objc_msgSend(v7, "productType")));
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setProductType:", objc_msgSend(v7, "productType"));
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setGoodnessScore:", objc_msgSend(v7, "goodness"));
    int v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v12 = [v7 electionParticipantId];
    uint64_t v13 = SCDAToSISchemaUUID(v12);
    [v11 setElectionParticipantId:v13];

    if (*(unsigned char *)(a1 + 72))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8)+ 40) rawAudioGoodnessScore];
    }
    else
    {
      uint64_t v14 = (void *)SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
      {
        id v15 = v14;
        int v16 = 136315394;
        uint64_t v17 = "-[SCDACoordinator _endAdvertisingAnalyticsContext:]_block_invoke";
        __int16 v18 = 1024;
        int v19 = [v7 rawAudioGoodnessScore];
        _os_log_debug_impl(&dword_25C707000, v15, OS_LOG_TYPE_DEBUG, "%s #myriad lost with rawScore: %d", (uint8_t *)&v16, 0x12u);
      }
    }
    *a4 = 1;
  }
}

void __51__SCDACoordinator__endAdvertisingAnalyticsContext___block_invoke_223(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v15 = a2;
  if (*(void *)(a1 + 32))
  {
    id v7 = objc_alloc_init(MEMORY[0x263F6DA08]);
    objc_msgSend(v7, "setAudioHash:", objc_msgSend(v15, "pHash"));
    objc_msgSend(v7, "setGoodnessScore:", objc_msgSend(v15, "goodness"));
    objc_msgSend(v7, "setConfidenceScore:", objc_msgSend(v15, "userConfidence"));
    objc_msgSend(v7, "setDeviceClass:", objc_msgSend(*(id *)(a1 + 40), "_cdaParticipantForDeviceClass:andProducType:", objc_msgSend(v15, "deviceClass"), objc_msgSend(v15, "productType")));
    objc_msgSend(v7, "setDeviceGroup:", objc_msgSend(v15, "deviceGroup"));
    objc_msgSend(v7, "setProductType:", objc_msgSend(v15, "productType"));
    objc_msgSend(v7, "setTieBreaker:", objc_msgSend(v15, "tieBreaker"));
    objc_msgSend(v7, "setIsFromContextCollector:", objc_msgSend(v15, "isCollectedFromContextCollector") != 0);
    objc_msgSend(v7, "setIsSelf:", objc_msgSend(v15, "isMe"));
    [*(id *)(a1 + 32) addObject:v7];
  }
  id v8 = objc_alloc_init(MEMORY[0x263F6DA80]);
  objc_msgSend(v8, "setDeviceClass:", objc_msgSend(*(id *)(a1 + 40), "_cdaParticipantForDeviceClass:andProducType:", objc_msgSend(v15, "deviceClass"), objc_msgSend(v15, "productType")));
  objc_msgSend(v8, "setProductType:", objc_msgSend(v15, "productType"));
  objc_msgSend(v8, "setGoodnessScore:", objc_msgSend(v15, "goodness"));
  int v9 = [v15 isMe];
  uint64_t v10 = [v15 electionParticipantId];
  int v11 = v10;
  if (v9)
  {

    if (v11)
    {
      uint64_t v12 = [v15 electionParticipantId];
      uint64_t v13 = SCDAToSISchemaUUID(v12);
      [v8 setElectionParticipantId:v13];
    }
    else
    {
      uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) electionParticipantId];
      [v8 setElectionParticipantId:v12];
    }

    int v11 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) rotatedElectionParticipantId];
    [v8 setRotatedElectionParticipantId:v11];
  }
  else
  {
    uint64_t v14 = SCDAToSISchemaUUID(v10);
    [v8 setElectionParticipantId:v14];
  }
  [*(id *)(a1 + 48) addObject:v8];
  if (a3 >= 9) {
    *a4 = 1;
  }
}

- (void)endAdvertising
{
}

- (void)endAdvertising:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__SCDACoordinator_endAdvertising___block_invoke;
  v7[3] = &unk_2654B8100;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

uint64_t __34__SCDACoordinator_endAdvertising___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endAdvertising:*(void *)(a1 + 40)];
}

- (void)_endAdvertising:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315138;
    uint64_t v14 = "-[SCDACoordinator _endAdvertising:]";
    _os_log_debug_impl(&dword_25C707000, v5, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v13, 0xCu);
  }
  kdebug_trace();
  [(SCDACoordinator *)self _createElectionParticipantIdVendorIfRequired];
  [(SCDAElectionParticipantIdVendor *)self->_electionParticipantIdVendor fetchBTLEAddressIfRequired];
  if (self->_myriadState != 5)
  {
    myriadInstrumentation = self->_myriadInstrumentation;
    uint64_t v7 = -[SCDACoordinator _myriadStateForSelf:](self, "_myriadStateForSelf:");
    id v8 = [(SCDASession *)self->_myriadSession sessionId];
    [(SCDAInstrumentation *)myriadInstrumentation logCDAElectionAdvertisingEnding:v7 withCdaId:v8 withTimestamp:mach_absolute_time()];
  }
  [(SCDACoordinator *)self _stopAdvertising:v4];
  if (self->_clientIsDirectActivating || self->_clientIsWatchActivation)
  {
    int v9 = [MEMORY[0x263F08AB0] processInfo];
    [v9 systemUptime];
    double v11 = v10;

    [(SCDAGoodnessScoreEvaluator *)self->_goodnessScoreEvaluator setLastActivationTime:v11];
    uint64_t v12 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315394;
      uint64_t v14 = "-[SCDACoordinator _endAdvertising:]";
      __int16 v15 = 2048;
      double v16 = v11;
      _os_log_impl(&dword_25C707000, v12, OS_LOG_TYPE_INFO, "%s BTLE activation time %f", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)endAdvertisingAfterDelay:(float)a3
{
  myriadWorkQueue = self->_myriadWorkQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__SCDACoordinator_endAdvertisingAfterDelay___block_invoke;
  v4[3] = &unk_2654B7C30;
  v4[4] = self;
  float v5 = a3;
  dispatch_async(myriadWorkQueue, v4);
}

uint64_t __44__SCDACoordinator_endAdvertisingAfterDelay___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  int v2 = *(_DWORD *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__SCDACoordinator_endAdvertisingAfterDelay___block_invoke_2;
  v4[3] = &unk_2654B7C30;
  int v5 = v2;
  v4[4] = v1;
  return objc_msgSend(v1, "_startTimer:for:thenExecute:", @"end advert delay", v4);
}

uint64_t __44__SCDACoordinator_endAdvertisingAfterDelay___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    double v3 = *(float *)(a1 + 40);
    int v5 = 136315394;
    id v6 = "-[SCDACoordinator endAdvertisingAfterDelay:]_block_invoke_2";
    __int16 v7 = 2048;
    double v8 = v3;
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s BTLE ending advertising after %f secs delay", (uint8_t *)&v5, 0x16u);
  }
  return [*(id *)(a1 + 32) enterState:0];
}

- (void)startAdvertisingSlowdown:(unsigned __int16)a3
{
  myriadWorkQueue = self->_myriadWorkQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__SCDACoordinator_startAdvertisingSlowdown___block_invoke;
  v4[3] = &unk_2654B7C08;
  unsigned __int16 v5 = a3;
  v4[4] = self;
  dispatch_async(myriadWorkQueue, v4);
}

uint64_t __44__SCDACoordinator_startAdvertisingSlowdown___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v3 = *(unsigned __int16 *)(a1 + 40);
    int v5 = 136315394;
    id v6 = "-[SCDACoordinator startAdvertisingSlowdown:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = v3;
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s BTLE advertising slowdown: %d msecs", (uint8_t *)&v5, 0x12u);
  }
  [*(id *)(a1 + 32) _initializeTimer];
  *(_DWORD *)(*(void *)(a1 + 32) + 296) = *(unsigned __int16 *)(a1 + 40);
  *(unsigned char *)(*(void *)(a1 + 32) + 328) = 1;
  return [*(id *)(a1 + 32) _enterState:16];
}

- (void)startResponseAdvertising:(unsigned __int16)a3
{
  myriadWorkQueue = self->_myriadWorkQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__SCDACoordinator_startResponseAdvertising___block_invoke;
  v4[3] = &unk_2654B7C08;
  v4[4] = self;
  unsigned __int16 v5 = a3;
  dispatch_async(myriadWorkQueue, v4);
}

void __44__SCDACoordinator_startResponseAdvertising___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[SCDACoordinator startResponseAdvertising:]_block_invoke";
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s BTLE suppressing stragglers", (uint8_t *)&v5, 0xCu);
  }
  [*(id *)(a1 + 32) _initializeTimer];
  int v3 = [*(id *)(a1 + 32) responseObject:*(unsigned __int16 *)(a1 + 40)];
  *(unsigned char *)(*(void *)(a1 + 32) + 325) = 0;
  LODWORD(v4) = 1.0;
  [*(id *)(a1 + 32) _startAdvertising:v3 afterDelay:0.0 maxInterval:v4];
}

- (void)startAdvertisingFromAlertFiringVoiceTriggerWithContext:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__SCDACoordinator_startAdvertisingFromAlertFiringVoiceTriggerWithContext___block_invoke;
  v7[3] = &unk_2654B7BB8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

uint64_t __74__SCDACoordinator_startAdvertisingFromAlertFiringVoiceTriggerWithContext___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    uint64_t v12 = "-[SCDACoordinator startAdvertisingFromAlertFiringVoiceTriggerWithContext:]_block_invoke";
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s BTLE voice trigger during alert heard", (uint8_t *)&v11, 0xCu);
  }
  [*(id *)(a1 + 32) _setMyriadContext:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _createMyriadSessionIfRequired];
  int v3 = *(void **)(a1 + 32);
  id v4 = (void *)v3[78];
  uint64_t v5 = [v3 _myriadStateForSelf:v3[1]];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 528) sessionId];
  [v4 logCDADeviceStateActivityStartedOrChanged:v5 withTrigger:8 withCdaId:v6 withTimestamp:mach_absolute_time()];

  [*(id *)(*(void *)(a1 + 32) + 624) updateIsTrump:1 withReason:2];
  [*(id *)(a1 + 32) _initializeTimer];
  uint64_t v7 = [*(id *)(a1 + 32) directTriggerRecord];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 240);
  *(void *)(v8 + 240) = v7;

  *(unsigned char *)(*(void *)(a1 + 32) + 320) = 0;
  *(void *)(*(void *)(a1 + 32) + 248) = 3;
  return [*(id *)(a1 + 32) _enterState:1];
}

- (void)startAdvertisingFromAlertFiringVoiceTrigger
{
}

- (void)startAdvertisingFromInTaskVoiceTrigger
{
}

- (void)startAdvertisingFromInTaskVoiceTriggerWithContext:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__SCDACoordinator_startAdvertisingFromInTaskVoiceTriggerWithContext___block_invoke;
  v7[3] = &unk_2654B7BB8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

uint64_t __69__SCDACoordinator_startAdvertisingFromInTaskVoiceTriggerWithContext___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v2 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = v2;
    id v6 = [v4 debugDescription];
    int v7 = 136315394;
    id v8 = "-[SCDACoordinator startAdvertisingFromInTaskVoiceTriggerWithContext:]_block_invoke";
    __int16 v9 = 2112;
    double v10 = v6;
    _os_log_debug_impl(&dword_25C707000, v5, OS_LOG_TYPE_DEBUG, "%s BTLE voice trigger while inTask with context: %@", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 40) _setMyriadContext:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) _updateVoiceTriggerTimeFromFile];
  return [*(id *)(a1 + 40) _startAdvertisingFromInTaskVoiceTrigger];
}

- (void)_startAdvertisingFromInTaskVoiceTrigger
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[SCDACoordinator _startAdvertisingFromInTaskVoiceTrigger]";
    _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s BTLE in-task voice trigger heard", (uint8_t *)&v10, 0xCu);
  }
  [(SCDACoordinator *)self _createMyriadSessionIfRequired];
  mach_absolute_time();
  if (_SCDAMachAbsoluteTimeRate_onceToken != -1) {
    dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_36);
  }
  myriadInstrumentation = self->_myriadInstrumentation;
  uint64_t v5 = [(SCDACoordinator *)self _myriadStateForSelf:self->_myriadState];
  id v6 = [(SCDASession *)self->_myriadSession sessionId];
  [(SCDAInstrumentation *)myriadInstrumentation logCDADeviceStateActivityStartedOrChanged:v5 withTrigger:6 withCdaId:v6 withTimestamp:mach_absolute_time()];

  if (self->_myriadState == 1 && self->_inTask && !self->_clientIsDirectActivating && !self->_clientIsDeciding)
  {
    [(SCDARecord *)self->_triggerRecord generateTiebreaker];
    uint64_t v9 = 1;
  }
  else
  {
    [(SCDAInstrumentation *)self->_myriadInstrumentation updateIsTrump:1 withReason:7];
    [(SCDACoordinator *)self _initializeTimer];
    int v7 = [(SCDACoordinator *)self directTriggerRecord];
    triggerRecord = self->_triggerRecord;
    self->_triggerRecord = v7;

    self->_BOOL clientIsDirectActivating = 0;
    self->_int64_t recordType = 3;
    uint64_t v9 = 14;
  }
  [(SCDACoordinator *)self _enterState:v9];
}

- (void)startAdvertisingEmergency
{
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__SCDACoordinator_startAdvertisingEmergency__block_invoke;
  block[3] = &unk_2654B81C8;
  void block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

uint64_t __44__SCDACoordinator_startAdvertisingEmergency__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[SCDACoordinator startAdvertisingEmergency]_block_invoke";
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s BTLE sending emergency beacon", (uint8_t *)&v10, 0xCu);
  }
  [*(id *)(a1 + 32) _createMyriadSessionIfRequired];
  int v3 = *(void **)(a1 + 32);
  id v4 = (void *)v3[78];
  uint64_t v5 = [v3 _myriadStateForSelf:v3[1]];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 528) sessionId];
  [v4 logCDADeviceStateActivityStartedOrChanged:v5 withTrigger:7 withCdaId:v6 withTimestamp:mach_absolute_time()];

  [*(id *)(a1 + 32) _initializeTimer];
  *(unsigned char *)(*(void *)(a1 + 32) + 320) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 313) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 432) = 1;
  int v7 = [MEMORY[0x263F08AB0] processInfo];
  [v7 systemUptime];
  *(void *)(*(void *)(a1 + 32) + 424) = v8;

  return [*(id *)(a1 + 32) _duringNextWindowEnterState:8];
}

- (void)startAdvertisingEmergencyHandled
{
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SCDACoordinator_startAdvertisingEmergencyHandled__block_invoke;
  block[3] = &unk_2654B81C8;
  void block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

uint64_t __51__SCDACoordinator_startAdvertisingEmergencyHandled__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[SCDACoordinator startAdvertisingEmergencyHandled]_block_invoke";
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s BTLE handling emergency beacon", (uint8_t *)&v4, 0xCu);
  }
  [*(id *)(a1 + 32) _initializeTimer];
  *(unsigned char *)(*(void *)(a1 + 32) + 320) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 313) = 1;
  return [*(id *)(a1 + 32) _enterState:9];
}

- (void)startAdvertisingFromCarPlayTrigger
{
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SCDACoordinator_startAdvertisingFromCarPlayTrigger__block_invoke;
  block[3] = &unk_2654B81C8;
  void block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

uint64_t __53__SCDACoordinator_startAdvertisingFromCarPlayTrigger__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[SCDACoordinator startAdvertisingFromCarPlayTrigger]_block_invoke";
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s BTLE trumping from in CarPlay trigger", (uint8_t *)&v12, 0xCu);
  }
  [*(id *)(a1 + 32) _createMyriadSessionIfRequired];
  int v3 = *(void **)(a1 + 32);
  int v4 = (void *)v3[78];
  uint64_t v5 = [v3 _myriadStateForSelf:v3[1]];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 528) sessionId];
  [v4 logCDADeviceStateActivityStartedOrChanged:v5 withTrigger:4 withCdaId:v6 withTimestamp:mach_absolute_time()];

  [*(id *)(a1 + 32) _initializeTimer];
  uint64_t v7 = [*(id *)(a1 + 32) directTriggerRecord];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 240);
  *(void *)(v8 + 240) = v7;

  [*(id *)(*(void *)(a1 + 32) + 240) setRawAudioGoodnessScore:0 withBump:244];
  *(unsigned char *)(*(void *)(a1 + 32) + 320) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 330) = 1;
  *(void *)(*(void *)(a1 + 32) + 248) = 1;
  int v10 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[SCDACoordinator startAdvertisingFromCarPlayTrigger]_block_invoke";
    _os_log_debug_impl(&dword_25C707000, v10, OS_LOG_TYPE_DEBUG, "%s #myriad CarPlay override", (uint8_t *)&v12, 0xCu);
  }
  return [*(id *)(a1 + 32) _forceLocalWinner:0];
}

- (void)startAdvertisingFromInEarTrigger
{
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SCDACoordinator_startAdvertisingFromInEarTrigger__block_invoke;
  block[3] = &unk_2654B81C8;
  void block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

uint64_t __51__SCDACoordinator_startAdvertisingFromInEarTrigger__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[SCDACoordinator startAdvertisingFromInEarTrigger]_block_invoke";
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s BTLE trumping from in ear voice trigger", (uint8_t *)&v12, 0xCu);
  }
  [*(id *)(a1 + 32) _createMyriadSessionIfRequired];
  int v3 = *(void **)(a1 + 32);
  int v4 = (void *)v3[78];
  uint64_t v5 = [v3 _myriadStateForSelf:v3[1]];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 528) sessionId];
  [v4 logCDADeviceStateActivityStartedOrChanged:v5 withTrigger:3 withCdaId:v6 withTimestamp:mach_absolute_time()];

  [*(id *)(a1 + 32) _initializeTimer];
  uint64_t v7 = [*(id *)(a1 + 32) directTriggerRecord];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 240);
  *(void *)(v8 + 240) = v7;

  uint64_t v10 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v10 + 313))
  {
    [*(id *)(v10 + 240) setRawAudioGoodnessScore:0 withBump:248];
    uint64_t v10 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v10 + 320) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 322) = 1;
  *(void *)(*(void *)(a1 + 32) + 248) = 6;
  return [*(id *)(a1 + 32) _enterState:1];
}

- (void)startAdvertisingFromOutgoingTriggerWithContext:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__SCDACoordinator_startAdvertisingFromOutgoingTriggerWithContext___block_invoke;
  v7[3] = &unk_2654B7BB8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

uint64_t __66__SCDACoordinator_startAdvertisingFromOutgoingTriggerWithContext___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    uint64_t v14 = "-[SCDACoordinator startAdvertisingFromOutgoingTriggerWithContext:]_block_invoke";
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s BTLE suppressing trigger in audio output", (uint8_t *)&v13, 0xCu);
  }
  [*(id *)(a1 + 32) _setMyriadContext:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _createMyriadSessionIfRequired];
  int v3 = *(void **)(a1 + 32);
  id v4 = (void *)v3[78];
  uint64_t v5 = [v3 _myriadStateForSelf:v3[1]];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 528) sessionId];
  [v4 logCDADeviceStateActivityStartedOrChanged:v5 withTrigger:5 withCdaId:v6 withTimestamp:mach_absolute_time()];

  [*(id *)(*(void *)(a1 + 32) + 624) updateIsTrump:1 withReason:5];
  [*(id *)(a1 + 32) _initializeTimer];
  uint64_t v7 = [*(id *)(a1 + 32) directTriggerRecord];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 240);
  *(void *)(v8 + 240) = v7;

  *(unsigned char *)(*(void *)(a1 + 32) + 320) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 321) = 1;
  *(void *)(*(void *)(a1 + 32) + 248) = 3;
  uint64_t v10 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 256);
    int v13 = 136315394;
    uint64_t v14 = "-[SCDACoordinator startAdvertisingFromOutgoingTriggerWithContext:]_block_invoke";
    __int16 v15 = 2048;
    uint64_t v16 = v12;
    _os_log_debug_impl(&dword_25C707000, v10, OS_LOG_TYPE_DEBUG, "%s #scda _voiceTriggerTime: %llu", (uint8_t *)&v13, 0x16u);
  }
  return [*(id *)(a1 + 32) _enterState:14];
}

- (void)startAdvertisingFromOutgoingTrigger
{
}

- (void)startAdvertisingFromDirectTriggerWithContext:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__SCDACoordinator_startAdvertisingFromDirectTriggerWithContext___block_invoke;
  v7[3] = &unk_2654B7BB8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

uint64_t __64__SCDACoordinator_startAdvertisingFromDirectTriggerWithContext___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    uint64_t v12 = "-[SCDACoordinator startAdvertisingFromDirectTriggerWithContext:]_block_invoke";
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s BTLE trumping", (uint8_t *)&v11, 0xCu);
  }
  [*(id *)(a1 + 32) _setMyriadContext:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _createMyriadSessionIfRequired];
  int v3 = *(void **)(a1 + 32);
  id v4 = (void *)v3[78];
  uint64_t v5 = [v3 _myriadStateForSelf:v3[1]];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 528) sessionId];
  [v4 logCDADeviceStateActivityStartedOrChanged:v5 withTrigger:1 withCdaId:v6 withTimestamp:mach_absolute_time()];

  [*(id *)(*(void *)(a1 + 32) + 624) updateIsTrump:1 withReason:6];
  [*(id *)(a1 + 32) _initializeTimer];
  uint64_t v7 = [*(id *)(a1 + 32) directTriggerRecord];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 240);
  *(void *)(v8 + 240) = v7;

  *(unsigned char *)(*(void *)(a1 + 32) + 320) = 1;
  *(void *)(*(void *)(a1 + 32) + 248) = 3;
  return [*(id *)(a1 + 32) _enterState:1];
}

- (void)startAdvertisingFromDirectTrigger
{
}

- (void)startWatchAdvertisingFromDirectTriggerWithContext:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__SCDACoordinator_startWatchAdvertisingFromDirectTriggerWithContext___block_invoke;
  v7[3] = &unk_2654B7BB8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

uint64_t __69__SCDACoordinator_startWatchAdvertisingFromDirectTriggerWithContext___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    uint64_t v14 = "-[SCDACoordinator startWatchAdvertisingFromDirectTriggerWithContext:]_block_invoke";
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s BTLE trumping", (uint8_t *)&v13, 0xCu);
  }
  [*(id *)(a1 + 32) _setMyriadContext:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _createMyriadSessionIfRequired];
  if ([*(id *)(a1 + 40) activationSource] == 3)
  {
    int v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315138;
      uint64_t v14 = "-[SCDACoordinator startWatchAdvertisingFromDirectTriggerWithContext:]_block_invoke";
      _os_log_debug_impl(&dword_25C707000, v3, OS_LOG_TYPE_DEBUG, "%s Setting RAISE_TO_SPEAK Trump Reason for DirectTrigger", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 6;
  }
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = (void *)v5[78];
  uint64_t v7 = [v5 _myriadStateForSelf:v5[1]];
  id v8 = [*(id *)(*(void *)(a1 + 32) + 528) sessionId];
  [v6 logCDADeviceStateActivityStartedOrChanged:v7 withTrigger:1 withCdaId:v8 withTimestamp:mach_absolute_time()];

  [*(id *)(*(void *)(a1 + 32) + 624) updateIsTrump:1 withReason:v4];
  [*(id *)(a1 + 32) _initializeTimer];
  uint64_t v9 = [*(id *)(a1 + 32) directTriggerRecord];
  uint64_t v10 = *(void *)(a1 + 32);
  int v11 = *(void **)(v10 + 240);
  *(void *)(v10 + 240) = v9;

  *(unsigned char *)(*(void *)(a1 + 32) + 320) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 326) = 1;
  *(void *)(*(void *)(a1 + 32) + 248) = 3;
  return [*(id *)(a1 + 32) _enterState:1];
}

- (void)startWatchAdvertisingFromDirectTrigger
{
}

- (void)startWatchAdvertisingFromVoiceTriggerWithContext:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__SCDACoordinator_startWatchAdvertisingFromVoiceTriggerWithContext___block_invoke;
  v7[3] = &unk_2654B7BB8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

void __68__SCDACoordinator_startWatchAdvertisingFromVoiceTriggerWithContext___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v20 = 136315138;
    *(void *)&v20[4] = "-[SCDACoordinator startWatchAdvertisingFromVoiceTriggerWithContext:]_block_invoke";
    _os_log_impl(&dword_25C707000, v2, OS_LOG_TYPE_INFO, "%s ", v20, 0xCu);
  }
  [*(id *)(a1 + 32) _setMyriadContext:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _createMyriadSessionIfRequired];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 313))
  {
    [(id)v3 _startAdvertisingFromInTaskVoiceTrigger];
    return;
  }
  id v4 = *(void **)(v3 + 624);
  uint64_t v5 = [(id)v3 _myriadStateForSelf:*(void *)(v3 + 8)];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 528) sessionId];
  [v4 logCDADeviceStateActivityStartedOrChanged:v5 withTrigger:2 withCdaId:v6 withTimestamp:mach_absolute_time()];

  [*(id *)(a1 + 32) _initializeTimer];
  uint64_t v7 = [*(id *)(a1 + 32) voiceTriggerRecord];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 240);
  *(void *)(v8 + 240) = v7;

  uint64_t v10 = objc_alloc_init(SCDAGoodnessScoreContext);
  int v11 = *(void **)(*(void *)(a1 + 32) + 640);
  if (v11)
  {
    [v11 timeIntervalSinceNow];
    if (v12 > -180.0) {
      [(SCDAGoodnessScoreContext *)v10 setRecentlyWonBySmallAmount:1];
    }
  }
  uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 520) getMyriadAdjustedBoostForGoodnessScoreContext:v10];
  uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 240) rawAudioGoodnessScore];
  [*(id *)(*(void *)(a1 + 32) + 240) setRawAudioGoodnessScore:v14 withBump:v13];
  *(unsigned char *)(*(void *)(a1 + 32) + 320) = 0;
  if ((v14 - 25) <= 0xE7u)
  {
    uint64_t v15 = SCDALogContextCore;
    BOOL v16 = os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO);
    if (v14)
    {
      if (v16)
      {
        *(_DWORD *)uint64_t v20 = 136315650;
        *(void *)&v20[4] = "-[SCDACoordinator startWatchAdvertisingFromVoiceTriggerWithContext:]_block_invoke";
        *(_WORD *)&v20[12] = 1024;
        *(_DWORD *)&v20[14] = v14;
        *(_WORD *)&v20[18] = 1024;
        *(_DWORD *)&v20[20] = 25;
        uint64_t v17 = "%s #scda watch trumping due to threshold for rawAudioGoodnessScore: %u >= %u";
        __int16 v18 = v15;
        uint32_t v19 = 24;
LABEL_14:
        _os_log_impl(&dword_25C707000, v18, OS_LOG_TYPE_INFO, v17, v20, v19);
      }
    }
    else if (v16)
    {
      *(_DWORD *)uint64_t v20 = 136315138;
      *(void *)&v20[4] = "-[SCDACoordinator startWatchAdvertisingFromVoiceTriggerWithContext:]_block_invoke";
      uint64_t v17 = "%s #scda watch trumping due to score being 0";
      __int16 v18 = v15;
      uint32_t v19 = 12;
      goto LABEL_14;
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 240), "setPHash:", 0xFFFFLL, *(_OWORD *)v20, *(void *)&v20[16], v21);
    [*(id *)(*(void *)(a1 + 32) + 240) setRawAudioGoodnessScore:0 withBump:244];
    [*(id *)(*(void *)(a1 + 32) + 624) updateIsTrump:1 withReason:3];
    *(unsigned char *)(*(void *)(a1 + 32) + 327) = 1;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 326) = 1;
  *(void *)(*(void *)(a1 + 32) + 248) = 10;
  [*(id *)(a1 + 32) _enterState:1];
}

- (void)startWatchAdvertisingFromVoiceTrigger
{
}

- (void)startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__SCDACoordinator_startAdvertisingFromVoiceTriggerWithGoodnessScoreContext_withContext___block_invoke;
  block[3] = &unk_2654B7BE0;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(myriadWorkQueue, block);
}

void __88__SCDACoordinator_startAdvertisingFromVoiceTriggerWithGoodnessScoreContext_withContext___block_invoke(id *a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  [a1[4] _setMyriadContext:a1[5]];
  int v2 = [a1[6] getOverridingContext];
  uint64_t v3 = v2;
  if (v2)
  {
    char v4 = [v2 overriddenAdjustedScore];
  }
  else
  {
    uint64_t v5 = (void *)*((void *)a1[4] + 80);
    if (v5)
    {
      [v5 timeIntervalSinceNow];
      if (v6 > -180.0) {
        [a1[6] setRecentlyWonBySmallAmount:1];
      }
    }
    char v4 = [*((id *)a1[4] + 65) getMyriadAdjustedBoostForGoodnessScoreContext:a1[6]];
  }
  *((unsigned char *)a1[4] + 280) = v4;
  id v7 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v8 = *((unsigned __int8 *)a1[4] + 280);
    int v30 = 136315650;
    id v31 = "-[SCDACoordinator startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:withContext:]_block_invoke";
    __int16 v32 = 2112;
    *(void *)__int16 v33 = v3;
    *(_WORD *)&v33[8] = 1024;
    *(_DWORD *)uint64_t v34 = v8;
    _os_log_impl(&dword_25C707000, v7, OS_LOG_TYPE_INFO, "%s #scda overrideContext: %@, _incomingAdjustment %d", (uint8_t *)&v30, 0x1Cu);
  }
  id v9 = a1[4];
  id v10 = (void *)v9[36];
  v9[36] = 0;

  int v11 = [a1[5] overrideState];
  if (v11)
  {
    id v12 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      int v30 = 136315394;
      id v31 = "-[SCDACoordinator startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:withContext:]_block_invoke";
      __int16 v32 = 2112;
      *(void *)__int16 v33 = v11;
      _os_log_impl(&dword_25C707000, v12, OS_LOG_TYPE_INFO, "%s #scda Goodness score override state %@", (uint8_t *)&v30, 0x16u);
    }
    uint64_t v13 = [v11 overrideOption];
    if (v13 == 2)
    {
      [a1[4] startAdvertisingFromInEarTrigger];
    }
    else if (v13 == 1)
    {
      uint64_t v14 = [a1[4] directTriggerRecord];
      uint64_t v15 = a1[4];
      BOOL v16 = (void *)v15[36];
      v15[36] = v14;

      [*((id *)a1[4] + 78) updateIsTrump:1 withReason:6];
    }
  }
  uint64_t v17 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    __int16 v18 = (unsigned __int8 *)a1[4];
    id v19 = a1[5];
    int v20 = v18[313];
    int v21 = v18[314];
    LODWORD(v18) = v18[280];
    id v22 = a1[6];
    int v30 = 136316418;
    id v31 = "-[SCDACoordinator startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:withContext:]_block_invoke";
    __int16 v32 = 1024;
    *(_DWORD *)__int16 v33 = v20;
    *(_WORD *)&v33[4] = 1024;
    *(_DWORD *)&v33[6] = v21;
    *(_WORD *)uint64_t v34 = 1024;
    *(_DWORD *)&v34[2] = v18;
    __int16 v35 = 2112;
    id v36 = v19;
    __int16 v37 = 2112;
    id v38 = v22;
    _os_log_impl(&dword_25C707000, v17, OS_LOG_TYPE_INFO, "%s BTLE startFromVoiceTrigger inTask=%d, inSetupMode=%d, incomingAdjustment=%d,  context=%@, goodnessScoreContext=%@", (uint8_t *)&v30, 0x32u);
  }
  __int16 v23 = a1[4];
  if (v23[313] || v23[314])
  {
    [v23 _startAdvertisingFromInTaskVoiceTrigger];
    goto LABEL_21;
  }
  if (!v11 || !a1[5])
  {
LABEL_31:
    [v23 _createMyriadSessionIfRequired];
    [a1[4] _startAdvertisingFromVoiceTrigger];
    goto LABEL_21;
  }
  uint64_t v24 = [v11 reason];
  char v25 = [v24 isEqualToString:@"CarPlay request"];

  if ((v25 & 1) == 0)
  {
    __int16 v23 = a1[4];
    goto LABEL_31;
  }
  BOOL v26 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    int v30 = 136315394;
    id v31 = "-[SCDACoordinator startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:withContext:]_block_invoke";
    __int16 v32 = 2112;
    *(void *)__int16 v33 = v11;
    _os_log_debug_impl(&dword_25C707000, v26, OS_LOG_TYPE_DEBUG, "%s #myriad CarPlay override %@", (uint8_t *)&v30, 0x16u);
  }
  [a1[4] _initializeTimer];
  uint64_t v27 = [a1[4] voiceTriggerRecord];
  id v28 = a1[4];
  id v29 = (void *)v28[30];
  v28[30] = v27;

  if (![*((id *)a1[4] + 30) pHash]) {
    [*((id *)a1[4] + 30) setPHash:0xFFFFLL];
  }
  *((unsigned char *)a1[4] + 330) = 1;
  [a1[4] _forceLocalWinner:a1[5]];
LABEL_21:
}

- (void)startAdvertisingFromVoiceTriggerAdjusted:(char)a3 withContext:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = objc_alloc_init(SCDAGoodnessScoreOverrideContext);
  [(SCDAGoodnessScoreOverrideContext *)v7 setOverrideContext:1];
  int deviceAdjust_DEPRECATED = self->_deviceAdjust_DEPRECATED;
  if ([(SCDAGoodnessScoreEvaluator *)self->_goodnessScoreEvaluator deviceAdjustTrialEnabled])
  {
    int deviceAdjust_DEPRECATED = [(SCDAGoodnessScoreEvaluator *)self->_goodnessScoreEvaluator deviceAdjustTrialValue];
    id v9 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315394;
      uint64_t v15 = "-[SCDACoordinator startAdvertisingFromVoiceTriggerAdjusted:withContext:]";
      __int16 v16 = 1024;
      int v17 = deviceAdjust_DEPRECATED;
      _os_log_impl(&dword_25C707000, v9, OS_LOG_TYPE_INFO, "%s #scda Logging Trial defined Device Adjust Value: %du", (uint8_t *)&v14, 0x12u);
    }
  }
  else if ([v6 activationSource] == 13 && self->_deviceClass == 3)
  {
    id v10 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      int v13 = self->_deviceAdjust_DEPRECATED;
      int v14 = 136315394;
      uint64_t v15 = "-[SCDACoordinator startAdvertisingFromVoiceTriggerAdjusted:withContext:]";
      __int16 v16 = 1024;
      int v17 = v13;
      _os_log_debug_impl(&dword_25C707000, v10, OS_LOG_TYPE_DEBUG, "%s #scda removing negative iPad device boost (adding %d back) due to activationSource", (uint8_t *)&v14, 0x12u);
    }
    a3 -= LOBYTE(self->_deviceAdjust_DEPRECATED);
  }
  int v11 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136315650;
    uint64_t v15 = "-[SCDACoordinator startAdvertisingFromVoiceTriggerAdjusted:withContext:]";
    __int16 v16 = 1024;
    int v17 = deviceAdjust_DEPRECATED;
    __int16 v18 = 1024;
    int v19 = a3;
    _os_log_debug_impl(&dword_25C707000, v11, OS_LOG_TYPE_DEBUG, "%s #scda _deviceAdjust=%d, adjustment= %d", (uint8_t *)&v14, 0x18u);
  }
  [(SCDAGoodnessScoreOverrideContext *)v7 setOverriddenAdjustedScore:a3];
  id v12 = objc_alloc_init(SCDAGoodnessScoreContext);
  [(SCDAGoodnessScoreContext *)v12 setOverridingContext:v7];
  [(SCDACoordinator *)self startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:v12 withContext:v6];
}

- (void)startAdvertisingFromVoiceTriggerAdjusted:(char)a3
{
}

- (void)resetStateMachine
{
}

- (void)_startAdvertisingFromVoiceTrigger
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  if (self->_inTask || self->_inSetupMode)
  {
    [(SCDACoordinator *)self _startAdvertisingFromInTaskVoiceTrigger];
  }
  else
  {
    [(SCDACoordinator *)self _initializeTimer];
    uint64_t v3 = [(SCDACoordinator *)self voiceTriggerRecord];
    triggerRecord = self->_triggerRecord;
    self->_triggerRecord = v3;

    int deviceAdjust_DEPRECATED = self->_deviceAdjust_DEPRECATED;
    if ([(SCDAGoodnessScoreEvaluator *)self->_goodnessScoreEvaluator deviceAdjustTrialEnabled])
    {
      int deviceAdjust_DEPRECATED = [(SCDAGoodnessScoreEvaluator *)self->_goodnessScoreEvaluator deviceAdjustTrialValue];
      id v6 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        int v34 = 136315394;
        __int16 v35 = "-[SCDACoordinator _startAdvertisingFromVoiceTrigger]";
        __int16 v36 = 1024;
        LODWORD(v37) = deviceAdjust_DEPRECATED;
        _os_log_impl(&dword_25C707000, v6, OS_LOG_TYPE_INFO, "%s #scda Using Trial defined Device Adjust Value: %du", (uint8_t *)&v34, 0x12u);
      }
    }
    id v7 = (void *)SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      deviceClassName = self->_deviceClassName;
      productTypeName = self->_productTypeName;
      int incomingAdjustment = self->_incomingAdjustment;
      id v12 = self->_triggerRecord;
      int v13 = v7;
      int v14 = [(SCDARecord *)v12 rawAudioGoodnessScore];
      int v34 = 136316418;
      __int16 v35 = "-[SCDACoordinator _startAdvertisingFromVoiceTrigger]";
      __int16 v36 = 2112;
      double v37 = *(double *)&deviceClassName;
      __int16 v38 = 2112;
      uint64_t v39 = productTypeName;
      __int16 v40 = 1024;
      int v41 = deviceAdjust_DEPRECATED;
      __int16 v42 = 1024;
      int v43 = incomingAdjustment;
      __int16 v44 = 1024;
      int v45 = v14;
      _os_log_impl(&dword_25C707000, v13, OS_LOG_TYPE_INFO, "%s #scda BTLE device class: %@ (%@) detected, adjusting goodness by %d incomingAdjustment %d, rawAudioGoodnessScore: %d", (uint8_t *)&v34, 0x32u);
    }
    LODWORD(v8) = 1.0;
    [(SCDARecord *)self->_triggerRecord adjustByMultiplier:deviceAdjust_DEPRECATED + self->_incomingAdjustment adding:v8];
    int constantGoodness = self->_constantGoodness;
    if ((constantGoodness & 0x80000000) == 0)
    {
      __int16 v16 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        int v34 = 136315394;
        __int16 v35 = "-[SCDACoordinator _startAdvertisingFromVoiceTrigger]";
        __int16 v36 = 1024;
        LODWORD(v37) = constantGoodness;
        _os_log_impl(&dword_25C707000, v16, OS_LOG_TYPE_INFO, "%s #scda BTLE overriding to constant goodness %d", (uint8_t *)&v34, 0x12u);
        int constantGoodness = self->_constantGoodness;
      }
      [(SCDARecord *)self->_triggerRecord setRawAudioGoodnessScore:0 withBump:constantGoodness];
    }
    if (self->_wasEmergency)
    {
      int v17 = [MEMORY[0x263F08AB0] processInfo];
      [v17 systemUptime];
      double v19 = v18 - self->_lastEmergencyAttempt;

      if (v19 < 70.0)
      {
        unsigned int v20 = [(SCDARecord *)self->_triggerRecord goodness];
        uint64_t v21 = v20 >= 0xC ? 12 : v20;
        [(SCDARecord *)self->_triggerRecord setRawAudioGoodnessScore:0 withBump:v21];
        id v22 = (void *)SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
        {
          __int16 v23 = self->_triggerRecord;
          uint64_t v24 = v22;
          int v25 = [(SCDARecord *)v23 goodness];
          int v34 = 136315650;
          __int16 v35 = "-[SCDACoordinator _startAdvertisingFromVoiceTrigger]";
          __int16 v36 = 2048;
          double v37 = v19;
          __int16 v38 = 1024;
          LODWORD(v39) = v25;
          _os_log_impl(&dword_25C707000, v24, OS_LOG_TYPE_INFO, "%s #scda Downgrading goodness as HS invocation too soon %f for score %d", (uint8_t *)&v34, 0x1Cu);
        }
      }
      self->_lastEmergencyAttempt = 0.0;
      self->_wasEmergency = 0;
    }
    overrideMyriadRecord = self->_overrideMyriadRecord;
    if (overrideMyriadRecord)
    {
      uint64_t v27 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        int v34 = 136315394;
        __int16 v35 = "-[SCDACoordinator _startAdvertisingFromVoiceTrigger]";
        __int16 v36 = 2112;
        double v37 = *(double *)&overrideMyriadRecord;
        _os_log_impl(&dword_25C707000, v27, OS_LOG_TYPE_INFO, "%s #scda BTLE overriding to goodness %@", (uint8_t *)&v34, 0x16u);
        overrideMyriadRecord = self->_overrideMyriadRecord;
      }
      id v28 = overrideMyriadRecord;
      id v29 = self->_overrideMyriadRecord;
      self->_overrideMyriadRecord = 0;

      int v30 = self->_triggerRecord;
      self->_triggerRecord = v28;
    }
    myriadInstrumentation = self->_myriadInstrumentation;
    uint64_t v32 = [(SCDACoordinator *)self _myriadStateForSelf:self->_myriadState];
    __int16 v33 = [(SCDASession *)self->_myriadSession sessionId];
    [(SCDAInstrumentation *)myriadInstrumentation logCDADeviceStateActivityStartedOrChanged:v32 withTrigger:2 withCdaId:v33 withTimestamp:mach_absolute_time()];

    self->_BOOL clientIsDirectActivating = 0;
    self->_int64_t recordType = 10;
    [(SCDACoordinator *)self _enterState:1];
  }
}

- (void)startAdvertisingFromVoiceTriggerWithContext:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__SCDACoordinator_startAdvertisingFromVoiceTriggerWithContext___block_invoke;
  v7[3] = &unk_2654B7BB8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

uint64_t __63__SCDACoordinator_startAdvertisingFromVoiceTriggerWithContext___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _setMyriadContext:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 32) _updateVoiceTriggerTimeFromFile];
  uint64_t v3 = *(unsigned __int8 **)(a1 + 32);
  if (v3[330])
  {
    v3[330] = 0;
  }
  else
  {
    id v4 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      int v5 = v3[313];
      int v6 = v3[314];
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 136315906;
      id v9 = "-[SCDACoordinator startAdvertisingFromVoiceTriggerWithContext:]_block_invoke";
      __int16 v10 = 1024;
      int v11 = v5;
      __int16 v12 = 1024;
      int v13 = v6;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      _os_log_impl(&dword_25C707000, v4, OS_LOG_TYPE_INFO, "%s BTLE startFromVoiceTrigger inTask=%d, inSetupMode=%d, context=%@", (uint8_t *)&v8, 0x22u);
      uint64_t v3 = *(unsigned __int8 **)(a1 + 32);
    }
    [v3 _createMyriadSessionIfRequired];
    return [*(id *)(a1 + 32) _startAdvertisingFromVoiceTrigger];
  }
  return result;
}

- (void)startAdvertisingFromVoiceTrigger
{
}

- (void)startAdvertisingForPHSSetupAfterDelay:(float)a3 maxInterval:(float)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v7 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    int v13 = "-[SCDACoordinator startAdvertisingForPHSSetupAfterDelay:maxInterval:]";
    _os_log_impl(&dword_25C707000, v7, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v12, 0xCu);
  }
  int v8 = [(SCDACoordinator *)self _phsSetupRecord];
  id v9 = [v8 asAdvertisementData];
  *(float *)&double v10 = a3;
  *(float *)&double v11 = a4;
  [(SCDACoordinator *)self advertiseWith:v9 afterDelay:v10 maxInterval:v11];
}

- (void)preheatWiProx
{
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__SCDACoordinator_preheatWiProx__block_invoke;
  block[3] = &unk_2654B81C8;
  void block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

uint64_t __32__SCDACoordinator_preheatWiProx__block_invoke(uint64_t result)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(result + 32);
  if (!*(void *)(v1 + 8))
  {
    uint64_t v2 = result;
    uint64_t v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      int v4 = *(_DWORD *)(v1 + 300);
      int v5 = 136315394;
      int v6 = "-[SCDACoordinator preheatWiProx]_block_invoke";
      __int16 v7 = 1024;
      int v8 = v4;
      _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s Preheat shows slowdown for this device as %d msecs", (uint8_t *)&v5, 0x12u);
      uint64_t v1 = *(void *)(v2 + 32);
    }
    if (*(_DWORD *)(v1 + 300))
    {
      return [(id)v1 startAdvertisingSlowdown:(unsigned __int16)*(_DWORD *)(v1 + 300)];
    }
    else
    {
      [(id)v1 _initializeTimer];
      return [*(id *)(v2 + 32) enterState:15];
    }
  }
  return result;
}

- (void)_updateVoiceTriggerTimeFromFile
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = safelyGetAudioData();
  unint64_t v11 = 0;
  if ((unint64_t)[v3 length] >= 0xC) {
    objc_msgSend(v3, "getBytes:range:", &v11, 4, 8);
  }
  uint64_t v4 = mach_absolute_time();
  if (_SCDAMachAbsoluteTimeRate_onceToken != -1) {
    dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_36);
  }
  double v5 = *(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)v4 / 1000000000.0;
  int v6 = SCDALogContextCore;
  double v7 = v5 - *(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)v11 / 1000000000.0;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = v6;
    double v10 = [v3 debugDescription];
    *(_DWORD *)buf = 136315906;
    int v13 = "-[SCDACoordinator _updateVoiceTriggerTimeFromFile]";
    __int16 v14 = 2112;
    double v15 = *(double *)&v10;
    __int16 v16 = 2048;
    unint64_t v17 = v11;
    __int16 v18 = 2048;
    double v19 = v7;
    _os_log_debug_impl(&dword_25C707000, v9, OS_LOG_TYPE_DEBUG, "%s data=%@, voiceTriggerTimeRaw=%llu, secondsSinceTrigger=%f", buf, 0x2Au);

    int v6 = SCDALogContextCore;
  }
  BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v7 <= 2.0)
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315394;
      int v13 = "-[SCDACoordinator _updateVoiceTriggerTimeFromFile]";
      __int16 v14 = 2048;
      double v15 = v7;
      _os_log_debug_impl(&dword_25C707000, v6, OS_LOG_TYPE_DEBUG, "%s #scda endTime from a file is good, secondsSinceTrigger=%f", buf, 0x16u);
    }
    self->_unint64_t voiceTriggerTime = v11;
  }
  else if (v8)
  {
    *(_DWORD *)buf = 136315394;
    int v13 = "-[SCDACoordinator _updateVoiceTriggerTimeFromFile]";
    __int16 v14 = 2048;
    double v15 = v7;
    _os_log_debug_impl(&dword_25C707000, v6, OS_LOG_TYPE_DEBUG, "%s #scda endTime from a file is too old, secondsSinceTrigger=%f", buf, 0x16u);
  }
}

- (void)_setMyriadContext:(id)a3
{
  self->_currentMyriadContext = (SCDAContext *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)_initDeviceClassAndAdjustments
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  self->_productType = 0;
  uint64_t v3 = (NSString *)MGCopyAnswer();
  productTypeName = self->_productTypeName;
  self->_productTypeName = v3;

  double v5 = (NSString *)MGCopyAnswer();
  deviceClassName = self->_deviceClassName;
  self->_deviceClassName = v5;

  *(_OWORD *)&self->_double deviceDelay = xmmword_25C73C670;
  *(_OWORD *)&self->_double deviceInEarDelay = xmmword_25C73C680;
  if ([(NSString *)self->_deviceClassName isEqualToString:@"iPhone"])
  {
    self->_uint64_t deviceAdjust_DEPRECATED = 0;
    unsigned __int8 v7 = 2;
LABEL_8:
    self->_uint64_t deviceClass = v7;
    goto LABEL_9;
  }
  if ([(NSString *)self->_deviceClassName isEqualToString:@"iPod"])
  {
    self->_uint64_t deviceAdjust_DEPRECATED = 0;
LABEL_7:
    unsigned __int8 v7 = 3;
    goto LABEL_8;
  }
  if ([(NSString *)self->_deviceClassName isEqualToString:@"iPad"])
  {
    self->_uint64_t deviceAdjust_DEPRECATED = -4;
    goto LABEL_7;
  }
  if ([(NSString *)self->_deviceClassName isEqualToString:@"AppleTV"])
  {
    self->_uint64_t deviceAdjust_DEPRECATED = 0;
    unsigned __int8 v18 = 4;
LABEL_16:
    self->_uint64_t deviceClass = v18;
    self->_double deviceTrumpDelay = 0.75;
    goto LABEL_9;
  }
  if ([(NSString *)self->_deviceClassName isEqualToString:@"Watch"])
  {
    self->_uint64_t deviceAdjust_DEPRECATED = 10;
    unsigned __int8 v18 = 6;
    goto LABEL_16;
  }
  if ([(NSString *)self->_deviceClassName isEqualToString:@"AudioAccessory"])
  {
    self->_uint64_t deviceAdjust_DEPRECATED = 0;
    self->_uint64_t deviceClass = 7;
    uint64_t v19 = MGGetProductType();
    if (v19 > 3348380075)
    {
      if (v19 == 3348380076)
      {
        self->_productType = 3;
        self->_uint64_t deviceAdjust_DEPRECATED = -2;
        goto LABEL_9;
      }
      if (v19 == 4240173202)
      {
        unsigned __int8 v20 = 1;
        goto LABEL_29;
      }
    }
    else
    {
      if (v19 == 1540760353)
      {
        unsigned __int8 v20 = 5;
        goto LABEL_29;
      }
      if (v19 == 2702125347)
      {
        unsigned __int8 v20 = 2;
LABEL_29:
        self->_productType = v20;
        goto LABEL_9;
      }
    }
    self->_productType = 0;
    self->_uint64_t deviceAdjust_DEPRECATED = 0;
  }
  else
  {
    BOOL v21 = [(NSString *)self->_deviceClassName isEqualToString:@"Bridge"];
    self->_uint64_t deviceAdjust_DEPRECATED = 0;
    if (v21)
    {
      unsigned __int8 v7 = 8;
      goto LABEL_8;
    }
    self->_uint64_t deviceClass = 0;
  }
LABEL_9:
  self->_double deviceVTEndtimeDistanceThreshold = 0.5;
  [(SCDACoordinator *)self _readDefaults];
  BOOL v8 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = self->_deviceClassName;
    double v10 = self->_productTypeName;
    uint64_t deviceClass = self->_deviceClass;
    uint64_t deviceAdjust_DEPRECATED = self->_deviceAdjust_DEPRECATED;
    double deviceDelay = self->_deviceDelay;
    double deviceTrumpDelay = self->_deviceTrumpDelay;
    double deviceInEarDelay = self->_deviceInEarDelay;
    double deviceInEarInterval = self->_deviceInEarInterval;
    double deviceVTEndtimeDistanceThreshold = self->_deviceVTEndtimeDistanceThreshold;
    int v22 = 136317442;
    __int16 v23 = "-[SCDACoordinator _initDeviceClassAndAdjustments]";
    __int16 v24 = 2112;
    int v25 = v9;
    __int16 v26 = 2112;
    uint64_t v27 = v10;
    __int16 v28 = 2048;
    uint64_t v29 = deviceClass;
    __int16 v30 = 2048;
    uint64_t v31 = deviceAdjust_DEPRECATED;
    __int16 v32 = 2048;
    double v33 = deviceDelay;
    __int16 v34 = 2048;
    double v35 = deviceTrumpDelay;
    __int16 v36 = 2048;
    double v37 = deviceInEarDelay;
    __int16 v38 = 2048;
    double v39 = deviceInEarInterval;
    __int16 v40 = 2048;
    double v41 = deviceVTEndtimeDistanceThreshold;
    _os_log_impl(&dword_25C707000, v8, OS_LOG_TYPE_INFO, "%s BTLE device class: %@ (%@) detected, category %ld, adjusting goodness by %ld, std delay %f, trump delay %f, in_ear delay %f interval %f vt_endtime threshold %f", (uint8_t *)&v22, 0x66u);
  }
}

- (void)_readDefaults
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315138;
    uint64_t v19 = "-[SCDACoordinator _readDefaults]";
    _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s #scda reading defaults", (uint8_t *)&v18, 0xCu);
  }
  self->_BOOL coordinationEnabled = [(SCDAPreferences *)self->_preferences coordinationEnabled];
  self->_BOOL BLEActivityEnabled = [(SCDAPreferences *)self->_preferences BLEActivityEnabled];
  self->_int constantGoodness = [(SCDAPreferences *)self->_preferences constantGoodnessScore];
  self->_uint64_t deviceGroup = [(SCDAPreferences *)self->_preferences deviceGroup];
  [(SCDAPreferences *)self->_preferences deviceSlowDown];
  self->_int testInducedSlowdownMsecs = (int)(v4 * 1000.0);
  if ([(SCDAPreferences *)self->_preferences myriadServerHasProvisioned])
  {
    double v5 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315138;
      uint64_t v19 = "-[SCDACoordinator _readDefaults]";
      _os_log_impl(&dword_25C707000, v5, OS_LOG_TYPE_INFO, "%s #scda reading server provisioned defaults", (uint8_t *)&v18, 0xCu);
    }
    if ([(SCDAPreferences *)self->_preferences deviceClass]) {
      self->_uint64_t deviceClass = [(SCDAPreferences *)self->_preferences deviceClass];
    }
    [(SCDAPreferences *)self->_preferences deviceAdjust];
    self->_uint64_t deviceAdjust_DEPRECATED = (int)v6;
    [(SCDAPreferences *)self->_preferences deviceDelay];
    self->_double deviceDelay = v7;
    [(SCDAPreferences *)self->_preferences deviceTrumpDelay];
    self->_double deviceTrumpDelay = v8;
    [(SCDAPreferences *)self->_preferences voiceTriggerEndtimeDelayThreshold];
    self->_double deviceVTEndtimeDistanceThreshold = v9;
  }
  double v10 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    deviceClassName = self->_deviceClassName;
    productTypeName = self->_productTypeName;
    uint64_t deviceClass = self->_deviceClass;
    uint64_t deviceAdjust_DEPRECATED = self->_deviceAdjust_DEPRECATED;
    double deviceDelay = self->_deviceDelay;
    double deviceTrumpDelay = self->_deviceTrumpDelay;
    double deviceVTEndtimeDistanceThreshold = self->_deviceVTEndtimeDistanceThreshold;
    int v18 = 136316930;
    uint64_t v19 = "-[SCDACoordinator _readDefaults]";
    __int16 v20 = 2112;
    BOOL v21 = deviceClassName;
    __int16 v22 = 2112;
    __int16 v23 = productTypeName;
    __int16 v24 = 2048;
    uint64_t v25 = deviceClass;
    __int16 v26 = 2048;
    uint64_t v27 = deviceAdjust_DEPRECATED;
    __int16 v28 = 2048;
    double v29 = deviceDelay;
    __int16 v30 = 2048;
    double v31 = deviceTrumpDelay;
    __int16 v32 = 2048;
    double v33 = deviceVTEndtimeDistanceThreshold;
    _os_log_impl(&dword_25C707000, v10, OS_LOG_TYPE_INFO, "%s #scda reading defaults: BTLE device class: %@ (%@) detected, category %ld, adjusting goodness by %ld, std delay %f, trump delay %f, vt_endtime threshold %f", (uint8_t *)&v18, 0x52u);
  }
}

- (void)readDefaults
{
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__SCDACoordinator_readDefaults__block_invoke;
  block[3] = &unk_2654B81C8;
  void block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

uint64_t __31__SCDACoordinator_readDefaults__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _readDefaults];
}

- (void)dealloc
{
  [(SCDACoordinator *)self _clearWiProxReadinessTimer];
  [(SCDAPowerAssertionManager *)self->_powerAssertionManager releaseAllPowerAssertions];
  if (self->_BLEActivityEnabled)
  {
    [(WPHeySiri *)self->_heySiriBTLE stopScanningAndAdvertising];
    [(WPHeySiri *)self->_heySiriBTLE invalidate];
    self->_heySiriBTLEState = 0;
  }
  electionParticipantIdVendor = self->_electionParticipantIdVendor;
  self->_electionParticipantIdVendor = 0;

  v4.receiver = self;
  v4.super_class = (Class)SCDACoordinator;
  [(SCDACoordinator *)&v4 dealloc];
}

- (SCDACoordinator)initWithDelegate:(id)a3
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v93.receiver = self;
  v93.super_class = (Class)SCDACoordinator;
  double v5 = [(SCDACoordinator *)&v93 init];
  if (!v5)
  {
LABEL_5:
    double v7 = 0;
    goto LABEL_22;
  }
  if (_currentCoordinator)
  {
    float v6 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[SCDACoordinator initWithDelegate:]";
      _os_log_error_impl(&dword_25C707000, v6, OS_LOG_TYPE_ERROR, "%s Attempt to initialize MyriadCoordinator when one already exists.", buf, 0xCu);
    }
    goto LABEL_5;
  }
  kdebug_trace();
  *((void *)v5 + 1) = 0;
  *((void *)v5 + 2) = 0;
  *((void *)v5 + 3) = 0;
  objc_storeWeak((id *)v5 + 11, v4);
  uint64_t v8 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:10];
  double v9 = (void *)*((void *)v5 + 5);
  *((void *)v5 + 5) = v8;

  uint64_t v10 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:10];
  unint64_t v11 = (void *)*((void *)v5 + 6);
  *((void *)v5 + 6) = v10;

  uint64_t v12 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:10];
  int v13 = (void *)*((void *)v5 + 7);
  *((void *)v5 + 7) = v12;

  uint64_t v14 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:10];
  double v15 = (void *)*((void *)v5 + 9);
  *((void *)v5 + 9) = v14;

  uint64_t v16 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:10];
  unint64_t v17 = (void *)*((void *)v5 + 8);
  *((void *)v5 + 8) = v16;

  uint64_t v18 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:10];
  uint64_t v19 = (void *)*((void *)v5 + 10);
  *((void *)v5 + 10) = v18;

  __int16 v20 = (void *)*((void *)v5 + 4);
  *((void *)v5 + 4) = 0;

  BOOL v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  __int16 v22 = dispatch_queue_attr_make_with_qos_class(v21, QOS_CLASS_USER_INTERACTIVE, 0);

  dispatch_queue_t v23 = dispatch_queue_create((const char *)scda_work_queue_label, v22);
  __int16 v24 = (void *)*((void *)v5 + 22);
  *((void *)v5 + 22) = v23;

  dispatch_queue_t v25 = dispatch_queue_create((const char *)scda_context_queue_label, v22);
  __int16 v26 = (void *)*((void *)v5 + 23);
  *((void *)v5 + 23) = v25;

  if (*((void *)v5 + 23))
  {
    uint64_t v27 = [[SCDAAdvertisementContextManager alloc] initWithQueue:*((void *)v5 + 23)];
    __int16 v28 = (void *)*((void *)v5 + 63);
    *((void *)v5 + 63) = v27;
  }
  double v29 = [MEMORY[0x263F28528] defaultContext];
  __int16 v30 = objc_alloc_init(SCDAInstrumentation);
  double v31 = (void *)*((void *)v5 + 78);
  *((void *)v5 + 78) = v30;

  __int16 v32 = [SCDAGoodnessScoreEvaluator alloc];
  double v33 = +[SCDAAssistantPreferences sharedPreferences];
  uint64_t v34 = [(SCDAGoodnessScoreEvaluator *)v32 initWithDeviceInstanceContext:v29 preferences:v33 queue:*((void *)v5 + 22) instrumentation:*((void *)v5 + 78)];
  double v35 = (void *)*((void *)v5 + 65);
  *((void *)v5 + 65) = v34;

  [*((id *)v5 + 65) setLastActivationTime:0.0];
  __int16 v36 = [SCDAPreferences alloc];
  double v37 = +[SCDAAssistantPreferences sharedPreferences];
  uint64_t v38 = [(SCDAPreferences *)v36 initWithDeviceInstanceContext:v29 preferences:v37];
  double v39 = (void *)*((void *)v5 + 74);
  *((void *)v5 + 74) = v38;

  v5[318] = [*((id *)v5 + 74) coordinationEnabled];
  v5[319] = [*((id *)v5 + 74) BLEActivityEnabled];
  v5[168] = [*((id *)v5 + 74) deviceGroup];
  [*((id *)v5 + 74) deviceSlowDown];
  *((_DWORD *)v5 + 75) = (int)(v40 * 1000.0);
  *((_WORD *)v5 + 156) = 0;
  v5[434] = 0;
  v5[314] = 0;
  *((_WORD *)v5 + 163) = 0;
  *(_WORD *)(v5 + 329) = 0;
  *((_WORD *)v5 + 161) = 0;
  v5[331] = 0;
  double v41 = (void *)*((void *)v5 + 80);
  *((void *)v5 + 80) = 0;

  v5[280] = 0;
  *((_DWORD *)v5 + 74) = 0;
  uint64_t v42 = [[SCDAPowerAssertionManager alloc] initWithIdentifier:@"com.apple.assistant.myriad"];
  int v43 = (void *)*((void *)v5 + 28);
  *((void *)v5 + 28) = v42;

  __int16 v44 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v45 = v5[318];
    int v46 = v5[319];
    v47 = v44;
    BOOL v48 = +[SCDAUtilities isCommunal];
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[SCDACoordinator initWithDelegate:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v45;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v46;
    LOWORD(v99) = 1024;
    *(_DWORD *)((char *)&v99 + 2) = v48;
    _os_log_impl(&dword_25C707000, v47, OS_LOG_TYPE_INFO, "%s #scda coordinationEnabled=%d, BLEActivityEnabled=%d communal=%d", buf, 0x1Eu);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)notificationCallback, @"com.apple.siri.myriad.apayload", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)outputTriggerSeenCallback, @"com.apple.siri.corespeech.selftrigger", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)emergencyCallback, @"com.apple.siri.myriad.falseemergency", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)myriadDecisionRequestCallback, @"com.apple.siri.myriad.get.decision", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)inEarTriggerSeenCallback, @"com.apple.siri.myriad.in.ear", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)carplayTriggerSeenCallback, @"com.apple.siri.myriad.jarvis", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v50 = [MEMORY[0x263F08C38] UUID];
  uint64_t v51 = (void *)*((void *)v5 + 47);
  *((void *)v5 + 47) = v50;

  id v52 = (void *)*((void *)v5 + 30);
  *((void *)v5 + 30) = 0;

  *((void *)v5 + 31) = 0;
  *((void *)v5 + 32) = 0;
  *((void *)v5 + 33) = 0;
  objc_storeStrong((id *)&_currentCoordinator, v5);
  *((_WORD *)v5 + 160) = 0;
  v5[328] = 0;
  uint64_t v53 = (void *)*((void *)v5 + 24);
  *((void *)v5 + 24) = &stru_2709D13B0;

  *((void *)v5 + 34) = 0;
  int v54 = (void *)*((void *)v5 + 38);
  *((void *)v5 + 38) = 0;

  *((_WORD *)v5 + 209) = 0;
  v55 = (void *)*((void *)v5 + 48);
  *((void *)v5 + 48) = 0;

  *((_DWORD *)v5 + 98) = 0;
  v5[433] = 0;
  *((void *)v5 + 51) = 0;
  v5[416] = 0;
  id v56 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v57 = (void *)*((void *)v5 + 43);
  *((void *)v5 + 43) = v56;

  [*((id *)v5 + 43) setDateFormat:@"hh:mm:ss.SSS"];
  int v58 = objc_alloc_init(SCDAEmergencyCallPunchout);
  uint64_t v59 = (void *)*((void *)v5 + 50);
  *((void *)v5 + 50) = v58;

  [v5 _initDeviceClassAndAdjustments];
  *((void *)v5 + 29) = CFNotificationCenterGetDarwinNotifyCenter();
  id v60 = (void *)*((void *)v5 + 26);
  *((void *)v5 + 26) = 0;

  id v61 = (void *)*((void *)v5 + 66);
  *((void *)v5 + 66) = 0;

  [v5 _initializeTimer];
  *((_WORD *)v5 + 228) = 0;
  [v5 _initializeWiProxReadinessTimer];
  [v5 _resetAdvertisementTimings];
  if (v5[319])
  {
    uint64_t v94 = 0;
    v95 = &v94;
    uint64_t v96 = 0x2050000000;
    BOOL v62 = (void *)getWPHeySiriClass_softClass;
    uint64_t v97 = getWPHeySiriClass_softClass;
    if (!getWPHeySiriClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getWPHeySiriClass_block_invoke;
      v99 = &unk_2654B7FF8;
      v100 = &v94;
      __getWPHeySiriClass_block_invoke((uint64_t)buf);
      BOOL v62 = (void *)v95[3];
    }
    BOOL v63 = v62;
    _Block_object_dispose(&v94, 8);
    uint64_t v64 = [[v63 alloc] initWithDelegate:v5 queue:*((void *)v5 + 22)];
    __int16 v65 = (void *)*((void *)v5 + 44);
    *((void *)v5 + 44) = v64;
  }
  else
  {
    __int16 v65 = (void *)*((void *)v5 + 44);
    *((void *)v5 + 44) = 0;
  }

  v91[0] = MEMORY[0x263EF8330];
  v91[1] = 3221225472;
  v91[2] = __36__SCDACoordinator_initWithDelegate___block_invoke;
  v91[3] = &unk_2654B81C8;
  id v66 = v5;
  v92 = v66;
  [v66 waitWiProx:2000 andExecute:v91];
  __int16 v67 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[SCDACoordinator initWithDelegate:]";
    _os_log_impl(&dword_25C707000, v67, OS_LOG_TYPE_INFO, "%s Initialized MyriadCoordinator", buf, 0xCu);
  }
  uint64_t v68 = [MEMORY[0x263F087C8] defaultCenter];
  [v68 addObserver:v66 selector:sel_updateRequestId_ name:@"RequestIdForMyriad" object:0];

  *((void *)v66 + 53) = 0;
  BOOL v69 = [SCDANotifyStatePublisher alloc];
  uint64_t v70 = [NSString stringWithCString:"com.apple.siri.myriad.decision.begin" encoding:4];
  uint64_t v71 = [(SCDANotifyStatePublisher *)v69 initWithName:v70 queue:*((void *)v5 + 22)];
  uint64_t v72 = (void *)*((void *)v66 + 67);
  *((void *)v66 + 67) = v71;

  int v73 = [SCDANotifyStatePublisher alloc];
  uint64_t v74 = [NSString stringWithCString:"com.apple.siri.myriad.decision.won" encoding:4];
  uint64_t v75 = [(SCDANotifyStatePublisher *)v73 initWithName:v74 queue:*((void *)v5 + 22)];
  uint64_t v76 = (void *)*((void *)v66 + 68);
  *((void *)v66 + 68) = v75;

  uint64_t v77 = [SCDANotifyStatePublisher alloc];
  __int16 v78 = [NSString stringWithCString:"com.apple.siri.myriad.decision.lost" encoding:4];
  uint64_t v79 = [(SCDANotifyStatePublisher *)v77 initWithName:v78 queue:*((void *)v5 + 22)];
  uint64_t v80 = (void *)*((void *)v66 + 69);
  *((void *)v66 + 69) = v79;

  v81 = [SCDANotifyStatePublisher alloc];
  uint64_t v82 = [NSString stringWithCString:"com.apple.siri.myriad.repost.decision.won" encoding:4];
  uint64_t v83 = [(SCDANotifyStatePublisher *)v81 initWithName:v82 queue:*((void *)v5 + 22)];
  v84 = (void *)*((void *)v66 + 70);
  *((void *)v66 + 70) = v83;

  *((void *)v66 + 73) = 0;
  uint64_t v85 = observerWithNotificationName((uint64_t)"com.apple.siri.myriad.readdefaults", v29, 1, v66, *((void **)v5 + 22));
  uint64_t v86 = (void *)*((void *)v66 + 71);
  *((void *)v66 + 71) = v85;

  if (SCDAIsInternalInstall_onceToken != -1) {
    dispatch_once(&SCDAIsInternalInstall_onceToken, &__block_literal_global_1260);
  }
  if (SCDAIsInternalInstall_isInternal)
  {
    uint64_t v87 = SCDAForceNoActivityNotifyStateObserver(v29, 1, v66, *((void **)v5 + 22));
    uint64_t v88 = (void *)*((void *)v66 + 72);
    *((void *)v66 + 72) = v87;
  }
  v89 = (void *)*((void *)v66 + 79);
  *((void *)v66 + 79) = 0;

  kdebug_trace();
  double v7 = v66;

LABEL_22:
  return v7;
}

uint64_t __36__SCDACoordinator_initWithDelegate___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 319))
  {
    [*(id *)(v2 + 352) stopScanningAndAdvertising];
    [*(id *)(a1 + 32) _createElectionParticipantIdVendorIfRequired];
    [*(id *)(*(void *)(a1 + 32) + 360) fetchBTLEAddressIfRequired];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v2 + 456) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 457) = 0;
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 enterState:17];
}

+ (void)clearCurrentCoordinator
{
  uint64_t v2 = (void *)_currentCoordinator;
  _currentCoordinator = 0;
}

+ (void)didChangeDefaults
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.siri.myriad.readdefaults", 0, 0, 1u);
}

+ (id)currentCoordinator
{
  return (id)_currentCoordinator;
}

+ (void)initialize
{
  if (SCDALogInitIfNeeded_once != -1) {
    dispatch_once(&SCDALogInitIfNeeded_once, &__block_literal_global_511);
  }
}

@end