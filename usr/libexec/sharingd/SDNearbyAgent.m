@interface SDNearbyAgent
+ (SDNearbyAgent)sharedNearbyAgent;
- (BOOL)_bleNearbyActionAdvertiserShouldAdvertise;
- (BOOL)_bleNearbyActionScannerShouldScan;
- (BOOL)_bleNearbyInfoAdvertiserLingerIfNeeded;
- (BOOL)_bleNearbyInfoAdvertiserShouldAddField3;
- (BOOL)_bleNearbyInfoAdvertiserShouldAdvertise;
- (BOOL)_bleNearbyInfoScannerShouldScan;
- (BOOL)_bleProximityPairingScannerShouldScan;
- (BOOL)_deviceCanTriggerEnhancedDiscovery:(id)a3;
- (BOOL)_identificationIdentifyDevice:(id)a3 sfDevice:(id)a4;
- (BOOL)_idsHasActiveWatch;
- (BOOL)_idsShouldAdvertiseNearbyInfo;
- (BOOL)_isDeviceMountedAndScreenOff;
- (BOOL)_shouldDeliverDonStateUpdates;
- (BOOL)autoUnlockActive;
- (BOOL)boostNearbyInfo;
- (BOOL)enhancedDiscovery;
- (BOOL)hasAdHocPairings;
- (BOOL)idsIsSignedIn;
- (BOOL)inDiscoverySession;
- (BOOL)isDeviceValidRIServer:(id)a3;
- (BOOL)isTempAuthTagKnown:(id)a3 bluetoothAddressData:(id)a4;
- (BOOL)isWifiCritical;
- (BOOL)preventNearbyActionAdvertising;
- (BOOL)screenOn;
- (CUBluetoothClient)btConnectedDeviceMonitor;
- (NSArray)adHocPairedDeviceIdentities;
- (NSData)bleAuthTag;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (RPIdentity)idSelfIdentity;
- (RPIdentity)temporarySelfIdentity;
- (SDNearbyAgent)init;
- (double)_activityMonitorLastUserEventDelta;
- (id)_bleUpdateUseCases:(id)a3;
- (id)_idsBluetoothDeviceIDsForAnnouncements;
- (id)_idsBluetoothDeviceIDsForHomePods;
- (id)_idsBluetoothDeviceIDsForLEPipe;
- (id)_idsBluetoothDeviceIDsForMe;
- (id)_idsBluetoothDeviceIDsForOneness;
- (id)_idsBluetoothDeviceIDsForSMSRelay;
- (id)_idsBluetoothDeviceIDsForSharing;
- (id)_idsBluetoothDeviceIDsForSharingLocked;
- (id)_idsBluetoothDeviceIDsForiMessage;
- (id)_idsDeviceArrayLocked;
- (id)_useCasesToHexString:(id)a3;
- (id)bleProximityEstimatorForActionType:(unsigned __int8)a3 device:(id)a4;
- (id)bleProximityInfo;
- (id)bleProximityInfoForActionType:(unsigned __int8)a3 device:(id)a4;
- (id)bleProximityInfoForType:(id)a3 device:(id)a4;
- (id)bleProximityInfoForType:(id)a3 device:(id)a4 allInfo:(id)a5;
- (id)bleProximityRSSIEstimatorInfo;
- (id)idsBluetoothDeviceIDsForLEPipe;
- (id)idsBluetoothDeviceIDsForRIServers;
- (id)idsBluetoothDeviceIDsForSharing;
- (id)idsBluetoothDeviceIDsForWatches;
- (id)idsDeviceArray;
- (id)idsDeviceForBluetoothDeviceID:(id)a3 conflictDetected:(BOOL *)a4;
- (id)idsDeviceIDsForFamily;
- (id)idsDeviceIDsForRIServers;
- (id)sharedNearbyPipe;
- (int)_allowEnhancedDiscovery;
- (int)_bleNearbyInfoReceivedFrameType:(unsigned __int8)a3 src:(const char *)a4 end:(const char *)a5 cnx:(id)a6;
- (int)_idsAppleTVCount;
- (int)_idsContinuityDeviceCount;
- (int)_idsHomePodCount;
- (int)_idsMacCount;
- (int)_idsShouldEncryptActivityLevel;
- (int)_idsVisionOS1Count;
- (int)_idsVisionOS2OrHigherCount;
- (int)_idsWatchCount;
- (int)_sendMessage:(id)a3 frameType:(unsigned __int8)a4 service:(id)a5 session:(id)a6;
- (int)_setupHandleCreateSession:(id)a3 data:(id)a4;
- (int)_setupHandleSessionCreated:(id)a3 data:(id)a4;
- (int)_setupHandleSessionEncryptedFrame:(id)a3 type:(unsigned __int8)a4 cnx:(id)a5;
- (int)_setupHandleSessionMessageType:(unsigned __int8)a3 src:(const char *)a4 end:(const char *)a5 cnx:(id)a6 session:(id)a7;
- (int)_setupSendCreateSession:(id)a3 cnx:(id)a4;
- (int)_setupSendData:(id)a3 sessionIdentifier:(id)a4 cnx:(id)a5 clientSession:(id)a6;
- (int)audioRoutingScore;
- (int)bleNearbyInfoSendFrameType:(unsigned __int8)a3 serviceType:(unsigned __int8)a4 data:(id)a5 peer:(id)a6 isSession:(BOOL)a7;
- (int)bleNearbyInfoStartConnectionToDevice:(id)a3 owner:(id)a4 connected:(BOOL *)a5;
- (int)serviceStart:(id)a3;
- (int)sessionStart:(id)a3;
- (int64_t)bleProximityRSSIThreshold:(id)a3;
- (int64_t)bleProximityRSSIThresholdForType:(int64_t)a3 device:(id)a4;
- (unsigned)_activityMonitorCurrentLevelAndNeedsPoll:(BOOL *)a3 recentUserActivity:(BOOL *)a4;
- (unsigned)_bleEncryptActivityLevel:(unsigned __int8)a3;
- (unsigned)_bleProximityUpdateDeviceCloseNearbyActionDevice:(id)a3;
- (unsigned)_bleProximityUpdateNearbyActionDevice:(id)a3;
- (unsigned)_bleProximityUpdateNearbyInfoDevice:(id)a3;
- (unsigned)_identificationDecryptActivityLevel:(unsigned __int8)a3 device:(id)a4 authTag:(id)a5 identity:(id)a6;
- (unsigned)hotspotInfo;
- (void)_activate;
- (void)_activityMonitorCarPlayStatusChanged:(id)a3;
- (void)_activityMonitorEnsureStarted;
- (void)_activityMonitorEnsureStopped;
- (void)_activityMonitorMediaAccessControlSettingChanged:(id)a3;
- (void)_activityMonitorMultipleUsersLoggedInChanged:(id)a3;
- (void)_activityMonitorScreenStateChanged:(id)a3;
- (void)_activityMonitorUILockStatusChanged:(id)a3;
- (void)_activityMonitorUpdate;
- (void)_activityMonitorUpdateUserActive:(BOOL)a3;
- (void)_activityMonitorWatchWristStateChanged:(id)a3;
- (void)_bleAdvertisingAddressChanged;
- (void)_bleNearbyActionAdvertiserEnsureStarted;
- (void)_bleNearbyActionAdvertiserEnsureStopped;
- (void)_bleNearbyActionScannerEnsureStarted;
- (void)_bleNearbyActionScannerEnsureStopped;
- (void)_bleNearbyInfoAdvertiserEnsureStarted;
- (void)_bleNearbyInfoAdvertiserEnsureStopped;
- (void)_bleNearbyInfoAdvertiserLingerStart:(id)a3;
- (void)_bleNearbyInfoAdvertiserUpdate;
- (void)_bleNearbyInfoAdvertiserUpdateAddAudioRoutingScore:(id)a3;
- (void)_bleNearbyInfoAdvertiserUpdateAddHotspotInfo:(id)a3;
- (void)_bleNearbyInfoAdvertiserUpdateAdvertiseReason:(id)a3;
- (void)_bleNearbyInfoAdvertisingUpdateAddCameraState:(id)a3;
- (void)_bleNearbyInfoReceivedData:(id)a3 cnx:(id)a4 peer:(id)a5;
- (void)_bleNearbyInfoScannerEnsureStarted;
- (void)_bleNearbyInfoScannerEnsureStopped;
- (void)_bleProximityPairingScannerEnsureStarted;
- (void)_bleProximityPairingScannerEnsureStopped;
- (void)_bleUpdateAuthTagIfNeeded;
- (void)_bleUpdateScanner:(id)a3 typeFlag:(unint64_t)a4;
- (void)_btPipeEnsureStarted;
- (void)_btPipeEnsureStopped;
- (void)_btPipeHandleFrameType:(unsigned __int8)a3 data:(id)a4;
- (void)_btPipeStateChanged:(id)a3;
- (void)_cameraStateChanged;
- (void)_cancelDonStateRetryTimers;
- (void)_checkBrightnessLuxValue;
- (void)_checkConditionsForEnhancedDiscovery;
- (void)_deliverDoffedEvent;
- (void)_deliverDonnedEventToDevice:(id)a3 allowRetry:(BOOL)a4;
- (void)_deliverDonnedEventsStart;
- (void)_deviceDiscoveryBLEDeviceChanged:(id)a3 type:(int64_t)a4 changes:(unsigned int)a5;
- (void)_deviceDiscoveryBLEDeviceFound:(id)a3 type:(int64_t)a4;
- (void)_deviceDiscoveryBLEDeviceLost:(id)a3 type:(int64_t)a4;
- (void)_deviceDiscoveryBLEScanStateChanged:(int64_t)a3 type:(int64_t)a4;
- (void)_deviceDiscoveryFastScanEvaluate:(id)a3 device:(id)a4;
- (void)_deviceDiscoveryFastScanStart:(id)a3 device:(id)a4 reason:(id)a5;
- (void)_deviceDiscoveryFastScanStop:(id)a3 reset:(BOOL)a4 reason:(id)a5;
- (void)_deviceDiscoveryRequestStart:(id)a3;
- (void)_disableEnhancedDiscovery:(id)a3;
- (void)_discoverySessionStateChange:(BOOL)a3;
- (void)_enableEnhancedDiscovery:(id)a3;
- (void)_enableEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4;
- (void)_enhancedDiscoveryScreenChange:(BOOL)a3;
- (void)_enhancedDiscoveryTimerFired;
- (void)_handleAirDropDiscoverableModeChanged:(id)a3;
- (void)_handleAppleIDChanged:(id)a3;
- (void)_handleBluetoothDeviceConnected:(id)a3;
- (void)_handleRetryTimerForDevice:(id)a3;
- (void)_identificationCheckFlagsAndACL;
- (void)_identificationDecryptAudioRoutingScoreData:(id)a3 device:(id)a4 authTag:(id)a5 identity:(id)a6;
- (void)_identificationDecryptHotspotData:(id)a3 device:(id)a4 authTag:(id)a5 identity:(id)a6;
- (void)_identificationEnsureStarted;
- (void)_identificationEnsureStopped;
- (void)_identificationGetIdentities;
- (void)_identificationHandleDeviceFound:(id)a3 flags:(unint64_t)a4;
- (void)_identificationHandleDeviceLost:(id)a3 flags:(unint64_t)a4;
- (void)_identificationHandleDiscoveryStop;
- (void)_identificationMaintenanceTimer;
- (void)_identificationReIdentify;
- (void)_identificationReIdentifySameAccountDevices:(id)a3 type:(int64_t)a4;
- (void)_idsEnsureStarted;
- (void)_idsEnsureStopped;
- (void)_idsMeDeviceChanged;
- (void)_invalidate;
- (void)_invalidateWatchDiscoveryIfNeeded;
- (void)_mirroringStateChanged:(id)a3;
- (void)_notifyCameraConfigChange;
- (void)_postNotificationForWombatState:(unsigned int)a3;
- (void)_registerForMagicMountUpdates;
- (void)_registerForWombatActivityNotification;
- (void)_sendUnlockData:(id)a3 toBLEDevice:(id)a4 direct:(BOOL)a5 completion:(id)a6;
- (void)_smartCoverStatusChanged:(id)a3;
- (void)_startUnlockBLEConnectionWithDevice:(id)a3 encrypted:(BOOL)a4;
- (void)_stopUnlockBLEConnectionWithDevice:(id)a3;
- (void)_systemHasPoweredOn;
- (void)_systemWillSleep;
- (void)_testPipePing;
- (void)_unlockApproveBluetoothIDsChanged:(id)a3;
- (void)_unlockDeviceFilterChangedForRequest:(id)a3;
- (void)_unlockReceivedFrameData:(id)a3 peer:(id)a4 device:(id)a5;
- (void)_unregisterForMagicMountUpdates;
- (void)_unregisterForWombatActivityNotification;
- (void)_update;
- (void)_updateCameraState;
- (void)_updateDonState;
- (void)_useLuxValue;
- (void)_wirelessCriticalChanged:(id)a3;
- (void)activate;
- (void)activityStateWithCompletion:(id)a3;
- (void)bleNearbyInfoStopConnectionToDevice:(id)a3 owner:(id)a4;
- (void)bleProximityEstimatorsResetDeviceClose;
- (void)coordinatedAlertRequestCancel:(id)a3;
- (void)coordinatedAlertRequestFinish:(id)a3;
- (void)coordinatedAlertRequestStart:(id)a3;
- (void)cutWiFiManagerLinkDidChange:(id)a3 context:(id)a4;
- (void)deviceDiscoveryFastScanCancel:(id)a3 reason:(id)a4;
- (void)deviceDiscoveryFastScanTrigger:(id)a3 reason:(id)a4;
- (void)deviceDiscoveryRequestStart:(id)a3;
- (void)deviceDiscoveryRequestStop:(id)a3;
- (void)deviceDiscoveryRequestUpdate:(id)a3;
- (void)deviceDiscoveryTriggerEnhancedDiscovery:(id)a3 reason:(id)a4;
- (void)deviceDiscoveryTriggerEnhancedDiscovery:(id)a3 reason:(id)a4 useCase:(unsigned int)a5;
- (void)diagnosticBLEModeStart:(id)a3;
- (void)diagnosticBLEModeStop:(id)a3;
- (void)diagnosticMockChanged:(id)a3;
- (void)diagnosticMockFound:(id)a3;
- (void)diagnosticMockLost:(id)a3;
- (void)idsAddCachedIDSIdentifier:(id)a3 device:(id)a4;
- (void)idsAddCachedIDSIdentifierToDevice:(id)a3;
- (void)idsDevicesAppendDescription:(id *)a3;
- (void)invalidate;
- (void)nearby:(id)a3 didConnectToPeer:(id)a4 transport:(int64_t)a5 error:(id)a6;
- (void)nearby:(id)a3 didDisconnectFromPeer:(id)a4 error:(id)a5;
- (void)nearby:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5;
- (void)nearbyDidUpdateState:(id)a3;
- (void)prefillDefaultsForGenuineCheckIfNecessary;
- (void)prefsChanged;
- (void)sendUnlockData:(id)a3 toBLEDevice:(id)a4 completion:(id)a5;
- (void)sendUnlockDataDirect:(id)a3 toBLEDevice:(id)a4 completion:(id)a5;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)serviceReceivedFrameType:(unsigned __int8)a3 serviceType:(unsigned __int8)a4 data:(id)a5 peer:(id)a6;
- (void)serviceSendEvent:(id)a3 service:(id)a4;
- (void)serviceSendRequest:(id)a3 service:(id)a4;
- (void)serviceSendResponse:(id)a3 service:(id)a4;
- (void)serviceStop:(id)a3;
- (void)sessionReceivedFrameType:(unsigned __int8)a3 serviceType:(unsigned __int8)a4 data:(id)a5 peer:(id)a6;
- (void)sessionSendEvent:(id)a3 session:(id)a4;
- (void)sessionSendRequest:(id)a3 session:(id)a4;
- (void)sessionSendResponse:(id)a3 session:(id)a4;
- (void)sessionStop:(id)a3;
- (void)setAudioRoutingScore:(int)a3;
- (void)setAutoUnlockActive:(BOOL)a3;
- (void)setBoostNearbyInfo:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEnhancedDiscovery:(BOOL)a3;
- (void)setHotspotInfo:(unsigned int)a3;
- (void)setPreventNearbyActionAdvertising:(BOOL)a3;
- (void)startUnlockBLEConnectionWithDevice:(id)a3 encrypted:(BOOL)a4;
- (void)stopUnlockBLEConnectionWithDevice:(id)a3;
- (void)testPipePing;
- (void)unlockStartTestClientWithDevice:(id)a3;
- (void)unlockStartTestServer;
- (void)unlockStopTestClient;
- (void)unlockStopTestServer;
- (void)unlockUpdateAdvertising:(unsigned int)a3 mask:(unsigned int)a4;
- (void)update;
@end

@implementation SDNearbyAgent

+ (SDNearbyAgent)sharedNearbyAgent
{
  if (qword_100980470 != -1) {
    dispatch_once(&qword_100980470, &stru_1008D0FB8);
  }
  v2 = (void *)gSFNearbyAgent;

  return (SDNearbyAgent *)v2;
}

- (id)sharedNearbyPipe
{
  v2 = self;
  objc_sync_enter(v2);
  int v3 = SFDeviceClassCodeGet();
  BOOL v5 = v3 == 1 || v3 == 7;
  v2->_btPipeForced = v5;
  if (v2->_activated)
  {
    [(SDNearbyAgent *)v2 _btPipeEnsureStarted];
    v6 = v2->_unlockBtPipe;
  }
  else
  {
    if (dword_100969808 <= 90 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v6 = 0;
  }
  objc_sync_exit(v2);

  return v6;
}

- (SDNearbyAgent)init
{
  v11.receiver = self;
  v11.super_class = (Class)SDNearbyAgent;
  v2 = [(SDNearbyAgent *)&v11 init];
  int v3 = v2;
  if (v2)
  {
    v2->_activityLevelNotifyToken = -1;
    v2->_allowEnhancedDiscovery = -1;
    v2->_caForce = -1;
    uint64_t v4 = SFMainQueue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v3->_familyNotifyToken = -1;
    v3->_idIdentitiesChangedNotifyToken = -1;
    v3->_idsAppleTVCountCache = -1;
    v3->_idsContinuityDeviceCountCache = -1;
    v3->_idsWatchCountCache = -1;
    v3->_homePodModelCodeOverride = -1;
    *(void *)&long long v6 = -1;
    *((void *)&v6 + 1) = -1;
    *(_OWORD *)&v3->_idsHasActiveWatchCache = v6;
    *(_OWORD *)&v3->_idsIsSignedInCache = v6;
    v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    enhancedDiscoveryUseCases = v3->_enhancedDiscoveryUseCases;
    v3->_enhancedDiscoveryUseCases = v7;

    v3->_wombatActivityToken = -1;
    [(SDNearbyAgent *)v3 prefillDefaultsForGenuineCheckIfNecessary];
    v9 = v3;
  }

  return v3;
}

- (NSString)description
{
  uint64_t v226 = 0;
  NSAppendPrintF();
  id v172 = 0;
  id v225 = v172;
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t activityLevel = self->_activityLevel;
  if (activityLevel > 0xE) {
    uint64_t v4 = "?";
  }
  else {
    uint64_t v4 = off_1008D1CA0[(char)activityLevel];
  }
  double startTime = self->_startTime;
  if (self->_activityTimer) {
    long long v6 = "on";
  }
  else {
    long long v6 = "off";
  }
  [(SDNearbyAgent *)self _activityMonitorLastUserEventDelta];
  uint64_t v8 = v7;
  if (self->_bleNearbyInfoAdvertiseLingerTimer) {
    v9 = "on";
  }
  else {
    v9 = "off";
  }
  p_statusMonitor = &self->_statusMonitor;
  if ([(SDStatusMonitor *)self->_statusMonitor screenOn]) {
    objc_super v11 = "on";
  }
  else {
    objc_super v11 = "off";
  }
  if ([(SDStatusMonitor *)*p_statusMonitor deviceUIUnlocked]) {
    v12 = "unlocked";
  }
  else {
    v12 = "locked";
  }
  if ([(SDStatusMonitor *)*p_statusMonitor smartCoverIsClosed]) {
    v13 = "closed";
  }
  else {
    v13 = "not closed";
  }
  if ([(SDStatusMonitor *)*p_statusMonitor multipleUsersLoggedIn]) {
    v14 = "yes";
  }
  else {
    v14 = "no";
  }
  id v15 = (id)[(SDStatusMonitor *)*p_statusMonitor systemUIFlags];
  int64_t v16 = [(SDStatusMonitor *)*p_statusMonitor pairedWatchWristState];
  uint64_t audioRoutingScore = self->_audioRoutingScore;
  if (audioRoutingScore > 0xF) {
    v18 = "?";
  }
  else {
    v18 = off_1008D1468[audioRoutingScore];
  }
  unint64_t familyFlags = self->_familyFlags;
  v170 = v18;
  id v167 = v15;
  int64_t v168 = v16;
  v165 = v6;
  uint64_t v152 = activityLevel;
  NSAppendPrintF();
  id v19 = v225;

  id v21 = objc_alloc_init((Class)CUAppleIDClient);
  id v22 = [v21 copyMyAppleIDAndReturnError:0, (unint64_t)(Current - startTime), v152, v4, v165, v8, v9, v11, v12, v13, v14, v167, v168, familyFlags, v170];
  id v224 = v19;
  NSAppendPrintF();
  id v23 = v19;

  id v223 = v23;
  unsigned int v24 = [v21 securityLevel:v22];
  v25 = "?";
  if (v24 <= 5) {
    v25 = off_1008D1438[v24];
  }
  v140 = v25;
  NSAppendPrintF();
  id v26 = v223;

  uint64_t v232 = 0;
  v233 = &v232;
  uint64_t v234 = 0x2050000000;
  v28 = (void *)qword_100980480;
  uint64_t v235 = qword_100980480;
  if (!qword_100980480)
  {
    v227 = _NSConcreteStackBlock;
    uint64_t v228 = 3221225472;
    uint64_t v229 = (uint64_t)sub_10022E1A4;
    v230 = &unk_1008CA038;
    v231 = &v232;
    sub_10022E1A4((uint64_t)&v227);
    v28 = (void *)v233[3];
  }
  id v29 = v28;
  _Block_object_dispose(&v232, 8);
  v30 = [v29 defaultStore:v140];
  v31 = [v30 activeAccount];

  v32 = [v31 altDSID];
  if (!v32)
  {
    id v222 = v26;
    uint64_t v40 = [v31 accountName];
LABEL_37:
    v38 = (void *)v40;
    v39 = "Unknown";
    goto LABEL_38;
  }
  uint64_t v232 = 0;
  v233 = &v232;
  uint64_t v234 = 0x2050000000;
  v33 = (void *)qword_100980490;
  uint64_t v235 = qword_100980490;
  if (!qword_100980490)
  {
    v227 = _NSConcreteStackBlock;
    uint64_t v228 = 3221225472;
    uint64_t v229 = (uint64_t)sub_10022E344;
    v230 = &unk_1008CA038;
    v231 = &v232;
    sub_10022E344((uint64_t)&v227);
    v33 = (void *)v233[3];
  }
  id v34 = v33;
  _Block_object_dispose(&v232, 8);
  v35 = [v34 sharedInstance];
  v36 = [v35 authKitAccountWithAltDSID:v32];
  if (!v36)
  {

    id v222 = v26;
    uint64_t v40 = [v31 accountName];
    goto LABEL_37;
  }
  unsigned int v37 = [v35 securityLevelForAccount:v36];

  id v222 = v26;
  v38 = [v31 accountName];
  v39 = "Unknown";
  switch(v37)
  {
    case 0u:
      break;
    case 1u:
      v39 = "PWOnly";
      break;
    case 2u:
      v39 = "SA";
      break;
    case 3u:
      v39 = "HSA1";
      break;
    case 4u:
      v39 = "HSA2";
      break;
    case 5u:
      v39 = "Managed";
      break;
    default:
      v39 = "?";
      break;
  }
LABEL_38:
  v153 = v39;
  NSAppendPrintF();
  id v41 = v222;

  id v221 = v41;
  v42 = [(CUSystemMonitor *)self->_systemMonitor meDeviceFMFDeviceID];
  v43 = [(CUSystemMonitor *)self->_systemMonitor meDeviceIDSDeviceID];
  [(CUSystemMonitor *)self->_systemMonitor meDeviceName];
  v161 = v154 = v43;
  v141 = v42;
  NSAppendPrintF();
  id v44 = v41;

  id v220 = v44;
  NSAppendPrintF();
  id v45 = v44;

  v46 = self;
  if (self->_autoUnlockActive)
  {
    id v219 = v45;
    NSAppendPrintF();
    id v47 = v45;

    id v45 = v47;
    v46 = self;
  }
  if (v46->_boostNearbyInfo)
  {
    id v218 = v45;
    NSAppendPrintF();
    id v48 = v45;

    id v45 = v48;
    v46 = self;
  }
  if ([(NSMutableDictionary *)v46->_bleConnections count])
  {
    id v217 = v45;
    id v142 = [(NSMutableDictionary *)self->_bleConnections count];
    NSAppendPrintF();
    id v49 = v45;

    id v45 = v49;
  }
  if ([(NSMutableSet *)self->_bleDiagnosticModeClients count])
  {
    id v216 = v45;
    v143 = (const char *)[(NSMutableSet *)self->_bleDiagnosticModeClients count];
    NSAppendPrintF();
    id v50 = v45;

    id v45 = v50;
  }
  v51 = self;
  bleNearbyActionAdvertiser = self->_bleNearbyActionAdvertiser;
  if (bleNearbyActionAdvertiser)
  {
    id v215 = v45;
    v53 = "on";
    if (!self->_bleNearbyActionAdvertiseLingerTimer) {
      v53 = "off";
    }
    v143 = (const char *)bleNearbyActionAdvertiser;
    bleNearbyInfoAdvertiseReason = (void *)v53;
    NSAppendPrintF();
    id v54 = v215;

    id v45 = v54;
    v51 = self;
  }
  bleNearbyActionScanner = v51->_bleNearbyActionScanner;
  if (bleNearbyActionScanner)
  {
    id v214 = v45;
    v143 = (const char *)bleNearbyActionScanner;
    NSAppendPrintF();
    id v56 = v45;

    id v45 = v56;
    v51 = self;
  }
  bleNearbyInfoAdvertiser = v51->_bleNearbyInfoAdvertiser;
  if (bleNearbyInfoAdvertiser)
  {
    id v213 = v45;
    v143 = (const char *)bleNearbyInfoAdvertiser;
    bleNearbyInfoAdvertiseReason = v51->_bleNearbyInfoAdvertiseReason;
    NSAppendPrintF();
    id v58 = v45;

    id v45 = v58;
    v51 = self;
  }
  bleNearbyInfoScanner = v51->_bleNearbyInfoScanner;
  if (bleNearbyInfoScanner)
  {
    id v212 = v45;
    v143 = (const char *)bleNearbyInfoScanner;
    NSAppendPrintF();
    id v60 = v45;

    id v45 = v60;
    v51 = self;
  }
  bleProximityPairingScanner = v51->_bleProximityPairingScanner;
  if (bleProximityPairingScanner)
  {
    id v211 = v45;
    v143 = (const char *)bleProximityPairingScanner;
    NSAppendPrintF();
    id v62 = v45;

    id v45 = v62;
    v51 = self;
  }
  if (v51->_enhancedDiscovery)
  {
    id v210 = v45;
    v143 = "yes";
    NSAppendPrintF();
    id v63 = v45;

    id v45 = v63;
    v51 = self;
  }
  id v209 = v45;
  [(SDNearbyAgent *)v51 _allowEnhancedDiscovery];
  NSAppendPrintF();
  id v64 = v45;

  id v208 = v64;
  v65 = "Usable";
  if (self->_cameraState != 1) {
    v65 = "?";
  }
  if (self->_cameraState) {
    v66 = v65;
  }
  else {
    v66 = "Nearby";
  }
  if (self->_isDeviceMounted) {
    v67 = "yes";
  }
  else {
    v67 = "no";
  }
  if (self->_isDeviceNotInPocket) {
    v68 = "yes";
  }
  else {
    v68 = "no";
  }
  v156 = v67;
  v162 = v68;
  v144 = (void *)v66;
  NSAppendPrintF();
  id v69 = v208;

  v70 = self;
  unlockBtPipe = self->_unlockBtPipe;
  if (unlockBtPipe)
  {
    v207[18] = v69;
    v144 = unlockBtPipe;
    NSAppendPrintF();
    id v72 = v69;

    id v69 = v72;
    v70 = self;
  }
  v207[17] = v69;
  id v145 = [(NSMutableSet *)v70->_ddRequests count];
  NSAppendPrintF();
  id v73 = v69;

  v74 = self;
  if (self->_coreDeviceEnabled)
  {
    v207[16] = v73;
    NSAppendPrintF();
    id v75 = v73;

    id v73 = v75;
    v74 = self;
  }
  if (v74->_ddNearbyActionEnabled)
  {
    v207[15] = v73;
    NSAppendPrintF();
    id v76 = v73;

    id v73 = v76;
    v74 = self;
  }
  if (v74->_ddNearbyActionScreenOff)
  {
    v207[14] = v73;
    NSAppendPrintF();
    id v77 = v73;

    id v73 = v77;
    v74 = self;
  }
  if (v74->_ddNearbyInfoEnabled)
  {
    v207[13] = v73;
    NSAppendPrintF();
    id v78 = v73;

    id v73 = v78;
    v74 = self;
  }
  if (v74->_ddNearbyInfoScreenOff)
  {
    v207[12] = v73;
    NSAppendPrintF();
    id v79 = v73;

    id v73 = v79;
    v74 = self;
  }
  if (v74->_ddProximityPairingEnabled)
  {
    v207[11] = v73;
    NSAppendPrintF();
    id v80 = v73;

    id v73 = v80;
    v74 = self;
  }
  if (v74->_ddProximityPairingScreenOff)
  {
    v207[10] = v73;
    NSAppendPrintF();
    id v81 = v73;

    id v73 = v81;
    v74 = self;
  }
  if (v74->_fitnessPairingEnabled)
  {
    v207[9] = v73;
    NSAppendPrintF();
    id v82 = v73;

    id v73 = v82;
    v74 = self;
  }
  if (v74->_sessionPairingEnabled)
  {
    v207[8] = v73;
    NSAppendPrintF();
    id v83 = v73;

    id v73 = v83;
    v74 = self;
  }
  v207[7] = v73;
  id v146 = [(NSMutableDictionary *)v74->_ddNearbyActionDevices count];
  NSAppendPrintF();
  id v84 = v73;

  v207[6] = v84;
  id v147 = [(NSMutableDictionary *)self->_ddNearbyInfoDevices count];
  NSAppendPrintF();
  id v85 = v84;

  v207[5] = v85;
  id v148 = [(NSMutableDictionary *)self->_ddProximityPairingDevices count];
  NSAppendPrintF();
  id v86 = v85;

  v227 = 0;
  uint64_t v228 = (uint64_t)&v227;
  uint64_t v229 = 0x2020000000;
  LODWORD(v230) = 0;
  idDevices = self->_idDevices;
  v207[0] = _NSConcreteStackBlock;
  v207[1] = 3221225472;
  v207[2] = sub_10020A3DC;
  v207[3] = &unk_1008D0FE0;
  v207[4] = &v227;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](idDevices, "enumerateKeysAndObjectsUsingBlock:", v207, v148);
  id v206 = v86;
  uint64_t v88 = *(unsigned int *)(v228 + 24);
  id v157 = [(NSMutableDictionary *)self->_idDevices count];
  NSAppendPrintF();
  id v89 = v86;

  id v205 = v89;
  NSAppendPrintF();
  id v90 = v89;

  id v91 = objc_alloc((Class)IDSService);
  id v173 = [v91 initWithService:IDSServiceNameiMessage v88 v157];
  id v204 = v90;
  v92 = "on";
  if (!self->_idsService) {
    v92 = "off";
  }
  v171 = v92;
  if ([(SDNearbyAgent *)self idsIsSignedIn]) {
    v93 = "signed in";
  }
  else {
    v93 = "not signed in";
  }
  v94 = [(SDNearbyAgent *)self idsDeviceArray];
  id v95 = [v94 count];
  uint64_t v96 = [(SDNearbyAgent *)self _idsAppleTVCount];
  uint64_t v97 = [(SDNearbyAgent *)self _idsContinuityDeviceCount];
  uint64_t v98 = [(SDNearbyAgent *)self _idsHomePodCount];
  if (v173) {
    v99 = "on";
  }
  else {
    v99 = "off";
  }
  v100 = [v173 devices];
  id v101 = [v100 count];
  uint64_t v166 = [(SDNearbyAgent *)self _idsShouldEncryptActivityLevel];
  id v163 = v95;
  NSAppendPrintF();
  id v102 = v204;

  id v203 = v102;
  v103 = (SFSystemService *)[(NSMutableDictionary *)self->_services count];
  id v158 = [(NSMutableDictionary *)self->_sessions count];
  id v164 = [(NSMutableDictionary *)self->_setupSessions count];
  v149 = v103;
  NSAppendPrintF();
  id v104 = v102;

  systemService = self->_systemService;
  if (systemService)
  {
    id v202 = v104;
    v149 = systemService;
    NSAppendPrintF();
    id v106 = v104;

    id v104 = v106;
  }
  id v201 = v104;
  NSAppendPrintF();
  id v107 = v104;

  long long v199 = 0u;
  long long v200 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  v108 = (void *)CFPrefs_CopyKeys();
  id v109 = [v108 countByEnumeratingWithState:&v197 objects:v239 count:16 v149, v158, v164];
  if (!v109) {
    goto LABEL_112;
  }
  int v110 = 0;
  uint64_t v111 = *(void *)v198;
  do
  {
    for (i = 0; i != v109; i = (char *)i + 1)
    {
      if (*(void *)v198 != v111) {
        objc_enumerationMutation(v108);
      }
      uint64_t v113 = *(void *)(*((void *)&v197 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v196 = v107;
        uint64_t v150 = v113;
        v159 = (void *)CFPrefs_CopyTypedValue();
        NSAppendPrintF();
        id v114 = v107;

        ++v110;
        id v107 = v114;
      }
    }
    id v109 = [v108 countByEnumeratingWithState:&v197 objects:v239 count:16];
  }
  while (v109);

  if (v110 >= 1)
  {
    id v195 = v107;
    NSAppendPrintF();
    v108 = v107;
    id v107 = v107;
LABEL_112:
  }
  if ([(NSMutableDictionary *)self->_bleConnections count])
  {
    id v194 = v107;
    NSAppendPrintF();
    id v115 = v107;

    long long v192 = 0u;
    long long v193 = 0u;
    long long v190 = 0u;
    long long v191 = 0u;
    v116 = self->_bleConnections;
    id v117 = [(NSMutableDictionary *)v116 countByEnumeratingWithState:&v190 objects:v238 count:16];
    if (v117)
    {
      uint64_t v118 = *(void *)v191;
      do
      {
        v119 = 0;
        v120 = v115;
        do
        {
          if (*(void *)v191 != v118) {
            objc_enumerationMutation(v116);
          }
          uint64_t v121 = *(void *)(*((void *)&v190 + 1) + 8 * (void)v119);
          v189 = v120;
          v151 = -[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:", v121, v151);
          NSAppendPrintF();
          id v115 = v120;

          v119 = (char *)v119 + 1;
          v120 = v115;
        }
        while (v117 != v119);
        id v117 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v116, "countByEnumeratingWithState:objects:count:", &v190, v238, 16, v151);
      }
      while (v117);
    }

    id v188 = v115;
    NSAppendPrintF();
    id v107 = v115;
  }
  if ([(NSMutableDictionary *)self->_setupSessions count])
  {
    id v187 = v107;
    NSAppendPrintF();
    id v122 = v107;

    long long v185 = 0u;
    long long v186 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    v123 = self->_setupSessions;
    id v124 = [(NSMutableDictionary *)v123 countByEnumeratingWithState:&v183 objects:v237 count:16];
    if (v124)
    {
      uint64_t v125 = *(void *)v184;
      do
      {
        v126 = 0;
        v127 = v122;
        do
        {
          if (*(void *)v184 != v125) {
            objc_enumerationMutation(v123);
          }
          v128 = *(void **)(*((void *)&v183 + 1) + 8 * (void)v126);
          v182 = v127;
          -[NSMutableDictionary objectForKeyedSubscript:](self->_setupSessions, "objectForKeyedSubscript:", v128, v151, v160);
          v160 = v151 = v128;
          NSAppendPrintF();
          id v122 = v127;

          v126 = (char *)v126 + 1;
          v127 = v122;
        }
        while (v124 != v126);
        id v124 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v123, "countByEnumeratingWithState:objects:count:", &v183, v237, 16, v151, v160);
      }
      while (v124);
    }

    id v181 = v122;
    NSAppendPrintF();
    id v107 = v122;
  }
  if ([(NSMutableDictionary *)self->_sessions count])
  {
    id v180 = v107;
    NSAppendPrintF();
    id v129 = v107;

    long long v178 = 0u;
    long long v179 = 0u;
    long long v176 = 0u;
    long long v177 = 0u;
    v130 = self->_sessions;
    id v131 = [(NSMutableDictionary *)v130 countByEnumeratingWithState:&v176 objects:v236 count:16];
    if (v131)
    {
      uint64_t v132 = *(void *)v177;
      do
      {
        v133 = 0;
        v134 = v129;
        do
        {
          if (*(void *)v177 != v132) {
            objc_enumerationMutation(v130);
          }
          v135 = *(void **)(*((void *)&v176 + 1) + 8 * (void)v133);
          v175[3] = v134;
          -[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v135, v151, v160);
          v160 = v151 = v135;
          NSAppendPrintF();
          id v129 = v134;

          v133 = (char *)v133 + 1;
          v134 = v129;
        }
        while (v131 != v133);
        id v131 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v130, "countByEnumeratingWithState:objects:count:", &v176, v236, 16, v151, v160);
      }
      while (v131);
    }

    v175[2] = v129;
    NSAppendPrintF();
    id v107 = v129;
  }
  v175[1] = v107;
  NSAppendPrintF();
  id v136 = v107;

  v175[0] = v136;
  [(SDNearbyAgent *)self idsDevicesAppendDescription:v175];
  id v137 = v175[0];

  id v138 = v137;
  _Block_object_dispose(&v227, 8);

  return (NSString *)v138;
}

- (void)prefillDefaultsForGenuineCheckIfNecessary
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.Sharing"];
  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    unsigned int v3 = [v2 BOOLForKey:@"hasDoneGenuineDeviceCheck"];
    CFStringRef v4 = @"NO";
    if (v3) {
      CFStringRef v4 = @"YES";
    }
    CFStringRef v19 = v4;
    LogPrintF();
  }
  BOOL v5 = [v2 objectForKey:@"hasDoneGenuineDeviceCheck" v19];

  if (!v5)
  {
    id v27 = 0;
    long long v6 = +[CBDiscovery devicesWithDiscoveryFlags:0x800000 error:&v27];
    id v7 = v27;
    uint64_t v8 = v7;
    if (!v7 || v6)
    {
      id v21 = v7;
      id v22 = v6;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v9 = v6;
      id v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v24;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v24 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            if (objc_msgSend(v14, "deviceFlags", v20))
            {
              if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
              {
                v20 = v14;
                LogPrintF();
              }
              id v15 = [v14 btAddressData:v20];
              if (v15)
              {
                int64_t v16 = CUPrintNSDataAddress();
                v17 = [v16 uppercaseString];

                v18 = [v2 objectForKey:v17];

                if (!v18)
                {
                  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
                  {
                    LogPrintF();
                    [v2 setObject:&off_100905B68 forKey:v17];
                  }
                  else
                  {
                    [v2 setObject:&off_100905B68 forKey:v17];
                  }
                }
              }
            }
            else if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
            {
              v20 = v14;
              LogPrintF();
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v11);
      }

      [v2 setBool:1 forKey:@"hasDoneGenuineDeviceCheck"];
      [v2 synchronize];
      uint64_t v8 = v21;
      long long v6 = v22;
      if (dword_100969808 > 30 || dword_100969808 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_46;
      }
      [v2 BOOLForKey:@"hasDoneGenuineDeviceCheck" v20];
    }
    else if (dword_100969808 > 90 || dword_100969808 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_46;
    }
    LogPrintF();
LABEL_46:
  }
}

- (void)setAudioRoutingScore:(int)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10020A8CC;
  v4[3] = &unk_1008D1008;
  int v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

- (void)setAutoUnlockActive:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10020AA58;
  v4[3] = &unk_1008CB9D8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

- (void)setBoostNearbyInfo:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10020ABC0;
  v4[3] = &unk_1008CB9D8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

- (void)setEnhancedDiscovery:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10020AD28;
  v4[3] = &unk_1008CB9D8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

- (void)setHotspotInfo:(unsigned int)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10020AF2C;
  v4[3] = &unk_1008D1008;
  unsigned int v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10020B080;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_activated = 1;
  self->_double startTime = CFAbsoluteTimeGetCurrent();
  if (!self->_bleWPNearby)
  {
    unsigned int v3 = +[SFBLEClient sharedClient];
    CFStringRef v4 = [v3 addNearbyDelegate:self];
    bleWPNearby = self->_bleWPNearby;
    self->_bleWPNearby = v4;
  }
  if (!self->_btConnectedDeviceMonitor)
  {
    long long v6 = (CUBluetoothClient *)objc_alloc_init((Class)CUBluetoothClient);
    btConnectedDeviceMonitor = self->_btConnectedDeviceMonitor;
    self->_btConnectedDeviceMonitor = v6;

    [(CUBluetoothClient *)self->_btConnectedDeviceMonitor setDispatchQueue:self->_dispatchQueue];
    [(CUBluetoothClient *)self->_btConnectedDeviceMonitor setFlags:24];
    [(CUBluetoothClient *)self->_btConnectedDeviceMonitor setLabel:@"Sharing-CA"];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10020B8C4;
    v35[3] = &unk_1008D1030;
    v35[4] = self;
    [(CUBluetoothClient *)self->_btConnectedDeviceMonitor setDeviceConnectedHandler:v35];
    [(CUBluetoothClient *)self->_btConnectedDeviceMonitor activate];
  }
  if (self->_familyNotifyToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10020B8D0;
    handler[3] = &unk_1008CACA8;
    handler[4] = self;
    notify_register_dispatch("com.apple.rapport.familyFlagsChanged", &self->_familyNotifyToken, dispatchQueue, handler);
    int familyNotifyToken = self->_familyNotifyToken;
    uint64_t state64 = 0;
    notify_get_state(familyNotifyToken, &state64);
    self->_unint64_t familyFlags = state64;
  }
  if (!self->_statusMonitor)
  {
    id v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:self selector:"_handleAirDropDiscoverableModeChanged:" name:@"com.apple.sharingd.DiscoverableModeChanged" object:0];
    [v10 addObserver:self selector:"_handleAppleIDChanged:" name:@"com.apple.sharingd.AppleIDAccountInfoChanged" object:0];
    [v10 addObserver:self selector:"_handleAppleIDChanged:" name:@"com.apple.sharingd.AppleIDChanged" object:0];
    [v10 addObserver:self selector:"_activityMonitorMediaAccessControlSettingChanged:" name:@"com.apple.sharingd.MediaAccessControlSettingChanged" object:0];
    [v10 addObserver:self selector:"_activityMonitorWatchWristStateChanged:" name:@"com.apple.sharingd.PairedWatchWristStateChanged" object:0];
    [v10 addObserver:self selector:"_activityMonitorScreenStateChanged:" name:@"com.apple.sharingd.ScreenStateChanged" object:0];
    [v10 addObserver:self selector:"_activityMonitorUILockStatusChanged:" name:@"com.apple.sharingd.UILockStatusChanged" object:0];
    [v10 addObserver:self selector:"_unlockApproveBluetoothIDsChanged:" name:@"ApproveBluetoothIDsChanged" object:0];
    [v10 addObserver:self selector:"_systemWillSleep" name:@"com.apple.sharingd.SystemWillSleep" object:0];
    [v10 addObserver:self selector:"_systemHasPoweredOn" name:@"com.apple.sharingd.SystemHasPoweredOn" object:0];
    [v10 addObserver:self selector:"_btPipeStateChanged:" name:SFNotificationNamePipeConnectionStateChanged object:0];
    [v10 addObserver:self selector:"_smartCoverStatusChanged:" name:@"com.apple.sharingd.SmartCoverClosedChanged" object:0];
    [v10 addObserver:self selector:"_wirelessCriticalChanged:" name:@"com.apple.sharingd.WirelessCriticalChanged" object:0];
    [v10 addObserver:self selector:"_mirroringStateChanged:" name:@"com.apple.sharingd.MirroringStateChanged" object:0];
    id v11 = +[SDStatusMonitor sharedMonitor];
    statusMonitor = self->_statusMonitor;
    self->_statusMonitor = v11;

    self->_activityScreenOn = [(SDStatusMonitor *)self->_statusMonitor screenOn];
    self->_activityUIUnlocked = [(SDStatusMonitor *)self->_statusMonitor deviceUIUnlocked];
  }
  if (!self->_systemMonitor)
  {
    v13 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v13;

    [(CUSystemMonitor *)self->_systemMonitor setDispatchQueue:self->_dispatchQueue];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10020B97C;
    v33[3] = &unk_1008CA4B8;
    v33[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setBluetoothAddressChangedHandler:v33];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10020BA00;
    v32[3] = &unk_1008CA4B8;
    v32[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setCallChangedHandler:v32];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10020BA84;
    v31[3] = &unk_1008CA4B8;
    v31[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setFirstUnlockHandler:v31];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10020BB08;
    v30[3] = &unk_1008CA4B8;
    v30[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setManateeChangedHandler:v30];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10020BB84;
    v29[3] = &unk_1008CA4B8;
    v29[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setMeDeviceChangedHandler:v29];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10020BC08;
    v28[3] = &unk_1008CA4B8;
    v28[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setPrimaryAppleIDChangedHandler:v28];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10020BC98;
    v27[3] = &unk_1008CA4B8;
    v27[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setScreenOnChangedHandler:v27];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10020BD38;
    v26[3] = &unk_1008CA4B8;
    v26[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setScreenSaverChangedHandler:v26];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10020BDBC;
    v25[3] = &unk_1008CA4B8;
    v25[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setSystemLockStateChangedHandler:v25];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10020BDC4;
    v24[3] = &unk_1008CA4B8;
    v24[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setWifiStateChangedHandler:v24];
    id v15 = self->_systemMonitor;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10020BE48;
    v23[3] = &unk_1008CA4B8;
    v23[4] = self;
    [(CUSystemMonitor *)v15 activateWithCompletion:v23];
  }
  [(SDNearbyAgent *)self _idsEnsureStarted];
  [(SDNearbyAgent *)self prefsChanged];
  if (!self->_wifiManager)
  {
    int64_t v16 = +[CUTWiFiManager sharedInstance];
    wifiManager = self->_wifiManager;
    self->_wifiManager = v16;

    [(CUTWiFiManager *)self->_wifiManager addDelegate:self];
  }
  int DeviceClass = GestaltGetDeviceClass();
  if ((DeviceClass == 7 || DeviceClass == 4) && !self->_systemService)
  {
    CFStringRef v19 = (SFSystemService *)objc_alloc_init((Class)SFSystemService);
    systemService = self->_systemService;
    self->_systemService = v19;

    [(SFSystemService *)self->_systemService setDispatchQueue:self->_dispatchQueue];
    [(SFSystemService *)self->_systemService activate];
  }
  [(SDNearbyAgent *)self _registerForMagicMountUpdates];
  id v21 = objc_alloc_init(_TtC16DaemoniOSLibrary32HeadphoneDigitalEngravingManager);
  digitalEngravingManager = self->_digitalEngravingManager;
  self->_digitalEngravingManager = v21;

  [(HeadphoneDigitalEngravingManager *)self->_digitalEngravingManager setFetchEngravingDataHandler:&stru_1008D1070];
  [(SDNearbyAgent *)self _registerForWombatActivityNotification];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10020C0D0;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(CUSystemMonitor *)self->_systemMonitor invalidate];
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = 0;

  if (self->_statusMonitor)
  {
    CFStringRef v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self name:@"com.apple.sharingd.AppleIDAccountInfoChanged" object:0];
    [v4 removeObserver:self name:@"com.apple.sharingd.AppleIDChanged" object:0];
    [v4 removeObserver:self name:@"com.apple.sharingd.MediaAccessControlSettingChanged" object:0];
    [v4 removeObserver:self name:@"com.apple.sharingd.PairedWatchWristStateChanged" object:0];
    [v4 removeObserver:self name:@"com.apple.sharingd.ScreenStateChanged" object:0];
    [v4 removeObserver:self name:@"com.apple.sharingd.UILockStatusChanged" object:0];
    [v4 removeObserver:self name:@"ApproveBluetoothIDsChanged" object:0];
    [v4 removeObserver:self name:@"com.apple.sharingd.SystemWillSleep" object:0];
    [v4 removeObserver:self name:@"com.apple.sharingd.SystemHasPoweredOn" object:0];
    [v4 removeObserver:self name:SFNotificationNamePipeConnectionStateChanged object:0];
    [v4 removeObserver:self name:@"com.apple.sharingd.SmartCoverClosedChanged" object:0];
    [v4 removeObserver:self name:@"com.apple.sharingd.WirelessCriticalChanged" object:0];
    statusMonitor = self->_statusMonitor;
    self->_statusMonitor = 0;
  }
  [(CUBluetoothClient *)self->_btConnectedDeviceMonitor invalidate];
  btConnectedDeviceMonitor = self->_btConnectedDeviceMonitor;
  self->_btConnectedDeviceMonitor = 0;

  [(SDNearbyAgent *)self _activityMonitorEnsureStopped];
  [(SDNearbyAgent *)self _identificationEnsureStopped];
  [(SDNearbyAgent *)self _bleNearbyActionAdvertiserEnsureStopped];
  [(SDNearbyAgent *)self _bleNearbyActionScannerEnsureStopped];
  [(SDNearbyAgent *)self _bleNearbyInfoAdvertiserEnsureStopped];
  [(SDNearbyAgent *)self _bleNearbyInfoScannerEnsureStopped];
  [(SDNearbyAgent *)self _bleProximityPairingScannerEnsureStopped];
  cameraMagicMountManager = self->_cameraMagicMountManager;
  if (cameraMagicMountManager)
  {
    [(CMMagicMountManager *)cameraMagicMountManager stopMagicMountUpdates];
    uint64_t v8 = self->_cameraMagicMountManager;
    self->_cameraMagicMountManager = 0;
  }
  brightnessSystemClient = self->_brightnessSystemClient;
  self->_brightnessSystemClient = 0;

  cameraConfigChangeTimer = self->_cameraConfigChangeTimer;
  if (cameraConfigChangeTimer)
  {
    id v11 = cameraConfigChangeTimer;
    dispatch_source_cancel(v11);
    uint64_t v12 = self->_cameraConfigChangeTimer;
    self->_cameraConfigChangeTimer = 0;
  }
  v13 = self;
  objc_sync_enter(v13);
  [(SDNearbyAgent *)v13 _btPipeEnsureStopped];
  objc_sync_exit(v13);

  int familyNotifyToken = v13->_familyNotifyToken;
  if (familyNotifyToken != -1)
  {
    notify_cancel(familyNotifyToken);
    v13->_int familyNotifyToken = -1;
  }
  [(SDNearbyAgent *)v13 _idsEnsureStopped];
  [(SDNearbyAgent *)v13 _unregisterForWombatActivityNotification];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v15 = v13->_bleConnections;
  id v16 = [(NSMutableDictionary *)v15 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v43;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v43 != v17) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v42 + 1) + 8 * i) invalidate:v42];
      }
      id v16 = [(NSMutableDictionary *)v15 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v16);
  }

  [(NSMutableDictionary *)v13->_bleConnections removeAllObjects];
  bleConnections = v13->_bleConnections;
  v13->_bleConnections = 0;

  [(NSMutableSet *)v13->_bleDiagnosticModeClients removeAllObjects];
  bleDiagnosticModeClients = v13->_bleDiagnosticModeClients;
  v13->_bleDiagnosticModeClients = 0;

  id v21 = +[SFBLEClient sharedClient];
  [v21 removeNearbyDelegate:v13];

  bleWPNearby = v13->_bleWPNearby;
  v13->_bleWPNearby = 0;

  [(NSMutableSet *)v13->_caRequests removeAllObjects];
  caRequests = v13->_caRequests;
  v13->_caRequests = 0;

  [(NSMutableSet *)v13->_ddRequests removeAllObjects];
  [(NSMutableSet *)v13->_caRequestsNoScans removeAllObjects];
  caRequestsNoScans = v13->_caRequestsNoScans;
  v13->_caRequestsNoScans = 0;

  ddRequests = v13->_ddRequests;
  v13->_ddRequests = 0;

  ddFastScanTimer = v13->_ddFastScanTimer;
  if (ddFastScanTimer)
  {
    id v27 = ddFastScanTimer;
    dispatch_source_cancel(v27);
    v28 = v13->_ddFastScanTimer;
    v13->_ddFastScanTimer = 0;
  }
  [(NSMutableDictionary *)v13->_ddNearbyActionDevices removeAllObjects];
  ddNearbyActionDevices = v13->_ddNearbyActionDevices;
  v13->_ddNearbyActionDevices = 0;

  [(NSMutableDictionary *)v13->_ddNearbyInfoDevices removeAllObjects];
  ddNearbyInfoDevices = v13->_ddNearbyInfoDevices;
  v13->_ddNearbyInfoDevices = 0;

  [(NSMutableDictionary *)v13->_ddProximityPairingDevices removeAllObjects];
  ddProximityPairingDevices = v13->_ddProximityPairingDevices;
  v13->_ddProximityPairingDevices = 0;

  [(NSMutableSet *)v13->_deliveredDonnedIdentifiers removeAllObjects];
  deliveredDonnedIdentifiers = v13->_deliveredDonnedIdentifiers;
  v13->_deliveredDonnedIdentifiers = 0;

  [(NSMutableDictionary *)v13->_donnedDevices removeAllObjects];
  donnedDevices = v13->_donnedDevices;
  v13->_donnedDevices = 0;

  [(SDNearbyAgent *)v13 _cancelDonStateRetryTimers];
  [(NSMutableDictionary *)v13->_donStateRetryTimerDictionary removeAllObjects];
  donStateRetryTimerDictionary = v13->_donStateRetryTimerDictionary;
  v13->_donStateRetryTimerDictionary = 0;

  [(NSMutableDictionary *)v13->_services removeAllObjects];
  services = v13->_services;
  v13->_services = 0;

  [(NSMutableDictionary *)v13->_sessions removeAllObjects];
  sessions = v13->_sessions;
  v13->_sessions = 0;

  [(NSMutableDictionary *)v13->_setupSessions removeAllObjects];
  setupSessions = v13->_setupSessions;
  v13->_setupSessions = 0;

  [(SFSystemService *)v13->_systemService invalidate];
  systemService = v13->_systemService;
  v13->_systemService = 0;

  unlockTestClientTimer = v13->_unlockTestClientTimer;
  if (unlockTestClientTimer)
  {
    uint64_t v40 = unlockTestClientTimer;
    dispatch_source_cancel(v40);
    id v41 = v13->_unlockTestClientTimer;
    v13->_unlockTestClientTimer = 0;
  }
}

- (void)_handleAirDropDiscoverableModeChanged:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10020C6FC;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleAppleIDChanged:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10020C80C;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleBluetoothDeviceConnected:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  long long v6 = +[SDProximityPairingAgent sharedProximityPairingAgent];
  [v6 notifyForNonGenuineDevice:v5];

  id v7 = +[SDProximityPairingAgent sharedProximityPairingAgent];
  [v7 promptForAdaptiveControlsProxForDevice:v5];

  uint64_t v8 = +[SDProximityPairingAgent sharedProximityPairingAgent];
  [v8 promptForWhatsNewProxForDevice:v5];

  id v9 = +[SDProximityPairingAgent sharedProximityPairingAgent];
  [v9 promptForSiriNotificationsForDevice:v5];

  id v10 = +[SDProximityPairingAgent sharedProximityPairingAgent];
  [v10 promptForSpatialAudioProfileForDevice:v5];

  [(HeadphoneDigitalEngravingManager *)self->_digitalEngravingManager deviceDidConnect:v5];

  [(SDNearbyAgent *)self _update];
}

- (void)prefsChanged
{
  uint64_t v156 = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t Int64 = CFPrefs_GetInt64();
  uint64_t v4 = 1000;
  if (Int64 < 1000) {
    uint64_t v4 = Int64;
  }
  if (v4 <= 1) {
    LODWORD(v4) = 1;
  }
  if (Int64 < 0) {
    uint64_t v5 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v5 = v4;
  }
  activityPollSeconds = (NSData *)self->_activityPollSeconds;
  if (v5 != activityPollSeconds)
  {
    if (dword_100969808 <= 40)
    {
      if (dword_100969808 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_13;
        }
        activityPollSeconds = (NSData *)self->_activityPollSeconds;
      }
      v154 = activityPollSeconds;
      double v155 = *(double *)&v5;
      LogPrintF();
    }
LABEL_13:
    self->_activityPollSeconds = v5;
  }
  uint64_t v7 = CFPrefs_GetInt64();
  uint64_t v8 = 1000;
  if (v7 < 1000) {
    uint64_t v8 = v7;
  }
  *(void *)&double v9 = v8 & ~(v8 >> 63);
  activityRecentSeconds = (NSData *)self->_activityRecentSeconds;
  if (LODWORD(v9) != activityRecentSeconds)
  {
    if (dword_100969808 <= 40)
    {
      if (dword_100969808 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_21;
        }
        activityRecentSeconds = (NSData *)self->_activityRecentSeconds;
      }
      v154 = activityRecentSeconds;
      double v155 = v9;
      LogPrintF();
    }
LABEL_21:
    self->_activityRecentSeconds = LODWORD(v9);
  }
  uint64_t v11 = CFPrefs_GetInt64();
  BOOL v12 = v11 != 0;
  if (self->_btPipeEnabled != v12)
  {
    if (dword_100969808 <= 40)
    {
      uint64_t v13 = v11;
      if (dword_100969808 != -1 || _LogCategory_Initialize())
      {
        *(double *)&v14 = COERCE_DOUBLE("yes");
        if (v13) {
          id v15 = "no";
        }
        else {
          id v15 = "yes";
        }
        if (!v13) {
          *(double *)&v14 = COERCE_DOUBLE("no");
        }
        v154 = (NSData *)v15;
        double v155 = *(double *)&v14;
        LogPrintF();
      }
    }
    self->_btPipeEnabled = v12;
  }
  BOOL v16 = CFPrefs_GetInt64() != 0;
  if (self->_caEnabled != v16)
  {
    if (dword_100969808 <= 40 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      *(double *)&uint64_t v17 = COERCE_DOUBLE("yes");
      if (v16) {
        v18 = "no";
      }
      else {
        v18 = "yes";
      }
      if (!v16) {
        *(double *)&uint64_t v17 = COERCE_DOUBLE("no");
      }
      v154 = (NSData *)v18;
      double v155 = *(double *)&v17;
      LogPrintF();
    }
    self->_caEnabled = v16;
  }
  uint64_t v19 = CFPrefs_GetInt64();
  if (v19 < 0) {
    uint64_t v20 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v20 = v19 != 0;
  }
  caForce = (NSData *)self->_caForce;
  if (v20 != caForce)
  {
    if (dword_100969808 <= 40)
    {
      if (dword_100969808 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_52;
        }
        caForce = (NSData *)self->_caForce;
      }
      v154 = caForce;
      double v155 = *(double *)&v20;
      LogPrintF();
    }
LABEL_52:
    self->_caForce = v20;
  }
  uint64_t v22 = CFPrefs_GetInt64();
  BOOL v23 = v22 != 0;
  if (self->_caPhoneCalls != v23)
  {
    if (dword_100969808 <= 40)
    {
      uint64_t v24 = v22;
      if (dword_100969808 != -1 || _LogCategory_Initialize())
      {
        *(double *)&long long v25 = COERCE_DOUBLE("yes");
        if (v24) {
          long long v26 = "no";
        }
        else {
          long long v26 = "yes";
        }
        if (!v24) {
          *(double *)&long long v25 = COERCE_DOUBLE("no");
        }
        v154 = (NSData *)v26;
        double v155 = *(double *)&v25;
        LogPrintF();
      }
    }
    self->_caPhoneCalls = v23;
  }
  uint64_t v27 = CFPrefs_GetInt64();
  BOOL v28 = v27 != 0;
  if (self->_caScanIfVeryActive != v28)
  {
    if (dword_100969808 <= 40)
    {
      uint64_t v29 = v27;
      if (dword_100969808 != -1 || _LogCategory_Initialize())
      {
        *(double *)&v30 = COERCE_DOUBLE("yes");
        if (v29) {
          v31 = "no";
        }
        else {
          v31 = "yes";
        }
        if (!v29) {
          *(double *)&v30 = COERCE_DOUBLE("no");
        }
        v154 = (NSData *)v31;
        double v155 = *(double *)&v30;
        LogPrintF();
      }
    }
    self->_caScanIfVeryActive = v28;
  }
  uint64_t v32 = CFPrefs_GetInt64();
  BOOL v33 = v32 != 0;
  if (self->_caScanIfHasVisionOS1 != v33)
  {
    if (dword_100969808 <= 40)
    {
      uint64_t v34 = v32;
      if (dword_100969808 != -1 || _LogCategory_Initialize())
      {
        *(double *)&v35 = COERCE_DOUBLE("yes");
        if (v34) {
          v36 = "no";
        }
        else {
          v36 = "yes";
        }
        if (!v34) {
          *(double *)&v35 = COERCE_DOUBLE("no");
        }
        v154 = (NSData *)v36;
        double v155 = *(double *)&v35;
        LogPrintF();
      }
    }
    self->_caScanIfHasVisionOS1 = v33;
  }
  uint64_t v37 = CFPrefs_GetInt64();
  BOOL v38 = v37 != 0;
  if (self->_caSingleDevice != v38)
  {
    if (dword_100969808 <= 40)
    {
      uint64_t v39 = v37;
      if (dword_100969808 != -1 || _LogCategory_Initialize())
      {
        *(double *)&uint64_t v40 = COERCE_DOUBLE("yes");
        if (v39) {
          id v41 = "no";
        }
        else {
          id v41 = "yes";
        }
        if (!v39) {
          *(double *)&uint64_t v40 = COERCE_DOUBLE("no");
        }
        v154 = (NSData *)v41;
        double v155 = *(double *)&v40;
        LogPrintF();
      }
    }
    self->_caSingleDevice = v38;
  }
  uint64_t v42 = CFPrefs_GetInt64();
  if (v42 >= 480) {
    uint64_t v43 = 480;
  }
  else {
    uint64_t v43 = v42;
  }
  if (v43 <= 1) {
    LODWORD(v43) = 1;
  }
  *(void *)&double v44 = v43;
  donnedDeviceScanIntervalSeconds = (NSData *)self->_donnedDeviceScanIntervalSeconds;
  if (v43 != donnedDeviceScanIntervalSeconds)
  {
    if (dword_100969808 <= 40)
    {
      if (dword_100969808 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_107;
        }
        donnedDeviceScanIntervalSeconds = (NSData *)self->_donnedDeviceScanIntervalSeconds;
      }
      v154 = donnedDeviceScanIntervalSeconds;
      double v155 = v44;
      LogPrintF();
    }
LABEL_107:
    self->_donnedDeviceScanIntervalSeconds = LODWORD(v44);
  }
  BOOL v46 = CFPrefs_GetInt64() != 0;
  if (self->_idEnabled != v46)
  {
    if (dword_100969808 <= 40 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      *(double *)&id v47 = COERCE_DOUBLE("yes");
      if (v46) {
        id v48 = "no";
      }
      else {
        id v48 = "yes";
      }
      if (!v46) {
        *(double *)&id v47 = COERCE_DOUBLE("no");
      }
      v154 = (NSData *)v48;
      double v155 = *(double *)&v47;
      LogPrintF();
    }
    self->_idEnabled = v46;
  }
  uint64_t v49 = CFPrefs_GetInt64();
  BOOL v50 = v49 != 0;
  if (self->_ignoreWatchWristLockState != v50)
  {
    if (dword_100969808 <= 40)
    {
      uint64_t v51 = v49;
      if (dword_100969808 != -1 || _LogCategory_Initialize())
      {
        *(double *)&v52 = COERCE_DOUBLE("yes");
        if (v51) {
          v53 = "no";
        }
        else {
          v53 = "yes";
        }
        if (!v51) {
          *(double *)&v52 = COERCE_DOUBLE("no");
        }
        v154 = (NSData *)v53;
        double v155 = *(double *)&v52;
        LogPrintF();
      }
    }
    self->_ignoreWatchWristLockState = v50;
  }
  uint64_t v54 = CFPrefs_GetInt64();
  BOOL v55 = v54 != 0;
  if (self->_bleNearbyActionAdvertiseDisabled != v55)
  {
    if (dword_100969808 <= 40)
    {
      uint64_t v56 = v54;
      if (dword_100969808 != -1 || _LogCategory_Initialize())
      {
        *(double *)&v57 = COERCE_DOUBLE("yes");
        if (v56) {
          id v58 = "no";
        }
        else {
          id v58 = "yes";
        }
        if (!v56) {
          *(double *)&v57 = COERCE_DOUBLE("no");
        }
        v154 = (NSData *)v58;
        double v155 = *(double *)&v57;
        LogPrintF();
      }
    }
    self->_bleNearbyActionAdvertiseDisabled = v55;
  }
  uint64_t v59 = CFPrefs_GetInt64();
  BOOL v60 = v59 != 0;
  if (self->_bleNearbyActionRSSILog != v60)
  {
    if (dword_100969808 <= 40)
    {
      uint64_t v61 = v59;
      if (dword_100969808 != -1 || _LogCategory_Initialize())
      {
        *(double *)&id v62 = COERCE_DOUBLE("yes");
        if (v61) {
          id v63 = "no";
        }
        else {
          id v63 = "yes";
        }
        if (!v61) {
          *(double *)&id v62 = COERCE_DOUBLE("no");
        }
        v154 = (NSData *)v63;
        double v155 = *(double *)&v62;
        LogPrintF();
      }
    }
    self->_bleNearbyActionRSSILog = v60;
  }
  uint64_t v64 = CFPrefs_GetInt64();
  BOOL v65 = v64 != 0;
  if (self->_bleNearbyActionScanAlways != v65)
  {
    if (dword_100969808 <= 40 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      *(double *)&v66 = COERCE_DOUBLE("yes");
      if (v64) {
        v67 = "no";
      }
      else {
        v67 = "yes";
      }
      if (!v64) {
        *(double *)&v66 = COERCE_DOUBLE("no");
      }
      v154 = (NSData *)v67;
      double v155 = *(double *)&v66;
      LogPrintF();
    }
    self->_bleNearbyActionScanAlways = v65;
  }
  BOOL v68 = v64 == 0;
  if (self->_bleNearbyActionScanNever != v68)
  {
    if (dword_100969808 <= 40 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      *(double *)&id v69 = COERCE_DOUBLE("yes");
      if (v68) {
        v70 = "no";
      }
      else {
        v70 = "yes";
      }
      if (!v68) {
        *(double *)&id v69 = COERCE_DOUBLE("no");
      }
      v154 = (NSData *)v70;
      double v155 = *(double *)&v69;
      LogPrintF();
    }
    self->_bleNearbyActionScanNever = v68;
  }
  CFPrefs_GetData();
  id v71 = [objc_alloc((Class)NSData) initWithBytes:&v156 length:0];
  bleAuthTagOverride = self->_bleAuthTagOverride;
  *(double *)&id v73 = COERCE_DOUBLE(v71);
  v74 = bleAuthTagOverride;
  if (v73 == v74)
  {

    id v77 = v73;
LABEL_185:

    goto LABEL_186;
  }
  id v75 = v74;
  if ((v73 == 0) == (v74 != 0))
  {

LABEL_180:
    if (dword_100969808 <= 40 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      v154 = self->_bleAuthTagOverride;
      double v155 = *(double *)&v73;
      LogPrintF();
    }
    id v78 = v73;
    id v77 = self->_bleAuthTagOverride;
    self->_bleAuthTagOverride = v78;
    goto LABEL_185;
  }
  unsigned __int8 v76 = [(NSData *)v73 isEqual:v74];

  if ((v76 & 1) == 0) {
    goto LABEL_180;
  }
LABEL_186:
  BOOL v79 = CFPrefs_GetInt64() != 0;
  if (self->_bleNearbyInfoAdvertiseAlways != v79)
  {
    if (dword_100969808 <= 40 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      *(double *)&id v80 = COERCE_DOUBLE("yes");
      if (v79) {
        id v81 = "no";
      }
      else {
        id v81 = "yes";
      }
      if (!v79) {
        *(double *)&id v80 = COERCE_DOUBLE("no");
      }
      v154 = (NSData *)v81;
      double v155 = *(double *)&v80;
      LogPrintF();
    }
    self->_bleNearbyInfoAdvertiseAlways = v79;
  }
  uint64_t v82 = CFPrefs_GetInt64();
  BOOL v83 = v82 != 0;
  if (self->_bleNearbyInfoAdvertiseDisabled != v83)
  {
    if (dword_100969808 <= 40)
    {
      uint64_t v84 = v82;
      if (dword_100969808 != -1 || _LogCategory_Initialize())
      {
        *(double *)&id v85 = COERCE_DOUBLE("yes");
        if (v84) {
          id v86 = "no";
        }
        else {
          id v86 = "yes";
        }
        if (!v84) {
          *(double *)&id v85 = COERCE_DOUBLE("no");
        }
        v154 = (NSData *)v86;
        double v155 = *(double *)&v85;
        LogPrintF();
      }
    }
    self->_bleNearbyInfoAdvertiseDisabled = v83;
  }
  CFPrefs_GetDouble();
  if (v87 <= 1000.0) {
    double v88 = v87;
  }
  else {
    double v88 = 5.0;
  }
  double bleNearbyInfoAdvertiseLingerSecs = self->_bleNearbyInfoAdvertiseLingerSecs;
  if (v88 != bleNearbyInfoAdvertiseLingerSecs)
  {
    if (dword_100969808 <= 40)
    {
      if (dword_100969808 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_216;
        }
        double bleNearbyInfoAdvertiseLingerSecs = self->_bleNearbyInfoAdvertiseLingerSecs;
      }
      v154 = *(NSData **)&bleNearbyInfoAdvertiseLingerSecs;
      double v155 = v88;
      LogPrintF();
    }
LABEL_216:
    self->_double bleNearbyInfoAdvertiseLingerSecs = v88;
  }
  uint64_t v90 = CFPrefs_GetInt64();
  BOOL v91 = v90 != 0;
  if (self->_bleNearbyInfoRSSILog != v91)
  {
    if (dword_100969808 <= 40)
    {
      uint64_t v92 = v90;
      if (dword_100969808 != -1 || _LogCategory_Initialize())
      {
        *(double *)&v93 = COERCE_DOUBLE("yes");
        if (v92) {
          v94 = "no";
        }
        else {
          v94 = "yes";
        }
        if (!v92) {
          *(double *)&v93 = COERCE_DOUBLE("no");
        }
        v154 = (NSData *)v94;
        double v155 = *(double *)&v93;
        LogPrintF();
      }
    }
    self->_bleNearbyInfoRSSILog = v91;
  }
  BOOL v95 = CFPrefs_GetInt64() != 0;
  if (self->_bleNearbyInfoWiFiP2P != v95)
  {
    if (dword_100969808 <= 40 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      *(double *)&uint64_t v96 = COERCE_DOUBLE("yes");
      if (v95) {
        uint64_t v97 = "no";
      }
      else {
        uint64_t v97 = "yes";
      }
      if (!v95) {
        *(double *)&uint64_t v96 = COERCE_DOUBLE("no");
      }
      v154 = (NSData *)v97;
      double v155 = *(double *)&v96;
      LogPrintF();
    }
    self->_bleNearbyInfoWiFiP2P = v95;
  }
  BOOL v98 = CFPrefs_GetInt64() != 0;
  if (self->_contactHashesEnabled != v98)
  {
    if (dword_100969808 <= 40 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      *(double *)&v99 = COERCE_DOUBLE("yes");
      if (v98) {
        v100 = "no";
      }
      else {
        v100 = "yes";
      }
      if (!v98) {
        *(double *)&v99 = COERCE_DOUBLE("no");
      }
      v154 = (NSData *)v100;
      double v155 = *(double *)&v99;
      LogPrintF();
    }
    self->_contactHashesEnabled = v98;
  }
  uint64_t v101 = CFPrefs_GetInt64();
  BOOL v102 = v101 != 0;
  if (self->_logProxAdvFields != v102)
  {
    if (dword_100969808 <= 40)
    {
      uint64_t v103 = v101;
      if (dword_100969808 != -1 || _LogCategory_Initialize())
      {
        *(double *)&id v104 = COERCE_DOUBLE("yes");
        if (v103) {
          v105 = "no";
        }
        else {
          v105 = "yes";
        }
        if (!v103) {
          *(double *)&id v104 = COERCE_DOUBLE("no");
        }
        v154 = (NSData *)v105;
        double v155 = *(double *)&v104;
        LogPrintF();
      }
    }
    self->_logProxAdvFields = v102;
  }
  BOOL v106 = CFPrefs_GetInt64() != 0;
  if (self->_bleProximityEnabled != v106)
  {
    if (dword_100969808 <= 40 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      *(double *)&id v107 = COERCE_DOUBLE("yes");
      if (v106) {
        v108 = "no";
      }
      else {
        v108 = "yes";
      }
      if (!v106) {
        *(double *)&id v107 = COERCE_DOUBLE("no");
      }
      v154 = (NSData *)v108;
      double v155 = *(double *)&v107;
      LogPrintF();
    }
    self->_bleProximityEnabled = v106;
  }
  CFDictionaryGetTypeID();
  id v109 = (void *)CFPrefs_CopyTypedValue();
  bleProximityInfoOverride = self->_bleProximityInfoOverride;
  uint64_t v111 = v109;
  v112 = bleProximityInfoOverride;
  if (v111 == v112)
  {

    id v115 = v111;
  }
  else
  {
    uint64_t v113 = v112;
    if ((v111 == 0) != (v112 != 0))
    {
      unsigned __int8 v114 = [(NSDictionary *)v111 isEqual:v112];

      if (v114) {
        goto LABEL_284;
      }
    }
    else
    {
    }
    if (dword_100969808 <= 40 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      v154 = (NSData *)v111;
      LogPrintF();
    }
    v116 = v111;
    id v115 = self->_bleProximityInfoOverride;
    self->_bleProximityInfoOverride = v116;
  }

LABEL_284:
  CFDictionaryGetTypeID();
  id v117 = (void *)CFPrefs_CopyTypedValue();

  if (v117
    || ([(SDNearbyAgent *)self bleProximityRSSIEstimatorInfo],
        (id v117 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    +[SFBLEDevice setRSSIEstimatorInfo:](SFBLEDevice, "setRSSIEstimatorInfo:", v117, v154, *(void *)&v155);
  }
  uint64_t v118 = CFPrefs_GetInt64();
  BOOL v119 = v118 != 0;
  if (self->_bleProximityRSSILog != v119)
  {
    if (dword_100969808 <= 40)
    {
      uint64_t v120 = v118;
      if (dword_100969808 != -1 || _LogCategory_Initialize())
      {
        *(double *)&uint64_t v121 = COERCE_DOUBLE("yes");
        if (v120) {
          id v122 = "no";
        }
        else {
          id v122 = "yes";
        }
        if (!v120) {
          *(double *)&uint64_t v121 = COERCE_DOUBLE("no");
        }
        v154 = (NSData *)v122;
        double v155 = *(double *)&v121;
        LogPrintF();
      }
    }
    self->_bleProximityRSSILog = v119;
  }
  BOOL v123 = CFPrefs_GetInt64() != 0;
  if (self->_shareAudioEnabled != v123)
  {
    if (dword_100969808 <= 40 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      *(double *)&id v124 = COERCE_DOUBLE("yes");
      if (v123) {
        uint64_t v125 = "no";
      }
      else {
        uint64_t v125 = "yes";
      }
      if (!v123) {
        *(double *)&id v124 = COERCE_DOUBLE("no");
      }
      v154 = (NSData *)v125;
      double v155 = *(double *)&v124;
      LogPrintF();
    }
    self->_shareAudioEnabled = v123;
  }
  BOOL v126 = CFPrefs_GetInt64() != 0;
  if (self->_homePodIdentifiesAsB520 != v126)
  {
    if (dword_100969808 <= 40 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      *(double *)&v127 = COERCE_DOUBLE("yes");
      if (v126) {
        v128 = "no";
      }
      else {
        v128 = "yes";
      }
      if (!v126) {
        *(double *)&v127 = COERCE_DOUBLE("no");
      }
      v154 = (NSData *)v128;
      double v155 = *(double *)&v127;
      LogPrintF();
    }
    self->_homePodIdentifiesAsB520 = v126;
  }
  BOOL v129 = CFPrefs_GetInt64() != 0;
  if (self->_homePodIdentifiesAsB620 != v129)
  {
    if (dword_100969808 <= 40 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      *(double *)&v130 = COERCE_DOUBLE("yes");
      if (v129) {
        id v131 = "no";
      }
      else {
        id v131 = "yes";
      }
      if (!v129) {
        *(double *)&v130 = COERCE_DOUBLE("no");
      }
      v154 = (NSData *)v131;
      double v155 = *(double *)&v130;
      LogPrintF();
    }
    self->_homePodIdentifiesAsB620 = v129;
  }
  *(double *)&uint64_t v132 = COERCE_DOUBLE(CFPrefs_GetInt64());
  homePodModelCodeOverride = (NSData *)self->_homePodModelCodeOverride;
  if ((NSData *)v132 != homePodModelCodeOverride)
  {
    if (dword_100969808 <= 40)
    {
      if (dword_100969808 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_336;
        }
        homePodModelCodeOverride = (NSData *)self->_homePodModelCodeOverride;
      }
      v154 = homePodModelCodeOverride;
      double v155 = *(double *)&v132;
      LogPrintF();
    }
LABEL_336:
    self->_homePodModelCodeOverride = v132;
  }
  BOOL v134 = CFPrefs_GetInt64() != 0;
  if (self->_isRIClientEnabled != v134)
  {
    if (dword_100969808 <= 40 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      *(double *)&v135 = COERCE_DOUBLE("yes");
      if (v134) {
        id v136 = "no";
      }
      else {
        id v136 = "yes";
      }
      if (!v134) {
        *(double *)&v135 = COERCE_DOUBLE("no");
      }
      v154 = (NSData *)v136;
      double v155 = *(double *)&v135;
      LogPrintF();
    }
    self->_isRIClientEnabled = v134;
  }
  uint64_t v137 = CFPrefs_GetInt64();
  BOOL v138 = v137 != 0;
  if (self->_simulateDonStateChanges != v138)
  {
    if (dword_100969808 <= 40)
    {
      uint64_t v139 = v137;
      if (dword_100969808 != -1 || _LogCategory_Initialize())
      {
        *(double *)&v140 = COERCE_DOUBLE("yes");
        if (v139) {
          v141 = "no";
        }
        else {
          v141 = "yes";
        }
        if (!v139) {
          *(double *)&v140 = COERCE_DOUBLE("no");
        }
        v154 = (NSData *)v141;
        double v155 = *(double *)&v140;
        LogPrintF();
      }
    }
    self->_simulateDonStateChanges = v138;
  }
  BOOL v142 = CFPrefs_GetInt64() != 0;
  if (self->_prefWombatAssumeScreenOff != v142)
  {
    if (dword_100969808 <= 40 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      *(double *)&v143 = COERCE_DOUBLE("yes");
      if (v142) {
        v144 = "no";
      }
      else {
        v144 = "yes";
      }
      if (!v142) {
        *(double *)&v143 = COERCE_DOUBLE("no");
      }
      v154 = (NSData *)v144;
      double v155 = *(double *)&v143;
      LogPrintF();
    }
    self->_prefWombatAssumeScreenOff = v142;
    [(SDNearbyAgent *)self _updateCameraState];
  }
  BOOL v145 = CFPrefs_GetInt64() != 0;
  if (self->_prefWombatAssumeLocked != v145)
  {
    if (dword_100969808 <= 40 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      *(double *)&id v146 = COERCE_DOUBLE("yes");
      if (v145) {
        id v147 = "no";
      }
      else {
        id v147 = "yes";
      }
      if (!v145) {
        *(double *)&id v146 = COERCE_DOUBLE("no");
      }
      v154 = (NSData *)v147;
      double v155 = *(double *)&v146;
      LogPrintF();
    }
    self->_prefWombatAssumeLocked = v145;
    [(SDNearbyAgent *)self _updateCameraState];
  }
  BOOL v148 = CFPrefs_GetInt64() != 0;
  if (self->_prefWombatAssumeMounted != v148)
  {
    if (dword_100969808 <= 40 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      *(double *)&v149 = COERCE_DOUBLE("yes");
      if (v148) {
        uint64_t v150 = "no";
      }
      else {
        uint64_t v150 = "yes";
      }
      if (!v148) {
        *(double *)&v149 = COERCE_DOUBLE("no");
      }
      v154 = (NSData *)v150;
      double v155 = *(double *)&v149;
      LogPrintF();
    }
    self->_prefWombatAssumeMounted = v148;
    [(SDNearbyAgent *)self _updateCameraState];
  }
  BOOL v151 = CFPrefs_GetInt64() != 0;
  if (self->_prefWombatAssumeNotInPocket != v151)
  {
    if (dword_100969808 <= 40 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      *(double *)&uint64_t v152 = COERCE_DOUBLE("yes");
      if (v151) {
        v153 = "no";
      }
      else {
        v153 = "yes";
      }
      if (!v151) {
        *(double *)&uint64_t v152 = COERCE_DOUBLE("no");
      }
      v154 = (NSData *)v153;
      double v155 = *(double *)&v152;
      LogPrintF();
    }
    self->_prefWombatAssumeNotInPocket = v151;
    [(SDNearbyAgent *)self _updateCameraState];
  }
  [(SDNearbyAgent *)self _update];
}

- (void)update
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10020E340;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_update
{
  if (self->_activated)
  {
    BOOL bleNearbyInfoAdvertiseAlways = self->_bleNearbyInfoAdvertiseAlways;
    if (!self->_caEnabled) {
      goto LABEL_13;
    }
    if (self->_caSingleDevice) {
      goto LABEL_14;
    }
    if ([(SDNearbyAgent *)self idsIsSignedIn])
    {
      int v4 = [(SDNearbyAgent *)self _idsContinuityDeviceCount];
      if (!bleNearbyInfoAdvertiseAlways && v4 <= 0) {
        goto LABEL_7;
      }
    }
    else
    {
LABEL_13:
      if (!bleNearbyInfoAdvertiseAlways)
      {
LABEL_7:
        [(SDNearbyAgent *)self _activityMonitorEnsureStopped];
        int v5 = 0;
        goto LABEL_15;
      }
    }
LABEL_14:
    [(SDNearbyAgent *)self _activityMonitorEnsureStarted];
    int v5 = 1;
LABEL_15:
    if (self->_idEnabled) {
      [(SDNearbyAgent *)self _identificationEnsureStarted];
    }
    else {
      [(SDNearbyAgent *)self _identificationEnsureStopped];
    }
    if ([(SDNearbyAgent *)self _bleNearbyActionAdvertiserShouldAdvertise]) {
      [(SDNearbyAgent *)self _bleNearbyActionAdvertiserEnsureStarted];
    }
    else {
      [(SDNearbyAgent *)self _bleNearbyActionAdvertiserEnsureStopped];
    }
    if ([(SDNearbyAgent *)self _bleNearbyActionScannerShouldScan]) {
      [(SDNearbyAgent *)self _bleNearbyActionScannerEnsureStarted];
    }
    else {
      [(SDNearbyAgent *)self _bleNearbyActionScannerEnsureStopped];
    }
    if ([(SDNearbyAgent *)self _bleNearbyInfoAdvertiserShouldAdvertise]
      || [(SDNearbyAgent *)self _bleNearbyInfoAdvertiserLingerIfNeeded])
    {
      [(SDNearbyAgent *)self _bleNearbyInfoAdvertiserEnsureStarted];
    }
    else
    {
      [(SDNearbyAgent *)self _bleNearbyInfoAdvertiserEnsureStopped];
    }
    if ([(SDNearbyAgent *)self _bleNearbyInfoScannerShouldScan]) {
      [(SDNearbyAgent *)self _bleNearbyInfoScannerEnsureStarted];
    }
    else {
      [(SDNearbyAgent *)self _bleNearbyInfoScannerEnsureStopped];
    }
    if ([(SDNearbyAgent *)self _bleProximityPairingScannerShouldScan]) {
      [(SDNearbyAgent *)self _bleProximityPairingScannerEnsureStarted];
    }
    else {
      [(SDNearbyAgent *)self _bleProximityPairingScannerEnsureStopped];
    }
    long long v6 = self;
    objc_sync_enter(v6);
    if (v6->_btPipeEnabled || v6->_btPipeForced) {
      [(SDNearbyAgent *)v6 _btPipeEnsureStarted];
    }
    else {
      [(SDNearbyAgent *)v6 _btPipeEnsureStopped];
    }
    objc_sync_exit(v6);

    if (v5)
    {
      [(SDNearbyAgent *)v6 _activityMonitorUpdate];
    }
    else if ([(SDNearbyAgent *)v6 _bleNearbyInfoAdvertiserShouldAdvertise])
    {
      [(SDNearbyAgent *)v6 _bleNearbyInfoAdvertiserUpdate];
    }
    return;
  }
  if (dword_100969808 <= 90 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (id)_useCasesToHexString:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        if ((v6 & 1) == 0) {
          char v6 = 1;
        }
        id v12 = [*(id *)(*((void *)&v13 + 1) + 8 * i) unsignedIntValue];
        NSAppendPrintF();
      }
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v5);
  }
  double v9 = v17;
  if (!v17) {
    double v9 = &stru_1008E7020;
  }
  id v10 = v9;

  return v10;
}

- (void)_activityMonitorEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_activityCarPlayRegistered)
  {
    self->_activityCarPlayRegistered = 1;
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"_activityMonitorCarPlayStatusChanged:" name:@"com.apple.sharingd.CarPlayStatusChanged" object:0];
  }
  if (!self->_activityMultipleUsersRegistered)
  {
    self->_activityMultipleUsersRegistered = 1;
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"_activityMonitorMultipleUsersLoggedInChanged:" name:@"com.apple.sharingd.MultipleUsersLoggedInChanged" object:0];
  }
  int activityLevelNotifyToken = self->_activityLevelNotifyToken;
  p_int activityLevelNotifyToken = &self->_activityLevelNotifyToken;
  *((unsigned char *)p_activityLevelNotifyToken + 5) = 1;
  if (activityLevelNotifyToken == -1)
  {
    notify_register_check("com.apple.sharing.activity-level-changed", p_activityLevelNotifyToken);
  }
}

- (void)_activityMonitorEnsureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_activityMonitorStarted) {
    *(_WORD *)&self->_uint64_t activityLevel = 0;
  }
  int activityLevelNotifyToken = self->_activityLevelNotifyToken;
  if (activityLevelNotifyToken != -1)
  {
    notify_set_state(activityLevelNotifyToken, self->_activityLevel);
    notify_post("com.apple.sharing.activity-level-changed");
    notify_cancel(self->_activityLevelNotifyToken);
    self->_int activityLevelNotifyToken = -1;
  }
  if (self->_activityCarPlayRegistered)
  {
    self->_activityCarPlayRegistered = 0;
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self name:@"com.apple.sharingd.CarPlayStatusChanged" object:0];
  }
  if (self->_activityMultipleUsersRegistered)
  {
    self->_activityMultipleUsersRegistered = 0;
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self name:@"com.apple.sharingd.MultipleUsersLoggedInChanged" object:0];
  }
  activityTimer = self->_activityTimer;
  if (activityTimer)
  {
    uint64_t v8 = activityTimer;
    dispatch_source_cancel(v8);
    uint64_t v7 = self->_activityTimer;
    self->_activityTimer = 0;
  }
}

- (void)_activityMonitorUpdate
{
  char v14 = 0;
  [(SDNearbyAgent *)self _activityMonitorCurrentLevelAndNeedsPoll:&v14 recentUserActivity:0];
  activityTimer = self->_activityTimer;
  if (v14)
  {
    if (!activityTimer && self->_activityPollSeconds >= 1)
    {
      id v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      id v5 = self->_activityTimer;
      self->_activityTimer = v4;

      char v6 = self->_activityTimer;
      if (!v6)
      {
        uint64_t v12 = FatalErrorF();
        sub_10020EA7C(v12);
        return;
      }
      unint64_t v7 = 1000000000 * self->_activityPollSeconds;
      dispatch_time_t v8 = dispatch_time(0, v7);
      dispatch_source_set_timer(v6, v8, v7, v7 >> 2);
      double v9 = self->_activityTimer;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10020EA7C;
      v13[3] = &unk_1008CA4B8;
      v13[4] = self;
      dispatch_source_set_event_handler(v9, v13);
      dispatch_resume((dispatch_object_t)self->_activityTimer);
    }
  }
  else if (activityTimer)
  {
    id v10 = activityTimer;
    dispatch_source_cancel(v10);
    uint64_t v11 = self->_activityTimer;
    self->_activityTimer = 0;
  }
  if ([(SDNearbyAgent *)self _bleNearbyInfoAdvertiserShouldAdvertise])
  {
    [(SDNearbyAgent *)self _bleNearbyInfoAdvertiserEnsureStarted];
    [(SDNearbyAgent *)self _bleNearbyInfoAdvertiserUpdate];
  }
  else
  {
    [(SDNearbyAgent *)self _bleNearbyInfoAdvertiserEnsureStopped];
  }
}

- (unsigned)_activityMonitorCurrentLevelAndNeedsPoll:(BOOL *)a3 recentUserActivity:(BOOL *)a4
{
  [(SDNearbyAgent *)self _activityMonitorLastUserEventDelta];
  double v8 = v7;
  if (!self->_activityMonitorStarted
    || [(SDStatusMonitor *)self->_statusMonitor multipleUsersLoggedIn])
  {
    uint64_t v9 = 0;
    BOOL v10 = 0;
    unsigned __int8 v11 = 1;
    goto LABEL_17;
  }
  if ((int)[(CUSystemMonitor *)self->_systemMonitor activeCallCount] >= 1
    && (!SFDeviceIsRealityDevice()
     || [(SDStatusMonitor *)self->_statusMonitor deviceKeyBagUnlockedAndScreenOn]))
  {
    BOOL v10 = 0;
    unsigned __int8 v11 = 14;
LABEL_16:
    uint64_t v9 = 1;
    goto LABEL_17;
  }
  if ([(SDStatusMonitor *)self->_statusMonitor carplayConnected])
  {
    BOOL v10 = 0;
    unsigned __int8 v11 = 13;
    goto LABEL_16;
  }
  if ([(SDStatusMonitor *)self->_statusMonitor deviceUIUnlocked])
  {
    if (v8 <= (double)self->_activityRecentSeconds)
    {
      unsigned __int8 v11 = 11;
      goto LABEL_34;
    }
    if ((id)[(SDStatusMonitor *)self->_statusMonitor pairedWatchWristState] == (id)3)
    {
      unsigned __int8 v11 = 10;
LABEL_34:
      uint64_t v9 = 1;
      BOOL v10 = 1;
      goto LABEL_17;
    }
    if (SFDeviceClassCodeGet() == 3
      && [(SDStatusMonitor *)self->_statusMonitor smartCoverIsClosed])
    {
      goto LABEL_42;
    }
    if ([(SDStatusMonitor *)self->_statusMonitor screenOn])
    {
      uint64_t v9 = 0;
      BOOL v10 = 1;
      unsigned __int8 v11 = 7;
    }
    else
    {
      uint64_t v9 = 0;
      BOOL v10 = 0;
      if (SFDeviceClassCodeGet() == 4) {
        unsigned __int8 v11 = 4;
      }
      else {
        unsigned __int8 v11 = 3;
      }
    }
  }
  else
  {
    if ((id)[(SDStatusMonitor *)self->_statusMonitor pairedWatchWristState] == (id)3)
    {
      BOOL v10 = 0;
      unsigned __int8 v11 = 10;
      goto LABEL_16;
    }
    if (SFDeviceClassCodeGet() == 3
      && [(SDStatusMonitor *)self->_statusMonitor smartCoverIsClosed])
    {
LABEL_42:
      uint64_t v9 = 0;
      BOOL v10 = 0;
      unsigned __int8 v11 = 2;
      goto LABEL_17;
    }
    uint64_t v9 = 0;
    BOOL v10 = 0;
    if ([(SDStatusMonitor *)self->_statusMonitor screenOn]) {
      unsigned __int8 v11 = 7;
    }
    else {
      unsigned __int8 v11 = 3;
    }
  }
LABEL_17:
  uint64_t activityLevel = self->_activityLevel;
  if (v11 == activityLevel) {
    goto LABEL_28;
  }
  if (dword_100969808 <= 40)
  {
    if (dword_100969808 == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_26;
      }
      uint64_t activityLevel = self->_activityLevel;
    }
    if (activityLevel > 0xE) {
      long long v13 = "?";
    }
    else {
      long long v13 = off_1008D1CA0[(char)activityLevel];
    }
    uint64_t v16 = activityLevel;
    uint64_t v17 = v13;
    uint64_t v18 = v11;
    uint64_t v19 = off_1008D14E8[(char)v11 - 1];
    LogPrintF();
  }
LABEL_26:
  self->_uint64_t activityLevel = v11;
  -[SDNearbyAgent _activityMonitorUpdateUserActive:](self, "_activityMonitorUpdateUserActive:", v9, v16, v17, v18, v19);
  int activityLevelNotifyToken = self->_activityLevelNotifyToken;
  if (activityLevelNotifyToken != -1)
  {
    notify_set_state(activityLevelNotifyToken, v11);
    notify_post("com.apple.sharing.activity-level-changed");
  }
LABEL_28:
  if (a3) {
    *a3 = v10;
  }
  if (a4) {
    *a4 = v8 <= (double)self->_activityRecentSeconds;
  }
  return v11;
}

- (void)_activityMonitorCarPlayStatusChanged:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10020EDB4;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (double)_activityMonitorLastUserEventDelta
{
  double v2 = CACurrentMediaTime();
  BKSHIDServicesLastUserEventTime();
  return v2 - v3;
}

- (void)_activityMonitorMultipleUsersLoggedInChanged:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10020EF30;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activityMonitorScreenStateChanged:(id)a3
{
  unsigned __int8 v4 = [(SDStatusMonitor *)self->_statusMonitor screenOn];
  dispatchQueue = self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10020F098;
  v6[3] = &unk_1008CB9D8;
  v6[4] = self;
  unsigned __int8 v7 = v4;
  dispatch_async(dispatchQueue, v6);
}

- (void)_activityMonitorUILockStatusChanged:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10020F16C;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activityMonitorUpdateUserActive:(BOOL)a3
{
  if (self->_activityUserActive != a3)
  {
    self->_activityUserActive = a3;
    if (!a3 && self->_bleNearbyInfoAdvertiseLingerSecs > 0.0) {
      [(SDNearbyAgent *)self _bleNearbyInfoAdvertiserLingerStart:@"UserActive"];
    }
  }
}

- (void)_activityMonitorMediaAccessControlSettingChanged:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10020F300;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activityMonitorWatchWristStateChanged:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10020F438;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)activityStateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10020F59C;
  v7[3] = &unk_1008CAD20;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_bleNearbyActionAdvertiserEnsureStarted
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v4 = self->_services;
  id v73 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v78 objects:v84 count:16];
  if (!v73)
  {

    unsigned __int8 v7 = 0;
    v52 = 0;
    BOOL v38 = 0;
    goto LABEL_147;
  }
  id v63 = v3;
  uint64_t v75 = 0;
  uint64_t v76 = 0;
  unsigned __int8 v5 = 0;
  int v6 = 0;
  id v71 = 0;
  unsigned __int8 v7 = 0;
  unsigned __int8 v68 = 0;
  unsigned __int8 v70 = 0;
  id v8 = 0;
  uint64_t v9 = 0;
  unsigned __int8 v69 = SFDeviceColorCodeUnknown;
  uint64_t v72 = *(void *)v79;
  char v74 = 1;
  BOOL v65 = self;
  obj = v4;
LABEL_3:
  uint64_t v10 = 0;
  while (2)
  {
    if (*(void *)v79 != v72) {
      objc_enumerationMutation(obj);
    }
    unsigned __int8 v11 = [(NSMutableDictionary *)self->_services objectForKeyedSubscript:*(void *)(*((void *)&v78 + 1) + 8 * v10)];
    unsigned int v12 = [v11 deviceActionType];
    int v13 = 990;
    switch(v12)
    {
      case 0u:
        goto LABEL_47;
      case 1u:
        if (SFIsDeviceAudioAccessory()) {
          goto LABEL_103;
        }
        int v13 = 680;
LABEL_43:
        if (v13 >= v6) {
          unsigned __int8 v5 = v12;
        }
        if (v13 > v6) {
          int v6 = v13;
        }
LABEL_47:
        if ((![(CUSystemMonitor *)self->_systemMonitor screenOn]
           || [(CUSystemMonitor *)self->_systemMonitor screenSaverActive])
          && ![v11 overrideScreenOff])
        {
          goto LABEL_103;
        }
        if ((uint64_t)[v11 advertiseRate] > (uint64_t)v71) {
          id v71 = [v11 advertiseRate];
        }
        char v14 = [v11 authTagOverride];
        long long v15 = v14;
        if (v14)
        {
          uint64_t v16 = v8;
          uint64_t v17 = v14;

          unsigned __int8 v7 = v17;
          id v8 = v16;
        }

        if ([v11 deviceClassCode]) {
          unsigned __int8 v68 = [v11 deviceClassCode];
        }
        int v18 = v76;
        if ([v11 deviceColorCode]) {
          unsigned __int8 v69 = [v11 deviceColorCode];
        }
        if ([v11 deviceModelCode]) {
          unsigned __int8 v70 = [v11 deviceModelCode];
        }
        if ([v11 needsKeyboard]) {
          int v18 = v76 | 0x20;
        }
        if ([v11 needsSetup]) {
          v18 |= 0x40u;
        }
        unsigned __int16 v19 = (unsigned __int16)[v11 sessionFlags];
        char v20 = v19;
        if ((v19 & 0x200) != 0)
        {
          if ((id)[(SDStatusMonitor *)self->_statusMonitor mediaAccessControlSetting] == (id)1) {
            int v21 = 24;
          }
          else {
            int v21 = 16;
          }
          v18 |= v21;
        }
        LODWORD(v76) = v18;
        unint64_t v22 = (unint64_t)[v11 problemFlags];
        if (!v8)
        {
          if ([v11 deviceActionType] == 8)
          {
            BOOL v23 = v9;
            uint64_t v24 = v7;
            id v25 = [v11 requestSSID];
            id v8 = (const char *)[v25 UTF8String];

            if (v8)
            {
              *(_OWORD *)md = 0u;
              long long v83 = 0u;
              CC_LONG v26 = strlen(v8);
              CC_SHA256(v8, v26, md);
              id v8 = (const char *)[objc_alloc((Class)NSData) initWithBytes:md length:3];
            }
            unsigned __int8 v7 = v24;
            uint64_t v9 = v23;
            self = v65;
          }
          else
          {
            id v8 = 0;
          }
        }
        HIDWORD(v76) |= (v20 & 0x80) >> 7;
        if ((v74 & 1) == 0)
        {
          char v74 = 0;
          goto LABEL_101;
        }
        if ([v11 deviceActionType] != 51)
        {
          char v74 = 1;
          goto LABEL_101;
        }
        v66 = v8;
        uint64_t v27 = [v11 targetAuthTag];
        if (v27)
        {
          BOOL v28 = (void *)v27;
          uint64_t v29 = v9;
          v30 = v7;
          v31 = [v11 targetAuthTag];
          id v32 = [v31 length];

          if (v32 == (id)3)
          {
            unsigned __int8 v7 = v30;
            uint64_t v9 = v29;
            self = v65;
            if (!v9)
            {
              uint64_t v9 = [v11 targetAuthTag];
              HIDWORD(v76) |= 4u;
            }
          }
          else
          {
            unsigned __int8 v7 = v30;
            uint64_t v9 = v29;
            self = v65;
          }
        }
        BOOL v33 = [v11 targetAuthTag];

        if (v33)
        {
          if (!v9 || ([v11 targetAuthTag], (uint64_t v34 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            char v74 = 1;
            goto LABEL_90;
          }
          v35 = (void *)v34;
          uint64_t v64 = v7;
          v36 = [v11 targetAuthTag];
          unsigned __int8 v37 = [v9 isEqual:v36];

          if (v37)
          {
            char v74 = 1;
            unsigned __int8 v7 = v64;
            self = v65;
LABEL_90:
            id v8 = v66;
            goto LABEL_101;
          }
          unsigned __int8 v7 = v64;
          self = v65;
          id v8 = v66;
          if (dword_100969808 <= 40 && (dword_100969808 != -1 || _LogCategory_Initialize()))
          {
            [v11 targetAuthTag];
            id v62 = v61 = (unint64_t)v9;
            LogPrintF();

            id v8 = v66;
          }
        }
        else
        {
          id v8 = v66;
          if (dword_100969808 <= 40 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
        }

        char v74 = 0;
        uint64_t v9 = 0;
        HIDWORD(v76) &= ~4u;
LABEL_101:
        v75 |= v22;
        if (objc_msgSend(v11, "deviceActionType", v61, v62) == 84)
        {
          unsigned __int8 v68 = SFDeviceClassCodeGet();
          unsigned __int8 v70 = SFDeviceModelCodeGet();
          unsigned __int8 v69 = SFDeviceColorCodeGet();
        }
LABEL_103:

        if (v73 != (id)++v10) {
          continue;
        }
        id v73 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v78 objects:v84 count:16];
        if (v73) {
          goto LABEL_3;
        }
        BOOL v38 = v9;

        if ((_BYTE)v76 || v5 - 28 <= 0x38 && ((1 << (v5 - 28)) & 0x10000001A008053) != 0 || v5 == 19)
        {
          self->_bleNearbyActionAdvertiseActive = 1;
          if (v71) {
            uint64_t v39 = (uint64_t)v71;
          }
          else {
            uint64_t v39 = 40;
          }
          id v3 = v63;
          if (v68)
          {
            uint64_t v40 = +[NSNumber numberWithUnsignedChar:v68];
            [v63 setObject:v40 forKeyedSubscript:@"cl"];
          }
          if (v69)
          {
            id v41 = +[NSNumber numberWithUnsignedChar:v69];
            [v63 setObject:v41 forKeyedSubscript:@"cc"];
          }
          if (v70)
          {
            uint64_t v42 = +[NSNumber numberWithUnsignedChar:v70];
            [v63 setObject:v42 forKeyedSubscript:@"md"];
          }
          if ((v76 & 0x20) != 0) {
            [v63 setObject:&__kCFBooleanTrue forKeyedSubscript:@"nk"];
          }
          if ((v76 & 0x40) != 0) {
            [v63 setObject:&__kCFBooleanTrue forKeyedSubscript:@"ns"];
          }
          if ((_BYTE)v76)
          {
            uint64_t v43 = +[NSNumber numberWithUnsignedChar:v76];
            [v63 setObject:v43 forKeyedSubscript:@"af1"];
          }
          if (BYTE4(v76))
          {
            double v44 = +[NSNumber numberWithUnsignedChar:BYTE4(v76)];
            [v63 setObject:v44 forKeyedSubscript:@"af2"];
          }
          if (v38) {
            [v63 setObject:v38 forKeyedSubscript:@"tatag"];
          }
          long long v45 = +[NSNumber numberWithUnsignedChar:v5];
          [v63 setObject:v45 forKeyedSubscript:@"dt"];

          [(SDNearbyAgent *)self _bleUpdateAuthTagIfNeeded];
          bleAuthTagOverride = self->_bleAuthTagOverride;
          if (bleAuthTagOverride || (bleAuthTagOverride = v7) != 0 || (bleAuthTagOverride = self->_bleAuthTag) != 0) {
            [v63 setObject:bleAuthTagOverride forKeyedSubscript:@"at"];
          }
          if (v5 == 8 && self->_contactHashesEnabled)
          {
            id v47 = self->_contactHashesCached;
            if (v47
              || ([(SDStatusMonitor *)self->_statusMonitor myMediumHashes],
                  id v47 = (NSData *)objc_claimAutoreleasedReturnValue(),
                  objc_storeStrong((id *)&self->_contactHashesCached, v47),
                  v47))
            {
              [v63 setObject:v47 forKeyedSubscript:@"ach"];
            }
          }
          if (v75)
          {
            id v48 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
            [v63 setObject:v48 forKeyedSubscript:@"pf"];
          }
          if (v8) {
            [v63 setObject:v8 forKeyedSubscript:@"ssidH"];
          }
          uint64_t v49 = self->_bleNearbyActionAdvertiseLingerTimer;
          BOOL v50 = v49;
          if (v49)
          {
            dispatch_source_cancel((dispatch_source_t)v49);
            bleNearbyActionAdvertiseLingerTimer = self->_bleNearbyActionAdvertiseLingerTimer;
            self->_bleNearbyActionAdvertiseLingerTimer = 0;
          }
          if (self->_bleNearbyActionAdvertiser)
          {
            if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
            {
              unint64_t v61 = v76;
              id v62 = &unk_10076E5E0;
              LogPrintF();
            }
            -[SFBLEAdvertiser setPayloadFields:](self->_bleNearbyActionAdvertiser, "setPayloadFields:", v63, v61, v62);
            if ((id)v39 != [(SFBLEAdvertiser *)self->_bleNearbyActionAdvertiser advertiseRate]) {
              [(SFBLEAdvertiser *)self->_bleNearbyActionAdvertiser setAdvertiseRate:v39];
            }
          }
          else
          {
            if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            v53 = (SFBLEAdvertiser *)[objc_alloc((Class)SFBLEAdvertiser) initWithType:15];
            bleNearbyActionAdvertiser = self->_bleNearbyActionAdvertiser;
            self->_bleNearbyActionAdvertiser = v53;

            [(SFBLEAdvertiser *)self->_bleNearbyActionAdvertiser setAdvertiseRate:v39];
            [(SFBLEAdvertiser *)self->_bleNearbyActionAdvertiser setDispatchQueue:self->_dispatchQueue];
            BOOL v55 = [(SDNearbyAgent *)self _idsBluetoothDeviceIDsForLEPipe];
            [(SFBLEAdvertiser *)self->_bleNearbyActionAdvertiser setLePipeDevices:v55];

            [(SFBLEAdvertiser *)self->_bleNearbyActionAdvertiser setPayloadFields:v63];
            [(SFBLEAdvertiser *)self->_bleNearbyActionAdvertiser activateWithCompletion:&stru_1008D1090];
          }
          v52 = (char *)v8;
        }
        else
        {
          id v3 = v63;
          v52 = (char *)v8;
LABEL_147:
          self->_bleNearbyActionAdvertiseActive = 0;
          if (self->_bleNearbyActionAdvertiser && !self->_bleNearbyActionAdvertiseLingerTimer)
          {
            if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
            {
              unint64_t v61 = 0;
              id v62 = &unk_10076E5E0;
              LogPrintF();
            }
            -[SFBLEAdvertiser setPayloadFields:](self->_bleNearbyActionAdvertiser, "setPayloadFields:", v3, v61, v62);
            [(SFBLEAdvertiser *)self->_bleNearbyActionAdvertiser setAdvertiseRate:50];
            if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            uint64_t v56 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
            v57 = self->_bleNearbyActionAdvertiseLingerTimer;
            self->_bleNearbyActionAdvertiseLingerTimer = v56;

            id v58 = self->_bleNearbyActionAdvertiseLingerTimer;
            dispatch_time_t v59 = dispatch_time(0, 5000000000);
            dispatch_source_set_timer(v58, v59, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
            BOOL v60 = self->_bleNearbyActionAdvertiseLingerTimer;
            handler[0] = _NSConcreteStackBlock;
            handler[1] = 3221225472;
            handler[2] = sub_1002104F4;
            handler[3] = &unk_1008CA4B8;
            handler[4] = self;
            dispatch_source_set_event_handler(v60, handler);
            dispatch_resume((dispatch_object_t)self->_bleNearbyActionAdvertiseLingerTimer);
          }
        }

        return;
      case 4u:
        int v13 = 480;
        goto LABEL_43;
      case 5u:
        int v13 = 450;
        goto LABEL_43;
      case 6u:
        int v13 = 960;
        goto LABEL_43;
      case 7u:
        int v13 = 470;
        goto LABEL_43;
      case 8u:
        int v13 = 950;
        goto LABEL_43;
      case 9u:
        int v13 = 670;
        goto LABEL_43;
      case 0xAu:
        int v13 = 630;
        goto LABEL_43;
      case 0xBu:
        int v13 = 690;
        goto LABEL_43;
      case 0xCu:
        int v13 = 980;
        goto LABEL_43;
      case 0xDu:
        int v13 = 660;
        goto LABEL_43;
      case 0xEu:
        int v13 = 930;
        goto LABEL_43;
      case 0x11u:
        int v13 = 590;
        goto LABEL_43;
      case 0x12u:
        int v13 = 580;
        goto LABEL_43;
      case 0x13u:
        int v13 = 920;
        goto LABEL_43;
      case 0x14u:
        int v13 = 490;
        goto LABEL_43;
      case 0x15u:
        int v13 = 460;
        goto LABEL_43;
      case 0x16u:
        int v13 = 910;
        goto LABEL_43;
      case 0x18u:
        int v13 = 640;
        goto LABEL_43;
      case 0x19u:
      case 0x1Eu:
        int v13 = 940;
        goto LABEL_43;
      case 0x1Bu:
        int v13 = 900;
        goto LABEL_43;
      case 0x1Cu:
        int v13 = 970;
        goto LABEL_43;
      case 0x1Du:
        int v13 = 880;
        goto LABEL_43;
      case 0x1Fu:
        int v13 = 895;
        goto LABEL_43;
      case 0x20u:
        int v13 = 965;
        goto LABEL_43;
      case 0x21u:
        int v13 = 700;
        goto LABEL_43;
      case 0x22u:
        int v13 = 971;
        goto LABEL_43;
      case 0x24u:
        int v13 = 665;
        goto LABEL_43;
      case 0x2Bu:
        int v13 = 966;
        goto LABEL_43;
      case 0x32u:
        goto LABEL_43;
      case 0x33u:
        int v13 = 790;
        goto LABEL_43;
      case 0x35u:
        int v13 = 890;
        goto LABEL_43;
      case 0x37u:
        int v13 = 985;
        goto LABEL_43;
      case 0x38u:
        int v13 = 860;
        goto LABEL_43;
      case 0x54u:
        int v13 = 870;
        goto LABEL_43;
      default:
        int v13 = 1;
        goto LABEL_43;
    }
  }
}

- (void)_bleNearbyActionAdvertiserEnsureStopped
{
  self->_bleDiagnosticAdvSuppressLogged = 0;
  self->_bleNearbyActionAdvertiseActive = 0;
  if (self->_bleNearbyActionAdvertiser
    && dword_100969808 <= 30
    && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SFBLEAdvertiser *)self->_bleNearbyActionAdvertiser invalidate];
  bleNearbyActionAdvertiser = self->_bleNearbyActionAdvertiser;
  self->_bleNearbyActionAdvertiser = 0;

  bleNearbyActionAdvertiseLingerTimer = self->_bleNearbyActionAdvertiseLingerTimer;
  if (bleNearbyActionAdvertiseLingerTimer)
  {
    int v6 = bleNearbyActionAdvertiseLingerTimer;
    dispatch_source_cancel(v6);
    unsigned __int8 v5 = self->_bleNearbyActionAdvertiseLingerTimer;
    self->_bleNearbyActionAdvertiseLingerTimer = 0;
  }
}

- (BOOL)_bleNearbyActionAdvertiserShouldAdvertise
{
  return ![(NSMutableSet *)self->_bleDiagnosticModeClients count]
      && !self->_bleNearbyActionAdvertiseDisabled
      && !self->_preventNearbyActionAdvertising;
}

- (void)_bleNearbyActionScannerEnsureStarted
{
  if (self->_bleNearbyActionScanner)
  {
    -[SDNearbyAgent _bleUpdateScanner:typeFlag:](self, "_bleUpdateScanner:typeFlag:");
  }
  else
  {
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = (SFBLEScanner *)[objc_alloc((Class)SFBLEScanner) initWithType:15];
    bleNearbyActionScanner = self->_bleNearbyActionScanner;
    self->_bleNearbyActionScanner = v3;

    [(SFBLEScanner *)self->_bleNearbyActionScanner setDispatchQueue:self->_dispatchQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10021092C;
    v8[3] = &unk_1008CAE28;
    v8[4] = self;
    [(SFBLEScanner *)self->_bleNearbyActionScanner setDeviceFoundHandler:v8];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100210A34;
    v7[3] = &unk_1008CAE28;
    v7[4] = self;
    [(SFBLEScanner *)self->_bleNearbyActionScanner setDeviceLostHandler:v7];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100210B08;
    v6[3] = &unk_1008CAE90;
    v6[4] = self;
    [(SFBLEScanner *)self->_bleNearbyActionScanner setDeviceChangedHandler:v6];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100210BC0;
    v5[3] = &unk_1008CB068;
    v5[4] = self;
    [(SFBLEScanner *)self->_bleNearbyActionScanner setScanStateChangedHandler:v5];
    [(SDNearbyAgent *)self _bleUpdateScanner:self->_bleNearbyActionScanner typeFlag:16];
    if (self->_bleNearbyActionRSSILog) {
      [(SFBLEScanner *)self->_bleNearbyActionScanner setRssiLog:1];
    }
    [(SFBLEScanner *)self->_bleNearbyActionScanner activateWithCompletion:&stru_1008D10B0];
  }
}

- (void)_bleNearbyActionScannerEnsureStopped
{
  if (self->_bleNearbyActionScanner
    && dword_100969808 <= 30
    && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SFBLEScanner *)self->_bleNearbyActionScanner invalidate];
  bleNearbyActionScanner = self->_bleNearbyActionScanner;
  self->_bleNearbyActionScanner = 0;

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(NSMutableDictionary *)self->_bleNearbyActionDevices allKeys];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [(NSMutableDictionary *)self->_bleNearbyActionDevices objectForKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        if (v9) {
          [(SDNearbyAgent *)self _deviceDiscoveryBLEDeviceLost:v9 type:15];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [(NSMutableDictionary *)self->_bleNearbyActionDevices removeAllObjects];
  bleNearbyActionDevices = self->_bleNearbyActionDevices;
  self->_bleNearbyActionDevices = 0;
}

- (BOOL)_bleNearbyActionScannerShouldScan
{
  if (self->_bleNearbyActionScanNever || [(NSMutableSet *)self->_bleDiagnosticModeClients count]) {
    return 0;
  }
  if (self->_bleNearbyActionScanAlways) {
    return 1;
  }
  if (!self->_ddNearbyActionEnabled) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_ddRequests;
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v5)
  {
LABEL_21:

    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v13;
LABEL_10:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v13 != v7) {
      objc_enumerationMutation(v4);
    }
    uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
    if ((objc_msgSend(v9, "discoveryFlags", (void)v12) & 0x10) == 0
      || !self->_activityScreenOn && ![v9 overrideScreenOff])
    {
      goto LABEL_19;
    }
    uint64_t v10 = [v9 deviceFilter];
    long long v11 = v10;
    if (!v10 || [v10 count]) {
      break;
    }

LABEL_19:
    if (v6 == (id)++v8)
    {
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }

  if (!self->_ddNearbyActionScreenOff && [(SDNearbyAgent *)self _idsAppleTVCount] <= 0) {
    return [(SDStatusMonitor *)self->_statusMonitor screenOn];
  }
  return 1;
}

- (void)_bleNearbyInfoAdvertiserEnsureStarted
{
  if (self->_bleNearbyInfoAdvertiser)
  {
    if (self->_bleNearbyInfoAdvertiseReasonChanged)
    {
      if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      self->_bleNearbyInfoAdvertiseReasonChanged = 0;
    }
  }
  else
  {
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = (SFBLEAdvertiser *)[objc_alloc((Class)SFBLEAdvertiser) initWithType:16];
    bleNearbyInfoAdvertiser = self->_bleNearbyInfoAdvertiser;
    self->_bleNearbyInfoAdvertiser = v3;

    dispatchQueue = self->_dispatchQueue;
    id v6 = self->_bleNearbyInfoAdvertiser;
    [(SFBLEAdvertiser *)v6 setDispatchQueue:dispatchQueue];
  }
}

- (void)_bleNearbyInfoAdvertiserEnsureStopped
{
  if (self->_bleNearbyInfoAdvertiser
    && dword_100969808 <= 30
    && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    bleNearbyInfoAdvertiseReason = self->_bleNearbyInfoAdvertiseReason;
    LogPrintF();
  }
  [(SDNearbyAgent *)self _disableEnhancedDiscovery:@"StopNearbyInfo", bleNearbyInfoAdvertiseReason];
  [(SFBLEAdvertiser *)self->_bleNearbyInfoAdvertiser invalidate];
  bleNearbyInfoAdvertiser = self->_bleNearbyInfoAdvertiser;
  self->_bleNearbyInfoAdvertiser = 0;

  self->_bleNearbyInfoAdvertised = 0;
  bleNearbyInfoAdvertiseLingerTimer = self->_bleNearbyInfoAdvertiseLingerTimer;
  if (bleNearbyInfoAdvertiseLingerTimer)
  {
    uint64_t v7 = bleNearbyInfoAdvertiseLingerTimer;
    dispatch_source_cancel(v7);
    id v5 = self->_bleNearbyInfoAdvertiseLingerTimer;
    self->_bleNearbyInfoAdvertiseLingerTimer = 0;
  }
}

- (BOOL)_bleNearbyInfoAdvertiserShouldAdvertise
{
  if (![(NSMutableSet *)self->_bleDiagnosticModeClients count])
  {
    if (self->_bleNearbyInfoAdvertiseDisabled)
    {
      CFStringRef v3 = @"_bleNearbyInfoAdvertiseDisabled";
      goto LABEL_7;
    }
    if (self->_autoUnlockActive)
    {
      CFStringRef v3 = @"_autoUnlockActive";
      goto LABEL_7;
    }
    if (self->_bleNearbyInfoAdvertiseAlways)
    {
      CFStringRef v6 = @"_bleNearbyInfoAdvertiseAlways set";
LABEL_26:
      [(SDNearbyAgent *)self _bleNearbyInfoAdvertiserUpdateAdvertiseReason:v6];
      return 1;
    }
    if (self->_bleNearbyInfoAdvertiseLingerTimer)
    {
      CFStringRef v6 = @"_bleNearbyInfoAdvertiseLingerTimer";
      goto LABEL_26;
    }
    if (self->_unlockAdvertiseAlways)
    {
      CFStringRef v6 = @"_unlockAdvertiseAlways";
      goto LABEL_26;
    }
    if (self->_unlockAdvertiseEnabled)
    {
      CFStringRef v6 = @"_unlockAdvertiseEnabled";
      goto LABEL_26;
    }
    if (self->_unlockAdvertiseWatch)
    {
      CFStringRef v6 = @"_unlockAdvertiseWatch";
      goto LABEL_26;
    }
    if (self->_unlockAdvertiseWatchLocked)
    {
      CFStringRef v6 = @"_unlockAdvertiseWatchLocked";
      goto LABEL_26;
    }
    if ((self->_familyFlags & 2) != 0)
    {
      CFStringRef v6 = @"familyFlags set";
      goto LABEL_26;
    }
    int DeviceClass = GestaltGetDeviceClass();
    if (DeviceClass == 7 || DeviceClass == 4)
    {
      CFStringRef v6 = @"device is communal";
      goto LABEL_26;
    }
    unsigned int v8 = [(SDStatusMonitor *)self->_statusMonitor screenOn];
    unsigned __int8 v9 = [(CUBluetoothClient *)self->_btConnectedDeviceMonitor statusFlags];
    if (v8 && (v9 & 8) != 0)
    {
      CFStringRef v6 = @"ShareAudio is ongoing while screen on";
      goto LABEL_26;
    }
    if (![(SDNearbyAgent *)self idsIsSignedIn])
    {
      CFStringRef v3 = @"Not signed into iCloud";
      goto LABEL_7;
    }
    if ([(SDStatusMonitor *)self->_statusMonitor iCloudSharedPhotoLibraryEnabled])
    {
      CFStringRef v6 = @"Shared iCloud Photo Library is enabled";
      goto LABEL_26;
    }
    if (self->_coreDeviceEnabled)
    {
      uint64_t v10 = +[SDStatusMonitor sharedMonitor];
      unsigned int v11 = [v10 supportsXcodePairing];

      if (v11)
      {
        CFStringRef v6 = @"CoreDeviceEnabled";
        goto LABEL_26;
      }
    }
    if (self->_fitnessPairingEnabled)
    {
      long long v12 = +[SDStatusMonitor sharedMonitor];
      unsigned int v13 = [v12 supportsFitnessPlusPairing];

      if (v13)
      {
        CFStringRef v6 = @"FitnessPairingEnabled";
        goto LABEL_26;
      }
    }
    if (self->_sessionPairingEnabled)
    {
      CFStringRef v6 = @"SessionPairingEnabled";
      goto LABEL_26;
    }
    if ([(SDNearbyAgent *)self _idsShouldAdvertiseNearbyInfo])
    {
      CFStringRef v6 = @"Same account devices";
      goto LABEL_26;
    }
    if (v8)
    {
      CFStringRef v6 = @"Screen on";
      goto LABEL_26;
    }
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    uint64_t v17 = 0;
    int v18 = &v17;
    uint64_t v19 = 0x3032000000;
    char v20 = sub_100211650;
    int v21 = sub_100211660;
    id v22 = 0;
    services = self->_services;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100211668;
    v16[3] = &unk_1008D10D8;
    v16[4] = &v17;
    v16[5] = &v23;
    [(NSMutableDictionary *)services enumerateKeysAndObjectsUsingBlock:v16];
    if (*((unsigned char *)v24 + 24))
    {
      long long v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SFServiceType %s active", sub_1002116EC((int)[(id)v18[5] serviceType]));
      [(SDNearbyAgent *)self _bleNearbyInfoAdvertiserUpdateAdvertiseReason:v15];
    }
    else
    {
      if (!self->_caEnabled
        || !self->_activityUserActive
        || !self->_caSingleDevice && [(SDNearbyAgent *)self _idsContinuityDeviceCount] < 1)
      {
        [(SDNearbyAgent *)self _bleNearbyInfoAdvertiserUpdateAdvertiseReason:@"Don't advertise by default"];
        BOOL v4 = 0;
        goto LABEL_55;
      }
      [(SDNearbyAgent *)self _bleNearbyInfoAdvertiserUpdateAdvertiseReason:@"caEnabled"];
    }
    BOOL v4 = 1;
LABEL_55:
    _Block_object_dispose(&v17, 8);

    _Block_object_dispose(&v23, 8);
    return v4;
  }
  CFStringRef v3 = @"_bleDiagnosticModeClients.count > 0";
LABEL_7:
  [(SDNearbyAgent *)self _bleNearbyInfoAdvertiserUpdateAdvertiseReason:v3];
  return 0;
}

- (void)_bleNearbyInfoAdvertiserUpdate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_bleNearbyInfoAdvertiser) {
    return;
  }
  if (dword_100969808 <= 9 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  CFStringRef v3 = +[NSMutableDictionary dictionary];
  uint64_t v4 = [(SDNearbyAgent *)self _activityMonitorCurrentLevelAndNeedsPoll:0 recentUserActivity:0];
  if ([(SDNearbyAgent *)self _idsShouldEncryptActivityLevel] >= 1) {
    uint64_t v4 = [(SDNearbyAgent *)self _bleEncryptActivityLevel:v4];
  }
  id v5 = +[NSNumber numberWithUnsignedChar:v4];
  [v3 setObject:v5 forKeyedSubscript:@"al"];

  if ([(SDStatusMonitor *)self->_statusMonitor screenStateSupportsAirDrop]
    && [(SDStatusMonitor *)self->_statusMonitor currentConsoleUser]
    && [(SDStatusMonitor *)self->_statusMonitor discoverableLevel]
    && [(SDStatusMonitor *)self->_statusMonitor wirelessEnabled]
    && ![(SDStatusMonitor *)self->_statusMonitor isWifiPersonalHotspot])
  {
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"adU"];
    self->_bleNearbyInfoAirDropUsable = 1;
  }
  else
  {
    if (self->_bleNearbyInfoAirDropUsable) {
      [(SDNearbyAgent *)self _bleNearbyInfoAdvertiserLingerStart:@"AirDropUsable"];
    }
    self->_bleNearbyInfoAirDropUsable = 0;
  }
  [(SDNearbyAgent *)self _bleNearbyInfoAdvertiserUpdateAddAudioRoutingScore:v3];
  if (!self->_bleNearbyActionAdvertiseActive)
  {
    [(SDNearbyAgent *)self _bleUpdateAuthTagIfNeeded];
    bleAuthTagOverride = self->_bleAuthTagOverride;
    if (bleAuthTagOverride || (bleAuthTagOverride = self->_bleAuthTag) != 0) {
      [v3 setObject:bleAuthTagOverride forKeyedSubscript:@"at"];
    }
  }
  [(SDNearbyAgent *)self _bleNearbyInfoAdvertisingUpdateAddCameraState:v3];
  if (self->_shareAudioEnabled
    && [(SDStatusMonitor *)self->_statusMonitor screenOn]
    && ([(CUBluetoothClient *)self->_btConnectedDeviceMonitor statusFlags] & 8) != 0
    && [(SDNearbyAgent *)self _bleNearbyInfoAdvertiserShouldAddField3])
  {
    uint64_t v7 = +[NSNumber numberWithUnsignedInt:2048];
    [v3 setObject:v7 forKeyedSubscript:@"df"];
  }
  if (self->_enhancedDiscoveryAdvActive) {
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"enD"];
  }
  [(SDNearbyAgent *)self _bleNearbyInfoAdvertiserUpdateAddHotspotInfo:v3];
  unsigned int v8 = [(SDNearbyAgent *)self _idsBluetoothDeviceIDsForLEPipe];
  id v9 = [(SFBLEAdvertiser *)self->_bleNearbyInfoAdvertiser lePipeDevices];
  id v10 = v8;
  unsigned int v11 = v10;
  if (v9 == v10)
  {

    goto LABEL_34;
  }
  if ((v10 != 0) == (v9 == 0))
  {

    goto LABEL_33;
  }
  unsigned __int8 v12 = [v9 isEqual:v10];

  if ((v12 & 1) == 0) {
LABEL_33:
  }
    [(SFBLEAdvertiser *)self->_bleNearbyInfoAdvertiser setLePipeDevices:v11];
LABEL_34:
  BOOL v46 = v11;
  if (self->_inDiscoverySession) {
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"iLagS"];
  }
  id v47 = v3;
  BOOL unlockAdvertiseEnabled = self->_unlockAdvertiseEnabled;
  BOOL unlockAdvertiseWatch = self->_unlockAdvertiseWatch;
  BOOL unlockAdvertiseWatchLocked = self->_unlockAdvertiseWatchLocked;
  int v16 = byte_1009942CD;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v17 = self->_services;
  id v18 = [(NSMutableDictionary *)v17 countByEnumeratingWithState:&v49 objects:v53 count:16];
  int v19 = unlockAdvertiseEnabled;
  int v20 = unlockAdvertiseWatch;
  int v48 = unlockAdvertiseWatchLocked;
  int v21 = v16 != 0;
  if (v18)
  {
    id v22 = v18;
    uint64_t v23 = 0;
    uint64_t v24 = *(void *)v50;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v50 != v24) {
          objc_enumerationMutation(v17);
        }
        char v26 = [(NSMutableDictionary *)self->_services objectForKeyedSubscript:*(void *)(*((void *)&v49 + 1) + 8 * i)];
        if (([v26 needsAWDL] & 1) == 0
          && ([v26 needsKeyboard] & 1) == 0
          && ([v26 needsSetup] & 1) == 0)
        {
          if ((uint64_t)[v26 advertiseRate] > v23) {
            uint64_t v23 = (uint64_t)[v26 advertiseRate];
          }
          v19 |= [v26 autoUnlockEnabled];
          v20 |= [v26 autoUnlockWatch];
          v21 |= [v26 duetSync];
          v48 |= [v26 watchLocked];
        }
      }
      id v22 = [(NSMutableDictionary *)v17 countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v22);
  }
  else
  {
    uint64_t v23 = 0;
  }

  uint64_t v27 = v47;
  if (v19) {
    [v47 setObject:&__kCFBooleanTrue forKeyedSubscript:@"ue"];
  }
  if (v20) {
    [v47 setObject:&__kCFBooleanTrue forKeyedSubscript:@"uw"];
  }
  if (v48) {
    [v47 setObject:&__kCFBooleanTrue forKeyedSubscript:@"wl"];
  }
  if (v21) {
    [v47 setObject:&__kCFBooleanTrue forKeyedSubscript:@"ds"];
  }
  if ([(CUSystemMonitor *)self->_systemMonitor meDeviceIsMe]) {
    [v47 setObject:&__kCFBooleanTrue forKeyedSubscript:@"meD"];
  }
  if (self->_bleNearbyInfoWiFiP2P)
  {
    unsigned int v28 = [(CUSystemMonitor *)self->_systemMonitor manateeAvailable];
    int v29 = [(CUSystemMonitor *)self->_systemMonitor wifiState];
    unsigned int v30 = [(CUSystemMonitor *)self->_systemMonitor wifiFlags];
    if (_os_feature_enabled_impl())
    {
      if (dword_100969808 <= 30)
      {
        uint64_t v27 = v47;
        if (dword_100969808 != -1 || _LogCategory_Initialize()) {
          LogPrintF();
        }
        int v31 = 0;
        if (!v29) {
          goto LABEL_79;
        }
        goto LABEL_72;
      }
      int v31 = 0;
    }
    else
    {
      int v31 = (v30 >> 5) & 1;
    }
    uint64_t v27 = v47;
    if (!v29) {
      goto LABEL_79;
    }
LABEL_72:
    if (v29 != 10 && (v31 & 1) == 0)
    {
      unsigned int v32 = self->_bleNearbyActionScanner ? v28 : 0;
      if (v32 == 1)
      {
        [v27 setObject:&__kCFBooleanTrue forKeyedSubscript:@"wp"];
        goto LABEL_106;
      }
    }
LABEL_79:
    if (dword_100969808 > 20 || dword_100969808 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_106;
    }
    if (v29 <= 19)
    {
      if (!v29)
      {
        BOOL v33 = "Unknown";
        goto LABEL_96;
      }
      if (v29 == 10)
      {
        BOOL v33 = "Off";
        goto LABEL_96;
      }
    }
    else
    {
      switch(v29)
      {
        case 20:
          BOOL v33 = "NotConnected";
          goto LABEL_96;
        case 30:
          BOOL v33 = "Connecting";
          goto LABEL_96;
        case 40:
          BOOL v33 = "Connected";
LABEL_96:
          if (v31) {
            CFStringRef v34 = @"YES";
          }
          else {
            CFStringRef v34 = @"NO";
          }
          if (self->_bleNearbyActionScanner) {
            v35 = "on";
          }
          else {
            v35 = "off";
          }
          if ([(CUSystemMonitor *)self->_systemMonitor manateeAvailable]) {
            CFStringRef v36 = @"YES";
          }
          else {
            CFStringRef v36 = @"NO";
          }
          double v44 = v35;
          CFStringRef v45 = v36;
          id v41 = v33;
          CFStringRef v43 = v34;
          LogPrintF();
          goto LABEL_106;
      }
    }
    BOOL v33 = "?";
    goto LABEL_96;
  }
LABEL_106:
  if (GestaltGetBoolean()) {
    [v27 setObject:&__kCFBooleanTrue forKeyedSubscript:@"rgC"];
  }
  if (v23 <= 59 && self->_unlockAdvertiseAggressive || v23 <= 59 && self->_enhancedDiscoveryShouldRun)
  {
    uint64_t v23 = 60;
  }
  else
  {
    if (v23 > 39 || self->_cameraState != 1)
    {
      if (self->_unlockAdvertiseBackground)
      {
        unsigned __int8 v37 = v46;
        if (v23 <= 29)
        {
          uint64_t v40 = daemon_log();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
            sub_10022E824(v40);
          }

          uint64_t v23 = 30;
        }
        goto LABEL_114;
      }
      if ((v19 | v20))
      {
        unsigned __int8 v37 = v46;
        if (v23 > 39) {
          goto LABEL_114;
        }
      }
      else
      {
        unsigned __int8 v37 = v46;
        if (((v23 < 40) & v48) == 0)
        {
          if (!v23) {
            uint64_t v23 = 30;
          }
          goto LABEL_114;
        }
      }
      uint64_t v23 = 40;
      goto LABEL_114;
    }
    uint64_t v23 = 40;
  }
  unsigned __int8 v37 = v46;
LABEL_114:
  if (self->_boostNearbyInfo && v23 < 50) {
    uint64_t v39 = 50;
  }
  else {
    uint64_t v39 = v23;
  }
  if ((id)v39 != [(SFBLEAdvertiser *)self->_bleNearbyInfoAdvertiser advertiseRate]) {
    [(SFBLEAdvertiser *)self->_bleNearbyInfoAdvertiser setAdvertiseRate:v39];
  }
  [(SFBLEAdvertiser *)self->_bleNearbyInfoAdvertiser setPayloadFields:v27];
  if (!self->_bleNearbyInfoAdvertised)
  {
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v42 = v27;
      LogPrintF();
    }
    self->_bleNearbyInfoAdvertised = 1;
    -[SFBLEAdvertiser activateWithCompletion:](self->_bleNearbyInfoAdvertiser, "activateWithCompletion:", &stru_1008D10F8, v42);
  }
}

- (void)_bleNearbyInfoAdvertiserUpdateAdvertiseReason:(id)a3
{
  id v5 = (NSString *)a3;
  if (self->_bleNearbyInfoAdvertiseReason != v5)
  {
    self->_bleNearbyInfoAdvertiseReasonChanged = 1;
    CFStringRef v6 = v5;
    objc_storeStrong((id *)&self->_bleNearbyInfoAdvertiseReason, a3);
    id v5 = v6;
  }
}

- (BOOL)_bleNearbyInfoAdvertiserShouldAddField3
{
  CFStringRef v3 = +[SDActivityAdvertiser sharedAdvertiser];
  if ([v3 isAdvertising])
  {
    bleNearbyActionAdvertiser = self->_bleNearbyActionAdvertiser;

    if (bleNearbyActionAdvertiser) {
      return 0;
    }
  }
  else
  {
  }
  return 1;
}

- (void)_bleNearbyInfoAdvertiserUpdateAddAudioRoutingScore:(id)a3
{
  id v4 = a3;
  unsigned int audioRoutingScore = self->_audioRoutingScore;
  if (audioRoutingScore)
  {
    if ([(SDNearbyAgent *)self _bleNearbyInfoAdvertiserShouldAddField3])
    {
      p_bleAudioRoutingScoreEncryptedData = &self->_bleAudioRoutingScoreEncryptedData;
      uint64_t v7 = self->_bleAudioRoutingScoreEncryptedData;
      if (v7)
      {
LABEL_4:
        [v4 setObject:v7 forKeyedSubscript:@"ars" inDictionary:v12 atIndex:v13];

        goto LABEL_17;
      }
      unsigned int v8 = [(RPIdentity *)self->_idSelfIdentity deviceIRKData];
      if ([v8 length])
      {
        [(SDNearbyAgent *)self _bleUpdateAuthTagIfNeeded];
        id v9 = self->_bleAuthTag;
        if ([(NSData *)v9 length])
        {
          memset(v15, 0, sizeof(v15));
          id v10 = v8;
          [v10 bytes];
          [v10 length];
          unsigned int v11 = v9;
          [(NSData *)v11 bytes];
          [(NSData *)v11 length];
          CryptoHKDF();
          char v14 = audioRoutingScore & 7;
          ccchacha20();
          uint64_t v7 = (NSData *)+[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", &v14, 1, v15);
          objc_storeStrong((id *)p_bleAudioRoutingScoreEncryptedData, v7);
          if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
          {
            unsigned __int8 v12 = sub_10020A3B8(audioRoutingScore);
            unsigned int v13 = v7;
            LogPrintF();
          }

          goto LABEL_4;
        }
      }
      goto LABEL_17;
    }
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
LABEL_17:
}

- (void)_bleNearbyInfoAdvertiserUpdateAddHotspotInfo:(id)a3
{
  id v4 = a3;
  uint64_t hotspotInfo = self->_hotspotInfo;
  if (!hotspotInfo) {
    goto LABEL_17;
  }
  CFStringRef v6 = +[SDActivityAdvertiser sharedAdvertiser];
  unsigned int v7 = [v6 isAdvertising];

  if (!v7)
  {
    p_bleHotspotEncryptedData = &self->_bleHotspotEncryptedData;
    id v9 = self->_bleHotspotEncryptedData;
    if (v9)
    {
LABEL_7:
      [v4 setObject:v9 forKeyedSubscript:@"hsi" atIndex:v14];

      goto LABEL_17;
    }
    id v10 = [(RPIdentity *)self->_idSelfIdentity deviceIRKData];
    if ([v10 length])
    {
      [(SDNearbyAgent *)self _bleUpdateAuthTagIfNeeded];
      unsigned int v11 = self->_bleAuthTag;
      if ([(NSData *)v11 length])
      {
        memset(v17, 0, sizeof(v17));
        id v12 = v10;
        [v12 bytes];
        [v12 length];
        unsigned int v13 = v11;
        [(NSData *)v13 bytes];
        [(NSData *)v13 length];
        CryptoHKDF();
        char v16 = hotspotInfo;
        ccchacha20();
        id v9 = (NSData *)+[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", &v16, 1, v17);
        objc_storeStrong((id *)p_bleHotspotEncryptedData, v9);
        if (dword_100969808 <= 20 && (dword_100969808 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v14 = hotspotInfo;
          long long v15 = v9;
          LogPrintF();
        }

        goto LABEL_7;
      }
    }
    goto LABEL_17;
  }
  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_17:
}

- (void)_bleNearbyInfoAdvertisingUpdateAddCameraState:(id)a3
{
  if (self->_cameraState == 1) {
    [a3 setObject:&off_100903060 forKeyedSubscript:@"camS"];
  }
}

- (unsigned)_bleEncryptActivityLevel:(unsigned __int8)a3
{
  id v5 = [(RPIdentity *)self->_idSelfIdentity deviceIRKData];
  if (![v5 length])
  {
    if (dword_100969808 > 30 || dword_100969808 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_14;
    }
LABEL_11:
    LogPrintF();
    goto LABEL_14;
  }
  [(SDNearbyAgent *)self _bleUpdateAuthTagIfNeeded];
  if (![(NSData *)self->_bleAuthTag length])
  {
    if (dword_100969808 > 30 || dword_100969808 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  id v6 = v5;
  [v6 bytes];
  [v6 length];
  [(NSData *)self->_bleAuthTag bytes];
  [(NSData *)self->_bleAuthTag length];
  CryptoHKDF();
  ccchacha20();
  unsigned __int8 v7 = a3 & 0xF;
  if (dword_100969808 <= 20)
  {
    if (dword_100969808 != -1 || (v8 = _LogCategory_Initialize(), unsigned __int8 v7 = a3 & 0xF, v8))
    {
      LogPrintF();
      unsigned __int8 v7 = a3 & 0xF;
    }
  }
  a3 = v7;
LABEL_14:

  return a3;
}

- (BOOL)_bleNearbyInfoAdvertiserLingerIfNeeded
{
  BOOL bleNearbyInfoAirDropUsable = self->_bleNearbyInfoAirDropUsable;
  if (self->_bleNearbyInfoAirDropUsable)
  {
    self->_BOOL bleNearbyInfoAirDropUsable = 0;
    [(SDNearbyAgent *)self _bleNearbyInfoAdvertiserLingerStart:@"AirDropUsable"];
  }
  return bleNearbyInfoAirDropUsable;
}

- (void)_bleNearbyInfoAdvertiserLingerStart:(id)a3
{
  id v4 = a3;
  if (self->_bleNearbyInfoAdvertiseLingerSecs > 0.0)
  {
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    bleNearbyInfoAdvertiseLingerTimer = self->_bleNearbyInfoAdvertiseLingerTimer;
    if (bleNearbyInfoAdvertiseLingerTimer)
    {
      id v6 = bleNearbyInfoAdvertiseLingerTimer;
      dispatch_source_cancel(v6);
      unsigned __int8 v7 = self->_bleNearbyInfoAdvertiseLingerTimer;
      self->_bleNearbyInfoAdvertiseLingerTimer = 0;
    }
    int v8 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    id v9 = self->_bleNearbyInfoAdvertiseLingerTimer;
    self->_bleNearbyInfoAdvertiseLingerTimer = v8;
    id v10 = v8;

    CUDispatchTimerSet();
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100212C7C;
    handler[3] = &unk_1008CAF18;
    handler[4] = v10;
    void handler[5] = self;
    id v12 = v4;
    dispatch_source_set_event_handler(v10, handler);
    dispatch_activate(v10);
  }
}

- (void)_bleNearbyInfoReceivedData:(id)a3 cnx:(id)a4 peer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v38 = v8;
  unsigned int v11 = (unsigned __int8 *)[v38 bytes];
  id v12 = (char *)[v38 length];
  if ((uint64_t)v12 <= 0)
  {
    if (dword_100969808 <= 50)
    {
      if (dword_100969808 != -1 || _LogCategory_Initialize()) {
LABEL_65:
      }
        LogPrintF();
LABEL_69:
      if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
LABEL_37:
      }
        LogPrintF();
    }
  }
  else
  {
    uint64_t v14 = v11 + 1;
    unsigned int v13 = (const char *)*v11;
    int v15 = 1;
    int v16 = 1;
    switch(*v11)
    {
      case 1u:
        if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
          goto LABEL_37;
        }
        break;
      case 2u:
        if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize()))
        {
          CFStringRef v34 = (const char *)v38;
          LogPrintF();
        }
        BOOL v33 = +[NSMutableData dataWithData:](NSMutableData, "dataWithData:", v38, v34);
        if (!v33) {
          goto LABEL_69;
        }
        id v28 = v33;
        *(unsigned char *)[v28 mutableBytes] = 3;
        [v9 sendData:v28 completion:0];
        goto LABEL_54;
      case 3u:
        if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
          goto LABEL_37;
        }
        break;
      case 5u:
      case 6u:
      case 0x10u:
      case 0x11u:
      case 0x12u:
      case 0x13u:
      case 0x14u:
      case 0x1Cu:
      case 0x1Du:
        goto LABEL_5;
      case 7u:
        id v22 = [v38 subdataWithRange:1, (char *)[v38 length] - 1];
        uint64_t v23 = [v9 peerDevice];
        [(SDNearbyAgent *)self _unlockReceivedFrameData:v22 peer:v10 device:v23];

        break;
      case 8u:
      case 9u:
      case 0xAu:
        int v19 = &v12[(void)v11];
        if (dword_100969808 <= 20 && (dword_100969808 != -1 || _LogCategory_Initialize()))
        {
          CFStringRef v34 = v13;
          v35 = (const char *)[v38 length];
          LogPrintF();
        }
        if (-[SDNearbyAgent _bleNearbyInfoReceivedFrameType:src:end:cnx:](self, "_bleNearbyInfoReceivedFrameType:src:end:cnx:", v13, v14, v19, v9, v34, v35))
        {
          goto LABEL_69;
        }
        break;
      case 0xBu:
        remoteAppServiceUUID = self->_remoteAppServiceUUID;
        if (!remoteAppServiceUUID)
        {
          uint64_t v25 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDBytes:&unk_10076E645];
          char v26 = self->_remoteAppServiceUUID;
          self->_remoteAppServiceUUID = v25;

          remoteAppServiceUUID = self->_remoteAppServiceUUID;
        }
        uint64_t v27 = [(NSMutableDictionary *)self->_services objectForKeyedSubscript:remoteAppServiceUUID];
        id v28 = v27;
        if (v27)
        {
          int v29 = [v27 eventMessageHandler];

          if (v29)
          {
            id v30 = objc_alloc_init((Class)SFEventMessage);
            int v31 = [v38 subdataWithRange:1, [v38 length] - 1];
            [v30 setBodyData:v31];

            unsigned int v32 = [v28 eventMessageHandler];
            ((void (**)(void, id))v32)[2](v32, v30);

            goto LABEL_54;
          }
          if (dword_100969808 <= 90 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
            goto LABEL_78;
          }
        }
        else if (dword_100969808 <= 90 && (dword_100969808 != -1 || _LogCategory_Initialize()))
        {
LABEL_78:
          LogPrintF();
        }
LABEL_54:

        break;
      case 0x15u:
      case 0x17u:
      case 0x40u:
      case 0x41u:
        int v16 = 0;
        goto LABEL_5;
      case 0x16u:
      case 0x18u:
      case 0x1Eu:
      case 0x30u:
      case 0x31u:
        int v15 = 0;
LABEL_5:
        if ((unint64_t)v12 > 1)
        {
          uint64_t v17 = *v14;
          if (dword_100969808 <= 20 && (dword_100969808 != -1 || _LogCategory_Initialize()))
          {
            if ((v13 - 5) > 0x3C) {
              id v18 = "?";
            }
            else {
              id v18 = off_1008D1558[(char)((_BYTE)v13 - 5)];
            }
            int v20 = sub_1002116EC(v17);
            CFStringRef v36 = (char *)[v38 length] - 2;
            id v37 = v10;
            CFStringRef v34 = v18;
            v35 = v20;
            LogPrintF();
          }
          int v21 = [v38 subdataWithRange:2, (char *)[v38 length:v34, v35, v36, v37] - 2];
          if (v15) {
            [(SDNearbyAgent *)self serviceReceivedFrameType:v13 serviceType:v17 data:v21 peer:v10];
          }
          if (v16) {
            [(SDNearbyAgent *)self sessionReceivedFrameType:v13 serviceType:v17 data:v21 peer:v10];
          }

          break;
        }
        if (dword_100969808 > 50) {
          break;
        }
        if (dword_100969808 != -1 || _LogCategory_Initialize())
        {
          sub_100213568(v13);
          goto LABEL_65;
        }
        goto LABEL_69;
      case 0x20u:
        [(SDNearbyAgent *)self _setupHandleCreateSession:v9 data:v38];
        break;
      case 0x21u:
        [(SDNearbyAgent *)self _setupHandleSessionCreated:v9 data:v38];
        break;
      case 0x22u:
      case 0x23u:
      case 0x24u:
        [(SDNearbyAgent *)self _setupHandleSessionEncryptedFrame:v38 type:*v11 cnx:v9];
        break;
      default:
        if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
          goto LABEL_37;
        }
        break;
    }
  }
}

- (int)_bleNearbyInfoReceivedFrameType:(unsigned __int8)a3 src:(const char *)a4 end:(const char *)a5 cnx:(id)a6
{
  uint64_t v8 = a3;
  uint64_t v75 = a4;
  id v69 = a6;
  int v74 = 0;
  p_inst_meths = &OBJC_PROTOCOL___NSNetServiceBrowserDelegate.inst_meths;
  if (a5 - a4 <= 15)
  {
    int v74 = -6750;
    if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v37 = 0;
    goto LABEL_97;
  }
  id v67 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:a4];
  uint64_t v75 = a4 + 16;
  if (a5 - (a4 + 16) <= 15)
  {
    int v74 = -6750;
    if (dword_100969808 > 50)
    {
      uint64_t v23 = 0;
      id v68 = 0;
      unsigned int v11 = 0;
      uint64_t v64 = 0;
      int v15 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      id v38 = 0;
      int v21 = 0;
      goto LABEL_94;
    }
    id v37 = v67;
    if (dword_100969808 != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
LABEL_97:
    uint64_t v23 = 0;
    id v68 = 0;
    unsigned int v11 = 0;
    uint64_t v64 = 0;
    int v15 = 0;
    unsigned int v13 = 0;
    uint64_t v14 = 0;
    id v38 = 0;
    int v21 = 0;
    goto LABEL_71;
  }
  id v68 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:a4 + 16];
  uint64_t v75 = a4 + 32;
  unsigned int v11 = (void *)CFBinaryPlistStreamedCreateWithBytesEx2();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v23 = 0;
    uint64_t v64 = 0;
LABEL_92:
    int v15 = 0;
    unsigned int v13 = 0;
    uint64_t v14 = 0;
    id v38 = 0;
    int v21 = 0;
    int v74 = -6756;
LABEL_94:
    id v37 = v67;
    goto LABEL_71;
  }
  uint64_t v64 = (void *)CFBinaryPlistStreamedCreateWithBytesEx2();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v23 = 0;
    goto LABEL_92;
  }
  switch(v8)
  {
    case 0xA:
      id v12 = objc_alloc_init((Class)SFResponseMessage);
      int v15 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = v12;
      break;
    case 9:
      id v12 = objc_alloc_init((Class)SFRequestMessage);
      int v15 = 0;
      uint64_t v14 = 0;
      unsigned int v13 = v12;
      break;
    case 8:
      id v12 = objc_alloc_init((Class)SFEventMessage);
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      int v15 = v12;
      break;
    default:
      v57 = (SDNearbyAgent *)FatalErrorF();
      return [(SDNearbyAgent *)v57 bleNearbyInfoStartConnectionToDevice:v59 owner:v60 connected:v61];
  }
  id v16 = v12;
  [v16 setIdentifier:v68];
  v66 = v11;
  [v16 setHeaderFields:v11];
  [v16 setBodyData:v64];
  id v17 = objc_alloc_init((Class)SFDevice);
  id v18 = [v69 peerDevice];
  int v19 = [v18 identifier];
  [v17 setIdentifier:v19];

  id v65 = v16;
  int v20 = v16;
  int v21 = v17;
  [v20 setPeerDevice:v17];
  uint64_t v22 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v67];
  if (!v22)
  {
    uint64_t v24 = [v67 UUIDString];
    unsigned int v25 = [v24 isEqual:@"00000000-0000-0000-0000-000000000000"];

    if (v25)
    {
      id v63 = v17;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      char v26 = self->_sessions;
      id v27 = [(NSMutableDictionary *)v26 countByEnumeratingWithState:&v70 objects:v76 count:16];
      if (!v27)
      {
        uint64_t v23 = 0;
        goto LABEL_52;
      }
      id v28 = v27;
      uint64_t v23 = 0;
      uint64_t v29 = *(void *)v71;
      while (1)
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          int v31 = v23;
          if (*(void *)v71 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v23 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:*(void *)(*((void *)&v70 + 1) + 8 * i)];

          if (v15)
          {
            unsigned int v32 = [v23 eventMessageHandler];

            if (v32)
            {
              BOOL v33 = [v23 eventMessageHandler];
              CFStringRef v34 = (void (*)(void))v33[2];
LABEL_30:
              v34();

              continue;
            }
          }
          if (v13)
          {
            v35 = [v23 requestMessageHandler];

            if (v35)
            {
              BOOL v33 = [v23 requestMessageHandler];
              CFStringRef v34 = (void (*)(void))v33[2];
              goto LABEL_30;
            }
          }
          if (v14)
          {
            CFStringRef v36 = [v23 responseMessageInternalHandler];

            if (v36)
            {
              BOOL v33 = [v23 responseMessageInternalHandler];
              CFStringRef v34 = (void (*)(void))v33[2];
              goto LABEL_30;
            }
          }
        }
        id v28 = [(NSMutableDictionary *)v26 countByEnumeratingWithState:&v70 objects:v76 count:16];
        if (!v28)
        {
LABEL_52:

          unsigned int v11 = v66;
          id v37 = v67;
          p_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSNetServiceBrowserDelegate + 24);
          id v38 = v65;
          int v21 = v63;
          goto LABEL_71;
        }
      }
    }
    if (dword_100969808 <= 20 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v62 = v8;
      LogPrintF();
    }
    unsigned int v11 = v66;
    CFStringRef v43 = [v66 objectForKeyedSubscript:@"_serviceUUID" v62];
    if (v43)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v43 length] == (id)16)
        {
          id v44 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:[v43 bytes]];
          if (v44)
          {
            CFStringRef v45 = [(NSMutableDictionary *)self->_services objectForKeyedSubscript:v44];
            BOOL v46 = v45;
            id v37 = v67;
            p_inst_meths = &OBJC_PROTOCOL___NSNetServiceBrowserDelegate.inst_meths;
            if (!v45)
            {
              int v74 = -6720;
              goto LABEL_70;
            }
            if (v15
              && ([v45 eventMessageHandler],
                  id v47 = objc_claimAutoreleasedReturnValue(),
                  v47,
                  v47))
            {
              int v48 = [v46 eventMessageHandler];
              long long v49 = (void (*)(void))v48[2];
            }
            else if (v13 {
                   && ([v46 requestMessageHandler],
            }
                       long long v50 = objc_claimAutoreleasedReturnValue(),
                       v50,
                       v50))
            {
              int v48 = [v46 requestMessageHandler];
              long long v49 = (void (*)(void))v48[2];
            }
            else
            {
              if (!v14
                || ([v46 responseMessageInternalHandler],
                    long long v51 = objc_claimAutoreleasedReturnValue(),
                    v51,
                    !v51))
              {
                if (dword_100969808 <= 50)
                {
                  unsigned int v11 = v66;
                  if (dword_100969808 != -1 || _LogCategory_Initialize()) {
                    LogPrintF();
                  }
                  goto LABEL_70;
                }
                goto LABEL_69;
              }
              int v48 = [v46 responseMessageInternalHandler];
              long long v49 = (void (*)(void))v48[2];
            }
            v49();

LABEL_69:
            unsigned int v11 = v66;
LABEL_70:

            uint64_t v23 = 0;
            id v38 = v65;
            goto LABEL_71;
          }
          BOOL v46 = 0;
          int v56 = -6700;
        }
        else
        {
          id v44 = 0;
          BOOL v46 = 0;
          int v56 = -6743;
        }
      }
      else
      {
        id v44 = 0;
        BOOL v46 = 0;
        int v56 = -6756;
      }
    }
    else
    {
      id v44 = 0;
      BOOL v46 = 0;
      int v56 = -6727;
    }
    int v74 = v56;
    id v37 = v67;
    p_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSNetServiceBrowserDelegate + 24);
    goto LABEL_70;
  }
  uint64_t v23 = (void *)v22;
  p_inst_meths = &OBJC_PROTOCOL___NSNetServiceBrowserDelegate.inst_meths;
  if (dword_100969808 <= 20 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  unsigned int v11 = v66;
  id v37 = v67;
  id v38 = v65;
  if (v15
    && ([v23 eventMessageHandler],
        uint64_t v39 = objc_claimAutoreleasedReturnValue(),
        v39,
        v39))
  {
    uint64_t v40 = [v23 eventMessageHandler];
    v40[2](v40);
  }
  else if (v13 {
         && ([v23 requestMessageHandler],
  }
             id v41 = objc_claimAutoreleasedReturnValue(),
             v41,
             v41))
  {
    uint64_t v40 = [v23 requestMessageHandler];
    v40[2](v40);
  }
  else
  {
    if (!v14
      || ([v23 responseMessageInternalHandler],
          uint64_t v42 = objc_claimAutoreleasedReturnValue(),
          v42,
          !v42))
    {
      if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      goto LABEL_71;
    }
    uint64_t v40 = [v23 responseMessageInternalHandler];
    v40[2](v40);
  }

LABEL_71:
  int v52 = v74;
  if (v74)
  {
    int v53 = *((_DWORD *)p_inst_meths + 514);
    if (v53 <= 50)
    {
      if (v53 != -1 || (int v54 = _LogCategory_Initialize(), v52 = v74, v54))
      {
        LogPrintF();
        int v52 = v74;
      }
    }
  }

  return v52;
}

- (int)bleNearbyInfoStartConnectionToDevice:(id)a3 owner:(id)a4 connected:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v10 = [(NSMutableDictionary *)self->_bleConnections objectForKeyedSubscript:v8];
  if (v10)
  {
    id v11 = (id)v10;
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      id v12 = (objc_class *)objc_opt_class();
      int v19 = NSStringFromClass(v12);
      LogPrintF();
    }
    [v11 addClient:v9, v19];
    [v11 setAcceptor:0];
    if (a5) {
      *a5 = [v11 connectionState] == (id)1;
    }
  }
  else
  {
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      unsigned int v13 = (objc_class *)objc_opt_class();
      int v19 = NSStringFromClass(v13);
      LogPrintF();
    }
    id v14 = objc_alloc_init((Class)SFBLEDevice);
    [v14 setIdentifier:v8];
    [v14 setUseBTPipe:0];
    id v11 = [objc_alloc((Class)SFBLEConnection) initWithDevice:v14 acceptor:0];
    [v11 setDispatchQueue:self->_dispatchQueue];
    bleConnections = self->_bleConnections;
    if (!bleConnections)
    {
      id v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      id v17 = self->_bleConnections;
      self->_bleConnections = v16;

      bleConnections = self->_bleConnections;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](bleConnections, "setObject:forKeyedSubscript:", v11, v8, v19);
    [v11 addClient:v9];
    [v11 activateDirect];
    if (a5) {
      *a5 = 0;
    }
  }
  return 0;
}

- (void)bleNearbyInfoStopConnectionToDevice:(id)a3 owner:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  unsigned __int8 v7 = [(NSMutableDictionary *)self->_bleConnections objectForKeyedSubscript:v11];
  id v8 = v7;
  if (v7 && ([v7 removeClient:v6] & 1) == 0)
  {
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      id v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      LogPrintF();
    }
    -[NSMutableDictionary removeObjectForKey:](self->_bleConnections, "removeObjectForKey:", v11, v10);
    [v8 invalidate];
  }
}

- (int)bleNearbyInfoSendFrameType:(unsigned __int8)a3 serviceType:(unsigned __int8)a4 data:(id)a5 peer:(id)a6 isSession:(BOOL)a7
{
  BOOL v7 = a7;
  int v9 = a4;
  unsigned int v10 = a3;
  v58[0] = a3;
  unsigned __int8 v57 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v9)
  {
    CFStringRef v34 = [(NSMutableDictionary *)self->_bleConnections objectForKeyedSubscript:v13];
    if (v34)
    {
      id v14 = objc_alloc_init((Class)NSMutableData);
      char v15 = 1;
      [v14 appendBytes:v58 length:1];
      [v14 appendBytes:&v57 length:1];
      [v14 appendData:v12];
      id v16 = [v14 length];
      if ((unint64_t)v16 < 0xEA41)
      {
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_100214A50;
        v35[3] = &unk_1008D1148;
        unsigned __int8 v38 = v58[0];
        unsigned __int8 v39 = v57;
        id v36 = v12;
        id v37 = v13;
        [v34 sendData:v14 completion:v35];

        int v28 = 0;
      }
      else
      {
        unint64_t v17 = (unint64_t)v16;
        unsigned int v32 = v13;
        BOOL v33 = v12;
        if (v7) {
          char v18 = 64;
        }
        else {
          char v18 = 48;
        }
        if (v7) {
          char v19 = 65;
        }
        else {
          char v19 = 49;
        }
        char v30 = v19;
        id v31 = v14;
        int v20 = (char *)[v31 bytes];
        id v21 = 0;
        char v56 = 1;
        unint64_t v22 = v17;
        while (v15 != -1)
        {
          id v23 = objc_alloc_init((Class)NSMutableData);

          char v55 = v18;
          [v23 appendBytes:&v55 length:1];
          [v23 appendBytes:&v57 length:1];
          [v23 appendBytes:&v56 length:1];
          [v23 appendBytes:v20 length:59968];
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_100214830;
          v48[3] = &unk_1008D1120;
          unsigned __int8 v52 = v58[0];
          char v53 = v56;
          unsigned __int8 v54 = v57;
          id v21 = v23;
          id v49 = v21;
          id v24 = v33;
          id v50 = v24;
          id v25 = v32;
          id v51 = v25;
          [v34 sendData:v21 completion:v48];

          v20 += 59968;
          char v15 = ++v56;
          v22 -= 59968;
          if (v22 <= 0xEA40)
          {
            id v26 = objc_alloc_init((Class)NSMutableData);

            char v47 = v30;
            [v26 appendBytes:&v47 length:1];
            [v26 appendBytes:&v57 length:1];
            [v26 appendBytes:&v56 length:1];
            [v26 appendBytes:v20 length:v22];
            v40[0] = _NSConcreteStackBlock;
            v40[1] = 3221225472;
            v40[2] = sub_100214940;
            v40[3] = &unk_1008D1120;
            unsigned __int8 v44 = v58[0];
            char v45 = v56;
            unsigned __int8 v46 = v57;
            id v41 = v26;
            id v42 = v24;
            id v43 = v25;
            id v27 = v26;
            [v34 sendData:v27 completion:v40];

            int v28 = 0;
            goto LABEL_14;
          }
        }
        if (dword_100969808 <= 60 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }

        int v28 = -6764;
LABEL_14:
        id v13 = v32;
        id v12 = v33;
      }
    }
    else
    {
      if (dword_100969808 <= 60 && (dword_100969808 != -1 || _LogCategory_Initialize()))
      {
        sub_100213568(v10);
        sub_1002116EC(v9);
        [v12 length];
        LogPrintF();
      }
      int v28 = -6753;
    }
  }
  else
  {
    if (dword_100969808 <= 60 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      sub_100213568(v10);
      [v12 length];
      LogPrintF();
    }
    int v28 = -6705;
  }

  return v28;
}

- (void)_bleNearbyInfoScannerEnsureStarted
{
  if (self->_bleNearbyInfoScanner)
  {
    -[SDNearbyAgent _bleUpdateScanner:typeFlag:](self, "_bleUpdateScanner:typeFlag:");
  }
  else
  {
    if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    CFStringRef v3 = (SFBLEScanner *)[objc_alloc((Class)SFBLEScanner) initWithType:16];
    bleNearbyInfoScanner = self->_bleNearbyInfoScanner;
    self->_bleNearbyInfoScanner = v3;

    [(SFBLEScanner *)self->_bleNearbyInfoScanner setDispatchQueue:self->_dispatchQueue];
    if ([(NSMutableSet *)self->_caRequests count])
    {
      id v5 = [(SDNearbyAgent *)self _idsBluetoothDeviceIDsForSharing];
      [(SFBLEScanner *)self->_bleNearbyInfoScanner setDeviceFilter:v5];
    }
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100214DB4;
    v9[3] = &unk_1008CAE28;
    v9[4] = self;
    [(SFBLEScanner *)self->_bleNearbyInfoScanner setDeviceFoundHandler:v9];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100214EBC;
    v8[3] = &unk_1008CAE28;
    v8[4] = self;
    [(SFBLEScanner *)self->_bleNearbyInfoScanner setDeviceLostHandler:v8];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100214F90;
    v7[3] = &unk_1008CAE90;
    v7[4] = self;
    [(SFBLEScanner *)self->_bleNearbyInfoScanner setDeviceChangedHandler:v7];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100215048;
    v6[3] = &unk_1008CB068;
    v6[4] = self;
    [(SFBLEScanner *)self->_bleNearbyInfoScanner setScanStateChangedHandler:v6];
    [(SDNearbyAgent *)self _bleUpdateScanner:self->_bleNearbyInfoScanner typeFlag:1];
    if (self->_bleNearbyInfoRSSILog) {
      [(SFBLEScanner *)self->_bleNearbyInfoScanner setRssiLog:1];
    }
    [(SFBLEScanner *)self->_bleNearbyInfoScanner activateWithCompletion:&stru_1008D1168];
  }
}

- (void)_bleNearbyInfoScannerEnsureStopped
{
  if (self->_bleNearbyInfoScanner
    && dword_100969808 <= 50
    && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SFBLEScanner *)self->_bleNearbyInfoScanner invalidate];
  bleNearbyInfoScanner = self->_bleNearbyInfoScanner;
  self->_bleNearbyInfoScanner = 0;

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(NSMutableDictionary *)self->_bleNearbyInfoDevices allKeys];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = [(NSMutableDictionary *)self->_bleNearbyInfoDevices objectForKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        if (v9) {
          [(SDNearbyAgent *)self _deviceDiscoveryBLEDeviceLost:v9 type:16];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [(NSMutableDictionary *)self->_bleNearbyInfoDevices removeAllObjects];
  bleNearbyInfoDevices = self->_bleNearbyInfoDevices;
  self->_bleNearbyInfoDevices = 0;
}

- (BOOL)_bleNearbyInfoScannerShouldScan
{
  if (self->_systemWillPowerDown || [(NSMutableSet *)self->_bleDiagnosticModeClients count]) {
    return 0;
  }
  if ([(NSMutableSet *)self->_caRequests count]) {
    return 1;
  }
  if (!self->_ddNearbyInfoEnabled) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_ddRequests;
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v5)
  {
LABEL_21:

    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v13;
LABEL_10:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v13 != v7) {
      objc_enumerationMutation(v4);
    }
    int v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
    if ((objc_msgSend(v9, "discoveryFlags", (void)v12) & 1) == 0
      || !self->_activityScreenOn && ![v9 overrideScreenOff])
    {
      goto LABEL_19;
    }
    unsigned int v10 = [v9 deviceFilter];
    long long v11 = v10;
    if (!v10 || [v10 count]) {
      break;
    }

LABEL_19:
    if (v6 == (id)++v8)
    {
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }

  if (self->_ddNearbyInfoScreenOff) {
    return 1;
  }
  return [(SDStatusMonitor *)self->_statusMonitor screenOn];
}

- (void)_bleProximityPairingScannerEnsureStarted
{
  if (self->_bleProximityPairingScanner)
  {
    -[SDNearbyAgent _bleUpdateScanner:typeFlag:](self, "_bleUpdateScanner:typeFlag:");
  }
  else
  {
    if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    CFStringRef v3 = (SFBLEScanner *)[objc_alloc((Class)SFBLEScanner) initWithType:7];
    bleProximityPairingScanner = self->_bleProximityPairingScanner;
    self->_bleProximityPairingScanner = v3;

    [(SFBLEScanner *)self->_bleProximityPairingScanner setDispatchQueue:self->_dispatchQueue];
    [(SFBLEScanner *)self->_bleProximityPairingScanner setChangeFlags:13];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100215720;
    v8[3] = &unk_1008CAE28;
    v8[4] = self;
    [(SFBLEScanner *)self->_bleProximityPairingScanner setDeviceFoundHandler:v8];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100215864;
    v7[3] = &unk_1008CAE28;
    v7[4] = self;
    [(SFBLEScanner *)self->_bleProximityPairingScanner setDeviceLostHandler:v7];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100215990;
    v6[3] = &unk_1008CAE90;
    v6[4] = self;
    [(SFBLEScanner *)self->_bleProximityPairingScanner setDeviceChangedHandler:v6];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100215AE4;
    v5[3] = &unk_1008CB068;
    v5[4] = self;
    [(SFBLEScanner *)self->_bleProximityPairingScanner setScanStateChangedHandler:v5];
    [(SDNearbyAgent *)self _bleUpdateScanner:self->_bleProximityPairingScanner typeFlag:2];
    if (self->_bleProximityRSSILog) {
      [(SFBLEScanner *)self->_bleProximityPairingScanner setRssiLog:1];
    }
    [(SFBLEScanner *)self->_bleProximityPairingScanner activateWithCompletion:&stru_1008D1188];
  }
}

- (void)_bleProximityPairingScannerEnsureStopped
{
  if (self->_bleProximityPairingScanner)
  {
    if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    CFStringRef v3 = [(NSMutableDictionary *)self->_ddProximityPairingDevices allKeys];
    id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = [(NSMutableDictionary *)self->_ddProximityPairingDevices objectForKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * i)];
          int v9 = [v8 bleDevice];

          if (v9) {
            [(SDNearbyAgent *)self _deviceDiscoveryBLEDeviceLost:v9 type:7];
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }

    [(SFBLEScanner *)self->_bleProximityPairingScanner invalidate];
    bleProximityPairingScanner = self->_bleProximityPairingScanner;
    self->_bleProximityPairingScanner = 0;
  }
}

- (BOOL)_bleProximityPairingScannerShouldScan
{
  if (!self->_bleProximityEnabled
    || !self->_ddProximityPairingEnabled
    || [(NSMutableSet *)self->_bleDiagnosticModeClients count])
  {
    return 0;
  }
  if (self->_ddProximityPairingScreenOff && !self->_systemWillPowerDown) {
    return 1;
  }
  statusMonitor = self->_statusMonitor;

  return [(SDStatusMonitor *)statusMonitor screenOn];
}

- (void)_btPipeEnsureStarted
{
  if (!self->_unlockBtPipe)
  {
    if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    CFStringRef v3 = (SFBLEPipe *)[objc_alloc((Class)SFBLEPipe) initWithPriority:4];
    unlockBtPipe = self->_unlockBtPipe;
    self->_unlockBtPipe = v3;

    [(SFBLEPipe *)self->_unlockBtPipe setDispatchQueue:self->_dispatchQueue];
    [(SFBLEPipe *)self->_unlockBtPipe setIdentifier:@"com.apple.sharing.pautounlock"];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100215F78;
    v5[3] = &unk_1008CE438;
    v5[4] = self;
    [(SFBLEPipe *)self->_unlockBtPipe setFrameHandler:v5];
    [(SFBLEPipe *)self->_unlockBtPipe activate];
  }
}

- (void)_btPipeEnsureStopped
{
  if (self->_unlockBtPipe)
  {
    if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFBLEPipe *)self->_unlockBtPipe invalidate];
    unlockBtPipe = self->_unlockBtPipe;
    self->_unlockBtPipe = 0;
  }
}

- (void)_btPipeStateChanged:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:SFNotificationKeyConnectionState];
  unint64_t v6 = (unint64_t)[v5 integerValue];

  uint64_t v7 = auto_unlock_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v6 > 2) {
      uint64_t v8 = "?";
    }
    else {
      uint64_t v8 = off_1008D1950[v6];
    }
    int v13 = 136315138;
    long long v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_btPipeStateChanged to %s", (uint8_t *)&v13, 0xCu);
  }

  if (v6 == 1)
  {
    int v9 = [(SFBLEPipe *)self->_unlockBtPipe getPeerUUID];
    id v10 = objc_alloc_init((Class)SFBLEDevice);
    [v10 setIdentifier:v9];
    [v10 setUseBTPipe:1];
    btPipePeer = self->_btPipePeer;
    self->_btPipePeer = (SFBLEDevice *)v10;

    long long v12 = auto_unlock_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      long long v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "connected to BT peer %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    int v9 = (char *)self->_btPipePeer;
    self->_btPipePeer = 0;
  }
}

- (void)_btPipeHandleFrameType:(unsigned __int8)a3 data:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  switch(v4)
  {
    case 3:
      id v17 = v6;
      uint64_t v8 = [(SFBLEPipe *)self->_unlockBtPipe getPeerUUID];
      int v9 = self->_btPipePeer;
      id v10 = [(SFBLEDevice *)v9 identifier];

      if (v8 != v10 && dword_100969808 <= 60 && (dword_100969808 != -1 || _LogCategory_Initialize()))
      {
        [(SFBLEDevice *)v9 identifier];
        long long v15 = v14 = v8;
        LogPrintF();
      }
      -[SDNearbyAgent _unlockReceivedFrameData:peer:device:](self, "_unlockReceivedFrameData:peer:device:", v17, v8, v9, v14, v15);

      goto LABEL_23;
    case 2:
      id v18 = v6;
      id v6 = [v6 length];
      if ((unint64_t)v6 <= 7)
      {
        int v13 = v18;
        if (dword_100969808 <= 60)
        {
          if (dword_100969808 != -1 || (id v6 = (id)_LogCategory_Initialize(), v13 = v18, v6))
          {
LABEL_32:
            [v13 length];
            goto LABEL_15;
          }
        }
      }
      else
      {
        CFAbsoluteTimeGetCurrent();
        id v11 = v18;
        id v6 = [v11 bytes];
        if (dword_100969808 <= 50)
        {
          if (dword_100969808 != -1 || (id v6 = (id)_LogCategory_Initialize(), v6))
          {
            [v11 length];
LABEL_15:
            id v6 = (id)LogPrintF();
          }
        }
      }
      break;
    case 1:
      id v16 = v6;
      if (dword_100969808 <= 50)
      {
        if (dword_100969808 != -1 || (v12 = _LogCategory_Initialize(), uint64_t v7 = v16, v12))
        {
          id v14 = [v7 length];
          LogPrintF();
          uint64_t v7 = v16;
        }
      }
      id v6 = [v7 length:v14];
      if ((unint64_t)v6 > 7)
      {
        uint64_t v8 = [v16 subdataWithRange:0, 8];
        [(SFBLEPipe *)self->_unlockBtPipe sendFrameType:2 payload:v8 completion:&stru_1008D11A8];
LABEL_23:

        break;
      }
      int v13 = v16;
      if (dword_100969808 <= 60)
      {
        if (dword_100969808 != -1) {
          goto LABEL_32;
        }
        id v6 = (id)_LogCategory_Initialize();
        int v13 = v16;
        if (v6) {
          goto LABEL_32;
        }
      }
      break;
    default:
      break;
  }

  _objc_release_x2(v6);
}

- (void)_smartCoverStatusChanged:(id)a3
{
  id v4 = a3;
  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021668C;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_wirelessCriticalChanged:(id)a3
{
  id v7 = a3;
  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    unsigned int v4 = [(SDStatusMonitor *)self->_statusMonitor wirelessCritical];
    CFStringRef v5 = @"NO";
    if (v4) {
      CFStringRef v5 = @"YES";
    }
    CFStringRef v6 = v5;
    LogPrintF();
  }
  if ([(SDStatusMonitor *)self->_statusMonitor wirelessCritical])
  {
    if (dword_100969808 <= 40 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SDNearbyAgent *)self _disableEnhancedDiscovery:@"WirelessCritical"];
  }
}

- (void)_mirroringStateChanged:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100216828;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_bleAdvertisingAddressChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  CFStringRef v3 = [(CUSystemMonitor *)self->_systemMonitor bluetoothAddressData];
  unsigned int v4 = v3;
  id obj = v3;
  if (v3)
  {
    bleAdvertisingAddress = self->_bleAdvertisingAddress;
    CFStringRef v6 = v3;
    id v7 = bleAdvertisingAddress;
    if (v6 == v7)
    {

      unsigned int v4 = obj;
    }
    else
    {
      uint64_t v8 = v7;
      if (!v7)
      {

        goto LABEL_12;
      }
      unsigned int v9 = [(NSData *)v6 isEqual:v7];

      unsigned int v4 = obj;
      if (!v9)
      {
LABEL_12:
        if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
        {
          if ((id)[(NSData *)v6 length] == (id)6) {
            [(NSData *)v6 bytes];
          }
          LogPrintF();
        }
        objc_storeStrong((id *)&self->_bleAdvertisingAddress, obj);
        bleAudioRoutingScoreEncryptedData = self->_bleAudioRoutingScoreEncryptedData;
        self->_bleAudioRoutingScoreEncryptedData = 0;

        bleAuthTag = self->_bleAuthTag;
        self->_bleAuthTag = 0;

        bleHotspotEncryptedData = self->_bleHotspotEncryptedData;
        self->_bleHotspotEncryptedData = 0;

        [(SDNearbyAgent *)self _update];
LABEL_23:
        unsigned int v4 = obj;
        goto LABEL_24;
      }
    }
  }
  if (dword_100969808 <= 30)
  {
    if (dword_100969808 != -1 || (v10 = _LogCategory_Initialize(), unsigned int v4 = obj, v10))
    {
      if ([v4 length] == (id)6) {
        [obj bytes];
      }
      LogPrintF();
      goto LABEL_23;
    }
  }
LABEL_24:
}

- (void)_bleUpdateAuthTagIfNeeded
{
  if (!self->_bleAuthTag && self->_idSelfIdentity)
  {
    CFStringRef v3 = self->_bleAdvertisingAddress;
    if ((id)[(NSData *)v3 length] != (id)6)
    {
      uint64_t v4 = [(CUSystemMonitor *)self->_systemMonitor bluetoothAddressData];

      CFStringRef v3 = (NSData *)v4;
    }
    if ((id)[(NSData *)v3 length] != (id)6) {
      goto LABEL_13;
    }
    idSelfIdentity = self->_idSelfIdentity;
    id v12 = 0;
    CFStringRef v6 = [(RPIdentity *)idSelfIdentity authTagForData:v3 type:2 error:&v12];
    id v7 = v12;
    bleAuthTag = self->_bleAuthTag;
    self->_bleAuthTag = v6;

    unsigned int v9 = self->_bleAuthTag;
    if (!v9)
    {
      if (dword_100969808 <= 90 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      goto LABEL_12;
    }
    if (dword_100969808 <= 30)
    {
      if (dword_100969808 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_11;
        }
        unsigned int v9 = self->_bleAuthTag;
      }
      id v11 = v9;
      LogPrintF();
    }
LABEL_11:
    int v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:@"SDNotificationNameNearbyBLEAuthTagChanged" object:self userInfo:0];

LABEL_12:
LABEL_13:
  }
}

- (void)_bleUpdateScanner:(id)a3 typeFlag:(unint64_t)a4
{
  id v54 = a3;
  if (a4)
  {
    id v6 = [(NSMutableSet *)self->_caRequests count];
    uint64_t v7 = 40;
    if (!v6) {
      uint64_t v7 = 0;
    }
    uint64_t v69 = v7;
  }
  else
  {
    uint64_t v69 = 0;
  }
  char v86 = 0;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id obj = self->_ddRequests;
  id v8 = [(NSMutableSet *)obj countByEnumeratingWithState:&v82 objects:v87 count:16];
  if (!v8)
  {
    LOBYTE(v10) = 0;
    id v65 = 0;
    LOBYTE(v11) = 0;
    unint64_t v61 = 0;
    id v62 = 0;
    int v12 = 0;
    uint64_t v59 = 0x7FFFFFFFFFFFFFFFLL;
    id v60 = 0;
    char v68 = 1;
    goto LABEL_60;
  }
  id v9 = v8;
  int v10 = 0;
  id v65 = 0;
  int v11 = 0;
  unint64_t v61 = 0;
  id v62 = 0;
  int v12 = 0;
  uint64_t v13 = *(void *)v83;
  uint64_t v59 = 0x7FFFFFFFFFFFFFFFLL;
  id v60 = 0;
  char v67 = 0;
  char v68 = 1;
  unint64_t v57 = a4;
  SEL v58 = self;
  uint64_t v56 = *(void *)v83;
  do
  {
    id v14 = 0;
    id v64 = v9;
    do
    {
      if (*(void *)v83 != v13) {
        objc_enumerationMutation(obj);
      }
      long long v15 = *(void **)(*((void *)&v82 + 1) + 8 * (void)v14);
      unint64_t v16 = (unint64_t)[v15 discoveryFlags:v54];
      if ((v16 & a4) != 0)
      {
        char v17 = v16;
        if (self->_activityScreenOn || [v15 overrideScreenOff])
        {
          id v18 = [v15 deviceFilter];
          char v19 = v18;
          if (v18)
          {
            if (![v18 count]) {
              goto LABEL_52;
            }
            if ((v67 & 1) == 0)
            {
              id v20 = v61;
              if (!v61) {
                id v20 = objc_alloc_init((Class)NSMutableSet);
              }
              unint64_t v61 = v20;
              [v20 unionSet:v19];
              char v67 = 0;
LABEL_23:
              int v21 = v11 | ((v17 & 0x40) == 0);
              if ((v21 & 1) == 0) {
                v86 |= 0x20u;
              }
              unsigned int v22 = [v15 trackPeers];
              int v66 = v21;
              if (v19 && v22)
              {
                id v23 = v60;
                if (!v60) {
                  id v23 = objc_alloc_init((Class)NSMutableSet);
                }
                int v24 = v10;
                id v60 = v23;
                [v23 unionSet:v19];
              }
              else
              {
                int v24 = v10;
              }
              unsigned int v25 = [v15 changeFlags];
              if ((v25 & 0x10) != 0) {
                int v26 = 4;
              }
              else {
                int v26 = (2 * v25) & 4;
              }
              BOOL v27 = [v15 rssiThreshold] == 0;
              if ((uint64_t)[v15 rssiThreshold] < (uint64_t)v65) {
                id v65 = [v15 rssiThreshold];
              }
              int v28 = v12;
              unsigned __int8 v29 = [v15 scanCache];
              id v30 = (id)v69;
              if ((uint64_t)[v15 scanRate] > v69) {
                id v30 = [v15 scanRate];
              }
              if ((uint64_t)[v15 scanRateOverride] > (uint64_t)v30) {
                id v30 = [v15 scanRateOverride];
              }
              uint64_t v69 = (uint64_t)v30;
              if ([v15 overrideScreenOff])
              {
                uint64_t v31 = (uint64_t)[v15 overrideScreenOffRescanInterval];
                uint64_t v32 = 10;
                if (v31 > 10) {
                  uint64_t v32 = v31;
                }
                uint64_t v33 = v59;
                if (v59 >= v32) {
                  uint64_t v33 = v32;
                }
                uint64_t v59 = v33;
              }
              int v12 = v28 | v25 | v26;
              int v10 = v27 | v24;
              v68 &= v29;
              CFStringRef v34 = [v15 useCases];

              if (v34)
              {
                uint64_t v35 = [v15 useCases];
                id v36 = (void *)v35;
                a4 = v57;
                self = v58;
                int v11 = v66;
                uint64_t v13 = v56;
                if (v62)
                {
                  if (v35) {
                    goto LABEL_49;
                  }
                }
                else
                {
                  id v62 = objc_alloc_init((Class)NSMutableSet);
                  if (v36) {
LABEL_49:
                  }
                    [v62 unionSet:v36];
                }
              }
              else
              {
                a4 = v57;
                self = v58;
                int v11 = v66;
                uint64_t v13 = v56;
              }
LABEL_52:

              id v9 = v64;
              goto LABEL_53;
            }
          }
          else if ((v67 & 1) == 0)
          {

            unint64_t v61 = 0;
          }
          char v67 = 1;
          goto LABEL_23;
        }
      }
LABEL_53:
      id v14 = (char *)v14 + 1;
    }
    while (v9 != v14);
    id v37 = [(NSMutableSet *)obj countByEnumeratingWithState:&v82 objects:v87 count:16];
    id v9 = v37;
  }
  while (v37);
LABEL_60:

  BOOL enhancedDiscoveryShouldRun = self->_enhancedDiscoveryShouldRun;
  unsigned __int8 v39 = [v61 allObjects];
  id v40 = 0;
  if (v86 && (v11 & 1) == 0) {
    id v40 = [objc_alloc((Class)NSData) initWithBytes:&v86 length:1];
  }
  BOOL v42 = (a4 & 1) == 0 || !enhancedDiscoveryShouldRun;
  uint64_t v43 = 30;
  if (v69 > 30) {
    uint64_t v43 = v69;
  }
  if (v42) {
    int v44 = v12;
  }
  else {
    int v44 = v12 | 4;
  }
  if (v42) {
    uint64_t v45 = v69;
  }
  else {
    uint64_t v45 = v43;
  }
  if (v10) {
    id v46 = 0;
  }
  else {
    id v46 = v65;
  }
  if (v45) {
    uint64_t v47 = v45;
  }
  else {
    uint64_t v47 = 20;
  }
  if (v59 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v48 = 10;
  }
  else {
    uint64_t v48 = v59;
  }
  id v49 = -[SDNearbyAgent _bleUpdateUseCases:](self, "_bleUpdateUseCases:", v62, v54);
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_1002171CC;
  v70[3] = &unk_1008D11D0;
  id v71 = v55;
  id v72 = v39;
  int v80 = v44;
  char v81 = v68 & 1;
  id v77 = v46;
  uint64_t v78 = v47;
  uint64_t v79 = v48;
  id v73 = v40;
  id v74 = v60;
  uint64_t v75 = v49;
  uint64_t v76 = self;
  id v50 = v60;
  id v51 = v40;
  id v52 = v39;
  id v53 = v55;
  [v53 performUpdate:v70];
}

- (id)_bleUpdateUseCases:(id)a3
{
  id v4 = [a3 mutableCopy];
  if (!v4) {
    id v4 = objc_alloc_init((Class)NSMutableSet);
  }
  if (([v4 containsObject:&off_100903078] & 1) == 0) {
    [v4 addObject:&off_100903078];
  }
  if ([(NSMutableSet *)self->_enhancedDiscoveryUseCases count]) {
    [v4 unionSet:self->_enhancedDiscoveryUseCases];
  }
  if (self->_cameraState == 1
    && ([(NSMutableSet *)self->_enhancedDiscoveryUseCases containsObject:&off_100903090] & 1) == 0)
  {
    [v4 addObject:&off_1009030A8];
    [(SDNearbyAgent *)self _postNotificationForWombatState:3];
  }

  return v4;
}

- (id)bleProximityEstimatorForActionType:(unsigned __int8)a3 device:(id)a4
{
  id v4 = [(SDNearbyAgent *)self bleProximityInfoForActionType:a3 device:a4];
  if (v4)
  {
    CFStringRef v5 = +[SFProximityEstimator proximityEstimatorWithProximityInfo:v4];
  }
  else
  {
    CFStringRef v5 = 0;
  }

  return v5;
}

- (void)bleProximityEstimatorsResetDeviceClose
{
  double v2 = [(NSMutableDictionary *)self->_ddNearbyActionDevices allValues];
  CFStringRef v3 = v2;
  if (v2)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = v2;
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) bleDevice:v11];
          if (!v9)
          {
            while (1)
              +[NSException raise:@"CUGuardLetNoReturn" format:@"CUGuardLet with no return"];
          }
          int v10 = v9;
          [v9 setInsideMediumBubble:0];
          [v10 setInsideSmallBubble:0];
          [v10 setCloseProximityEstimatorMedium:0];
          [v10 setCloseProximityEstimatorSmall:0];

          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

- (id)bleProximityInfo
{
  double v2 = self;
  objc_sync_enter(v2);
  bleProximityInfo = v2->_bleProximityInfo;
  if (!bleProximityInfo)
  {
    v2->_bleProximityInfo = (NSDictionary *)&off_100906C98;

    bleProximityInfo = v2->_bleProximityInfo;
  }
  id v4 = bleProximityInfo;
  objc_sync_exit(v2);

  return v4;
}

- (id)bleProximityInfoForActionType:(unsigned __int8)a3 device:(id)a4
{
  if ((a3 - 1) > 0x36) {
    CFStringRef v4 = @"atv";
  }
  else {
    CFStringRef v4 = (const __CFString *)*((void *)&off_1008D1968 + (char)(a3 - 1));
  }
  return [(SDNearbyAgent *)self bleProximityInfoForType:v4 device:a4];
}

- (id)bleProximityInfoForType:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_bleProximityInfoOverride;
  if (!v8
    || ([(SDNearbyAgent *)self bleProximityInfoForType:v6 device:v7 allInfo:v8], (id v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v10 = [(SDNearbyAgent *)self bleProximityInfo];
    id v9 = [(SDNearbyAgent *)self bleProximityInfoForType:v6 device:v7 allInfo:v10];
  }

  return v9;
}

- (id)bleProximityInfoForType:(id)a3 device:(id)a4 allInfo:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = SFDeviceModel();
  long long v11 = [v8 model];
  if (v10
    && (+[NSCharacterSet decimalDigitCharacterSet],
        long long v12 = objc_claimAutoreleasedReturnValue(),
        id v13 = [v10 rangeOfCharacterFromSet:v12],
        v12,
        v13 != (id)0x7FFFFFFFFFFFFFFFLL))
  {
    long long v14 = [v10 substringToIndex:v13];
    if (v11)
    {
LABEL_4:
      long long v15 = +[NSCharacterSet decimalDigitCharacterSet];
      id v16 = [(__CFString *)v11 rangeOfCharacterFromSet:v15];

      if (v16 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v17 = [(__CFString *)v11 substringToIndex:v16];
        goto LABEL_21;
      }
      goto LABEL_17;
    }
  }
  else
  {
    long long v14 = 0;
    if (v11) {
      goto LABEL_4;
    }
  }
  unsigned int v18 = [v8 deviceModelCode];
  switch(v18)
  {
    case 4u:
      long long v11 = @"iPod9,1";
      goto LABEL_14;
    case 6u:
      char v19 = "B620ish";
      goto LABEL_13;
    case 5u:
      char v19 = "B520ish";
LABEL_13:
      long long v11 = +[NSString stringWithUTF8String:v19];
      goto LABEL_14;
  }
  if ([v8 deviceActionType] == 5)
  {
    id v30 = [v8 bleDevice];
    uint64_t v31 = [v30 name];

    if ((unint64_t)[v31 length] < 8)
    {
      long long v11 = 0;
    }
    else
    {
      uint64_t v32 = [v31 substringWithRange:7, 1];
      if ([v32 isEqualToString:@"T"]) {
        long long v11 = @"Watch6,18";
      }
      else {
        long long v11 = 0;
      }
    }
  }
  else
  {
    long long v11 = 0;
  }
LABEL_14:
  unsigned int v20 = [v8 deviceClassCode];
  if (v20)
  {
    if (v20 > 8) {
      int v21 = "?";
    }
    else {
      int v21 = off_1008D1B20[(char)(v20 - 1)];
    }
    uint64_t v17 = +[NSString stringWithUTF8String:v21];
LABEL_21:
    unsigned int v22 = (void *)v17;
    if (!v10) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }
LABEL_17:
  unsigned int v22 = 0;
  if (!v10) {
    goto LABEL_24;
  }
LABEL_22:
  if (v11)
  {
    id v23 = [objc_alloc((Class)NSString) initWithFormat:@"%@-%@-%@", v7, v10, v11];
    CFDictionaryGetTypeID();
    int v24 = CFDictionaryGetTypedValue();

    if (v24) {
      goto LABEL_51;
    }
  }
LABEL_24:
  if (v14 && v11)
  {
    id v25 = [objc_alloc((Class)NSString) initWithFormat:@"%@-%@-%@", v7, v14, v11];
    CFDictionaryGetTypeID();
    int v24 = CFDictionaryGetTypedValue();

    if (v24) {
      goto LABEL_51;
    }
  }
  else if (!v11)
  {
    goto LABEL_30;
  }
  id v26 = [objc_alloc((Class)NSString) initWithFormat:@"%@-*-%@", v7, v11];
  CFDictionaryGetTypeID();
  int v24 = CFDictionaryGetTypedValue();

  if (v24) {
    goto LABEL_51;
  }
LABEL_30:
  if (v10 && v22)
  {
    id v27 = [objc_alloc((Class)NSString) initWithFormat:@"%@-%@-%@", v7, v10, v22];
    CFDictionaryGetTypeID();
    int v24 = CFDictionaryGetTypedValue();

    if (v24) {
      goto LABEL_51;
    }
  }
  else if (!v10)
  {
    goto LABEL_36;
  }
  id v28 = [objc_alloc((Class)NSString) initWithFormat:@"%@-%@-*", v7, v10];
  CFDictionaryGetTypeID();
  int v24 = CFDictionaryGetTypedValue();

  if (v24) {
    goto LABEL_51;
  }
LABEL_36:
  if (v14 && v22)
  {
    id v29 = [objc_alloc((Class)NSString) initWithFormat:@"%@-%@-%@", v7, v14, v22];
    CFDictionaryGetTypeID();
    int v24 = CFDictionaryGetTypedValue();

    if (v24) {
      goto LABEL_51;
    }
LABEL_47:
    id v33 = [objc_alloc((Class)NSString) initWithFormat:@"%@-*-%@", v7, v22];
    CFDictionaryGetTypeID();
    int v24 = CFDictionaryGetTypedValue();

    if (v24) {
      goto LABEL_51;
    }
    goto LABEL_48;
  }
  if (v22) {
    goto LABEL_47;
  }
LABEL_48:
  if (!v14
    || (id v34 = [objc_alloc((Class)NSString) initWithFormat:@"%@-%@-*", v7, v14],
        CFDictionaryGetTypeID(),
        CFDictionaryGetTypedValue(),
        int v24 = objc_claimAutoreleasedReturnValue(),
        v34,
        !v24))
  {
    id v35 = [objc_alloc((Class)NSString) initWithFormat:@"%@", v7];
    CFDictionaryGetTypeID();
    int v24 = CFDictionaryGetTypedValue();
  }
LABEL_51:

  return v24;
}

- (id)bleProximityRSSIEstimatorInfo
{
  [(SDNearbyAgent *)self bleProximityInfo];
  CFDictionaryGetTypeID();

  return (id)CFDictionaryGetTypedValue();
}

- (int64_t)bleProximityRSSIThresholdForType:(int64_t)a3 device:(id)a4
{
  id v6 = a4;
  id v7 = SFDeviceModel();
  id v8 = [v6 model];

  if ((unint64_t)(a3 - 1) > 7)
  {
LABEL_11:
    int64_t v11 = 0;
    goto LABEL_12;
  }
  uint64_t v9 = *((void *)&off_1008D1B60 + a3 - 1);
  if (v7 && v8)
  {
    id v10 = [objc_alloc((Class)NSString) initWithFormat:@"%@-%@-%@", v9, v7, v8];
    int64_t v11 = [(SDNearbyAgent *)self bleProximityRSSIThreshold:v10];

    if (v11) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  if (v8)
  {
LABEL_7:
    id v12 = [objc_alloc((Class)NSString) initWithFormat:@"%@-%@", v9, v8];
    int64_t v11 = [(SDNearbyAgent *)self bleProximityRSSIThreshold:v12];

    if (v11) {
      goto LABEL_12;
    }
  }
  if (!v7
    || (id v13 = [objc_alloc((Class)NSString) initWithFormat:@"%@-%@", v9, v7],
        int64_t v11 = [(SDNearbyAgent *)self bleProximityRSSIThreshold:v13],
        v13,
        !v11))
  {
    id v14 = [objc_alloc((Class)NSString) initWithFormat:@"%@", v9];
    int64_t v11 = [(SDNearbyAgent *)self bleProximityRSSIThreshold:v14];

    if (!v11) {
      goto LABEL_11;
    }
  }
LABEL_12:

  return v11;
}

- (int64_t)bleProximityRSSIThreshold:(id)a3
{
  id v4 = a3;
  id v5 = [(SDNearbyAgent *)self bleProximityInfo];
  CFDictionaryGetTypeID();
  id v6 = CFDictionaryGetTypedValue();

  int64_t Int64Ranged = (int)CFDictionaryGetInt64Ranged();
  return Int64Ranged;
}

- (unsigned)_bleProximityUpdateDeviceCloseNearbyActionDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 bleDevice];
  id v5 = [v3 model];
  unsigned __int8 v6 = [v5 isEqualToString:@"AudioAccessory5,1"];

  if (v6)
  {
    CFStringRef v7 = @"b520ho";
  }
  else
  {
    id v8 = [v3 model];
    unsigned int v9 = [v8 isEqualToString:@"AudioAccessory6,1"];

    if (v9) {
      CFStringRef v7 = @"b620ho";
    }
    else {
      CFStringRef v7 = @"ho";
    }
  }
  id v10 = +[SDNearbyAgent sharedNearbyAgent];
  int64_t v11 = [v10 bleProximityInfoForType:v7 device:v3];

  if (v11)
  {
    id v12 = [v4 closeProximityEstimatorSmall];
    if (!v12)
    {
      uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
      uint64_t Int64 = CFDictionaryGetInt64();
      uint64_t v15 = CFDictionaryGetInt64();
      uint64_t v16 = CFDictionaryGetInt64Ranged();
      v38[0] = @"algo";
      uint64_t v17 = +[NSNumber numberWithInt:Int64Ranged];
      v39[0] = v17;
      v38[1] = @"rssi";
      unsigned int v18 = +[NSNumber numberWithLongLong:Int64];
      v39[1] = v18;
      v38[2] = @"rssiExit";
      char v19 = +[NSNumber numberWithLongLong:v15];
      v39[2] = v19;
      v38[3] = @"sc";
      unsigned int v20 = +[NSNumber numberWithUnsignedInt:v16];
      v39[3] = v20;
      int v21 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:4];
      id v12 = +[SFProximityEstimator proximityEstimatorWithProximityInfo:v21];

      [v4 setCloseProximityEstimatorSmall:v12];
    }
    unsigned int v22 = [v12 updateWithSFBLEDevice:v4];
    id v23 = [v4 closeProximityEstimatorMedium];
    if (!v23)
    {
      uint64_t v24 = CFDictionaryGetInt64Ranged();
      uint64_t v25 = CFDictionaryGetInt64();
      uint64_t v26 = CFDictionaryGetInt64();
      uint64_t v27 = CFDictionaryGetInt64Ranged();
      v36[0] = @"algo";
      unsigned int v35 = v22;
      id v28 = +[NSNumber numberWithInt:v24];
      v37[0] = v28;
      v36[1] = @"rssi";
      id v29 = +[NSNumber numberWithLongLong:v25];
      v37[1] = v29;
      v36[2] = @"rssiExit";
      id v30 = +[NSNumber numberWithLongLong:v26];
      v37[2] = v30;
      v36[3] = @"sc";
      uint64_t v31 = +[NSNumber numberWithUnsignedInt:v27];
      v37[3] = v31;
      uint64_t v32 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:4];
      id v23 = +[SFProximityEstimator proximityEstimatorWithProximityInfo:v32];

      unsigned int v22 = v35;
      [v4 setCloseProximityEstimatorMedium:v23];
    }
    unsigned int v33 = [v23 updateWithSFBLEDevice:v4] | v22;
  }
  else
  {
    if (dword_100969808 <= 90 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    unsigned int v33 = 0;
  }

  return v33;
}

- (unsigned)_bleProximityUpdateNearbyActionDevice:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bleDevice];
  unsigned __int8 v6 = [v5 setupProximityEstimator];
  if (!v6)
  {
    CFStringRef v7 = +[SDNearbyAgent sharedNearbyAgent];
    unsigned __int8 v6 = [v7 bleProximityEstimatorForActionType:[v4 deviceActionType] device:v4];

    if (!v6)
    {
      unsigned int v8 = 0;
      goto LABEL_9;
    }
    [v5 setSetupProximityEstimator:v6];
  }
  unsigned int v8 = [v6 updateWithSFBLEDevice:v5];
  if ((v8 & 2) != 0) {
    [v4 setDistance:[v5 distance]];
  }
  if (([v4 deviceFlags] & 0x200) != 0) {
    v8 |= [(SDNearbyAgent *)self _bleProximityUpdateDeviceCloseNearbyActionDevice:v4];
  }
LABEL_9:

  return v8;
}

- (unsigned)_bleProximityUpdateNearbyInfoDevice:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bleDevice];
  unsigned __int8 v6 = [v5 infoProximityEstimator];
  if (!v6)
  {
    CFStringRef v7 = [(SDNearbyAgent *)self bleProximityInfoForType:@"info" device:v4];
    if (!v7
      || (+[SFProximityEstimator proximityEstimatorWithProximityInfo:v7], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) == 0))
    {

      unsigned int v9 = 0;
      unsigned __int8 v6 = 0;
      goto LABEL_8;
    }
    unsigned __int8 v6 = (void *)v8;
    [v5 setInfoProximityEstimator:v8];
  }
  unsigned int v9 = [v6 updateWithSFBLEDevice:v5];
  if ((v9 & 2) != 0) {
    [v4 setDistance:[v5 distance]];
  }
LABEL_8:

  return v9;
}

- (void)_postNotificationForWombatState:(unsigned int)a3
{
  if (dword_100969878 == -1) {
    notify_register_check("com.apple.sharing.wombat-state", &dword_100969878);
  }
  if (dword_100980478 != a3)
  {
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    notify_set_state(dword_100969878, a3);
    notify_post("com.apple.sharing.wombat-state");
    dword_100980478 = a3;
  }
}

- (void)_registerForMagicMountUpdates
{
  if (self->_cameraMagicMountManager) {
    return;
  }
  int DeviceClass = GestaltGetDeviceClass();
  if ((DeviceClass | 2) != 3) {
    return;
  }
  int v4 = DeviceClass;
  if ([(SDNearbyAgent *)self _allowEnhancedDiscovery] < 1
    || !+[CMMagicMountManager isAvailable])
  {
    return;
  }
  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v5 = (CMMagicMountManager *)objc_alloc_init((Class)CMMagicMountManager);
  cameraMagicMountManager = self->_cameraMagicMountManager;
  self->_cameraMagicMountManager = v5;

  uint64_t v7 = 1;
  [(CMMagicMountManager *)self->_cameraMagicMountManager setMagicMountConfiguration:1];
  if (v4 == 1) {
    goto LABEL_13;
  }
  if (v4 == 3)
  {
    uint64_t v7 = 0;
LABEL_13:
    [(CMMagicMountManager *)self->_cameraMagicMountManager setAPWakesAllowed:v7];
  }
  uint64_t v8 = self->_cameraMagicMountManager;
  unsigned int v9 = +[NSOperationQueue mainQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100218F68;
  v10[3] = &unk_1008D11F8;
  v10[4] = self;
  [(CMMagicMountManager *)v8 startMagicMountUpdatesToQueue:v9 withHandler:v10];

  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)_unregisterForMagicMountUpdates
{
  cameraMagicMountManager = self->_cameraMagicMountManager;
  if (cameraMagicMountManager)
  {
    [(CMMagicMountManager *)cameraMagicMountManager stopMagicMountUpdates];
    int v4 = self->_cameraMagicMountManager;
    self->_cameraMagicMountManager = 0;

    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    brightnessSystemClient = self->_brightnessSystemClient;
    self->_brightnessSystemClient = 0;

    self->_isDeviceMounted = 0;
    [(SDNearbyAgent *)self _updateCameraState];
  }
}

- (BOOL)_isDeviceMountedAndScreenOff
{
  BOOL v3 = self->_prefWombatAssumeLocked
    || [(CUSystemMonitor *)self->_systemMonitor systemLockState] == 3
    || [(CUSystemMonitor *)self->_systemMonitor systemLockState] == 2;
  if (self->_prefWombatAssumeScreenOff) {
    LOBYTE(v4) = 1;
  }
  else {
    unsigned int v4 = [(CUSystemMonitor *)self->_systemMonitor screenOn] ^ 1;
  }
  BOOL v5 = self->_prefWombatAssumeMounted || self->_isDeviceMounted;
  BOOL inDiscoverySession = self->_inDiscoverySession;
  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (inDiscoverySession) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v4;
  }
  if (!v5 || v3) {
    return v5;
  }
  else {
    return v7;
  }
}

- (void)_cameraStateChanged
{
  if (![(SDNearbyAgent *)self _allowEnhancedDiscovery]) {
    return;
  }
  if (self->_prefWombatAssumeMounted || self->_isDeviceMounted)
  {
    if (!self->_prefWombatAssumeNotInPocket && !self->_inDiscoverySession)
    {
      [(SDNearbyAgent *)self _checkBrightnessLuxValue];
      return;
    }
  }
  else
  {
    self->_isDeviceNotInPocket = 0;
  }

  [(SDNearbyAgent *)self _updateCameraState];
}

- (void)_updateCameraState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_prefWombatAssumeNotInPocket)
  {
    BOOL isDeviceNotInPocket = self->_isDeviceNotInPocket;
    if (![(SDNearbyAgent *)self _isDeviceMountedAndScreenOff]
      || !isDeviceNotInPocket && !self->_inDiscoverySession)
    {
      goto LABEL_8;
    }
LABEL_7:
    int v4 = 0;
    int v5 = 1;
    unsigned __int8 v6 = "Usable";
    goto LABEL_9;
  }
  if ([(SDNearbyAgent *)self _isDeviceMountedAndScreenOff]) {
    goto LABEL_7;
  }
LABEL_8:
  int v5 = 0;
  unsigned __int8 v6 = "?";
  int v4 = 1;
LABEL_9:
  int cameraState = self->_cameraState;
  if (v5 != cameraState)
  {
    if (dword_100969808 <= 30)
    {
      if (dword_100969808 != -1)
      {
LABEL_12:
        uint64_t v8 = "?";
        if (cameraState == 1) {
          uint64_t v8 = "Usable";
        }
        if (cameraState) {
          unsigned int v9 = v8;
        }
        else {
          unsigned int v9 = "Nearby";
        }
        if (v4) {
          id v10 = "Nearby";
        }
        else {
          id v10 = v6;
        }
        id v12 = v9;
        id v13 = v10;
        LogPrintF();
        goto LABEL_22;
      }
      if (_LogCategory_Initialize())
      {
        int cameraState = self->_cameraState;
        goto LABEL_12;
      }
    }
LABEL_22:
    self->_int cameraState = v5;
    if (v4)
    {
      [(SDNearbyAgent *)self _disableEnhancedDiscovery:@"CameraStateNearby"];
      uint64_t v11 = 1;
    }
    else
    {
      [(SDNearbyAgent *)self _enableEnhancedDiscovery:@"CameraStateUsable" useCase:131078];
      uint64_t v11 = 2;
    }
    -[SDNearbyAgent _postNotificationForWombatState:](self, "_postNotificationForWombatState:", v11, v12, v13);
  }

  [(SDNearbyAgent *)self _update];
}

- (void)_useLuxValue
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100219560;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_checkBrightnessLuxValue
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_brightnessSystemClient)
  {
    uint64_t v21 = 0;
    unsigned int v22 = &v21;
    uint64_t v23 = 0x2050000000;
    BOOL v3 = (void *)qword_1009804A0;
    uint64_t v24 = qword_1009804A0;
    if (!qword_1009804A0)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10022E4E4;
      v20[3] = &unk_1008CA038;
      v20[4] = &v21;
      sub_10022E4E4((uint64_t)v20);
      BOOL v3 = (void *)v22[3];
    }
    int v4 = v3;
    _Block_object_dispose(&v21, 8);
    int v5 = (BrightnessSystemClient *)objc_alloc_init(v4);
    brightnessSystemClient = self->_brightnessSystemClient;
    self->_brightnessSystemClient = v5;

    self->_supportsRearLux = MGGetBoolAnswer();
  }
  __asm { FMOV            V0.2S, #-1.0 }
  *(void *)&self->_alsLuxValue = _D0;
  id v12 = +[NSMutableArray arrayWithObject:@"Lux"];
  id v13 = v12;
  if (self->_supportsRearLux) {
    [v12 addObject:@"RLuxOutput"];
  }
  [(BrightnessSystemClient *)self->_brightnessSystemClient setProperty:&__kCFBooleanTrue forKey:@"ActivateALS"];
  id v14 = self->_brightnessSystemClient;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100219970;
  v19[3] = &unk_1008CA8B8;
  v19[4] = self;
  [(BrightnessSystemClient *)v14 registerNotificationBlock:v19 forProperties:v13];
  if (self->_supportsRearLux) {
    [(BrightnessSystemClient *)self->_brightnessSystemClient setProperty:&off_100903048 forKey:@"RLuxSampleWithMaxAge"];
  }
  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    unsigned int v18 = v13;
    LogPrintF();
  }
  id v15 = [(BrightnessSystemClient *)self->_brightnessSystemClient copyPropertyForKey:@"Lux", v18];
  [v15 floatValue];
  float v17 = v16;

  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (v17 >= 0.0)
  {
    self->_alsLuxValue = v17;
    [(SDNearbyAgent *)self _useLuxValue];
  }
}

- (void)_registerForWombatActivityNotification
{
  if (self->_wombatActivityToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100219C5C;
    handler[3] = &unk_1008CACA8;
    handler[4] = self;
    notify_register_dispatch("com.apple.rapport.wombat-activity", &self->_wombatActivityToken, dispatchQueue, handler);
  }
}

- (void)_unregisterForWombatActivityNotification
{
  int wombatActivityToken = self->_wombatActivityToken;
  if (wombatActivityToken != -1)
  {
    notify_cancel(wombatActivityToken);
    self->_int wombatActivityToken = -1;
  }
}

- (void)_discoverySessionStateChange:(BOOL)a3
{
  if (self->_inDiscoverySession != a3)
  {
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_BOOL inDiscoverySession = a3;
    if (SFDeviceClassCodeGet() != 6)
    {
      [(SDNearbyAgent *)self _bleNearbyInfoAdvertiserUpdate];
    }
  }
}

- (void)_cancelDonStateRetryTimers
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v3 = [(NSMutableDictionary *)self->_donStateRetryTimerDictionary allKeys];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        unsigned int v9 = [(NSMutableDictionary *)self->_donStateRetryTimerDictionary objectForKeyedSubscript:v8];
        id v10 = v9;
        if (v9)
        {
          dispatch_source_cancel(v9);
        }
        [(NSMutableDictionary *)self->_donStateRetryTimerDictionary setObject:0 forKeyedSubscript:v8];
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_deliverDonnedEventToDevice:(id)a3 allowRetry:(BOOL)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)RPCompanionLinkClient);
  [v7 setDispatchQueue:self->_dispatchQueue];
  [v7 setUseCase:131100];
  [v7 setControlFlags:6291712];
  [v7 setDestinationDevice:v6];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10021A04C;
  v10[3] = &unk_1008D1248;
  BOOL v14 = a4;
  id v11 = v7;
  id v12 = v6;
  long long v13 = self;
  id v8 = v6;
  id v9 = v7;
  [v9 activateWithCompletion:v10];
}

- (void)_deliverDonnedEventsStart
{
  if ([(SDNearbyAgent *)self _idsWatchCount] >= 1)
  {
    activeWatchDiscovery = self->_activeWatchDiscovery;
    if (activeWatchDiscovery) {
      [(RPCompanionLinkClient *)activeWatchDiscovery invalidate];
    }
    id v4 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    id v5 = self->_activeWatchDiscovery;
    self->_activeWatchDiscovery = v4;

    [(RPCompanionLinkClient *)self->_activeWatchDiscovery setControlFlags:2];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10021A5FC;
    v9[3] = &unk_1008CA828;
    v9[4] = self;
    [(RPCompanionLinkClient *)self->_activeWatchDiscovery setDeviceFoundHandler:v9];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10021A704;
    v8[3] = &unk_1008CA828;
    v8[4] = self;
    [(RPCompanionLinkClient *)self->_activeWatchDiscovery setDeviceLostHandler:v8];
    id v6 = self->_activeWatchDiscovery;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10021A768;
    v7[3] = &unk_1008CA5A8;
    v7[4] = self;
    [(RPCompanionLinkClient *)v6 activateWithCompletion:v7];
  }
}

- (void)_deliverDoffedEvent
{
  [(SDNearbyAgent *)self _invalidateWatchDiscoveryIfNeeded];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(NSMutableSet *)self->_deliveredDonnedIdentifiers allObjects];
  id v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v6);
        id v8 = objc_alloc_init((Class)RPCompanionLinkClient);
        [v8 setDispatchQueue:self->_dispatchQueue];
        [v8 setUseCase:131100];
        [v8 setControlFlags:6291712];
        id v9 = objc_alloc_init((Class)RPCompanionLinkDevice);
        [v9 setIdentifier:v7];
        [v8 setDestinationDevice:v9];
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10021AA10;
        v13[3] = &unk_1008D1270;
        id v14 = v8;
        uint64_t v15 = v7;
        float v16 = self;
        id v17 = v9;
        id v10 = v9;
        id v11 = v8;
        [v11 activateWithCompletion:v13];

        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }
}

- (void)_handleRetryTimerForDevice:(id)a3
{
  id v8 = a3;
  id v4 = [v8 idsDeviceIdentifier];
  uint64_t v5 = [(NSMutableDictionary *)self->_donStateRetryTimerDictionary objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5)
  {
    dispatch_source_cancel(v5);
  }
  [(NSMutableDictionary *)self->_donStateRetryTimerDictionary setObject:0 forKeyedSubscript:v4];
  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    id v7 = v8;
    LogPrintF();
  }
  -[SDNearbyAgent _deliverDonnedEventToDevice:allowRetry:](self, "_deliverDonnedEventToDevice:allowRetry:", v8, 0, v7);
}

- (void)_invalidateWatchDiscoveryIfNeeded
{
  if (![(NSMutableSet *)self->_deliveredDonnedIdentifiers count])
  {
    [(RPCompanionLinkClient *)self->_activeWatchDiscovery invalidate];
    activeWatchDiscovery = self->_activeWatchDiscovery;
    self->_activeWatchDiscovery = 0;
  }
}

- (BOOL)_shouldDeliverDonStateUpdates
{
  return GestaltGetDeviceClass() == 11 || self->_simulateDonStateChanges;
}

- (void)_updateDonState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([(CUSystemMonitor *)self->_systemMonitor screenOn])
  {
    [(SDNearbyAgent *)self _deliverDonnedEventsStart];
  }
  else
  {
    [(SDNearbyAgent *)self _deliverDoffedEvent];
  }
}

- (void)nearby:(id)a3 didConnectToPeer:(id)a4 transport:(int64_t)a5 error:(id)a6
{
  id v20 = a4;
  id v8 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v20)
  {
    uint64_t v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:");
    if (!v9)
    {
      if (v8)
      {
        if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize()))
        {
          id v18 = v20;
          id v19 = v8;
          LogPrintF();
        }
        id v10 = 0;
      }
      else
      {
        if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
        {
          id v18 = v20;
          LogPrintF();
        }
        id v11 = objc_alloc_init((Class)SFBLEDevice);
        [v11 setIdentifier:v20];
        id v10 = [objc_alloc((Class)SFBLEConnection) initWithDevice:v11 acceptor:1];
        [v10 setDispatchQueue:self->_dispatchQueue];
        bleConnections = self->_bleConnections;
        if (!bleConnections)
        {
          long long v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          id v14 = self->_bleConnections;
          self->_bleConnections = v13;

          bleConnections = self->_bleConnections;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](bleConnections, "setObject:forKeyedSubscript:", v10, v20, v18);
        [v10 addClient:self];
        [v10 activateDirect];
      }
      goto LABEL_28;
    }
    id v10 = (id)v9;
    if (v8)
    {
      if (dword_100969808 > 50 || dword_100969808 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_28;
      }
      id v18 = v20;
      id v19 = v8;
    }
    else
    {
      if (dword_100969808 > 30 || dword_100969808 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_28;
      }
      id v18 = v20;
    }
    LogPrintF();
LABEL_28:
    id v15 = objc_alloc_init((Class)NSMutableDictionary);
    float v16 = v15;
    if (v8) {
      [v15 setObject:v8 forKeyedSubscript:@"SDBluetoothNotificationKeyError"];
    }
    [v16 setObject:v20 forKeyedSubscript:@"SDBluetoothNotificationKeyPeerIdentifier" keyedSubscript:v18];
    id v17 = +[NSNotificationCenter defaultCenter];
    [v17 postNotificationName:@"SDNotificationNameNearbyBLEConnected" object:self userInfo:v16];

    goto LABEL_31;
  }
  if (dword_100969808 <= 60 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_31:
}

- (void)nearby:(id)a3 didDisconnectFromPeer:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v8)
  {
    if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      id v50 = v7;
      id v52 = v8;
LABEL_8:
      LogPrintF();
    }
  }
  else if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    id v50 = v7;
    goto LABEL_8;
  }
  id v57 = v8;
  uint64_t v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:", v7, v50, v52);
  id v10 = v9;
  if (v9 && ([v9 removeClient:self] & 1) == 0)
  {
    [(NSMutableDictionary *)self->_bleConnections removeObjectForKey:v7];
    [v10 invalidate];
  }
  id v54 = v10;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v11 = [(NSMutableDictionary *)self->_setupSessions allKeys];
  id v12 = [v11 countByEnumeratingWithState:&v66 objects:v76 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v67;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v67 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v66 + 1) + 8 * i);
        id v17 = [(NSMutableDictionary *)self->_setupSessions objectForKeyedSubscript:v16];
        id v18 = [v17 peerIdentifier];
        unsigned int v19 = [v18 isEqual:v7];

        if (v19)
        {
          if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
            -[NSMutableDictionary removeObjectForKey:](self->_setupSessions, "removeObjectForKey:", v16, v16, v7);
          }
          else
          {
            -[NSMutableDictionary removeObjectForKey:](self->_setupSessions, "removeObjectForKey:", v16, v51, v53);
          }
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v66 objects:v76 count:16];
    }
    while (v13);
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = self->_services;
  id v20 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v62 objects:v75 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v63;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v63 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = [(NSMutableDictionary *)self->_services objectForKeyedSubscript:*(void *)(*((void *)&v62 + 1) + 8 * (void)j)];
        uint64_t v25 = [v24 peerDisconnectedHandler];

        if (v25)
        {
          uint64_t v26 = [v24 peerDisconnectedHandler];
          ((void (**)(void, id, id))v26)[2](v26, v7, v57);
        }
        uint64_t v27 = [v24 errorHandler];

        if (v27)
        {
          id v28 = [v24 errorHandler];
          NSErrorUserInfoKey v73 = NSLocalizedDescriptionKey;
          uint64_t v29 = +[NSString stringWithUTF8String:DebugGetErrorString()];
          id v30 = (void *)v29;
          CFStringRef v31 = @"?";
          if (v29) {
            CFStringRef v31 = (const __CFString *)v29;
          }
          CFStringRef v74 = v31;
          uint64_t v32 = +[NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1];
          unsigned int v33 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-6753 userInfo:v32];
          ((void (**)(void, void *))v28)[2](v28, v33);
        }
      }
      id v21 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v62 objects:v75 count:16];
    }
    while (v21);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v56 = self->_sessions;
  id v34 = [(NSMutableDictionary *)v56 countByEnumeratingWithState:&v58 objects:v72 count:16];
  unsigned int v35 = v57;
  if (v34)
  {
    id v36 = v34;
    uint64_t v37 = *(void *)v59;
    do
    {
      for (k = 0; k != v36; k = (char *)k + 1)
      {
        if (*(void *)v59 != v37) {
          objc_enumerationMutation(v56);
        }
        unsigned __int8 v39 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:*(void *)(*((void *)&v58 + 1) + 8 * (void)k)];
        id v40 = [v39 peerDevice];
        id v41 = [v40 identifier];

        if ([v41 isEqual:v7])
        {
          NSErrorUserInfoKey v70 = NSLocalizedDescriptionKey;
          CFStringRef v71 = @"kConnectionErr";
          BOOL v42 = +[NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
          id v43 = [v42 mutableCopy];

          if (v35) {
            [v43 setObject:v35 forKeyedSubscript:NSUnderlyingErrorKey];
          }
          int v44 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-6753 userInfo:v43];
          uint64_t v45 = [v39 errorHandler];

          if (v45)
          {
            id v46 = [v39 errorHandler];
            ((void (**)(void, void *))v46)[2](v46, v44);
          }
          unsigned int v35 = v57;
        }
      }
      id v36 = [(NSMutableDictionary *)v56 countByEnumeratingWithState:&v58 objects:v72 count:16];
    }
    while (v36);
  }

  id v47 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v48 = v47;
  if (v35) {
    [v47 setObject:v35 forKeyedSubscript:@"SDBluetoothNotificationKeyError"];
  }
  [v48 setObject:v7 forKeyedSubscript:@"SDBluetoothNotificationKeyPeerIdentifier"];
  id v49 = +[NSNotificationCenter defaultCenter];
  [v49 postNotificationName:@"SDNotificationNameNearbyBLEDisconnected" object:self userInfo:v48];
}

- (void)nearby:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!v7)
  {
    if (dword_100969808 > 60 || dword_100969808 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_12;
    }
LABEL_10:
    LogPrintF();
    goto LABEL_12;
  }
  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    id v12 = [v13 length];
    id v10 = v7;
    id v11 = v13;
    LogPrintF();
  }
  uint64_t v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:", v7, v10, v11, v12);
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    [(SDNearbyAgent *)self _bleNearbyInfoReceivedData:v13 cnx:v8 peer:v7];

    goto LABEL_12;
  }
  if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    goto LABEL_10;
  }
LABEL_12:
}

- (void)nearbyDidUpdateState:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  unint64_t v6 = (unint64_t)[v5 state];

  if (dword_100969808 <= 40 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    if (v6 > 5) {
      id v7 = "?";
    }
    else {
      id v7 = off_1008D1BC0[v6];
    }
    uint64_t v9 = v7;
    LogPrintF();
  }
  sessions = self->_sessions;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10021BB5C;
  v10[3] = &unk_1008D1290;
  void v10[4] = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sessions, "enumerateKeysAndObjectsUsingBlock:", v10, v9);
}

- (void)coordinatedAlertRequestStart:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (!self->_caEnabled)
  {
    if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v7 = [v4 completionHandler];

    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v6 = 0;
    uint64_t v10 = 0;
    unsigned int v35 = 1;
    if (!v7) {
      goto LABEL_51;
    }
LABEL_50:
    unsigned int v19 = [v4 completionHandler];
    v19[2](v19, 0, 1, 0);

    uint64_t v6 = v8;
    uint64_t v10 = v9;
    goto LABEL_51;
  }
  int DeviceClass = GestaltGetDeviceClass();
  uint64_t v6 = 1;
  if ([v4 type] != (id)6) {
    goto LABEL_39;
  }
  if (DeviceClass != 1 && DeviceClass != 100)
  {
    if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v6 = [v4 completionHandler];

    if (v6)
    {
      id v11 = [v4 completionHandler];
      v11[2](v11, 0, 0, 0);

      uint64_t v6 = 0;
    }
  }
  if (DeviceClass == 100 || DeviceClass == 1)
  {
LABEL_39:
    if (!self->_caSingleDevice
      && (![(SDNearbyAgent *)self idsIsSignedIn]
       || [(SDNearbyAgent *)self _idsContinuityDeviceCount] <= 0))
    {
      if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v18 = [v4 completionHandler];

      uint64_t v8 = 0;
      uint64_t v9 = 0;
      unsigned int v35 = 0;
      uint64_t v6 = 0;
      uint64_t v10 = 0;
      if (!v18) {
        goto LABEL_51;
      }
      goto LABEL_50;
    }
  }
  if (!v6)
  {
    uint64_t v10 = 0;
    unsigned int v35 = 0;
LABEL_51:
    if ([v4 type] != (id)1)
    {
LABEL_54:
      v36[0] = @"eventType";
      id v34 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 type]);
      v37[0] = v34;
      v36[1] = @"activityLevel";
      uint64_t v23 = +[NSNumber numberWithUnsignedChar:v35];
      v37[1] = v23;
      v37[2] = &off_100903300;
      v36[2] = @"otherDevicesCount";
      v36[3] = @"bestIsMe";
      v37[3] = &__kCFBooleanTrue;
      void v36[4] = @"skipScanBcPhoneCall";
      uint64_t v24 = +[NSNumber numberWithBool:v6];
      void v37[4] = v24;
      v36[5] = @"skipScanBcVeryActive";
      uint64_t v25 = +[NSNumber numberWithBool:v10];
      v37[5] = v25;
      v36[6] = @"MsgScans";
      uint64_t v26 = +[NSNumber numberWithUnsignedInt:self->_caMessageScans];
      v37[6] = v26;
      v36[7] = @"MsgNoScans";
      uint64_t v27 = +[NSNumber numberWithUnsignedInt:self->_caMessageNoScans];
      v37[7] = v27;
      id v28 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:8];
      SFMetricsLog();

      if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize()))
      {
        [v4 type];
        LogPrintF();
      }
      goto LABEL_58;
    }
    char v16 = 0;
    uint64_t caMessageNoScans = self->_caMessageNoScans + 1;
    self->_uint64_t caMessageNoScans = caMessageNoScans;
LABEL_53:
    v38[0] = @"noScans";
    id v20 = +[NSNumber numberWithUnsignedInt:caMessageNoScans];
    v38[1] = @"scans";
    v39[0] = v20;
    id v21 = +[NSNumber numberWithUnsignedInt:self->_caMessageScans];
    v39[1] = v21;
    uint64_t v22 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
    SFPowerLogEvent();

    if (v16) {
      goto LABEL_58;
    }
    goto LABEL_54;
  }
  if (!self->_caPhoneCalls
    && [v4 type] == (id)2
    && ((SFIsDevicePhone() & 1) != 0 || SFDeviceIsRealityDevice()))
  {
    if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    unsigned int v33 = [v4 completionHandler];

    uint64_t v9 = 0;
    unsigned int v35 = 0;
    uint64_t v10 = 0;
    uint64_t v8 = 1;
    uint64_t v6 = 1;
    if (!v33) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }
  if (self->_caScanIfVeryActive)
  {
    unsigned int v35 = 0;
    goto LABEL_34;
  }
  unsigned int v35 = [(SDNearbyAgent *)self _activityMonitorCurrentLevelAndNeedsPoll:0 recentUserActivity:0];
  if ([(SDNearbyAgent *)self _idsVisionOS2OrHigherCount] < 1)
  {
    BOOL caScanIfHasVisionOS1 = 0;
  }
  else if ([(SDNearbyAgent *)self _idsVisionOS1Count])
  {
    BOOL caScanIfHasVisionOS1 = self->_caScanIfHasVisionOS1;
  }
  else
  {
    BOOL caScanIfHasVisionOS1 = 1;
  }
  unsigned __int8 v29 = [(CUBluetoothClient *)self->_btConnectedDeviceMonitor statusFlags];
  id v30 = [v4 type];
  BOOL v31 = (v29 & 1) == 0 && caScanIfHasVisionOS1;
  if (v30 != (id)2) {
    BOOL v31 = 0;
  }
  if (v35 != 14) {
    BOOL v31 = 0;
  }
  if (v35 >= 0xB && !v31)
  {
    if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v32 = [v4 completionHandler];

    uint64_t v8 = 0;
    uint64_t v6 = 0;
    uint64_t v9 = 1;
    uint64_t v10 = 1;
    if (!v32) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }
  if (v31)
  {
    if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    unsigned int v35 = 14;
  }
LABEL_34:
  caRequests = self->_caRequests;
  if (!caRequests)
  {
    id v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    uint64_t v14 = self->_caRequests;
    self->_caRequests = v13;

    caRequests = self->_caRequests;
  }
  [(NSMutableSet *)caRequests addObject:v4];
  [(SDNearbyAgent *)self _update];
  if ([v4 type] == (id)1)
  {
    uint64_t v6 = 0;
    uint64_t v10 = 0;
    ++self->_caMessageScans;
    uint64_t caMessageNoScans = self->_caMessageNoScans;
    char v16 = 1;
    goto LABEL_53;
  }
LABEL_58:
}

- (void)coordinatedAlertRequestFinish:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  long long v62 = v4;
  if ([v4 type] == (id)1)
  {
    uint64_t v5 = [(SDNearbyAgent *)self _idsBluetoothDeviceIDsForiMessage];
    goto LABEL_9;
  }
  if ([v4 type] == (id)3)
  {
    uint64_t v5 = [(SDNearbyAgent *)self _idsBluetoothDeviceIDsForSMSRelay];
    goto LABEL_9;
  }
  if ([v4 type] == (id)4)
  {
    uint64_t v5 = [(SDNearbyAgent *)self _idsBluetoothDeviceIDsForAnnouncements];
    goto LABEL_9;
  }
  if ([v4 type] == (id)6)
  {
    uint64_t v5 = [(SDNearbyAgent *)self _idsBluetoothDeviceIDsForOneness];
LABEL_9:
    uint64_t v6 = (void *)v5;
    if (v5) {
      goto LABEL_11;
    }
  }
  id v7 = [(SDNearbyAgent *)self _idsBluetoothDeviceIDsForSharing];
  uint64_t v6 = +[NSSet setWithArray:v7];

  id v4 = v62;
LABEL_11:
  uint64_t v8 = [(SDNearbyAgent *)self _activityMonitorCurrentLevelAndNeedsPoll:0 recentUserActivity:0];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v9 = self->_bleNearbyInfoDevices;
  id v10 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v66 objects:v72 count:16];
  uint64_t v64 = v8;
  long long v65 = v6;
  if (v10)
  {
    id v11 = v10;
    id obj = v9;
    char v12 = 0;
    uint64_t v60 = (char)v8;
    char v61 = 1;
    uint64_t v13 = v8;
    uint64_t v14 = *(void *)v67;
    uint64_t v58 = v13;
    uint64_t v59 = v13;
    while (1)
    {
      id v15 = 0;
      do
      {
        if (*(void *)v67 != v14) {
          objc_enumerationMutation(obj);
        }
        char v16 = -[NSMutableDictionary objectForKeyedSubscript:](self->_bleNearbyInfoDevices, "objectForKeyedSubscript:", *(void *)(*((void *)&v66 + 1) + 8 * (void)v15), v52, v54, v55, v56, v57);
        if ([v16 decryptedActivityLevel] == 16) {
          uint64_t v17 = 0;
        }
        else {
          uint64_t v17 = (uint64_t)[v16 decryptedActivityLevel];
        }
        uint64_t v18 = [v16 identifier];
        unsigned int v19 = (void *)v18;
        if (!v6 || v18 && ([v6 containsObject:v18] & 1) != 0)
        {
          if (v17 == 14)
          {
            id v20 = [(SDNearbyAgent *)self idsDeviceForBluetoothDeviceID:v19 conflictDetected:0];
            id v21 = v20;
            if (v20)
            {
              uint64_t v22 = [v20 productName];
              unsigned int v23 = [v22 isEqualToString:@"xrOS"];

              if (v23)
              {
                id v4 = v62;
                if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize()))
                {
                  uint64_t v54 = 14;
                  char v55 = "PhoneCall";
                  id v52 = v19;
                  goto LABEL_67;
                }
                goto LABEL_93;
              }
              id v4 = v62;
            }
          }
          else
          {
            id v21 = 0;
          }
          if ([v4 type] != (id)6 || v17 != v64) {
            goto LABEL_53;
          }
          uint64_t v26 = [v21 modelIdentifier];
          uint64_t v27 = [v26 lowercaseString];

          if (GestaltGetDeviceClass() == 100
            && [v27 containsString:@"iphone"])
          {
            if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize()))
            {
              id v28 = "?";
              if (v64 <= 0xE) {
                id v28 = off_1008D1CA0[v60];
              }
              uint64_t v54 = v17;
              char v55 = v28;
              id v52 = v19;
              LogPrintF();
            }
            char v61 = 0;
            int v35 = 2;
          }
          else
          {
            if (GestaltGetDeviceClass() != 1
              || ([v27 containsString:@"mac"] & 1) == 0
              && ![v27 containsString:@"imac"])
            {

              id v4 = v62;
LABEL_53:
              if (v17 <= 9)
              {
                if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize()))
                {
                  uint64_t v54 = v17;
                  char v55 = off_1008D1C28[(char)v17];
                  id v52 = v19;
                  goto LABEL_84;
                }
LABEL_85:
                int v35 = 3;
LABEL_94:
                char v12 = 1;
                goto LABEL_98;
              }
              if (v17 <= v64)
              {
                if (dword_100969808 > 50 || dword_100969808 == -1 && !_LogCategory_Initialize()) {
                  goto LABEL_85;
                }
                unsigned int v33 = "?";
                if ((v17 - 10) <= 4) {
                  unsigned int v33 = off_1008D1C78[(char)(v17 - 10)];
                }
                id v34 = "?";
                if (v64 <= 0xE) {
                  id v34 = off_1008D1CA0[v60];
                }
                id v57 = v34;
                char v55 = v33;
                uint64_t v56 = v59;
                id v52 = v19;
                uint64_t v54 = v17;
              }
              else
              {
                unsigned int v30 = v17 - 10;
                if (v17 != 10
                  || ([(CUBluetoothClient *)self->_btConnectedDeviceMonitor statusFlags] & 1) == 0)
                {
                  if (dword_100969808 > 50 || dword_100969808 == -1 && !_LogCategory_Initialize()) {
                    goto LABEL_93;
                  }
                  BOOL v31 = "?";
                  if (v30 <= 4) {
                    BOOL v31 = off_1008D1C78[(char)v30];
                  }
                  uint64_t v32 = "?";
                  if (v64 <= 0xE) {
                    uint64_t v32 = off_1008D1CA0[v60];
                  }
                  id v57 = v32;
                  char v55 = v31;
                  uint64_t v56 = v58;
                  id v52 = v19;
                  uint64_t v54 = v17;
LABEL_67:
                  LogPrintF();
LABEL_93:
                  char v61 = 0;
                  int v35 = 2;
                  goto LABEL_94;
                }
                if (dword_100969808 > 50 || dword_100969808 == -1 && !_LogCategory_Initialize()) {
                  goto LABEL_85;
                }
                id v36 = "?";
                if (v64 <= 0xE) {
                  id v36 = off_1008D1CA0[v60];
                }
                id v57 = v36;
                char v55 = "Watch";
                uint64_t v56 = v64;
                id v52 = v19;
                uint64_t v54 = 10;
              }
LABEL_84:
              LogPrintF();
              goto LABEL_85;
            }
            if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize()))
            {
              unsigned __int8 v29 = "?";
              if (v64 <= 0xE) {
                unsigned __int8 v29 = off_1008D1CA0[v60];
              }
              uint64_t v54 = v17;
              char v55 = v29;
              id v52 = v19;
              LogPrintF();
            }
            int v35 = 3;
          }

          char v12 = 1;
          id v4 = v62;
        }
        else
        {
          if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize()))
          {
            unint64_t v24 = (unint64_t)[v4 type];
            uint64_t v25 = "?";
            if (v24 <= 6) {
              uint64_t v25 = off_1008D1BF0[v24];
            }
            id v52 = v19;
            uint64_t v54 = (uint64_t)v25;
            LogPrintF();
          }
          id v21 = 0;
          int v35 = 3;
        }
LABEL_98:

        uint64_t v6 = v65;
        if (v35 != 3) {
          goto LABEL_104;
        }
        id v15 = (char *)v15 + 1;
      }
      while (v11 != v15);
      id v37 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v66 objects:v72 count:16];
      id v11 = v37;
      if (!v37)
      {
LABEL_104:

        uint64_t v8 = v64;
        BOOL v38 = v61;
        if (v12) {
          goto LABEL_115;
        }
        goto LABEL_107;
      }
    }
  }

  BOOL v38 = 1;
LABEL_107:
  if (![(SDStatusMonitor *)self->_statusMonitor screenOn]
    && [v4 type] == (id)6
    && GestaltGetDeviceClass() == 1)
  {
    if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v38 = 0;
  }
LABEL_115:
  id v39 = [(NSMutableDictionary *)self->_bleNearbyInfoDevices count];
  if (!v39 && dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  int caForce = self->_caForce;
  if ((caForce & 0x80000000) == 0)
  {
    if (dword_100969808 <= 50)
    {
      if (dword_100969808 != -1 || (int v42 = _LogCategory_Initialize(), caForce = self->_caForce, v42))
      {
        if (caForce) {
          id v41 = "yes";
        }
        else {
          id v41 = "no";
        }
        uint64_t v53 = v41;
        LogPrintF();
        int caForce = self->_caForce;
      }
    }
    BOOL v38 = caForce != 0;
  }
  -[NSMutableSet removeObject:](self->_caRequests, "removeObject:", v4, v53);
  uint64_t v43 = [v4 completionHandler];
  int v44 = (void *)v43;
  if (v43) {
    (*(void (**)(uint64_t, void, BOOL, void))(v43 + 16))(v43, 0, v38, 0);
  }
  [(SDNearbyAgent *)self _update];
  v70[0] = @"eventType";
  uint64_t v45 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 type]);
  v71[0] = v45;
  v70[1] = @"activityLevel";
  id v46 = +[NSNumber numberWithUnsignedChar:v8];
  v71[1] = v46;
  v70[2] = @"otherDevicesCount";
  id v47 = +[NSNumber numberWithInt:v39];
  v71[2] = v47;
  v70[3] = @"bestIsMe";
  uint64_t v48 = +[NSNumber numberWithBool:v38];
  v71[3] = v48;
  v71[4] = &__kCFBooleanFalse;
  void v70[4] = @"skipScanBcPhoneCall";
  v70[5] = @"skipScanBcVeryActive";
  v71[5] = &__kCFBooleanFalse;
  v70[6] = @"MsgScans";
  id v49 = +[NSNumber numberWithUnsignedInt:self->_caMessageScans];
  v71[6] = v49;
  v70[7] = @"MsgNoScans";
  id v50 = +[NSNumber numberWithUnsignedInt:self->_caMessageNoScans];
  v71[7] = v50;
  uint64_t v51 = +[NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:8];
  SFMetricsLog();

  if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    [v62 type];
    LogPrintF();
  }
}

- (void)coordinatedAlertRequestCancel:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(NSMutableSet *)self->_caRequests removeObject:v5];
  [(NSMutableSet *)self->_caRequestsNoScans removeObject:v5];

  [(SDNearbyAgent *)self _update];
}

- (BOOL)isWifiCritical
{
  return [(SDStatusMonitor *)self->_statusMonitor wirelessCritical];
}

- (void)_enableEnhancedDiscovery:(id)a3
{
}

- (void)_enableEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (self->_enhancedDiscoveryShouldRun)
  {
    enhancedDiscoveryUseCases = self->_enhancedDiscoveryUseCases;
    uint64_t v8 = +[NSNumber numberWithUnsignedInt:v4];
    [(NSMutableSet *)enhancedDiscoveryUseCases addObject:v8];
  }
  else if ([(SDNearbyAgent *)self isWifiCritical])
  {
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      if ((int)v4 >= 0x20000)
      {
        if ((int)v4 >= 327680)
        {
          if ((int)v4 > 589824)
          {
            if ((int)v4 <= 2147418111)
            {
              switch(v4)
              {
                case 0x90001:
                  uint64_t v9 = "FindNearbyPencil";
                  break;
                case 0xA0000:
                  uint64_t v9 = "AccessDigitalHomeKey";
                  break;
                case 0xC0000:
                  uint64_t v9 = "ProxControlDeviceClose";
                  break;
                default:
LABEL_155:
                  uint64_t v9 = "?";
                  break;
              }
            }
            else
            {
              switch((int)v4)
              {
                case 2147418112:
                  uint64_t v9 = "InternalTestNoLockScan";
                  break;
                case 2147418113:
                  uint64_t v9 = "InternalTestNoScreenOffScan";
                  break;
                case 2147418114:
                  uint64_t v9 = "InternalTestScanWithNoDups";
                  break;
                case 2147418115:
                  uint64_t v9 = "InternalTestScanWithDups";
                  break;
                case 2147418116:
                  uint64_t v9 = "InternalTestScanFor20Seconds";
                  break;
                case 2147418117:
                  uint64_t v9 = "InternalTestActiveScan";
                  break;
                case 2147418118:
                  uint64_t v9 = "InternalTestUUIDScan";
                  break;
                case 2147418119:
                  uint64_t v9 = "InternalTestScanFor10ClockSeconds";
                  break;
                case 2147418120:
                  uint64_t v9 = "InternalTestScanBoost";
                  break;
                default:
                  goto LABEL_155;
              }
            }
          }
          else if ((int)v4 > 458752)
          {
            switch((int)v4)
            {
              case 524288:
                uint64_t v9 = "ADPD";
                break;
              case 524289:
                uint64_t v9 = "ADPDBuffer";
                break;
              case 524290:
                uint64_t v9 = "MicroLocation";
                break;
              case 524291:
                uint64_t v9 = "MicroLocationLeech";
                break;
              default:
                if (v4 == 458753)
                {
                  uint64_t v9 = "PrecisionFindingFindee";
                }
                else
                {
                  if (v4 != 589824) {
                    goto LABEL_155;
                  }
                  uint64_t v9 = "FindNearbyRemote";
                }
                break;
            }
          }
          else
          {
            switch((int)v4)
            {
              case 393216:
                uint64_t v9 = "CaptiveNetworkJoin";
                break;
              case 393217:
                uint64_t v9 = "UseCaseSIMTransfer";
                break;
              case 393218:
                uint64_t v9 = "MacSetup";
                break;
              case 393219:
                uint64_t v9 = "AppleIDSignIn";
                break;
              case 393220:
                uint64_t v9 = "AppleIDSignInSettings";
                break;
              default:
                if (v4 == 327680)
                {
                  uint64_t v9 = "RapportThirdParty";
                }
                else
                {
                  if (v4 != 458752) {
                    goto LABEL_155;
                  }
                  uint64_t v9 = "PrecisionFindingFinder";
                }
                break;
            }
          }
        }
        else
        {
          switch((int)v4)
          {
            case 131072:
              uint64_t v9 = "SharingDefault";
              break;
            case 131073:
              uint64_t v9 = "SharingPhoneAutoUnlock";
              break;
            case 131074:
              uint64_t v9 = "SharingSiriWatchAuth";
              break;
            case 131075:
              uint64_t v9 = "SharingMacAutoUnlock";
              break;
            case 131076:
              uint64_t v9 = "SharingEDTScreenOn";
              break;
            case 131077:
              uint64_t v9 = "SharingEDTWiFiDisabled";
              break;
            case 131078:
              uint64_t v9 = "SharingEDTWombatEligibleAsDefaultCamera";
              break;
            case 131079:
              uint64_t v9 = "SharingEDTWombatCameraPicker";
              break;
            case 131080:
              uint64_t v9 = "SharingWombatBackground";
              break;
            case 131081:
              uint64_t v9 = "SharingUniversalControl";
              break;
            case 131082:
              uint64_t v9 = "SharingPeopleProximity";
              break;
            case 131083:
              uint64_t v9 = "SharingEDTEnsembleOpenDisplayPrefs";
              break;
            case 131084:
              uint64_t v9 = "SharingEDTNearbydMotionStopped";
              break;
            case 131085:
              uint64_t v9 = "SharingDoubleBoostGenericScan";
              break;
            case 131086:
              uint64_t v9 = "SharingEDTIncomingAdvertisement ";
              break;
            case 131087:
              uint64_t v9 = "SharingEDTWombatStreamStart";
              break;
            case 131088:
              uint64_t v9 = "SharingOYAutoUnlock";
              break;
            case 131089:
              goto LABEL_155;
            case 131090:
              uint64_t v9 = "SharingAirDrop";
              break;
            case 131091:
              uint64_t v9 = "SharingNearbyInvitationHost";
              break;
            case 131092:
              uint64_t v9 = "SharingNearbyInvitationParticipant";
              break;
            case 131093:
              uint64_t v9 = "SharingAirDropAskToAirDrop";
              break;
            case 131094:
              uint64_t v9 = "SharingAirDropTempIdentity";
              break;
            case 131095:
              uint64_t v9 = "SharingAirDropNeedsCLink";
              break;
            case 131096:
              uint64_t v9 = "SharingRemoteWidgetUpdate";
              break;
            case 131097:
              uint64_t v9 = "SharingCountryCodeUpdate";
              break;
            case 131098:
              uint64_t v9 = "SharingMacPhoneAutoUnlock";
              break;
            case 131099:
              uint64_t v9 = "SharingVisionProDiscovery";
              break;
            case 131100:
              uint64_t v9 = "SharingVisionProStateChange";
              break;
            case 131101:
              uint64_t v9 = "SharingContinuityScreen";
              break;
            case 131102:
              uint64_t v9 = "SharingEDTRemoteDisplay";
              break;
            default:
              if (v4 == 196608)
              {
                uint64_t v9 = "DigitalIDTSA";
              }
              else
              {
                if (v4 != 0x40000) {
                  goto LABEL_155;
                }
                uint64_t v9 = "DigitalCarKeyThirdParty";
              }
              break;
          }
        }
      }
      else if (v4 <= 0x20000)
      {
        switch((int)v4)
        {
          case 65536:
            uint64_t v9 = "FindMyAction";
            break;
          case 65537:
            uint64_t v9 = "FindMyBackground";
            break;
          case 65538:
            uint64_t v9 = "FindMyActionHELE";
            break;
          case 65539:
            uint64_t v9 = "FindMyBackgroundHELE";
            break;
          case 65540:
            uint64_t v9 = "FindMyActionTransient";
            break;
          case 65541:
            uint64_t v9 = "FindMyBackgroundTransient";
            break;
          case 65542:
            uint64_t v9 = "FindMyActionHELETransient";
            break;
          case 65543:
            uint64_t v9 = "FindMyBackgroundHELETransient";
            break;
          case 65544:
            uint64_t v9 = "FindMyNotOptedIn";
            break;
          case 65545:
            uint64_t v9 = "FindMyOptedIn";
            break;
          case 65546:
            uint64_t v9 = "FindMySepAlertsEnabled";
            break;
          case 65547:
            uint64_t v9 = "FindMyTemporaryAggressiveLegacy";
            break;
          case 65548:
            uint64_t v9 = "FindMyTemporaryLongAggressive";
            break;
          case 65549:
            uint64_t v9 = "FindMyBTFindingUserInitiated";
            break;
          case 65550:
            uint64_t v9 = "FindMyHELE";
            break;
          case 65551:
            uint64_t v9 = "FindMyBeaconOnDemand";
            break;
          case 65552:
            uint64_t v9 = "FindMyWildTimedScan";
            break;
          case 65553:
            uint64_t v9 = "FindMyBackgroundLeechScan";
            break;
          case 65554:
            uint64_t v9 = "FindMySnifferMode";
            break;
          case 65555:
            uint64_t v9 = "FindMyUnpair";
            break;
          case 65556:
            uint64_t v9 = "FindMyUnpairHELE";
            break;
          case 65557:
            uint64_t v9 = "FindMyPlaySound";
            break;
          case 65558:
            uint64_t v9 = "FindMyPlaySoundHELE";
            break;
          case 65559:
            uint64_t v9 = "FindMyNotOptedInBeepOnMoveWaking";
            break;
          case 65560:
            uint64_t v9 = "FindMyUTTransient";
            break;
          case 65561:
            uint64_t v9 = "FindMyUTHELETransient";
            break;
          default:
            JUMPOUT(0);
        }
      }
      else
      {
        uint64_t v9 = "Unspecified";
        switch((int)v4)
        {
          case 0:
            break;
          case 1:
            uint64_t v9 = "HealthKit";
            break;
          case 2:
            uint64_t v9 = "HomeKit";
            break;
          case 3:
            uint64_t v9 = "FindMyObjectConnection";
            break;
          case 4:
            uint64_t v9 = "FindMyObjectConnectionTransient";
            break;
          case 5:
            uint64_t v9 = "MIDI";
            break;
          case 6:
            uint64_t v9 = "Continuity";
            break;
          case 7:
            uint64_t v9 = "InstantHotSpot";
            break;
          case 8:
            uint64_t v9 = "NearBy";
            break;
          case 9:
            uint64_t v9 = "Sharing";
            break;
          case 10:
            uint64_t v9 = "HearingSupport";
            break;
          case 11:
            uint64_t v9 = "Magnet";
            break;
          case 12:
            uint64_t v9 = "HID";
            break;
          case 13:
            uint64_t v9 = "LEA";
            break;
          case 14:
            uint64_t v9 = "External";
            break;
          case 15:
            uint64_t v9 = "ExternalMedical";
            break;
          case 16:
            uint64_t v9 = "ExternalLock";
            break;
          case 17:
            uint64_t v9 = "ExternalWatch";
            break;
          case 18:
            uint64_t v9 = "SmartRouting";
            break;
          case 19:
            uint64_t v9 = "DigitalID";
            break;
          case 20:
            uint64_t v9 = "DigitalKey";
            break;
          case 21:
            uint64_t v9 = "DigitalCarKey";
            break;
          case 22:
            uint64_t v9 = "HeySiri";
            break;
          case 23:
            uint64_t v9 = "ThirdPartyApp";
            break;
          case 24:
            uint64_t v9 = "CNJ";
            break;
          default:
            switch((int)v4)
            {
              case 256:
                uint64_t v9 = "DevicePresenceDetection";
                break;
              case 257:
                uint64_t v9 = "AudioBox";
                break;
              case 258:
                uint64_t v9 = "SIMTransfer";
                break;
              case 259:
                uint64_t v9 = "ProximityScreenOnLeechScan";
                break;
              case 260:
                uint64_t v9 = "MacMigrate";
                break;
              case 263:
                uint64_t v9 = "HIDUARTService";
                break;
              case 264:
                uint64_t v9 = "AccessibilitySwitchControlPairing";
                break;
              case 265:
                uint64_t v9 = "BaseBandFastConnect";
                break;
              case 266:
                uint64_t v9 = "SafetyAlerts";
                break;
              case 267:
                uint64_t v9 = "LECarPlay";
                break;
              case 268:
                uint64_t v9 = "TCCBluetooth";
                break;
              case 269:
                uint64_t v9 = "AOPBufferLeech";
                break;
              default:
                goto LABEL_155;
            }
            break;
        }
      }
      uint64_t v18 = v9;
      uint64_t v19 = v4;
      id v17 = v6;
      LogPrintF();
    }
    self->_BOOL enhancedDiscoveryShouldRun = 1;
    self->_enhancedDiscoveryAdvActive = 1;
    id v10 = self->_enhancedDiscoveryUseCases;
    id v11 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v4, v17, v18, v19);
    [(NSMutableSet *)v10 addObject:v11];

    v22[0] = v6;
    v21[0] = @"Reason";
    v21[1] = @"Enabled";
    char v12 = +[NSNumber numberWithBool:self->_enhancedDiscoveryShouldRun];
    v22[1] = v12;
    uint64_t v13 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    SFPowerLogEvent();

    if (!self->_enhancedDiscoveryTimer)
    {
      uint64_t v14 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      enhancedDiscoveryTimer = self->_enhancedDiscoveryTimer;
      self->_enhancedDiscoveryTimer = v14;

      char v16 = self->_enhancedDiscoveryTimer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10021DC38;
      handler[3] = &unk_1008CA4B8;
      handler[4] = self;
      dispatch_source_set_event_handler(v16, handler);
      SFDispatchTimerSet();
      dispatch_resume((dispatch_object_t)self->_enhancedDiscoveryTimer);
    }
  }
}

- (void)_disableEnhancedDiscovery:(id)a3
{
  id v4 = a3;
  if (self->_enhancedDiscoveryShouldRun)
  {
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      id v10 = v4;
      LogPrintF();
    }
    self->_BOOL enhancedDiscoveryShouldRun = 0;
    self->_enhancedDiscoveryAdvActive = 0;
    [(NSMutableSet *)self->_enhancedDiscoveryUseCases removeAllObjects];
    enhancedDiscoveryTimer = self->_enhancedDiscoveryTimer;
    if (enhancedDiscoveryTimer)
    {
      id v6 = enhancedDiscoveryTimer;
      dispatch_source_cancel(v6);
      id v7 = self->_enhancedDiscoveryTimer;
      self->_enhancedDiscoveryTimer = 0;
    }
    v11[1] = @"Enabled";
    v12[0] = v4;
    v11[0] = @"Reason";
    uint64_t v8 = +[NSNumber numberWithBool:self->_enhancedDiscoveryShouldRun];
    v12[1] = v8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
    SFPowerLogEvent();
  }
}

- (void)_enhancedDiscoveryScreenChange:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(SDNearbyAgent *)self _allowEnhancedDiscovery]) {
    return;
  }
  if (v3)
  {
    [(SDNearbyAgent *)self _activityMonitorLastUserEventDelta];
    BOOL v6 = v5 < 5.0 && v5 > 0.0;
    if (dword_100969808 <= 20 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (!v6)
    {
      if (dword_100969808 > 40 || dword_100969808 == -1 && !_LogCategory_Initialize()) {
        return;
      }
      goto LABEL_27;
    }
    if ([(SDStatusMonitor *)self->_statusMonitor wirelessCritical])
    {
      if (dword_100969808 > 40 || dword_100969808 == -1 && !_LogCategory_Initialize()) {
        return;
      }
LABEL_27:
      LogPrintF();
      return;
    }
    if (![(SDNearbyAgent *)self _bleNearbyInfoAdvertiserShouldAdvertise])
    {
      if (dword_100969808 > 40 || dword_100969808 == -1 && !_LogCategory_Initialize()) {
        return;
      }
      goto LABEL_27;
    }
    [(SDNearbyAgent *)self _enableEnhancedDiscovery:@"UserInitiatedScreenOn" useCase:131076];
  }
  else
  {
    [(SDNearbyAgent *)self _disableEnhancedDiscovery:@"ScreenOff"];
  }
}

- (int)_allowEnhancedDiscovery
{
  int result = self->_allowEnhancedDiscovery;
  if (result < 0)
  {
    int v4 = SFDeviceClassCodeGet();
    int v5 = SFDeviceClassCodeGet();
    int v6 = SFDeviceClassCodeGet();
    int v7 = SFDeviceClassCodeGet();
    BOOL v8 = v4 == 5 || v5 == 3;
    int v36 = v6;
    int v11 = v8 || v6 == 1 || v7 == 6;
    int v34 = v5;
    int v35 = v11;
    id v37 = self;
    [(SDNearbyAgent *)self idsDeviceArray];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v12 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v12)
    {
      id v13 = v12;
      int v14 = 0;
      int v38 = 0;
      int v39 = 0;
      int v15 = 0;
      uint64_t v16 = *(void *)v42;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v42 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v19 = [v18 modelIdentifier];
          GestaltProductTypeStringToDeviceClass();

          if (v18) {
            [v18 operatingSystemVersion];
          }
          if (DeviceOSVersionAtOrLater())
          {
            id v20 = [v18 modelIdentifier];
            unsigned int v21 = [v20 containsString:@"Mac"];

            if (v21)
            {
              ++v14;
            }
            else
            {
              uint64_t v22 = [v18 modelIdentifier];
              unsigned int v23 = [v22 containsString:@"iPad"];

              if (v23)
              {
                ++v38;
              }
              else
              {
                unint64_t v24 = [v18 modelIdentifier];
                unsigned int v25 = [v24 containsString:@"iPhone"];

                v39 += v25;
              }
            }
          }
          if (DeviceOSVersionAtOrLater())
          {
            uint64_t v26 = [v18 modelIdentifier];
            unsigned int v27 = [v26 containsString:@"AppleTV"];

            v15 += v27;
          }
        }
        id v13 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v13);
    }
    else
    {
      int v14 = 0;
      int v38 = 0;
      int v39 = 0;
      int v15 = 0;
    }
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v4 != 5 || v14 || v38 || v39)
    {
      if (v36 == 1 || v34 == 3)
      {
        if (v14 | v15)
        {
          unsigned int v30 = +[AVCaptureDevice continuityCaptureLastUsedDate];
          id v28 = v37;
          int v29 = v35;
          if (v30)
          {
            BOOL v31 = +[NSDate date];
            [v31 timeIntervalSinceDate:v30];
            double v33 = v32;

            if (v33 > 3024000.0)
            {
              [(SDNearbyAgent *)v37 _unregisterForMagicMountUpdates];
              int v29 = 0;
            }
            if (dword_100969808 <= 40 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
          }
          else
          {
            if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            int v29 = 0;
          }
        }
        else
        {
          id v28 = v37;
          if (dword_100969808 <= 40 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          int v29 = 0;
        }
        if (v28->_inDiscoverySession && (v29 & 1) == 0)
        {
          if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          int v29 = 1;
        }
      }
      else
      {
        id v28 = v37;
        int v29 = v35;
      }
    }
    else if (dword_100969808 > 40)
    {
      int v29 = 0;
      id v28 = v37;
    }
    else
    {
      id v28 = v37;
      if (dword_100969808 != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      int v29 = 0;
    }
    v28->_allowEnhancedDiscovery = v29;

    return v28->_allowEnhancedDiscovery;
  }
  return result;
}

- (void)_checkConditionsForEnhancedDiscovery
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  self->_allowEnhancedDiscovery = -1;
  if ([(SDNearbyAgent *)self _allowEnhancedDiscovery] < 1)
  {
    [(SDNearbyAgent *)self _unregisterForMagicMountUpdates];
  }
  else
  {
    [(SDNearbyAgent *)self _registerForMagicMountUpdates];
  }
}

- (void)_notifyCameraConfigChange
{
  BOOL v3 = +[AVCaptureDevice continuityCaptureLastUsedDate];
  if (!v3)
  {
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    int v4 = +[NSDistributedNotificationCenter defaultCenter];
    [v4 postNotificationName:@"ContinuityCaptureNotificationOnBoardingComplete" object:@"YES" userInfo:0 deliverImmediately:1];

    if (!self->_cameraConfigChangeTimer)
    {
      int v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      cameraConfigChangeTimer = self->_cameraConfigChangeTimer;
      self->_cameraConfigChangeTimer = v5;

      int v7 = self->_cameraConfigChangeTimer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10021E7BC;
      handler[3] = &unk_1008CA4B8;
      handler[4] = self;
      dispatch_source_set_event_handler(v7, handler);
      SFDispatchTimerSet();
      dispatch_resume((dispatch_object_t)self->_cameraConfigChangeTimer);
    }
  }
}

- (void)_enhancedDiscoveryTimerFired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [(SDNearbyAgent *)self _disableEnhancedDiscovery:@"TimerFired"];

  [(SDNearbyAgent *)self _update];
}

- (BOOL)_deviceCanTriggerEnhancedDiscovery:(id)a3
{
  id v4 = a3;
  if (!self->_enhancedDiscoveryShouldRun
    && [(SDNearbyAgent *)self _allowEnhancedDiscovery]
    && ![(SDNearbyAgent *)self isWifiCritical]
    && [v4 enhancedDiscovery]
    && [v4 paired])
  {
    int v7 = SFDeviceModel();
    BOOL v8 = [v4 model];
    if ([v8 containsString:@"iPhone"])
    {
      if (([v7 containsString:@"iPhone"] & 1) == 0)
      {
        unsigned __int8 v9 = [v7 containsString:@"Mac"];

        if ((v9 & 1) == 0) {
          goto LABEL_20;
        }
        goto LABEL_16;
      }
    }
    else
    {
      id v10 = [v4 model];
      if (([v10 containsString:@"Mac"] & 1) == 0)
      {

        goto LABEL_20;
      }
      if (![v7 containsString:@"iPhone"])
      {
        unsigned __int8 v14 = [v7 containsString:@"Mac"];

        if ((v14 & 1) == 0)
        {
LABEL_20:
          int v11 = [v4 model];
          if ([v11 containsString:@"iPad"])
          {
            if (([v7 containsString:@"iPad"] & 1) == 0)
            {
              unsigned __int8 v12 = [v7 containsString:@"Mac"];

              if ((v12 & 1) == 0) {
                goto LABEL_37;
              }
LABEL_28:
              if (dword_100969808 > 30 || dword_100969808 == -1 && !_LogCategory_Initialize()) {
                goto LABEL_39;
              }
              goto LABEL_30;
            }
LABEL_27:

            goto LABEL_28;
          }
          id v13 = [v4 model];
          if ([v13 containsString:@"Mac"])
          {
            if ([v7 containsString:@"iPad"])
            {

              goto LABEL_27;
            }
            unsigned __int8 v15 = [v7 containsString:@"Mac"];

            if (v15) {
              goto LABEL_28;
            }
          }
          else
          {
          }
LABEL_37:
          BOOL v5 = 0;
LABEL_40:

          goto LABEL_3;
        }
LABEL_16:
        if (dword_100969808 > 30 || dword_100969808 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_39;
        }
LABEL_30:
        LogPrintF();
LABEL_39:
        BOOL v5 = 1;
        goto LABEL_40;
      }
    }
    goto LABEL_16;
  }
  BOOL v5 = 0;
LABEL_3:

  return v5;
}

- (void)deviceDiscoveryRequestStart:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10021EBDC;
  v7[3] = &unk_1008CA640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_deviceDiscoveryRequestStart:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  ddRequests = self->_ddRequests;
  if (!ddRequests)
  {
    id v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    int v7 = self->_ddRequests;
    self->_ddRequests = v6;

    ddRequests = self->_ddRequests;
  }
  [(NSMutableSet *)ddRequests addObject:v4];
  if (([v4 discoveryFlags] & 0x20) != 0)
  {
    uint64_t v10 = [(SDNearbyAgent *)self idsBluetoothDeviceIDsForSharing];
LABEL_15:
    id v8 = (void *)v10;
    [v4 setDeviceFilter:v10];
    goto LABEL_16;
  }
  if (([v4 discoveryFlags] & 0x100000) != 0)
  {
    uint64_t v10 = [(SDNearbyAgent *)self _idsBluetoothDeviceIDsForMe];
    goto LABEL_15;
  }
  if (([v4 discoveryFlags] & 0x200000) != 0)
  {
    uint64_t v10 = [(SDNearbyAgent *)self _idsBluetoothDeviceIDsForHomePods];
    goto LABEL_15;
  }
  if (([v4 discoveryFlags] & 0x1000000) == 0) {
    goto LABEL_17;
  }
  id v8 = +[SDAutoUnlockTransport sharedTransport];
  unsigned __int8 v9 = [v8 approveBluetoothIDs];
  [v4 setDeviceFilter:v9];

LABEL_16:
LABEL_17:
  int v34 = self;
  if (([v4 discoveryFlags] & 0x10) != 0)
  {
    id v12 = [(SFBLEScanner *)self->_bleNearbyActionScanner scanState];
    self->_ddNearbyActionEnabled = 1;
    if ([v4 overrideScreenOff]) {
      self->_ddNearbyActionScreenOff = 1;
    }
    id v11 = [v4 deviceFoundHandler];

    if (!v11) {
      goto LABEL_36;
    }
    uint64_t v13 = 424;
    goto LABEL_35;
  }
  if ([v4 discoveryFlags])
  {
    id v12 = [(SFBLEScanner *)self->_bleNearbyInfoScanner scanState];
    self->_ddNearbyInfoEnabled = 1;
    if ([v4 overrideScreenOff]) {
      self->_ddNearbyInfoScreenOff = 1;
    }
    id v11 = [v4 deviceFoundHandler];

    if (!v11) {
      goto LABEL_36;
    }
    uint64_t v13 = 440;
    goto LABEL_35;
  }
  if (([v4 discoveryFlags] & 2) == 0)
  {
    id v11 = 0;
    goto LABEL_39;
  }
  id v12 = [(SFBLEScanner *)self->_bleProximityPairingScanner scanState];
  if (![v4 rssiThreshold]) {
    [v4 setRssiThreshold:-60];
  }
  self->_ddProximityPairingEnabled = 1;
  if ([v4 overrideScreenOff]) {
    self->_ddProximityPairingScreenOff = 1;
  }
  id v11 = [v4 deviceFoundHandler];

  if (v11)
  {
    uint64_t v13 = 456;
LABEL_35:
    id v11 = *(id *)((char *)&self->super.isa + v13);
  }
LABEL_36:
  if (v12)
  {
    unsigned __int8 v14 = [v4 scanStateChangedHandler];

    if (v14)
    {
      unsigned __int8 v15 = [v4 scanStateChangedHandler];
      ((void (**)(void, id))v15)[2](v15, v12);
    }
  }
LABEL_39:
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v16 = v11;
  id v17 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v36;
    do
    {
      id v20 = 0;
      do
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v35 + 1) + 8 * (void)v20);
        uint64_t v22 = [v16 objectForKeyedSubscript:v21, v32, v33];
        if (v22)
        {
          uint64_t v23 = [v4 deviceFilter];
          if (!v23
            || (unint64_t v24 = (void *)v23,
                [v4 deviceFilter],
                unsigned int v25 = objc_claimAutoreleasedReturnValue(),
                unsigned int v26 = [v25 containsObject:v21],
                v25,
                v24,
                v26))
          {
            if ([v4 rssiThreshold]
              && ([v22 bleDevice],
                  unsigned int v27 = objc_claimAutoreleasedReturnValue(),
                  id v28 = [v27 rssi],
                  id v29 = [v4 rssiThreshold],
                  v27,
                  (uint64_t)v28 < (uint64_t)v29))
            {
              if (dword_100969808 <= 10 && (dword_100969808 != -1 || _LogCategory_Initialize()))
              {
                double v32 = v22;
                id v33 = v4;
                LogPrintF();
              }
            }
            else
            {
              unsigned int v30 = [v4 deviceFoundHandler];
              ((void (**)(void, void *))v30)[2](v30, v22);
            }
          }
        }

        id v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v31 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
      id v18 = v31;
    }
    while (v31);
  }

  if ([v4 fastScanMode] == (id)1) {
    [(SDNearbyAgent *)v34 _deviceDiscoveryFastScanStart:v4 device:0 reason:@"Start"];
  }
  [(SDNearbyAgent *)v34 _update];
}

- (void)deviceDiscoveryRequestStop:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(NSMutableSet *)self->_ddRequests removeObject:v4];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  BOOL v5 = self->_ddRequests;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v6)
  {

    LOBYTE(v12) = 0;
    char v11 = 0;
    LOBYTE(v10) = 0;
    char v16 = 0;
    LOBYTE(v9) = 0;
    goto LABEL_23;
  }
  id v7 = v6;
  id v20 = v4;
  uint64_t v21 = self;
  char v8 = 0;
  int v9 = 0;
  char v22 = 0;
  int v10 = 0;
  char v11 = 0;
  int v12 = 0;
  uint64_t v13 = *(void *)v24;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v24 != v13) {
        objc_enumerationMutation(v5);
      }
      unsigned __int8 v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      if (([v15 discoveryFlags] & 0x10) != 0)
      {
        v9 |= [v15 overrideScreenOff];
        char v8 = 1;
      }
      if ([v15 discoveryFlags])
      {
        v10 |= [v15 overrideScreenOff];
        char v22 = 1;
      }
      if (([v15 discoveryFlags] & 2) != 0)
      {
        v12 |= [v15 overrideScreenOff];
        char v11 = 1;
      }
    }
    id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }
  while (v7);

  if ((v8 & 1) == 0)
  {
    id v4 = v20;
    self = v21;
    char v16 = v22;
LABEL_23:
    self->_ddNearbyActionEnabled = 0;
    [(NSMutableDictionary *)self->_ddNearbyActionDevices removeAllObjects];
    ddNearbyActionDevices = self->_ddNearbyActionDevices;
    self->_ddNearbyActionDevices = 0;

    self->_ddNearbyActionScreenOff = v9 & 1;
    if (v16) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  id v4 = v20;
  self = v21;
  v21->_ddNearbyActionScreenOff = v9 & 1;
  if ((v22 & 1) == 0)
  {
LABEL_24:
    self->_ddNearbyInfoEnabled = 0;
    [(NSMutableDictionary *)self->_ddNearbyInfoDevices removeAllObjects];
    ddNearbyInfoDevices = self->_ddNearbyInfoDevices;
    self->_ddNearbyInfoDevices = 0;
  }
LABEL_25:
  self->_ddNearbyInfoScreenOff = v10 & 1;
  if ((v11 & 1) == 0)
  {
    self->_ddProximityPairingEnabled = 0;
    [(NSMutableDictionary *)self->_ddProximityPairingDevices removeAllObjects];
    ddProximityPairingDevices = self->_ddProximityPairingDevices;
    self->_ddProximityPairingDevices = 0;
  }
  self->_ddProximityPairingScreenOff = v12 & 1;
  [(SDNearbyAgent *)self _identificationHandleDiscoveryStop];
  [(SDNearbyAgent *)self _update];
}

- (void)deviceDiscoveryRequestUpdate:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10021F3EC;
  v7[3] = &unk_1008CA640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)deviceDiscoveryFastScanTrigger:(id)a3 reason:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  [(SDNearbyAgent *)self _deviceDiscoveryFastScanStart:v8 device:0 reason:v7];
}

- (void)deviceDiscoveryFastScanCancel:(id)a3 reason:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  [v8 setFastScanMode:0];
  [(SDNearbyAgent *)self _deviceDiscoveryFastScanStop:v8 reset:1 reason:v7];
}

- (void)deviceDiscoveryTriggerEnhancedDiscovery:(id)a3 reason:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([(SDNearbyAgent *)self _allowEnhancedDiscovery])
  {
    if (dword_100969808 <= 60 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SDNearbyAgent *)self _enableEnhancedDiscovery:v5 useCase:0];
    [(SDNearbyAgent *)self _update];
  }
  else if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)deviceDiscoveryTriggerEnhancedDiscovery:(id)a3 reason:(id)a4 useCase:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v14 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([(SDNearbyAgent *)self _allowEnhancedDiscovery])
  {
    if (dword_100969808 <= 10 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      int v9 = [v14 useCases];
      id v10 = [v9 count];
      [v14 useCases];
      v13 = id v12 = v10;
      id v11 = v8;
      LogPrintF();
    }
    -[SDNearbyAgent _enableEnhancedDiscovery:useCase:](self, "_enableEnhancedDiscovery:useCase:", v8, v5, v11, v12, v13);
    [(SDNearbyAgent *)self _update];
  }
  else if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_deviceDiscoveryFastScanEvaluate:(id)a3 device:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_activityScreenOn && self->_activityUIUnlocked && [v15 fastScanMode] == (id)2)
  {
    if ([v15 rssiThreshold])
    {
      id v7 = [v6 bleDevice];
      if ([v7 rssi])
      {
        id v8 = [v6 bleDevice];
        id v9 = [v8 rssi];
        id v10 = [v15 rssiThreshold];

        if ((uint64_t)v9 < (uint64_t)v10) {
          goto LABEL_23;
        }
      }
      else
      {
      }
    }
    unint64_t v11 = (unint64_t)[v15 discoveryFlags];
    if (v11 & 0x20000) != 0 && ([v6 needsAWDL])
    {
      CFStringRef v12 = @"MatchAWDL";
LABEL_22:
      [(SDNearbyAgent *)self _deviceDiscoveryFastScanStart:v15 device:v6 reason:v12];
      goto LABEL_23;
    }
    if (v11 & 0x40) != 0 && ([v6 needsKeyboardOnly])
    {
      CFStringRef v12 = @"MatchKeyboard";
      goto LABEL_22;
    }
    if ((v11 & 2) != 0)
    {
      CFStringRef v12 = @"MatchProx";
      goto LABEL_22;
    }
    if ((v11 & 0x601FF80) != 0 && [v6 needsSetup])
    {
      int v13 = [v6 deviceActionType];
      if (v13 > 32)
      {
        if (v13 == 33)
        {
          uint64_t v14 = 0x2000000;
        }
        else if (v13 == 36)
        {
          uint64_t v14 = 0x4000000;
        }
        else
        {
LABEL_34:
          uint64_t v14 = 0;
        }
      }
      else
      {
        switch(v13)
        {
          case 8:
            uint64_t v14 = 2048;
            break;
          case 9:
            uint64_t v14 = 512;
            break;
          case 10:
          case 12:
          case 14:
          case 15:
          case 16:
          case 17:
          case 18:
          case 19:
            goto LABEL_34;
          case 11:
            uint64_t v14 = 256;
            break;
          case 13:
            uint64_t v14 = 1024;
            break;
          case 20:
            uint64_t v14 = 0x4000;
            break;
          case 21:
            uint64_t v14 = 0x8000;
            break;
          default:
            if (v13 != 1) {
              goto LABEL_34;
            }
            uint64_t v14 = 128;
            break;
        }
      }
      if ((v14 & v11) != 0)
      {
        CFStringRef v12 = @"MatchSetup";
        goto LABEL_22;
      }
    }
    else if ((v11 & 0x800000) != 0 && ([v6 deviceFlags] & 0x200) != 0)
    {
      CFStringRef v12 = @"MatchClose";
      goto LABEL_22;
    }
  }
LABEL_23:
}

- (void)_deviceDiscoveryFastScanStart:(id)a3 device:(id)a4 reason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_activityScreenOn && self->_activityUIUnlocked)
  {
    mach_absolute_time();
    if ((unint64_t)UpTicksToSeconds() > 0x63)
    {
      if (![v8 scanRateOverride])
      {
        if (v9)
        {
          if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize()))
          {
            [v9 bleDevice];
            id v15 = v14 = v10;
            LogPrintF();
          }
        }
        else if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize()))
        {
          id v14 = v10;
          LogPrintF();
        }
        [v8 setScanRateOverride:50 v14 v15];
        [(SDNearbyAgent *)self _update];
      }
      if (!self->_ddFastScanTimer)
      {
        unint64_t v11 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
        ddFastScanTimer = self->_ddFastScanTimer;
        self->_ddFastScanTimer = v11;

        int v13 = self->_ddFastScanTimer;
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_10022005C;
        handler[3] = &unk_1008CAF18;
        handler[4] = self;
        id v17 = v8;
        id v18 = v10;
        dispatch_source_set_event_handler(v13, handler);
        SFDispatchTimerSet();
        dispatch_resume((dispatch_object_t)self->_ddFastScanTimer);
      }
    }
    else if (!v9 && dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
LABEL_11:
      LogPrintF();
    }
  }
  else if (!v9 && dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_11;
  }
}

- (void)_deviceDiscoveryFastScanStop:(id)a3 reset:(BOOL)a4 reason:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v8 scanRateOverride]) {
    BOOL v10 = v6;
  }
  else {
    BOOL v10 = 0;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v11 = self->_ddRequests;
  id v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    id v13 = v12;
    char v14 = 0;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v11);
        }
        id v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v17 scanRateOverride])
        {
          [v17 setScanRateOverride:0];
          char v14 = 1;
        }
      }
      id v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);

    if (v14)
    {
      if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize()))
      {
        id v22 = v9;
        LogPrintF();
      }
      if (!v10)
      {
        uint64_t v18 = mach_absolute_time();
        goto LABEL_24;
      }
LABEL_22:
      uint64_t v18 = 0;
LABEL_24:
      self->_ddFastScanLastEndTicks = v18;
      goto LABEL_25;
    }
  }
  else
  {
  }
  if (v10) {
    goto LABEL_22;
  }
LABEL_25:
  ddFastScanTimer = self->_ddFastScanTimer;
  if (ddFastScanTimer)
  {
    id v20 = ddFastScanTimer;
    dispatch_source_cancel(v20);
    uint64_t v21 = self->_ddFastScanTimer;
    self->_ddFastScanTimer = 0;
  }
  [(SDNearbyAgent *)self _update];
}

- (void)_deviceDiscoveryBLEDeviceFound:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  uint64_t v48 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v47 = v6;
  id v49 = [v6 identifier];
  if (v49)
  {
    id v7 = objc_alloc_init((Class)SFDevice);
    [v7 updateWithBLEDevice:v6];
    id v46 = [(SDNearbyAgent *)self _idsBluetoothDeviceIDsForMe];
    if ([v46 containsObject:v49])
    {
      if (([v7 autoUnlockEnabled] & 1) != 0
        || ([v7 model],
            id v8 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v9 = [v8 hasPrefix:@"Watch"],
            v8,
            (v9 & 1) == 0))
      {
        [v7 setDeviceFlags:[v7 deviceFlags] | 1];
      }
    }
    unint64_t v10 = a4 - 7;
    if (a4 == 7)
    {
      ddProximityPairingDevices = self->_ddProximityPairingDevices;
      if (!ddProximityPairingDevices)
      {
        uint64_t v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        id v20 = self->_ddProximityPairingDevices;
        self->_ddProximityPairingDevices = v19;

        ddProximityPairingDevices = self->_ddProximityPairingDevices;
      }
      uint64_t v45 = ddProximityPairingDevices;
      uint64_t v17 = 2;
    }
    else
    {
      unint64_t v11 = self;
      if (a4 == 16)
      {
        [(SDNearbyAgent *)self _bleProximityUpdateNearbyInfoDevice:v7];
        [(SDNearbyAgent *)self _identificationHandleDeviceFound:v7 flags:1];
        ddNearbyInfoDevices = self->_ddNearbyInfoDevices;
        if (!ddNearbyInfoDevices)
        {
          id v22 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          long long v23 = self->_ddNearbyInfoDevices;
          self->_ddNearbyInfoDevices = v22;

          ddNearbyInfoDevices = self->_ddNearbyInfoDevices;
        }
        uint64_t v45 = ddNearbyInfoDevices;
        if ([(SDNearbyAgent *)self _deviceCanTriggerEnhancedDiscovery:v7])
        {
          [(SDNearbyAgent *)self _enableEnhancedDiscovery:@"IncomingAdv" useCase:131086];
          self->_enhancedDiscoveryAdvActive = 0;
          [(SDNearbyAgent *)self update];
        }
        uint64_t v17 = 1;
      }
      else
      {
        if (a4 != 15)
        {
LABEL_59:

          goto LABEL_60;
        }
        if ([v7 deviceActionType] == 10)
        {
          id v12 = [v7 idsIdentifier];
          id v13 = [v12 length];

          unint64_t v11 = self;
          if (!v13) {
            [(SDNearbyAgent *)self idsAddCachedIDSIdentifierToDevice:v7];
          }
        }
        [(SDNearbyAgent *)v11 _bleProximityUpdateNearbyActionDevice:v7];
        [(SDNearbyAgent *)v11 _identificationHandleDeviceFound:v7 flags:16];
        ddNearbyActionDevices = v11->_ddNearbyActionDevices;
        if (!ddNearbyActionDevices)
        {
          uint64_t v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          char v16 = v11->_ddNearbyActionDevices;
          v11->_ddNearbyActionDevices = v15;

          ddNearbyActionDevices = v11->_ddNearbyActionDevices;
        }
        uint64_t v45 = ddNearbyActionDevices;
        uint64_t v17 = 16;
      }
    }
    uint64_t v24 = [v7 rapportIdentifier];
    long long v25 = (void *)v24;
    if (v24)
    {
      uint64_t v57 = 0;
      uint64_t v58 = &v57;
      uint64_t v59 = 0x3032000000;
      uint64_t v60 = sub_100211650;
      char v61 = sub_100211660;
      id v62 = 0;
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_10022091C;
      v54[3] = &unk_1008D12B8;
      v54[4] = v24;
      id v55 = v49;
      uint64_t v56 = &v57;
      [(NSMutableDictionary *)v45 enumerateKeysAndObjectsUsingBlock:v54];
      long long v26 = (void *)v58[5];
      if (v26
        && ([v26 paired] & 1) == 0
        && ([(id)v58[5] deviceFlags] & 0x8000) == 0)
      {
        unsigned int v27 = [(id)v58[5] bleDevice];
        [(id)v58[5] setIsBLEDeviceReplaced:1];
        if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
        {
          if (v10 > 9) {
            id v28 = "?";
          }
          else {
            id v28 = off_1008D1D18[v10];
          }
          long long v43 = (void *)v58[5];
          id v44 = v7;
          long long v42 = v28;
          LogPrintF();
        }
        -[SDNearbyAgent _deviceDiscoveryBLEDeviceLost:type:](self, "_deviceDiscoveryBLEDeviceLost:type:", v27, a4, v42, v43, v44);
      }
      _Block_object_dispose(&v57, 8);
    }
    [(NSMutableDictionary *)v45 setObject:v7 forKeyedSubscript:v49];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v29 = self->_ddRequests;
    id v30 = [(NSMutableSet *)v29 countByEnumeratingWithState:&v50 objects:v63 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v51;
      do
      {
        double v32 = 0;
        do
        {
          if (*(void *)v51 != v31) {
            objc_enumerationMutation(v29);
          }
          id v33 = *(void **)(*((void *)&v50 + 1) + 8 * (void)v32);
          if (((unint64_t)objc_msgSend(v33, "discoveryFlags", v42, v43) & v17) != 0)
          {
            int v34 = [v33 deviceFilter];
            if (!v34
              || ([v33 deviceFilter],
                  long long v35 = objc_claimAutoreleasedReturnValue(),
                  unsigned int v36 = [v35 containsObject:v49],
                  v35,
                  v34,
                  v36))
            {
              if ([v33 rssiThreshold]
                && ([v7 bleDevice],
                    long long v37 = objc_claimAutoreleasedReturnValue(),
                    id v38 = [v37 rssi],
                    LODWORD(v38) = (uint64_t)v38 < (uint64_t)[v33 rssiThreshold],
                    v37,
                    v38))
              {
                if (dword_100969808 <= 10 && (dword_100969808 != -1 || _LogCategory_Initialize()))
                {
                  long long v42 = (const char *)v7;
                  long long v43 = v33;
                  LogPrintF();
                }
              }
              else
              {
                int v39 = [v33 deviceFoundHandler];

                if (v39)
                {
                  id v40 = [v33 deviceFoundHandler];
                  ((void (**)(void, id))v40)[2](v40, v7);
                }
                [(SDNearbyAgent *)v48 _deviceDiscoveryFastScanEvaluate:v33 device:v7];
              }
            }
          }
          double v32 = (char *)v32 + 1;
        }
        while (v30 != v32);
        id v41 = [(NSMutableSet *)v29 countByEnumeratingWithState:&v50 objects:v63 count:16];
        id v30 = v41;
      }
      while (v41);
    }

    goto LABEL_59;
  }
LABEL_60:
}

- (void)_deviceDiscoveryBLEDeviceLost:(id)a3 type:(int64_t)a4
{
  id v6 = [a3 identifier];
  if (v6)
  {
    if (a4 == 7)
    {
      uint64_t v13 = [(NSMutableDictionary *)self->_ddProximityPairingDevices objectForKeyedSubscript:v6];
      if (!v13) {
        goto LABEL_23;
      }
      id v8 = (void *)v13;
      [(NSMutableDictionary *)self->_ddProximityPairingDevices removeObjectForKey:v6];
      uint64_t v9 = 2;
    }
    else
    {
      if (a4 == 16)
      {
        uint64_t v14 = [(NSMutableDictionary *)self->_ddNearbyInfoDevices objectForKeyedSubscript:v6];
        if (!v14) {
          goto LABEL_23;
        }
        id v8 = (void *)v14;
        [(NSMutableDictionary *)self->_ddNearbyInfoDevices removeObjectForKey:v6];
        uint64_t v9 = 1;
        unint64_t v10 = self;
        unint64_t v11 = v8;
        uint64_t v12 = 1;
      }
      else
      {
        if (a4 != 15) {
          goto LABEL_23;
        }
        uint64_t v7 = [(NSMutableDictionary *)self->_ddNearbyActionDevices objectForKeyedSubscript:v6];
        if (!v7) {
          goto LABEL_23;
        }
        id v8 = (void *)v7;
        [(NSMutableDictionary *)self->_ddNearbyActionDevices removeObjectForKey:v6];
        uint64_t v9 = 16;
        unint64_t v10 = self;
        unint64_t v11 = v8;
        uint64_t v12 = 16;
      }
      [(SDNearbyAgent *)v10 _identificationHandleDeviceLost:v11 flags:v12];
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v15 = self->_ddRequests;
    id v16 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v24;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (((unint64_t)objc_msgSend(v20, "discoveryFlags", (void)v23) & v9) != 0)
          {
            uint64_t v21 = [v20 deviceLostHandler];

            if (v21)
            {
              id v22 = [v20 deviceLostHandler];
              ((void (**)(void, void *))v22)[2](v22, v8);
            }
          }
        }
        id v17 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v17);
    }
  }
LABEL_23:
}

- (void)_deviceDiscoveryBLEDeviceChanged:(id)a3 type:(int64_t)a4 changes:(unsigned int)a5
{
  uint64_t v44 = *(void *)&a5;
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  long long v43 = [v7 identifier];
  if (v43)
  {
    switch(a4)
    {
      case 7:
        uint64_t v13 = [(NSMutableDictionary *)self->_ddProximityPairingDevices objectForKeyedSubscript:v43];
        if (!v13) {
          goto LABEL_43;
        }
        id v41 = v7;
        long long v42 = v13;
        [v13 updateWithBLEDevice:v7];
        uint64_t v14 = 2;
        break;
      case 16:
        uint64_t v15 = [(NSMutableDictionary *)self->_ddNearbyInfoDevices objectForKeyedSubscript:v43];
        if (!v15) {
          goto LABEL_43;
        }
        id v16 = v15;
        [v15 updateWithBLEDevice:v7];
        LODWORD(v44) = [(SDNearbyAgent *)self _bleProximityUpdateNearbyInfoDevice:v16] | v44;
        uint64_t v14 = 1;
        [(SDNearbyAgent *)self _identificationHandleDeviceFound:v16 flags:1];
        id v41 = v7;
        long long v42 = v16;
        if ([(SDNearbyAgent *)self _deviceCanTriggerEnhancedDiscovery:v16])
        {
          [(SDNearbyAgent *)self _enableEnhancedDiscovery:@"IncomingAdv" useCase:131086];
          self->_enhancedDiscoveryAdvActive = 0;
          [(SDNearbyAgent *)self update];
          uint64_t v14 = 1;
        }
        break;
      case 15:
        id v8 = [(NSMutableDictionary *)self->_ddNearbyActionDevices objectForKeyedSubscript:v43];
        if (!v8) {
          goto LABEL_43;
        }
        uint64_t v9 = v8;
        int v10 = [v8 deviceActionType];
        [v9 updateWithBLEDevice:v7];
        int v11 = [v9 deviceActionType];
        if (v11 != v10)
        {
          if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v12 = sub_100221028(v10);
            int v39 = &unk_10076E656;
            id v40 = v7;
            long long v37 = sub_100221028(v11);
            uint64_t v38 = v44;
            unsigned int v36 = v12;
            LogPrintF();
          }
          id v17 = [v9 bleDevice:v36 v37:v38 v39:v39 v40:v40];
          [v17 setSetupProximityEstimator:0];
          [v17 setTriggered:0];
        }
        if (v11 == 10)
        {
          uint64_t v18 = [v9 idsIdentifier];
          id v19 = [v18 length];

          if (!v19) {
            [(SDNearbyAgent *)self idsAddCachedIDSIdentifierToDevice:v9];
          }
        }
        LODWORD(v44) = [(SDNearbyAgent *)self _bleProximityUpdateNearbyActionDevice:v9] | v44;
        id v41 = v7;
        long long v42 = v9;
        uint64_t v14 = 16;
        if (v44) {
          [(SDNearbyAgent *)self _identificationHandleDeviceFound:v9 flags:16];
        }
        break;
      default:
        goto LABEL_43;
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v20 = self;
    uint64_t v21 = self->_ddRequests;
    id v22 = [(NSMutableSet *)v21 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v46;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v46 != v24) {
            objc_enumerationMutation(v21);
          }
          long long v26 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          if (((unint64_t)[v26 discoveryFlags] & v14) != 0)
          {
            uint64_t v27 = [v26 deviceFilter];
            if (!v27
              || (id v28 = (void *)v27,
                  [v26 deviceFilter],
                  id v29 = objc_claimAutoreleasedReturnValue(),
                  unsigned int v30 = [v29 containsObject:v43],
                  v29,
                  v28,
                  v30))
            {
              unsigned int v31 = [v26 changeFlags];
              if (([v26 discoveryFlags] & 1) != 0
                && [v26 rssiChangeDetection])
              {
                v31 |= 4u;
              }
              uint64_t v32 = v31 & v44;
              if (v31 == -1 || v32 != 0)
              {
                int v34 = [v26 deviceChangedHandler];

                if (v34)
                {
                  long long v35 = [v26 deviceChangedHandler];
                  ((void (**)(void, void *, uint64_t))v35)[2](v35, v42, v32);
                }
                [(SDNearbyAgent *)v20 _deviceDiscoveryFastScanEvaluate:v26 device:v42];
              }
            }
          }
        }
        id v23 = [(NSMutableSet *)v21 countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v23);
    }

    id v7 = v41;
  }
LABEL_43:
}

- (void)_deviceDiscoveryBLEScanStateChanged:(int64_t)a3 type:(int64_t)a4
{
  switch(a4)
  {
    case 7:
      uint64_t v5 = 2;
      break;
    case 15:
      uint64_t v5 = 16;
      break;
    case 16:
      uint64_t v5 = 1;
      break;
    default:
      return;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_ddRequests;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (((unint64_t)objc_msgSend(v11, "discoveryFlags", (void)v14) & v5) != 0)
        {
          uint64_t v12 = [v11 scanStateChangedHandler];

          if (v12)
          {
            uint64_t v13 = [v11 scanStateChangedHandler];
            v13[2](v13, a3);
          }
        }
      }
      id v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)diagnosticBLEModeStart:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  bleDiagnosticModeClients = self->_bleDiagnosticModeClients;
  if (!bleDiagnosticModeClients)
  {
    uint64_t v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v6 = self->_bleDiagnosticModeClients;
    self->_bleDiagnosticModeClients = v5;

    bleDiagnosticModeClients = self->_bleDiagnosticModeClients;
  }
  [(NSMutableSet *)bleDiagnosticModeClients addObject:v7];
  [(SDNearbyAgent *)self _update];
}

- (void)diagnosticBLEModeStop:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(NSMutableSet *)self->_bleDiagnosticModeClients removeObject:v4];
  [(SDNearbyAgent *)self _update];
}

- (void)diagnosticMockChanged:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (dword_100969808 <= 30)
  {
    if (dword_100969808 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v7, v5))
    {
      id v6 = v4;
      LogPrintF();
      id v4 = v7;
    }
  }
  -[SDNearbyAgent _deviceDiscoveryBLEDeviceChanged:type:changes:](self, "_deviceDiscoveryBLEDeviceChanged:type:changes:", v4, 15, 0, v6);
}

- (void)diagnosticMockFound:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (dword_100969808 <= 30)
  {
    if (dword_100969808 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v7, v5))
    {
      id v6 = v4;
      LogPrintF();
      id v4 = v7;
    }
  }
  -[SDNearbyAgent _deviceDiscoveryBLEDeviceFound:type:](self, "_deviceDiscoveryBLEDeviceFound:type:", v4, 15, v6);
}

- (void)diagnosticMockLost:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (dword_100969808 <= 30)
  {
    if (dword_100969808 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v7, v5))
    {
      id v6 = v4;
      LogPrintF();
      id v4 = v7;
    }
  }
  -[SDNearbyAgent _deviceDiscoveryBLEDeviceLost:type:](self, "_deviceDiscoveryBLEDeviceLost:type:", v4, 15, v6);
}

- (void)_identificationCheckFlagsAndACL
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = self->_idIdentityArray;
  id v2 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v2)
  {
    uint64_t v16 = 0;
    id v4 = 0;
    BOOL v5 = 0;
    goto LABEL_35;
  }
  id v3 = v2;
  uint64_t v16 = 0;
  id v4 = 0;
  LOBYTE(v5) = 0;
  uint64_t v6 = *(void *)v19;
  do
  {
    for (i = 0; i != v3; i = (char *)i + 1)
    {
      if (*(void *)v19 != v6) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      if ((objc_msgSend(v8, "featureFlags", v14) & 4) != 0)
      {
        if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
        {
          long long v14 = v8;
          LogPrintF();
        }
        BYTE4(v16) = 1;
      }
      if (v5) {
        goto LABEL_13;
      }
      if ([v8 type] == 13)
      {
        if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
        {
          long long v14 = v8;
          LogPrintF();
        }
LABEL_13:
        BOOL v5 = 1;
        goto LABEL_19;
      }
      BOOL v5 = 0;
LABEL_19:
      if (objc_opt_respondsToSelector())
      {
        uint64_t v9 = [v8 performSelector:"acl"];

        if (v9)
        {
          int v10 = [v9 objectForKeyedSubscript:@"com.apple.developer"];
          unsigned int v11 = [v10 BOOLValue];

          if (v11)
          {
            if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
            {
              long long v14 = v8;
              LogPrintF();
            }
            LOBYTE(v16) = 1;
          }
          id v4 = v9;
        }
        else
        {
          id v4 = 0;
        }
      }
    }
    id v3 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v3);
LABEL_35:

  BOOL v12 = BYTE4(v16) & 1;
  if (self->_fitnessPairingEnabled != v12)
  {
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_fitnessPairingEnabled = v12;
  }
  if (self->_sessionPairingEnabled != v5)
  {
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_sessionPairingEnabled = v5;
  }
  BOOL v13 = v16 & 1;
  if (self->_coreDeviceEnabled != v13)
  {
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_coreDeviceEnabled = v13;
  }
}

- (void)_identificationEnsureStarted
{
  if (self->_idIdentitiesChangedNotifyToken == -1)
  {
    if ([(CUSystemMonitor *)self->_systemMonitor firstUnlocked])
    {
      if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      dispatchQueue = self->_dispatchQueue;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100221E3C;
      handler[3] = &unk_1008CACA8;
      handler[4] = self;
      notify_register_dispatch("com.apple.rapport.identitiesChanged", &self->_idIdentitiesChangedNotifyToken, dispatchQueue, handler);
      [(SDNearbyAgent *)self _identificationGetIdentities];
    }
    else if (dword_100969808 <= 20 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_identificationEnsureStopped
{
  int idIdentitiesChangedNotifyToken = self->_idIdentitiesChangedNotifyToken;
  if (idIdentitiesChangedNotifyToken != -1)
  {
    if (dword_100969808 > 30) {
      goto LABEL_7;
    }
    if (dword_100969808 != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    int idIdentitiesChangedNotifyToken = self->_idIdentitiesChangedNotifyToken;
    if (idIdentitiesChangedNotifyToken != -1)
    {
LABEL_7:
      notify_cancel(idIdentitiesChangedNotifyToken);
      self->_int idIdentitiesChangedNotifyToken = -1;
    }
  }
  idMaintenanceTimer = self->_idMaintenanceTimer;
  if (idMaintenanceTimer)
  {
    BOOL v5 = idMaintenanceTimer;
    dispatch_source_cancel(v5);
    uint64_t v6 = self->_idMaintenanceTimer;
    self->_idMaintenanceTimer = 0;
  }
  [(NSMutableDictionary *)self->_idDevices removeAllObjects];
  idDevices = self->_idDevices;
  self->_idDevices = 0;
}

- (void)_identificationGetIdentities
{
  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v3 = objc_alloc_init((Class)RPClient);
  [v3 setDispatchQueue:self->_dispatchQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100222090;
  v5[3] = &unk_1008CB328;
  v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  [v4 getIdentitiesWithFlags:28075 completion:v5];
}

- (id)idsDeviceIDsForRIServers
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_idIdentityArray;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v10 = [v9 model:v14];
        unsigned int v11 = [v10 hasPrefix:@"AppleTV"];

        if (v11)
        {
          BOOL v12 = [v9 idsDeviceID];
          if (v12) {
            [v3 addObject:v12];
          }
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)idsDeviceIDsForFamily
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_idIdentityArray;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v9, "type", (void)v15) == 4 || objc_msgSend(v9, "type") == 2)
        {
          int v10 = [v9 model];
          unsigned int v11 = [v10 hasPrefix:@"AppleTV"];

          if (v11)
          {
            uint64_t v12 = [v9 idsDeviceID];
            if (v12)
            {
              BOOL v13 = (void *)v12;
              [v3 addObject:v12];
            }
          }
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_identificationHandleDeviceFound:(id)a3 flags:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [v5 identifier];
  if (!v6) {
    goto LABEL_92;
  }
  uint64_t v7 = [v5 bleDevice];
  id v8 = [v7 advertisementFields];
  CFDataGetTypeID();
  uint64_t v9 = CFDictionaryGetTypedValue();
  int v10 = [(NSMutableDictionary *)self->_idDevices objectForKeyedSubscript:v6];
  if (v10)
  {
    unsigned int v11 = v10;
    uint64_t v12 = [(SDBLEIdentifiedDevice *)v10 authTag];
    BOOL v13 = v9;
    id v14 = v9;
    id v15 = v12;
    if (v14 == v15)
    {
    }
    else
    {
      long long v16 = v15;
      if ((v14 == 0) != (v15 != 0))
      {
        unsigned __int8 v17 = [v14 isEqual:v15];

        if (v17) {
          goto LABEL_13;
        }
      }
      else
      {
      }
      [(SDBLEIdentifiedDevice *)v11 setAuthTag:v14];
      CFDataGetTypeID();
      [(SDBLEIdentifiedDevice *)v11 setBtAddr:CFDictionaryGetTypedValue()];
    }
LABEL_13:
    uint64_t v9 = v13;
LABEL_14:
    [(SDNearbyAgent *)self _identificationIdentifyDevice:v11 sfDevice:v5];
    id v18 = [(SDBLEIdentifiedDevice *)v11 identity];
    [(SDBLEIdentifiedDevice *)v11 setDiscoveryFlags:[(SDBLEIdentifiedDevice *)v11 discoveryFlags] | a4];
    goto LABEL_40;
  }
  if (![v5 paired])
  {
    if ((unint64_t)[(NSMutableDictionary *)self->_idDevices count] > 0x257)
    {
      if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
      {
        id v52 = v5;
        id v54 = [(NSMutableDictionary *)self->_idDevices count];
        LogPrintF();
      }
      id v18 = 0;
      goto LABEL_39;
    }
    unsigned int v11 = objc_alloc_init(SDBLEIdentifiedDevice);
    [(SDBLEIdentifiedDevice *)v11 setAuthTag:v9];
    CFDataGetTypeID();
    [(SDBLEIdentifiedDevice *)v11 setBtAddr:CFDictionaryGetTypedValue()];
    [(SDBLEIdentifiedDevice *)v11 setIdentifier:v6];
    idDevices = self->_idDevices;
    if (!idDevices)
    {
      long long v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      long long v21 = self->_idDevices;
      self->_idDevices = v20;

      idDevices = self->_idDevices;
    }
    [(NSMutableDictionary *)idDevices setObject:v11 forKeyedSubscript:v6];
    if (v11) {
      goto LABEL_14;
    }
LABEL_34:
    id v18 = 0;
    goto LABEL_40;
  }
  id v18 = [v7 rpIdentity];
  if (!v18)
  {
    unsigned int v11 = [v5 idsIdentifier];
    if (v11)
    {
      uint64_t v58 = v9;
      uint64_t v59 = v8;
      uint64_t v60 = v7;
      char v61 = v6;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v22 = self->_idIdentityArray;
      id v23 = [(NSArray *)v22 countByEnumeratingWithState:&v66 objects:v70 count:16];
      if (!v23)
      {
LABEL_33:

        id v18 = 0;
        unsigned int v11 = 0;
        uint64_t v7 = v60;
        id v6 = v61;
        uint64_t v9 = v58;
        id v8 = v59;
        goto LABEL_40;
      }
      id v24 = v23;
      uint64_t v25 = *(void *)v67;
LABEL_26:
      uint64_t v26 = 0;
      while (1)
      {
        if (*(void *)v67 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v66 + 1) + 8 * v26);
        if ([v27 type] == 2)
        {
          id v28 = [v27 idsDeviceID];
          unsigned __int8 v29 = [v28 isEqual:v11];

          if (v29) {
            break;
          }
        }
        if (v24 == (id)++v26)
        {
          id v24 = [(NSArray *)v22 countByEnumeratingWithState:&v66 objects:v70 count:16];
          if (v24) {
            goto LABEL_26;
          }
          goto LABEL_33;
        }
      }
      id v18 = v27;
      uint64_t v7 = v60;
      [v60 setRpIdentity:v18];

      id v6 = v61;
      uint64_t v9 = v58;
      id v8 = v59;
      if (v18) {
        goto LABEL_9;
      }
      goto LABEL_39;
    }
    goto LABEL_34;
  }
LABEL_9:
  [v5 updateWithRPIdentity:v18];
LABEL_39:
  unsigned int v11 = 0;
LABEL_40:
  [v5 setAudioRoutingScore:0 v52 v54];
  if (v9) {
    BOOL v30 = v18 == 0;
  }
  else {
    BOOL v30 = 1;
  }
  int v31 = !v30;
  if (!v30)
  {
    CFDataGetTypeID();
    uint64_t v32 = CFDictionaryGetTypedValue();
    if (v32) {
      [(SDNearbyAgent *)self _identificationDecryptAudioRoutingScoreData:v32 device:v5 authTag:v9 identity:v18];
    }
  }
  if ((a4 & 0x10) != 0 && self->_contactHashesEnabled && [v5 deviceActionType] == 8)
  {
    CFDataGetTypeID();
    id v33 = CFDictionaryGetTypedValue();
    if ((unint64_t)[v33 length] >= 9)
    {
      [(SDStatusMonitor *)self->_statusMonitor contactIdentifierForMediumHashes:v33];
      id v62 = v6;
      int v34 = v7;
      long long v35 = v9;
      long long v37 = v36 = v8;
      [v5 setContactIdentifier:v37];

      id v8 = v36;
      uint64_t v9 = v35;
      uint64_t v7 = v34;
      id v6 = v62;
    }
  }
  [v5 setHotspotInfo:0];
  if (v31)
  {
    CFDataGetTypeID();
    uint64_t v38 = CFDictionaryGetTypedValue();
    if (v38) {
      [(SDNearbyAgent *)self _identificationDecryptHotspotData:v38 device:v5 authTag:v9 identity:v18];
    }
  }
  unsigned int v65 = 0;
  unsigned __int8 Int64Ranged = CFDictionaryGetInt64Ranged();
  int v40 = [(SDNearbyAgent *)self _idsShouldEncryptActivityLevel];
  uint64_t v41 = 0;
  if (v40 < 1)
  {
    [v7 setDecryptedActivityLevel:Int64Ranged];
    goto LABEL_80;
  }
  if (v9 && v18)
  {
    [v7 setDecryptedActivityLevel:-[SDNearbyAgent _identificationDecryptActivityLevel:device:authTag:identity:](self, "_identificationDecryptActivityLevel:device:authTag:identity:", Int64Ranged, v5, v9, v18)];
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_80;
  }
  long long v42 = v9;
  if (v9) {
    int v43 = 30;
  }
  else {
    int v43 = 90;
  }
  if (v43 >= dword_100969808)
  {
    if (dword_100969808 != -1)
    {
LABEL_72:
      uint64_t v44 = "no";
      if (v42) {
        long long v45 = "yes";
      }
      else {
        long long v45 = "no";
      }
      if (v18) {
        uint64_t v44 = "yes";
      }
      uint64_t v56 = v41;
      id v57 = v5;
      long long v53 = v45;
      id v55 = v44;
      LogPrintF();
      goto LABEL_79;
    }
    if (_LogCategory_Initialize())
    {
      uint64_t v41 = v65;
      goto LABEL_72;
    }
  }
LABEL_79:
  [v7 setDecryptedActivityLevel:16 v53, v55, v56, v57];
  uint64_t v9 = v42;
LABEL_80:
  if ((a4 & 0x10) != 0 && [v5 deviceActionType] == 8)
  {
    CFDataGetTypeID();
    long long v46 = CFDictionaryGetTypedValue();
    if ([v46 length] == (id)3)
    {
      [(SDStatusMonitor *)self->_statusMonitor wifiSSIDForSSIDHash:v46];
      v48 = long long v47 = v8;
      [v5 setRequestSSID:v48];

      id v8 = v47;
    }
  }
  if (!self->_idMaintenanceTimer)
  {
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v49 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    idMaintenanceTimer = self->_idMaintenanceTimer;
    self->_idMaintenanceTimer = v49;

    long long v51 = self->_idMaintenanceTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100223204;
    handler[3] = &unk_1008CA4B8;
    handler[4] = self;
    dispatch_source_set_event_handler(v51, handler);
    SFDispatchTimerSet();
    dispatch_resume((dispatch_object_t)self->_idMaintenanceTimer);
  }

LABEL_92:
}

- (void)_identificationHandleDeviceLost:(id)a3 flags:(unint64_t)a4
{
  id v6 = [a3 identifier];
  if (v6)
  {
    unsigned int v11 = v6;
    uint64_t v7 = [(NSMutableDictionary *)self->_idDevices objectForKeyedSubscript:v6];
    id v8 = v7;
    if (v7)
    {
      unint64_t v9 = (unint64_t)[v7 discoveryFlags];
      unint64_t v10 = v9 & ~a4;
      if (v10 != v9)
      {
        [v8 setDiscoveryFlags:v10];
        if (!v10) {
          [v8 setLastUpdateTicks:mach_absolute_time()];
        }
      }
    }

    id v6 = v11;
  }
}

- (void)_identificationHandleDiscoveryStop
{
  uint64_t v2 = !self->_ddNearbyInfoEnabled | (16 * !self->_ddNearbyActionEnabled);
  idDevices = self->_idDevices;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100223340;
  v4[3] = &unk_1008D12D8;
  v4[4] = v2;
  [(NSMutableDictionary *)idDevices enumerateKeysAndObjectsUsingBlock:v4];
}

- (void)_identificationMaintenanceTimer
{
  uint64_t v3 = mach_absolute_time();
  unint64_t v4 = SecondsToUpTicks();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(NSMutableDictionary *)self->_idDevices allKeys];
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        unsigned int v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_idDevices, "objectForKeyedSubscript:", v10, v15);
        if (![v11 discoveryFlags] && v3 - (unint64_t)objc_msgSend(v11, "lastUpdateTicks") >= v4)
        {
          [(NSMutableDictionary *)self->_idDevices removeObjectForKey:v10];
          if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v15 = v10;
            LogPrintF();
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  if (![(NSMutableDictionary *)self->_idDevices count])
  {
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    idMaintenanceTimer = self->_idMaintenanceTimer;
    if (idMaintenanceTimer)
    {
      BOOL v13 = idMaintenanceTimer;
      dispatch_source_cancel(v13);
      id v14 = self->_idMaintenanceTimer;
      self->_idMaintenanceTimer = 0;
    }
  }
}

- (void)_identificationReIdentify
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [(SDNearbyAgent *)self _identificationReIdentifySameAccountDevices:self->_ddNearbyActionDevices type:15];
  [(SDNearbyAgent *)self _identificationReIdentifySameAccountDevices:self->_ddNearbyInfoDevices type:16];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_idDevices allKeys];
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        unint64_t v9 = [(NSMutableDictionary *)self->_idDevices objectForKeyedSubscript:v8];
        if ([(SDNearbyAgent *)self _identificationIdentifyDevice:v9 sfDevice:0])
        {
          uint64_t v10 = [(NSMutableDictionary *)self->_ddNearbyActionDevices objectForKeyedSubscript:v8];
          unsigned int v11 = [v10 bleDevice];

          if (v11) {
            [(SDNearbyAgent *)self _deviceDiscoveryBLEDeviceChanged:v11 type:15 changes:1];
          }

          uint64_t v12 = [(NSMutableDictionary *)self->_ddNearbyInfoDevices objectForKeyedSubscript:v8];
          BOOL v13 = [v12 bleDevice];

          if (v13) {
            [(SDNearbyAgent *)self _deviceDiscoveryBLEDeviceChanged:v13 type:16 changes:1];
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

- (void)_identificationReIdentifySameAccountDevices:(id)a3 type:(int64_t)a4
{
  id v5 = a3;
  BOOL v30 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = [v5 allKeys];
  id v6 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v38;
    uint64_t v27 = *(void *)v38;
    id v28 = v5;
    do
    {
      unint64_t v9 = 0;
      id v29 = v7;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v37 + 1) + 8 * (void)v9)];
        if (![v10 paired]) {
          goto LABEL_30;
        }
        unsigned int v11 = [v10 idsIdentifier];
        if (!v11) {
          goto LABEL_29;
        }
        uint64_t v32 = [v10 bleDevice];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        uint64_t v12 = v30->_idIdentityArray;
        id v13 = [(NSArray *)v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (!v13) {
          goto LABEL_28;
        }
        id v14 = v13;
        uint64_t v15 = *(void *)v34;
        while (2)
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v34 != v15) {
              objc_enumerationMutation(v12);
            }
            long long v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            if ([v17 type] == 2)
            {
              long long v18 = [v17 idsDeviceID];
              unsigned int v19 = [v18 isEqual:v11];

              if (v19)
              {
                long long v20 = [v32 rpIdentity];
                long long v21 = v20;
                if (v20)
                {
                  unsigned int v22 = [v20 compareWithRPIdentity:v17];
                  [v32 setRpIdentity:v17];
                  if (!v22)
                  {
LABEL_27:

                    goto LABEL_28;
                  }
                }
                else
                {
                  [v32 setRpIdentity:v17];
                }
                if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF();
                  -[SDNearbyAgent _deviceDiscoveryBLEDeviceChanged:type:changes:](v30, "_deviceDiscoveryBLEDeviceChanged:type:changes:", v32, a4, 1, v10, v32, v17);
                }
                else
                {
                  -[SDNearbyAgent _deviceDiscoveryBLEDeviceChanged:type:changes:](v30, "_deviceDiscoveryBLEDeviceChanged:type:changes:", v32, a4, 1, v23, v24, v25);
                }
                goto LABEL_27;
              }
            }
          }
          id v14 = [(NSArray *)v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v14) {
            continue;
          }
          break;
        }
LABEL_28:

        uint64_t v8 = v27;
        id v5 = v28;
        id v7 = v29;
LABEL_29:

LABEL_30:
        unint64_t v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      id v7 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v7);
  }
}

- (BOOL)_identificationIdentifyDevice:(id)a3 sfDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 authTag];
  if (v8)
  {
    unint64_t v9 = [v6 btAddr];
    if (v9)
    {
      uint64_t v25 = v6;
      mach_absolute_time();
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v10 = self->_idIdentityArray;
      id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v11)
      {
        id v12 = v11;
        id v13 = 0;
        uint64_t v14 = *(void *)v27;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v27 != v14) {
              objc_enumerationMutation(v10);
            }
            long long v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            if ([v16 verifyAuthTag:v8 data:v9 type:2 error:0])
            {
              if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
              {
                long long v17 = [v25 identifier];
                mach_absolute_time();
                uint64_t v23 = v16;
                uint64_t v24 = UpTicksToMicroseconds();
                unsigned int v22 = v17;
                LogPrintF();
              }
              if (v13)
              {
                long long v18 = [v13 contactID];

                if (!v18)
                {
                  unsigned int v19 = [v16 contactID];
                  [v13 setContactID:v19];
                }
              }
              else
              {
                id v13 = v16;
                [v25 setIdentity:v13];
              }
              [v7 updateWithRPIdentity:v16, v22, v23, v24];
            }
          }
          id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v12);
      }
      else
      {
        id v13 = 0;
      }

      BOOL v20 = v13 != 0;
      id v6 = v25;
    }
    else
    {
      BOOL v20 = 0;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (void)_identificationDecryptAudioRoutingScoreData:(id)a3 device:(id)a4 authTag:(id)a5 identity:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [a6 deviceIRKData];
  if ([v12 length])
  {
    id v13 = v11;
    if ([v13 length])
    {
      memset(v16, 0, sizeof(v16));
      id v14 = v12;
      [v14 bytes];
      [v14 length];
      id v15 = v13;
      [v15 bytes];
      [v15 length];
      CryptoHKDF();
      if (objc_msgSend(v9, "length", v16))
      {
        [v9 bytes];
        ccchacha20();
        [v10 setAudioRoutingScore:0];
      }
    }
  }
}

- (void)_identificationDecryptHotspotData:(id)a3 device:(id)a4 authTag:(id)a5 identity:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [a6 deviceIRKData];
  if ([v12 length])
  {
    id v13 = v11;
    if ([v13 length])
    {
      memset(v16, 0, sizeof(v16));
      id v14 = v12;
      [v14 bytes];
      [v14 length];
      id v15 = v13;
      [v15 bytes];
      [v15 length];
      CryptoHKDF();
      if (objc_msgSend(v9, "length", v16))
      {
        [v9 bytes];
        ccchacha20();
        [v10 setHotspotInfo:256];
      }
    }
  }
}

- (unsigned)_identificationDecryptActivityLevel:(unsigned __int8)a3 device:(id)a4 authTag:(id)a5 identity:(id)a6
{
  id v7 = a5;
  uint64_t v8 = [a6 deviceIRKData];
  if ([v8 length])
  {
    id v9 = v7;
    if ([v9 length])
    {
      id v10 = v8;
      [v10 bytes];
      [v10 length];
      id v11 = v9;
      [v11 bytes];
      [v11 length];
      CryptoHKDF();
      ccchacha20();
    }
  }
  return 0;
}

- (void)_idsEnsureStarted
{
  if (!self->_idsService)
  {
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v3 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.nearby"];
    idsService = self->_idsService;
    self->_idsService = v3;

    id v5 = self->_idsService;
    dispatchQueue = self->_dispatchQueue;
    [(IDSService *)v5 addDelegate:self queue:dispatchQueue];
  }
}

- (void)_idsEnsureStopped
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  idsBluetoothDevicesArray = v2->_idsBluetoothDevicesArray;
  v2->_idsBluetoothDevicesArray = 0;

  idsBluetoothDevicesSet = v2->_idsBluetoothDevicesSet;
  v2->_idsBluetoothDevicesSet = 0;

  idsBluetoothDeviceIDsForLEPipe = v2->_idsBluetoothDeviceIDsForLEPipe;
  v2->_idsBluetoothDeviceIDsForLEPipe = 0;

  idsBluetoothDeviceIDsForMe = v2->_idsBluetoothDeviceIDsForMe;
  v2->_idsBluetoothDeviceIDsForMe = 0;

  idsDeviceBTDictionary = v2->_idsDeviceBTDictionary;
  v2->_idsDeviceBTDictionary = 0;

  idsDeviceCountBTDictionary = v2->_idsDeviceCountBTDictionary;
  v2->_idsDeviceCountBTDictionary = 0;

  objc_sync_exit(v2);
  if (v2->_idsService)
  {
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(IDSService *)v2->_idsService removeDelegate:v2];
    idsService = v2->_idsService;
    v2->_idsService = 0;
  }
}

- (void)idsAddCachedIDSIdentifier:(id)a3 device:(id)a4
{
  id v20 = a3;
  id v21 = a4;
  id v6 = self;
  objc_sync_enter(v6);
  mach_absolute_time();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = [(NSMutableDictionary *)v6->_idsBTtoIDSInfoMap allKeys];
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v23;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v12 = [(NSMutableDictionary *)v6->_idsBTtoIDSInfoMap objectForKeyedSubscript:v11];
        CFDictionaryGetInt64();
        if ((unint64_t)UpTicksToSeconds() >= 0x385)
        {
          if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_idsBTtoIDSInfoMap, "setObject:forKeyedSubscript:", 0, v11, v11, v12);
          }
          else
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_idsBTtoIDSInfoMap, "setObject:forKeyedSubscript:", 0, v11, v18, v19);
          }
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v8);
  }

  id v13 = [v21 identifier];
  if (v13)
  {
    if (!v6->_idsBTtoIDSInfoMap)
    {
      id v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      idsBTtoIDSInfoMap = v6->_idsBTtoIDSInfoMap;
      v6->_idsBTtoIDSInfoMap = v14;
    }
    v26[0] = @"addTicks";
    long long v16 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
    v26[1] = @"idsID";
    v27[0] = v16;
    v27[1] = v20;
    long long v17 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];

    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      long long v18 = v13;
      unsigned int v19 = v17;
      LogPrintF();
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_idsBTtoIDSInfoMap, "setObject:forKeyedSubscript:", v17, v13, v18, v19);
  }
  else if (dword_100969808 <= 90 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  objc_sync_exit(v6);
}

- (void)idsAddCachedIDSIdentifierToDevice:(id)a3
{
  id v10 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [v10 idsIdentifier];

  if (!v5)
  {
    id v6 = [v10 identifier];
    if (v6)
    {
      id v7 = [(NSMutableDictionary *)v4->_idsBTtoIDSInfoMap objectForKeyedSubscript:v6];
      id v8 = v7;
      if (v7)
      {
        uint64_t v9 = [v7 objectForKeyedSubscript:@"idsID"];
        if (v9)
        {
          [v10 setIdsIdentifier:v9];
          if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
        }
      }
    }
  }
  objc_sync_exit(v4);
}

- (int)_idsAppleTVCount
{
  int result = self->_idsAppleTVCountCache;
  if (result < 0)
  {
    self->_idsAppleTVCountCache = 0;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = [(SDNearbyAgent *)self idsDeviceArray];
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) modelIdentifier];
          unsigned int v10 = [v9 hasPrefix:@"AppleTV"];

          if (v10) {
            ++self->_idsAppleTVCountCache;
          }
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }

    return self->_idsAppleTVCountCache;
  }
  return result;
}

- (id)idsBluetoothDeviceIDsForRIServers
{
  id v14 = objc_alloc_init((Class)NSMutableSet);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v3 = [(SDNearbyAgent *)self idsDeviceArray];
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v9 = [v8 modelIdentifier];
        if ([v9 hasPrefix:@"AppleTV"])
        {
        }
        else
        {
          unsigned int v10 = [v8 modelIdentifier];
          unsigned int v11 = [(SDNearbyAgent *)self isDeviceValidRIServer:v10];

          if (!v11) {
            continue;
          }
        }
        long long v12 = [v8 nsuuid];
        if (v12) {
          [v14 addObject:v12];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  return v14;
}

- (id)_idsBluetoothDeviceIDsForHomePods
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(SDNearbyAgent *)self idsDeviceArray];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unsigned int v10 = [v9 modelIdentifier];
        unsigned int v11 = [v10 hasPrefix:@"AudioAccessory"];

        if (v11)
        {
          long long v12 = [v9 nsuuid];
          if (v12) {
            [v3 addObject:v12];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_idsBluetoothDeviceIDsForiMessage
{
  id v2 = objc_alloc_init((Class)NSMutableSet);
  id v3 = objc_alloc((Class)IDSService);
  id v4 = [v3 initWithService:IDSServiceNameiMessage];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [v4 devices];
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
        unsigned int v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) nsuuid];
        if (v10) {
          [v2 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v2;
}

- (id)idsBluetoothDeviceIDsForLEPipe
{
  id v2 = self;
  objc_sync_enter(v2);
  idsBluetoothDeviceIDsForLEPipe = v2->_idsBluetoothDeviceIDsForLEPipe;
  if (!idsBluetoothDeviceIDsForLEPipe)
  {
    uint64_t v4 = [(SDNearbyAgent *)v2 _idsBluetoothDeviceIDsForLEPipe];
    id v5 = v2->_idsBluetoothDeviceIDsForLEPipe;
    v2->_idsBluetoothDeviceIDsForLEPipe = (NSArray *)v4;

    idsBluetoothDeviceIDsForLEPipe = v2->_idsBluetoothDeviceIDsForLEPipe;
  }
  id v6 = idsBluetoothDeviceIDsForLEPipe;
  objc_sync_exit(v2);

  return v6;
}

- (id)_idsBluetoothDeviceIDsForLEPipe
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [(SDNearbyAgent *)self idsDeviceArray];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (v9) {
          [v9 operatingSystemVersion];
        }
        unsigned int v10 = [v9 modelIdentifier];
        if (([v10 hasPrefix:@"Mac"] & 1) == 0
          && ![v10 hasPrefix:@"iMac"])
        {
          [v10 hasPrefix:@"Watch"];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  if ([v3 count]) {
    unsigned int v11 = v3;
  }
  else {
    unsigned int v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (id)_idsBluetoothDeviceIDsForMe
{
  id v2 = self;
  objc_sync_enter(v2);
  id obj = (id *)&v2->super.isa;
  idsBluetoothDeviceIDsForMe = v2->_idsBluetoothDeviceIDsForMe;
  if (idsBluetoothDeviceIDsForMe)
  {
    uint64_t v4 = idsBluetoothDeviceIDsForMe;
  }
  else
  {
    id v5 = objc_alloc_init((Class)NSMutableSet);
    id v6 = [(CUSystemMonitor *)v2->_systemMonitor meDeviceIDSDeviceID];
    if (v6)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v7 = [(SDNearbyAgent *)v2 idsDeviceArray];
      id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v22;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v22 != v9) {
              objc_enumerationMutation(v7);
            }
            unsigned int v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            id v12 = [v11 nsuuid];
            if (v12)
            {
              long long v13 = [v11 uniqueIDOverride];
              unsigned __int8 v14 = [v13 isEqual:v6];

              if ((v14 & 1) != 0
                || ([v11 modelIdentifier],
                    long long v15 = objc_claimAutoreleasedReturnValue(),
                    unsigned int v16 = [v15 hasPrefix:@"Watch"],
                    v15,
                    v16))
              {
                [v5 addObject:v12];
              }
            }
          }
          id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v8);
      }
    }
    id v17 = [v5 copy];
    id v18 = obj[75];
    obj[75] = v17;

    uint64_t v4 = (NSSet *)obj[75];
  }
  objc_sync_exit(obj);

  return v4;
}

- (id)_idsBluetoothDeviceIDsForOneness
{
  id v33 = objc_alloc_init((Class)NSMutableSet);
  id v3 = objc_alloc_init((Class)NSMutableSet);
  if (GestaltGetDeviceClass() == 1)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v4 = [(SDNearbyAgent *)self idsDeviceArray];
    id v5 = [v4 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v32 = self;
      uint64_t v7 = *(void *)v43;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v43 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          unsigned int v10 = [v9 modelIdentifier:v32];
          unsigned int v11 = [v10 lowercaseString];

          if (([v11 containsString:@"mac"] & 1) != 0
            || [v11 containsString:@"imac"])
          {
            id v12 = [v9 uniqueID];
            [v3 addObject:v12];
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }
      while (v6);
      self = v32;
    }
  }
  else
  {
    if (GestaltGetDeviceClass() != 100) {
      goto LABEL_25;
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v4 = [(SDNearbyAgent *)self idsDeviceArray];
    id v13 = [v4 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v13)
    {
      id v14 = v13;
      long long v15 = self;
      uint64_t v16 = *(void *)v39;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v39 != v16) {
            objc_enumerationMutation(v4);
          }
          id v18 = *(void **)(*((void *)&v38 + 1) + 8 * (void)j);
          unsigned int v19 = [v18 modelIdentifier];
          id v20 = [v19 lowercaseString];

          if ([v20 containsString:@"iphone"])
          {
            long long v21 = [v18 uniqueID];
            [v3 addObject:v21];
          }
        }
        id v14 = [v4 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v14);
      self = v15;
    }
  }

LABEL_25:
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v22 = [(SDNearbyAgent *)self idsDeviceArray];
  id v23 = [v22 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v35;
    do
    {
      for (k = 0; k != v24; k = (char *)k + 1)
      {
        if (*(void *)v35 != v25) {
          objc_enumerationMutation(v22);
        }
        long long v27 = *(void **)(*((void *)&v34 + 1) + 8 * (void)k);
        long long v28 = [v27 uniqueID];
        unsigned int v29 = [v3 containsObject:v28];

        if (v29)
        {
          BOOL v30 = [v27 nsuuid];
          if (v30) {
            [v33 addObject:v30];
          }
        }
      }
      id v24 = [v22 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v24);
  }

  return v33;
}

- (id)idsBluetoothDeviceIDsForSharing
{
  id v2 = self;
  objc_sync_enter(v2);
  idsBluetoothDevicesSet = v2->_idsBluetoothDevicesSet;
  if (!idsBluetoothDevicesSet)
  {
    id v4 = objc_alloc((Class)NSSet);
    id v5 = [(SDNearbyAgent *)v2 _idsBluetoothDeviceIDsForSharingLocked];
    id v6 = (NSSet *)[v4 initWithArray:v5];
    uint64_t v7 = v2->_idsBluetoothDevicesSet;
    v2->_idsBluetoothDevicesSet = v6;

    idsBluetoothDevicesSet = v2->_idsBluetoothDevicesSet;
  }
  id v8 = idsBluetoothDevicesSet;
  objc_sync_exit(v2);

  return v8;
}

- (id)idsBluetoothDeviceIDsForWatches
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(SDNearbyAgent *)self idsDeviceArray];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unsigned int v10 = [v9 modelIdentifier];
        unsigned int v11 = [v10 hasPrefix:@"Watch"];

        if (v11)
        {
          id v12 = [v9 nsuuid];
          if (v12) {
            [v3 addObject:v12];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_idsBluetoothDeviceIDsForSharing
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [(SDNearbyAgent *)v2 _idsBluetoothDeviceIDsForSharingLocked];
  objc_sync_exit(v2);

  return v3;
}

- (id)_idsBluetoothDeviceIDsForSharingLocked
{
  idsBluetoothDevicesArray = self->_idsBluetoothDevicesArray;
  if (!idsBluetoothDevicesArray)
  {
    id v4 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = [(SDNearbyAgent *)self idsDeviceArray];
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          unsigned int v10 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v9) nsuuid];
          if (v10) {
            [(NSArray *)v4 addObject:v10];
          }

          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    unsigned int v11 = self->_idsBluetoothDevicesArray;
    self->_idsBluetoothDevicesArray = v4;

    idsBluetoothDevicesArray = self->_idsBluetoothDevicesArray;
  }

  return idsBluetoothDevicesArray;
}

- (id)_idsBluetoothDeviceIDsForSMSRelay
{
  id v2 = objc_alloc_init((Class)NSMutableSet);
  id v3 = objc_alloc((Class)IDSService);
  id v4 = [v3 initWithService:IDSServiceNameSMSRelay];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [v4 devices];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (([v10 supportsSMSRelay] & 1) != 0
          || [v10 supportsMMSRelay])
        {
          unsigned int v11 = [v10 nsuuid];
          if (v11) {
            [v2 addObject:v11];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v2;
}

- (id)_idsBluetoothDeviceIDsForAnnouncements
{
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = sub_100211650;
  long long v17 = sub_100211660;
  id v18 = 0;
  id v18 = objc_alloc_init((Class)NSMutableSet);
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x2050000000;
  id v3 = (void *)qword_1009804B0;
  uint64_t v23 = qword_1009804B0;
  if (!qword_1009804B0)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10022E684;
    v19[3] = &unk_1008CA038;
    v19[4] = &v20;
    sub_10022E684((uint64_t)v19);
    id v3 = (void *)v21[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v20, 8);
  id v5 = objc_alloc_init(v4);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100225DC0;
  v10[3] = &unk_1008D1300;
  id v12 = &v13;
  id v6 = v2;
  unsigned int v11 = v6;
  [v5 getScanningDeviceCandidates:v10];
  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v6, v7);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

- (int)_idsContinuityDeviceCount
{
  int result = self->_idsContinuityDeviceCountCache;
  if (result < 0)
  {
    if (self->_idsService)
    {
      self->_idsContinuityDeviceCountCache = 0;
      long long v9 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v4 = [(SDNearbyAgent *)self idsDeviceArray];
      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v10;
        do
        {
          id v8 = 0;
          do
          {
            if (*(void *)v10 != v7) {
              objc_enumerationMutation(v4);
            }
            if ([*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) supportsHandoff]) {
              ++self->_idsContinuityDeviceCountCache;
            }
            id v8 = (char *)v8 + 1;
          }
          while (v6 != v8);
          id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        }
        while (v6);
      }

      return self->_idsContinuityDeviceCountCache;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)idsDeviceArray
{
  dispatch_semaphore_t v2 = self;
  objc_sync_enter(v2);
  id v3 = [(SDNearbyAgent *)v2 _idsDeviceArrayLocked];
  objc_sync_exit(v2);

  return v3;
}

- (id)_idsDeviceArrayLocked
{
  idsDeviceArray = self->_idsDeviceArray;
  if (!idsDeviceArray)
  {
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v4 = [(IDSService *)self->_idsService devices];
    id v5 = self->_idsDeviceArray;
    self->_idsDeviceArray = v4;

    idsDeviceArray = self->_idsDeviceArray;
  }

  return idsDeviceArray;
}

- (id)idsDeviceForBluetoothDeviceID:(id)a3 conflictDetected:(BOOL *)a4
{
  id v5 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  idsDeviceBTDictionary = v6->_idsDeviceBTDictionary;
  if (!idsDeviceBTDictionary)
  {
    id v25 = v5;
    id v8 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    long long v9 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v10 = [(SDNearbyAgent *)v6 idsDeviceArray];
    id v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v28;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v10);
          }
          long long v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v15 = [v14 nsuuid];
          if (v15)
          {
            [(NSDictionary *)v8 setObject:v14 forKeyedSubscript:v15];
            long long v16 = +[NSNumber numberWithUnsignedInt:CFDictionaryGetInt64Ranged() + 1];
            [(NSDictionary *)v9 setObject:v16 forKeyedSubscript:v15];
          }
        }
        id v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v11);
    }

    long long v17 = v6->_idsDeviceBTDictionary;
    v6->_idsDeviceBTDictionary = v8;
    id v18 = v8;

    idsDeviceCountBTDictionary = v6->_idsDeviceCountBTDictionary;
    v6->_idsDeviceCountBTDictionary = v9;

    idsDeviceBTDictionary = v6->_idsDeviceBTDictionary;
    id v5 = v25;
  }
  uint64_t v20 = [(NSDictionary *)idsDeviceBTDictionary objectForKeyedSubscript:v5];
  long long v21 = v5;
  BOOL v22 = (CFDictionaryGetInt64Ranged() & 0xFFFFFFFELL) == 0 || v20 == 0;
  BOOL v23 = !v22;
  if (!v22 && dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (a4) {
    *a4 = v23;
  }
  objc_sync_exit(v6);

  return v20;
}

- (void)idsDevicesAppendDescription:(id *)a3
{
  id v4 = [(NSData *)self->_bleAdvertisingAddress bytes];
  id v5 = (void *)IDSCopyLocalDeviceUniqueID();
  id v49 = SFDeviceModel();
  NSAppendPrintF();

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v6 = [(SDNearbyAgent *)self idsDeviceArray];
  id v55 = [v6 countByEnumeratingWithState:&v67 objects:v73 count:16];
  if (v55)
  {
    uint64_t v53 = *(void *)v68;
    uint64_t v52 = IDSServiceNameiMessage;
    uint64_t v51 = IDSServiceNameSMSRelay;
    id v54 = v6;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v68 != v53) {
          objc_enumerationMutation(v6);
        }
        uint64_t v58 = v7;
        id v8 = *(void **)(*((void *)&v67 + 1) + 8 * v7);
        long long v9 = [v8 name];
        long long v10 = [v8 uniqueIDOverride];
        id v11 = [v8 modelIdentifier];
        uint64_t v12 = [v8 productBuildVersion];
        long long v50 = [v8 nsuuid];
        NSAppendPrintF();

        uint64_t v13 = [v8 nsuuid:v9, v10, v11, v12, v50];

        if (v13)
        {
          id v14 = [objc_alloc((Class)IDSService) initWithService:v52];
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          uint64_t v56 = v14;
          uint64_t v15 = [v14 devices];
          id v16 = [v15 countByEnumeratingWithState:&v63 objects:v72 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v64;
            while (2)
            {
              for (i = 0; i != v17; i = (char *)i + 1)
              {
                if (*(void *)v64 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void **)(*((void *)&v63 + 1) + 8 * i);
                uint64_t v21 = [v8 uniqueIDOverride];
                if (!v21) {
                  goto LABEL_48;
                }
                BOOL v22 = (void *)v21;
                BOOL v23 = [v20 uniqueIDOverride];
                id v24 = [v8 uniqueIDOverride];
                unsigned int v25 = [v23 isEqual:v24];

                if (v25)
                {
LABEL_48:
                  uint64_t v26 = [v8 nsuuid];
                  if (!v26) {
                    goto LABEL_19;
                  }
                  long long v27 = (void *)v26;
                  long long v28 = [v20 nsuuid];
                  long long v29 = [v8 nsuuid];
                  unsigned __int8 v30 = [v28 isEqual:v29];

                  if (v30)
                  {
LABEL_19:

                    NSAppendPrintF();
                    goto LABEL_20;
                  }
                }
              }
              id v17 = [v15 countByEnumeratingWithState:&v63 objects:v72 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }
        }
LABEL_20:
        int v31 = [v8 nsuuid];

        if (v31)
        {
          id v32 = [objc_alloc((Class)IDSService) initWithService:v51];
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          id v57 = v32;
          id v33 = [v32 devices];
          id v34 = [v33 countByEnumeratingWithState:&v59 objects:v71 count:16];
          if (v34)
          {
            id v35 = v34;
            uint64_t v36 = *(void *)v60;
            while (2)
            {
              for (j = 0; j != v35; j = (char *)j + 1)
              {
                if (*(void *)v60 != v36) {
                  objc_enumerationMutation(v33);
                }
                long long v38 = *(void **)(*((void *)&v59 + 1) + 8 * (void)j);
                if (([v38 supportsSMSRelay] & 1) != 0
                  || [v38 supportsMMSRelay])
                {
                  uint64_t v39 = [v8 uniqueIDOverride];
                  if (!v39) {
                    goto LABEL_49;
                  }
                  long long v40 = (void *)v39;
                  long long v41 = [v38 uniqueIDOverride];
                  long long v42 = [v8 uniqueIDOverride];
                  unsigned int v43 = [v41 isEqual:v42];

                  if (v43)
                  {
LABEL_49:
                    uint64_t v44 = [v8 nsuuid];
                    if (!v44) {
                      goto LABEL_35;
                    }
                    long long v45 = (void *)v44;
                    long long v46 = [v38 nsuuid];
                    long long v47 = [v8 nsuuid];
                    unsigned __int8 v48 = [v46 isEqual:v47];

                    if (v48)
                    {
LABEL_35:

                      NSAppendPrintF();
                      goto LABEL_36;
                    }
                  }
                }
              }
              id v35 = [v33 countByEnumeratingWithState:&v59 objects:v71 count:16];
              if (v35) {
                continue;
              }
              break;
            }
          }
        }
LABEL_36:
        if ([v8 isActive]) {
          NSAppendPrintF();
        }
        id v6 = v54;
        if ([v8 isConnected]) {
          NSAppendPrintF();
        }
        if ([v8 isLocallyPaired]) {
          NSAppendPrintF();
        }
        NSAppendPrintF();
        uint64_t v7 = v58 + 1;
      }
      while ((id)(v58 + 1) != v55);
      id v55 = [v54 countByEnumeratingWithState:&v67 objects:v73 count:16];
    }
    while (v55);
  }
  else
  {

    NSAppendPrintF();
  }
}

- (BOOL)_idsHasActiveWatch
{
  if (self->_idsHasActiveWatchCache < 0)
  {
    self->_idsHasActiveWatchCache = 0;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v3 = [(SDNearbyAgent *)self idsDeviceArray];
    id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v13;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ([v8 isLocallyPaired])
          {
            if ([v8 isActive] && (objc_msgSend(v8, "isConnected") & 1) != 0
              || [v8 isConnected]
              && ([v8 productBuildVersion],
                  long long v9 = objc_claimAutoreleasedReturnValue(),
                  unint64_t v10 = (unint64_t)[v9 compare:@"14S" options:65],
                  v9,
                  (v10 & 0x8000000000000000) != 0))
            {
              self->_idsHasActiveWatchCache = 1;
              goto LABEL_16;
            }
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
  return self->_idsHasActiveWatchCache != 0;
}

- (int)_idsHomePodCount
{
  int result = self->_idsHomePodCountCache;
  if (result < 0)
  {
    self->_idsHomePodCountCache = 0;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = [(SDNearbyAgent *)self idsDeviceArray];
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (!v5) {
      goto LABEL_13;
    }
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (1)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unint64_t v10 = [v9 modelIdentifier];
        if ([v10 hasPrefix:@"AudioAccessory"])
        {
        }
        else
        {
          id v11 = [v9 modelIdentifier];
          unsigned int v12 = [v11 hasPrefix:@"HomePod1,"];

          if (!v12) {
            continue;
          }
        }
        ++self->_idsHomePodCountCache;
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (!v6)
      {
LABEL_13:

        return self->_idsHomePodCountCache;
      }
    }
  }
  return result;
}

- (int)_idsVisionOS1Count
{
  int result = self->_idsVisionOS1CountCache;
  if (result < 0)
  {
    self->_idsVisionOS1CountCache = 0;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = [(SDNearbyAgent *)self idsDeviceArray];
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (!v5) {
      goto LABEL_15;
    }
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (1)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        unint64_t v10 = [v9 productName];
        if (![v10 isEqualToString:@"xrOS"]) {
          goto LABEL_12;
        }
        if (!v9)
        {
          uint64_t v11 = 0;
LABEL_12:

          continue;
        }
        [v9 operatingSystemVersion];

        if (v11 == 1) {
          ++self->_idsVisionOS1CountCache;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (!v6)
      {
LABEL_15:

        return self->_idsVisionOS1CountCache;
      }
    }
  }
  return result;
}

- (int)_idsVisionOS2OrHigherCount
{
  int result = self->_idsVisionOS2OrHigherCountCache;
  if (result < 0)
  {
    self->_idsVisionOS2OrHigherCountCache = 0;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = [(SDNearbyAgent *)self idsDeviceArray];
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (!v5) {
      goto LABEL_15;
    }
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (1)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        unint64_t v10 = [v9 productName];
        if (![v10 isEqualToString:@"xrOS"]) {
          goto LABEL_12;
        }
        if (!v9)
        {
          uint64_t v11 = 0;
LABEL_12:

          continue;
        }
        [v9 operatingSystemVersion];

        if (v11 >= 2) {
          ++self->_idsVisionOS2OrHigherCountCache;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (!v6)
      {
LABEL_15:

        return self->_idsVisionOS2OrHigherCountCache;
      }
    }
  }
  return result;
}

- (BOOL)idsIsSignedIn
{
  dispatch_semaphore_t v2 = self;
  objc_sync_enter(v2);
  if ((v2->_idsIsSignedInCache & 0x80000000) == 0) {
    goto LABEL_24;
  }
  v2->_idsIsSignedInCache = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [(IDSService *)v2->_idsService accounts];
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) isActive])
        {
          v2->_idsIsSignedInCache = 1;
          goto LABEL_12;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  if (!v2->_idsIsSignedInCache)
  {
    uint64_t v7 = [(SDNearbyAgent *)v2 _idsDeviceArrayLocked];
    if ([v7 count])
    {
    }
    else
    {
      id v8 = [(IDSService *)v2->_idsService devices];
      BOOL v9 = [v8 count] == 0;

      if (v9) {
        goto LABEL_13;
      }
    }
    v2->_idsIsSignedInCache = 1;
    if (dword_100969808 > 90) {
      goto LABEL_24;
    }
    if (dword_100969808 != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
  }
LABEL_13:
  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_24:
  BOOL v10 = v2->_idsIsSignedInCache != 0;
  objc_sync_exit(v2);

  return v10;
}

- (int)_idsMacCount
{
  int result = self->_idsMacCountCache;
  if (result < 0)
  {
    self->_idsMacCountCache = 0;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = [(SDNearbyAgent *)self idsDeviceArray];
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          BOOL v9 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) modelIdentifier];
          unsigned int v10 = [v9 containsString:@"Mac"];

          if (v10) {
            ++self->_idsMacCountCache;
          }
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }

    return self->_idsMacCountCache;
  }
  return result;
}

- (void)_idsMeDeviceChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v3 = self;
  objc_sync_enter(v3);
  idsBluetoothDeviceIDsForMe = v3->_idsBluetoothDeviceIDsForMe;
  v3->_idsBluetoothDeviceIDsForMe = 0;

  objc_sync_exit(v3);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3->_ddRequests;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        unsigned int v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v10, "discoveryFlags", (void)v12) & 0x100000) != 0)
        {
          long long v11 = [(SDNearbyAgent *)v3 _idsBluetoothDeviceIDsForMe];
          [v10 setDeviceFilter:v11];
        }
      }
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [(SDNearbyAgent *)v3 _update];
}

- (BOOL)_idsShouldAdvertiseNearbyInfo
{
  int idsShouldAdvertiseNearbyInfo = self->_idsShouldAdvertiseNearbyInfo;
  if ((idsShouldAdvertiseNearbyInfo & 0x80000000) == 0) {
    return idsShouldAdvertiseNearbyInfo > 0;
  }
  self->_int idsShouldAdvertiseNearbyInfo = 0;
  id v5 = [(SDNearbyAgent *)self idsDeviceArray];
  int DeviceClass = GestaltGetDeviceClass();
  if (DeviceClass == 6)
  {
    if ((unint64_t)[v5 count] < 2)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v7 = v5;
      id v14 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v20;
LABEL_19:
        uint64_t v17 = 0;
        while (1)
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v7);
          }
          uint64_t v18 = [*(id *)(*((void *)&v19 + 1) + 8 * v17) modelIdentifier:v19];
          long long v13 = v18;
          if (v18)
          {
            if (([v18 hasPrefix:@"iPhone"] & 1) == 0) {
              goto LABEL_30;
            }
          }

          if (v15 == (id)++v17)
          {
            id v15 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v15) {
              goto LABEL_19;
            }
            goto LABEL_26;
          }
        }
      }
      goto LABEL_26;
    }
  }
  else if (DeviceClass == 1)
  {
    if ((unint64_t)[v5 count] < 2)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v7 = v5;
      id v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v24;
LABEL_8:
        uint64_t v11 = 0;
        while (1)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = [*(id *)(*((void *)&v23 + 1) + 8 * v11) modelIdentifier];
          long long v13 = v12;
          if (v12)
          {
            if (([v12 hasPrefix:@"Watch"] & 1) == 0) {
              break;
            }
          }

          if (v9 == (id)++v11)
          {
            id v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
            if (v9) {
              goto LABEL_8;
            }
            goto LABEL_26;
          }
        }
LABEL_30:
        self->_int idsShouldAdvertiseNearbyInfo = 1;

        goto LABEL_31;
      }
LABEL_26:

LABEL_29:
      int idsShouldAdvertiseNearbyInfo = self->_idsShouldAdvertiseNearbyInfo;
      return idsShouldAdvertiseNearbyInfo > 0;
    }
  }
  else if (![v5 count])
  {
    goto LABEL_29;
  }
  self->_int idsShouldAdvertiseNearbyInfo = 1;
LABEL_31:

  return 1;
}

- (int)_idsShouldEncryptActivityLevel
{
  int idsShouldEncryptActivityLevel = self->_idsShouldEncryptActivityLevel;
  if (idsShouldEncryptActivityLevel < 0)
  {
    if ([(CUSystemMonitor *)self->_systemMonitor manateeAvailable])
    {
      [(SDNearbyAgent *)self idsDeviceArray];
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v14;
        while (2)
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v14 != v7) {
              objc_enumerationMutation(v4);
            }
            id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
            uint64_t v10 = [v9 modelIdentifier];
            int v11 = GestaltProductTypeStringToDeviceClass();

            if (v9) {
              [v9 operatingSystemVersion];
            }
            if (v11 && (DeviceOSVersionAtOrLater() & 1) == 0)
            {
              if (dword_100969808 <= 20 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
                LogPrintF();
              }
              int idsShouldEncryptActivityLevel = 0;
              goto LABEL_25;
            }
          }
          id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
      int idsShouldEncryptActivityLevel = 1;
LABEL_25:
    }
    else
    {
      if (dword_100969808 <= 20 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      int idsShouldEncryptActivityLevel = 0;
    }
    self->_int idsShouldEncryptActivityLevel = idsShouldEncryptActivityLevel;
  }
  return idsShouldEncryptActivityLevel;
}

- (int)_idsWatchCount
{
  int result = self->_idsWatchCountCache;
  if (result < 0)
  {
    self->_idsWatchCountCache = 0;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v15 = self;
    id v4 = [(SDNearbyAgent *)self idsDeviceArray];
    id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v10 = [v9 modelIdentifier:v14];
          unsigned int v11 = [v10 containsString:@"Watch"];

          if (v11)
          {
            long long v12 = [v9 modelIdentifier];
            GestaltProductTypeStringToDeviceClass();
            if (v9)
            {
              [v9 operatingSystemVersion];
              [v9 operatingSystemVersion];
              [v9 operatingSystemVersion];
            }
            LODWORD(v14) = 10100;
            int v13 = DeviceOSVersionAtOrLaterEx();

            if (v13) {
              ++v15->_idsWatchCountCache;
            }
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v6);
    }

    return v15->_idsWatchCountCache;
  }
  return result;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  id v17 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100969808 <= 20 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100969808 <= 20 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v16 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100969808 <= 20 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v7 = self;
  objc_sync_enter(v7);
  v7->_idsIsSignedInCache = -1;
  objc_sync_exit(v7);

  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 postNotificationName:@"SDNotificationNameIDSAccountsChanged" object:v7];

  [(SDNearbyAgent *)v7 service:v9 devicesChanged:0];
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100969808 <= 20 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    id v7 = v9;
    id v8 = v6;
    LogPrintF();
  }
  self->_idsHasActiveWatchCache = -1;
  [(SDNearbyAgent *)self _update];
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    id v24 = [v6 count];
    LogPrintF();
  }
  id v7 = self;
  objc_sync_enter(v7);
  idsBluetoothDevicesArray = v7->_idsBluetoothDevicesArray;
  v7->_idsBluetoothDevicesArray = 0;

  idsBluetoothDevicesSet = v7->_idsBluetoothDevicesSet;
  v7->_idsBluetoothDevicesSet = 0;

  idsBluetoothDeviceIDsForLEPipe = v7->_idsBluetoothDeviceIDsForLEPipe;
  v7->_idsBluetoothDeviceIDsForLEPipe = 0;

  idsBluetoothDeviceIDsForMe = v7->_idsBluetoothDeviceIDsForMe;
  v7->_idsBluetoothDeviceIDsForMe = 0;

  objc_storeStrong((id *)&v7->_idsDeviceArray, a4);
  idsDeviceBTDictionary = v7->_idsDeviceBTDictionary;
  v7->_idsDeviceBTDictionary = 0;

  idsDeviceCountBTDictionary = v7->_idsDeviceCountBTDictionary;
  v7->_idsDeviceCountBTDictionary = 0;

  v7->_idsIsSignedInCache = -1;
  objc_sync_exit(v7);

  v7->_allowEnhancedDiscovery = -1;
  v7->_idsAppleTVCountCache = -1;
  v7->_idsContinuityDeviceCountCache = -1;
  v7->_idsMacCountCache = -1;
  *(void *)&v7->_int idsShouldAdvertiseNearbyInfo = -1;
  v7->_idsWatchCountCache = -1;
  *(void *)&v7->_idsHasActiveWatchCache = -1;
  *(void *)&v7->_idsVisionOS1CountCache = -1;
  if (v7->_bleNearbyInfoScanner)
  {
    if ([(NSMutableSet *)v7->_caRequests count])
    {
      id v14 = [(SDNearbyAgent *)v7 _idsBluetoothDeviceIDsForSharing];
      [(SFBLEScanner *)v7->_bleNearbyInfoScanner setDeviceFilter:v14];
    }
    else
    {
      [(SFBLEScanner *)v7->_bleNearbyInfoScanner setDeviceFilter:0];
    }
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v7->_ddRequests;
  id v16 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(v20, "discoveryFlags", v24) & 0x20) != 0)
        {
          uint64_t v21 = [(SDNearbyAgent *)v7 idsBluetoothDeviceIDsForSharing];
LABEL_22:
          long long v22 = (void *)v21;
          [v20 setDeviceFilter:v21];

          continue;
        }
        if (([v20 discoveryFlags] & 0x100000) != 0)
        {
          uint64_t v21 = [(SDNearbyAgent *)v7 _idsBluetoothDeviceIDsForMe];
          goto LABEL_22;
        }
        if (([v20 discoveryFlags] & 0x200000) != 0)
        {
          uint64_t v21 = [(SDNearbyAgent *)v7 _idsBluetoothDeviceIDsForHomePods];
          goto LABEL_22;
        }
        if (([v20 discoveryFlags] & 0x1000000) != 0) {
          [(SDNearbyAgent *)v7 _unlockDeviceFilterChangedForRequest:v20];
        }
      }
      id v17 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v17);
  }

  [(SDNearbyAgent *)v7 _registerForMagicMountUpdates];
  [(SDNearbyAgent *)v7 _update];
  long long v23 = +[NSNotificationCenter defaultCenter];
  [v23 postNotificationName:@"SDNotificationNameIDSDevicesChanged" object:v7];
}

- (BOOL)isDeviceValidRIServer:(id)a3
{
  if (self->_isRIClientEnabled) {
    return [a3 hasPrefix:@"iProd"];
  }
  else {
    return 0;
  }
}

- (BOOL)isTempAuthTagKnown:(id)a3 bluetoothAddressData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_idIdentityArray;
  id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "verifyAuthTag:data:type:error:", v6, v7, 2, 0, (void)v13))
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v9;
}

- (int)serviceStart:(id)a3
{
  id v4 = a3;
  id v5 = [v4 serviceUUID];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    id v18 = v4;
    LogPrintF();
  }
  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->_services objectForKeyedSubscript:v5];

    if (!v6)
    {
      if ([v4 needsSetup]
        && ((unsigned int v7 = [v4 deviceActionType], v7 == 11)
         || v7 == 33
         || [v4 deviceActionType] == 9
         || [v4 deviceActionType] == 10
         || [v4 deviceActionType] == 36
         || [v4 deviceActionType] == 1)
        || objc_msgSend(v4, "deviceActionType", v18) == 19
        || [v4 deviceActionType] == 22)
      {
        if (!objc_msgSend(v4, "deviceClassCode", v18)) {
          [v4 setDeviceClassCode:SFDeviceClassCodeGet()];
        }
        unsigned int v8 = [v4 deviceColorCode];
        if (v8 == SFDeviceColorCodeUnknown) {
          [v4 setDeviceColorCode:SFDeviceColorCodeGet()];
        }
        if (![v4 deviceModelCode]) {
          [v4 setDeviceModelCode:SFDeviceModelCodeGet()];
        }
        if (self->_homePodIdentifiesAsB520)
        {
          if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
            [v4 setDeviceModelCode:5, v4];
          }
          else
          {
            [v4 setDeviceModelCode:5, v18];
          }
        }
        if (self->_homePodIdentifiesAsB620)
        {
          if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
            [v4 setDeviceModelCode:6, v4];
          }
          else
          {
            [v4 setDeviceModelCode:6 v18];
          }
        }
        uint64_t homePodModelCodeOverride = self->_homePodModelCodeOverride;
        if ((homePodModelCodeOverride & 0x80000000) != 0) {
          goto LABEL_45;
        }
        if (dword_100969808 <= 30)
        {
          if (dword_100969808 != -1
            || (int v12 = _LogCategory_Initialize(),
                uint64_t homePodModelCodeOverride = self->_homePodModelCodeOverride,
                v12))
          {
            uint64_t v19 = homePodModelCodeOverride;
            LogPrintF();
            [v4 setDeviceModelCode:self->_homePodModelCodeOverride v19];
LABEL_45:
            services = self->_services;
            if (!services)
            {
              long long v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
              long long v15 = self->_services;
              self->_services = v14;

              services = self->_services;
            }
            [(NSMutableDictionary *)services setObject:v4 forKeyedSubscript:v5];
            [(SDNearbyAgent *)self _update];
            int v16 = 0;
            goto LABEL_48;
          }
        }
      }
      else
      {
        id v9 = [v4 identifier];
        uint64_t v10 = (void *)SFServiceIdentifierProxHandoff;

        if (v9 != v10) {
          goto LABEL_45;
        }
        if (![v4 deviceClassCode]) {
          [v4 setDeviceClassCode:SFDeviceClassCodeGet()];
        }
        if ([v4 deviceModelCode]) {
          goto LABEL_45;
        }
        LOBYTE(homePodModelCodeOverride) = SFDeviceModelCodeGet();
      }
      [v4 setDeviceModelCode:homePodModelCodeOverride, v18];
      goto LABEL_45;
    }
    int v16 = -6721;
  }
  else
  {
    int v16 = -6745;
  }
  if (dword_100969808 <= 60 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_48:

  return v16;
}

- (void)serviceStop:(id)a3
{
  id v5 = a3;
  id v4 = [v5 serviceUUID];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (v4)
  {
    [(NSMutableDictionary *)self->_services removeObjectForKey:v4];
    [(SDNearbyAgent *)self _update];
  }
  else if (dword_100969808 <= 60 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)serviceReceivedFrameType:(unsigned __int8)a3 serviceType:(unsigned __int8)a4 data:(id)a5 peer:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  services = self->_services;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  _OWORD v15[2] = sub_100228A68;
  v15[3] = &unk_1008D1328;
  unsigned __int8 v18 = a4;
  unsigned __int8 v19 = a3;
  id v16 = v10;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  [(NSMutableDictionary *)services enumerateKeysAndObjectsUsingBlock:v15];
}

- (void)serviceSendEvent:(id)a3 service:(id)a4
{
}

- (void)serviceSendRequest:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SDNearbyAgent *)self _sendMessage:v6 frameType:9 service:v7 session:0];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = [v7 responseMessageInternalHandler];

    if (v10)
    {
      if (dword_100969808 <= 60 && (dword_100969808 != -1 || _LogCategory_Initialize()))
      {
        id v11 = [v6 identifier];
        id v16 = [v7 identifier];
        LogPrintF();
      }
      id v12 = [objc_alloc((Class)SFResponseMessage) initWithRequestMessage:v6];
      CFStringRef v17 = @"error";
      id v13 = +[NSNumber numberWithInt:v9];
      unsigned __int8 v18 = v13;
      id v14 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      [v12 setHeaderFields:v14];

      long long v15 = [v7 responseMessageInternalHandler];
      ((void (**)(void, id))v15)[2](v15, v12);
    }
  }
}

- (void)serviceSendResponse:(id)a3 service:(id)a4
{
}

- (int)sessionStart:(id)a3
{
  id v4 = a3;
  id v5 = [v4 peerDevice];
  id v6 = [v5 identifier];
  id v7 = [v4 identifier];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    long long v27 = [v4 serviceUUID];
    long long v28 = v7;
    LogPrintF();
  }
  id v8 = 0;
  int v9 = -6708;
  if (!v6 || !v7) {
    goto LABEL_38;
  }
  id v10 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v7];

  if (v10)
  {
    id v8 = 0;
    int v9 = -6721;
    goto LABEL_38;
  }
  if ((unint64_t)[(NSMutableDictionary *)self->_sessions count] > 0x7F)
  {
    id v8 = 0;
    int v9 = -6764;
    goto LABEL_38;
  }
  uint64_t v11 = [(NSMutableDictionary *)self->_bleConnections objectForKeyedSubscript:v6];
  if (v11)
  {
    id v8 = (id)v11;
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      long long v27 = v4;
      LogPrintF();
    }
    [v8 addClient:v4, v27, v28];
    [v8 setAcceptor:0];
  }
  else
  {
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      long long v27 = v4;
      LogPrintF();
    }
    [v5 bleDevice:v27, v28];
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      id v12 = objc_alloc_init((Class)SFBLEDevice);
      [v12 setIdentifier:v6];
    }
    id v8 = [objc_alloc((Class)SFBLEConnection) initWithDevice:v12 acceptor:0];
    [v8 setDispatchQueue:self->_dispatchQueue];
    [v8 setSessionFlags:[v4 sessionFlags]];
    bleConnections = self->_bleConnections;
    if (!bleConnections)
    {
      id v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      long long v15 = self->_bleConnections;
      self->_bleConnections = v14;

      bleConnections = self->_bleConnections;
    }
    [(NSMutableDictionary *)bleConnections setObject:v8 forKeyedSubscript:v6];
    [v8 addClient:v4];
    [v8 activateDirect];
  }
  if (![v4 serviceType])
  {
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    id v16 = [v4 serviceUUID];
    [v16 getUUIDBytes:&v29];

    if (v29 == 0x10000001000000 && v30 == 0xDF80FBF31F000080)
    {
      unsigned int v26 = [(SDNearbyAgent *)self _setupSendCreateSession:v4 cnx:v8];
      if (v26)
      {
        int v9 = v26;
LABEL_38:
        if (dword_100969808 <= 60 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        goto LABEL_35;
      }
    }
  }
  id v18 = [self->_bleWPNearby state];
  if (v18)
  {
    id v19 = v18;
    long long v20 = [v4 bluetoothStateChangedHandler];

    if (v20)
    {
      uint64_t v21 = [v4 bluetoothStateChangedHandler];
      ((void (**)(void, id))v21)[2](v21, v19);
    }
  }
  sessions = self->_sessions;
  if (!sessions)
  {
    long long v23 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v24 = self->_sessions;
    self->_sessions = v23;

    sessions = self->_sessions;
  }
  [(NSMutableDictionary *)sessions setObject:v4 forKeyedSubscript:v7];
  [(SDNearbyAgent *)self _update];
  int v9 = 0;
LABEL_35:

  return v9;
}

- (void)sessionStop:(id)a3
{
  id v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v4 = [v11 peerDevice];
  id v5 = [v4 identifier];

  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->_bleConnections objectForKeyedSubscript:v5];
    if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
    {
      int v9 = v5;
      id v10 = v6;
      id v8 = v11;
      LogPrintF();
    }
    if (v6 && ([v6 removeClient:v11] & 1) == 0)
    {
      if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
      {
        id v8 = v11;
        LogPrintF();
      }
      -[NSMutableDictionary removeObjectForKey:](self->_bleConnections, "removeObjectForKey:", v5, v8, v9, v10);
      [v6 invalidate];
    }
  }
  else if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    id v8 = v11;
    LogPrintF();
  }
  id v7 = [v11 identifier:v8];

  if (v7) {
    [(NSMutableDictionary *)self->_sessions removeObjectForKey:v7];
  }
  [(SDNearbyAgent *)self _update];
}

- (void)sessionReceivedFrameType:(unsigned __int8)a3 serviceType:(unsigned __int8)a4 data:(id)a5 peer:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  sessions = self->_sessions;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  _OWORD v15[2] = sub_10022940C;
  v15[3] = &unk_1008D1350;
  unsigned __int8 v18 = a4;
  unsigned __int8 v19 = a3;
  id v16 = v11;
  id v17 = v10;
  id v13 = v10;
  id v14 = v11;
  [(NSMutableDictionary *)sessions enumerateKeysAndObjectsUsingBlock:v15];
}

- (void)sessionSendEvent:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 serviceUUID];
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  if (v8)
  {
    int v9 = v8;
    [v8 getUUIDBytes:&v23];
    BOOL v10 = v23 == 0x10000006000000 && v24 == 0xDF80FBF31F000080;
    BOOL v11 = !v10;

    if (!v11)
    {
      id v12 = [v7 peerDevice];
      id v13 = [v12 identifier];

      if (v13)
      {
        uint64_t v14 = [(NSMutableDictionary *)self->_bleConnections objectForKeyedSubscript:v13];
        if (v14)
        {
          long long v15 = (void *)v14;
          id v16 = [v6 headerFields];

          if (!v16)
          {
            id v17 = [v6 bodyData];
            if ([v17 length])
            {
              id v18 = objc_alloc_init((Class)NSMutableData);
              char v22 = 11;
              [v18 appendBytes:&v22 length:1];
              [v18 appendData:v17];
              v19[0] = _NSConcreteStackBlock;
              v19[1] = 3221225472;
              v19[2] = sub_100229844;
              v19[3] = &unk_1008CB4B0;
              id v17 = v17;
              id v20 = v17;
              uint64_t v21 = v13;
              [v15 sendData:v18 completion:v19];
            }
            else if (dword_100969808 <= 60 && (dword_100969808 != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            goto LABEL_15;
          }
          if (dword_100969808 <= 60 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
LABEL_33:
          id v17 = 0;
LABEL_15:

          goto LABEL_16;
        }
        if (dword_100969808 > 60 || dword_100969808 == -1 && !_LogCategory_Initialize())
        {
LABEL_32:
          long long v15 = 0;
          goto LABEL_33;
        }
      }
      else if (dword_100969808 > 60 || dword_100969808 == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_32;
      }
      LogPrintF();
      goto LABEL_32;
    }
  }
  [(SDNearbyAgent *)self _sendMessage:v6 frameType:8 service:0 session:v7];
LABEL_16:
}

- (void)sessionSendRequest:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SDNearbyAgent *)self _sendMessage:v6 frameType:9 service:0 session:v7];
  if (v8)
  {
    uint64_t v9 = v8;
    BOOL v10 = [v7 responseMessageInternalHandler];

    if (v10)
    {
      if (dword_100969808 <= 60 && (dword_100969808 != -1 || _LogCategory_Initialize()))
      {
        BOOL v11 = [v6 identifier];
        id v16 = [v7 identifier];
        LogPrintF();
      }
      id v12 = [objc_alloc((Class)SFResponseMessage) initWithRequestMessage:v6];
      CFStringRef v17 = @"error";
      id v13 = +[NSNumber numberWithInt:v9];
      id v18 = v13;
      uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      [v12 setHeaderFields:v14];

      long long v15 = [v7 responseMessageInternalHandler];
      ((void (**)(void, id))v15)[2](v15, v12);
    }
  }
}

- (void)sessionSendResponse:(id)a3 session:(id)a4
{
}

- (int)_sendMessage:(id)a3 frameType:(unsigned __int8)a4 service:(id)a5 session:(id)a6
{
  id v10 = a3;
  unsigned __int8 v75 = a4;
  id v11 = a5;
  id v12 = a6;
  long long v63 = v10;
  id v13 = [v10 identifier];
  unsigned int v74 = 0;
  uint64_t v78 = 0;
  uint64_t v79 = 0;
  v77[0] = 0;
  v77[1] = 0;
  long long v62 = v13;
  if (![(NSMutableDictionary *)self->_bleConnections count])
  {
    id v15 = 0;
    id v16 = 0;
    char v22 = 0;
    id v23 = 0;
    id v32 = 0;
    id v33 = 0;
    int v31 = 0;
    long long v50 = 0;
    unsigned int v74 = 0;
    goto LABEL_43;
  }
  if (v12)
  {
    uint64_t v14 = [v12 peerDevice];
    id v15 = [v14 identifier];

    id v16 = [v12 identifier];
    CFStringRef v17 = v12;
  }
  else
  {
    id v18 = [v63 peerDevice];
    id v15 = [v18 identifier];

    if (!v15)
    {
      unsigned __int8 v19 = [(NSMutableDictionary *)self->_bleConnections allValues];
      id v20 = [v19 firstObject];
      uint64_t v21 = [v20 peerDevice];
      id v15 = [v21 identifier];
    }
    id v16 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&unk_10076E78C];
    CFStringRef v17 = v11;
  }
  char v22 = [v17 serviceUUID];
  if (!v15)
  {
    unsigned int v74 = 0;
    if (dword_100969808 <= 20 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v15 = 0;
    id v23 = 0;
    goto LABEL_67;
  }
  id v23 = objc_alloc_init((Class)NSMutableData);
  [v23 appendBytes:&v75 length:1];
  if (!v16)
  {
    unsigned int v74 = -6708;
    if (dword_100969808 <= 60 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v16 = 0;
    goto LABEL_67;
  }
  [v16 getUUIDBytes:v77];
  [v23 appendBytes:v77 length:16];
  if (!v13)
  {
    unsigned int v74 = -6708;
    if (dword_100969808 <= 60 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
LABEL_67:
    id v32 = 0;
    id v33 = 0;
    int v31 = 0;
    long long v50 = 0;
    goto LABEL_43;
  }
  id v24 = v11;
  [v13 getUUIDBytes:v77];
  [v23 appendBytes:v77 length:16];
  long long v25 = [v63 headerFields];
  if (!v25) {
    long long v25 = &__NSDictionary0__struct;
  }
  long long v61 = v25;
  id v26 = [v25 mutableCopy];
  long long v27 = v26;
  if (v22)
  {
    [v22 getUUIDBytes:&v78];
    long long v28 = +[NSData dataWithBytes:&v78 length:16];
    [v27 setObject:v28 forKeyedSubscript:@"_serviceUUID"];

    long long v60 = v27;
    Data = (void *)CFBinaryPlistStreamedCreateDataEx();
    [v23 appendData:Data];
    uint64_t v30 = [v63 bodyData];
    id v11 = v24;
    if (!v30)
    {
      uint64_t v30 = +[NSData data];
    }
    long long v59 = (void *)v30;
    int v31 = (void *)CFBinaryPlistStreamedCreateDataEx();

    [v23 appendData:v31];
    if (v78 == 0x10000001000000 && v79 == 0xDF80FBF31F000080)
    {
      uint64_t v44 = [(NSMutableDictionary *)self->_bleConnections objectForKeyedSubscript:v15];
      if (v44)
      {
        id v45 = v23;
        id v46 = v23;
        long long v47 = [v46 mutableBytes];
        if (v75 - 8 <= 2) {
          *long long v47 = v75 + 26;
        }
        unsigned int v74 = [(SDNearbyAgent *)self _setupSendData:v46 sessionIdentifier:v16 cnx:v44 clientSession:v12];
      }
      else
      {
        id v45 = v23;
        unsigned int v74 = -6708;
        if (dword_100969808 <= 60 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
      }

      id v23 = v45;
      id v33 = v60;
      id v32 = v61;
    }
    else
    {
      uint64_t v58 = v22;
      id v35 = [v63 deviceIDs];
      if (v35)
      {
        uint64_t v56 = v31;
        id v57 = v16;
        id v36 = v23;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v37 = v35;
        id v38 = [v35 countByEnumeratingWithState:&v70 objects:v76 count:16];
        if (v38)
        {
          id v39 = v38;
          uint64_t v40 = *(void *)v71;
          do
          {
            for (i = 0; i != v39; i = (char *)i + 1)
            {
              long long v42 = v15;
              if (*(void *)v71 != v40) {
                objc_enumerationMutation(v37);
              }
              id v15 = *(id *)(*((void *)&v70 + 1) + 8 * i);

              unsigned int v43 = [(NSMutableDictionary *)self->_bleConnections objectForKeyedSubscript:v15];
              if (v43)
              {
                v67[0] = _NSConcreteStackBlock;
                v67[1] = 3221225472;
                v67[2] = sub_10022A424;
                v67[3] = &unk_1008CB4B0;
                id v68 = v15;
                id v69 = v63;
                [v43 sendData:v36 completion:v67];
              }
              else if (dword_100969808 <= 60 && (dword_100969808 != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
            }
            id v39 = [v37 countByEnumeratingWithState:&v70 objects:v76 count:16];
          }
          while (v39);
        }

        id v15 = 0;
        int v31 = v56;
        id v16 = v57;
        id v23 = v36;
      }
      else
      {
        long long v37 = 0;
        uint64_t v48 = [(NSMutableDictionary *)self->_bleConnections objectForKeyedSubscript:v15];
        if (v48)
        {
          id v49 = (void *)v48;
          v64[0] = _NSConcreteStackBlock;
          v64[1] = 3221225472;
          v64[2] = sub_10022A4DC;
          v64[3] = &unk_1008CB4B0;
          id v15 = v15;
          id v65 = v15;
          id v66 = v63;
          [v49 sendData:v23 completion:v64];
        }
        else
        {
          unsigned int v74 = -6708;
          if (dword_100969808 <= 60 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
        }
      }
      id v33 = v60;
      id v32 = v61;

      char v22 = v58;
    }
    long long v50 = v59;
  }
  else
  {
    unsigned int v74 = -6708;
    if (dword_100969808 > 60)
    {
      char v22 = 0;
      long long v50 = 0;
      id v32 = v61;
      id v33 = v26;
    }
    else
    {
      id v32 = v61;
      id v33 = v26;
      if (dword_100969808 != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      char v22 = 0;
      long long v50 = 0;
    }
    id v11 = v24;
    int v31 = 0;
  }
LABEL_43:
  int v51 = v74;
  if (v74)
  {
    if (dword_100969808 <= 60)
    {
      if (dword_100969808 != -1 || (v53 = v50, v54 = _LogCategory_Initialize(), long long v50 = v53, v51 = v74, v54))
      {
        uint64_t v52 = v50;
        LogPrintF();
        long long v50 = v52;
        int v51 = v74;
      }
    }
  }

  return v51;
}

- (int)_setupHandleCreateSession:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (char *)[v7 bytes];
  uint64_t v9 = (uint64_t)[v7 length];
  if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    id v10 = [v6 peerDevice];
    long long v28 = [v10 identifier];
    id v29 = v7;
    LogPrintF();
  }
  memset(v33, 0, sizeof(v33));
  memset(v32, 0, sizeof(v32));
  id v11 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&unk_10076E77B];
  if (!v11)
  {
    id v12 = 0;
LABEL_18:
    int v26 = -6700;
    goto LABEL_21;
  }
  id v12 = [(NSMutableDictionary *)self->_services objectForKeyedSubscript:v11];
  if (!v12)
  {
    int v26 = -6727;
    goto LABEL_21;
  }
  if (v9 > 16)
  {
    if ((unint64_t)v9 < 0x31)
    {
      int v26 = -6743;
      goto LABEL_21;
    }
    id v13 = v8 + 1;
    id v14 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v8 + 1];
    if (v14)
    {
      id v15 = v14;
      uint64_t v30 = v12;
      id v16 = v6;
      CFStringRef v17 = [(NSMutableDictionary *)self->_setupSessions objectForKeyedSubscript:v14];
      if (!v17)
      {
        CFStringRef v17 = objc_alloc_init(SDSession);
        [(SDSession *)v17 setIdentifier:v15];
        id v18 = [v6 peerDevice];
        unsigned __int8 v19 = [v18 identifier];
        [(SDSession *)v17 setPeerIdentifier:v19];

        setupSessions = self->_setupSessions;
        if (!setupSessions)
        {
          uint64_t v21 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          char v22 = self->_setupSessions;
          self->_setupSessions = v21;

          setupSessions = self->_setupSessions;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](setupSessions, "setObject:forKeyedSubscript:", v17, v15, v28, v29);
      }
      -[SDSession setSessionCreated:](v17, "setSessionCreated:", 1, v28);
      RandomBytes();
      cccurve25519_make_pub();
      cccurve25519();
      CryptoHKDF();
      id v23 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v32, 32, v32);
      [(SDSession *)v17 setReadKey:v23];

      [(SDSession *)v17 setReadNonce:0];
      CryptoHKDF();
      id v24 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v32, 32, v32);
      [(SDSession *)v17 setWriteKey:v24];

      [(SDSession *)v17 setWriteNonce:0];
      id v25 = objc_alloc_init((Class)NSMutableData);
      char v31 = 33;
      [v25 appendBytes:&v31 length:1];
      [v25 appendBytes:v13 length:16];
      [v25 appendBytes:v33 length:32];
      id v6 = v16;
      [v16 sendData:v25 completion:0];

      int v26 = 0;
      id v12 = v30;
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  int v26 = -6708;
LABEL_21:
  if (dword_100969808 <= 60 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_15:

  return v26;
}

- (int)_setupHandleSessionCreated:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (char *)[v7 bytes];
  uint64_t v9 = (uint64_t)[v7 length];
  if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    id v10 = [v6 peerDevice];
    id v25 = [v10 identifier];
    LogPrintF();
  }
  memset(v26, 0, sizeof(v26));
  if (v9 <= 16)
  {
    id v11 = 0;
    id v13 = 0;
    int v23 = -6708;
  }
  else if ((unint64_t)v9 < 0x31)
  {
    id v11 = 0;
    id v13 = 0;
    int v23 = -6743;
  }
  else
  {
    id v11 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v8 + 1];
    if (v11)
    {
      id v12 = [(NSMutableDictionary *)self->_setupSessions objectForKeyedSubscript:v11];
      id v13 = v12;
      if (v12)
      {
        id v14 = [v12 dhSecretKey];
        id v15 = [v14 bytes];

        if (v15)
        {
          cccurve25519();
          CryptoHKDF();
          id v16 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v26, 32, v26);
          [v13 setReadKey:v16];

          [v13 setReadNonce:0];
          CryptoHKDF();
          CFStringRef v17 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v26, 32, v26);
          [v13 setWriteKey:v17];

          [v13 setWriteNonce:0];
          [v13 setSessionCreated:1];
          while (1)
          {
            id v18 = [v13 sendDataQueue];
            id v19 = [v18 count];

            if (!v19) {
              break;
            }
            id v20 = [v13 sendDataQueue];
            uint64_t v21 = [v20 firstObject];

            char v22 = [v13 sendDataQueue];
            [v22 removeObjectAtIndex:0];

            [(SDNearbyAgent *)self _setupSendData:v21 sessionIdentifier:v11 cnx:v6 clientSession:0];
          }
          int v23 = 0;
        }
        else
        {
          int v23 = -6745;
        }
      }
      else
      {
        int v23 = -6727;
      }
    }
    else
    {
      id v13 = 0;
      int v23 = -6700;
    }
  }

  return v23;
}

- (int)_setupHandleSessionEncryptedFrame:(id)a3 type:(unsigned __int8)a4 cnx:(id)a5
{
  unsigned int v32 = a4;
  id v7 = a3;
  id v8 = a5;
  id v9 = v7;
  id v10 = (char *)[v9 bytes];
  uint64_t v11 = (uint64_t)[v9 length];
  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    id v12 = [v8 peerDevice];
    long long v27 = [v12 identifier];
    id v29 = v9;
    unint64_t v26 = v32;
    LogPrintF();
  }
  if (v11 <= 16)
  {
    id v20 = 0;
    id v16 = 0;
    id v14 = 0;
    int v23 = -6708;
    goto LABEL_13;
  }
  id v31 = v9;
  uint64_t v13 = v11 - 33;
  if ((unint64_t)v11 < 0x21)
  {
    id v20 = 0;
    id v16 = 0;
    id v14 = 0;
    int v23 = -6743;
LABEL_22:
    id v9 = v31;
    goto LABEL_13;
  }
  id v14 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v10 + 1];
  if (!v14)
  {
    id v20 = 0;
    id v16 = 0;
    int v23 = -6700;
    goto LABEL_22;
  }
  id v15 = [(NSMutableDictionary *)self->_setupSessions objectForKeyedSubscript:v14];
  if (v15)
  {
    id v16 = v15;
    id v30 = v14;
    id v17 = v8;
    id v18 = [v15 readKey];
    id v19 = [v18 bytes];

    if (v19)
    {
      [v16 readNonce];
      id v20 = [objc_alloc((Class)NSMutableData) initWithLength:v11 - 33];
      uint64_t v21 = (char *)[v20 mutableBytes];
      int v22 = chacha20_poly1305_decrypt_all_96x32();
      if (v22)
      {
        int v23 = v22;
        id v8 = v17;
      }
      else
      {
        [v16 setReadNonce:((char *)[v16 readNonce] + 1)];
        id v8 = v17;
        int v23 = [(SDNearbyAgent *)self _setupHandleSessionMessageType:v32 src:v21 end:&v21[v13] cnx:v17 session:v16];
        if (!v23)
        {
          id v14 = v30;
          id v9 = v31;
          goto LABEL_18;
        }
      }
      id v14 = v30;
      id v9 = v31;
    }
    else
    {
      id v20 = 0;
      int v23 = -6745;
      id v8 = v17;
      id v14 = v30;
      id v9 = v31;
    }
  }
  else
  {
    if (dword_100969808 > 60)
    {
      id v20 = 0;
      id v16 = 0;
      int v23 = -6727;
      id v9 = v31;
      goto LABEL_18;
    }
    id v9 = v31;
    if (dword_100969808 != -1 || _LogCategory_Initialize())
    {
      unint64_t v26 = (unint64_t)v14;
      LogPrintF();
    }
    id v20 = 0;
    id v16 = 0;
    int v23 = -6727;
  }
LABEL_13:
  if (dword_100969808 <= 60 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    id v24 = [v8 peerDevice:v26, v27, v29];
    long long v28 = [v24 identifier];
    LogPrintF();
  }
LABEL_18:

  return v23;
}

- (int)_setupHandleSessionMessageType:(unsigned __int8)a3 src:(const char *)a4 end:(const char *)a5 cnx:(id)a6 session:(id)a7
{
  int v10 = a3;
  id v53 = a6;
  id v52 = a7;
  int v54 = 0;
  if (a5 - a4 <= 15)
  {
    int v54 = -6750;
    if (dword_100969808 <= 60 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v12 = 0;
    long long v50 = 0;
    id v15 = 0;
    id v19 = 0;
    id v18 = 0;
    id v31 = 0;
    id v20 = 0;
    id v22 = 0;
    goto LABEL_35;
  }
  id v12 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:a4];
  uint64_t v13 = CFBinaryPlistStreamedCreateWithBytesEx2();
  long long v50 = (void *)v13;
  uint64_t v14 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v15 = 0;
LABEL_59:
    id v19 = 0;
    id v18 = 0;
    id v31 = 0;
    id v20 = 0;
    id v22 = 0;
    unint64_t v26 = 0;
    int v54 = -6756;
    goto LABEL_36;
  }
  id v15 = (void *)CFBinaryPlistStreamedCreateWithBytesEx2();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_59;
  }
  switch(v10)
  {
    case '$':
      id v16 = self;
      id v17 = objc_alloc_init((Class)SFResponseMessage);
      id v19 = 0;
      id v18 = 0;
      id v51 = v17;
      break;
    case '#':
      id v16 = self;
      id v17 = objc_alloc_init((Class)SFRequestMessage);
      id v19 = 0;
      id v51 = 0;
      id v18 = v17;
      break;
    case '""':
      id v16 = self;
      id v17 = objc_alloc_init((Class)SFEventMessage);
      id v18 = 0;
      id v51 = 0;
      id v19 = v17;
      break;
    default:
      id v46 = (SDNearbyAgent *)FatalErrorF();
      return [(SDNearbyAgent *)v46 _setupSendCreateSession:v48 cnx:v49];
  }
  id v20 = v17;
  id v21 = v12;
  [v20 setIdentifier:v12];
  [v20 setHeaderFields:v14];
  [v20 setBodyData:v15];
  id v22 = objc_alloc_init((Class)SFDevice);
  int v23 = [v53 peerDevice];
  id v24 = [v23 identifier];
  [v22 setIdentifier:v24];

  [v20 setPeerDevice:v22];
  id v25 = [v52 clientSession];
  if (!v25)
  {
    id v32 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&unk_10076E77B];
    if (v32)
    {
      id v33 = [(NSMutableDictionary *)v16->_services objectForKeyedSubscript:v32];
      id v34 = v33;
      if (v33)
      {
        if (v19
          && ([v33 eventMessageHandler],
              id v35 = objc_claimAutoreleasedReturnValue(),
              v35,
              v35))
        {
          id v36 = [v34 eventMessageHandler];
          long long v37 = (void (*)(void))v36[2];
        }
        else
        {
          if (!v18
            || ([v34 requestMessageHandler],
                uint64_t v40 = objc_claimAutoreleasedReturnValue(),
                v40,
                !v40))
          {
            if (v51)
            {
              long long v42 = [v34 responseMessageInternalHandler];

              if (v42)
              {
                unsigned int v43 = [v34 responseMessageInternalHandler];
                id v31 = v51;
                ((void (**)(void, id))v43)[2](v43, v51);

                id v12 = v21;
                goto LABEL_34;
              }
            }
            if (dword_100969808 <= 60)
            {
              id v12 = v21;
              if (dword_100969808 != -1 || _LogCategory_Initialize()) {
                LogPrintF();
              }
              goto LABEL_33;
            }
LABEL_32:
            id v12 = v21;
LABEL_33:
            id v31 = v51;
LABEL_34:

LABEL_35:
            unint64_t v26 = 0;
            goto LABEL_36;
          }
          id v36 = [v34 requestMessageHandler];
          long long v37 = (void (*)(void))v36[2];
        }
        v37();

        goto LABEL_32;
      }
      int v45 = -6727;
    }
    else
    {
      id v34 = 0;
      int v45 = -6700;
    }
    int v54 = v45;
    goto LABEL_32;
  }
  unint64_t v26 = v25;
  if (v19
    && ([v25 eventMessageHandler],
        long long v27 = objc_claimAutoreleasedReturnValue(),
        v27,
        v27))
  {
    long long v28 = [v26 eventMessageHandler];
    ((void (**)(void, void *))v28)[2](v28, v19);

    id v12 = v21;
  }
  else
  {
    id v12 = v21;
    if (!v18
      || ([v26 requestMessageHandler],
          id v29 = objc_claimAutoreleasedReturnValue(),
          v29,
          !v29))
    {
      id v31 = v51;
      if (v51
        && ([v26 responseMessageInternalHandler],
            id v38 = objc_claimAutoreleasedReturnValue(),
            v38,
            v38))
      {
        id v39 = [v26 responseMessageInternalHandler];
        ((void (**)(void, id))v39)[2](v39, v51);
      }
      else if (dword_100969808 <= 60 && (dword_100969808 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_36;
    }
    id v30 = [v26 requestMessageHandler];
    ((void (**)(void, void *))v30)[2](v30, v18);
  }
  id v31 = v51;
LABEL_36:
  int v41 = v54;
  if (v54)
  {
    if (dword_100969808 <= 60)
    {
      if (dword_100969808 != -1 || (int v41 = v54, _LogCategory_Initialize()))
      {
        LogPrintF();
        int v41 = v54;
      }
    }
  }

  return v41;
}

- (int)_setupSendCreateSession:(id)a3 cnx:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    id v19 = v8;
    LogPrintF();
  }
  memset(v23, 0, sizeof(v23));
  memset(v22, 0, sizeof(v22));
  v21[0] = 0;
  v21[1] = 0;
  if (v8)
  {
    id v9 = [(NSMutableDictionary *)self->_setupSessions objectForKeyedSubscript:v8];
    if (!v9)
    {
      id v9 = objc_alloc_init(SDSession);
      [(SDSession *)v9 setIdentifier:v8];
      int v10 = [v7 peerDevice];
      uint64_t v11 = [v10 identifier];
      [(SDSession *)v9 setPeerIdentifier:v11];

      setupSessions = self->_setupSessions;
      if (!setupSessions)
      {
        uint64_t v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        uint64_t v14 = self->_setupSessions;
        self->_setupSessions = v13;

        setupSessions = self->_setupSessions;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](setupSessions, "setObject:forKeyedSubscript:", v9, v8, v19);
    }
    -[SDSession setClientSession:](v9, "setClientSession:", v6, v19);
    RandomBytes();
    cccurve25519_make_pub();
    id v15 = +[NSData dataWithBytes:v22 length:32];
    [(SDSession *)v9 setDhSecretKey:v15];

    id v16 = objc_alloc_init((Class)NSMutableData);
    char v20 = 32;
    [v16 appendBytes:&v20 length:1];
    [v8 getUUIDBytes:v21];
    [v16 appendBytes:v21 length:16];
    [v16 appendBytes:v23 length:32];
    [v7 sendData:v16 completion:0];

    int v17 = 0;
  }
  else if (dword_100969808 <= 60 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    int v17 = -6705;
    LogPrintF();
  }
  else
  {
    int v17 = -6705;
  }

  return v17;
}

- (int)_setupSendData:(id)a3 sessionIdentifier:(id)a4 cnx:(id)a5 clientSession:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v36[0] = 0;
  v36[1] = 0;
  uint64_t v14 = [(NSMutableDictionary *)self->_setupSessions objectForKeyedSubscript:v11];
  if (v14
    || ([(NSMutableDictionary *)self->_setupSessions allValues],
        id v29 = objc_claimAutoreleasedReturnValue(),
        [v29 firstObject],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        v29,
        !v13)
    || v14)
  {
LABEL_2:
    if ([v14 sessionCreated])
    {
      id v15 = [v14 writeKey];
      id v16 = [v15 bytes];

      if (!v16)
      {
        int v31 = -6745;
        goto LABEL_25;
      }
      int v37 = 0;
      id v38 = [v14 writeNonce];
      [v14 setWriteNonce:((char *)[v14 writeNonce] + 1)];
      if ((unint64_t)[v10 length] < 0x11)
      {
        int v31 = -6743;
        goto LABEL_25;
      }
      id v17 = [v10 mutableCopy];
      id v18 = (char *)[v17 mutableBytes];
      [v17 length];
      if (*(_OWORD *)(v18 + 1) == 0)
      {
        [v14 identifier];
        id v35 = v10;
        id v19 = v11;
        id v20 = v12;
        v22 = id v21 = v13;
        [v22 getUUIDBytes:v18 + 1];

        id v13 = v21;
        id v12 = v20;
        id v11 = v19;
        id v10 = v35;
      }
      chacha20_poly1305_encrypt_all_96x32();
      [v17 appendBytes:v36 length:16];
      [v12 sendData:v17 completion:0];
    }
    else
    {
      int v23 = [v14 sendDataQueue];
      id v24 = [v23 count];

      if ((unint64_t)v24 > 0x7F)
      {
        int v31 = -6764;
        goto LABEL_25;
      }
      id v25 = [v14 sendDataQueue];

      if (!v25)
      {
        id v26 = objc_alloc_init((Class)NSMutableArray);
        [v14 setSendDataQueue:v26];
      }
      long long v27 = [v14 sendDataQueue];
      [v27 addObject:v10];

      if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
      {
        long long v28 = [v14 sendDataQueue];
        [v28 count];
        LogPrintF();
      }
    }
    int v31 = 0;
    goto LABEL_21;
  }
  id v30 = v13;
  if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    id v34 = v11;
    LogPrintF();
  }
  int v31 = -[SDNearbyAgent _setupSendCreateSession:cnx:](self, "_setupSendCreateSession:cnx:", v30, v12, v34);
  if (v31) {
    goto LABEL_24;
  }
  uint64_t v33 = [(NSMutableDictionary *)self->_setupSessions objectForKeyedSubscript:v11];
  if (v33)
  {
    uint64_t v14 = (void *)v33;

    goto LABEL_2;
  }
  if (dword_100969808 <= 60 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  int v31 = -6762;
LABEL_24:

  uint64_t v14 = 0;
LABEL_25:
  if (dword_100969808 <= 60 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_21:

  return v31;
}

- (void)startUnlockBLEConnectionWithDevice:(id)a3 encrypted:(BOOL)a4
{
  id v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022BF00;
  block[3] = &unk_1008CBB80;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_startUnlockBLEConnectionWithDevice:(id)a3 encrypted:(BOOL)a4
{
  BOOL v4 = a4;
  id v17 = a3;
  uint64_t v6 = [v17 identifier];
  if (v6)
  {
    id v7 = (void *)v6;
    uint64_t v8 = [(NSMutableDictionary *)self->_bleConnections objectForKeyedSubscript:v6];
    if (v8)
    {
      id v9 = (id)v8;
      if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [v9 addClient:self];
      [v9 setAcceptor:0];
    }
    else
    {
      if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v9 = [objc_alloc((Class)SFBLEConnection) initWithDevice:v17 acceptor:0];
      [v9 setBleEncrypted:v4];
      [v9 setDispatchQueue:self->_dispatchQueue];
      [v9 setLatencyCritical:1];
      [v9 setUseCase:131075];
      id v10 = [(SDNearbyAgent *)self idsBluetoothDeviceIDsForLEPipe];
      if ([v10 containsObject:v7]) {
        [v9 setLePipeCapable:1];
      }
      bleConnections = self->_bleConnections;
      if (!bleConnections)
      {
        id v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        id v13 = self->_bleConnections;
        self->_bleConnections = v12;

        bleConnections = self->_bleConnections;
      }
      [(NSMutableDictionary *)bleConnections setObject:v9 forKeyedSubscript:v7];
      [v9 addClient:self];
      [v9 activateDirect];
    }
  }
  else
  {
    uint64_t v14 = (SDNearbyAgent *)FatalErrorF();
    [(SDNearbyAgent *)v14 stopUnlockBLEConnectionWithDevice:v16];
  }
}

- (void)stopUnlockBLEConnectionWithDevice:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10022C1A4;
  v7[3] = &unk_1008CA640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_stopUnlockBLEConnectionWithDevice:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [v13 identifier];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(NSMutableDictionary *)self->_bleConnections objectForKeyedSubscript:v4];
    id v7 = v6;
    if (v6 && ([v6 removeClient:self] & 1) == 0)
    {
      if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(NSMutableDictionary *)self->_bleConnections removeObjectForKey:v5];
      [v7 invalidate];
    }
  }
  else
  {
    id v8 = (SDNearbyAgent *)FatalErrorF();
    [(SDNearbyAgent *)v8 sendUnlockData:v10 toBLEDevice:v11 completion:v12];
  }
}

- (void)sendUnlockData:(id)a3 toBLEDevice:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  _OWORD v15[2] = sub_10022C390;
  v15[3] = &unk_1008CBD88;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

- (void)sendUnlockDataDirect:(id)a3 toBLEDevice:(id)a4 completion:(id)a5
{
}

- (void)_sendUnlockData:(id)a3 toBLEDevice:(id)a4 direct:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void *))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v13 = [v11 identifier];
  if (v13)
  {
    id v14 = (void *)v13;
    if (self->_unlockBtPipe && [v11 useBTPipe])
    {
      if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
      {
        [v10 length];
        LogPrintF();
      }
      unlockBtPipe = self->_unlockBtPipe;
      if (v7) {
        [(SFBLEPipe *)unlockBtPipe sendFrameTypeDirect:3 payload:v10 completion:v12];
      }
      else {
        [(SFBLEPipe *)unlockBtPipe sendFrameType:3 payload:v10 completion:v12];
      }
    }
    else
    {
      SEL v15 = [(NSMutableDictionary *)self->_bleConnections objectForKeyedSubscript:v14];
      if (v15)
      {
        char v24 = 7;
        id v16 = +[NSMutableData dataWithBytes:&v24 length:1];
        [v16 appendData:v10];
        if (v7) {
          [v15 sendDataDirect:v16 completion:v12];
        }
        else {
          [v15 sendData:v16 completion:v12];
        }
      }
      else
      {
        id v17 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-6745 userInfo:0];
        v12[2](v12, v17);
      }
    }
  }
  else
  {
    id v19 = (SDNearbyAgent *)FatalErrorF();
    [(SDNearbyAgent *)v19 _unlockReceivedFrameData:v21 peer:v22 device:v23];
  }
}

- (void)_unlockReceivedFrameData:(id)a3 peer:(id)a4 device:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (dword_100969808 <= 30 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    [v8 length];
    LogPrintF();
  }
  services = self->_services;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  _OWORD v16[2] = sub_10022C75C;
  v16[3] = &unk_1008D1378;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  [(NSMutableDictionary *)services enumerateKeysAndObjectsUsingBlock:v16];
  id v14 = +[NSNotificationCenter defaultCenter];
  v19[0] = @"SDNearbyAgentNotificationInfoKeyBLEDevice";
  v19[1] = @"SDNearbyAgentNotificationInfoKeyBLEData";
  v20[0] = v10;
  v20[1] = v13;
  SEL v15 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  [v14 postNotificationName:@"SDNearbyAgentNotificationUnlockBLEDataReceived" object:self userInfo:v15];
}

- (void)_unlockApproveBluetoothIDsChanged:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022C874;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_unlockDeviceFilterChangedForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 deviceFilter];
  id v6 = +[SDAutoUnlockTransport sharedTransport];
  BOOL v7 = [v6 approveBluetoothIDs];
  [v4 setDeviceFilter:v7];

  id v8 = [v4 deviceFilter];

  if (!v8)
  {
    id v9 = objc_opt_new();
    [v4 setDeviceFilter:v9];
  }
  id v10 = [v4 deviceFilter];
  id v11 = [v4 deviceLostHandler];

  if (v11)
  {
    id v12 = +[NSMutableSet setWithSet:v5];
    [v12 minusSet:v10];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v34;
      do
      {
        id v17 = 0;
        do
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = [(NSMutableDictionary *)self->_ddNearbyInfoDevices objectForKeyedSubscript:*(void *)(*((void *)&v33 + 1) + 8 * (void)v17)];
          if (v18)
          {
            id v19 = [v4 deviceLostHandler];
            ((void (**)(void, void *))v19)[2](v19, v18);
          }
          id v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v15);
    }
  }
  SEL v20 = [v4 deviceFoundHandler];

  if (v20)
  {
    id v21 = +[NSMutableSet setWithSet:v10];
    [v21 minusSet:v5];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v22 = v21;
    id v23 = [v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v30;
      do
      {
        id v26 = 0;
        do
        {
          if (*(void *)v30 != v25) {
            objc_enumerationMutation(v22);
          }
          long long v27 = -[NSMutableDictionary objectForKeyedSubscript:](self->_ddNearbyInfoDevices, "objectForKeyedSubscript:", *(void *)(*((void *)&v29 + 1) + 8 * (void)v26), (void)v29);
          if (v27)
          {
            long long v28 = [v4 deviceFoundHandler];
            ((void (**)(void, void *))v28)[2](v28, v27);
          }
          id v26 = (char *)v26 + 1;
        }
        while (v24 != v26);
        id v24 = [v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v24);
    }
  }
}

- (void)unlockUpdateAdvertising:(unsigned int)a3 mask:(unsigned int)a4
{
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10022CD0C;
  v5[3] = &unk_1008CBF30;
  unsigned int v6 = a3;
  unsigned int v7 = a4;
  v5[4] = self;
  dispatch_async(dispatchQueue, v5);
}

- (void)unlockStartTestClientWithDevice:(id)a3
{
  id v4 = a3;
  if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    id v16 = v4;
    LogPrintF();
  }
  -[SDNearbyAgent startUnlockBLEConnectionWithDevice:encrypted:](self, "startUnlockBLEConnectionWithDevice:encrypted:", v4, 1, v16);
  unlockTestClientTimer = self->_unlockTestClientTimer;
  if (unlockTestClientTimer)
  {
    unsigned int v6 = unlockTestClientTimer;
    dispatch_source_cancel(v6);
    unsigned int v7 = self->_unlockTestClientTimer;
    self->_unlockTestClientTimer = 0;
  }
  id v8 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  id v9 = self->_unlockTestClientTimer;
  self->_unlockTestClientTimer = v8;

  id v10 = self->_unlockTestClientTimer;
  dispatch_time_t v11 = dispatch_time(0, 1000000000);
  dispatch_source_set_timer(v10, v11, 0x3B9ACA00uLL, 0xEE6B280uLL);
  id v12 = self->_unlockTestClientTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10022D084;
  handler[3] = &unk_1008CA640;
  handler[4] = self;
  id v13 = v4;
  id v20 = v13;
  dispatch_source_set_event_handler(v12, handler);
  id v14 = self->_unlockTestClientTimer;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  _OWORD v17[2] = sub_10022D19C;
  v17[3] = &unk_1008CA640;
  v17[4] = self;
  id v18 = v13;
  id v15 = v13;
  dispatch_source_set_cancel_handler(v14, v17);
  dispatch_resume((dispatch_object_t)self->_unlockTestClientTimer);
}

- (void)unlockStopTestClient
{
  if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  unlockTestClientTimer = self->_unlockTestClientTimer;
  if (unlockTestClientTimer)
  {
    id v5 = unlockTestClientTimer;
    dispatch_source_cancel(v5);
    id v4 = self->_unlockTestClientTimer;
    self->_unlockTestClientTimer = 0;
  }
}

- (void)unlockStartTestServer
{
  if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)unlockStopTestServer
{
  if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_systemWillSleep
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022D470;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_systemHasPoweredOn
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022D4F8;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)screenOn
{
  return [(SDStatusMonitor *)self->_statusMonitor screenOn];
}

- (BOOL)hasAdHocPairings
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  dispatch_semaphore_t v2 = self->_idIdentityArray;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "type", (void)v7) == 15)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (NSArray)adHocPairedDeviceIdentities
{
  id v3 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_idIdentityArray;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "type", (void)v11) == 15) {
          [v3 addObject:v9];
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)cutWiFiManagerLinkDidChange:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022D838;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)testPipePing
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022D8B4;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_testPipePing
{
  if (self->_unlockBtPipe)
  {
    id v4 = [objc_alloc((Class)NSMutableData) initWithLength:8];
    id v3 = (CFAbsoluteTime *)[v4 mutableBytes];
    *id v3 = CFAbsoluteTimeGetCurrent();
    [(SFBLEPipe *)self->_unlockBtPipe sendFrameType:1 payload:v4 completion:&stru_1008D13B8];
  }
  else if (dword_100969808 <= 50 && (dword_100969808 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (BOOL)autoUnlockActive
{
  return self->_autoUnlockActive;
}

- (int)audioRoutingScore
{
  return self->_audioRoutingScore;
}

- (NSData)bleAuthTag
{
  return self->_bleAuthTag;
}

- (BOOL)boostNearbyInfo
{
  return self->_boostNearbyInfo;
}

- (CUBluetoothClient)btConnectedDeviceMonitor
{
  return self->_btConnectedDeviceMonitor;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)enhancedDiscovery
{
  return self->_enhancedDiscovery;
}

- (unsigned)hotspotInfo
{
  return self->_hotspotInfo;
}

- (RPIdentity)idSelfIdentity
{
  return self->_idSelfIdentity;
}

- (BOOL)inDiscoverySession
{
  return self->_inDiscoverySession;
}

- (BOOL)preventNearbyActionAdvertising
{
  return self->_preventNearbyActionAdvertising;
}

- (void)setPreventNearbyActionAdvertising:(BOOL)a3
{
  self->_preventNearbyActionAdvertising = a3;
}

- (RPIdentity)temporarySelfIdentity
{
  return self->_temporarySelfIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporarySelfIdentity, 0);
  objc_storeStrong((id *)&self->_idSelfIdentity, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_btConnectedDeviceMonitor, 0);
  objc_storeStrong((id *)&self->_bleAuthTag, 0);
  objc_storeStrong((id *)&self->_digitalEngravingManager, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_idMaintenanceTimer, 0);
  objc_storeStrong((id *)&self->_idIdentityArray, 0);
  objc_storeStrong((id *)&self->_idDevices, 0);
  objc_storeStrong((id *)&self->_unlockTestClientTimer, 0);
  objc_storeStrong((id *)&self->_unlockBtPipe, 0);
  objc_storeStrong((id *)&self->_tempDonDeviceDiscovery, 0);
  objc_storeStrong((id *)&self->_tempDonDeviceScanTimer, 0);
  objc_storeStrong((id *)&self->_systemService, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_statusMonitor, 0);
  objc_storeStrong((id *)&self->_setupSessions, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_remoteAppServiceUUID, 0);
  objc_storeStrong((id *)&self->_periodicScanTimer, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_idsDeviceCountBTDictionary, 0);
  objc_storeStrong((id *)&self->_idsDeviceBTDictionary, 0);
  objc_storeStrong((id *)&self->_idsDeviceArray, 0);
  objc_storeStrong((id *)&self->_idsBTtoIDSInfoMap, 0);
  objc_storeStrong((id *)&self->_idsBluetoothDeviceIDsForMe, 0);
  objc_storeStrong((id *)&self->_idsBluetoothDeviceIDsForLEPipe, 0);
  objc_storeStrong((id *)&self->_idsBluetoothDevicesSet, 0);
  objc_storeStrong((id *)&self->_idsBluetoothDevicesArray, 0);
  objc_storeStrong((id *)&self->_enhancedDiscoveryUseCases, 0);
  objc_storeStrong((id *)&self->_enhancedDiscoveryTimer, 0);
  objc_storeStrong((id *)&self->_donStateRetryTimerDictionary, 0);
  objc_storeStrong((id *)&self->_donnedDevices, 0);
  objc_storeStrong((id *)&self->_deliveredDonnedIdentifiers, 0);
  objc_storeStrong((id *)&self->_ddRequests, 0);
  objc_storeStrong((id *)&self->_ddProximityPairingDevices, 0);
  objc_storeStrong((id *)&self->_ddNearbyInfoDevices, 0);
  objc_storeStrong((id *)&self->_ddNearbyActionDevices, 0);
  objc_storeStrong((id *)&self->_ddFastScanTimer, 0);
  objc_storeStrong((id *)&self->_contactHashesCached, 0);
  objc_storeStrong((id *)&self->_caRequestsNoScans, 0);
  objc_storeStrong((id *)&self->_caRequests, 0);
  objc_storeStrong((id *)&self->_cameraConfigChangeTimer, 0);
  objc_storeStrong((id *)&self->_cameraMagicMountManager, 0);
  objc_storeStrong((id *)&self->_btPipePeer, 0);
  objc_storeStrong((id *)&self->_brightnessSystemClient, 0);
  objc_storeStrong((id *)&self->_bleProximityPairingScanner, 0);
  objc_storeStrong((id *)&self->_bleProximityInfoOverride, 0);
  objc_storeStrong((id *)&self->_bleProximityInfo, 0);
  objc_storeStrong((id *)&self->_bleWPNearby, 0);
  objc_storeStrong((id *)&self->_bleNearbyInfoScanner, 0);
  objc_storeStrong((id *)&self->_bleNearbyInfoDevices, 0);
  objc_storeStrong((id *)&self->_bleNearbyInfoAdvertiseLingerTimer, 0);
  objc_storeStrong((id *)&self->_bleNearbyInfoAdvertiseReason, 0);
  objc_storeStrong((id *)&self->_bleNearbyInfoAdvertiser, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionScanner, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionDevices, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionAdvertiseLingerTimer, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionAdvertiser, 0);
  objc_storeStrong((id *)&self->_bleHotspotEncryptedData, 0);
  objc_storeStrong((id *)&self->_bleDiagnosticModeClients, 0);
  objc_storeStrong((id *)&self->_bleConnections, 0);
  objc_storeStrong((id *)&self->_bleAuthTagOverride, 0);
  objc_storeStrong((id *)&self->_bleAudioRoutingScoreEncryptedData, 0);
  objc_storeStrong((id *)&self->_bleAdvertisingAddress, 0);
  objc_storeStrong((id *)&self->_activityTimer, 0);

  objc_storeStrong((id *)&self->_activeWatchDiscovery, 0);
}

@end