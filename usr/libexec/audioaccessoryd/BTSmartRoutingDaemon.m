@interface BTSmartRoutingDaemon
+ (id)sharedBTSmartRoutingDaemon;
- (BOOL)_aacpConnectedCheck:(id)a3;
- (BOOL)_arbitrationTimeout:(id)a3 withScore:(int)a4;
- (BOOL)_bluetoothProductIDNoEarDetect:(unsigned int)a3;
- (BOOL)_bluetoothProductIDNoUTP:(unsigned int)a3;
- (BOOL)_checkValidBatteryValue:(id)a3;
- (BOOL)_deviceSupportsHijackV2:(id)a3 withDevice:(id)a4;
- (BOOL)_getForceDisconnectBit:(id)a3;
- (BOOL)_inCaseLidClosed:(id)a3;
- (BOOL)_inEarConnectedCheck:(id)a3;
- (BOOL)_inEarNearbyCheck:(id)a3;
- (BOOL)_isAddDeviceToBackoffDueToDisconnect;
- (BOOL)_isAllWxEnabledInEarDetection;
- (BOOL)_isAnyConnectedWxInEarCheck;
- (BOOL)_isAnyHRMEnabledDeviceConnected;
- (BOOL)_isAnyWxStream;
- (BOOL)_isConnectionTipiv2;
- (BOOL)_isDevicePairedCheck:(id)a3;
- (BOOL)_isEligibleForPreemptiveBanner:(BOOL)a3 firstPreemptiveBanner:(BOOL)a4 inEarState:(BOOL)a5 srDeviceCount:(unint64_t)a6 audioState:(int64_t)a7 inAddress:(id)a8;
- (BOOL)_isEligibleForTipiV2:(id)a3 firstDeviceTipiScore:(int)a4 secondDeviceTipiScore:(int)a5 currentDeviceScore:(int)a6 sourceDeviceCount:(unsigned int)a7 isOnDemandConnect:(BOOL)a8 address:(id)a9 lastConnectedHost:(id)a10;
- (BOOL)_isForceRejectPipe;
- (BOOL)_isForceTipiv2;
- (BOOL)_isInEarDetectionDisabled:(id)a3;
- (BOOL)_isInEarToOutOfEar:(id)a3;
- (BOOL)_isInHijackBlockingMode;
- (BOOL)_isInTipi;
- (BOOL)_isMagnetConnectedDeviceforConnectionCheck:(id)a3;
- (BOOL)_isMagnetConnectedDeviceforTipiHealingCheck:(id)a3;
- (BOOL)_isManualConnection:(id)a3;
- (BOOL)_isMyAddress:(id)a3;
- (BOOL)_isOnDemandConnectInProgress;
- (BOOL)_isOtherTipiDeviceBeforeTrain:(id)a3 withIOS:(unsigned int)a4 withMacOS:(unsigned int)a5;
- (BOOL)_isPhoneCall:(id)a3;
- (BOOL)_isReceivedLegacyTipiConnect:(id)a3;
- (BOOL)_isSmartRoutingCapableDevice:(id)a3;
- (BOOL)_lastConnectIsWatchCheck:(id)a3;
- (BOOL)_lowBatteryClearSFDevice:(id)a3 reason:(const char *)a4;
- (BOOL)_lowBatteryTrackSFDevice:(id)a3 batteryLevel:(double)a4 batteryType:(int64_t)a5;
- (BOOL)_productColorAssetExists:(unsigned int)a3 withColor:(char)a4;
- (BOOL)_productHasColors:(unsigned int)a3;
- (BOOL)_shouldDelayRouteToSpeaker:(id)a3;
- (BOOL)_supportsPhoneWatchTipi:(unsigned int)a3;
- (BOOL)_supportsSR:(id)a3 andProductID:(unsigned int)a4;
- (BOOL)_supportsTipi:(id)a3;
- (BOOL)_verifyWxConnectedRouted:(id)a3;
- (BOOL)allowHijackWithAudioScore:(unsigned int)a3 hijackRoute:(id)a4 hijackDeniedReason:(id *)a5;
- (BOOL)diagnosticControl:(id)a3 completion:(id)a4;
- (BOOL)isInAnyTipi;
- (BTSmartRoutingDaemon)init;
- (BTSmartRoutingRouteRequest)pipePendingRequest;
- (double)_lowestBatteryInfoForCBDevice:(id)a3;
- (double)_lowestBatteryInfoForSFDevice:(id)a3;
- (id)_bluetoothProductDefaultAsset:(unsigned int)a3;
- (id)_bluetoothProductIDToAsset:(unsigned int)a3;
- (id)_bluetoothProductIDToCaseAsset:(unsigned int)a3 andAddress:(id)a4;
- (id)_bluetoothProductIDToColorAsset:(unsigned int)a3 withColor:(unsigned __int8)a4;
- (id)_bluetoothProductIDToLocalizationString:(unsigned int)a3 withActionButton:(BOOL)a4;
- (id)_descriptionWithLevel:(int)a3;
- (id)_findActiveWxDevice;
- (id)_getActiveNearbyWxAdress;
- (id)_getCurrentRoute;
- (id)_getIDSDeviceFromBtAddress:(id)a3;
- (id)_getInEarSrWxDevice;
- (id)_getJsonStringFromDictionary:(id)a3;
- (id)_getWxChipVersion:(unsigned int)a3;
- (id)_getWxFWVersion:(id)a3;
- (id)_myBluetoothAddressString;
- (id)_nearbyMacAddressTranslate:(id)a3;
- (id)_productColorAssetLookup:(unsigned int)a3 andAddress:(id)a4;
- (id)_verifyWxConnectedBTAddress:(id)a3 withVersion:(id)a4;
- (id)descriptionWithLevel:(int)a3;
- (int)_nearbyDeviceType:(id)a3;
- (int64_t)_checkTickswithinWindow:(unint64_t)a3 withWindow:(unint64_t)a4;
- (int64_t)_getRssiNearby:(id)a3;
- (unsigned)_getWxColorCode:(id)a3;
- (unsigned)_getWxProductID:(id)a3;
- (void)_TUMonitorEnsureStarted;
- (void)_TUMonitorEnsureStopped;
- (void)_aaControllerEnsureStarted;
- (void)_aaControllerEnsureStopped;
- (void)_activate;
- (void)_activityMonitorEnsureStarted;
- (void)_activityMonitorEnsureStopped;
- (void)_anyPairedDeviceSupportsSmartRouting;
- (void)_budSwapDetectionStartTimer:(id)a3;
- (void)_cacheBudswapInfo:(id)a3;
- (void)_callMonitorEnsureStarted;
- (void)_callMonitorEnsureStopped;
- (void)_cancelInUseBannerForCallTimer;
- (void)_cancelRingtoneTimer;
- (void)_cancelTriangleRecoveryTimer;
- (void)_checkIfPairedCompanionDeviceSupportsSmartRouting;
- (void)_checkTriangleRecovery;
- (void)_clearCallSession;
- (void)_connectedDeviceFound:(id)a3;
- (void)_connectedDeviceLost:(id)a3;
- (void)_connectedDeviceMonitorEnsureStarted;
- (void)_connectedDeviceMonitorEnsureStopped;
- (void)_disconnectOtherTipiDevice:(id)a3;
- (void)_disconnectReason:(id)a3 reason:(unint64_t)a4;
- (void)_dumpNearbyWxDevice;
- (void)_dumpSrWxDevice;
- (void)_evaluatorEnsureStarted;
- (void)_evaluatorEnsureStopped;
- (void)_evaluatorRun;
- (void)_evaluatorRunInUseBanner:(id)a3;
- (void)_evaluatorRunTipiElection:(id)a3 nearbyInfoDevicesMap:(id)a4 localScore:(int)a5;
- (void)_handleCallStateChange:(id)a3;
- (void)_handleHRMSessionChanged:(BOOL)a3;
- (void)_handleHighestAudioCategoryChange:(id)a3;
- (void)_handleHijackBlockingwithDevice:(id)a3;
- (void)_handleMediaPauseStateChanged;
- (void)_handleMediaPlayStateChange:(id)a3;
- (void)_handleMediaServerConnectionDied:(id)a3;
- (void)_handlePairedWatchStatusDidChange;
- (void)_handlePhoneOwnershipTriangleTimer;
- (void)_handleProactiveRoutingRouteCheck:(id)a3;
- (void)_handleSmartRoutingDisabled:(id)a3;
- (void)_handleTUCallStateChange:(id)a3;
- (void)_handleTriangleRecoveryInitiated:(id)a3;
- (void)_hijackBackoffReset:(id)a3 withReason:(id)a4;
- (void)_hijackBlockingModeChangedFromClient:(id)a3 mode:(BOOL)a4 completion:(id)a5;
- (void)_iPhoneScreenOnPowerEvent;
- (void)_logEvalError:(id)a3;
- (void)_logEvalWxError:(id)a3 withError:(id)a4;
- (void)_logPreemptiveBannerEvalError:(id)a3;
- (void)_lowBatteryDeviceFound:(id)a3;
- (void)_lowBatteryDeviceLost:(id)a3;
- (void)_lowBatteryLoad;
- (void)_lowBatteryReportGood:(id)a3;
- (void)_lowBatteryReset;
- (void)_lowBatterySave:(BOOL)a3;
- (void)_lowBatteryShowAlertWithLowBatteryDevice:(id)a3;
- (void)_lowBatteryUpdate;
- (void)_mediaRouteDiscoveryStarted;
- (void)_mediaRouteDiscoveryStopped;
- (void)_mediaRouteHijackResponse:(int)a3 wxAddress:(id)a4 andAudioResponseID:(id)a5 andAllowedToHijack:(BOOL)a6 withReason:(id)a7;
- (void)_mediaRouteHijackResponseHandlerFor:(id)a3 allowedToHijack:(BOOL)a4 withReason:(id)a5;
- (void)_mediaRouteHijackWithAudioScore:(int)a3 wxAddress:(id)a4 andAudioResponseID:(id)a5;
- (void)_mediaRouteMonitorActiveAudioRouteChanged:(id)a3;
- (void)_mediaRouteMonitorActivityLevelUpdate:(id)a3;
- (void)_mediaRouteMonitorEnsureStarted;
- (void)_mediaRouteMonitorEnsureStopped;
- (void)_mediaRouteMonitorSpeakRoute;
- (void)_nearbyDeviceInfoCheck;
- (void)_nearbyDeviceInfoTriangleRecoveryTimer;
- (void)_nearbyInfoActivityChanged;
- (void)_nearbyInfoActivityCriticalStart;
- (void)_nearbyInfoActivityDelayCheck:(unint64_t)a3;
- (void)_nearbyInfoDeviceFound:(id)a3;
- (void)_nearbyInfoDeviceLost:(id)a3;
- (void)_nearbyInfoDiscoveryEnsureStarted;
- (void)_nearbyInfoDiscoveryEnsureStopped;
- (void)_nearbyInfoSetAudioRoutingScore;
- (void)_nearbyWxChanged:(id)a3;
- (void)_notifyOtherTipiCallState:(int)a3;
- (void)_notifyOtherTipiDeviceTipiScoreChanged:(int)a3 andNewScore:(int)a4;
- (void)_otherTipiDeviceTipiScoreChanged:(id)a3 withOptions:(id)a4;
- (void)_pairedDeviceMonitorEnsureStarted;
- (void)_pairedDeviceMonitorEnsureStopped;
- (void)_pipeEnsureStarted;
- (void)_pipeEnsureStopped;
- (void)_postNotification:(const char *)a3;
- (void)_powerLogSmartIncomingConnection;
- (void)_powerLogSmartRoutingScanStarted:(unsigned __int8)a3;
- (void)_powerLogSmartRoutingScanStopped:(unsigned __int8)a3;
- (void)_powerMonitorEnsureStarted;
- (void)_powerMonitorEnsureStopped;
- (void)_powerMonitorScreenLockChanged;
- (void)_prefsChanged;
- (void)_proactivelyTakeOwnership;
- (void)_receivedAudioCategory:(id)a3 withOptions:(id)a4;
- (void)_receivedRelinquishOwnership:(id)a3 wxAddress:(id)a4;
- (void)_relayConduitMessageEnsureStarted;
- (void)_relayConduitMessageEnsureStopped;
- (void)_relayConduitMessageReceived:(id)a3 andSourceDevice:(id)a4 messageType:(unsigned __int8)a5 messageData:(id)a6;
- (void)_relayConduitMessageSend:(unsigned __int8)a3 withOptions:(id)a4 andWxAddress:(id)a5 andOtherAddress:(id)a6;
- (void)_relayConduitMessageStartTimer:(id)a3 withOptions:(id)a4;
- (void)_removeTiPiState:(id)a3;
- (void)_resetInUserBannerShown;
- (void)_respondRoutingRequest:(id)a3 withResponseHandler:(id)a4 wxAddress:(id)a5;
- (void)_sendAudioCategory:(id)a3 withAudioCategory:(id)a4;
- (void)_sendAudioCategoryToAllTipiDevices;
- (void)_sendAudioScoreChanged:(BOOL)a3;
- (void)_sendRouteReversedTipiEventForTipsSupport;
- (void)_sendTipiHealingRequest:(id)a3 andOtherTipiAddress:(id)a4;
- (void)_sendTipiScoreUpdateToWx;
- (void)_setAutoRoute:(id)a3 withAutoRoute:(BOOL)a4;
- (void)_setConnectedBannerTick:(unint64_t)a3;
- (void)_setHighPriorityTag:(id)a3 withHighPriority:(BOOL)a4;
- (void)_setIsFirstConnentionAfterSREnable:(BOOL)a3 forDevice:(id)a4;
- (void)_setIsHiddenProperty:(id)a3 withIsHidden:(BOOL)a4;
- (void)_setManualRouteFlag:(id)a3 withManualRoute:(BOOL)a4;
- (void)_setOtherTipiDeviceBTAddress:(id)a3 andName:(id)a4 sourceVersion:(id)a5 withResult:(id)a6;
- (void)_setOwnership:(id)a3 withHijackRequest:(id)a4 withOwnership:(BOOL)a5;
- (void)_setPhase1ConnectConfig:(id)a3 andType:(int)a4;
- (void)_setPipeMessageStats:(unint64_t)a3;
- (void)_setTipiAndRoutedStateFlags:(unsigned int)a3 forDevice:(id)a4;
- (void)_setTipiElectionInProgress:(BOOL)a3;
- (void)_setTipiElectionReceivedLePipe:(id)a3;
- (void)_setTipiElectionType:(BOOL)a3 withDevice:(id)a4;
- (void)_setTotalCountIDSDevices:(id)a3;
- (void)_sigTermReceived;
- (void)_smartRoutingAddWxMapDevice:(id)a3 routingAction:(int)a4 otherAddress:(id)a5 otherName:(id)a6 otherSourceVersion:(id)a7 isRoutingInitialized:(BOOL)a8 newWx:(BOOL)a9;
- (void)_smartRoutingAddWxMapDeviceFromConnectedDevice:(id)a3;
- (void)_smartRoutingAudioRoutingRequest:(id)a3 withResponseHandler:(id)a4;
- (void)_smartRoutingChangeRoute:(id)a3;
- (void)_smartRoutingConnectToEligibleHeadset:(id)a3;
- (void)_smartRoutingConnectionCompleted:(id)a3;
- (void)_smartRoutingLowerRateScan;
- (void)_smartRoutingModeCheck:(id)a3;
- (void)_smartRoutingRouteCompleted:(__CFError *)a3 withUUID:(id)a4;
- (void)_smartRoutingShowBanner:(int)a3 withDevice:(id)a4 andDeviceAddress:(id)a5 andProductID:(unsigned int)a6 andCentralContentItemTxt:(id)a7 andTimeout:(double)a8 andDeviceType:(unsigned int)a9;
- (void)_startAudioStateSnapshotTimer;
- (void)_startHighActivityLevelTimer:(unint64_t)a3;
- (void)_startHijackMetricSubmission:(int64_t)a3 wxAddress:(id)a4 version:(id)a5;
- (void)_startIdleActivityScoreTimer:(unint64_t)a3;
- (void)_startInUseBannerTimer;
- (void)_startManualRouteChangeDetectionTimer:(id)a3;
- (void)_startPhoneTriangleOwnershipTimer:(unint64_t)a3;
- (void)_startPlaybackTimer;
- (void)_startRingtoneTimer;
- (void)_startRouteChangeDetectionTimer:(id)a3 andAnswer:(int64_t)a4;
- (void)_startRouteCheckTimer:(id)a3 andType:(int)a4;
- (void)_startTipiHealing:(id)a3 withLastConnect:(id)a4;
- (void)_startTipiSetupTicks;
- (void)_statsEnsureStarted;
- (void)_stopAudioStateSnapshotTimer:(BOOL)a3;
- (void)_submitConnectionMetric:(id)a3 andError:(id)a4;
- (void)_submitHijackBlockMetric:(id)a3 withReason:(id)a4;
- (void)_submitManualConnectionMetric:(id)a3;
- (void)_submitManualRouteDetectionMetric:(id)a3;
- (void)_submitMetric:(id)a3;
- (void)_submitMetricNearby:(unsigned int)a3;
- (void)_submitMetricTipiHealingforDevice:(id)a3 withDuration:(double)a4 andLegacy:(BOOL)a5;
- (void)_submitNearbyDeviceMetric:(unsigned int)a3;
- (void)_submitRouteChangeDetectionMetric:(id)a3 andAnswer:(int64_t)a4;
- (void)_submitRouteCheckMetric:(id)a3 andType:(int)a4;
- (void)_systemUIMonitorEnsureStarted;
- (void)_systemUIMonitorEnsureStopped;
- (void)_tipiHealing:(id)a3 withDevice:(id)a4;
- (void)_tipiHealingAttempt;
- (void)_tipiHealingHijackTimerStart:(id)a3 withScore:(int)a4;
- (void)_tipiHealingStartTimer:(id)a3;
- (void)_tipihHealingV2Handling:(id)a3;
- (void)_triggerTipiTableUpdate:(id)a3;
- (void)_update;
- (void)_updateAccessoryID:(id)a3 connectionDeviceAddresses:(id)a4 completion:(id)a5;
- (void)_updateAudioRoute:(int)a3 withUUID:(id)a4;
- (void)_updateLocalAudioCategory:(id)a3;
- (void)_updateNearbyDeviceState:(id)a3 withAddress:(id)a4 withEasyPairing:(BOOL)a5 withState:(int)a6;
- (void)_updateOtherTipiBuildVersion:(id)a3;
- (void)_updateOtherTipiDevice:(id)a3 otherAddress:(id)a4 otherName:(id)a5 otherVersion:(id)a6 withResult:(id)a7;
- (void)_updateOtherTipiDevicewithAudioCategory:(id)a3 otherAddress:(id)a4 otherName:(id)a5 otherVersion:(id)a6;
- (void)_updateRoutingActionForManuallyRoute;
- (void)_updateSRDiscoveredDeviceForCBDeviceChanged:(id)a3 connectionStatus:(unsigned __int8)a4;
- (void)_updateSRDiscoveredDeviceForNearbyWxChanged:(id)a3 isNearby:(BOOL)a4;
- (void)_watchHintingRecovery;
- (void)_watchMediaControl;
- (void)_watchRecoveryStartTimer;
- (void)_wxDeviceFound:(id)a3;
- (void)_wxDeviceLost:(id)a3;
- (void)_wxDiscoveryEnsureStarted;
- (void)_wxDiscoveryEnsureStopped;
- (void)_wxDiscoveryWatchRecoveryEnsureStarted;
- (void)_wxDiscoveryWatchRecoveryEnsureStopped;
- (void)_wxDiscoveryWatchRecoveryFoundDevice:(id)a3;
- (void)_wxDiscoveryWatchRecoveryLostDevice:(id)a3;
- (void)activate;
- (void)getHijackAudioInfo:(int *)a3 appCount:(int *)a4 playingApp:(id *)a5 route:(id *)a6 remote:(int *)a7;
- (void)getHijackedAwayAudioInfo:(int *)a3 appCount:(int *)a4 playingApp:(id *)a5 route:(id *)a6 remote:(int *)a7;
- (void)getLocalAudioInfofromSnapshot:(int *)a3 appCount:(int *)a4 playingApp:(id *)a5 route:(id *)a6 remote:(int *)a7;
- (void)getSmartRoutingStateForDeviceAddress:(id)a3;
- (void)handleActivityScoreUpdate:(int)a3;
- (void)invalidate;
- (void)setPipePendingRequest:(id)a3;
- (void)submitHijackMetric:(id)a3 withV1:(BOOL)a4;
- (void)submitRouteActivityMetric:(id)a3 activity:(id)a4;
- (void)updateCurrentAudioSnapshot;
@end

@implementation BTSmartRoutingDaemon

+ (id)sharedBTSmartRoutingDaemon
{
  if (qword_100263E98 != -1) {
    dispatch_once(&qword_100263E98, &stru_1002332B0);
  }
  v2 = (void *)qword_100263E90;

  return v2;
}

- (BTSmartRoutingDaemon)init
{
  v14.receiver = self;
  v14.super_class = (Class)BTSmartRoutingDaemon;
  v2 = [(BTSmartRoutingDaemon *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v2->_activityLevel = 0;
    v2->_activityLevelDeltaInSeconds = 25;
    v2->_activityLevelNotifyToken = -1;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("BTSmartRouting", v4);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("BTSmartRoutingAVSys", v7);
    dispatchQueueAVSys = v3->_dispatchQueueAVSys;
    v3->_dispatchQueueAVSys = (OS_dispatch_queue *)v8;

    v3->_forcedDisconnectionRSSI = -60;
    v3->_lowBatteryResetNotifyToken = -1;
    uint64_t v10 = GestaltCopyAnswer();
    myModel = v3->_myModel;
    v3->_myModel = (NSString *)v10;

    v3->_ownershipToken = -1;
    v3->_prefsChangedNotifyToken = -1;
    v3->_prefSmartRoutingForcedDisconnectionStartSeconds = 1.0;
    v3->_ringerStateToken = -1;
    v3->_splitterStateOnToken = -1;
    v3->_smartRoutingDisconnectToken = -1;
    v3->_cbDaemonNotifyToken = -1;
    v3->_tipiElectionPhase1 = 0;
    v12 = v3;
  }

  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_10001E20C;
  v12 = sub_10001E21C;
  id v13 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E224;
  block[3] = &unk_1002332D8;
  block[4] = self;
  block[5] = &v8;
  int v7 = a3;
  dispatch_sync((dispatch_queue_t)dispatchQueue, block);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (id)_descriptionWithLevel:(int)a3
{
  uint64_t v128 = 0;
  v129 = &v128;
  uint64_t v130 = 0x3032000000;
  v131 = sub_10001E20C;
  v132 = sub_10001E21C;
  id v133 = 0;
  id v4 = objc_alloc_init((Class)NSDateFormatter);
  [v4 setDateFormat:@"yyyy-MM-dd"];
  v100 = self->_myAddress;
  id obj = (id)v129[5];
  unint64_t activityLevel = (char)self->_activityLevel;
  if (activityLevel > 0xE) {
    v6 = "?";
  }
  else {
    v6 = off_100234178[activityLevel];
  }
  uint64_t score = self->_score;
  if (score > 0xF) {
    uint64_t v8 = "?";
  }
  else {
    uint64_t v8 = off_1002342D0[score];
  }
  if (self->_prefSmartRoutingEnabledPhase3) {
    v9 = "yes";
  }
  else {
    v9 = "no";
  }
  if (self->_sleeping) {
    uint64_t v10 = "yes";
  }
  else {
    uint64_t v10 = "no";
  }
  int sleepWakeState = self->_sleepWakeState;
  v89 = v4;
  location = (id *)(v129 + 5);
  v98 = v8;
  v99 = v6;
  v96 = v10;
  v97 = v9;
  if (sleepWakeState > 29)
  {
    switch(sleepWakeState)
    {
      case 30:
        v12 = "FullWake";
        goto LABEL_27;
      case 40:
        v12 = "Restart";
        goto LABEL_27;
      case 50:
        v12 = "PowerOff";
        goto LABEL_27;
    }
  }
  else
  {
    switch(sleepWakeState)
    {
      case 0:
        v12 = "Unknown";
        goto LABEL_27;
      case 10:
        v12 = "Sleep";
        goto LABEL_27;
      case 20:
        v12 = "DarkWake";
        goto LABEL_27;
    }
  }
  v12 = "?";
LABEL_27:
  v94 = v12;
  int v95 = [(CUSystemMonitor *)self->_callMonitor activeCallCount];
  BOOL activityLevelMediaPlaying = self->_activityLevelMediaPlaying;
  BOOL isBTRoute = self->_isBTRoute;
  BOOL isSpeakerRoute = self->_isSpeakerRoute;
  BOOL isBuiltInReceiverRoute = self->_isBuiltInReceiverRoute;
  BOOL pairedDeviceSupportsSmartRouting = self->_pairedDeviceSupportsSmartRouting;
  BOOL isHSA2Account = self->_isHSA2Account;
  BOOL ringerState = self->_ringerState;
  unint64_t prefSmartRoutingBlockHijackWindowinSeconds = self->_prefSmartRoutingBlockHijackWindowinSeconds;
  int64_t totalCloudDeviceCount = self->_totalCloudDeviceCount;
  uint64_t v19 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice isFirstConnectionAfterSREnable];
  v20 = (void *)v19;
  if (ringerState) {
    v21 = "yes";
  }
  else {
    v21 = "no";
  }
  if (isHSA2Account) {
    v22 = "yes";
  }
  else {
    v22 = "no";
  }
  if (pairedDeviceSupportsSmartRouting) {
    v23 = "yes";
  }
  else {
    v23 = "no";
  }
  if (isBuiltInReceiverRoute) {
    v24 = "yes";
  }
  else {
    v24 = "no";
  }
  if (isSpeakerRoute) {
    v25 = "yes";
  }
  else {
    v25 = "no";
  }
  if (isBTRoute) {
    v26 = "yes";
  }
  else {
    v26 = "no";
  }
  if (activityLevelMediaPlaying) {
    v27 = "yes";
  }
  else {
    v27 = "no";
  }
  if (v95 <= 0) {
    v28 = "no";
  }
  else {
    v28 = "yes";
  }
  uint64_t v88 = v19;
  v87 = v21;
  v86 = v22;
  v84 = v24;
  v85 = v23;
  v82 = v26;
  v83 = v25;
  v80 = v28;
  v81 = v27;
  v68 = v100;
  NSAppendPrintF_safe();
  objc_storeStrong(location, obj);

  v29 = self->_uiLowBatteryBanner;
  v30 = v29;
  if (v29)
  {
    v31 = (id *)(v129 + 5);
    id v126 = (id)v129[5];
    v68 = v29;
    NSAppendPrintF();
    objc_storeStrong(v31, v126);
  }

  v32 = self->_uiSmartRoutingBanner;
  v33 = v32;
  if (v32)
  {
    v34 = (id *)(v129 + 5);
    id v125 = (id)v129[5];
    v68 = v32;
    NSAppendPrintF();
    objc_storeStrong(v34, v125);
  }

  v35 = self->_uiNoteSessionLowBattery;
  v36 = v35;
  if (v35)
  {
    v37 = (id *)(v129 + 5);
    id v124 = (id)v129[5];
    v68 = v35;
    NSAppendPrintF();
    objc_storeStrong(v37, v124);
  }

  v38 = self->_uiNoteSessionSmartRouting;
  v39 = v38;
  if (v38)
  {
    v40 = (id *)(v129 + 5);
    id v123 = (id)v129[5];
    v68 = v38;
    NSAppendPrintF();
    objc_storeStrong(v40, v123);
  }

  v41 = (id *)(v129 + 5);
  id v122 = (id)v129[5];
  NSAppendPrintF();
  objc_storeStrong(v41, v122);
  v42 = (id *)(v129 + 5);
  id v121 = (id)v129[5];
  id v69 = -[NSMutableDictionary count](self->_connectedDevices, "count", v68, v99, v98, v97, v96, v94, v80, v81, v82, v83, v84, v85, v86, totalCloudDeviceCount, v87, prefSmartRoutingBlockHijackWindowinSeconds, v88,
          @"n/a");
  connectedDiscovery = self->_connectedDiscovery;
  NSAppendPrintF();
  objc_storeStrong(v42, v121);
  connectedDevices = self->_connectedDevices;
  v120[0] = _NSConcreteStackBlock;
  v120[1] = 3221225472;
  v120[2] = sub_10001EBCC;
  v120[3] = &unk_100233300;
  v120[4] = &v128;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](connectedDevices, "enumerateKeysAndObjectsUsingBlock:", v120, v69, connectedDiscovery);
  v44 = (id *)(v129 + 5);
  id v119 = (id)v129[5];
  NSAppendPrintF();
  objc_storeStrong(v44, v119);
  v45 = (id *)(v129 + 5);
  id v118 = (id)v129[5];
  v46 = [(CBDiscovery *)self->_pairedDiscovery discoveredDevices];
  id v70 = [v46 count];
  pairedDiscovery = self->_pairedDiscovery;
  NSAppendPrintF();
  objc_storeStrong(v45, v118);

  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  v47 = [(CBDiscovery *)self->_pairedDiscovery discoveredDevices];
  id v48 = [v47 countByEnumeratingWithState:&v114 objects:v134 count:16];
  if (v48)
  {
    uint64_t v49 = *(void *)v115;
    do
    {
      for (i = 0; i != v48; i = (char *)i + 1)
      {
        if (*(void *)v115 != v49) {
          objc_enumerationMutation(v47);
        }
        uint64_t v51 = *(void *)(*((void *)&v114 + 1) + 8 * i);
        v52 = (id *)(v129 + 5);
        id v113 = (id)v129[5];
        uint64_t v71 = v51;
        NSAppendPrintF();
        objc_storeStrong(v52, v113);
      }
      id v48 = [v47 countByEnumeratingWithState:&v114 objects:v134 count:16];
    }
    while (v48);
  }

  v53 = (id *)(v129 + 5);
  id v112 = (id)v129[5];
  NSAppendPrintF();
  objc_storeStrong(v53, v112);
  v54 = (id *)(v129 + 5);
  id v111 = (id)v129[5];
  id v72 = [(NSMutableDictionary *)self->_nearbyInfoDevices count];
  nearbyInfoDiscovery = self->_nearbyInfoDiscovery;
  NSAppendPrintF();
  objc_storeStrong(v54, v111);
  nearbyInfoDevices = self->_nearbyInfoDevices;
  v110[0] = _NSConcreteStackBlock;
  v110[1] = 3221225472;
  v110[2] = sub_10001EC1C;
  v110[3] = &unk_100233328;
  v110[4] = &v128;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](nearbyInfoDevices, "enumerateKeysAndObjectsUsingBlock:", v110, v72, nearbyInfoDiscovery);
  v56 = (id *)(v129 + 5);
  id v109 = (id)v129[5];
  NSAppendPrintF();
  objc_storeStrong(v56, v109);
  v57 = (id *)(v129 + 5);
  id v108 = (id)v129[5];
  id v73 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap count];
  NSAppendPrintF();
  objc_storeStrong(v57, v108);
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v107[0] = _NSConcreteStackBlock;
  v107[1] = 3221225472;
  v107[2] = sub_10001EC84;
  v107[3] = &unk_100233350;
  v107[4] = &v128;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v107, v73);
  v59 = (id *)(v129 + 5);
  id v106 = (id)v129[5];
  id v74 = [(NSMutableDictionary *)self->_wxDevices count];
  wxDiscovery = self->_wxDiscovery;
  NSAppendPrintF();
  objc_storeStrong(v59, v106);
  wxDevices = self->_wxDevices;
  v105[0] = _NSConcreteStackBlock;
  v105[1] = 3221225472;
  v105[2] = sub_10001EFE4;
  v105[3] = &unk_100233328;
  v105[4] = &v128;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](wxDevices, "enumerateKeysAndObjectsUsingBlock:", v105, v74, wxDiscovery);
  v61 = (id *)(v129 + 5);
  id v104 = (id)v129[5];
  NSAppendPrintF();
  objc_storeStrong(v61, v104);
  v62 = (id *)(v129 + 5);
  id v103 = (id)v129[5];
  id v75 = [(NSMutableDictionary *)self->_lowBatteryDeviceMap count];
  NSAppendPrintF();
  objc_storeStrong(v62, v103);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  lowBatteryDeviceMap = self->_lowBatteryDeviceMap;
  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472;
  v102[2] = sub_10001F04C;
  v102[3] = &unk_100233378;
  *(CFAbsoluteTime *)&v102[5] = Current;
  v102[4] = &v128;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](lowBatteryDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v102, v75);
  v65 = (id *)(v129 + 5);
  id v101 = (id)v129[5];
  NSAppendPrintF();
  objc_storeStrong(v65, v101);
  id v66 = (id)v129[5];

  _Block_object_dispose(&v128, 8);

  return v66;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F208;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_activate
{
  self->_smartRoutingCapable = 1;
  v3 = +[AADeviceManagerDaemon sharedAADeviceManagerDaemon];
  aaDeviceManagerDaemon = self->_aaDeviceManagerDaemon;
  self->_aaDeviceManagerDaemon = v3;

  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    v27 = self->_aaDeviceManagerDaemon;
    LogPrintF();
  }
  if (self->_lowBatteryResetNotifyToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001F8A4;
    handler[3] = &unk_1002329C0;
    handler[4] = self;
    notify_register_dispatch("com.apple.bluetooth.lowBatteryReset", &self->_lowBatteryResetNotifyToken, (dispatch_queue_t)dispatchQueue, handler);
  }
  if (!self->_sourceDevice)
  {
    v6 = objc_alloc_init(BTSmartRoutingSourceDevice);
    sourceDevice = self->_sourceDevice;
    self->_sourceDevice = v6;
  }
  if (!self->_srDiscoveredDeviceMap)
  {
    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    srDiscoveredDeviceMap = self->_srDiscoveredDeviceMap;
    self->_srDiscoveredDeviceMap = v8;
  }
  [(BTSmartRoutingDaemon *)self _statsEnsureStarted];
  if (self->_prefsChangedNotifyToken == -1)
  {
    uint64_t v10 = self->_dispatchQueue;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10001F928;
    v35[3] = &unk_1002329C0;
    v35[4] = self;
    notify_register_dispatch("com.apple.bluetooth.prefsChanged", &self->_prefsChangedNotifyToken, (dispatch_queue_t)v10, v35);
  }
  [(BTSmartRoutingDaemon *)self _prefsChanged];
  if (!self->_sigTermSource)
  {
    v11 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)self->_dispatchQueue);
    sigTermSource = self->_sigTermSource;
    self->_sigTermSource = v11;

    id v13 = self->_sigTermSource;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10001F9AC;
    v34[3] = &unk_100232710;
    v34[4] = self;
    dispatch_source_set_event_handler(v13, v34);
    dispatch_activate((dispatch_object_t)self->_sigTermSource);
  }
  objc_super v14 = +[CBIDSManager sharedInstance];
  self->_int64_t totalCloudDeviceCount = (int64_t)[v14 totalCloudDeviceCount];

  v15 = +[NSNotificationCenter defaultCenter];
  [v15 addObserver:self selector:"_setTotalCountIDSDevices:" name:@"BTTotalIDSDeviceCountChanged" object:0];
  if (!self->_localDeviceAudioCatogory) {
    [(BTSmartRoutingDaemon *)self _updateLocalAudioCategory:&off_100244820];
  }
  v16 = +[NSDistributedNotificationCenter defaultCenter];
  [v16 addObserver:self selector:"_handleTriangleRecoveryInitiated:" name:@"com.apple.BTServer.TriangleRecoveryInitiated" object:0];

  if (GestaltGetDeviceClass() == 1)
  {
    v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:self selector:"_handlePairedWatchStatusDidChange" name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];

    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:self selector:"_handlePairedWatchStatusDidChange" name:NRPairedDeviceRegistryDeviceDidPairNotification object:0];

    [(BTSmartRoutingDaemon *)self _handlePairedWatchStatusDidChange];
    uint64_t v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:self selector:"_checkIfPairedCompanionDeviceSupportsSmartRouting" name:NRPairedDeviceRegistryDeviceDidBecomeActive object:0];

    [(BTSmartRoutingDaemon *)self _checkIfPairedCompanionDeviceSupportsSmartRouting];
  }
  if (GestaltGetDeviceClass() == 6) {
    self->_pairedCompanionDeviceSupportsSmartRouting = 1;
  }
  v20 = self->_dispatchQueue;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10001F9B4;
  v33[3] = &unk_1002329C0;
  v33[4] = self;
  notify_register_dispatch("com.apple.bluetooth.daemonStarted", &self->_cbDaemonNotifyToken, (dispatch_queue_t)v20, v33);
  v21 = self->_dispatchQueue;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10001FB04;
  v32[3] = &unk_1002329C0;
  v32[4] = self;
  notify_register_dispatch("com.apple.bluetooth.SmartRoutingDisconnectReason", &self->_smartRoutingDisconnectToken, (dispatch_queue_t)v21, v32);
  v22 = self->_dispatchQueue;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10001FF3C;
  v31[3] = &unk_1002329C0;
  v31[4] = self;
  notify_register_dispatch("com.apple.BluetoothServices.AudioRoutingOwnershipTaken", &self->_ownershipToken, (dispatch_queue_t)v22, v31);
  if (self->_ringerStateToken == -1)
  {
    v23 = self->_dispatchQueue;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10002031C;
    v30[3] = &unk_1002329C0;
    v30[4] = self;
    notify_register_dispatch("com.apple.springboard.ringerstate", &self->_ringerStateToken, (dispatch_queue_t)v23, v30);
  }
  if (self->_splitterStateOnToken == -1)
  {
    v24 = self->_dispatchQueue;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000203E8;
    v29[3] = &unk_1002329C0;
    v29[4] = self;
    notify_register_dispatch("com.apple.bluetooth.WirelessSplitterOn", &self->_splitterStateOnToken, (dispatch_queue_t)v24, v29);
  }
  v25 = self->_dispatchQueue;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000204B4;
  v28[3] = &unk_1002329C0;
  v28[4] = self;
  notify_register_dispatch("com.apple.bluetooth.magnet", &self->_magnetStateToken, (dispatch_queue_t)v25, v28);
  v26 = +[NSSet setWithObjects:@"Zoom", @"Webex", @"google.Tachyon", @"google.meetings", 0];
  [(BTSmartRoutingSourceDevice *)self->_sourceDevice setConferencingCallSets:v26];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000205F8;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (BOOL)diagnosticControl:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  CFStringGetTypeID();
  uint64_t v8 = CFDictionaryGetTypedValue();

  if (!v8) {
    goto LABEL_4;
  }
  if (![v8 caseInsensitiveCompare:@"lbReset"])
  {
    dispatchQueue = self->_dispatchQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100020B6C;
    v16[3] = &unk_100232620;
    v16[4] = self;
    v11 = &v17;
    id v17 = v6;
    v12 = v16;
LABEL_7:
    dispatch_async((dispatch_queue_t)dispatchQueue, v12);

    BOOL v9 = 1;
    goto LABEL_8;
  }
  if (![v8 caseInsensitiveCompare:@"lbSave"])
  {
    dispatchQueue = self->_dispatchQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100020C0C;
    v14[3] = &unk_100232620;
    v14[4] = self;
    v11 = &v15;
    id v15 = v6;
    v12 = v14;
    goto LABEL_7;
  }
LABEL_4:
  BOOL v9 = 0;
LABEL_8:

  return v9;
}

- (id)_myBluetoothAddressString
{
  myAddress = self->_myAddress;
  if (!myAddress
    || (id)[(NSString *)myAddress length] != (id)17
    || !strcmp([(NSString *)self->_myAddress UTF8String], "00:00:00:00:00:00"))
  {
    id v4 = +[CBController controllerInfoAndReturnError:0];
    dispatch_queue_t v5 = [v4 hardwareAddressData];
    CUPrintNSDataAddress();
    id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v7 = self->_myAddress;
    self->_myAddress = v6;

    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  uint64_t v8 = self->_myAddress;

  return v8;
}

- (void)_prefsChanged
{
  CFPrefs_GetDouble();
  if (v3 >= 5.0) {
    double v4 = v3;
  }
  else {
    double v4 = 57600.0;
  }
  double prefLowBatteryDelaySeconds = self->_prefLowBatteryDelaySeconds;
  if (v4 != prefLowBatteryDelaySeconds)
  {
    if (dword_1002610B8 <= 30)
    {
      if (dword_1002610B8 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_9;
        }
        double prefLowBatteryDelaySeconds = self->_prefLowBatteryDelaySeconds;
      }
      double v121 = prefLowBatteryDelaySeconds;
      int64_t totalCloudDeviceCount = *(void *)&v4;
      LogPrintF();
    }
LABEL_9:
    self->_double prefLowBatteryDelaySeconds = v4;
  }
  BOOL v6 = CFPrefs_GetInt64() != 0;
  if (self->_prefLowBatteryEnabled != v6)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      id v7 = "yes";
      if (v6) {
        *(double *)&uint64_t v8 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&uint64_t v8 = COERCE_DOUBLE("yes");
      }
      if (!v6) {
        id v7 = "no";
      }
      double v121 = *(double *)&v8;
      int64_t totalCloudDeviceCount = (int64_t)v7;
      LogPrintF();
    }
    self->_prefLowBatteryEnabled = v6;
  }
  CFPrefs_GetDouble();
  double v10 = v9;
  double prefLowBatteryForceLevel = self->_prefLowBatteryForceLevel;
  if (v10 != prefLowBatteryForceLevel)
  {
    if (dword_1002610B8 <= 30)
    {
      if (dword_1002610B8 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_26;
        }
        double prefLowBatteryForceLevel = self->_prefLowBatteryForceLevel;
      }
      double v121 = prefLowBatteryForceLevel;
      int64_t totalCloudDeviceCount = *(void *)&v10;
      LogPrintF();
    }
LABEL_26:
    self->_double prefLowBatteryForceLevel = v10;
  }
  CFPrefs_GetDouble();
  if (v12 >= 5.0) {
    double v13 = v12;
  }
  else {
    double v13 = 1800.0;
  }
  double prefLowBatterySaveSeconds = self->_prefLowBatterySaveSeconds;
  if (v13 != prefLowBatterySaveSeconds)
  {
    if (dword_1002610B8 <= 30)
    {
      if (dword_1002610B8 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_35;
        }
        double prefLowBatterySaveSeconds = self->_prefLowBatterySaveSeconds;
      }
      double v121 = prefLowBatterySaveSeconds;
      int64_t totalCloudDeviceCount = *(void *)&v13;
      LogPrintF();
    }
LABEL_35:
    self->_double prefLowBatterySaveSeconds = v13;
  }
  CFPrefs_GetDouble();
  if (v15 >= 5.0) {
    double v16 = v15;
  }
  else {
    double v16 = 57600.0;
  }
  double prefLowBatteryStaleSeconds = self->_prefLowBatteryStaleSeconds;
  if (v16 != prefLowBatteryStaleSeconds)
  {
    if (dword_1002610B8 <= 30)
    {
      if (dword_1002610B8 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_44;
        }
        double prefLowBatteryStaleSeconds = self->_prefLowBatteryStaleSeconds;
      }
      double v121 = prefLowBatteryStaleSeconds;
      int64_t totalCloudDeviceCount = *(void *)&v16;
      LogPrintF();
    }
LABEL_44:
    self->_double prefLowBatteryStaleSeconds = v16;
  }
  BOOL v18 = CFPrefs_GetInt64() != 0;
  if (self->_prefSmartRoutingConnectionAlert != v18)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v19 = "yes";
      if (v18) {
        *(double *)&v20 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&v20 = COERCE_DOUBLE("yes");
      }
      if (!v18) {
        uint64_t v19 = "no";
      }
      double v121 = *(double *)&v20;
      int64_t totalCloudDeviceCount = (int64_t)v19;
      LogPrintF();
    }
    self->_prefSmartRoutingConnectionAlert = v18;
  }
  CFPrefs_GetDouble();
  double v22 = v21;
  double secondsBetweenConnectBanner = self->_secondsBetweenConnectBanner;
  if (v22 != secondsBetweenConnectBanner)
  {
    if (dword_1002610B8 <= 30)
    {
      if (dword_1002610B8 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_61;
        }
        double secondsBetweenConnectBanner = self->_secondsBetweenConnectBanner;
      }
      double v121 = secondsBetweenConnectBanner;
      int64_t totalCloudDeviceCount = *(void *)&v22;
      LogPrintF();
    }
LABEL_61:
    self->_double secondsBetweenConnectBanner = v22;
  }
  int v24 = _os_feature_enabled_impl();
  if (self->_prefSmartRoutingWatchAutomaticSwitching != v24)
  {
    BOOL v25 = v24;
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      v26 = "yes";
      if (v25) {
        *(double *)&v27 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&v27 = COERCE_DOUBLE("yes");
      }
      if (!v25) {
        v26 = "no";
      }
      double v121 = *(double *)&v27;
      int64_t totalCloudDeviceCount = (int64_t)v26;
      LogPrintF();
    }
    self->_prefSmartRoutingWatchAutomaticSwitching = v25;
  }
  BOOL smartRoutingCapable = CFPrefs_GetInt64() != 0;
  int v29 = dword_1002610B8;
  if (self->_prefSmartRoutingEnabledPhase3 != smartRoutingCapable)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      v30 = "yes";
      if (smartRoutingCapable) {
        *(double *)&v31 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&v31 = COERCE_DOUBLE("yes");
      }
      if (!smartRoutingCapable) {
        v30 = "no";
      }
      double v121 = *(double *)&v31;
      int64_t totalCloudDeviceCount = (int64_t)v30;
      LogPrintF();
    }
    self->_prefSmartRoutingEnabledPhase3 = smartRoutingCapable;
    int v29 = dword_1002610B8;
  }
  if (v29 <= 30 && (v29 != -1 || _LogCategory_Initialize()))
  {
    v32 = "no";
    if (smartRoutingCapable) {
      *(double *)&v33 = COERCE_DOUBLE("yes");
    }
    else {
      *(double *)&v33 = COERCE_DOUBLE("no");
    }
    if (self->_isHSA2Account) {
      v34 = "yes";
    }
    else {
      v34 = "no";
    }
    if (self->_pairedDeviceSupportsSmartRouting) {
      v35 = "yes";
    }
    else {
      v35 = "no";
    }
    if (self->_isFirstUpdated) {
      v32 = "yes";
    }
    id v124 = v35;
    id v125 = v32;
    int64_t totalCloudDeviceCount = self->_totalCloudDeviceCount;
    id v123 = v34;
    double v121 = *(double *)&v33;
    LogPrintF();
  }
  if ((self->_totalCloudDeviceCount > 1 || self->_pairedDeviceContainsCompanionWatch) && self->_isHSA2Account) {
    BOOL smartRoutingCapable = 1;
  }
  if (self->_smartRoutingCapable != smartRoutingCapable || !self->_isFirstUpdated)
  {
    self->_BOOL smartRoutingCapable = smartRoutingCapable;
    self->_isFirstUpdated = 1;
    if (dword_1002610B8 <= 30)
    {
      if (dword_1002610B8 != -1)
      {
LABEL_107:
        *(double *)&v36 = COERCE_DOUBLE("yes");
        if (!smartRoutingCapable) {
          *(double *)&v36 = COERCE_DOUBLE("no");
        }
        double v121 = *(double *)&v36;
        LogPrintF();
        goto LABEL_111;
      }
      if (_LogCategory_Initialize())
      {
        BOOL smartRoutingCapable = self->_smartRoutingCapable;
        goto LABEL_107;
      }
    }
LABEL_111:
    v37 = +[CloudXPCService sharedInstance];
    CFStringRef v126 = @"srCapable";
    v38 = +[NSNumber numberWithBool:self->_smartRoutingCapable];
    v127 = v38;
    v39 = +[NSDictionary dictionaryWithObjects:&v127 forKeys:&v126 count:1];
    [v37 sendCloudKitMsg:@"smartRoutingCapable" args:v39];
  }
  BOOL v40 = CFPrefs_GetInt64() != 0;
  if (self->_prefSmartRoutingNoBackOffTimers != v40)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      v41 = "yes";
      if (v40) {
        *(double *)&v42 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&v42 = COERCE_DOUBLE("yes");
      }
      if (!v40) {
        v41 = "no";
      }
      double v121 = *(double *)&v42;
      int64_t totalCloudDeviceCount = (int64_t)v41;
      LogPrintF();
    }
    self->_prefSmartRoutingNoBackOffTimers = v40;
  }
  BOOL v43 = CFPrefs_GetInt64() != 0;
  if (self->_prefSmartRoutingPipeEnabled != v43)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      v44 = "yes";
      if (v43) {
        *(double *)&v45 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&v45 = COERCE_DOUBLE("yes");
      }
      if (!v43) {
        v44 = "no";
      }
      double v121 = *(double *)&v45;
      int64_t totalCloudDeviceCount = (int64_t)v44;
      LogPrintF();
    }
    self->_prefSmartRoutingPipeEnabled = v43;
  }
  double Int64 = (double)(unint64_t)CFPrefs_GetInt64();
  unint64_t prefSmartRoutingBlockHijackWindowinSeconds = self->_prefSmartRoutingBlockHijackWindowinSeconds;
  if (Int64 != (double)prefSmartRoutingBlockHijackWindowinSeconds)
  {
    if (dword_1002610B8 <= 30)
    {
      if (dword_1002610B8 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_139;
        }
        unint64_t prefSmartRoutingBlockHijackWindowinSeconds = self->_prefSmartRoutingBlockHijackWindowinSeconds;
      }
      int64_t totalCloudDeviceCount = *(void *)&Int64;
      double v121 = *(double *)&prefSmartRoutingBlockHijackWindowinSeconds;
      LogPrintF();
    }
LABEL_139:
    self->_unint64_t prefSmartRoutingBlockHijackWindowinSeconds = (unint64_t)Int64;
  }
  BOOL v48 = CFPrefs_GetInt64() != 0;
  if (self->_prefSmartRoutingTipiElection != v48)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v49 = "yes";
      if (v48) {
        *(double *)&v50 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&v50 = COERCE_DOUBLE("yes");
      }
      if (!v48) {
        uint64_t v49 = "no";
      }
      double v121 = *(double *)&v50;
      int64_t totalCloudDeviceCount = (int64_t)v49;
      LogPrintF();
    }
    self->_prefSmartRoutingTipiElection = v48;
  }
  BOOL v51 = CFPrefs_GetInt64() != 0;
  if (self->_prefSmartRoutingTipiHealingv2 != v51)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      v52 = "yes";
      if (v51) {
        *(double *)&v53 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&v53 = COERCE_DOUBLE("yes");
      }
      if (!v51) {
        v52 = "no";
      }
      double v121 = *(double *)&v53;
      int64_t totalCloudDeviceCount = (int64_t)v52;
      LogPrintF();
    }
    self->_prefSmartRoutingTipiHealingv2 = v51;
  }
  BOOL v54 = CFPrefs_GetInt64() != 0;
  if (self->_prefSmartRoutingForcedDisconnection != v54)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      v55 = "yes";
      if (v54) {
        *(double *)&v56 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&v56 = COERCE_DOUBLE("yes");
      }
      if (!v54) {
        v55 = "no";
      }
      double v121 = *(double *)&v56;
      int64_t totalCloudDeviceCount = (int64_t)v55;
      LogPrintF();
    }
    self->_prefSmartRoutingForcedDisconnection = v54;
  }
  CFPrefs_GetDouble();
  double prefSmartRoutingForcedDisconnectionStartSeconds = self->_prefSmartRoutingForcedDisconnectionStartSeconds;
  double v59 = v58;
  if (v58 != prefSmartRoutingForcedDisconnectionStartSeconds)
  {
    if (dword_1002610B8 <= 30)
    {
      if (dword_1002610B8 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_178;
        }
        double prefSmartRoutingForcedDisconnectionStartSeconds = self->_prefSmartRoutingForcedDisconnectionStartSeconds;
      }
      double v121 = prefSmartRoutingForcedDisconnectionStartSeconds;
      int64_t totalCloudDeviceCount = *(void *)&v59;
      LogPrintF();
    }
LABEL_178:
    self->_double prefSmartRoutingForcedDisconnectionStartSeconds = v59;
  }
  uint64_t v60 = CFPrefs_GetInt64();
  if (v60 <= 999 && v60 >= -999 && v60 != 0) {
    uint64_t v64 = v60;
  }
  else {
    uint64_t v64 = -60;
  }
  *(void *)&double v65 = self->_forcedDisconnectionRSSI;
  if (v64 != *(void *)&v65)
  {
    if (dword_1002610B8 <= 30)
    {
      if (dword_1002610B8 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_196;
        }
        *(void *)&double v65 = self->_forcedDisconnectionRSSI;
      }
      double v121 = v65;
      int64_t totalCloudDeviceCount = v64;
      LogPrintF();
    }
LABEL_196:
    self->_forcedDisconnectionRSSI = v64;
  }
  BOOL v66 = CFPrefs_GetInt64() != 0;
  if (self->_prefSmartRoutingNoNearbyFallBack != v66)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      v67 = "yes";
      if (v66) {
        *(double *)&v68 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&v68 = COERCE_DOUBLE("yes");
      }
      if (!v66) {
        v67 = "no";
      }
      double v121 = *(double *)&v68;
      int64_t totalCloudDeviceCount = (int64_t)v67;
      LogPrintF();
    }
    self->_prefSmartRoutingNoNearbyFallBack = v66;
  }
  BOOL v69 = CFPrefs_GetInt64() != 0;
  if (self->_prefSmartRoutingEligible != v69)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      id v70 = "yes";
      if (v69) {
        *(double *)&uint64_t v71 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&uint64_t v71 = COERCE_DOUBLE("yes");
      }
      if (!v69) {
        id v70 = "no";
      }
      double v121 = *(double *)&v71;
      int64_t totalCloudDeviceCount = (int64_t)v70;
      LogPrintF();
    }
    self->_prefSmartRoutingEligible = v69;
  }
  BOOL v72 = CFPrefs_GetInt64() != 0;
  if (self->_prefSpeakRoute != v72)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      id v73 = "yes";
      if (v72) {
        *(double *)&id v74 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&id v74 = COERCE_DOUBLE("yes");
      }
      if (!v72) {
        id v73 = "no";
      }
      double v121 = *(double *)&v74;
      int64_t totalCloudDeviceCount = (int64_t)v73;
      LogPrintF();
    }
    self->_prefSpeakRoute = v72;
  }
  BOOL v75 = CFPrefs_GetInt64() != 0;
  if (self->_prefRouteIndicationEnable != v75)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      v76 = "yes";
      if (v75) {
        *(double *)&v77 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&v77 = COERCE_DOUBLE("yes");
      }
      if (!v75) {
        v76 = "no";
      }
      double v121 = *(double *)&v77;
      int64_t totalCloudDeviceCount = (int64_t)v76;
      LogPrintF();
    }
    self->_prefRouteIndicationEnable = v75;
  }
  BOOL v78 = CFPrefs_GetInt64() != 0;
  if (self->_prefProactiveOwnershipArbitration != v78)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      v79 = "yes";
      if (v78) {
        *(double *)&v80 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&v80 = COERCE_DOUBLE("yes");
      }
      if (!v78) {
        v79 = "no";
      }
      double v121 = *(double *)&v80;
      int64_t totalCloudDeviceCount = (int64_t)v79;
      LogPrintF();
    }
    self->_prefProactiveOwnershipArbitration = v78;
  }
  BOOL v81 = CFPrefs_GetInt64() != 0;
  if (self->_prefSmartRoutingNoAutoRouteMac != v81)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      v82 = "yes";
      if (v81) {
        *(double *)&v83 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&v83 = COERCE_DOUBLE("yes");
      }
      if (!v81) {
        v82 = "no";
      }
      double v121 = *(double *)&v83;
      int64_t totalCloudDeviceCount = (int64_t)v82;
      LogPrintF();
    }
    self->_prefSmartRoutingNoAutoRouteMac = v81;
  }
  BOOL v84 = CFPrefs_GetInt64() != 0;
  if (self->_prefSmartRoutingForceRejectLePipe != v84)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      v85 = "yes";
      if (v84) {
        *(double *)&v86 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&v86 = COERCE_DOUBLE("yes");
      }
      if (!v84) {
        v85 = "no";
      }
      double v121 = *(double *)&v86;
      int64_t totalCloudDeviceCount = (int64_t)v85;
      LogPrintF();
    }
    self->_prefSmartRoutingForceRejectLePipe = v84;
  }
  BOOL v87 = CFPrefs_GetInt64() != 0;
  if (self->_prefSmartRoutingForceTipiv2 != v87)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v88 = "yes";
      if (v87) {
        *(double *)&v89 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&v89 = COERCE_DOUBLE("yes");
      }
      if (!v87) {
        uint64_t v88 = "no";
      }
      double v121 = *(double *)&v89;
      int64_t totalCloudDeviceCount = (int64_t)v88;
      LogPrintF();
    }
    self->_prefSmartRoutingForceTipiv2 = v87;
  }
  int v90 = _os_feature_enabled_impl();
  int prefSmartRoutingPreemptiveConnectedBanner = self->_prefSmartRoutingPreemptiveConnectedBanner;
  if (prefSmartRoutingPreemptiveConnectedBanner != v90)
  {
    BOOL v92 = v90;
    if (dword_1002610B8 <= 30)
    {
      if (dword_1002610B8 != -1)
      {
LABEL_288:
        v93 = "yes";
        if (prefSmartRoutingPreemptiveConnectedBanner) {
          *(double *)&v94 = COERCE_DOUBLE("yes");
        }
        else {
          *(double *)&v94 = COERCE_DOUBLE("no");
        }
        if (!v92) {
          v93 = "no";
        }
        double v121 = *(double *)&v94;
        int64_t totalCloudDeviceCount = (int64_t)v93;
        LogPrintF();
        goto LABEL_295;
      }
      if (_LogCategory_Initialize())
      {
        int prefSmartRoutingPreemptiveConnectedBanner = self->_prefSmartRoutingPreemptiveConnectedBanner;
        goto LABEL_288;
      }
    }
LABEL_295:
    self->_int prefSmartRoutingPreemptiveConnectedBanner = v92;
  }
  BOOL v95 = (_os_feature_enabled_impl() & 1) != 0 || CFPrefs_GetInt64() != 0;
  if (self->_prefSmartRoutingMacAutomaticSwitching != v95)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      v96 = "yes";
      if (v95) {
        *(double *)&v97 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&v97 = COERCE_DOUBLE("yes");
      }
      if (!v95) {
        v96 = "no";
      }
      double v121 = *(double *)&v97;
      int64_t totalCloudDeviceCount = (int64_t)v96;
      LogPrintF();
    }
    self->_prefSmartRoutingMacAutomaticSwitching = v95;
  }
  BOOL v98 = (_os_feature_enabled_impl() & 1) != 0 || CFPrefs_GetInt64() != 0;
  if (self->_prefSmartRoutingMacMxAudioScore != v98)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      v99 = "yes";
      if (v98) {
        *(double *)&v100 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&v100 = COERCE_DOUBLE("yes");
      }
      if (!v98) {
        v99 = "no";
      }
      double v121 = *(double *)&v100;
      int64_t totalCloudDeviceCount = (int64_t)v99;
      LogPrintF();
    }
    self->_prefSmartRoutingMacMxAudioScore = v98;
  }
  BOOL v101 = CFPrefs_GetInt64() != 0;
  if (self->_prefSmartRoutingForcedHijackv2 != v101)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      v102 = "yes";
      if (v101) {
        *(double *)&id v103 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&id v103 = COERCE_DOUBLE("yes");
      }
      if (!v101) {
        v102 = "no";
      }
      double v121 = *(double *)&v103;
      int64_t totalCloudDeviceCount = (int64_t)v102;
      LogPrintF();
    }
    self->_prefSmartRoutingForcedHijackv2 = v101;
  }
  unint64_t v104 = CFPrefs_GetInt64();
  unint64_t prefSmartRoutingWatchTriangleMagnet = self->_prefSmartRoutingWatchTriangleMagnet;
  if (v104 != prefSmartRoutingWatchTriangleMagnet)
  {
    if (dword_1002610B8 <= 30)
    {
      if (dword_1002610B8 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_340;
        }
        unint64_t prefSmartRoutingWatchTriangleMagnet = self->_prefSmartRoutingWatchTriangleMagnet;
      }
      double v121 = *(double *)&prefSmartRoutingWatchTriangleMagnet;
      int64_t totalCloudDeviceCount = v104;
      LogPrintF();
    }
LABEL_340:
    self->_unint64_t prefSmartRoutingWatchTriangleMagnet = v104;
  }
  CFPrefs_GetDouble();
  double v107 = v106;
  double prefConnectionDelaySeconds = self->_prefConnectionDelaySeconds;
  if (v107 == prefConnectionDelaySeconds) {
    goto LABEL_347;
  }
  if (dword_1002610B8 <= 30)
  {
    if (dword_1002610B8 == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_346;
      }
      double prefConnectionDelaySeconds = self->_prefConnectionDelaySeconds;
    }
    double v121 = prefConnectionDelaySeconds;
    int64_t totalCloudDeviceCount = *(void *)&v107;
    LogPrintF();
  }
LABEL_346:
  self->_double prefConnectionDelaySeconds = v107;
LABEL_347:
  int v109 = _os_feature_enabled_impl();
  if (self->_prefSmartRoutingPrioritizedCall != v109)
  {
    BOOL v110 = v109;
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      id v111 = "yes";
      if (v110) {
        *(double *)&id v112 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&id v112 = COERCE_DOUBLE("yes");
      }
      if (!v110) {
        id v111 = "no";
      }
      double v121 = *(double *)&v112;
      int64_t totalCloudDeviceCount = (int64_t)v111;
      LogPrintF();
    }
    self->_prefSmartRoutingPrioritizedCall = v110;
  }
  BOOL v113 = CFPrefs_GetInt64() != 0;
  if (self->_prefSmartRoutingPrioritizedCallMuteMac != v113)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      long long v114 = "yes";
      if (v113) {
        *(double *)&long long v115 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&long long v115 = COERCE_DOUBLE("yes");
      }
      if (!v113) {
        long long v114 = "no";
      }
      double v121 = *(double *)&v115;
      int64_t totalCloudDeviceCount = (int64_t)v114;
      LogPrintF();
    }
    self->_prefSmartRoutingPrioritizedCallMuteMac = v113;
  }
  BOOL v116 = CFPrefs_GetInt64() != 0;
  if (self->_prefSmartRoutingInUseBanner != v116)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      long long v117 = "yes";
      if (v116) {
        *(double *)&id v118 = COERCE_DOUBLE("no");
      }
      else {
        *(double *)&id v118 = COERCE_DOUBLE("yes");
      }
      if (!v116) {
        long long v117 = "no";
      }
      double v121 = *(double *)&v118;
      int64_t totalCloudDeviceCount = (int64_t)v117;
      LogPrintF();
    }
    self->_prefSmartRoutingInUseBanner = v116;
  }
  unint64_t v119 = CFPrefs_GetInt64();
  unint64_t prefSmartRoutingInUseBannerTimeout = self->_prefSmartRoutingInUseBannerTimeout;
  if (v119 != prefSmartRoutingInUseBannerTimeout)
  {
    if (dword_1002610B8 <= 30)
    {
      if (dword_1002610B8 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_385;
        }
        unint64_t prefSmartRoutingInUseBannerTimeout = self->_prefSmartRoutingInUseBannerTimeout;
      }
      double v121 = *(double *)&prefSmartRoutingInUseBannerTimeout;
      int64_t totalCloudDeviceCount = v119;
      LogPrintF();
    }
LABEL_385:
    self->_unint64_t prefSmartRoutingInUseBannerTimeout = v119;
  }
  [(BTSmartRoutingDaemon *)self _update];
}

- (void)_sigTermReceived
{
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(BTSmartRoutingDaemon *)self _stopAudioStateSnapshotTimer:1];
  if (self->_lowBatterySaveTimer) {
    [(BTSmartRoutingDaemon *)self _lowBatterySave:1];
  }

  xpc_transaction_exit_clean();
}

- (void)_update
{
  BOOL effectiveScreenLocked = self->_effectiveScreenLocked;
  if ([(CUSystemMonitor *)self->_powerMonitor screenOn])
  {
    unsigned int v4 = [(CUSystemMonitor *)self->_powerMonitor screenLocked];
    if (effectiveScreenLocked) {
      BOOL v5 = v4;
    }
    else {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 1;
  }
  if (self->_effectiveScreenLocked != v5)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      BOOL v6 = "yes";
      if (v5) {
        id v7 = "no";
      }
      else {
        id v7 = "yes";
      }
      if (!v5) {
        BOOL v6 = "no";
      }
      double v21 = v7;
      double v22 = v6;
      LogPrintF();
    }
    self->_BOOL effectiveScreenLocked = v5;
    if (v5)
    {
      [(BTSmartRoutingDaemon *)self _nearbyInfoActivityChanged];
      [(BTSmartRoutingDaemon *)self _resetInUserBannerShown];
      uint64_t v8 = [(BTSmartRoutingDaemon *)self _getActiveNearbyWxAdress];
      double v9 = [(NSMutableDictionary *)self->_srDiscoveredDeviceMap objectForKeyedSubscript:v8];
      mach_absolute_time();
      [v9 inUseBannerBackoffTick];
      UpTicksToSecondsF();
      if (v10 < 1.5)
      {
        [v9 _setInUseBannerBackoffReason:0];
        [(SmartRoutingStats *)self->_stats setBannerAction:@"ScreenLocked"];
      }
      [v9 _setNearbyPrevInEar:[v9 nearbyInEar:v21, v22]];

      [(BTSmartRoutingDaemon *)self _powerMonitorScreenLockChanged];
    }
    else
    {
      [(BTSmartRoutingDaemon *)self _powerMonitorScreenLockChanged];
      [(BTSmartRoutingDaemon *)self _iPhoneScreenOnPowerEvent];
      if (self->_prefSmartRoutingEnabledPhase3)
      {
        [(BTSmartRoutingDaemon *)self _startHighActivityLevelTimer:1];
        [(SmartRoutingStats *)self->_stats setProactiveRoutingTrigger:@"Unlock"];
      }
    }
  }
  BOOL prefSmartRoutingEnabledPhase3 = self->_prefSmartRoutingEnabledPhase3;
  if (self->_prefSmartRoutingEnabledPhase3)
  {
    if ([(CUSystemMonitor *)self->_powerMonitor firstUnlocked])
    {
      [(BTSmartRoutingDaemon *)self _pipeEnsureStarted];
      [(BTSmartRoutingDaemon *)self _TUMonitorEnsureStarted];
    }
    else
    {
      [(BTSmartRoutingDaemon *)self _pipeEnsureStopped];
      [(BTSmartRoutingDaemon *)self _TUMonitorEnsureStopped];
    }
  }
  else
  {
    [(BTSmartRoutingDaemon *)self _pipeEnsureStopped];
    [(BTSmartRoutingDaemon *)self _TUMonitorEnsureStopped];
    if (!self->_watchRecoveryEnabled) {
      goto LABEL_32;
    }
  }
  if ([(CUSystemMonitor *)self->_powerMonitor firstUnlocked])
  {
    [(BTSmartRoutingDaemon *)self _activityMonitorEnsureStarted];
    if (!prefSmartRoutingEnabledPhase3) {
      goto LABEL_30;
    }
    goto LABEL_33;
  }
LABEL_32:
  [(BTSmartRoutingDaemon *)self _activityMonitorEnsureStopped];
  if (!prefSmartRoutingEnabledPhase3)
  {
LABEL_30:
    [(BTSmartRoutingDaemon *)self _callMonitorEnsureStopped];
    if (!self->_prefLowBatteryEnabled) {
      goto LABEL_38;
    }
    goto LABEL_36;
  }
LABEL_33:
  if ([(CUSystemMonitor *)self->_powerMonitor firstUnlocked]) {
    [(BTSmartRoutingDaemon *)self _callMonitorEnsureStarted];
  }
  else {
    [(BTSmartRoutingDaemon *)self _callMonitorEnsureStopped];
  }
LABEL_36:
  if ([(CUSystemMonitor *)self->_powerMonitor firstUnlocked])
  {
    [(BTSmartRoutingDaemon *)self _evaluatorEnsureStarted];
    goto LABEL_39;
  }
LABEL_38:
  [(BTSmartRoutingDaemon *)self _evaluatorEnsureStopped];
LABEL_39:
  if ([(CUSystemMonitor *)self->_powerMonitor firstUnlocked])
  {
    [(BTSmartRoutingDaemon *)self _connectedDeviceMonitorEnsureStarted];
    [(BTSmartRoutingDaemon *)self _aaControllerEnsureStarted];
    if (prefSmartRoutingEnabledPhase3) {
      goto LABEL_44;
    }
  }
  else
  {
    [(BTSmartRoutingDaemon *)self _connectedDeviceMonitorEnsureStopped];
    [(BTSmartRoutingDaemon *)self _aaControllerEnsureStopped];
    if (prefSmartRoutingEnabledPhase3) {
      goto LABEL_44;
    }
  }
  if (!self->_prefSpeakRoute)
  {
LABEL_46:
    [(BTSmartRoutingDaemon *)self _mediaRouteMonitorEnsureStopped];
    goto LABEL_47;
  }
LABEL_44:
  if (![(CUSystemMonitor *)self->_powerMonitor firstUnlocked]) {
    goto LABEL_46;
  }
  [(BTSmartRoutingDaemon *)self _mediaRouteMonitorEnsureStarted];
LABEL_47:
  if (!self->_watchRecoveryEnabled
    || ![(CUSystemMonitor *)self->_powerMonitor firstUnlocked]
    || self->_sleeping)
  {
    if (!prefSmartRoutingEnabledPhase3) {
      goto LABEL_62;
    }
    goto LABEL_51;
  }
  id v12 = [(NSMutableDictionary *)self->_watchWxDevices count];
  if (prefSmartRoutingEnabledPhase3 && !v12)
  {
LABEL_51:
    if (![(CUSystemMonitor *)self->_powerMonitor firstUnlocked] || self->_sleeping) {
      goto LABEL_62;
    }
    id v12 = [(NSMutableDictionary *)self->_wxDevices count];
  }
  if (v12
    && (([(CUSystemMonitor *)self->_powerMonitor screenOn] & 1) != 0
     || ![(CUSystemMonitor *)self->_powerMonitor screenLocked]
     || self->_screenLockedLingerTimer
     || [(CUSystemMonitor *)self->_callMonitor activeCallCount]))
  {
    [(BTSmartRoutingDaemon *)self _nearbyInfoDiscoveryEnsureStarted];
    goto LABEL_63;
  }
LABEL_62:
  [(BTSmartRoutingDaemon *)self _nearbyInfoDiscoveryEnsureStopped];
LABEL_63:
  if ([(CUSystemMonitor *)self->_powerMonitor firstUnlocked]) {
    [(BTSmartRoutingDaemon *)self _pairedDeviceMonitorEnsureStarted];
  }
  else {
    [(BTSmartRoutingDaemon *)self _pairedDeviceMonitorEnsureStopped];
  }
  [(BTSmartRoutingDaemon *)self _powerMonitorEnsureStarted];
  if (self->_prefSmartRoutingEnabledPhase3
    && [(CUSystemMonitor *)self->_powerMonitor firstUnlocked])
  {
    [(BTSmartRoutingDaemon *)self _relayConduitMessageEnsureStarted];
    if (!prefSmartRoutingEnabledPhase3) {
      goto LABEL_69;
    }
LABEL_72:
    [(BTSmartRoutingDaemon *)self _systemUIMonitorEnsureStarted];
    goto LABEL_75;
  }
  [(BTSmartRoutingDaemon *)self _relayConduitMessageEnsureStopped];
  if (prefSmartRoutingEnabledPhase3) {
    goto LABEL_72;
  }
LABEL_69:
  if (self->_prefLowBatteryEnabled) {
    [(BTSmartRoutingDaemon *)self _systemUIMonitorEnsureStarted];
  }
  else {
    [(BTSmartRoutingDaemon *)self _systemUIMonitorEnsureStopped];
  }
  if (!self->_prefLowBatteryEnabled) {
    goto LABEL_77;
  }
LABEL_75:
  if (![(CUSystemMonitor *)self->_powerMonitor firstUnlocked])
  {
LABEL_77:
    BOOL v13 = 0;
    goto LABEL_78;
  }
  BOOL v13 = !self->_sleeping;
LABEL_78:
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    if (prefSmartRoutingEnabledPhase3) {
      objc_super v14 = "yes";
    }
    else {
      objc_super v14 = "no";
    }
    if (self->_prefLowBatteryEnabled) {
      double v15 = "yes";
    }
    else {
      double v15 = "no";
    }
    if ([(CUSystemMonitor *)self->_powerMonitor firstUnlocked]) {
      double v16 = "yes";
    }
    else {
      double v16 = "no";
    }
    if (self->_sleeping) {
      id v17 = "yes";
    }
    else {
      id v17 = "no";
    }
    if ([(CUSystemMonitor *)self->_powerMonitor screenOn]) {
      BOOL v18 = "yes";
    }
    else {
      BOOL v18 = "no";
    }
    if ([(CUSystemMonitor *)self->_powerMonitor screenLocked]) {
      uint64_t v19 = "yes";
    }
    else {
      uint64_t v19 = "no";
    }
    if (self->_screenLockedLingerTimer) {
      v20 = "yes";
    }
    else {
      v20 = "no";
    }
    v26 = v19;
    v27 = v20;
    int v24 = v17;
    BOOL v25 = v18;
    double v22 = v15;
    v23 = v16;
    double v21 = v14;
    LogPrintF();
  }
  if (v13
    && (([(CUSystemMonitor *)self->_powerMonitor screenOn] & 1) != 0
     || ![(CUSystemMonitor *)self->_powerMonitor screenLocked]
     || self->_screenLockedLingerTimer
     || [(CUSystemMonitor *)self->_callMonitor activeCallCount]))
  {
    [(BTSmartRoutingDaemon *)self _wxDiscoveryEnsureStarted];
  }
  else
  {
    [(BTSmartRoutingDaemon *)self _wxDiscoveryEnsureStopped];
  }
  if (self->_watchRecoveryEnabled
    && [(CUSystemMonitor *)self->_powerMonitor firstUnlocked]
    && !self->_sleeping)
  {
    [(BTSmartRoutingDaemon *)self _wxDiscoveryWatchRecoveryEnsureStarted];
  }
  else
  {
    [(BTSmartRoutingDaemon *)self _wxDiscoveryWatchRecoveryEnsureStopped];
  }
  [(BTSmartRoutingDaemon *)self _lowBatteryUpdate];

  [(BTSmartRoutingDaemon *)self _evaluatorRun];
}

- (void)_evaluatorEnsureStarted
{
  if (!self->_evaluatorCoalescer)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    double v3 = (CUCoalescer *)objc_alloc_init((Class)CUCoalescer);
    evaluatorCoalescer = self->_evaluatorCoalescer;
    self->_evaluatorCoalescer = v3;
    BOOL v5 = v3;

    [(CUCoalescer *)v5 setDispatchQueue:self->_dispatchQueue];
    [(CUCoalescer *)v5 setMinDelay:0.05];
    [(CUCoalescer *)v5 setMaxDelay:0.1];
    [(CUCoalescer *)v5 setLeeway:0.05];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100022D80;
    v6[3] = &unk_100232A10;
    v6[4] = v5;
    v6[5] = self;
    [(CUCoalescer *)v5 setActionHandler:v6];
  }
}

- (void)_evaluatorEnsureStopped
{
  if (self->_evaluatorCoalescer
    && dword_1002610B8 <= 30
    && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(CUCoalescer *)self->_evaluatorCoalescer invalidate];
  evaluatorCoalescer = self->_evaluatorCoalescer;
  self->_evaluatorCoalescer = 0;

  connectDevice = self->_connectDevice;
  self->_connectDevice = 0;

  [(CBConnection *)self->_connectSession invalidate];
  connectSession = self->_connectSession;
  self->_connectSession = 0;

  smartRoutingLowerScanRateTimer = self->_smartRoutingLowerScanRateTimer;
  if (smartRoutingLowerScanRateTimer)
  {
    uint64_t v8 = smartRoutingLowerScanRateTimer;
    dispatch_source_cancel(v8);
    id v7 = self->_smartRoutingLowerScanRateTimer;
    self->_smartRoutingLowerScanRateTimer = 0;
  }
}

- (void)_evaluatorRun
{
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    double v3 = [(CBDiscovery *)self->_pairedDiscovery discoveredDevices];
    id v4 = [v3 count];
    id v5 = [(NSMutableDictionary *)self->_connectedDevices count];
    id v6 = [(NSMutableDictionary *)self->_nearbyInfoDevices count];
    id v7 = [(NSMutableDictionary *)self->_wxDevices count];
    unint64_t v8 = (unint64_t)[(CBDiscovery *)self->_connectedDiscovery bluetoothState];
    if (v8 > 0xA) {
      double v9 = "?";
    }
    else {
      double v9 = off_100233FC0[v8];
    }
    id v61 = v7;
    v62 = v9;
    id v59 = v5;
    id v60 = v6;
    id v57 = v4;
    LogPrintF();
  }
  id v10 = [(CBDiscovery *)self->_connectedDiscovery bluetoothState];
  if (v10) {
    BOOL v11 = v10 == (id)5;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    unint64_t v12 = (unint64_t)v10;
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      if (v12 - 1 > 9) {
        BOOL v13 = "?";
      }
      else {
        BOOL v13 = off_100233E78[v12 - 1];
      }
      double v58 = v13;
      LogPrintF();
    }
    -[BTSmartRoutingDaemon _postNotification:](self, "_postNotification:", "com.apple.BluetoothServices.PreemptivePortDisconnected", v58);
    connectedDevices = self->_connectedDevices;
    if (connectedDevices)
    {
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      double v16 = [(NSMutableDictionary *)connectedDevices allValues];
      id v17 = [v16 countByEnumeratingWithState:&v70 objects:v74 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v71;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v71 != v18) {
              objc_enumerationMutation(v16);
            }
            [(BTSmartRoutingDaemon *)self _connectedDeviceLost:*(void *)(*((void *)&v70 + 1) + 8 * i)];
          }
          id v17 = [v16 countByEnumeratingWithState:&v70 objects:v74 count:16];
        }
        while (v17);
      }

      v20 = self->_connectedDevices;
      self->_connectedDevices = 0;
    }
    disconnectTicksMap = self->_disconnectTicksMap;
    if (disconnectTicksMap)
    {
      [(NSMutableDictionary *)disconnectTicksMap removeAllObjects];
      double v22 = self->_disconnectTicksMap;
    }
    else
    {
      double v22 = 0;
    }
    self->_disconnectTicksMap = 0;

    if (self->_connectTicks) {
      self->_connectTicks = 0;
    }
    if (self->_tipiSetupTicks) {
      self->_tipiSetupTicks = 0;
    }
    uiSmartRoutingBanner = self->_uiSmartRoutingBanner;
    if (uiSmartRoutingBanner)
    {
      [(BTBannerUISession *)uiSmartRoutingBanner invalidate];
      int v24 = self->_uiSmartRoutingBanner;
      self->_uiSmartRoutingBanner = 0;
    }
    if (self->_tipiElectionInProgress) {
      self->_tipiElectionInProgress = 0;
    }
    [(BTSmartRoutingDaemon *)self _setTipiElectionReceivedLePipe:&stru_10023D730];
    tipiHealingTimer = self->_tipiHealingTimer;
    if (tipiHealingTimer)
    {
      v26 = tipiHealingTimer;
      dispatch_source_cancel(v26);
      v27 = self->_tipiHealingTimer;
      self->_tipiHealingTimer = 0;
    }
    smartRoutingManualDisconnectionList = self->_smartRoutingManualDisconnectionList;
    if (smartRoutingManualDisconnectionList)
    {
      [(NSMutableArray *)smartRoutingManualDisconnectionList removeAllObjects];
      int v29 = self->_smartRoutingManualDisconnectionList;
    }
    else
    {
      int v29 = 0;
    }
    self->_smartRoutingManualDisconnectionList = 0;

    srBudswapDeviceMap = self->_srBudswapDeviceMap;
    if (srBudswapDeviceMap)
    {
      [(NSMutableDictionary *)srBudswapDeviceMap removeAllObjects];
      v31 = self->_srBudswapDeviceMap;
    }
    else
    {
      v31 = 0;
    }
    self->_srBudswapDeviceMap = 0;

    smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
    if (smartRoutingWxDeviceMap)
    {
      [(NSMutableDictionary *)smartRoutingWxDeviceMap removeAllObjects];
      v33 = self->_smartRoutingWxDeviceMap;
    }
    else
    {
      v33 = 0;
    }
    self->_smartRoutingWxDeviceMap = 0;

    smartRoutingBackOffMap = self->_smartRoutingBackOffMap;
    if (smartRoutingBackOffMap)
    {
      [(NSMutableDictionary *)smartRoutingBackOffMap removeAllObjects];
      v35 = self->_smartRoutingBackOffMap;
    }
    else
    {
      v35 = 0;
    }
    self->_smartRoutingBackOffMap = 0;

    v36 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice isFirstConnectionAfterSREnable];

    if (v36)
    {
      v37 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice isFirstConnectionAfterSREnable];
      [v37 removeAllObjects];
    }
    [(BTSmartRoutingSourceDevice *)self->_sourceDevice setIsFirstConnectionAfterSREnable:0];
    highActivityLevelTimer = self->_highActivityLevelTimer;
    if (highActivityLevelTimer)
    {
      v39 = highActivityLevelTimer;
      dispatch_source_cancel(v39);
      BOOL v40 = self->_highActivityLevelTimer;
      self->_highActivityLevelTimer = 0;
    }
    phoneOwnershipTriangleTimer = self->_phoneOwnershipTriangleTimer;
    if (phoneOwnershipTriangleTimer)
    {
      v42 = phoneOwnershipTriangleTimer;
      dispatch_source_cancel(v42);
      BOOL v43 = self->_phoneOwnershipTriangleTimer;
      self->_phoneOwnershipTriangleTimer = 0;
    }
    idleActivityScoreTimer = self->_idleActivityScoreTimer;
    if (idleActivityScoreTimer)
    {
      v45 = idleActivityScoreTimer;
      dispatch_source_cancel(v45);
      v46 = self->_idleActivityScoreTimer;
      self->_idleActivityScoreTimer = 0;
    }
    phase1ConnectConfig = self->_phase1ConnectConfig;
    self->_phase1ConnectConfig = 0;

    [(BTSmartRoutingSourceDevice *)self->_sourceDevice setAudioRoute:1];
    if (v12 > 0xA) {
      BOOL v48 = "?";
    }
    else {
      BOOL v48 = off_100233FC0[v12];
    }
    uint64_t v49 = +[NSString stringWithUTF8String:v48];
    v50 = +[NSString stringWithFormat:@"Bluetooth unsupported state: %@", v49];
    [(BTSmartRoutingDaemon *)self _logEvalError:v50];

    return;
  }
  if (!self->_prefSmartRoutingEnabledPhase3) {
    return;
  }
  if (!self->_connectSession)
  {
    if (self->_connectTicks)
    {
      mach_absolute_time();
      if ((unint64_t)UpTicksToSeconds() <= 0x1DF)
      {
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        CFStringRef v51 = @"Too soon since last connection";
        goto LABEL_81;
      }
    }
    uint64_t v64 = 0;
    double v65 = &v64;
    uint64_t v66 = 0x3032000000;
    v67 = sub_10001E20C;
    v68 = sub_10001E21C;
    id v69 = 0;
    self->_connected3rdPartyDevice = 0;
    objc_super v14 = self->_connectedDevices;
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_1000237B4;
    v63[3] = &unk_1002333C8;
    v63[4] = self;
    v63[5] = &v64;
    [(NSMutableDictionary *)v14 enumerateKeysAndObjectsUsingBlock:v63];
    if (self->_connected3rdPartyDevice
      && dword_1002610B8 <= 30
      && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v65[5] && dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if ((int)[(CUSystemMonitor *)self->_callMonitor connectedCallCount] >= 1
      && GestaltGetDeviceClass() == 1)
    {
      if (([(CUSystemMonitor *)self->_callMonitor callFlags] == 1
         || [(CUSystemMonitor *)self->_callMonitor callFlags] == 2)
        && !self->_isBuiltInReceiverRoute
        && !self->_isSpeakerRoute)
      {
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
        {
          unsigned int v52 = [(CUSystemMonitor *)self->_callMonitor callFlags];
          v53 = "FTaudio";
          if (v52 == 1) {
            v53 = "telephony call";
          }
          double v58 = v53;
          LogPrintF();
        }
        unsigned int v54 = [(CUSystemMonitor *)self->_callMonitor callFlags];
        CFStringRef v55 = @"FTaudio";
        if (v54 == 1) {
          CFStringRef v55 = @"telephony call";
        }
        v56 = +[NSString stringWithFormat:@"current route not builtInReceiver or speakeroniPhone during %@", v55];
        [(BTSmartRoutingDaemon *)self _logEvalError:v56];
      }
      else
      {
        if (([(CUSystemMonitor *)self->_callMonitor callFlags] & 4) == 0
          || self->_isSpeakerRoute)
        {
          goto LABEL_101;
        }
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [(BTSmartRoutingDaemon *)self _logEvalError:@"Current route not speaker during FT Video"];
      }
      _Block_object_dispose(&v64, 8);

      return;
    }
LABEL_101:
    [(BTSmartRoutingDaemon *)self _evaluatorRunTipiElection:self->_wxDevices nearbyInfoDevicesMap:self->_nearbyInfoDevices localScore:self->_score];
    _Block_object_dispose(&v64, 8);

    return;
  }
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  CFStringRef v51 = @"Already connecting to headset";
LABEL_81:

  [(BTSmartRoutingDaemon *)self _logEvalError:v51];
}

- (void)_evaluatorRunInUseBanner:(id)a3
{
  id v4 = a3;
  v47 = v4;
  if (!v4)
  {
    id v4 = [(BTSmartRoutingDaemon *)self _getActiveNearbyWxAdress];
  }
  if (!self->_prefSmartRoutingInUseBanner)
  {
    if (dword_1002610B8 > 30 || dword_1002610B8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_44;
    }
LABEL_70:
    LogPrintF();
    goto LABEL_44;
  }
  if (!v4)
  {
    if (dword_1002610B8 > 30 || dword_1002610B8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_44;
    }
    goto LABEL_70;
  }
  if (!self->_effectiveScreenLocked)
  {
    id v5 = [(NSMutableDictionary *)self->_srDiscoveredDeviceMap objectForKeyedSubscript:v4];
    id v6 = [v5 inUseBannerBackoffReason];

    if (v6)
    {
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
      {
        v28 = [v5 inUseBannerBackoffReason];
        LogPrintF();
      }
      goto LABEL_43;
    }
    if ([v5 inUseBannerShown])
    {
      if (dword_1002610B8 > 30 || dword_1002610B8 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_43;
      }
    }
    else if ([v5 connectionState])
    {
      if (dword_1002610B8 > 30 || dword_1002610B8 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_43;
      }
    }
    else if ([v5 nearbyConnectedSourceCount])
    {
      if ([(BTSmartRoutingDaemon *)self _supportsTipi:v4])
      {
        unsigned int v45 = [v5 nearbyPrevInEar];
        unsigned int v7 = [v5 nearbyInEar];
        unint64_t v8 = [v5 nearbyLastRouteHost];
        if (v8)
        {
          double v9 = [v5 nearbyLastRouteHost];
          unsigned __int8 v10 = [(BTSmartRoutingDaemon *)self _isDevicePairedCheck:v9];
        }
        else
        {
          unsigned __int8 v10 = 0;
        }

        unsigned int v11 = [v5 nearbyiCloudSignIn];
        unint64_t v12 = [v5 nearbyName];
        id v13 = [v5 nearbyProductID];
        unsigned int v14 = [v5 nearbyOutOfCaseTime];
        mach_absolute_time();
        [(BTSmartRoutingSourceDevice *)self->_sourceDevice callStartTicks];
        UpTicksToSecondsF();
        if (v10 & 1) != 0 || (v11) {
          goto LABEL_42;
        }
        double v16 = v15;
        int v17 = 0;
        if ([v5 nearbyStreamState] || v7 != 1)
        {
LABEL_32:
          if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
          {
            BOOL v43 = [(BTSmartRoutingDaemon *)self _getWxChipVersion:v13];
            if (v17) {
              uint64_t v19 = "yes";
            }
            else {
              uint64_t v19 = "no";
            }
            uint64_t v20 = [(SmartRoutingStats *)self->_stats bannerTrigger];
            if (v7 > 7) {
              double v21 = "?";
            }
            else {
              double v21 = off_1002341F0[v7];
            }
            v44 = (void *)v20;
            if (v45 > 7) {
              double v22 = "?";
            }
            else {
              double v22 = off_1002341F0[v45];
            }
            v46 = v22;
            unint64_t v23 = (unint64_t)[v5 nearbyStreamState];
            if (v23 > 3) {
              int v24 = "?";
            }
            else {
              int v24 = off_100234250[v23];
            }
            if (v11) {
              BOOL v25 = "yes";
            }
            else {
              BOOL v25 = "no";
            }
            if (v14 > 3) {
              v26 = "?";
            }
            else {
              v26 = off_100233FA0[(char)v14];
            }
            double v42 = v16;
            BOOL v40 = v26;
            unint64_t prefSmartRoutingInUseBannerTimeout = self->_prefSmartRoutingInUseBannerTimeout;
            id v38 = v13;
            v39 = v25;
            v36 = "no";
            v37 = v12;
            v34 = v24;
            v35 = "yes";
            v32 = v21;
            v33 = v46;
            v30 = v19;
            v31 = v44;
            v27 = v43;
            id v29 = v4;
            LogPrintF();

            if ((v17 & 1) == 0) {
              goto LABEL_42;
            }
          }
          else if (!v17)
          {
LABEL_42:

LABEL_43:
            goto LABEL_44;
          }
          -[BTSmartRoutingDaemon _smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:](self, "_smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:", 3, v12, v4, v13, @"In Use by Other Device", 0, 20.0, v27, v29, v30, v31, v32, v33, v34, v35, v36, v37,
            v38,
            v39,
            v40,
            prefSmartRoutingInUseBannerTimeout,
            *(void *)&v42);
          [v5 _setInUseBannerShown:1];
          goto LABEL_42;
        }
        int v17 = 0;
        unsigned int v18 = v13 - 8202;
        if ((v13 - 8202) <= 0x1A)
        {
          if (((1 << v18) & 0x20033F) != 0)
          {
            if (v45 != 2)
            {
              int v17 = 0;
              goto LABEL_27;
            }
          }
          else
          {
            if (((1 << v18) & 0x45A8400) == 0) {
              goto LABEL_27;
            }
            if (self->_prefSmartRoutingInUseBannerTimeout <= v14)
            {
              int v17 = 0;
              if (v13 != 8223 || v45 != 2) {
                goto LABEL_27;
              }
            }
          }
          [(SmartRoutingStats *)self->_stats setBannerTrigger:@"3rdPartyHeadset-Unlock"];
          int v17 = 1;
        }
LABEL_27:
        if (v18 <= 0x1A && (((1 << v18) & 0x20033F) != 0 || ((1 << v18) & 0x45A8400) != 0) && v16 < 1.5)
        {
          [(SmartRoutingStats *)self->_stats setBannerTrigger:@"3rdPartyHeadset-PhoneCall"];
          int v17 = 1;
        }
        goto LABEL_32;
      }
      if (dword_1002610B8 > 30 || dword_1002610B8 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_43;
      }
    }
    else if (dword_1002610B8 > 30 || dword_1002610B8 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_43;
    }
    LogPrintF();
    goto LABEL_43;
  }
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    goto LABEL_70;
  }
LABEL_44:
}

- (void)_evaluatorRunTipiElection:(id)a3 nearbyInfoDevicesMap:(id)a4 localScore:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5 > 1 || self->_playbackStart || [(NSNumber *)self->_localDeviceAudioCatogory intValue] > 300)
  {
    if (self->_tipiElectionInProgress && !self->_callConnected && !self->_playbackStart)
    {
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      CFStringRef v26 = @"Tipi election already in progress back off";
      goto LABEL_74;
    }
    self->_tipiElectionThroughLEPipe = 0;
    v73[0] = 0;
    v73[1] = v73;
    v73[2] = 0x2020000000;
    int v74 = 0;
    v71[0] = 0;
    v71[1] = v71;
    v71[2] = 0x3032000000;
    v71[3] = sub_10001E20C;
    v71[4] = sub_10001E21C;
    id v72 = 0;
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_100024B20;
    v69[3] = &unk_1002333F0;
    int v70 = a5;
    v69[4] = v73;
    v69[5] = v71;
    [v9 enumerateKeysAndObjectsUsingBlock:v69];
    uint64_t v63 = 0;
    uint64_t v64 = &v63;
    uint64_t v65 = 0x3032000000;
    uint64_t v66 = sub_10001E20C;
    v67 = sub_10001E21C;
    id v68 = 0;
    uint64_t v59 = 0;
    id v60 = &v59;
    uint64_t v61 = 0x2020000000;
    char v62 = 0;
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_100024CB0;
    v57[3] = &unk_100233440;
    int v58 = a5;
    v57[4] = self;
    v57[5] = &v63;
    v57[6] = v73;
    v57[7] = &v59;
    [v8 enumerateKeysAndObjectsUsingBlock:v57];
    unsigned __int8 v10 = v64;
    if (v64[5] && self->_tipiElectionPhase1) {
      *((unsigned char *)v60 + 24) = 1;
    }
    self->_tipiElectionPhase1 = 0;
    unsigned int v11 = (void *)v10[5];
    if (!v11)
    {
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      self->_callConnected = 0;
      self->_playbackStart = 0;
      [(BTSmartRoutingDaemon *)self _logEvalError:@"No eligible headset"];
      goto LABEL_100;
    }
    if (self->_eligibleHeadsetTicks)
    {
      mach_absolute_time();
      if ((unint64_t)UpTicksToSeconds() < 0x78)
      {
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        goto LABEL_100;
      }
      unsigned int v11 = (void *)v64[5];
    }
    unint64_t v12 = [v11 bleDevice];
    id v13 = [v12 bluetoothAddress];

    id v55 = v13;
    if ([v13 length] == (id)6)
    {
      id v51 = [v13 bytes];
      NSPrintF();
      unsigned int v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned int v14 = 0;
    }
    phase1ConnectConfig = self->_phase1ConnectConfig;
    if (phase1ConnectConfig && dword_1002610B8 <= 30)
    {
      if (dword_1002610B8 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_40;
        }
        phase1ConnectConfig = self->_phase1ConnectConfig;
      }
      double v16 = [(SmartRoutingConnectConfig *)phase1ConnectConfig address];
      unsigned int v17 = [(SmartRoutingConnectConfig *)self->_phase1ConnectConfig type];
      if (v17 > 3) {
        unsigned int v18 = "?";
      }
      else {
        unsigned int v18 = off_100234350[v17];
      }
      id v51 = v16;
      v53 = v18;
      LogPrintF();
    }
LABEL_40:
    uint64_t v19 = (void *)v64[5];
    if (self->_tipiElectionThroughLEPipe)
    {
      if (v19)
      {
        if (!self->_phase1ConnectConfig)
        {
          uint64_t v20 = [(SFDevice *)self->_lePipeDevice idsIdentifier];
          if (v14)
          {
            double v21 = [(NSMutableDictionary *)self->_smartRoutingBackOffMap objectForKeyedSubscript:v14];
            unsigned int v22 = [v21 containsString:v20];

            if (!v22)
            {
              self->_tipiElectionInProgress = 1;
              if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
              {
                id v51 = (id)v64[5];
                LogPrintF();
              }
              objc_storeStrong((id *)&self->_eligibleHeadset, (id)v64[5]);
              LOBYTE(v51) = 1;
              [(BTSmartRoutingDaemon *)self _smartRoutingAddWxMapDevice:self->_eligibleHeadset routingAction:3 otherAddress:0 otherName:0 otherSourceVersion:0 isRoutingInitialized:1 newWx:v51];
              [(SmartRoutingStats *)self->_stats setPipeStartTime:mach_absolute_time()];
              smartRoutingPipe = self->_smartRoutingPipe;
              v56[0] = _NSConcreteStackBlock;
              v56[1] = 3221225472;
              v56[2] = sub_100026948;
              v56[3] = &unk_100233468;
              v56[4] = self;
              v56[5] = v14;
              v56[6] = &v63;
              [(BTSmartRoutingPipe *)smartRoutingPipe _pipeSendRouteRequestToSFDevice:v20 andWxHeadset:v14 newPipe:1 connectionResult:0 completion:v56];
              goto LABEL_98;
            }
            if (dword_1002610B8 > 30 || dword_1002610B8 == -1 && !_LogCategory_Initialize())
            {
LABEL_98:

              goto LABEL_99;
            }
          }
          else if (dword_1002610B8 > 90 || dword_1002610B8 == -1 && !_LogCategory_Initialize())
          {
            goto LABEL_98;
          }
          LogPrintF();
          goto LABEL_98;
        }
LABEL_49:
        if (dword_1002610B8 <= 30)
        {
          if (dword_1002610B8 == -1)
          {
            if (!_LogCategory_Initialize()) {
              goto LABEL_53;
            }
            uint64_t v19 = (void *)v64[5];
          }
          id v51 = v19;
          LogPrintF();
        }
LABEL_53:
        -[SmartRoutingStats setPipeStartTime:](self->_stats, "setPipeStartTime:", 0, v51, v53);
        objc_storeStrong((id *)&self->_eligibleHeadset, (id)v64[5]);
        self->_tipiElectionInProgress = 1;
        BOOL v23 = [(BTSmartRoutingDaemon *)self _isOnDemandConnectInProgress];
        if (v23)
        {
          [(BTSmartRoutingPipe *)self->_smartRoutingPipe _invalidate];
          uint64_t v24 = 2;
        }
        else
        {
          uint64_t v24 = 3;
        }
        LOBYTE(v52) = 1;
        [(BTSmartRoutingDaemon *)self _smartRoutingAddWxMapDevice:self->_eligibleHeadset routingAction:v24 otherAddress:0 otherName:0 otherSourceVersion:0 isRoutingInitialized:v23 newWx:v52];
        if (self->_forcedConnection)
        {
          if (v14)
          {
            BOOL v25 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v14];

            if (v25)
            {
              if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
                LogPrintF();
              }
              v27 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v14];
              [v27 setTipiHealingBackoff:1];
            }
          }
        }
        if (self->_prefSmartRoutingPreemptiveConnectedBanner)
        {
          v28 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v14];
          if (v28)
          {
            id v29 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v14];
            v30 = [v29 deviceName];

            if (!v30)
            {
              v31 = +[CloudXPCService sharedInstance];
              v32 = [v31 deviceManager];
              v33 = [v32 fetchDeviceSyncWithAddress:v14];
              v34 = [v33 nickname];
              v35 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v14];
              [v35 setDeviceName:v34];
            }
          }
          v36 = [(id)v64[5] identifier];
          v37 = [v36 UUIDString];

          id v38 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v37];
          id v39 = [v38 audioState];

          CFStringRef v54 = v14;
          BOOL v40 = [(BTSmartRoutingDaemon *)self _inEarNearbyCheck:v14];
          v41 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v37];
          id v42 = [v41 preemptiveBannerShown];
          BOOL v43 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v37];
          LODWORD(v42) = -[BTSmartRoutingDaemon _isEligibleForPreemptiveBanner:firstPreemptiveBanner:inEarState:srDeviceCount:audioState:inAddress:](self, "_isEligibleForPreemptiveBanner:firstPreemptiveBanner:inEarState:srDeviceCount:audioState:inAddress:", v42, [v43 firstPreemptiveBannerShown], v40, -[NSMutableDictionary count](self->_smartRoutingWxDeviceMap, "count"), v39, v54);

          if (v42)
          {
            v44 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v54];
            unsigned int v45 = [v44 deviceName];
            if (v54) {
              CFStringRef v46 = v54;
            }
            else {
              CFStringRef v46 = @"?";
            }
            v47 = -[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:");
            -[BTSmartRoutingDaemon _smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:](self, "_smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:", 1, v45, v46, [v47 productID], @"Connected", 0, 4.0);

            if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            BOOL v48 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v37];
            [v48 setPreemptiveBannerShown:1];

            [(SmartRoutingStats *)self->_stats setLocalAudioScore:self->_localDeviceAudioCatogory];
            uint64_t v49 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v37];
            [v49 setFirstPreemptiveBannerShown:1];

            self->_preemptiveBannerShownTicks = mach_absolute_time();
            self->_preemptiveBannerConnectionInProgress = 1;
            [(BTSmartRoutingDaemon *)self _postNotification:"com.apple.BluetoothServices.PreemptivePortChanged"];
          }

          unsigned int v14 = (__CFString *)v54;
        }
        [(BTSmartRoutingDaemon *)self _smartRoutingConnectToEligibleHeadset:self->_eligibleHeadset];
      }
    }
    else if (v19)
    {
      goto LABEL_49;
    }
LABEL_99:

LABEL_100:
    _Block_object_dispose(&v59, 8);
    _Block_object_dispose(&v63, 8);

    _Block_object_dispose(v71, 8);
    _Block_object_dispose(v73, 8);
    goto LABEL_101;
  }
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  CFStringRef v26 = @"Tipi score below low";
LABEL_74:
  [(BTSmartRoutingDaemon *)self _logEvalError:v26];
LABEL_101:
}

- (void)_resetInUserBannerShown
{
  if (self->_prefSmartRoutingInUseBanner) {
    [(NSMutableDictionary *)self->_srDiscoveredDeviceMap enumerateKeysAndObjectsUsingBlock:&stru_1002334A8];
  }
}

- (void)_smartRoutingAddWxMapDevice:(id)a3 routingAction:(int)a4 otherAddress:(id)a5 otherName:(id)a6 otherSourceVersion:(id)a7 isRoutingInitialized:(BOOL)a8 newWx:(BOOL)a9
{
  BOOL v9 = a8;
  id v72 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  unsigned int v18 = objc_alloc_init(BTSmartRoutingWxDevice);
  uint64_t v19 = [v72 bleDevice];
  uint64_t v20 = [v19 bluetoothAddress];

  if ([v20 length] == (id)6
    && (id v59 = [v20 bytes],
        NSPrintF(),
        (uint64_t v21 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unsigned int v22 = (void *)v21;
    BOOL v69 = v9;
    unsigned int v70 = a4;
    id v71 = v15;
    BOOL v23 = [v72 bleDevice:v59];
    uint64_t v24 = [v23 advertisementFields];
    uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();

    if ([(BTSmartRoutingDaemon *)self _supportsSR:v22 andProductID:Int64Ranged])
    {
      CFStringRef v26 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKey:v22];

      if (!v26 || a9)
      {
        if (a9)
        {
          v28 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKey:v22];

          if (v28)
          {
            if (dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_smartRoutingWxDeviceMap, "setObject:forKeyedSubscript:", 0, v22, v22);
            }
            else
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_smartRoutingWxDeviceMap, "setObject:forKeyedSubscript:", 0, v22, v60);
            }
          }
        }
        id v29 = [v72 identifier];
        uint64_t v30 = [v29 UUIDString];

        v31 = (void *)v30;
        v32 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v30];
        unsigned int v33 = [v32 isInEar];

        if (dword_1002610B8 <= 50 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
        {
          if (v70 > 5) {
            v34 = "?";
          }
          else {
            v34 = off_100234488[v70];
          }
          v35 = "no";
          if (v69) {
            v36 = "yes";
          }
          else {
            v36 = "no";
          }
          if (a9) {
            v37 = "yes";
          }
          else {
            v37 = "no";
          }
          if (v33) {
            v35 = "yes";
          }
          id v62 = v71;
          id v63 = v16;
          id v60 = v22;
          uint64_t v61 = v34;
          uint64_t v65 = v37;
          uint64_t v66 = v35;
          uint64_t v64 = v36;
          LogPrintF();
        }
        unsigned int v68 = v33;
        v27 = v31;
        uint64_t v38 = v70;
        if (-[NSString isEqualToString:](self->_budSwapAddress, "isEqualToString:", v22, v60, v61, v62, v63, v64, v65, v66))
        {
          if (dword_1002610B8 <= 50 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          if (self->_hfpBudswapDetected) {
            self->_hfpBudswapDetected = 0;
          }
          id v39 = [(NSMutableDictionary *)self->_srBudswapDeviceMap objectForKeyedSubscript:v22];
          if (!v39) {
            id v39 = objc_alloc_init(BTSmartRoutingBudswapDevice);
          }
          [(BTSmartRoutingBudswapDevice *)v39 setReconnectionState:1];
          BOOL v40 = [(BTSmartRoutingBudswapDevice *)v39 otherTipiDeviceBTAddress];

          if (v40)
          {
            [(BTSmartRoutingBudswapDevice *)v39 otherTipiDeviceBTAddress];
            v41 = v67 = v27;
            id v42 = [(BTSmartRoutingBudswapDevice *)v39 otherTipiDeviceBTName];
            BOOL v43 = [(BTSmartRoutingBudswapDevice *)v39 otherTipiDeviceVersion];
            [(BTSmartRoutingDaemon *)self _updateOtherTipiDevicewithAudioCategory:v22 otherAddress:v41 otherName:v42 otherVersion:v43];

            v27 = v67;
          }
          budSwapAddress = self->_budSwapAddress;
          self->_budSwapAddress = 0;

          [(NSMutableDictionary *)self->_srBudswapDeviceMap setObject:v39 forKeyedSubscript:v22];
          budSwapTimer = self->_budSwapTimer;
          if (budSwapTimer)
          {
            CFStringRef v46 = budSwapTimer;
            dispatch_source_cancel(v46);
            v47 = self->_budSwapTimer;
            self->_budSwapTimer = 0;
          }
          uint64_t v38 = v70;
        }
        [(BTSmartRoutingWxDevice *)v18 setDeviceAddress:v22];
        [(BTSmartRoutingWxDevice *)v18 setDeviceVersion:0];
        [(BTSmartRoutingWxDevice *)v18 _setOtherTipiAudioCategory:0];
        [(BTSmartRoutingWxDevice *)v18 _setHijackBackoffTick:0];
        [(BTSmartRoutingWxDevice *)v18 _setRoutedState:v38 == 1];
        [(BTSmartRoutingWxDevice *)v18 setConnected:0];
        BOOL v48 = [v72 name];
        [(BTSmartRoutingWxDevice *)v18 setDeviceName:v48];

        uint64_t v49 = [v72 identifier];
        v50 = [v49 UUIDString];
        [(BTSmartRoutingWxDevice *)v18 setConduitDeviceID:v50];

        id v51 = [v72 identifier];
        uint64_t v52 = [v51 UUIDString];
        [(BTSmartRoutingWxDevice *)v18 setIdentifier:v52];

        v53 = [v72 bleDevice];
        CFStringRef v54 = [v53 advertisementFields];
        [(BTSmartRoutingWxDevice *)v18 setProductID:CFDictionaryGetInt64Ranged()];

        [(BTSmartRoutingWxDevice *)v18 setInEar:v68];
        [(BTSmartRoutingWxDevice *)v18 setIsTipiHealingV2Eligible:0];
        [(BTSmartRoutingWxDevice *)v18 _setRoutingInitialized:v69];
        [(BTSmartRoutingWxDevice *)v18 setTipitableUpdated:0];
        [(BTSmartRoutingWxDevice *)v18 _setRoutingAction:v38];
        id v15 = v71;
        [(BTSmartRoutingWxDevice *)v18 _setOtherTipiDeviceInfo:v71 andName:v16 andVersion:v17];
        [(BTSmartRoutingDaemon *)self _lowestBatteryInfoForSFDevice:v72];
        -[BTSmartRoutingWxDevice setLowestBudBatteryInfo:](v18, "setLowestBudBatteryInfo:");
        if (v68) {
          uint64_t v55 = 1;
        }
        else {
          uint64_t v55 = 3;
        }
        [(BTSmartRoutingWxDevice *)v18 _setRoutingUI:v55];
        smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
        if (!smartRoutingWxDeviceMap)
        {
          id v57 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          int v58 = self->_smartRoutingWxDeviceMap;
          self->_smartRoutingWxDeviceMap = v57;

          smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
        }
        [(NSMutableDictionary *)smartRoutingWxDeviceMap setObject:v18 forKeyedSubscript:v22];
        self->_autoRoutingTicks = mach_absolute_time();
      }
      else
      {
        v27 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v22];
        id v15 = v71;
        [v27 _setOtherTipiDeviceInfo:v71 andName:v16 andVersion:v17];
      }

      if ([(BTSmartRoutingWxDevice *)v18 routingAction] == 2) {
        ++self->_autoRoutingSingle;
      }
      else {
        ++self->_autoRoutingTipi;
      }
    }
    else
    {
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v15 = v71;
    }
  }
  else
  {
    if (dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    unsigned int v22 = 0;
  }
}

- (void)_smartRoutingAddWxMapDeviceFromConnectedDevice:(id)a3
{
  id v4 = a3;
  if (!self->_smartRoutingWxDeviceMap)
  {
    id v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
    self->_smartRoutingWxDeviceMap = v5;
  }
  unsigned int v7 = [v4 btAddressData];
  id v8 = CUPrintNSDataAddress();

  if (!-[BTSmartRoutingDaemon _supportsSR:andProductID:](self, "_supportsSR:andProductID:", v8, [v4 productID]))
  {
    if (dword_1002610B8 > 30 || dword_1002610B8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_69;
    }
LABEL_11:
    LogPrintF();
    goto LABEL_69;
  }
  if (!v8)
  {
    if (dword_1002610B8 > 90 || dword_1002610B8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_69;
    }
    goto LABEL_11;
  }
  BOOL v9 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKey:v8];

  if (!v9)
  {
    unsigned __int8 v10 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice audioDestination];
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      unsigned int v33 = v8;
      v35 = v10;
      LogPrintF();
    }
    self->_smartRoutingDisconnectReason = 0;
    uint64_t v37 = 0;
    uint64_t v38 = &v37;
    uint64_t v39 = 0x2020000000;
    char v40 = 0;
    unsigned int v11 = objc_alloc_init(BTSmartRoutingWxDevice);
    if ([(NSString *)self->_budSwapAddress isEqualToString:v8])
    {
      *((unsigned char *)v38 + 24) = 1;
      if (dword_1002610B8 <= 50 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      -[NSMutableDictionary objectForKeyedSubscript:](self->_srBudswapDeviceMap, "objectForKeyedSubscript:", v8, v33, v35);
      unint64_t v12 = (BTSmartRoutingBudswapDevice *)objc_claimAutoreleasedReturnValue();
      if (!v12) {
        unint64_t v12 = objc_alloc_init(BTSmartRoutingBudswapDevice);
      }
      [(BTSmartRoutingBudswapDevice *)v12 setReconnectionState:1];
      if (self->_hfpBudswapDetected) {
        self->_hfpBudswapDetected = 0;
      }
      id v13 = [(BTSmartRoutingBudswapDevice *)v12 otherTipiDeviceBTAddress];

      if (v13)
      {
        unsigned int v14 = [(BTSmartRoutingBudswapDevice *)v12 otherTipiDeviceBTAddress];
        id v15 = [(BTSmartRoutingBudswapDevice *)v12 otherTipiDeviceBTName];
        id v16 = [(BTSmartRoutingBudswapDevice *)v12 otherTipiDeviceVersion];
        [(BTSmartRoutingDaemon *)self _updateOtherTipiDevicewithAudioCategory:v8 otherAddress:v14 otherName:v15 otherVersion:v16];
      }
      budSwapAddress = self->_budSwapAddress;
      self->_budSwapAddress = 0;

      budSwapTimer = self->_budSwapTimer;
      if (budSwapTimer)
      {
        uint64_t v19 = budSwapTimer;
        dispatch_source_cancel(v19);
        uint64_t v20 = self->_budSwapTimer;
        self->_budSwapTimer = 0;
      }
      [(NSMutableDictionary *)self->_srBudswapDeviceMap setObject:v12 forKeyedSubscript:v8];
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    if ([(NSMutableDictionary *)self->_smartRoutingWxDeviceMap count])
    {
      uint64_t v21 = self->_smartRoutingWxDeviceMap;
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_100027D70;
      v36[3] = &unk_100233350;
      v36[4] = &v37;
      [(NSMutableDictionary *)v21 enumerateKeysAndObjectsUsingBlock:v36];
    }
    BOOL v22 = [[self _bluetoothProductIDNoEarDetect:[v4 productID]]|| [v4 primaryPlacement] == 1|| [v4 secondaryPlacement] == 1];
    [(BTSmartRoutingWxDevice *)v11 setDeviceAddress:v8];
    [(BTSmartRoutingWxDevice *)v11 setDeviceVersion:0];
    [(BTSmartRoutingWxDevice *)v11 _setHijackBackoffTick:0];
    [(BTSmartRoutingWxDevice *)v11 _setRoutedState:1];
    [(BTSmartRoutingWxDevice *)v11 setConnected:1];
    BOOL v23 = [v4 name];
    [(BTSmartRoutingWxDevice *)v11 setDeviceName:v23];

    uint64_t v24 = [v4 identifier];
    [(BTSmartRoutingWxDevice *)v11 setConduitDeviceID:v24];

    -[BTSmartRoutingWxDevice setProductID:](v11, "setProductID:", [v4 productID]);
    BOOL v25 = [v4 identifier];
    [(BTSmartRoutingWxDevice *)v11 setIdentifier:v25];

    [(BTSmartRoutingWxDevice *)v11 setInEar:v22];
    -[BTSmartRoutingWxDevice setInEarDisabled:](v11, "setInEarDisabled:", [v4 primaryPlacement] == 7);
    [(BTSmartRoutingWxDevice *)v11 setIsTipiHealingV2Eligible:0];
    [(BTSmartRoutingWxDevice *)v11 _setOtherTipiAudioCategory:0];
    [(BTSmartRoutingDaemon *)self _lowestBatteryInfoForCBDevice:v4];
    -[BTSmartRoutingWxDevice setLowestBudBatteryInfo:](v11, "setLowestBudBatteryInfo:");
    [(BTSmartRoutingWxDevice *)v11 _setRoutingInitialized:[(NSString *)self->_budSwapAddress isEqualToString:v8]];
    [(BTSmartRoutingWxDevice *)v11 setTipitableUpdated:0];
    if (((unint64_t)[v4 deviceFlags] & 0x400000) != 0) {
      unsigned int v26 = 1;
    }
    else {
      unsigned int v26 = 3;
    }
    if (*((unsigned char *)v38 + 24)) {
      uint64_t v27 = v26;
    }
    else {
      uint64_t v27 = 2;
    }
    [(BTSmartRoutingWxDevice *)v11 _setRoutingAction:v27];
    if (v22) {
      uint64_t v28 = 1;
    }
    else {
      uint64_t v28 = 3;
    }
    [(BTSmartRoutingWxDevice *)v11 _setRoutingUI:v28];
    [(BTSmartRoutingWxDevice *)v11 _setOtherTipiDeviceInfo:0 andName:0 andVersion:0];
    [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap setObject:v11 forKeyedSubscript:v8];
    self->_autoRoutingTicks = mach_absolute_time();
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      unsigned int v29 = [(BTSmartRoutingWxDevice *)v11 routingAction];
      if (v29 > 5) {
        uint64_t v30 = "?";
      }
      else {
        uint64_t v30 = off_100234488[v29];
      }
      v34 = v30;
      LogPrintF();
    }
    if (self->_prefSmartRoutingEnabledPhase3
      && !self->_tipiElectionInProgress
      && [(BTSmartRoutingDaemon *)self _aacpConnectedCheck:v4])
    {
      [(BTSmartRoutingDaemon *)self _tipiHealingAttempt];
    }
    if (-[NSMutableArray containsObject:](self->_smartRoutingManualDisconnectionList, "containsObject:", v8, v34))
    {
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(NSMutableArray *)self->_smartRoutingManualDisconnectionList removeObject:v8];
    }
    unsigned int v31 = [(BTSmartRoutingWxDevice *)v11 routingAction];
    uint64_t v32 = 112;
    if (v31 == 2) {
      uint64_t v32 = 96;
    }
    ++*(_DWORD *)((char *)&self->super.isa + v32);

    _Block_object_dispose(&v37, 8);
  }
LABEL_69:
}

- (void)_smartRoutingShowBanner:(int)a3 withDevice:(id)a4 andDeviceAddress:(id)a5 andProductID:(unsigned int)a6 andCentralContentItemTxt:(id)a7 andTimeout:(double)a8 andDeviceType:(unsigned int)a9
{
  uint64_t v12 = *(void *)&a6;
  id v16 = (__CFString *)a4;
  id v17 = a5;
  id v18 = a7;
  uint64_t v19 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v17];
  unsigned int v20 = [(BTSmartRoutingDaemon *)self _inEarConnectedCheck:v17];
  if ([(BTSmartRoutingDaemon *)self _bluetoothProductIDNoEarDetect:v12])
  {
    unsigned int v20 = 1;
  }
  else if (![v19 primaryPlacement] {
         && ![v19 secondaryPlacement])
  }
  {
    unsigned int v20 = [(BTSmartRoutingDaemon *)self _inEarNearbyCheck:v17];
  }
  if ([(CUSystemMonitor *)self->_powerMonitor screenOn]
    && (!self->_systemUIProxCardPresent ? (unsigned int v21 = v20) : (unsigned int v21 = 0), v21 == 1 && !self->_effectiveScreenLocked))
  {
    if (a9)
    {
      BOOL v22 = @"Speaker";
      if (a9 == 20) {
        BOOL v22 = @"Headset";
      }
      BOOL v23 = v22;
    }
    else
    {
      if (v12 == 8228) {
        unsigned int v24 = 8212;
      }
      else {
        unsigned int v24 = v12;
      }
      if ((v24 & 0xFFFFFFFD) == 0x2019 || v24 == 8222 || v24 == 8224) {
        uint64_t v27 = 8217;
      }
      else {
        uint64_t v27 = v24;
      }
      BOOL v23 = [(BTSmartRoutingDaemon *)self _productColorAssetLookup:v27 andAddress:v17];
    }
    uint64_t v28 = v23;
    id v29 = objc_alloc_init((Class)BTBannerUISession);
    objc_storeStrong((id *)&self->_uiSmartRoutingBanner, v29);
    if (v16) {
      CFStringRef v30 = v16;
    }
    else {
      CFStringRef v30 = &stru_10023D730;
    }
    [v29 setCenterContentText:v30];
    [v29 setCenterContentItemsText:v18];
    [v29 setDispatchQueue:self->_dispatchQueue];
    [v29 setLeadingAccessoryImageName:v28];
    [v29 setTimeoutSeconds:a8];
    unsigned int v31 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v17];
    [v31 lowestBudBatteryInfo];
    double v33 = v32;

    if (v33 == 0.0)
    {
      v41 = v28;
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      v35 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v17];
      v34 = [v35 identifier];

      v36 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v34];
      [v36 lowestBudBatteryInfo];
      [v29 setBatteryLevelInfo:];

      uint64_t v28 = v41;
    }
    else
    {
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      v34 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v17];
      [v34 lowestBudBatteryInfo];
      [v29 setBatteryLevelInfo:];
    }

    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      if (a3 > 5) {
        uint64_t v37 = "?";
      }
      else {
        uint64_t v37 = off_100233EE0[a3];
      }
      [v29 batteryLevelInfo];
      uint64_t v40 = v38;
      uint64_t v39 = v37;
      LogPrintF();
    }
    if ((a3 - 3) <= 2) {
      [v29 setTrailingAccessoryText:*((void *)&off_100233EC8 + a3 - 3)];
    }
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2020000000;
    int v49 = a3;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100028398;
    v42[3] = &unk_1002334F8;
    v42[4] = v29;
    v42[5] = self;
    int v45 = a3;
    v44 = &v46;
    id v43 = v17;
    [v29 setActionHandler:v42];
    if (*((_DWORD *)v47 + 6) == 1) {
      [(BTSmartRoutingDaemon *)self _setConnectedBannerTick:mach_absolute_time()];
    }
    [v29 activate:v39, v40];

    _Block_object_dispose(&v46, 8);
  }
  else if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    [(CUSystemMonitor *)self->_powerMonitor screenOn];
    [(CUSystemMonitor *)self->_powerMonitor screenLocked];
    LogPrintF();
  }
}

- (void)_smartRoutingConnectionCompleted:(id)a3
{
  id v4 = a3;
  id v5 = [(SFDevice *)self->_eligibleHeadset bleDevice];
  id v6 = [v5 bluetoothAddress];

  if ([v6 length] == (id)6)
  {
    id v51 = [v6 bytes];
    unsigned int v7 = NSPrintF();
  }
  else
  {
    unsigned int v7 = 0;
  }
  id v8 = [(SFDevice *)self->_eligibleHeadset bleDevice];
  BOOL v9 = [v8 advertisementFields];
  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();

  unsigned int v11 = [(BTSmartRoutingDaemon *)self _isOnDemandConnectInProgress];
  if (dword_1002610B8 <= 30)
  {
    unsigned int v12 = v11;
    if (dword_1002610B8 != -1 || _LogCategory_Initialize())
    {
      id v13 = "yes";
      if (self->_forcedConnection) {
        unsigned int v14 = "yes";
      }
      else {
        unsigned int v14 = "no";
      }
      if (self->_tipiElectionInProgress) {
        id v15 = "yes";
      }
      else {
        id v15 = "no";
      }
      if (!v12) {
        id v13 = "no";
      }
      v53 = v15;
      CFStringRef v54 = v13;
      uint64_t v52 = v14;
      LogPrintF();
    }
  }
  connectDevice = self->_connectDevice;
  if (connectDevice)
  {
    self->_connectDevice = 0;
  }
  connectSession = self->_connectSession;
  if (connectSession)
  {
    [(CBConnection *)connectSession invalidate];
    id v18 = self->_connectSession;
    self->_connectSession = 0;
  }
  if (!self->_disconnectTicksMap)
  {
    uint64_t v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    disconnectTicksMap = self->_disconnectTicksMap;
    self->_disconnectTicksMap = v19;
  }
  if (v7) {
    [(NSMutableDictionary *)self->_disconnectTicksMap setObject:&off_100244820 forKeyedSubscript:v7];
  }
  self->_connectTicks = 0;
  self->_eligibleHeadsetTicks = 0;
  if (!v4)
  {
    if (!self->_prefSmartRoutingEnabledPhase3 || !self->_tipiElectionInProgress) {
      goto LABEL_74;
    }
    unsigned int v21 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v7];
    BOOL v22 = [v21 otherTipiDeviceVersion];
    [v22 doubleValue];
    double v24 = v23;

    if (v24 >= 1.2)
    {
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v29 = [(SFDevice *)self->_lePipeDevice idsIdentifier];
      smartRoutingPipe = self->_smartRoutingPipe;
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_1000292E0;
      v56[3] = &unk_100232A38;
      v56[4] = self;
      v56[5] = v7;
      [(BTSmartRoutingPipe *)smartRoutingPipe _pipeSendRouteRequestToSFDevice:v29 andWxHeadset:v7 newPipe:0 connectionResult:@"connectionResultSuccess" completion:v56];
    }
    else if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v7)
    {
      unsigned int v31 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKey:v7];

      if (v31)
      {
        double v32 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v7];
        [v32 setConnected:1];
      }
      double v33 = -[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v7, v52);
      if (v33)
      {
        v34 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v7];
        if ([v34 primaryPlacement] == 1)
        {
          BOOL v35 = 1;
        }
        else
        {
          v36 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v7];
          BOOL v35 = [v36 secondaryPlacement] == 1;
        }
      }
      else
      {
        BOOL v35 = 0;
      }

      uint64_t v37 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v7];
      if ([v37 routingAction] == 3)
      {
        uint64_t v38 = [(NSMutableDictionary *)self->_srBudswapDeviceMap objectForKeyedSubscript:v7];
        [v38 reconnectionState];
      }
    }
    else
    {
      BOOL v35 = 0;
    }
    uint64_t v39 = [(SFDevice *)self->_eligibleHeadset identifier];
    uint64_t v40 = [v39 UUIDString];

    if (!v35) {
      goto LABEL_68;
    }
    v41 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v7];
    if ([v41 routingAction] == 1)
    {
      id v42 = [(NSMutableDictionary *)self->_srBudswapDeviceMap objectForKeyedSubscript:v7];
      unsigned int v43 = [v42 reconnectionState];

      if (v43 == 1) {
        goto LABEL_68;
      }
      v44 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v40];
      unsigned __int8 v45 = [v44 preemptiveBannerShown];

      if (v45) {
        goto LABEL_68;
      }
      v41 = [(SFDevice *)self->_eligibleHeadset name];
      [(BTSmartRoutingDaemon *)self _smartRoutingShowBanner:1 withDevice:v41 andDeviceAddress:v7 andProductID:Int64Ranged andCentralContentItemTxt:@"Connected" andTimeout:0 andDeviceType:4.0];
    }

LABEL_68:
    smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_1000293C8;
    v55[3] = &unk_1002334D0;
    v55[4] = v7;
    v55[5] = self;
    [(NSMutableDictionary *)smartRoutingWxDeviceMap enumerateKeysAndObjectsUsingBlock:v55];

    goto LABEL_74;
  }
  if (self->_prefSmartRoutingNoBackOffTimers)
  {
    [(BTSmartRoutingDaemon *)self _smartRoutingConnectToEligibleHeadset:self->_eligibleHeadset];
    goto LABEL_78;
  }
  if (self->_prefSmartRoutingEnabledPhase3 && self->_tipiElectionInProgress)
  {
    BOOL v25 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v7];
    unsigned int v26 = [v25 otherTipiDeviceVersion];
    [v26 doubleValue];
    double v28 = v27;

    if (v28 >= 1.2)
    {
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      v47 = [(SFDevice *)self->_lePipeDevice idsIdentifier];
      uint64_t v48 = self->_smartRoutingPipe;
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_100029220;
      v57[3] = &unk_100232738;
      v57[4] = self;
      [(BTSmartRoutingPipe *)v48 _pipeSendRouteRequestToSFDevice:v47 andWxHeadset:v7 newPipe:0 connectionResult:@"connectionResultError" completion:v57];
    }
    else if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[BTSmartRoutingDaemon _postNotification:](self, "_postNotification:", "com.apple.BluetoothServices.PreemptivePortDisconnected", v52);
  }
LABEL_74:
  self->_tipiElectionInProgress = 0;
  eligibleHeadset = self->_eligibleHeadset;
  self->_eligibleHeadset = 0;

  [(BTSmartRoutingDaemon *)self _submitConnectionMetric:v7 andError:v4];
  if (v4)
  {
    self->_forcedConnection = 0;
    phase1ConnectConfig = self->_phase1ConnectConfig;
    self->_phase1ConnectConfig = 0;

    if (v7) {
      [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap setObject:0 forKeyedSubscript:v7];
    }
  }
  -[BTSmartRoutingDaemon _submitNearbyDeviceMetric:](self, "_submitNearbyDeviceMetric:", Int64Ranged, v52);
LABEL_78:
}

- (void)_smartRoutingConnectToEligibleHeadset:(id)a3
{
  id v5 = a3;
  id v6 = [v5 bleDevice];
  unsigned int v7 = [v6 bluetoothAddress];

  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = sub_10001E20C;
  id v42 = sub_10001E21C;
  id v8 = [v7 length];
  BOOL v9 = 0;
  if (v8 == (id)6)
  {
    id v28 = [v7 bytes];
    BOOL v9 = NSPrintF();
  }
  id v43 = v9;
  unsigned __int8 v10 = [v5 identifier:v28];
  unsigned int v11 = [v10 UUIDString];

  mach_absolute_time();
  unsigned int v12 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v39[5]];
  [v12 lastWxAdvTicks];
  uint64_t v13 = UpTicksToMilliseconds();

  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    id v30 = v5;
    uint64_t v31 = v13;
    uint64_t v29 = v39[5];
    LogPrintF();
  }
  objc_storeStrong((id *)&self->_connectDevice, a3);
  id v14 = objc_alloc_init((Class)CBDevice);
  [v14 setIdentifier:v39[5]];
  uint64_t v15 = mach_absolute_time();
  id v16 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v11];
  [v16 setLastConnectionTicks:v15];

  id v17 = objc_alloc_init((Class)CBConnection);
  objc_storeStrong((id *)&self->_connectSession, v17);
  [v17 setConnectionFlags:2];
  id v18 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice evalWxMap];

  if (!v18)
  {
    id v19 = objc_alloc_init((Class)NSMutableDictionary);
    [(BTSmartRoutingSourceDevice *)self->_sourceDevice setEvalWxMap:v19];
  }
  unsigned int v20 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice evalWxMap];
  unsigned int v21 = [v20 objectForKeyedSubscript:v39[5]];

  if (!v21) {
    unsigned int v21 = objc_alloc_init(SmartRoutingWxInfo);
  }
  BOOL v22 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v11];
  -[SmartRoutingWxInfo setLastConnectTicks:](v21, "setLastConnectTicks:", [v22 lastConnectionTicks]);

  double v23 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice evalWxMap];
  [v23 setObject:v21 forKeyedSubscript:v39[5]];

  double v24 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v39[5]];
  BOOL v25 = [v24 otherTipiDeviceBTAddress];

  if (v25) {
    [v17 setConnectionFlags:[v17 connectionFlags] | 8];
  }
  [v17 setServiceFlags:0xFFFFFFFFLL];
  [v17 setPeerDevice:v14];
  [v17 setDispatchQueue:self->_dispatchQueue];
  [v17 setConnectTimeoutSeconds:20.0];
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = sub_10001E20C;
  v36[4] = sub_10001E21C;
  id v37 = [v24 identifier];
  dispatch_source_t v26 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  objc_storeStrong((id *)&self->_connectDispatchTimer, v26);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100029AEC;
  handler[3] = &unk_100233588;
  handler[4] = v17;
  void handler[5] = self;
  v34 = &v38;
  BOOL v35 = v36;
  double v27 = v21;
  double v33 = v27;
  dispatch_source_set_event_handler(v26, handler);
  CUDispatchTimerSet();
  dispatch_activate(v26);
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_prefSpeakRouteConnection = 1;

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v38, 8);
}

- (void)_respondRoutingRequest:(id)a3 withResponseHandler:(id)a4 wxAddress:(id)a5
{
  id v16 = a3;
  id v8 = (void (**)(id, id))a4;
  id v9 = a5;
  if (!v8)
  {
    if (dword_1002610B8 > 90 || dword_1002610B8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_11;
    }
LABEL_19:
    LogPrintF();
    goto LABEL_11;
  }
  if (!v16)
  {
    if (dword_1002610B8 > 90 || dword_1002610B8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_11;
    }
    goto LABEL_19;
  }
  if (dword_1002610B8 <= 50 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    [v16 action];
    unsigned __int8 v10 = [v16 reason];
    [v16 clientID];
    uint64_t v15 = [v16 deviceAddress];
    LogPrintF();
  }
  tipiHealingHijackTimer = self->_tipiHealingHijackTimer;
  if (tipiHealingHijackTimer)
  {
    unsigned int v12 = tipiHealingHijackTimer;
    dispatch_source_cancel(v12);
    uint64_t v13 = self->_tipiHealingHijackTimer;
    self->_tipiHealingHijackTimer = 0;
  }
  v8[2](v8, v16);
  if (v9)
  {
    id v14 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v9];
    [v14 setAudioRoutingResponse:0];
    [v14 setAudioRoutingClientID:0];
  }
LABEL_11:
}

- (void)_hijackBlockingModeChangedFromClient:(id)a3 mode:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v20 = a3;
  id v8 = (void (**)(id, void))a5;
  if (dword_1002610B8 <= 50 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = [v20 deviceAddress];
    unsigned __int8 v10 = (void *)v9;
    unsigned int v11 = "no";
    if (v6) {
      unsigned int v11 = "yes";
    }
    id v18 = v11;
    id v19 = v20;
    uint64_t v17 = v9;
    LogPrintF();
  }
  unsigned int v12 = [v20 appBundleID:v17, v18, v19];

  if (v12)
  {
    sourceDevice = self->_sourceDevice;
    id v14 = [v20 appBundleID];
    [(BTSmartRoutingSourceDevice *)sourceDevice _updateHijackBlockingClientWithBundleID:v14 mode:v6];

    v8[2](v8, 0);
    [(BTSmartRoutingDaemon *)self _sendAudioCategoryToAllTipiDevices];
  }
  else
  {
    if (dword_1002610B8 <= 50 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v15 = objc_alloc((Class)NSError);
    id v16 = [v15 initWithDomain:off_1002610B0 code:1 userInfo:0];
    ((void (**)(id, id))v8)[2](v8, v16);
  }
}

- (void)_smartRoutingAudioRoutingRequest:(id)a3 withResponseHandler:(id)a4
{
  id v5 = a3;
  id v53 = a4;
  id v56 = objc_alloc_init((Class)BTAudioRoutingResponse);
  uint64_t v88 = 0;
  v89 = &v88;
  uint64_t v90 = 0x2020000000;
  char v91 = 0;
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x3032000000;
  v85 = sub_10001E20C;
  v86 = sub_10001E21C;
  id v87 = [v5 deviceAddress];
  v80[0] = 0;
  v80[1] = v80;
  v80[2] = 0x3032000000;
  v80[3] = sub_10001E20C;
  v80[4] = sub_10001E21C;
  id v81 = 0;
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x3032000000;
  v78[3] = sub_10001E20C;
  v78[4] = sub_10001E21C;
  id v79 = 0;
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x3032000000;
  v76[3] = sub_10001E20C;
  v76[4] = sub_10001E21C;
  id v77 = 0;
  uint64_t v70 = 0;
  id v71 = &v70;
  uint64_t v72 = 0x3032000000;
  long long v73 = sub_10001E20C;
  int v74 = sub_10001E21C;
  uint64_t v55 = v5;
  BOOL v6 = [v5 options];
  CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue();
  id v8 = @"Not set";
  if (TypedValue) {
    id v8 = (__CFString *)TypedValue;
  }
  BOOL v75 = v8;

  if (dword_1002610B8 <= 50 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = [v55 deviceAddress];
    id v10 = [v55 audioScore];
    id v11 = [v55 flags];
    unsigned int v12 = [v55 appBundleID];
    if (([v55 flags] & 2) != 0) {
      uint64_t v13 = "yes";
    }
    else {
      uint64_t v13 = "no";
    }
    unsigned __int8 v14 = [v55 flags];
    id v15 = [v55 clientID];
    if ((v14 & 0x20) != 0) {
      id v16 = "yes";
    }
    else {
      id v16 = "no";
    }
    id v50 = v15;
    uint64_t v51 = v71[5];
    uint64_t v48 = v13;
    int v49 = v16;
    id v46 = v11;
    v47 = v12;
    id v43 = v9;
    id v45 = v10;
    LogPrintF();
  }
  if ((objc_msgSend(v55, "flags", v43, v45, v46, v47, v48, v49, v50, v51) & 0x10) != 0)
  {
    [v56 setAction:5];
    [v56 setReason:@"Connecting"];
    [v56 setClientID:[v55 clientID]];
    smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_10002AC34;
    v69[3] = &unk_100233350;
    v69[4] = &v82;
    [(NSMutableDictionary *)smartRoutingWxDeviceMap enumerateKeysAndObjectsUsingBlock:v69];
    id v20 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v83[5]];
    unsigned int v21 = [v20 identifier];

    [v56 setDeviceAddress:v83[5]];
    BOOL v22 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v21];
    if ([v22 productID])
    {
      double v23 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v21];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"BTHeadphones76,%u", [v23 productID]);
      uint64_t v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v52 = &stru_10023D730;
    }

    v93[0] = v52;
    v92[0] = @"RouteModel";
    v92[1] = @"RouteName";
    uint64_t v29 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v21];
    uint64_t v30 = [v29 name];
    uint64_t v31 = (void *)v30;
    CFStringRef v32 = @"Airpods";
    if (v30) {
      CFStringRef v32 = (const __CFString *)v30;
    }
    v93[1] = v32;
    v92[2] = @"RouteUID";
    double v33 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v21];
    uint64_t v34 = [v33 address];
    BOOL v35 = (void *)v34;
    if (v34) {
      CFStringRef v36 = (const __CFString *)v34;
    }
    else {
      CFStringRef v36 = &stru_10023D730;
    }
    v93[2] = v36;
    v92[3] = @"BatteryLeft";
    id v37 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v21];
    [v37 batteryLeft];
    uint64_t v38 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v93[3] = v38;
    v92[4] = @"BatteryRight";
    uint64_t v39 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v21];
    [v39 batteryRight];
    uint64_t v40 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v93[4] = v40;
    v41 = +[NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:5];
    [v56 setWxInfo:v41];

    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      v44 = [v56 wxInfo];
      LogPrintF();
    }
    -[BTSmartRoutingDaemon _respondRoutingRequest:withResponseHandler:wxAddress:](self, "_respondRoutingRequest:withResponseHandler:wxAddress:", v56, v53, v83[5], v44);
    *((unsigned char *)v89 + 24) = 1;
  }
  else
  {
    if (v83[5]) {
      goto LABEL_50;
    }
    uint64_t v17 = self->_smartRoutingWxDeviceMap;
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_10002AC6C;
    v68[3] = &unk_1002335B0;
    v68[4] = self;
    v68[5] = &v82;
    v68[6] = v80;
    v68[7] = v78;
    v68[8] = v76;
    [(NSMutableDictionary *)v17 enumerateKeysAndObjectsUsingBlock:v68];
    if (v83[5])
    {
LABEL_50:
      if (_os_feature_enabled_impl()) {
        unsigned int v18 = ([v55 flags] >> 5) & 1;
      }
      else {
        LOBYTE(v18) = 0;
      }
      double v24 = self->_smartRoutingWxDeviceMap;
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_10002AE18;
      v57[3] = &unk_1002335D8;
      id v62 = &v82;
      id v25 = v55;
      id v58 = v25;
      id v59 = self;
      id v60 = v56;
      id v26 = v53;
      id v61 = v26;
      id v63 = &v88;
      uint64_t v64 = &v70;
      uint64_t v65 = v76;
      uint64_t v66 = v80;
      char v67 = v18;
      [(NSMutableDictionary *)v24 enumerateKeysAndObjectsUsingBlock:v57];
      if (!*((unsigned char *)v89 + 24))
      {
        budSwapAddress = self->_budSwapAddress;
        id v28 = [v25 deviceAddress];
        LODWORD(budSwapAddress) = [(NSString *)budSwapAddress isEqualToString:v28];

        if (budSwapAddress)
        {
          if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
          {
            v44 = self->_budSwapAddress;
            LogPrintF();
          }
          [v56 setAction:3, v44];
          [v56 setDeviceAddress:0];
          CFStringRef v42 = @"Budswap reconnect will happen soon";
        }
        else
        {
          if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          [v56 setAction:2];
          [v56 setDeviceAddress:0];
          CFStringRef v42 = @"Not tipi device";
        }
        [v56 setReason:v42];
        [v56 setClientID:[v25 clientID]];
        [(BTSmartRoutingDaemon *)self _respondRoutingRequest:v56 withResponseHandler:v26 wxAddress:v83[5]];
      }
    }
    else
    {
      [v56 setAction:3];
      [v56 setDeviceAddress:0];
      [v56 setReason:@"Tipi device, do not route, not inEar and/or inEar is not disabled."];
      [v56 setClientID:[v55 clientID]];
      [(BTSmartRoutingDaemon *)self _respondRoutingRequest:v56 withResponseHandler:v53 wxAddress:v83[5]];
    }
  }
  _Block_object_dispose(&v70, 8);

  _Block_object_dispose(v76, 8);
  _Block_object_dispose(v78, 8);

  _Block_object_dispose(v80, 8);
  _Block_object_dispose(&v82, 8);

  _Block_object_dispose(&v88, 8);
}

- (void)_submitNearbyDeviceMetric:(unsigned int)a3
{
  uint64_t v41 = 0;
  CFStringRef v42 = &v41;
  uint64_t v43 = 0x2020000000;
  int v44 = 0;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2020000000;
  int v40 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  int v36 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  int v32 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  int v28 = 0;
  uint64_t v21 = 0;
  BOOL v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  uint64_t v17 = 0;
  unsigned int v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  nearbyInfoDevices = self->_nearbyInfoDevices;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002C480;
  v16[3] = &unk_100233600;
  v16[4] = &v41;
  void v16[5] = &v37;
  v16[6] = &v33;
  v16[7] = &v29;
  v16[8] = &v25;
  v16[9] = &v21;
  v16[10] = &v17;
  [(NSMutableDictionary *)nearbyInfoDevices enumerateKeysAndObjectsUsingBlock:v16];
  v45[0] = @"iPhoneNearby";
  id v5 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v42 + 6)];
  v46[0] = v5;
  v45[1] = @"iPadNearby";
  BOOL v6 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v38 + 6)];
  v46[1] = v6;
  v45[2] = @"iPodNearby";
  unsigned int v7 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v34 + 6)];
  v46[2] = v7;
  v45[3] = @"macNearby";
  id v8 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v30 + 6)];
  v46[3] = v8;
  v45[4] = @"watchNearby";
  uint64_t v9 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v26 + 6)];
  v46[4] = v9;
  v45[5] = @"appleTvNearby";
  id v10 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v22 + 6)];
  v46[5] = v10;
  v45[6] = @"homePodNearby";
  id v11 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v18 + 6)];
  v46[6] = v11;
  v45[7] = @"totalNearby";
  unsigned int v12 = +[NSNumber numberWithUnsignedInteger:[(NSMutableDictionary *)self->_nearbyInfoDevices count]];
  v46[7] = v12;
  v45[8] = @"wxPD";
  uint64_t v13 = +[NSNumber numberWithUnsignedInt:a3];
  v46[8] = v13;
  unsigned __int8 v14 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:9];
  CUMetricsLogEx();

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
}

- (void)submitHijackMetric:(id)a3 withV1:(BOOL)a4
{
  if (a3)
  {
    BOOL v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:");
    if (a4)
    {
      CFStringRef v7 = @"V1";
    }
    else
    {
      [(SmartRoutingStats *)self->_stats setHijackContinuousTimeoutCount:0];
      [(SmartRoutingStats *)self->_stats setHijackRelaySent:0];
      [(SmartRoutingStats *)self->_stats setHijackRoundTripTime:0];
      CFStringRef v7 = @"V2";
    }
    uint64_t v8 = [(SmartRoutingStats *)self->_stats hijackAnswer];
    uint64_t v9 = (void *)v8;
    if (v8) {
      id v10 = (__CFString *)v8;
    }
    else {
      id v10 = @"NA";
    }
    id v11 = v10;

    unsigned int v12 = v11;
    int v36 = v11;
    if ([(__CFString *)v11 isEqualToString:@"Backoff"]) {
      CFStringRef v13 = @"All";
    }
    else {
      CFStringRef v13 = v7;
    }
    v39[0] = @"askForHijack";
    uint64_t v38 = +[NSNumber numberWithBool:[(SmartRoutingStats *)self->_stats hijackRelaySent]];
    v40[0] = v38;
    v39[1] = @"audioScore";
    uint64_t v37 = +[NSNumber numberWithInt:[(SmartRoutingStats *)self->_stats hijackScore]];
    v40[1] = v37;
    v39[2] = @"otherTipiDeviceScore";
    uint64_t v35 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v6 otherTipiAudioCategory]);
    v40[2] = v35;
    v39[3] = @"otherTipiDevicePlayingApp";
    uint64_t v14 = [v6 otherTipiDevicePlayingApp];
    id v15 = (void *)v14;
    if (v14) {
      CFStringRef v16 = (const __CFString *)v14;
    }
    else {
      CFStringRef v16 = @"NA";
    }
    v40[3] = v16;
    v40[4] = v12;
    v39[4] = @"hijackAnswer";
    v39[5] = @"hijackVersion";
    v40[5] = v13;
    v39[6] = @"hijackContinousCount";
    uint64_t v34 = +[NSNumber numberWithUnsignedLongLong:[(SmartRoutingStats *)self->_stats hijackContinuousTimeoutCount]];
    v40[6] = v34;
    v39[7] = @"hijackRoundTripTime";
    uint64_t v17 = +[NSNumber numberWithUnsignedLongLong:[(SmartRoutingStats *)self->_stats hijackRoundTripTime]];
    v40[7] = v17;
    v39[8] = @"playingApp";
    uint64_t v18 = [(SmartRoutingStats *)self->_stats hijackPlayingApp];
    uint64_t v19 = (void *)v18;
    if (v18) {
      CFStringRef v20 = (const __CFString *)v18;
    }
    else {
      CFStringRef v20 = &stru_10023D730;
    }
    v40[8] = v20;
    v39[9] = @"playingCategory";
    uint64_t v21 = [(SmartRoutingStats *)self->_stats hijackPlayingCategory];
    BOOL v22 = (void *)v21;
    if (v21) {
      CFStringRef v23 = (const __CFString *)v21;
    }
    else {
      CFStringRef v23 = &stru_10023D730;
    }
    v40[9] = v23;
    v39[10] = @"theOtherTipiDevice";
    uint64_t v24 = [v6 otherTipiDeviceBTName];
    uint64_t v25 = (void *)v24;
    if (v24) {
      CFStringRef v26 = (const __CFString *)v24;
    }
    else {
      CFStringRef v26 = &stru_10023D730;
    }
    v40[10] = v26;
    v39[11] = @"wxPD";
    uint64_t v27 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v6 productID]);
    v40[11] = v27;
    v39[12] = @"wxStreamState";
    uint64_t v28 = [(SmartRoutingStats *)self->_stats wxStreamState];
    int v32 = v6;
    uint64_t v29 = (void *)v28;
    if (v28) {
      CFStringRef v30 = (const __CFString *)v28;
    }
    else {
      CFStringRef v30 = &stru_10023D730;
    }
    v40[12] = v30;
    uint64_t v31 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 13, v32);
    CUMetricsLogEx();

    [(SmartRoutingStats *)self->_stats setHijackRoundTripTime:0];
  }
}

- (void)submitRouteActivityMetric:(id)a3 activity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v54 = 0;
    unsigned int v53 = 0;
    uint64_t v8 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v6];
    if ([v7 isEqualToString:@"Manual_Route"])
    {
      uint64_t v9 = [(SmartRoutingStats *)self->_stats manualRouteDestination];
      unsigned int v10 = [v9 isEqualToString:@"Non-BT"];

      if (v10)
      {
        uint64_t v11 = [(BTSmartRoutingDaemon *)self _findActiveWxDevice];

        uint64_t v12 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v11];

        uint64_t v8 = (void *)v12;
        id v6 = (id)v11;
      }
    }
    uint64_t v13 = [(BTSmartRoutingDaemon *)self _getWxFWVersion:v6];
    uint64_t v14 = (void *)v13;
    id v15 = @"Unknown";
    if (v8)
    {
      if (v13)
      {
        unsigned int v16 = [(BTSmartRoutingDaemon *)self _deviceSupportsHijackV2:v13 withDevice:v8];
        id v15 = @"V1";
        if (v16) {
          id v15 = @"V2";
        }
      }
    }
    uint64_t v17 = v15;
    id v45 = v14;
    id v46 = v6;
    if ([v7 isEqualToString:@"Hijack_Away"])
    {
      CFStringRef v51 = &stru_10023D730;
      CFStringRef v52 = &stru_10023D730;
      uint64_t v18 = &v52;
      uint64_t v19 = &v51;
      [(BTSmartRoutingDaemon *)self getHijackedAwayAudioInfo:&v54 appCount:(char *)&v54 + 4 playingApp:&v52 route:&v51 remote:&v53];
    }
    else if ([v7 hasPrefix:@"Hijack_"])
    {
      CFStringRef v49 = &stru_10023D730;
      CFStringRef v50 = &stru_10023D730;
      uint64_t v18 = &v50;
      uint64_t v19 = &v49;
      [(BTSmartRoutingDaemon *)self getHijackAudioInfo:&v54 appCount:(char *)&v54 + 4 playingApp:&v50 route:&v49 remote:&v53];
    }
    else
    {
      if (([v7 isEqualToString:@"Remote_Manual_Route"] & 1) == 0
        && ([v7 hasPrefix:@"Manual_Route"] & 1) == 0
        && ![v7 isEqualToString:@"Reverse"])
      {
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        uint64_t v38 = &stru_10023D730;
        uint64_t v35 = &stru_10023D730;
        goto LABEL_32;
      }
      CFStringRef v47 = &stru_10023D730;
      CFStringRef v48 = &stru_10023D730;
      uint64_t v18 = &v48;
      uint64_t v19 = &v47;
      [(BTSmartRoutingDaemon *)self getLocalAudioInfofromSnapshot:&v54 appCount:(char *)&v54 + 4 playingApp:&v48 route:&v47 remote:&v53];
    }
    CFStringRef v42 = (id)*v18;
    uint64_t v39 = (id)*v19;
    v55[0] = @"Activity";
    v55[1] = @"BundleID";
    v56[0] = v7;
    v56[1] = v42;
    v55[2] = @"DestinationRoute";
    uint64_t v20 = [(SmartRoutingStats *)self->_stats manualRouteDestination];
    uint64_t v21 = (void *)v20;
    if (v20) {
      CFStringRef v22 = (const __CFString *)v20;
    }
    else {
      CFStringRef v22 = @"NA";
    }
    v56[2] = v22;
    v56[3] = v17;
    v55[3] = @"HijackVersion";
    v55[4] = @"InTipi";
    uint64_t v41 = [v8 otherTipiDeviceBTAddress];
    CFStringRef v23 = @"YES";
    if (!v41) {
      CFStringRef v23 = @"NO";
    }
    v56[4] = v23;
    v55[5] = @"LocalScore";
    id v44 = v7;
    int v40 = +[NSNumber numberWithInt:v54];
    v56[5] = v40;
    void v55[6] = @"ManualRouteInputOutput";
    uint64_t v24 = [(SmartRoutingStats *)self->_stats manualRouteInputOutput];
    uint64_t v43 = v17;
    uint64_t v25 = (void *)v24;
    if (v24) {
      CFStringRef v26 = (const __CFString *)v24;
    }
    else {
      CFStringRef v26 = @"NA";
    }
    void v56[6] = v26;
    v55[7] = @"ManualRouteUISource";
    uint64_t v27 = [(SmartRoutingStats *)self->_stats manualRouteUISource];
    uint64_t v28 = (void *)v27;
    if (v27) {
      CFStringRef v29 = (const __CFString *)v27;
    }
    else {
      CFStringRef v29 = @"NA";
    }
    void v56[7] = v29;
    v55[8] = @"NumOfApps";
    CFStringRef v30 = +[NSNumber numberWithInt:HIDWORD(v54)];
    v56[8] = v30;
    v55[9] = @"OtherTipiDeviceModel";
    uint64_t v31 = [v8 otherTipiDeviceBTName];
    int v32 = (void *)v31;
    if (v31) {
      CFStringRef v33 = (const __CFString *)v31;
    }
    else {
      CFStringRef v33 = @"NA";
    }
    v56[9] = v33;
    v55[10] = @"RemoteScore";
    uint64_t v34 = +[NSNumber numberWithInt:v53];
    uint64_t v35 = v39;
    v56[10] = v34;
    v56[11] = v39;
    v55[11] = @"Route";
    v55[12] = @"ProductID";
    int v36 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v8 productID]);
    v56[12] = v36;
    uint64_t v37 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:13];
    CUMetricsLogEx();

    id v7 = v44;
    uint64_t v38 = v42;

    uint64_t v17 = v43;
    uint64_t v14 = v45;
    id v6 = v46;
LABEL_32:
  }
}

- (void)_smartRoutingChangeRoute:(id)a3
{
  id v4 = a3;
  if (![(__CFArray *)self->_mediaRemoteOutputDevices count]) {
    goto LABEL_13;
  }
  CFIndex v5 = 0;
  while (!CFArrayGetValueAtIndex(self->_mediaRemoteOutputDevices, v5))
  {
LABEL_6:
    if (++v5 >= (unint64_t)[(__CFArray *)self->_mediaRemoteOutputDevices count]) {
      goto LABEL_13;
    }
  }
  id v6 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
  if (![v6 containsString:v4])
  {

    goto LABEL_6;
  }
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_routeChangeInProgress = 1;
  MRAVOutputContextGetSharedAudioPresentationContext();
  id v7 = v4;
  MRAVOutputContextSetOutputDevice();

LABEL_13:
}

- (void)_smartRoutingRouteCompleted:(__CFError *)a3 withUUID:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    if (dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    if (dword_1002610B8 <= 40 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      id v9 = v6;
      LogPrintF();
    }
    if (self->_proactiveRoutingInProgress)
    {
      self->_proactiveRoutingInProgress = 0;
    }
    else if (self->_prefSmartRoutingEnabledPhase3 {
           && (([v6 containsString:@"-tacl"] & 1) != 0
    }
            || [v6 containsString:@"-tsco"]))
    {
      smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10002D240;
      v11[3] = &unk_1002334D0;
      id v12 = v6;
      uint64_t v13 = self;
      [(NSMutableDictionary *)smartRoutingWxDeviceMap enumerateKeysAndObjectsUsingBlock:v11];
    }
    else
    {
      uint64_t v8 = self->_smartRoutingWxDeviceMap;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10002D31C;
      v10[3] = &unk_100233650;
      v10[4] = self;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v8, "enumerateKeysAndObjectsUsingBlock:", v10, v9);
    }
  }
}

- (void)_smartRoutingLowerRateScan
{
  dispatch_time_t v3 = dispatch_time(0, 10000000000);
  smartRoutingLowerScanRateTimer = self->_smartRoutingLowerScanRateTimer;
  if (smartRoutingLowerScanRateTimer)
  {
    dispatch_source_set_timer(smartRoutingLowerScanRateTimer, v3, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  else
  {
    CFIndex v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    id v6 = self->_smartRoutingLowerScanRateTimer;
    self->_smartRoutingLowerScanRateTimer = v5;

    id v7 = self->_smartRoutingLowerScanRateTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10002D584;
    handler[3] = &unk_100232710;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_smartRoutingLowerScanRateTimer, v3, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_smartRoutingLowerScanRateTimer);
  }
}

- (void)_lowBatteryLoad
{
  if (!self->_lowBatteryLoaded)
  {
    v2 = self;
    CFArrayGetTypeID();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = (id)CFPrefs_CopyTypedValue();
    dispatch_time_t v3 = (char *)[obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    id v4 = &unk_100261000;
    if (v3)
    {
      CFIndex v5 = v3;
      int v6 = 0;
      uint64_t v7 = *(void *)v32;
      uint64_t v28 = v2;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(void *)v32 != v7) {
            objc_enumerationMutation(obj);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            CFStringGetTypeID();
            id v9 = CFDictionaryGetTypedValue();
            if (v9)
            {
              unsigned int v10 = objc_alloc_init(BTLowBatteryDevice);
              CFStringGetTypeID();
              [(BTLowBatteryDevice *)v10 setDeviceAddress:CFDictionaryGetTypedValue()];
              [(BTLowBatteryDevice *)v10 setIdentifier:v9];
              CFStringGetTypeID();
              [(BTLowBatteryDevice *)v10 setName:CFDictionaryGetTypedValue()];
              CFDictionaryGetDouble();
              -[BTLowBatteryDevice setLastBatteryLevel:](v10, "setLastBatteryLevel:");
              [(BTLowBatteryDevice *)v10 setLastBatteryType:(int)CFDictionaryGetInt64Ranged()];
              CFDictionaryGetDouble();
              -[BTLowBatteryDevice setLastSeenTime:](v10, "setLastSeenTime:");
              [(BTLowBatteryDevice *)v10 setProductID:CFDictionaryGetInt64Ranged()];
              CFDictionaryGetDouble();
              -[BTLowBatteryDevice setReportTime:](v10, "setReportTime:");
              lowBatteryDeviceMap = v2->_lowBatteryDeviceMap;
              if (!lowBatteryDeviceMap)
              {
                id v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
                uint64_t v13 = v2->_lowBatteryDeviceMap;
                v2->_lowBatteryDeviceMap = v12;

                lowBatteryDeviceMap = v2->_lowBatteryDeviceMap;
              }
              -[NSMutableDictionary setObject:forKeyedSubscript:](lowBatteryDeviceMap, "setObject:forKeyedSubscript:", v10, v9, v23, v24, *(void *)&v25, v26, v27);
              int v14 = v4[46];
              if (v14 <= 30 && (v14 != -1 || _LogCategory_Initialize()))
              {
                int v29 = v6;
                id v15 = [(BTLowBatteryDevice *)v10 deviceAddress];
                unsigned int v16 = [(BTLowBatteryDevice *)v10 name];
                [(BTLowBatteryDevice *)v10 lastBatteryLevel];
                double v18 = v17;
                uint64_t v19 = [(BTLowBatteryDevice *)v10 lastBatteryType];
                uint64_t v20 = "?";
                if ((unint64_t)(v19 - 1) <= 3) {
                  uint64_t v20 = off_100234230[(void)(v19 - 1)];
                }
                [(BTLowBatteryDevice *)v10 reportTime];
                uint64_t v27 = v21;
                CFStringRef v26 = v20;
                double v25 = v18 * 100.0;
                CFStringRef v23 = v15;
                uint64_t v24 = v16;
                LogPrintF();

                v2 = v28;
                int v6 = v29;
                id v4 = (_DWORD *)&unk_100261000;
              }
              ++v6;
            }
          }
        }
        CFIndex v5 = (char *)[obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v5);
    }

    v2->_lowBatteryLoaded = 1;
    int v22 = v4[46];
    if (v22 <= 30 && (v22 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)_lowBatterySave:(BOOL)a3
{
  p_lowBatterySaveTimer = (id *)&self->_lowBatterySaveTimer;
  lowBatterySaveTimer = self->_lowBatterySaveTimer;
  if (a3)
  {
    if (lowBatterySaveTimer)
    {
      int v6 = lowBatterySaveTimer;
      dispatch_source_cancel(v6);
      id v7 = *p_lowBatterySaveTimer;
      id *p_lowBatterySaveTimer = 0;
    }
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    int v14 = sub_10001E20C;
    id v15 = sub_10001E21C;
    id v16 = 0;
    lowBatteryDeviceMap = self->_lowBatteryDeviceMap;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10002DCAC;
    v10[3] = &unk_100233678;
    v10[4] = &v11;
    [(NSMutableDictionary *)lowBatteryDeviceMap enumerateKeysAndObjectsUsingBlock:v10];
    CFPrefs_SetValue();
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      [(id)v12[5] count];
      LogPrintF();
    }
    _Block_object_dispose(&v11, 8);
  }
  else if (!lowBatterySaveTimer)
  {
    dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong(p_lowBatterySaveTimer, v9);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10002DCA0;
    handler[3] = &unk_100232710;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);
    CUDispatchTimerSet();
    dispatch_activate(v9);
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)_lowBatteryUpdate
{
  if (self->_prefLowBatteryEnabled)
  {
    [(BTSmartRoutingDaemon *)self _lowBatteryLoad];
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x2020000000;
    int v51 = 0;
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x2020000000;
    int v49 = 0;
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x2020000000;
    int v47 = 0;
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    int v45 = 0;
    uint64_t v38 = 0;
    uint64_t v39 = &v38;
    uint64_t v40 = 0x3032000000;
    uint64_t v41 = sub_10001E20C;
    CFStringRef v42 = sub_10001E21C;
    id v43 = 0;
    lowBatteryWxDevices = self->_lowBatteryWxDevices;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10002E4C8;
    v37[3] = &unk_1002336A0;
    v37[4] = self;
    v37[5] = v44;
    v37[6] = v50;
    v37[7] = v48;
    v37[8] = v46;
    v37[9] = &v38;
    [(NSMutableDictionary *)lowBatteryWxDevices enumerateKeysAndObjectsUsingBlock:v37];
    double Current = CFAbsoluteTimeGetCurrent();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    CFIndex v5 = [(NSMutableDictionary *)self->_lowBatteryDeviceMap allKeys];
    id v6 = [v5 countByEnumeratingWithState:&v33 objects:v53 count:16];
    if (v6)
    {
      int v7 = 0;
      uint64_t v8 = *(void *)v34;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v34 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_lowBatteryDeviceMap, "objectForKeyedSubscript:", v10, v27, v28);
          [v11 lastSeenTime];
          if (vabdd_f64(Current, v12) >= self->_prefLowBatteryStaleSeconds)
          {
            [v11 reportTime];
            if (vabdd_f64(Current, v13) >= self->_prefLowBatteryStaleSeconds)
            {
              [(NSMutableDictionary *)self->_lowBatteryDeviceMap setObject:0 forKeyedSubscript:v10];
              ++v7;
              if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
              {
                int v14 = [v11 deviceAddress];
                [v11 name];
                v28 = uint64_t v27 = v14;
                LogPrintF();
              }
            }
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v33 objects:v53 count:16];
      }
      while (v6);

      if (v7 >= 1) {
        [(BTSmartRoutingDaemon *)self _lowBatterySave:0];
      }
    }
    else
    {
    }
    if ([(CUSystemMonitor *)self->_powerMonitor screenOn]
      && !self->_effectiveScreenLocked
      && !self->_uiLowBatteryBanner
      && !self->_uiNoteSessionLowBattery
      && !self->_systemUIProxCardPresent)
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v15 = (id)v39[5];
      id v16 = 0;
      id v17 = [v15 countByEnumeratingWithState:&v29 objects:v52 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v30;
        do
        {
          for (j = 0; j != v17; j = (char *)j + 1)
          {
            if (*(void *)v30 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void **)(*((void *)&v29 + 1) + 8 * (void)j);
            if ([v20 lastBatteryType])
            {
              [v16 lastBatteryLevel];
              double v22 = v21;
              if (v21 == 0.0 || ([v20 lastBatteryLevel], v22 >= v23))
              {
                id v24 = v20;

                id v16 = v24;
              }
            }
          }
          id v17 = [v15 countByEnumeratingWithState:&v29 objects:v52 count:16];
        }
        while (v17);
      }

      id v25 = v16;
      if (v25) {
        [(BTSmartRoutingDaemon *)self _lowBatteryShowAlertWithLowBatteryDevice:v25];
      }
    }
    if (self->_uiLowBatteryBanner && self->_systemUIProxCardPresent)
    {
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(BTBannerUISession *)self->_uiLowBatteryBanner invalidate];
      uiLowBatteryBanner = self->_uiLowBatteryBanner;
      self->_uiLowBatteryBanner = 0;
    }
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      [(NSMutableDictionary *)self->_lowBatteryWxDevices count];
      LogPrintF();
    }
    _Block_object_dispose(&v38, 8);

    _Block_object_dispose(v44, 8);
    _Block_object_dispose(v46, 8);
    _Block_object_dispose(v48, 8);
    _Block_object_dispose(v50, 8);
  }
}

- (void)_lowBatteryDeviceFound:(id)a3
{
  id v4 = a3;
  if (self->_prefLowBatteryEnabled)
  {
    id v10 = v4;
    CFIndex v5 = [v4 identifier];
    id v6 = [v5 UUIDString];

    if (v6)
    {
      lowBatteryWxDevices = self->_lowBatteryWxDevices;
      if (!lowBatteryWxDevices)
      {
        uint64_t v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        dispatch_source_t v9 = self->_lowBatteryWxDevices;
        self->_lowBatteryWxDevices = v8;

        lowBatteryWxDevices = self->_lowBatteryWxDevices;
      }
      [(NSMutableDictionary *)lowBatteryWxDevices setObject:v10 forKeyedSubscript:v6];
      [(CUCoalescer *)self->_evaluatorCoalescer trigger];
    }

    id v4 = v10;
  }
}

- (void)_lowBatteryDeviceLost:(id)a3
{
  id v4 = [a3 identifier];
  id v6 = [v4 UUIDString];

  CFIndex v5 = v6;
  if (v6)
  {
    [(NSMutableDictionary *)self->_lowBatteryWxDevices setObject:0 forKeyedSubscript:v6];
    [(CUCoalescer *)self->_evaluatorCoalescer trigger];
    CFIndex v5 = v6;
  }
}

- (BOOL)_lowBatteryTrackSFDevice:(id)a3 batteryLevel:(double)a4 batteryType:(int64_t)a5
{
  id v8 = a3;
  dispatch_source_t v9 = [v8 identifier];
  id v10 = [v9 UUIDString];

  if (v10)
  {
    int64_t v29 = a5;
    long long v30 = [v8 bleDevice];
    uint64_t v11 = [v30 advertisementFields];
    double v12 = CFDictionaryGetCFDataOfLength();
    double v13 = v12;
    if (v12)
    {
      id v24 = [v12 bytes];
      int v14 = NSPrintF();
    }
    else
    {
      int v14 = 0;
    }
    id v15 = [v8 name:v24];
    uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
    uint64_t v17 = [(NSMutableDictionary *)self->_lowBatteryDeviceMap objectForKeyedSubscript:v10];
    uint64_t v18 = (BTLowBatteryDevice *)v17;
    if (!v17)
    {
      uint64_t v18 = objc_alloc_init(BTLowBatteryDevice);
      [(BTLowBatteryDevice *)v18 setIdentifier:v10];
      lowBatteryDeviceMap = self->_lowBatteryDeviceMap;
      if (!lowBatteryDeviceMap)
      {
        uint64_t v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        double v21 = self->_lowBatteryDeviceMap;
        self->_lowBatteryDeviceMap = v20;

        lowBatteryDeviceMap = self->_lowBatteryDeviceMap;
      }
      [(NSMutableDictionary *)lowBatteryDeviceMap setObject:v18 forKeyedSubscript:v10];
    }
    [(BTLowBatteryDevice *)v18 setDeviceAddress:v14];
    [(BTLowBatteryDevice *)v18 setLastBatteryLevel:a4];
    [(BTLowBatteryDevice *)v18 setLastBatteryType:v29];
    [(BTLowBatteryDevice *)v18 setLastSeenTime:CFAbsoluteTimeGetCurrent()];
    [(BTLowBatteryDevice *)v18 setName:v15];
    [(BTLowBatteryDevice *)v18 setProductID:Int64Ranged];
    [(BTLowBatteryDevice *)v18 setReportTime:0.0];
    if (!v17 && dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v27 = v15;
      uint64_t v28 = v30;
      id v25 = v14;
      uint64_t v26 = Int64Ranged;
      LogPrintF();
    }
    -[BTSmartRoutingDaemon _lowBatterySave:](self, "_lowBatterySave:", 0, v25, v26, v27, v28);

    BOOL v22 = v17 == 0;
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (BOOL)_lowBatteryClearSFDevice:(id)a3 reason:(const char *)a4
{
  id v6 = a3;
  int v7 = [v6 identifier];
  id v8 = [v7 UUIDString];

  if (v8)
  {
    dispatch_source_t v9 = [(NSMutableDictionary *)self->_lowBatteryDeviceMap objectForKeyedSubscript:v8];
    id v10 = v9;
    BOOL v11 = v9 != 0;
    if (v9)
    {
      [v9 setLastBatteryLevel:0.0];
      [v10 setLastBatteryType:0];
      [v10 setLastSeenTime:CFAbsoluteTimeGetCurrent()];
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
      {
        double v12 = [v10 deviceAddress];
        double v13 = [v10 name];
        uint64_t v18 = [v6 bleDevice];
        LogPrintF();

        -[BTSmartRoutingDaemon _lowBatterySave:](self, "_lowBatterySave:", 0, v12, v13, v18, a4);
      }
      else
      {
        -[BTSmartRoutingDaemon _lowBatterySave:](self, "_lowBatterySave:", 0, v15, v16, v17, v19);
      }
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_lowBatteryReportGood:(id)a3
{
  id v11 = a3;
  CFDictionaryGetTypeID();
  dispatch_time_t v3 = (void *)CFPrefs_CopyTypedValue();
  if (v3)
  {
    id v4 = [v11 bleDevice];
    CFIndex v5 = [v4 identifier];
    id v6 = [v5 UUIDString];

    if (v6)
    {
      id v7 = [v3 objectForKeyedSubscript:v6];

      if (v7)
      {
        id v7 = [v3 mutableCopy];
        [v7 setObject:0 forKeyedSubscript:v6];
      }
    }
    else
    {
      id v7 = 0;
    }
    id v8 = [v4 counterpartIdentifier];
    dispatch_source_t v9 = [v8 UUIDString];

    if (v9)
    {
      id v10 = [v3 objectForKeyedSubscript:v9];

      if (v10)
      {
        if (!v7) {
          id v7 = [v3 mutableCopy];
        }
        [v7 setObject:0 forKeyedSubscript:v9];
      }
    }
    if (v7)
    {
      CFPrefs_SetValue();
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
}

- (void)_lowBatteryReset
{
  CFPrefs_RemoveValue();
  CFPrefs_RemoveValue();
  lowBatteryDeviceMap = self->_lowBatteryDeviceMap;
  self->_lowBatteryDeviceMap = 0;

  self->_lowBatteryLoaded = 0;

  [(BTSmartRoutingDaemon *)self _prefsChanged];
}

- (void)_lowBatteryShowAlertWithLowBatteryDevice:(id)a3
{
  id v4 = a3;
  [v4 lastBatteryLevel];
  double v6 = v5;
  id v7 = (char *)[v4 lastBatteryType];
  id v8 = [v4 name];
  id v9 = [v4 productID];
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    id v10 = [v4 deviceAddress];
    if ((unint64_t)(v7 - 1) > 3) {
      id v11 = "?";
    }
    else {
      id v11 = off_100234230[(void)(v7 - 1)];
    }
    double v23 = v11;
    double v22 = v6 * 100.0;
    id v20 = v9;
    double v21 = v8;
    uint64_t v19 = v10;
    LogPrintF();
  }
  id v12 = objc_alloc_init((Class)BTBannerUISession);
  objc_storeStrong((id *)&self->_uiLowBatteryBanner, v12);
  [v12 setDispatchQueue:self->_dispatchQueue];
  [v12 setLowBatteryLevel:v6];
  [v12 setTimeoutSeconds:4.0];
  double v13 = [v4 deviceAddress];
  if (v7 == (char *)1)
  {
    int v14 = [(BTSmartRoutingDaemon *)self _bluetoothProductIDToCaseAsset:v9 andAddress:v13];
    CFStringRef v15 = @"AirPods Case";
  }
  else
  {
    int v14 = [(BTSmartRoutingDaemon *)self _bluetoothProductIDToAsset:v9];
    CFStringRef v15 = v8;
  }
  [v12 setCenterContentText:v15, v19, v20, v21, v22, v23];
  [v12 setLeadingAccessoryImageName:v14];
  [v12 setCenterContentItemsIcon:@"LowBattery"];
  id v16 = objc_alloc_init((Class)NSNumberFormatter);
  [v16 setNumberStyle:3];
  [v16 setMaximumFractionDigits:0];
  uint64_t v17 = +[NSNumber numberWithDouble:v6];
  uint64_t v18 = [v16 stringFromNumber:v17];
  [v12 setCenterContentItemsText:v18];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10002F498;
  v24[3] = &unk_100233000;
  v24[4] = v12;
  v24[5] = self;
  [v12 setActionHandler:v24];
  [v12 activate];
  [v4 setReportTime:CFAbsoluteTimeGetCurrent()];
  [(BTSmartRoutingDaemon *)self _lowBatterySave:1];
}

- (void)_aaControllerEnsureStarted
{
  p_aaController = &self->_aaController;
  id v4 = self->_aaController;
  if (!v4)
  {
    double v5 = objc_alloc_init(AAController);
    [(AAController *)v5 setDispatchQueue:self->_dispatchQueue];
    objc_storeStrong((id *)p_aaController, v5);
    [(AAController *)v5 setInvalidationHandler:&stru_1002336C0];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10002F6D0;
    v6[3] = &unk_100232A38;
    id v4 = v5;
    id v7 = v4;
    id v8 = self;
    [(AAController *)v4 activateWithCompletion:v6];
  }
}

- (void)_aaControllerEnsureStopped
{
  aaController = self->_aaController;
  if (aaController)
  {
    [(AAController *)aaController invalidate];
    id v4 = self->_aaController;
    self->_aaController = 0;
  }
}

- (void)_activityMonitorEnsureStarted
{
  p_int activityLevelNotifyToken = &self->_activityLevelNotifyToken;
  if (self->_activityLevelNotifyToken == -1)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    dispatchQueue = self->_dispatchQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10002F950;
    v6[3] = &unk_1002329C0;
    void v6[4] = self;
    notify_register_dispatch("com.apple.sharing.activity-level-changed", p_activityLevelNotifyToken, (dispatch_queue_t)dispatchQueue, v6);
    int activityLevelNotifyToken = self->_activityLevelNotifyToken;
    uint64_t state64 = 0;
    notify_get_state(activityLevelNotifyToken, &state64);
    self->_unint64_t activityLevel = state64;
    [(BTSmartRoutingDaemon *)self _nearbyInfoActivityChanged];
    [(BTSmartRoutingDaemon *)self _nearbyInfoSetAudioRoutingScore];
  }
}

- (void)_activityMonitorEnsureStopped
{
  if (self->_activityLevelNotifyToken != -1)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_unint64_t activityLevel = 0;
    [(BTSmartRoutingDaemon *)self _nearbyInfoSetAudioRoutingScore];
    int activityLevelNotifyToken = self->_activityLevelNotifyToken;
    if (activityLevelNotifyToken != -1)
    {
      notify_cancel(activityLevelNotifyToken);
      self->_int activityLevelNotifyToken = -1;
    }
  }
  smartRoutingController = self->_smartRoutingController;
  if (smartRoutingController)
  {
    [(CBController *)smartRoutingController invalidate];
    double v5 = self->_smartRoutingController;
    self->_smartRoutingController = 0;
  }
}

- (void)_callMonitorEnsureStarted
{
  if (!self->_callMonitor)
  {
    dispatch_time_t v3 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    callMonitor = self->_callMonitor;
    self->_callMonitor = v3;
    double v5 = v3;

    [(CUSystemMonitor *)v5 setDispatchQueue:self->_dispatchQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10002FC18;
    v7[3] = &unk_100232A10;
    v7[4] = v5;
    v7[5] = self;
    double v6 = objc_retainBlock(v7);
    [(CUSystemMonitor *)v5 setCallChangedHandler:v6];
    [(CUSystemMonitor *)v5 activateWithCompletion:v6];
  }
}

- (void)_callMonitorEnsureStopped
{
  [(CUSystemMonitor *)self->_callMonitor invalidate];
  callMonitor = self->_callMonitor;
  self->_callMonitor = 0;
}

- (void)_connectedDeviceMonitorEnsureStarted
{
  if (!self->_connectedDiscovery)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    dispatch_time_t v3 = (CBDiscovery *)objc_alloc_init((Class)CBDiscovery);
    connectedDiscovery = self->_connectedDiscovery;
    self->_connectedDiscovery = v3;
    double v5 = v3;

    [(CBDiscovery *)v5 setDispatchQueue:self->_dispatchQueue];
    [(CBDiscovery *)v5 setLabel:@"SmartRouting"];
    [(CBDiscovery *)v5 setDiscoveryFlags:(unint64_t)[(CBDiscovery *)v5 discoveryFlags] | 0x80000200000];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100030030;
    v9[3] = &unk_1002336E8;
    v9[4] = self;
    [(CBDiscovery *)v5 setDeviceFoundHandler:v9];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10003003C;
    v8[3] = &unk_100232710;
    v8[4] = self;
    [(CBDiscovery *)v5 setBluetoothStateChangedHandler:v8];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100030168;
    v7[3] = &unk_1002336E8;
    v7[4] = self;
    [(CBDiscovery *)v5 setDeviceLostHandler:v7];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100030174;
    v6[3] = &unk_100232A38;
    void v6[4] = self;
    void v6[5] = v5;
    [(CBDiscovery *)v5 activateWithCompletion:v6];
  }
}

- (void)_connectedDeviceMonitorEnsureStopped
{
  if (self->_connectedDiscovery)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CBDiscovery *)self->_connectedDiscovery invalidate];
    connectedDiscovery = self->_connectedDiscovery;
    self->_connectedDiscovery = 0;
  }
}

- (void)_connectedDeviceFound:(id)a3
{
  id v180 = a3;
  id v4 = [v180 btAddressData];
  double v5 = CUPrintNSDataAddress();

  if (v5)
  {
    double v6 = [v180 identifier];
    id v7 = +[CBIDSManager sharedInstance];
    id v8 = [v180 identifier];
    [v7 connectionUpdatedForBluetoothIdentifier:v8 connected:1];

    if (([v180 connectedServices] & 0x11) == 0)
    {
LABEL_279:

      goto LABEL_280;
    }
    if (!self->_connectedDevices)
    {
      id v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      connectedDevices = self->_connectedDevices;
      self->_connectedDevices = v9;
    }
    if (!self->_connectedDevicesInEarCache)
    {
      id v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      connectedDevicesInEarCache = self->_connectedDevicesInEarCache;
      self->_connectedDevicesInEarCache = v11;
    }
    double v13 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v5];

    int v14 = &unk_100261000;
    if (v13)
    {
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
      {
        id v155 = v180;
        LogPrintF();
      }
    }
    else
    {
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
      {
        id v155 = v180;
        LogPrintF();
      }
      CFStringRef v15 = -[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v5, v155);
      if (v15)
      {
        if ((unint64_t)[(NSMutableDictionary *)self->_smartRoutingWxDeviceMap count] >= 2)
        {
          [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap enumerateKeysAndObjectsUsingBlock:&stru_100233728];
          [(BTSmartRoutingDaemon *)self _postNotification:"com.apple.BluetoothServices.AudioRoutingChanged"];
        }
        id v16 = [(BTSmartRoutingDaemon *)self _getWxFWVersion:v5];
        if ([@"5A187" compare:v16 options:64] == (id)1
          && ([v15 isRoutingActionInitialized] & 1) == 0)
        {
          uint64_t v17 = [v15 otherTipiDeviceBTAddress];

          if (!v17)
          {
            if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
            {
              id v155 = v16;
              LogPrintF();
            }
            if (self->_pairedCompanionDeviceSupportsSmartRouting) {
              uint64_t v18 = 1;
            }
            else {
              uint64_t v18 = 2;
            }
            [v15 _setRoutingAction:v18, v155];
            [v15 _setRoutingInitialized:1];
            [(BTSmartRoutingDaemon *)self _postNotification:"com.apple.BluetoothServices.AudioRoutingChanged"];
          }
        }
        [(BTSmartRoutingDaemon *)self _triggerTipiTableUpdate:v5];
      }
      [(BTSmartRoutingDaemon *)self _updateSRDiscoveredDeviceForCBDeviceChanged:v180 connectionStatus:2];
      [(BTSmartRoutingDaemon *)self _startAudioStateSnapshotTimer];
      uint64_t v19 = [(NSMutableDictionary *)self->_srDiscoveredDeviceMap objectForKeyedSubscript:v5];
      [v19 _setInUseBannerBackoffReason:0];
      if (GestaltGetDeviceClass() == 1) {
        [(BTSmartRoutingDaemon *)self _checkTriangleRecovery];
      }
    }
    if ((objc_msgSend(v180, "deviceFlags", v155) & 0x40000) != 0)
    {
      id v20 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v5];

      if (!v20)
      {
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [(BTSmartRoutingDaemon *)self _submitManualConnectionMetric:v5];
        double v21 = [(NSMutableDictionary *)self->_srDiscoveredDeviceMap objectForKeyedSubscript:v5];
        [v21 _setUserConnectedState:1];

        double v22 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v5];

        if (v22)
        {
          double v23 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v5];
          [v23 _setRoutingAction:1];
        }
      }
    }
    if (([v180 deviceFlags] & 0x40) == 0)
    {
      id v24 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v5];
      if ([v24 hijackBackoffTicks])
      {
        BOOL hijackBackOffInitiator = self->_hijackBackOffInitiator;

        if (hijackBackOffInitiator)
        {
          mach_absolute_time();
          uint64_t v26 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v5];
          [v26 hijackBackoffTicks];
          unint64_t v27 = UpTicksToSeconds();

          if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
          {
            unint64_t v156 = v27;
            LogPrintF();
          }
          if (v27 >= 5) {
            [(BTSmartRoutingDaemon *)self _hijackBackoffReset:v5 withReason:@"ownershipLost"];
          }
        }
      }
      else
      {
      }
    }
    v178 = [v180 name:v156];
    unsigned int v28 = -[BTSmartRoutingDaemon _supportsSR:andProductID:](self, "_supportsSR:andProductID:", v5, [v180 productID]);
    int64_t v29 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v5];
    if (v29)
    {
      BOOL v174 = 0;
    }
    else
    {
      long long v30 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v5];
      if (v30) {
        BOOL v174 = 0;
      }
      else {
        BOOL v174 = ((unint64_t)[v180 deviceFlags] & 0x40000) == 0;
      }

      int v14 = &unk_100261000;
    }

    long long v31 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v5];
    if (v31) {
      char v32 = 0;
    }
    else {
      char v32 = v28;
    }
    if (v32)
    {
      long long v33 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v5];

      if (!v33)
      {
        [(BTSmartRoutingDaemon *)self _smartRoutingAddWxMapDeviceFromConnectedDevice:v180];
        [(BTSmartRoutingDaemon *)self _triggerTipiTableUpdate:v5];
        [(BTSmartRoutingDaemon *)self _postNotification:"com.apple.BluetoothServices.AudioRoutingChanged"];
      }
    }
    else
    {
    }
    long long v34 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v5];
    if (!v34)
    {
      long long v35 = [(NSMutableDictionary *)self->_connectedDevicesSrModeCache objectForKeyedSubscript:v5];
      unsigned int v36 = [v35 mode];

      BOOL v110 = v36 == 1;
      int v14 = (_DWORD *)&unk_100261000;
      if (v110
        || ([(BTSmartRoutingDaemon *)self _lowestBatteryInfoForCBDevice:v180],
            v37 == 0.0))
      {
LABEL_71:
        v177 = v6;
        uint64_t v39 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v5];

        v179 = v39;
        if (v39)
        {
          uint64_t v40 = [(NSMutableDictionary *)self->_connectedDevicesInEarCache objectForKeyedSubscript:v5];
          LODWORD(v41) = [v40 BOOLValue];
        }
        else
        {
          uint64_t v41 = [(BTSmartRoutingDaemon *)self _inEarNearbyCheck:v5];
          CFStringRef v42 = +[NSNumber numberWithBool:v41];
          [(NSMutableDictionary *)self->_connectedDevicesInEarCache setObject:v42 forKeyedSubscript:v5];

          id v43 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v5];

          if (!v43)
          {
LABEL_76:
            connectDevice = self->_connectDevice;
            if (connectDevice && self->_connectSession)
            {
              int v45 = [(SFDevice *)connectDevice bleDevice];
              id v46 = [v45 bluetoothAddress];

              if ([v46 length] == (id)6)
              {
                id v157 = [v46 bytes];
                NSPrintF();
                id v47 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                id v47 = 0;
              }
              if (objc_msgSend(v5, "isEqual:", v47, v157)
                && ([v180 connectedServices] & 0x80000) != 0)
              {
                int v48 = v14[46];
                if (v48 <= 30 && (v48 != -1 || _LogCategory_Initialize())) {
                  LogPrintF();
                }
                if (self->_eligibleHeadset) {
                  self->_smartRoutingDisconnectReason = 0;
                }
                int v49 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v5];
                CFStringRef v50 = [v49 identifier];

                [(BTSmartRoutingDaemon *)self _smartRoutingConnectionCompleted:0];
                if (v50)
                {
                  int v51 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v50];
                  unsigned int v52 = [v51 preemptiveBannerShown];

                  if (v52)
                  {
                    unsigned int v53 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v5];
                    [v53 _setFirstBannerShown:0];
                  }
                }
              }
            }
            if (!v28)
            {
LABEL_142:
              v89 = -[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v5, v157);
              [(BTSmartRoutingDaemon *)self _smartRoutingModeCheck:v180];
              uint64_t v90 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v5];

              unsigned int v173 = v28;
              if (v90 || !v89)
              {
                BOOL v95 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v5];
                double v6 = v177;
                if (v95)
                {
                }
                else
                {
                  unsigned int v96 = [v180 productID] - 8194;
                  if (v96 < 0x25)
                  {
                    unint64_t v97 = (0x1C7BB7FF9BuLL >> v96) & 1;
LABEL_163:
                    [(NSMutableDictionary *)self->_connectedDevices setObject:v180 forKeyedSubscript:v5];
                    BOOL v101 = [(BTSmartRoutingDaemon *)self _inEarConnectedCheck:v5];
                    if (![v180 primaryPlacement]
                      && ![v180 secondaryPlacement])
                    {
                      BOOL v101 = [(BTSmartRoutingDaemon *)self _inEarNearbyCheck:v5];
                    }
                    v176 = v89;
                    if (v97) {
                      [(BTSmartRoutingDaemon *)self _sendTipiScoreUpdateToWx];
                    }
                    unsigned int v102 = [(BTSmartRoutingDaemon *)self _isOnDemandConnectInProgress];
                    unsigned int v103 = v102;
                    BOOL forcedConnection = self->_forcedConnection;
                    if (!self->_forcedConnection && !v102)
                    {
LABEL_185:
                      if (v179) {
                        BOOL v110 = !self->_prefSmartRoutingPreemptiveConnectedBanner;
                      }
                      else {
                        BOOL v110 = 1;
                      }
                      char v111 = v110 || v101;
                      id v112 = v176;
                      if ((v111 & 1) == 0)
                      {
                        [v176 _setFirstBannerShown:1];
                        BOOL v113 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v6];
                        unsigned int v114 = [v113 preemptiveBannerShown];

                        if (v114)
                        {
                          long long v115 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v6];
                          [v115 setPreemptiveBannerShown:0];
                        }
                      }
                      int v116 = v97;
                      if (v174 && !v101)
                      {
                        int v117 = v14[46];
                        id v118 = v180;
                        if (v117 > 30)
                        {
LABEL_222:
                          if (v41 != v101)
                          {
                            int v132 = v14[46];
                            if (v132 <= 30)
                            {
                              if (v132 != -1 || (v137 = _LogCategory_Initialize(), id v118 = v180, v137))
                              {
                                if (v41) {
                                  id v133 = "yes";
                                }
                                else {
                                  id v133 = "no";
                                }
                                if (v101) {
                                  v134 = "yes";
                                }
                                else {
                                  v134 = "no";
                                }
                                unsigned int v135 = [v118 audioStreamState:v158 v159 v160 v161 v162 v163 v164 v165 v166 v167];
                                if (v135 > 3) {
                                  v136 = "?";
                                }
                                else {
                                  v136 = off_100234420[v135];
                                }
                                if (self->_activityLevelMediaPlaying) {
                                  v138 = "yes";
                                }
                                else {
                                  v138 = "no";
                                }
                                v161 = v138;
                                v162 = "no";
                                v159 = (void *)v134;
                                v160 = v136;
                                v158 = v133;
                                LogPrintF();
                                id v112 = v176;
                                double v6 = v177;
                                int v116 = v97;
                              }
                            }
                            if (v179 && v101)
                            {
                              if ([v112 otherTipiDeviceIsWatch]
                                && [v112 otherTipiAudioCategory] == 100
                                && !self->_phoneOwnershipTriangleTimer
                                && ([v112 routed] & 1) == 0)
                              {
                                [(BTSmartRoutingDaemon *)self _startPhoneTriangleOwnershipTimer:10];
                              }
                              v139 = [v112 identifier:v158 v159 v160 v161 v162];
                              if ([v112 firstBannerShown])
                              {
                                v140 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v139];
                                uint64_t v141 = [v140 preemptiveBannerShown] ^ 1;
                              }
                              else
                              {
                                uint64_t v141 = 0;
                              }
                              [v112 _setFirstBannerShown:v141];
                              [(BTSmartRoutingDaemon *)self _postNotification:"com.apple.BluetoothServices.AudioRoutingChanged"];

                              int v14 = &unk_100261000;
                            }
                          }
                          v142 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v101, v158);
                          [(NSMutableDictionary *)self->_connectedDevicesInEarCache setObject:v142 forKeyedSubscript:v5];

                          [v112 setInEar:v101];
                          if (((v116 ^ 1 | v173) & 1) == 0)
                          {
                            int v143 = v14[46];
                            if (v143 <= 30 && (v143 != -1 || _LogCategory_Initialize())) {
                              LogPrintF();
                            }
                            v144 = [v180 name];
                            -[BTSmartRoutingDaemon _smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:](self, "_smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:", 1, v144, v5, [v180 productID], @"Connected", 0, 4.0);
                          }
                          if (!self->_uiSmartRoutingBanner
                            && [v112 firstBannerShown] & v101
                            && !self->_tipiElectionInProgress)
                          {
                            v145 = [v112 identifier];
                            v146 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v145];
                            unsigned __int8 v147 = [v146 preemptiveBannerShown];

                            if ((v147 & 1) == 0)
                            {
                              int v148 = v14[46];
                              if (v148 <= 30 && (v148 != -1 || _LogCategory_Initialize())) {
                                LogPrintF();
                              }
                              [v112 _setFirstBannerShown:0];
                              v149 = [v180 name];
                              -[BTSmartRoutingDaemon _smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:](self, "_smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:", 1, v149, v5, [v180 productID], @"Connected", 0, 4.0);
                            }
                          }
                          if (self->_prefSmartRoutingEnabledPhase3) {
                            [(BTSmartRoutingDaemon *)self _mediaRouteDiscoveryStarted];
                          }
                          uint64_t v150 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v5];
                          if (v150)
                          {
                            v151 = (void *)v150;
                            v152 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v5];
                            v153 = [v152 otherTipiDeviceBTAddress];
                            if (v153
                              || self->_tipiElectionInProgress
                              || ![(BTSmartRoutingDaemon *)self _aacpConnectedCheck:v180])
                            {
                            }
                            else
                            {
                              BOOL v154 = self->_forcedConnection;

                              if (!v154)
                              {
                                if (dword_1002610B8 <= 30
                                  && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
                                {
                                  LogPrintF();
                                }
                                [(BTSmartRoutingDaemon *)self _tipiHealingAttempt];
                              }
                            }
                          }
                          [(CUCoalescer *)self->_evaluatorCoalescer trigger];

                          goto LABEL_279;
                        }
                        if (v117 != -1 || _LogCategory_Initialize()) {
                          LogPrintF();
                        }
                      }
                      int v119 = v14[46];
                      id v118 = v180;
                      if (v119 <= 30)
                      {
                        if (v119 != -1 || (v125 = _LogCategory_Initialize(), id v118 = v180, v125))
                        {
                          if (v41) {
                            v120 = "yes";
                          }
                          else {
                            v120 = "no";
                          }
                          if (v101) {
                            double v121 = "yes";
                          }
                          else {
                            double v121 = "no";
                          }
                          v170 = v121;
                          v171 = v120;
                          if (v179) {
                            id v122 = "yes";
                          }
                          else {
                            id v122 = "no";
                          }
                          v169 = v122;
                          unsigned int v123 = [v176 routingAction];
                          if (v123 > 5) {
                            id v124 = "?";
                          }
                          else {
                            id v124 = off_100234488[v123];
                          }
                          v168 = v124;
                          if ([v176 routed]) {
                            CFStringRef v126 = "yes";
                          }
                          else {
                            CFStringRef v126 = "no";
                          }
                          v127 = [v176 otherTipiDeviceBTAddress];
                          uint64_t v128 = [v176 otherTipiDeviceVersion];
                          uint64_t v129 = [v176 otherTipiDeviceBTName];
                          uint64_t v130 = (void *)v129;
                          if (v174) {
                            v131 = "yes";
                          }
                          else {
                            v131 = "no";
                          }
                          uint64_t v166 = v129;
                          v167 = v131;
                          v164 = v127;
                          v165 = v128;
                          v162 = v168;
                          v163 = v126;
                          v160 = v170;
                          v161 = v169;
                          v158 = (const char *)v5;
                          v159 = (void *)v171;
                          LogPrintF();

                          id v112 = v176;
                          id v118 = v180;
                          double v6 = v177;
                          int v14 = &unk_100261000;
                          int v116 = v97;
                        }
                      }
                      goto LABEL_222;
                    }
                    int v105 = v14[46];
                    if (v105 <= 30)
                    {
                      if (v105 == -1)
                      {
                        if (!_LogCategory_Initialize()) {
                          goto LABEL_179;
                        }
                        BOOL forcedConnection = self->_forcedConnection;
                      }
                      double v106 = "yes";
                      if (forcedConnection) {
                        double v107 = "yes";
                      }
                      else {
                        double v107 = "no";
                      }
                      if (!v103) {
                        double v106 = "no";
                      }
                      v158 = v107;
                      v159 = (void *)v106;
                      LogPrintF();
                    }
LABEL_179:
                    -[BTSmartRoutingDaemon _disconnectOtherTipiDevice:](self, "_disconnectOtherTipiDevice:", v5, v158, v159);
                    if (self->_forcedConnection)
                    {
                      uint64_t v108 = 4;
                    }
                    else
                    {
                      if ([(SmartRoutingConnectConfig *)self->_phase1ConnectConfig type] != 2)
                      {
LABEL_184:
                        self->_BOOL forcedConnection = 0;
                        phase1ConnectConfig = self->_phase1ConnectConfig;
                        self->_phase1ConnectConfig = 0;

                        goto LABEL_185;
                      }
                      [(BTSmartRoutingDaemon *)self _removeTiPiState:v5];
                      [(BTSmartRoutingDaemon *)self _startRouteCheckTimer:v5 andType:9];
                      uint64_t v108 = 10;
                    }
                    [(BTSmartRoutingDaemon *)self _startRouteCheckTimer:v5 andType:v108];
                    goto LABEL_184;
                  }
                }
              }
              else
              {
                double v6 = v177;
                if ([v89 routingAction])
                {
                  int v91 = v14[46];
                  if (v91 <= 30 && (v91 != -1 || _LogCategory_Initialize()))
                  {
                    BOOL v92 = [(NSMutableDictionary *)self->_srBudswapDeviceMap objectForKeyedSubscript:v5];
                    unsigned int v93 = [v92 reconnectionState];
                    v94 = "?";
                    if (v93 == 1) {
                      v94 = "Connected";
                    }
                    if (!v93) {
                      v94 = "Not connected";
                    }
                    v158 = v94;
                    LogPrintF();
                  }
                  BOOL v98 = -[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v177, v158);
                  if ([v98 preemptiveBannerShown])
                  {
                  }
                  else
                  {
                    v99 = [(NSMutableDictionary *)self->_srBudswapDeviceMap objectForKeyedSubscript:v5];
                    unsigned int v100 = [v99 reconnectionState];

                    if (v100 != 1) {
                      [v89 _setFirstBannerShown:1];
                    }
                  }
                }
                [(BTSmartRoutingDaemon *)self _sendTipiScoreUpdateToWx];
              }
              LODWORD(v97) = 0;
              goto LABEL_163;
            }
            uint64_t v54 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v5];
            uint64_t v55 = [v54 deviceName];
            unsigned __int8 v56 = [v55 isEqualToString:v178];

            if ((v56 & 1) == 0)
            {
              int v57 = v14[46];
              if (v57 <= 30 && (v57 != -1 || _LogCategory_Initialize()))
              {
                id v58 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v5];
                id v59 = [v58 deviceName];
                [v180 name];
                v159 = id v157 = v59;
                LogPrintF();
              }
              id v60 = [v180 name:v157, v159];
              id v61 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v5];
              [v61 setDeviceName:v60];
            }
            id v62 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v5];
            id v63 = [v62 deviceVersion];

            if (!v63 && (objc_opt_respondsToSelector() & 1) != 0)
            {
              int v64 = v14[46];
              if (v64 <= 30 && (v64 != -1 || _LogCategory_Initialize()))
              {
                id v157 = [v180 firmwareVersion];
                LogPrintF();
              }
              uint64_t v65 = [v180 firmwareVersion:v157];
              uint64_t v66 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v5];
              [v66 setDeviceVersion:v65];
            }
            int v172 = v41;
            uint64_t v41 = (uint64_t)v14;
            unsigned int v67 = v28;
            unint64_t v68 = (unint64_t)[v180 deviceFlags];
            BOOL v69 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v5];
            if (([v69 manualRouteChangeInProgress] & 1) != 0 || (v68 & 0x400000) == 0)
            {

              unsigned int v71 = 0;
              unsigned int v72 = 0;
              unsigned int v73 = 0;
              if ((v68 & 0x400000) == 0) {
                goto LABEL_113;
              }
            }
            else
            {
              uint64_t v70 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v5];
              unsigned int v71 = [v70 manuallyRouted] ^ 1;
            }
            unsigned int v73 = [(BTSmartRoutingDaemon *)self _isInEarToOutOfEar:v180];
            unsigned int v72 = v71;
LABEL_113:
            int v74 = *(_DWORD *)(v41 + 184);
            unsigned int v28 = v67;
            if (v74 <= 30 && (v74 != -1 || _LogCategory_Initialize()))
            {
              BOOL v75 = "no";
              unsigned int v175 = v73;
              if ((v68 & 0x400000) != 0) {
                v76 = "yes";
              }
              else {
                v76 = "no";
              }
              if (v72) {
                id v77 = "yes";
              }
              else {
                id v77 = "no";
              }
              BOOL v78 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v5];
              if ([v78 manualRouteChangeInProgress]) {
                BOOL v75 = "yes";
              }
              v161 = v75;
              v162 = (const char *)[v180 deviceFlags];
              unsigned int v28 = v67;
              v159 = (void *)v76;
              v160 = v77;
              unsigned int v73 = v175;
              uint64_t v41 = 0x100261000;
              id v157 = v5;
              LogPrintF();
            }
            int v14 = (_DWORD *)v41;
            LODWORD(v41) = v172;
            if (v72)
            {
              [(BTSmartRoutingDaemon *)self _updateRoutingActionForManuallyRoute];
              [(BTSmartRoutingDaemon *)self _startManualRouteChangeDetectionTimer:v5];
              if (self->_prefSmartRoutingBlockHijackWindowinSeconds)
              {
                id v79 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v5];
                id v80 = [v79 hijackBackoffTicks];

                if (v80)
                {
                  int v81 = v14[46];
                  if (v81 <= 30 && (v81 != -1 || _LogCategory_Initialize())) {
                    LogPrintF();
                  }
                  [(BTSmartRoutingDaemon *)self _hijackBackoffReset:v5, @"manualRoute", v157, v159, v160, v161, v162 withReason];
                  uint64_t v82 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v5];
                  v83 = [v82 otherTipiDeviceBTAddress];
                  [(BTSmartRoutingDaemon *)self _relayConduitMessageSend:1 withOptions:&off_100244408 andWxAddress:v5 andOtherAddress:v83];
                }
              }
            }
            if (v73)
            {
              int v84 = v14[46];
              if (v84 <= 30 && (v84 != -1 || _LogCategory_Initialize())) {
                LogPrintF();
              }
              -[BTSmartRoutingDaemon _setManualRouteFlag:withManualRoute:](self, "_setManualRouteFlag:withManualRoute:", v5, 0, v157);
            }
            else
            {
              v85 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v5];
              [v85 _setManualRoute:(v68 >> 22) & 1];

              if ((v68 & 0x400000) == 0)
              {
                v86 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v5];
                unsigned int v87 = [v86 manualRouteChangeInProgress];

                if (v87)
                {
                  uint64_t v88 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v5];
                  [v88 _setManualRouteChangeInProgress:0];
                }
              }
            }
            goto LABEL_142;
          }
          uint64_t v40 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v5];
          [v40 setInEar:v41];
        }

        goto LABEL_76;
      }
      double v38 = v37;
      long long v34 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v6];
      [v34 setLowestBudBatteryInfo:v38];
    }

    goto LABEL_71;
  }
LABEL_280:
}

- (void)_connectedDeviceLost:(id)a3
{
  id v31 = a3;
  id v4 = [v31 btAddressData];
  double v5 = CUPrintNSDataAddress();

  if (v5)
  {
    double v6 = +[CBIDSManager sharedInstance];
    id v7 = [v31 identifier];
    [v6 connectionUpdatedForBluetoothIdentifier:v7 connected:0];

    id v8 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v5];

    if (v8)
    {
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
      {
        unint64_t smartRoutingDisconnectReason = self->_smartRoutingDisconnectReason;
        id v30 = v31;
        LogPrintF();
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_connectedDevices, "setObject:forKeyedSubscript:", 0, v5, smartRoutingDisconnectReason, v30);
      [(BTSmartRoutingDaemon *)self _hijackBackoffReset:v5 withReason:@"wxDisconnected"];
      [(NSMutableDictionary *)self->_smartRoutingWxStatsMap removeObjectForKey:v5];
      id v9 = [(BTSmartRoutingDaemon *)self _getWxFWVersion:v5];
      id v10 = [v31 identifier];
      if (v31)
      {
        id v11 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v10];
        [v11 setPreemptiveBannerShown:0];

        id v12 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v10];
        [v12 setFirstPreemptiveBannerShown:0];

        [(BTSmartRoutingDaemon *)self _submitMetric:v31];
        if ([@"6A221" compare:v9 options:64] != (id)-1)
        {
          if (!self->_disconnectTicksMap)
          {
            double v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            disconnectTicksMap = self->_disconnectTicksMap;
            self->_disconnectTicksMap = v13;
          }
          CFStringRef v15 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
          [(NSMutableDictionary *)self->_disconnectTicksMap setObject:v15 forKeyedSubscript:v5];
        }
        id v16 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKey:v5];
        uiSmartRoutingBanner = self->_uiSmartRoutingBanner;
        if (uiSmartRoutingBanner)
        {
          [(BTBannerUISession *)uiSmartRoutingBanner invalidate];
          uint64_t v18 = self->_uiSmartRoutingBanner;
          self->_uiSmartRoutingBanner = 0;
        }
        uint64_t v19 = [v16 audioRoutingResponse];

        if (v19)
        {
          id v20 = objc_alloc_init((Class)BTAudioRoutingResponse);
          [v20 setAction:3];
          [v20 setReason:@"Wx disconnecting"];
          [v20 setClientID:[v16 audioRoutingClientID]];
          double v21 = [v16 audioRoutingResponse];
          [(BTSmartRoutingDaemon *)self _respondRoutingRequest:v20 withResponseHandler:v21 wxAddress:v5];
        }
        [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap removeObjectForKey:v5];
        if (self->_tipiElectionInProgress) {
          self->_tipiElectionInProgress = 0;
        }
        tipiHealingTimer = self->_tipiHealingTimer;
        if (tipiHealingTimer)
        {
          double v23 = tipiHealingTimer;
          dispatch_source_cancel(v23);
          id v24 = self->_tipiHealingTimer;
          self->_tipiHealingTimer = 0;
        }
        hijackBackOffTimer = self->_hijackBackOffTimer;
        if (hijackBackOffTimer)
        {
          uint64_t v26 = hijackBackOffTimer;
          dispatch_source_cancel(v26);
          unint64_t v27 = self->_hijackBackOffTimer;
          self->_hijackBackOffTimer = 0;
        }
        [(BTSmartRoutingSourceDevice *)self->_sourceDevice _setShouldStayOnVirtual:0];
      }
      if (![(NSMutableDictionary *)self->_connectedDevices count] && !self->_tipiElectionInProgress)
      {
        [(BTSmartRoutingDaemon *)self _mediaRouteDiscoveryStopped];
        smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
        self->_smartRoutingWxDeviceMap = 0;
      }
      [(NSMutableDictionary *)self->_connectedDevicesSrModeCache setObject:0 forKeyedSubscript:v5];
      [(BTSmartRoutingDaemon *)self _updateSRDiscoveredDeviceForCBDeviceChanged:v31 connectionStatus:0];
      [(CUCoalescer *)self->_evaluatorCoalescer trigger];
    }
  }
}

- (void)_mediaRouteDiscoveryStarted
{
  if (!self->_discoverySession && !self->_discoverySessionInitializing)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_discoverySessionInitializing = 1;
    dispatchQueueAVSys = self->_dispatchQueueAVSys;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100031F8C;
    block[3] = &unk_100232710;
    block[4] = self;
    dispatch_async((dispatch_queue_t)dispatchQueueAVSys, block);
  }
}

- (void)_mediaRouteDiscoveryStopped
{
  discoverySessionToken = self->_discoverySessionToken;
  self->_discoverySessionToken = 0;
  discoverySession = self->_discoverySession;
  self->_discoverySession = 0;
  if (discoverySession)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    dispatchQueueAVSys = self->_dispatchQueueAVSys;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10003227C;
    v7[3] = &unk_1002337C0;
    v7[4] = discoverySession;
    void v7[5] = discoverySessionToken;
    dispatch_async((dispatch_queue_t)dispatchQueueAVSys, v7);
  }
  mediaRemoteOutputDevices = self->_mediaRemoteOutputDevices;
  if (mediaRemoteOutputDevices) {
    CFRelease(mediaRemoteOutputDevices);
  }
  self->_mediaRemoteOutputDevices = 0;
}

- (void)_mediaRouteMonitorEnsureStarted
{
  if (!self->_mediaRouteMonitorObservingActiveAudioRoute)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (self->_prefSmartRoutingEnabledPhase3)
    {
      self->_mediaRouteMonitorObservingActiveAudioRoute = 1;
      dispatch_time_t v3 = +[AVSystemController sharedAVSystemController];
      id v4 = +[NSNotificationCenter defaultCenter];
      double v5 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", AVSystemController_SomeSessionIsPlayingDidChangeNotification, AVSystemController_NowPlayingAppIsPlayingDidChangeNotification, AVSystemController_CallIsActiveDidChangeNotification, AVSystemController_HighestArbitrationPriorityForTipiDidChangeNotification, 0);
      [v3 setAttribute:v5 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];
      [v4 removeObserver:self name:AVSystemController_SomeSessionIsPlayingDidChangeNotification object:v3];
      [v4 removeObserver:self name:AVSystemController_ServerConnectionDiedNotification object:v3];
      [v4 removeObserver:self name:AVSystemController_NowPlayingAppIsPlayingDidChangeNotification object:v3];
      [v4 removeObserver:self name:AVSystemController_CallIsActiveDidChangeNotification object:v3];
      [v4 removeObserver:self name:AVSystemController_HighestArbitrationPriorityForTipiDidChangeNotification object:v3];
      [v4 removeObserver:self name:@"CdSignalAudioInterruptedChanged" object:0];
      [v4 addObserver:self selector:"_mediaRouteMonitorActivityLevelUpdate:" name:AVSystemController_SomeSessionIsPlayingDidChangeNotification object:v3];
      [v4 addObserver:self selector:"_handleMediaServerConnectionDied:" name:AVSystemController_ServerConnectionDiedNotification object:v3];
      [v4 addObserver:self selector:"_handleMediaPlayStateChange:" name:AVSystemController_NowPlayingAppIsPlayingDidChangeNotification object:v3];
      [v4 addObserver:self selector:"_handleCallStateChange:" name:AVSystemController_CallIsActiveDidChangeNotification object:v3];
      [v4 addObserver:self selector:"_handleHighestAudioCategoryChange:" name:AVSystemController_HighestArbitrationPriorityForTipiDidChangeNotification object:v3];
      [v4 addObserver:self selector:"_handleMediaPauseStateChanged" name:@"CdSignalAudioInterruptedChanged" object:0];
      double v6 = [v3 attributeForKey:AVSystemController_HighestArbitrationPriorityForTipiAttribute];
      id v7 = [v6 objectForKeyedSubscript:AVSystemController_HighestArbitrationPriorityForTipi_AudioScore];
      [(BTSmartRoutingDaemon *)self _updateLocalAudioCategory:v7];
      dispatchQueueAVSys = self->_dispatchQueueAVSys;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000325F8;
      block[3] = &unk_100232710;
      block[4] = self;
      dispatch_async((dispatch_queue_t)dispatchQueueAVSys, block);
    }
  }
}

- (void)_mediaRouteMonitorEnsureStopped
{
  if (self->_mediaRouteMonitorObservingActiveAudioRoute)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_mediaRouteMonitorObservingActiveAudioRoute = 0;
    self->_BOOL activityLevelMediaPlaying = 0;
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:kMRMediaRemotePickableRoutesDidChangeNotification object:0];
    [v3 removeObserver:self name:AVSystemController_SomeSessionIsPlayingDidChangeNotification object:0];
    [v3 removeObserver:self name:AVSystemController_ServerConnectionDiedNotification object:0];
    [v3 removeObserver:self name:@"MRAVOutputContextOutputDevicesDidChangeNotification" object:MRAVOutputContextGetSharedSystemAudioContext()];
  }
}

- (void)_mediaRouteMonitorActiveAudioRouteChanged:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032868;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_mediaRouteMonitorSpeakRoute
{
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v3 = +[NSBundle bundleWithPath:@"/System/Library/UserNotifications/Bundles/com.apple.BTUserNotifications.bundle"];
  if (!v3)
  {
    double v5 = (void *)GestaltCopyAnswer();
    goto LABEL_9;
  }
  id v4 = CULocalizedStringEx();
  double v5 = (void *)GestaltCopyAnswer();
  if (!v4)
  {
LABEL_9:
    double v6 = @"?";
    goto LABEL_10;
  }
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5);
  double v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  id v7 = objc_alloc_init((Class)CUVoiceSession);
  [v7 setDispatchQueue:self->_dispatchQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000336F0;
  v8[3] = &unk_100232738;
  v8[4] = v7;
  [v7 speakText:v6 flags:0 completion:v8];
}

- (void)_mediaRouteMonitorActivityLevelUpdate:(id)a3
{
  dispatchQueueAVSys = self->_dispatchQueueAVSys;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033808;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueueAVSys, block);
}

- (void)_mediaRouteHijackResponseHandlerFor:(id)a3 allowedToHijack:(BOOL)a4 withReason:(id)a5
{
  BOOL v6 = a4;
  id v37 = a3;
  id v8 = a5;
  id v9 = objc_alloc_init((Class)BTAudioRoutingResponse);
  id v10 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v37];
  if (v6)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v11 = 1;
    [v9 setAction:1];
    [v9 setDeviceAddress:v37];
    [v9 setReason:@"Tipi device hijack was successful"];
    self->_autoRoutingResponseTicks = mach_absolute_time();
  }
  else
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v12 = 3;
    [v9 setAction:3];
    [v9 setDeviceAddress:0];
    [v9 setReason:v8];
    double v13 = [v9 reason];
    unsigned int v14 = [v13 isEqualToString:@"Backoff"];

    if (v14)
    {
      uint64_t v12 = 4;
      [v9 setAction:4];
    }
    CFStringRef v15 = [v9 reason];
    unsigned int v16 = [v15 isEqualToString:@"Ambiguity"];

    if (v16) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = v12;
    }
  }
  [v9 setClientID:[v10 audioRoutingClientID]];
  uint64_t v17 = [v10 audioRoutingResponse];

  if (v17)
  {
    uint64_t v18 = [v10 audioRoutingResponse];
    [(BTSmartRoutingDaemon *)self _respondRoutingRequest:v9 withResponseHandler:v18 wxAddress:v37];
  }
  if (v6)
  {
    uint64_t v19 = [v10 otherTipiDeviceBTAddress];

    if (v19)
    {
      id v20 = objc_alloc_init((Class)NSMutableDictionary);
      [v20 setObject:&__kCFBooleanTrue forKey:@"audioRoutingSetOwnershipToFalse"];
      [v20 setObject:@"Hijackv2" forKey:@"reason"];
      double v21 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v10 otherTipiAudioCategory]);
      [v20 setObject:v21 forKey:@"localscore"];

      double v22 = +[NSNumber numberWithInt:[(SmartRoutingStats *)self->_stats hijackScore]];
      [v20 setObject:v22 forKey:@"audioRoutingScore"];

      double v23 = +[NSNumber numberWithInt:[(SmartRoutingStats *)self->_stats hijackScore]];
      [v20 setObject:v23 forKey:@"remotescore"];

      if ([v10 otherTipiAudioCategory] >= 0xC9) {
        [v20 setObject:&__kCFBooleanTrue forKey:@"SmartRoutingKeyShowNearbyUI"];
      }
      id v24 = [v10 otherTipiDeviceBTAddress];
      [(BTSmartRoutingDaemon *)self _relayConduitMessageSend:1 withOptions:v20 andWxAddress:v37 andOtherAddress:v24];
    }
    mach_absolute_time();
    uint64_t v25 = UpTicksToSeconds();
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      unsigned int v26 = [v10 routed];
      unint64_t v27 = "no";
      if (v26) {
        unint64_t v27 = "yes";
      }
      uint64_t v34 = (uint64_t)v27;
      uint64_t v35 = v25;
      LogPrintF();
    }
    if ((objc_msgSend(v10, "routed", v34, v35) & 1) != 0
      || self->_showBannerConnectedLastTicks && self->_secondsBetweenConnectBanner > (double)(unint64_t)v25)
    {
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
      {
        if ([v10 inEar]) {
          unsigned int v28 = "yes";
        }
        else {
          unsigned int v28 = "no";
        }
        if ([v10 inEarDisabled]) {
          int64_t v29 = "yes";
        }
        else {
          int64_t v29 = "no";
        }
        uint64_t v35 = (uint64_t)v28;
        unsigned int v36 = v29;
        uint64_t v34 = v25;
        LogPrintF();
      }
    }
    else
    {
      id v30 = [v10 deviceName];
      uint64_t v31 = [v10 deviceAddress];
      char v32 = (void *)v31;
      if (v31) {
        CFStringRef v33 = (const __CFString *)v31;
      }
      else {
        CFStringRef v33 = @"?";
      }
      -[BTSmartRoutingDaemon _smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:](self, "_smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:", 1, v30, v33, [v10 productID], @"Connected", 0, 4.0);
    }
  }
  [(BTSmartRoutingDaemon *)self _startHijackMetricSubmission:v11, v37, @"V2", v34, v35, v36 wxAddress version];
}

- (void)_mediaRouteHijackResponse:(int)a3 wxAddress:(id)a4 andAudioResponseID:(id)a5 andAllowedToHijack:(BOOL)a6 withReason:(id)a7
{
  BOOL v8 = a6;
  id v10 = *(void **)&a3;
  uint64_t v55 = (char *)a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  [v14 setObject:v12 forKey:@"audioRoutingRequestID"];
  [v14 setObject:self->_localDeviceAudioCatogory forKey:@"remotescore"];
  if (v8)
  {
    if (self->_audioScoreOtherTipiDevice != v10) {
      self->_unint64_t audioScoreOtherTipiDevice = (int)v10;
    }
    CFStringRef v15 = &unk_100261000;
    if (dword_1002610B8 > 30) {
      goto LABEL_11;
    }
    unint64_t audioScoreOtherTipiDevice = (unint64_t)v10;
    if (dword_1002610B8 == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_11;
      }
      unint64_t audioScoreOtherTipiDevice = self->_audioScoreOtherTipiDevice;
    }
    id v47 = v55;
    int v48 = (void *)audioScoreOtherTipiDevice;
    LogPrintF();
LABEL_11:
    self->_autoRoutingTicks = mach_absolute_time();
    uint64_t v17 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v55];
    uint64_t v18 = [v17 deviceVersion];

    uint64_t v19 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v55];
    id v20 = [v19 otherTipiDeviceVersion];
    [v20 doubleValue];
    BOOL v22 = v21 < 1.2 || [@"3E725" compare:v18 options:64] == (id)1;

    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      id v23 = v12;
      id v24 = v13;
      uint64_t v25 = v10;
      if (v22) {
        unsigned int v26 = "yes";
      }
      else {
        unsigned int v26 = "no";
      }
      unint64_t v27 = -[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v55, v47, v48);
      int v48 = [v27 otherTipiDeviceVersion];
      int v49 = v18;
      id v47 = v26;
      id v10 = v25;
      id v13 = v24;
      id v12 = v23;
      CFStringRef v15 = (_DWORD *)&unk_100261000;
      LogPrintF();
    }
    if (v22) {
      [(BTSmartRoutingDaemon *)self _setOwnership:v55 withHijackRequest:v12 withOwnership:0];
    }
    int v30 = v15[46];
    if (v30 <= 30 && (v30 != -1 || _LogCategory_Initialize()))
    {
      id v47 = v55;
      LogPrintF();
    }
    uint64_t v31 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1, v47, v48, v49);
    [v14 setObject:v31 forKey:@"audioRoutingHijackAnswer"];

    if (self->_score > 3 || (int)[(CUSystemMonitor *)self->_callMonitor activeCallCount] >= 1)
    {
      char v32 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v55];
      unsigned int v33 = [v32 routed];

      if (v33)
      {
        uint64_t v34 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v55];
        unsigned __int8 v35 = [v34 otherTipiDeviceIsWatch];

        if ((v35 & 1) == 0)
        {
          unsigned int v36 = [(BTBannerUISession *)self->_uiSmartRoutingBanner trailingAccessoryText];
          unsigned __int8 v37 = [v36 containsString:@"Reverse"];

          if ((v37 & 1) == 0)
          {
            uint64_t v54 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v55];
            double v38 = [v54 deviceName];
            unsigned int v53 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v55];
            uint64_t v39 = [v53 deviceAddress];
            unsigned int v52 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v55];
            unsigned int v50 = [v52 productID];
            int v51 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v55];
            uint64_t v40 = [v51 otherTipiDeviceBTName];
            uint64_t v41 = +[NSString stringWithFormat:@"%@", v40];
            [(BTSmartRoutingDaemon *)self _smartRoutingShowBanner:5 withDevice:v38 andDeviceAddress:v39 andProductID:v50 andCentralContentItemTxt:v41 andTimeout:0 andDeviceType:20.0];
          }
        }
      }
    }
    [(BTSmartRoutingDaemon *)self _setManualRouteFlag:v55 withManualRoute:0];
    CFStringRef v42 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v55];
    unsigned int v43 = [v42 routed];

    if (v43)
    {
      [(BTSmartRoutingDaemon *)self _relayConduitMessageSend:1 withOptions:v14 andWxAddress:v55 andOtherAddress:0];
      [(SmartRoutingStats *)self->_stats setHijackAwayRemoteScore:v10];
      [(SmartRoutingStats *)self->_stats setHijackAwayLocalScore:[(NSNumber *)self->_localDeviceAudioCatogory intValue]];
      id v44 = [(SmartRoutingStats *)self->_stats falseRouteCheckReason];

      if (!v44) {
        [(SmartRoutingStats *)self->_stats setFalseRouteCheckReason:@"Hijacked_Away"];
      }
      [(BTSmartRoutingDaemon *)self submitRouteActivityMetric:v55 activity:@"Hijack_Away"];
      [(BTSmartRoutingDaemon *)self _startRouteCheckTimer:v55 andType:8];
    }
    else
    {
      int v45 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v55];
      unsigned __int8 v46 = [v45 routed];

      if ((v46 & 1) == 0) {
        [(BTSmartRoutingDaemon *)self _relayConduitMessageSend:1 withOptions:v14 andWxAddress:v55 andOtherAddress:0];
      }
    }

    goto LABEL_45;
  }
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    id v47 = v55;
    int v48 = v13;
    LogPrintF();
  }
  if (objc_msgSend(v13, "isEqual:", @"LowerPriority", v47, v48))
  {
    unsigned int v28 = +[NSNumber numberWithInt:3];
    [v14 setObject:v28 forKey:@"audioRoutingHijackAnswer"];

    [(BTSmartRoutingDaemon *)self _relayConduitMessageSend:1 withOptions:v14 andWxAddress:v55 andOtherAddress:0];
  }
  if ([v13 isEqual:@"AmbiguousPriority"])
  {
    int64_t v29 = +[NSNumber numberWithInt:2];
    [v14 setObject:v29 forKey:@"audioRoutingHijackAnswer"];

    [(BTSmartRoutingDaemon *)self _relayConduitMessageSend:1 withOptions:v14 andWxAddress:v55 andOtherAddress:0];
  }
LABEL_45:
}

- (void)_mediaRouteHijackWithAudioScore:(int)a3 wxAddress:(id)a4 andAudioResponseID:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = sub_10001E20C;
  v35[4] = sub_10001E21C;
  id v36 = 0;
  if (!v9)
  {
    if (dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v12 = objc_alloc_init((Class)NSMutableDictionary);
    [v12 setObject:0 forKey:@"audioRoutingRequestID"];
    id v13 = +[NSNumber numberWithInt:3];
    [v12 setObject:v13 forKey:@"audioRoutingHijackAnswer"];

    [(BTSmartRoutingDaemon *)self _relayConduitMessageSend:1 withOptions:v12 andWxAddress:v8 andOtherAddress:0];
    goto LABEL_28;
  }
  if (!v8)
  {
    if (dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v12 = objc_alloc_init((Class)NSMutableDictionary);
    [v12 setObject:v9 forKey:@"audioRoutingRequestID"];
    uint64_t v18 = +[NSNumber numberWithInt:3];
    [v12 setObject:v18 forKey:@"audioRoutingHijackAnswer"];

    [(BTSmartRoutingDaemon *)self _relayConduitMessageSend:1 withOptions:v12 andWxAddress:0 andOtherAddress:0];
LABEL_28:

    goto LABEL_45;
  }
  id v10 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v8];
  uint64_t v11 = [v10 otherTipiDeviceBTAddress];

  if (v11)
  {
    if (dword_1002610B8 <= 50 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v24 = (uint64_t)v9;
      uint64_t v25 = v6;
      uint64_t v23 = (uint64_t)v8;
      LogPrintF();
    }
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    char v34 = 0;
    if (!self->_prefSmartRoutingBlockHijackWindowinSeconds) {
      goto LABEL_43;
    }
    id v14 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v8];
    if ([v14 hijackBackoffTicks])
    {
      BOOL hijackBackOffInitiator = self->_hijackBackOffInitiator;

      if (!hijackBackOffInitiator)
      {
LABEL_43:
        dispatchQueueAVSys = self->_dispatchQueueAVSys;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100034D00;
        block[3] = &unk_100233860;
        int v30 = v33;
        int v32 = v6;
        uint64_t v31 = v35;
        id v27 = v8;
        unsigned int v28 = self;
        id v29 = v9;
        dispatch_async((dispatch_queue_t)dispatchQueueAVSys, block);

        id v14 = v27;
LABEL_44:

        _Block_object_dispose(v33, 8);
        goto LABEL_45;
      }
      unsigned int v16 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v8];
      uint64_t v17 = -[BTSmartRoutingDaemon _checkTickswithinWindow:withWindow:](self, "_checkTickswithinWindow:withWindow:", [v16 hijackBackoffTicks], self->_prefSmartRoutingBlockHijackWindowinSeconds);

      id v14 = objc_alloc_init((Class)NSMutableDictionary);
      if (v17 >= 1)
      {
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v24 = UpTicksToSeconds();
          uint64_t v25 = v17;
          uint64_t v23 = (uint64_t)v8;
          LogPrintF();
        }
        uint64_t v19 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v17, v23, v24, v25);
        [v14 setObject:v19 forKey:@"hijackBackoffTicks"];
        [v14 setObject:v9 forKey:@"audioRoutingRequestID"];
        id v20 = +[NSNumber numberWithInt:4];
        [v14 setObject:v20 forKey:@"audioRoutingHijackAnswer"];

        [(BTSmartRoutingDaemon *)self _relayConduitMessageSend:1 withOptions:v14 andWxAddress:v8 andOtherAddress:0];
        goto LABEL_44;
      }
      if (v17 + SecondsToUpTicks())
      {
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
        {
          SecondsToUpTicks();
          uint64_t v23 = UpTicksToSeconds();
          uint64_t v24 = SecondsToUpTicks() + v17;
          LogPrintF();
        }
        [v14 setObject:v9 forKey:@"audioRoutingRequestID" v23, v24, v25];
        BOOL v22 = +[NSNumber numberWithInt:4];
        [v14 setObject:v22 forKey:@"audioRoutingHijackAnswer"];

        [(BTSmartRoutingDaemon *)self _relayConduitMessageSend:1 withOptions:v14 andWxAddress:v8 andOtherAddress:0];
        goto LABEL_44;
      }
      [(BTSmartRoutingDaemon *)self _hijackBackoffReset:v8 withReason:@"tickerExhausted"];
      if (dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }

    goto LABEL_43;
  }
  if (dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (!self->_tipiElectionInProgress) {
    [(BTSmartRoutingDaemon *)self _tipiHealingAttempt];
  }
LABEL_45:
  _Block_object_dispose(v35, 8);
}

- (void)_updateRoutingActionForManuallyRoute
{
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100034EB4;
  v3[3] = &unk_100233650;
  v3[4] = self;
  [(NSMutableDictionary *)smartRoutingWxDeviceMap enumerateKeysAndObjectsUsingBlock:v3];
}

- (void)_nearbyInfoDiscoveryEnsureStarted
{
  if (!self->_nearbyInfoDiscovery)
  {
    p_nearbyInfoDiscovery = &self->_nearbyInfoDiscovery;
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v4 = objc_alloc_init((Class)SFDeviceDiscovery);
    objc_storeStrong((id *)p_nearbyInfoDiscovery, v4);
    [v4 setChangeFlags:9];
    [v4 setDiscoveryFlags:33];
    [v4 setDispatchQueue:self->_dispatchQueue];
    [v4 setPurpose:@"SmartRouting"];
    [v4 setScanRate:20];
    [v4 setRssiThreshold:-75];
    if (self->_prefSmartRoutingEnabledPhase3 && GestaltGetDeviceClass() != 6) {
      [v4 setOverrideScreenOff:1];
    }
    [(BTSmartRoutingDaemon *)self _powerLogSmartRoutingScanStarted:16];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100035398;
    v12[3] = &unk_100233888;
    v12[4] = self;
    v12[5] = v4;
    [v4 setDeviceFoundHandler:v12];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000353BC;
    v11[3] = &unk_100233888;
    void v11[4] = self;
    v11[5] = v4;
    [v4 setDeviceLostHandler:v11];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000353E0;
    v10[3] = &unk_1002338B0;
    v10[4] = self;
    void v10[5] = v4;
    [v4 setDeviceChangedHandler:v10];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100035404;
    v9[3] = &unk_100232A38;
    v9[4] = self;
    void v9[5] = v4;
    [v4 activateWithCompletion:v9];
    self->_prefSmartRoutingForcedDisconnectionTicks = mach_absolute_time();
    double v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    prefSmartRoutingForcedDisconnectionStartTimer = self->_prefSmartRoutingForcedDisconnectionStartTimer;
    self->_prefSmartRoutingForcedDisconnectionStartTimer = v5;
    id v7 = v5;

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000354CC;
    v8[3] = &unk_100232A10;
    v8[4] = v7;
    void v8[5] = self;
    dispatch_source_set_event_handler(v7, v8);
    CUDispatchTimerSet();
    dispatch_activate(v7);
    [(BTSmartRoutingDaemon *)self _nearbyInfoSetAudioRoutingScore];
  }
}

- (void)_nearbyInfoDiscoveryEnsureStopped
{
  if (self->_nearbyInfoDiscovery)
  {
    [(BTSmartRoutingDaemon *)self _powerLogSmartRoutingScanStopped:16];
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFDeviceDiscovery *)self->_nearbyInfoDiscovery invalidate];
    nearbyInfoDiscovery = self->_nearbyInfoDiscovery;
    self->_nearbyInfoDiscovery = 0;

    self->_prefSmartRoutingForcedDisconnectionTicks = 0;
    if (self->_tipiElectionInProgress) {
      self->_tipiElectionInProgress = 0;
    }
    tipiHealingTimer = self->_tipiHealingTimer;
    if (tipiHealingTimer)
    {
      double v5 = tipiHealingTimer;
      dispatch_source_cancel(v5);
      uint64_t v6 = self->_tipiHealingTimer;
      self->_tipiHealingTimer = 0;
    }
    if (self->_prefSmartRoutingWatchTriangleMagnet)
    {
      nearbyInfoDevicesTriangleRecoveryTimer = self->_nearbyInfoDevicesTriangleRecoveryTimer;
      if (nearbyInfoDevicesTriangleRecoveryTimer)
      {
        id v8 = nearbyInfoDevicesTriangleRecoveryTimer;
        dispatch_source_cancel(v8);
        id v9 = self->_nearbyInfoDevicesTriangleRecoveryTimer;
        self->_nearbyInfoDevicesTriangleRecoveryTimer = 0;
      }
    }
    prefSmartRoutingForcedDisconnectionStartTimer = self->_prefSmartRoutingForcedDisconnectionStartTimer;
    if (prefSmartRoutingForcedDisconnectionStartTimer)
    {
      uint64_t v11 = prefSmartRoutingForcedDisconnectionStartTimer;
      dispatch_source_cancel(v11);
      id v12 = self->_prefSmartRoutingForcedDisconnectionStartTimer;
      self->_prefSmartRoutingForcedDisconnectionStartTimer = 0;
    }
    nearbyInfoDevices = self->_nearbyInfoDevices;
    if (nearbyInfoDevices)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v14 = [(NSMutableDictionary *)nearbyInfoDevices allValues];
      id v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v21;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v21 != v17) {
              objc_enumerationMutation(v14);
            }
            [(BTSmartRoutingDaemon *)self _nearbyInfoDeviceLost:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          }
          id v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v16);
      }

      uint64_t v19 = self->_nearbyInfoDevices;
      self->_nearbyInfoDevices = 0;
    }
  }
}

- (BOOL)_checkValidBatteryValue:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 batteryType] == (id)2
    || [v3 batteryType] == (id)3
    || [v3 batteryType] == (id)4;

  return v4;
}

- (BOOL)_isSmartRoutingCapableDevice:(id)a3
{
  id v3 = [a3 model];
  if (([v3 containsString:@"Mac"] & 1) != 0
    || ([v3 hasPrefix:@"iPhone"] & 1) != 0
    || ([v3 hasPrefix:@"iPad"] & 1) != 0
    || ([v3 hasPrefix:@"Watch"] & 1) != 0
    || ([v3 hasPrefix:@"iPod"] & 1) != 0)
  {
    BOOL v4 = 1;
  }
  else
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_checkTriangleRecovery
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  nearbyInfoDevices = self->_nearbyInfoDevices;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100035A88;
  v15[3] = &unk_100233328;
  v15[4] = &v16;
  [(NSMutableDictionary *)nearbyInfoDevices enumerateKeysAndObjectsUsingBlock:v15];
  unsigned int v4 = [(BTSmartRoutingDaemon *)self isInAnyTipi];
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    int v5 = *((unsigned __int8 *)v17 + 24);
    unsigned int v6 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice magnetConnected];
    id v7 = "yes";
    if (v5) {
      id v8 = "yes";
    }
    else {
      id v8 = "no";
    }
    if (v6) {
      id v9 = "yes";
    }
    else {
      id v9 = "no";
    }
    if (!v4) {
      id v7 = "no";
    }
    id v13 = v7;
    unint64_t prefSmartRoutingWatchTriangleMagnet = self->_prefSmartRoutingWatchTriangleMagnet;
    uint64_t v11 = v8;
    id v12 = v9;
    LogPrintF();
  }
  if (*((unsigned char *)v17 + 24)) {
    char v10 = 1;
  }
  else {
    char v10 = v4;
  }
  if ((v10 & 1) != 0 || ![(BTSmartRoutingSourceDevice *)self->_sourceDevice magnetConnected]) {
    [(BTSmartRoutingDaemon *)self _cancelTriangleRecoveryTimer];
  }
  else {
    [(BTSmartRoutingDaemon *)self _nearbyDeviceInfoTriangleRecoveryTimer];
  }
  _Block_object_dispose(&v16, 8);
}

- (void)_cancelTriangleRecoveryTimer
{
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  nearbyInfoDevicesTriangleRecoveryTimer = self->_nearbyInfoDevicesTriangleRecoveryTimer;
  if (nearbyInfoDevicesTriangleRecoveryTimer)
  {
    int v5 = nearbyInfoDevicesTriangleRecoveryTimer;
    dispatch_source_cancel(v5);
    unsigned int v4 = self->_nearbyInfoDevicesTriangleRecoveryTimer;
    self->_nearbyInfoDevicesTriangleRecoveryTimer = 0;
  }
}

- (void)_nearbyInfoDeviceFound:(id)a3
{
  id v21 = a3;
  unsigned int v4 = [v21 identifier];
  int v5 = [v4 UUIDString];

  if (v5)
  {
    id v6 = [v21 audioRoutingScore];
    if (dword_1002610B8 <= 30)
    {
      id v7 = v6;
      if (dword_1002610B8 != -1 || _LogCategory_Initialize())
      {
        uint64_t v8 = [v21 name];
        id v9 = (void *)v8;
        if (v7 > 0xF) {
          char v10 = "?";
        }
        else {
          char v10 = off_1002342D0[(int)v7];
        }
        id v19 = v7;
        long long v20 = v10;
        uint64_t v17 = v5;
        uint64_t v18 = v8;
        LogPrintF();
      }
    }
    if (-[BTSmartRoutingDaemon _isSmartRoutingCapableDevice:](self, "_isSmartRoutingCapableDevice:", v21, v17, v18, v19, v20))
    {
      nearbyInfoDevices = self->_nearbyInfoDevices;
      if (!nearbyInfoDevices)
      {
        id v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        id v13 = self->_nearbyInfoDevices;
        self->_nearbyInfoDevices = v12;

        nearbyInfoDevices = self->_nearbyInfoDevices;
      }
      [(NSMutableDictionary *)nearbyInfoDevices setObject:v21 forKeyedSubscript:v5];
    }
    if (GestaltGetDeviceClass() == 1)
    {
      if (self->_prefSmartRoutingWatchTriangleMagnet)
      {
        [(BTSmartRoutingDaemon *)self _checkTriangleRecovery];
      }
      else if ([(NSMutableDictionary *)self->_nearbyInfoDevices count] == (id)1)
      {
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [(BTSmartRoutingDaemon *)self _nearbyDeviceInfoTriangleRecoveryTimer];
      }
      else
      {
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        nearbyInfoDevicesTriangleRecoveryTimer = self->_nearbyInfoDevicesTriangleRecoveryTimer;
        if (nearbyInfoDevicesTriangleRecoveryTimer)
        {
          id v15 = nearbyInfoDevicesTriangleRecoveryTimer;
          dispatch_source_cancel(v15);
          uint64_t v16 = self->_nearbyInfoDevicesTriangleRecoveryTimer;
          self->_nearbyInfoDevicesTriangleRecoveryTimer = 0;
        }
      }
    }
    [(CUCoalescer *)self->_evaluatorCoalescer trigger];
  }
}

- (void)_nearbyInfoDeviceLost:(id)a3
{
  id v13 = a3;
  unsigned int v4 = [v13 identifier];
  int v5 = [v4 UUIDString];

  if (v5)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      id v6 = [v13 idsIdentifier];
      [v13 name];
      id v12 = v11 = v6;
      char v10 = v5;
      LogPrintF();
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_nearbyInfoDevices, "setObject:forKeyedSubscript:", 0, v5, v10, v11, v12);
    if (GestaltGetDeviceClass() == 1)
    {
      if (self->_prefSmartRoutingWatchTriangleMagnet)
      {
        [(BTSmartRoutingDaemon *)self _checkTriangleRecovery];
      }
      else if ([(NSMutableDictionary *)self->_nearbyInfoDevices count] == (id)1)
      {
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [(BTSmartRoutingDaemon *)self _nearbyDeviceInfoTriangleRecoveryTimer];
      }
      else
      {
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        nearbyInfoDevicesTriangleRecoveryTimer = self->_nearbyInfoDevicesTriangleRecoveryTimer;
        if (nearbyInfoDevicesTriangleRecoveryTimer)
        {
          uint64_t v8 = nearbyInfoDevicesTriangleRecoveryTimer;
          dispatch_source_cancel(v8);
          id v9 = self->_nearbyInfoDevicesTriangleRecoveryTimer;
          self->_nearbyInfoDevicesTriangleRecoveryTimer = 0;
        }
      }
    }
    [(CUCoalescer *)self->_evaluatorCoalescer trigger];
  }
}

- (void)_nearbyInfoSetAudioRoutingScore
{
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    uint64_t score = self->_score;
    LogPrintF();
  }
  id v3 = objc_alloc_init((Class)SFClient);
  if ([(CBDiscovery *)self->_connectedDiscovery bluetoothState] == (id)5) {
    uint64_t v4 = self->_score;
  }
  else {
    uint64_t v4 = 0;
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000361B4;
  v6[3] = &unk_100232A38;
  void v6[4] = v3;
  void v6[5] = self;
  [v3 setAudioRoutingScore:v4 completion:score];
  [(BTSmartRoutingDaemon *)self _sendTipiScoreUpdateToWx];
}

- (void)_nearbyInfoActivityChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v36 = 0;
  unsigned __int8 v37 = &v36;
  uint64_t v38 = 0x2020000000;
  int v39 = 0;
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    uint64_t score = self->_score;
    if (score > 0xF) {
      uint64_t v4 = "?";
    }
    else {
      uint64_t v4 = off_1002342D0[score];
    }
    uint64_t v30 = self->_score;
    int v32 = v4;
    unint64_t activityLevel = self->_activityLevel;
    LogPrintF();
  }
  if (self->_activityLevelTicks)
  {
    mach_absolute_time();
    unint64_t activityLevelDeltaInSeconds = self->_activityLevelDeltaInSeconds + UpTicksToSeconds();
    self->_unint64_t activityLevelDeltaInSeconds = activityLevelDeltaInSeconds;
    if (dword_1002610B8 <= 30)
    {
      if (dword_1002610B8 != -1)
      {
LABEL_12:
        unint64_t activityLevel = activityLevelDeltaInSeconds;
        uint64_t v30 = self->_activityLevel;
        LogPrintF();
        goto LABEL_14;
      }
      if (_LogCategory_Initialize())
      {
        unint64_t activityLevelDeltaInSeconds = self->_activityLevelDeltaInSeconds;
        goto LABEL_12;
      }
    }
  }
LABEL_14:
  switch(self->_activityLevel)
  {
    case 3u:
      if (self->_activityLevelMediaPlaying)
      {
        int v12 = 4;
        goto LABEL_39;
      }
      unint64_t v13 = self->_activityLevelDeltaInSeconds;
      if (v13 > 0x19) {
        goto LABEL_38;
      }
      if (v13 == 25)
      {
        *((_DWORD *)v37 + 6) = 2;
        if (!self->_activityLevelTicks) {
          self->_activityLevelTicks = mach_absolute_time();
        }
        activityLevelDelayTimer = self->_activityLevelDelayTimer;
        if (activityLevelDelayTimer)
        {
          long long v23 = activityLevelDelayTimer;
          dispatch_source_cancel(v23);
          uint64_t v24 = self->_activityLevelDelayTimer;
          self->_activityLevelDelayTimer = 0;
        }
        uint64_t v10 = 25;
        goto LABEL_26;
      }
      break;
    case 7u:
    case 0xAu:
      unint64_t v6 = self->_activityLevelDeltaInSeconds;
      if (v6 <= 0x1DF && self->_screenOn)
      {
        if (v6 == 25 || !v6)
        {
          if (!self->_activityLevelTicks) {
            self->_activityLevelTicks = mach_absolute_time();
          }
          *((_DWORD *)v37 + 6) = 2;
          id v7 = self->_activityLevelDelayTimer;
          if (v7)
          {
            uint64_t v8 = v7;
            dispatch_source_cancel(v8);
            id v9 = self->_activityLevelDelayTimer;
            self->_activityLevelDelayTimer = 0;
          }
          if (self->_screenOn) {
            uint64_t v10 = 480;
          }
          else {
            uint64_t v10 = 25;
          }
LABEL_26:
          -[BTSmartRoutingDaemon _nearbyInfoActivityDelayCheck:](self, "_nearbyInfoActivityDelayCheck:", v10, activityLevel, v30, v32);
        }
      }
      else
      {
LABEL_38:
        int v12 = 1;
LABEL_39:
        *((_DWORD *)v37 + 6) = v12;
      }
      break;
    case 0xBu:
    case 0xEu:
      self->_unint64_t activityLevelDeltaInSeconds = 25;
      self->_activityLevelTicks = 0;
      if (self->_activityCriticalTimer) {
        int v11 = 7;
      }
      else {
        int v11 = 6;
      }
      *((_DWORD *)v37 + 6) = v11;
      if ([(SFDeviceDiscovery *)self->_nearbyInfoDiscovery scanRate] != (id)40) {
        [(SFDeviceDiscovery *)self->_nearbyInfoDiscovery setScanRate:40];
      }
      if ([(SFDeviceDiscovery *)self->_wxDiscovery scanRate] != (id)40) {
        [(SFDeviceDiscovery *)self->_wxDiscovery setScanRate:40];
      }
      [(BTSmartRoutingDaemon *)self _smartRoutingLowerRateScan];
      break;
    default:
      break;
  }
  BOOL v14 = self->_activityLevelMediaPlaying
     || (int)[(CUSystemMonitor *)self->_callMonitor activeCallCount] > 0;
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000367A4;
  v34[3] = &unk_1002338D8;
  BOOL v35 = v14;
  v34[4] = self;
  void v34[5] = &v36;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v34, activityLevel, v30);
  int v16 = *((_DWORD *)v37 + 6);
  if (v16)
  {
    uint64_t v17 = self->_score;
    if (v16 != v17)
    {
      if (dword_1002610B8 <= 30)
      {
        if (dword_1002610B8 != -1 || (int v19 = _LogCategory_Initialize(), v17 = self->_score, v19))
        {
          if (v17 > 0xF) {
            uint64_t v18 = "?";
          }
          else {
            uint64_t v18 = off_1002342D0[(int)v17];
          }
          uint64_t v20 = *((int *)v37 + 6);
          if (v20 > 0xF) {
            id v21 = "?";
          }
          else {
            id v21 = off_1002342D0[v20];
          }
          int v32 = (const char *)*((int *)v37 + 6);
          unsigned int v33 = v21;
          uint64_t v29 = v17;
          uint64_t v31 = v18;
          LogPrintF();
          uint64_t v17 = self->_score;
        }
      }
      self->_uint64_t score = *((_DWORD *)v37 + 6);
      [(BTSmartRoutingDaemon *)self _nearbyInfoSetAudioRoutingScore];
      [(CUCoalescer *)self->_evaluatorCoalescer trigger];
      if (self->_prefProactiveOwnershipArbitration)
      {
        [(BTSmartRoutingDaemon *)self _notifyOtherTipiDeviceTipiScoreChanged:v17 andNewScore:self->_score];
        if (*((_DWORD *)v37 + 6) == 1 && !self->_cdDeviceIdentifier)
        {
          if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          self->_startIdleTicks = mach_absolute_time();
          highActivityLevelTimer = self->_highActivityLevelTimer;
          if (highActivityLevelTimer)
          {
            unsigned int v26 = highActivityLevelTimer;
            dispatch_source_cancel(v26);
            id v27 = self->_highActivityLevelTimer;
            self->_highActivityLevelTimer = 0;
          }
        }
        else
        {
          self->_startIdleTicks = 0;
        }
      }
    }
  }
  _Block_object_dispose(&v36, 8);
}

- (void)_nearbyInfoActivityCriticalStart
{
  p_activityCriticalTimer = &self->_activityCriticalTimer;
  uint64_t v4 = self->_activityCriticalTimer;
  if (v4)
  {
    int v5 = v4;
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    CUDispatchTimerSet();
  }
  else
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)p_activityCriticalTimer, v6);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100036A28;
    handler[3] = &unk_100232A10;
    int v5 = v6;
    uint64_t v8 = v5;
    id v9 = self;
    dispatch_source_set_event_handler(v5, handler);
    CUDispatchTimerSet();
    dispatch_activate(v5);
  }
}

- (void)_pairedDeviceMonitorEnsureStarted
{
  if (!self->_pairedDiscovery)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = (CBDiscovery *)objc_alloc_init((Class)CBDiscovery);
    pairedDiscovery = self->_pairedDiscovery;
    self->_pairedDiscovery = v3;
    int v5 = v3;

    [(CBDiscovery *)v5 setDispatchQueue:self->_dispatchQueue];
    [(CBDiscovery *)v5 setLabel:@"SmartRouting"];
    [(CBDiscovery *)v5 setDiscoveryFlags:(unint64_t)[(CBDiscovery *)v5 discoveryFlags] | 0x80000800000];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100036CF4;
    v8[3] = &unk_1002329E8;
    v8[4] = self;
    void v8[5] = v5;
    [(CBDiscovery *)v5 setDeviceFoundHandler:v8];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100036DA8;
    v7[3] = &unk_1002329E8;
    v7[4] = self;
    void v7[5] = v5;
    [(CBDiscovery *)v5 setDeviceLostHandler:v7];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100036E5C;
    v6[3] = &unk_100232A38;
    void v6[4] = self;
    void v6[5] = v5;
    [(CBDiscovery *)v5 activateWithCompletion:v6];
  }
}

- (void)_pairedDeviceMonitorEnsureStopped
{
  if (self->_pairedDiscovery)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CBDiscovery *)self->_pairedDiscovery invalidate];
    pairedDiscovery = self->_pairedDiscovery;
    self->_pairedDiscovery = 0;
  }
}

- (void)_nearbyInfoActivityDelayCheck:(unint64_t)a3
{
  dispatch_time_t v4 = dispatch_time(0, 1000000000 * a3);
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  activityLevelDelayTimer = self->_activityLevelDelayTimer;
  if (activityLevelDelayTimer)
  {
    dispatch_source_set_timer(activityLevelDelayTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  else
  {
    dispatch_source_t v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    id v7 = self->_activityLevelDelayTimer;
    self->_activityLevelDelayTimer = v6;

    uint64_t v8 = self->_activityLevelDelayTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100037148;
    handler[3] = &unk_100232710;
    void handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_activityLevelDelayTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_activityLevelDelayTimer);
  }
}

- (void)_pipeEnsureStarted
{
  if (!self->_smartRoutingPipe)
  {
    id v3 = objc_alloc_init(BTSmartRoutingPipe);
    smartRoutingPipe = self->_smartRoutingPipe;
    self->_smartRoutingPipe = v3;

    int v5 = self->_smartRoutingPipe;
    dispatchQueue = self->_dispatchQueue;
    [(BTSmartRoutingPipe *)v5 _activateWithDispatch:dispatchQueue];
  }
}

- (void)_pipeEnsureStopped
{
  smartRoutingPipe = self->_smartRoutingPipe;
  if (smartRoutingPipe)
  {
    [(BTSmartRoutingPipe *)smartRoutingPipe _invalidate];
    dispatch_time_t v4 = self->_smartRoutingPipe;
    self->_smartRoutingPipe = 0;
  }
}

- (void)_powerMonitorEnsureStarted
{
  if (!self->_powerMonitor)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    powerMonitor = self->_powerMonitor;
    self->_powerMonitor = v3;
    int v5 = v3;

    [(CUSystemMonitor *)v5 setDispatchQueue:self->_dispatchQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100037458;
    v11[3] = &unk_100232A10;
    void v11[4] = v5;
    v11[5] = self;
    dispatch_source_t v6 = objc_retainBlock(v11);
    [(CUSystemMonitor *)v5 setScreenOnChangedHandler:v6];
    [(CUSystemMonitor *)v5 setScreenLockedChangedHandler:v6];
    [(CUSystemMonitor *)v5 setFirstUnlockHandler:v6];
    [(CUSystemMonitor *)v5 setPrimaryAppleIDChangedHandler:v6];
    [(CUSystemMonitor *)v5 setScreenLockedChangedHandler:v6];
    [(CUSystemMonitor *)v5 activateWithCompletion:v6];
  }
  if (!self->_sleepWakeMonitor)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v7 = (CUSleepWakeMonitor *)objc_alloc_init((Class)CUSleepWakeMonitor);
    sleepWakeMonitor = self->_sleepWakeMonitor;
    self->_sleepWakeMonitor = v7;
    id v9 = v7;

    [(CUSleepWakeMonitor *)v9 setDispatchQueue:self->_dispatchQueue];
    [(CUSleepWakeMonitor *)v9 setLabel:@"SmartRouting"];
    self->_sleeping = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100037728;
    v10[3] = &unk_100233900;
    v10[4] = v9;
    void v10[5] = self;
    [(CUSleepWakeMonitor *)v9 setSleepWakeHandler:v10];
    [(CUSleepWakeMonitor *)v9 activateWithCompletion:0];
  }
}

- (void)_powerMonitorEnsureStopped
{
  if (self->_powerMonitor)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CUSystemMonitor *)self->_powerMonitor invalidate];
    powerMonitor = self->_powerMonitor;
    self->_powerMonitor = 0;
  }
  screenLockedLingerTimer = self->_screenLockedLingerTimer;
  if (screenLockedLingerTimer)
  {
    int v5 = screenLockedLingerTimer;
    dispatch_source_cancel(v5);
    dispatch_source_t v6 = self->_screenLockedLingerTimer;
    self->_screenLockedLingerTimer = 0;
  }
  sleepWakeMonitor = self->_sleepWakeMonitor;
  if (sleepWakeMonitor)
  {
    [(CUSleepWakeMonitor *)sleepWakeMonitor invalidate];
    uint64_t v8 = self->_sleepWakeMonitor;
    self->_sleepWakeMonitor = 0;

    self->_sleeping = 0;
    self->_int sleepWakeState = 0;
  }
}

- (void)_powerMonitorScreenLockChanged
{
  if (self->_powerMonitor)
  {
    screenLockedLingerTimer = self->_screenLockedLingerTimer;
    if (self->_effectiveScreenLocked)
    {
      if (!screenLockedLingerTimer)
      {
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v8 = 60;
          LogPrintF();
        }
        int v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
        dispatch_source_t v6 = self->_screenLockedLingerTimer;
        self->_screenLockedLingerTimer = v5;
        dispatch_time_t v4 = v5;

        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_100037B80;
        handler[3] = &unk_100232710;
        void handler[4] = self;
        dispatch_source_set_event_handler(v4, handler);
        CUDispatchTimerSet();
        dispatch_activate(v4);
LABEL_17:
      }
    }
    else if (screenLockedLingerTimer)
    {
      if (dword_1002610B8 >= 31)
      {
        dispatch_time_t v4 = screenLockedLingerTimer;
      }
      else
      {
        if (dword_1002610B8 != -1 || _LogCategory_Initialize()) {
          LogPrintF();
        }
        dispatch_time_t v4 = self->_screenLockedLingerTimer;
        if (!v4) {
          goto LABEL_18;
        }
      }
      dispatch_source_cancel(v4);
      id v7 = self->_screenLockedLingerTimer;
      self->_screenLockedLingerTimer = 0;

      goto LABEL_17;
    }
LABEL_18:
    [(BTSmartRoutingDaemon *)self _update];
  }
}

- (void)_relayConduitMessageEnsureStarted
{
  id v3 = self->_smartRoutingController;
  if (!v3)
  {
    id v3 = (CBController *)objc_alloc_init((Class)CBController);
    objc_storeStrong((id *)&self->_smartRoutingController, v3);
    [(CBController *)v3 setDispatchQueue:self->_dispatchQueue];
  }
  if (!self->_relayConduitMessageEnsureStarted)
  {
    self->_relayConduitMessageEnsureStarted = 1;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100037E48;
    v9[3] = &unk_100233928;
    v9[4] = self;
    [(CBController *)v3 setRelayMessageHandler:v9];
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100037F54;
    v8[3] = &unk_100233650;
    v8[4] = self;
    [(NSMutableDictionary *)smartRoutingWxDeviceMap enumerateKeysAndObjectsUsingBlock:v8];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100037F60;
    v7[3] = &unk_1002336E8;
    v7[4] = self;
    [(CBController *)v3 setTipiChangedHandler:v7];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000387B0;
    v5[3] = &unk_100232738;
    dispatch_source_t v6 = v3;
    [(CBController *)v6 activateWithCompletion:v5];
  }
}

- (void)_relayConduitMessageEnsureStopped
{
  self->_relayConduitMessageEnsureStarted = 0;
}

- (void)_relayConduitMessageSend:(unsigned __int8)a3 withOptions:(id)a4 andWxAddress:(id)a5 andOtherAddress:(id)a6
{
  uint64_t v8 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (self->_smartRoutingController)
  {
    int v33 = 0;
    Data = (void *)OPACKEncoderCreateData();
    uint64_t v27 = 0;
    unsigned int v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = sub_10001E20C;
    uint64_t v31 = sub_10001E21C;
    id v32 = 0;
    uint64_t v21 = 0;
    long long v22 = &v21;
    uint64_t v23 = 0x3032000000;
    uint64_t v24 = sub_10001E20C;
    uint64_t v25 = sub_10001E21C;
    id v26 = 0;
    smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100038C98;
    v15[3] = &unk_100233950;
    id v16 = v11;
    int v19 = &v21;
    uint64_t v20 = &v27;
    id v17 = v12;
    id v18 = v10;
    [(NSMutableDictionary *)smartRoutingWxDeviceMap enumerateKeysAndObjectsUsingBlock:v15];
    if (v22[5])
    {
      if (v28[5])
      {
        -[CBController sendRelayMessageType:messageData:conduitDevice:destinationDevice:completionHandler:](self->_smartRoutingController, "sendRelayMessageType:messageData:conduitDevice:destinationDevice:completionHandler:", v8, Data);
LABEL_20:

        _Block_object_dispose(&v21, 8);
        _Block_object_dispose(&v27, 8);

        goto LABEL_21;
      }
      if (dword_1002610B8 > 90 || dword_1002610B8 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_20;
      }
    }
    else if (dword_1002610B8 > 90 || dword_1002610B8 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_20;
    }
    LogPrintF();
    goto LABEL_20;
  }
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_21:
}

- (void)_relayConduitMessageReceived:(id)a3 andSourceDevice:(id)a4 messageType:(unsigned __int8)a5 messageData:(id)a6
{
  int v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    id v76 = v12;
    LogPrintF();
  }
  unint64_t v13 = [v10 btAddressData:v76];
  BOOL v14 = CUPrintNSDataAddress();

  int v108 = 0;
  if (!v14)
  {
    if (dword_1002610B8 > 90 || dword_1002610B8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_55;
    }
LABEL_18:
    LogPrintF();
    goto LABEL_55;
  }
  if (!v7)
  {
    if (dword_1002610B8 > 90 || dword_1002610B8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_55;
    }
    goto LABEL_18;
  }
  if (v7 == 1)
  {
    v89 = (void *)OPACKDecodeData();
    if (!v89)
    {
LABEL_54:

      goto LABEL_55;
    }
    if (dword_1002610B8 <= 40 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      id v77 = v89;
      LogPrintF();
    }
    id v15 = [v89 objectForKey:@"audioRoutingHijackRequest" v77];
    BOOL v16 = v15 == 0;

    if (!v16)
    {
      id v17 = [v89 objectForKey:@"audioRoutingScore"];
      id v18 = [v89 objectForKey:@"audioRoutingRequestID"];
      if (dword_1002610B8 <= 40 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
      {
        int v19 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v14];
        BOOL v78 = [v19 otherTipiDeviceBTAddress];
        id v79 = [v17 intValue];
        LogPrintF();
      }
      -[BTSmartRoutingDaemon _mediaRouteHijackWithAudioScore:wxAddress:andAudioResponseID:](self, "_mediaRouteHijackWithAudioScore:wxAddress:andAudioResponseID:", [v17 intValue:v78, v79], v14, v18);

      goto LABEL_47;
    }
    uint64_t v20 = [v89 objectForKey:@"audioRoutingHijackAnswer"];
    BOOL v21 = v20 == 0;

    if (!v21)
    {
      if (dword_1002610B8 <= 40 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v26 = [v89 objectForKeyedSubscript:@"remotescore"];
      [(SmartRoutingStats *)self->_stats setHijackActiveRemoteScore:0xFFFFFFFFLL];
      if (v26) {
        -[SmartRoutingStats setHijackActiveRemoteScore:](self->_stats, "setHijackActiveRemoteScore:", [v26 intValue]);
      }
      [(BTSmartRoutingDaemon *)self _setHighPriorityTag:v14 withHighPriority:0];
      uint64_t v27 = [v89 objectForKey:@"audioRoutingRequestID"];
      smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
      v103[0] = _NSConcreteStackBlock;
      v103[1] = 3221225472;
      v103[2] = sub_100039F38;
      v103[3] = &unk_100233998;
      id v104 = v14;
      int v105 = v27;
      id v106 = v89;
      double v107 = self;
      [(NSMutableDictionary *)smartRoutingWxDeviceMap enumerateKeysAndObjectsUsingBlock:v103];

      goto LABEL_47;
    }
    long long v22 = [v89 objectForKey:@"callState"];
    BOOL v23 = v22 == 0;

    if (!v23)
    {
LABEL_47:
      uint64_t v29 = [v89 objectForKey:@"hijackBackoffTicks"];
      BOOL v30 = v29 == 0;

      if (!v30)
      {
        uint64_t v31 = [v89 objectForKey:@"hijackBackoffTicks"];
        id v32 = v31;
        if (self->_prefSmartRoutingBlockHijackWindowinSeconds && v31)
        {
          if ([v31 unsignedLongLongValue])
          {
            int v33 = (char *)[v32 unsignedLongLongValue];
            char v34 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v14];
            uint64_t v35 = mach_absolute_time();
            [v34 _setHijackBackoffTick:&v33[v35 - SecondsToUpTicks()]];

            if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
            {
              UpTicksToSeconds();
              uint64_t v36 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v14];
              [v36 hijackBackoffTicks];
              LogPrintF();
            }
          }
          else
          {
            if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            unsigned __int8 v37 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v14];
            id v38 = [v37 hijackBackoffTicks];

            if (v38) {
              [(BTSmartRoutingDaemon *)self _hijackBackoffReset:v14 withReason:@"relayTimerZero"];
            }
          }
        }
      }
      goto LABEL_54;
    }
    uint64_t v24 = [v89 objectForKey:@"audioRoutingSetOwnershipToFalse"];
    BOOL v25 = v24 == 0;

    if (!v25)
    {
      [(BTSmartRoutingDaemon *)self _receivedRelinquishOwnership:v89 wxAddress:v14];
      goto LABEL_47;
    }
    int v39 = [v89 objectForKey:@"tipiHealingAttempt"];
    BOOL v40 = v39 == 0;

    if (!v40)
    {
      CFStringGetTypeID();
      int v81 = CFDictionaryGetTypedValue();
      CFStringGetTypeID();
      id v80 = CFDictionaryGetTypedValue();
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
      {
        BOOL v78 = v81;
        id v79 = v80;
        LogPrintF();
      }
      CFStringGetTypeID();
      unsigned int v87 = CFDictionaryGetTypedValue();
      CFStringGetTypeID();
      v85 = CFDictionaryGetTypedValue();
      v83 = NSDictionaryGetNSNumber();
      unsigned __int8 v46 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v14];
      [v46 _setOtherTipiDeviceInfo:v87 andName:v85 andVersion:v83];

      id v47 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v14];
      [v47 _setRoutingInitialized:1];

      if (self->_activityLevelMediaPlaying
        || (int)[(CUSystemMonitor *)self->_callMonitor activeCallCount] > 0)
      {
        unsigned int v82 = 1;
      }
      else
      {
        unsigned int v82 = [(NSString *)self->_cdDeviceIdentifier isEqualToString:v14];
      }
      v109[0] = @"tipiHealingAck";
      uint64_t v48 = [(BTSmartRoutingDaemon *)self _myBluetoothAddressString];
      int v49 = (void *)v48;
      CFStringRef v50 = &stru_10023D730;
      if (v48) {
        CFStringRef v50 = (const __CFString *)v48;
      }
      myModel = self->_myModel;
      v110[0] = v50;
      v110[1] = myModel;
      v109[1] = @"tipiHealingName";
      v109[2] = @"version";
      v109[3] = @"tipiHealingStreaming";
      CFStringRef v52 = @"NO";
      if (v82) {
        CFStringRef v52 = @"YES";
      }
      v110[2] = &off_100244058;
      v110[3] = v52;
      unsigned int v53 = +[NSDictionary dictionaryWithObjects:v110 forKeys:v109 count:4];

      [(BTSmartRoutingDaemon *)self _relayConduitMessageSend:1 withOptions:v53 andWxAddress:v14 andOtherAddress:0];
      self->_tipiElectionInProgress = 0;
      uint64_t v54 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v14];
      uint64_t v55 = [v54 otherTipiDeviceBTAddress];

      [(BTSmartRoutingDaemon *)self _updateNearbyDeviceState:v14 withAddress:v55 withEasyPairing:0 withState:1];
      uint64_t v99 = 0;
      unsigned int v100 = &v99;
      uint64_t v101 = 0x2020000000;
      char v102 = 0;
      unsigned __int8 v56 = self->_smartRoutingWxDeviceMap;
      v94[0] = _NSConcreteStackBlock;
      v94[1] = 3221225472;
      v94[2] = sub_10003A510;
      v94[3] = &unk_1002339C0;
      id v95 = v14;
      unsigned int v96 = self;
      unint64_t v97 = &v99;
      char v98 = v82;
      [(NSMutableDictionary *)v56 enumerateKeysAndObjectsUsingBlock:v94];
      if (*((unsigned char *)v100 + 24)) {
        [(BTSmartRoutingDaemon *)self _postNotification:"com.apple.BluetoothServices.AudioRoutingChanged"];
      }

      _Block_object_dispose(&v99, 8);
      goto LABEL_47;
    }
    uint64_t v41 = [v89 objectForKey:@"tipiHealingAck"];
    if (!v41
      || (-[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v14), v42 = objc_claimAutoreleasedReturnValue(), unsigned __int8 v43 = [v42 isTipiHealingV2Eligible], v42, v41, (v43 & 1) != 0))
    {
      id v44 = [v89 objectForKey:@"nearbyAudioScore"];
      BOOL v45 = v44 == 0;

      if (v45)
      {
        id v59 = [v89 objectForKey:@"otherDeviceAudioCategory"];
        BOOL v60 = v59 == 0;

        if (v60)
        {
          id v61 = [v89 objectForKey:@"disableSmartRouting"];
          BOOL v62 = v61 == 0;

          if (!v62)
          {
            if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            [(BTSmartRoutingDaemon *)self _disconnectOtherTipiDevice:v14];
          }
        }
        else
        {
          [(BTSmartRoutingDaemon *)self _receivedAudioCategory:v14 withOptions:v89];
        }
      }
      else
      {
        [(BTSmartRoutingDaemon *)self _otherTipiDeviceTipiScoreChanged:v14 withOptions:v89];
      }
      goto LABEL_47;
    }
    int v57 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v14];
    CFStringGetTypeID();
    id v58 = CFDictionaryGetTypedValue();
    CFStringGetTypeID();
    v86 = CFDictionaryGetTypedValue();
    uint64_t v88 = NSDictionaryGetNSNumber();
    [v57 _setOtherTipiDeviceInfo:v58 andName:v86 andVersion:v88];
    CFStringGetTypeID();
    int v84 = CFDictionaryGetTypedValue();
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      BOOL v78 = v84;
      LogPrintF();
    }
    [v57 _setRoutingInitialized:1 v78];
    id v63 = [(NSMutableDictionary *)self->_smartRoutingWxStatsMap objectForKeyedSubscript:v14];

    if (v63)
    {
      mach_absolute_time();
      int v64 = [(NSMutableDictionary *)self->_smartRoutingWxStatsMap objectForKeyedSubscript:v14];
      [v64 thV2Ticks];
      UpTicksToSecondsF();
      double v66 = v65;

      [(BTSmartRoutingDaemon *)self _submitMetricTipiHealingforDevice:v57 withDuration:1 andLegacy:v66];
    }
    self->_tipiElectionInProgress = 0;
    [(BTSmartRoutingDaemon *)self _updateNearbyDeviceState:v14 withAddress:v58 withEasyPairing:0 withState:1];
    tipiHealingTimer = self->_tipiHealingTimer;
    if (tipiHealingTimer)
    {
      unint64_t v68 = tipiHealingTimer;
      dispatch_source_cancel(v68);
      BOOL v69 = self->_tipiHealingTimer;
      self->_tipiHealingTimer = 0;
    }
    uint64_t v99 = 0;
    unsigned int v100 = &v99;
    uint64_t v101 = 0x2020000000;
    char v102 = 0;
    uint64_t v70 = [v57 otherTipiDeviceVersion];
    [v70 doubleValue];
    if (v71 < 1.2)
    {
    }
    else
    {
      unsigned int v72 = [v57 otherTipiDeviceVersion];
      BOOL v73 = v72 == 0;

      if (!v73)
      {
        if ([(BTSmartRoutingDaemon *)self _isManualConnection:v14]
          && ([v57 ignoreManualConnect] & 1) == 0)
        {
          if (dword_1002610B8 <= 40 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          uint64_t v75 = 1;
          [v57 _setRoutingAction:1];
        }
        else
        {
          if (dword_1002610B8 <= 40 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          [v57 _setRoutingAction:3];
          uint64_t v75 = 0;
        }
        [(BTSmartRoutingDaemon *)self _setOwnership:v14 withHijackRequest:0 withOwnership:v75];
        *((unsigned char *)v100 + 24) = 1;
LABEL_122:
        [(BTSmartRoutingDaemon *)self _postNotification:"com.apple.BluetoothServices.AudioRoutingChanged"];
LABEL_123:
        _Block_object_dispose(&v99, 8);

        goto LABEL_47;
      }
    }
    if (dword_1002610B8 <= 40 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    int v74 = self->_smartRoutingWxDeviceMap;
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472;
    v90[2] = sub_10003A80C;
    v90[3] = &unk_1002339E8;
    id v91 = v14;
    BOOL v92 = self;
    unsigned int v93 = &v99;
    [(NSMutableDictionary *)v74 enumerateKeysAndObjectsUsingBlock:v90];

    if (!*((unsigned char *)v100 + 24)) {
      goto LABEL_123;
    }
    goto LABEL_122;
  }
  if (dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    goto LABEL_18;
  }
LABEL_55:
}

- (BOOL)_shouldDelayRouteToSpeaker:(id)a3
{
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  id v5 = a3;
  dispatch_source_t v6 = [(NSMutableDictionary *)smartRoutingWxDeviceMap objectForKeyedSubscript:v5];
  int v7 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v5];

  if (dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    id v8 = [v6 audioRoutingScore];
    id v9 = [v6 otherTipiAudioCategory];
    unsigned int v10 = [v7 audioStreamState];
    if (v10 > 3) {
      id v11 = "?";
    }
    else {
      id v11 = off_100234420[v10];
    }
    id v15 = v9;
    BOOL v16 = v11;
    id v14 = v8;
    LogPrintF();
  }
  BOOL v12 = objc_msgSend(v6, "audioRoutingScore", v14, v15, v16) == 201
     && [v6 otherTipiAudioCategory] != 501
     && ([v6 otherTipiAudioCategory]
      || [v7 audioStreamState] != 3);

  return v12;
}

- (void)_updateAccessoryID:(id)a3 connectionDeviceAddresses:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self->_smartRoutingController;
  if (!v9)
  {
    id v9 = (CBController *)objc_alloc_init((Class)CBController);
    objc_storeStrong((id *)&self->_smartRoutingController, v9);
    [(CBController *)v9 setDispatchQueue:self->_dispatchQueue];
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003AC6C;
  v10[3] = &unk_100232738;
  v10[4] = self;
  [(CBController *)v9 modifyDevice:v7 connectionPriorityDevices:v8 timeoutSeconds:v10 completionHandler:4.0];
}

- (void)_updateNearbyDeviceState:(id)a3 withAddress:(id)a4 withEasyPairing:(BOOL)a5 withState:(int)a6
{
  BOOL v7 = a5;
  id v19 = a3;
  unsigned int v10 = (__CFString *)a4;
  id v11 = v10;
  if (a6 == 3)
  {

    id v11 = @"FF:FF:FF:FF:FF:FF";
  }
  if (v19 && v11)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      if (a6 > 3) {
        BOOL v12 = "?";
      }
      else {
        BOOL v12 = off_100233F80[a6];
      }
      id v17 = v19;
      id v18 = v11;
      BOOL v16 = v12;
      LogPrintF();
    }
    id v13 = objc_alloc_init((Class)CBDevice);
    [v13 setIdentifier:v19];
    id v14 = objc_alloc_init((Class)CBDevice);
    [v14 setIdentifier:v11];
    if (v7) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = 16;
    }
    -[CBController modifyDevice:peerSourceDevice:peerSourceState:requestFlags:completionHandler:](self->_smartRoutingController, "modifyDevice:peerSourceDevice:peerSourceState:requestFlags:completionHandler:", v13, v14, (char)a6, v15, &stru_100233A08, v16, v17, v18);
  }
  else if (dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_systemUIMonitorEnsureStarted
{
  if (!self->_systemUIMonitor)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100002C70;
    v6[3] = &unk_100233A30;
    void v6[4] = self;
    [v3 setTransitionHandler:v6];
    dispatch_time_t v4 = +[FBSDisplayLayoutMonitor monitorWithConfiguration:v3];
    systemUIMonitor = self->_systemUIMonitor;
    self->_systemUIMonitor = v4;
  }
}

- (void)_systemUIMonitorEnsureStopped
{
  if (self->_systemUIMonitor)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(FBSDisplayLayoutMonitor *)self->_systemUIMonitor invalidate];
    systemUIMonitor = self->_systemUIMonitor;
    self->_systemUIMonitor = 0;
  }
}

- (void)_wxDiscoveryEnsureStarted
{
  wxDiscovery = self->_wxDiscovery;
  if (wxDiscovery)
  {
    if (self->_prefSmartRoutingEnabledPhase3)
    {
      BOOL v4 = GestaltGetDeviceClass() != 6;
      if (v4 == [(SFDeviceDiscovery *)self->_wxDiscovery overrideScreenOff]) {
        return;
      }
    }
    else
    {
      if (([(SFDeviceDiscovery *)wxDiscovery overrideScreenOff] & 1) == 0) {
        return;
      }
      BOOL v4 = 0;
    }
    id v5 = self->_wxDiscovery;
    [(SFDeviceDiscovery *)v5 setOverrideScreenOff:v4];
  }
  else
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v6 = objc_alloc_init((Class)SFDeviceDiscovery);
    [v6 setChangeFlags:9];
    [v6 setDiscoveryFlags:2];
    [v6 setDispatchQueue:self->_dispatchQueue];
    [v6 setPurpose:@"SmartRouting"];
    [v6 setScanRate:20];
    if (self->_prefSmartRoutingEnabledPhase3) {
      [v6 setOverrideScreenOff:1];
    }
    BOOL v7 = self->_wxDiscovery;
    self->_wxDiscovery = (SFDeviceDiscovery *)v6;
    id v8 = v6;

    [(BTSmartRoutingDaemon *)self _powerLogSmartRoutingScanStarted:7];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10003B608;
    v13[3] = &unk_100233888;
    v13[4] = self;
    v13[5] = v8;
    [v8 setDeviceFoundHandler:v13];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003B684;
    v12[3] = &unk_100233888;
    v12[4] = self;
    v12[5] = v8;
    [v8 setDeviceLostHandler:v12];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003B700;
    v11[3] = &unk_1002338B0;
    void v11[4] = self;
    v11[5] = v8;
    [v8 setDeviceChangedHandler:v11];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10003B77C;
    v10[3] = &unk_100232A10;
    v10[4] = self;
    void v10[5] = v8;
    [v8 setInvalidationHandler:v10];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003B798;
    v9[3] = &unk_100232A38;
    v9[4] = self;
    void v9[5] = v8;
    [v8 activateWithCompletion:v9];
  }
}

- (void)_wxDiscoveryEnsureStopped
{
  if (self->_wxDiscovery)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(BTSmartRoutingDaemon *)self _powerLogSmartRoutingScanStopped:7];
    [(SFDeviceDiscovery *)self->_wxDiscovery invalidate];
    wxDiscovery = self->_wxDiscovery;
    self->_wxDiscovery = 0;

    wxDevices = self->_wxDevices;
    if (wxDevices)
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v5 = [(NSMutableDictionary *)wxDevices allValues];
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v13;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(v5);
            }
            [(BTSmartRoutingDaemon *)self _wxDeviceLost:*(void *)(*((void *)&v12 + 1) + 8 * i)];
          }
          id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v7);
      }

      unsigned int v10 = self->_wxDevices;
      self->_wxDevices = 0;
    }
    [(NSMutableDictionary *)self->_lowBatteryWxDevices removeAllObjects];
    lowBatteryWxDevices = self->_lowBatteryWxDevices;
    self->_lowBatteryWxDevices = 0;
  }
}

- (void)_wxDeviceFound:(id)a3
{
  id v135 = a3;
  BOOL v4 = [v135 identifier];
  id v5 = [v4 UUIDString];

  if (v5)
  {
    if (!self->_wxDevices)
    {
      id v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      wxDevices = self->_wxDevices;
      self->_wxDevices = v6;
    }
    uint64_t v8 = [v135 bleDevice];
    id v9 = [v8 advertisementFields];
    if (!CFDictionaryGetInt64()) {
      goto LABEL_171;
    }
    uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
    uint64_t v125 = CFDictionaryGetInt64Ranged();
    unsigned int v10 = CFDictionaryGetCFDataOfLength();
    uint64_t v129 = v10;
    uint64_t v130 = v8;
    if (v10)
    {
      id v108 = [v10 bytes];
      NSPrintF();
      id v11 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = 0;
    }
    uint64_t v127 = CFDictionaryGetInt64Ranged();
    unsigned int v124 = CFDictionaryGetInt64Ranged();
    v131 = CFDictionaryGetCFDataOfLength();
    char v12 = CFDictionaryGetInt64Ranged();
    char v13 = CFDictionaryGetInt64Ranged();
    unsigned __int8 v14 = CFDictionaryGetInt64Ranged();
    char v15 = CFDictionaryGetInt64Ranged();
    uint64_t Int64 = CFDictionaryGetInt64();
    if (dword_1002610B8 <= 30)
    {
      uint64_t v17 = Int64;
      if (dword_1002610B8 != -1 || _LogCategory_Initialize())
      {
        id v18 = [v135 bleDevice:v108];
        CFStringRef v19 = @"Primary";
        if ((Int64Ranged & 0x100) == 0) {
          CFStringRef v19 = @"Secondary";
        }
        CFStringRef v20 = @"Right";
        if ((Int64Ranged & 0x80) != 0) {
          CFStringRef v20 = @"Left";
        }
        if (v124 >> 2) {
          BOOL v21 = "?";
        }
        else {
          BOOL v21 = off_100234250[v124];
        }
        if ((v12 & 0xF0) != 0) {
          long long v22 = "?";
        }
        else {
          long long v22 = off_1002342D0[v12];
        }
        if ((v13 & 0xF0) != 0) {
          BOOL v23 = "?";
        }
        else {
          BOOL v23 = off_1002342D0[v13];
        }
        if ((v15 & 0xFC) != 0) {
          uint64_t v24 = "?";
        }
        else {
          uint64_t v24 = off_100233FA0[v15];
        }
        CFStringRef v25 = @"YES";
        if (!v17) {
          CFStringRef v25 = @"NO";
        }
        int v119 = v23;
        uint64_t v120 = v14;
        id v118 = v22;
        int v116 = v21;
        int v117 = v131;
        CFStringRef v114 = v20;
        uint64_t v115 = v127;
        CFStringRef v112 = v19;
        id v108 = v18;
        uint64_t v110 = Int64Ranged;
        double v121 = v24;
        CFStringRef v122 = v25;
        LogPrintF();
      }
    }
    if ((Int64Ranged & 0x24) != 0) {
      unsigned int v26 = 1;
    }
    else {
      unsigned int v26 = [(BTSmartRoutingDaemon *)self _bluetoothProductIDNoEarDetect:v125];
    }
    uint64_t v27 = -[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyWxDeviceMap, "objectForKeyedSubscript:", v5, v108, v110, v112, v114, v115, v116, v117, v118, v119, v120, v121, v122);
    unsigned int v28 = [v27 isInEar];

    [(BTSmartRoutingDaemon *)self _nearbyWxChanged:v135];
    [(BTSmartRoutingDaemon *)self _updateSRDiscoveredDeviceForNearbyWxChanged:v135 isNearby:1];
    if (v11)
    {
      uint64_t v29 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v11];

      if (v29)
      {
        [(BTSmartRoutingDaemon *)self _lowestBatteryInfoForSFDevice:v135];
        double v31 = v30;
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
        {
          double v111 = v31;
          int v109 = v11;
          LogPrintF();
        }
        id v32 = -[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v11, v109, *(void *)&v111);
        [v32 setLowestBudBatteryInfo:v31];
      }
    }
    int v33 = [(NSMutableDictionary *)self->_wxDevices objectForKeyedSubscript:v5];
    char v34 = v33;
    if (!v11 || !v33)
    {

      if (!v11) {
        goto LABEL_66;
      }
      goto LABEL_56;
    }
    uint64_t v35 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v11];
    if (v35)
    {
      uint64_t v36 = (void *)v35;
      unsigned __int8 v37 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v11];
      id v38 = v37;
      if (v37 && v127 == 1)
      {
        [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v11];
        int v39 = v9;
        BOOL v40 = v11;
        uint64_t v41 = v5;
        unsigned int v42 = v26;
        v44 = unsigned int v43 = v28;
        unsigned int v123 = [v44 tipiHealingBackoff];

        unsigned int v28 = v43;
        unsigned int v26 = v42;
        id v5 = v41;
        id v11 = v40;
        id v9 = v39;

        if (!v123) {
          goto LABEL_56;
        }
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        char v34 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v11];
        [v34 setTipiHealingBackoff:0];
      }
      else
      {
      }
    }

LABEL_56:
    uint64_t v45 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v11];
    if (v45)
    {
      unsigned __int8 v46 = (void *)v45;
      id v47 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v11];
      if ([v47 hijackBackoffTicks])
      {
        BOOL hijackBackOffInitiator = self->_hijackBackOffInitiator;

        if (!hijackBackOffInitiator && v127 <= 1)
        {
          if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          [(BTSmartRoutingDaemon *)self _hijackBackoffReset:v11 withReason:@"wxtipiGone"];
        }
      }
      else
      {
      }
    }
LABEL_66:
    if ((Int64Ranged & 1) == 0
      && ![(BTSmartRoutingDaemon *)self _bluetoothProductIDNoUTP:v125])
    {
      int v51 = [(NSMutableDictionary *)self->_wxDevices objectForKeyedSubscript:v5];

      if (v51)
      {
        unsigned int v52 = v28;
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        id v59 = [(NSMutableDictionary *)self->_wxDevices objectForKeyedSubscript:v5];
        BOOL v60 = [v59 bleDevice];
        id v61 = [v60 advertisementFields];
        __int16 v62 = CFDictionaryGetInt64Ranged();

        if ((v62 & 0x100) != 0 && (Int64Ranged & 0x100) == 0)
        {
          if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }

          goto LABEL_170;
        }
        [(NSMutableDictionary *)self->_wxDevices setObject:v135 forKeyedSubscript:v5];

        unsigned int v28 = v52;
      }
      else
      {
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [(NSMutableDictionary *)self->_wxDevices setObject:v135 forKeyedSubscript:v5];
        [(CUCoalescer *)self->_evaluatorCoalescer trigger];
      }
LABEL_149:
      uint64_t v82 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v11];
      if (v82)
      {
        v83 = (void *)v82;
        int v84 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v11];
        v85 = [v84 deviceName];

        if (!v85)
        {
          v134 = +[CloudXPCService sharedInstance];
          v86 = [v134 deviceManager];
          unsigned int v87 = [v86 fetchDeviceSyncWithAddress:v11];
          [v87 nickname];
          uint64_t v88 = v9;
          v89 = v5;
          unsigned int v90 = v26;
          BOOL v92 = v91 = v28;
          unsigned int v93 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v11];
          [v93 setDeviceName:v92];

          unsigned int v28 = v91;
          unsigned int v26 = v90;
          id v5 = v89;
          id v9 = v88;
        }
      }
      if (self->_prefSmartRoutingPreemptiveConnectedBanner)
      {
        v94 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v11];

        int v95 = v94 ? v28 ^ 1 : 0;
        if ((v95 & v26) == 1)
        {
          unsigned int v96 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v5];
          if ([v96 preemptiveBannerShown])
          {
          }
          else
          {
            unint64_t v97 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v5];
            unsigned __int8 v98 = [v97 firstPreemptiveBannerShown];

            if ((v98 & 1) == 0)
            {
              uint64_t v99 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v5];
              id v100 = [v99 preemptiveBannerShown];
              uint64_t v101 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v5];
              LODWORD(v100) = -[BTSmartRoutingDaemon _isEligibleForPreemptiveBanner:firstPreemptiveBanner:inEarState:srDeviceCount:audioState:inAddress:](self, "_isEligibleForPreemptiveBanner:firstPreemptiveBanner:inEarState:srDeviceCount:audioState:inAddress:", v100, [v101 firstPreemptiveBannerShown], 1, -[NSMutableDictionary count](self->_smartRoutingWxDeviceMap, "count"), (int)v124, v11);

              if (v100)
              {
                char v102 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v11];
                unsigned int v103 = [v102 deviceName];
                if (v11) {
                  CFStringRef v104 = v11;
                }
                else {
                  CFStringRef v104 = @"?";
                }
                int v105 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v11];
                -[BTSmartRoutingDaemon _smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:](self, "_smartRoutingShowBanner:withDevice:andDeviceAddress:andProductID:andCentralContentItemTxt:andTimeout:andDeviceType:", 1, v103, v104, [v105 productID], @"Connected", 0, 4.0);

                id v106 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v5];
                [v106 setPreemptiveBannerShown:1];

                [(SmartRoutingStats *)self->_stats setLocalAudioScore:self->_localDeviceAudioCatogory];
                double v107 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v5];
                [v107 setFirstPreemptiveBannerShown:1];

                if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
                  LogPrintF();
                }
                self->_preemptiveBannerShownTicks = mach_absolute_time();
                self->_preemptiveBannerConnectionInProgress = 1;
                [(BTSmartRoutingDaemon *)self _postNotification:"com.apple.BluetoothServices.PreemptivePortChanged"];
              }
            }
          }
        }
      }
      [(BTSmartRoutingDaemon *)self _evaluatorRunInUseBanner:v11];
      [(BTSmartRoutingDaemon *)self _startAudioStateSnapshotTimer];
LABEL_170:

      uint64_t v8 = v130;
LABEL_171:

      goto LABEL_172;
    }
    int v49 = [(NSMutableDictionary *)self->_wxDevices objectForKeyedSubscript:v5];

    if (!v49)
    {
LABEL_143:
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_wxDevices, "setObject:forKeyedSubscript:", v135, v5, v109, *(void *)&v111, v113);
      [(CUCoalescer *)self->_evaluatorCoalescer trigger];
      if (v11)
      {
        uint64_t v77 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v11];
        if (v77)
        {
          BOOL v78 = (void *)v77;
          id v79 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v11];
          id v80 = [v79 otherTipiDeviceBTAddress];
          if (v80)
          {
          }
          else
          {
            BOOL tipiElectionInProgress = self->_tipiElectionInProgress;

            if (!tipiElectionInProgress) {
              [(BTSmartRoutingDaemon *)self _tipiHealingAttempt];
            }
          }
        }
      }
      goto LABEL_149;
    }
    unsigned int v50 = v26;
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      int v109 = (void *)Int64Ranged;
      LogPrintF();
    }
    unsigned int v53 = -[NSMutableDictionary objectForKeyedSubscript:](self->_wxDevices, "objectForKeyedSubscript:", v5, v109);
    if (!v11) {
      goto LABEL_142;
    }
    uint64_t v54 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v11];
    if (!v54) {
      goto LABEL_142;
    }
    uint64_t v55 = (void *)v54;
    unsigned __int8 v56 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v11];
    int v57 = [v56 otherTipiDeviceBTAddress];

    if (!v57) {
      goto LABEL_142;
    }
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      id v58 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v11];
      int v109 = [v58 otherTipiDeviceBTAddress];
      LogPrintF();
    }
    id v63 = [v53 bleDevice:v109];
    int v64 = [v63 advertisementFields];
    unsigned __int16 v65 = CFDictionaryGetInt64Ranged();

    if (((v65 ^ (unsigned __int16)Int64Ranged) & 0x100) != 0)
    {
      if (((v65 ^ Int64Ranged) & 0x80) != 0) {
        goto LABEL_121;
      }
      if (dword_1002610B8 > 30) {
        goto LABEL_118;
      }
      if (dword_1002610B8 != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      if (dword_1002610B8 > 30 || dword_1002610B8 == -1 && !_LogCategory_Initialize())
      {
LABEL_118:
        budSwapAddress = self->_budSwapAddress;
        self->_hfpBudswapDetected = 1;
        if (!budSwapAddress)
        {
          unsigned int v67 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v11];

          if (!v67)
          {
            unint64_t v68 = objc_alloc_init(BTSmartRoutingBudswapDevice);
            [(BTSmartRoutingBudswapDevice *)v68 setReconnectionState:0];
            [(NSMutableDictionary *)self->_srBudswapDeviceMap setObject:v68 forKeyedSubscript:v11];
            objc_storeStrong((id *)&self->_budSwapAddress, v11);
            [(BTSmartRoutingDaemon *)self _budSwapDetectionStartTimer:v11];
          }
        }
LABEL_121:
        if (self->_tipiSetupTicks)
        {
          mach_absolute_time();
          unint64_t v69 = UpTicksToMilliseconds();
          if (v127 == 1)
          {
            unint64_t v70 = v69;
            if (v69 > 0x2710 || !self->_tipiSetupTicks) {
              goto LABEL_128;
            }
          }
        }
        else if (v127 == 1)
        {
          unint64_t v70 = 0;
LABEL_128:
          unsigned int v133 = v28;
          double v71 = CFDictionaryGetCFDataOfLength();
          if (v71)
          {
            id v72 = [(BTSmartRoutingDaemon *)self _myBluetoothAddressString];
            [v72 UTF8String];
            BOOL v73 = NSDataWithHex();
            if ([v73 length] == (id)6)
            {
              id v128 = v72;
              id v74 = v73;
              CFStringRef v126 = (char *)[v74 bytes];
              if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
              {
                double v111 = *(double *)&v74;
                unint64_t v113 = v70;
                int v109 = v71;
                LogPrintF();
              }
              uint64_t v75 = (unsigned __int16 *)[v71 bytes];
              id v72 = v128;
              if (*v75 == *(unsigned __int16 *)(v126 + 3) && *((unsigned __int8 *)v75 + 2) == v126[5]) {
                [(BTSmartRoutingDaemon *)self _removeTiPiState:v11];
              }
            }
          }
          self->_tipiSetupTicks = 0;

          unsigned int v28 = v133;
        }
LABEL_142:

        unsigned int v26 = v50;
        goto LABEL_143;
      }
    }
    else
    {
      if (((v65 ^ Int64Ranged) & 0x80) == 0) {
        goto LABEL_121;
      }
      if (dword_1002610B8 > 30) {
        goto LABEL_118;
      }
      if (dword_1002610B8 != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      if (dword_1002610B8 > 30 || dword_1002610B8 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_118;
      }
      int v109 = v11;
    }
    LogPrintF();
    goto LABEL_118;
  }
LABEL_172:
}

- (void)_wxDeviceLost:(id)a3
{
  id v15 = a3;
  BOOL v4 = [v15 identifier];
  id v5 = [v4 UUIDString];

  if (v5)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      id v6 = [v15 bleDevice];
      uint64_t v7 = [v6 name];
      uint64_t v8 = (void *)v7;
      CFStringRef v9 = &stru_10023D730;
      if (v7) {
        CFStringRef v9 = (const __CFString *)v7;
      }
      char v13 = v5;
      CFStringRef v14 = v9;
      LogPrintF();
    }
    unsigned int v10 = [v15 bleDevice:v13, v14];
    id v11 = [v10 advertisementFields];
    uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();

    if (![(NSMutableDictionary *)self->_wxDevices count]) {
      [(BTSmartRoutingDaemon *)self _submitMetricNearby:Int64Ranged];
    }
    [(NSMutableDictionary *)self->_wxDevices setObject:0 forKeyedSubscript:v5];
    [(NSMutableDictionary *)self->_nearbyWxDeviceMap setObject:0 forKeyedSubscript:v5];
    [(BTSmartRoutingDaemon *)self _updateSRDiscoveredDeviceForNearbyWxChanged:v15 isNearby:0];
    [(BTSmartRoutingDaemon *)self _stopAudioStateSnapshotTimer:0];
    [(CUCoalescer *)self->_evaluatorCoalescer trigger];
  }
}

- (void)_wxDiscoveryWatchRecoveryEnsureStarted
{
  if (!self->_wxDiscoveryWatchRecovery)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(BTSmartRoutingDaemon *)self _powerLogSmartRoutingScanStarted:7];
    id v3 = (CUBLEScanner *)objc_alloc_init((Class)CUBLEScanner);
    wxDiscoveryWatchRecovery = self->_wxDiscoveryWatchRecovery;
    self->_wxDiscoveryWatchRecovery = v3;
    id v5 = v3;

    [(CUBLEScanner *)v5 setChangeFlags:16];
    [(CUBLEScanner *)v5 setScanFlags:16];
    [(CUBLEScanner *)v5 setDispatchQueue:self->_dispatchQueue];
    [(CUBLEScanner *)v5 setLabel:@"SmartRouting"];
    [(CUBLEScanner *)v5 setScanRate:50];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10003CEC0;
    v8[3] = &unk_100233A58;
    v8[4] = self;
    [(CUBLEScanner *)v5 setDeviceFoundHandler:v8];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10003CECC;
    v7[3] = &unk_100233A58;
    v7[4] = self;
    [(CUBLEScanner *)v5 setDeviceLostHandler:v7];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10003CED8;
    v6[3] = &unk_100232A10;
    void v6[4] = v5;
    void v6[5] = self;
    [(CUBLEScanner *)v5 setInvalidationHandler:v6];
    [(CUBLEScanner *)v5 activate];
  }
}

- (void)_wxDiscoveryWatchRecoveryEnsureStopped
{
  if (self->_wxDiscoveryWatchRecovery)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(BTSmartRoutingDaemon *)self _powerLogSmartRoutingScanStopped:7];
    [(CUBLEScanner *)self->_wxDiscoveryWatchRecovery invalidate];
    wxDiscoveryWatchRecovery = self->_wxDiscoveryWatchRecovery;
    self->_wxDiscoveryWatchRecovery = 0;

    watchWxDevices = self->_watchWxDevices;
    if (watchWxDevices)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v5 = [(NSMutableDictionary *)watchWxDevices allValues];
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v12;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(v5);
            }
            [(BTSmartRoutingDaemon *)self _wxDiscoveryWatchRecoveryLostDevice:*(void *)(*((void *)&v11 + 1) + 8 * i)];
          }
          id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v7);
      }

      unsigned int v10 = self->_watchWxDevices;
      self->_watchWxDevices = 0;
    }
  }
}

- (void)_wxDiscoveryWatchRecoveryFoundDevice:(id)a3
{
  id v18 = a3;
  BOOL v4 = [v18 identifier];
  if (v4)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      id v16 = v18;
      LogPrintF();
    }
    watchWxDevices = self->_watchWxDevices;
    if (!watchWxDevices)
    {
      id v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      id v7 = self->_watchWxDevices;
      self->_watchWxDevices = v6;

      watchWxDevices = self->_watchWxDevices;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](watchWxDevices, "setObject:forKeyedSubscript:", v18, v4, v16);
    [(CUCoalescer *)self->_evaluatorCoalescer trigger];
    uint64_t v8 = [v18 addressData];
    CFStringRef v9 = v8;
    if (v8)
    {
      id v17 = [v8 bytes];
      unsigned int v10 = NSPrintF();
      if (v10)
      {
        uint64_t v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:", v10, v17);
        if (v11)
        {
          long long v12 = (void *)v11;
          long long v13 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v10];
          long long v14 = [v13 otherTipiDeviceBTAddress];
          if (v14)
          {
          }
          else
          {
            BOOL tipiElectionInProgress = self->_tipiElectionInProgress;

            if (!tipiElectionInProgress) {
              [(BTSmartRoutingDaemon *)self _tipiHealingAttempt];
            }
          }
        }
      }
    }
    else
    {
      unsigned int v10 = 0;
    }
    if ([(NSMutableDictionary *)self->_watchWxDevices count] == (id)1) {
      [(BTSmartRoutingDaemon *)self _update];
    }
  }
}

- (void)_wxDiscoveryWatchRecoveryLostDevice:(id)a3
{
  id v6 = a3;
  BOOL v4 = [v6 identifier];
  if (v4)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      id v5 = v6;
      LogPrintF();
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_watchWxDevices, "setObject:forKeyedSubscript:", 0, v4, v5);
    [(CUCoalescer *)self->_evaluatorCoalescer trigger];
  }
}

- (void)_setConnectedBannerTick:(unint64_t)a3
{
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_showBannerConnectedLastTicks = a3;
}

- (BOOL)_isInHijackBlockingMode
{
  if (self->_splitterStateOn || self->_hijackBackOffInitiator) {
    return 1;
  }
  BOOL v4 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice hijackBlockingClientSet];
  BOOL v2 = [v4 count] != 0;

  return v2;
}

- (void)getLocalAudioInfofromSnapshot:(int *)a3 appCount:(int *)a4 playingApp:(id *)a5 route:(id *)a6 remote:(int *)a7
{
  long long v13 = [(SmartRoutingStats *)self->_stats snapshotLocalDeviceAudioScore];
  if (v13)
  {
    long long v14 = [(SmartRoutingStats *)self->_stats snapshotLocalDeviceAudioScore];
    *a3 = [v14 intValue];
  }
  else
  {
    *a3 = -1;
  }

  id v15 = [(SmartRoutingStats *)self->_stats snapshotLocalNumOfApps];
  if (v15)
  {
    id v16 = [(SmartRoutingStats *)self->_stats snapshotLocalNumOfApps];
    *a4 = [v16 intValue];
  }
  else
  {
    *a4 = 0;
  }

  id v17 = [(SmartRoutingStats *)self->_stats snapshotLocalPlayingApp];
  if (v17)
  {
    id v18 = [(SmartRoutingStats *)self->_stats snapshotLocalPlayingApp];
    *a5 = v18;
  }
  else
  {
    *a5 = @"NA";
  }

  CFStringRef v19 = [(SmartRoutingStats *)self->_stats snapshotLocalRoute];
  if (v19)
  {
    id v20 = [(SmartRoutingStats *)self->_stats snapshotLocalRoute];
    *a6 = v20;
  }
  else
  {
    *a6 = @"NA";
  }

  BOOL v21 = [(SmartRoutingStats *)self->_stats snapshotRemoteDeviceAudioScore];
  if (v21)
  {
    BOOL v23 = v21;
    long long v22 = [(SmartRoutingStats *)self->_stats snapshotRemoteDeviceAudioScore];
    *a7 = [v22 intValue];

    BOOL v21 = v23;
  }
  else
  {
    *a7 = -1;
  }
}

- (void)getHijackAudioInfo:(int *)a3 appCount:(int *)a4 playingApp:(id *)a5 route:(id *)a6 remote:(int *)a7
{
  long long v13 = [(SmartRoutingStats *)self->_stats snapshotLocalNumOfApps];
  if (v13)
  {
    long long v14 = [(SmartRoutingStats *)self->_stats snapshotLocalNumOfApps];
    *a4 = [v14 intValue];
  }
  else
  {
    *a4 = 0;
  }

  *a3 = [(SmartRoutingStats *)self->_stats hijackScore];
  unsigned int v15 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice audioRoute];
  if (v15 > 4) {
    id v16 = "?";
  }
  else {
    id v16 = off_100234440[v15];
  }
  id v17 = +[NSString stringWithUTF8String:v16];
  *a6 = +[NSString stringWithFormat:@"%@", v17];

  id v18 = [(SmartRoutingStats *)self->_stats hijackPlayingApp];
  if (v18)
  {
    id v19 = [(SmartRoutingStats *)self->_stats hijackPlayingApp];
    *a5 = v19;
  }
  else
  {
    *a5 = @"NA";
  }

  *a7 = [(SmartRoutingStats *)self->_stats hijackActiveRemoteScore];
  [(SmartRoutingStats *)self->_stats setManualRouteDestination:@"NA"];
  [(SmartRoutingStats *)self->_stats setManualRouteInputOutput:@"NA"];
  stats = self->_stats;

  [(SmartRoutingStats *)stats setManualRouteUISource:@"NA"];
}

- (void)getHijackedAwayAudioInfo:(int *)a3 appCount:(int *)a4 playingApp:(id *)a5 route:(id *)a6 remote:(int *)a7
{
  long long v13 = [(SmartRoutingStats *)self->_stats snapshotLocalNumOfApps];
  if (v13)
  {
    long long v14 = [(SmartRoutingStats *)self->_stats snapshotLocalNumOfApps];
    *a4 = [v14 intValue];
  }
  else
  {
    *a4 = 0;
  }

  *a3 = [(SmartRoutingStats *)self->_stats hijackAwayLocalScore];
  unsigned int v15 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice audioRoute];
  if (v15 > 4) {
    id v16 = "?";
  }
  else {
    id v16 = off_100234440[v15];
  }
  id v17 = +[NSString stringWithUTF8String:v16];
  *a6 = +[NSString stringWithFormat:@"%@", v17];

  id v18 = [(SmartRoutingStats *)self->_stats snapshotLocalPlayingApp];
  if (v18)
  {
    id v19 = [(SmartRoutingStats *)self->_stats snapshotLocalPlayingApp];
    *a5 = v19;
  }
  else
  {
    *a5 = @"NA";
  }

  *a7 = [(SmartRoutingStats *)self->_stats hijackAwayRemoteScore];
  [(SmartRoutingStats *)self->_stats setManualRouteDestination:@"NA"];
  [(SmartRoutingStats *)self->_stats setManualRouteInputOutput:@"NA"];
  stats = self->_stats;

  [(SmartRoutingStats *)stats setManualRouteUISource:@"NA"];
}

- (void)_startHijackMetricSubmission:(int64_t)a3 wxAddress:(id)a4 version:(id)a5
{
  id v24 = a4;
  id v8 = a5;
  mach_absolute_time();
  [(SmartRoutingStats *)self->_stats hijackInputTick];
  unint64_t v9 = UpTicksToSeconds();
  mach_absolute_time();
  [(SmartRoutingStats *)self->_stats hijackAmbientTick];
  unint64_t v10 = UpTicksToSeconds();
  mach_absolute_time();
  [(SmartRoutingStats *)self->_stats hijackMediaTick];
  unint64_t v11 = UpTicksToSeconds();
  mach_absolute_time();
  [(SmartRoutingStats *)self->_stats hijackCallTick];
  unint64_t v12 = UpTicksToSeconds();
  mach_absolute_time();
  [(BTSmartRoutingSourceDevice *)self->_sourceDevice predictiveRouteTicks];
  unint64_t v13 = UpTicksToSeconds();
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    unint64_t v22 = v9;
    unint64_t v23 = v13;
    unint64_t v20 = v12;
    unint64_t v21 = v10;
    id v18 = v8;
    unint64_t v19 = v11;
    LogPrintF();
  }
  if (v13 >= 3)
  {
    if ([(SmartRoutingStats *)self->_stats hijackScore] == 200)
    {
      if (v9 < 3) {
        goto LABEL_27;
      }
      [(SmartRoutingStats *)self->_stats setHijackInputTick:mach_absolute_time()];
    }
    if ([(SmartRoutingStats *)self->_stats hijackScore] == 201)
    {
      if (v10 < 3) {
        goto LABEL_27;
      }
      [(SmartRoutingStats *)self->_stats setHijackAmbientTick:mach_absolute_time()];
    }
    else if ([(SmartRoutingStats *)self->_stats hijackScore] == 301)
    {
      if (v11 < 3) {
        goto LABEL_27;
      }
      [(SmartRoutingStats *)self->_stats setHijackMediaTick:mach_absolute_time()];
    }
    else if ([(SmartRoutingStats *)self->_stats hijackScore] == 501)
    {
      if (v12 < 3) {
        goto LABEL_27;
      }
      [(SmartRoutingStats *)self->_stats setHijackCallTick:mach_absolute_time()];
    }
    switch(a3)
    {
      case 1:
        long long v14 = [(SmartRoutingStats *)self->_stats reverseRouteReason];

        if (!v14) {
          [(SmartRoutingStats *)self->_stats setReverseRouteReason:@"Hijack"];
        }
        unsigned int v15 = "Accepted";
        CFStringRef v16 = @"Hijack_Accepted";
        break;
      case 2:
        unsigned int v15 = "Ambiguity";
        CFStringRef v16 = @"Hijack_Ambiguity";
        break;
      case 3:
        unsigned int v15 = "Rejected";
        CFStringRef v16 = @"Hijack_Rejected";
        break;
      case 4:
        unsigned int v15 = "Backoff";
        CFStringRef v16 = @"Hijack_Backoff";
        break;
      default:
        unsigned int v15 = "?";
        CFStringRef v16 = @"NA";
        break;
    }
    id v17 = +[NSString stringWithUTF8String:v15];
    [(SmartRoutingStats *)self->_stats setHijackAnswer:v17];

    [(SmartRoutingStats *)self->_stats setHijackVersion:@"V2"];
    -[BTSmartRoutingDaemon submitHijackMetric:withV1:](self, "submitHijackMetric:withV1:", v24, [v8 isEqualToString:@"V1"]);
    [(BTSmartRoutingDaemon *)self _startRouteChangeDetectionTimer:v24 andAnswer:a3];
    [(BTSmartRoutingDaemon *)self _startRouteCheckTimer:v24 andType:5];
    [(BTSmartRoutingDaemon *)self _startRouteCheckTimer:v24 andType:6];
    [(BTSmartRoutingDaemon *)self submitRouteActivityMetric:v24 activity:v16];
  }
LABEL_27:
}

- (void)_statsEnsureStarted
{
  if (!self->_stats)
  {
    id v3 = objc_alloc_init(SmartRoutingStats);
    stats = self->_stats;
    self->_stats = v3;
  }
  if (!self->_smartRoutingWxStatsMap)
  {
    id v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    smartRoutingWxStatsMap = self->_smartRoutingWxStatsMap;
    self->_smartRoutingWxStatsMap = v5;
  }
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_submitManualConnectionMetric:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t score = self->_score;
    if (score > 0xF) {
      id v6 = "?";
    }
    else {
      id v6 = off_1002342D0[score];
    }
    uint64_t v7 = +[NSString stringWithUTF8String:v6];
    uint64_t audioScoreOtherTipiDevice = self->_audioScoreOtherTipiDevice;
    if (audioScoreOtherTipiDevice > 0xF) {
      unint64_t v9 = "?";
    }
    else {
      unint64_t v9 = off_1002342D0[audioScoreOtherTipiDevice];
    }
    uint64_t v10 = +[NSString stringWithUTF8String:v9];
    unint64_t v11 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v4];
    unsigned int v12 = [v11 routingAction];
    if (v12 > 5) {
      unint64_t v13 = "?";
    }
    else {
      unint64_t v13 = off_100234488[v12];
    }
    id v58 = +[NSString stringWithUTF8String:v13];
    mach_absolute_time();
    long long v14 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v4];
    [v14 lastConnectionTicks];
    uint64_t v54 = UpTicksToMilliseconds();

    uint64_t v15 = [v11 otherTipiDeviceBTName];
    CFStringRef v16 = (void *)v15;
    id v17 = @"NA";
    if (v15) {
      id v17 = (__CFString *)v15;
    }
    int v57 = v17;

    uint64_t v18 = [(BTSmartRoutingDaemon *)self _getWxFWVersion:v4];
    unint64_t v19 = (void *)v18;
    if (v18) {
      unint64_t v20 = (__CFString *)v18;
    }
    else {
      unint64_t v20 = &stru_10023D730;
    }
    uint64_t v55 = v20;

    unsigned __int8 v56 = v11;
    if ([(BTSmartRoutingSourceDevice *)self->_sourceDevice evalTicks])
    {
      mach_absolute_time();
      [(BTSmartRoutingSourceDevice *)self->_sourceDevice evalTicks];
      uint64_t v21 = UpTicksToMilliseconds();
    }
    else
    {
      uint64_t v21 = -1;
    }
    unint64_t v22 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice evalWxMap];
    unint64_t v23 = [v22 objectForKeyedSubscript:v4];

    id v24 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice evalWxMap];
    CFStringRef v25 = [v24 objectForKeyedSubscript:v4];
    if ([v25 lastEvalTicks])
    {
      mach_absolute_time();
      [v23 lastEvalTicks];
      uint64_t v26 = UpTicksToMilliseconds();
    }
    else
    {
      uint64_t v26 = -1;
    }

    if ([v23 lastConnectTicks])
    {
      mach_absolute_time();
      [v23 lastConnectTicks];
      uint64_t v27 = UpTicksToSeconds();
    }
    else
    {
      uint64_t v27 = -1;
    }
    v60[0] = v7;
    v59[0] = @"audioScore";
    v59[1] = @"forceConnect";
    unsigned int v53 = +[NSNumber numberWithBool:self->_forcedConnection];
    v60[1] = v53;
    v59[2] = @"lastConnectSecond";
    unsigned int v52 = +[NSNumber numberWithLongLong:v27];
    v60[2] = v52;
    v59[3] = @"lastConnectResult";
    uint64_t v28 = [v23 lastConnectResult];
    int v51 = (void *)v28;
    if (v28) {
      CFStringRef v29 = (const __CFString *)v28;
    }
    else {
      CFStringRef v29 = &stru_10023D730;
    }
    v60[3] = v29;
    v59[4] = @"lastEvalSourceResult";
    uint64_t v30 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice evalResult];
    unsigned int v50 = (void *)v30;
    if (v30) {
      CFStringRef v31 = (const __CFString *)v30;
    }
    else {
      CFStringRef v31 = &stru_10023D730;
    }
    v60[4] = v31;
    v59[5] = @"lastEvalSourceMS";
    int v49 = +[NSNumber numberWithLongLong:v21];
    v60[5] = v49;
    v59[6] = @"lastEvalWxResult";
    uint64_t v48 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice evalWxMap];
    id v47 = [v48 objectForKeyedSubscript:v4];
    uint64_t v32 = [v47 lastEvalResult];
    int v33 = (void *)v32;
    if (v32) {
      CFStringRef v34 = (const __CFString *)v32;
    }
    else {
      CFStringRef v34 = &stru_10023D730;
    }
    v60[6] = v34;
    v59[7] = @"lastEvalWxMS";
    id v44 = +[NSNumber numberWithLongLong:v26];
    v60[7] = v44;
    v59[8] = @"nearbyDeviceCount";
    uint64_t v35 = +[NSNumber numberWithUnsignedInteger:[(NSMutableDictionary *)self->_nearbyInfoDevices count]];
    v60[8] = v35;
    v59[9] = @"nearbyWxCount";
    +[NSNumber numberWithUnsignedInteger:[(NSMutableDictionary *)self->_wxDevices count]];
    v36 = uint64_t v45 = v23;
    v60[9] = v36;
    v60[10] = v10;
    v59[10] = @"peerAudioScore";
    v59[11] = @"peerConnectTime";
    v60[11] = &off_100244838;
    v60[12] = v57;
    v59[12] = @"peerModel";
    v59[13] = @"peerConnectTry";
    v60[13] = &off_100244838;
    v60[14] = v58;
    v59[14] = @"routingAction";
    v59[15] = @"tipiConnect";
    [v56 otherTipiDeviceBTAddress];
    v37 = unsigned __int8 v46 = (void *)v7;
    CFStringRef v38 = @"Yes";
    if (!v37) {
      CFStringRef v38 = @"No";
    }
    v60[15] = v38;
    v59[16] = @"wxConnectTime";
    int v39 = +[NSNumber numberWithUnsignedLongLong:v54];
    v60[16] = v39;
    v59[17] = @"wxProductID";
    unsigned int v43 = (void *)v10;
    BOOL v40 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v56 productID]);
    v60[17] = v40;
    v59[18] = @"srCapable";
    uint64_t v41 = +[NSNumber numberWithBool:self->_prefSmartRoutingEnabledPhase3];
    v60[18] = v41;
    v60[19] = &off_100244850;
    v59[19] = @"wxConnectTry";
    v59[20] = @"wxBuildVersion";
    v60[20] = v55;
    unsigned int v42 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:21];
    CUMetricsLogEx();
  }
}

- (void)_submitConnectionMetric:(id)a3 andError:(id)a4
{
  id v6 = a3;
  id v76 = a4;
  uint64_t v77 = v6;
  if (v6)
  {
    uint64_t score = self->_score;
    if (score > 0xF) {
      id v8 = "?";
    }
    else {
      id v8 = off_1002342D0[score];
    }
    BOOL v73 = +[NSString stringWithUTF8String:v8];
    uint64_t audioScoreOtherTipiDevice = self->_audioScoreOtherTipiDevice;
    if (audioScoreOtherTipiDevice > 0xF) {
      uint64_t v10 = "?";
    }
    else {
      uint64_t v10 = off_1002342D0[audioScoreOtherTipiDevice];
    }
    unint64_t v69 = +[NSString stringWithUTF8String:v10];
    BOOL v78 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v6];
    id v79 = [v78 identifier];
    unsigned int v11 = [v78 routingAction];
    if (v11 > 5) {
      unsigned int v12 = "?";
    }
    else {
      unsigned int v12 = off_100234488[v11];
    }
    unsigned __int16 v65 = +[NSString stringWithUTF8String:v12];
    mach_absolute_time();
    unint64_t v13 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v79];
    [v13 lastConnectionTicks];
    uint64_t v53 = UpTicksToMilliseconds();

    uint64_t v14 = [v78 otherTipiDeviceBTName];
    uint64_t v15 = (void *)v14;
    if (v14) {
      CFStringRef v16 = (__CFString *)v14;
    }
    else {
      CFStringRef v16 = @"NA";
    }
    double v66 = v16;

    id v17 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v79];
    unsigned int v18 = [v17 preemptiveBannerShown];

    if (v18)
    {
      mach_absolute_time();
      unint64_t v75 = UpTicksToMilliseconds();
      if (v75 >> 5 >= 0x271) {
        unint64_t v75 = UpTicksToMilliseconds();
      }
      self->_preemptiveBannerShownTicks = 0;
      if (self->_preemptiveBannerConnectionInProgress) {
        self->_preemptiveBannerConnectionInProgress = 0;
      }
    }
    else
    {
      unint64_t v75 = 0;
    }
    id v59 = CUPrintNSError();
    id v63 = [(BTSmartRoutingDaemon *)self _getCurrentRoute];
    uint64_t v19 = [(BTSmartRoutingDaemon *)self _getWxFWVersion:v77];
    unint64_t v20 = (void *)v19;
    if (v19) {
      uint64_t v21 = (__CFString *)v19;
    }
    else {
      uint64_t v21 = &stru_10023D730;
    }
    id v58 = v21;

    uint64_t v22 = [(SmartRoutingStats *)self->_stats onDemandCategory];
    unint64_t v23 = (void *)v22;
    if (v22) {
      id v24 = (__CFString *)v22;
    }
    else {
      id v24 = @"NA";
    }
    unint64_t v68 = v24;

    if ([(SmartRoutingStats *)self->_stats pipeStartTime])
    {
      mach_absolute_time();
      [(SmartRoutingStats *)self->_stats pipeStartTime];
      uint64_t v25 = UpTicksToMilliseconds();
    }
    else
    {
      uint64_t v25 = 0;
    }
    unint64_t v26 = [(SmartRoutingStats *)self->_stats firstPipeMessageRTT];
    unsigned int v51 = [(BTSmartRoutingDaemon *)self _inEarNearbyCheck:v77];
    BOOL v27 = [(BTSmartRoutingDaemon *)self _isOnDemandConnectInProgress];
    unsigned int v28 = [(BTSmartRoutingDaemon *)self _isConnectionTipiv2];
    unsigned int v29 = v28;
    if (v25 != 0 && ~v27) {
      uint64_t v30 = @"Legacy Tipi";
    }
    else {
      uint64_t v30 = @"Phase 1";
    }
    if (v28) {
      uint64_t v30 = @"Tipi2.0";
    }
    __int16 v62 = v30;
    unsigned int v74 = [(BTSmartRoutingDaemon *)self _inCaseLidClosed:v77];
    CFStringRef v31 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v79];
    unsigned int v52 = [v31 preemptiveBannerShown];

    uint64_t v32 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v79];
    unsigned __int8 v50 = [v32 sourceCount];

    if (v74 && dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v29)
    {
      phase1ConnectConfig = self->_phase1ConnectConfig;
      self->_phase1ConnectConfig = 0;
    }
    uint64_t v81 = 0;
    uint64_t v82 = &v81;
    uint64_t v83 = 0x2020000000;
    int v84 = 0;
    nearbyInfoDevices = self->_nearbyInfoDevices;
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_10003ED0C;
    v80[3] = &unk_100233328;
    v80[4] = &v81;
    [(NSMutableDictionary *)nearbyInfoDevices enumerateKeysAndObjectsUsingBlock:v80];
    uint64_t v35 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v79];

    if (v35)
    {
      uint64_t v36 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v79];
      unint64_t v37 = (unint64_t)[v36 audioState];
      if (v37 > 3) {
        CFStringRef v38 = "?";
      }
      else {
        CFStringRef v38 = off_100234250[v37];
      }
      uint64_t v54 = +[NSString stringWithUTF8String:v38];
    }
    else
    {
      uint64_t v54 = @"Unknown";
    }
    v86[0] = v73;
    v85[0] = @"audioScore";
    v85[1] = @"firstPipeMessageRTT";
    id v72 = +[NSNumber numberWithUnsignedLongLong:v26];
    v86[1] = v72;
    v85[2] = @"forceConnect";
    double v71 = +[NSNumber numberWithBool:self->_forcedConnection];
    v86[2] = v71;
    v85[3] = @"localAudioScore";
    unint64_t v70 = [(SmartRoutingStats *)self->_stats localAudioScore];
    unsigned int v67 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v70 intValue]);
    v86[3] = v67;
    v85[4] = @"nearbyDeviceCount";
    int v64 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v82 + 6)];
    v86[4] = v64;
    v85[5] = @"nearbyWxCount";
    id v61 = +[NSNumber numberWithUnsignedInteger:[(NSMutableDictionary *)self->_wxDevices count]];
    v86[5] = v61;
    v86[6] = v68;
    v85[6] = @"onDemandCategory";
    v85[7] = @"onDemandConnect";
    BOOL v60 = +[NSNumber numberWithBool:v27];
    v86[7] = v60;
    v85[8] = @"setupSupportsTipiv2";
    int v57 = +[NSNumber numberWithBool:[(SmartRoutingStats *)self->_stats setupSupportsTipiv2]];
    v86[8] = v57;
    v86[9] = v69;
    v85[9] = @"peerAudioScore";
    v85[10] = @"peerModel";
    v86[10] = v66;
    v85[11] = @"pipeToConnectionCompleteTime";
    unsigned __int8 v56 = +[NSNumber numberWithUnsignedLongLong:v25];
    v86[11] = v56;
    v85[12] = @"preemptiveBannerFailureReason";
    uint64_t v55 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice evalPreemptiveBannerResult];
    CFStringRef v39 = v55;
    if (!v55) {
      CFStringRef v39 = &stru_10023D730;
    }
    if (v52) {
      CFStringRef v40 = @"Yes";
    }
    else {
      CFStringRef v40 = @"No";
    }
    v86[12] = v39;
    v86[13] = v40;
    v85[13] = @"preemptiveBannerShown";
    v85[14] = @"preemptiveBannerTime";
    if (v75)
    {
      +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
      uint64_t v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v41 = @"Not initialized";
    }
    v86[14] = v41;
    v86[15] = v65;
    v85[15] = @"routingAction";
    v85[16] = @"systemAudioRoute";
    v86[16] = v63;
    v85[17] = @"tipiConnect";
    unsigned int v42 = [v78 otherTipiDeviceBTAddress];
    if (v42) {
      CFStringRef v43 = @"Yes";
    }
    else {
      CFStringRef v43 = @"No";
    }
    v86[17] = v43;
    v86[18] = v62;
    v85[18] = @"tipiConnectType";
    v85[19] = @"wxConnectTime";
    id v44 = +[NSNumber numberWithUnsignedLongLong:v53];
    v86[19] = v44;
    v85[20] = @"wxProductID";
    uint64_t v45 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v78 productID]);
    v86[20] = v45;
    v86[21] = v59;
    v85[21] = @"wxConnectResult";
    v85[22] = @"wxConnectResult2";
    v86[22] = v59;
    v86[23] = v58;
    v85[23] = @"wxBuildVersion";
    v85[24] = @"wxInEar";
    unsigned __int8 v46 = +[NSNumber numberWithBool:v51];
    v86[24] = v46;
    v85[25] = @"wxInCasewithLidClosed";
    id v47 = +[NSNumber numberWithBool:v74];
    v86[25] = v47;
    v85[26] = @"wxSourceCount";
    uint64_t v48 = +[NSNumber numberWithUnsignedChar:v50];
    v85[27] = @"wxStreamState";
    v86[26] = v48;
    v86[27] = v54;
    int v49 = +[NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:28];
    CUMetricsLogEx();

    if (v75) {
    if (v76)
    }
      [(SmartRoutingStats *)self->_stats setOnDemandCategory:0];

    _Block_object_dispose(&v81, 8);
  }
}

- (void)_submitHijackBlockMetric:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BTSmartRoutingDaemon *)self _getWxProductID:v6];
  unint64_t v9 = [(BTSmartRoutingDaemon *)self _getCurrentRoute];
  uint64_t v10 = [(BTSmartRoutingDaemon *)self _getWxFWVersion:v6];
  unsigned int v11 = (void *)v10;
  unsigned int v12 = &stru_10023D730;
  if (v10) {
    unsigned int v12 = (__CFString *)v10;
  }
  unint64_t v13 = v12;

  BOOL v14 = [(SmartRoutingStats *)self->_stats mediaPlaying]
     || [(SmartRoutingStats *)self->_stats callConnected];
  mach_absolute_time();
  uint64_t v15 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v6];
  [v15 hijackBackoffTicks];
  unint64_t v16 = UpTicksToSeconds() + self->_prefSmartRoutingBlockHijackWindowinSeconds * self->_hijackBackoffCount;

  v22[0] = @"initiator";
  id v17 = +[NSNumber numberWithBool:self->_hijackBackOffInitiator];
  v23[0] = v17;
  v22[1] = @"isPlaying";
  unsigned int v18 = +[NSNumber numberWithBool:v14];
  v23[1] = v18;
  v23[2] = v9;
  v22[2] = @"route";
  v22[3] = @"terminateReason";
  v23[3] = v7;
  v22[4] = @"blockTimeSeconds";
  uint64_t v19 = +[NSNumber numberWithUnsignedLongLong:v16];
  v23[4] = v19;
  v23[5] = v13;
  v22[5] = @"wxBuildVersion";
  v22[6] = @"wxProductID";
  unint64_t v20 = +[NSNumber numberWithUnsignedInt:v8];
  v23[6] = v20;
  uint64_t v21 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:7];
  CUMetricsLogEx();
}

- (void)_submitRouteCheckMetric:(id)a3 andType:(int)a4
{
  id v6 = a3;
  if (v6)
  {
    unsigned int v92 = [(BTSmartRoutingDaemon *)self _getWxProductID:v6];
    unsigned int v7 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice audioRoute];
    if (v7 > 4) {
      uint64_t v8 = "?";
    }
    else {
      uint64_t v8 = off_100234440[v7];
    }
    int v105 = +[NSString stringWithUTF8String:v8];
    unint64_t v9 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v6];

    uint64_t v10 = [(SmartRoutingStats *)self->_stats onDemandCategory];
    unsigned int v11 = (void *)v10;
    if (v10) {
      unsigned int v12 = (__CFString *)v10;
    }
    else {
      unsigned int v12 = @"NA";
    }
    CFStringRef v104 = v12;

    uint64_t v13 = [(BTSmartRoutingDaemon *)self _getWxFWVersion:v6];
    BOOL v14 = (void *)v13;
    uint64_t v15 = &stru_10023D730;
    if (v13) {
      uint64_t v15 = (__CFString *)v13;
    }
    unsigned int v103 = v15;

    unint64_t v16 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v6];
    signed int v89 = [(NSNumber *)self->_localDeviceAudioCatogory intValue];
    if (a4 > 0xE) {
      id v17 = "?";
    }
    else {
      id v17 = off_100234370[a4];
    }
    uint64_t v101 = +[NSString stringWithUTF8String:v17];
    uint64_t v18 = [v16 otherTipiDeviceBTName];
    uint64_t v19 = (void *)v18;
    if (v18) {
      unint64_t v20 = (__CFString *)v18;
    }
    else {
      unint64_t v20 = @"NA";
    }
    id v106 = v20;

    unint64_t v21 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice bluetoothState];
    if (v21 > 0xA) {
      uint64_t v22 = "?";
    }
    else {
      uint64_t v22 = off_100233FC0[v21];
    }
    uint64_t v23 = +[NSString stringWithUTF8String:v22];
    id v24 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v6];
    unsigned int v91 = v24;
    if (v24)
    {
      unsigned int v25 = [v24 audioStreamState];
      if (v25 > 3) {
        unint64_t v26 = "?";
      }
      else {
        unint64_t v26 = off_100234420[v25];
      }
      uint64_t v99 = +[NSString stringWithUTF8String:v26];
    }
    else
    {
      uint64_t v99 = @"NA";
    }
    double v107 = [(SmartRoutingStats *)self->_stats falseRouteCheckReason];
    uint64_t v27 = [(SmartRoutingStats *)self->_stats hijackVersion];
    unsigned int v28 = (void *)v27;
    if (v27) {
      unsigned int v29 = (__CFString *)v27;
    }
    else {
      unsigned int v29 = @"NA";
    }
    uint64_t v30 = v29;

    uint64_t v31 = [(SmartRoutingStats *)self->_stats hijackAnswer];
    uint64_t v32 = (void *)v31;
    if (v31) {
      int v33 = (__CFString *)v31;
    }
    else {
      int v33 = @"NA";
    }
    unsigned __int8 v98 = v33;

    CFStringRef v34 = [(NSMutableDictionary *)self->_srDiscoveredDeviceMap objectForKeyedSubscript:v6];
    uint64_t v35 = v34;
    id v83 = v6;
    id v100 = (void *)v23;
    if (v9 && v16)
    {
      unsigned int v36 = [v16 inEar];
    }
    else
    {
      if (v9)
      {
        unsigned int v96 = @"NA";
LABEL_43:
        uint64_t v38 = 0;
        uint64_t v39 = 0;
        CFStringRef v40 = @"NA";
        uint64_t v81 = v35;
        id v108 = @"NA";
        switch(a4)
        {
          case 5:
          case 6:
            uint64_t v39 = [(SmartRoutingStats *)self->_stats hijackScore];
            goto LABEL_45;
          case 7:
          case 9:
          case 10:
          case 11:
            goto LABEL_68;
          case 8:
            uint64_t v41 = [(SmartRoutingStats *)self->_stats reverseRouteReason];

            uint64_t v39 = 0;
            uint64_t v38 = 0;
            CFStringRef v40 = @"NA";
            double v107 = (__CFString *)v41;
            goto LABEL_67;
          case 12:
            if (v16)
            {
              if ([v16 otherTipiDeviceIdleTick])
              {
                mach_absolute_time();
                [v16 otherTipiDeviceIdleTick];
                uint64_t v39 = 0;
                uint64_t v38 = UpTicksToSeconds() - 25;
              }
              else
              {
                uint64_t v39 = 0;
LABEL_45:
                uint64_t v38 = 0;
              }
              CFStringRef v40 = @"NA";
            }
            else
            {
              uint64_t v39 = 0;
              uint64_t v38 = 0;
            }
            goto LABEL_67;
          case 13:

            id v42 = objc_alloc_init((Class)NSMutableDictionary);
            uint64_t v43 = [(SmartRoutingStats *)self->_stats bannerAction];
            v94 = v30;
            id v44 = (void *)v43;
            if (v43) {
              CFStringRef v45 = (const __CFString *)v43;
            }
            else {
              CFStringRef v45 = @"NA";
            }
            [v42 setObject:v45 forKeyedSubscript:@"BannerAction" atIndex:v81];

            uint64_t v46 = [(SmartRoutingStats *)self->_stats bannerTrigger];
            id v47 = (void *)v46;
            if (v46) {
              CFStringRef v48 = (const __CFString *)v46;
            }
            else {
              CFStringRef v48 = @"NA";
            }
            [v42 setObject:v48 forKeyedSubscript:@"BannerTrigger"];

            uint64_t v49 = [(BTSmartRoutingDaemon *)self _getJsonStringFromDictionary:v42];

            uint64_t v50 = [(SmartRoutingStats *)self->_stats bannerTrigger];
            unsigned int v51 = (void *)v50;
            if (v50) {
              unsigned int v52 = (__CFString *)v50;
            }
            else {
              unsigned int v52 = @"NA";
            }
            uint64_t v53 = v52;

            uint64_t v54 = [(SmartRoutingStats *)self->_stats bannerAction];
            uint64_t v55 = (void *)v54;
            if (v54) {
              unsigned __int8 v56 = (__CFString *)v54;
            }
            else {
              unsigned __int8 v56 = @"NA";
            }
            id v108 = v56;

            CFStringRef v40 = v53;
            uint64_t v39 = 0;
            uint64_t v38 = 0;
            id v106 = @"NA";
            double v107 = (__CFString *)v49;
            uint64_t v30 = v94;
            goto LABEL_68;
          default:
LABEL_67:
            id v108 = @"NA";
LABEL_68:
            unint64_t v97 = (__CFString *)v40;
            char v102 = v16;
            int v93 = a4;
            if ([(__CFString *)v98 isEqualToString:@"Backoff", v81])
            {

              CFStringRef v95 = @"All";
            }
            else
            {
              CFStringRef v95 = v30;
            }
            BOOL v57 = v89 > 100;
            BOOL v58 = v9 != 0;
            v109[0] = @"ActivePlayingApp";
            uint64_t v59 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice activePlayingApp];
            unsigned int v90 = (void *)v59;
            if (v59) {
              CFStringRef v60 = (const __CFString *)v59;
            }
            else {
              CFStringRef v60 = @"NA";
            }
            v110[0] = v60;
            v110[1] = v108;
            v109[1] = @"BannerAction";
            v109[2] = @"BluetoothState";
            v110[2] = v100;
            v109[3] = @"HijackAnswer";
            uint64_t v61 = [(SmartRoutingStats *)self->_stats hijackAnswer];
            uint64_t v88 = (void *)v61;
            if (v61) {
              CFStringRef v62 = (const __CFString *)v61;
            }
            else {
              CFStringRef v62 = @"NA";
            }
            v110[3] = v62;
            void v109[4] = @"HijackScore";
            unsigned int v87 = +[NSNumber numberWithInt:v39];
            void v110[4] = v87;
            v109[5] = @"HijackVersion";
            uint64_t v63 = [(SmartRoutingStats *)self->_stats hijackVersion];
            int v64 = (void *)v63;
            if (v63) {
              CFStringRef v65 = (const __CFString *)v63;
            }
            else {
              CFStringRef v65 = @"NA";
            }
            void v110[5] = v65;
            v110[6] = v96;
            v109[6] = @"InEar";
            v109[7] = @"IsConnected";
            v86 = +[NSNumber numberWithBool:v58];
            v110[7] = v86;
            v109[8] = @"IsPlaying";
            v85 = +[NSNumber numberWithBool:v57];
            v110[8] = v85;
            v109[9] = @"LocalAudioCategory";
            int v84 = +[NSNumber numberWithInt:[(NSNumber *)self->_localDeviceAudioCatogory intValue]];
            v110[9] = v84;
            v110[10] = v104;
            v109[10] = @"OnDemandCategory";
            v109[11] = @"OtherTipiDevice";
            v110[11] = v106;
            v109[12] = @"OtherTipiDeviceIdleTime";
            double v66 = +[NSNumber numberWithUnsignedLongLong:v38];
            v110[12] = v66;
            v109[13] = @"OtherTipiAudioCategory";
            unsigned int v67 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v16 otherTipiAudioCategory]);
            v110[13] = v67;
            v109[14] = @"OtherTipiDevicePlayingApp";
            uint64_t v68 = [v16 otherTipiDevicePlayingApp];
            unint64_t v69 = (void *)v68;
            if (v68) {
              CFStringRef v70 = (const __CFString *)v68;
            }
            else {
              CFStringRef v70 = @"NA";
            }
            v110[14] = v70;
            v109[15] = @"ProactiveRoutingTrigger";
            uint64_t v71 = [(SmartRoutingStats *)self->_stats proactiveRoutingTrigger];
            id v72 = (void *)v71;
            if (v71) {
              CFStringRef v73 = (const __CFString *)v71;
            }
            else {
              CFStringRef v73 = @"NA";
            }
            v110[15] = v73;
            v109[16] = @"ProactiveRoutingWxRSSI";
            uint64_t v74 = +[NSNumber numberWithInt:[(SmartRoutingStats *)self->_stats proactiveRoutingWxRSSI]];
            unint64_t v75 = (void *)v74;
            CFStringRef v76 = v107;
            if (!v107) {
              CFStringRef v76 = @"NA";
            }
            v110[16] = v74;
            v110[17] = v76;
            v109[17] = @"Reason";
            v109[18] = @"Route";
            v110[18] = v105;
            v110[19] = v97;
            v109[19] = @"Trigger";
            v109[20] = @"Type";
            v110[20] = v101;
            v110[21] = v103;
            v109[21] = @"WxBuildVersion";
            v109[22] = @"WxProductID";
            uint64_t v77 = +[NSNumber numberWithUnsignedInt:v92];
            v109[23] = @"WxStreamState";
            v110[22] = v77;
            v110[23] = v99;
            BOOL v78 = +[NSDictionary dictionaryWithObjects:v110 forKeys:v109 count:24];
            CUMetricsLogEx();

            if (v93 == 6)
            {
              [(SmartRoutingStats *)self->_stats setHijackAnswer:0];
              id v79 = v82;
              id v6 = v83;
              id v80 = (__CFString *)v95;
            }
            else
            {
              id v79 = v82;
              id v6 = v83;
              id v80 = (__CFString *)v95;
              if (v93 == 10) {
                [(SmartRoutingStats *)self->_stats setOnDemandCategory:0];
              }
            }

            break;
        }
        goto LABEL_93;
      }
      unsigned int v36 = [v34 nearbyInEar] == 1;
    }
    unint64_t v37 = @"NO";
    if (v36) {
      unint64_t v37 = @"YES";
    }
    unsigned int v96 = v37;
    goto LABEL_43;
  }
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_93:
}

- (void)updateCurrentAudioSnapshot
{
  id v3 = +[NSNumber numberWithInt:1];
  [(SmartRoutingStats *)self->_stats setSnapshotLocalNumOfApps:v3];

  id v4 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice activePlayingApp];
  [(SmartRoutingStats *)self->_stats setSnapshotLocalPlayingApp:v4];

  id v5 = [(BTSmartRoutingDaemon *)self _getCurrentRoute];
  [(SmartRoutingStats *)self->_stats setSnapshotLocalRoute:v5];

  [(SmartRoutingStats *)self->_stats setSnapshotLocalDeviceAudioScore:self->_localDeviceAudioCatogory];
  id v6 = +[NSNumber numberWithInt:0xFFFFFFFFLL];
  [(SmartRoutingStats *)self->_stats setSnapshotRemoteDeviceAudioScore:v6];

  uint64_t v7 = [(BTSmartRoutingDaemon *)self _findActiveWxDevice];
  if (v7)
  {
    uint64_t v8 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v7];
    unint64_t v9 = v8;
    if (v8)
    {
      uint64_t v10 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v8 otherTipiAudioCategory]);
      [(SmartRoutingStats *)self->_stats setSnapshotRemoteDeviceAudioScore:v10];
    }
  }
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    unsigned int v11 = [(SmartRoutingStats *)self->_stats snapshotLocalRoute];
    unsigned int v12 = [(SmartRoutingStats *)self->_stats snapshotLocalPlayingApp];
    uint64_t v13 = [(SmartRoutingStats *)self->_stats snapshotLocalDeviceAudioScore];
    BOOL v14 = [(SmartRoutingStats *)self->_stats snapshotRemoteDeviceAudioScore];
    uint64_t v15 = [(SmartRoutingStats *)self->_stats snapshotLocalNumOfApps];
    LogPrintF();
  }

  _objc_release_x2();
}

- (void)_updateSRDiscoveredDeviceForCBDeviceChanged:(id)a3 connectionStatus:(unsigned __int8)a4
{
  if (self->_prefSmartRoutingInUseBanner)
  {
    uint64_t v4 = a4;
    id v6 = [a3 btAddressData];
    uint64_t v12 = CUPrintNSDataAddress();

    uint64_t v8 = v12;
    if (v12)
    {
      unint64_t v9 = [(NSMutableDictionary *)self->_srDiscoveredDeviceMap objectForKeyedSubscript:v12];
      if (!v9) {
        unint64_t v9 = objc_alloc_init(SRDiscoveredDevice);
      }
      [(SRDiscoveredDevice *)v9 _setBtAddress:v12];
      [(SRDiscoveredDevice *)v9 _setConnectionState:v4];
      uint64_t v10 = v12;
      if (!v4)
      {
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v11 = v12;
          LogPrintF();
        }
        -[SRDiscoveredDevice _setRouteToWxAfterUnhide:](v9, "_setRouteToWxAfterUnhide:", 0, v11);
        uint64_t v10 = v12;
      }
      [(NSMutableDictionary *)self->_srDiscoveredDeviceMap setObject:v9 forKeyedSubscript:v10];

      uint64_t v8 = v12;
    }
    _objc_release_x1(v7, v8);
  }
}

- (void)_updateSRDiscoveredDeviceForNearbyWxChanged:(id)a3 isNearby:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (self->_prefSmartRoutingInUseBanner)
  {
    CFStringRef v45 = v6;
    uint64_t v7 = [v6 identifier];
    uint64_t v8 = [v7 UUIDString];

    if (v8)
    {
      unint64_t v9 = [v45 bleDevice];
      uint64_t v10 = [v9 advertisementFields];

      uint64_t v11 = CFDictionaryGetCFDataOfLength();
      uint64_t v12 = v11;
      if (v11)
      {
        id v29 = [v11 bytes];
        uint64_t v13 = NSPrintF();
        if (v13)
        {
          BOOL v14 = (void *)v13;
          BOOL v41 = v4;
          CFStringRef v40 = v8;
          unsigned int Int64Ranged = CFDictionaryGetInt64Ranged();
          uint64_t Int64 = CFDictionaryGetInt64();
          unint64_t v16 = [v45 bleDevice:v29];
          id v17 = [v16 advertisementFields];
          uint64_t v44 = CFDictionaryGetInt64Ranged();

          uint64_t v18 = CFDictionaryGetInt64();
          CFStringGetTypeID();
          id v42 = CFDictionaryGetTypedValue();
          uint64_t v19 = CFDictionaryGetCFDataOfLength();
          unint64_t v20 = [v45 bleDevice];
          unint64_t v21 = [v20 advertisementFields];
          char v22 = CFDictionaryGetInt64Ranged();

          uint64_t v23 = 1;
          if ((v22 & 0x24) == 0)
          {
            if ([(BTSmartRoutingDaemon *)self _bluetoothProductIDNoEarDetect:v44]) {
              uint64_t v23 = 1;
            }
            else {
              uint64_t v23 = 2;
            }
          }
          unsigned __int8 v38 = CFDictionaryGetInt64Ranged();
          unsigned __int8 v39 = CFDictionaryGetInt64Ranged();
          if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
          {
            id v24 = "no";
            if (v41) {
              unsigned int v25 = "yes";
            }
            else {
              unsigned int v25 = "no";
            }
            if (Int64Ranged >> 2) {
              unint64_t v26 = "?";
            }
            else {
              unint64_t v26 = off_100234250[Int64Ranged];
            }
            if (Int64) {
              uint64_t v27 = "yes";
            }
            else {
              uint64_t v27 = "no";
            }
            if (v18) {
              id v24 = "yes";
            }
            uint64_t v32 = v25;
            int v33 = v26;
            unsigned int v36 = v24;
            unint64_t v37 = v19;
            uint64_t v30 = v14;
            uint64_t v31 = v42;
            uint64_t v34 = v44;
            uint64_t v35 = v27;
            LogPrintF();
          }
          -[NSMutableDictionary objectForKeyedSubscript:](self->_srDiscoveredDeviceMap, "objectForKeyedSubscript:", v14, v30, v31, v32, v33, v34, v35, v36, v37);
          unsigned int v28 = (SRDiscoveredDevice *)objc_claimAutoreleasedReturnValue();
          if (!v28) {
            unsigned int v28 = objc_alloc_init(SRDiscoveredDevice);
          }
          [(SRDiscoveredDevice *)v28 _setBtAddress:v14];
          [(SRDiscoveredDevice *)v28 _setIsNearby:v41];
          [(SRDiscoveredDevice *)v28 _setNearbyiCloudSignIn:v18 != 0];
          [(SRDiscoveredDevice *)v28 _setNearbyName:v42];
          [(SRDiscoveredDevice *)v28 _setNearbyPaired:Int64 != 0];
          [(SRDiscoveredDevice *)v28 _setNearbyProductID:v44];
          [(SRDiscoveredDevice *)v28 _setNearbyWxDevice:v45];
          [(SRDiscoveredDevice *)v28 _setNearbyLastRouteHost:v19];
          [(SRDiscoveredDevice *)v28 _setNearbyPrevInEar:[(SRDiscoveredDevice *)v28 nearbyInEar]];
          [(SRDiscoveredDevice *)v28 _setNearbyInEar:v23];
          [(SRDiscoveredDevice *)v28 _setNearbyOutOfCaseTime:v38];
          [(SRDiscoveredDevice *)v28 _setNearbyStreamState:(int)Int64Ranged];
          [(SRDiscoveredDevice *)v28 _setNearbyConnectedSourceCount:v39];
          if (!v41) {
            [(SRDiscoveredDevice *)v28 _setNearbyPrevInEar:0];
          }
          [(NSMutableDictionary *)self->_srDiscoveredDeviceMap setObject:v28 forKeyedSubscript:v14];

          uint64_t v8 = v40;
        }
      }
    }
    id v6 = v45;
  }
}

- (void)_cancelInUseBannerForCallTimer
{
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  inUseBannerTimer = self->_inUseBannerTimer;
  if (inUseBannerTimer)
  {
    id v5 = inUseBannerTimer;
    dispatch_source_cancel(v5);
    BOOL v4 = self->_inUseBannerTimer;
    self->_inUseBannerTimer = 0;
  }
}

- (void)_cancelRingtoneTimer
{
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  ringtoneTimer = self->_ringtoneTimer;
  if (ringtoneTimer)
  {
    id v5 = ringtoneTimer;
    dispatch_source_cancel(v5);
    BOOL v4 = self->_ringtoneTimer;
    self->_ringtoneTimer = 0;
  }
}

- (void)_clearCallSession
{
}

- (void)_handleTUCallStateChange:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004039C;
  v7[3] = &unk_100232A10;
  id v8 = v4;
  unint64_t v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (BOOL)_isPhoneCall:(id)a3
{
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [(BTSmartRoutingSourceDevice *)self->_sourceDevice conferencingCallSets];
  id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v10 = [v4 provider];
        uint64_t v11 = [v10 bundleIdentifier];
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          uint64_t v13 = [v4 provider];
          BOOL v14 = [v13 bundleIdentifier];
          id v15 = [v14 rangeOfString:v9 options:1];

          if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            BOOL v16 = 0;
            goto LABEL_18;
          }
        }
        else
        {
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 1;
LABEL_18:

  return v16;
}

- (void)_notifyOtherTipiCallState:(int)a3
{
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000411E8;
  v4[3] = &unk_100233A80;
  int v5 = a3;
  v4[4] = self;
  [(NSMutableDictionary *)smartRoutingWxDeviceMap enumerateKeysAndObjectsUsingBlock:v4];
}

- (void)_startInUseBannerTimer
{
  [(BTSmartRoutingDaemon *)self _cancelInUseBannerForCallTimer];
  dispatch_source_t v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  objc_storeStrong((id *)&self->_inUseBannerTimer, v3);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10004141C;
  handler[3] = &unk_100232710;
  void handler[4] = self;
  dispatch_source_set_event_handler(v3, handler);
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  CUDispatchTimerSet();
  dispatch_activate(v3);
}

- (void)_startRingtoneTimer
{
  [(BTSmartRoutingDaemon *)self _cancelRingtoneTimer];
  dispatch_source_t v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  objc_storeStrong((id *)&self->_ringtoneTimer, v3);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000415D0;
  handler[3] = &unk_100232710;
  void handler[4] = self;
  dispatch_source_set_event_handler(v3, handler);
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  CUDispatchTimerSet();
  dispatch_activate(v3);
}

- (void)_TUMonitorEnsureStarted
{
  if (!self->_tuCallCenter)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    dispatch_source_t v3 = +[TUCallCenter callCenterWithQueue:self->_dispatchQueue];
    tuCallCenter = self->_tuCallCenter;
    self->_tuCallCenter = v3;

    int v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"_handleTUCallStateChange:" name:TUCallCenterCallStatusChangedNotification object:0];

    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:self selector:"_handleTUCallStateChange:" name:TUCallCenterVideoCallStatusChangedNotification object:0];
  }
}

- (void)_TUMonitorEnsureStopped
{
  if (self->_tuCallCenter)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    tuCallCenter = self->_tuCallCenter;
    self->_tuCallCenter = 0;

    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self name:TUCallCenterCallStatusChangedNotification object:0];
    [v4 removeObserver:self name:TUCallCenterVideoCallStatusChangedNotification object:0];
  }
}

- (void)_anyPairedDeviceSupportsSmartRouting
{
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  dispatch_source_t v3 = [(CBDiscovery *)self->_pairedDiscovery discoveredDevices];
  id v4 = [v3 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v4)
  {
    id v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v46;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v46 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if ((objc_msgSend(v9, "deviceFlags", v43) & 0x10) != 0)
        {
          uint64_t v10 = [v9 btAddressData];
          if ([v10 length] == (id)6)
          {
            uint64_t v43 = (const char *)[v10 bytes];
            uint64_t v11 = NSPrintF();
            if (v11)
            {
              uint64_t v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v11, v43);
              if (v12)
              {
                uint64_t v13 = (void *)v12;
                BOOL v14 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v11];

                if (!v14)
                {
                  id v15 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v11];
                  [(BTSmartRoutingDaemon *)self _smartRoutingAddWxMapDeviceFromConnectedDevice:v15];
                  [(BTSmartRoutingDaemon *)self _triggerTipiTableUpdate:v11];
                }
              }
            }
          }
          else
          {
            uint64_t v11 = 0;
          }

          char v6 = 1;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v5);
  }
  else
  {
    char v6 = 0;
  }

  if (self->_pairedDeviceSupportsSmartRouting != (v6 & 1))
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      BOOL v16 = "not found";
      if (v6) {
        BOOL v16 = "found";
      }
      uint64_t v43 = v16;
      LogPrintF();
    }
    self->_BOOL pairedDeviceSupportsSmartRouting = v6 & 1;
    if ((v6 & 1) == 0)
    {
      smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_100041CC8;
      void v44[3] = &unk_100233650;
      v44[4] = self;
      [(NSMutableDictionary *)smartRoutingWxDeviceMap enumerateKeysAndObjectsUsingBlock:v44];
      uiSmartRoutingBanner = self->_uiSmartRoutingBanner;
      if (uiSmartRoutingBanner)
      {
        [(BTBannerUISession *)uiSmartRoutingBanner invalidate];
        long long v19 = self->_uiSmartRoutingBanner;
        self->_uiSmartRoutingBanner = 0;
      }
      disconnectTicksMap = self->_disconnectTicksMap;
      if (disconnectTicksMap)
      {
        [(NSMutableDictionary *)disconnectTicksMap removeAllObjects];
        long long v21 = self->_disconnectTicksMap;
      }
      else
      {
        long long v21 = 0;
      }
      self->_disconnectTicksMap = 0;

      self->_connectTicks = 0;
      self->_tipiSetupTicks = 0;
      if (self->_tipiElectionInProgress) {
        self->_BOOL tipiElectionInProgress = 0;
      }
      -[BTSmartRoutingDaemon _setTipiElectionReceivedLePipe:](self, "_setTipiElectionReceivedLePipe:", &stru_10023D730, v43);
      tipiHealingTimer = self->_tipiHealingTimer;
      if (tipiHealingTimer)
      {
        uint64_t v23 = tipiHealingTimer;
        dispatch_source_cancel(v23);
        id v24 = self->_tipiHealingTimer;
        self->_tipiHealingTimer = 0;
      }
      smartRoutingManualDisconnectionList = self->_smartRoutingManualDisconnectionList;
      if (smartRoutingManualDisconnectionList)
      {
        [(NSMutableArray *)smartRoutingManualDisconnectionList removeAllObjects];
        unint64_t v26 = self->_smartRoutingManualDisconnectionList;
      }
      else
      {
        unint64_t v26 = 0;
      }
      self->_smartRoutingManualDisconnectionList = 0;

      srBudswapDeviceMap = self->_srBudswapDeviceMap;
      if (srBudswapDeviceMap)
      {
        [(NSMutableDictionary *)srBudswapDeviceMap removeAllObjects];
        unsigned int v28 = self->_srBudswapDeviceMap;
      }
      else
      {
        unsigned int v28 = 0;
      }
      self->_srBudswapDeviceMap = 0;

      id v29 = self->_smartRoutingWxDeviceMap;
      if (v29)
      {
        [(NSMutableDictionary *)v29 removeAllObjects];
        uint64_t v30 = self->_smartRoutingWxDeviceMap;
      }
      else
      {
        uint64_t v30 = 0;
      }
      self->_smartRoutingWxDeviceMap = 0;

      smartRoutingBackOffMap = self->_smartRoutingBackOffMap;
      if (smartRoutingBackOffMap)
      {
        [(NSMutableDictionary *)smartRoutingBackOffMap removeAllObjects];
        uint64_t v32 = self->_smartRoutingBackOffMap;
      }
      else
      {
        uint64_t v32 = 0;
      }
      self->_smartRoutingBackOffMap = 0;

      highActivityLevelTimer = self->_highActivityLevelTimer;
      if (highActivityLevelTimer)
      {
        uint64_t v34 = highActivityLevelTimer;
        dispatch_source_cancel(v34);
        uint64_t v35 = self->_highActivityLevelTimer;
        self->_highActivityLevelTimer = 0;
      }
      phoneOwnershipTriangleTimer = self->_phoneOwnershipTriangleTimer;
      if (phoneOwnershipTriangleTimer)
      {
        unint64_t v37 = phoneOwnershipTriangleTimer;
        dispatch_source_cancel(v37);
        unsigned __int8 v38 = self->_phoneOwnershipTriangleTimer;
        self->_phoneOwnershipTriangleTimer = 0;
      }
      idleActivityScoreTimer = self->_idleActivityScoreTimer;
      if (idleActivityScoreTimer)
      {
        CFStringRef v40 = idleActivityScoreTimer;
        dispatch_source_cancel(v40);
        BOOL v41 = self->_idleActivityScoreTimer;
        self->_idleActivityScoreTimer = 0;
      }
      phase1ConnectConfig = self->_phase1ConnectConfig;
      self->_phase1ConnectConfig = 0;
    }
    [(BTSmartRoutingDaemon *)self _prefsChanged];
  }
}

- (BOOL)_aacpConnectedCheck:(id)a3
{
  return ([a3 connectedServices] >> 19) & 1;
}

- (BOOL)allowHijackWithAudioScore:(unsigned int)a3 hijackRoute:(id)a4 hijackDeniedReason:(id *)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  uint64_t v9 = &unk_100261000;
  if (v6 <= 0xC7)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    LOBYTE(v15) = 0;
    goto LABEL_29;
  }
  uint64_t v10 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v8];
  id v11 = [v10 audioStreamState];

  uint64_t v12 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v8];
  id v13 = [v12 otherTipiAudioCategory];
  [(SmartRoutingStats *)self->_stats setHijackActiveRemoteScore:v13];
  unsigned int v14 = [v12 otherTipiDeviceIsWatch];
  if (!v8)
  {
    LOBYTE(v15) = 0;
    long long v19 = @"WxAddress is NULL";
    goto LABEL_13;
  }
  BOOL v15 = v14;
  id v16 = v11;
  id v17 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v8];
  uint64_t v18 = [v17 otherTipiDeviceBTAddress];

  if (v18)
  {
    if (v6 == 401)
    {
      if (!v15)
      {
        long long v20 = @"3rd Party ringtone shall not hijack non-watch tipi device";
        goto LABEL_22;
      }
      if (v13)
      {
        if (v13 > 0x190)
        {
          +[NSString stringWithFormat:@"Rejected, Remote Category %d >= Local Category %d", v13, 401];
          id v29 = objc_claimAutoreleasedReturnValue();
          *a5 = v29;

          LOBYTE(v15) = 0;
        }
        else
        {
          *a5 = @"Allowed";
          LOBYTE(v15) = 1;
        }
        goto LABEL_23;
      }
      goto LABEL_20;
    }
    if (!v13)
    {
LABEL_20:
      LOBYTE(v15) = 0;
      long long v20 = @"Fall back to legacy hijack";
      goto LABEL_22;
    }
    LOBYTE(v15) = v13 <= v6;
    if (v13 > v6)
    {
      id v23 = +[NSString stringWithFormat:@"Rejected, Remote Category %d > Local Category %d, audio streaming state %d", v13, v6, v16];
      *a5 = v23;
    }
    else
    {
      *a5 = @"Allowed";
    }
    id v24 = [v12 otherTipiDeviceMajorBuildVersion];
    if (self->_prefSmartRoutingPrioritizedCall)
    {
      uint64_t v25 = (uint64_t)v24;
      int DeviceClass = GestaltGetDeviceClass();
      char v27 = 0;
      if (v6 == 501 && DeviceClass == 1)
      {
        unint64_t v37 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice TUCallMap];
        if ([v37 count])
        {
          unsigned int v36 = [v12 otherTipiDeviceBTName];
          unsigned __int8 v28 = [v36 isEqualToString:@"Mac"];
          if (v25 > 14) {
            char v27 = v28;
          }
          else {
            char v27 = 0;
          }
        }
        else
        {
          char v27 = 0;
        }
      }
    }
    else
    {
      char v27 = 0;
    }
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      unsigned __int8 v38 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice TUCallMap];
      [v38 count];
      uint64_t v30 = [v12 otherTipiDeviceBTName];
      [v12 otherTipiDeviceMajorBuildVersion];
      [v12 otherTipiDeviceMinorBuildVersion];
      LogPrintF();
    }
    if (v6 == 501 && v13 <= 0x1F5 && v13 == 501) {
      char v33 = v27;
    }
    else {
      char v33 = 1;
    }
    if ((v33 & 1) == 0)
    {
      +[NSString stringWithUTF8String:"Ambiguity"];
      LOBYTE(v15) = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v27) {
      goto LABEL_23;
    }
    int v34 = (int)v16;
    if (v16 == 3)
    {
      uint64_t v9 = (_DWORD *)&unk_100261000;
      if (v13 == 121
        || v13 == 501
        || [(BTSmartRoutingSourceDevice *)self->_sourceDevice incomingCallRingtone])
      {
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v9 = &unk_100261000;
      if (v34 != 2 || v13 != 501) {
        goto LABEL_24;
      }
    }
    int v35 = v9[46];
    if (v35 <= 30 && (v35 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    LOBYTE(v15) = 0;
    long long v19 = @"Fall back to legacy hijack";
LABEL_13:
    *a5 = v19;
    goto LABEL_24;
  }
  LOBYTE(v15) = 0;
  long long v20 = @"Other Tipi device does not exist";
LABEL_22:
  *a5 = v20;
LABEL_23:
  uint64_t v9 = &unk_100261000;
LABEL_24:
  int v21 = v9[46];
  if (v21 <= 30 && (v21 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

LABEL_29:
  return v15;
}

- (BOOL)_bluetoothProductIDNoEarDetect:(unsigned int)a3
{
  return (a3 - 8195 < 0x24) & (0xC0090064DuLL >> (a3 - 3));
}

- (id)_bluetoothProductIDToAsset:(unsigned int)a3
{
  if (a3 == 8228) {
    unsigned int v3 = 8212;
  }
  else {
    unsigned int v3 = a3;
  }
  if ((v3 & 0xFFFFFFFD) == 0x2019 || v3 == 8222 || v3 == 8224) {
    uint64_t v6 = 8217;
  }
  else {
    uint64_t v6 = v3;
  }
  id v7 = [objc_alloc((Class)NSString) initWithFormat:@"Banner-PID-%u", v6];

  return v7;
}

- (id)_bluetoothProductIDToColorAsset:(unsigned int)a3 withColor:(unsigned __int8)a4
{
  id v4 = [objc_alloc((Class)NSString) initWithFormat:@"Banner-PID-%u-%d", *(void *)&a3, a4];

  return v4;
}

- (id)_bluetoothProductIDToCaseAsset:(unsigned int)a3 andAddress:(id)a4
{
  id v6 = a4;
  if (a3 == 8216 || a3 == 8213 || a3 == 8228) {
    unsigned int v9 = 8212;
  }
  else {
    unsigned int v9 = a3;
  }
  if (v9 - 8219 < 2 || v9 == 8222 || v9 == 8224) {
    uint64_t v12 = 8217;
  }
  else {
    uint64_t v12 = v9;
  }
  if ((v12 - 8210) > 0xB || ((1 << (v12 - 18)) & 0x811) == 0)
  {
    id v15 = [objc_alloc((Class)NSString) initWithFormat:@"Banner-PID-%u-Case", v12, v18];
  }
  else
  {
    unsigned int v14 = [(BTSmartRoutingDaemon *)self _getWxColorCode:v6];
    if (![(BTSmartRoutingDaemon *)self _productColorAssetExists:v12 withColor:(char)v14]|| v14 == 255)
    {
      id v15 = [objc_alloc((Class)NSString) initWithFormat:@"Banner-PID-%u-default-Case", v12, v18];
    }
    else
    {
      id v15 = [objc_alloc((Class)NSString) initWithFormat:@"Banner-PID-%u-%d-Case", v12, v14];
    }
  }
  id v16 = v15;

  return v16;
}

- (id)_bluetoothProductIDToLocalizationString:(unsigned int)a3 withActionButton:(BOOL)a4
{
  char v4 = a3 - 2;
  if (a3 - 8194 > 0x24) {
    goto LABEL_10;
  }
  if (((1 << v4) & 0x145A977A0BLL) != 0)
  {
    CFStringRef v5 = @"CONNECTED_EARBUDS";
LABEL_4:
    CFStringRef v6 = @"CONNECT";
    goto LABEL_7;
  }
  if (((1 << v4) & 0x820200594) == 0)
  {
LABEL_10:
    CFStringRef v5 = @"CONNECTED";
    goto LABEL_4;
  }
  CFStringRef v5 = @"CONNECTED_OVEREAR_HEADPHONES";
  CFStringRef v6 = @"CONNECT_OVEREAR_HEADPHONES";
LABEL_7:
  if (a4) {
    return (id)v6;
  }
  else {
    return (id)v5;
  }
}

- (id)_bluetoothProductDefaultAsset:(unsigned int)a3
{
  id v3 = [objc_alloc((Class)NSString) initWithFormat:@"Banner-PID-%u-default", *(void *)&a3];

  return v3;
}

- (BOOL)_bluetoothProductIDNoUTP:(unsigned int)a3
{
  return (a3 - 8197 < 0x21) & (0x1042409B3uLL >> (a3 - 5));
}

- (void)_budSwapDetectionStartTimer:(id)a3
{
  id v4 = a3;
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatch_time_t v5 = dispatch_time(0, 20000000000);
  budSwapTimer = self->_budSwapTimer;
  if (budSwapTimer)
  {
    dispatch_source_set_timer(budSwapTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  else
  {
    id v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    id v8 = self->_budSwapTimer;
    self->_budSwapTimer = v7;

    unsigned int v9 = self->_budSwapTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000427E0;
    handler[3] = &unk_100233AA8;
    void handler[4] = self;
    uint64_t v12 = 20;
    id v11 = v4;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_budSwapTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_budSwapTimer);
  }
}

- (void)_cacheBudswapInfo:(id)a3
{
  id v4 = a3;
  srBudswapDeviceMap = self->_srBudswapDeviceMap;
  id v15 = v4;
  if (!srBudswapDeviceMap)
  {
    CFStringRef v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v7 = self->_srBudswapDeviceMap;
    self->_srBudswapDeviceMap = v6;

    id v4 = v15;
    srBudswapDeviceMap = self->_srBudswapDeviceMap;
  }
  id v8 = [(NSMutableDictionary *)srBudswapDeviceMap objectForKeyedSubscript:v4];
  if (!v8) {
    id v8 = objc_alloc_init(BTSmartRoutingBudswapDevice);
  }
  [(BTSmartRoutingBudswapDevice *)v8 setReconnectionState:0];
  unsigned int v9 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v15];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = [v9 otherTipiDeviceBTAddress];

    if (v11)
    {
      uint64_t v12 = [v10 otherTipiDeviceBTAddress];
      id v13 = [v10 otherTipiDeviceBTName];
      unsigned int v14 = [v10 otherTipiDeviceVersion];
      [(BTSmartRoutingBudswapDevice *)v8 _cacheInfo:v15 andAddress:v12 andName:v13 andVersion:v14];
    }
  }
  [(NSMutableDictionary *)self->_srBudswapDeviceMap setObject:v8 forKeyedSubscript:v15];
}

- (int64_t)_checkTickswithinWindow:(unint64_t)a3 withWindow:(unint64_t)a4
{
  uint64_t v5 = SecondsToUpTicks();
  return v5 + a3 - mach_absolute_time();
}

- (void)_checkIfPairedCompanionDeviceSupportsSmartRouting
{
  NRRegistry = self->_NRRegistry;
  if (!NRRegistry)
  {
    id v4 = +[NRPairedDeviceRegistry sharedInstance];
    uint64_t v5 = self->_NRRegistry;
    self->_NRRegistry = v4;

    NRRegistry = self->_NRRegistry;
  }
  CFStringRef v6 = [(NRPairedDeviceRegistry *)NRRegistry getActivePairedDevice];
  id v7 = v6;
  unsigned int v9 = v6;
  if (v6)
  {
    self->_pairedCompanionDeviceSupportsSmartRouting = 1;
    id v8 = [v6 valueForProperty:NRDevicePropertySystemVersion];
    if (GestaltGetDeviceClass() == 1
      && [v8 compare:@"11.0" options:64] == (id)-1)
    {
      self->_pairedCompanionDeviceSupportsSmartRouting = 0;
    }

    id v7 = v9;
  }
  if (dword_1002610B8 <= 30)
  {
    if (dword_1002610B8 != -1 || (v6 = (void *)_LogCategory_Initialize(), id v7 = v9, v6))
    {
      CFStringRef v6 = (void *)LogPrintF();
      id v7 = v9;
    }
  }

  _objc_release_x1(v6, v7);
}

- (void)_disconnectOtherTipiDevice:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(BTSmartRoutingDaemon *)self _myBluetoothAddressString];
    v9[0] = v5;
    v9[1] = @"FF:FF:FF:FF:FF:FF";
    CFStringRef v6 = +[NSArray arrayWithObjects:v9 count:2];
    id v7 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v4];

    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      id v8 = v6;
      LogPrintF();
    }
    -[BTSmartRoutingDaemon _updateAccessoryID:connectionDeviceAddresses:completion:](self, "_updateAccessoryID:connectionDeviceAddresses:completion:", v7, v6, &stru_100233AC8, v8);
  }
}

- (void)_disconnectReason:(id)a3 reason:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  self->_unint64_t smartRoutingDisconnectReason = a4;
  if (dword_1002610B8 <= 30)
  {
    id v8 = v6;
    if (dword_1002610B8 != -1 || (v6 = (id)_LogCategory_Initialize(), id v7 = v8, v6))
    {
      id v6 = (id)LogPrintF();
      id v7 = v8;
    }
  }

  _objc_release_x1(v6, v7);
}

- (void)_dumpNearbyWxDevice
{
}

- (void)_dumpSrWxDevice
{
}

- (id)_findActiveWxDevice
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  unsigned int v9 = sub_10001E20C;
  uint64_t v10 = sub_10001E21C;
  id v11 = 0;
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000431AC;
  v5[3] = &unk_1002333A0;
  void v5[4] = self;
  v5[5] = &v6;
  [(NSMutableDictionary *)smartRoutingWxDeviceMap enumerateKeysAndObjectsUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)_isDevicePairedCheck:(id)a3
{
  id v4 = a3;
  if (self->_prefSmartRoutingWatchAutomaticSwitching
    && [(BTSmartRoutingDaemon *)self _isMagnetConnectedDeviceforConnectionCheck:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.icloudpairing"];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = [v6 devices];
    id v7 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v7)
    {
      id v8 = v7;
      id v29 = v6;
      uint64_t v9 = *(void *)v32;
      uint64_t v10 = obj;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v32 != v9) {
            objc_enumerationMutation(v10);
          }
          uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v13 = +[CBIDSManager sharedInstance];
          unsigned int v14 = [v12 uniqueID];
          id v15 = [v13 publicAddressForIDSDevice:v14];

          if (v15)
          {
            id v16 = v15;
            [v16 UTF8String];
            NSDataWithHex();
            id v17 = objc_claimAutoreleasedReturnValue();
            uint64_t v18 = (char *)[v17 bytes];
            if (v18)
            {
              long long v19 = v18;
              if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
              {
                [v12 modelIdentifier];
                int v21 = v20 = v4;
                [v12 name];
                v28 = char v27 = v21;
                id v25 = v20;
                id v26 = v17;
                LogPrintF();

                id v4 = v20;
                uint64_t v10 = obj;
              }
              long long v22 = (unsigned __int16 *)[v4 bytes];
              if (*v22 == *(unsigned __int16 *)(v19 + 3) && *((unsigned __int8 *)v22 + 2) == v19[5])
              {

                BOOL v5 = 1;
                goto LABEL_24;
              }
            }
          }
        }
        id v8 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v8) {
          continue;
        }
        break;
      }
      BOOL v5 = 0;
LABEL_24:
      id v6 = v29;
    }
    else
    {
      BOOL v5 = 0;
    }

    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  return v5;
}

- (BOOL)_isMagnetConnectedDeviceforTipiHealingCheck:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NRPairedDeviceRegistry sharedInstance];
  if (!self->_NRRegistry) {
    objc_storeStrong((id *)&self->_NRRegistry, v5);
  }
  id v6 = [v5 getActivePairedDevice];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 valueForProperty:NRDevicePropertyBluetoothMACAddress];
    uint64_t v9 = [v7 valueForProperty:NRDevicePropertyUDID];
    uint64_t v10 = [v7 valueForProperty:NRDevicePropertyName];
    id v11 = [v7 valueForProperty:NRDevicePropertySystemBuildVersion];
    uint64_t v12 = [v7 valueForProperty:NRDevicePropertyMarketingProductName];
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v8) {
      BOOL v13 = [v8 caseInsensitiveCompare:v4] == 0;
    }
    else {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_isMagnetConnectedDeviceforConnectionCheck:(id)a3
{
  id v3 = a3;
  id v4 = +[NRPairedDeviceRegistry sharedInstance];
  BOOL v5 = [v4 getActivePairedDevice];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 valueForProperty:NRDevicePropertyBluetoothMACAddress];
    [v7 UTF8String];
    NSDataWithHex();
    id v8 = objc_claimAutoreleasedReturnValue();
    uint64_t v9 = (char *)[v8 bytes];
    if (v9
      && ((uint64_t v10 = v9,
           id v11 = (unsigned __int16 *)[v3 bytes],
           *v11 == *(unsigned __int16 *)(v10 + 3))
        ? (BOOL v12 = *((unsigned __int8 *)v11 + 2) == v10[5])
        : (BOOL v12 = 0),
          v12))
    {
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      BOOL v13 = 1;
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_isOnDemandConnectInProgress
{
  return [(SmartRoutingConnectConfig *)self->_phase1ConnectConfig type] == 2;
}

- (BOOL)_isConnectionTipiv2
{
  return [(SmartRoutingConnectConfig *)self->_phase1ConnectConfig type] == 3;
}

- (id)_getActiveNearbyWxAdress
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_10001E20C;
  uint64_t v10 = sub_10001E21C;
  id v11 = 0;
  srDiscoveredDeviceMap = self->_srDiscoveredDeviceMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100043A8C;
  v5[3] = &unk_100233B50;
  void v5[4] = &v6;
  [(NSMutableDictionary *)srDiscoveredDeviceMap enumerateKeysAndObjectsUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_getCurrentRoute
{
  if (self->_isBTRoute) {
    return @"Bluetooth";
  }
  if (self->_isSpeakerRoute) {
    return @"Speaker";
  }
  if (self->_isBuiltInReceiverRoute) {
    return @"Receiver";
  }
  return @"NA";
}

- (BOOL)_getForceDisconnectBit:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(NSMutableDictionary *)self->_wxDevices objectForKeyedSubscript:v4];
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = [v5 bleDevice];
      uint64_t v8 = [v7 advertisementFields];

      BOOL v9 = CFDictionaryGetInt64() != 0;
    }
    else
    {
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_getIDSDeviceFromBtAddress:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.icloudpairing"];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    BOOL v5 = [v4 devices];
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v14 = v4;
      uint64_t v7 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v5);
          }
          BOOL v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v10 = +[CBIDSManager sharedInstance];
          id v11 = [v9 uniqueID];
          BOOL v12 = [v10 publicAddressForIDSDevice:v11];

          if (v12 && ([v12 isEqualToString:v3] & 1) != 0)
          {
            id v6 = v9;

            goto LABEL_16;
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          continue;
        }
        break;
      }
LABEL_16:
      id v4 = v14;
    }
  }
  else
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v6 = 0;
  }

  return v6;
}

- (id)_getInEarSrWxDevice
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = sub_10001E20C;
  uint64_t v10 = sub_10001E21C;
  id v11 = 0;
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100043F88;
  v5[3] = &unk_100233350;
  void v5[4] = &v6;
  [(NSMutableDictionary *)smartRoutingWxDeviceMap enumerateKeysAndObjectsUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_getJsonStringFromDictionary:(id)a3
{
  id v3 = +[NSJSONSerialization dataWithJSONObject:a3 options:1 error:0];
  id v4 = [objc_alloc((Class)NSString) initWithData:v3 encoding:4];

  return v4;
}

- (int64_t)_getRssiNearby:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(NSMutableDictionary *)self->_wxDevices objectForKeyedSubscript:v4];
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 bleDevice];
      id v8 = [v7 rssi];
    }
    else
    {
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return (int64_t)v8;
}

- (void)getSmartRoutingStateForDeviceAddress:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000441E4;
  v7[3] = &unk_100232A10;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (id)_getWxChipVersion:(unsigned int)a3
{
  if (a3 - 8194 > 0x24) {
    return @"NA";
  }
  else {
    return (id)*((void *)&off_100234050 + (int)(a3 - 8194));
  }
}

- (unsigned)_getWxColorCode:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = -1;
  wxDevices = self->_wxDevices;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000444D4;
  v13[3] = &unk_100233B78;
  id v6 = v4;
  id v14 = v6;
  long long v15 = &v16;
  [(NSMutableDictionary *)wxDevices enumerateKeysAndObjectsUsingBlock:v13];
  int v7 = *((unsigned __int8 *)v17 + 24);
  if (v7 == 255)
  {
    connectedDevices = self->_connectedDevices;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100044674;
    v10[3] = &unk_1002333C8;
    id v11 = v6;
    BOOL v12 = &v16;
    [(NSMutableDictionary *)connectedDevices enumerateKeysAndObjectsUsingBlock:v10];

    LOBYTE(v7) = *((unsigned char *)v17 + 24);
  }

  _Block_object_dispose(&v16, 8);
  return v7;
}

- (id)_getWxFWVersion:(id)a3
{
  id v4 = a3;
  wxFirmwareCache = self->_wxFirmwareCache;
  if (!wxFirmwareCache)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    int v7 = self->_wxFirmwareCache;
    self->_wxFirmwareCache = v6;

    wxFirmwareCache = self->_wxFirmwareCache;
  }
  id v8 = [(NSMutableDictionary *)wxFirmwareCache objectForKeyedSubscript:v4];

  if (v8)
  {
    BOOL v9 = [(NSMutableDictionary *)self->_wxFirmwareCache objectForKeyedSubscript:v4];
  }
  else
  {
    [(CBDiscovery *)self->_pairedDiscovery discoveredDevices];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v22;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v16 = [v15 btAddressData];
          long long v17 = CUPrintNSDataAddress();

          if (v4)
          {
            if (v17)
            {
              if ([v4 isEqualToString:v17])
              {
                uint64_t v18 = [v15 firmwareVersion];
                unsigned __int8 v19 = [v18 isEqualToString:@"0.0.1"];

                if ((v19 & 1) == 0)
                {
                  BOOL v9 = [v15 firmwareVersion];
                  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
                    LogPrintF();
                  }

                  goto LABEL_22;
                }
              }
            }
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    BOOL v9 = 0;
LABEL_22:
  }

  return v9;
}

- (unsigned)_getWxProductID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(CBDiscovery *)self->_pairedDiscovery discoveredDevices];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          BOOL v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          id v10 = [v9 btAddressData:v13];
          id v11 = CUPrintNSDataAddress();

          if (v11 && ([v4 isEqualToString:v11] & 1) != 0)
          {
            LODWORD(v6) = [v9 productID];

            goto LABEL_14;
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    LODWORD(v6) = 0;
  }

  return v6;
}

- (void)handleActivityScoreUpdate:(int)a3
{
  if (self->_score != a3)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_uint64_t score = a3;
    [(BTSmartRoutingDaemon *)self _sendTipiScoreUpdateToWx];
  }
}

- (void)_handleCallStateChange:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100044C94;
  v7[3] = &unk_100232A10;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (void)_handleMediaPlayStateChange:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100044E68;
  v7[3] = &unk_100232A10;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (void)_handleMediaPauseStateChanged
{
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v3 = +[AAConversationDetectSessionManager sharedCDSessionManager];
  unsigned int v4 = [v3 cdSignalAudioInterrupted];

  if (v4)
  {
    id v5 = +[AAConversationDetectSessionManager sharedCDSessionManager];
    id v6 = [v5 currentCDDeviceIdentifier];
    cdDeviceIdentifier = self->_cdDeviceIdentifier;
    self->_cdDeviceIdentifier = v6;

    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
LABEL_13:
    }
      LogPrintF();
  }
  else
  {
    id v8 = self->_cdDeviceIdentifier;
    self->_cdDeviceIdentifier = 0;

    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_13;
    }
  }
}

- (void)_handleHighestAudioCategoryChange:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100045230;
  v7[3] = &unk_100232A10;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (void)_handleHRMSessionChanged:(BOOL)a3
{
  if (a3)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if ([(BTSmartRoutingDaemon *)self _isAnyHRMEnabledDeviceConnected])
    {
      if (!self->_isActiveHRMSession)
      {
        self->_uint64_t score = 7;
        [(BTSmartRoutingDaemon *)self _nearbyInfoSetAudioRoutingScore];
        self->_isActiveHRMSession = 1;
      }
    }
  }
  else
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (self->_isActiveHRMSession)
    {
      self->_isActiveHRMSession = 0;
      [(BTSmartRoutingDaemon *)self _nearbyInfoSetAudioRoutingScore];
    }
  }
}

- (void)_handleMediaServerConnectionDied:(id)a3
{
  [(BTSmartRoutingDaemon *)self _mediaRouteMonitorEnsureStopped];

  [(BTSmartRoutingDaemon *)self _mediaRouteMonitorEnsureStarted];
}

- (void)_handleHijackBlockingwithDevice:(id)a3
{
  id v4 = a3;
  if (self->_prefSmartRoutingBlockHijackWindowinSeconds)
  {
    p_hijackBackOffTimer = &self->_hijackBackOffTimer;
    hijackBackOffTimer = self->_hijackBackOffTimer;
    if (hijackBackOffTimer)
    {
      uint64_t v7 = hijackBackOffTimer;
      dispatch_source_cancel(v7);
      id v8 = *p_hijackBackOffTimer;
      *p_hijackBackOffTimer = 0;
    }
    dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)&self->_hijackBackOffTimer, v9);
    self->_hijackBackoffCount = 0;
    id v10 = self->_hijackBackOffTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000456FC;
    handler[3] = &unk_100232B98;
    void handler[4] = v9;
    void handler[5] = self;
    id v11 = v4;
    id v15 = v11;
    dispatch_source_set_event_handler(v10, handler);
    dispatch_time_t v12 = dispatch_time(0x8000000000000000, 1000000000 * self->_prefSmartRoutingBlockHijackWindowinSeconds);
    dispatch_source_set_timer((dispatch_source_t)self->_hijackBackOffTimer, v12, 1000000000 * self->_prefSmartRoutingBlockHijackWindowinSeconds, 0x3B9ACA00uLL);
    dispatch_activate((dispatch_object_t)self->_hijackBackOffTimer);
    long long v13 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v11];
    [v13 _setHijackBackoffTick:mach_absolute_time()];

    self->_BOOL hijackBackOffInitiator = 1;
    [(BTSmartRoutingDaemon *)self _updateLocalAudioCategory:self->_localDeviceAudioCatogory];
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)_handlePairedWatchStatusDidChange
{
  NRRegistry = self->_NRRegistry;
  if (!NRRegistry)
  {
    id v4 = +[NRPairedDeviceRegistry sharedInstance];
    id v5 = self->_NRRegistry;
    self->_NRRegistry = v4;

    NRRegistry = self->_NRRegistry;
  }
  id v8 = [(NRPairedDeviceRegistry *)NRRegistry getActivePairedDevice];
  if (v8)
  {
    self->_pairedDeviceContainsCompanionWatch = 1;
    [(BTSmartRoutingDaemon *)self _checkIfPairedCompanionDeviceSupportsSmartRouting];
  }
  else
  {
    *(_WORD *)&self->_pairedDeviceContainsCompanionWatch = 0;
  }
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    if (self->_pairedDeviceContainsCompanionWatch) {
      id v6 = "yes";
    }
    else {
      id v6 = "no";
    }
    uint64_t v7 = v6;
    LogPrintF();
  }
  [(BTSmartRoutingDaemon *)self _prefsChanged];
}

- (void)_handlePhoneOwnershipTriangleTimer
{
  uint64_t v18 = 0;
  unsigned __int8 v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = sub_10001E20C;
  long long v22 = sub_10001E21C;
  id v23 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100045DAC;
  v17[3] = &unk_100232B20;
  v17[4] = self;
  v17[5] = &v18;
  id v3 = objc_retainBlock(v17);
  id v4 = [(BTSmartRoutingDaemon *)self _getInEarSrWxDevice];
  id v5 = v4;
  if (!v4)
  {
    id v10 = v19;
    id v6 = (void *)v19[5];
    CFStringRef v11 = @"Couldn't find inEar Wx";
LABEL_15:
    void v10[5] = (uint64_t)v11;
    goto LABEL_12;
  }
  if ([v4 proactiveRoutingBackoff])
  {
    id v10 = v19;
    id v6 = (void *)v19[5];
    CFStringRef v11 = @"Proactive Routing backoff is in effect!";
    goto LABEL_15;
  }
  id v6 = [v5 deviceAddress];
  id v7 = [objc_alloc((Class)NSString) initWithFormat:@"Already routed: %@", v6];
  if ([v5 routed])
  {
    dispatch_time_t v12 = v19;
    id v13 = v7;
    long long v14 = (void *)v12[5];
    v12[5] = (uint64_t)v13;
  }
  else
  {
    if ([v5 otherTipiDeviceIsWatch])
    {
      id v8 = [v5 otherTipiDeviceBTAddress];

      if (v8)
      {
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        self->_proactiveRoutingInProgress = 1;
        dispatch_source_t v9 = +[NSString stringWithFormat:@"%@%@", v6, @"-tacl"];
        [(BTSmartRoutingDaemon *)self _smartRoutingChangeRoute:v9];

        [(BTSmartRoutingDaemon *)self _relayConduitMessageSend:1 withOptions:&off_1002444D0 andWxAddress:v6 andOtherAddress:0];
        [(BTSmartRoutingDaemon *)self _startRouteCheckTimer:v6 andType:12];
        goto LABEL_11;
      }
      id v15 = v19;
      long long v14 = (void *)v19[5];
      CFStringRef v16 = @"Not in Tipi";
    }
    else
    {
      id v15 = v19;
      long long v14 = (void *)v19[5];
      CFStringRef v16 = @"Other tipi device is not watch";
    }
    void v15[5] = (uint64_t)v16;
  }

LABEL_11:
LABEL_12:

  ((void (*)(void *))v3[2])(v3);
  _Block_object_dispose(&v18, 8);
}

- (void)_handleProactiveRoutingRouteCheck:(id)a3
{
  id v8 = a3;
  id v4 = [(BTSmartRoutingDaemon *)self _getCurrentRoute];
  if (([v4 isEqualToString:@"Bluetooth"] & 1) == 0)
  {
    id v5 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v8];
    if (v5)
    {
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        [v5 setProactiveRoutingBackoff:1 v8, v4];
      }
      else
      {
        [v5 setProactiveRoutingBackoff:1 v6, v7];
      }
    }
  }
}

- (void)_handleSmartRoutingDisabled:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v4];
    if (v5)
    {
      [(BTSmartRoutingDaemon *)self _sendTipiScoreUpdateToWx];
      uint64_t v6 = [(BTSmartRoutingDaemon *)self _myBluetoothAddressString];
      uint64_t v7 = [v5 otherTipiDeviceBTAddress];
      id v8 = [(NSMutableDictionary *)self->_connectedDevicesInEarCache objectForKeyedSubscript:v4];
      unsigned int v9 = [v8 BOOLValue];

      unsigned int v10 = [(BTSmartRoutingDaemon *)self _isOtherTipiDeviceBeforeTrain:v7 withIOS:16 withMacOS:13];
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
      {
        unsigned int v11 = [v5 routed];
        dispatch_time_t v12 = "no";
        if (v11) {
          id v13 = "yes";
        }
        else {
          id v13 = "no";
        }
        if (v9) {
          long long v14 = "yes";
        }
        else {
          long long v14 = "no";
        }
        if (v10) {
          dispatch_time_t v12 = "yes";
        }
        long long v24 = v14;
        id v25 = v12;
        long long v22 = v13;
        id v23 = v7;
        LogPrintF();
      }
      if (objc_msgSend(v5, "otherTipiDeviceIsWatch", v22, v23, v24, v25))
      {
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
      }
      else
      {
        if ([v5 routed]) {
          goto LABEL_26;
        }
        id v15 = [v5 otherTipiDeviceBTAddress];
        int v16 = v9 ^ 1;
        if (!v15) {
          int v16 = 1;
        }
        int v17 = v16 | v10;

        if (v17 == 1)
        {
LABEL_26:
          [(BTSmartRoutingDaemon *)self _disconnectOtherTipiDevice:v4];
        }
        else
        {
          if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          CFStringRef v26 = @"disableSmartRouting";
          char v27 = v6;
          uint64_t v18 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
          unsigned __int8 v19 = [v5 otherTipiDeviceBTAddress];
          [(BTSmartRoutingDaemon *)self _relayConduitMessageSend:1 withOptions:v18 andWxAddress:v4 andOtherAddress:v19];

          uint64_t v20 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice isFirstConnectionAfterSREnable];

          if (!v20)
          {
            id v21 = objc_alloc_init((Class)NSMutableDictionary);
            [(BTSmartRoutingSourceDevice *)self->_sourceDevice setIsFirstConnectionAfterSREnable:v21];
          }
          [(BTSmartRoutingDaemon *)self _setIsFirstConnentionAfterSREnable:1 forDevice:v4];
        }
      }
    }
    else if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_handleTriangleRecoveryInitiated:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100046384;
  v7[3] = &unk_100232A10;
  id v8 = v4;
  unsigned int v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (void)_hijackBackoffReset:(id)a3 withReason:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    id v11 = v13;
    id v12 = v6;
    LogPrintF();
  }
  -[BTSmartRoutingDaemon _submitHijackBlockMetric:withReason:](self, "_submitHijackBlockMetric:withReason:", v13, v6, v11, v12);
  hijackBackOffTimer = self->_hijackBackOffTimer;
  if (hijackBackOffTimer)
  {
    id v8 = hijackBackOffTimer;
    dispatch_source_cancel(v8);
    unsigned int v9 = self->_hijackBackOffTimer;
    self->_hijackBackOffTimer = 0;
  }
  unsigned int v10 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v13];
  [v10 _setHijackBackoffTick:0];

  self->_BOOL hijackBackOffInitiator = 0;
  [(BTSmartRoutingDaemon *)self _sendAudioCategory:v13 withAudioCategory:self->_localDeviceAudioCatogory];
  [(BTSmartRoutingDaemon *)self _postNotification:"com.apple.BluetoothServices.AudioRoutingChanged"];
}

- (BOOL)_isAnyWxStream
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004671C;
  v5[3] = &unk_1002333A0;
  void v5[4] = self;
  void v5[5] = &v6;
  [(NSMutableDictionary *)smartRoutingWxDeviceMap enumerateKeysAndObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isAddDeviceToBackoffDueToDisconnect
{
  unint64_t smartRoutingDisconnectReason = self->_smartRoutingDisconnectReason;
  return smartRoutingDisconnectReason == 10720 || smartRoutingDisconnectReason == 328;
}

- (BOOL)_isForceRejectPipe
{
  return self->_prefSmartRoutingForceRejectLePipe;
}

- (BOOL)_isForceTipiv2
{
  return self->_prefSmartRoutingForceTipiv2;
}

- (BOOL)_isEligibleForTipiV2:(id)a3 firstDeviceTipiScore:(int)a4 secondDeviceTipiScore:(int)a5 currentDeviceScore:(int)a6 sourceDeviceCount:(unsigned int)a7 isOnDemandConnect:(BOOL)a8 address:(id)a9 lastConnectedHost:(id)a10
{
  BOOL v10 = a8;
  id v15 = a3;
  id v16 = a9;
  id v17 = a10;
  uint64_t v18 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v16];
  unsigned __int8 v19 = v18;
  if (v18)
  {
    unsigned int v47 = a5;
    uint64_t v20 = [v18 address];
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      if (a4 > 0xF) {
        id v21 = "?";
      }
      else {
        id v21 = off_1002342D0[a4];
      }
      long long v45 = v21;
      if (v47 > 0xF) {
        long long v22 = "?";
      }
      else {
        long long v22 = off_1002342D0[v47];
      }
      uint64_t v44 = v22;
      id v46 = v17;
      if (a6 > 0xF) {
        id v23 = "?";
      }
      else {
        id v23 = off_1002342D0[a6];
      }
      uint64_t v43 = v23;
      long long v24 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice isFirstConnectionAfterSREnable];
      id v25 = [v24 objectForKeyedSubscript:v20];
      if (v10) {
        CFStringRef v26 = "yes";
      }
      else {
        CFStringRef v26 = "no";
      }
      unint64_t v27 = (unint64_t)[v19 audioState];
      if (v27 > 3) {
        unsigned __int8 v28 = "?";
      }
      else {
        unsigned __int8 v28 = off_100234250[v27];
      }
      BOOL v41 = v26;
      id v42 = v28;
      unsigned __int8 v39 = v43;
      CFStringRef v40 = v25;
      unint64_t v37 = v45;
      unsigned __int8 v38 = v44;
      id v35 = v16;
      id v36 = v15;
      long long v34 = v20;
      LogPrintF();

      id v17 = v46;
      if (v10) {
        goto LABEL_40;
      }
    }
    else if (v10)
    {
      goto LABEL_40;
    }
    id v29 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice isFirstConnectionAfterSREnable];
    uint64_t v30 = [v29 objectForKey:v20];

    if (!v30)
    {
      if (v15
        && [@"5A187" compare:v15 options:64] == (id)-1
        && [(BTSmartRoutingDaemon *)self _isForceTipiv2])
      {
        if (a7 == 1)
        {
          int v31 = (a4 - 1) < 7;
          if (a4 == 12) {
            int v31 = [v19 outOfCaseTime] <= 2 && [v19 audioState] == 0;
          }
          if (GestaltGetDeviceClass() == 1) {
            v31 |= [(BTSmartRoutingDaemon *)self _isMagnetConnectedDeviceforConnectionCheck:v17];
          }
        }
        else
        {
          LOBYTE(v31) = 0;
          if ((a4 - 1) <= 6 && a7 == 2) {
            LOBYTE(v31) = v47 == 9 || v47 - 1 < 7;
          }
        }
        goto LABEL_41;
      }
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
LABEL_40:
    LOBYTE(v31) = 0;
LABEL_41:

    goto LABEL_42;
  }
  if (dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  LOBYTE(v31) = 0;
LABEL_42:

  return v31;
}

- (BOOL)_isEligibleForPreemptiveBanner:(BOOL)a3 firstPreemptiveBanner:(BOOL)a4 inEarState:(BOOL)a5 srDeviceCount:(unint64_t)a6 audioState:(int64_t)a7 inAddress:(id)a8
{
  BOOL v10 = a4;
  id v13 = a8;
  if (a3 || v10)
  {
    CFStringRef v18 = @"Preemptive Banner shown already";
    goto LABEL_13;
  }
  long long v14 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v13];

  if (v14)
  {
    CFStringRef v18 = @"Device already connected";
    goto LABEL_13;
  }
  if ([(NSNumber *)self->_localDeviceAudioCatogory intValue] >= 201
    && ![(BTSmartRoutingDaemon *)self _isOnDemandConnectInProgress])
  {
    long long v22 = +[NSString stringWithFormat:@"_localDeviceAudioCatogory check failed, _localDeviceAudioCatogory : %u", [(NSNumber *)self->_localDeviceAudioCatogory intValue]];
    [(BTSmartRoutingDaemon *)self _logPreemptiveBannerEvalError:v22];
LABEL_27:

    goto LABEL_14;
  }
  if (self->_playbackStart && !self->_playbackStartTimer)
  {
    CFStringRef v18 = @"Playback start timer has expired";
LABEL_13:
    [(BTSmartRoutingDaemon *)self _logPreemptiveBannerEvalError:v18];
LABEL_14:
    BOOL v17 = 0;
    goto LABEL_15;
  }
  if (!a5)
  {
    CFStringRef v18 = @"inEar state is NO";
    goto LABEL_13;
  }
  if (a7 >= 2)
  {
    uint64_t v20 = "?";
    if (a7 == 2) {
      uint64_t v20 = "HFP Call";
    }
    if (a7 == 3) {
      id v21 = "HFP Other";
    }
    else {
      id v21 = v20;
    }
    long long v22 = +[NSString stringWithUTF8String:v21];
    id v23 = +[NSString stringWithFormat:@"audioState is %@", v22];
    [(BTSmartRoutingDaemon *)self _logPreemptiveBannerEvalError:v23];

    goto LABEL_27;
  }
  id v15 = [(NSMutableDictionary *)self->_srBudswapDeviceMap objectForKeyedSubscript:v13];
  unsigned int v16 = [v15 reconnectionState];

  if (v16 == 1)
  {
    CFStringRef v18 = @"Budswap reconnection";
    goto LABEL_13;
  }
  BOOL v17 = 1;
LABEL_15:

  return v17;
}

- (BOOL)_isInEarToOutOfEar:(id)a3
{
  id v4 = a3;
  id v5 = [v4 btAddressData];
  uint64_t v6 = CUPrintNSDataAddress();

  uint64_t v7 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v6];
  unsigned __int8 v8 = -[BTSmartRoutingDaemon _bluetoothProductIDNoEarDetect:](self, "_bluetoothProductIDNoEarDetect:", [v7 productID]);

  BOOL v9 = (v8 & 1) == 0
    && [(BTSmartRoutingDaemon *)self _inEarConnectedCheck:v6]
    && [v4 primaryPlacement] != 1
    && [v4 secondaryPlacement] != 1;

  return v9;
}

- (BOOL)isInAnyTipi
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100046EF0;
  v5[3] = &unk_1002333A0;
  void v5[4] = self;
  void v5[5] = &v6;
  [(NSMutableDictionary *)smartRoutingWxDeviceMap enumerateKeysAndObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isInTipi
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004713C;
  v5[3] = &unk_100233350;
  void v5[4] = &v6;
  [(NSMutableDictionary *)smartRoutingWxDeviceMap enumerateKeysAndObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_inEarConnectedCheck:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v4];

  if (v5)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v4];
    if (-[BTSmartRoutingDaemon _bluetoothProductIDNoEarDetect:](self, "_bluetoothProductIDNoEarDetect:", [v6 productID]))
    {
      BOOL v7 = 1;
    }
    else
    {
      uint64_t v8 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v4];
      if ([v8 primaryPlacement] == 1)
      {
        BOOL v7 = 1;
      }
      else
      {
        char v9 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v4];
        if ([v9 secondaryPlacement] == 1)
        {
          BOOL v7 = 1;
        }
        else
        {
          BOOL v10 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v4];
          if ([v10 primaryPlacement] == 7)
          {
            BOOL v7 = 1;
          }
          else
          {
            id v11 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v4];
            BOOL v7 = [v11 secondaryPlacement] == 7;
          }
        }
      }
    }

    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      id v12 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v4];
      [v12 primaryPlacement];
      id v13 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v4];
      [v13 secondaryPlacement];
      LogPrintF();
    }
  }
  else
  {
    if (dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_inEarNearbyCheck:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  unsigned __int8 v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  wxDevices = self->_wxDevices;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  void v9[2] = sub_10004758C;
  v9[3] = &unk_100233BA0;
  id v6 = v4;
  id v10 = v6;
  id v11 = self;
  id v12 = &v18;
  id v13 = &v14;
  [(NSMutableDictionary *)wxDevices enumerateKeysAndObjectsUsingBlock:v9];
  if (!*((unsigned char *)v15 + 24)
    && dword_1002610B8 <= 90
    && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  char v7 = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v7;
}

- (BOOL)_inCaseLidClosed:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v4];
  id v6 = [v5 identifier];

  if (v6)
  {
    char v7 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v6];
    uint64_t v8 = v7;
    if (v7)
    {
      if ([v7 primaryInCase]) {
        unsigned __int8 v9 = [v8 secondaryInCase];
      }
      else {
        unsigned __int8 v9 = 0;
      }
      unsigned __int8 v10 = [v8 lidClosed];
    }
    else
    {
      unsigned __int8 v10 = 0;
      unsigned __int8 v9 = 0;
    }
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    char v11 = v9 & v10;
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)_isAnyConnectedWxInEarCheck
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  connectedDevices = self->_connectedDevices;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000479C0;
  v5[3] = &unk_1002333C8;
  void v5[4] = self;
  void v5[5] = &v6;
  [(NSMutableDictionary *)connectedDevices enumerateKeysAndObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isAllWxEnabledInEarDetection
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100047B50;
  v5[3] = &unk_1002333A0;
  void v5[4] = self;
  void v5[5] = &v6;
  [(NSMutableDictionary *)smartRoutingWxDeviceMap enumerateKeysAndObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isAnyHRMEnabledDeviceConnected
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  connectedDevices = self->_connectedDevices;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100047C58;
  v5[3] = &unk_100233300;
  void v5[4] = &v6;
  [(NSMutableDictionary *)connectedDevices enumerateKeysAndObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isInEarDetectionDisabled:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (v5
    && (-[BTSmartRoutingDaemon _bluetoothProductIDNoEarDetect:](self, "_bluetoothProductIDNoEarDetect:", [v5 productID])|| objc_msgSend(v6, "primaryPlacement") == 7|| objc_msgSend(v6, "secondaryPlacement") == 7))
  {
    if (dword_1002610B8 > 30)
    {
      BOOL v7 = 1;
      goto LABEL_17;
    }
    if (dword_1002610B8 == -1)
    {
      BOOL v7 = 1;
      if (!_LogCategory_Initialize()) {
        goto LABEL_17;
      }
    }
    else
    {
      BOOL v7 = 1;
    }
  }
  else
  {
    if (dword_1002610B8 > 30)
    {
      BOOL v7 = 0;
      goto LABEL_17;
    }
    if (dword_1002610B8 == -1)
    {
      BOOL v7 = 0;
      if (!_LogCategory_Initialize()) {
        goto LABEL_17;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  LogPrintF();
LABEL_17:

  return v7;
}

- (BOOL)_isManualConnection:(id)a3
{
  char v3 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:a3];
  id v4 = v3;
  if (v3) {
    unint64_t v5 = ((unint64_t)[v3 deviceFlags] >> 18) & 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_isMyAddress:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(BTSmartRoutingDaemon *)self _myBluetoothAddressString];
    [v5 UTF8String];
    uint64_t v6 = NSDataWithHex();
    if ([v6 length] == (id)6)
    {
      BOOL v7 = (char *)[v6 bytes];
      uint64_t v8 = (unsigned __int16 *)[v4 bytes];
      BOOL v10 = *v8 == *(unsigned __int16 *)(v7 + 3) && *((unsigned __int8 *)v8 + 2) == v7[5];
    }
    else
    {
      if (dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      BOOL v10 = 0;
    }
  }
  else
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_isOtherTipiDeviceBeforeTrain:(id)a3 withIOS:(unsigned int)a4 withMacOS:(unsigned int)a5
{
  id v7 = a3;
  if (v7)
  {
    id v8 = [objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.icloudpairing"];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    char v9 = [v8 devices];
    id v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      id v21 = v8;
      uint64_t v11 = *(void *)v26;
      uint64_t v22 = a5;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v14 = +[CBIDSManager sharedInstance];
          id v15 = [v13 uniqueID];
          uint64_t v16 = [v14 publicAddressForIDSDevice:v15];

          if (v16 && [v16 isEqualToString:v7])
          {
            char v17 = [v13 productName];
            if ([v17 isEqualToString:@"iPhone OS"])
            {
              if (v13)
              {
                [v13 operatingSystemVersion];
                uint64_t v18 = v24;
              }
              else
              {
                uint64_t v18 = 0;
                uint64_t v24 = 0;
              }
              if (v18 < a4)
              {

LABEL_27:
                LOBYTE(v10) = 1;
                goto LABEL_28;
              }
            }
            unsigned __int8 v19 = [v13 modelIdentifier];
            if ([v19 containsString:@"Mac"])
            {
              if (v13)
              {
                [v13 operatingSystemVersion];
                id v13 = v23;
              }
              else
              {
                id v23 = 0;
              }

              if ((uint64_t)v13 < v22) {
                goto LABEL_27;
              }
            }
            else
            {
            }
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v10) {
          continue;
        }
        break;
      }
LABEL_28:
      id v8 = v21;
    }
  }
  else
  {
    if (dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    LOBYTE(v10) = 0;
  }

  return (char)v10;
}

- (BOOL)_isReceivedLegacyTipiConnect:(id)a3
{
  return [(NSString *)self->_tipiElectionReceivedLePipe isEqualToString:a3];
}

- (void)_iPhoneScreenOnPowerEvent
{
  [(BTSmartRoutingDaemon *)self _update];
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    if (self->_uiSmartRoutingBanner) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    CFStringRef v19 = v3;
    LogPrintF();
  }
  id v4 = [(BTBannerUISession *)self->_uiSmartRoutingBanner trailingAccessoryText];
  unsigned int v5 = [v4 isEqualToString:@"Reverse"];

  if (!v5)
  {
    uint64_t v6 = [(BTBannerUISession *)self->_uiSmartRoutingBanner centerContentItemsText];
    unsigned int v7 = [v6 isEqualToString:@"Connected"];

    if (v7)
    {
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        goto LABEL_15;
      }
      goto LABEL_34;
    }
    uint64_t v33 = 0;
    long long v34 = &v33;
    uint64_t v35 = 0x3032000000;
    id v36 = sub_10001E20C;
    unint64_t v37 = sub_10001E21C;
    id v38 = 0;
    uint64_t v27 = 0;
    long long v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = sub_10001E20C;
    int v31 = sub_10001E21C;
    id v32 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2020000000;
    int v26 = 0;
    smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100048734;
    v22[3] = &unk_1002333A0;
    v22[4] = self;
    v22[5] = &v33;
    [(NSMutableDictionary *)smartRoutingWxDeviceMap enumerateKeysAndObjectsUsingBlock:v22];
    if (v34[5])
    {
      char v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxDeviceMap, "objectForKeyedSubscript:");
      uint64_t v10 = [v9 deviceName];
      uint64_t v11 = (void *)v28[5];
      void v28[5] = v10;

      id v12 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v34[5]];
      unsigned int v13 = [v12 productID];
      *((_DWORD *)v24 + 6) = v13;

      if (v34[5]) {
        goto LABEL_39;
      }
    }
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    connectedDevices = self->_connectedDevices;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100048914;
    v21[3] = &unk_100233BC8;
    v21[4] = self;
    v21[5] = &v33;
    v21[6] = &v27;
    v21[7] = &v23;
    [(NSMutableDictionary *)connectedDevices enumerateKeysAndObjectsUsingBlock:v21];
    if (v34[5])
    {
LABEL_39:
      id v15 = -[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:");
      if (v15)
      {
        uint64_t v16 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v34[5]];
        if ([v16 hijackBackoffTicks])
        {
          BOOL isBTRoute = self->_isBTRoute;

          if (!isBTRoute) {
            goto LABEL_33;
          }
        }
        else
        {
        }
        dispatchQueueAVSys = self->_dispatchQueueAVSys;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100048A60;
        block[3] = &unk_100233BF0;
        void block[4] = self;
        void block[5] = &v33;
        void block[6] = &v27;
        block[7] = &v23;
        dispatch_async((dispatch_queue_t)dispatchQueueAVSys, block);
      }
    }
LABEL_33:
    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v27, 8);

    _Block_object_dispose(&v33, 8);
    goto LABEL_34;
  }
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
LABEL_15:
  }
    LogPrintF();
LABEL_34:
  if (!self->_uiSmartRoutingBanner && self->_prefSmartRoutingInUseBanner) {
    [(BTSmartRoutingDaemon *)self _evaluatorRunInUseBanner:0];
  }
}

- (BOOL)_lastConnectIsWatchCheck:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  uint64_t v12 = 0;
  unsigned int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  if (v4)
  {
    nearbyInfoDevices = self->_nearbyInfoDevices;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    void v9[2] = sub_100048D84;
    v9[3] = &unk_100233B78;
    id v10 = v4;
    uint64_t v11 = &v12;
    [(NSMutableDictionary *)nearbyInfoDevices enumerateKeysAndObjectsUsingBlock:v9];
    LODWORD(nearbyInfoDevices) = *((unsigned __int8 *)v13 + 24);

    BOOL v7 = nearbyInfoDevices != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)_logEvalError:(id)a3
{
  [(BTSmartRoutingSourceDevice *)self->_sourceDevice setEvalResult:a3];
  uint64_t v4 = mach_absolute_time();
  sourceDevice = self->_sourceDevice;

  [(BTSmartRoutingSourceDevice *)sourceDevice setEvalTicks:v4];
}

- (void)_logPreemptiveBannerEvalError:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (dword_1002610B8 <= 30)
  {
    if (dword_1002610B8 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v7, v5))
    {
      id v6 = v4;
      LogPrintF();
      id v4 = v7;
    }
  }
  -[BTSmartRoutingSourceDevice setEvalPreemptiveBannerResult:](self->_sourceDevice, "setEvalPreemptiveBannerResult:", v4, v6);
}

- (void)_logEvalWxError:(id)a3 withError:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (v12)
  {
    id v7 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice evalWxMap];

    if (!v7)
    {
      id v8 = objc_alloc_init((Class)NSMutableDictionary);
      [(BTSmartRoutingSourceDevice *)self->_sourceDevice setEvalWxMap:v8];
    }
    char v9 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice evalWxMap];
    id v10 = [v9 objectForKeyedSubscript:v12];

    if (!v10) {
      id v10 = objc_alloc_init(SmartRoutingWxInfo);
    }
    [(SmartRoutingWxInfo *)v10 setLastEvalResult:v6];
    [(SmartRoutingWxInfo *)v10 setLastEvalTicks:mach_absolute_time()];
    uint64_t v11 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice evalWxMap];
    [v11 setObject:v10 forKeyedSubscript:v12];
  }
}

- (double)_lowestBatteryInfoForCBDevice:(id)a3
{
  id v4 = a3;
  if (!-[BTSmartRoutingDaemon _bluetoothProductIDNoUTP:](self, "_bluetoothProductIDNoUTP:", [v4 productID]))
  {
    [v4 batteryLevelLeft];
    if (v8 == 0.0 || ([v4 batteryLevelRight], v9 == 0.0))
    {
      [v4 batteryLevelRight];
      id v12 = v4;
      if (v14 == 0.0)
      {
        [v4 batteryLevelLeft];
        if (v16 == 0.0)
        {
          double v7 = 0.0;
          if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
            goto LABEL_26;
          }
          goto LABEL_27;
        }
        id v12 = v4;
        goto LABEL_17;
      }
    }
    else
    {
      [v4 batteryLevelLeft];
      float v11 = v10;
      [v4 batteryLevelRight];
      id v12 = v4;
      if (v11 <= v13)
      {
LABEL_17:
        [v12 batteryLevelLeft];
        double v7 = v17;
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
          goto LABEL_26;
        }
        goto LABEL_27;
      }
    }
    [v12 batteryLevelRight];
    double v7 = v15;
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  [v4 batteryLevelMain];
  if (v5 == 0.0)
  {
    double v7 = 0.0;
  }
  else
  {
    [v4 batteryLevelMain];
    double v7 = v6;
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
LABEL_26:
    }
      LogPrintF();
  }
LABEL_27:

  return v7;
}

- (double)_lowestBatteryInfoForSFDevice:(id)a3
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = [a3 batteryInfo];
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    double v8 = 1.1;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        float v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        [v10 batteryLevel:v17 *(void *)&v18];
        double v12 = v11;
        if ([(BTSmartRoutingDaemon *)self _checkValidBatteryValue:v10]) {
          BOOL v13 = v12 < v8;
        }
        else {
          BOOL v13 = 0;
        }
        if (v13 && v12 != 0.0)
        {
          if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
          {
            float v14 = (char *)[v10 batteryType];
            float v15 = "?";
            if ((unint64_t)(v14 - 1) <= 3) {
              float v15 = off_100234230[(void)(v14 - 1)];
            }
            double v18 = v12;
            float v17 = v15;
            LogPrintF();
          }
          double v8 = v12;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 1.1;
  }

  return v8;
}

- (void)_nearbyDeviceInfoTriangleRecoveryTimer
{
  dispatch_time_t v3 = dispatch_time(0, 120000000000);
  unint64_t prefSmartRoutingWatchTriangleMagnet = self->_prefSmartRoutingWatchTriangleMagnet;
  if (prefSmartRoutingWatchTriangleMagnet) {
    dispatch_time_t v5 = dispatch_time(0x8000000000000000, 1000000000 * prefSmartRoutingWatchTriangleMagnet);
  }
  else {
    dispatch_time_t v5 = v3;
  }
  if (self->_nearbyInfoDevicesTriangleRecoveryTimer)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    id v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    nearbyInfoDevicesTriangleRecoveryTimer = self->_nearbyInfoDevicesTriangleRecoveryTimer;
    self->_nearbyInfoDevicesTriangleRecoveryTimer = v6;

    double v8 = self->_nearbyInfoDevicesTriangleRecoveryTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000496D0;
    handler[3] = &unk_100232710;
    void handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    dispatch_source_set_timer((dispatch_source_t)self->_nearbyInfoDevicesTriangleRecoveryTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_nearbyInfoDevicesTriangleRecoveryTimer);
  }
}

- (void)_nearbyDeviceInfoCheck
{
  if (self->_nearbyInfoDiscovery && !self->_tipiElectionInProgress)
  {
    uint64_t v10 = 0;
    double v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    if ([(NSMutableDictionary *)self->_nearbyInfoDevices count] == (id)1)
    {
      nearbyInfoDevices = self->_nearbyInfoDevices;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      void v9[2] = sub_100049AAC;
      v9[3] = &unk_100233328;
      void v9[4] = &v10;
      [(NSMutableDictionary *)nearbyInfoDevices enumerateKeysAndObjectsUsingBlock:v9];
    }
    if (*((unsigned char *)v11 + 24))
    {
      smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100049B74;
      v8[3] = &unk_100233650;
      v8[4] = self;
      [(NSMutableDictionary *)smartRoutingWxDeviceMap enumerateKeysAndObjectsUsingBlock:v8];
    }
    nearbyInfoDevicesTriangleRecoveryTimer = self->_nearbyInfoDevicesTriangleRecoveryTimer;
    if (nearbyInfoDevicesTriangleRecoveryTimer)
    {
      id v6 = nearbyInfoDevicesTriangleRecoveryTimer;
      dispatch_source_cancel(v6);
      uint64_t v7 = self->_nearbyInfoDevicesTriangleRecoveryTimer;
      self->_nearbyInfoDevicesTriangleRecoveryTimer = 0;
    }
    _Block_object_dispose(&v10, 8);
  }
}

- (id)_nearbyMacAddressTranslate:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    id v6 = +[CBIDSManager sharedInstance];
    uint64_t v7 = [v6 publicAddressForIDSDevice:v5];

    if (v7)
    {
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [v7 UTF8String];
      double v8 = NSDataWithHex();
      float v9 = v8;
      if (v8)
      {
        id v10 = v8;
      }
      else if (dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      float v9 = 0;
    }
  }
  else
  {
    if (dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    float v9 = 0;
  }

  return v9;
}

- (int)_nearbyDeviceType:(id)a3
{
  id v3 = a3;
  if ([v3 containsString:@"iPhone"])
  {
    int v4 = 1;
  }
  else if ([v3 containsString:@"iPad"])
  {
    int v4 = 2;
  }
  else if ([v3 containsString:@"Mac"])
  {
    int v4 = 3;
  }
  else if ([v3 containsString:@"Watch"])
  {
    int v4 = 4;
  }
  else if ([v3 containsString:@"iPod"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_nearbyWxChanged:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [v5 UUIDString];

  if (v6)
  {
    if (!self->_nearbyWxDeviceMap)
    {
      uint64_t v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      nearbyWxDeviceMap = self->_nearbyWxDeviceMap;
      self->_nearbyWxDeviceMap = v7;
    }
    float v9 = [v4 bleDevice];
    id v10 = [v9 advertisementFields];
    unsigned int Int64Ranged = CFDictionaryGetInt64Ranged();

    uint64_t v12 = [v4 bleDevice];
    char v13 = [v12 advertisementFields];
    uint64_t v14 = CFDictionaryGetInt64Ranged();

    float v15 = [v4 bleDevice];
    float v16 = [v15 advertisementFields];

    uint64_t v44 = CFDictionaryGetInt64Ranged();
    uint64_t v17 = CFDictionaryGetCFDataOfLength();
    double v18 = CFDictionaryGetCFDataOfLength();
    unsigned int v51 = v4;
    id v46 = v18;
    if (v18)
    {
      id v36 = [v18 bytes];
      uint64_t v19 = NSPrintF();
    }
    else
    {
      uint64_t v19 = 0;
    }
    int v20 = CFDictionaryGetInt64Ranged();
    uint64_t v43 = v14;
    uint64_t Int64 = CFDictionaryGetInt64();
    int v39 = CFDictionaryGetInt64Ranged();
    if ((Int64Ranged & 0x24) != 0) {
      unsigned int v37 = 1;
    }
    else {
      unsigned int v37 = [(BTSmartRoutingDaemon *)self _bluetoothProductIDNoEarDetect:v14];
    }
    unsigned __int8 v41 = CFDictionaryGetInt64Ranged();
    unsigned __int8 v40 = CFDictionaryGetInt64Ranged();
    uint64_t v21 = CFDictionaryGetInt64();
    CFStringGetTypeID();
    uint64_t TypedValue = CFDictionaryGetTypedValue();
    uint64_t v23 = &stru_10023D730;
    if (TypedValue) {
      uint64_t v23 = (__CFString *)TypedValue;
    }
    unsigned int v47 = v23;
    uint64_t v49 = v6;
    uint64_t v24 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v6];
    if (!v24) {
      uint64_t v24 = objc_alloc_init(NearbyWxDevice);
    }
    uint64_t v50 = self;
    long long v48 = (void *)v17;
    long long v45 = (void *)v19;
    -[NearbyWxDevice setAddress:](v24, "setAddress:", v19, v36);
    [(NearbyWxDevice *)v24 setAudioState:v20];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    uint64_t v25 = [v51 batteryInfo];
    id v26 = [v25 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v53;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v53 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          if ([v30 batteryType] == (id)2)
          {
            [v30 batteryLevel];
            -[NearbyWxDevice setBatteryLeft:](v24, "setBatteryLeft:");
          }
          if ([v30 batteryType] == (id)3)
          {
            [v30 batteryLevel];
            -[NearbyWxDevice setBatteryRight:](v24, "setBatteryRight:");
          }
          if ([v30 batteryType] == (id)4)
          {
            [v30 batteryLevel];
            -[NearbyWxDevice setBatteryMain:](v24, "setBatteryMain:");
          }
        }
        id v27 = [v25 countByEnumeratingWithState:&v52 objects:v56 count:16];
      }
      while (v27);
    }

    id v4 = v51;
    [(BTSmartRoutingDaemon *)v50 _lowestBatteryInfoForSFDevice:v51];
    -[NearbyWxDevice setLowestBudBatteryInfo:](v24, "setLowestBudBatteryInfo:");
    [(NearbyWxDevice *)v24 setPaired:Int64 != 0];
    [(NearbyWxDevice *)v24 setProductID:v43];
    [(NearbyWxDevice *)v24 setSourceCount:v44];
    int v31 = v48;
    [(NearbyWxDevice *)v24 setLastConnectHost:v48];
    [(NearbyWxDevice *)v24 setLidClosed:v39 == 1];
    [(NearbyWxDevice *)v24 setPrimaryInEar:(Int64Ranged >> 2) & 1];
    [(NearbyWxDevice *)v24 setSecondaryInEar:(Int64Ranged >> 5) & 1];
    [(NearbyWxDevice *)v24 setPrimaryInCase:(Int64Ranged >> 1) & 1];
    [(NearbyWxDevice *)v24 setSecondaryInCase:(Int64Ranged >> 4) & 1];
    [(NearbyWxDevice *)v24 setIsInEar:v37];
    [(NearbyWxDevice *)v24 setIsUTPConnected:Int64Ranged & 1];
    [(NearbyWxDevice *)v24 setIdleTime:v41];
    [(NearbyWxDevice *)v24 setOutOfCaseTime:v40];
    [(NearbyWxDevice *)v24 setIcloudSignedIn:v21 != 0];
    id v32 = v47;
    [(NearbyWxDevice *)v24 setName:v47];
    [(NearbyWxDevice *)v24 setLastWxAdvTicks:mach_absolute_time()];
    if (v44 == 1)
    {
      [(NearbyWxDevice *)v24 setOneSourceLastRouteHost:v48];
      id v6 = v49;
    }
    else
    {
      id v6 = v49;
      if (!v44) {
        [(NearbyWxDevice *)v24 setZeroSourceLastRouteHost:v48];
      }
    }
    [(NSMutableDictionary *)v50->_nearbyWxDeviceMap setObject:v24 forKeyedSubscript:v6];
    if (dword_1002610B8 <= 50 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v33 = [(NearbyWxDevice *)v24 address];
      [(NearbyWxDevice *)v24 isUTPConnected];
      [(NearbyWxDevice *)v24 sourceCount];
      [(NearbyWxDevice *)v24 audioState];
      id v42 = [(NearbyWxDevice *)v24 lastConnectHost];
      long long v34 = [(NearbyWxDevice *)v24 zeroSourceLastRouteHost];
      uint64_t v35 = [(NearbyWxDevice *)v24 oneSourceLastRouteHost];
      [(NearbyWxDevice *)v24 lidClosed];
      [(NearbyWxDevice *)v24 primaryInEar];
      [(NearbyWxDevice *)v24 secondaryInEar];
      [(NearbyWxDevice *)v24 primaryInCase];
      [(NearbyWxDevice *)v24 secondaryInCase];
      [(NearbyWxDevice *)v24 batteryLeft];
      [(NearbyWxDevice *)v24 batteryRight];
      [(NearbyWxDevice *)v24 batteryMain];
      id v6 = v49;
      id v32 = v47;
      LogPrintF();

      id v4 = v51;
      int v31 = v48;
    }
  }
}

- (void)_notifyOtherTipiDeviceTipiScoreChanged:(int)a3 andNewScore:(int)a4
{
  if (self->_prefProactiveOwnershipArbitration)
  {
    int v7 = a4 | a3;
    if (!(a4 | a3)) {
      goto LABEL_9;
    }
    if ([(BTSmartRoutingDaemon *)self _isInTipi])
    {
      nearbyDeviceNotificationTimer = self->_nearbyDeviceNotificationTimer;
      if (nearbyDeviceNotificationTimer)
      {
        float v9 = nearbyDeviceNotificationTimer;
        dispatch_source_cancel(v9);
        id v10 = self->_nearbyDeviceNotificationTimer;
        self->_nearbyDeviceNotificationTimer = 0;
      }
      if ((a4 - 1) < 2 || (a3 - 1) <= 1)
      {
LABEL_9:
        [(BTSmartRoutingDaemon *)self _sendAudioScoreChanged:v7 == 0];
      }
    }
  }
}

- (void)_otherTipiDeviceTipiScoreChanged:(id)a3 withOptions:(id)a4
{
  id v6 = a4;
  if (self->_prefProactiveOwnershipArbitration)
  {
    id v27 = v6;
    int v7 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:a3];
    double v8 = NSDictionaryGetNSNumber();
    id v9 = [v8 intValue];

    unsigned int v10 = [v7 otherTipiDeviceAudioScore];
    CFStringGetTypeID();
    double v11 = CFDictionaryGetTypedValue();
    uint64_t v12 = [v27 objectForKey:@"newTipi"];

    char v13 = [v7 otherTipiDeviceBTAddress];

    if (v13)
    {
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
      {
        if (v10 > 0xF) {
          uint64_t v14 = "?";
        }
        else {
          uint64_t v14 = off_1002342D0[v10];
        }
        if (v9 > 0xF) {
          float v15 = "?";
        }
        else {
          float v15 = off_1002342D0[(int)v9];
        }
        float v16 = "yes";
        if (!v12) {
          float v16 = "no";
        }
        uint64_t v23 = v11;
        uint64_t v24 = v14;
        uint64_t v25 = v15;
        id v26 = v16;
        LogPrintF();
      }
      [v7 setOtherTipiDeviceAudioScore:v9, v23, v24, v25, v26];
      if (v9 == 1)
      {
        if (v10 != 1)
        {
          uint64_t v17 = NSDictionaryGetNSNumber();
          [v17 intValue];

          if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
          {
            double v18 = [v7 otherTipiDeviceBTAddress];
            LogPrintF();
          }
          uint64_t v19 = mach_absolute_time();
          [v7 setOtherTipiDeviceIdleTick:v19 - SecondsToUpTicks()];
          if (v12)
          {
            [(BTSmartRoutingDaemon *)self _startHighActivityLevelTimer:1];
            [(SmartRoutingStats *)self->_stats setProactiveRoutingTrigger:@"Tipi connection"];
          }
        }
      }
      else if ((int)v9 >= 3)
      {
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        highActivityLevelTimer = self->_highActivityLevelTimer;
        if (highActivityLevelTimer)
        {
          uint64_t v21 = highActivityLevelTimer;
          dispatch_source_cancel(v21);
          long long v22 = self->_highActivityLevelTimer;
          self->_highActivityLevelTimer = 0;
        }
      }
    }
    else if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    id v6 = v27;
  }
}

- (void)_postNotification:(const char *)a3
{
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  notify_post(a3);
}

- (void)_powerLogSmartRoutingScanStarted:(unsigned __int8)a3
{
  if (self->_prefSmartRoutingEnabledPhase3)
  {
    uint64_t v3 = a3;
    double Current = CFAbsoluteTimeGetCurrent();
    v9[0] = @"ScanStart";
    v8[0] = @"kEventType";
    v8[1] = @"kScanType";
    id v5 = +[NSNumber numberWithUnsignedChar:v3];
    v9[1] = v5;
    v8[2] = @"timestamp";
    id v6 = +[NSNumber numberWithDouble:Current];
    void v9[2] = v6;
    int v7 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

    PLLogRegisteredEvent();
  }
}

- (void)_powerLogSmartRoutingScanStopped:(unsigned __int8)a3
{
  if (self->_prefSmartRoutingEnabledPhase3)
  {
    uint64_t v3 = a3;
    double Current = CFAbsoluteTimeGetCurrent();
    v9[0] = @"ScanStop";
    v8[0] = @"kEventType";
    v8[1] = @"kScanType";
    id v5 = +[NSNumber numberWithUnsignedChar:v3];
    v9[1] = v5;
    v8[2] = @"timestamp";
    id v6 = +[NSNumber numberWithDouble:Current];
    void v9[2] = v6;
    int v7 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

    PLLogRegisteredEvent();
  }
}

- (void)_powerLogSmartIncomingConnection
{
  if (self->_prefSmartRoutingEnabledPhase3)
  {
    v4[0] = @"kIncomingLEPipe";
    v4[1] = @"timestamp";
    v5[0] = &__kCFBooleanTrue;
    BOOL v2 = +[NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
    v5[1] = v2;
    uint64_t v3 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

    PLLogRegisteredEvent();
  }
}

- (void)_proactivelyTakeOwnership
{
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  int v31 = sub_10001E20C;
  id v32 = sub_10001E21C;
  id v33 = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10004B330;
  v27[3] = &unk_100232B20;
  v27[4] = self;
  v27[5] = &v28;
  uint64_t v3 = objc_retainBlock(v27);
  id v26 = v3;
  id v4 = [(BTSmartRoutingDaemon *)self _getInEarSrWxDevice];
  id v5 = v4;
  if (!v4)
  {
    id v6 = (void *)v29[5];
    void v29[5] = @"Couldn't find inEar Wx";
    goto LABEL_33;
  }
  id v6 = [v4 deviceAddress];
  id v7 = [objc_alloc((Class)NSString) initWithFormat:@"Already has ownership: %@", v6];
  if ([v5 hasOwnership])
  {
    uint64_t v19 = v29;
    id v20 = v7;
LABEL_38:
    id v7 = v20;
    unsigned int v10 = (void *)v19[5];
    v19[5] = (uint64_t)v20;
    goto LABEL_32;
  }
  double v8 = [v5 otherTipiDeviceBTAddress];

  if (!v8)
  {
    unsigned int v10 = (void *)v29[5];
    void v29[5] = @"Not in Tipi";
    goto LABEL_32;
  }
  BOOL v9 = ([v5 otherTipiDeviceAudioScore] == 1
     || [v5 otherTipiDeviceAudioScore] == 2)
    && [v5 otherTipiDeviceIdleTick] != 0;
  id v25 = [objc_alloc((Class)NSString) initWithFormat:@"The other Tipi device is not idle, audioScore %d idleTick %llu", [v5 otherTipiDeviceAudioScore], [v5 otherTipiDeviceIdleTick]];

  if (!v9)
  {
    uint64_t v19 = v29;
    id v20 = v25;
    goto LABEL_38;
  }
  unsigned int v10 = [v5 identifier];
  double v11 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v6];
  uint64_t v12 = [(BTSmartRoutingDaemon *)self _getRssiNearby:v10];
  mach_absolute_time();
  [v5 otherTipiDeviceIdleTick];
  uint64_t v13 = UpTicksToSeconds();
  if (v10)
  {
    uint64_t v14 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v10];
    id v15 = [v14 audioState];
  }
  else
  {
    id v15 = 0;
  }
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    unsigned int v16 = [v11 audioStreamState];
    if (v16 > 3) {
      uint64_t v17 = "?";
    }
    else {
      uint64_t v17 = off_100234420[v16];
    }
    uint64_t v23 = (int)[v11 rssi];
    uint64_t v24 = v12;
    uint64_t v21 = v17;
    uint64_t v22 = v13;
    LogPrintF();
  }
  if (objc_msgSend(v11, "audioStreamState", v21, v22, v23, v24) != 1)
  {
    if ([v11 audioStreamState] || v15 || v12 <= -70) {
      goto LABEL_31;
    }
LABEL_26:
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_proactiveRoutingInProgress = 1;
    double v18 = +[NSString stringWithFormat:@"%@%@", v6, @"-tacl"];
    [(BTSmartRoutingDaemon *)self _smartRoutingChangeRoute:v18];

    [(BTSmartRoutingDaemon *)self _relayConduitMessageSend:1 withOptions:&off_1002444F8 andWxAddress:v6 andOtherAddress:0];
    -[SmartRoutingStats setProactiveRoutingWxRSSI:](self->_stats, "setProactiveRoutingWxRSSI:", [v11 rssi]);
    [(BTSmartRoutingDaemon *)self _startRouteCheckTimer:v6 andType:12];
    goto LABEL_31;
  }
  if (v12 >= -69) {
    goto LABEL_26;
  }
LABEL_31:

  id v7 = v25;
  uint64_t v3 = v26;
LABEL_32:

LABEL_33:
  ((void (*)(void *))v3[2])(v3);

  _Block_object_dispose(&v28, 8);
}

- (BOOL)_productColorAssetExists:(unsigned int)a3 withColor:(char)a4
{
  unsigned int v4 = a4;
  switch(a3)
  {
    case 0x2011u:
      if (a4 == 1) {
        goto LABEL_17;
      }
      goto LABEL_21;
    case 0x2012u:
      if (a4 >= 0xAu) {
        goto LABEL_21;
      }
      goto LABEL_17;
    case 0x2013u:
    case 0x2014u:
    case 0x2015u:
    case 0x2018u:
    case 0x2019u:
    case 0x201Bu:
    case 0x201Cu:
    case 0x201Eu:
    case 0x2020u:
    case 0x2021u:
    case 0x2022u:
    case 0x2023u:
    case 0x2024u:
      goto LABEL_21;
    case 0x2016u:
      goto LABEL_14;
    case 0x2017u:
      if (a4 >= 0xAu) {
        goto LABEL_21;
      }
      unsigned int v5 = 762;
      return (v5 >> a4) & 1;
    case 0x201Au:
      goto LABEL_18;
    case 0x201Du:
    case 0x2026u:
      if (a4 - 1 >= 4) {
        goto LABEL_21;
      }
      goto LABEL_17;
    case 0x201Fu:
      unsigned int v4 = a4 - 18;
LABEL_14:
      if (v4 >= 5) {
        goto LABEL_21;
      }
      goto LABEL_17;
    case 0x2025u:
      if (a4 >= 3u)
      {
LABEL_18:
        if (a4 >= 8u)
        {
LABEL_21:
          LOBYTE(v6) = 0;
        }
        else
        {
          unsigned int v5 = 214;
          return (v5 >> a4) & 1;
        }
      }
      else
      {
LABEL_17:
        LOBYTE(v6) = 1;
      }
      return v6;
    default:
      if (a3 != 8202 || a4 >= 0x12u) {
        goto LABEL_21;
      }
      unsigned int v5 = 229388;
      return (v5 >> a4) & 1;
  }
}

- (id)_productColorAssetLookup:(unsigned int)a3 andAddress:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (![(BTSmartRoutingDaemon *)self _productHasColors:v4])
  {
    double v11 = [(BTSmartRoutingDaemon *)self _bluetoothProductIDToAsset:v4];
    goto LABEL_22;
  }
  wxAssetCache = self->_wxAssetCache;
  if (!wxAssetCache)
  {
    double v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    BOOL v9 = self->_wxAssetCache;
    self->_wxAssetCache = v8;

    wxAssetCache = self->_wxAssetCache;
  }
  unsigned int v10 = [(NSMutableDictionary *)wxAssetCache objectForKeyedSubscript:v6];

  if (v10)
  {
    double v11 = [(NSMutableDictionary *)self->_wxAssetCache objectForKeyedSubscript:v6];
    if (dword_1002610B8 <= 50 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
LABEL_13:
    }
      LogPrintF();
  }
  else
  {
    uint64_t v12 = [(BTSmartRoutingDaemon *)self _getWxColorCode:v6];
    if (![(BTSmartRoutingDaemon *)self _productColorAssetExists:v4 withColor:(char)v12]|| v12 == 255)
    {
      double v11 = [(BTSmartRoutingDaemon *)self _bluetoothProductDefaultAsset:v4];
      if (dword_1002610B8 <= 60 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        goto LABEL_13;
      }
    }
    else
    {
      double v11 = [(BTSmartRoutingDaemon *)self _bluetoothProductIDToColorAsset:v4 withColor:v12];
      [(NSMutableDictionary *)self->_wxAssetCache setObject:v11 forKeyedSubscript:v6];
      if (dword_1002610B8 <= 50 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        goto LABEL_13;
      }
    }
  }
LABEL_22:

  return v11;
}

- (BOOL)_productHasColors:(unsigned int)a3
{
  return (a3 - 8202 < 0x1D) & (0x18293181u >> (a3 - 10));
}

- (void)_receivedAudioCategory:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  id v8 = a4;
  BOOL v9 = [(NSMutableDictionary *)smartRoutingWxDeviceMap objectForKeyedSubscript:v6];
  unsigned int v10 = [v8 objectForKey:@"otherDeviceAudioCategory"];
  id v11 = [v10 unsignedIntValue];

  uint64_t v12 = [v8 objectForKey:@"btAddress"];
  uint64_t v35 = [v8 objectForKey:@"btName"];
  uint64_t v13 = [v8 objectForKey:@"playingApp"];
  uint64_t v14 = [v8 objectForKey:@"hostStreamingState"];

  id v15 = [v14 isEqualToString:@"YES"];
  [v9 _setOtherTipiDeviceIsStreamingAudio:v15];
  if (v9)
  {
    unsigned int v16 = [v9 otherTipiDeviceBTAddress];
    unsigned __int8 v17 = [v16 isEqualToString:v12];

    if ((v17 & 1) == 0)
    {
      if (dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
      {
        id v32 = [v9 otherTipiDeviceBTAddress];
        long long v34 = v12;
        LogPrintF();
      }
      -[BTSmartRoutingDaemon _updateOtherTipiDevicewithAudioCategory:otherAddress:otherName:otherVersion:](self, "_updateOtherTipiDevicewithAudioCategory:otherAddress:otherName:otherVersion:", v6, v12, v35, &off_100244058, v32, v34);
      [(BTSmartRoutingDaemon *)self _tipihHealingV2Handling:v6];
    }
  }
  if (!self->_prefSmartRoutingForcedHijackv2) {
    goto LABEL_12;
  }
  id v18 = 0;
  if (![v9 otherTipiAudioCategory] && v11 >= 0x12D)
  {
    if ([v9 routingAction] == 1)
    {
LABEL_12:
      id v18 = 0;
      goto LABEL_13;
    }
    [v9 _setOtherTipiAudioCategory:v11];
    NSInteger v22 = [(NSNumber *)self->_localDeviceAudioCatogory integerValue];
    id v36 = 0;
    unsigned int v23 = [(BTSmartRoutingDaemon *)self allowHijackWithAudioScore:v22 hijackRoute:v6 hijackDeniedReason:&v36];
    id v18 = v36;
    if (dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v24 = "no";
      if (v23) {
        uint64_t v24 = "yes";
      }
      id v32 = (void *)v24;
      LogPrintF();
    }
    if (v23)
    {
      [v9 _setRoutingAction:1];
      [(BTSmartRoutingDaemon *)self _postNotification:"com.apple.BluetoothServices.AudioRoutingChanged"];
    }
  }
LABEL_13:
  [v9 _setOtherTipiAudioCategory:v11, v32];
  [v9 _setOtherTipiPlayingApp:v13];
  tipiHealingHijackTimer = self->_tipiHealingHijackTimer;
  if (tipiHealingHijackTimer)
  {
    id v20 = tipiHealingHijackTimer;
    dispatch_source_cancel(v20);
    uint64_t v21 = self->_tipiHealingHijackTimer;
    self->_tipiHealingHijackTimer = 0;

    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v25 = [v9 audioRoutingRequest];
    id v26 = [v9 audioRoutingResponse];
    [(BTSmartRoutingDaemon *)self _smartRoutingAudioRoutingRequest:v25 withResponseHandler:v26];
  }
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    id v33 = [v9 otherTipiAudioCategory];
    long long v34 = v12;
    LogPrintF();
  }
  if (objc_msgSend(v9, "otherTipiDeviceIsWatch", v33, v34))
  {
    if ([v9 otherTipiAudioCategory] == 100) {
      char v27 = (char)v15;
    }
    else {
      char v27 = 1;
    }
    phoneOwnershipTriangleTimer = self->_phoneOwnershipTriangleTimer;
    if (v27)
    {
      if (!phoneOwnershipTriangleTimer) {
        goto LABEL_40;
      }
    }
    else if (!phoneOwnershipTriangleTimer)
    {
      [(BTSmartRoutingDaemon *)self _startPhoneTriangleOwnershipTimer:10];
      goto LABEL_40;
    }
    if ((([v9 otherTipiAudioCategory] < 0x65) & ~v15) == 0)
    {
      uint64_t v29 = self->_phoneOwnershipTriangleTimer;
      if (v29)
      {
        uint64_t v30 = v29;
        dispatch_source_cancel(v30);
        int v31 = self->_phoneOwnershipTriangleTimer;
        self->_phoneOwnershipTriangleTimer = 0;
      }
    }
  }
LABEL_40:
}

- (void)_receivedRelinquishOwnership:(id)a3 wxAddress:(id)a4
{
  id v54 = a3;
  id v6 = a4;
  id v7 = [v54 objectForKeyedSubscript:@"reason"];
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    id v42 = v7;
    LogPrintF();
  }
  if (v6)
  {
    id v8 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v6];
    if (!v8)
    {
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      goto LABEL_91;
    }
    BOOL v9 = [v54 objectForKey:@"audioRoutingScore"];
    int audioScoreOtherTipiDevice = self->_audioScoreOtherTipiDevice;
    if (audioScoreOtherTipiDevice != [v9 intValue]) {
      self->_int audioScoreOtherTipiDevice = [v9 intValue];
    }
    id v11 = [v54 objectForKey:@"localscore" v42];
    id v12 = [v11 intValue];

    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      if (self->_activityLevelMediaPlaying
        || (int)[(CUSystemMonitor *)self->_callMonitor activeCallCount] >= 1)
      {
        uint64_t v13 = "yes";
      }
      else
      {
        uint64_t v13 = "no";
      }
      long long v52 = (void *)v13;
      uint64_t score = self->_score;
      id v15 = v9;
      if (score > 0xF) {
        unsigned int v16 = "?";
      }
      else {
        unsigned int v16 = off_1002342D0[score];
      }
      uint64_t v17 = self->_audioScoreOtherTipiDevice;
      if ([v8 routed]) {
        id v18 = "yes";
      }
      else {
        id v18 = "no";
      }
      [(CUUserNotificationSession *)self->_uiNoteSessionSmartRouting identifier];
      unsigned int v51 = v50 = v18;
      long long v48 = v16;
      uint64_t v49 = v17;
      id v45 = v12;
      unsigned int v47 = v52;
      uint64_t v43 = v7;
      LogPrintF();

      BOOL v9 = v15;
    }
    -[BTSmartRoutingDaemon _setOwnership:withHijackRequest:withOwnership:](self, "_setOwnership:withHijackRequest:withOwnership:", v6, 0, 0, v43, v45, v47, v48, v49, v50, v51);
    if (![v8 routed])
    {
LABEL_58:
      uiNoteSessionSmartRouting = self->_uiNoteSessionSmartRouting;
      if (uiNoteSessionSmartRouting)
      {
        uint64_t v29 = [(CUUserNotificationSession *)uiNoteSessionSmartRouting identifier];
        unsigned __int8 v30 = [v29 isEqualToString:@"ReverseRoute"];

        if ([v7 isEqualToString:@"AutoResume"])
        {
          if (v30) {
            goto LABEL_90;
          }
          goto LABEL_63;
        }
      }
      else if ([v7 isEqualToString:@"AutoResume"])
      {
LABEL_63:
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        int v31 = [v8 deviceName];
        unsigned int v37 = [v8 deviceAddress];
        id v38 = [v8 productID];
        int v39 = [v8 otherTipiDeviceBTName];
        unsigned __int8 v40 = +[NSString stringWithFormat:@"%@", v39];
        [(BTSmartRoutingDaemon *)self _smartRoutingShowBanner:5 withDevice:v31 andDeviceAddress:v37 andProductID:v38 andCentralContentItemTxt:v40 andTimeout:0 andDeviceType:20.0];

LABEL_89:
        goto LABEL_90;
      }
      if ([v7 isEqualToString:@"Hijackv2"])
      {
        int v31 = [v54 objectForKeyedSubscript:@"localscore"];
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v44 = v31;
          id v46 = v9;
          LogPrintF();
        }
        -[SmartRoutingStats setHijackAwayLocalScore:](self->_stats, "setHijackAwayLocalScore:", 0xFFFFFFFFLL, v44, v46);
        [(SmartRoutingStats *)self->_stats setHijackAwayRemoteScore:0xFFFFFFFFLL];
        if (v31) {
          -[SmartRoutingStats setHijackAwayLocalScore:](self->_stats, "setHijackAwayLocalScore:", [v31 intValue]);
        }
        if (v9) {
          -[SmartRoutingStats setHijackAwayRemoteScore:](self->_stats, "setHijackAwayRemoteScore:", [v9 intValue]);
        }
        [(BTSmartRoutingDaemon *)self submitRouteActivityMetric:v6 activity:@"Hijack_Away"];
        unsigned __int8 v41 = [(SmartRoutingStats *)self->_stats falseRouteCheckReason];

        if (!v41) {
          [(SmartRoutingStats *)self->_stats setFalseRouteCheckReason:@"Hijacked_Away"];
        }
        [(BTSmartRoutingDaemon *)self _startRouteCheckTimer:v6 andType:8];
        goto LABEL_89;
      }
      if ([v7 isEqualToString:@"ManualRoute"])
      {
        [(BTSmartRoutingDaemon *)self submitRouteActivityMetric:v6 activity:@"Remote_Manual_Route"];
        [v8 _setOtherTipiManuallyRouteTick:mach_absolute_time()];
        id v32 = [(SmartRoutingStats *)self->_stats falseRouteCheckReason];

        if (v32)
        {
LABEL_90:

LABEL_91:
          goto LABEL_92;
        }
        stats = self->_stats;
        CFStringRef v34 = @"Remote_Manual_Route";
      }
      else
      {
        if (![v7 isEqualToString:@"ReverseBannerTapped"]) {
          goto LABEL_90;
        }
        uint64_t v35 = [(SmartRoutingStats *)self->_stats falseRouteCheckReason];

        if (v35) {
          goto LABEL_90;
        }
        stats = self->_stats;
        CFStringRef v34 = @"Remote_reverse_banner_tapped";
      }
      [(SmartRoutingStats *)stats setFalseRouteCheckReason:v34];
      goto LABEL_90;
    }
    uint64_t v19 = v54;
    if (self->_prefSmartRoutingBlockHijackWindowinSeconds)
    {
      id v12 = [v54 objectForKey:@"audioRoutingShowReverseUI"];

      uint64_t v19 = v54;
      if (v12)
      {
        [v8 _setHijackBackoffTick:mach_absolute_time()];
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        self->_BOOL hijackBackOffInitiator = 0;
        [(BTSmartRoutingDaemon *)self _postNotification:"com.apple.BluetoothServices.AudioRoutingChanged"];
        uint64_t v19 = v54;
      }
    }
    int v20 = self->_audioScoreOtherTipiDevice;
    if (v20 <= 0)
    {
      uint64_t v22 = [v19 objectForKey:@"audioRoutingShowReverseUI"];
      if (v22)
      {
        id v12 = (id)v22;
        int v21 = 0;
      }
      else
      {
        uint64_t v36 = [v54 objectForKey:@"SmartRoutingKeyShowNearbyUI"];
        if (!v36) {
          goto LABEL_57;
        }
        long long v52 = (void *)v36;
        id v12 = 0;
        int v21 = 1;
      }
    }
    else
    {
      int v21 = 0;
    }
    if (self->_score <= 3 && (int)[(CUSystemMonitor *)self->_callMonitor activeCallCount] < 1)
    {
      BOOL v23 = 0;
      if (v21)
      {
LABEL_49:

        if (v20 >= 1) {
          goto LABEL_50;
        }
LABEL_54:

        if (v23) {
          goto LABEL_55;
        }
LABEL_57:
        [v8 _setRoutedState:0];
        [v8 _setRoutingAction:3];
        [(BTSmartRoutingDaemon *)self _setManualRouteFlag:v6 withManualRoute:0];
        goto LABEL_58;
      }
    }
    else
    {
      BOOL v23 = [v9 intValue] != 200;
      if (v21) {
        goto LABEL_49;
      }
    }
    if (v20 > 0)
    {
LABEL_50:
      if (!v23) {
        goto LABEL_57;
      }
LABEL_55:
      if (([v8 otherTipiDeviceIsWatch] & 1) == 0)
      {
        uint64_t v24 = [v8 deviceName];
        id v25 = [v8 deviceAddress];
        unsigned int v53 = [v8 productID];
        id v26 = [v8 otherTipiDeviceBTName];
        char v27 = +[NSString stringWithFormat:@"%@", v26];
        [(BTSmartRoutingDaemon *)self _smartRoutingShowBanner:5 withDevice:v24 andDeviceAddress:v25 andProductID:v53 andCentralContentItemTxt:v27 andTimeout:0 andDeviceType:20.0];
      }
      goto LABEL_57;
    }
    goto LABEL_54;
  }
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_92:
}

- (void)_removeTiPiState:(id)a3
{
  id v4 = a3;
  id v14 = v4;
  if (dword_1002610B8 <= 30)
  {
    if (dword_1002610B8 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v14, v5))
    {
      LogPrintF();
      id v4 = v14;
    }
  }
  id v6 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v4];
  id v7 = [v6 audioRoutingResponse];

  if (v7)
  {
    id v8 = objc_alloc_init((Class)BTAudioRoutingResponse);
    [v8 setAction:1];
    [v8 setDeviceAddress:v14];
    [v8 setReason:@"Tipi device should be routed"];
    [v8 setClientID:[v6 audioRoutingClientID]];
    BOOL v9 = [v6 audioRoutingResponse];
    [(BTSmartRoutingDaemon *)self _respondRoutingRequest:v8 withResponseHandler:v9 wxAddress:v14];
  }
  [v6 _setOtherTipiDeviceInfo:0 andName:0 andVersion:0];
  [v6 _setOtherTipiAudioCategory:0];
  [v6 _setOtherTipiDeviceIsWatch:0];
  phoneOwnershipTriangleTimer = self->_phoneOwnershipTriangleTimer;
  if (phoneOwnershipTriangleTimer)
  {
    id v11 = phoneOwnershipTriangleTimer;
    dispatch_source_cancel(v11);
    id v12 = self->_phoneOwnershipTriangleTimer;
    self->_phoneOwnershipTriangleTimer = 0;
  }
  if ([(NSMutableDictionary *)self->_smartRoutingWxDeviceMap count] == (id)1)
  {
    if (self->_pairedCompanionDeviceSupportsSmartRouting) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = 2;
    }
    [v6 _setRoutingAction:v13];
    [(BTSmartRoutingDaemon *)self _postNotification:"com.apple.BluetoothServices.AudioRoutingChanged"];
  }
  if ([(NSMutableDictionary *)self->_smartRoutingWxDeviceMap count] == (id)1) {
    [(BTSmartRoutingDaemon *)self _updateNearbyDeviceState:v14 withAddress:&stru_10023D730 withEasyPairing:0 withState:3];
  }
}

- (void)_relayConduitMessageStartTimer:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_time_t v8 = dispatch_time(0, 3500000000);
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  int v20 = sub_10001E20C;
  int v21 = sub_10001E21C;
  id v22 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v6];
  BOOL v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  [(id)v18[5] setConduitMessageTimer:v9];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10004C7EC;
  handler[3] = &unk_100233C18;
  void handler[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v15 = &v17;
  uint64_t v16 = 0x400C000000000000;
  id v10 = v7;
  id v11 = v6;
  dispatch_source_set_event_handler(v9, handler);
  dispatch_source_set_timer(v9, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume(v9);

  _Block_object_dispose(&v17, 8);
}

- (void)_setOwnership:(id)a3 withHijackRequest:(id)a4 withOwnership:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    id v10 = "no";
    if (v5) {
      id v10 = "yes";
    }
    id v18 = v8;
    uint64_t v19 = v10;
    LogPrintF();
  }
  id v11 = objc_alloc_init((Class)CBDeviceSettings);
  id v12 = v11;
  if (v5) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 1;
  }
  [v11 setRelinquishAudioRoute:v13, v18, v19];
  id v14 = objc_alloc_init((Class)CBDevice);
  [v14 setIdentifier:v8];
  smartRoutingController = self->_smartRoutingController;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10004CD70;
  v20[3] = &unk_100233C40;
  id v21 = v9;
  id v22 = self;
  id v23 = v8;
  id v16 = v8;
  id v17 = v9;
  [(CBController *)smartRoutingController modifyDevice:v14 settings:v12 completion:v20];
}

- (void)_sendAudioCategory:(id)a3 withAudioCategory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
    id v10 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v6];
    unsigned __int8 v11 = [v10 otherTipiDeviceIsWatch];

    unsigned int v12 = [v9 intValue];
    if ([(BTSmartRoutingSourceDevice *)self->_sourceDevice incomingCallRingtone])
    {
      signed int v13 = [(NSNumber *)self->_localDeviceAudioCatogory intValue];
      if (![(BTSmartRoutingDaemon *)self _isInHijackBlockingMode])
      {
        BOOL v14 = v13 > 500;
        if (v12 == 401) {
          BOOL v14 = v11;
        }
        if (v14) {
          goto LABEL_19;
        }
LABEL_17:
        id v15 = &off_1002448B0;
        goto LABEL_18;
      }
    }
    else if (![(BTSmartRoutingDaemon *)self _isInHijackBlockingMode])
    {
      if (v12 == 401) {
        char v16 = v11;
      }
      else {
        char v16 = 1;
      }
      if (v16) {
        goto LABEL_19;
      }
      goto LABEL_17;
    }
    id v15 = &off_100244898;
LABEL_18:

    id v9 = v15;
LABEL_19:
    CFStringRef v17 = @"YES";
    if (!self->_activityLevelMediaPlaying
      && (int)[(CUSystemMonitor *)self->_callMonitor activeCallCount] <= 0)
    {
      CFStringRef v17 = @"NO";
    }
    id v18 = [(BTSmartRoutingDaemon *)self _myBluetoothAddressString];
    uint64_t v19 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v6];
    int v20 = [v19 otherTipiDeviceBTAddress];

    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      id v26 = v20;
      id v27 = [v9 integerValue];
      id v25 = v6;
      LogPrintF();
    }
    uint64_t v21 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice activePlayingApp];
    id v22 = (void *)v21;
    CFStringRef v23 = @"NA";
    if (v21) {
      CFStringRef v23 = (const __CFString *)v21;
    }
    v29[4] = v23;
    uint64_t v24 = +[NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:5];

    [(BTSmartRoutingDaemon *)self _relayConduitMessageSend:1 withOptions:v24 andWxAddress:v6 andOtherAddress:v20];
    goto LABEL_29;
  }
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_29:
}

- (void)_sendAudioCategoryToAllTipiDevices
{
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10004D254;
  v3[3] = &unk_100233650;
  v3[4] = self;
  [(NSMutableDictionary *)smartRoutingWxDeviceMap enumerateKeysAndObjectsUsingBlock:v3];
}

- (void)_sendTipiHealingRequest:(id)a3 andOtherTipiAddress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_tipiElectionInProgress)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    self->_BOOL tipiElectionInProgress = 1;
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(BTSmartRoutingDaemon *)self _updateNearbyDeviceState:v6 withAddress:v7 withEasyPairing:0 withState:1];
    CFStringRef v8 = @"YES";
    if (!self->_activityLevelMediaPlaying)
    {
      if ((int)[(CUSystemMonitor *)self->_callMonitor activeCallCount] <= 0) {
        CFStringRef v8 = @"NO";
      }
      else {
        CFStringRef v8 = @"YES";
      }
    }
    id v9 = [(BTSmartRoutingDaemon *)self _myBluetoothAddressString];
    v14[0] = @"tipiHealingAttempt";
    v14[1] = @"tipiHealingName";
    myModel = self->_myModel;
    v15[0] = v9;
    v15[1] = myModel;
    v14[2] = @"version";
    v14[3] = @"tipiHealingStreaming";
    v15[2] = &off_100244058;
    v15[3] = v8;
    v14[4] = @"tipiHealingPreferMac";
    unsigned int v11 = [(BTSmartRoutingDaemon *)self _isManualConnection:v6];
    CFStringRef v12 = @"Don't route for manual connection";
    if (!v11) {
      CFStringRef v12 = @"YES";
    }
    void v15[4] = v12;
    signed int v13 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:5];
    [(BTSmartRoutingDaemon *)self _relayConduitMessageSend:1 withOptions:v13 andWxAddress:v6 andOtherAddress:v7];
    [(BTSmartRoutingDaemon *)self _tipiHealingStartTimer:v6];
  }
}

- (void)_sendRouteReversedTipiEventForTipsSupport
{
  uint64_t v3 = +[BMStreams discoverabilitySignal];
  id v4 = [v3 source];
  id v5 = [objc_alloc((Class)BMDiscoverabilitySignalEvent) initWithIdentifier:@"com.apple.bluetooth.audio-reversed" bundleID:@"com.apple.cloudpaird" context:0];
  [v4 sendEvent:v5];
}

- (void)_sendAudioScoreChanged:(BOOL)a3
{
  if (self->_startIdleTicks)
  {
    mach_absolute_time();
    uint64_t v5 = UpTicksToSeconds();
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = v5;
      LogPrintF();
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004D6B8;
  void v8[3] = &unk_100233C68;
  v8[4] = self;
  void v8[5] = v5;
  BOOL v9 = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smartRoutingWxDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v8, v7);
}

- (void)_sendTipiScoreUpdateToWx
{
  if (self->_isActiveHRMSession)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    uint64_t v3 = self->_smartRoutingController;
    if (!v3)
    {
      uint64_t v3 = (CBController *)objc_alloc_init((Class)CBController);
      objc_storeStrong((id *)&self->_smartRoutingController, v3);
      [(CBController *)v3 setDispatchQueue:self->_dispatchQueue];
    }
    srDiscoveredDeviceMap = self->_srDiscoveredDeviceMap;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004DA34;
    v6[3] = &unk_100233CB8;
    void v6[4] = self;
    uint64_t v7 = v3;
    uint64_t v5 = v3;
    [(NSMutableDictionary *)srDiscoveredDeviceMap enumerateKeysAndObjectsUsingBlock:v6];
  }
}

- (void)_setAutoRoute:(id)a3 withAutoRoute:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)CBDeviceSettings);
  CFStringRef v8 = v7;
  if (v4) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 1;
  }
  [v7 setAllowsAutoRoute:v9];
  id v10 = objc_alloc_init((Class)CBDevice);
  [v10 setIdentifier:v6];

  smartRoutingController = self->_smartRoutingController;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004DDCC;
  v12[3] = &unk_100232738;
  v12[4] = self;
  [(CBController *)smartRoutingController modifyDevice:v10 settings:v8 completion:v12];
}

- (void)_setIsHiddenProperty:(id)a3 withIsHidden:(BOOL)a4
{
  BOOL v4 = a4;
  id v13 = a3;
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    id v6 = "no";
    if (v4) {
      id v6 = "yes";
    }
    id v11 = v13;
    CFStringRef v12 = v6;
    LogPrintF();
  }
  id v7 = objc_alloc_init((Class)CBDeviceSettings);
  CFStringRef v8 = v7;
  if (v4) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  [v7 setAudioRouteHidden:v9, v11, v12];
  id v10 = objc_alloc_init((Class)CBDevice);
  [v10 setIdentifier:v13];
  [(CBController *)self->_smartRoutingController modifyDevice:v10 settings:v8 completion:&stru_100233CD8];
}

- (void)_setHighPriorityTag:(id)a3 withHighPriority:(BOOL)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)CBDeviceSettings);
  CFStringRef v8 = v7;
  if (a4)
  {
    uint64_t v9 = 80;
LABEL_5:
    [v7 setAclPriority:v9];
    goto LABEL_6;
  }
  if (self->_highPriorityTagSent)
  {
    uint64_t v9 = 1;
    goto LABEL_5;
  }
LABEL_6:
  id v10 = objc_alloc_init((Class)CBDevice);
  [v10 setIdentifier:v6];

  smartRoutingController = self->_smartRoutingController;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004E120;
  v12[3] = &unk_100232738;
  v12[4] = self;
  [(CBController *)smartRoutingController modifyDevice:v10 settings:v8 completion:v12];
}

- (void)_setManualRouteFlag:(id)a3 withManualRoute:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  id v6 = objc_alloc_init((Class)CBDeviceSettings);
  [v6 setDeviceFlagsMask:0x400000];
  [v6 setDeviceFlagsValue:v4];
  id v7 = objc_alloc_init((Class)CBDevice);
  [v7 setIdentifier:v12];
  CFStringRef v8 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v12];
  if ([v8 manuallyRouted]) {
    [v8 _setManualRouteChangeInProgress:1];
  }
  uint64_t v9 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v12];
  [v9 _setManualRoute:0];

  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    id v10 = "no";
    if (v4) {
      id v10 = "yes";
    }
    id v11 = v10;
    LogPrintF();
  }
  -[CBController modifyDevice:settings:completion:](self->_smartRoutingController, "modifyDevice:settings:completion:", v7, v6, &stru_100233CF8, v11);
}

- (void)_setOtherTipiDeviceBTAddress:(id)a3 andName:(id)a4 sourceVersion:(id)a5 withResult:(id)a6
{
  id v21 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = v12;
  if (self->_eligibleHeadset)
  {
    if (v12)
    {
      BOOL v14 = [(SFDevice *)self->_eligibleHeadset bleDevice];
      id v15 = [v14 bluetoothAddress];

      if ([v15 length] == (id)6)
      {
        id v19 = [v15 bytes];
        char v16 = NSPrintF();
        if (v16)
        {
          CFStringRef v17 = -[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v16, v19);
          if (v17)
          {
          }
          else if (![(BTSmartRoutingDaemon *)self _isOnDemandConnectInProgress])
          {
            if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
            {
              int v20 = v16;
              LogPrintF();
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_smartRoutingWxDeviceMap, "setObject:forKeyedSubscript:", 0, v16, v20);
          }
        }
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      LOBYTE(v18) = 0;
      -[BTSmartRoutingDaemon _smartRoutingAddWxMapDevice:routingAction:otherAddress:otherName:otherSourceVersion:isRoutingInitialized:newWx:](self, "_smartRoutingAddWxMapDevice:routingAction:otherAddress:otherName:otherSourceVersion:isRoutingInitialized:newWx:", v18);
      [(BTSmartRoutingDaemon *)self _smartRoutingConnectToEligibleHeadset:self->_eligibleHeadset];
    }
  }
}

- (void)_setPhase1ConnectConfig:(id)a3 andType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v12 = a3;
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    if (v4 > 3) {
      id v6 = "?";
    }
    else {
      id v6 = off_100234350[(int)v4];
    }
    id v10 = v12;
    id v11 = v6;
    LogPrintF();
  }
  phase1ConnectConfig = self->_phase1ConnectConfig;
  if (!phase1ConnectConfig)
  {
    CFStringRef v8 = objc_alloc_init(SmartRoutingConnectConfig);
    uint64_t v9 = self->_phase1ConnectConfig;
    self->_phase1ConnectConfig = v8;

    phase1ConnectConfig = self->_phase1ConnectConfig;
  }
  -[SmartRoutingConnectConfig setAddress:](phase1ConnectConfig, "setAddress:", v12, v10, v11);
  [(SmartRoutingConnectConfig *)self->_phase1ConnectConfig setType:v4];
}

- (void)_setTipiAndRoutedStateFlags:(unsigned int)a3 forDevice:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [v6 identifier];
  [v6 _setTipiAndRoutedStateFlags:v4];

  [(AADeviceManagerDaemon *)self->_aaDeviceManagerDaemon smartRoutingStateUpdated:v4 ForDeviceIdentifier:v7];
}

- (void)_setTipiElectionInProgress:(BOOL)a3
{
  self->_BOOL tipiElectionInProgress = a3;
}

- (void)_setIsFirstConnentionAfterSREnable:(BOOL)a3 forDevice:(id)a4
{
  BOOL v4 = a3;
  id v14 = a4;
  id v6 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice isFirstConnectionAfterSREnable];
  id v7 = v6;
  if (!v4)
  {
    uint64_t v9 = [v6 objectForKey:v14];

    if (!v9) {
      goto LABEL_14;
    }
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      id v10 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice isFirstConnectionAfterSREnable];
      id v12 = [v10 objectForKeyedSubscript:v14];
      id v11 = v14;
      LogPrintF();
    }
    CFStringRef v8 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice isFirstConnectionAfterSREnable];
    [v8 removeObjectForKey:v14];
    goto LABEL_13;
  }
  [v6 setValue:@"YES" forKey:v14];

  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    CFStringRef v8 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice isFirstConnectionAfterSREnable];
    id v13 = [v8 objectForKeyedSubscript:v14];
    LogPrintF();

LABEL_13:
  }
LABEL_14:
}

- (void)_setTipiElectionReceivedLePipe:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:&stru_10023D730]) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = v5;
  }
  objc_storeStrong((id *)&self->_tipiElectionReceivedLePipe, v4);
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)_setTotalCountIDSDevices:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004EA20;
  v7[3] = &unk_100232A10;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (void)_smartRoutingModeCheck:(id)a3
{
  id v15 = a3;
  id v4 = [v15 btAddressData];
  id v5 = CUPrintNSDataAddress();

  id v6 = [(NSMutableDictionary *)self->_connectedDevicesSrModeCache objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = [(NSMutableDictionary *)self->_connectedDevicesSrModeCache objectForKeyedSubscript:v5];
    unsigned int v8 = [(BTSmartRoutingModeDevice *)v7 mode];
    if ([v15 smartRoutingMode] != v8)
    {
      if (v8 == 2)
      {
        if ([v15 smartRoutingMode] == 1)
        {
          if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
          {
            id v14 = v5;
            LogPrintF();
          }
          -[BTSmartRoutingModeDevice setMode:](v7, "setMode:", 1, v14);
          [(BTSmartRoutingModeDevice *)v7 setEnableCount:[(BTSmartRoutingModeDevice *)v7 enableCount] + 1];
          [(BTSmartRoutingDaemon *)self _sendTipiScoreUpdateToWx];
        }
      }
      else if (v8 == 1)
      {
        if ([v15 smartRoutingMode] == 2)
        {
          if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
          {
            id v14 = v5;
            LogPrintF();
          }
          -[BTSmartRoutingModeDevice setMode:](v7, "setMode:", 2, v14);
          [(BTSmartRoutingModeDevice *)v7 setDisableCount:[(BTSmartRoutingModeDevice *)v7 disableCount] + 1];
          [(BTSmartRoutingDaemon *)self _handleSmartRoutingDisabled:v5];
        }
      }
      else if (!(_BYTE)v8 && [v15 smartRoutingMode])
      {
        id v9 = [v15 smartRoutingMode];
        id v10 = [(NSMutableDictionary *)self->_connectedDevicesSrModeCache objectForKeyedSubscript:v5];
        [v10 setMode:v9];
      }
    }
  }
  else
  {
    id v7 = objc_alloc_init(BTSmartRoutingModeDevice);
    -[BTSmartRoutingModeDevice setMode:](v7, "setMode:", [v15 smartRoutingMode]);
    [(BTSmartRoutingModeDevice *)v7 setEnableCount:0];
    [(BTSmartRoutingModeDevice *)v7 setDisableCount:0];
    connectedDevicesSrModeCache = self->_connectedDevicesSrModeCache;
    if (!connectedDevicesSrModeCache)
    {
      id v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      id v13 = self->_connectedDevicesSrModeCache;
      self->_connectedDevicesSrModeCache = v12;

      connectedDevicesSrModeCache = self->_connectedDevicesSrModeCache;
    }
    [(NSMutableDictionary *)connectedDevicesSrModeCache setObject:v7 forKeyedSubscript:v5];
  }
}

- (void)_startIdleActivityScoreTimer:(unint64_t)a3
{
  idleActivityScoreTimer = self->_idleActivityScoreTimer;
  if (idleActivityScoreTimer)
  {
    id v5 = idleActivityScoreTimer;
    dispatch_source_cancel(v5);
    id v6 = self->_idleActivityScoreTimer;
    self->_idleActivityScoreTimer = 0;
  }
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  unsigned int v8 = self->_idleActivityScoreTimer;
  self->_idleActivityScoreTimer = v7;
  id v9 = v7;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10004EF10;
  handler[3] = &unk_100232710;
  void handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  CUDispatchTimerSet();
  dispatch_activate(v9);
}

- (void)_startHighActivityLevelTimer:(unint64_t)a3
{
  id v5 = [(BTSmartRoutingDaemon *)self _getInEarSrWxDevice];
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    id v9 = v5;
    LogPrintF();
  }
  if (objc_msgSend(v5, "proactiveRoutingBackoff", v9))
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      id v10 = [v5 identifier];
      LogPrintF();
    }
  }
  else if (v5 && !self->_highActivityLevelTimer)
  {
    if ([v5 otherTipiDeviceAudioScore] == 1
      || [v5 otherTipiDeviceAudioScore] == 2)
    {
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      highActivityLevelTimer = self->_highActivityLevelTimer;
      self->_highActivityLevelTimer = v6;
      unsigned int v8 = v6;

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10004F270;
      handler[3] = &unk_100233750;
      void handler[4] = self;
      void handler[5] = a3;
      dispatch_source_set_event_handler(v8, handler);
      CUDispatchTimerSet();
      dispatch_activate(v8);
    }
    else if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      sub_10001EBA8([v5 otherTipiDeviceAudioScore]);
      LogPrintF();
    }
  }
}

- (void)_startPhoneTriangleOwnershipTimer:(unint64_t)a3
{
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  phoneOwnershipTriangleTimer = self->_phoneOwnershipTriangleTimer;
  self->_phoneOwnershipTriangleTimer = v4;
  id v6 = v4;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10004F47C;
  handler[3] = &unk_100232710;
  void handler[4] = self;
  dispatch_source_set_event_handler(v6, handler);
  CUDispatchTimerSet();
  dispatch_activate(v6);
}

- (void)_startAudioStateSnapshotTimer
{
  p_audioStateSnapshotTimer = &self->_audioStateSnapshotTimer;
  if (!self->_audioStateSnapshotTimer
    && ([(NSMutableDictionary *)self->_wxDevices count]
     || [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap count])
    && [(CUSystemMonitor *)self->_powerMonitor screenOn])
  {
    if (*p_audioStateSnapshotTimer)
    {
      id v4 = *p_audioStateSnapshotTimer;
      dispatch_source_cancel(v4);
      id v5 = *p_audioStateSnapshotTimer;
      *p_audioStateSnapshotTimer = 0;
    }
    dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)p_audioStateSnapshotTimer, v6);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10004F6C0;
    handler[3] = &unk_100232710;
    void handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    if (v6)
    {
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
      {
        [(NSMutableDictionary *)self->_wxDevices count];
        LogPrintF();
      }
      CUDispatchTimerSet();
      dispatch_activate(v6);
    }
    else if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_stopAudioStateSnapshotTimer:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    id v9 = [(NSMutableDictionary *)self->_wxDevices count];
    BOOL v10 = v3;
    LogPrintF();
  }
  if ([(NSMutableDictionary *)self->_wxDevices count]) {
    BOOL v5 = !v3;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5)
  {
    audioStateSnapshotTimer = self->_audioStateSnapshotTimer;
    if (audioStateSnapshotTimer)
    {
      id v7 = audioStateSnapshotTimer;
      dispatch_source_cancel(v7);
      unsigned int v8 = self->_audioStateSnapshotTimer;
      self->_audioStateSnapshotTimer = 0;
    }
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      [(NSMutableDictionary *)self->_wxDevices count];
      LogPrintF();
    }
  }
}

- (void)_startManualRouteChangeDetectionTimer:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SmartRoutingStats *)self->_stats manualRouteChangeDetectionTimer];
  dispatch_source_t v6 = v5;
  if (v5) {
    dispatch_source_cancel(v5);
  }
  id v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  [(SmartRoutingStats *)self->_stats setManualRouteChangeDetectionTimer:v7];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  void v9[2] = sub_10004F8F8;
  void v9[3] = &unk_100232A10;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_source_set_event_handler(v7, v9);
  CUDispatchTimerSet();
  dispatch_activate(v7);
}

- (void)_startPlaybackTimer
{
  playbackStartTimer = self->_playbackStartTimer;
  if (playbackStartTimer)
  {
    id v4 = playbackStartTimer;
    dispatch_source_cancel(v4);
    BOOL v5 = self->_playbackStartTimer;
    self->_playbackStartTimer = 0;
  }
  dispatch_source_t v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  id v7 = self->_playbackStartTimer;
  self->_playbackStartTimer = v6;
  id v8 = v6;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10004FA74;
  handler[3] = &unk_100232710;
  void handler[4] = self;
  dispatch_source_set_event_handler(v8, handler);
  CUDispatchTimerSet();
  dispatch_activate(v8);
}

- (void)_startRouteChangeDetectionTimer:(id)a3 andAnswer:(int64_t)a4
{
  id v6 = a3;
  routeChangeDetectionTimer = self->_routeChangeDetectionTimer;
  if (routeChangeDetectionTimer)
  {
    id v8 = routeChangeDetectionTimer;
    dispatch_source_cancel(v8);
    id v9 = self->_routeChangeDetectionTimer;
    self->_routeChangeDetectionTimer = 0;
  }
  id v10 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  id v11 = self->_routeChangeDetectionTimer;
  self->_routeChangeDetectionTimer = v10;
  id v12 = v10;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10004FC08;
  handler[3] = &unk_100233AA8;
  void handler[4] = self;
  id v15 = v6;
  int64_t v16 = a4;
  id v13 = v6;
  dispatch_source_set_event_handler(v12, handler);
  CUDispatchTimerSet();
  dispatch_activate(v12);
}

- (void)_startRouteCheckTimer:(id)a3 andType:(int)a4
{
  id v6 = a3;
  id v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  switch(a4)
  {
    case 1:
      id v8 = [(SmartRoutingStats *)self->_stats routeCheckOwnLostTimer];
      [(SmartRoutingStats *)self->_stats setRouteCheckOwnLostTimer:v7];

      goto LABEL_3;
    case 2:
LABEL_3:
      id v9 = [(SmartRoutingStats *)self->_stats falseRouteCheckOwnLostTimer];
      [(SmartRoutingStats *)self->_stats setFalseRouteCheckOwnLostTimer:v7];

      goto LABEL_4;
    case 4:
LABEL_4:
      id v10 = [(SmartRoutingStats *)self->_stats falseRouteCheckForceDisconnectTimer];
      [(SmartRoutingStats *)self->_stats setFalseRouteCheckForceDisconnectTimer:v7];
      goto LABEL_11;
    case 5:
      id v10 = [(SmartRoutingStats *)self->_stats routeCheckHijackTimer];
      [(SmartRoutingStats *)self->_stats setRouteCheckHijackTimer:v7];
      goto LABEL_20;
    case 6:
      id v10 = [(SmartRoutingStats *)self->_stats falseRouteCheckHijackTimer];
      [(SmartRoutingStats *)self->_stats setFalseRouteCheckHijackTimer:v7];
      goto LABEL_11;
    case 8:
      id v10 = [(SmartRoutingStats *)self->_stats falseRouteCheckHijackAwayTimer];
      [(SmartRoutingStats *)self->_stats setFalseRouteCheckHijackAwayTimer:v7];
      [(SmartRoutingStats *)self->_stats setReverseRouteReason:0];
      goto LABEL_12;
    case 9:
      id v10 = [(SmartRoutingStats *)self->_stats routeCheckOnDemandTimer];
      [(SmartRoutingStats *)self->_stats setRouteCheckOnDemandTimer:v7];
      goto LABEL_20;
    case 10:
      id v10 = [(SmartRoutingStats *)self->_stats falseRouteCheckOnDemandTimer];
      [(SmartRoutingStats *)self->_stats setFalseRouteCheckOnDemandTimer:v7];
      goto LABEL_11;
    case 12:
      id v10 = [(SmartRoutingStats *)self->_stats falseRouteCheckProactiveRoutingTimer];
      [(SmartRoutingStats *)self->_stats setFalseRouteCheckProactiveRoutingTimer:v7];
LABEL_11:
      [(SmartRoutingStats *)self->_stats setFalseRouteCheckReason:0];
LABEL_12:
      if (v10) {
        goto LABEL_13;
      }
      break;
    case 13:
      id v10 = [(SmartRoutingStats *)self->_stats routeCheckInUseBannerTimer];
      [(SmartRoutingStats *)self->_stats setRouteCheckInUseBannerTimer:v7];
LABEL_20:
      if (!v10) {
        break;
      }
LABEL_13:
      dispatch_source_cancel(v10);

      break;
    default:
      break;
  }
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    [(SmartRoutingStats *)self->_stats hijackScore];
    LogPrintF();
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10004FFD4;
  handler[3] = &unk_100232E28;
  int v14 = a4;
  void handler[4] = self;
  id v13 = v6;
  id v11 = v6;
  dispatch_source_set_event_handler(v7, handler);
  CUDispatchTimerSet();
  dispatch_activate(v7);
}

- (void)_startTipiHealing:(id)a3 withLastConnect:(id)a4
{
  id v33 = a3;
  id v6 = a4;
  if (!v6)
  {
    if (dword_1002610B8 > 90 || dword_1002610B8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_51;
    }
LABEL_8:
    LogPrintF();
    goto LABEL_51;
  }
  if ([(BTSmartRoutingDaemon *)self _isMyAddress:v6])
  {
    if (dword_1002610B8 > 30 || dword_1002610B8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_51;
    }
    goto LABEL_8;
  }
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x3032000000;
  id v46 = sub_10001E20C;
  unsigned int v47 = sub_10001E21C;
  id v48 = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v35 = self;
  id v7 = [(CBDiscovery *)self->_pairedDiscovery discoveredDevices];
  id v8 = [v7 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (!v8) {
    goto LABEL_47;
  }
  uint64_t v9 = *(void *)v40;
  id obj = v7;
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v40 != v9) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v39 + 1) + 8 * i);
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
      {
        [v11 idsDeviceID:v30];
        v31 = id v30 = v11;
        LogPrintF();
      }
      [v11 btAddressData:v30, v31, v32];
      id v12 = objc_claimAutoreleasedReturnValue();
      id v13 = (char *)[v12 bytes];
      int v14 = CUPrintNSDataAddress();
      id v15 = [v11 idsDeviceID];
      int64_t v16 = [(BTSmartRoutingDaemon *)v35 _nearbyMacAddressTranslate:v15];

      id v17 = v16;
      uint64_t v18 = (char *)[v17 bytes];
      id v19 = CUPrintNSDataAddress();
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
      {
        int v31 = v14;
        id v32 = v19;
        id v30 = v6;
        LogPrintF();
      }
      if (v12
        && ((int v20 = (unsigned __int16 *)[v6 bytes],
             *v20 == *(unsigned __int16 *)(v13 + 3))
          ? (BOOL v21 = *((unsigned __int8 *)v20 + 2) == v13[5])
          : (BOOL v21 = 0),
            id v22 = v14,
            v21)
        || v17
        && ((CFStringRef v23 = (unsigned __int16 *)[v6 bytes],
             *v23 == *(unsigned __int16 *)(v18 + 3))
          ? (BOOL v24 = *((unsigned __int8 *)v23 + 2) == v18[5])
          : (BOOL v24 = 0),
            id v22 = v19,
            v24))
      {
        id v25 = v44;
        id v26 = v22;
        id v27 = (void *)v25[5];
        v25[5] = (uint64_t)v26;
      }
      uint64_t v28 = (void *)v44[5];
      if (v28)
      {
        if (dword_1002610B8 <= 30)
        {
          if (dword_1002610B8 == -1)
          {
            if (!_LogCategory_Initialize()) {
              goto LABEL_46;
            }
            uint64_t v28 = (void *)v44[5];
          }
          id v30 = v28;
          LogPrintF();
        }
LABEL_46:

        id v7 = obj;
        goto LABEL_47;
      }
    }
    id v7 = obj;
    id v8 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_47:

  if (v44[5]) {
    goto LABEL_49;
  }
  nearbyInfoDevices = v35->_nearbyInfoDevices;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000505CC;
  v36[3] = &unk_100233D20;
  v36[4] = v35;
  id v37 = v6;
  id v38 = &v43;
  [(NSMutableDictionary *)nearbyInfoDevices enumerateKeysAndObjectsUsingBlock:v36];

  if (v44[5])
  {
LABEL_49:
    [(BTSmartRoutingDaemon *)v35 _sendTipiHealingRequest:v33 andOtherTipiAddress:v30];
  }
  else if (dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  _Block_object_dispose(&v43, 8);

LABEL_51:
}

- (void)_startTipiSetupTicks
{
  self->_tipiSetupTicks = mach_absolute_time();
}

- (void)_submitMetric:(id)a3
{
  id v4 = a3;
  v58[0] = @"nearbyAction";
  unsigned int v51 = +[NSNumber numberWithInt:self->_nearbyBannerActionCount];
  v59[0] = v51;
  v58[1] = @"nearbyIgnored";
  BOOL v5 = +[NSNumber numberWithInt:self->_nearbyBannerTimeoutCount];
  v59[1] = v5;
  v58[2] = @"connectIgnored";
  id v6 = +[NSNumber numberWithInt:self->_connectedBannerTimeoutCount];
  v59[2] = v6;
  v58[3] = @"connectDismissed";
  id v7 = +[NSNumber numberWithInt:self->_connectedBannerDismissedCount];
  v59[3] = v7;
  v58[4] = @"reverseAudioIgnored";
  id v8 = +[NSNumber numberWithInt:self->_reverseBannerTimeoutCount];
  v59[4] = v8;
  v58[5] = @"reverseAudioAction";
  uint64_t v9 = +[NSNumber numberWithInt:self->_reverseBannerActionCount];
  v59[5] = v9;
  v58[6] = @"wxPD";
  unsigned int v47 = v4;
  id v10 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v4 productID]);
  v59[6] = v10;
  v58[7] = @"wxBuildVersion";
  uint64_t v11 = [v4 firmwareVersion];
  id v12 = (void *)v11;
  CFStringRef v13 = &stru_10023D730;
  if (v11) {
    CFStringRef v13 = (const __CFString *)v11;
  }
  v59[7] = v13;
  int v14 = +[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:8];
  CUMetricsLogEx();

  v56[0] = @"nearbyRouting";
  long long v52 = +[NSNumber numberWithInt:self->_nearbyBannerRouting];
  v57[0] = v52;
  v56[1] = @"autoRoutingSingle";
  uint64_t v49 = +[NSNumber numberWithInt:self->_autoRoutingSingle];
  v57[1] = v49;
  v56[2] = @"autoRoutingTipi";
  id v48 = +[NSNumber numberWithInt:self->_autoRoutingTipi];
  v57[2] = v48;
  v56[3] = @"autoRoutingHijack";
  id v46 = +[NSNumber numberWithInt:self->_autoRoutingHijack];
  v57[3] = v46;
  v56[4] = @"autoRoutingHijackError";
  id v15 = +[NSNumber numberWithInt:self->_autoRoutingHijackError];
  void v57[4] = v15;
  v56[5] = @"reverseRouting";
  int64_t v16 = +[NSNumber numberWithInt:self->_reverseRoutingCount];
  void v57[5] = v16;
  void v56[6] = @"routingManual";
  id v17 = +[NSNumber numberWithInt:self->_routingManualCount];
  v57[6] = v17;
  void v56[7] = @"wxPD";
  uint64_t v18 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v47 productID]);
  v57[7] = v18;
  v56[8] = @"fakeHfpSession";
  id v19 = +[NSNumber numberWithInt:self->_fakeHfpSessionCount];
  void v57[8] = v19;
  v56[9] = @"fakeHfpSessionReject";
  int v20 = +[NSNumber numberWithInt:self->_fakeHfpSessionRejectCount];
  v57[9] = v20;
  v56[10] = @"wxBuildVersion";
  uint64_t v21 = [v47 firmwareVersion];
  id v22 = (void *)v21;
  CFStringRef v23 = &stru_10023D730;
  if (v21) {
    CFStringRef v23 = (const __CFString *)v21;
  }
  v57[10] = v23;
  BOOL v24 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:11];
  CUMetricsLogEx();

  id v25 = v47;
  id v26 = [v47 btAddressData];
  id v27 = CUPrintNSDataAddress();

  if (v27)
  {
    uint64_t v28 = [(NSMutableDictionary *)self->_connectedDevicesSrModeCache objectForKeyedSubscript:v27];
    unsigned int v29 = [v28 mode];
    if (v29 > 2) {
      id v30 = "?";
    }
    else {
      id v30 = off_1002343E8[v29];
    }
    int v31 = +[NSString stringWithUTF8String:v30];

    id v32 = [(NSMutableDictionary *)self->_connectedDevicesSrModeCache objectForKeyedSubscript:v27];
    unsigned int v33 = [v32 mode];

    if (v33 == 1)
    {
      uint64_t v34 = 1;
    }
    else
    {
      uint64_t v35 = [(NSMutableDictionary *)self->_connectedDevicesSrModeCache objectForKeyedSubscript:v27];
      unsigned int v36 = [v35 mode];

      if (v36 == 2) {
        uint64_t v34 = 4294957297;
      }
      else {
        uint64_t v34 = 0;
      }
    }
    v54[0] = @"enableSR";
    unsigned int v53 = [(NSMutableDictionary *)self->_connectedDevicesSrModeCache objectForKeyedSubscript:v27];
    uint64_t v50 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v53 enableCount]);
    v55[0] = v50;
    v54[1] = @"disableSR";
    id v37 = [(NSMutableDictionary *)self->_connectedDevicesSrModeCache objectForKeyedSubscript:v27];
    id v38 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v37 disableCount]);
    v55[1] = v38;
    v55[2] = v31;
    v54[2] = @"mode";
    v54[3] = @"modeOffset";
    long long v39 = +[NSNumber numberWithInt:v34];
    v55[3] = v39;
    v54[4] = @"srCapable";
    long long v40 = +[NSNumber numberWithBool:self->_prefSmartRoutingEnabledPhase3];
    v55[4] = v40;
    v54[5] = @"wxBuildVersion";
    uint64_t v41 = [v47 firmwareVersion];
    long long v42 = (void *)v41;
    CFStringRef v43 = &stru_10023D730;
    if (v41) {
      CFStringRef v43 = (const __CFString *)v41;
    }
    v55[5] = v43;
    v54[6] = @"wxPD";
    uint64_t v44 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v47 productID]);
    void v55[6] = v44;
    uint64_t v45 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:7];
    CUMetricsLogEx();

    id v25 = v47;
  }
  *(void *)&self->_nearbyBannerActionCount = 0;
  *(void *)&self->_connectedBannerDismissedCount = 0;
  *(void *)&self->_reverseBannerActionCount = 0;
  self->_nearbyBannerRouting = 0;
  self->_autoRoutingSingle = 0;
  *(void *)&self->_autoRoutingTipi = 0;
  self->_autoRoutingHijackError = 0;
  self->_reverseRoutingCount = 0;
  self->_routingManualCount = 0;
  *(void *)&self->_fakeHfpSessionCount = 0;
}

- (void)_submitMetricNearby:(unsigned int)a3
{
  nearByStats = self->_nearByStats;
  if (nearByStats)
  {
    uint64_t v5 = *(void *)&a3;
    v11[0] = @"noNB";
    id v6 = +[NSNumber numberWithUnsignedInt:[(BTSmartRoutingNearbyStats *)nearByStats noNearbyDeviceFoundCount]];
    v12[0] = v6;
    v11[1] = @"nbTp";
    id v7 = +[NSNumber numberWithUnsignedInt:[(BTSmartRoutingNearbyStats *)self->_nearByStats nearbyDeviceNoTipiScoreCount]];
    v12[1] = v7;
    v11[2] = @"wxPD";
    id v8 = +[NSNumber numberWithUnsignedInt:v5];
    v12[2] = v8;
    v11[3] = @"FDBT";
    uint64_t v9 = +[NSNumber numberWithUnsignedInt:[(BTSmartRoutingNearbyStats *)self->_nearByStats SRConnectedSetCount]];
    v12[3] = v9;
    id v10 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
    CUMetricsLogEx();

    [(BTSmartRoutingNearbyStats *)self->_nearByStats setNoNearbyDeviceFoundCount:0];
    [(BTSmartRoutingNearbyStats *)self->_nearByStats setNearbyDeviceNoTipiScoreCount:0];
    [(BTSmartRoutingNearbyStats *)self->_nearByStats setSRConnectedSetCount:0];
    [(BTSmartRoutingNearbyStats *)self->_nearByStats setMinRSSIHeadset:0];
  }
}

- (void)_submitMetricTipiHealingforDevice:(id)a3 withDuration:(double)a4 andLegacy:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v34 = [v8 deviceAddress];
  uint64_t v9 = -[BTSmartRoutingDaemon _getWxFWVersion:](self, "_getWxFWVersion:");
  id v10 = (void *)v9;
  uint64_t v11 = &stru_10023D730;
  if (v9) {
    uint64_t v11 = (__CFString *)v9;
  }
  id v12 = v11;

  uint64_t v13 = [v8 otherTipiDeviceBTName];
  int v14 = (void *)v13;
  id v15 = @"Null";
  if (v13) {
    id v15 = (__CFString *)v13;
  }
  int64_t v16 = v15;

  LODWORD(v17) = vcvtpd_s64_f64(a4);
  uint64_t v18 = +[NSNumber numberWithInt:v17];
  id v19 = +[NSNumber numberWithInt:(int)(a4 * 1000.0)];
  if (a4 > 10.0 && dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    int v20 = "yes";
    if (v5) {
      int v20 = "no";
    }
    unsigned int v29 = v18;
    int v31 = v20;
    LogPrintF();
  }
  BOOL v21 = [(SmartRoutingStats *)self->_stats mediaPlaying]
     || [(SmartRoutingStats *)self->_stats callConnected];
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    id v22 = "yes";
    if (v5) {
      CFStringRef v23 = "no";
    }
    else {
      CFStringRef v23 = "yes";
    }
    if (!v21) {
      id v22 = "no";
    }
    id v32 = v23;
    unsigned int v33 = v22;
    id v30 = v18;
    LogPrintF();
  }
  v35[0] = @"Thv2";
  BOOL v24 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", !v5, v30, v32, v33);
  v36[0] = v24;
  v36[1] = v18;
  v35[1] = @"duration";
  v35[2] = @"durationMS";
  v36[2] = v19;
  v35[3] = @"isPlaying";
  id v25 = +[NSNumber numberWithInt:v21];
  v36[3] = v25;
  v36[4] = v16;
  v35[4] = @"otherTiPiDevice";
  void v35[5] = @"tipiV2Eligible";
  id v26 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 isTipiHealingV2Eligible]);
  void v36[5] = v26;
  v36[6] = v12;
  v35[6] = @"wxBuildVersion";
  v35[7] = @"wxPD";
  id v27 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v8 productID]);
  v36[7] = v27;
  uint64_t v28 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:8];
  CUMetricsLogEx();
}

- (void)_submitManualRouteDetectionMetric:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BTSmartRoutingDaemon *)self _getWxProductID:v4];
  id v6 = [(BTSmartRoutingDaemon *)self _getCurrentRoute];
  id v7 = [(BTSmartRoutingDaemon *)self _getWxFWVersion:v4];

  id v8 = &stru_10023D730;
  if (v7) {
    id v8 = v7;
  }
  uint64_t v9 = v8;

  mach_absolute_time();
  uint64_t v10 = UpTicksToSeconds();
  if ([v6 containsString:@"Speaker"]
    && dword_1002610B8 <= 30
    && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v16[0] = v6;
  v15[0] = @"route";
  v15[1] = @"srCapable";
  uint64_t v11 = +[NSNumber numberWithBool:self->_prefSmartRoutingEnabledPhase3];
  v16[1] = v11;
  v15[2] = @"wxProductID";
  id v12 = +[NSNumber numberWithUnsignedInt:v5];
  v16[2] = v12;
  v15[3] = @"timeSinceLastHijack";
  uint64_t v13 = +[NSNumber numberWithUnsignedLongLong:v10];
  void v15[4] = @"wxFWVersion";
  v16[3] = v13;
  v16[4] = v9;
  int v14 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:5];

  CUMetricsLogEx();
}

- (void)_submitRouteChangeDetectionMetric:(id)a3 andAnswer:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) > 3) {
    uint64_t v5 = "?";
  }
  else {
    uint64_t v5 = off_100234400[a4 - 1];
  }
  id v6 = a3;
  id v7 = +[NSString stringWithUTF8String:v5];
  uint64_t v8 = [(BTSmartRoutingDaemon *)self _getWxProductID:v6];

  uint64_t v9 = [(BTSmartRoutingDaemon *)self _getCurrentRoute];
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v13 = 5;
    int v14 = v9;
    id v12 = v7;
    LogPrintF();
  }
  uint64_t v10 = +[NSNumber numberWithUnsignedInt:v8, v12, v13, v14, @"hijackAnswer", @"route", @"wxProductID", v7, v9];
  v16[2] = v10;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:3];
  CUMetricsLogEx();
}

- (BOOL)_supportsSR:(id)a3 andProductID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if ([(BTSmartRoutingDaemon *)self _supportsTipi:a3]) {
    return 1;
  }
  if (GestaltGetDeviceClass() != 1 && GestaltGetDeviceClass() != 6) {
    return 0;
  }

  return [(BTSmartRoutingDaemon *)self _supportsPhoneWatchTipi:v4];
}

- (BOOL)_supportsTipi:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CBDiscovery *)self->_pairedDiscovery discoveredDevices];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v11 btAddressData];
        uint64_t v13 = CUPrintNSDataAddress();

        if (v4 && v13 && [v4 isEqualToString:v13]) {
          v8 |= ((unint64_t)[v11 deviceFlags] >> 4) & 1;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8 & 1;
}

- (BOOL)_supportsPhoneWatchTipi:(unsigned int)a3
{
  unsigned int v3 = a3 - 8194;
  if (a3 - 8194 <= 0xE) {
    unsigned int v4 = (0x3F64u >> (a3 - 2)) & 1;
  }
  else {
    LOBYTE(v4) = 1;
  }
  BOOL v5 = v3 > 0x22;
  uint64_t v6 = (1 << v3) & 0x47A877F9BLL;
  if (v5 || v6 == 0) {
    return 0;
  }
  else {
    return v4;
  }
}

- (void)_setTipiElectionType:(BOOL)a3 withDevice:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v11 = v6;
  if (v4)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_tipiElectionThroughLEPipe = 0;
    lePipeDevice = self->_lePipeDevice;
    self->_lePipeDevice = 0;
  }
  else
  {
    id v7 = v6;
    if (dword_1002610B8 <= 30)
    {
      if (dword_1002610B8 != -1 || (v9 = _LogCategory_Initialize(), id v7 = v11, v9))
      {
        LogPrintF();
        id v7 = v11;
      }
    }
    self->_tipiElectionThroughLEPipe = 1;
    uint64_t v10 = v7;
    lePipeDevice = self->_lePipeDevice;
    self->_lePipeDevice = v10;
  }
}

- (void)_tipiHealingAttempt
{
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = sub_10001E20C;
  long long v17 = sub_10001E21C;
  id v18 = 0;
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_10001E20C;
  id v11 = sub_10001E21C;
  id v12 = 0;
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100051EEC;
  v6[3] = &unk_100233D48;
  void v6[4] = self;
  void v6[5] = &v7;
  void v6[6] = &v13;
  [(NSMutableDictionary *)smartRoutingWxDeviceMap enumerateKeysAndObjectsUsingBlock:v6];
  if (v8[5])
  {
    if (v14[5])
    {
      if (-[BTSmartRoutingDaemon _lastConnectIsWatchCheck:](self, "_lastConnectIsWatchCheck:"))
      {
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
LABEL_13:
        }
          LogPrintF();
      }
      else
      {
        BOOL v4 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v8[5]];
        unsigned int v5 = [v4 tipiHealingBackoff];

        if (!v5)
        {
          [(BTSmartRoutingDaemon *)self _startTipiHealing:v8[5] withLastConnect:v14[5]];
          goto LABEL_20;
        }
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
          goto LABEL_13;
        }
      }
    }
    else if (dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_13;
    }
  }
LABEL_20:
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
}

- (void)_tipiHealing:(id)a3 withDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(BTSmartRoutingDaemon *)self _getWxFWVersion:v6];
  uint64_t v9 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v6];
  if ([@"5A187" compare:v8 options:64] == (id)1)
  {
    [v9 setIsTipiHealingV2Eligible:0];
    if (dword_1002610B8 <= 60 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      id v52 = v8;
      CFStringRef v53 = @"5A187";
      LogPrintF();
    }
    [(BTSmartRoutingDaemon *)self _tipiHealingAttempt];
    goto LABEL_59;
  }
  if (self->_prefSmartRoutingWatchAutomaticSwitching
    && [(BTSmartRoutingDaemon *)self _isMagnetConnectedDeviceforTipiHealingCheck:v7])
  {
    if (self->_pairedCompanionDeviceSupportsSmartRouting)
    {
      uint64_t v10 = [(NRPairedDeviceRegistry *)self->_NRRegistry getActivePairedDevice];
      id v11 = [v10 valueForProperty:NRDevicePropertyProductType];
      unsigned int v12 = [v11 hasPrefix:@"Watch"];
      uint64_t v13 = @"iPhone";
      if (v12) {
        uint64_t v13 = @"Watch";
      }
      int v14 = v13;
      [(BTSmartRoutingDaemon *)self _updateOtherTipiDevicewithAudioCategory:v6 otherAddress:v7 otherName:v14 otherVersion:&off_100244058];
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
      {
        CFStringRef v53 = v14;
        id v54 = &off_100244058;
        id v52 = v7;
        LogPrintF();
      }
      if (GestaltGetDeviceClass() == 1) {
        [v9 _setOtherTipiDeviceIsWatch:1];
      }
      -[BTSmartRoutingDaemon _tipihHealingV2Handling:](self, "_tipihHealingV2Handling:", v6, v52, v53, v54);
    }
    goto LABEL_59;
  }
  CFStringRef v60 = self;
  id v63 = v6;
  int v64 = v9;
  CFStringRef v62 = v8;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v61 = [objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.icloudpairing"];
  uint64_t v15 = [v61 devices];
  id v16 = [v15 countByEnumeratingWithState:&v73 objects:v77 count:16];
  if (!v16) {
    goto LABEL_54;
  }
  id v17 = v16;
  uint64_t v18 = *(void *)v74;
  while (2)
  {
    for (i = 0; i != v17; i = (char *)i + 1)
    {
      if (*(void *)v74 != v18) {
        objc_enumerationMutation(v15);
      }
      int v20 = *(void **)(*((void *)&v73 + 1) + 8 * i);
      BOOL v21 = +[CBIDSManager sharedInstance];
      id v22 = [v20 uniqueID];
      CFStringRef v23 = [v21 publicAddressForIDSDevice:v22];

      if (v23 && [v23 isEqualToString:v7])
      {
        BOOL v24 = [v20 productName];
        if (![v24 isEqualToString:@"iPhone OS"]
          || v20 && ([v20 operatingSystemVersion], v72 >= 16))
        {
          id v25 = [v20 modelIdentifier];
          if (([v25 containsString:@"Mac"] & 1) == 0)
          {

            goto LABEL_33;
          }
          if (v20)
          {
            [v20 operatingSystemVersion];

            if (v71 < 13)
            {
LABEL_44:
              [v64 setIsTipiHealingV2Eligible:0];
              if (dword_1002610B8 <= 60 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
                LogPrintF();
              }
              [(BTSmartRoutingDaemon *)v60 _tipiHealingAttempt];
              goto LABEL_53;
            }
LABEL_33:
            id v26 = [v20 productName];
            unsigned int v27 = [v26 hasPrefix:@"Watch"];

            if (v27)
            {
              if (dword_1002610B8 > 60 || dword_1002610B8 == -1 && !_LogCategory_Initialize()) {
                goto LABEL_53;
              }
              goto LABEL_50;
            }
            uint64_t v28 = [v20 modelIdentifier];
            unsigned int v29 = [v28 hasPrefix:@"AppleTV"];

            if (v29)
            {
              if (dword_1002610B8 > 60 || dword_1002610B8 == -1 && !_LogCategory_Initialize()) {
                goto LABEL_53;
              }
              goto LABEL_50;
            }
            if ([v64 tipiHealingBackoff])
            {
              if (dword_1002610B8 > 60 || dword_1002610B8 == -1 && !_LogCategory_Initialize()) {
                goto LABEL_53;
              }
LABEL_50:
              LogPrintF();
LABEL_53:

              goto LABEL_54;
            }
            nearbyInfoDevicesTriangleRecoveryTimer = v60->_nearbyInfoDevicesTriangleRecoveryTimer;
            if (nearbyInfoDevicesTriangleRecoveryTimer)
            {
              int v31 = nearbyInfoDevicesTriangleRecoveryTimer;
              dispatch_source_cancel(v31);
              id v32 = v60->_nearbyInfoDevicesTriangleRecoveryTimer;
              v60->_nearbyInfoDevicesTriangleRecoveryTimer = 0;
            }
            tipiHealingTimer = v60->_tipiHealingTimer;
            if (!tipiHealingTimer)
            {
LABEL_77:
              unsigned int v36 = [v20 modelIdentifier];
              id v37 = @"Mac";
              if (([v36 containsString:@"Mac"] & 1) == 0)
              {
                id v38 = [v20 modelIdentifier];
                unsigned int v39 = [v38 hasPrefix:@"iPad"];
                long long v40 = @"iPhone";
                if (v39) {
                  long long v40 = @"iPad";
                }
                id v37 = v40;
              }
              uint64_t v41 = [v20 modelIdentifier];
              unsigned int v59 = [v41 containsString:@"Mac"];

              long long v42 = [v20 productName];
              if ([v42 isEqualToString:@"iPhone OS"])
              {
                if (v20)
                {
                  [v20 operatingSystemVersion];
                  if (v70 >= 17)
                  {

                    goto LABEL_88;
                  }
                }
              }
              CFStringRef v43 = [v20 modelIdentifier];
              if ([v43 containsString:@"Mac"])
              {
                if (v20)
                {
                  [v20 operatingSystemVersion];

                  if (v69 < 14)
                  {
                    uint64_t v44 = &off_100244068;
                    goto LABEL_94;
                  }
LABEL_88:
                  uint64_t v44 = &off_100244058;
LABEL_94:
                  [(BTSmartRoutingDaemon *)v60 _updateOtherTipiDevicewithAudioCategory:v6 otherAddress:v7 otherName:v37 otherVersion:v44];
                  goto LABEL_95;
                }

                [(BTSmartRoutingDaemon *)v60 _updateOtherTipiDevicewithAudioCategory:v6 otherAddress:v7 otherName:v37 otherVersion:&off_100244068];
              }
              else
              {

                uint64_t v44 = &off_100244068;
                [(BTSmartRoutingDaemon *)v60 _updateOtherTipiDevicewithAudioCategory:v6 otherAddress:v7 otherName:v37 otherVersion:&off_100244068];
                if (v20)
                {
LABEL_95:
                  [v20 operatingSystemVersion];
                  uint64_t v46 = v68;
                  [v20 operatingSystemVersion];
                  char v47 = 0;
                  uint64_t v45 = v67;
LABEL_96:
                  [v64 _setOtherTipiDeviceBuildVersion:v46 andMinorBuildVersion:v45];
                  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
                  {
                    id v48 = [v20 productName];
                    if (v47)
                    {
                      uint64_t v49 = 0;
                      uint64_t v50 = 0;
                    }
                    else
                    {
                      [v20 operatingSystemVersion];
                      uint64_t v50 = v66;
                      [v20 operatingSystemVersion];
                      uint64_t v49 = v65;
                    }
                    unsigned int v51 = "no";
                    if (v59) {
                      unsigned int v51 = "yes";
                    }
                    uint64_t v56 = v50;
                    uint64_t v57 = v49;
                    id v54 = v44;
                    long long v55 = v48;
                    id v52 = v7;
                    CFStringRef v53 = v37;
                    BOOL v58 = v51;
                    LogPrintF();
                  }
                  -[BTSmartRoutingDaemon _tipihHealingV2Handling:](v60, "_tipihHealingV2Handling:", v63, v52, v53, v54, v55, v56, v57, v58);

                  goto LABEL_53;
                }
              }
              uint64_t v45 = 0;
              uint64_t v46 = 0;
              char v47 = 1;
              uint64_t v44 = &off_100244068;
              goto LABEL_96;
            }
            if (dword_1002610B8 >= 31)
            {
              uint64_t v34 = tipiHealingTimer;
            }
            else
            {
              if (dword_1002610B8 != -1 || _LogCategory_Initialize()) {
                LogPrintF();
              }
              uint64_t v34 = v60->_tipiHealingTimer;
              if (!v34) {
                goto LABEL_76;
              }
            }
            dispatch_source_cancel(v34);
            uint64_t v35 = v60->_tipiHealingTimer;
            v60->_tipiHealingTimer = 0;

LABEL_76:
            v60->_BOOL tipiElectionInProgress = 0;
            goto LABEL_77;
          }
        }
        goto LABEL_44;
      }
    }
    id v17 = [v15 countByEnumeratingWithState:&v73 objects:v77 count:16];
    if (v17) {
      continue;
    }
    break;
  }
LABEL_54:

  int v8 = v62;
  id v6 = v63;
  uint64_t v9 = v64;
LABEL_59:
}

- (void)_tipihHealingV2Handling:(id)a3
{
  id v4 = a3;
  [(BTSmartRoutingDaemon *)self _postNotification:"com.apple.BluetoothServices.AudioRoutingChanged"];
  unsigned int v5 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v4];
  id v6 = [(BTSmartRoutingDaemon *)self _getWxFWVersion:v4];
  if (self->_activityLevelMediaPlaying
    || (int)[(CUSystemMonitor *)self->_callMonitor activeCallCount] > 0)
  {
    LODWORD(v7) = 1;
  }
  else
  {
    LODWORD(v7) = [(NSString *)self->_cdDeviceIdentifier isEqualToString:v4];
  }
  int v8 = [v5 identifier];
  uint64_t v9 = [(NSMutableDictionary *)self->_nearbyWxDeviceMap objectForKeyedSubscript:v8];
  uint64_t v10 = [v9 zeroSourceLastRouteHost];

  uint64_t v71 = (void *)v10;
  unsigned int v70 = [(BTSmartRoutingDaemon *)self _isMyAddress:v10];
  id v11 = [(NSMutableDictionary *)self->_srDiscoveredDeviceMap objectForKeyedSubscript:v4];
  unsigned int v12 = [v11 userConnectedState];

  uint64_t v13 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v4];
  if ([v13 audioStreamState])
  {
    int v14 = [(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v4];
    BOOL v15 = (int)[v14 audioStreamState] > 1;
  }
  else
  {
    BOOL v15 = 1;
  }

  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    if (self->_isBTRoute) {
      id v16 = "yes";
    }
    else {
      id v16 = "no";
    }
    if (v7) {
      id v17 = "yes";
    }
    else {
      id v17 = "no";
    }
    uint64_t v67 = v17;
    uint64_t v68 = v16;
    if (v70) {
      uint64_t v18 = "yes";
    }
    else {
      uint64_t v18 = "no";
    }
    uint64_t v66 = v18;
    if ([v5 lastPlay]) {
      id v19 = "yes";
    }
    else {
      id v19 = "no";
    }
    uint64_t v65 = v19;
    char v69 = (char)v7;
    id v7 = v8;
    if ([v5 otherTipiDeviceLastPlay]) {
      int v20 = "yes";
    }
    else {
      int v20 = "no";
    }
    if (v15) {
      BOOL v21 = "yes";
    }
    else {
      BOOL v21 = "no";
    }
    id v22 = [(NSMutableDictionary *)self->_srBudswapDeviceMap objectForKeyedSubscript:v4];
    if (v22) {
      CFStringRef v23 = "yes";
    }
    else {
      CFStringRef v23 = "no";
    }
    if (v12) {
      BOOL v24 = "yes";
    }
    else {
      BOOL v24 = "no";
    }
    id v63 = v23;
    int v64 = v24;
    id v61 = v20;
    CFStringRef v62 = v21;
    int v8 = v7;
    LOBYTE(v7) = v69;
    unsigned int v59 = v66;
    CFStringRef v60 = v65;
    uint64_t v56 = v68;
    BOOL v58 = v67;
    LogPrintF();
  }
  if (self->_isBTRoute) {
    char v25 = (char)v7;
  }
  else {
    char v25 = 0;
  }
  if ((v25 & 1) != 0
    || (v8 ? (unsigned int v26 = v70) : (unsigned int v26 = 0),
        v26 == 1 && ![v5 otherTipiDeviceLastPlay]
     || self->_callConnected
     || (self->_splitterStateOn ? (int v27 = 1) : (int v27 = v12), v27 == 1)))
  {
    [v5 _setRoutingAction:1, v56, v58, v59, v60, v61, v62, v63, v64];
    uint64_t v28 = &unk_100261000;
    if (v12)
    {
      unsigned int v29 = [(NSMutableDictionary *)self->_srDiscoveredDeviceMap objectForKeyedSubscript:v4];
      [v29 _setUserConnectedState:0];
    }
  }
  else
  {
    [v5 _setRoutingAction:3];
    uint64_t v28 = (_DWORD *)&unk_100261000;
  }
  [v5 setIsTipiHealingV2Eligible:1 v56];
  nearbyInfoDevicesTriangleRecoveryTimer = self->_nearbyInfoDevicesTriangleRecoveryTimer;
  if (nearbyInfoDevicesTriangleRecoveryTimer)
  {
    int v31 = nearbyInfoDevicesTriangleRecoveryTimer;
    dispatch_source_cancel(v31);
    id v32 = self->_nearbyInfoDevicesTriangleRecoveryTimer;
    self->_nearbyInfoDevicesTriangleRecoveryTimer = 0;
  }
  tipiHealingTimer = self->_tipiHealingTimer;
  if (tipiHealingTimer)
  {
    int v34 = v28[46];
    if (v34 >= 31)
    {
      uint64_t v35 = tipiHealingTimer;
    }
    else
    {
      if (v34 != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      uint64_t v35 = self->_tipiHealingTimer;
      if (!v35) {
        goto LABEL_62;
      }
    }
    dispatch_source_cancel((dispatch_source_t)v35);
    unsigned int v36 = self->_tipiHealingTimer;
    self->_tipiHealingTimer = 0;

LABEL_62:
    self->_BOOL tipiElectionInProgress = 0;
  }
  [(BTSmartRoutingDaemon *)self _notifyOtherTipiDeviceTipiScoreChanged:0 andNewScore:0];
  [v5 _setRoutingInitialized:1];
  if (self->_tipiHealingHijackTimer
    && ![(BTSmartRoutingDaemon *)self _deviceSupportsHijackV2:v6 withDevice:v5])
  {
    tipiHealingHijackTimer = self->_tipiHealingHijackTimer;
    if (tipiHealingHijackTimer)
    {
      id v38 = tipiHealingHijackTimer;
      dispatch_source_cancel(v38);
      unsigned int v39 = self->_tipiHealingHijackTimer;
      self->_tipiHealingHijackTimer = 0;
    }
    int v40 = v28[46];
    if (v40 <= 30 && (v40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v41 = [v5 audioRoutingRequest];
    long long v42 = [v5 audioRoutingResponse];
    [(BTSmartRoutingDaemon *)self _smartRoutingAudioRoutingRequest:v41 withResponseHandler:v42];
  }
  if (([v5 tipitableUpdated] & 1) == 0)
  {
    CFStringRef v43 = [(BTSmartRoutingDaemon *)self _myBluetoothAddressString];
    uint64_t v44 = [v5 otherTipiDeviceBTAddress];
    uint64_t v45 = v8;
    if ([v5 routingAction] == 1)
    {
      uint64_t v77 = v43;
      uint64_t v46 = &v77;
      char v47 = v44;
    }
    else
    {
      long long v76 = v44;
      uint64_t v46 = &v76;
      char v47 = v43;
    }
    v46[1] = v47;
    +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:");
    id v48 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v49 = [(BTSmartRoutingDaemon *)self _verifyWxConnectedBTAddress:v4 withVersion:&off_1002448C8];
    int v50 = v28[46];
    if (v50 <= 90 && (v50 != -1 || _LogCategory_Initialize()))
    {
      id v57 = v4;
      BOOL v58 = v48;
      LogPrintF();
    }
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_1000532EC;
    v72[3] = &unk_100233C40;
    id v73 = v4;
    long long v74 = v48;
    id v75 = v5;
    [(BTSmartRoutingDaemon *)self _updateAccessoryID:v49 connectionDeviceAddresses:v48 completion:v72];

    int v8 = v45;
  }
  unsigned int v51 = -[NSMutableDictionary objectForKeyedSubscript:](self->_smartRoutingWxStatsMap, "objectForKeyedSubscript:", v4, v57, v58);

  if (v51)
  {
    mach_absolute_time();
    id v52 = [(NSMutableDictionary *)self->_smartRoutingWxStatsMap objectForKeyedSubscript:v4];
    [v52 thV2Ticks];
    UpTicksToSecondsF();
    double v54 = v53;

    [(BTSmartRoutingDaemon *)self _submitMetricTipiHealingforDevice:v5 withDuration:0 andLegacy:v54];
  }
  int v55 = v28[46];
  if (v55 <= 30 && (v55 != -1 || _LogCategory_Initialize()))
  {
    [v5 routingAction];
    LogPrintF();
  }
}

- (void)_tipiHealingStartTimer:(id)a3
{
  dispatch_time_t v4 = dispatch_time(0, 10000000000);
  tipiHealingTimer = self->_tipiHealingTimer;
  if (tipiHealingTimer)
  {
    dispatch_source_set_timer(tipiHealingTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  else
  {
    id v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    id v7 = self->_tipiHealingTimer;
    self->_tipiHealingTimer = v6;

    int v8 = self->_tipiHealingTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000534B4;
    handler[3] = &unk_100232710;
    void handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_tipiHealingTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_tipiHealingTimer);
  }
}

- (void)_triggerTipiTableUpdate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    unsigned int v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:");
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      aaController = self->_aaController;
      unsigned int v7 = [(BTSmartRoutingDaemon *)self _aacpConnectedCheck:v5];
      int v8 = "no";
      if (v7) {
        int v8 = "yes";
      }
      uint64_t v9 = aaController;
      uint64_t v10 = v8;
      LogPrintF();
    }
    -[AAController sendGetTipiTableMessageToDestinationIdentifier:completionHandler:](self->_aaController, "sendGetTipiTableMessageToDestinationIdentifier:completionHandler:", v11, &stru_100233D68, v9, v10);
  }
  else if (dword_1002610B8 <= 90)
  {
    if (dword_1002610B8 != -1 || (id v4 = (id)_LogCategory_Initialize(), v4)) {
      id v4 = (id)LogPrintF();
    }
  }

  _objc_release_x2(v4);
}

- (BOOL)_deviceSupportsHijackV2:(id)a3 withDevice:(id)a4
{
  id v5 = a4;
  if ([@"5E135" compare:a3 options:64] == (id)1)
  {
    BOOL v6 = 0;
  }
  else
  {
    unsigned int v7 = [v5 otherTipiDeviceVersion];
    BOOL v6 = (int)[v7 intValue] > 1;
  }
  return v6;
}

- (void)_tipiHealingHijackTimerStart:(id)a3 withScore:(int)a4
{
  id v6 = a3;
  unsigned int v7 = self->_tipiHealingHijackTimer;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_10001E20C;
  void v13[4] = sub_10001E21C;
  id v14 = 0;
  if (v7)
  {
    dispatch_source_t v8 = (dispatch_source_t)v7;
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)&self->_tipiHealingHijackTimer, v8);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000539AC;
    handler[3] = &unk_100233D90;
    void handler[4] = self;
    int v12 = a4;
    id v10 = v6;
    id v11 = v13;
    dispatch_source_set_event_handler(v8, handler);
    CUDispatchTimerSet();
    dispatch_activate(v8);
  }
  _Block_object_dispose(v13, 8);
}

- (BOOL)_arbitrationTimeout:(id)a3 withScore:(int)a4
{
  connectedDevices = self->_connectedDevices;
  id v7 = a3;
  dispatch_source_t v8 = [(NSMutableDictionary *)connectedDevices objectForKeyedSubscript:v7];
  unsigned int v9 = [v8 audioStreamState];

  if (v9 - 1 > 2) {
    int v10 = 0;
  }
  else {
    int v10 = dword_1001CFC64[v9 - 1];
  }
  id v11 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v7];

  id v12 = [v11 hijackBackoffTicks];
  BOOL v14 = a4 == 501 || v10 <= a4;
  if (v12) {
    BOOL v15 = 0;
  }
  else {
    BOOL v15 = v14;
  }

  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return v15;
}

- (void)_setPipeMessageStats:(unint64_t)a3
{
  [(SmartRoutingStats *)self->_stats setFirstPipeMessageRTT:a3];
  [(SmartRoutingStats *)self->_stats firstPipeMessageRTT];
  if ((unint64_t)UpTicksToSeconds() >= 4
    && dword_1002610B8 <= 90
    && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_updateAudioRoute:(int)a3 withUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v12 = a4;
  if (v4 && [(BTSmartRoutingSourceDevice *)self->_sourceDevice audioRoute] != v4)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      unsigned int v6 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice audioRoute];
      if (v6 > 4) {
        id v7 = "?";
      }
      else {
        id v7 = off_100234440[v6];
      }
      if (v4 > 4) {
        dispatch_source_t v8 = "?";
      }
      else {
        dispatch_source_t v8 = off_100234468[(int)v4 - 1];
      }
      int v10 = v8;
      id v11 = v12;
      unsigned int v9 = v7;
      LogPrintF();
    }
    -[BTSmartRoutingSourceDevice setAudioRoute:](self->_sourceDevice, "setAudioRoute:", v4, v9, v10, v11);
    [(BTSmartRoutingSourceDevice *)self->_sourceDevice setAudioDestination:v12];
  }
}

- (void)_updateLocalAudioCategory:(id)a3
{
  id v5 = (NSNumber *)a3;
  unsigned int v6 = v5;
  if (self->_prefSmartRoutingPreemptiveConnectedBanner
    && [(NSNumber *)v5 intValue] >= 301
    && [(NSNumber *)self->_localDeviceAudioCatogory intValue] == 100
    && ![(NSMutableDictionary *)self->_smartRoutingWxDeviceMap count])
  {
    if (dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_localDeviceAudioCatogory, a3);
    [(BTSmartRoutingDaemon *)self _evaluatorRun];
    if (self->_preemptiveBannerConnectionInProgress) {
      [(SmartRoutingStats *)self->_stats setLocalAudioScore:self->_localDeviceAudioCatogory];
    }
  }
  localDeviceAudioCatogory = self->_localDeviceAudioCatogory;
  if (localDeviceAudioCatogory != v6)
  {
    if (dword_1002610B8 <= 90)
    {
      if (dword_1002610B8 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_16;
        }
        localDeviceAudioCatogory = self->_localDeviceAudioCatogory;
      }
      [(NSNumber *)localDeviceAudioCatogory intValue];
      [(NSNumber *)v6 intValue];
      unsigned int v9 = [(BTSmartRoutingSourceDevice *)self->_sourceDevice activePlayingApp];
      LogPrintF();
    }
LABEL_16:
    objc_storeStrong((id *)&self->_localDeviceAudioCatogory, a3);
    smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100053FC8;
    v10[3] = &unk_1002334D0;
    void v10[4] = self;
    id v11 = v6;
    [(NSMutableDictionary *)smartRoutingWxDeviceMap enumerateKeysAndObjectsUsingBlock:v10];
  }
}

- (void)_updateOtherTipiBuildVersion:(id)a3
{
  uint64_t v4 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:a3];
  id v5 = [v4 otherTipiDeviceBTAddress];

  if (v5)
  {
    if (([v4 otherTipiDeviceIsWatch] & 1) != 0
      || GestaltGetDeviceClass() == 6)
    {
      NRRegistry = self->_NRRegistry;
      if (!NRRegistry)
      {
        id v7 = +[NRPairedDeviceRegistry sharedInstance];
        dispatch_source_t v8 = self->_NRRegistry;
        self->_NRRegistry = v7;

        NRRegistry = self->_NRRegistry;
      }
      unsigned int v9 = [(NRPairedDeviceRegistry *)NRRegistry getActivePairedDevice];
      int v10 = [v9 valueForProperty:NRDevicePropertySystemVersion];
      id v11 = [v10 componentsSeparatedByString:@"."];
      id v12 = [v11 objectAtIndex:0];
      id v13 = [v12 integerValue];

      BOOL v14 = [v10 componentsSeparatedByString:@"."];
      BOOL v15 = [v14 objectAtIndex:1];
      id v16 = [v15 integerValue];

      [v4 _setOtherTipiDeviceBuildVersion:v13 andMinorBuildVersion:v16];
    }
    else
    {
      id v17 = [v4 otherTipiDeviceBTAddress];
      unsigned int v9 = [(BTSmartRoutingDaemon *)self _getIDSDeviceFromBtAddress:v17];

      if (v9)
      {
        [v9 operatingSystemVersion];
        uint64_t v18 = v23;
        [v9 operatingSystemVersion];
        uint64_t v19 = v21;
      }
      else
      {
        uint64_t v19 = 0;
        uint64_t v18 = 0;
        uint64_t v23 = 0;
        uint64_t v24 = 0;
        uint64_t v25 = 0;
        uint64_t v21 = 0;
        uint64_t v22 = 0;
        uint64_t v20 = 0;
      }
      [v4 _setOtherTipiDeviceBuildVersion:v18 andMinorBuildVersion:v19, v20, v21, v22, v23, v24, v25];
    }
  }
}

- (void)_updateOtherTipiDevice:(id)a3 otherAddress:(id)a4 otherName:(id)a5 otherVersion:(id)a6 withResult:(id)a7
{
  id v23 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  BOOL v15 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v23];
  id v16 = v15;
  if (v15)
  {
    if (a7)
    {
      [v15 _setRoutingAction:2];
      [v16 _setOtherTipiDeviceInfo:0 andName:0 andVersion:0];
      [(BTSmartRoutingDaemon *)self _updateNearbyDeviceState:v23 withAddress:&stru_10023D730 withEasyPairing:0 withState:3];
    }
    else
    {
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
      {
        id v21 = v13;
        id v22 = v14;
        id v19 = v23;
        id v20 = v12;
        LogPrintF();
      }
      id v17 = v12;
      [v16 _setRoutingAction:1];
      [v16 _setOtherTipiDeviceInfo:v17 andName:v13 andVersion:v14];
      [(BTSmartRoutingDaemon *)self _updateNearbyDeviceState:v23 withAddress:v17 withEasyPairing:0 withState:1];

      uint64_t v18 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v23];
      [v18 _setOtherTipiAudioCategory:0];
    }
    -[BTSmartRoutingDaemon _postNotification:](self, "_postNotification:", "com.apple.BluetoothServices.AudioRoutingChanged", v19, v20, v21, v22);
  }
  else if (dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_updateOtherTipiDevicewithAudioCategory:(id)a3 otherAddress:(id)a4 otherName:(id)a5 otherVersion:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v17];
  id v14 = v10;
  if (v13)
  {
    [v13 _setOtherTipiDeviceInfo:v14 andName:v11 andVersion:v12];
    if ([(BTSmartRoutingDaemon *)self _isMagnetConnectedDeviceforTipiHealingCheck:v14]&& GestaltGetDeviceClass() == 1)
    {
      [v13 _setOtherTipiDeviceIsWatch:1];
    }
    if (self->_isBTRoute) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = 3;
    }
    [v13 _setRoutingAction:v15];
    if (v14)
    {
      [(BTSmartRoutingDaemon *)self _updateNearbyDeviceState:v17 withAddress:v14 withEasyPairing:0 withState:1];
      [v12 doubleValue];
      if (v16 >= 2.0)
      {
        if (self->_localDeviceAudioCatogory) {
          -[BTSmartRoutingDaemon _sendAudioCategory:withAudioCategory:](self, "_sendAudioCategory:withAudioCategory:", v17);
        }
      }
    }
  }
}

- (id)_verifyWxConnectedBTAddress:(id)a3 withVersion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6
    && ([(NSMutableDictionary *)self->_connectedDevices objectForKeyedSubscript:v6],
        dispatch_source_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v21 = 0;
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    unsigned int v9 = [(CBDiscovery *)self->_pairedDiscovery discoveredDevices];
    id v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v10)
    {
      id v11 = v10;
      unsigned int v26 = self;
      uint64_t v12 = *(void *)v28;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v13);
          uint64_t v15 = [v14 btAddressData:v24];
          if ([v15 length] != (id)6)
          {
            [v7 doubleValue];
            id v17 = 0;
LABEL_14:

            goto LABEL_15;
          }
          id v16 = v15;
          id v25 = [v16 bytes];
          id v17 = NSPrintF();
          [v7 doubleValue:v25];
          if (v18 < 1.1)
          {
            if (!v17 || ([v14 deviceFlags] & 0x10) == 0) {
              goto LABEL_14;
            }
            id v19 = [(NSMutableDictionary *)v26->_connectedDevices objectForKeyedSubscript:v17];
            goto LABEL_26;
          }
          if (!v17) {
            goto LABEL_14;
          }
          if ([v6 isEqualToString:v17]
            && ([v14 deviceFlags] & 0x10) != 0)
          {
            id v19 = v14;
LABEL_26:
            id v21 = v19;
            goto LABEL_29;
          }
          if (![v6 isEqualToString:v17]
            || ([v14 deviceFlags] & 0x10) != 0)
          {
            goto LABEL_14;
          }
          id v20 = objc_alloc_init((Class)CBDevice);
          [v20 setIdentifier:@"FF:FF:FF:FF:FF:FF"];
          id v21 = v20;
          if (dword_1002610B8 <= 50 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
          {
            id v24 = v6;
            LogPrintF();
          }

LABEL_29:
          if (v21) {
            goto LABEL_33;
          }
LABEL_15:
          id v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v22 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
        id v11 = v22;
      }
      while (v22);
    }
    id v21 = 0;
LABEL_33:
  }

  return v21;
}

- (BOOL)_verifyWxConnectedRouted:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v4];
  unsigned __int8 v6 = [v5 routed];

  id v7 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v4];
  if ([v7 inEar])
  {
    dispatch_source_t v8 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v4];
    unsigned int v9 = [v8 otherTipiDeviceBTAddress];

    if (!v9) {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 1;
  }

  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    id v10 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v4];
    [v10 inEar];
    id v11 = [(NSMutableDictionary *)self->_smartRoutingWxDeviceMap objectForKeyedSubscript:v4];
    id v13 = [v11 otherTipiDeviceBTAddress];
    LogPrintF();
  }
  return v6;
}

- (void)_watchHintingRecovery
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100054A84;
  block[3] = &unk_100232710;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_watchMediaControl
{
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_watchRecoveryStartTimer
{
  dispatch_time_t v3 = dispatch_time(0, 120000000000);
  watchRecoveryTimer = self->_watchRecoveryTimer;
  if (watchRecoveryTimer)
  {
    dispatch_source_set_timer(watchRecoveryTimer, v3, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  else
  {
    id v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    unsigned __int8 v6 = self->_watchRecoveryTimer;
    self->_watchRecoveryTimer = v5;

    id v7 = self->_watchRecoveryTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100054D78;
    handler[3] = &unk_100232710;
    void handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_watchRecoveryTimer, v3, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_watchRecoveryTimer);
  }
}

- (BTSmartRoutingRouteRequest)pipePendingRequest
{
  return self->_pipePendingRequest;
}

- (void)setPipePendingRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipePendingRequest, 0);
  objc_storeStrong((id *)&self->_wxAssetCache, 0);
  objc_storeStrong((id *)&self->_wxFirmwareCache, 0);
  objc_storeStrong((id *)&self->_wxDiscoveryWatchRecovery, 0);
  objc_storeStrong((id *)&self->_wxDiscovery, 0);
  objc_storeStrong((id *)&self->_wxDevices, 0);
  objc_storeStrong((id *)&self->_watchWxDevices, 0);
  objc_storeStrong((id *)&self->_watchRecoveryTimer, 0);
  objc_storeStrong(&self->_virtualIOExpiredBlock, 0);
  objc_storeStrong((id *)&self->_uiSmartRoutingBanner, 0);
  objc_storeStrong((id *)&self->_uiLowBatteryBanner, 0);
  objc_storeStrong((id *)&self->_uiNoteSessionSmartRoutingXROSType, 0);
  objc_storeStrong((id *)&self->_uiNoteSessionSmartRouting, 0);
  objc_storeStrong((id *)&self->_uiNoteSessionLowBattery, 0);
  objc_storeStrong((id *)&self->_tuCallCenter, 0);
  objc_storeStrong((id *)&self->_tipiHealingHijackTimer, 0);
  objc_storeStrong((id *)&self->_tipiHealingTimer, 0);
  objc_storeStrong((id *)&self->_tipiElectionReceivedLePipe, 0);
  objc_storeStrong((id *)&self->_systemUIMonitor, 0);
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_srDiscoveredDeviceMap, 0);
  objc_storeStrong((id *)&self->_srBudswapDeviceMap, 0);
  objc_storeStrong((id *)&self->_sourceDevice, 0);
  objc_storeStrong((id *)&self->_smartRoutingWxStatsMap, 0);
  objc_storeStrong((id *)&self->_smartRoutingWxDeviceMap, 0);
  objc_storeStrong((id *)&self->_smartRoutingLowerScanRateTimer, 0);
  objc_storeStrong((id *)&self->_smartRoutingPipe, 0);
  objc_storeStrong((id *)&self->_smartRoutingManualRoutingList, 0);
  objc_storeStrong((id *)&self->_smartRoutingManualDisconnectionList, 0);
  objc_storeStrong((id *)&self->_smartRoutingBackOffMap, 0);
  objc_storeStrong((id *)&self->_sleepWakeMonitor, 0);
  objc_storeStrong((id *)&self->_sigTermSource, 0);
  objc_storeStrong((id *)&self->_screenLockedLingerTimer, 0);
  objc_storeStrong((id *)&self->_routeIndicationSetRouteTimer, 0);
  objc_storeStrong((id *)&self->_routeIndicationQualifiedTickMap, 0);
  objc_storeStrong((id *)&self->_routeIndicationBulletinTimer, 0);
  objc_storeStrong((id *)&self->_routeIndicationBackOffMap, 0);
  objc_storeStrong((id *)&self->_routeChangeToSpeakerTimer, 0);
  objc_storeStrong((id *)&self->_routeChangeDetectionTimer, 0);
  objc_storeStrong((id *)&self->_ringtoneTimer, 0);
  objc_storeStrong((id *)&self->_smartRoutingController, 0);
  objc_storeStrong((id *)&self->_previousRoute, 0);
  objc_storeStrong((id *)&self->_prefSmartRoutingForcedDisconnectionStartTimer, 0);
  objc_storeStrong((id *)&self->_predictiveRouteTimer, 0);
  objc_storeStrong((id *)&self->_playbackStartTimer, 0);
  objc_storeStrong((id *)&self->_phoneOwnershipTriangleTimer, 0);
  objc_storeStrong((id *)&self->_phase1ConnectConfig, 0);
  objc_storeStrong((id *)&self->_pairedDiscovery, 0);
  objc_storeStrong((id *)&self->_powerMonitor, 0);
  objc_storeStrong((id *)&self->_ownershipLostTimer, 0);
  objc_storeStrong(&self->_ownershipChangedBlock, 0);
  objc_storeStrong((id *)&self->_NRRegistry, 0);
  objc_storeStrong((id *)&self->_myModel, 0);
  objc_storeStrong((id *)&self->_myAddress, 0);
  objc_storeStrong((id *)&self->_nearbyWxDeviceMap, 0);
  objc_storeStrong((id *)&self->_nearByStats, 0);
  objc_storeStrong((id *)&self->_nearbyInfoDiscovery, 0);
  objc_storeStrong((id *)&self->_nearbyInfoDevicesTriangleRecoveryTimer, 0);
  objc_storeStrong((id *)&self->_nearbyInfoDevices, 0);
  objc_storeStrong((id *)&self->_nearbyDeviceNotificationTimer, 0);
  objc_storeStrong((id *)&self->_lowBatteryWxDevices, 0);
  objc_storeStrong((id *)&self->_lowBatterySaveTimer, 0);
  objc_storeStrong((id *)&self->_lowBatteryDeviceMap, 0);
  objc_storeStrong((id *)&self->_localDeviceAudioCatogory, 0);
  objc_storeStrong((id *)&self->_lePipeDevice, 0);
  objc_storeStrong(&self->_isMuteStateChangedBlock, 0);
  objc_storeStrong(&self->_outputIsRunningChangedBlock, 0);
  objc_storeStrong(&self->_isHiddenChangedBlock, 0);
  objc_storeStrong((id *)&self->_inUseBannerTimer, 0);
  objc_storeStrong((id *)&self->_idleActivityScoreTimer, 0);
  objc_storeStrong((id *)&self->_hijackBackOffTimer, 0);
  objc_storeStrong((id *)&self->_highActivityLevelTimer, 0);
  objc_storeStrong((id *)&self->_evaluatorCoalescer, 0);
  objc_storeStrong((id *)&self->_eligibleHeadset, 0);
  objc_storeStrong((id *)&self->_dispatchQueueAVSys, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_disconnectTicksMap, 0);
  objc_storeStrong(&self->_connectionCompletion, 0);
  objc_storeStrong((id *)&self->_connectedDevicesSrModeCache, 0);
  objc_storeStrong((id *)&self->_connectedDevicesInEarCache, 0);
  objc_storeStrong((id *)&self->_connectSession, 0);
  objc_storeStrong((id *)&self->_connectDispatchTimer, 0);
  objc_storeStrong((id *)&self->_connectDevice, 0);
  objc_storeStrong((id *)&self->_connectedDiscovery, 0);
  objc_storeStrong((id *)&self->_connectedDevices, 0);
  objc_storeStrong((id *)&self->_cdDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_callMonitor, 0);
  objc_storeStrong((id *)&self->_budSwapTimer, 0);
  objc_storeStrong((id *)&self->_budSwapAddress, 0);
  objc_storeStrong((id *)&self->_audioStateSnapshotTimer, 0);
  objc_storeStrong((id *)&self->_audioCategoryScores, 0);
  objc_storeStrong((id *)&self->_activityLevelDelayTimer, 0);
  objc_storeStrong((id *)&self->_activityCriticalTimer, 0);
  objc_storeStrong((id *)&self->_aaDeviceManagerDaemon, 0);

  objc_storeStrong((id *)&self->_aaController, 0);
}

@end