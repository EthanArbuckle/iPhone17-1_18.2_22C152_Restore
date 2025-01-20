@interface CLDurianDevice
+ (BOOL)isDurianConnectionLatency:(int64_t)a3 lowerThan:(int64_t)a4;
+ (id)_convertTASPAdvertisementDeviceTypeToSPBeaconType:(unint64_t)a3;
+ (int)convertToMaxIntervalMsFromConnectionLatency:(int64_t)a3;
+ (int64_t)convertToLatencyFromConnectionInterval:(int)a3;
- (BOOL)abortingFirmwareUpdate;
- (BOOL)activePeripheralReady;
- (BOOL)allowFirmwareUpdate;
- (BOOL)cancelAnyPendingPlaySound;
- (BOOL)checkHawkeyeDataValidity:(id)a3;
- (BOOL)checkPoshDataValidity:(id)a3;
- (BOOL)connectionAllowed;
- (BOOL)firmwareUpdateInProgress;
- (BOOL)firmwareUpdateMode;
- (BOOL)firmwareUpdateReboot;
- (BOOL)isAckTask:(unsigned __int16)a3;
- (BOOL)isActiveTaskOpcode:(unsigned __int16)a3;
- (BOOL)isAggAdvCompleteTask:(unsigned __int16)a3;
- (BOOL)isAggresiveAdvertisingCompleteTask:(unsigned __int16)a3;
- (BOOL)isAirTag;
- (BOOL)isAttemptingConnection;
- (BOOL)isCancellablePlaySoundTask:(unsigned __int16)a3;
- (BOOL)isCapableOfAllHawkeyeServices;
- (BOOL)isCapableOfDynamicConnectionLatency;
- (BOOL)isCapableOfFirmwareUpdate;
- (BOOL)isClassicallyConnected;
- (BOOL)isConnected;
- (BOOL)isEndpointTask:(unsigned __int16)a3;
- (BOOL)isFindMyNetwork;
- (BOOL)isFirmwareVersionCrashTask:(unsigned __int16)a3;
- (BOOL)isFwdlAbortTask:(unsigned __int16)a3;
- (BOOL)isGroupStatusResponse:(unsigned __int16)a3;
- (BOOL)isHawkeyeAccessory;
- (BOOL)isHeleAccessory;
- (BOOL)isKeyRollTask:(unsigned __int16)a3;
- (BOOL)isLeashSlotInUse;
- (BOOL)isLeashable;
- (BOOL)isMultiConnectionEnabled;
- (BOOL)isMultiStatusResponse:(unsigned __int16)a3;
- (BOOL)isMutexTask:(unsigned __int16)a3;
- (BOOL)isNackTask:(unsigned __int16)a3;
- (BOOL)isNonOwnerSoundCompleteTask:(unsigned __int16)a3;
- (BOOL)isNonOwnerSoundTask:(unsigned __int16)a3;
- (BOOL)isNordicCrashTask:(unsigned __int16)a3;
- (BOOL)isOnlyRemainingTask;
- (BOOL)isPlayingSound;
- (BOOL)isPoshAccessory;
- (BOOL)isPoshOptionalOpcode:(unsigned __int16)a3;
- (BOOL)isProactiveAttempt;
- (BOOL)isR1CrashTask:(unsigned __int16)a3;
- (BOOL)isRanging;
- (BOOL)isRangingCompleteTask:(unsigned __int16)a3;
- (BOOL)isRangingSessionTask:(unsigned __int16)a3;
- (BOOL)isRangingStartTask:(unsigned __int16)a3;
- (BOOL)isRoseInitialized;
- (BOOL)isSetMaxConnectionsTask:(unsigned __int16)a3;
- (BOOL)isSoundCompleteTask:(unsigned __int16)a3;
- (BOOL)isTAAISDevice;
- (BOOL)isTaskQueueEmpty;
- (BOOL)isUserStatsV2Opcode:(unsigned __int16)a3;
- (BOOL)leashNeedsConfiguring;
- (BOOL)pendingDisconnect;
- (BOOL)preprocessTask:(id)a3;
- (BOOL)reconnecting;
- (BOOL)retrievingPersonalizationInformation;
- (BOOL)shouldActivateDevicePostConnection;
- (BOOL)shouldDiscoverHawkeyeServices;
- (BOOL)supportsFragmentationForOpcode:(unsigned __int16)a3;
- (CBCharacteristic)durianNonOwnerPreciseFindingCharacteristic;
- (CBCharacteristic)hawkeyeConfigurationCharacteristic;
- (CBCharacteristic)hawkeyeDebugCharacteristic;
- (CBCharacteristic)hawkeyeFirmwareUpdateCharacteristic;
- (CBCharacteristic)hawkeyeNonOwnerCharacteristic;
- (CBCharacteristic)hawkeyePairedOwnerInformationCharacteristic;
- (CBCharacteristic)hawkeyePreciseFindingCharacteristic;
- (CBCharacteristic)poshNonOwnerCharacteristic;
- (CBPeripheral)activePeripheral;
- (CLDurianConnectionAttempt)activeConnectionAttempt;
- (CLDurianConnectionAttempt)pendingConnectionAttempt;
- (CLDurianDevice)initWithUUID:(id)a3 queue:(id)a4 centralManager:(id)a5;
- (CLDurianDeviceDelegate)delegate;
- (CLDurianFirmwareUpdater)firmwareUpdater;
- (CLDurianTask)activeTask;
- (CLFindMyAccessoryConnectionMaterial)activePeripheralMaterial;
- (NSData)address;
- (NSData)addressFromUnknownBeacon;
- (NSData)lastReconciledAddress;
- (NSDate)lastAlertDate;
- (NSString)accessoryTypeName;
- (NSString)currentTaskName;
- (NSString)deviceTypeName;
- (NSUUID)groupUuid;
- (NSUUID)uuid;
- (SPCommandKeysCriteria)lastReconciledCriteria;
- (SPSimpleBeacon)beacon;
- (SPUnknownBeacon)unownedBeacon;
- (TAUnknownBeacon)taUnknownBeacon;
- (char)quarterHourDisconnect;
- (double)getLastCarScanTime;
- (double)intervalSinceLastSearchPartyKeyObservation;
- (double)lastGroupClassicDisconnectionDelta;
- (double)lastObservationTime;
- (double)secondsSinceLastDisconnection;
- (double)secondsSinceLastProactiveMaintenanceAttempt;
- (id)createConfigureRangingTaskWithMacAddress:(id)a3 countryCode:(unsigned __int8)a4 uwbChannel:(unsigned __int8)a5 acqPreamble:(unsigned __int8)a6 trackingPreamble:(unsigned __int8)a7 interval:(unsigned __int16)a8;
- (id)createDeinitRangingTask;
- (id)createDumpLogsTaskOfType:(unint64_t)a3;
- (id)createFetchAISAccessoryCapabilitiesTask;
- (id)createFetchAISAccessoryCategoryTask;
- (id)createFetchAISBatteryLevelTask;
- (id)createFetchAISBatteryTypeTask;
- (id)createFetchAISFindMyVersionTask;
- (id)createFetchAISFirmwareVersionTask;
- (id)createFetchAISManufacturerNameTask;
- (id)createFetchAISModelColorCodeTask;
- (id)createFetchAISModelNameTask;
- (id)createFetchAISNetworkIdTask;
- (id)createFetchAISProductDataTask;
- (id)createFetchAISProtocolImplementationTask;
- (id)createFetchAISSerialNumberTask;
- (id)createFetchAccelerometerModeTask;
- (id)createFetchAccelerometerOrientationModeTaskWithConfiguration;
- (id)createFetchAccelerometerSlopeModeTaskWithConfiguration;
- (id)createFetchBatteryStatusTask;
- (id)createFetchCurrentPrimaryKeyTask;
- (id)createFetchFirmwareVersionTaskWithCrashLogs:(BOOL)a3;
- (id)createFetchTxPowerTaskAsOwner:(BOOL)a3;
- (id)createFetchUserStatsTaskWithPersistence:(BOOL)a3;
- (id)createFetchiCloudIdentifierTask;
- (id)createGetGroupStatusTask;
- (id)createGetMultiStatusTask;
- (id)createInduceCrashTask;
- (id)createInitRangingTaskWithMacAddress:(id)a3;
- (id)createPlaySoundTaskWithSequence:(id)a3;
- (id)createPlayUnauthorizedSoundTaskWithSequence:(id)a3;
- (id)createRollWildKeyTask;
- (id)createSetAccelerometerOrientationModeTaskWithConfiguration:(id)a3;
- (id)createSetAccelerometerSlopeModeTaskWithConfiguration:(id)a3;
- (id)createSetBatteryStatusTaskWithStatus:(unint64_t)a3;
- (id)createSetHawkeyeUTMotionConfigTaskWithSeparatedUTTimeoutSeconds:(unsigned int)a3 separatedUTBackoffTimeoutSeconds:(unsigned int)a4;
- (id)createSetKeyRollTimeoutTaskWithInterval:(unsigned int)a3;
- (id)createSetMaxConnectionsTaskWithCount:(int)a3;
- (id)createSetNearOwnerTimeoutTaskInSeconds:(unsigned __int16)a3;
- (id)createSetObfuscatedIdentifierTaskWithIdentifier:(id)a3;
- (id)createSetPersistentConnectionTaskWithState:(BOOL)a3;
- (id)createSetTagTypeTaskWithType:(unsigned __int8)a3;
- (id)createSetTestModeTaskWithMode:(int)a3;
- (id)createSetUnauthorizedPlaySoundRateLimitTask:(BOOL)a3;
- (id)createSetWildModeTaskWithConfiguration:(id)a3;
- (id)createStartAggressiveAdvertisingTaskWithTimeout:(unsigned int)a3;
- (id)createStartRangingTaskWithTargetEventCounter:(unsigned __int16)a3;
- (id)createStartUnauthorizedAggressiveAdvertisingTask;
- (id)createStopAggressiveAdvertisingTask;
- (id)createStopPlayingSoundTask;
- (id)createStopPlayingUnauthorizedSoundTask;
- (id)createStopRangingTask;
- (id)createUnpairDeviceTask;
- (id)deviceStateToString:(int64_t)a3;
- (id)eventToString:(int64_t)a3;
- (id)firstPendingTask;
- (id)getBeaconType;
- (id)getConnectionReason;
- (id)getPendingTasks;
- (id)nextAlignedKeyRollDate;
- (id)prettyBeaconType;
- (id)startEventCounter;
- (id)stopEventCounter;
- (int)numPossiblePeripherals;
- (int64_t)btFindingState;
- (int64_t)commandedLatency;
- (int64_t)connectionPriority;
- (int64_t)currentLatency;
- (unint64_t)buildNumber;
- (unint64_t)connectionState;
- (unint64_t)getMultiStatusFromData:(char *)a3;
- (unint64_t)lastAdvertisementDelta;
- (unint64_t)lastDisconnectionTime;
- (unint64_t)lastGroupClassicDisconnectionTime;
- (unint64_t)lastGroupMaintenance;
- (unint64_t)lastProactiveMaintenanceTime;
- (unint64_t)lastReconciliationTime;
- (unint64_t)leashState;
- (unint64_t)maintenanceOnlyCondition;
- (unint64_t)mutexState;
- (unint64_t)ownership;
- (unsigned)aggressiveAdvertisingTimeout;
- (unsigned)getRangeEndReasonForOpcode:(unsigned __int16)a3 data:(char *)a4;
- (unsigned)getRangingStatusForOpcode:(unsigned __int16)a3 data:(char *)a4;
- (unsigned)groupPartNumber;
- (unsigned)hawkeyeTestMode;
- (unsigned)keyRollInterval;
- (unsigned)keysRemainingUntilWildRoll;
- (unsigned)lastMaxConnectionsSent;
- (unsigned)lastObservedIndex;
- (unsigned)nearOwnerTimeout;
- (unsigned)nearOwnerTimeoutOverride;
- (unsigned)numPendingTasks;
- (unsigned)numProactiveAttempts;
- (unsigned)numProactiveConnects;
- (unsigned)proactiveMaintenanceCount;
- (void)abortFirmwareUpdate:(id)a3;
- (void)acquireMutexForTask:(id)a3;
- (void)activate;
- (void)addHawkeyeTestModeTask;
- (void)alignClockWithCurrentIndex:(unsigned int)a3;
- (void)cancelConnectionTimeoutForPeripheral:(id)a3;
- (void)cancelTimeoutForTask:(id)a3 dictionary:(id)a4;
- (void)checkHelloMaintenanceTask:(id)a3;
- (void)checkPreHelloConditions;
- (void)checkPrepareRanging;
- (void)clearConnectionAttemptReasons;
- (void)clearLatencyTimeoutAndCancel:(BOOL)a3;
- (void)completeCurrentTask;
- (void)dealloc;
- (void)determineCandidateLatency:(int64_t *)a3 forceCandidateLatency:(BOOL *)a4;
- (void)didAbortFirmwareUpdate;
- (void)didCompleteFirmwareUpdate:(id)a3;
- (void)didGetPersonalizationInformation:(id)a3;
- (void)didReceiveData:(id)a3;
- (void)didReceiveHawkeyeData:(id)a3 withCharacteristic:(id)a4 error:(id)a5;
- (void)didReceivePoshData:(id)a3 withCharacteristic:(id)a4 error:(id)a5;
- (void)didUpdateConnectionInterval:(id)a3 latency:(id)a4 supervisionTimeout:(id)a5;
- (void)didUpdateMTUForDevice;
- (void)discoverHawkeyeService;
- (void)discoverPoshService;
- (void)enqueueTask:(id)a3;
- (void)enterFirmwareUpdateMode;
- (void)executeTask:(id)a3;
- (void)exitFirmwareUpdateMode;
- (void)failAllTasksWithError:(int64_t)a3;
- (void)failedToSendBytes:(id)a3;
- (void)getPersonalizationInformation;
- (void)handleDisconnectionDuringFirmwareUpdate;
- (void)handleDurianData:(id)a3 opcode:(unsigned __int16)a4 ackOpcode:(unsigned __int16)a5;
- (void)handleFailureToConnectWithError:(int64_t)a3;
- (void)handleGroupStatusReply:(id)a3;
- (void)handleInvalidData:(int64_t)a3;
- (void)handleKeyRollData:(id)a3;
- (void)handleMultiDownloading;
- (void)handleMultiStatusReply:(unint64_t)a3;
- (void)handleMutexAlreadyHeldOnTask:(id)a3;
- (void)handleMutexErrorOnAction:(unint64_t)a3;
- (void)informFirmwareUpdateFailureToClientWithError:(id)a3;
- (void)logTaskCounts:(id)a3;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)preemptFirmwareUpdate;
- (void)processAcknowledgedTask;
- (void)processCompletedTask;
- (void)processNextTask:(id)a3;
- (void)processUARPMessage:(id)a3;
- (void)releaseMutexWithReason:(id)a3;
- (void)removeAllPossiblePeripherals;
- (void)removePossiblePeripheral:(id)a3;
- (void)removePossiblePeripheral:(id)a3 withError:(int64_t)a4;
- (void)requestDisconnection:(id)a3;
- (void)requestDiscoveryScan;
- (void)resetHeleMaintMetrics;
- (void)resetLeashState;
- (void)scheduleActiveTaskTimeout:(int64_t)a3 forTask:(id)a4;
- (void)scheduleLatencyTimeout:(double)a3;
- (void)schedulePreemptedTaskTimeout:(int64_t)a3 forTask:(id)a4;
- (void)scheduleTimeout:(int64_t)a3 forTaskUuid:(id)a4 withBlock:(id)a5 dictionary:(id)a6;
- (void)sendConnectionMetric;
- (void)sendDisconnectionMetric;
- (void)sendHelloSequence;
- (void)setActiveConnectionAttempt:(id)a3;
- (void)setActivePeripheral:(id)a3;
- (void)setActivePeripheral:(id)a3 withError:(id)a4;
- (void)setActivePeripheralMaterial:(id)a3;
- (void)setActivePeripheralReady:(BOOL)a3;
- (void)setActiveTask:(id)a3;
- (void)setAggressiveAdvertisingTimeout:(unsigned int)a3;
- (void)setBeacon:(id)a3;
- (void)setConnectionReason:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDesiredConnectionLatency;
- (void)setDisconnectionReason:(id)a3;
- (void)setDurianNonOwnerPreciseFindingCharacteristic:(id)a3;
- (void)setFirmwareUpdater:(id)a3;
- (void)setHawkeyeConfigurationCharacteristic:(id)a3;
- (void)setHawkeyeDebugCharacteristic:(id)a3;
- (void)setHawkeyeFirmwareUpdateCharacteristic:(id)a3;
- (void)setHawkeyeNonOwnerCharacteristic:(id)a3;
- (void)setHawkeyePairedOwnerInformationCharacteristic:(id)a3;
- (void)setHawkeyePreciseFindingCharacteristic:(id)a3;
- (void)setHawkeyeTestMode:(unsigned __int8)a3;
- (void)setIsClassicallyConnected:(BOOL)a3;
- (void)setIsMultiConnectionEnabled:(BOOL)a3;
- (void)setIsPlayingSound:(BOOL)a3;
- (void)setIsProactiveAttempt:(BOOL)a3;
- (void)setIsRanging:(BOOL)a3;
- (void)setKeyRollInterval:(unsigned int)a3;
- (void)setLastAdvertisementDelta:(unint64_t)a3;
- (void)setLastAlertDate:(id)a3;
- (void)setLastDisconnectionTime:(unint64_t)a3;
- (void)setLastGroupClassicDisconnectionDelta:(double)a3;
- (void)setLastGroupClassicDisconnectionTime:(unint64_t)a3;
- (void)setLastGroupMaintenance:(unint64_t)a3;
- (void)setLastMaxConnectionsSent:(unsigned __int8)a3;
- (void)setLastObservationTime:(double)a3;
- (void)setLastObservedIndex:(unsigned int)a3;
- (void)setLastProactiveMaintenanceTime:(unint64_t)a3;
- (void)setLastReconciledAddress:(id)a3;
- (void)setLastReconciledCriteria:(id)a3;
- (void)setLastReconciliationTime:(unint64_t)a3;
- (void)setLeashState:(unint64_t)a3;
- (void)setMaintenanceOnlyCondition:(unint64_t)a3;
- (void)setMutexState:(unint64_t)a3;
- (void)setNearOwnerTimeout:(unsigned __int16)a3;
- (void)setNearOwnerTimeoutOverride:(unsigned int)a3;
- (void)setNumProactiveAttempts:(unsigned __int8)a3;
- (void)setNumProactiveConnects:(unsigned __int8)a3;
- (void)setPendingConnectionAttempt:(id)a3;
- (void)setPendingDisconnect:(BOOL)a3;
- (void)setPoshNonOwnerCharacteristic:(id)a3;
- (void)setProactiveMaintenanceCount:(unsigned int)a3;
- (void)setQuarterHourDisconnect:(char)a3;
- (void)setReconnecting:(BOOL)a3;
- (void)setTaUnknownBeacon:(id)a3;
- (void)setUnownedBeacon:(id)a3;
- (void)transitionToState:(int64_t)a3 event:(int64_t)a4 task:(id)a5;
- (void)updateFirmwareWithAssetURL:(id)a3;
@end

@implementation CLDurianDevice

- (CLDurianDevice)initWithUUID:(id)a3 queue:(id)a4 centralManager:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)CLDurianDevice;
  v8 = [(CLDurianDevice *)&v11 init];
  if (v8)
  {
    v8->_uuid = (NSUUID *)[a3 copy];
    v8->_queue = (OS_dispatch_queue *)a4;
    v8->_centralManager = (CBCentralManager *)a5;
    v8->_activePeripheralReady = 0;
    v8->_pendingTasks = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v8->_preemptedTasks = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v8->_activeTaskTimeouts = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v8->_preemptedTaskTimeouts = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v8->_activeTaskAcknowledged = 0;
    v8->_deviceState = 0;
    sub_10164083C();
    v8->_stateLastUpdated = v9;
    v8->_lastAlertDate = 0;
    v8->_lastObservationTime = 0.0;
    v8->_connectReason = 0;
    v8->_disconnectReason = 0;
    v8->_connectionTime = 0.0;
    v8->_lastDisconnectionTime = mach_continuous_time();
    v8->_lastProactiveMaintenanceTime = mach_continuous_time();
    v8->_isMultiConnectionEnabled = 0;
    v8->_mutexState = 0;
    v8->_connectionEventSpmiRequested = 0;
    *(_OWORD *)&v8->_currentLatencyStartTime = 0u;
    *(_OWORD *)&v8->_commandedLatencyTime = 0u;
    v8->_latencyCommandResponseArrived = 1;
    v8->_latencyTimeoutBlock = 0;
    v8->_uarpMessage = 0;
    v8->_keyRollInterval = 900;
    *(_WORD *)&v8->_isPlayingSound = 0;
    v8->_btFindingState = 0;
    v8->_pendingSoundTask = 0;
    *(_WORD *)&v8->_isClassicallyConnected = 0;
    v8->_lastGroupClassicDisconnectionTime = 0;
    v8->_taUnknownBeacon = 0;
  }
  return v8;
}

- (void)dealloc
{
  id latencyTimeoutBlock = self->_latencyTimeoutBlock;
  if (latencyTimeoutBlock) {
    _Block_release(latencyTimeoutBlock);
  }
  v4.receiver = self;
  v4.super_class = (Class)CLDurianDevice;
  [(CLDurianDevice *)&v4 dealloc];
}

+ (BOOL)isDurianConnectionLatency:(int64_t)a3 lowerThan:(int64_t)a4
{
  BOOL v5 = a4 == -6 || a3 < a4;
  if (a3 == a4) {
    BOOL v5 = 0;
  }
  return a3 != -6 && v5;
}

- (int64_t)connectionPriority
{
  if (self->_activePeripheral) {
    int64_t v3 = 0;
  }
  else {
    int64_t v3 = -1;
  }
  if ([(NSMutableArray *)self->_pendingTasks count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    pendingTasks = self->_pendingTasks;
    id v5 = [(NSMutableArray *)pendingTasks countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      int64_t v3 = 1;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(pendingTasks);
          }
          if ([*(id *)(*((void *)&v11 + 1) + 8 * i) userTask])
          {
            int64_t v3 = 3;
            goto LABEL_16;
          }
        }
        id v6 = [(NSMutableArray *)pendingTasks countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    else
    {
      int64_t v3 = 1;
    }
  }
LABEL_16:
  if (v3 >= 2 || !self->_firmwareUpdateMode) {
    return v3;
  }
  else {
    return 2;
  }
}

- (unint64_t)connectionState
{
  if (![(CLDurianDevice *)self isConnected]) {
    return [(CLDurianDevice *)self isAttemptingConnection];
  }
  if ([(CLDurianDevice *)self isLeashSlotInUse]) {
    return 4;
  }
  return 2;
}

- (NSString)currentTaskName
{
  id v2 = [(NSMutableArray *)self->_pendingTasks objectAtIndex:0];

  return (NSString *)[v2 opcodeDescription];
}

- (BOOL)connectionAllowed
{
  beacon = self->_beacon;
  if (beacon) {
    return [(SPSimpleBeacon *)beacon connectionAllowed];
  }
  else {
    return 1;
  }
}

- (NSUUID)groupUuid
{
  return (NSUUID *)[(SPSimpleBeacon *)self->_beacon groupIdentifier];
}

- (unsigned)groupPartNumber
{
  return [(SPSimpleBeacon *)self->_beacon partIdentifier];
}

- (unint64_t)buildNumber
{
  id v2 = [(SPSimpleBeacon *)self->_beacon systemVersion];

  return +[CLDurianVersionNumberUtilities getNumberFromString:v2];
}

- (BOOL)isRangingSessionTask:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  if ([(CLDurianDevice *)self isHawkeyeAccessory]) {
    return v3 == 1804 || v3 - 1801 < 2;
  }
  BOOL result = 1;
  if ((v3 > 0x25 || ((1 << v3) & 0x3400100000) == 0) && (v3 - 2057 > 3 || v3 == 2059)) {
    return 0;
  }
  return result;
}

- (BOOL)isSoundCompleteTask:(unsigned __int16)a3
{
  int v3 = a3;
  if ([(CLDurianDevice *)self isHawkeyeAccessory]) {
    int v4 = 525;
  }
  else {
    int v4 = 9;
  }
  return v4 == v3;
}

- (BOOL)isCancellablePlaySoundTask:(unsigned __int16)a3
{
  return a3 == 40;
}

- (BOOL)isAggAdvCompleteTask:(unsigned __int16)a3
{
  int v3 = a3;
  BOOL result = [(CLDurianDevice *)self isHawkeyeAccessory];
  if (v3 != 532) {
    return 0;
  }
  return result;
}

- (BOOL)isNonOwnerSoundCompleteTask:(unsigned __int16)a3
{
  int v3 = a3;
  if ([(CLDurianDevice *)self isPoshAccessory]
    || [(CLDurianDevice *)self isHawkeyeAccessory])
  {
    return v3 == 771;
  }
  BOOL result = [(CLDurianDevice *)self isAirTag];
  if (v3 != 2062) {
    return 0;
  }
  return result;
}

- (BOOL)isNonOwnerSoundTask:(unsigned __int16)a3
{
  BOOL result = 1;
  if ((int)a3 <= 793)
  {
    if (a3 == 175 || a3 == 768) {
      return result;
    }
    return 0;
  }
  if (a3 != 794 && a3 != 2061) {
    return 0;
  }
  return result;
}

- (BOOL)isAggresiveAdvertisingCompleteTask:(unsigned __int16)a3
{
  int v3 = a3;
  BOOL result = [(CLDurianDevice *)self isHawkeyeAccessory];
  if (v3 != 532) {
    return 0;
  }
  return result;
}

- (BOOL)isFirmwareVersionCrashTask:(unsigned __int16)a3
{
  return (a3 & 0xFFFE) == 16;
}

- (BOOL)isActiveTaskOpcode:(unsigned __int16)a3
{
  int v3 = a3;
  unsigned int v5 = [(CLDurianDevice *)self isHawkeyeAccessory];
  id v6 = [(CLDurianDevice *)self activeTask];
  if (!v5)
  {
    unsigned int v10 = [(CLDurianCommand *)[(CLDurianTask *)v6 command] opcode];
    return v10 == v3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [(CLDurianDevice *)self activeTask];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      v12[0] = 68289795;
      v12[1] = 0;
      __int16 v13 = 2082;
      long long v14 = "";
      __int16 v15 = 2113;
      id v16 = v9;
      __int16 v17 = 1026;
      unsigned int v18 = [(CLDurianTask *)v7 hawkeyeOpcode];
      __int16 v19 = 1026;
      int v20 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye isActiveTaskOpcode\", \"item\":%{private, location:escape_only}@, \"active\":%{public}d, \"param\":%{public}d}", (uint8_t *)v12, 0x28u);
    }
    unsigned int v10 = [(CLDurianTask *)v7 hawkeyeOpcode];
    return v10 == v3;
  }
  return 0;
}

- (BOOL)isAckTask:(unsigned __int16)a3
{
  int v3 = a3;
  if ([(CLDurianDevice *)self isAirTag])
  {
    [(CLDurianDevice *)self activeTask];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return v3 == 2048;
    }
  }
  if (![(CLDurianDevice *)self isHawkeyeAccessory])
  {
    if ([(CLDurianDevice *)self isPoshAccessory]
      && ([(CLDurianDevice *)self activeTask], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      return v3 == 770;
    }
    else
    {
      return v3 == 0;
    }
  }
  BOOL result = 1;
  if (v3 > 1282)
  {
    if (v3 != 1283 && v3 != 1792) {
      return 0;
    }
  }
  else if (v3 != 523 && v3 != 770)
  {
    return 0;
  }
  return result;
}

- (BOOL)isNackTask:(unsigned __int16)a3
{
  int v3 = a3;
  int v5 = 767;
  if (![(CLDurianDevice *)self isHawkeyeAccessory])
  {
    if ([(CLDurianDevice *)self isPoshAccessory]) {
      int v5 = 767;
    }
    else {
      int v5 = 255;
    }
  }
  return v5 == v3;
}

- (BOOL)isMultiStatusResponse:(unsigned __int16)a3
{
  int v3 = a3;
  if ([(CLDurianDevice *)self isHawkeyeAccessory]) {
    int v4 = 524;
  }
  else {
    int v4 = 12;
  }
  return v4 == v3;
}

- (BOOL)isSetMaxConnectionsTask:(unsigned __int16)a3
{
  int v3 = a3;
  if ([(CLDurianDevice *)self isHawkeyeAccessory]) {
    int v4 = 519;
  }
  else {
    int v4 = 11;
  }
  return v4 == v3;
}

- (BOOL)isMutexTask:(unsigned __int16)a3
{
  return a3 == 14;
}

- (BOOL)isKeyRollTask:(unsigned __int16)a3
{
  int v3 = a3;
  if ([(CLDurianDevice *)self isHawkeyeAccessory]) {
    int v4 = 522;
  }
  else {
    int v4 = 41;
  }
  return v4 == v3;
}

- (BOOL)isGroupStatusResponse:(unsigned __int16)a3
{
  int v3 = a3;
  BOOL result = [(CLDurianDevice *)self isHawkeyeAccessory];
  if (v3 != 552) {
    return 0;
  }
  return result;
}

- (BOOL)isRangingStartTask:(unsigned __int16)a3
{
  int v3 = a3;
  unsigned int v4 = [(CLDurianDevice *)self isHawkeyeAccessory];
  BOOL v6 = v3 == 1795 || v3 == 3;
  if (v4) {
    return v6;
  }
  else {
    return (v3 & 0xFFFFF7FF) == 3;
  }
}

- (BOOL)isRangingCompleteTask:(unsigned __int16)a3
{
  int v3 = a3;
  if ([(CLDurianDevice *)self isHawkeyeAccessory]) {
    int v4 = 1800;
  }
  else {
    int v4 = 2056;
  }
  return v4 == v3 || v3 == 4;
}

- (BOOL)isFwdlAbortTask:(unsigned __int16)a3
{
  return a3 == 32;
}

- (BOOL)isNordicCrashTask:(unsigned __int16)a3
{
  return a3 == 16;
}

- (BOOL)isR1CrashTask:(unsigned __int16)a3
{
  return a3 == 17;
}

- (BOOL)isUserStatsV2Opcode:(unsigned __int16)a3
{
  return a3 == 23;
}

- (BOOL)isEndpointTask:(unsigned __int16)a3
{
  int v3 = a3;
  if ([(CLDurianDevice *)self isPoshAccessory])
  {
    [(CLDurianDevice *)self activeTask];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v5 = [(CLDurianCommand *)[(CLDurianTask *)[(CLDurianDevice *)self activeTask] command] opcode];
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      BOOL v6 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        int v23 = 68289795;
        int v24 = 0;
        __int16 v25 = 2082;
        v26 = "";
        __int16 v27 = 2113;
        id v28 = v7;
        __int16 v29 = 1026;
        unsigned int v30 = v5;
        __int16 v31 = 1026;
        int v32 = v3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut endpoint check\", \"item\":%{private, location:escape_only}@, \"active\":%{public}d, \"param\":%{public}d}", (uint8_t *)&v23, 0x28u);
      }
      if (v3 == 771
        || v3 == 1029 && v5 == 1028
        || v3 == 2051 && v5 == 3
        || v3 == 2052 && v5 == 4
        || v3 == 2053 && v5 == 5
        || v3 == 2054 && v5 == 6
        || v3 == 2055 && v5 == 7
        || v3 == 2056 && v5 == 8
        || v3 == 2057 && v5 == 9
        || v3 == 2058 && v5 == 10
        || v3 == 2059 && v5 == 11
        || v3 == 2060 && v5 == 12)
      {
        return 1;
      }
    }
  }
  if ([(CLDurianDevice *)self isAirTag])
  {
    [(CLDurianDevice *)self activeTask];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v8 = [(CLDurianCommand *)[(CLDurianTask *)[(CLDurianDevice *)self activeTask] command] opcode];
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      id v9 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        int v23 = 68289795;
        int v24 = 0;
        __int16 v25 = 2082;
        v26 = "";
        __int16 v27 = 2113;
        id v28 = v10;
        __int16 v29 = 1026;
        unsigned int v30 = v8;
        __int16 v31 = 1026;
        int v32 = v3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut endpoint check\", \"item\":%{private, location:escape_only}@, \"active\":%{public}d, \"param\":%{public}d}", (uint8_t *)&v23, 0x28u);
      }
      if (v3 == 2054 && v8 == 2049 || v3 == 2055 && v8 == 2050 || v3 == 2056 && v8 - 2051 < 2) {
        return 1;
      }
      BOOL v12 = v3 != 2059 || v8 != 2053;
      BOOL result = 1;
      if (v3 == 2062 || !v12) {
        return result;
      }
    }
  }
  unsigned int v14 = [(CLDurianDevice *)self isHawkeyeAccessory];
  __int16 v15 = [(CLDurianDevice *)self activeTask];
  if (!v14)
  {
    unsigned int v22 = [(CLDurianCommand *)[(CLDurianTask *)v15 command] opcode];
    if (((v3 - 23) > 2 || v22 != 181) && (v3 != 4 || v22 != 3)) {
      return v3 == 2056 && v22 == 2051;
    }
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  unsigned int v16 = [(CLDurianTask *)[(CLDurianDevice *)self activeTask] hawkeyeOpcode];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  __int16 v17 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    int v23 = 68289795;
    int v24 = 0;
    __int16 v25 = 2082;
    v26 = "";
    __int16 v27 = 2113;
    id v28 = v18;
    __int16 v29 = 1026;
    unsigned int v30 = v16;
    __int16 v31 = 1026;
    int v32 = v3;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye endpoint check\", \"item\":%{private, location:escape_only}@, \"active\":%{public}d, \"param\":%{public}d}", (uint8_t *)&v23, 0x28u);
  }
  if (v3 == 524 && v16 == 521 || v3 == 526 && v16 == 518) {
    return 1;
  }
  BOOL result = 1;
  if (v3 != 525
    && v3 != 532
    && v3 != 1282
    && (v3 != 530 || v16 != 529)
    && (v3 != 546 || v16 != 537)
    && (v3 != 547 || v16 != 538)
    && (v3 != 550 || v16 != 541))
  {
    BOOL v19 = v3 == 552 && v16 == 551;
    BOOL v20 = v19;
    if (v3 != 771
      && !v20
      && (v3 != 784 || v16 != 773)
      && (v3 != 785 || v16 != 774)
      && (v3 != 786 || v16 != 775)
      && (v3 != 787 || v16 != 776)
      && (v3 != 788 || v16 != 777)
      && (v3 != 790 || v16 != 779)
      && (v3 != 791 || v16 != 780)
      && (v3 != 792 || v16 != 781)
      && (v3 != 793 || v16 != 782)
      && ((v3 - 1026) > 3 || v3 == 1028)
      && (v3 != 1798 || v16 != 1793)
      && (v3 != 1799 || v16 != 1794)
      && (v3 != 1800 || v16 - 1795 >= 2))
    {
      return v3 == 1803 && v16 == 1797;
    }
  }
  return result;
}

- (BOOL)cancelAnyPendingPlaySound
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  pendingTasks = self->_pendingTasks;
  id v4 = [(NSMutableArray *)pendingTasks countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  BOOL v6 = 0;
  uint64_t v7 = *(void *)v12;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(pendingTasks);
      }
      id v9 = *(CLDurianTask **)(*((void *)&v11 + 1) + 8 * i);
      if (v9 != self->_activeTask
        && -[CLDurianDevice isCancellablePlaySoundTask:](self, "isCancellablePlaySoundTask:", [*(id *)(*((void *)&v11 + 1) + 8 * i) translatedOpcode]))
      {
        [(CLDurianTask *)v9 cancel];
        BOOL v6 = 1;
      }
    }
    id v5 = [(NSMutableArray *)pendingTasks countByEnumeratingWithState:&v11 objects:v15 count:16];
  }
  while (v5);
  return v6;
}

- (void)logTaskCounts:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  id v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    unsigned int v7 = [(NSMutableArray *)self->_pendingTasks count];
    unsigned int v8 = [(NSMutableArray *)self->_preemptedTasks count];
    unsigned int v9 = [(CLDurianTask *)self->_activeTask translatedOpcode];
    v10[0] = 68290307;
    v10[1] = 0;
    __int16 v11 = 2082;
    long long v12 = "";
    __int16 v13 = 2113;
    id v14 = v6;
    __int16 v15 = 2113;
    id v16 = a3;
    __int16 v17 = 1025;
    unsigned int v18 = v7;
    __int16 v19 = 1025;
    unsigned int v20 = v8;
    __int16 v21 = 1026;
    unsigned int v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian task counts\", \"item\":%{private, location:escape_only}@, \"action\":%{private, location:escape_only}@, \"pending\":%{private}d, \"preempted\":%{private}d, \"active\":%{public}d}", (uint8_t *)v10, 0x38u);
  }
}

- (void)handleKeyRollData:(id)a3
{
  if ([(CLDurianDevice *)self isAirTag]) {
    self->_uint64_t lastObservedIndex = *(_DWORD *)((char *)[a3 bytes] + 2);
  }
  if ([(CLDurianDevice *)self isHawkeyeAccessory]) {
    self->_uint64_t lastObservedIndex = *(_DWORD *)((char *)[a3 bytes] + 3);
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  id v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    uint64_t lastObservedIndex = self->_lastObservedIndex;
    v8[0] = 68289795;
    v8[1] = 0;
    __int16 v9 = 2082;
    id v10 = "";
    __int16 v11 = 2113;
    id v12 = v6;
    __int16 v13 = 2113;
    id v14 = a3;
    __int16 v15 = 2050;
    uint64_t v16 = lastObservedIndex;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian received key roll notification\", \"item\":%{private, location:escape_only}@, \"data\":%{private, location:escape_only}@, \"index\":%{public}ld}", (uint8_t *)v8, 0x30u);
  }
  [(CLDurianDeviceDelegate *)[(CLDurianDevice *)self delegate] device:self didReceiveKeyRollIndex:self->_lastObservedIndex];
}

- (unsigned)numPendingTasks
{
  return [(NSMutableArray *)self->_pendingTasks count];
}

- (BOOL)isOnlyRemainingTask
{
  return [(NSMutableArray *)self->_pendingTasks count] == (id)1
      && [(NSMutableArray *)self->_preemptedTasks count] == 0;
}

- (void)failAllTasksWithError:(int64_t)a3
{
  id v4 = &qword_102419000;
  id v5 = &qword_102419000;
  if (self->_firmwareUpdateReboot)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v6 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      uint64_t buf = 68289283;
      __int16 v55 = 2082;
      v56 = "";
      __int16 v57 = 2113;
      id v58 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian Rebooting after firmware update, wait before failing tasks\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    __int16 v9 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      id v11 = [(CLDurianTask *)self->_activeTask opcodeDescription];
      unsigned int v12 = [(NSMutableArray *)self->_pendingTasks count];
      unsigned int v13 = [(NSMutableArray *)self->_preemptedTasks count];
      uint64_t buf = 68290307;
      __int16 v55 = 2082;
      v56 = "";
      __int16 v57 = 2113;
      id v58 = v10;
      __int16 v59 = 1026;
      int v60 = a3;
      __int16 v61 = 2113;
      id v62 = v11;
      id v5 = &qword_102419000;
      __int16 v63 = 1026;
      *(_DWORD *)v64 = v12;
      id v4 = &qword_102419000;
      *(_WORD *)&v64[4] = 1026;
      *(_DWORD *)&v64[6] = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian failing all tasks\", \"item\":%{private, location:escape_only}@, \"error\":%{public}d, \"active\":%{private, location:escape_only}@, \"pending\":%{public}d, \"preempted\":%{public}d}", (uint8_t *)&buf, 0x38u);
    }
    activeTask = self->_activeTask;
    if (activeTask)
    {
      [(CLDurianDevice *)self cancelTimeoutForTask:activeTask dictionary:self->_activeTaskTimeouts];
      [(CLDurianDevice *)self setActiveTask:0];
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    obj = self->_pendingTasks;
    id v15 = [(NSMutableArray *)obj countByEnumeratingWithState:&v46 objects:v53 count:16];
    if (v15)
    {
      id v17 = v15;
      uint64_t v18 = *(void *)v47;
      *(void *)&long long v16 = 68290051;
      long long v38 = v16;
      do
      {
        __int16 v19 = 0;
        do
        {
          if (*(void *)v47 != v18) {
            objc_enumerationMutation(obj);
          }
          unsigned int v20 = *(void **)(*((void *)&v46 + 1) + 8 * (void)v19);
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102332198);
          }
          __int16 v21 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id v22 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
            unsigned int v23 = [objc_msgSend(v20, "command") opcode];
            id v24 = [(CBPeripheral *)self->_activePeripheral identifier];
            uint64_t buf = v38;
            __int16 v55 = 2082;
            v56 = "";
            __int16 v57 = 2113;
            id v58 = v22;
            id v5 = &qword_102419000;
            __int16 v59 = 1026;
            int v60 = v23;
            id v4 = &qword_102419000;
            __int16 v61 = 2114;
            id v62 = v24;
            __int16 v63 = 2113;
            *(void *)v64 = v20;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian failing task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"peripheralUUID\":%{public, location:escape_only}@, \"task\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x36u);
          }
          if (objc_msgSend(objc_msgSend(v20, "command", v38), "opcode") == 14) {
            [(CLDurianDevice *)self setMutexState:0];
          }
          [(CLDurianDeviceDelegate *)[(CLDurianDevice *)self delegate] device:self didFailToCompleteTask:v20 withError:a3 andDisconnect:1];
          if (objc_msgSend(objc_msgSend(v20, "command"), "opcode") == 527) {
            self->_btFindingState = 0;
          }
          __int16 v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        id v17 = [(NSMutableArray *)obj countByEnumeratingWithState:&v46 objects:v53 count:16];
      }
      while (v17);
    }
    unint64_t v25 = a3;
    [(NSMutableArray *)self->_pendingTasks removeAllObjects];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    obja = self->_preemptedTasks;
    id v26 = [(NSMutableArray *)obja countByEnumeratingWithState:&v42 objects:v52 count:16];
    if (v26)
    {
      id v28 = v26;
      uint64_t v29 = *(void *)v43;
      *(void *)&long long v27 = 68290051;
      long long v39 = v27;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v43 != v29) {
            objc_enumerationMutation(obja);
          }
          __int16 v31 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if (v4[114] != -1) {
            dispatch_once(&qword_102419390, &stru_102332198);
          }
          int v32 = v5[115];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            id v33 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
            unsigned int v34 = [objc_msgSend(v31, "command") opcode];
            id v35 = [[objc_msgSend(-[CBPeripheral identifier](self->_activePeripheral, "identifier"), "description") substringToIndex:8];
            uint64_t buf = v39;
            __int16 v55 = 2082;
            v56 = "";
            __int16 v57 = 2113;
            id v58 = v33;
            id v5 = &qword_102419000;
            __int16 v59 = 1026;
            int v60 = v34;
            id v4 = &qword_102419000;
            __int16 v61 = 2113;
            id v62 = v35;
            __int16 v63 = 2113;
            *(void *)v64 = v31;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian failing preempted task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"periph\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x36u);
          }
          [(CLDurianDeviceDelegate *)[(CLDurianDevice *)self delegate] device:self didFailToCompleteTask:v31 withError:v25 andDisconnect:1];
          [(CLDurianDevice *)self cancelTimeoutForTask:v31 dictionary:self->_preemptedTaskTimeouts];
        }
        id v28 = [(NSMutableArray *)obja countByEnumeratingWithState:&v42 objects:v52 count:16];
      }
      while (v28);
    }
    [(NSMutableArray *)self->_preemptedTasks removeAllObjects];
    if (self->_preparingForRanging)
    {
      id v36 = objc_alloc((Class)NSError);
      uint64_t v37 = kCLErrorDomainPrivate;
      NSErrorUserInfoKey v50 = NSLocalizedDescriptionKey;
      CFStringRef v51 = sub_101640864(v25);
      -[[-[CLDurianDevice delegate](self, "delegate") device:didPrepareForRangingWithError:](self, "device:didPrepareForRangingWithError:", self, [[v36 initWithDomain:code:userInfo:](v37, v25, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1))]);
    }
    [(CLDurianDevice *)self logTaskCounts:@"failall"];
    *(_WORD *)&self->_isPlayingSound = 0;
    self->_preparingForRanging = 0;
    self->_pendingSoundTask = 0;
  }
}

- (void)requestDiscoveryScan
{
  [(CLDurianDevice *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int v3 = [(CLDurianDevice *)self delegate];
    [(CLDurianDeviceDelegate *)v3 requestDiscoveryScan];
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v4 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_FAULT))
    {
      id v5 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      int v8 = 68289283;
      int v9 = 0;
      __int16 v10 = 2082;
      id v11 = "";
      __int16 v12 = 2113;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian no delegate or method for scan requests\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v8, 0x1Cu);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
    }
    id v6 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      id v7 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      int v8 = 68289283;
      int v9 = 0;
      __int16 v10 = 2082;
      id v11 = "";
      __int16 v12 = 2113;
      id v13 = v7;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian no delegate or method for scan requests", "{\"msg%{public}.0s\":\"#durian no delegate or method for scan requests\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (double)getLastCarScanTime
{
  id v2 = [(CLDurianDevice *)self delegate];

  [(CLDurianDeviceDelegate *)v2 getLastCarScanTime];
  return result;
}

- (void)acquireMutexForTask:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  id v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    unint64_t mutexState = self->_mutexState;
    v8[0] = 68289539;
    v8[1] = 0;
    __int16 v9 = 2082;
    __int16 v10 = "";
    __int16 v11 = 2113;
    id v12 = v6;
    __int16 v13 = 1026;
    int v14 = mutexState;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #mutex acquire\", \"item\":%{private, location:escape_only}@, \"prior state\":%{public}d}", (uint8_t *)v8, 0x22u);
  }
  if ((self->_mutexState | 2) == 2)
  {
    -[CLDurianDevice enqueueTask:](self, "enqueueTask:", +[CLDurianTask setMutexAction:withLatency:](CLDurianTask, "setMutexAction:withLatency:", 1, [a3 desiredLatency]));
    [(CLDurianDevice *)self setMutexState:1];
  }
}

- (void)releaseMutexWithReason:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  id v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    unint64_t mutexState = self->_mutexState;
    v8[0] = 68289795;
    v8[1] = 0;
    __int16 v9 = 2082;
    __int16 v10 = "";
    __int16 v11 = 2113;
    id v12 = v6;
    __int16 v13 = 2113;
    id v14 = a3;
    __int16 v15 = 1026;
    int v16 = mutexState;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #mutex release\", \"item\":%{private, location:escape_only}@, \"reason\":%{private, location:escape_only}@, \"prior state\":%{public}d}", (uint8_t *)v8, 0x2Cu);
  }
  if ((self->_mutexState | 2) == 3)
  {
    [(CLDurianDevice *)self enqueueTask:+[CLDurianTask setMutexAction:0]];
    [(CLDurianDevice *)self setMutexState:2];
  }
}

- (void)handleMutexErrorOnAction:(unint64_t)a3
{
  id v5 = &qword_102419000;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  id v6 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    unsigned int v8 = [(NSMutableArray *)self->_pendingTasks count];
    *(_DWORD *)uint64_t buf = 68289795;
    int v28 = 0;
    __int16 v29 = 2082;
    unsigned int v30 = "";
    __int16 v31 = 2113;
    id v32 = v7;
    __int16 v33 = 1026;
    unsigned int v34 = v8;
    __int16 v35 = 1026;
    LODWORD(v36) = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #mutex error\", \"item\":%{private, location:escape_only}@, \"tasks\":%{public}d, \"action\":%{public}d}", buf, 0x28u);
  }
  if (a3 == 1)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    pendingTasks = self->_pendingTasks;
    id v10 = [(NSMutableArray *)pendingTasks countByEnumeratingWithState:&v23 objects:v37 count:16];
    if (v10)
    {
      id v12 = v10;
      uint64_t v13 = *(void *)v24;
      *(void *)&long long v11 = 68289795;
      long long v22 = v11;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(pendingTasks);
          }
          __int16 v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          unsigned int v16 = [v15 command:v22].opcode;
          if ([v15 isMutexProtectedSoundTask])
          {
            uint64_t v17 = 13;
          }
          else if ([v15 isMutexProtectedRangingTask])
          {
            uint64_t v17 = 12;
          }
          else if (v16 == 19)
          {
            uint64_t v17 = 14;
          }
          else
          {
            if (![v15 requiresMutex]) {
              continue;
            }
            uint64_t v17 = 16;
          }
          [(CLDurianDeviceDelegate *)[(CLDurianDevice *)self delegate] device:self didFailToCompleteTask:v15 withError:v17 andDisconnect:0];
          [v15 cancel];
          if (v5[114] != -1) {
            dispatch_once(&qword_102419390, &stru_102332198);
          }
          uint64_t v18 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v19 = v5;
            id v20 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
            unsigned int v21 = [v15 command].opcode;
            *(_DWORD *)uint64_t buf = v22;
            int v28 = 0;
            __int16 v29 = 2082;
            unsigned int v30 = "";
            __int16 v31 = 2113;
            id v32 = v20;
            id v5 = v19;
            __int16 v33 = 1026;
            unsigned int v34 = v21;
            __int16 v35 = 2113;
            id v36 = v15;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #mutex cancelling task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"task\":%{private, location:escape_only}@}", buf, 0x2Cu);
          }
        }
        id v12 = [(NSMutableArray *)pendingTasks countByEnumeratingWithState:&v23 objects:v37 count:16];
      }
      while (v12);
    }
  }
}

- (void)handleMutexAlreadyHeldOnTask:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  id v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    unint64_t mutexState = self->_mutexState;
    int v15 = 68289795;
    int v16 = 0;
    __int16 v17 = 2082;
    uint64_t v18 = "";
    __int16 v19 = 2113;
    id v20 = v6;
    __int16 v21 = 1025;
    int v22 = mutexState;
    __int16 v23 = 1026;
    unsigned int v24 = [objc_msgSend(a3, "command") opcode];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #mutex locked by another\", \"item\":%{private, location:escape_only}@, \"mutexState\":%{private}d, \"opcode\":%{public}d}", (uint8_t *)&v15, 0x28u);
  }
  if ([a3 isMutexProtectedSoundTask])
  {
    unsigned int v8 = [(CLDurianDevice *)self delegate];
    __int16 v9 = self;
    id v10 = a3;
    uint64_t v11 = 13;
LABEL_9:
    [(CLDurianDeviceDelegate *)v8 device:v9 didFailToCompleteTask:v10 withError:v11 andDisconnect:0];
    return;
  }
  if ([a3 isMutexProtectedRangingTask])
  {
    unsigned int v8 = [(CLDurianDevice *)self delegate];
    __int16 v9 = self;
    id v10 = a3;
    uint64_t v11 = 12;
    goto LABEL_9;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  id v12 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    unint64_t v14 = self->_mutexState;
    int v15 = 68289539;
    int v16 = 0;
    __int16 v17 = 2082;
    uint64_t v18 = "";
    __int16 v19 = 2113;
    id v20 = v13;
    __int16 v21 = 1025;
    int v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #mutex fail on unprotected opcode\", \"item\":%{private, location:escape_only}@, \"mutexState\":%{private}d}", (uint8_t *)&v15, 0x22u);
  }
}

- (void)handleMultiStatusReply:(unint64_t)a3
{
  int v3 = a3;
  if ([(CLDurianDevice *)self isAirTag])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    uint64_t v5 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      uint64_t v13 = 68291331;
      *(_WORD *)unint64_t v14 = 2082;
      *(void *)&v14[2] = "";
      *(_WORD *)&v14[10] = 2113;
      *(void *)&v14[12] = v6;
      *(_WORD *)&v14[20] = 1025;
      *(_DWORD *)&v14[22] = v3;
      *(_WORD *)&v14[26] = 1025;
      *(_DWORD *)&v14[28] = v3 & 1;
      LOWORD(v15) = 1025;
      *(_DWORD *)((char *)&v15 + 2) = v3 & 2;
      HIWORD(v15) = 1025;
      LODWORD(v16) = v3 & 4;
      WORD2(v16) = 1025;
      *(_DWORD *)((char *)&v16 + 6) = v3 & 8;
      WORD5(v16) = 1025;
      HIDWORD(v16) = v3 & 0x10;
      LOWORD(v17) = 1025;
      *(_DWORD *)((char *)&v17 + 2) = v3 & 0x20;
      HIWORD(v17) = 1025;
      LODWORD(v18) = v3 & 0x40;
      id v7 = "{\"msg%{public}.0s\":\"#durian #multi status\", \"item\":%{private, location:escape_only}@, \"status\":%{priv"
           "ate}d, \"leashed\":%{private}d, \"ranging\":%{private}d, \"sound\":%{private}d, \"fwdl\":%{private}d, \"rosei"
           "nit\":%{private}d, \"encrypted\":%{private}d, \"mutex\":%{private}d}";
      unsigned int v8 = v5;
      uint32_t v9 = 76;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v13, v9);
    }
  }
  else if ([(CLDurianDevice *)self isHawkeyeAccessory])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    uint64_t v10 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      uint64_t v13 = 68290819;
      *(_WORD *)unint64_t v14 = 2082;
      *(void *)&v14[2] = "";
      *(_WORD *)&v14[10] = 2113;
      *(void *)&v14[12] = v11;
      *(_WORD *)&v14[20] = 1025;
      *(_DWORD *)&v14[22] = v3;
      *(_WORD *)&v14[26] = 1025;
      *(_DWORD *)&v14[28] = v3 & 1;
      LOWORD(v15) = 1025;
      *(_DWORD *)((char *)&v15 + 2) = v3 & 4;
      HIWORD(v15) = 1025;
      LODWORD(v16) = v3 & 8;
      WORD2(v16) = 1025;
      *(_DWORD *)((char *)&v16 + 6) = v3 & 0x20;
      WORD5(v16) = 1025;
      HIDWORD(v16) = v3 & 0x40;
      id v7 = "{\"msg%{public}.0s\":\"#durian #multi status\", \"item\":%{private, location:escape_only}@, \"status\":%{priv"
           "ate}d, \"leashed\":%{private}d, \"sound\":%{private}d, \"fwdl\":%{private}d, \"encrypted\":%{private}d, \"oth"
           "erconnected\":%{private}d}";
      unsigned int v8 = v10;
      uint32_t v9 = 64;
      goto LABEL_11;
    }
  }
  unsigned int v12 = [(CLDurianDevice *)self isAirTag];
  if ((v3 & 0x40) == 0 || v12) {
    [(CLDurianDevice *)self sendHelloSequence];
  }
}

- (void)handleGroupStatusReply:(id)a3
{
  if ([(CLDurianDevice *)self isHawkeyeAccessory])
  {
    uint64_t v5 = (unsigned __int8 *)[a3 bytes];
    uint64_t v6 = v5[3];
    if ((unint64_t)[a3 length] < 5) {
      uint64_t v7 = 255;
    }
    else {
      uint64_t v7 = v5[4];
    }
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    unsigned int v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      v10[0] = 68289795;
      v10[1] = 0;
      __int16 v11 = 2082;
      unsigned int v12 = "";
      __int16 v13 = 2113;
      id v14 = v9;
      __int16 v15 = 1026;
      int v16 = v6;
      __int16 v17 = 1026;
      int v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian groupstatus\", \"item\":%{private, location:escape_only}@, \"maint\":%{public}d, \"relation\":%{public}d}", (uint8_t *)v10, 0x28u);
    }
    [(CLDurianDeviceDelegate *)[(CLDurianDevice *)self delegate] device:self didReceiveGroupRelationStatus:v7 andMainteanceStatus:v6];
  }
}

- (void)handleMultiDownloading
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  int v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    v5[0] = 68289283;
    v5[1] = 0;
    __int16 v6 = 2082;
    uint64_t v7 = "";
    __int16 v8 = 2113;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #multi abortfwdl\", \"item\":%{private, location:escape_only}@}", (uint8_t *)v5, 0x1Cu);
  }
  [(CLDurianDevice *)self enqueueTask:+[CLDurianTask fwdlAbortTask]];
}

- (BOOL)isAttemptingConnection
{
  return (id)[(CLDurianConnectionAttempt *)self->_activeConnectionAttempt state] == (id)1;
}

- (int)numPossiblePeripherals
{
  return [(NSArray *)[(CLDurianConnectionAttempt *)self->_activeConnectionAttempt possiblePeripherals] count];
}

- (BOOL)isConnected
{
  return (id)[(CBPeripheral *)self->_activePeripheral state] == (id)2;
}

- (BOOL)isLeashable
{
  return self->_leashState != 0;
}

- (BOOL)isLeashSlotInUse
{
  return (self->_leashState & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)resetLeashState
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  int v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    unint64_t leashState = self->_leashState;
    v6[0] = 68289539;
    v6[1] = 0;
    __int16 v7 = 2082;
    __int16 v8 = "";
    __int16 v9 = 2113;
    id v10 = v4;
    __int16 v11 = 1026;
    int v12 = leashState;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #leash reset state\", \"item\":%{private, location:escape_only}@, \"prior\":%{public}d}", (uint8_t *)v6, 0x22u);
  }
  if ([(CLDurianDevice *)self isLeashSlotInUse]) {
    self->_unint64_t leashState = 1;
  }
}

- (BOOL)leashNeedsConfiguring
{
  return self->_leashState != 3;
}

- (NSData)address
{
  if (self->_activePeripheral) {
    return (NSData *)[(CLFindMyAccessoryConnectionMaterial *)self->_activePeripheralMaterial address];
  }
  else {
    return 0;
  }
}

- (void)handleFailureToConnectWithError:(int64_t)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  uint64_t v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    id v7 = [[-[NSUUID description](-[CLDurianConnectionAttempt identifier](self->_activeConnectionAttempt, "identifier"), "description") substringToIndex:8];
    [(CLDurianConnectionAttempt *)self->_activeConnectionAttempt attemptDuration];
    *(_DWORD *)uint64_t buf = 68290051;
    int v19 = 0;
    __int16 v20 = 2082;
    __int16 v21 = "";
    __int16 v22 = 2113;
    id v23 = v6;
    __int16 v24 = 2113;
    id v25 = v7;
    __int16 v26 = 1026;
    int v27 = a3;
    __int16 v28 = 2050;
    uint64_t v29 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt failure\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"error\":%{public}d, \"ttc\":\"%{public}.1f\"}", buf, 0x36u);
  }
  self->_maintenanceOnlyCondition = 0;
  if ([(CLDurianConnectionAttempt *)[(CLDurianDevice *)self activeConnectionAttempt] connectionAttemptCount])
  {
    [(CLDurianDevice *)self intervalSinceLastSearchPartyKeyObservation];
    +[CLDurianMetricManager submitConnectionAttemptEvent:[(CLDurianConnectionAttempt *)[(CLDurianDevice *)self activeConnectionAttempt] connectionAttemptCount] numberBTConnectionAttempts:[(CLDurianDevice *)self getConnectionReason] connectionReason:[(CLDurianDevice *)self prettyBeaconType] deviceType:v9];
  }
  [(CLDurianDevice *)self clearConnectionAttemptReasons];
  self->_isProactiveAttempt = 0;
  [(CLDurianDevice *)self resetLeashState];
  [(CLDurianDevice *)self transitionToState:0 event:4 task:0];
  [(CLDurianDevice *)self failAllTasksWithError:a3];
  [(CLDurianDeviceDelegate *)[(CLDurianDevice *)self delegate] didFailToConnectDevice:self withError:a3];
  if (self->_firmwareUpdateMode)
  {
    if (!self->_firmwareUpdateReboot)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      id v10 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        *(_DWORD *)uint64_t buf = 68289283;
        int v19 = 0;
        __int16 v20 = 2082;
        __int16 v21 = "";
        __int16 v22 = 2113;
        id v23 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian fwdl failure exit\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
      }
      id v12 = objc_alloc((Class)NSError);
      uint64_t v13 = kCLErrorDomainPrivate;
      NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
      CFStringRef v17 = sub_101640864(a3);
      id v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      id v15 = [v12 initWithDomain:v13 code:a3 userInfo:v14];
      [(CLDurianDevice *)self informFirmwareUpdateFailureToClientWithError:v15];
    }
    [(CLDurianDevice *)self exitFirmwareUpdateMode];
  }
}

- (void)removePossiblePeripheral:(id)a3
{
}

- (void)removePossiblePeripheral:(id)a3 withError:(int64_t)a4
{
  [(CLDurianConnectionAttempt *)[(CLDurianDevice *)self activeConnectionAttempt] removePossiblePeripheral:a3];
  if ([(CLDurianDevice *)self activePeripheral]) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = (id)[(CLDurianConnectionAttempt *)[(CLDurianDevice *)self activeConnectionAttempt] state] == (id)3;
  }
  if ([(CLDurianDevice *)self pendingConnectionAttempt]) {
    BOOL v8 = (id)[(CLDurianConnectionAttempt *)[(CLDurianDevice *)self pendingConnectionAttempt] state] == (id)3;
  }
  else {
    BOOL v8 = 1;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  double v9 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
  {
    id v10 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    int v16 = 68291075;
    int v17 = 0;
    __int16 v18 = 2082;
    int v19 = "";
    __int16 v20 = 2113;
    id v21 = v10;
    __int16 v22 = 1026;
    *(_DWORD *)id v23 = v7;
    *(_WORD *)&v23[4] = 1026;
    *(_DWORD *)&v23[6] = v8;
    LOWORD(v24) = 1026;
    *(_DWORD *)((char *)&v24 + 2) = [(CLDurianDevice *)self activePeripheral] != 0;
    HIWORD(v24) = 1026;
    *(_DWORD *)id v25 = (id)[(CLDurianConnectionAttempt *)[(CLDurianDevice *)self activeConnectionAttempt] state] == (id)3;
    *(_WORD *)&v25[4] = 1026;
    BOOL v26 = [(CLDurianDevice *)self pendingConnectionAttempt] != 0;
    __int16 v27 = 1026;
    BOOL v28 = (id)[(CLDurianConnectionAttempt *)[(CLDurianDevice *)self activeConnectionAttempt] state] == (id)3;
    __int16 v29 = 1026;
    int v30 = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #connection failcheck\", \"item\":%{private, location:escape_only}@, \"active\":%{public}hhd, \"pending\":%{public}hhd, \"activePeriph\":%{public}hhd, \"activeState\":%{public}hhd, \"pendingAttempt\":%{public}hhd, \"pendingState\":%{public}hhd, \"error\":%{public}d}", (uint8_t *)&v16, 0x46u);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
  }
  int v11 = v7 && v8;
  id v12 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    id v14 = [[-[NSUUID description](-[CLDurianConnectionAttempt identifier](self->_activeConnectionAttempt, "identifier"), "description") substringToIndex:8];
    id v15 = [[[objc_msgSend(objc_msgSend(a3, "identifier"), "description") substringToIndex:8];
    int v16 = 68290051;
    int v17 = 0;
    __int16 v18 = 2082;
    int v19 = "";
    __int16 v20 = 2113;
    id v21 = v13;
    __int16 v22 = 2113;
    *(void *)id v23 = v14;
    *(_WORD *)&v23[8] = 2113;
    id v24 = v15;
    *(_WORD *)id v25 = 1026;
    *(_DWORD *)&v25[2] = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt remove peripheral\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"failed\":%{public}hhd}", (uint8_t *)&v16, 0x36u);
  }
  if (v11) {
    [(CLDurianDevice *)self handleFailureToConnectWithError:a4];
  }
}

- (void)removeAllPossiblePeripherals
{
  id v3 = [(NSArray *)[(CLDurianConnectionAttempt *)[(CLDurianDevice *)self activeConnectionAttempt] possiblePeripherals] copy];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      BOOL v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(CLDurianDevice *)self removePossiblePeripheral:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
        BOOL v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (double)secondsSinceLastDisconnection
{
  mach_continuous_time();

  TMConvertTicksToSeconds();
  return result;
}

- (double)secondsSinceLastProactiveMaintenanceAttempt
{
  mach_continuous_time();

  TMConvertTicksToSeconds();
  return result;
}

- (void)setActivePeripheral:(id)a3
{
  [(CLDurianDevice *)self setActivePeripheral:a3 withError:0];
  if ([(CLDurianDevice *)self activePeripheral])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v4 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
    {
      id v5 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      v8[0] = 68289283;
      v8[1] = 0;
      __int16 v9 = 2082;
      long long v10 = "";
      __int16 v11 = 2113;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#durian #latency initializing\", \"item\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
    }
    sub_10164083C();
    self->_currentLatencyStartTime = v6;
    self->_currentLatency = 0;
    self->_commandedLatencyTime = v6;
    self->_commandedLatency = 0;
    self->_latencyCommandResponseArrived = 1;
    id latencyTimeoutBlock = self->_latencyTimeoutBlock;
    if (latencyTimeoutBlock) {
      _Block_release(latencyTimeoutBlock);
    }
    self->_id latencyTimeoutBlock = 0;
  }
}

- (void)activate
{
  [(CLDurianDeviceDelegate *)self->_delegate cancelConnectionTimeoutForPeripheral:[(CLDurianDevice *)self activePeripheral]];
  self->_preparingForRanging = 0;
  [(CLDurianDevice *)self setDesiredConnectionLatency];
  [(CLDurianDevice *)self transitionToState:4 event:7 task:0];
  [(CLDurianDevice *)self setActivePeripheralReady:1];
  activePeripheralMaterial = self->_activePeripheralMaterial;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    unsigned int lastObservedIndex = self->_lastObservedIndex;
    v7[0] = 68290051;
    v7[1] = 0;
    __int16 v8 = 2082;
    __int16 v9 = "";
    __int16 v10 = 2113;
    id v11 = v5;
    __int16 v12 = 1026;
    unsigned int v13 = lastObservedIndex;
    __int16 v14 = 2114;
    id v15 = [(CLFindMyAccessoryConnectionMaterial *)activePeripheralMaterial primaryIndex];
    __int16 v16 = 2114;
    id v17 = [(CLFindMyAccessoryConnectionMaterial *)activePeripheralMaterial secondaryIndex];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection activate\", \"item\":%{private, location:escape_only}@, \"prior lastObserved\":%{public}d, \"primaryIndex\":%{public, location:escape_only}@, \"secondaryIndex\":%{public, location:escape_only}@}", (uint8_t *)v7, 0x36u);
  }
  if (![(CLDurianDevice *)self isHawkeyeAccessory]) {
    self->_unsigned int lastObservedIndex = [[-[CLFindMyAccessoryConnectionMaterial primaryIndex](-[CLDurianDevice activePeripheralMaterial](self, "activePeripheralMaterial")) unsignedIntValue];
  }
}

- (void)discoverHawkeyeService
{
  v15[0] = +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID];
  v15[1] = +[CBUUID _cl_HawkeyeAccessoryInformationServiceUUID];
  v15[2] = +[CBUUID _cl_HawkeyeAccessoryFirmwareUpdateServiceUUID];
  v15[3] = +[CBUUID _cl_BtTxPowerServiceUUID];
  id v3 = +[NSArray arrayWithObjects:v15 count:4];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    v6[0] = 68289795;
    v6[1] = 0;
    __int16 v7 = 2082;
    __int16 v8 = "";
    __int16 v9 = 2113;
    id v10 = v5;
    __int16 v11 = 1026;
    unsigned int v12 = [(NSArray *)v3 count];
    __int16 v13 = 2113;
    __int16 v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye requesting service-discovery\", \"item\":%{private, location:escape_only}@, \"count\":%{public}d, \"service\":%{private, location:escape_only}@}", (uint8_t *)v6, 0x2Cu);
  }
  [(CBPeripheral *)self->_activePeripheral discoverServices:v3];
}

- (void)discoverPoshService
{
  id v15 = +[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID];
  id v3 = +[NSArray arrayWithObjects:&v15 count:1];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    v6[0] = 68289795;
    v6[1] = 0;
    __int16 v7 = 2082;
    __int16 v8 = "";
    __int16 v9 = 2113;
    id v10 = v5;
    __int16 v11 = 1026;
    unsigned int v12 = [(NSArray *)v3 count];
    __int16 v13 = 2113;
    __int16 v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh requesting service-discovery\", \"item\":%{private, location:escape_only}@, \"count\":%{public}d, \"service\":%{private, location:escape_only}@}", (uint8_t *)v6, 0x2Cu);
  }
  [(CBPeripheral *)self->_activePeripheral discoverServices:v3];
}

+ (id)_convertTASPAdvertisementDeviceTypeToSPBeaconType:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    id v3 = (id *)&SPBeaconTypeNone;
  }
  else {
    id v3 = (id *)*(&off_1023321B8 + a3 - 1);
  }
  return *v3;
}

- (id)getBeaconType
{
  beacon = self->_beacon;
  if (beacon || (beacon = self->_unownedBeacon) != 0)
  {
    return [(SPSimpleBeacon *)beacon type];
  }
  else
  {
    taUnknownBeacon = self->_taUnknownBeacon;
    if (taUnknownBeacon)
    {
      id v6 = [(TAUnknownBeacon *)taUnknownBeacon deviceType];
      return +[CLDurianDevice _convertTASPAdvertisementDeviceTypeToSPBeaconType:v6];
    }
    else
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      __int16 v7 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
      {
        id v8 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        int v11 = 68289283;
        int v12 = 0;
        __int16 v13 = 2082;
        __int16 v14 = "";
        __int16 v15 = 2113;
        id v16 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian beacon type requested with no valid beacon\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v11, 0x1Cu);
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
      }
      __int16 v9 = qword_102419398;
      if (os_signpost_enabled((os_log_t)qword_102419398))
      {
        id v10 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        int v11 = 68289283;
        int v12 = 0;
        __int16 v13 = 2082;
        __int16 v14 = "";
        __int16 v15 = 2113;
        id v16 = v10;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian beacon type requested with no valid beacon", "{\"msg%{public}.0s\":\"#durian beacon type requested with no valid beacon\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v11, 0x1Cu);
      }
      return (id)SPBeaconTypeNone;
    }
  }
}

- (NSString)deviceTypeName
{
  if ([(CLDurianDevice *)self isAirTag]) {
    CFStringRef v3 = @"D";
  }
  else {
    CFStringRef v3 = @"Unknown";
  }
  if ([(CLDurianDevice *)self isHawkeyeAccessory]) {
    CFStringRef v3 = @"H";
  }
  if ([(CLDurianDevice *)self isHeleAccessory]) {
    CFStringRef v3 = @"L";
  }
  if ([(CLDurianDevice *)self isPoshAccessory]
    && ![(CLDurianDevice *)self isFindMyNetwork])
  {
    return (NSString *)@"P";
  }
  return &v3->isa;
}

- (NSString)accessoryTypeName
{
  unsigned int v3 = [(CLDurianDevice *)self isAirTag];
  unsigned int v4 = v3;
  if (v3) {
    CFStringRef v5 = @"Apple";
  }
  else {
    CFStringRef v5 = @"Unknown";
  }
  if (v3) {
    CFStringRef v6 = @"D";
  }
  else {
    CFStringRef v6 = @"Unknown";
  }
  unsigned int v7 = [(CLDurianDevice *)self isHawkeyeAccessory];
  if (v7 | v4) {
    CFStringRef v8 = @"Accessory";
  }
  else {
    CFStringRef v8 = @"Unknown";
  }
  if (v7) {
    CFStringRef v9 = @"ThirdParty";
  }
  else {
    CFStringRef v9 = v5;
  }
  if (v7) {
    CFStringRef v10 = @"H";
  }
  else {
    CFStringRef v10 = v6;
  }
  if ([(CLDurianDevice *)self isHeleAccessory])
  {
    CFStringRef v8 = @"HeleAccessory";
    CFStringRef v9 = @"Apple";
    CFStringRef v11 = @"L";
  }
  else
  {
    CFStringRef v11 = v10;
  }
  if ([(CLDurianDevice *)self isPoshAccessory]
    && ![(CLDurianDevice *)self isFindMyNetwork])
  {
    CFStringRef v11 = @"P";
    CFStringRef v9 = @"ThirdParty";
    CFStringRef v8 = @"Accessory";
  }
  unsigned int v12 = [(CLDurianDevice *)self isPoshAccessory];
  CFStringRef v13 = @"NP";
  if (v12) {
    CFStringRef v13 = @"P";
  }
  v21[0] = v11;
  v21[1] = v13;
  __int16 v14 = [+[NSArray arrayWithObjects:v21 count:2] componentsJoinedByString:@":"];
  if (![(CLDurianDevice *)self unownedBeacon]
    || ![(SPUnknownBeacon *)[(CLDurianDevice *)self unownedBeacon] metadata])
  {
    goto LABEL_32;
  }
  if (objc_msgSend(objc_msgSend(-[SPUnknownBeacon metadata](-[CLDurianDevice unownedBeacon](self, "unownedBeacon"), "metadata"), "manufacturerName"), "length"))
  {
    CFStringRef v9 = (const __CFString *)[[-[SPUnknownBeacon metadata](-[CLDurianDevice unownedBeacon](self, "unownedBeacon"), "metadata")] manufacturerName];
  }
  if (objc_msgSend(objc_msgSend(-[SPUnknownBeacon metadata](-[CLDurianDevice unownedBeacon](self, "unownedBeacon"), "metadata"), "modelName"), "length"))
  {
    CFStringRef v8 = (const __CFString *)[[-[SPUnknownBeacon metadata](-[CLDurianDevice unownedBeacon](self, "unownedBeacon")) stringByAppendingPathComponent:@"DBCShutdownCookie"];
  }
  if (objc_msgSend(objc_msgSend(-[SPUnknownBeacon metadata](-[CLDurianDevice unownedBeacon](self, "unownedBeacon"), "metadata"), "productData"), "length") == (id)8)__int16 v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%X:%X", *(unsigned int *)objc_msgSend(objc_msgSend(objc_msgSend(-[SPUnknownBeacon metadata](-[CLDurianDevice unownedBeacon](self, "unownedBeacon"), "metadata"), "productData"), "subdataWithRange:", 0, 4), "bytes"), {
            *(unsigned int *)[[[[-[SPUnknownBeacon metadata](-[CLDurianDevice unownedBeacon](self, "unownedBeacon"), "metadata") productData] subdataWithRange:4, 4] bytes]];
  }
  else {
LABEL_32:
  }
    __int16 v15 = @"Unknown";
  if ([(CLDurianDevice *)self taUnknownBeacon]
    && [(TAUnknownBeacon *)[(CLDurianDevice *)self taUnknownBeacon] accessoryInfo])
  {
    if (objc_msgSend(objc_msgSend(-[TAUnknownBeacon accessoryInfo](-[CLDurianDevice taUnknownBeacon](self, "taUnknownBeacon"), "accessoryInfo"), "manufacturerName"), "length"))
    {
      CFStringRef v9 = (const __CFString *)[[-[TAUnknownBeacon accessoryInfo](-[CLDurianDevice taUnknownBeacon](self, "taUnknownBeacon")) accessoryInfo] manufacturerName];
    }
    if (objc_msgSend(objc_msgSend(-[TAUnknownBeacon accessoryInfo](-[CLDurianDevice taUnknownBeacon](self, "taUnknownBeacon"), "accessoryInfo"), "modelName"), "length"))
    {
      CFStringRef v8 = (const __CFString *)[[-[TAUnknownBeacon accessoryInfo](-[CLDurianDevice taUnknownBeacon](self, "taUnknownBeacon")) stringByAppendingPathComponent:@"DBCShutdownCookie"];
    }
    if (objc_msgSend(objc_msgSend(-[TAUnknownBeacon accessoryInfo](-[CLDurianDevice taUnknownBeacon](self, "taUnknownBeacon"), "accessoryInfo"), "productData"), "length") == (id)8)__int16 v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%X:%X", *(unsigned int *)objc_msgSend(objc_msgSend(objc_msgSend(-[TAUnknownBeacon accessoryInfo](-[CLDurianDevice taUnknownBeacon](self, "taUnknownBeacon"), "accessoryInfo"), "productData"), "subdataWithRange:", 0, {
                                   4),
    }
                                 "bytes"),
              *(unsigned int *)[[[TAUnknownBeacon accessoryInfo](-[CLDurianDevice taUnknownBeacon](self, "taUnknownBeacon"), "accessoryInfo") productData] subdataWithRange:4, 4] bytes];
  }
  if ([(CLDurianDevice *)self beacon])
  {
    if (objc_msgSend(-[SPSimpleBeacon manufacturerName](-[CLDurianDevice beacon](self, "beacon"), "manufacturerName"), "length"))
    {
      CFStringRef v9 = (const __CFString *)[(SPSimpleBeacon *)[(CLDurianDevice *)self beacon] manufacturerName];
    }
    if (objc_msgSend(-[SPSimpleBeacon modelName](-[CLDurianDevice beacon](self, "beacon"), "modelName"), "length")) {
      CFStringRef v8 = (const __CFString *)[(SPSimpleBeacon *)[(CLDurianDevice *)self beacon] modelName];
    }
  }
  if ([(SPSimpleBeacon *)[(CLDurianDevice *)self beacon] productId]
    && [(SPSimpleBeacon *)[(CLDurianDevice *)self beacon] vendorId])
  {
    __int16 v15 = +[NSString stringWithFormat:@"%X:%X", [(SPSimpleBeacon *)[(CLDurianDevice *)self beacon] vendorId], [(SPSimpleBeacon *)[(CLDurianDevice *)self beacon] productId]];
  }
  if ([(__CFString *)v15 isEqualToString:@"Unknown"])
  {
    v20[0] = v14;
    v20[1] = v9;
    v20[2] = v8;
    id v16 = v20;
    uint64_t v17 = 3;
  }
  else
  {
    v19[0] = v14;
    v19[1] = v9;
    v19[2] = v8;
    v19[3] = v15;
    id v16 = v19;
    uint64_t v17 = 4;
  }
  return [+[NSArray arrayWithObjects:v16 count:v17] componentsJoinedByString:@":"];
}

- (BOOL)isPoshAccessory
{
  if (_os_feature_enabled_impl())
  {
    unsigned __int8 v3 = +[CLDurianSettings forceEnablePosh];
    SEL v4 = NSSelectorFromString(@"isPosh");
    SEL v5 = NSSelectorFromString(@"isPoshAccessory");
    if (self->_unownedBeacon && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v6 = [(SPUnknownBeacon *)self->_unownedBeacon performSelector:v4];
      unsigned __int8 v3 = v6 != 0;
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      unsigned int v7 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
      {
        id v8 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        __int16 v18 = "";
        __int16 v19 = 2113;
        id v20 = v8;
        __int16 v21 = 1025;
        BOOL v22 = v6 != 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #posh SPUnknownBeacon responds to isPosh selector\", \"item\":%{private, location:escape_only}@, \"isPosh\":%{private}hhd}", (uint8_t *)&v15, 0x22u);
      }
    }
    if (self->_taUnknownBeacon && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v9 = [(TAUnknownBeacon *)self->_taUnknownBeacon performSelector:v5];
      unsigned __int8 v3 = v9 != 0;
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      CFStringRef v10 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
      {
        id v11 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        __int16 v18 = "";
        __int16 v19 = 2113;
        id v20 = v11;
        __int16 v21 = 1025;
        BOOL v22 = v9 != 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #posh TAUnknownBeacon responds to isPosh selector\", \"item\":%{private, location:escape_only}@, \"isPosh\":%{private}hhd}", (uint8_t *)&v15, 0x22u);
      }
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    unsigned int v12 = qword_102419398;
    unsigned __int8 v3 = 0;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      __int16 v18 = "";
      __int16 v19 = 2113;
      id v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh not enabled\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
      return 0;
    }
  }
  return v3;
}

- (BOOL)shouldActivateDevicePostConnection
{
  id v3 = [(CLDurianDevice *)self getBeaconType];
  unsigned int v4 = [v3 isEqual:SPBeaconTypeDurian];
  if (v4) {
    unsigned int v5 = ![(CLDurianDevice *)self isPoshAccessory];
  }
  else {
    unsigned int v5 = 0;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  id v6 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
  {
    id v7 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    v9[0] = 68289795;
    v9[1] = 0;
    __int16 v10 = 2082;
    id v11 = "";
    __int16 v12 = 2113;
    id v13 = v7;
    __int16 v14 = 1026;
    unsigned int v15 = v4;
    __int16 v16 = 1026;
    unsigned int v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian activate device\", \"item\":%{private, location:escape_only}@, \"isBeaconTypeDurian\":%{public}hhd, \"shouldActivateDevice\":%{public}hhd}", (uint8_t *)v9, 0x28u);
  }
  return v5;
}

- (BOOL)shouldDiscoverHawkeyeServices
{
  id v3 = [(CLDurianDevice *)self getBeaconType];
  if (([v3 isEqual:SPBeaconTypeAccessory] & 1) != 0
    || (id v4 = [(CLDurianDevice *)self getBeaconType],
        (unsigned int v5 = [v4 isEqual:SPBeaconTypeHele]) != 0))
  {
    LOBYTE(v5) = ![(CLDurianDevice *)self isPoshAccessory];
  }
  return v5;
}

- (BOOL)isAirTag
{
  id v3 = [(CLDurianDevice *)self getBeaconType];
  unsigned int v4 = [v3 isEqual:SPBeaconTypeDurian];
  if (v4) {
    LOBYTE(v4) = ![(CLDurianDevice *)self isPoshAccessory];
  }
  return v4;
}

- (BOOL)isHawkeyeAccessory
{
  id v3 = [(CLDurianDevice *)self getBeaconType];
  if (([v3 isEqual:SPBeaconTypeAccessory] & 1) != 0
    || (id v4 = [(CLDurianDevice *)self getBeaconType],
        (unsigned int v5 = [v4 isEqual:SPBeaconTypeHele]) != 0))
  {
    LOBYTE(v5) = ![(CLDurianDevice *)self isPoshAccessory];
  }
  return v5;
}

- (BOOL)isHeleAccessory
{
  if (+[CLDurianSettings hawkeyeTestMode] != 8)
  {
    id v4 = [(CLDurianDevice *)self getBeaconType];
    unsigned int v3 = [v4 isEqual:SPBeaconTypeHele];
    if (!v3) {
      return v3;
    }
LABEL_5:
    LOBYTE(v3) = ![(CLDurianDevice *)self isPoshAccessory];
    return v3;
  }
  if ([(CLDurianDevice *)self isHawkeyeAccessory]) {
    goto LABEL_5;
  }
  LOBYTE(v3) = 0;
  return v3;
}

- (id)prettyBeaconType
{
  if ([(CLDurianDevice *)self isAirTag]) {
    return @"durian";
  }
  if ([(CLDurianDevice *)self isHeleAccessory]) {
    return @"hele";
  }
  if ([(CLDurianDevice *)self isHawkeyeAccessory]) {
    return @"hawkeye";
  }
  if ([(CLDurianDevice *)self isPoshAccessory]) {
    return @"posh";
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
  {
    id v5 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    int v9 = 68289539;
    int v10 = 0;
    __int16 v11 = 2082;
    __int16 v12 = "";
    __int16 v13 = 2113;
    id v14 = v5;
    __int16 v15 = 1026;
    unsigned int v16 = [(CLDurianDevice *)self getBeaconType];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian unknown beacon type\", \"item\":%{private, location:escape_only}@, \"beaconType\":%{public}d}", (uint8_t *)&v9, 0x22u);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
  }
  id v6 = qword_102419398;
  if (os_signpost_enabled((os_log_t)qword_102419398))
  {
    id v7 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    unsigned int v8 = [(CLDurianDevice *)self getBeaconType];
    int v9 = 68289539;
    int v10 = 0;
    __int16 v11 = 2082;
    __int16 v12 = "";
    __int16 v13 = 2113;
    id v14 = v7;
    __int16 v15 = 1026;
    unsigned int v16 = v8;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian unknown beacon type", "{\"msg%{public}.0s\":\"#durian unknown beacon type\", \"item\":%{private, location:escape_only}@, \"beaconType\":%{public}d}", (uint8_t *)&v9, 0x22u);
  }
  return @"na";
}

- (BOOL)isCapableOfAllHawkeyeServices
{
  BOOL v3 = [(CLDurianDevice *)self isHawkeyeAccessory];
  if (v3) {
    LOBYTE(v3) = ![(CLDurianDevice *)self isHeleAccessory];
  }
  return v3;
}

- (BOOL)isCapableOfDynamicConnectionLatency
{
  if ([(CLDurianDevice *)self isHawkeyeAccessory]) {
    return ![(CLDurianDevice *)self isHeleAccessory];
  }
  else {
    return 1;
  }
}

- (BOOL)isCapableOfFirmwareUpdate
{
  if (![(CLDurianDevice *)self beacon]
    || ![(SPSimpleBeacon *)[(CLDurianDevice *)self beacon] manufacturerName]
    || ![(CLDurianDevice *)self isHawkeyeAccessory])
  {
    return 0;
  }
  id v3 = [(SPSimpleBeacon *)[(CLDurianDevice *)self beacon] manufacturerName];

  return [v3 isEqualToString:@"Apple"];
}

- (void)addHawkeyeTestModeTask
{
  unsigned __int8 v3 = +[CLDurianSettings hawkeyeTestMode];
  int v4 = v3;
  if (v3)
  {
    id v5 = +[CLDurianTask testModeTask:v3];
    if (v5)
    {
      [(CLDurianDevice *)self enqueueTask:v5];
    }
    else
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      id v6 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        v8[0] = 68289539;
        v8[1] = 0;
        __int16 v9 = 2082;
        int v10 = "";
        __int16 v11 = 2113;
        id v12 = v7;
        __int16 v13 = 1026;
        int v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian unrecognized hawkeye test mode\", \"item\":%{private, location:escape_only}@, \"testMode\":%{public}d}", (uint8_t *)v8, 0x22u);
      }
    }
  }
}

- (BOOL)isTAAISDevice
{
  return [(CLDurianDevice *)self taUnknownBeacon]
      && ([(NSUUID *)[(CLDurianDevice *)self uuid] isEqual:[(TAUnknownBeacon *)[(CLDurianDevice *)self taUnknownBeacon] identifier]] & 1) != 0;
}

- (unint64_t)ownership
{
  unownedBeacon = self->_unownedBeacon;
  if (self->_beacon)
  {
    if (unownedBeacon || self->_taUnknownBeacon)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      int v4 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_FAULT))
      {
        id v5 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        id v6 = [(SPSimpleBeacon *)self->_beacon description];
        id v7 = [(SPUnknownBeacon *)self->_unownedBeacon description];
        id v8 = [(TAUnknownBeacon *)self->_taUnknownBeacon description];
        int v15 = 68290051;
        int v16 = 0;
        __int16 v17 = 2082;
        __int16 v18 = "";
        __int16 v19 = 2113;
        id v20 = v5;
        __int16 v21 = 2113;
        id v22 = v6;
        __int16 v23 = 2113;
        id v24 = v7;
        __int16 v25 = 2113;
        id v26 = v8;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian device has both owner and non-owner beacons\", \"item\":%{private, location:escape_only}@, \"beacon\":%{private, location:escape_only}@, \"unownedBeacon\":%{private, location:escape_only}@, \"taUnknownBeacon\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x3Au);
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
      }
      __int16 v9 = qword_102419398;
      if (os_signpost_enabled((os_log_t)qword_102419398))
      {
        id v10 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        id v11 = [(SPSimpleBeacon *)self->_beacon description];
        id v12 = [(SPUnknownBeacon *)self->_unownedBeacon description];
        id v13 = [(TAUnknownBeacon *)self->_taUnknownBeacon description];
        int v15 = 68290051;
        int v16 = 0;
        __int16 v17 = 2082;
        __int16 v18 = "";
        __int16 v19 = 2113;
        id v20 = v10;
        __int16 v21 = 2113;
        id v22 = v11;
        __int16 v23 = 2113;
        id v24 = v12;
        __int16 v25 = 2113;
        id v26 = v13;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian device has both owner and non-owner beacons", "{\"msg%{public}.0s\":\"#durian device has both owner and non-owner beacons\", \"item\":%{private, location:escape_only}@, \"beacon\":%{private, location:escape_only}@, \"unownedBeacon\":%{private, location:escape_only}@, \"taUnknownBeacon\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x3Au);
      }
      return 0;
    }
    else
    {
      return 1;
    }
  }
  else if (unownedBeacon)
  {
    return 2;
  }
  else
  {
    return 2 * (self->_taUnknownBeacon != 0);
  }
}

- (void)setActivePeripheral:(id)a3 withError:(id)a4
{
  self->_unint64_t mutexState = 0;
  self->_lastMaxConnectionsSent = 0;
  if (a3)
  {
    [(CLDurianDevice *)self intervalSinceLastSearchPartyKeyObservation];
    +[CLDurianMetricManager submitConnectionAttemptEvent:[(CLDurianConnectionAttempt *)[(CLDurianDevice *)self activeConnectionAttempt] connectionAttemptCount] numberBTConnectionAttempts:[(CLDurianDevice *)self getConnectionReason] connectionReason:[(CLDurianDevice *)self prettyBeaconType] deviceType:v7];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      id v10 = [(SPSimpleBeacon *)self->_beacon name];
      id v11 = [[[objc_msgSend(objc_msgSend(a3, "identifier"), "description") substringToIndex:8];
      unint64_t maintenanceOnlyCondition = self->_maintenanceOnlyCondition;
      id v13 = a4;
      unsigned int v14 = [(CLDurianDevice *)self isLeashSlotInUse];
      id v15 = [[+[CLDurianVersionNumberUtilities getStringFromNumber:](CLDurianVersionNumberUtilities, "getStringFromNumber:", -[CLDurianDevice buildNumber](self, "buildNumber")) UTF8String];
      connectReason = self->_connectReason;
      int v31 = 68290819;
      int v32 = 0;
      __int16 v33 = 2082;
      unsigned int v34 = "";
      __int16 v35 = 2113;
      id v36 = v9;
      __int16 v37 = 2113;
      unint64_t v38 = (unint64_t)v10;
      __int16 v39 = 2113;
      id v40 = v11;
      __int16 v41 = 1026;
      *(_DWORD *)long long v42 = maintenanceOnlyCondition;
      *(_WORD *)&v42[4] = 1026;
      *(_DWORD *)&v42[6] = v14;
      a4 = v13;
      __int16 v43 = 2082;
      id v44 = v15;
      __int16 v45 = 2114;
      long long v46 = connectReason;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection established\", \"item\":%{private, location:escape_only}@, \"name\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"maint\":%{public}d, \"leashslot\":%{public}d, \"version\":%{public, location:escape_only}s, \"reason\":%{public, location:escape_only}@}", (uint8_t *)&v31, 0x50u);
    }
    if (self->_isProactiveAttempt) {
      ++self->_numProactiveConnects;
    }
    if (self->_maintenanceOnlyCondition && [(CLDurianDevice *)self groupUuid])
    {
      self->_unint64_t lastGroupMaintenance = mach_continuous_time();
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      __int16 v17 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        unint64_t lastGroupMaintenance = self->_lastGroupMaintenance;
        int v31 = 68289539;
        int v32 = 0;
        __int16 v33 = 2082;
        unsigned int v34 = "";
        __int16 v35 = 2113;
        id v36 = v18;
        __int16 v37 = 2050;
        unint64_t v38 = lastGroupMaintenance;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint groupdelta\", \"item\":%{private, location:escape_only}@, \"set\":%{public}llu}", (uint8_t *)&v31, 0x26u);
      }
    }
    [(CLDurianDevice *)self sendConnectionMetric];
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v20 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      id v22 = [(SPSimpleBeacon *)self->_beacon name];
      id v23 = [[[0 identifier] description] substringToIndex:8];
      disconnectReason = self->_disconnectReason;
      int v31 = 68290051;
      __int16 v33 = 2082;
      int v32 = 0;
      unsigned int v34 = "";
      __int16 v35 = 2113;
      id v36 = v21;
      __int16 v37 = 2113;
      unint64_t v38 = (unint64_t)v22;
      __int16 v39 = 2113;
      id v40 = v23;
      __int16 v41 = 2114;
      *(void *)long long v42 = disconnectReason;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection established\", \"item\":%{private, location:escape_only}@, \"name\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"disconnect\":%{public, location:escape_only}@}", (uint8_t *)&v31, 0x3Au);
    }
    self->_connectionEventSpmiRequested = 0;
    self->_isRoseInitialized = 0;
    [(CLDurianDevice *)self setActivePeripheralMaterial:0];
    self->_unint64_t maintenanceOnlyCondition = 0;
    [(CLDurianDevice *)self resetLeashState];
    self->_btFindingState = 0;
    self->_lastDisconnectionTime = mach_continuous_time();
    self->_isProactiveAttempt = 0;
    *(void *)&self->_keyRollInterval = 900;
  }

  [a3 setDelegate:self];
  __int16 v25 = (CBPeripheral *)a3;
  self->_activePeripheral = v25;
  self->_maxPacketSizeForGATTWriteWithResponse = [(CBPeripheral *)v25 maximumWriteValueLengthForType:1];
  [(CLDurianDeviceDelegate *)[(CLDurianDevice *)self delegate] device:self didUpdateActivePeripheral:a3 withError:a4];
  self->_activePeripheralReady = 0;
  if (a3)
  {
    [(CLDurianDevice *)self setActiveConnectionAttempt:0];
    [(CLDurianDevice *)self setPendingConnectionAttempt:0];
    if (self->_firmwareUpdateReboot) {
      [(CLDurianDevice *)self exitFirmwareUpdateMode];
    }
    if (!self->_retrievingPersonalizationInformation)
    {
      if (objc_msgSend(-[CLFindMyAccessoryConnectionMaterial ltk](self->_activePeripheralMaterial, "ltk"), "length")
        || ![(CLDurianDevice *)self beacon]
        || objc_msgSend(objc_msgSend(-[NSMutableArray firstObject](self->_pendingTasks, "firstObject"), "command"), "opcode") == 175|| objc_msgSend(objc_msgSend(-[NSMutableArray firstObject](self->_pendingTasks, "firstObject"), "command"), "opcode") == 220|| objc_msgSend(objc_msgSend(-[NSMutableArray firstObject](self->_pendingTasks, "firstObject"), "command"), "opcode") == 2061|| objc_msgSend(objc_msgSend(-[NSMutableArray firstObject](self->_pendingTasks, "firstObject"), "command"), "opcode") == 768|| objc_msgSend(objc_msgSend(-[NSMutableArray firstObject](self->_pendingTasks, "firstObject"), "command"), "opcode") == 769|| objc_msgSend(objc_msgSend(-[NSMutableArray firstObject](self->_pendingTasks, "firstObject"), "command"), "opcode") == 794)
      {
        if ([(CBPeripheral *)self->_activePeripheral isLinkEncrypted]) {
          [(CLDurianDevice *)self checkPreHelloConditions];
        }
      }
      else
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
        __int16 v29 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
        {
          id v30 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
          int v31 = 68289283;
          int v32 = 0;
          __int16 v33 = 2082;
          unsigned int v34 = "";
          __int16 v35 = 2113;
          id v36 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection unauthorized, fetching key index\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v31, 0x1Cu);
        }
        [(NSMutableArray *)self->_pendingTasks insertObject:+[CLDurianTask fetchCurrentKeyIndexTask] atIndex:0];
        [(CLDurianDevice *)self logTaskCounts:@"utconnect"];
      }
    }
  }
  else if ([(CLDurianDevice *)self mutexState])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v26 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      unsigned int v28 = [(CLDurianDevice *)self mutexState];
      int v31 = 68289539;
      int v32 = 0;
      __int16 v33 = 2082;
      unsigned int v34 = "";
      __int16 v35 = 2113;
      id v36 = v27;
      __int16 v37 = 1026;
      LODWORD(v38) = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #mutex free on disconnect\", \"item\":%{private, location:escape_only}@, \"prior\":%{public}d}", (uint8_t *)&v31, 0x22u);
    }
    [(CLDurianDevice *)self setMutexState:0];
  }
}

- (void)setActivePeripheralReady:(BOOL)a3
{
  self->_activePeripheralReady = a3;
  if (a3)
  {
    if (self->_retrievingPersonalizationInformation) {
      [(CLDurianDevice *)self getPersonalizationInformation];
    }
    else {
      [(CLDurianDevice *)self processNextTask:@"setActivePeripheralReady"];
    }
  }
}

- (void)checkPreHelloConditions
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  unsigned __int8 v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    v5[0] = 68289539;
    v5[1] = 0;
    __int16 v6 = 2082;
    double v7 = "";
    __int16 v8 = 2113;
    id v9 = v4;
    __int16 v10 = 2113;
    id v11 = [(CLDurianDevice *)self prettyBeaconType];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian checking pre hello\", \"item\":%{private, location:escape_only}@, \"beaconType\":%{private, location:escape_only}@}", (uint8_t *)v5, 0x26u);
  }
  if ([(CLDurianDevice *)self isAirTag]) {
    [(CLDurianDevice *)self enqueueTask:+[CLDurianTask fetchMultiStatusTask]];
  }
  if ([(CLDurianDevice *)self isHawkeyeAccessory])
  {
    if (!self->_firmwareUpdateMode) {
      [(CLDurianDevice *)self enqueueTask:+[CLDurianTask getMultiStatusHawkeyeTask]];
    }
  }
}

- (void)sendHelloSequence
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  unsigned __int8 v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    v7[0] = 68290051;
    v7[1] = 0;
    __int16 v8 = 2082;
    id v9 = "";
    __int16 v10 = 2113;
    id v11 = v4;
    __int16 v12 = 1025;
    unsigned int v13 = [(SPSimpleBeacon *)[(CLDurianDevice *)self beacon] connectableDeviceCount];
    __int16 v14 = 1026;
    unsigned int v15 = [(CLDurianDevice *)self isLeashSlotInUse];
    __int16 v16 = 2114;
    id v17 = [(CLDurianDevice *)self prettyBeaconType];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian sending hello\", \"item\":%{private, location:escape_only}@, \"connectableDevices\":%{private}d, \"leashslot\":%{public}d, \"type\":%{public, location:escape_only}@}", (uint8_t *)v7, 0x32u);
  }
  if ([(CLDurianDevice *)self isAirTag])
  {
    [(CLDurianDevice *)self enqueueTask:+[CLDurianTask setCentralReferenceTimeTask]];
    [(CLDurianDevice *)self enqueueTask:+[CLDurianTask rollWildKeyTask]];
    if (![(CLDurianDevice *)self isLeashSlotInUse]) {
      [(CLDurianDevice *)self enqueueTask:+[CLDurianTask setNearOwnerTimeoutTaskWithTimeout:self->_nearOwnerTimeout]];
    }
    [(CLDurianDevice *)self enqueueTask:+[CLDurianTask fetchFirmwareVersionTaskWithCrashLogs:1]];
    [(CLDurianDevice *)self enqueueTask:+[CLDurianTask setMaxConnectionsTaskWithCount:[(SPSimpleBeacon *)[(CLDurianDevice *)self beacon] connectableDeviceCount]]];
    unsigned int keyRollInterval = self->_keyRollInterval;
    if (keyRollInterval != 900) {
      [(CLDurianDevice *)self enqueueTask:+[CLDurianTask setKeyRotationTimeoutTaskWithTimeout:1000 * keyRollInterval]];
    }
    if (sub_101640888()) {
      [(CLDurianDevice *)self enqueueTask:+[CLDurianTask checkCrashesTask]];
    }
  }
  if ([(CLDurianDevice *)self isHawkeyeAccessory])
  {
    [(CLDurianDevice *)self setHawkeyeTestMode:+[CLDurianSettings hawkeyeTestMode]];
    [(CLDurianDevice *)self enqueueTask:+[CLDurianTask setUtcHawkeyeTask]];
    [(CLDurianDevice *)self enqueueTask:+[CLDurianTask latchSeparatedKeyHawkeyeTask]];
    if (![(CLDurianDevice *)self isLeashSlotInUse]) {
      [(CLDurianDevice *)self enqueueTask:+[CLDurianTask setNearbyTimeoutHawkeyeTaskWithTimeout:self->_nearOwnerTimeout asHele:[(CLDurianDevice *)self isHeleAccessory]]];
    }
    if ([(CLDurianDevice *)self isCapableOfAllHawkeyeServices]) {
      [(CLDurianDevice *)self enqueueTask:+[CLDurianTask fetchFirmwareVersionGATTTask]];
    }
    if ([(CLDurianDevice *)self groupUuid]) {
      [(CLDurianDevice *)self enqueueTask:+[CLDurianTask getGroupStatusHawkeyeTask]];
    }
    [(CLDurianDevice *)self enqueueTask:+[CLDurianTask setMaxConnectionsHawkeyeTaskWithCount:[(SPSimpleBeacon *)[(CLDurianDevice *)self beacon] connectableDeviceCount]]];
    unsigned int v6 = self->_keyRollInterval;
    if (v6 != 900) {
      [(CLDurianDevice *)self enqueueTask:+[CLDurianTask setKeyRotationTimeoutHawkeyeTaskWithTimeout:1000 * v6]];
    }
    [(CLDurianDevice *)self addHawkeyeTestModeTask];
  }
}

- (id)nextAlignedKeyRollDate
{
  double v2 = (double)[(CLDurianDevice *)self keyRollInterval];
  +[NSDate timeIntervalSinceReferenceDate];
  double v4 = ceil(v3 / v2) * v2;

  return +[NSDate dateWithTimeIntervalSinceReferenceDate:v4];
}

- (unsigned)keysRemainingUntilWildRoll
{
  [[+[NSCalendar calendarWithIdentifier:](NSCalendar, "calendarWithIdentifier:", NSCalendarIdentifierGregorian) nextDateAfterDate:+[NSDate date] matchingHour:4 minute:0 second:0 options:1024] timeIntervalSinceNow];
  double v4 = ceil(v3 / (double)[(CLDurianDevice *)self keyRollInterval]);
  if (v4 > 96.0) {
    return (int)96.0;
  }
  return (int)v4;
}

- (void)alignClockWithCurrentIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(CLDurianDevice *)self nextAlignedKeyRollDate];
  unsigned int v6 = [(CLDurianDevice *)self keysRemainingUntilWildRoll];
  if ([(CLDurianDevice *)self isAirTag])
  {
    if ((uint64_t)[(SPSimpleBeacon *)[(CLDurianDevice *)self beacon] batteryLevel] <= 4)
    {
      id v7 = [objc_alloc((Class)CLFindMyAccessoryAbsoluteWildConfiguration) initWithDesiredNextKeyRollDate:v5 nextWildIndex:v6 + v3];
      id v8 = +[CLDurianTask setAbsoluteWildModeConfigurationTaskWithConfiguration:v7];

      [(CLDurianDevice *)self enqueueTask:v8];
      goto LABEL_9;
    }
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v9 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      id v18 = "";
      __int16 v19 = 2113;
      id v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian skipping WildConfiguration due to low battery\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
  }
  id v8 = 0;
LABEL_9:
  if ([(CLDurianDevice *)self isHawkeyeAccessory])
  {
    id v11 = [objc_alloc((Class)CLFindMyAccessoryAbsoluteWildConfiguration) initWithDesiredNextKeyRollDate:v5 nextWildIndex:v6 + v3];
    [(CLDurianDevice *)self enqueueTask:+[CLDurianTask configureSeparatedStateHawkeyeTaskWithConfiguration:v11 currentIndex:v3]];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  __int16 v12 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    id v14 = [v8 performSelector:"configuration"];
    int v15 = 68290051;
    __int16 v17 = 2082;
    int v16 = 0;
    id v18 = "";
    __int16 v19 = 2113;
    id v20 = v13;
    __int16 v21 = 2049;
    uint64_t v22 = v3;
    __int16 v23 = 2049;
    uint64_t v24 = v6;
    __int16 v25 = 2113;
    id v26 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian aligning clock given current index\", \"item\":%{private, location:escape_only}@, \"currentIndex\":%{private}lu, \"keysRemaining\":%{private}lu, \"config\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x3Au);
  }
}

- (void)processNextTask:(id)a3
{
  if (self->_activeTask) {
    CFStringRef v5 = @"activetask";
  }
  else {
    CFStringRef v5 = 0;
  }
  unsigned int v6 = [(CLDurianDevice *)self isConnected];
  CFStringRef v7 = @"notconnected";
  if (v6) {
    CFStringRef v7 = v5;
  }
  if (!self->_activePeripheralReady) {
    CFStringRef v7 = @"periphnotready";
  }
  if (self->_firmwareUpdateReboot) {
    CFStringRef v8 = @"fwdlreboot";
  }
  else {
    CFStringRef v8 = v7;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  id v9 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    uint64_t buf = 68289795;
    __int16 v33 = 2082;
    unsigned int v34 = "";
    __int16 v35 = 2113;
    id v36 = v10;
    __int16 v37 = 2114;
    id v38 = a3;
    __int16 v39 = 2114;
    CFStringRef v40 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian processNextTask\", \"item\":%{private, location:escape_only}@, \"from\":%{public, location:escape_only}@, \"skip\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x30u);
  }
  if (!v8)
  {
    char v12 = 0;
    if (objc_msgSend(-[NSMutableArray firstObject](self->_pendingTasks, "firstObject"), "isCancelled"))
    {
      *(void *)&long long v11 = 68289539;
      long long v26 = v11;
      do
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
        id v13 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
          id v15 = [(NSMutableArray *)self->_pendingTasks firstObject];
          uint64_t buf = v26;
          __int16 v33 = 2082;
          unsigned int v34 = "";
          __int16 v35 = 2113;
          id v36 = v14;
          __int16 v37 = 2113;
          id v38 = v15;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian skipping cancelled task\", \"item\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
        }
        unsigned int v16 = [[objc_msgSend(-[NSMutableArray firstObject](self->_pendingTasks, "firstObject", v26), "command") opcode];
        [(NSMutableArray *)self->_pendingTasks removeObjectAtIndex:0];
        [(CLDurianDevice *)self logTaskCounts:@"cancelled"];
        if (v16 == 2053 || v16 == 6) {
          char v12 = 1;
        }
      }
      while ([self->_pendingTasks firstObject].isCancelled);
    }
    if ([(NSMutableArray *)self->_pendingTasks count])
    {
      if ([(NSMutableArray *)self->_preemptedTasks count])
      {
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        preemptedTasks = self->_preemptedTasks;
        id v19 = [(NSMutableArray *)preemptedTasks countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v28;
          while (2)
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v28 != v21) {
                objc_enumerationMutation(preemptedTasks);
              }
              __int16 v23 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              if ((objc_msgSend(-[NSMutableArray firstObject](self->_pendingTasks, "firstObject"), "shouldPreemptTask:", v23) & 1) == 0)
              {
                if (qword_102419390 != -1) {
                  dispatch_once(&qword_102419390, &stru_102332198);
                }
                uint64_t v24 = qword_102419398;
                if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
                {
                  id v25 = [[self->_uuid description] substringToIndex:8];
                  uint64_t buf = 68289539;
                  __int16 v33 = 2082;
                  unsigned int v34 = "";
                  __int16 v35 = 2113;
                  id v36 = v25;
                  __int16 v37 = 2114;
                  id v38 = v23;
                  _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian ongoing task cannot be preempted by next task\", \"item\":%{private, location:escape_only}@, \"ongoingTask\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
                }
                return;
              }
            }
            id v20 = [(NSMutableArray *)preemptedTasks countByEnumeratingWithState:&v27 objects:v31 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }
      }
      [(CLDurianDevice *)self setActiveTask:[(NSMutableArray *)self->_pendingTasks objectAtIndex:0]];
      [(CLDurianDevice *)self executeTask:[(CLDurianDevice *)self activeTask]];
    }
    if (v12) {
      [(CLDurianDevice *)self releaseMutexWithReason:@"TaskCancelled"];
    }
  }
}

- (void)processAcknowledgedTask
{
  self->_activeTaskAcknowledged = 1;
  [(CLDurianDeviceDelegate *)[(CLDurianDevice *)self delegate] device:self didAcknowledgeCommandForTask:[(CLDurianDevice *)self activeTask]];
  int v3 = [(CLDurianTask *)self->_activeTask translatedOpcode];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  double v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    int v10 = 68289539;
    int v11 = 0;
    __int16 v12 = 2082;
    id v13 = "";
    __int16 v14 = 2113;
    id v15 = v5;
    __int16 v16 = 1026;
    int v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian processAcknowledged\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v10, 0x22u);
  }
  if (v3 <= 769)
  {
    if (v3 != 40 && v3 != 175) {
      goto LABEL_19;
    }
LABEL_15:
    self->_isPlayingSound = 1;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    CFStringRef v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      int v10 = 68289539;
      int v11 = 0;
      __int16 v12 = 2082;
      id v13 = "";
      __int16 v14 = 2113;
      id v15 = v9;
      __int16 v16 = 1026;
      int v17 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian isPlayingSound\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v10, 0x22u);
    }
    goto LABEL_19;
  }
  if (v3 == 2061) {
    goto LABEL_15;
  }
  if (v3 != 770)
  {
LABEL_19:
    if ((v3 & 0xFFFFF7FF) == 3) {
      self->_isRanging = 1;
    }
    if (v3 == 527)
    {
      self->_btFindingState = 2;
      if (self->_pendingSoundTask)
      {
        -[CLDurianDevice enqueueTask:](self, "enqueueTask:");
        self->_pendingSoundTask = 0;
      }
    }
    return;
  }
  self->_isPlayingSound = 1;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  unsigned int v6 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    int v10 = 68289539;
    int v11 = 0;
    __int16 v12 = 2082;
    id v13 = "";
    __int16 v14 = 2113;
    id v15 = v7;
    __int16 v16 = 1026;
    int v17 = 770;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut isPlayingSound\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v10, 0x22u);
  }
}

- (void)processCompletedTask
{
  int v3 = [(CLDurianTask *)self->_activeTask translatedOpcode];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  double v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    int v8 = 68289539;
    int v9 = 0;
    __int16 v10 = 2082;
    int v11 = "";
    __int16 v12 = 2113;
    id v13 = v5;
    __int16 v14 = 1026;
    int v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian processCompleted\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v8, 0x22u);
  }
  if (v3 > 767)
  {
    if (v3 == 768)
    {
LABEL_9:
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      unsigned int v6 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        int v8 = 68289539;
        int v9 = 0;
        __int16 v10 = 2082;
        int v11 = "";
        __int16 v12 = 2113;
        id v13 = v7;
        __int16 v14 = 1026;
        int v15 = v3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut isPlayingSound completed\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v8, 0x22u);
      }
      goto LABEL_15;
    }
    if (v3 != 2061)
    {
      if (v3 != 794) {
        goto LABEL_16;
      }
      goto LABEL_9;
    }
LABEL_15:
    self->_isPlayingSound = 0;
    goto LABEL_16;
  }
  if (v3 == 40 || v3 == 175) {
    goto LABEL_15;
  }
LABEL_16:
  if ((v3 & 0xFFFFF7FF) == 3) {
    self->_isRanging = 0;
  }
  if ((v3 - 527) < 2 || v3 == 772) {
    self->_btFindingState = 0;
  }
}

- (void)completeCurrentTask
{
  if (self->_activeTask)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    int v3 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      unsigned int v5 = [(CLDurianCommand *)[(CLDurianTask *)self->_activeTask command] opcode];
      id v6 = [(CLDurianTask *)self->_activeTask opcodeDescription];
      v7[0] = 68289795;
      v7[1] = 0;
      __int16 v8 = 2082;
      int v9 = "";
      __int16 v10 = 2113;
      id v11 = v4;
      __int16 v12 = 1026;
      unsigned int v13 = v5;
      __int16 v14 = 2113;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian completing task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"task\":%{private, location:escape_only}@}", (uint8_t *)v7, 0x2Cu);
    }
    [(CLDurianDevice *)self cancelTimeoutForTask:self->_activeTask dictionary:self->_activeTaskTimeouts];
    [(NSMutableArray *)self->_pendingTasks removeObject:self->_activeTask];
    [(CLDurianDevice *)self logTaskCounts:@"completed"];
    [(CLDurianDevice *)self processCompletedTask];
    [(CLDurianTask *)self->_activeTask complete];
    [(CLDurianDevice *)self setActiveTask:0];
  }
  self->_activeTaskAcknowledged = 0;
  [(CLDurianDevice *)self processNextTask:@"completeCurrentTask"];
  if ([(CLDurianDevice *)self isTaskQueueEmpty])
  {
    if (![(CLDurianDevice *)self isLeashSlotInUse] && self->_maintenanceOnlyCondition) {
      [(CLDurianDevice *)self requestDisconnection:@"MaintenanceComplete"];
    }
    if (self->_preparingForRanging) {
      [(CLDurianDevice *)self checkPrepareRanging];
    }
    if ([(CLDurianDevice *)self isTAAISDevice]) {
      [(CLDurianDevice *)self requestDisconnection:@"AISFetchComplete"];
    }
  }
}

- (BOOL)isTaskQueueEmpty
{
  return !self->_activeTask
      && ![(NSMutableArray *)self->_pendingTasks count]
      && [(NSMutableArray *)self->_preemptedTasks count] == 0;
}

- (void)failedToSendBytes:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  unsigned int v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
  {
    id v6 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    id v7 = [[objc_msgSend(-[CBPeripheral identifier](self->_activePeripheral, "identifier"), "description") substringToIndex:8];
    int v11 = 68289795;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2113;
    id v16 = v6;
    __int16 v17 = 2113;
    id v18 = v7;
    __int16 v19 = 2113;
    id v20 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian failed to send bytes\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"byteCount\":%{private, location:escape_only}@}", (uint8_t *)&v11, 0x30u);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
  }
  __int16 v8 = qword_102419398;
  if (os_signpost_enabled((os_log_t)qword_102419398))
  {
    id v9 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    id v10 = [[objc_msgSend(-[CBPeripheral identifier](self->_activePeripheral, "identifier"), "description") substringToIndex:8];
    int v11 = 68289795;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2113;
    id v16 = v9;
    __int16 v17 = 2113;
    id v18 = v10;
    __int16 v19 = 2113;
    id v20 = a3;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian failed to send bytes", "{\"msg%{public}.0s\":\"#durian failed to send bytes\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"byteCount\":%{private, location:escape_only}@}", (uint8_t *)&v11, 0x30u);
  }
  [(CLDurianDevice *)self transitionToState:4 event:8 task:[(CLDurianDevice *)self activeTask]];
  [(CLDurianDeviceDelegate *)[(CLDurianDevice *)self delegate] device:self didFailToCompleteTask:[(CLDurianDevice *)self activeTask] withError:4 andDisconnect:1];
  [(CLDurianDevice *)self completeCurrentTask];
}

- (void)didReceiveData:(id)a3
{
  if ([a3 length])
  {
    [a3 bytes];
    -[CLDurianDevice handleDurianData:opcode:ackOpcode:](self, "handleDurianData:opcode:ackOpcode:", a3);
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    unsigned int v5 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      id v6 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      int v9 = 68289283;
      int v10 = 0;
      __int16 v11 = 2082;
      int v12 = "";
      __int16 v13 = 2113;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian received airtag data too short\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v9, 0x1Cu);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
    }
    id v7 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      id v8 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      int v9 = 68289283;
      int v10 = 0;
      __int16 v11 = 2082;
      int v12 = "";
      __int16 v13 = 2113;
      id v14 = v8;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian received airtag data too short", "{\"msg%{public}.0s\":\"#durian received airtag data too short\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v9, 0x1Cu);
    }
  }
}

- (void)handleDurianData:(id)a3 opcode:(unsigned __int16)a4 ackOpcode:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  BOOL isMultiConnectionEnabled = self->_isMultiConnectionEnabled;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  int v10 = &qword_102419000;
  __int16 v11 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    uint64_t buf = 68290051;
    __int16 v98 = 2082;
    v99 = "";
    __int16 v100 = 2113;
    id v101 = v12;
    __int16 v102 = 1026;
    *(_DWORD *)v103 = v6;
    *(_WORD *)&v103[4] = 1026;
    *(_DWORD *)&v103[6] = v5;
    *(_WORD *)v104 = 2113;
    *(void *)&v104[2] = a3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian received data\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"acked opcode\":%{public}d, \"data\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x32u);
  }
  if ([(CLDurianDevice *)self isNackTask:v6])
  {
    unsigned int v13 = [(CLDurianCommand *)[(CLDurianTask *)self->_activeTask command] opcode];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v14 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      unsigned int v16 = [(CLDurianCommand *)[(CLDurianTask *)[(CLDurianDevice *)self activeTask] command] opcode];
      id v17 = [[+[CLDurianVersionNumberUtilities getStringFromNumber:](CLDurianVersionNumberUtilities, "getStringFromNumber:", -[CLDurianDevice buildNumber](self, "buildNumber")) UTF8String];
      uint64_t buf = 68290307;
      __int16 v98 = 2082;
      v99 = "";
      __int16 v100 = 2113;
      id v101 = v15;
      __int16 v102 = 1026;
      *(_DWORD *)v103 = v5;
      *(_WORD *)&v103[4] = 1026;
      *(_DWORD *)&v103[6] = v16;
      *(_WORD *)v104 = 2082;
      *(void *)&v104[2] = v17;
      __int16 v105 = 2113;
      id v106 = a3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian received nack\", \"item\":%{private, location:escape_only}@, \"nack opcode\":%{public}d, \"active opcode\":%{public}d, \"version\":%{public, location:escape_only}s, \"data\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x3Cu);
    }
    activeTask = self->_activeTask;
    if (!activeTask || v13 != v5) {
      goto LABEL_142;
    }
    unsigned int v19 = [(CLDurianTask *)activeTask isMutexProtectedRangingTask];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v20 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      uint64_t buf = 68289795;
      __int16 v98 = 2082;
      v99 = "";
      __int16 v100 = 2113;
      id v101 = v21;
      __int16 v102 = 1026;
      *(_DWORD *)v103 = v13;
      *(_WORD *)&v103[4] = 1026;
      *(_DWORD *)&v103[6] = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian handle nack\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"rangeProtected\":%{public}d}", (uint8_t *)&buf, 0x28u);
    }
    if (v19) {
      uint64_t v22 = 12;
    }
    else {
      uint64_t v22 = 1;
    }
    [(CLDurianDeviceDelegate *)[(CLDurianDevice *)self delegate] device:self didFailToCompleteTask:self->_activeTask withError:v22 andDisconnect:0];
    goto LABEL_141;
  }
  if ([(CLDurianDevice *)self isAckTask:v6]
    && [(CLDurianDevice *)self isActiveTaskOpcode:v5])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    __int16 v23 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      uint64_t buf = 68289539;
      __int16 v98 = 2082;
      v99 = "";
      __int16 v100 = 2113;
      id v101 = v24;
      __int16 v102 = 1026;
      *(_DWORD *)v103 = v5;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian received ack for active task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&buf, 0x22u);
    }
    [(CLDurianDevice *)self processAcknowledgedTask];
    unsigned int v25 = [(CLDurianTask *)[(CLDurianDevice *)self activeTask] expectsResponse];
    long long v26 = [(CLDurianDevice *)self activeTask];
    if (v25)
    {
      [(CLDurianDevice *)self transitionToState:6 event:12 task:v26];
      if (!objc_msgSend(-[NSMutableArray firstObject](self->_pendingTasks, "firstObject"), "shouldPreemptTask:", -[CLDurianDevice activeTask](self, "activeTask")))
      {
        char v53 = 0;
LABEL_95:
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(CBPeripheral *)self->_activePeripheral readValueForCharacteristic:[(CLDurianTask *)[(CLDurianDevice *)self activeTask] characteristic]];
        }
        if ([(CLDurianDevice *)self isSetMaxConnectionsTask:v5])
        {
          self->_BOOL isMultiConnectionEnabled = self->_lastMaxConnectionsSent > 1u;
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102332198);
          }
          __int16 v55 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
          {
            id v56 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
            int lastMaxConnectionsSent = self->_lastMaxConnectionsSent;
            BOOL v58 = self->_isMultiConnectionEnabled;
            uint64_t buf = 68289795;
            __int16 v98 = 2082;
            v99 = "";
            __int16 v100 = 2113;
            id v101 = v56;
            __int16 v102 = 1026;
            *(_DWORD *)v103 = lastMaxConnectionsSent;
            *(_WORD *)&v103[4] = 1025;
            *(_DWORD *)&v103[6] = v58;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #multi setmax\", \"item\":%{private, location:escape_only}@, \"sent\":%{public}d, \"enabled\":%{private}d}", (uint8_t *)&buf, 0x28u);
          }
          self->_int lastMaxConnectionsSent = 0;
        }
        if ((v53 & 1) == 0) {
          goto LABEL_142;
        }
        goto LABEL_141;
      }
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      long long v27 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        id v29 = [(NSMutableArray *)self->_pendingTasks firstObject];
        long long v30 = [(CLDurianDevice *)self activeTask];
        uint64_t buf = 68289795;
        __int16 v98 = 2082;
        v99 = "";
        __int16 v100 = 2113;
        id v101 = v28;
        __int16 v102 = 2113;
        *(void *)v103 = v29;
        *(_WORD *)&v103[8] = 2113;
        *(void *)v104 = v30;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian received data, enqueuing preempted task\", \"item\":%{private, location:escape_only}@, \"pendingTask\":%{private, location:escape_only}@, \"activeTask\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);
      }
      [(NSMutableArray *)self->_preemptedTasks addObject:[(CLDurianDevice *)self activeTask]];
      [(CLDurianDevice *)self schedulePreemptedTaskTimeout:10 forTask:[(CLDurianDevice *)self activeTask]];
      [(CLDurianDevice *)self logTaskCounts:@"ackcheck"];
    }
    else
    {
      [(CLDurianDevice *)self transitionToState:4 event:12 task:v26];
      [(CLDurianDeviceDelegate *)[(CLDurianDevice *)self delegate] device:self didCompleteTask:[(CLDurianDevice *)self activeTask] withCompletionCommand:0];
    }
    char v53 = 1;
    goto LABEL_95;
  }
  if (![(CLDurianTask *)[(CLDurianDevice *)self activeTask] expectsResponse]
    || ![(CLDurianDevice *)self isActiveTaskOpcode:v6]
    && ![(CLDurianDevice *)self isEndpointTask:v6])
  {
    if ([(CLDurianDevice *)self isRangingSessionTask:v6])
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      long long v42 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v43 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        uint64_t buf = 68289539;
        __int16 v98 = 2082;
        v99 = "";
        __int16 v100 = 2113;
        id v101 = v43;
        __int16 v102 = 1026;
        *(_DWORD *)v103 = v6;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian received ranging session data\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&buf, 0x22u);
      }
      id v44 = [[CLDurianCommand alloc] initWithData:a3];
      [(CLDurianDeviceDelegate *)[(CLDurianDevice *)self delegate] device:self didReceiveRangingResponse:v44 withOpcode:v6];
LABEL_72:

      goto LABEL_73;
    }
    if ([(CLDurianDevice *)self isSoundCompleteTask:v6])
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      NSErrorUserInfoKey v50 = qword_102419398;
      if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_73;
      }
      id v51 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      uint64_t buf = 68289283;
      __int16 v98 = 2082;
      v99 = "";
      __int16 v100 = 2113;
      id v101 = v51;
      v52 = "{\"msg%{public}.0s\":\"#durian received sound session response\", \"item\":%{private, location:escape_only}@}";
    }
    else
    {
      if ([(CLDurianDevice *)self isFirmwareVersionCrashTask:v6])
      {
        [(CLDurianDevice *)self activeTask];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v54 = [(CLDurianDevice *)self activeTask];
          if ([(CLDurianDevice *)self isNordicCrashTask:v6])
          {
            [(CLDurianTask *)v54 appendNordicCrashData:a3];
          }
          else if ([(CLDurianDevice *)self isR1CrashTask:v6])
          {
            [(CLDurianTask *)v54 appendRoseCrashData:a3];
          }
          goto LABEL_73;
        }
      }
      if ([(CLDurianDevice *)self isGroupStatusResponse:v6])
      {
        [(CLDurianDevice *)self handleGroupStatusReply:a3];
        goto LABEL_73;
      }
      if ([(CLDurianDevice *)self isKeyRollTask:v6])
      {
        [(CLDurianDevice *)self handleKeyRollData:a3];
        if (!self->_firmwareUpdateMode && self->_leashState == 3)
        {
          if ([(CLDurianDevice *)self isAirTag]) {
            [(CLDurianDevice *)self enqueueTask:+[CLDurianTask rollWildKeyTask]];
          }
          if ([(CLDurianDevice *)self isHawkeyeAccessory])
          {
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102332198);
            }
            v73 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v74 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
              uint64_t buf = 68289283;
              __int16 v98 = 2082;
              v99 = "";
              __int16 v100 = 2113;
              id v101 = v74;
              _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye rollWildKey\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
            }
            [(CLDurianDevice *)self enqueueTask:+[CLDurianTask latchSeparatedKeyHawkeyeTask]];
          }
        }
        goto LABEL_73;
      }
      if (!self->_isMultiConnectionEnabled) {
        goto LABEL_182;
      }
      if ([(CLDurianDevice *)self isMutexTask:v6])
      {
        id v44 = [[CLDurianCommand alloc] initWithData:a3];
        v75 = [(NSData *)[(CLDurianCommand *)v44 payload] bytes];
        int v76 = *v75;
        int v77 = v75[1];
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
        v78 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
        {
          id v79 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
          unint64_t mutexState = self->_mutexState;
          uint64_t buf = 68290051;
          __int16 v98 = 2082;
          v99 = "";
          __int16 v100 = 2113;
          id v101 = v79;
          __int16 v102 = 1025;
          *(_DWORD *)v103 = v76;
          *(_WORD *)&v103[4] = 1025;
          *(_DWORD *)&v103[6] = v77;
          *(_WORD *)v104 = 1025;
          *(_DWORD *)&v104[2] = mutexState;
          _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #mutex outside response\", \"item\":%{private, location:escape_only}@, \"mutexAction\":%{private}d, \"mutexResponse\":%{private}d, \"prior mutexState\":%{private}d}", (uint8_t *)&buf, 0x2Eu);
        }
        if (!(v76 | v77)) {
          [(CLDurianDevice *)self setMutexState:0];
        }
        goto LABEL_72;
      }
      if (!self->_isMultiConnectionEnabled || ![(CLDurianDevice *)self isFwdlAbortTask:v5])
      {
LABEL_182:
        if ([(NSMutableArray *)self->_preemptedTasks count])
        {
          int v45 = 0;
          BOOL v59 = isMultiConnectionEnabled;
LABEL_114:
          BOOL v90 = v59;
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102332198);
          }
          int v60 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id v61 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
            unsigned int v62 = [(NSMutableArray *)self->_preemptedTasks count];
            uint64_t buf = 68289795;
            __int16 v98 = 2082;
            v99 = "";
            __int16 v100 = 2113;
            id v101 = v61;
            __int16 v102 = 1026;
            *(_DWORD *)v103 = v62;
            *(_WORD *)&v103[4] = 1026;
            *(_DWORD *)&v103[6] = v6;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian preemption check\", \"item\":%{private, location:escape_only}@, \"queue\":%{public}d, \"opcode\":%{public}d}", (uint8_t *)&buf, 0x28u);
          }
          long long v94 = 0u;
          long long v95 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          obj = self->_preemptedTasks;
          id v63 = [(NSMutableArray *)obj countByEnumeratingWithState:&v92 objects:v96 count:16];
          if (v63)
          {
            id v64 = v63;
            uint64_t v65 = *(void *)v93;
            unsigned int v88 = v5;
            int v89 = v45;
LABEL_120:
            v66 = 0;
            while (1)
            {
              if (*(void *)v93 != v65) {
                objc_enumerationMutation(obj);
              }
              v67 = *(void **)(*((void *)&v92 + 1) + 8 * (void)v66);
              unsigned int v68 = [objc_msgSend(v67, "command") opcode];
              if (qword_102419390 != -1) {
                dispatch_once(&qword_102419390, &stru_102332198);
              }
              v69 = v10;
              v70 = v10[115];
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
              {
                id v71 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
                uint64_t buf = 68289539;
                __int16 v98 = 2082;
                v99 = "";
                __int16 v100 = 2113;
                id v101 = v71;
                __int16 v102 = 1026;
                *(_DWORD *)v103 = v68;
                _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian preempted opcode\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&buf, 0x22u);
              }
              if (objc_msgSend(objc_msgSend(v67, "command"), "opcode") == v6
                || [(CLDurianDevice *)self isSoundCompleteTask:v6]
                || [(CLDurianDevice *)self isAggAdvCompleteTask:v6]
                || -[CLDurianDevice isRangingStartTask:](self, "isRangingStartTask:", objc_msgSend(objc_msgSend(v67, "command"), "opcode"))&& -[CLDurianDevice isRangingCompleteTask:](self, "isRangingCompleteTask:", v6)|| -[CLDurianDevice isNonOwnerSoundCompleteTask:](self, "isNonOwnerSoundCompleteTask:", v6))
              {
                break;
              }
              v66 = (char *)v66 + 1;
              int v10 = v69;
              if (v64 == v66)
              {
                id v64 = [(NSMutableArray *)obj countByEnumeratingWithState:&v92 objects:v96 count:16];
                uint64_t v5 = v88;
                int v45 = v89;
                if (v64) {
                  goto LABEL_120;
                }
                goto LABEL_135;
              }
            }
            v72 = [[CLDurianCommand alloc] initWithData:a3];
            [(CLDurianDeviceDelegate *)[(CLDurianDevice *)self delegate] device:self didCompleteTask:v67 withCompletionCommand:v72];

            [(CLDurianDevice *)self cancelTimeoutForTask:v67 dictionary:self->_preemptedTaskTimeouts];
            [(NSMutableArray *)self->_preemptedTasks removeObject:v67];
            [(CLDurianDevice *)self logTaskCounts:@"preemptdone"];
            [(CLDurianDevice *)self processNextTask:@"didReceiveData"];
            if (self->_preparingForRanging) {
              [(CLDurianDevice *)self checkPrepareRanging];
            }
            if ((v89 & 1) == 0) {
              goto LABEL_142;
            }
            goto LABEL_141;
          }
LABEL_135:
          if (!v90)
          {
            if (!v45) {
              goto LABEL_142;
            }
            goto LABEL_141;
          }
LABEL_75:
          unsigned int v46 = [(CLDurianDevice *)self isAckTask:v6];
          long long v47 = [(CLDurianDevice *)self delegate];
          if (v46)
          {
            uint64_t v48 = v5;
            uint64_t v49 = 1;
          }
          else
          {
            uint64_t v48 = v6;
            uint64_t v49 = 0;
          }
          [(CLDurianDeviceDelegate *)v47 device:self checkForEchoOfOpcode:v48 fromAck:v49];
          if ((v45 & 1) == 0) {
            goto LABEL_142;
          }
          goto LABEL_141;
        }
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
        v82 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
        {
          id v83 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
          BOOL v84 = self->_isMultiConnectionEnabled;
          uint64_t buf = 68290051;
          __int16 v98 = 2082;
          v99 = "";
          __int16 v100 = 2113;
          id v101 = v83;
          __int16 v102 = 1026;
          *(_DWORD *)v103 = v6;
          *(_WORD *)&v103[4] = 1026;
          *(_DWORD *)&v103[6] = v84;
          *(_WORD *)v104 = 2113;
          *(void *)&v104[2] = a3;
          _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian received unexpected data\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"multi\":%{public}d, \"data\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x32u);
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102332198);
          }
        }
        v85 = qword_102419398;
        if (os_signpost_enabled((os_log_t)qword_102419398))
        {
          id v86 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
          BOOL v87 = self->_isMultiConnectionEnabled;
          uint64_t buf = 68290051;
          __int16 v98 = 2082;
          v99 = "";
          __int16 v100 = 2113;
          id v101 = v86;
          __int16 v102 = 1026;
          *(_DWORD *)v103 = v6;
          *(_WORD *)&v103[4] = 1026;
          *(_DWORD *)&v103[6] = v87;
          *(_WORD *)v104 = 2113;
          *(void *)&v104[2] = a3;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v85, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian received unexpected data", "{\"msg%{public}.0s\":\"#durian received unexpected data\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"multi\":%{public}d, \"data\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x32u);
        }
LABEL_73:
        if (!isMultiConnectionEnabled)
        {
LABEL_142:
          [(CLDurianDevice *)self logTaskCounts:@"handled"];
          return;
        }
        LOBYTE(v45) = 0;
        goto LABEL_75;
      }
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      NSErrorUserInfoKey v50 = qword_102419398;
      if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_73;
      }
      id v81 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      uint64_t buf = 68289283;
      __int16 v98 = 2082;
      v99 = "";
      __int16 v100 = 2113;
      id v101 = v81;
      v52 = "{\"msg%{public}.0s\":\"#durian #multi outside fwdlabort\", \"item\":%{private, location:escape_only}@}";
    }
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, v52, (uint8_t *)&buf, 0x1Cu);
    goto LABEL_73;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  int v31 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v32 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    uint64_t buf = 68289539;
    __int16 v98 = 2082;
    v99 = "";
    __int16 v100 = 2113;
    id v101 = v32;
    __int16 v102 = 1026;
    *(_DWORD *)v103 = v6;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian received response for active task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&buf, 0x22u);
  }
  [(CLDurianDevice *)self transitionToState:4 event:13 task:[(CLDurianDevice *)self activeTask]];
  __int16 v33 = [[CLDurianCommand alloc] initWithData:a3];
  if (![(CLDurianDevice *)self isUserStatsV2Opcode:v6]
    || (unsigned int v34 = [(CLDurianDevice *)self activeTask],
        [(CLDurianTask *)v34 appendUserStatsData:[(CLDurianCommand *)v33 payload]],
        [(CLDurianTask *)v34 isComplete]))
  {
    if ([(CLDurianDevice *)self isMultiStatusResponse:v6])
    {
      if ([(CLDurianDevice *)self isAirTag]) {
        [(CLDurianDevice *)self handleMultiStatusReply:*(unsigned __int8 *)[(NSData *)[(CLDurianCommand *)v33 payload] bytes]];
      }
      if ([(CLDurianDevice *)self isHawkeyeAccessory]) {
        -[CLDurianDevice handleMultiStatusReply:](self, "handleMultiStatusReply:", *((unsigned __int8 *)[a3 bytes] + 3));
      }
    }
    if ([(CLDurianDevice *)self isGroupStatusResponse:v6]
      && [(CLDurianDevice *)self isHawkeyeAccessory])
    {
      [(CLDurianDevice *)self handleGroupStatusReply:a3];
    }
    unsigned int v35 = [(CLDurianDevice *)self isHawkeyeAccessory];
    if (v6 == 526 && v35)
    {
      unsigned int v36 = *(_DWORD *)((char *)[a3 bytes] + 3);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      __int16 v37 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v38 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        unsigned int lastObservedIndex = self->_lastObservedIndex;
        uint64_t buf = 68289795;
        __int16 v98 = 2082;
        v99 = "";
        __int16 v100 = 2113;
        id v101 = v38;
        __int16 v102 = 1025;
        *(_DWORD *)v103 = v36;
        *(_WORD *)&v103[4] = 1025;
        *(_DWORD *)&v103[6] = lastObservedIndex;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian received latched index\", \"item\":%{private, location:escape_only}@, \"response\":%{private}d, \"prior lastObserved\":%{private}d}", (uint8_t *)&buf, 0x28u);
      }
      self->_unsigned int lastObservedIndex = v36;
    }
    unsigned int v40 = [(CLDurianDevice *)self isPoshAccessory];
    if (v6 == 771) {
      int v41 = v40;
    }
    else {
      int v41 = 0;
    }
    if (![(CLDurianDevice *)self isHawkeyeAccessory]) {
      goto LABEL_108;
    }
    if ((int)v6 <= 770)
    {
      if (v6 != 525 && v6 != 532) {
        goto LABEL_108;
      }
    }
    else if (v6 != 771 && v6 != 1803 && v6 != 1800)
    {
      goto LABEL_108;
    }
    int v41 = 1;
LABEL_108:
    if ([(CLDurianDevice *)self isAirTag] && (v6 - 2056) <= 6 && ((1 << (v6 - 8)) & 0x49) != 0)
    {
      [(CLDurianDeviceDelegate *)[(CLDurianDevice *)self delegate] device:self didCompleteTask:[(CLDurianDevice *)self activeTask] withCompletionCommand:v33];
    }
    else
    {
      [(CLDurianDeviceDelegate *)[(CLDurianDevice *)self delegate] device:self didCompleteTask:[(CLDurianDevice *)self activeTask] withCompletionCommand:v33];

      if (!v41)
      {
LABEL_141:
        [(CLDurianDevice *)self completeCurrentTask];
        goto LABEL_142;
      }
    }
    BOOL v59 = 0;
    int v45 = 1;
    goto LABEL_114;
  }
}

- (void)handleInvalidData:(int64_t)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  uint64_t v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
  {
    id v6 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    int v12 = 68289539;
    int v13 = 0;
    __int16 v14 = 2082;
    id v15 = "";
    __int16 v16 = 2113;
    id v17 = v6;
    __int16 v18 = 2113;
    CFStringRef v19 = sub_101640864(a3);
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye invalid data\", \"item\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x26u);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
  }
  id v7 = qword_102419398;
  if (os_signpost_enabled((os_log_t)qword_102419398))
  {
    id v8 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    CFStringRef v9 = sub_101640864(a3);
    int v12 = 68289539;
    int v13 = 0;
    __int16 v14 = 2082;
    id v15 = "";
    __int16 v16 = 2113;
    id v17 = v8;
    __int16 v18 = 2113;
    CFStringRef v19 = v9;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye invalid data", "{\"msg%{public}.0s\":\"#durian #hawkeye invalid data\", \"item\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x26u);
  }
  activeTask = self->_activeTask;
  delegate = self->_delegate;
  if (activeTask) {
    [(CLDurianDeviceDelegate *)delegate device:self didFailToCompleteTask:activeTask withError:a3 andDisconnect:1];
  }
  else {
    [(CLDurianDeviceDelegate *)delegate device:self didReceiveInvalidDataWithError:a3];
  }
}

- (BOOL)checkPoshDataValidity:(id)a3
{
  if ((unint64_t)[a3 length] > 1)
  {
    int v7 = *(unsigned __int16 *)[a3 bytes];
    if ((v7 - 2051) >= 0xA && (v7 - 770) >= 2 && v7 != 1029)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      CFStringRef v9 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        BOOL isMultiConnectionEnabled = self->_isMultiConnectionEnabled;
        int v19 = 68289795;
        int v20 = 0;
        __int16 v21 = 2082;
        uint64_t v22 = "";
        __int16 v23 = 2113;
        id v24 = v10;
        __int16 v25 = 1025;
        int v26 = v7;
        __int16 v27 = 1026;
        unsigned int v28 = isMultiConnectionEnabled;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut invalid opcode\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"multi\":%{public}d}", (uint8_t *)&v19, 0x28u);
      }
    }
    if (v7 > 2050)
    {
      unsigned int v8 = 10;
      switch(v7)
      {
        case 2051:
        case 2054:
          goto LABEL_28;
        case 2052:
        case 2053:
          unsigned int v12 = 66;
          goto LABEL_20;
        case 2055:
        case 2056:
        case 2058:
          goto LABEL_17;
        case 2057:
        case 2059:
        case 2060:
          unsigned int v8 = 3;
          goto LABEL_28;
        default:
          goto LABEL_23;
      }
    }
    switch(v7)
    {
      case 770:
LABEL_17:
        unsigned int v8 = 6;
        break;
      case 771:
        unsigned int v12 = 4;
        goto LABEL_20;
      case 1029:
        unsigned int v12 = 0x7FFFFFFF;
LABEL_20:
        if ((unint64_t)[a3 length] < 2 || (unint64_t)objc_msgSend(a3, "length") > v12)
        {
          unsigned int v8 = 2;
LABEL_31:
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102332198);
          }
          __int16 v16 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
            unsigned int v18 = [a3 length];
            int v19 = 68290307;
            int v20 = 0;
            __int16 v21 = 2082;
            uint64_t v22 = "";
            __int16 v23 = 2113;
            id v24 = v17;
            __int16 v25 = 1026;
            int v26 = v7;
            __int16 v27 = 1026;
            unsigned int v28 = v18;
            __int16 v29 = 1026;
            unsigned int v30 = v8;
            __int16 v31 = 1026;
            unsigned int v32 = v12;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh unexpected length\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"datalen\":%{public}d, \"expected\":%{public}d, \"max\":%{public}d}", (uint8_t *)&v19, 0x34u);
          }
          uint64_t v5 = self;
          uint64_t v6 = 21;
          goto LABEL_36;
        }
        return 1;
      default:
LABEL_23:
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
        int v13 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
          int v19 = 68289539;
          int v20 = 0;
          __int16 v21 = 2082;
          uint64_t v22 = "";
          __int16 v23 = 2113;
          id v24 = v14;
          __int16 v25 = 1026;
          int v26 = v7;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut unspecified opcode for length check\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v19, 0x22u);
        }
        unsigned int v8 = 2;
        break;
    }
LABEL_28:
    if ([a3 length] != (id)v8)
    {
      unsigned int v12 = 0;
      goto LABEL_31;
    }
    return 1;
  }
  uint64_t v5 = self;
  uint64_t v6 = 25;
LABEL_36:
  [(CLDurianDevice *)v5 handleInvalidData:v6];
  return 0;
}

- (BOOL)checkHawkeyeDataValidity:(id)a3
{
  if ((unint64_t)[a3 length] <= 2)
  {
    uint64_t v5 = self;
    uint64_t v6 = 25;
LABEL_56:
    [(CLDurianDevice *)v5 handleInvalidData:v6];
    return 0;
  }
  int v7 = *(unsigned __int16 *)((char *)[a3 bytes] + 1);
  if (v7 <= 0x501)
  {
    if ((v7 - 770) > 0x17 || ((1 << (v7 - 2)) & 0xFFC003) == 0)
    {
      BOOL v9 = (v7 - 522) > 0x1E || ((1 << (v7 - 10)) & 0x5300051F) == 0;
      if (v9 && ((v7 - 1026) > 4 || v7 == 1028)) {
        goto LABEL_59;
      }
    }
LABEL_28:
    BOOL result = 1;
    unsigned int v13 = 7;
    if (v7 > 1025)
    {
      if (v7 > 2047)
      {
        switch(v7)
        {
          case 2048:
          case 2054:
          case 2055:
          case 2058:
          case 2059:
            goto LABEL_48;
          case 2056:
LABEL_44:
            unsigned int v13 = 8;
            goto LABEL_48;
          case 2057:
LABEL_45:
            unsigned int v13 = 23;
            goto LABEL_48;
          case 2060:
          case 2062:
LABEL_36:
            unsigned int v13 = 3;
            goto LABEL_48;
          default:
            goto LABEL_67;
        }
      }
      if (v7 > 1281)
      {
        switch(v7)
        {
          case 1792:
          case 1798:
          case 1799:
          case 1802:
          case 1803:
            goto LABEL_48;
          case 1793:
          case 1794:
          case 1795:
          case 1796:
          case 1797:
            goto LABEL_67;
          case 1800:
            goto LABEL_44;
          case 1801:
            goto LABEL_45;
          case 1804:
            goto LABEL_36;
          default:
            if (v7 == 1282) {
              return result;
            }
            if (v7 == 1283) {
              goto LABEL_48;
            }
            goto LABEL_67;
        }
      }
      if ((v7 - 1026) < 2 || v7 == 1029) {
        return result;
      }
      if (v7 != 1030)
      {
LABEL_67:
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
        __int16 v21 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
        {
          id v22 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
          int v25 = 68289539;
          int v26 = 0;
          __int16 v27 = 2082;
          unsigned int v28 = "";
          __int16 v29 = 2113;
          id v30 = v22;
          __int16 v31 = 1026;
          int v32 = v7;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye unspecified opcode for length check\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v25, 0x22u);
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102332198);
          }
        }
        __int16 v23 = qword_102419398;
        if (os_signpost_enabled((os_log_t)qword_102419398))
        {
          id v24 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
          int v25 = 68289539;
          int v26 = 0;
          __int16 v27 = 2082;
          unsigned int v28 = "";
          __int16 v29 = 2113;
          id v30 = v24;
          __int16 v31 = 1026;
          int v32 = v7;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye unspecified opcode for length check", "{\"msg%{public}.0s\":\"#durian #hawkeye unspecified opcode for length check\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v25, 0x22u);
        }
        return 1;
      }
    }
    else
    {
      if (v7 > 551)
      {
        switch(v7)
        {
          case 770:
            goto LABEL_48;
          case 771:
            goto LABEL_36;
          case 772:
          case 773:
          case 774:
          case 775:
          case 776:
          case 777:
          case 778:
          case 779:
          case 780:
          case 781:
          case 782:
          case 783:
            goto LABEL_67;
          case 784:
            goto LABEL_43;
          case 785:
          case 786:
          case 787:
          case 788:
          case 789:
          case 790:
          case 791:
          case 792:
          case 793:
            return result;
          default:
            if (v7 != 552) {
              goto LABEL_67;
            }
            if ((unint64_t)[a3 length] >= 4 && (unint64_t)objc_msgSend(a3, "length") <= 5) {
              return 1;
            }
            unsigned int v13 = 4;
            int v14 = 5;
            break;
        }
        goto LABEL_51;
      }
      switch(v7)
      {
        case 522:
        case 523:
        case 524:
        case 526:
          break;
        case 525:
        case 532:
          goto LABEL_36;
        case 527:
        case 528:
        case 529:
        case 531:
          goto LABEL_67;
        case 530:
          goto LABEL_43;
        default:
          if ((v7 - 546) < 2) {
            break;
          }
          if (v7 != 550) {
            goto LABEL_67;
          }
LABEL_43:
          unsigned int v13 = 4;
          break;
      }
    }
LABEL_48:
    if ([a3 length] != (id)v13)
    {
      int v14 = 0;
LABEL_51:
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      id v15 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        int v25 = 68290307;
        int v26 = 0;
        __int16 v27 = 2082;
        unsigned int v28 = "";
        __int16 v29 = 2113;
        id v30 = v16;
        __int16 v31 = 1026;
        int v32 = v7;
        __int16 v33 = 1026;
        unsigned int v34 = [a3 length];
        __int16 v35 = 1026;
        unsigned int v36 = v13;
        __int16 v37 = 1026;
        int v38 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye unexpected length\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"datalen\":%{public}d, \"expected\":%{public}d, \"max\":%{public}d}", (uint8_t *)&v25, 0x34u);
      }
      uint64_t v5 = self;
      uint64_t v6 = 21;
      goto LABEL_56;
    }
    return 1;
  }
  if ((v7 - 2048) <= 0xE && ((1 << v7) & 0x5FC1) != 0) {
    goto LABEL_28;
  }
  BOOL v11 = (v7 - 1792) > 0xC || ((1 << v7) & 0x1FC1) == 0;
  if (!v11 || (v7 - 1282) < 2) {
    goto LABEL_28;
  }
LABEL_59:
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  id v17 = qword_102419398;
  BOOL v18 = os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v18)
  {
    id v19 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    BOOL isMultiConnectionEnabled = self->_isMultiConnectionEnabled;
    int v25 = 68289795;
    int v26 = 0;
    __int16 v27 = 2082;
    unsigned int v28 = "";
    __int16 v29 = 2113;
    id v30 = v19;
    __int16 v31 = 1025;
    int v32 = v7;
    __int16 v33 = 1026;
    unsigned int v34 = isMultiConnectionEnabled;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye invalid opcode\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"multi\":%{public}d}", (uint8_t *)&v25, 0x28u);
    return 0;
  }
  return result;
}

- (BOOL)supportsFragmentationForOpcode:(unsigned __int16)a3
{
  int v3 = self;
  LOBYTE(self) = 1;
  if ((a3 - 1026) > 3 || a3 == 1028)
  {
    int v5 = a3;
    if (a3 != 1282)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      uint64_t v6 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
      {
        id v7 = [[-[NSUUID description](v3->_uuid, "description") substringToIndex:8];
        int v11 = 68289539;
        int v12 = 0;
        __int16 v13 = 2082;
        int v14 = "";
        __int16 v15 = 2113;
        id v16 = v7;
        __int16 v17 = 1026;
        int v18 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye fragmentation not supported for opcode\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v11, 0x22u);
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
      }
      unsigned int v8 = qword_102419398;
      LODWORD(self) = os_signpost_enabled((os_log_t)qword_102419398);
      if (self)
      {
        id v9 = [[-[NSUUID description](v3->_uuid, "description") substringToIndex:8];
        int v11 = 68289539;
        int v12 = 0;
        __int16 v13 = 2082;
        int v14 = "";
        __int16 v15 = 2113;
        id v16 = v9;
        __int16 v17 = 1026;
        int v18 = v5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye fragmentation not supported for opcode", "{\"msg%{public}.0s\":\"#durian #hawkeye fragmentation not supported for opcode\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v11, 0x22u);
        LOBYTE(self) = 0;
      }
    }
  }
  return (char)self;
}

- (BOOL)isPoshOptionalOpcode:(unsigned __int16)a3
{
  return (a3 - 11) < 2;
}

- (void)didReceivePoshData:(id)a3 withCharacteristic:(id)a4 error:(id)a5
{
  if (a5)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v7 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      int v29 = 68289539;
      int v30 = 0;
      __int16 v31 = 2082;
      int v32 = "";
      __int16 v33 = 2113;
      id v34 = v8;
      __int16 v35 = 2113;
      *(void *)unsigned int v36 = a5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh didReceivePoshData error\", \"item\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v29, 0x26u);
    }
LABEL_6:
    [(CLDurianDevice *)self handleInvalidData:1];
    return;
  }
  if ([a3 length])
  {
    id v10 = [(CLDurianDevice *)self activeTask];
    int v11 = v10;
    if (v10
      && ([(CLDurianTask *)v10 conformsToProtocol:&OBJC_PROTOCOL___CLGATTTaskInformationProtocol] & 1) == 0)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      id v19 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_FAULT))
      {
        id v20 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        int v29 = 68289283;
        int v30 = 0;
        __int16 v31 = 2082;
        int v32 = "";
        __int16 v33 = 2113;
        id v34 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian #posh trying to handle new data but current active task doesn't conform to CLGATTTaskInformationProtocol\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v29, 0x1Cu);
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
      }
      __int16 v21 = qword_102419398;
      if (os_signpost_enabled((os_log_t)qword_102419398))
      {
        id v22 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        int v29 = 68289283;
        int v30 = 0;
        __int16 v31 = 2082;
        int v32 = "";
        __int16 v33 = 2113;
        id v34 = v22;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #posh trying to handle new data but current active task doesn't conform to CLGATTTaskInformationProtocol", "{\"msg%{public}.0s\":\"#durian #posh trying to handle new data but current active task doesn't conform to CLGATTTaskInformationProtocol\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v29, 0x1Cu);
      }
      goto LABEL_6;
    }
    int v12 = (unsigned __int16 *)[a3 bytes];
    uint64_t v13 = *v12;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    int v14 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      int v29 = 68290307;
      int v30 = 0;
      __int16 v31 = 2082;
      int v32 = "";
      __int16 v33 = 2113;
      id v34 = v15;
      __int16 v35 = 2113;
      *(void *)unsigned int v36 = a3;
      *(_WORD *)&v36[8] = 1026;
      *(_DWORD *)__int16 v37 = v13;
      *(_WORD *)&v37[4] = 2114;
      uint64_t v38 = [(CLDurianTask *)[(CLDurianDevice *)self activeTask] opcodeDescription];
      LOWORD(v39[0]) = 1026;
      *(_DWORD *)((char *)v39 + 2) = [(CLDurianTask *)v11 expectsResponse];
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh didReceivePoshData\", \"item\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"active\":%{public, location:escape_only}@, \"expectsResponse\":%{public}d}", (uint8_t *)&v29, 0x3Cu);
    }
    if ([(CLDurianDevice *)self checkPoshDataValidity:a3])
    {
      if (v13 == 770)
      {
        uint64_t v16 = v12[1];
        int v17 = v12[2];
        if (v17)
        {
          uint64_t v18 = 28;
          switch(v17)
          {
            case 1:
              switch(v16)
              {
                case 0x31A:
                  goto LABEL_22;
                case 0x301:
                  [(CLDurianTask *)v11 setExpectsResponse:0];
                  uint64_t v18 = 24;
                  break;
                case 0x300:
LABEL_22:
                  [(CLDurianTask *)v11 setExpectsResponse:0];
                  uint64_t v18 = 23;
                  break;
                default:
                  uint64_t v18 = 27;
                  break;
              }
LABEL_41:
              [(CLDurianDevice *)self isPoshOptionalOpcode:v16];
LABEL_42:
              if (qword_102419390 != -1) {
                dispatch_once(&qword_102419390, &stru_102332198);
              }
              int v25 = qword_102419398;
              if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
              {
                id v26 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
                int v29 = 68290563;
                int v30 = 0;
                __int16 v31 = 2082;
                int v32 = "";
                __int16 v33 = 2113;
                id v34 = v26;
                __int16 v35 = 1026;
                *(_DWORD *)unsigned int v36 = v16;
                *(_WORD *)&v36[4] = 1026;
                *(_DWORD *)&v36[6] = v17;
                *(_WORD *)__int16 v37 = 1026;
                *(_DWORD *)&v37[2] = v18;
                uint64_t v38 = 0x402000000010402;
                v39[0] = ((unsigned __int16)(v17 + 1) < 6u) & (0x31u >> (v17 + 1));
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh response error\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"response\":%{public}d, \"error\":%{public}d, \"fail\":%{public}hhd, \"disconnect\":%{public}hhd}", (uint8_t *)&v29, 0x3Au);
              }
              [(CLDurianDeviceDelegate *)self->_delegate device:self didFailToCompleteTask:self->_activeTask withError:v18 andDisconnect:((unsigned __int16)(v17 + 1) < 6u) & (0x31u >> (v17 + 1))];
              break;
            case 2:
              goto LABEL_41;
            case 3:
              uint64_t v18 = 29;
              goto LABEL_41;
            case 4:
              uint64_t v18 = 30;
              goto LABEL_41;
            default:
              unsigned int v27 = [(CLDurianDevice *)self isPoshOptionalOpcode:v16];
              if (v17 == 0xFFFF) {
                uint64_t v18 = 31;
              }
              else {
                uint64_t v18 = 1;
              }
              if (v17 != 0xFFFF || !v27) {
                goto LABEL_42;
              }
              unsigned int v28 = [[CLDurianCommand alloc] initWithData:a3];
              [(CLDurianDeviceDelegate *)[(CLDurianDevice *)self delegate] device:self didCompleteTask:[(CLDurianDevice *)self activeTask] withCompletionCommand:v28];

              break;
          }
          [(CLDurianDevice *)self completeCurrentTask];
          return;
        }
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
        __int16 v23 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
        {
          id v24 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
          int v29 = 68289795;
          int v30 = 0;
          __int16 v31 = 2082;
          int v32 = "";
          __int16 v33 = 2113;
          id v34 = v24;
          __int16 v35 = 1026;
          *(_DWORD *)unsigned int v36 = v16;
          *(_WORD *)&v36[4] = 1026;
          *(_DWORD *)&v36[6] = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh command response\", \"item\":%{private, location:escape_only}@, \"acked opcode\":%{public}d, \"response\":%{public}d}", (uint8_t *)&v29, 0x28u);
        }
      }
      else
      {
        uint64_t v16 = 0;
      }
      [(CLDurianDevice *)self handleDurianData:a3 opcode:v13 ackOpcode:v16];
    }
  }
  else
  {
    [(CLDurianDevice *)self handleInvalidData:25];
  }
}

- (void)didReceiveHawkeyeData:(id)a3 withCharacteristic:(id)a4 error:(id)a5
{
  if (a5)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v7 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      int v62 = 68289539;
      int v63 = 0;
      __int16 v64 = 2082;
      uint64_t v65 = "";
      __int16 v66 = 2113;
      id v67 = v8;
      __int16 v68 = 2113;
      *(void *)v69 = a5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didReceiveHawkeyeData error\", \"item\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v62, 0x26u);
    }
LABEL_6:
    id v9 = self;
    uint64_t v10 = 1;
LABEL_7:
    [(CLDurianDevice *)v9 handleInvalidData:v10];
    return;
  }
  int v12 = (NSMutableData *)a3;
  if (![a3 length]) {
    goto LABEL_54;
  }
  uint64_t v13 = [(CLDurianDevice *)self activeTask];
  int v14 = v13;
  if (!v13) {
    goto LABEL_14;
  }
  if (([(CLDurianTask *)v13 conformsToProtocol:&OBJC_PROTOCOL___CLGATTTaskInformationProtocol] & 1) == 0)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v22 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_FAULT))
    {
      id v23 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      int v62 = 68289283;
      int v63 = 0;
      __int16 v64 = 2082;
      uint64_t v65 = "";
      __int16 v66 = 2113;
      id v67 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye trying to handle new data but current active task doesn't conform to CLGATTTaskInformationProtocol\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v62, 0x1Cu);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
    }
    id v24 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      id v25 = [[self->_uuid description] substringToIndex:8];
      int v62 = 68289283;
      int v63 = 0;
      __int16 v64 = 2082;
      uint64_t v65 = "";
      __int16 v66 = 2113;
      id v67 = v25;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye trying to handle new data but current active task doesn't conform to CLGATTTaskInformationProtocol", "{\"msg%{public}.0s\":\"#durian #hawkeye trying to handle new data but current active task doesn't conform to CLGATTTaskInformationProtocol\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v62, 0x1Cu);
    }
    goto LABEL_6;
  }
  if ([v14 serviceUUID].isEqual:[a4 service].UUID])unsigned __int8 v15 = [v14 characteristicUUID].isEqual:[a4 UUID]; {
  else
  }
LABEL_14:
    unsigned __int8 v15 = 0;
  uint64_t v16 = (unsigned __int8 *)[(NSMutableData *)v12 bytes];
  int v17 = *v16;
  if (!*v16)
  {
    if ((v15 & 1) == 0)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      __int16 v35 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_FAULT))
      {
        id v36 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        int v62 = 68290307;
        int v63 = 0;
        __int16 v64 = 2082;
        uint64_t v65 = "";
        __int16 v66 = 2113;
        id v67 = v36;
        __int16 v68 = 2113;
        *(void *)v69 = [objc_msgSend(a4, "service") UUID];
        *(_WORD *)&v69[8] = 2113;
        *(void *)v70 = [a4 UUID];
        *(_WORD *)&v70[8] = 2113;
        *(void *)&v70[10] = [(CLDurianTask *)v14 serviceUUID];
        *(_WORD *)&v70[18] = 2113;
        id v71 = [(CLDurianTask *)v14 characteristicUUID];
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye encountering simultaneous streaming fragments, aborting as CL cannot handle it\", \"item\":%{private, location:escape_only}@, \"incomingServiceUUID\":%{private, location:escape_only}@, \"incomingCharacteristicUUID\":%{private, location:escape_only}@, \"activeServiceUUID\":%{private, location:escape_only}@, \"activeCharacteristicUUID\":%{private, location:escape_only}@}", (uint8_t *)&v62, 0x44u);
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
      }
      __int16 v37 = qword_102419398;
      if (os_signpost_enabled((os_log_t)qword_102419398))
      {
        id v38 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        id v39 = [objc_msgSend(a4, "service") UUID];
        id v40 = [a4 UUID];
        id v41 = [(CLDurianTask *)v14 serviceUUID];
        id v42 = [(CLDurianTask *)v14 characteristicUUID];
        int v62 = 68290307;
        int v63 = 0;
        __int16 v64 = 2082;
        uint64_t v65 = "";
        __int16 v66 = 2113;
        id v67 = v38;
        __int16 v68 = 2113;
        *(void *)v69 = v39;
        *(_WORD *)&v69[8] = 2113;
        *(void *)v70 = v40;
        *(_WORD *)&v70[8] = 2113;
        *(void *)&v70[10] = v41;
        *(_WORD *)&v70[18] = 2113;
        id v71 = v42;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye encountering simultaneous streaming fragments, aborting as CL cannot handle it", "{\"msg%{public}.0s\":\"#durian #hawkeye encountering simultaneous streaming fragments, aborting as CL cannot handle it\", \"item\":%{private, location:escape_only}@, \"incomingServiceUUID\":%{private, location:escape_only}@, \"incomingCharacteristicUUID\":%{private, location:escape_only}@, \"activeServiceUUID\":%{private, location:escape_only}@, \"activeCharacteristicUUID\":%{private, location:escape_only}@}", (uint8_t *)&v62, 0x44u);
      }
      id v9 = self;
      uint64_t v10 = 26;
      goto LABEL_7;
    }
    int fragmentedOpcode = self->_fragmentedOpcode;
    unsigned int v27 = [(NSMutableData *)v12 length];
    if (fragmentedOpcode)
    {
      unsigned int v28 = v27 - 1;
      int v29 = v12;
      uint64_t v30 = 1;
      goto LABEL_32;
    }
    if ((unint64_t)v27 > 2)
    {
      unsigned __int16 v54 = *(_WORD *)(v16 + 1);
      if (![(CLDurianDevice *)self supportsFragmentationForOpcode:v54])
      {
        id v43 = self;
        uint64_t v44 = 32;
        goto LABEL_55;
      }
      self->_int fragmentedOpcode = v54;
      unsigned int v28 = (char *)[(NSMutableData *)v12 length] - 3;
      int v29 = v12;
      uint64_t v30 = 3;
LABEL_32:
      id v31 = -[NSMutableData subdataWithRange:](v29, "subdataWithRange:", v30, v28);
      delegate = self->_delegate;
      [(CLDurianDeviceDelegate *)delegate device:self didReceiveHawkeyeDataFragment:v31 duringActiveTask:v14];
      return;
    }
LABEL_54:
    id v43 = self;
    uint64_t v44 = 25;
LABEL_55:
    [(CLDurianDevice *)v43 handleInvalidData:v44];
    return;
  }
  if (v17 != 1)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    __int16 v33 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v34 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      int v62 = 68289539;
      int v63 = 0;
      __int16 v64 = 2082;
      uint64_t v65 = "";
      __int16 v66 = 2113;
      id v67 = v34;
      __int16 v68 = 1025;
      *(_DWORD *)v69 = v17;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye unexpected fragmentation\", \"item\":%{private, location:escape_only}@, \"fragementStatus\":%{private}d}", (uint8_t *)&v62, 0x22u);
    }
    return;
  }
  unsigned __int16 v18 = self->_fragmentedOpcode;
  if (v18) {
    unsigned __int8 v19 = v15;
  }
  else {
    unsigned __int8 v19 = 0;
  }
  id v20 = [(NSMutableData *)v12 length];
  if (v19)
  {
    id v21 = -[NSMutableData subdataWithRange:](v12, "subdataWithRange:", 1, v20 - 1);
    LOBYTE(v62) = *v16;
    *(_WORD *)((char *)&v62 + 1) = self->_fragmentedOpcode;
    int v12 = +[NSMutableData dataWithBytes:&v62 length:3];
    [(NSMutableData *)v12 appendData:v21];
    uint64_t v16 = (unsigned __int8 *)[(NSMutableData *)v12 bytes];
    self->_int fragmentedOpcode = 0;
    goto LABEL_41;
  }
  if ((unint64_t)v20 <= 2) {
    goto LABEL_54;
  }
  unsigned __int16 v18 = *(_WORD *)(v16 + 1);
LABEL_41:
  if ([(CLDurianDevice *)self hawkeyeTestMode])
  {
    if (*(_WORD *)(v16 + 1) == 522)
    {
      if ([(CLDurianDevice *)self hawkeyeTestMode] == 5)
      {
        v16[1] = rand();
        v16[2] = rand();
      }
      else if ([(CLDurianDevice *)self hawkeyeTestMode] == 6)
      {
        *uint64_t v16 = 1;
      }
    }
    if ([(CLDurianDevice *)self hawkeyeTestMode] == 4) {
      v16[5] = 2;
    }
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  int v45 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v46 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    id v47 = [(CLDurianTask *)[(CLDurianDevice *)self activeTask] opcodeDescription];
    unsigned int v48 = [(CLDurianTask *)v14 expectsResponse];
    int v62 = 68290307;
    int v63 = 0;
    __int16 v64 = 2082;
    uint64_t v65 = "";
    __int16 v66 = 2113;
    id v67 = v46;
    __int16 v68 = 2113;
    *(void *)v69 = v12;
    *(_WORD *)&v69[8] = 1026;
    *(_DWORD *)v70 = v18;
    *(_WORD *)&v70[4] = 2114;
    *(void *)&v70[6] = v47;
    *(_WORD *)&v70[14] = 1026;
    *(_DWORD *)&v70[16] = v48;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didReceiveHawkeyeData\", \"item\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"active\":%{public, location:escape_only}@, \"expectsResponse\":%{public}d}", (uint8_t *)&v62, 0x3Cu);
  }
  if ([(CLDurianDevice *)self checkHawkeyeDataValidity:v12])
  {
    id v49 = 0;
    if (v18 > 0x502u)
    {
      if (v18 != 1283 && v18 != 2048 && v18 != 1792) {
        goto LABEL_84;
      }
    }
    else if (v18 != 523 && v18 != 770 && v18 != 1030)
    {
LABEL_84:
      [(CLDurianDevice *)self handleDurianData:v12 opcode:v18 ackOpcode:v49];
      return;
    }
    id v49 = (id)*(unsigned __int16 *)(v16 + 3);
    unsigned int v50 = *(unsigned __int16 *)(v16 + 5);
    if (!*(_WORD *)(v16 + 5))
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      v52 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v53 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        int v62 = 68289795;
        int v63 = 0;
        __int16 v64 = 2082;
        uint64_t v65 = "";
        __int16 v66 = 2113;
        id v67 = v53;
        __int16 v68 = 1026;
        *(_DWORD *)v69 = v49;
        *(_WORD *)&v69[4] = 1026;
        *(_DWORD *)&v69[6] = 0;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye command response\", \"item\":%{private, location:escape_only}@, \"acked opcode\":%{public}d, \"response\":%{public}d}", (uint8_t *)&v62, 0x28u);
      }
      goto LABEL_84;
    }
    uint64_t v51 = 28;
    switch(*(_WORD *)(v16 + 5))
    {
      case 1:
        if ((v49 & 0xFFFFFEFF) == 0x201)
        {
          [(CLDurianTask *)v14 setExpectsResponse:0];
          uint64_t v51 = 24;
        }
        else if ((v49 & 0xFFFFFEFF) == 0x200)
        {
          [(CLDurianTask *)v14 setExpectsResponse:0];
          uint64_t v51 = 23;
        }
        else
        {
          uint64_t v51 = 27;
        }
        goto LABEL_100;
      case 2:
        goto LABEL_100;
      case 3:
        uint64_t v51 = 29;
        goto LABEL_100;
      case 4:
        uint64_t v51 = 30;
        goto LABEL_100;
      default:
        if (v50 == 0xFFFF)
        {
          if (v49 == 551)
          {
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102332198);
            }
            __int16 v55 = qword_102419398;
            if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v58 = 0;
              LODWORD(v49) = 551;
              int v59 = 1;
              uint64_t v51 = 31;
              goto LABEL_106;
            }
            id v56 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
            id v49 = [[-[NSUUID description](-[CLDurianDevice groupUuid](self, "groupUuid"), "description") substringToIndex:8];
            unsigned int v57 = [(CLDurianDevice *)self groupPartNumber];
            int v62 = 68289795;
            int v63 = 0;
            __int16 v64 = 2082;
            uint64_t v65 = "";
            __int16 v66 = 2113;
            id v67 = v56;
            __int16 v68 = 2113;
            *(void *)v69 = v49;
            *(_WORD *)&v69[8] = 1026;
            *(_DWORD *)v70 = v57;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye group status invalid\", \"item\":%{private, location:escape_only}@, \"group\":%{private, location:escape_only}@, \"part\":%{public}d}", (uint8_t *)&v62, 0x2Cu);
            uint64_t v58 = 0;
            int v59 = 1;
            LODWORD(v49) = 551;
            uint64_t v51 = 31;
LABEL_104:
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102332198);
            }
LABEL_106:
            int v60 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v61 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
              int v62 = 68290563;
              int v63 = 0;
              __int16 v64 = 2082;
              uint64_t v65 = "";
              __int16 v66 = 2113;
              id v67 = v61;
              __int16 v68 = 1026;
              *(_DWORD *)v69 = v49;
              *(_WORD *)&v69[4] = 1026;
              *(_DWORD *)&v69[6] = v50;
              *(_WORD *)v70 = 1026;
              *(_DWORD *)&v70[2] = v51;
              *(_WORD *)&v70[6] = 1026;
              *(_DWORD *)&v70[8] = v59;
              *(_WORD *)&v70[12] = 1026;
              *(_DWORD *)&v70[14] = v58;
              _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye response error\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"response\":%{public}d, \"error\":%{public}d, \"fail\":%{public}hhd, \"disconnect\":%{public}hhd}", (uint8_t *)&v62, 0x3Au);
            }
            if (v59) {
              [(CLDurianDeviceDelegate *)self->_delegate device:self didFailToCompleteTask:self->_activeTask withError:v51 andDisconnect:v58];
            }
            [(CLDurianDevice *)self completeCurrentTask];
            return;
          }
          uint64_t v51 = 31;
        }
        else
        {
          uint64_t v51 = 1;
        }
LABEL_100:
        uint64_t v58 = ((unsigned __int16)(v50 + 1) < 6u) & (0x31u >> (v50 + 1));
        int v59 = 1;
        if (v49 == 515 && v50 <= 4 && v50 != 3)
        {
          [(CLDurianDevice *)self enqueueTask:+[CLDurianTask setNearbyTimeoutHawkeyeTaskWithTimeout:3600 asHele:0]];
          int v59 = 0;
          LODWORD(v49) = 515;
        }
        goto LABEL_104;
    }
  }
}

- (void)requestDisconnection:(id)a3
{
  [(CLDurianDevice *)self setDisconnectionReason:a3];
  id v4 = [(CLDurianDevice *)self delegate];

  [(CLDurianDeviceDelegate *)v4 requestDisconnectionForDevice:self];
}

- (void)cancelConnectionTimeoutForPeripheral:(id)a3
{
  id v4 = [(CLDurianDevice *)self delegate];
  int v5 = [(CLDurianDevice *)self activePeripheral];

  [(CLDurianDeviceDelegate *)v4 cancelConnectionTimeoutForPeripheral:v5];
}

- (void)checkPrepareRanging
{
  if (![(CLDurianDevice *)self isCapableOfDynamicConnectionLatency])
  {
    id v5 = objc_alloc((Class)NSError);
    uint64_t v6 = kCLErrorDomainPrivate;
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    CFStringRef v27 = sub_101640864(0x26uLL);
    id v7 = [v5 initWithDomain:v6 code:38 userInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1)];
    [(CLDurianDeviceDelegate *)[(CLDurianDevice *)self delegate] device:self didPrepareForRangingWithError:v7];

    return;
  }
  unsigned int v3 = !+[CLDurianDevice isDurianConnectionLatency:0 lowerThan:self->_currentLatency];
  if ((v3 & 1) == 0)
  {
    [(CLDurianDevice *)self setDesiredConnectionLatency];
    unsigned int v4 = [(CLDurianDevice *)self isTaskQueueEmpty];
LABEL_8:
    BOOL v8 = 1;
    goto LABEL_9;
  }
  if (![(CLDurianDevice *)self isTaskQueueEmpty])
  {
    unsigned int v4 = 0;
    goto LABEL_8;
  }
  [(CLDurianDeviceDelegate *)[(CLDurianDevice *)self delegate] device:self didPrepareForRangingWithError:0];
  BOOL v8 = 0;
  unsigned int v4 = 1;
LABEL_9:
  self->_BOOL preparingForRanging = v8;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  id v9 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    BOOL preparingForRanging = self->_preparingForRanging;
    int64_t currentLatency = self->_currentLatency;
    v13[0] = 68290307;
    v13[1] = 0;
    __int16 v14 = 2082;
    unsigned __int8 v15 = "";
    __int16 v16 = 2113;
    id v17 = v10;
    __int16 v18 = 1026;
    BOOL v19 = preparingForRanging;
    __int16 v20 = 1026;
    int v21 = currentLatency;
    __int16 v22 = 1026;
    unsigned int v23 = v3;
    __int16 v24 = 1026;
    unsigned int v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian check prepare ranging\", \"item\":%{private, location:escape_only}@, \"preparing\":%{public}hhd, \"latency\":%{public}d, \"already\":%{public}hhd, \"emptyq\":%{public}hhd}", (uint8_t *)v13, 0x34u);
  }
}

- (void)setDesiredConnectionLatency
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  unsigned int v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = (NSUUID *)[self->_uuid description].substringToIndex:8];
    int64_t currentLatency = self->_currentLatency;
    *(_DWORD *)uint64_t buf = 68289539;
    int v37 = 0;
    __int16 v38 = 2082;
    id v39 = "";
    __int16 v40 = 2113;
    id v41 = v4;
    __int16 v42 = 1025;
    *(_DWORD *)id v43 = currentLatency;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian latency evaluation\", \"item\":%{private, location:escape_only}@, \"ci\":%{private}d}", buf, 0x22u);
  }
  if (!self->_activePeripheral)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    uint64_t v14 = qword_102419398;
    if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    unsigned __int8 v15 = (NSUUID *)[[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    *(_DWORD *)uint64_t buf = 68289283;
    int v37 = 0;
    __int16 v38 = 2082;
    id v39 = "";
    __int16 v40 = 2113;
    id v41 = v15;
    uint64_t v13 = "{\"msg%{public}.0s\":\"#durian #latency notactive\", \"item\":%{private, location:escape_only}@}";
    goto LABEL_26;
  }
  if (![(CLDurianDevice *)self isCapableOfDynamicConnectionLatency])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    uint64_t v14 = qword_102419398;
    if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    uuid = self->_uuid;
    *(_DWORD *)uint64_t buf = 68289283;
    int v37 = 0;
    __int16 v38 = 2082;
    id v39 = "";
    __int16 v40 = 2113;
    id v41 = uuid;
    uint64_t v13 = "{\"msg%{public}.0s\":\"#durian #latency notsupported\", \"device\":%{private, location:escape_only}@}";
LABEL_26:
    id v17 = v14;
    uint32_t v18 = 28;
    goto LABEL_27;
  }
  sub_10164083C();
  double v7 = v6;
  double v8 = (double)+[CLDurianDevice convertToMaxIntervalMsFromConnectionLatency:self->_currentLatency]* 20.0/ 1000.0+ 2.0;
  if (!self->_latencyCommandResponseArrived)
  {
    double commandedLatencyTime = self->_commandedLatencyTime;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    uint64_t v20 = qword_102419398;
    if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v21 = (NSUUID *)[[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    *(_DWORD *)uint64_t buf = 68289795;
    int v37 = 0;
    __int16 v38 = 2082;
    id v39 = "";
    __int16 v40 = 2113;
    id v41 = v21;
    __int16 v42 = 1026;
    *(_DWORD *)id v43 = (unint64_t)(v7 - commandedLatencyTime);
    *(_WORD *)&v43[4] = 2049;
    *(double *)&v43[6] = v8;
    uint64_t v13 = "{\"msg%{public}.0s\":\"#durian latency inprogress\", \"item\":%{private, location:escape_only}@, \"timeSinceRe"
          "quest\":%{public}d, \"waitTime\":\"%{private}.1f\"}";
    id v17 = v20;
    uint32_t v18 = 44;
LABEL_27:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v13, buf, v18);
    return;
  }
  int64_t v35 = -6;
  char v34 = 0;
  [(CLDurianDevice *)self determineCandidateLatency:&v35 forceCandidateLatency:&v34];
  if (!+[CLDurianDevice isDurianConnectionLatency:v35 lowerThan:self->_currentLatency]&& (v7 - self->_currentLatencyStartTime <= 29.0 ? (BOOL v9 = v34 == 0) : (BOOL v9 = 0), v9))
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    uint64_t v10 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      int64_t v32 = self->_currentLatency;
      *(_DWORD *)uint64_t buf = 68289795;
      int v37 = 0;
      __int16 v38 = 2082;
      id v39 = "";
      __int16 v40 = 2113;
      id v41 = v31;
      __int16 v42 = 1025;
      *(_DWORD *)id v43 = v32;
      *(_WORD *)&v43[4] = 1025;
      *(_DWORD *)&v43[6] = v35;
      uint64_t v13 = "{\"msg%{public}.0s\":\"#durian latency alreadylower\", \"item\":%{private, location:escape_only}@, \"current"
            "\":%{private}d, \"candidate\":%{private}d}";
      goto LABEL_42;
    }
  }
  else if (v35 == self->_currentLatency)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    uint64_t v10 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = (NSUUID *)[[self->_uuid description] substringToIndex:8];
      int64_t v12 = self->_currentLatency;
      *(_DWORD *)uint64_t buf = 68289795;
      int v37 = 0;
      __int16 v38 = 2082;
      id v39 = "";
      __int16 v40 = 2113;
      id v41 = v11;
      __int16 v42 = 1025;
      *(_DWORD *)id v43 = v12;
      *(_WORD *)&v43[4] = 1025;
      *(_DWORD *)&v43[6] = v35;
      uint64_t v13 = "{\"msg%{public}.0s\":\"#durian latency alreadyat\", \"item\":%{private, location:escape_only}@, \"current\":"
            "%{private}d, \"candidate\":%{private}d}";
LABEL_42:
      id v17 = v10;
      uint32_t v18 = 40;
      goto LABEL_27;
    }
  }
  else
  {
    centralManager = self->_centralManager;
    activePeripheral = self->_activePeripheral;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_101612FBC;
    v33[3] = &unk_1022B8750;
    v33[4] = self;
    [(CBCentralManager *)centralManager setDesiredConnectionLatency:v35 forPeripheral:activePeripheral completion:v33];
    self->_int64_t commandedLatency = v35;
    self->_double commandedLatencyTime = v7;
    self->_latencyCommandResponseArrived = 0;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    __int16 v24 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v25 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      id v26 = [(CBPeripheral *)self->_activePeripheral identifier];
      CFStringRef v27 = [(CLDurianDevice *)self activeTask];
      int64_t commandedLatency = self->_commandedLatency;
      int64_t v29 = self->_currentLatency;
      double v30 = v7 - self->_currentLatencyStartTime;
      *(_DWORD *)uint64_t buf = 68290819;
      int v37 = 0;
      __int16 v38 = 2082;
      id v39 = "";
      __int16 v40 = 2113;
      id v41 = v25;
      __int16 v42 = 2114;
      *(void *)id v43 = v26;
      *(_WORD *)&v43[8] = 2113;
      *(void *)&v43[10] = v27;
      __int16 v44 = 1025;
      int v45 = commandedLatency;
      __int16 v46 = 1025;
      int v47 = v29;
      __int16 v48 = 2049;
      double v49 = v8;
      __int16 v50 = 2049;
      double v51 = v30;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #latency request update\", \"item\":%{private, location:escape_only}@, \"peripheralUUID\":%{public, location:escape_only}@, \"task\":%{private, location:escape_only}@, \"commanded\":%{private}d, \"current\":%{private}d, \"timeout\":\"%{private}.1f\", \"delta\":\"%{private}.1f\"}", buf, 0x50u);
    }
    [(CLDurianDevice *)self scheduleLatencyTimeout:v8];
  }
}

- (void)determineCandidateLatency:(int64_t *)a3 forceCandidateLatency:(BOOL *)a4
{
  if (self->_firmwareUpdateMode)
  {
    *a3 = -7;
    return;
  }
  if (self->_preparingForRanging)
  {
    *a3 = 0;
LABEL_8:
    *a4 = 1;
    return;
  }
  if ([(CLDurianCommand *)[(CLDurianTask *)[(CLDurianDevice *)self activeTask] command] opcode] == 3|| [(CLDurianCommand *)[(CLDurianTask *)[(CLDurianDevice *)self activeTask] command] opcode] == 2051)
  {
    *a3 = [(CLDurianTask *)[(CLDurianDevice *)self activeTask] desiredLatency];
    goto LABEL_8;
  }
  int64_t v7 = -6;
  if (self->_isRoseInitialized) {
    int64_t v7 = 0;
  }
  *a3 = v7;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  pendingTasks = self->_pendingTasks;
  id v9 = [(NSMutableArray *)pendingTasks countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(pendingTasks);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (+[CLDurianDevice isDurianConnectionLatency:lowerThan:](CLDurianDevice, "isDurianConnectionLatency:lowerThan:", [v13 desiredLatency], *a3))
        {
          *a3 = (int64_t)[v13 desiredLatency];
        }
      }
      id v10 = [(NSMutableArray *)pendingTasks countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
  if (self->_maintenanceOnlyCondition && [(CLDurianDevice *)self isLeashSlotInUse] && *a3 == -6) {
    goto LABEL_8;
  }
}

- (void)scheduleLatencyTimeout:(double)a3
{
  if (self->_latencyTimeoutBlock)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    unsigned int v4 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      uuid = self->_uuid;
      *(_DWORD *)uint64_t buf = 68289283;
      int v12 = 0;
      __int16 v13 = 2082;
      long long v14 = "";
      __int16 v15 = 2113;
      long long v16 = uuid;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian latency concurrent timeouts\", \"device\":%{private, location:escape_only}@}", buf, 0x1Cu);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
    }
    double v6 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      int64_t v7 = self->_uuid;
      *(_DWORD *)uint64_t buf = 68289283;
      int v12 = 0;
      __int16 v13 = 2082;
      long long v14 = "";
      __int16 v15 = 2113;
      long long v16 = v7;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian latency concurrent timeouts", "{\"msg%{public}.0s\":\"#durian latency concurrent timeouts\", \"device\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
  }
  else
  {
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1016135E8;
    block[3] = &unk_10229FED8;
    block[4] = self;
    dispatch_block_t v9 = dispatch_block_create((dispatch_block_flags_t)0, block);
    self->_id latencyTimeoutBlock = v9;
    dispatch_after(v8, (dispatch_queue_t)self->_queue, v9);
  }
}

- (void)clearLatencyTimeoutAndCancel:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  id v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    BOOL v7 = self->_latencyTimeoutBlock != 0;
    v9[0] = 68289795;
    v9[1] = 0;
    __int16 v10 = 2082;
    uint64_t v11 = "";
    __int16 v12 = 2113;
    id v13 = v6;
    __int16 v14 = 1026;
    BOOL v15 = v3;
    __int16 v16 = 1026;
    BOOL v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian latency clear time out\", \"item\":%{private, location:escape_only}@, \"cancel\":%{public}hhd, \"block\":%{public}hhd}", (uint8_t *)v9, 0x28u);
  }
  id latencyTimeoutBlock = self->_latencyTimeoutBlock;
  if (latencyTimeoutBlock)
  {
    if (v3)
    {
      dispatch_block_cancel(latencyTimeoutBlock);
      id latencyTimeoutBlock = self->_latencyTimeoutBlock;
    }
    _Block_release(latencyTimeoutBlock);
    self->_id latencyTimeoutBlock = 0;
    self->_latencyCommandResponseArrived = 1;
  }
}

+ (int64_t)convertToLatencyFromConnectionInterval:(int)a3
{
  if (a3 == 15) {
    return -7;
  }
  if ((a3 - 10) < 0x15) {
    return 0;
  }
  if ((a3 - 100) < 0x15) {
    return 1;
  }
  if ((a3 - 970) < 0x1F) {
    return -6;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  id v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
  {
    int v7 = 68289283;
    int v8 = 0;
    __int16 v9 = 2082;
    __int16 v10 = "";
    __int16 v11 = 2049;
    uint64_t v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #latency unexpected ms\", \"intervalMs\":%{private}ld}", (uint8_t *)&v7, 0x1Cu);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
  }
  id v6 = qword_102419398;
  if (os_signpost_enabled((os_log_t)qword_102419398))
  {
    int v7 = 68289283;
    int v8 = 0;
    __int16 v9 = 2082;
    __int16 v10 = "";
    __int16 v11 = 2049;
    uint64_t v12 = a3;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #latency unexpected ms", "{\"msg%{public}.0s\":\"#durian #latency unexpected ms\", \"intervalMs\":%{private}ld}", (uint8_t *)&v7, 0x1Cu);
  }
  return -99;
}

+ (int)convertToMaxIntervalMsFromConnectionLatency:(int64_t)a3
{
  int64_t v4 = a3 + 7;
  if (unint64_t)(a3 + 7) < 9 && ((0x183u >> v4)) {
    return dword_101E31430[v4];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  id v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
  {
    int v8 = 68289282;
    int v9 = 0;
    __int16 v10 = 2082;
    __int16 v11 = "";
    __int16 v12 = 2050;
    int64_t v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #latency unexpected value\", \"latency\":%{public}ld}", (uint8_t *)&v8, 0x1Cu);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
  }
  id v6 = qword_102419398;
  if (os_signpost_enabled((os_log_t)qword_102419398))
  {
    int v8 = 68289282;
    int v9 = 0;
    __int16 v10 = 2082;
    __int16 v11 = "";
    __int16 v12 = 2050;
    int64_t v13 = a3;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #latency unexpected value", "{\"msg%{public}.0s\":\"#durian #latency unexpected value\", \"latency\":%{public}ld}", (uint8_t *)&v8, 0x1Cu);
  }
  return 1000;
}

- (void)didUpdateConnectionInterval:(id)a3 latency:(id)a4 supervisionTimeout:(id)a5
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  int v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    id v9 = [[objc_msgSend(-[CBPeripheral identifier](self->_activePeripheral, "identifier"), "description") substringToIndex:8];
    v11[0] = 68290051;
    v11[1] = 0;
    __int16 v12 = 2082;
    int64_t v13 = "";
    __int16 v14 = 2113;
    id v15 = v8;
    __int16 v16 = 2113;
    id v17 = v9;
    __int16 v18 = 2113;
    BOOL v19 = [(CLDurianDevice *)self activeTask];
    __int16 v20 = 2113;
    id v21 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #latency didUpdateConnectionInterval\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@, \"interval\":%{private, location:escape_only}@}", (uint8_t *)v11, 0x3Au);
  }
  self->_int64_t currentLatency = +[CLDurianDevice convertToLatencyFromConnectionInterval:](CLDurianDevice, "convertToLatencyFromConnectionInterval:", [a3 intValue]);
  sub_10164083C();
  self->_currentLatencyStartTime = v10;
  [(CLDurianDevice *)self clearLatencyTimeoutAndCancel:1];
  if (self->_preparingForRanging) {
    [(CLDurianDevice *)self checkPrepareRanging];
  }
  [(CLDurianDevice *)self setDesiredConnectionLatency];
}

- (void)didUpdateMTUForDevice
{
  self->_unint64_t maxPacketSizeForGATTWriteWithResponse = [(CBPeripheral *)self->_activePeripheral maximumWriteValueLengthForType:1];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  BOOL v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    unint64_t maxPacketSizeForGATTWriteWithResponse = self->_maxPacketSizeForGATTWriteWithResponse;
    v6[0] = 68289539;
    v6[1] = 0;
    __int16 v7 = 2082;
    id v8 = "";
    __int16 v9 = 2113;
    id v10 = v4;
    __int16 v11 = 2049;
    unint64_t v12 = maxPacketSizeForGATTWriteWithResponse;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian updating MTU size\", \"item\":%{private, location:escape_only}@, \"MTUSize\":%{private}lu}", (uint8_t *)v6, 0x26u);
  }
}

- (void)checkHelloMaintenanceTask:(id)a3
{
  unsigned int v5 = [a3 translatedOpcode];
  unsigned int v6 = v5;
  if ((v5 > 0x2B || ((1 << v5) & 0x88000009C81) == 0)
    && (v5 - 517 > 0x23 || ((1 << (v5 - 5)) & 0xE60100001) == 0)
    && (v5 - 177 > 0x29 || ((1 << (v5 + 79)) & 0x24000100011) == 0)
    && self->_maintenanceOnlyCondition)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    __int16 v7 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      v9[0] = 68289795;
      v9[1] = 0;
      __int16 v10 = 2082;
      __int16 v11 = "";
      __int16 v12 = 2113;
      id v13 = v8;
      __int16 v14 = 1026;
      unsigned int v15 = v6;
      __int16 v16 = 2113;
      id v17 = [a3 opcodeDescription];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint only disabled\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"task\":%{private, location:escape_only}@}", (uint8_t *)v9, 0x2Cu);
    }
    self->_unint64_t maintenanceOnlyCondition = 0;
  }
}

- (BOOL)preprocessTask:(id)a3
{
  unsigned int v5 = [objc_msgSend(a3, "command") opcode];
  unsigned int v6 = v5;
  if (v5 == 40)
  {
    int64_t btFindingState = self->_btFindingState;
    if (btFindingState == 1)
    {
      if (!self->_pendingSoundTask)
      {
        BOOL v7 = 0;
        self->_pendingSoundTask = (CLDurianTask *)a3;
        goto LABEL_11;
      }
    }
    else if (btFindingState == 2)
    {
      [(CLDurianDevice *)self enqueueTask:+[CLDurianTask stopAggressiveAdvertisingTask]];
    }
    goto LABEL_10;
  }
  if (v5 != 527)
  {
    LOBYTE(v7) = 1;
    return v7;
  }
  if (self->_btFindingState)
  {
LABEL_10:
    BOOL v7 = 1;
    goto LABEL_11;
  }
  BOOL v7 = 1;
  self->_int64_t btFindingState = 1;
LABEL_11:
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  __int16 v9 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    int64_t v11 = self->_btFindingState;
    BOOL v12 = self->_pendingSoundTask != 0;
    v14[0] = 68290307;
    v14[1] = 0;
    __int16 v15 = 2082;
    __int16 v16 = "";
    __int16 v17 = 2113;
    id v18 = v10;
    __int16 v19 = 1026;
    unsigned int v20 = v6;
    __int16 v21 = 1026;
    int v22 = v11;
    __int16 v23 = 1026;
    BOOL v24 = v12;
    __int16 v25 = 1026;
    BOOL v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian preprocessing task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"btfind\":%{public}d, \"pendingsound\":%{public}hhd, \"enqueue\":%{public}d}", (uint8_t *)v14, 0x34u);
  }
  return v7;
}

- (void)enqueueTask:(id)a3
{
  if (a3)
  {
    unsigned int v5 = [objc_msgSend(a3, "command") opcode];
    unsigned int v6 = [(CLDurianDevice *)self preprocessTask:a3];
    unsigned int v7 = [a3 shouldPreemptTask:-[CLDurianDevice activeTask](self, "activeTask")];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v9 = v7;
      id v10 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      id v11 = [a3 opcodeDescription];
      BOOL v12 = [(CLDurianDevice *)self activeTask] != 0;
      unsigned int v13 = [(NSMutableArray *)self->_pendingTasks count];
      uint64_t v33 = 68290819;
      *(_WORD *)char v34 = 2082;
      *(void *)&v34[2] = "";
      *(_WORD *)&v34[10] = 2113;
      *(void *)&v34[12] = v10;
      unsigned int v7 = v9;
      *(_WORD *)&v34[20] = 1026;
      *(_DWORD *)&v34[22] = v5;
      *(_WORD *)&v34[26] = 2113;
      *(void *)&v34[28] = v11;
      *(_WORD *)&v34[36] = 1026;
      *(_DWORD *)&v34[38] = v9;
      __int16 v35 = 1026;
      unsigned int v36 = v6;
      __int16 v37 = 1026;
      BOOL v38 = v12;
      __int16 v39 = 1025;
      unsigned int v40 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian enqueuing task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"task\":%{private, location:escape_only}@, \"preempt\":%{public}d, \"enqueue\":%{public}d, \"active\":%{public}hhd, \"length\":%{private}d}", (uint8_t *)&v33, 0x44u);
    }
    if (v6)
    {
      if (!v7)
      {
        [(NSMutableArray *)self->_pendingTasks addObject:a3];
LABEL_34:
        [(CLDurianDevice *)self logTaskCounts:@"enqueue"];
        if ([(CLDurianDevice *)self isAirTag] && self->_firmwareUpdateMode)
        {
          [(CLDurianDevice *)self preemptFirmwareUpdate];
        }
        else if ([(CLDurianDevice *)self activeTask] {
               && (self->_activeTaskAcknowledged ? (unsigned int v32 = v7) : (unsigned int v32 = 0), v32 == 1))
        }
        {
          [(CLDurianDevice *)self completeCurrentTask];
        }
        else
        {
          [(CLDurianDevice *)self processNextTask:@"enqueueTask"];
        }
        return;
      }
      if ([(CLDurianDevice *)self activeTask])
      {
        if ([(CLDurianTask *)[(CLDurianDevice *)self activeTask] shouldCompleteOnPreemptionByTask:a3])
        {
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102332198);
          }
          __int16 v14 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id v15 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
            __int16 v16 = [(CLDurianDevice *)self activeTask];
            uint64_t v33 = 68289539;
            *(_WORD *)char v34 = 2082;
            *(void *)&v34[2] = "";
            *(_WORD *)&v34[10] = 2113;
            *(void *)&v34[12] = v15;
            *(_WORD *)&v34[20] = 2113;
            *(void *)&v34[22] = v16;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian complete current active task on preemption\", \"item\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@}", (uint8_t *)&v33, 0x26u);
          }
          [(CLDurianDevice *)self completeCurrentTask];
        }
        else
        {
          if (self->_activeTaskAcknowledged)
          {
            [(NSMutableArray *)self->_preemptedTasks addObject:[(CLDurianDevice *)self activeTask]];
            [(CLDurianDevice *)self schedulePreemptedTaskTimeout:10 forTask:[(CLDurianDevice *)self activeTask]];
            [(CLDurianDevice *)self logTaskCounts:@"preempt"];
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102332198);
            }
            uint64_t v23 = qword_102419398;
            if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_33;
            }
            id v24 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
            __int16 v25 = [(CLDurianDevice *)self activeTask];
            uint64_t v33 = 68289539;
            *(_WORD *)char v34 = 2082;
            *(void *)&v34[2] = "";
            *(_WORD *)&v34[10] = 2113;
            *(void *)&v34[12] = v24;
            *(_WORD *)&v34[20] = 2113;
            *(void *)&v34[22] = v25;
            BOOL v26 = "{\"msg%{public}.0s\":\"#durian enqueuing preempted task\", \"item\":%{private, location:escape_only}@,"
                  " \"task\":%{private, location:escape_only}@}";
            CFStringRef v27 = v23;
            uint32_t v28 = 38;
          }
          else
          {
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102332198);
            }
            uint64_t v29 = qword_102419398;
            if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_33;
            }
            id v30 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
            id v31 = [(CLDurianDevice *)self activeTask];
            uint64_t v33 = 68289795;
            *(_WORD *)char v34 = 2082;
            *(void *)&v34[2] = "";
            *(_WORD *)&v34[10] = 2113;
            *(void *)&v34[12] = v30;
            *(_WORD *)&v34[20] = 2113;
            *(void *)&v34[22] = v31;
            *(_WORD *)&v34[30] = 2113;
            *(void *)&v34[32] = a3;
            BOOL v26 = "{\"msg%{public}.0s\":\"#durian task attempted preempt, but awaiting ack\", \"item\":%{private, locatio"
                  "n:escape_only}@, \"activetask\":%{private, location:escape_only}@, \"newtask\":%{private, location:escape_only}@}";
            CFStringRef v27 = v29;
            uint32_t v28 = 48;
          }
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v33, v28);
        }
      }
LABEL_33:
      -[NSMutableArray insertObject:atIndex:](self->_pendingTasks, "insertObject:atIndex:", a3, 0, v33, *(_OWORD *)v34, *(_OWORD *)&v34[16], *(void *)&v34[32]);
      goto LABEL_34;
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    __int16 v17 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      id v18 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      unsigned int v19 = [(NSMutableArray *)self->_pendingTasks count];
      uint64_t v33 = 68289539;
      *(_WORD *)char v34 = 2082;
      *(void *)&v34[2] = "";
      *(_WORD *)&v34[10] = 2113;
      *(void *)&v34[12] = v18;
      *(_WORD *)&v34[20] = 1025;
      *(_DWORD *)&v34[22] = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian enqueuing nil task not supported\", \"item\":%{private, location:escape_only}@, \"length\":%{private}d}", (uint8_t *)&v33, 0x22u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
    }
    unsigned int v20 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      id v21 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      unsigned int v22 = [(NSMutableArray *)self->_pendingTasks count];
      uint64_t v33 = 68289539;
      *(_WORD *)char v34 = 2082;
      *(void *)&v34[2] = "";
      *(_WORD *)&v34[10] = 2113;
      *(void *)&v34[12] = v21;
      *(_WORD *)&v34[20] = 1025;
      *(_DWORD *)&v34[22] = v22;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian enqueuing nil task not supported", "{\"msg%{public}.0s\":\"#durian enqueuing nil task not supported\", \"item\":%{private, location:escape_only}@, \"length\":%{private}d}", (uint8_t *)&v33, 0x22u);
    }
  }
}

- (void)schedulePreemptedTaskTimeout:(int64_t)a3 forTask:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1016149E8;
  v4[3] = &unk_10229FEB0;
  v4[4] = self;
  v4[5] = a4;
  -[CLDurianDevice scheduleTimeout:forTaskUuid:withBlock:dictionary:](self, "scheduleTimeout:forTaskUuid:withBlock:dictionary:", a3, [a4 uuid], dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v4), self->_preemptedTaskTimeouts);
}

- (void)scheduleActiveTaskTimeout:(int64_t)a3 forTask:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_101614C48;
  v4[3] = &unk_10229FEB0;
  v4[4] = self;
  v4[5] = a4;
  -[CLDurianDevice scheduleTimeout:forTaskUuid:withBlock:dictionary:](self, "scheduleTimeout:forTaskUuid:withBlock:dictionary:", a3, [a4 uuid], dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v4), self->_activeTaskTimeouts);
}

- (void)scheduleTimeout:(int64_t)a3 forTaskUuid:(id)a4 withBlock:(id)a5 dictionary:(id)a6
{
  dispatch_time_t v10 = dispatch_time(0, 1000000000 * a3);
  dispatch_after(v10, (dispatch_queue_t)self->_queue, a5);
  [a6 setObject:a5 forKey:a4];

  _Block_release(a5);
}

- (void)cancelTimeoutForTask:(id)a3 dictionary:(id)a4
{
  id v7 = [a4 objectForKey:[a3 uuid]];
  if (!v7) {
    sub_10161D57C((uint64_t)self);
  }
  dispatch_block_cancel(v7);
  id v8 = [a3 uuid];

  [a4 removeObjectForKey:v8];
}

- (void)executeTask:(id)a3
{
  -[CLDurianDevice checkHelloMaintenanceTask:](self, "checkHelloMaintenanceTask:");
  unsigned int v5 = [a3 command].opcode;
  id v6 = [a3 timeoutSeconds];
  char v7 = self->_currentLatency == -6;
  [(CLDurianDevice *)self setDesiredConnectionLatency];
  [a3 willStart];
  id v8 = [objc_msgSend(a3, "command") bytes];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = [a3 hawkeyePayload];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = [a3 characteristicPayload];
  }
  uint64_t v9 = (void)v6 << v7;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  dispatch_time_t v10 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    id v12 = [a3 opcodeDescription];
    unint64_t maintenanceOnlyCondition = self->_maintenanceOnlyCondition;
    int64_t currentLatency = self->_currentLatency;
    *(_DWORD *)uint64_t buf = 68290819;
    int v75 = 0;
    __int16 v76 = 2082;
    int v77 = "";
    __int16 v78 = 2113;
    id v79 = v11;
    __int16 v80 = 1026;
    *(_DWORD *)id v81 = v5;
    *(_WORD *)&v81[4] = 2113;
    *(void *)&v81[6] = v12;
    *(_WORD *)&v81[14] = 1025;
    *(_DWORD *)&v81[16] = maintenanceOnlyCondition;
    *(_WORD *)&v81[20] = 1026;
    *(_DWORD *)&v81[22] = currentLatency;
    *(_WORD *)&v81[26] = 1026;
    int v82 = v9;
    __int16 v83 = 2113;
    id v84 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian executing task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"task\":%{private, location:escape_only}@, \"maintOnly\":%{private}d, \"latency\":%{public}d, \"timeout\":%{public}d, \"bytes\":%{private, location:escape_only}@}", buf, 0x48u);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [(CLDurianDevice *)self isPoshAccessory])
  {
    id v15 = [a3 characteristicPayload];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    __int16 v16 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      id v18 = [a3 characteristicPayload];
      unint64_t maxPacketSizeForGATTWriteWithResponse = self->_maxPacketSizeForGATTWriteWithResponse;
      *(_DWORD *)uint64_t buf = 68290051;
      __int16 v76 = 2082;
      int v75 = 0;
      int v77 = "";
      __int16 v78 = 2113;
      id v79 = v17;
      __int16 v80 = 2113;
      *(void *)id v81 = v18;
      *(_WORD *)&v81[8] = 2113;
      *(void *)&v81[10] = v15;
      *(_WORD *)&v81[18] = 2049;
      *(void *)&v81[20] = maxPacketSizeForGATTWriteWithResponse;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh WriteTask\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"packet\":%{private, location:escape_only}@, \"maxPacketSize\":%{private}lu}", buf, 0x3Au);
    }
    poshNonOwnerCharacteristic = self->_poshNonOwnerCharacteristic;
    if (poshNonOwnerCharacteristic)
    {
      [(CBPeripheral *)self->_activePeripheral writeValue:v15 forCharacteristic:poshNonOwnerCharacteristic type:0];
    }
    else
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      unsigned int v40 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
      {
        id v41 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        id v42 = [a3 characteristicPayload];
        unint64_t v43 = self->_maxPacketSizeForGATTWriteWithResponse;
        *(_DWORD *)uint64_t buf = 68290051;
        __int16 v76 = 2082;
        int v75 = 0;
        int v77 = "";
        __int16 v78 = 2113;
        id v79 = v41;
        __int16 v80 = 2113;
        *(void *)id v81 = v42;
        *(_WORD *)&v81[8] = 2113;
        *(void *)&v81[10] = v15;
        *(_WORD *)&v81[18] = 2049;
        *(void *)&v81[20] = v43;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #posh gatt task for posh accessory received, but posh characteristic was not discovered\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"packet\":%{private, location:escape_only}@, \"maxPacketSize\":%{private}lu}", buf, 0x3Au);
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
      }
      __int16 v44 = qword_102419398;
      if (os_signpost_enabled((os_log_t)qword_102419398))
      {
        id v45 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        id v46 = [a3 characteristicPayload];
        unint64_t v47 = self->_maxPacketSizeForGATTWriteWithResponse;
        *(_DWORD *)uint64_t buf = 68290051;
        __int16 v76 = 2082;
        int v75 = 0;
        int v77 = "";
        __int16 v78 = 2113;
        id v79 = v45;
        __int16 v80 = 2113;
        *(void *)id v81 = v46;
        *(_WORD *)&v81[8] = 2113;
        *(void *)&v81[10] = v15;
        *(_WORD *)&v81[18] = 2049;
        *(void *)&v81[20] = v47;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #posh gatt task for posh accessory received, but posh characteristic was not discovered", "{\"msg%{public}.0s\":\"#durian #posh gatt task for posh accessory received, but posh characteristic was not discovered\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"packet\":%{private, location:escape_only}@, \"maxPacketSize\":%{private}lu}", buf, 0x3Au);
      }
    }
    goto LABEL_89;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v21 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      id v73 = [a3 serviceUUID];
      uint64_t v23 = +[NSArray arrayWithObjects:&v73 count:1];
      *(_DWORD *)uint64_t buf = 68289539;
      int v75 = 0;
      __int16 v76 = 2082;
      int v77 = "";
      __int16 v78 = 2113;
      id v79 = v22;
      __int16 v80 = 2113;
      *(void *)id v81 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian requesting service-discovery\", \"item\":%{private, location:escape_only}@, \"service\":%{private, location:escape_only}@}", buf, 0x26u);
    }
    activePeripheral = self->_activePeripheral;
    id v72 = [a3 serviceUUID];
    [(CBPeripheral *)activePeripheral discoverServices:+[NSArray arrayWithObjects:&v72 count:1]];
    if (v5 == 2053)
    {
      self->_isRoseInitialized = 0;
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      uint64_t v25 = qword_102419398;
      if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_89;
      }
      id v39 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      *(_DWORD *)uint64_t buf = 68289283;
      int v75 = 0;
      __int16 v76 = 2082;
      int v77 = "";
      __int16 v78 = 2113;
      id v79 = v39;
      CFStringRef v27 = "{\"msg%{public}.0s\":\"#durian #ut #rose stopped\", \"item\":%{private, location:escape_only}@}";
    }
    else
    {
      if (v5 != 2049) {
        goto LABEL_89;
      }
      self->_isRoseInitialized = 1;
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      uint64_t v25 = qword_102419398;
      if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_89;
      }
      id v26 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      *(_DWORD *)uint64_t buf = 68289283;
      int v75 = 0;
      __int16 v76 = 2082;
      int v77 = "";
      __int16 v78 = 2113;
      id v79 = v26;
      CFStringRef v27 = "{\"msg%{public}.0s\":\"#durian #ut #rose initialized\", \"item\":%{private, location:escape_only}@}";
    }
    goto LABEL_87;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v5 == 11)
    {
      [objc_msgSend(objc_msgSend(objc_msgSend(a3, "command"), "bytes"), "getBytes:range:", &self->_lastMaxConnectionsSent, 1, 1);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      uint64_t v48 = qword_102419398;
      if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_78;
      }
      id v49 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      int lastMaxConnectionsSent = self->_lastMaxConnectionsSent;
      *(_DWORD *)uint64_t buf = 68289539;
      int v75 = 0;
      __int16 v76 = 2082;
      int v77 = "";
      __int16 v78 = 2113;
      id v79 = v49;
      __int16 v80 = 1026;
      *(_DWORD *)id v81 = lastMaxConnectionsSent;
      BOOL v38 = "{\"msg%{public}.0s\":\"#durian #multi setmax\", \"item\":%{private, location:escape_only}@, \"sent\":%{public}d}";
      double v51 = v48;
      os_log_type_t v52 = OS_LOG_TYPE_DEBUG;
      uint32_t v53 = 34;
    }
    else
    {
      if (v5 == 6)
      {
        self->_isRoseInitialized = 0;
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
        uint64_t v36 = qword_102419398;
        if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_78;
        }
        id v54 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        *(_DWORD *)uint64_t buf = 68289283;
        int v75 = 0;
        __int16 v76 = 2082;
        int v77 = "";
        __int16 v78 = 2113;
        id v79 = v54;
        BOOL v38 = "{\"msg%{public}.0s\":\"#durian #rose stopped\", \"item\":%{private, location:escape_only}@}";
      }
      else
      {
        if (v5 != 1) {
          goto LABEL_78;
        }
        self->_isRoseInitialized = 1;
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
        uint64_t v36 = qword_102419398;
        if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_78;
        }
        id v37 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        *(_DWORD *)uint64_t buf = 68289283;
        int v75 = 0;
        __int16 v76 = 2082;
        int v77 = "";
        __int16 v78 = 2113;
        id v79 = v37;
        BOOL v38 = "{\"msg%{public}.0s\":\"#durian #rose initialized\", \"item\":%{private, location:escape_only}@}";
      }
      double v51 = v36;
      os_log_type_t v52 = OS_LOG_TYPE_DEFAULT;
      uint32_t v53 = 28;
    }
    _os_log_impl((void *)&_mh_execute_header, v51, v52, v38, buf, v53);
LABEL_78:
    -[CBCentralManager sendData:toPeripheral:](self->_centralManager, "sendData:toPeripheral:", [objc_msgSend(objc_msgSend(a3, "command"), "bytes") bytes], self->_activePeripheral);
LABEL_89:
    [(CLDurianDevice *)self scheduleActiveTaskTimeout:v9 forTask:a3];
    return;
  }
  if ([a3 isConfigurationControlPointTask]
    && (hawkeyeConfigurationCharacteristic = self->_hawkeyeConfigurationCharacteristic) != 0
    || [a3 isPairedOwnerInformationControlPointTask]
    && (hawkeyeConfigurationCharacteristic = self->_hawkeyePairedOwnerInformationCharacteristic) != 0
    || [a3 isNonOwnerControlPointTask]
    && (hawkeyeConfigurationCharacteristic = self->_hawkeyeNonOwnerCharacteristic) != 0
    || [a3 isDebugControlPointTask]
    && (hawkeyeConfigurationCharacteristic = self->_hawkeyeDebugCharacteristic) != 0
    || [a3 isPreciseFindingControlPointTask]
    && (hawkeyeConfigurationCharacteristic = self->_hawkeyePreciseFindingCharacteristic) != 0)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    uint64_t v29 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      id v31 = [a3 hawkeyePayload];
      uint64_t v32 = v9;
      id v33 = [(CBCharacteristic *)hawkeyeConfigurationCharacteristic UUID];
      id v34 = [a3 opcodeDescription];
      *(_DWORD *)uint64_t buf = 68290051;
      __int16 v76 = 2082;
      int v75 = 0;
      int v77 = "";
      __int16 v78 = 2113;
      id v79 = v30;
      __int16 v80 = 2114;
      *(void *)id v81 = v31;
      *(_WORD *)&v81[8] = 2114;
      *(void *)&v81[10] = v33;
      uint64_t v9 = v32;
      *(_WORD *)&v81[18] = 2114;
      *(void *)&v81[20] = v34;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye task\", \"item\":%{private, location:escape_only}@, \"payload\":%{public, location:escape_only}@, \"characteristic\":%{public, location:escape_only}@, \"task\":%{public, location:escape_only}@}", buf, 0x3Au);
    }
    -[CBPeripheral writeValue:forCharacteristic:type:](self->_activePeripheral, "writeValue:forCharacteristic:type:", [a3 hawkeyePayload], hawkeyeConfigurationCharacteristic, 0);
    switch(v5)
    {
      case 0xBu:
        [objc_msgSend(objc_msgSend(objc_msgSend(a3, "command"), "bytes"), "getBytes:range:", &self->_lastMaxConnectionsSent, 1, 1);
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
        uint64_t v55 = qword_102419398;
        if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_89;
        }
        id v56 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        int v57 = self->_lastMaxConnectionsSent;
        *(_DWORD *)uint64_t buf = 68289539;
        int v75 = 0;
        __int16 v76 = 2082;
        int v77 = "";
        __int16 v78 = 2113;
        id v79 = v56;
        __int16 v80 = 1026;
        *(_DWORD *)id v81 = v57;
        CFStringRef v27 = "{\"msg%{public}.0s\":\"#durian #multi setmax\", \"item\":%{private, location:escape_only}@, \"sent\":%{public}d}";
        uint64_t v58 = v55;
        os_log_type_t v59 = OS_LOG_TYPE_DEBUG;
        uint32_t v60 = 34;
        goto LABEL_88;
      case 6u:
        self->_isRoseInitialized = 0;
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
        uint64_t v25 = qword_102419398;
        if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_89;
        }
        id v61 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        *(_DWORD *)uint64_t buf = 68289283;
        int v75 = 0;
        __int16 v76 = 2082;
        int v77 = "";
        __int16 v78 = 2113;
        id v79 = v61;
        CFStringRef v27 = "{\"msg%{public}.0s\":\"#durian #rose stopped\", \"item\":%{private, location:escape_only}@}";
        break;
      case 1u:
        self->_isRoseInitialized = 1;
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
        uint64_t v25 = qword_102419398;
        if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_89;
        }
        id v35 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        *(_DWORD *)uint64_t buf = 68289283;
        int v75 = 0;
        __int16 v76 = 2082;
        int v77 = "";
        __int16 v78 = 2113;
        id v79 = v35;
        CFStringRef v27 = "{\"msg%{public}.0s\":\"#durian #rose initialized\", \"item\":%{private, location:escape_only}@}";
        break;
      default:
        goto LABEL_89;
    }
LABEL_87:
    uint64_t v58 = v25;
    os_log_type_t v59 = OS_LOG_TYPE_DEFAULT;
    uint32_t v60 = 28;
LABEL_88:
    _os_log_impl((void *)&_mh_execute_header, v58, v59, v27, buf, v60);
    goto LABEL_89;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  int v62 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
  {
    id v63 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    unsigned int v64 = [a3 hawkeyeOpcode];
    id v65 = [a3 serviceUUID];
    id v66 = [a3 characteristicUUID];
    *(_DWORD *)uint64_t buf = 68290051;
    int v75 = 0;
    __int16 v76 = 2082;
    int v77 = "";
    __int16 v78 = 2113;
    id v79 = v63;
    __int16 v80 = 1026;
    *(_DWORD *)id v81 = v64;
    *(_WORD *)&v81[4] = 2114;
    *(void *)&v81[6] = v65;
    *(_WORD *)&v81[14] = 2114;
    *(void *)&v81[16] = v66;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye unhandled task type\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"serviceUUID\":%{public, location:escape_only}@, \"characteristicUUID\":%{public, location:escape_only}@}", buf, 0x36u);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
  }
  id v67 = qword_102419398;
  if (os_signpost_enabled((os_log_t)qword_102419398))
  {
    id v68 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    unsigned int v69 = [a3 hawkeyeOpcode];
    id v70 = [a3 serviceUUID];
    id v71 = [a3 characteristicUUID];
    *(_DWORD *)uint64_t buf = 68290051;
    int v75 = 0;
    __int16 v76 = 2082;
    int v77 = "";
    __int16 v78 = 2113;
    id v79 = v68;
    __int16 v80 = 1026;
    *(_DWORD *)id v81 = v69;
    *(_WORD *)&v81[4] = 2114;
    *(void *)&v81[6] = v70;
    *(_WORD *)&v81[14] = 2114;
    *(void *)&v81[16] = v71;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v67, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye unhandled task type", "{\"msg%{public}.0s\":\"#durian #hawkeye unhandled task type\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"serviceUUID\":%{public, location:escape_only}@, \"characteristicUUID\":%{public, location:escape_only}@}", buf, 0x36u);
  }
  [(CLDurianDeviceDelegate *)[(CLDurianDevice *)self delegate] device:self didFailToCompleteTask:[(CLDurianDevice *)self activeTask] withError:34 andDisconnect:0];
  [(NSMutableArray *)self->_pendingTasks removeObject:self->_activeTask];
  [(CLDurianDevice *)self logTaskCounts:@"unsupported"];
  [(CLDurianTask *)self->_activeTask complete];
  [(CLDurianDevice *)self setActiveTask:0];
  [(CLDurianDevice *)self processNextTask:@"completeCurrentTask"];
}

- (void)getPersonalizationInformation
{
  self->_retrievingPersonalizationInformation = 1;
  self->_firmwareUpdateMode = 1;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  BOOL v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    int v10 = 68289283;
    int v11 = 0;
    __int16 v12 = 2082;
    unsigned int v13 = "";
    __int16 v14 = 2113;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian getPersonalizationInfo\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v10, 0x1Cu);
  }
  if (self->_activePeripheral)
  {
    [(CLDurianDevice *)self setDesiredConnectionLatency];
    unsigned int v5 = [[CLDurianFirmwareUpdater alloc] initWithDelegate:self peripheral:self->_activePeripheral];
    self->_firmwareUpdater = v5;
    [(CLDurianFirmwareUpdater *)v5 getPersonalizationInformation];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v6 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      int v10 = 68289283;
      int v11 = 0;
      __int16 v12 = 2082;
      unsigned int v13 = "";
      __int16 v14 = 2113;
      id v15 = v7;
      id v8 = "{\"msg%{public}.0s\":\"#durian kick off getPersonalizationInfo\", \"item\":%{private, location:escape_only}@}";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0x1Cu);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v6 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      int v10 = 68289283;
      int v11 = 0;
      __int16 v12 = 2082;
      unsigned int v13 = "";
      __int16 v14 = 2113;
      id v15 = v9;
      id v8 = "{\"msg%{public}.0s\":\"#durian wait for connection to getPersonalizationInfo\", \"item\":%{private, location:escape_only}@}";
      goto LABEL_14;
    }
  }
}

- (void)updateFirmwareWithAssetURL:(id)a3
{
  self->_firmwareUpdateInProgress = 1;
  [(CLDurianFirmwareUpdater *)self->_firmwareUpdater startFirmwareUpdate:a3];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    v6[0] = 68289283;
    v6[1] = 0;
    __int16 v7 = 2082;
    id v8 = "";
    __int16 v9 = 2113;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian kick off updateFirmwareWithManifest\", \"item\":%{private, location:escape_only}@}", (uint8_t *)v6, 0x1Cu);
  }
}

- (void)handleDisconnectionDuringFirmwareUpdate
{
  id v3 = objc_alloc((Class)NSError);
  NSErrorUserInfoKey v5 = NSLocalizedDescriptionKey;
  CFStringRef v6 = @"Disconnected from Device";
  id v4 = [[v3 initWithDomain:kCLErrorDomainPrivate code:5 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1)];
  [(CLDurianDevice *)self informFirmwareUpdateFailureToClientWithError:v4];
  [(CLDurianDevice *)self exitFirmwareUpdateMode];
}

- (void)preemptFirmwareUpdate
{
  id v3 = objc_alloc((Class)NSError);
  NSErrorUserInfoKey v5 = NSLocalizedDescriptionKey;
  CFStringRef v6 = @"Firmware update preempted by user intitiated action";
  id v4 = [[v3 initWithDomain:kCLErrorDomainPrivate code:7 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1)];
  [(CLDurianDevice *)self abortFirmwareUpdate:v4];
}

- (BOOL)allowFirmwareUpdate
{
  if (self->_activePeripheral
    && self->_firmwareUpdateMode
    && !self->_retrievingPersonalizationInformation
    && !self->_firmwareUpdateInProgress
    && !self->_firmwareUpdateReboot)
  {
    return 1;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  id v3 = qword_102419398;
  BOOL v4 = os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v4)
  {
    id v6 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    BOOL v7 = self->_activePeripheral != 0;
    BOOL firmwareUpdateMode = self->_firmwareUpdateMode;
    BOOL v9 = !self->_retrievingPersonalizationInformation;
    BOOL v10 = !self->_firmwareUpdateInProgress;
    BOOL v11 = !self->_firmwareUpdateReboot;
    v12[0] = 68290563;
    v12[1] = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2113;
    id v16 = v6;
    __int16 v17 = 1025;
    BOOL v18 = v7;
    __int16 v19 = 1025;
    BOOL v20 = firmwareUpdateMode;
    __int16 v21 = 1025;
    BOOL v22 = v9;
    __int16 v23 = 1025;
    BOOL v24 = v10;
    __int16 v25 = 1025;
    BOOL v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian block fwupdate\", \"item\":%{private, location:escape_only}@, \"periph\":%{private}hhd, \"mode\":%{private}hhd, \"retrieving\":%{private}hhd, \"inprogress\":%{private}hhd, \"reboot\":%{private}hhd}", (uint8_t *)v12, 0x3Au);
    return 0;
  }
  return result;
}

- (void)abortFirmwareUpdate:(id)a3
{
  if (!self->_firmwareUpdateMode || self->_firmwareUpdateReboot) {
    return;
  }
  if (!self->_firmwareUpdater)
  {
    [(CLDurianDevice *)self exitFirmwareUpdateMode];
    if (!a3) {
      return;
    }
    goto LABEL_17;
  }
  if (self->_abortingFirmwareUpdate)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    NSErrorUserInfoKey v5 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      int v9 = 68289283;
      int v10 = 0;
      __int16 v11 = 2082;
      __int16 v12 = "";
      __int16 v13 = 2113;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian Already aborting FW update for device, wait.\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v9, 0x1Cu);
    }
    return;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  BOOL v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    int v9 = 68289283;
    int v10 = 0;
    __int16 v11 = 2082;
    __int16 v12 = "";
    __int16 v13 = 2113;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian abortFirmwareUpdate\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v9, 0x1Cu);
  }
  [(CLDurianFirmwareUpdater *)self->_firmwareUpdater abortFirmwareUpdate];
  self->_abortingFirmwareUpdate = 1;
  if (a3) {
LABEL_17:
  }
    [(CLDurianDevice *)self informFirmwareUpdateFailureToClientWithError:a3];
}

- (void)informFirmwareUpdateFailureToClientWithError:(id)a3
{
  BOOL retrievingPersonalizationInformation = self->_retrievingPersonalizationInformation;
  delegate = self->_delegate;
  if (retrievingPersonalizationInformation) {
    [(CLDurianDeviceDelegate *)delegate didRetrievePersonalizationInfo:0 forDevice:self error:a3];
  }
  else {
    [(CLDurianDeviceDelegate *)delegate didUpdateFirmwareForDevice:self error:a3];
  }
  id v7 = [a3 domain];
  if ([v7 isEqualToString:kCLErrorDomainPrivate])
  {
    id v8 = [a3 code];
    if (v8 == (id)5)
    {
      v17[0] = @"firmwareUpdateFailed";
      v16[0] = @"event";
      v16[1] = @"reason";
      CFStringRef v11 = sub_101640864((unint64_t)[a3 code]);
      v16[2] = @"disconnectReason";
      CFStringRef disconnectReason = (const __CFString *)self->_disconnectReason;
      if (!disconnectReason) {
        CFStringRef disconnectReason = @"NotSet";
      }
      v17[1] = v11;
      v17[2] = disconnectReason;
      int v9 = v17;
      int v10 = v16;
    }
    else
    {
      if (v8 != (id)7)
      {
        v15[0] = @"firmwareUpdateFailed";
        v14[0] = @"event";
        v14[1] = @"reason";
        v15[1] = sub_101640864((unint64_t)[a3 code]);
        int v9 = v15;
        int v10 = v14;
        uint64_t v13 = 2;
        goto LABEL_13;
      }
      v19[0] = @"firmwareUpdateFailed";
      v18[0] = @"event";
      v18[1] = @"reason";
      v19[1] = sub_101640864((unint64_t)[a3 code]);
      v18[2] = @"firmwareUpdateblockingTask";
      v19[2] = [(CLDurianDevice *)self currentTaskName];
      int v9 = v19;
      int v10 = v18;
    }
    uint64_t v13 = 3;
LABEL_13:
    [(CLDurianDeviceDelegate *)self->_delegate sendFirmwareUpdateMetrics:+[NSDictionary dictionaryWithObjects:v9 forKeys:v10 count:v13] forDevice:self];
  }
}

- (void)enterFirmwareUpdateMode
{
  self->_BOOL firmwareUpdateMode = 1;
}

- (void)exitFirmwareUpdateMode
{
  self->_BOOL firmwareUpdateMode = 0;
  *(_DWORD *)&self->_BOOL retrievingPersonalizationInformation = 0;
  firmwareUpdater = self->_firmwareUpdater;
  if (firmwareUpdater)
  {

    self->_firmwareUpdater = 0;
  }
  if (self->_activePeripheral)
  {
    [(CLDurianDevice *)self setDesiredConnectionLatency];
    [(CBPeripheral *)self->_activePeripheral setDelegate:self];
    [(CLDurianDevice *)self processNextTask:@"exitFirmwareUpdateMode"];
  }
}

- (void)processUARPMessage:(id)a3
{
  int v5 = *(unsigned __int8 *)[a3 bytes];
  if (!self->_uarpMessage) {
    self->_uarpMessage = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  id v6 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
  {
    id v7 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    int v12 = 68289539;
    int v13 = 0;
    __int16 v14 = 2082;
    __int16 v15 = "";
    __int16 v16 = 2113;
    id v17 = v7;
    __int16 v18 = 2113;
    id v19 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Received message from accessory\", \"item\":%{private, location:escape_only}@, \"message\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x26u);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
  }
  id v8 = qword_102419398;
  if (os_signpost_enabled((os_log_t)qword_102419398))
  {
    id v9 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    int v12 = 68289539;
    int v13 = 0;
    __int16 v14 = 2082;
    __int16 v15 = "";
    __int16 v16 = 2113;
    id v17 = v9;
    __int16 v18 = 2113;
    id v19 = a3;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#hawkeye #firmwareUpdate Received message from accessory", "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Received message from accessory\", \"item\":%{private, location:escape_only}@, \"message\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x26u);
  }
  -[self->_uarpMessage appendData:[a3 subdataWithRange:1, (char *)[a3 length] - 1]];
  if (v5)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    int v10 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      int v12 = 68289283;
      int v13 = 0;
      __int16 v14 = 2082;
      __int16 v15 = "";
      __int16 v16 = 2113;
      id v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Received last fragment for UARP message, sending to CoreUARP\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x1Cu);
    }
    -[CLDurianDeviceDelegate didReceiveUarpMessage:fromDevice:](self->_delegate, "didReceiveUarpMessage:fromDevice:", [objc_alloc((Class)NSData) initWithData:self->_uarpMessage], self);

    self->_uarpMessage = 0;
  }
}

- (NSData)addressFromUnknownBeacon
{
  if ([(CLDurianDevice *)self unownedBeacon]
    && (unint64_t)objc_msgSend(-[SPUnknownBeacon advertisement](-[CLDurianDevice unownedBeacon](self, "unownedBeacon"), "advertisement"), "length") >= 6)
  {
    id v3 = [(SPUnknownBeacon *)[(CLDurianDevice *)self unownedBeacon] advertisement];
    return (NSData *)[v3 subdataWithRange:NSMakeRange(0, 6)];
  }
  else if ([(CLDurianDevice *)self taUnknownBeacon] {
         && objc_msgSend(-[TAUnknownBeacon address](-[CLDurianDevice taUnknownBeacon](self, "taUnknownBeacon"), "address"), "length") == (id)6)
  }
  {
    int v5 = [(CLDurianDevice *)self taUnknownBeacon];
    return (NSData *)[(TAUnknownBeacon *)v5 address];
  }
  else
  {
    return +[NSData data];
  }
}

- (BOOL)isFindMyNetwork
{
  if (![(CLDurianDevice *)self isPoshAccessory])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v8 = qword_102419398;
    if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
      return 1;
    }
    id v9 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    int v16 = 68289283;
    int v17 = 0;
    __int16 v18 = 2082;
    id v19 = "";
    __int16 v20 = 2113;
    id v21 = v9;
    int v10 = "{\"msg%{public}.0s\":\"#durian findmy is enabled by default for all non-posh accessories\", \"item\":%{private"
          ", location:escape_only}@}";
    goto LABEL_17;
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v8 = qword_102419398;
    if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
      return 1;
    }
    id v11 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    int v16 = 68289283;
    int v17 = 0;
    __int16 v18 = 2082;
    id v19 = "";
    __int16 v20 = 2113;
    id v21 = v11;
    int v10 = "{\"msg%{public}.0s\":\"#durian #posh feature flag is not enabled, defaulting to apple-posh behavior\", \"item\""
          ":%{private, location:escape_only}@}";
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v16, 0x1Cu);
    return 1;
  }
  SEL v3 = NSSelectorFromString(@"isFindMyNetwork");
  if (self->_unownedBeacon && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v4 = [(SPUnknownBeacon *)self->_unownedBeacon performSelector:v3];
    BOOL v5 = v4 != 0;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v6 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      int v16 = 68289539;
      int v17 = 0;
      __int16 v18 = 2082;
      id v19 = "";
      __int16 v20 = 2113;
      id v21 = v7;
      __int16 v22 = 1026;
      BOOL v23 = v4 != 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh SPUnknownBeacon responds to isFindMyNetwork selector\", \"item\":%{private, location:escape_only}@, \"isApple\":%{public}hhd}", (uint8_t *)&v16, 0x22u);
    }
  }
  else
  {
    BOOL v5 = 1;
  }
  if (self->_taUnknownBeacon && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v13 = [(TAUnknownBeacon *)self->_taUnknownBeacon performSelector:v3];
    BOOL v5 = v13 != 0;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    __int16 v14 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      int v16 = 68289539;
      int v17 = 0;
      __int16 v18 = 2082;
      id v19 = "";
      __int16 v20 = 2113;
      id v21 = v15;
      __int16 v22 = 1026;
      BOOL v23 = v13 != 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh TAUnknownBeacon responds to isFindMyNetwork selector\", \"item\":%{private, location:escape_only}@, \"isApple\":%{public}hhd}", (uint8_t *)&v16, 0x22u);
    }
  }
  return v5;
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  if (a4 || !objc_msgSend(objc_msgSend(a3, "services"), "count"))
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v6 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      id v8 = [[-[CBPeripheral identifier](self->_activePeripheral, "identifier") description] substringToIndex:8];
      id v9 = (CLDurianTask *)[a4 localizedDescription];
      unsigned int v10 = [[a3 services] count];
      unsigned int v11 = [(CLDurianTask *)self->_activeTask translatedOpcode];
      uint64_t buf = 68290307;
      __int16 v97 = 2082;
      __int16 v98 = "";
      __int16 v99 = 2113;
      id v100 = v7;
      __int16 v101 = 2113;
      *(void *)__int16 v102 = v8;
      *(_WORD *)&v102[8] = 2113;
      v103 = v9;
      __int16 v104 = 1026;
      unsigned int v105 = v10;
      __int16 v106 = 1026;
      unsigned int v107 = v11;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian failed to discover services\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@, \"count\":%{public}d, \"activeOpcode\":%{public}d}", (uint8_t *)&buf, 0x3Cu);
    }
    activeTask = self->_activeTask;
    if (activeTask) {
      [(CLDurianDeviceDelegate *)self->_delegate device:self didFailToCompleteTask:activeTask withError:33 andDisconnect:1];
    }
    else {
      [(CLDurianDevice *)self requestDisconnection:@"MissingServiceCharacteristic"];
    }
    return;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  id v13 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    uint64_t buf = 68289539;
    __int16 v97 = 2082;
    __int16 v98 = "";
    __int16 v99 = 2113;
    id v100 = v14;
    __int16 v101 = 2113;
    *(void *)__int16 v102 = [a3 services];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian discovered services\", \"item\":%{private, location:escape_only}@, \"service\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
  }
  id v72 = self;
  if (!self->_activePeripheralReady)
  {
    if ([(CLDurianDevice *)self isPoshAccessory])
    {
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      id v35 = [a3 services];
      id v36 = [v35 countByEnumeratingWithState:&v82 objects:v95 count:16];
      if (v36)
      {
        id v37 = v36;
        int v38 = 0;
        uint64_t v39 = *(void *)v83;
        do
        {
          unsigned int v40 = 0;
          do
          {
            if (*(void *)v83 != v39) {
              objc_enumerationMutation(v35);
            }
            id v41 = *(void **)(*((void *)&v82 + 1) + 8 * (void)v40);
            if (objc_msgSend(objc_msgSend(v41, "UUID"), "isEqual:", +[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID")))
            {
              id v94 = +[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID];
              id v42 = +[NSArray arrayWithObjects:&v94 count:1];
              if (qword_102419390 != -1) {
                dispatch_once(&qword_102419390, &stru_102332198);
              }
              unint64_t v43 = qword_102419398;
              if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
              {
                id v44 = [[-[NSUUID description](v72->_uuid, "description") substringToIndex:8];
                uint64_t buf = 68289539;
                __int16 v97 = 2082;
                __int16 v98 = "";
                __int16 v99 = 2113;
                id v100 = v44;
                __int16 v101 = 2113;
                *(void *)__int16 v102 = v42;
                _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh requesting characteristic-discovery\", \"item\":%{private, location:escape_only}@, \"characteristics\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
              }
              [a3 discoverCharacteristics:v42 forService:v41];
              ++v38;
            }
            unsigned int v40 = (char *)v40 + 1;
          }
          while (v37 != v40);
          id v37 = [v35 countByEnumeratingWithState:&v82 objects:v95 count:16];
        }
        while (v37);
      }
      else
      {
        int v38 = 0;
      }
      v72->_int poshCharacteristicsToDiscover = [objc_msgSend(objc_msgSend(a3, "services"), "count")
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      uint64_t v65 = qword_102419398;
      if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      id v66 = [[-[NSUUID description](v72->_uuid, "description") substringToIndex:8];
      int poshCharacteristicsToDiscover = v72->_poshCharacteristicsToDiscover;
      uint64_t buf = 68289795;
      __int16 v97 = 2082;
      __int16 v98 = "";
      __int16 v99 = 2113;
      id v100 = v66;
      __int16 v101 = 1026;
      *(_DWORD *)__int16 v102 = poshCharacteristicsToDiscover;
      *(_WORD *)&v102[4] = 1026;
      *(_DWORD *)&v102[6] = v38;
      BOOL v26 = "{\"msg%{public}.0s\":\"#durian #posh didDiscoverServices\", \"item\":%{private, location:escape_only}@, \"ch"
            "ars\":%{public}d, \"matched\":%{public}d}";
    }
    else
    {
      if (self->_activePeripheralReady || ![(CLDurianDevice *)self isHawkeyeAccessory]) {
        goto LABEL_14;
      }
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id obj = [a3 services];
      id v48 = [obj countByEnumeratingWithState:&v78 objects:v93 count:16];
      if (v48)
      {
        id v49 = v48;
        int v50 = 0;
        uint64_t v71 = *(void *)v79;
        do
        {
          double v51 = 0;
          do
          {
            if (*(void *)v79 != v71) {
              objc_enumerationMutation(obj);
            }
            os_log_type_t v52 = *(void **)(*((void *)&v78 + 1) + 8 * (void)v51);
            if (objc_msgSend(objc_msgSend(v52, "UUID"), "isEqual:", +[CBUUID _cl_BtTxPowerServiceUUID](CBUUID, "_cl_BtTxPowerServiceUUID")))
            {
              id v92 = +[CBUUID _cl_BtTxPowerCharacteristicUUID];
              uint32_t v53 = +[NSArray arrayWithObjects:&v92 count:1];
              if (qword_102419390 != -1) {
                dispatch_once(&qword_102419390, &stru_102332198);
              }
              id v54 = qword_102419398;
              if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
              {
                id v55 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
                uint64_t buf = 68289539;
                __int16 v97 = 2082;
                __int16 v98 = "";
                __int16 v99 = 2113;
                id v100 = v55;
                __int16 v101 = 2113;
                *(void *)__int16 v102 = v53;
                _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye requesting characteristic-discovery\", \"item\":%{private, location:escape_only}@, \"characteristics\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
              }
              [a3 discoverCharacteristics:v53 forService:v52];
              ++v50;
            }
            if (objc_msgSend(objc_msgSend(v52, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")))
            {
              v91[0] = +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID];
              v91[1] = +[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID];
              v91[2] = +[CBUUID _cl_HawkeyePairedOwnerInformationCharacteristicUUID];
              v91[3] = +[CBUUID _cl_HawkeyeDebugCharacteristicUUID];
              v91[4] = +[CBUUID _cl_HawkeyePreciseFindingCharacteristicUUID];
              id v56 = +[NSArray arrayWithObjects:v91 count:5];
              if (qword_102419390 != -1) {
                dispatch_once(&qword_102419390, &stru_102332198);
              }
              int v57 = qword_102419398;
              if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
              {
                id v58 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
                uint64_t buf = 68289539;
                __int16 v97 = 2082;
                __int16 v98 = "";
                __int16 v99 = 2113;
                id v100 = v58;
                __int16 v101 = 2113;
                *(void *)__int16 v102 = v56;
                _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye requesting characteristic-discovery\", \"item\":%{private, location:escape_only}@, \"characteristics\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
              }
              [a3 discoverCharacteristics:v56 forService:v52];
              v50 += 10;
            }
            if (objc_msgSend(objc_msgSend(v52, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyeAccessoryInformationServiceUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceUUID")))
            {
              v90[0] = +[CBUUID _cl_HawkeyeAccessoryInformationServiceProductDataCharacteristicUUID];
              v90[1] = +[CBUUID _cl_HawkeyeAccessoryInformationServiceManufacturerNameCharacteristicUUID];
              v90[2] = +[CBUUID _cl_HawkeyeAccessoryInformationServiceModelNameCharacteristicUUID];
              v90[3] = +[CBUUID _cl_HawkeyeAccessoryInformationServiceModelColorCodeCharacteristicUUID];
              v90[4] = +[CBUUID _cl_HawkeyeAccessoryInformationServiceAccessoryCategoryCharacteristicUUID];
              v90[5] = +[CBUUID _cl_HawkeyeAccessoryInformationServiceAccessoryCapabilitiesCharacteristicUUID];
              v90[6] = +[CBUUID _cl_HawkeyeAccessoryInformationServiceFirmwareVersionCharacteristicUUID];
              v90[7] = +[CBUUID _cl_HawkeyeAccessoryInformationServiceFindMyVersionCharacteristicUUID];
              v90[8] = +[CBUUID _cl_HawkeyeAccessoryInformationServiceBatteryTypeCharacteristicUUID];
              v90[9] = +[CBUUID _cl_HawkeyeAccessoryInformationServiceBatteryLevelCharacteristicUUID];
              os_log_type_t v59 = +[NSArray arrayWithObjects:v90 count:10];
              if (qword_102419390 != -1) {
                dispatch_once(&qword_102419390, &stru_102332198);
              }
              uint32_t v60 = qword_102419398;
              if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
              {
                id v61 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
                uint64_t buf = 68289539;
                __int16 v97 = 2082;
                __int16 v98 = "";
                __int16 v99 = 2113;
                id v100 = v61;
                __int16 v101 = 2113;
                *(void *)__int16 v102 = v59;
                _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye requesting characteristic-discovery\", \"item\":%{private, location:escape_only}@, \"characteristics\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
              }
              [a3 discoverCharacteristics:v59 forService:v52];
              v50 += 100;
            }
            if (objc_msgSend(objc_msgSend(v52, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyeAccessoryFirmwareUpdateServiceUUID](CBUUID, "_cl_HawkeyeAccessoryFirmwareUpdateServiceUUID")))
            {
              id v89 = +[CBUUID _cl_HawkeyeAccessoryFirmwareUpdateMsgCharacteristicUUID];
              int v62 = +[NSArray arrayWithObjects:&v89 count:1];
              if (qword_102419390 != -1) {
                dispatch_once(&qword_102419390, &stru_102332198);
              }
              id v63 = qword_102419398;
              if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
              {
                id v64 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
                uint64_t buf = 68289539;
                __int16 v97 = 2082;
                __int16 v98 = "";
                __int16 v99 = 2113;
                id v100 = v64;
                __int16 v101 = 2113;
                *(void *)__int16 v102 = v62;
                _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye requesting characteristic-discovery\", \"item\":%{private, location:escape_only}@, \"characteristics\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
              }
              [a3 discoverCharacteristics:v62 forService:v52];
              v50 += 1000;
            }
            double v51 = (char *)v51 + 1;
          }
          while (v49 != v51);
          id v49 = [obj countByEnumeratingWithState:&v78 objects:v93 count:16];
        }
        while (v49);
      }
      else
      {
        int v50 = 0;
      }
      self->_int hawkeyeCharacteristicsToDiscover = [objc_msgSend(objc_msgSend(a3, "services"), "count");
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      uint64_t v65 = qword_102419398;
      if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      id v68 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      int hawkeyeCharacteristicsToDiscover = self->_hawkeyeCharacteristicsToDiscover;
      uint64_t buf = 68289795;
      __int16 v97 = 2082;
      __int16 v98 = "";
      __int16 v99 = 2113;
      id v100 = v68;
      __int16 v101 = 1026;
      *(_DWORD *)__int16 v102 = hawkeyeCharacteristicsToDiscover;
      *(_WORD *)&v102[4] = 1026;
      *(_DWORD *)&v102[6] = v50;
      BOOL v26 = "{\"msg%{public}.0s\":\"#durian #hawkeye didDiscoverServices\", \"item\":%{private, location:escape_only}@, \""
            "chars\":%{public}d, \"matched\":%{public}d}";
    }
    CFStringRef v27 = v65;
    uint32_t v28 = 40;
    goto LABEL_96;
  }
LABEL_14:
  [(CLDurianDevice *)self activeTask];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = [(CLDurianDevice *)self activeTask];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v16 = [a3 services];
    id v17 = [v16 countByEnumeratingWithState:&v74 objects:v88 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v75;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v75 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          if (objc_msgSend(objc_msgSend(v21, "UUID"), "isEqual:", -[CLDurianTask serviceUUID](v15, "serviceUUID")))
          {
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102332198);
            }
            id v45 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v46 = [[-[NSUUID description](v72->_uuid, "description") substringToIndex:8];
              id v87 = [(CLDurianTask *)v15 characteristicUUID];
              unint64_t v47 = +[NSArray arrayWithObjects:&v87 count:1];
              uint64_t buf = 68289539;
              __int16 v97 = 2082;
              __int16 v98 = "";
              __int16 v99 = 2113;
              id v100 = v46;
              __int16 v101 = 2113;
              *(void *)__int16 v102 = v47;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian requesting characteristic-discovery\", \"item\":%{private, location:escape_only}@, \"characteristics\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
            }
            id v86 = [(CLDurianTask *)v15 characteristicUUID];
            [a3 discoverCharacteristics:[+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v86, 1) forService:v21];
            return;
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v74 objects:v88 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    uint64_t v22 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = [[-[NSUUID description](v72->_uuid, "description") substringToIndex:8];
      id v24 = [[objc_msgSend(-[CBPeripheral identifier](v72->_activePeripheral, "identifier"), "description") substringToIndex:8];
      __int16 v25 = v72->_activeTask;
      uint64_t buf = 68289795;
      __int16 v97 = 2082;
      __int16 v98 = "";
      __int16 v99 = 2113;
      id v100 = v23;
      __int16 v101 = 2113;
      *(void *)__int16 v102 = v24;
      *(_WORD *)&v102[8] = 2113;
      v103 = v25;
      BOOL v26 = "{\"msg%{public}.0s\":\"#durian failed to discover service for task\", \"item\":%{private, location:escape_on"
            "ly}@, \"periph\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@}";
      CFStringRef v27 = v22;
      uint32_t v28 = 48;
LABEL_96:
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&buf, v28);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    uint64_t v29 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      id v30 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      id v31 = [(CLDurianDevice *)self activeTask];
      uint64_t buf = 68289539;
      __int16 v97 = 2082;
      __int16 v98 = "";
      __int16 v99 = 2113;
      id v100 = v30;
      __int16 v101 = 2113;
      *(void *)__int16 v102 = v31;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian discovered services, but active task is not a GATT task\", \"item\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
    }
    uint64_t v32 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      id v33 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      id v34 = [(CLDurianDevice *)self activeTask];
      uint64_t buf = 68289539;
      __int16 v97 = 2082;
      __int16 v98 = "";
      __int16 v99 = 2113;
      id v100 = v33;
      __int16 v101 = 2113;
      *(void *)__int16 v102 = v34;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian discovered services, but active task is not a GATT task", "{\"msg%{public}.0s\":\"#durian discovered services, but active task is not a GATT task\", \"item\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
    }
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  if (a5 || (int v12 = self, !objc_msgSend(objc_msgSend(a4, "characteristics"), "count")))
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v7 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      id v9 = [a4 UUID];
      id v10 = [[objc_msgSend(-[CBPeripheral identifier](self->_activePeripheral, "identifier"), "description") substringToIndex:8];
      *(_DWORD *)uint64_t buf = 68290307;
      int v166 = 0;
      __int16 v167 = 2082;
      v168 = "";
      __int16 v169 = 2113;
      id v170 = v8;
      __int16 v171 = 2113;
      *(void *)v172 = v9;
      *(_WORD *)&v172[8] = 2113;
      *(void *)&v172[10] = v10;
      *(_WORD *)&v172[18] = 2113;
      id v173 = [a5 localizedDescription];
      __int16 v174 = 1026;
      LODWORD(v175) = [objc_msgSend(objc_msgSend(a4, "characteristics"), "count")];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian failed to discover characteristic\", \"item\":%{private, location:escape_only}@, \"service\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@, \"count\":%{public}d}", buf, 0x40u);
    }
    if ([(NSMutableArray *)self->_pendingTasks count]) {
      id v11 = [(NSMutableArray *)self->_pendingTasks objectAtIndex:0];
    }
    else {
      id v11 = 0;
    }
    [(CLDurianDevice *)self setDisconnectionReason:@"MissingServiceCharacteristic"];
    [(CLDurianDeviceDelegate *)self->_delegate device:self didFailToCompleteTask:v11 withError:33 andDisconnect:1];
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v13 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [[-[NSUUID description](v12->_uuid, "description") substringToIndex:8];
      *(_DWORD *)uint64_t buf = 68289795;
      int v166 = 0;
      __int16 v167 = 2082;
      v168 = "";
      __int16 v169 = 2113;
      id v170 = v14;
      __int16 v171 = 2113;
      *(void *)v172 = [a4 UUID];
      *(_WORD *)&v172[8] = 1026;
      *(_DWORD *)&v172[10] = [objc_msgSend(a4, "characteristics") count];
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian discovered characteristics for service \", \"item\":%{private, location:escape_only}@, \"service\":%{private, location:escape_only}@, \"count\":%{public}d}", buf, 0x2Cu);
    }
    if ([(CLDurianDevice *)v12 isPoshAccessory])
    {
      --v12->_poshCharacteristicsToDiscover;
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      id v15 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [[-[NSUUID description](v12->_uuid, "description") substringToIndex:8];
        unsigned int v17 = [[objc_msgSend(a4, "characteristics") count];
        id v18 = [a4 UUID];
        int poshCharacteristicsToDiscover = v12->_poshCharacteristicsToDiscover;
        *(_DWORD *)uint64_t buf = 68290051;
        __int16 v167 = 2082;
        int v166 = 0;
        v168 = "";
        __int16 v169 = 2113;
        id v170 = v16;
        __int16 v171 = 1026;
        *(_DWORD *)v172 = v17;
        *(_WORD *)&v172[4] = 2113;
        *(void *)&v172[6] = v18;
        *(_WORD *)&v172[14] = 1026;
        *(_DWORD *)&v172[16] = poshCharacteristicsToDiscover;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh didDiscoverCharacteristics\", \"item\":%{private, location:escape_only}@, \"count\":%{public}d, \"service\":%{private, location:escape_only}@, \"left\":%{public}d}", buf, 0x32u);
      }
      activeTask = v12->_activeTask;
      long long v158 = 0u;
      long long v159 = 0u;
      long long v160 = 0u;
      long long v161 = 0u;
      id obj = [a4 characteristics];
      id v20 = [obj countByEnumeratingWithState:&v158 objects:v178 count:16];
      if (v20)
      {
        id v21 = v20;
        char v142 = 0;
        uint64_t v22 = *(void *)v159;
        id v23 = &_s10Foundation4DataVAA15ContiguousBytesAAWP_ptr;
        do
        {
          id v24 = 0;
          do
          {
            if (*(void *)v159 != v22) {
              objc_enumerationMutation(obj);
            }
            __int16 v25 = *(void **)(*((void *)&v158 + 1) + 8 * (void)v24);
            if (objc_msgSend(objc_msgSend(v25, "UUID"), "isEqual:", objc_msgSend(v23[504], "_cl_PoshAccessoryNonOwnerCharacteristicUUID")))
            {
              if (qword_102419390 != -1) {
                dispatch_once(&qword_102419390, &stru_102332198);
              }
              BOOL v26 = qword_102419398;
              if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
              {
                id v27 = [[-[NSUUID description](v12->_uuid, "description") substringToIndex:8];
                *(_DWORD *)uint64_t buf = 68289283;
                int v166 = 0;
                __int16 v167 = 2082;
                v168 = "";
                __int16 v169 = 2113;
                id v170 = v27;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut #posh non-owner Control Point\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
              }
              [(CLDurianDevice *)v12 setPoshNonOwnerCharacteristic:v25];
              char v142 = 1;
            }
            [a3 setNotifyValue:v142 & 1 forCharacteristic:v25];
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102332198);
            }
            uint32_t v28 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v29 = [[-[NSUUID description](v12->_uuid, "description") substringToIndex:8];
              id v140 = [v25 UUID];
              id v30 = [(CLDurianDevice *)v12 activeTask];
              id v31 = v23;
              id v32 = v21;
              uint64_t v33 = v22;
              id v34 = [v25 value];
              id v35 = [(CLDurianTask *)activeTask characteristicPayload];
              id v36 = [v25 properties];
              *(_DWORD *)uint64_t buf = 68290563;
              int v166 = 0;
              __int16 v167 = 2082;
              v168 = "";
              __int16 v169 = 2113;
              id v170 = v29;
              __int16 v171 = 2113;
              *(void *)v172 = v140;
              *(_WORD *)&v172[8] = 2113;
              *(void *)&v172[10] = v30;
              int v12 = self;
              *(_WORD *)&v172[18] = 2113;
              id v173 = v34;
              uint64_t v22 = v33;
              id v21 = v32;
              id v23 = v31;
              __int16 v174 = 2113;
              id v175 = v35;
              __int16 v176 = 2050;
              id v177 = v36;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut #posh enabling notifications & indications for characteristic\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@, \"payload\":%{private, location:escape_only}@, \"characteristic properties\":%{public}ld}", buf, 0x4Eu);
            }
            id v24 = (char *)v24 + 1;
          }
          while (v21 != v24);
          id v21 = [obj countByEnumeratingWithState:&v158 objects:v178 count:16];
        }
        while (v21);
      }
      if (!v12->_poshCharacteristicsToDiscover)
      {
        if (!v12->_poshNonOwnerCharacteristic)
        {
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102332198);
          }
          id v37 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
          {
            id v38 = [[-[NSUUID description](v12->_uuid, "description") substringToIndex:8];
            *(_DWORD *)uint64_t buf = 68289539;
            int v166 = 0;
            __int16 v167 = 2082;
            v168 = "";
            __int16 v169 = 2113;
            id v170 = v38;
            __int16 v171 = 2082;
            *(void *)v172 = "config";
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #posh failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102332198);
            }
          }
          uint64_t v39 = qword_102419398;
          if (os_signpost_enabled((os_log_t)qword_102419398))
          {
            id v40 = [[-[NSUUID description](v12->_uuid, "description") substringToIndex:8];
            *(_DWORD *)uint64_t buf = 68289539;
            int v166 = 0;
            __int16 v167 = 2082;
            v168 = "";
            __int16 v169 = 2113;
            id v170 = v40;
            __int16 v171 = 2082;
            *(void *)v172 = "config";
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #posh failed to discover", "{\"msg%{public}.0s\":\"#durian #posh failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
          }
        }
        [(CLDurianDevice *)v12 activate];
      }
      return;
    }
    id v135 = a4;
    if ([(CLDurianDevice *)v12 isAirTag])
    {
      v137 = v12->_activeTask;
      long long v154 = 0u;
      long long v155 = 0u;
      long long v156 = 0u;
      long long v157 = 0u;
      id obja = [a4 characteristics];
      id v41 = [obja countByEnumeratingWithState:&v154 objects:v164 count:16];
      if (v41)
      {
        id v42 = v41;
        char v143 = 0;
        uint64_t v43 = *(void *)v155;
        id v44 = &_s10Foundation4DataVAA15ContiguousBytesAAWP_ptr;
        do
        {
          id v45 = 0;
          do
          {
            if (*(void *)v155 != v43) {
              objc_enumerationMutation(obja);
            }
            id v46 = *(void **)(*((void *)&v154 + 1) + 8 * (void)v45);
            if (objc_msgSend(objc_msgSend(v46, "UUID"), "isEqual:", objc_msgSend(v44[504], "_cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID")))
            {
              if (qword_102419390 != -1) {
                dispatch_once(&qword_102419390, &stru_102332198);
              }
              unint64_t v47 = qword_102419398;
              if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
              {
                id v48 = [[-[NSUUID description](v12->_uuid, "description") substringToIndex:8];
                *(_DWORD *)uint64_t buf = 68289283;
                int v166 = 0;
                __int16 v167 = 2082;
                v168 = "";
                __int16 v169 = 2113;
                id v170 = v48;
                _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut Precise Finding Control Point\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
              }
              [(CLDurianDevice *)v12 setDurianNonOwnerPreciseFindingCharacteristic:v46];
              char v143 = 1;
            }
            [a3 setNotifyValue:v143 & 1 forCharacteristic:v46];
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102332198);
            }
            id v49 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v141 = [[-[NSUUID description](v12->_uuid, "description") substringToIndex:8];
              id v50 = [v46 UUID];
              double v51 = v44;
              id v52 = v42;
              uint64_t v53 = v43;
              id v54 = [(CLDurianDevice *)self activeTask];
              id v55 = [v46 value];
              id v56 = [(CLDurianTask *)v137 characteristicPayload];
              id v57 = [v46 properties];
              *(_DWORD *)uint64_t buf = 68290563;
              int v166 = 0;
              __int16 v167 = 2082;
              v168 = "";
              __int16 v169 = 2113;
              id v170 = v141;
              __int16 v171 = 2113;
              *(void *)v172 = v50;
              int v12 = self;
              *(_WORD *)&v172[8] = 2113;
              *(void *)&v172[10] = v54;
              uint64_t v43 = v53;
              id v42 = v52;
              id v44 = v51;
              *(_WORD *)&v172[18] = 2113;
              id v173 = v55;
              __int16 v174 = 2113;
              id v175 = v56;
              __int16 v176 = 2049;
              id v177 = v57;
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut enabling notifications & indications for characteristic\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@, \"payload\":%{private, location:escape_only}@, \"characteristic properties\":%{private}ld}", buf, 0x4Eu);
            }
            id v45 = (char *)v45 + 1;
          }
          while (v42 != v45);
          id v42 = [obja countByEnumeratingWithState:&v154 objects:v164 count:16];
        }
        while (v42);
      }
    }
    if (![(CLDurianDevice *)v12 isHawkeyeAccessory]) {
      goto LABEL_169;
    }
    --v12->_hawkeyeCharacteristicsToDiscover;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v58 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v59 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      unsigned int v60 = [[[v135 characteristics] count];
      id v61 = [v135 UUID];
      int hawkeyeCharacteristicsToDiscover = self->_hawkeyeCharacteristicsToDiscover;
      *(_DWORD *)uint64_t buf = 68290051;
      __int16 v167 = 2082;
      int v166 = 0;
      v168 = "";
      __int16 v169 = 2113;
      id v170 = v59;
      __int16 v171 = 1026;
      *(_DWORD *)v172 = v60;
      *(_WORD *)&v172[4] = 2113;
      *(void *)&v172[6] = v61;
      *(_WORD *)&v172[14] = 1026;
      *(_DWORD *)&v172[16] = hawkeyeCharacteristicsToDiscover;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didDiscoverCharacteristics\", \"item\":%{private, location:escape_only}@, \"count\":%{public}d, \"service\":%{private, location:escape_only}@, \"left\":%{public}d}", buf, 0x32u);
    }
    long long v152 = 0u;
    long long v153 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    id v63 = [v135 characteristics];
    id v64 = [v63 countByEnumeratingWithState:&v150 objects:v163 count:16];
    if (v64)
    {
      id v65 = v64;
      uint64_t v66 = *(void *)v151;
      do
      {
        id v67 = 0;
        do
        {
          if (*(void *)v151 != v66) {
            objc_enumerationMutation(v63);
          }
          id v68 = *(void **)(*((void *)&v150 + 1) + 8 * (void)v67);
          if (objc_msgSend(objc_msgSend(v68, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID")))
          {
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102332198);
            }
            unsigned int v69 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v70 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
              *(_DWORD *)uint64_t buf = 68289283;
              int v166 = 0;
              __int16 v167 = 2082;
              v168 = "";
              __int16 v169 = 2113;
              id v170 = v70;
              _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye Configuration Control Point\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
            }
            uint64_t v71 = self;
            [(CLDurianDevice *)self setHawkeyeConfigurationCharacteristic:v68];
            goto LABEL_82;
          }
          if (objc_msgSend(objc_msgSend(v68, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID")))
          {
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102332198);
            }
            id v72 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v73 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
              *(_DWORD *)uint64_t buf = 68289283;
              int v166 = 0;
              __int16 v167 = 2082;
              v168 = "";
              __int16 v169 = 2113;
              id v170 = v73;
              _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye Non-Owner Control Point\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
            }
            [(CLDurianDevice *)self setHawkeyeNonOwnerCharacteristic:v68];
LABEL_108:
            [a3 setNotifyValue:1 forCharacteristic:v68];
            goto LABEL_109;
          }
          if (objc_msgSend(objc_msgSend(v68, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyePairedOwnerInformationCharacteristicUUID](CBUUID, "_cl_HawkeyePairedOwnerInformationCharacteristicUUID")))
          {
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102332198);
            }
            long long v74 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v75 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
              *(_DWORD *)uint64_t buf = 68289283;
              int v166 = 0;
              __int16 v167 = 2082;
              v168 = "";
              __int16 v169 = 2113;
              id v170 = v75;
              _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye Paired Owner Information Control Point\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
            }
            [(CLDurianDevice *)self setHawkeyePairedOwnerInformationCharacteristic:v68];
            goto LABEL_108;
          }
          if (objc_msgSend(objc_msgSend(v68, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyeDebugCharacteristicUUID](CBUUID, "_cl_HawkeyeDebugCharacteristicUUID")))
          {
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102332198);
            }
            long long v76 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v77 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
              *(_DWORD *)uint64_t buf = 68289283;
              int v166 = 0;
              __int16 v167 = 2082;
              v168 = "";
              __int16 v169 = 2113;
              id v170 = v77;
              _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye Debug Control Point\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
            }
            [(CLDurianDevice *)self setHawkeyeDebugCharacteristic:v68];
            goto LABEL_108;
          }
          if (objc_msgSend(objc_msgSend(v68, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyePreciseFindingCharacteristicUUID](CBUUID, "_cl_HawkeyePreciseFindingCharacteristicUUID")))
          {
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102332198);
            }
            long long v78 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v79 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
              *(_DWORD *)uint64_t buf = 68289283;
              int v166 = 0;
              __int16 v167 = 2082;
              v168 = "";
              __int16 v169 = 2113;
              id v170 = v79;
              _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye Precise Finding Control Point\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
            }
            [(CLDurianDevice *)self setHawkeyePreciseFindingCharacteristic:v68];
            goto LABEL_108;
          }
          if (objc_msgSend(objc_msgSend(v68, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyeAccessoryFirmwareUpdateMsgCharacteristicUUID](CBUUID, "_cl_HawkeyeAccessoryFirmwareUpdateMsgCharacteristicUUID")))
          {
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102332198);
            }
            long long v80 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v81 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
              id v82 = [v68 UUID];
              *(_DWORD *)uint64_t buf = 68289539;
              int v166 = 0;
              __int16 v167 = 2082;
              v168 = "";
              __int16 v169 = 2113;
              id v170 = v81;
              __int16 v171 = 2114;
              *(void *)v172 = v82;
              _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye #firmwareUpdate Discovered Firmware Update\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}@}", buf, 0x26u);
            }
            uint64_t v71 = self;
            [(CLDurianDevice *)self setHawkeyeFirmwareUpdateCharacteristic:v68];
LABEL_82:
            if ((id)[(CLDurianDevice *)v71 ownership] == (id)1) {
              goto LABEL_108;
            }
          }
LABEL_109:
          id v67 = (char *)v67 + 1;
        }
        while (v65 != v67);
        id v83 = [v63 countByEnumeratingWithState:&v150 objects:v163 count:16];
        id v65 = v83;
      }
      while (v83);
    }
    int v12 = self;
    if (!self->_hawkeyeCharacteristicsToDiscover)
    {
      if (!self->_hawkeyeConfigurationCharacteristic)
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
        long long v84 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
        {
          id v85 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
          *(_DWORD *)uint64_t buf = 68289539;
          int v166 = 0;
          __int16 v167 = 2082;
          v168 = "";
          __int16 v169 = 2113;
          id v170 = v85;
          __int16 v171 = 2082;
          *(void *)v172 = "config";
          _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102332198);
          }
        }
        id v86 = qword_102419398;
        if (os_signpost_enabled((os_log_t)qword_102419398))
        {
          id v87 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
          *(_DWORD *)uint64_t buf = 68289539;
          int v166 = 0;
          __int16 v167 = 2082;
          v168 = "";
          __int16 v169 = 2113;
          id v170 = v87;
          __int16 v171 = 2082;
          *(void *)v172 = "config";
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v86, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye failed to discover", "{\"msg%{public}.0s\":\"#durian #hawkeye failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
        }
      }
      if (!self->_hawkeyeNonOwnerCharacteristic)
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
        unsigned int v88 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
        {
          id v89 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
          *(_DWORD *)uint64_t buf = 68289539;
          int v166 = 0;
          __int16 v167 = 2082;
          v168 = "";
          __int16 v169 = 2113;
          id v170 = v89;
          __int16 v171 = 2082;
          *(void *)v172 = "nonowner";
          _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102332198);
          }
        }
        BOOL v90 = qword_102419398;
        if (os_signpost_enabled((os_log_t)qword_102419398))
        {
          id v91 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
          *(_DWORD *)uint64_t buf = 68289539;
          int v166 = 0;
          __int16 v167 = 2082;
          v168 = "";
          __int16 v169 = 2113;
          id v170 = v91;
          __int16 v171 = 2082;
          *(void *)v172 = "nonowner";
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v90, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye failed to discover", "{\"msg%{public}.0s\":\"#durian #hawkeye failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
        }
      }
      if (!self->_hawkeyePairedOwnerInformationCharacteristic)
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
        id v92 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
        {
          id v93 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
          *(_DWORD *)uint64_t buf = 68289539;
          int v166 = 0;
          __int16 v167 = 2082;
          v168 = "";
          __int16 v169 = 2113;
          id v170 = v93;
          __int16 v171 = 2082;
          *(void *)v172 = "pairedowner";
          _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102332198);
          }
        }
        id v94 = qword_102419398;
        if (os_signpost_enabled((os_log_t)qword_102419398))
        {
          id v95 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
          *(_DWORD *)uint64_t buf = 68289539;
          int v166 = 0;
          __int16 v167 = 2082;
          v168 = "";
          __int16 v169 = 2113;
          id v170 = v95;
          __int16 v171 = 2082;
          *(void *)v172 = "pairedowner";
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v94, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye failed to discover", "{\"msg%{public}.0s\":\"#durian #hawkeye failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
        }
      }
      if (!self->_hawkeyeDebugCharacteristic)
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
        v96 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
        {
          id v97 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
          *(_DWORD *)uint64_t buf = 68289539;
          int v166 = 0;
          __int16 v167 = 2082;
          v168 = "";
          __int16 v169 = 2113;
          id v170 = v97;
          __int16 v171 = 2082;
          *(void *)v172 = "debug";
          _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102332198);
          }
        }
        __int16 v98 = qword_102419398;
        if (os_signpost_enabled((os_log_t)qword_102419398))
        {
          id v99 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
          *(_DWORD *)uint64_t buf = 68289539;
          int v166 = 0;
          __int16 v167 = 2082;
          v168 = "";
          __int16 v169 = 2113;
          id v170 = v99;
          __int16 v171 = 2082;
          *(void *)v172 = "debug";
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v98, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye failed to discover", "{\"msg%{public}.0s\":\"#durian #hawkeye failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
        }
      }
      if (!self->_hawkeyePreciseFindingCharacteristic)
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
        id v100 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
        {
          id v101 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
          *(_DWORD *)uint64_t buf = 68289539;
          int v166 = 0;
          __int16 v167 = 2082;
          v168 = "";
          __int16 v169 = 2113;
          id v170 = v101;
          __int16 v171 = 2082;
          *(void *)v172 = "r1finding";
          _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102332198);
          }
        }
        __int16 v102 = qword_102419398;
        if (os_signpost_enabled((os_log_t)qword_102419398))
        {
          id v103 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
          *(_DWORD *)uint64_t buf = 68289539;
          int v166 = 0;
          __int16 v167 = 2082;
          v168 = "";
          __int16 v169 = 2113;
          id v170 = v103;
          __int16 v171 = 2082;
          *(void *)v172 = "r1finding";
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v102, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye failed to discover", "{\"msg%{public}.0s\":\"#durian #hawkeye failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
        }
      }
      if (!self->_hawkeyeFirmwareUpdateCharacteristic)
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
        __int16 v104 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
        {
          id v105 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
          *(_DWORD *)uint64_t buf = 68289539;
          int v166 = 0;
          __int16 v167 = 2082;
          v168 = "";
          __int16 v169 = 2113;
          id v170 = v105;
          __int16 v171 = 2082;
          *(void *)v172 = "fwupdate";
          _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102332198);
          }
        }
        __int16 v106 = qword_102419398;
        if (os_signpost_enabled((os_log_t)qword_102419398))
        {
          id v107 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
          *(_DWORD *)uint64_t buf = 68289539;
          int v166 = 0;
          __int16 v167 = 2082;
          v168 = "";
          __int16 v169 = 2113;
          id v170 = v107;
          __int16 v171 = 2082;
          *(void *)v172 = "fwupdate";
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v106, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye failed to discover", "{\"msg%{public}.0s\":\"#durian #hawkeye failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
        }
      }
      [(CLDurianDevice *)self activate];
    }
    [(CLDurianDevice *)self activeTask];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_169:
      [(CLDurianDevice *)v12 activeTask];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v108 = [(CLDurianDevice *)v12 activeTask];
        long long v146 = 0u;
        long long v147 = 0u;
        long long v148 = 0u;
        long long v149 = 0u;
        id v109 = [v135 characteristics];
        id v110 = [v109 countByEnumeratingWithState:&v146 objects:v162 count:16];
        if (v110)
        {
          id v111 = v110;
          uint64_t v112 = *(void *)v147;
          do
          {
            v113 = 0;
            do
            {
              if (*(void *)v147 != v112) {
                objc_enumerationMutation(v109);
              }
              v114 = *(void **)(*((void *)&v146 + 1) + 8 * (void)v113);
              if (objc_msgSend(objc_msgSend(v114, "UUID"), "isEqual:", -[CLDurianTask characteristicUUID](v108, "characteristicUUID")))
              {
                [(CLDurianTask *)v108 setCharacteristic:v114];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [(CBCentralManager *)self->_centralManager sendData:[(CLDurianCommand *)[(CLDurianTask *)v108 command] bytes] toPeripheral:self->_activePeripheral];
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v115 = self;
                    if ([(CLDurianDevice *)self isHawkeyeAccessory])
                    {
                      if (qword_102419390 != -1) {
                        dispatch_once(&qword_102419390, &stru_102332198);
                      }
                      v116 = qword_102419398;
                      v115 = self;
                      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
                      {
                        id v117 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
                        id v118 = [(CLDurianTask *)v108 characteristic];
                        id v119 = [(CLDurianTask *)v108 characteristicPayload];
                        *(_DWORD *)uint64_t buf = 68289795;
                        int v166 = 0;
                        __int16 v167 = 2082;
                        v168 = "";
                        __int16 v169 = 2113;
                        id v170 = v117;
                        __int16 v171 = 2113;
                        *(void *)v172 = v118;
                        *(_WORD *)&v172[8] = 2113;
                        *(void *)&v172[10] = v119;
                        _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye ReadTask\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"payload\":%{private, location:escape_only}@}", buf, 0x30u);
                      }
                    }
                    [(CBPeripheral *)v115->_activePeripheral readValueForCharacteristic:[(CLDurianTask *)v108 characteristic]];
                  }
                  else
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v120 = [(CLDurianTask *)v108 characteristicPayload];
                      if ([(CLDurianDevice *)self isHawkeyeAccessory]) {
                        id v120 = [(CLDurianTask *)v108 nextPacketOfMaxSize:self->_maxPacketSizeForGATTWriteWithResponse];
                      }
                      if (qword_102419390 != -1) {
                        dispatch_once(&qword_102419390, &stru_102332198);
                      }
                      v121 = qword_102419398;
                      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
                      {
                        id v122 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
                        id v123 = [(CLDurianTask *)v108 characteristic];
                        unint64_t maxPacketSizeForGATTWriteWithResponse = self->_maxPacketSizeForGATTWriteWithResponse;
                        *(_DWORD *)uint64_t buf = 68290051;
                        int v166 = 0;
                        __int16 v167 = 2082;
                        v168 = "";
                        __int16 v169 = 2113;
                        id v170 = v122;
                        __int16 v171 = 2113;
                        *(void *)v172 = v123;
                        *(_WORD *)&v172[8] = 2113;
                        *(void *)&v172[10] = v120;
                        *(_WORD *)&v172[18] = 2049;
                        id v173 = (id)maxPacketSizeForGATTWriteWithResponse;
                        _os_log_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian WriteTask\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"packet\":%{private, location:escape_only}@, \"maxPacketSize\":%{private}lu}", buf, 0x3Au);
                      }
                      [(CBPeripheral *)self->_activePeripheral writeValue:v120 forCharacteristic:[(CLDurianTask *)v108 characteristic] type:0];
                    }
                  }
                }
              }
              v113 = (char *)v113 + 1;
            }
            while (v111 != v113);
            id v111 = [v109 countByEnumeratingWithState:&v146 objects:v162 count:16];
          }
          while (v111);
        }
        if (![(CLDurianTask *)v108 characteristic])
        {
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102332198);
          }
          v125 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id v126 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
            id v127 = [[objc_msgSend(-[CBPeripheral identifier](self->_activePeripheral, "identifier"), "description") substringToIndex:8];
            id v128 = [(CLDurianTask *)v108 characteristicUUID];
            *(_DWORD *)uint64_t buf = 68289795;
            int v166 = 0;
            __int16 v167 = 2082;
            v168 = "";
            __int16 v169 = 2113;
            id v170 = v126;
            __int16 v171 = 2113;
            *(void *)v172 = v127;
            *(_WORD *)&v172[8] = 2113;
            *(void *)&v172[10] = v128;
            _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian failed to discover needed characteristic\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@}", buf, 0x30u);
          }
        }
      }
      else
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
        v129 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
        {
          id v130 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
          v131 = [(CLDurianDevice *)self activeTask];
          *(_DWORD *)uint64_t buf = 68289539;
          int v166 = 0;
          __int16 v167 = 2082;
          v168 = "";
          __int16 v169 = 2113;
          id v170 = v130;
          __int16 v171 = 2113;
          *(void *)v172 = v131;
          _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian discovered characteristics, but active task is not a GATT task\", \"item\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@}", buf, 0x26u);
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102332198);
          }
        }
        v132 = qword_102419398;
        if (os_signpost_enabled((os_log_t)qword_102419398))
        {
          id v133 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
          v134 = [(CLDurianDevice *)self activeTask];
          *(_DWORD *)uint64_t buf = 68289539;
          int v166 = 0;
          __int16 v167 = 2082;
          v168 = "";
          __int16 v169 = 2113;
          id v170 = v133;
          __int16 v171 = 2113;
          *(void *)v172 = v134;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v132, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian discovered characteristics, but active task is not a GATT task", "{\"msg%{public}.0s\":\"#durian discovered characteristics, but active task is not a GATT task\", \"item\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@}", buf, 0x26u);
        }
      }
    }
  }
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  if ([(CLDurianDevice *)self isHawkeyeAccessory])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v9 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      int v49 = 68290051;
      int v50 = 0;
      __int16 v51 = 2082;
      id v52 = "";
      __int16 v53 = 2113;
      id v54 = v10;
      __int16 v55 = 2113;
      id v56 = [[[a3 identifier] description] substringToIndex:8];
      __int16 v57 = 2113;
      id v58 = a4;
      __int16 v59 = 2113;
      id v60 = a5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didWriteValueForCharacteristic\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v49, 0x3Au);
    }
  }
  [(CLDurianDevice *)self activeTask];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || ([(CLDurianDevice *)self activeTask], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (a5)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      id v11 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
      {
        id v12 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        id v13 = [[objc_msgSend(-[CBPeripheral identifier](self->_activePeripheral, "identifier"), "description") substringToIndex:8];
        id v14 = [a4 UUID];
        id v15 = [a5 localizedDescription];
        int v49 = 68290051;
        int v50 = 0;
        __int16 v51 = 2082;
        id v52 = "";
        __int16 v53 = 2113;
        id v54 = v12;
        __int16 v55 = 2113;
        id v56 = v13;
        __int16 v57 = 2113;
        id v58 = v14;
        __int16 v59 = 2113;
        id v60 = v15;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian error writing value for characteristic\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"characteristicUUID\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v49, 0x3Au);
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
      }
      id v16 = qword_102419398;
      if (os_signpost_enabled((os_log_t)qword_102419398))
      {
        id v17 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        id v18 = [[objc_msgSend(-[CBPeripheral identifier](self->_activePeripheral, "identifier"), "description") substringToIndex:8];
        id v19 = [a4 UUID];
        id v20 = [a5 localizedDescription];
        int v49 = 68290051;
        int v50 = 0;
        __int16 v51 = 2082;
        id v52 = "";
        __int16 v53 = 2113;
        id v54 = v17;
        __int16 v55 = 2113;
        id v56 = v18;
        __int16 v57 = 2113;
        id v58 = v19;
        __int16 v59 = 2113;
        id v60 = v20;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian error writing value for characteristic", "{\"msg%{public}.0s\":\"#durian error writing value for characteristic\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"characteristicUUID\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v49, 0x3Au);
      }
      if ([(CLDurianDevice *)self isNonOwnerSoundTask:[(CLDurianCommand *)[(CLDurianTask *)[(CLDurianDevice *)self activeTask] command] opcode]])
      {
        uint64_t v21 = 1;
      }
      else
      {
        uint64_t v21 = 42;
      }
      [(CLDurianDeviceDelegate *)[(CLDurianDevice *)self delegate] device:self didFailToCompleteTask:[(CLDurianDevice *)self activeTask] withError:v21 andDisconnect:1];
      [(CLDurianDevice *)self completeCurrentTask];
    }
    else
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      uint64_t v22 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        id v24 = [a4 UUID];
        id v25 = [a4 value];
        int v49 = 68289795;
        int v50 = 0;
        __int16 v51 = 2082;
        id v52 = "";
        __int16 v53 = 2113;
        id v54 = v23;
        __int16 v55 = 2113;
        id v56 = v24;
        __int16 v57 = 2113;
        id v58 = v25;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian wrote value for characteristic\", \"item\":%{private, location:escape_only}@, \"characteristicUUID\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@}", (uint8_t *)&v49, 0x30u);
      }
    }
    if ([(CLDurianDevice *)self isPoshAccessory]
      && objc_msgSend(objc_msgSend(a4, "UUID"), "isEqual:", +[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID](CBUUID, "_cl_PoshAccessoryNonOwnerCharacteristicUUID")))
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      BOOL v26 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        id v28 = [a4 UUID];
        id v29 = [(CLDurianDevice *)self activeTask];
        id v30 = [a4 value];
        int v49 = 68290051;
        int v50 = 0;
        __int16 v51 = 2082;
        id v52 = "";
        __int16 v53 = 2113;
        id v54 = v27;
        __int16 v55 = 2113;
        id v56 = v28;
        __int16 v57 = 2113;
        id v58 = v29;
        __int16 v59 = 2113;
        id v60 = v30;
        id v31 = "{\"msg%{public}.0s\":\"#durian #ut #posh wrote to characteristic\", \"item\":%{private, location:escape_on"
              "ly}@, \"characteristic\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@, \""
              "value\":%{private, location:escape_only}@}";
LABEL_36:
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v31, (uint8_t *)&v49, 0x3Au);
      }
    }
    else if ([(CLDurianDevice *)self isAirTag] {
           && objc_msgSend(objc_msgSend(a4, "UUID"), "isEqual:", +[CBUUID _cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID](CBUUID, "_cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID")))
    }
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      BOOL v26 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v32 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        id v33 = [a4 UUID];
        id v34 = [(CLDurianDevice *)self activeTask];
        id v35 = [a4 value];
        int v49 = 68290051;
        int v50 = 0;
        __int16 v51 = 2082;
        id v52 = "";
        __int16 v53 = 2113;
        id v54 = v32;
        __int16 v55 = 2113;
        id v56 = v33;
        __int16 v57 = 2113;
        id v58 = v34;
        __int16 v59 = 2113;
        id v60 = v35;
        id v31 = "{\"msg%{public}.0s\":\"#durian #ut wrote to characteristic\", \"item\":%{private, location:escape_only}@, "
              "\"characteristic\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@, \"value\""
              ":%{private, location:escape_only}@}";
        goto LABEL_36;
      }
    }
    else
    {
      [(CLDurianDevice *)self activeTask];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v36 = [(CLDurianDevice *)self activeTask];
        if ([(CLDurianDevice *)self isHawkeyeAccessory]
          && ([(CLDurianTask *)v36 doneSendingPayload] & 1) == 0)
        {
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102332198);
          }
          unint64_t v47 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id v48 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
            int v49 = 68289283;
            int v50 = 0;
            __int16 v51 = 2082;
            id v52 = "";
            __int16 v53 = 2113;
            id v54 = v48;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye Sending next fragment of the message\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v49, 0x1Cu);
          }
          [(CBPeripheral *)self->_activePeripheral writeValue:[(CLDurianTask *)v36 nextPacketOfMaxSize:self->_maxPacketSizeForGATTWriteWithResponse] forCharacteristic:[(CLDurianTask *)v36 characteristic] type:0];
        }
        else
        {
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102332198);
          }
          id v37 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id v38 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
            int v49 = 68289283;
            int v50 = 0;
            __int16 v51 = 2082;
            id v52 = "";
            __int16 v53 = 2113;
            id v54 = v38;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye Sent last message fragment\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v49, 0x1Cu);
          }
          [(CLDurianDeviceDelegate *)[(CLDurianDevice *)self delegate] device:self didCompleteTask:[(CLDurianDevice *)self activeTask] withCompletionCommand:0];
          [(CLDurianDevice *)self completeCurrentTask];
        }
      }
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    uint64_t v39 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      id v40 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      id v41 = [a4 UUID];
      id v42 = [(CLDurianDevice *)self activeTask];
      int v49 = 68289795;
      int v50 = 0;
      __int16 v51 = 2082;
      id v52 = "";
      __int16 v53 = 2113;
      id v54 = v40;
      __int16 v55 = 2113;
      id v56 = v41;
      __int16 v57 = 2113;
      id v58 = v42;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian received characteristic write callback, but active task is not a GATTWriteTask\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@}", (uint8_t *)&v49, 0x30u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
    }
    uint64_t v43 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      id v44 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      id v45 = [a4 UUID];
      id v46 = [(CLDurianDevice *)self activeTask];
      int v49 = 68289795;
      int v50 = 0;
      __int16 v51 = 2082;
      id v52 = "";
      __int16 v53 = 2113;
      id v54 = v44;
      __int16 v55 = 2113;
      id v56 = v45;
      __int16 v57 = 2113;
      id v58 = v46;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian received characteristic write callback, but active task is not a GATTWriteTask", "{\"msg%{public}.0s\":\"#durian received characteristic write callback, but active task is not a GATTWriteTask\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@}", (uint8_t *)&v49, 0x30u);
    }
  }
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  [(CLDurianDevice *)self activeTask];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || ([(CLDurianDevice *)self activeTask], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    uint64_t v7 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      int v26 = 68289283;
      int v27 = 0;
      __int16 v28 = 2082;
      id v29 = "";
      __int16 v30 = 2113;
      id v31 = v8;
      id v9 = "{\"msg%{public}.0s\":\"#durian #hawkeye #ut didUpdateNotificationState\", \"item\":%{private, location:escape_only}@}";
      id v10 = v7;
      uint32_t v11 = 28;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v26, v11);
    }
  }
  else
  {
    [(CLDurianDevice *)self activeTask];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v13 = [(CLDurianDevice *)self activeTask];
    if (isKindOfClass)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      uint64_t v14 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        int v26 = 68290307;
        int v27 = 0;
        __int16 v28 = 2082;
        id v29 = "";
        __int16 v30 = 2113;
        id v31 = v15;
        __int16 v32 = 2114;
        id v33 = a4;
        __int16 v34 = 2114;
        id v35 = (CLDurianTask *)[(CLDurianTask *)v13 characteristic];
        __int16 v36 = 1026;
        BOOL v37 = [(CLDurianTask *)v13 characteristic] == a4;
        __int16 v38 = 2114;
        uint64_t v39 = [(CLDurianTask *)v13 command];
        id v9 = "{\"msg%{public}.0s\":\"#durian #hawkeye #posh didUpdateNotificationState GATTRead\", \"item\":%{private, lo"
             "cation:escape_only}@, \"characteristic\":%{public, location:escape_only}@, \"active\":%{public, location:es"
             "cape_only}@, \"send\":%{public}hhd, \"command\":%{public, location:escape_only}@}";
        id v10 = v14;
        uint32_t v11 = 64;
        goto LABEL_7;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = [(CLDurianDevice *)self activeTask];
        if ([(CLDurianTask *)v16 characteristic] == a4)
        {
          centralManager = self->_centralManager;
          id v18 = [(CLDurianCommand *)[(CLDurianTask *)v16 command] bytes];
          activePeripheral = self->_activePeripheral;
          [(CBCentralManager *)centralManager sendData:v18 toPeripheral:activePeripheral];
        }
      }
      else
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102332198);
        }
        id v20 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
        {
          id v21 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
          int v26 = 68289795;
          int v27 = 0;
          __int16 v28 = 2082;
          id v29 = "";
          __int16 v30 = 2113;
          id v31 = v21;
          __int16 v32 = 2113;
          id v33 = [a4 UUID];
          __int16 v34 = 2113;
          id v35 = [(CLDurianDevice *)self activeTask];
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian received characteristic notification state update, but active task is not a GATTReceiveTask\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@}", (uint8_t *)&v26, 0x30u);
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102332198);
          }
        }
        uint64_t v22 = qword_102419398;
        if (os_signpost_enabled((os_log_t)qword_102419398))
        {
          id v23 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
          id v24 = [a4 UUID];
          id v25 = [(CLDurianDevice *)self activeTask];
          int v26 = 68289795;
          int v27 = 0;
          __int16 v28 = 2082;
          id v29 = "";
          __int16 v30 = 2113;
          id v31 = v23;
          __int16 v32 = 2113;
          id v33 = v24;
          __int16 v34 = 2113;
          id v35 = v25;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian received characteristic notification state update, but active task is not a GATTReceiveTask", "{\"msg%{public}.0s\":\"#durian received characteristic notification state update, but active task is not a GATTReceiveTask\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@}", (uint8_t *)&v26, 0x30u);
        }
      }
    }
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  if (a5)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      id v10 = [(CBPeripheral *)self->_activePeripheral identifier];
      int v41 = 68290051;
      __int16 v43 = 2082;
      int v42 = 0;
      id v44 = "";
      __int16 v45 = 2113;
      id v46 = v9;
      __int16 v47 = 2114;
      id v48 = v10;
      __int16 v49 = 2113;
      int v50 = (CLDurianTask *)[[[a4 UUID] description];
      __int16 v51 = 2113;
      id v52 = [a5 localizedDescription];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian error updating value for characteristic\", \"item\":%{private, location:escape_only}@, \"peripheralUUID\":%{public, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v41, 0x3Au);
    }
  }
  if ([(CLDurianDevice *)self isPoshAccessory]
    && objc_msgSend(objc_msgSend(a4, "UUID"), "isEqual:", +[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID](CBUUID, "_cl_PoshAccessoryNonOwnerCharacteristicUUID")))
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    uint32_t v11 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      id v13 = [a4 UUID];
      uint64_t v14 = [(CLDurianDevice *)self activeTask];
      id v15 = [a4 value];
      int v41 = 68290307;
      int v42 = 0;
      __int16 v43 = 2082;
      id v44 = "";
      __int16 v45 = 2113;
      id v46 = v12;
      __int16 v47 = 2113;
      id v48 = v13;
      __int16 v49 = 2113;
      int v50 = v14;
      __int16 v51 = 2113;
      id v52 = a4;
      __int16 v53 = 2113;
      id v54 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut #posh received data for characteristic\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@}", (uint8_t *)&v41, 0x44u);
    }
    if ([(CLDurianTask *)[(CLDurianDevice *)self activeTask] characteristic] == a4)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      id v16 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        id v18 = [a4 UUID];
        id v19 = (CLDurianTask *)[a4 value];
        int v41 = 68289795;
        int v42 = 0;
        __int16 v43 = 2082;
        id v44 = "";
        __int16 v45 = 2113;
        id v46 = v17;
        __int16 v47 = 2113;
        id v48 = v18;
        __int16 v49 = 2113;
        int v50 = v19;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh read characteristic\", \"item\":%{private, location:escape_only}@, \"characteristicUUID\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@}", (uint8_t *)&v41, 0x30u);
      }
    }
    -[CLDurianDevice didReceivePoshData:withCharacteristic:error:](self, "didReceivePoshData:withCharacteristic:error:", [a4 value], a4, a5);
    return;
  }
  if ([(CLDurianDevice *)self isHawkeyeAccessory])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v20 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      int v41 = 68289539;
      int v42 = 0;
      __int16 v43 = 2082;
      id v44 = "";
      __int16 v45 = 2113;
      id v46 = v21;
      __int16 v47 = 2113;
      id v48 = a4;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didUpdateValue\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@}", (uint8_t *)&v41, 0x26u);
    }
    if ((objc_msgSend(objc_msgSend(a4, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID")) & 1) != 0|| (objc_msgSend(objc_msgSend(a4, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyeDebugCharacteristicUUID](CBUUID, "_cl_HawkeyeDebugCharacteristicUUID")) & 1) != 0|| (objc_msgSend(objc_msgSend(a4, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyePairedOwnerInformationCharacteristicUUID](CBUUID, "_cl_HawkeyePairedOwnerInformationCharacteristicUUID")) & 1) != 0|| (objc_msgSend(objc_msgSend(a4, "UUID"),
                          "isEqual:",
                          +[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID")) & 1) != 0|| objc_msgSend(objc_msgSend(a4, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyePreciseFindingCharacteristicUUID](CBUUID, "_cl_HawkeyePreciseFindingCharacteristicUUID")))
    {
      goto LABEL_40;
    }
    if (objc_msgSend(objc_msgSend(a4, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyeAccessoryFirmwareUpdateMsgCharacteristicUUID](CBUUID, "_cl_HawkeyeAccessoryFirmwareUpdateMsgCharacteristicUUID")))
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      uint64_t v22 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        int v41 = 68289283;
        int v42 = 0;
        __int16 v43 = 2082;
        id v44 = "";
        __int16 v45 = 2113;
        id v46 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Received UARP fragment\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v41, 0x1Cu);
      }
      -[CLDurianDevice processUARPMessage:](self, "processUARPMessage:", [a4 value]);
      return;
    }
  }
  if ([(CLDurianDevice *)self isAirTag]
    && objc_msgSend(objc_msgSend(a4, "UUID"), "isEqual:", +[CBUUID _cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID](CBUUID, "_cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID")))
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v24 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      int v41 = 68289539;
      int v42 = 0;
      __int16 v43 = 2082;
      id v44 = "";
      __int16 v45 = 2113;
      id v46 = v25;
      __int16 v47 = 2113;
      id v48 = a4;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut didUpdateValue\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@}", (uint8_t *)&v41, 0x26u);
    }
LABEL_40:
    -[CLDurianDevice didReceiveHawkeyeData:withCharacteristic:error:](self, "didReceiveHawkeyeData:withCharacteristic:error:", [a4 value], a4, a5);
    return;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v26 = [(CLDurianDevice *)self activeTask];
    if ([(CLDurianTask *)v26 characteristic] == a4)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      int v27 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        id v29 = [a4 UUID];
        __int16 v30 = (CLDurianTask *)[a4 value];
        int v41 = 68289795;
        int v42 = 0;
        __int16 v43 = 2082;
        id v44 = "";
        __int16 v45 = 2113;
        id v46 = v28;
        __int16 v47 = 2113;
        id v48 = v29;
        __int16 v49 = 2113;
        int v50 = v30;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian read characteristic\", \"item\":%{private, location:escape_only}@, \"characteristicUUID\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@}", (uint8_t *)&v41, 0x30u);
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        -[CLDurianTask appendRecievedData:](v26, "appendRecievedData:", [a4 value]);
        if (objc_msgSend(objc_msgSend(a4, "value"), "length")) {
          [(CBPeripheral *)self->_activePeripheral readValueForCharacteristic:[(CLDurianTask *)v26 characteristic]];
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([(CLDurianDevice *)self isHawkeyeAccessory])
          {
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102332198);
            }
            BOOL v37 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v38 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
              uint64_t v39 = (CLDurianTask *)[a4 value];
              int v41 = 68289795;
              int v42 = 0;
              __int16 v43 = 2082;
              id v44 = "";
              __int16 v45 = 2113;
              id v46 = v38;
              __int16 v47 = 2113;
              id v48 = a4;
              __int16 v49 = 2113;
              int v50 = v39;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye GATTRead\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@}", (uint8_t *)&v41, 0x30u);
            }
          }
          id v40 = [a4 value];
          if ([(CLDurianDevice *)self hawkeyeTestMode] == 7)
          {
            LOBYTE(v41) = 3;
            id v40 = [objc_alloc((Class)NSData) initWithBytes:&v41 length:1];
          }
          [(CLDurianTask *)v26 setReadData:v40];
          [(CLDurianDeviceDelegate *)[(CLDurianDevice *)self delegate] device:self didCompleteTask:v26 withCompletionCommand:0];
          [(CLDurianDevice *)self completeCurrentTask];
        }
      }
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v31 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      id v32 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      unsigned int v33 = [(CLDurianCommand *)[(CLDurianTask *)self->_activeTask command] opcode];
      int v41 = 68289795;
      int v42 = 0;
      __int16 v43 = 2082;
      id v44 = "";
      __int16 v45 = 2113;
      id v46 = v32;
      __int16 v47 = 2113;
      id v48 = a4;
      __int16 v49 = 1026;
      LODWORD(v50) = v33;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian unexpected characteristic\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v41, 0x2Cu);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
    }
    __int16 v34 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      id v35 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      unsigned int v36 = [(CLDurianCommand *)[(CLDurianTask *)self->_activeTask command] opcode];
      int v41 = 68289795;
      int v42 = 0;
      __int16 v43 = 2082;
      id v44 = "";
      __int16 v45 = 2113;
      id v46 = v35;
      __int16 v47 = 2113;
      id v48 = a4;
      __int16 v49 = 1026;
      LODWORD(v50) = v36;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian unexpected characteristic", "{\"msg%{public}.0s\":\"#durian unexpected characteristic\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v41, 0x2Cu);
    }
  }
}

- (void)didGetPersonalizationInformation:(id)a3
{
  self->_BOOL retrievingPersonalizationInformation = 0;
}

- (void)didCompleteFirmwareUpdate:(id)a3
{
  if (a3)
  {
    -[CLDurianDevice informFirmwareUpdateFailureToClientWithError:](self, "informFirmwareUpdateFailureToClientWithError:");
    [(CLDurianDevice *)self exitFirmwareUpdateMode];
  }
  else
  {
    [(CLDurianDeviceDelegate *)self->_delegate didUpdateFirmwareForDevice:self error:0];
    *(_WORD *)&self->_firmwareUpdateInProgress = 256;
  }
}

- (void)didAbortFirmwareUpdate
{
  if (!self->_abortingFirmwareUpdate)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    SEL v3 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      *(_DWORD *)uint64_t buf = 68289283;
      int v9 = 0;
      __int16 v10 = 2082;
      uint32_t v11 = "";
      __int16 v12 = 2113;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #multi didAbortFirmwareUpdate\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    id v5 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v6 = NSLocalizedDescriptionKey;
    CFStringRef v7 = @"Firmware update aborted by device";
    -[CLDurianDevice informFirmwareUpdateFailureToClientWithError:](self, "informFirmwareUpdateFailureToClientWithError:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  }
  [(CLDurianDevice *)self exitFirmwareUpdateMode];
}

- (id)startEventCounter
{
  if (self->_connectionEventSpmiRequested)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    SEL v3 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      id v5 = [[-[CBPeripheral identifier](self->_activePeripheral, "identifier") description] substringToIndex:8];
      *(_DWORD *)uint64_t buf = 68289539;
      int v17 = 0;
      __int16 v18 = 2082;
      id v19 = "";
      __int16 v20 = 2113;
      id v21 = v4;
      __int16 v22 = 2113;
      id v23 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian startEventCounter requested but already on\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@}", buf, 0x26u);
    }
    return 0;
  }
  else if (self->_activePeripheral)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    id v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      id v10 = [[objc_msgSend(-[CBPeripheral identifier](self->_activePeripheral, "identifier"), "description") substringToIndex:8];
      *(_DWORD *)uint64_t buf = 68289539;
      int v17 = 0;
      __int16 v18 = 2082;
      id v19 = "";
      __int16 v20 = 2113;
      id v21 = v9;
      __int16 v22 = 2113;
      id v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian startEventCounter\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@}", buf, 0x26u);
    }
    id v6 = [(CBCentralManager *)self->_centralManager startConnectionEventCounterForPeripheral:self->_activePeripheral];
    if (!v6) {
      self->_connectionEventSpmiRequested = 1;
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    uint32_t v11 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v17 = 0;
      __int16 v18 = 2082;
      id v19 = "";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian startEventCounter active peripheral is nil\"}", buf, 0x12u);
    }
    id v12 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    CFStringRef v15 = @"cannot startEventCounter, active peripheral is nil";
    id v6 = [v12 initWithDomain:kCLErrorDomainPrivate code:6 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1)];
    id v13 = v6;
  }
  return v6;
}

- (id)stopEventCounter
{
  if (self->_connectionEventSpmiRequested)
  {
    if (!self->_activePeripheral)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332198);
      }
      id v10 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
        int v12 = 68289283;
        int v13 = 0;
        __int16 v14 = 2082;
        CFStringRef v15 = "";
        __int16 v16 = 2113;
        id v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian stopEventCounter active peripheral is nil, assuming connection event SPMI has stopped\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x1Cu);
      }
      id result = 0;
      goto LABEL_19;
    }
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    SEL v3 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      id v5 = [[objc_msgSend(-[CBPeripheral identifier](self->_activePeripheral, "identifier"), "description") substringToIndex:8];
      int v12 = 68289539;
      int v13 = 0;
      __int16 v14 = 2082;
      CFStringRef v15 = "";
      __int16 v16 = 2113;
      id v17 = v4;
      __int16 v18 = 2113;
      id v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian stopEventCounter\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x26u);
    }
    id result = [(CBCentralManager *)self->_centralManager stopConnectionEventCounterForPeripheral:self->_activePeripheral];
    if (!result) {
LABEL_19:
    }
      self->_connectionEventSpmiRequested = 0;
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
    CFStringRef v7 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
      id v9 = [[objc_msgSend(-[CBPeripheral identifier](self->_activePeripheral, "identifier"), "description") substringToIndex:8];
      int v12 = 68289539;
      int v13 = 0;
      __int16 v14 = 2082;
      CFStringRef v15 = "";
      __int16 v16 = 2113;
      id v17 = v8;
      __int16 v18 = 2113;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian stopEventCounter requested but already off\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x26u);
    }
    return 0;
  }
  return result;
}

- (void)setReconnecting:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  id v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    v7[0] = 68289539;
    v7[1] = 0;
    __int16 v8 = 2082;
    id v9 = "";
    __int16 v10 = 2113;
    id v11 = v6;
    __int16 v12 = 1026;
    BOOL v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection setReconnecting\", \"item\":%{private, location:escape_only}@, \"reconnecting\":%{public}hhd}", (uint8_t *)v7, 0x22u);
  }
  self->_reconnecting = v3;
}

- (BOOL)reconnecting
{
  return self->_reconnecting;
}

- (id)getConnectionReason
{
  return self->_connectReason;
}

- (void)setConnectionReason:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  id v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    connectReason = self->_connectReason;
    id v8 = [(SPSimpleBeacon *)self->_beacon name];
    BOOL v9 = self->_activePeripheral != 0;
    v10[0] = 68290307;
    v10[1] = 0;
    __int16 v11 = 2082;
    __int16 v12 = "";
    __int16 v13 = 2113;
    id v14 = v6;
    __int16 v15 = 2113;
    id v16 = a3;
    __int16 v17 = 2113;
    __int16 v18 = connectReason;
    __int16 v19 = 2113;
    id v20 = v8;
    __int16 v21 = 1025;
    BOOL v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metrics setConnectReason\", \"item\":%{private, location:escape_only}@, \"reason\":%{private, location:escape_only}@, \"prior\":%{private, location:escape_only}@, \"name\":%{private, location:escape_only}@, \"isActivePeripheral\":%{private}d}", (uint8_t *)v10, 0x40u);
  }
  if (!self->_connectReason)
  {
    self->_connectReason = (NSString *)a3;

    self->_CFStringRef disconnectReason = 0;
  }
}

- (void)setDisconnectionReason:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  id v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    CFStringRef disconnectReason = self->_disconnectReason;
    id v8 = [(SPSimpleBeacon *)self->_beacon name];
    v9[0] = 68290051;
    v9[1] = 0;
    __int16 v10 = 2082;
    __int16 v11 = "";
    __int16 v12 = 2113;
    id v13 = v6;
    __int16 v14 = 2113;
    id v15 = a3;
    __int16 v16 = 2113;
    __int16 v17 = disconnectReason;
    __int16 v18 = 2113;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metrics setDisconnectReason\", \"item\":%{private, location:escape_only}@, \"reason\":%{private, location:escape_only}@, \"prior\":%{private, location:escape_only}@, \"name\":%{private, location:escape_only}@}", (uint8_t *)v9, 0x3Au);
  }
  if (!self->_disconnectReason) {
    self->_CFStringRef disconnectReason = (NSString *)a3;
  }
}

- (void)sendConnectionMetric
{
  v4[0] = @"event";
  v4[1] = @"reason";
  CFStringRef connectReason = (const __CFString *)self->_connectReason;
  if (!connectReason) {
    CFStringRef connectReason = @"NotSet";
  }
  v5[0] = @"BtConnect";
  v5[1] = connectReason;
  [(CLDurianDeviceDelegate *)self->_delegate sendConnectionMetrics:+[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2] forDevice:self];
  self->_connectionTime = CFAbsoluteTimeGetCurrent();
}

- (void)resetHeleMaintMetrics
{
  *(_WORD *)&self->_numProactiveAttempts = 0;
}

- (void)sendDisconnectionMetric
{
  if (self->_connectionTime == 0.0) {
    double v3 = -1.0;
  }
  else {
    double v3 = CFAbsoluteTimeGetCurrent() - self->_connectionTime;
  }
  CFStringRef v5 = @"BtDisconnect";
  v4[0] = @"event";
  v4[1] = @"connect";
  int8x16_t v6 = vbslq_s8((int8x16_t)vceqzq_s64(*(int64x2_t *)&self->_connectReason), (int8x16_t)vdupq_n_s64((unint64_t)@"NotSet"), *(int8x16_t *)&self->_connectReason);
  void v4[2] = @"reason";
  v4[3] = @"duration";
  CFStringRef v7 = +[NSNumber numberWithDouble:v3];
  [(CLDurianDeviceDelegate *)self->_delegate sendConnectionMetrics:+[NSDictionary dictionaryWithObjects:&v5 forKeys:v4 count:4] forDevice:self];
  [(CLDurianDevice *)self clearConnectionAttemptReasons];
}

- (void)clearConnectionAttemptReasons
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  double v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    CFStringRef connectReason = self->_connectReason;
    id v6 = [(SPSimpleBeacon *)self->_beacon name];
    v7[0] = 68289795;
    v7[1] = 0;
    __int16 v8 = 2082;
    BOOL v9 = "";
    __int16 v10 = 2113;
    id v11 = v4;
    __int16 v12 = 2113;
    id v13 = connectReason;
    __int16 v14 = 2113;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metrics clearConnectionAttempt\", \"item\":%{private, location:escape_only}@, \"prior\":%{private, location:escape_only}@, \"name\":%{private, location:escape_only}@}", (uint8_t *)v7, 0x30u);
  }
  self->_connectionTime = 0.0;

  self->_CFStringRef connectReason = 0;
  self->_CFStringRef disconnectReason = 0;
}

- (double)intervalSinceLastSearchPartyKeyObservation
{
  if (!self->_beacon) {
    return 0.0;
  }
  -[NSDate timeIntervalSinceDate:][NSDate date][SPSimpleBeacon keySyncRecord][self->_beacon keySyncRecord]lastIndexObservationDate];
  double v4 = v3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  CFStringRef v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    unsigned int v7 = [[-[SPSimpleBeacon keySyncRecord](self->_beacon, "keySyncRecord") lastIndexObserved];
    v9[0] = 68289795;
    v9[1] = 0;
    __int16 v10 = 2082;
    id v11 = "";
    __int16 v12 = 2113;
    id v13 = v6;
    __int16 v14 = 1026;
    int v15 = (int)v4;
    __int16 v16 = 1026;
    unsigned int v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metric keyFetchEvent\", \"item\":%{private, location:escape_only}@, \"lastObservation\":%{public}d, \"index\":%{public}d}", (uint8_t *)v9, 0x28u);
  }
  return v4;
}

- (void)transitionToState:(int64_t)a3 event:(int64_t)a4 task:(id)a5
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  BOOL v9 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [[-[NSUUID description](self->_uuid, "description") substringToIndex:8];
    unint64_t stateLastUpdated = (unint64_t)self->_stateLastUpdated;
    sub_10164083C();
    double v13 = v12 - self->_stateLastUpdated;
    id v14 = [(CLDurianDevice *)self deviceStateToString:self->_deviceState];
    v16[0] = 68290819;
    __int16 v17 = 2082;
    v16[1] = 0;
    __int16 v18 = "";
    __int16 v19 = 2113;
    id v20 = v10;
    __int16 v21 = 2049;
    unint64_t v22 = stateLastUpdated;
    __int16 v23 = 2049;
    double v24 = v13;
    __int16 v25 = 2113;
    id v26 = v14;
    __int16 v27 = 2113;
    id v28 = [(CLDurianDevice *)self deviceStateToString:a3];
    __int16 v29 = 2113;
    id v30 = [(CLDurianDevice *)self eventToString:a4];
    __int16 v31 = 2113;
    id v32 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian state\", \"item\":%{private, location:escape_only}@, \"lastUpdated\":%{private}llu, \"timeElapsed\":\"%{private}0.3f\", \"from\":%{private, location:escape_only}@, \"to\":%{private, location:escape_only}@, \"event\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@}", (uint8_t *)v16, 0x58u);
  }
  self->_deviceState = a3;
  sub_10164083C();
  self->_unint64_t stateLastUpdated = v15;
}

- (id)deviceStateToString:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    return 0;
  }
  else {
    return *(&off_1023321D0 + a3);
  }
}

- (id)eventToString:(int64_t)a3
{
  if ((unint64_t)a3 > 0xD) {
    return 0;
  }
  else {
    return *(&off_102332208 + a3);
  }
}

- (id)firstPendingTask
{
  return [(NSMutableArray *)self->_pendingTasks objectAtIndex:0];
}

- (id)getPendingTasks
{
  return self->_pendingTasks;
}

- (id)createPlaySoundTaskWithSequence:(id)a3
{
  return 0;
}

- (id)createPlayUnauthorizedSoundTaskWithSequence:(id)a3
{
  return 0;
}

- (id)createStopPlayingSoundTask
{
  return 0;
}

- (id)createStopPlayingUnauthorizedSoundTask
{
  return 0;
}

- (id)createInitRangingTaskWithMacAddress:(id)a3
{
  return 0;
}

- (id)createConfigureRangingTaskWithMacAddress:(id)a3 countryCode:(unsigned __int8)a4 uwbChannel:(unsigned __int8)a5 acqPreamble:(unsigned __int8)a6 trackingPreamble:(unsigned __int8)a7 interval:(unsigned __int16)a8
{
  return 0;
}

- (id)createStartRangingTaskWithTargetEventCounter:(unsigned __int16)a3
{
  return 0;
}

- (id)createStopRangingTask
{
  return 0;
}

- (id)createDeinitRangingTask
{
  return 0;
}

- (id)createGetMultiStatusTask
{
  return 0;
}

- (id)createGetGroupStatusTask
{
  return 0;
}

- (id)createDumpLogsTaskOfType:(unint64_t)a3
{
  return 0;
}

- (id)createSetKeyRollTimeoutTaskWithInterval:(unsigned int)a3
{
  return 0;
}

- (id)createInduceCrashTask
{
  return 0;
}

- (id)createSetUnauthorizedPlaySoundRateLimitTask:(BOOL)a3
{
  return 0;
}

- (id)createFetchTxPowerTaskAsOwner:(BOOL)a3
{
  return 0;
}

- (id)createStartAggressiveAdvertisingTaskWithTimeout:(unsigned int)a3
{
  return 0;
}

- (id)createStopAggressiveAdvertisingTask
{
  return 0;
}

- (id)createStartUnauthorizedAggressiveAdvertisingTask
{
  return 0;
}

- (id)createSetTestModeTaskWithMode:(int)a3
{
  return 0;
}

- (id)createSetHawkeyeUTMotionConfigTaskWithSeparatedUTTimeoutSeconds:(unsigned int)a3 separatedUTBackoffTimeoutSeconds:(unsigned int)a4
{
  return 0;
}

- (id)createSetAccelerometerSlopeModeTaskWithConfiguration:(id)a3
{
  return 0;
}

- (id)createSetAccelerometerOrientationModeTaskWithConfiguration:(id)a3
{
  return 0;
}

- (id)createFetchAccelerometerSlopeModeTaskWithConfiguration
{
  return 0;
}

- (id)createFetchAccelerometerOrientationModeTaskWithConfiguration
{
  return 0;
}

- (id)createFetchAccelerometerModeTask
{
  return 0;
}

- (id)createFetchAISProductDataTask
{
  return 0;
}

- (id)createFetchAISManufacturerNameTask
{
  return 0;
}

- (id)createFetchAISModelNameTask
{
  return 0;
}

- (id)createFetchAISModelColorCodeTask
{
  return 0;
}

- (id)createFetchAISAccessoryCategoryTask
{
  return 0;
}

- (id)createFetchAISAccessoryCapabilitiesTask
{
  return 0;
}

- (id)createFetchAISFirmwareVersionTask
{
  return 0;
}

- (id)createFetchAISFindMyVersionTask
{
  return 0;
}

- (id)createFetchAISSerialNumberTask
{
  return 0;
}

- (id)createFetchCurrentPrimaryKeyTask
{
  return 0;
}

- (id)createFetchiCloudIdentifierTask
{
  return 0;
}

- (id)createFetchAISBatteryTypeTask
{
  return 0;
}

- (id)createFetchFirmwareVersionTaskWithCrashLogs:(BOOL)a3
{
  return 0;
}

- (id)createFetchBatteryStatusTask
{
  return 0;
}

- (id)createSetBatteryStatusTaskWithStatus:(unint64_t)a3
{
  return 0;
}

- (id)createFetchUserStatsTaskWithPersistence:(BOOL)a3
{
  return 0;
}

- (id)createSetMaxConnectionsTaskWithCount:(int)a3
{
  return 0;
}

- (id)createUnpairDeviceTask
{
  return 0;
}

- (id)createSetObfuscatedIdentifierTaskWithIdentifier:(id)a3
{
  return 0;
}

- (id)createSetNearOwnerTimeoutTaskInSeconds:(unsigned __int16)a3
{
  return 0;
}

- (id)createSetTagTypeTaskWithType:(unsigned __int8)a3
{
  return 0;
}

- (id)createSetWildModeTaskWithConfiguration:(id)a3
{
  return 0;
}

- (id)createRollWildKeyTask
{
  return 0;
}

- (unsigned)getRangingStatusForOpcode:(unsigned __int16)a3 data:(char *)a4
{
  int v4 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  CFStringRef v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_FAULT))
  {
    int v8 = 68289282;
    int v9 = 0;
    __int16 v10 = 2082;
    id v11 = "";
    __int16 v12 = 1026;
    int v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian getRangingStatusForOpcode called for unknown device\", \"opcode\":%{public}d}", (uint8_t *)&v8, 0x18u);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
  }
  id v6 = qword_102419398;
  if (os_signpost_enabled((os_log_t)qword_102419398))
  {
    int v8 = 68289282;
    int v9 = 0;
    __int16 v10 = 2082;
    id v11 = "";
    __int16 v12 = 1026;
    int v13 = v4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian getRangingStatusForOpcode called for unknown device", "{\"msg%{public}.0s\":\"#durian getRangingStatusForOpcode called for unknown device\", \"opcode\":%{public}d}", (uint8_t *)&v8, 0x18u);
  }
  return 0x7FFFFFFF;
}

- (unsigned)getRangeEndReasonForOpcode:(unsigned __int16)a3 data:(char *)a4
{
  int v4 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332198);
  }
  CFStringRef v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_FAULT))
  {
    int v8 = 68289282;
    int v9 = 0;
    __int16 v10 = 2082;
    id v11 = "";
    __int16 v12 = 1026;
    int v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian getRangeEndReasonForOpcode called for unknown device\", \"opcode\":%{public}d}", (uint8_t *)&v8, 0x18u);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332198);
    }
  }
  id v6 = qword_102419398;
  if (os_signpost_enabled((os_log_t)qword_102419398))
  {
    int v8 = 68289282;
    int v9 = 0;
    __int16 v10 = 2082;
    id v11 = "";
    __int16 v12 = 1026;
    int v13 = v4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian getRangeEndReasonForOpcode called for unknown device", "{\"msg%{public}.0s\":\"#durian getRangeEndReasonForOpcode called for unknown device\", \"opcode\":%{public}d}", (uint8_t *)&v8, 0x18u);
  }
  return 127;
}

- (unint64_t)getMultiStatusFromData:(char *)a3
{
  return 0;
}

- (id)createSetPersistentConnectionTaskWithState:(BOOL)a3
{
  return 0;
}

- (id)createFetchAISProtocolImplementationTask
{
  return 0;
}

- (id)createFetchAISNetworkIdTask
{
  return 0;
}

- (id)createFetchAISBatteryLevelTask
{
  return 0;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (unint64_t)leashState
{
  return self->_leashState;
}

- (void)setLeashState:(unint64_t)a3
{
  self->_unint64_t leashState = a3;
}

- (BOOL)isRoseInitialized
{
  return self->_isRoseInitialized;
}

- (BOOL)retrievingPersonalizationInformation
{
  return self->_retrievingPersonalizationInformation;
}

- (BOOL)firmwareUpdateInProgress
{
  return self->_firmwareUpdateInProgress;
}

- (BOOL)firmwareUpdateReboot
{
  return self->_firmwareUpdateReboot;
}

- (BOOL)abortingFirmwareUpdate
{
  return self->_abortingFirmwareUpdate;
}

- (BOOL)firmwareUpdateMode
{
  return self->_firmwareUpdateMode;
}

- (CBPeripheral)activePeripheral
{
  return self->_activePeripheral;
}

- (CLFindMyAccessoryConnectionMaterial)activePeripheralMaterial
{
  return self->_activePeripheralMaterial;
}

- (void)setActivePeripheralMaterial:(id)a3
{
}

- (BOOL)activePeripheralReady
{
  return self->_activePeripheralReady;
}

- (unint64_t)maintenanceOnlyCondition
{
  return self->_maintenanceOnlyCondition;
}

- (void)setMaintenanceOnlyCondition:(unint64_t)a3
{
  self->_unint64_t maintenanceOnlyCondition = a3;
}

- (unsigned)proactiveMaintenanceCount
{
  return self->_proactiveMaintenanceCount;
}

- (void)setProactiveMaintenanceCount:(unsigned int)a3
{
  self->_proactiveMaintenanceCount = a3;
}

- (BOOL)isMultiConnectionEnabled
{
  return self->_isMultiConnectionEnabled;
}

- (void)setIsMultiConnectionEnabled:(BOOL)a3
{
  self->_BOOL isMultiConnectionEnabled = a3;
}

- (unsigned)lastMaxConnectionsSent
{
  return self->_lastMaxConnectionsSent;
}

- (void)setLastMaxConnectionsSent:(unsigned __int8)a3
{
  self->_int lastMaxConnectionsSent = a3;
}

- (unsigned)nearOwnerTimeout
{
  return self->_nearOwnerTimeout;
}

- (void)setNearOwnerTimeout:(unsigned __int16)a3
{
  self->_nearOwnerTimeout = a3;
}

- (unint64_t)mutexState
{
  return self->_mutexState;
}

- (void)setMutexState:(unint64_t)a3
{
  self->_unint64_t mutexState = a3;
}

- (BOOL)isPlayingSound
{
  return self->_isPlayingSound;
}

- (void)setIsPlayingSound:(BOOL)a3
{
  self->_isPlayingSound = a3;
}

- (BOOL)isRanging
{
  return self->_isRanging;
}

- (void)setIsRanging:(BOOL)a3
{
  self->_isRanging = a3;
}

- (int64_t)btFindingState
{
  return self->_btFindingState;
}

- (SPSimpleBeacon)beacon
{
  return (SPSimpleBeacon *)objc_getProperty(self, a2, 320, 1);
}

- (void)setBeacon:(id)a3
{
}

- (SPUnknownBeacon)unownedBeacon
{
  return (SPUnknownBeacon *)objc_getProperty(self, a2, 328, 1);
}

- (void)setUnownedBeacon:(id)a3
{
}

- (NSDate)lastAlertDate
{
  return self->_lastAlertDate;
}

- (void)setLastAlertDate:(id)a3
{
}

- (char)quarterHourDisconnect
{
  return self->_quarterHourDisconnect;
}

- (void)setQuarterHourDisconnect:(char)a3
{
  self->_quarterHourDisconnect = a3;
}

- (SPCommandKeysCriteria)lastReconciledCriteria
{
  return self->_lastReconciledCriteria;
}

- (void)setLastReconciledCriteria:(id)a3
{
}

- (NSData)lastReconciledAddress
{
  return self->_lastReconciledAddress;
}

- (void)setLastReconciledAddress:(id)a3
{
}

- (unsigned)lastObservedIndex
{
  return self->_lastObservedIndex;
}

- (void)setLastObservedIndex:(unsigned int)a3
{
  self->_unsigned int lastObservedIndex = a3;
}

- (double)lastObservationTime
{
  return self->_lastObservationTime;
}

- (void)setLastObservationTime:(double)a3
{
  self->_lastObservationTime = a3;
}

- (unint64_t)lastDisconnectionTime
{
  return self->_lastDisconnectionTime;
}

- (void)setLastDisconnectionTime:(unint64_t)a3
{
  self->_lastDisconnectionTime = a3;
}

- (unint64_t)lastProactiveMaintenanceTime
{
  return self->_lastProactiveMaintenanceTime;
}

- (void)setLastProactiveMaintenanceTime:(unint64_t)a3
{
  self->_lastProactiveMaintenanceTime = a3;
}

- (unsigned)keyRollInterval
{
  return self->_keyRollInterval;
}

- (void)setKeyRollInterval:(unsigned int)a3
{
  self->_unsigned int keyRollInterval = a3;
}

- (unsigned)nearOwnerTimeoutOverride
{
  return self->_nearOwnerTimeoutOverride;
}

- (void)setNearOwnerTimeoutOverride:(unsigned int)a3
{
  self->_nearOwnerTimeoutOverride = a3;
}

- (unsigned)aggressiveAdvertisingTimeout
{
  return self->_aggressiveAdvertisingTimeout;
}

- (void)setAggressiveAdvertisingTimeout:(unsigned int)a3
{
  self->_aggressiveAdvertisingTimeout = a3;
}

- (unsigned)hawkeyeTestMode
{
  return self->_hawkeyeTestMode;
}

- (void)setHawkeyeTestMode:(unsigned __int8)a3
{
  self->_hawkeyeTestMode = a3;
}

- (int64_t)currentLatency
{
  return self->_currentLatency;
}

- (int64_t)commandedLatency
{
  return self->_commandedLatency;
}

- (CLDurianFirmwareUpdater)firmwareUpdater
{
  return self->_firmwareUpdater;
}

- (void)setFirmwareUpdater:(id)a3
{
}

- (CLDurianConnectionAttempt)activeConnectionAttempt
{
  return (CLDurianConnectionAttempt *)objc_getProperty(self, a2, 96, 1);
}

- (void)setActiveConnectionAttempt:(id)a3
{
}

- (CLDurianConnectionAttempt)pendingConnectionAttempt
{
  return (CLDurianConnectionAttempt *)objc_getProperty(self, a2, 392, 1);
}

- (void)setPendingConnectionAttempt:(id)a3
{
}

- (unint64_t)lastReconciliationTime
{
  return self->_lastReconciliationTime;
}

- (void)setLastReconciliationTime:(unint64_t)a3
{
  self->_lastReconciliationTime = a3;
}

- (unsigned)numProactiveAttempts
{
  return self->_numProactiveAttempts;
}

- (void)setNumProactiveAttempts:(unsigned __int8)a3
{
  self->_numProactiveAttempts = a3;
}

- (unsigned)numProactiveConnects
{
  return self->_numProactiveConnects;
}

- (void)setNumProactiveConnects:(unsigned __int8)a3
{
  self->_numProactiveConnects = a3;
}

- (BOOL)isProactiveAttempt
{
  return self->_isProactiveAttempt;
}

- (void)setIsProactiveAttempt:(BOOL)a3
{
  self->_isProactiveAttempt = a3;
}

- (unint64_t)lastGroupMaintenance
{
  return self->_lastGroupMaintenance;
}

- (void)setLastGroupMaintenance:(unint64_t)a3
{
  self->_unint64_t lastGroupMaintenance = a3;
}

- (unint64_t)lastAdvertisementDelta
{
  return self->_lastAdvertisementDelta;
}

- (void)setLastAdvertisementDelta:(unint64_t)a3
{
  self->_lastAdvertisementDelta = a3;
}

- (unint64_t)lastGroupClassicDisconnectionTime
{
  return self->_lastGroupClassicDisconnectionTime;
}

- (void)setLastGroupClassicDisconnectionTime:(unint64_t)a3
{
  self->_lastGroupClassicDisconnectionTime = a3;
}

- (double)lastGroupClassicDisconnectionDelta
{
  return self->_lastGroupClassicDisconnectionDelta;
}

- (void)setLastGroupClassicDisconnectionDelta:(double)a3
{
  self->_lastGroupClassicDisconnectionDelta = a3;
}

- (BOOL)isClassicallyConnected
{
  return self->_isClassicallyConnected;
}

- (void)setIsClassicallyConnected:(BOOL)a3
{
  self->_isClassicallyConnected = a3;
}

- (CBCharacteristic)durianNonOwnerPreciseFindingCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 440, 1);
}

- (void)setDurianNonOwnerPreciseFindingCharacteristic:(id)a3
{
}

- (CBCharacteristic)poshNonOwnerCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 448, 1);
}

- (void)setPoshNonOwnerCharacteristic:(id)a3
{
}

- (BOOL)pendingDisconnect
{
  return self->_pendingDisconnect;
}

- (void)setPendingDisconnect:(BOOL)a3
{
  self->_pendingDisconnect = a3;
}

- (TAUnknownBeacon)taUnknownBeacon
{
  return self->_taUnknownBeacon;
}

- (void)setTaUnknownBeacon:(id)a3
{
}

- (CBCharacteristic)hawkeyeConfigurationCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 464, 1);
}

- (void)setHawkeyeConfigurationCharacteristic:(id)a3
{
}

- (CBCharacteristic)hawkeyePairedOwnerInformationCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 472, 1);
}

- (void)setHawkeyePairedOwnerInformationCharacteristic:(id)a3
{
}

- (CBCharacteristic)hawkeyeDebugCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 480, 1);
}

- (void)setHawkeyeDebugCharacteristic:(id)a3
{
}

- (CBCharacteristic)hawkeyePreciseFindingCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 488, 1);
}

- (void)setHawkeyePreciseFindingCharacteristic:(id)a3
{
}

- (CBCharacteristic)hawkeyeFirmwareUpdateCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 496, 1);
}

- (void)setHawkeyeFirmwareUpdateCharacteristic:(id)a3
{
}

- (CBCharacteristic)hawkeyeNonOwnerCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 504, 1);
}

- (void)setHawkeyeNonOwnerCharacteristic:(id)a3
{
}

- (CLDurianDeviceDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLDurianDeviceDelegate *)a3;
}

- (CLDurianTask)activeTask
{
  return (CLDurianTask *)objc_getProperty(self, a2, 520, 1);
}

- (void)setActiveTask:(id)a3
{
}

@end