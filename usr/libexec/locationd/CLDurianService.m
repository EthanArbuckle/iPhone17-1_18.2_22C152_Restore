@interface CLDurianService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (unint64_t)convertBatteryStatus:(unsigned __int8)a3;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)deviceUndergoingFirmwareUpdate:(id)a3;
- (BOOL)handleCompletionForPoshTask:(id)a3 withCompletionCommand:(id)a4 onDevice:(id)a5;
- (BOOL)isPoshTask:(unsigned __int16)a3;
- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5;
- (CLDurianService)init;
- (double)getLastCarScanTime;
- (id)_convertTASPAdvertisementDeviceTypeToSPBeaconType:(unint64_t)a3;
- (id)clientIdentifier;
- (id)getDeviceUUID:(id)a3;
- (id)getDevicesForProductGroup:(id)a3 andProductNumber:(id)a4;
- (id)getUarpAccessoryForDevice:(id)a3;
- (void)_attachTAUnknownBeaconToDurianDevice:(id)a3;
- (void)abortFirmwareUpdateForDevice:(id)a3 forClient:(id)a4;
- (void)airplaneModeChanged;
- (void)assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4;
- (void)beginService;
- (void)cancelConnectionTimeoutForPeripheral:(id)a3;
- (void)cleanUpTAUnknownBeaconRecord:(id)a3;
- (void)completeRangingConfigure:(id)a3 client:(id)a4 data:(char *)a5 opcode:(unsigned __int16)a6;
- (void)completeRangingDeinit:(id)a3 client:(id)a4 data:(char *)a5 opcode:(unsigned __int16)a6;
- (void)completeRangingInit:(id)a3 client:(id)a4 data:(char *)a5 opcode:(unsigned __int16)a6;
- (void)completeRangingStart:(id)a3 client:(id)a4 data:(char *)a5 opcode:(unsigned __int16)a6;
- (void)configureRangingWithMacAddress:(id)a3 countryCode:(unsigned __int8)a4 uwbChannel:(unsigned __int8)a5 acqPreamble:(unsigned __int8)a6 trackingPreamble:(unsigned __int8)a7 interval:(unsigned __int16)a8 onTag:(id)a9 forClient:(id)a10;
- (void)connectToTag:(id)a3 forClient:(id)a4;
- (void)deinitRangingOnTag:(id)a3 forClient:(id)a4;
- (void)device:(id)a3 checkForEchoOfOpcode:(unsigned __int16)a4 fromAck:(BOOL)a5;
- (void)device:(id)a3 didAcknowledgeCommandForTask:(id)a4;
- (void)device:(id)a3 didCompleteTask:(id)a4 withCompletionCommand:(id)a5;
- (void)device:(id)a3 didFailToCompleteTask:(id)a4 withError:(int64_t)a5 andDisconnect:(BOOL)a6;
- (void)device:(id)a3 didPrepareForRangingWithError:(id)a4;
- (void)device:(id)a3 didReceiveGroupRelationStatus:(unsigned __int8)a4 andMainteanceStatus:(unsigned __int8)a5;
- (void)device:(id)a3 didReceiveHawkeyeDataFragment:(id)a4 duringActiveTask:(id)a5;
- (void)device:(id)a3 didReceiveInvalidDataWithError:(int64_t)a4;
- (void)device:(id)a3 didReceiveKeyRollIndex:(unsigned int)a4;
- (void)device:(id)a3 didReceiveRangingResponse:(id)a4 withOpcode:(unsigned __int16)a5;
- (void)device:(id)a3 didUpdateActivePeripheral:(id)a4 withError:(id)a5;
- (void)didFailFirmwareUpdateForDevice:(id)a3 withError:(id)a4;
- (void)didFailToConnectDevice:(id)a3 withError:(int64_t)a4;
- (void)didReceiveUarpMessage:(id)a3 fromDevice:(id)a4;
- (void)didRetrievePersonalizationInfo:(id)a3 forDevice:(id)a4 error:(id)a5;
- (void)didUpdateFirmwareForDevice:(id)a3 error:(id)a4;
- (void)disconnectFromTag:(id)a3 forClient:(id)a4;
- (void)dumpLogsOfType:(unint64_t)a3 forTag:(id)a4 forClient:(id)a5;
- (void)endService;
- (void)fetchAISAccessoryCapabilitiesForDevice:(id)a3 forClient:(id)a4;
- (void)fetchAISAccessoryCapabilitiesForTAUnknownBeacon:(id)a3 forClient:(id)a4;
- (void)fetchAISAccessoryCategoryForDevice:(id)a3 forClient:(id)a4;
- (void)fetchAISAccessoryCategoryForTAUnknownBeacon:(id)a3 forClient:(id)a4;
- (void)fetchAISBatteryLevelForDevice:(id)a3 forClient:(id)a4;
- (void)fetchAISBatteryLevelForTAUnknownBeacon:(id)a3 forClient:(id)a4;
- (void)fetchAISBatteryTypeForDevice:(id)a3 forClient:(id)a4;
- (void)fetchAISBatteryTypeForTAUnknownBeacon:(id)a3 forClient:(id)a4;
- (void)fetchAISFirmwareVersionForDevice:(id)a3 forClient:(id)a4;
- (void)fetchAISFirmwareVersionForTAUnknownBeacon:(id)a3 forClient:(id)a4;
- (void)fetchAISManufacturerNameForDevice:(id)a3 forClient:(id)a4;
- (void)fetchAISManufacturerNameForTAUnknownBeacon:(id)a3 forClient:(id)a4;
- (void)fetchAISModelNameForDevice:(id)a3 forClient:(id)a4;
- (void)fetchAISModelNameForTAUnknownBeacon:(id)a3 forClient:(id)a4;
- (void)fetchAISNetworkIDForDevice:(id)a3 forClient:(id)a4;
- (void)fetchAISNetworkIDForTAUnknownBeacon:(id)a3 forClient:(id)a4;
- (void)fetchAISProductDataForDevice:(id)a3 forClient:(id)a4;
- (void)fetchAISProductDataForTAUnknownBeacon:(id)a3 forClient:(id)a4;
- (void)fetchAISProtocolImplementationForDevice:(id)a3 forClient:(id)a4;
- (void)fetchAISProtocolImplementationForTAUnknownBeacon:(id)a3 forClient:(id)a4;
- (void)fetchAISSerialNumberForDevice:(id)a3 forClient:(id)a4;
- (void)fetchAISSerialNumberForTAUnknownBeacon:(id)a3 forClient:(id)a4;
- (void)fetchAccelerometerModeOnTag:(id)a3 forClient:(id)a4;
- (void)fetchAccelerometerOrientationModeConfigurationOnTag:(id)a3 forClient:(id)a4;
- (void)fetchAccelerometerSlopeModeConfigurationOnTag:(id)a3 forClient:(id)a4;
- (void)fetchBatteryStateFromTag:(id)a3 forClient:(id)a4;
- (void)fetchConnectionStateForTag:(id)a3 forClient:(id)a4;
- (void)fetchFirmwareVersionFromTag:(id)a3 forClient:(id)a4 includeCrashLogs:(BOOL)a5;
- (void)fetchHawkeyeAISAccessoryCapabilitiesForDevice:(id)a3 forClient:(id)a4;
- (void)fetchHawkeyeAISAccessoryCapabilitiesForTAUnknownBeacon:(id)a3 forClient:(id)a4;
- (void)fetchHawkeyeAISAccessoryCategoryForDevice:(id)a3 forClient:(id)a4;
- (void)fetchHawkeyeAISAccessoryCategoryForTAUnknownBeacon:(id)a3 forClient:(id)a4;
- (void)fetchHawkeyeAISBatteryTypeForDevice:(id)a3 forClient:(id)a4;
- (void)fetchHawkeyeAISFindMyVersionForDevice:(id)a3 forClient:(id)a4;
- (void)fetchHawkeyeAISFirmwareVersionForDevice:(id)a3 forClient:(id)a4;
- (void)fetchHawkeyeAISFirmwareVersionForTAUnknownBeacon:(id)a3 forClient:(id)a4;
- (void)fetchHawkeyeAISManufacturerNameForDevice:(id)a3 forClient:(id)a4;
- (void)fetchHawkeyeAISManufacturerNameForTAUnknownBeacon:(id)a3 forClient:(id)a4;
- (void)fetchHawkeyeAISModelColorCodeForDevice:(id)a3 forClient:(id)a4;
- (void)fetchHawkeyeAISModelNameForDevice:(id)a3 forClient:(id)a4;
- (void)fetchHawkeyeAISModelNameForTAUnknownBeacon:(id)a3 forClient:(id)a4;
- (void)fetchHawkeyeAISProductDataForDevice:(id)a3 forClient:(id)a4;
- (void)fetchHawkeyeAISProductDataForTAUnknownBeacon:(id)a3 forClient:(id)a4;
- (void)fetchHawkeyeCurrentPrimaryKey:(id)a3 forClient:(id)a4;
- (void)fetchHawkeyeSerialNumber:(id)a3 forClient:(id)a4;
- (void)fetchHawkeyeiCloudIdentifier:(id)a3 forClient:(id)a4;
- (void)fetchTxPowerForDevice:(id)a3 forClient:(id)a4 asOwner:(BOOL)a5;
- (void)fetchUserStatsWithPersistence:(BOOL)a3 fromTag:(id)a4 forClient:(id)a5;
- (void)fetchWhetherLocalFirmwareAssetIsInUseForProductGroup:(id)a3 andProductNumber:(id)a4 forClient:(id)a5;
- (void)findMyAppDidBackgroundOrExit;
- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5;
- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)firmwareUpdateResult:(id)a3 vendorSpecificStatus:(unsigned int)a4 error:(id)a5;
- (void)getGroupStatusForTag:(id)a3 forClient:(id)a4;
- (void)getMultiStatusForTag:(id)a3 forClient:(id)a4;
- (void)getPersonalizationInfoForDevice:(id)a3 forClient:(id)a4;
- (void)induceCrashOnTag:(id)a3 forClient:(id)a4;
- (void)informCoreUarpOfAssetChangeForProductGroup:(id)a3 andProductNumber:(id)a4;
- (void)initRangingWithMacAddress:(id)a3 onTag:(id)a4 forClient:(id)a5;
- (void)onAggressiveScanEnded;
- (void)onAggressiveScanStarted;
- (void)onAvengerAdvertisement:(id)a3 reconciledInformation:(id)a4;
- (void)onConnectionStateChangeForDeviceWithUUID:(id)a3 fromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)onFirstUnlock;
- (void)onObservationForDeviceWithUUID:(id)a3 type:(int64_t)a4;
- (void)onVehicularState;
- (void)performTask:(id)a3 forClient:(id)a4 onDevice:(id)a5;
- (void)playSoundSequence:(id)a3 onTag:(id)a4 forClient:(id)a5;
- (void)playUnauthorizedSoundSequence:(id)a3 onTag:(id)a4 forClient:(id)a5;
- (void)prepareRangingOnTag:(id)a3 forClient:(id)a4;
- (void)releaseExtension:(int64_t)a3;
- (void)requestDisconnectionForDevice:(id)a3;
- (void)requestDiscoveryScan;
- (void)rollWildKeyOnTag:(id)a3 forClient:(id)a4;
- (void)scanForNearbyOwner;
- (void)sendConnectionMetrics:(id)a3 forDevice:(id)a4;
- (void)sendFirmwareUpdateMetrics:(id)a3 forDevice:(id)a4;
- (void)setAccelerometerOrientationModeConfiguration:(id)a3 onTag:(id)a4 forClient:(id)a5;
- (void)setAccelerometerSlopeModeConfiguration:(id)a3 onTag:(id)a4 forClient:(id)a5;
- (void)setBatteryStatus:(unint64_t)a3 onTag:(id)a4 forClient:(id)a5;
- (void)setHawkeyeTestMode:(int)a3 onTag:(id)a4 forClient:(id)a5;
- (void)setHawkeyeUTMotionConfigWithSeparatedUTTimeoutSeconds:(unsigned int)a3 separatedUTBackoffTimeoutSeconds:(unsigned int)a4 forDevice:(id)a5 forClient:(id)a6;
- (void)setKeyRollInterval:(unsigned int)a3 onTag:(id)a4 forClient:(id)a5;
- (void)setNearOwnerTimeout:(unsigned __int16)a3 onTag:(id)a4 forClient:(id)a5;
- (void)setObfuscatedIdentifier:(id)a3 onTag:(id)a4 forClient:(id)a5;
- (void)setTagType:(unsigned __int8)a3 onTag:(id)a4 forClient:(id)a5;
- (void)setUnauthorizedPlaySoundRateLimit:(BOOL)a3 onTag:(id)a4 forClient:(id)a5;
- (void)setWildModeConfiguration:(id)a3 onTag:(id)a4 forClient:(id)a5;
- (void)shouldDisconnectReconnectForDevice:(id)a3;
- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4;
- (void)startAggressiveAdvertisingForDevice:(id)a3 withTimeout:(unsigned int)a4 forClient:(id)a5;
- (void)startEventCounterOnTag:(id)a3 forClient:(id)a4;
- (void)startMonitoringConnectionStateChangeForClient:(id)a3;
- (void)startMonitoringDeviceForFirmwareUpdate:(id)a3;
- (void)startRangingWithTargetEventCounter:(unsigned __int16)a3 onTag:(id)a4 forClient:(id)a5;
- (void)startUnauthorizedAggressiveAdvertisingForDevice:(id)a3 forClient:(id)a4;
- (void)stopAggressiveAdvertisingForDevice:(id)a3 forClient:(id)a4;
- (void)stopEventCounterOnTag:(id)a3 forClient:(id)a4;
- (void)stopMonitoringConnectionStateChangeForClient:(id)a3;
- (void)stopMonitoringDeviceForFirmwareUpdate:(id)a3;
- (void)stopPlayingSoundOnTag:(id)a3 forClient:(id)a4;
- (void)stopPlayingUnauthorizedSoundOnTag:(id)a3 forClient:(id)a4;
- (void)stopRangingOnTag:(id)a3 forClient:(id)a4;
- (void)submitFirmwareVersionsForOwnedTags;
- (void)systemCoexImpact:(id)a3 toState:(int)a4;
- (void)systemConnectivity:(id)a3 isConnected:(BOOL)a4;
- (void)systemMetricHeartbeat;
- (void)systemWaking:(id)a3 atTime:(double)a4;
- (void)systemWillSleep:(id)a3;
- (void)teardownClient:(id)a3;
- (void)unpairFromTag:(id)a3 forClient:(id)a4;
- (void)unpairFromTagWithAddress:(id)a3 forClient:(id)a4;
- (void)updateDeviceConnectionState:(id)a3 state:(unint64_t)a4;
- (void)updateFirmwareForDevice:(id)a3 withAssetURL:(id)a4 forClient:(id)a5;
- (void)updateSystemLoiType:(unint64_t)a3 isEntry:(BOOL)a4;
- (void)useDefaultFirmwareAssetSourceForProductGroup:(id)a3 andProductNumber:(id)a4 forClient:(id)a5;
- (void)useLocalFirmwareAssetFromUrl:(id)a3 forProductGroup:(id)a4 forProductNumber:(id)a5 withSandboxExtension:(id)a6 forClient:(id)a7;
@end

@implementation CLDurianService

- (void)onAvengerAdvertisement:(id)a3 reconciledInformation:(id)a4
{
  if ([a3 address])
  {
    if (!_os_feature_enabled_impl()
      || ([a3 status] & 0x10) != 0
      || ([a3 status] & 0x20) != 0)
    {
      if (([a3 status] & 0x10) != 0
        || ([a3 status] & 0x20) != 0)
      {
        if (objc_msgSend(objc_msgSend(a3, "advertisementData"), "length")) {
          uint64_t v12 = 2;
        }
        else {
          uint64_t v12 = ([a3 status] & 4) == 0;
        }
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102331ED8);
        }
        v14 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
        {
          v15 = sub_101640700([a3 address]);
          id v16 = [a3 scanDate];
          id v17 = [a3 advertisementData];
          unsigned int v18 = [a3 status];
          BOOL v19 = [[objc_msgSend(a3, "advertisementData") length] != 0;
          if ([a4 uuid]) {
            v20 = (const char *)[[[objc_msgSend(objc_msgSend(a4, "uuid"), "description") UTF8String];
          }
          else {
            v20 = "";
          }
          *(_DWORD *)buf = 68290819;
          int v22 = 0;
          __int16 v23 = 2082;
          v24 = "";
          __int16 v25 = 2113;
          v26 = v15;
          __int16 v27 = 2114;
          id v28 = v16;
          __int16 v29 = 2113;
          id v30 = v17;
          __int16 v31 = 1025;
          unsigned int v32 = v18;
          __int16 v33 = 1025;
          int v34 = v12;
          __int16 v35 = 1025;
          BOOL v36 = v19;
          __int16 v37 = 2081;
          v38 = v20;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian onAvengerAdvertisement\", \"address\":%{private, location:escape_only}@, \"date\":%{public, location:escape_only}@, \"data\":%{private, location:escape_only}@, \"status\":%{private}d, \"needsmaint\":%{private}d, \"isWild\":%{private}d, \"uuid\":%{private, location:escape_only}s}", buf, 0x4Cu);
        }
        -[CLDurianDeviceManager addScanResultAtDate:address:advertisementData:rssi:maintenanceReason:reserved:reconciledInformation:](self->_deviceManager, "addScanResultAtDate:address:advertisementData:rssi:maintenanceReason:reserved:reconciledInformation:", [a3 scanDate], objc_msgSend(a3, "address"), objc_msgSend(a3, "advertisementData"), objc_msgSend(a3, "rssi"), v12, objc_msgSend(a3, "reserved"), a4);
        if ([a4 uuid] && objc_msgSend(a4, "type") == (id)1) {
          -[CLDurianCommuteMetricManager didObserveScanForDevice:](self->_commuteMetricManager, "didObserveScanForDevice:", [a4 uuid]);
        }
      }
      else
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102331ED8);
        }
        uint64_t v7 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68289282;
          int v22 = 0;
          __int16 v23 = 2082;
          v24 = "";
          __int16 v25 = 1026;
          LODWORD(v26) = [a3 status];
          v8 = "{\"msg%{public}.0s\":\"#durian onAvengerAdvertisement - not durian/hawkeye\", \"status\":%{public}d}";
          goto LABEL_15;
        }
      }
    }
    else
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
      uint64_t v7 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289282;
        int v22 = 0;
        __int16 v23 = 2082;
        v24 = "";
        __int16 v25 = 1026;
        LODWORD(v26) = [a3 status];
        v8 = "{\"msg%{public}.0s\":\"#durian onAvengerAdvertisement - not durian/hawkeye or not Apple advertisement\", \""
             "status\":%{public}d}";
LABEL_15:
        v9 = v7;
        os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
        uint32_t v11 = 24;
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, buf, v11);
      }
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    uint64_t v13 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v22 = 0;
      __int16 v23 = 2082;
      v24 = "";
      v8 = "{\"msg%{public}.0s\":\"#durian onAvengerAdvertisement - no address\"}";
      v9 = v13;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      uint32_t v11 = 18;
      goto LABEL_22;
    }
  }
}

- (CLDurianService)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLDurianService;
  result = [(CLDurianService *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLDurianServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLDurianClientProtocol];
  result->_carLastScanned = 2.22507386e-308;
  return result;
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_102488FA8 != -1) {
    dispatch_once(&qword_102488FA8, &stru_102331D68);
  }
  return (id)qword_102488FA0;
}

+ (BOOL)isSupported
{
  if (qword_102488FB8 != -1) {
    dispatch_once(&qword_102488FB8, &stru_102331D88);
  }
  return (byte_102488FB0 & 1) == 0;
}

- (void)beginService
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  objc_super v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v29 = 0;
    __int16 v30 = 2082;
    __int16 v31 = "";
    __int16 v32 = 2114;
    __int16 v33 = +[CLDurianSettings settingsDictionary];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian service being brought up\", \"settings\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  self->_queue = (OS_dispatch_queue *)[[-[CLDurianService universe](self, "universe") silo] queue];
  self->_taskClientMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  self->_pendingTaskMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  self->_assetIdMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  self->_clients = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  self->_devicesUndergoingFirmwareUpdate = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  self->_roseOnForClientOnDevice = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  self->_eventCounterOnForDevice = 0;
  v4 = [[CLDurianAppMonitor alloc] initWithQueue:self->_queue];
  self->_appMonitor = v4;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1015DC220;
  v25[3] = &unk_10229FED8;
  v25[4] = self;
  [(CLDurianAppMonitor *)v4 setFindMyAppDidBackgroundOrExitHandler:v25];
  unint64_t v5 = [[CLDurianDeviceManager alloc] initWithUniverse:[(CLDurianService *)self universe]];
  self->_deviceManager = v5;
  [(CLDurianDeviceManager *)v5 setDeviceDelegate:self];
  v6 = [[CLDurianCompanionDeviceManager alloc] initWithUniverse:[(CLDurianService *)self universe]];
  self->_companionDeviceManager = v6;
  [(CLDurianCompanionDeviceManager *)v6 setDeviceObservationDelegate:self->_deviceManager];
  uint64_t v7 = [[CLDurianCompanionDeviceObserver alloc] initWithUniverse:[(CLDurianService *)self universe]];
  self->_companionDeviceObserver = v7;
  [(CLDurianCompanionDeviceObserver *)v7 setDelegate:self->_companionDeviceManager];
  self->_metricManager = [[CLDurianMetricManager alloc] initWithQueue:self->_queue];
  self->_commuteMetricManager = (CLDurianCommuteMetricManager *)[[CLDurianCommuteMetricManager alloc] initInUniverse:[(CLDurianService *)self universe]];
  v8 = [[CLDurianSystemMonitor alloc] initWithUniverse:[(CLDurianService *)self universe]];
  self->_systemMonitor = v8;
  [(CLDurianSystemMonitor *)v8 setDelegate:self];
  v9 = (UARPController *)objc_alloc_init((Class)UARPController);
  self->_uarpController = v9;
  [(UARPController *)v9 setDelegate:self];
  os_log_type_t v10 = (SPOwnerInterface *)objc_alloc_init((Class)SPOwnerInterface);
  self->_spOwnerInterface = v10;
  self->_spFirmwareUpdateSession = (SPFirmwareUpdateSessionProtocol *)[(SPOwnerInterface *)v10 firmwareUpdateSession];
  self->_assetLocationType = +[CLDurianSettings uarpAssetLocationType];
  if (_os_feature_enabled_impl())
  {
    self->_scannerClient = [-[CLAvengerScannerClient initWithDelegate:queue:]([CLAvengerScannerClient alloc], "initWithDelegate:queue:", self, [objc_msgSend(-[CLDurianService universe](self, "universe"), "silo") queue]);
  }
  else
  {
    uint32_t v11 = [(CLAvengerScannerServiceProtocol *)[objc_msgSend(-[CLDurianService universe](self, "universe"), "vendor") proxyForService:@"CLAvengerScanner"];
    self->_avengerScannerProxy = v11;
    [(CLAvengerScannerServiceProtocol *)v11 registerDelegate:self inSilo:[(CLDurianService *)self silo]];
    [(CLAvengerScannerServiceProtocol *)self->_avengerScannerProxy setDelegateEntityName:"CLDurianService"];
    [(CLAvengerScannerServiceProtocol *)self->_avengerScannerProxy startMonitoringAvengerAdvertisementsForClient:CLISP_ME_TOKEN clientName:@"CLDurianService"];
  }
  self->_connectionStateChangeClients = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  uint64_t v12 = (RadiosPreferences *)[objc_alloc((Class)RadiosPreferences) initWithQueue:self->_queue];
  self->_radiosPreferences = v12;
  if (v12)
  {
    [(RadiosPreferences *)v12 setDelegate:self];
    [(CLDurianDeviceManager *)self->_deviceManager setAirplaneModeEnabled:[(RadiosPreferences *)self->_radiosPreferences airplaneMode]];
  }
  queue = self->_queue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1015DC228;
  handler[3] = &unk_1022B4250;
  handler[4] = self;
  notify_register_dispatch("com.apple.locationd.hawkeye.stopUARPCapture", &self->_stopUARPCaptureToken, queue, handler);
  self->_localHawkeyeFirmwareDirectory = [+[NSURL fileURLWithPath:NSTemporaryDirectory() isDirectory:1] URLByAppendingPathComponent:@"HawkeyeFirmware"];
  self->_localFirmwareUpdateAssetMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  self->_firmwareUpdateClientMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  self->_runningFindMyCertificationAssistant = +[CLDurianSettings runningFindMyCertificationAssistant];
  __int16 v23 = 0;
  id v14 = objc_alloc_init((Class)NSFileManager);
  unsigned int v15 = [[v14 fileExistsAtPath:-[NSURL path](self->_localHawkeyeFirmwareDirectory, "path")];
  localHawkeyeFirmwareDirectory = self->_localHawkeyeFirmwareDirectory;
  NSFileAttributeKey v26 = NSFilePosixPermissions;
  __int16 v27 = +[NSNumber numberWithInt:457];
  if (objc_msgSend(v14, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", localHawkeyeFirmwareDirectory, 1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1), &v23))
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    id v17 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v18 = self->_localHawkeyeFirmwareDirectory;
      *(_DWORD *)buf = 68289282;
      int v29 = 0;
      __int16 v30 = 2082;
      __int16 v31 = "";
      __int16 v32 = 2114;
      __int16 v33 = (NSDictionary *)v18;
      BOOL v19 = "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate path has been created \", \"_localHawkeyeFirmwareDirectory\""
            ":%{public, location:escape_only}@}";
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v19, buf, 0x1Cu);
    }
  }
  else if (v15)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    id v17 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      v20 = self->_localHawkeyeFirmwareDirectory;
      *(_DWORD *)buf = 68289282;
      int v29 = 0;
      __int16 v30 = 2082;
      __int16 v31 = "";
      __int16 v32 = 2114;
      __int16 v33 = (NSDictionary *)v20;
      BOOL v19 = "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate path already exists \", \"_localHawkeyeFirmwareDirectory\":%"
            "{public, location:escape_only}@}";
      goto LABEL_20;
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    v21 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289282;
      int v29 = 0;
      __int16 v30 = 2082;
      __int16 v31 = "";
      __int16 v32 = 2114;
      __int16 v33 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Local asset updates will not work! -- unable to create Hawkeye firmware directory\", \"reason\":%{public, location:escape_only}@}", buf, 0x1Cu);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
    }
    int v22 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      *(_DWORD *)buf = 68289282;
      int v29 = 0;
      __int16 v30 = 2082;
      __int16 v31 = "";
      __int16 v32 = 2114;
      __int16 v33 = v23;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#hawkeye #firmwareUpdate Local asset updates will not work! -- unable to create Hawkeye firmware directory", "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Local asset updates will not work! -- unable to create Hawkeye firmware directory\", \"reason\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
  }

  self->_trackingAvoidanceProxy = (CLTrackingAvoidanceServiceProtocol *)[objc_msgSend(-[CLDurianService universe](self, "universe"), "vendor") proxyForService:@"CLTrackingAvoidanceService"];
}

- (void)endService
{
  radiosPreferences = self->_radiosPreferences;
  if (radiosPreferences)
  {
    [(RadiosPreferences *)radiosPreferences setDelegate:0];
    v4 = self->_radiosPreferences;
  }
  else
  {
    v4 = 0;
  }

  self->_radiosPreferences = 0;
  [(CLDurianCommuteMetricManager *)self->_commuteMetricManager cleanup];

  if (_os_feature_enabled_impl())
  {
    p_scannerClient = (id *)&self->_scannerClient;
  }
  else
  {
    p_scannerClient = (id *)&self->_avengerScannerProxy;
    [(CLAvengerScannerServiceProtocol *)self->_avengerScannerProxy stopMonitoringAvengerAdvertisementsForClient:CLISP_ME_TOKEN];
  }

  trackingAvoidanceProxy = self->_trackingAvoidanceProxy;
}

- (void)device:(id)a3 didUpdateActivePeripheral:(id)a4 withError:(id)a5
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  v9 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
  {
    id v10 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    id v11 = [[[a4 identifier] description] substringToIndex:8];
    unsigned int v12 = [(NSMutableSet *)self->_clients count];
    uint64_t buf = 68290051;
    __int16 v29 = 2082;
    __int16 v30 = "";
    __int16 v31 = 2113;
    id v32 = v10;
    __int16 v33 = 2113;
    id v34 = v11;
    __int16 v35 = 1026;
    unsigned int v36 = v12;
    __int16 v37 = 2113;
    id v38 = [a3 address];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#durian didUpdateActivePeripheral\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"clients\":%{public}d, \"addr\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x36u);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  clients = self->_clients;
  id v14 = [(NSMutableSet *)clients countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(clients);
        }
        unsigned int v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v19 = [a3 uuid];
        if (a4) {
          [v18 didConnectToTag:v19 withMacAddress:[a3 address] withError:a5];
        }
        else {
          [v18 didDisconnectFromTag:v19 withError:a5];
        }
      }
      id v15 = [(NSMutableSet *)clients countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }
  if ([a3 isHawkeyeAccessory])
  {
    id v20 = [(CLDurianService *)self getUarpAccessoryForDevice:a3];
    if (!a4 && v20 && [(CLDurianService *)self deviceUndergoingFirmwareUpdate:a3])
    {
      [(CLDurianService *)self didFailFirmwareUpdateForDevice:a3 withError:a5];
      return;
    }
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    v21 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
    {
      id v22 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
      uint64_t buf = 68289283;
      __int16 v29 = 2082;
      __int16 v30 = "";
      __int16 v31 = 2113;
      id v32 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate  We are not monitoring this accessory for updates\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
    }
  }
  if (a4) {
    -[CLDurianCommuteMetricManager didObserveScanForDevice:](self->_commuteMetricManager, "didObserveScanForDevice:", [a3 uuid]);
  }
}

- (void)didFailToConnectDevice:(id)a3 withError:(int64_t)a4
{
  id v7 = objc_alloc((Class)NSError);
  uint64_t v8 = kCLErrorDomainPrivate;
  NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
  CFStringRef v21 = sub_101640864(a4);
  id v9 = [v7 initWithDomain:v8 code:a4 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1)];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  clients = self->_clients;
  id v11 = [(NSMutableSet *)clients countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(clients);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) didConnectToTag:[a3 uuid] withMacAddress:[a3 address] withError:v9];
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [(NSMutableSet *)clients countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)device:(id)a3 didPrepareForRangingWithError:(id)a4
{
  id v6 = -[NSMutableDictionary objectForKey:](self->_taskClientMap, "objectForKey:", [a3 uuid]);
  if (v6)
  {
    id v7 = v6;
    id v8 = [a3 uuid];
    _[v7 didPrepareRangingOnTag:v8 error:a4];
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    id v9 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 68289283;
      v10[1] = 0;
      __int16 v11 = 2082;
      id v12 = "";
      __int16 v13 = 2113;
      id v14 = [[[objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian didPrepareForRanging missing client\", \"item\":%{private, location:escape_only}@}", (uint8_t *)v10, 0x1Cu);
    }
  }
}

- (void)device:(id)a3 didAcknowledgeCommandForTask:(id)a4
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
  {
    v10[0] = 68289539;
    v10[1] = 0;
    __int16 v11 = 2082;
    id v12 = "";
    __int16 v13 = 2113;
    id v14 = [[[objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    __int16 v15 = 1026;
    unsigned int v16 = [a4 translatedOpcode];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#durian didAcknowledgeCommandForTask\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)v10, 0x22u);
  }
  id v8 = -[NSMutableDictionary objectForKey:](self->_taskClientMap, "objectForKey:", [a4 uuid]);
  int v9 = [a4 command].opcode;
  if (v9 <= 767)
  {
    if (v9 > 174)
    {
      if (v9 == 175) {
        goto LABEL_23;
      }
      if (v9 == 208)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [a4 hawkeyeOpcode] == 527) {
          [v8 didStartAggressiveAdvertisingOnDevice:[a3 uuid] withError:0];
        }
      }
    }
    else
    {
      if (v9 == 3) {
        goto LABEL_24;
      }
      if (v9 == 40) {
        [v8 didStartPlayingSoundOnTag:[a3 uuid] withError:0];
      }
    }
  }
  else
  {
    if (v9 > 793)
    {
      if (v9 == 794) {
        goto LABEL_23;
      }
      if (v9 != 2051)
      {
        if (v9 != 2061) {
          return;
        }
LABEL_23:
        [v8 didStartPlayingUnauthorizedSoundOnTag:[a3 uuid] withError:0];
        return;
      }
LABEL_24:
      [v8 didStartRangingOnTag:[a3 uuid] error:0];
      return;
    }
    if (v9 == 768) {
      goto LABEL_23;
    }
    if (v9 == 772) {
      [v8 didStartUnauthorizedAggressiveAdvertisingOnDevice:[a3 uuid] withError:0];
    }
  }
}

+ (unint64_t)convertBatteryStatus:(unsigned __int8)a3
{
  return qword_101E31358[a3 & 3];
}

- (void)device:(id)a3 didReceiveHawkeyeDataFragment:(id)a4 duringActiveTask:(id)a5
{
  id v8 = -[NSMutableDictionary objectForKey:](self->_taskClientMap, "objectForKey:", [a5 uuid]);
  if [a3 isHawkeyeAccessory] && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    int v9 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = 68290051;
      __int16 v15 = 2082;
      unsigned int v16 = "";
      __int16 v17 = 2113;
      id v18 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
      __int16 v19 = 1025;
      unsigned int v20 = [a5 hawkeyeOpcode];
      __int16 v21 = 2113;
      id v22 = a4;
      __int16 v23 = 1025;
      BOOL v24 = v8 != 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didReceiveHawkeyeDataFragment\", \"item\":%{private, location:escape_only}@, \"activeTaskOpcode\":%{private}d, \"dataFragment\":%{private, location:escape_only}@, \"client\":%{private}hhd}", (uint8_t *)&v14, 0x32u);
    }
    [v8 didReceiveHawkeyeDataFragment:a4 withOpcode:[a5 hawkeyeOpcode:v14] fromDevice:[a3 uuid] error:0];
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    id v10 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = 68289539;
      __int16 v15 = 2082;
      unsigned int v16 = "";
      __int16 v17 = 2113;
      id v18 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
      __int16 v19 = 1026;
      unsigned int v20 = [a5 translatedOpcode];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian device type and task not supported for didReceiveHawkeyeDataFragment\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v14, 0x22u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
    }
    __int16 v11 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      id v12 = [[[objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
      unsigned int v13 = [a5 translatedOpcode];
      uint64_t v14 = 68289539;
      __int16 v15 = 2082;
      unsigned int v16 = "";
      __int16 v17 = 2113;
      id v18 = v12;
      __int16 v19 = 1026;
      unsigned int v20 = v13;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian device type and task not supported for didReceiveHawkeyeDataFragment", "{\"msg%{public}.0s\":\"#durian device type and task not supported for didReceiveHawkeyeDataFragment\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v14, 0x22u);
    }
  }
}

- (BOOL)isPoshTask:(unsigned __int16)a3
{
  BOOL result = 1;
  if ((a3 - 3) >= 0xA && ((a3 - 768) > 0x1A || ((1 << a3) & 0x4000013) == 0)) {
    return a3 == 1028;
  }
  return result;
}

- (BOOL)handleCompletionForPoshTask:(id)a3 withCompletionCommand:(id)a4 onDevice:(id)a5
{
  id v9 = -[NSMutableDictionary objectForKey:](self->_taskClientMap, "objectForKey:", [a3 uuid]);
  int v10 = [objc_msgSend(a3, "command") opcode];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  __int16 v11 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [[[objc_msgSend(objc_msgSend(a5, "uuid"), "description") substringToIndex:8];
    unsigned int v13 = [a3 translatedOpcode];
    [a3 queueDuration];
    uint64_t v15 = v14;
    [a3 executionDuration];
    *(_DWORD *)uint64_t buf = 68291075;
    int v126 = 0;
    __int16 v127 = 2082;
    v128 = "";
    __int16 v129 = 2113;
    id v130 = v12;
    __int16 v131 = 1025;
    *(_DWORD *)v132 = v13;
    *(_WORD *)&v132[4] = 2113;
    *(void *)&v132[6] = a3;
    *(_WORD *)&v132[14] = 2050;
    *(void *)&v132[16] = v15;
    *(_WORD *)&v132[24] = 2050;
    *(void *)&v132[26] = v16;
    __int16 v133 = 2113;
    id v134 = a4;
    __int16 v135 = 2113;
    id v136 = [a4 payload];
    __int16 v137 = 1025;
    BOOL v138 = v9 != 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut didCompleteTask\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"task\":%{private, location:escape_only}@, \"queueDuration\":\"%{public}.5f\", \"executionDuration\":\"%{public}.5f\", \"completion command\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"client\":%{private}hhd}", buf, 0x5Au);
  }
  if (a4)
  {
    if (v10 > 767)
    {
      switch(v10)
      {
        case 768:
          id v22 = [(CLDurianService *)self getDeviceUUID:a5];
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331ED8);
          }
          __int16 v23 = qword_102419398;
          if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_82;
          }
          id v24 = [[objc_msgSend(v22, "description") substringToIndex:8];
          *(_DWORD *)uint64_t buf = 68289283;
          int v126 = 0;
          __int16 v127 = 2082;
          v128 = "";
          __int16 v129 = 2113;
          id v130 = v24;
          long long v25 = "{\"msg%{public}.0s\":\"#durian #posh got start sound opcode\", \"item\":%{private, location:escape_only}@}";
          goto LABEL_81;
        case 769:
          id v70 = [(CLDurianService *)self getDeviceUUID:a5];
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331ED8);
          }
          v71 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id v72 = [[objc_msgSend(v70, "description") substringToIndex:8];
            *(_DWORD *)uint64_t buf = 68289283;
            int v126 = 0;
            __int16 v127 = 2082;
            v128 = "";
            __int16 v129 = 2113;
            id v130 = v72;
            _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh didStopPlayingUnauthorizedSoundOnTag\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
          }
          [v9 didStopPlayingUnauthorizedSoundOnTag:[a5 uuid] withError:0];
          break;
        case 770:
          id v73 = [[objc_msgSend(a4, "payload") subdataWithRange:1, [objc_msgSend(objc_msgSend(a4, "payload"), "length") - 1]];
          id v74 = [(CLDurianService *)self getDeviceUUID:a5];
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331ED8);
          }
          v75 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id v76 = [[objc_msgSend(v74, "description") substringToIndex:8];
            *(_DWORD *)uint64_t buf = 68289539;
            int v126 = 0;
            __int16 v127 = 2082;
            v128 = "";
            __int16 v129 = 2113;
            id v130 = v76;
            __int16 v131 = 2113;
            *(void *)v132 = v73;
            _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh got sound response\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@}", buf, 0x26u);
          }
          [v9 didStartPlayingUnauthorizedSoundOnTag:[a5 uuid] withError:0];
          break;
        case 771:
          id v77 = [(CLDurianService *)self getDeviceUUID:a5];
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331ED8);
          }
          v78 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id v79 = [[objc_msgSend(v77, "description") substringToIndex:8];
            *(_DWORD *)uint64_t buf = 68289283;
            int v126 = 0;
            __int16 v127 = 2082;
            v128 = "";
            __int16 v129 = 2113;
            id v130 = v79;
            _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh got sound completion\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
          }
          break;
        case 772:
          id v80 = [objc_msgSend(a4, "payload") subdataWithRange:1, [objc_msgSend(objc_msgSend(a4, "payload"), "length") - 1]];
          id v81 = [(CLDurianService *)self getDeviceUUID:a5];
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331ED8);
          }
          v82 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id v83 = [[objc_msgSend(v81, "description") substringToIndex:8];
            *(_DWORD *)uint64_t buf = 68289795;
            int v126 = 0;
            __int16 v127 = 2082;
            v128 = "";
            __int16 v129 = 2113;
            id v130 = v83;
            __int16 v131 = 2113;
            *(void *)v132 = v80;
            *(_WORD *)&v132[8] = 2114;
            *(void *)&v132[10] = 0;
            _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh started non-owner aggressive advertising for BT finding\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x30u);
          }
          [v9 didStartUnauthorizedAggressiveAdvertisingOnDevice:v81 withError:0];
          [a5 setDisconnectionReason:@"BtFind"];
          [(CLDurianDeviceManager *)self->_deviceManager disconnectDevice:a5];
          break;
        default:
          if (v10 == 794)
          {
            id v84 = [(CLDurianService *)self getDeviceUUID:a5];
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            __int16 v23 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v85 = [[objc_msgSend(v84, "description") substringToIndex:8];
              *(_DWORD *)uint64_t buf = 68289283;
              int v126 = 0;
              __int16 v127 = 2082;
              v128 = "";
              __int16 v129 = 2113;
              id v130 = v85;
              long long v25 = "{\"msg%{public}.0s\":\"#durian #posh got start short sound opcode\", \"item\":%{private, location:escape_only}@}";
LABEL_81:
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v25, buf, 0x1Cu);
            }
LABEL_82:
            [v9 didCompletePlayingUnauthorizedSoundOnTag:[a5 uuid] withError:0];
            -[self->_trackingAvoidanceProxy didSuccessfullyPlayUnauthorizedSound:[a5 uuid] address:[a5 addressFromUnknownBeacon]];
          }
          else if (v10 == 1028)
          {
            id v26 = [objc_msgSend(a4, "payload") subdataWithRange:1, [objc_msgSend(objc_msgSend(a4, "payload"), "length") - 1]];
            id v27 = [(CLDurianService *)self getDeviceUUID:a5];
            if ([v26 length])
            {
              id v28 = 0;
            }
            else
            {
              if (qword_102419390 != -1) {
                dispatch_once(&qword_102419390, &stru_102331ED8);
              }
              v93 = qword_102419398;
              if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
              {
                id v94 = [[objc_msgSend(v27, "description") substringToIndex:8];
                *(_DWORD *)uint64_t buf = 68289283;
                int v126 = 0;
                __int16 v127 = 2082;
                v128 = "";
                __int16 v129 = 2113;
                id v130 = v94;
                _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #posh didFetchAISSerialNumberFromDevice failed to convert to string\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
                if (qword_102419390 != -1) {
                  dispatch_once(&qword_102419390, &stru_102331ED8);
                }
              }
              v95 = qword_102419398;
              if (os_signpost_enabled((os_log_t)qword_102419398))
              {
                id v96 = [[objc_msgSend(v27, "description") substringToIndex:8];
                *(_DWORD *)uint64_t buf = 68289283;
                int v126 = 0;
                __int16 v127 = 2082;
                v128 = "";
                __int16 v129 = 2113;
                id v130 = v96;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v95, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #posh didFetchAISSerialNumberFromDevice failed to convert to string", "{\"msg%{public}.0s\":\"#durian #posh didFetchAISSerialNumberFromDevice failed to convert to string\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
              }
              uint64_t v97 = kCLErrorDomainPrivate;
              NSErrorUserInfoKey v123 = NSLocalizedDescriptionKey;
              CFStringRef v124 = sub_101640864(0x27uLL);
              id v28 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v97, 39, +[NSDictionary dictionaryWithObjects:&v124 forKeys:&v123 count:1]);
            }
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            v98 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v99 = [[objc_msgSend(v27, "description") substringToIndex:8];
              *(_DWORD *)uint64_t buf = 68289795;
              int v126 = 0;
              __int16 v127 = 2082;
              v128 = "";
              __int16 v129 = 2113;
              id v130 = v99;
              __int16 v131 = 2113;
              *(void *)v132 = v26;
              *(_WORD *)&v132[8] = 2114;
              *(void *)&v132[10] = v28;
              _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh parsed response to retrieve serial number\", \"item\":%{private, location:escape_only}@, \"payload\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x30u);
            }
            [v9 didFetchAISSerialNumberFromDevice:[a5 uuid] serialNumber:v26 error:v28];
          }
          break;
      }
    }
    else
    {
      switch(v10)
      {
        case 3:
          id v17 = [objc_msgSend(objc_msgSend(a4, "payload"), "subdataWithRange:", 1, (char *)objc_msgSend(objc_msgSend(a4, "payload"), "length") - 1)];
          id v18 = [(CLDurianService *)self getDeviceUUID:a5];
          if ([v17 length])
          {
            __int16 v19 = 0;
          }
          else
          {
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            v86 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
            {
              id v87 = [[objc_msgSend(v18, "description") substringToIndex:8];
              *(_DWORD *)uint64_t buf = 68289283;
              int v126 = 0;
              __int16 v127 = 2082;
              v128 = "";
              __int16 v129 = 2113;
              id v130 = v87;
              _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #posh didFetchAISProductName failed to convert to string\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
              if (qword_102419390 != -1) {
                dispatch_once(&qword_102419390, &stru_102331ED8);
              }
            }
            v88 = qword_102419398;
            if (os_signpost_enabled((os_log_t)qword_102419398))
            {
              id v89 = [[objc_msgSend(v18, "description") substringToIndex:8];
              *(_DWORD *)uint64_t buf = 68289283;
              int v126 = 0;
              __int16 v127 = 2082;
              v128 = "";
              __int16 v129 = 2113;
              id v130 = v89;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v88, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #posh didFetchAISProductName failed to convert to string", "{\"msg%{public}.0s\":\"#durian #posh didFetchAISProductName failed to convert to string\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
            }
            uint64_t v90 = kCLErrorDomainPrivate;
            NSErrorUserInfoKey v121 = NSLocalizedDescriptionKey;
            CFStringRef v122 = sub_101640864(0x27uLL);
            __int16 v19 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v90, 39, +[NSDictionary dictionaryWithObjects:&v122 forKeys:&v121 count:1]);
          }
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331ED8);
          }
          v91 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id v92 = [[objc_msgSend(v18, "description") substringToIndex:8];
            *(_DWORD *)uint64_t buf = 68290051;
            __int16 v127 = 2082;
            int v126 = 0;
            v128 = "";
            __int16 v129 = 2113;
            id v130 = v92;
            __int16 v131 = 2113;
            *(void *)v132 = v17;
            *(_WORD *)&v132[8] = 2114;
            *(void *)&v132[10] = v17;
            *(_WORD *)&v132[18] = 2114;
            *(void *)&v132[20] = v19;
            _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh parsed response to retrieve product data\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"productData\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
          }
          [v9 didFetchAISProductDataFromDevice:v18 productData:v17 error:v19];
          break;
        case 4:
          id v29 = [objc_msgSend(objc_msgSend(a4, "payload"), "subdataWithRange:", 1, (char *)objc_msgSend(objc_msgSend(a4, "payload"), "length") - 1)];
          id v30 = [(CLDurianService *)self getDeviceUUID:a5];
          if ([v29 length])
          {
            CFStringRef v31 = (const __CFString *)[objc_alloc((Class)NSString) initWithUTF8String:[v29 bytes]];
            id v32 = 0;
          }
          else
          {
            uint64_t v100 = kCLErrorDomainPrivate;
            NSErrorUserInfoKey v117 = NSLocalizedDescriptionKey;
            CFStringRef v118 = sub_101640864(0x27uLL);
            id v32 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v100, 39, +[NSDictionary dictionaryWithObjects:&v118 forKeys:&v117 count:1]);
            CFStringRef v31 = &stru_10234F018;
          }
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331ED8);
          }
          v101 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id v102 = [[objc_msgSend(v30, "description") substringToIndex:8];
            *(_DWORD *)uint64_t buf = 68290051;
            __int16 v127 = 2082;
            int v126 = 0;
            v128 = "";
            __int16 v129 = 2113;
            id v130 = v102;
            __int16 v131 = 2113;
            *(void *)v132 = v29;
            *(_WORD *)&v132[8] = 2114;
            *(void *)&v132[10] = v31;
            *(_WORD *)&v132[18] = 2114;
            *(void *)&v132[20] = v32;
            _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh parsed response to retrieve manufacturer name\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"manufacturerName\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
          }
          [v9 didFetchAISManufacturerNameFromDevice:v30 manufacturerName:v31 error:v32];
          break;
        case 5:
          id v33 = [[objc_msgSend(a4, "payload") subdataWithRange:1, (char *)objc_msgSend(objc_msgSend(a4, "payload"), "length") - 1];
          id v34 = [(CLDurianService *)self getDeviceUUID:a5];
          if ([v33 length])
          {
            CFStringRef v35 = (const __CFString *)[objc_alloc((Class)NSString) initWithUTF8String:[v33 bytes]];
            unsigned int v36 = 0;
          }
          else
          {
            uint64_t v103 = kCLErrorDomainPrivate;
            NSErrorUserInfoKey v119 = NSLocalizedDescriptionKey;
            CFStringRef v120 = sub_101640864(0x27uLL);
            unsigned int v36 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v103, 39, +[NSDictionary dictionaryWithObjects:&v120 forKeys:&v119 count:1]);
            CFStringRef v35 = &stru_10234F018;
          }
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331ED8);
          }
          v104 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id v105 = [[objc_msgSend(v34, "description") substringToIndex:8];
            *(_DWORD *)uint64_t buf = 68290051;
            __int16 v127 = 2082;
            int v126 = 0;
            v128 = "";
            __int16 v129 = 2113;
            id v130 = v105;
            __int16 v131 = 2113;
            *(void *)v132 = v33;
            *(_WORD *)&v132[8] = 2114;
            *(void *)&v132[10] = v35;
            *(_WORD *)&v132[18] = 2114;
            *(void *)&v132[20] = v36;
            _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh parsed response to retrieve model name\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"modelName\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
          }
          [v9 didFetchAISModelNameFromDevice:v34 modelName:v35 error:v36];
          break;
        case 6:
          id v37 = [objc_msgSend(objc_msgSend(a4, "payload"), "subdataWithRange:", 1, (char *)objc_msgSend(objc_msgSend(a4, "payload"), "length") - 1)];
          id v38 = [(CLDurianService *)self getDeviceUUID:a5];
          if ([v37 length])
          {
            v39 = 0;
            uint64_t v40 = *(unsigned __int8 *)[v37 bytes];
          }
          else
          {
            uint64_t v106 = kCLErrorDomainPrivate;
            NSErrorUserInfoKey v115 = NSLocalizedDescriptionKey;
            CFStringRef v116 = sub_101640864(0x27uLL);
            v39 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v106, 39, +[NSDictionary dictionaryWithObjects:&v116 forKeys:&v115 count:1]);
            uint64_t v40 = 0;
          }
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331ED8);
          }
          v107 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id v108 = [[objc_msgSend(v38, "description") substringToIndex:8];
            *(_DWORD *)uint64_t buf = 68290051;
            int v126 = 0;
            __int16 v127 = 2082;
            v128 = "";
            __int16 v129 = 2113;
            id v130 = v108;
            __int16 v131 = 2113;
            *(void *)v132 = v37;
            *(_WORD *)&v132[8] = 2049;
            *(void *)&v132[10] = v40;
            *(_WORD *)&v132[18] = 2114;
            *(void *)&v132[20] = v39;
            _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh parsed response to retrieve  accessory category\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"accessoryCategory\":%{private}ld, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
          }
          [v9 didFetchAISAccessoryCategoryFromDevice:v38 accessoryCategory:v40 error:v39];
          break;
        case 7:
          id v41 = [[objc_msgSend(a4, "payload") subdataWithRange:1, [objc_msgSend(objc_msgSend(a4, "payload"), "length") - 1]];
          id v42 = [(CLDurianService *)self getDeviceUUID:a5];
          if ([v41 length])
          {
            v43 = 0;
            uint64_t v44 = *(unsigned int *)[v41 bytes];
          }
          else
          {
            uint64_t v109 = kCLErrorDomainPrivate;
            NSErrorUserInfoKey v113 = NSLocalizedDescriptionKey;
            CFStringRef v114 = sub_101640864(0x27uLL);
            v43 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v109, 39, +[NSDictionary dictionaryWithObjects:&v114 forKeys:&v113 count:1]);
            uint64_t v44 = 0;
          }
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331ED8);
          }
          v110 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id v111 = [[objc_msgSend(v42, "description") substringToIndex:8];
            *(_DWORD *)uint64_t buf = 68290051;
            int v126 = 0;
            __int16 v127 = 2082;
            v128 = "";
            __int16 v129 = 2113;
            id v130 = v111;
            __int16 v131 = 2113;
            *(void *)v132 = v41;
            *(_WORD *)&v132[8] = 2049;
            *(void *)&v132[10] = v44;
            *(_WORD *)&v132[18] = 2114;
            *(void *)&v132[20] = v43;
            _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh parsed response to retrieve  protocol implementation\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"protocolImplementation\":%{private}ld, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
          }
          [v9 didFetchAISProtocolImplementationFromDevice:v42 protocolImplementation:v44 error:v43];
          break;
        case 8:
          id v45 = [[objc_msgSend(a4, "payload") subdataWithRange:1, [objc_msgSend(objc_msgSend(a4, "payload"), "length") - 1]];
          id v46 = [(CLDurianService *)self getDeviceUUID:a5];
          id v47 = [objc_alloc((Class)NSString) initWithUTF8String:[v45 bytes]];
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331ED8);
          }
          v48 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id v49 = [[objc_msgSend(v46, "description") substringToIndex:8];
            *(_DWORD *)uint64_t buf = 68290051;
            __int16 v127 = 2082;
            int v126 = 0;
            v128 = "";
            __int16 v129 = 2113;
            id v130 = v49;
            __int16 v131 = 2113;
            *(void *)v132 = v45;
            *(_WORD *)&v132[8] = 2114;
            *(void *)&v132[10] = v47;
            *(_WORD *)&v132[18] = 2114;
            *(void *)&v132[20] = 0;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh parsed response to retrieve accessory capabilities\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"accessoryCapabilities\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
          }
          [v9 didFetchAISAccessoryCapabilitiesFromDevice:v46 accessoryCapabilities:v45 error:0];
          break;
        case 9:
          id v50 = [objc_msgSend(objc_msgSend(a4, "payload"), "subdataWithRange:", 1, (char *)objc_msgSend(objc_msgSend(a4, "payload"), "length") - 1)];
          id v51 = [(CLDurianService *)self getDeviceUUID:a5];
          uint64_t v52 = *(unsigned __int8 *)[v50 bytes];
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331ED8);
          }
          v53 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id v54 = [[objc_msgSend(v51, "description") substringToIndex:8];
            *(_DWORD *)uint64_t buf = 68290051;
            int v126 = 0;
            __int16 v127 = 2082;
            v128 = "";
            __int16 v129 = 2113;
            id v130 = v54;
            __int16 v131 = 2113;
            *(void *)v132 = v50;
            *(_WORD *)&v132[8] = 2049;
            *(void *)&v132[10] = v52;
            *(_WORD *)&v132[18] = 2114;
            *(void *)&v132[20] = 0;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh parsed response to retrieve  network id\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"networkID\":%{private}ld, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
          }
          [v9 didFetchAISNetworkIDFromDevice:v51 networkID:v52 error:0];
          break;
        case 10:
          id v55 = [objc_msgSend(objc_msgSend(a4, "payload"), "subdataWithRange:", 1, (char *)objc_msgSend(objc_msgSend(a4, "payload"), "length") - 1);
          id v56 = [(CLDurianService *)self getDeviceUUID:a5];
          id v57 = [objc_alloc((Class)NSString) initWithUTF8String:[v55 bytes]];
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331ED8);
          }
          v58 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id v59 = [[objc_msgSend(v56, "description") substringToIndex:8];
            *(_DWORD *)uint64_t buf = 68290051;
            __int16 v127 = 2082;
            int v126 = 0;
            v128 = "";
            __int16 v129 = 2113;
            id v130 = v59;
            __int16 v131 = 2113;
            *(void *)v132 = v55;
            *(_WORD *)&v132[8] = 2114;
            *(void *)&v132[10] = v57;
            *(_WORD *)&v132[18] = 2114;
            *(void *)&v132[20] = 0;
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh parsed response to retrieve firmware version\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"firmwareVersion\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
          }
          [v9 didFetchAISFirmwareVersionFromDevice:v56 firmwareVersion:v55 error:0];
          break;
        case 11:
          id v60 = [objc_msgSend(a4, "payload") subdataWithRange:1, (char *)objc_msgSend(objc_msgSend(a4, "payload"), "length") - 1];
          id v61 = [(CLDurianService *)self getDeviceUUID:a5];
          uint64_t v62 = *(unsigned __int8 *)[v60 bytes];
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331ED8);
          }
          v63 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id v64 = [[[v61 description] substringToIndex:8];
            *(_DWORD *)uint64_t buf = 68290051;
            int v126 = 0;
            __int16 v127 = 2082;
            v128 = "";
            __int16 v129 = 2113;
            id v130 = v64;
            __int16 v131 = 2113;
            *(void *)v132 = v60;
            *(_WORD *)&v132[8] = 2049;
            *(void *)&v132[10] = v62;
            *(_WORD *)&v132[18] = 2114;
            *(void *)&v132[20] = 0;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh parsed response to retrieve battery type\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"batteryType\":%{private}ld, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
          }
          [v9 didFetchAISBatteryTypeFromDevice:v61 batteryType:v62 error:0];
          break;
        case 12:
          id v65 = [[objc_msgSend(a4, "payload") subdataWithRange:1, (char *)objc_msgSend(objc_msgSend(a4, "payload"), "length") - 1];
          id v66 = [(CLDurianService *)self getDeviceUUID:a5];
          uint64_t v67 = *(unsigned __int8 *)[v65 bytes];
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331ED8);
          }
          v68 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id v69 = [[objc_msgSend(v66, "description") substringToIndex:8];
            *(_DWORD *)uint64_t buf = 68290051;
            int v126 = 0;
            __int16 v127 = 2082;
            v128 = "";
            __int16 v129 = 2113;
            id v130 = v69;
            __int16 v131 = 2113;
            *(void *)v132 = v65;
            *(_WORD *)&v132[8] = 2049;
            *(void *)&v132[10] = v67;
            *(_WORD *)&v132[18] = 2114;
            *(void *)&v132[20] = 0;
            _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh parsed response to retrieve battery level\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"batteryLevel\":%{private}ld, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
          }
          [v9 didFetchAISBatteryLevelFromDevice:v66 batteryLevel:v67 error:0];
          break;
        default:
          return a4 != 0;
      }
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    unsigned int v20 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "#durian #posh #ut completionCommand is nil", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
      v112 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLDurianService handleCompletionForPoshTask:withCompletionCommand:onDevice:]", "%s\n", v112);
      if (v112 != (char *)buf) {
        free(v112);
      }
    }
  }
  return a4 != 0;
}

- (void)device:(id)a3 didCompleteTask:(id)a4 withCompletionCommand:(id)a5
{
  if (a4)
  {
    id v9 = -[NSMutableDictionary objectForKey:](self->_taskClientMap, "objectForKey:", [a4 uuid]);
    [a4 complete];
    id v10 = [objc_msgSend(a4, "command") opcode];
    __int16 v11 = (unsigned __int8 *)[a5 payload bytes];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    id v12 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
      unsigned int v14 = [a4 translatedOpcode];
      [a4 queueDuration];
      uint64_t v16 = v15;
      [a4 executionDuration];
      *(_DWORD *)uint64_t buf = 68291075;
      int v245 = 0;
      __int16 v246 = 2082;
      v247 = "";
      __int16 v248 = 2113;
      id v249 = v13;
      __int16 v250 = 1025;
      *(_DWORD *)v251 = v14;
      *(_WORD *)&v251[4] = 2113;
      *(void *)&v251[6] = a4;
      *(_WORD *)&v251[14] = 2050;
      *(void *)&v251[16] = v16;
      *(_WORD *)v252 = 2050;
      *(void *)&v252[2] = v17;
      __int16 v253 = 2113;
      id v254 = a5;
      __int16 v255 = 2113;
      id v256 = [a5 payload];
      __int16 v257 = 1025;
      BOOL v258 = v9 != 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian didCompleteTask\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"task\":%{private, location:escape_only}@, \"queueDuration\":\"%{public}.5f\", \"executionDuration\":\"%{public}.5f\", \"completion command\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"client\":%{private}hhd}", buf, 0x5Au);
    }
    if ([a3 pendingDisconnect] && objc_msgSend(a3, "isTaskQueueEmpty"))
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
      id v18 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)uint64_t buf = 68289026;
        int v245 = 0;
        __int16 v246 = 2082;
        v247 = "";
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #disconnectbackstop device pending disconnection completed tasks, scheduling for disconnection\"}", buf, 0x12u);
      }
      -[CLDurianDeviceManager scheduleDisconnectionOnMissingBeaconWithUUID:](self->_deviceManager, "scheduleDisconnectionOnMissingBeaconWithUUID:", [a3 uuid]);
    }
    if v10 != 208 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      if (-[CLDurianService isPoshTask:](self, "isPoshTask:", v10) && [a3 isPoshAccessory])
      {
        [(CLDurianService *)self handleCompletionForPoshTask:a4 withCompletionCommand:a5 onDevice:a3];
LABEL_18:
        if ([a3 isHawkeyeAccessory])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            __int16 v19 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v20 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
              unsigned int v21 = [a4 hawkeyeOpcode];
              unsigned int v22 = [(NSMutableSet *)self->_clients count];
              *(_DWORD *)uint64_t buf = 68289795;
              int v245 = 0;
              __int16 v246 = 2082;
              v247 = "";
              __int16 v248 = 2113;
              id v249 = v20;
              __int16 v250 = 1025;
              *(_DWORD *)v251 = v21;
              *(_WORD *)&v251[4] = 1026;
              *(_DWORD *)&v251[6] = v22;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didCompleteTask\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"clients\":%{public}d}", buf, 0x28u);
            }
            long long v231 = 0u;
            long long v232 = 0u;
            long long v229 = 0u;
            long long v230 = 0u;
            clients = self->_clients;
            id v45 = [(NSMutableSet *)clients countByEnumeratingWithState:&v229 objects:v235 count:16];
            if (v45)
            {
              id v46 = v45;
              uint64_t v47 = *(void *)v230;
              do
              {
                for (i = 0; i != v46; i = (char *)i + 1)
                {
                  if (*(void *)v230 != v47) {
                    objc_enumerationMutation(clients);
                  }
                  [*(id *)(*((void *)&v229 + 1) + 8 * i) didCompleteHawkeyeTaskWithOpcode:[a4 hawkeyeOpcode] fromDevice:[a3 uuid] withError:0];
                }
                id v46 = [(NSMutableSet *)clients countByEnumeratingWithState:&v229 objects:v235 count:16];
              }
              while (v46);
            }
          }
        }
        if ([a3 isAirTag])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            id v49 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v50 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
              unsigned int v51 = [a4 command].opcode;
              unsigned int v52 = [(NSMutableSet *)self->_clients count];
              *(_DWORD *)uint64_t buf = 68289795;
              int v245 = 0;
              __int16 v246 = 2082;
              v247 = "";
              __int16 v248 = 2113;
              id v249 = v50;
              __int16 v250 = 1025;
              *(_DWORD *)v251 = v51;
              *(_WORD *)&v251[4] = 1026;
              *(_DWORD *)&v251[6] = v52;
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut didCompleteTask\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"clients\":%{public}d}", buf, 0x28u);
            }
            long long v227 = 0u;
            long long v228 = 0u;
            long long v225 = 0u;
            long long v226 = 0u;
            v53 = self->_clients;
            id v54 = [(NSMutableSet *)v53 countByEnumeratingWithState:&v225 objects:v234 count:16];
            if (v54)
            {
              id v55 = v54;
              uint64_t v56 = *(void *)v226;
              do
              {
                for (j = 0; j != v55; j = (char *)j + 1)
                {
                  if (*(void *)v226 != v56) {
                    objc_enumerationMutation(v53);
                  }
                  [*(id *)(*((void *)&v225 + 1) + 8 * (void)j) didCompleteHawkeyeTaskWithOpcode:[objc_msgSend(objc_msgSend(a4, "command"), "opcode")] fromDevice:[objc_msgSend(a3, "uuid")] withError:0];
                }
                id v55 = [(NSMutableSet *)v53 countByEnumeratingWithState:&v225 objects:v234 count:16];
              }
              while (v55);
            }
          }
        }
        -[NSMutableDictionary removeObjectForKey:](self->_taskClientMap, "removeObjectForKey:", [a4 uuid]);
        -[NSMutableDictionary removeObjectForKey:](self->_pendingTaskMap, "removeObjectForKey:", [a4 uuid]);
        [(CLDurianDeviceManager *)self->_deviceManager scheduleConnectionEvaluationForDevice:a3];
        [(CLDurianMetricManager *)self->_metricManager submitTaskMetricsForDevice:a3 task:a4 completed:1 errorCode:-1];
        return;
      }
      if ((int)v10 > 173)
      {
        switch((int)v10)
        {
          case 174:
            id v25 = [a4 characteristicPayload];
            id v26 = (unsigned int *)[v25 bytes];
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            id v27 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v28 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
              unsigned int v29 = *v26;
              *(_DWORD *)uint64_t buf = 68289539;
              int v245 = 0;
              __int16 v246 = 2082;
              v247 = "";
              __int16 v248 = 2113;
              id v249 = v28;
              __int16 v250 = 1025;
              *(_DWORD *)v251 = v29;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian fetched current key index\", \"item\":%{private, location:escape_only}@, \"index\":%{private}u}", buf, 0x22u);
            }
            [(CLDurianDeviceManager *)self->_deviceManager setCurrentKeyIndex:*v26 forDevice:a3];
            if ((unint64_t)[v25 length] >= 5)
            {
              if (qword_102419390 != -1) {
                dispatch_once(&qword_102419390, &stru_102331ED8);
              }
              id v30 = qword_102419398;
              if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
              {
                id v31 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
                unsigned int v32 = v26[1];
                *(_DWORD *)uint64_t buf = 68289539;
                int v245 = 0;
                __int16 v246 = 2082;
                v247 = "";
                __int16 v248 = 2113;
                id v249 = v31;
                __int16 v250 = 1025;
                *(_DWORD *)v251 = v32;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian fetched current wild key index\", \"item\":%{private, location:escape_only}@, \"index\":%{private}u}", buf, 0x22u);
              }
              [(CLDurianDeviceManager *)self->_deviceManager setCurrentWildKeyIndex:v26[1] forDevice:a3 forEvent:@"fetchkeyindex"];
            }
            [a3 setDisconnectionReason:@"Task:FetchCurrentKeyIndex"];
            deviceManager = self->_deviceManager;
            goto LABEL_115;
          case 175:
            if ([a3 isHawkeyeAccessory]) {
              [v9 didCompletePlayingUnauthorizedSoundOnTag:[a3 uuid] withError:0];
            }
            if ([a3 isAirTag]) {
              [v9 didStartPlayingUnauthorizedSoundOnTag:[a3 uuid] withError:0];
            }
            goto LABEL_141;
          case 176:
          case 178:
          case 179:
          case 182:
          case 183:
          case 184:
          case 185:
          case 186:
          case 187:
          case 188:
          case 189:
          case 190:
          case 191:
          case 192:
          case 193:
          case 194:
          case 196:
          case 197:
          case 198:
          case 204:
          case 205:
          case 206:
          case 207:
          case 219:
            goto LABEL_18;
          case 177:
            if ([a3 isAirTag]) {
              -[CLDurianDeviceManager setKeyRollTimeout:forDevice:](self->_deviceManager, "setKeyRollTimeout:forDevice:", *(unsigned int *)[objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a4, "command"), "payload"), "subdataWithRange:", 1, 4), "bytes") bytes]/ 0x3E8uLL, a3);
            }
            if (![a3 isHawkeyeAccessory]) {
              goto LABEL_18;
            }
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            uint64_t v61 = qword_102419398;
            if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_18;
            }
            id v89 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
            *(_DWORD *)uint64_t buf = 68289283;
            int v245 = 0;
            __int16 v246 = 2082;
            v247 = "";
            __int16 v248 = 2113;
            id v249 = v89;
            v63 = "{\"msg%{public}.0s\":\"#durian #hawkeye CLDurianCommandOpcodeSetKeyRotationTimeout TBD\", \"item\":%{p"
                  "rivate, location:escape_only}@}";
            goto LABEL_149;
          case 180:
            uint64_t v90 = *((unsigned __int8 *)[([[a4 command] payload] bytes] + 1));
            id v91 = [a4 characteristicPayload];
            id v92 = [a3 uuid];
            v93 = v9;
            id v94 = v91;
            uint64_t v95 = v90;
            goto LABEL_152;
          case 181:
            if (v11[1])
            {
              if (qword_102419390 != -1) {
                dispatch_once(&qword_102419390, &stru_102331ED8);
              }
              id v96 = qword_102419398;
              if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
              {
                id v97 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
                *(_DWORD *)uint64_t buf = 68289283;
                int v245 = 0;
                __int16 v246 = 2082;
                v247 = "";
                __int16 v248 = 2113;
                id v249 = v97;
                _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian detected crashes on device\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
              }
              if (+[CLDurianSettings crashAlertEnabled])
              {
                if (qword_102419390 != -1) {
                  dispatch_once(&qword_102419390, &stru_102331ED8);
                }
                v98 = qword_102419398;
                if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
                {
                  id v99 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
                  *(_DWORD *)uint64_t buf = 68289283;
                  int v245 = 0;
                  __int16 v246 = 2082;
                  v247 = "";
                  __int16 v248 = 2113;
                  id v249 = v99;
                  _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian displaying crash alert\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
                }
                sub_10163F7B8(a3, (char *)v11[1]);
                -[NSMutableSet makeObjectsPerformSelector:withObject:](self->_clients, "makeObjectsPerformSelector:withObject:", "didDetectCrashOnTag:", [a3 uuid]);
              }
            }
            goto LABEL_18;
          case 195:
            [v9 didSetUnauthorizedPlaySoundRateLimitFromTag:[a3 uuid] error:0];
            goto LABEL_18;
          case 199:
            [v9 didSetAccelerometerSlopeModeConfigurationOnTag:[a3 uuid] error:0];
            goto LABEL_18;
          case 200:
            [v9 didSetAccelerometerOrientationModeConfigurationOnTag:[a3 uuid] error:nil];
            goto LABEL_18;
          case 201:
            uint64_t v100 = (unsigned __int8 *)[a5 payload];
            id v101 = [objc_alloc((Class)CLFindMyAccessoryAccelerometerSlopeModeConfiguration) initWithThreshold:*v100 sampleCount:v100[3] sampleRate:0.0];
            [v9 didFetchAccelerometerSlopeModeConfiguration:v101 onTag:[a3 uuid] error:0];

            goto LABEL_18;
          case 202:
            [v9 didFetchAccelerometerOrientationModeConfiguration:0 onTag:[a3 uuid] error:0];
            goto LABEL_18;
          case 203:
            [v9 didFetchAccelerometerMode:0 onTag:[a3 uuid] error:0];
            goto LABEL_18;
          case 208:
            int v102 = [a4 hawkeyeOpcode];
            if (v102 <= 771)
            {
              switch(v102)
              {
                case 527:
                  [v9 didCompleteAggressiveAdvertisingOnDevice:[a3 uuid] withError:0];
                  goto LABEL_18;
                case 528:
                  [v9 didStopAggressiveAdvertisingOnDevice:[a3 uuid] withError:0];
                  goto LABEL_18;
                case 529:
                  id v180 = [[objc_msgSend(a5, "payload") subdataWithRange:2, (char *)objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2];
                  v233[0] = 0;
                  [v180 getBytes:v233 length:1];
                  if (qword_102419390 != -1) {
                    dispatch_once(&qword_102419390, &stru_102331ED8);
                  }
                  v158 = qword_102419398;
                  if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_242;
                  }
                  id v181 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
                  *(_DWORD *)uint64_t buf = 68289795;
                  int v245 = 0;
                  __int16 v246 = 2082;
                  v247 = "";
                  __int16 v248 = 2113;
                  id v249 = v181;
                  __int16 v250 = 2113;
                  *(void *)v251 = v180;
                  *(_WORD *)&v251[8] = 1025;
                  *(_DWORD *)&v251[10] = v233[0];
                  v160 = "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchTxPower (owner)\", \"item\":%{private, location"
                         ":escape_only}@, \"bytes\":%{private, location:escape_only}@, \"txpower\":%{private}d}";
                  goto LABEL_241;
                case 530:
                case 531:
                case 532:
                case 533:
                case 534:
                case 535:
                case 536:
                case 539:
                case 540:
                  break;
                case 537:
                case 538:
                case 541:
                  goto LABEL_18;
                default:
                  if (v102 == 517)
                  {
                    v209 = +[NSDate date];
                    mach_continuous_time();
                    [a4 completionTime];
                    TMConvertTicksToSeconds();
                    v211 = [(NSDate *)v209 dateByAddingTimeInterval:-v210];
                    [a4 executionDuration];
                    -[CLDurianDeviceManager setAlignmentUncertainty:atIndex:date:forDevice:](self->_deviceManager, "setAlignmentUncertainty:atIndex:date:forDevice:", [a4 currentIndex], v211, a3, v212);
                    goto LABEL_18;
                  }
                  if (v102 == 551) {
                    goto LABEL_18;
                  }
                  break;
              }
            }
            else
            {
              if (v102 <= 1023)
              {
                switch(v102)
                {
                  case 772:
                    [v9 didStartUnauthorizedAggressiveAdvertisingOnDevice:[a3 uuid] withError:0];
                    CFStringRef v74 = @"BtFind";
                    goto LABEL_114;
                  case 773:
                    id v186 = [objc_msgSend(a5, "payload") subdataWithRange:2, (char *)[objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2]];
                    v233[0] = 0;
                    [v186 getBytes:v233 length:1];
                    if (qword_102419390 != -1) {
                      dispatch_once(&qword_102419390, &stru_102331ED8);
                    }
                    v158 = qword_102419398;
                    if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_242;
                    }
                    id v187 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
                    *(_DWORD *)uint64_t buf = 68289795;
                    int v245 = 0;
                    __int16 v246 = 2082;
                    v247 = "";
                    __int16 v248 = 2113;
                    id v249 = v187;
                    __int16 v250 = 2113;
                    *(void *)v251 = v186;
                    *(_WORD *)&v251[8] = 1025;
                    *(_DWORD *)&v251[10] = v233[0];
                    v160 = "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchTxPower (non-owner)\", \"item\":%{private, lo"
                           "cation:escape_only}@, \"bytes\":%{private, location:escape_only}@, \"txpower\":%{private}d}";
                    goto LABEL_241;
                  case 774:
                    id v103 = [[objc_msgSend(a5, "payload") subdataWithRange:2, [objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2]];
                    id v104 = [(CLDurianService *)self getDeviceUUID:a3];
                    if (qword_102419390 != -1) {
                      dispatch_once(&qword_102419390, &stru_102331ED8);
                    }
                    id v105 = qword_102419398;
                    if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_179;
                    }
                    id v188 = [[objc_msgSend(v104, "description") substringToIndex:8];
                    *(_DWORD *)uint64_t buf = 68289539;
                    int v245 = 0;
                    __int16 v246 = 2082;
                    v247 = "";
                    __int16 v248 = 2113;
                    id v249 = v188;
                    __int16 v250 = 2113;
                    *(void *)v251 = v103;
                    v107 = "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchProductDataAIS NonOwner\", \"item\":%{private"
                           ", location:escape_only}@, \"bytes\":%{private, location:escape_only}@}";
                    goto LABEL_178;
                  case 775:
                    id v189 = [[objc_msgSend(a5, "payload") subdataWithRange:2, (char *)objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2];
                    if (qword_102419390 != -1) {
                      dispatch_once(&qword_102419390, &stru_102331ED8);
                    }
                    v190 = qword_102419398;
                    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
                    {
                      id v191 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
                      *(_DWORD *)uint64_t buf = 68289539;
                      int v245 = 0;
                      __int16 v246 = 2082;
                      v247 = "";
                      __int16 v248 = 2113;
                      id v249 = v191;
                      __int16 v250 = 2113;
                      *(void *)v251 = v189;
                      _os_log_impl((void *)&_mh_execute_header, v190, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchManufacturerNameAIS NonOwner\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@}", buf, 0x26u);
                    }
                    CFStringRef v192 = (const __CFString *)[objc_alloc((Class)NSString) initWithData:v189 encoding:4];
                    if (v192)
                    {
                      CFStringRef v193 = v192;
                      id v115 = [a3 uuid];
                      CFStringRef v114 = v9;
                      CFStringRef v113 = v193;
                      goto LABEL_186;
                    }
                    if (qword_102419390 != -1) {
                      dispatch_once(&qword_102419390, &stru_102331ED8);
                    }
                    v213 = qword_102419398;
                    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
                    {
                      id v214 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
                      *(_DWORD *)uint64_t buf = 68289283;
                      int v245 = 0;
                      __int16 v246 = 2082;
                      v247 = "";
                      __int16 v248 = 2113;
                      id v249 = v214;
                      _os_log_impl((void *)&_mh_execute_header, v213, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchManufacturerNameAIS NonOwner failed to convert to string\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
                      if (qword_102419390 != -1) {
                        dispatch_once(&qword_102419390, &stru_102331ED8);
                      }
                    }
                    v215 = qword_102419398;
                    if (os_signpost_enabled((os_log_t)qword_102419398))
                    {
                      id v216 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
                      *(_DWORD *)uint64_t buf = 68289283;
                      int v245 = 0;
                      __int16 v246 = 2082;
                      v247 = "";
                      __int16 v248 = 2113;
                      id v249 = v216;
                      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v215, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye didFetchManufacturerNameAIS NonOwner failed to convert to string", "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchManufacturerNameAIS NonOwner failed to convert to string\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
                    }
                    uint64_t v217 = kCLErrorDomainPrivate;
                    NSErrorUserInfoKey v238 = NSLocalizedDescriptionKey;
                    CFStringRef v239 = sub_101640864(0x27uLL);
                    v218 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v217, 39, +[NSDictionary dictionaryWithObjects:&v239 forKeys:&v238 count:1]);
                    id v115 = [a3 uuid];
                    CFStringRef v113 = &stru_10234F018;
                    CFStringRef v114 = v9;
                    CFStringRef v116 = v218;
                    goto LABEL_254;
                  case 776:
                    id v194 = [objc_msgSend(objc_msgSend(a5, "payload"), "subdataWithRange:", 2, (char *)objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2)];
                    if (qword_102419390 != -1) {
                      dispatch_once(&qword_102419390, &stru_102331ED8);
                    }
                    v195 = qword_102419398;
                    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
                    {
                      id v196 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
                      *(_DWORD *)uint64_t buf = 68289539;
                      int v245 = 0;
                      __int16 v246 = 2082;
                      v247 = "";
                      __int16 v248 = 2113;
                      id v249 = v196;
                      __int16 v250 = 2113;
                      *(void *)v251 = v194;
                      _os_log_impl((void *)&_mh_execute_header, v195, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchModelNameAIS NonOwner\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@}", buf, 0x26u);
                    }
                    CFStringRef v197 = (const __CFString *)[objc_alloc((Class)NSString) initWithData:v194 encoding:4];
                    if (v197)
                    {
                      CFStringRef v198 = v197;
                      id v124 = [a3 uuid];
                      NSErrorUserInfoKey v123 = v9;
                      CFStringRef v122 = v198;
                      goto LABEL_193;
                    }
                    if (qword_102419390 != -1) {
                      dispatch_once(&qword_102419390, &stru_102331ED8);
                    }
                    v219 = qword_102419398;
                    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
                    {
                      id v220 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
                      *(_DWORD *)uint64_t buf = 68289283;
                      int v245 = 0;
                      __int16 v246 = 2082;
                      v247 = "";
                      __int16 v248 = 2113;
                      id v249 = v220;
                      _os_log_impl((void *)&_mh_execute_header, v219, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchModelNameAIS NonOwner failed to convert to string\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
                      if (qword_102419390 != -1) {
                        dispatch_once(&qword_102419390, &stru_102331ED8);
                      }
                    }
                    v221 = qword_102419398;
                    if (os_signpost_enabled((os_log_t)qword_102419398))
                    {
                      id v222 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
                      *(_DWORD *)uint64_t buf = 68289283;
                      int v245 = 0;
                      __int16 v246 = 2082;
                      v247 = "";
                      __int16 v248 = 2113;
                      id v249 = v222;
                      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v221, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye didFetchModelNameAIS NonOwner failed to convert to string", "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchModelNameAIS NonOwner failed to convert to string\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
                    }
                    uint64_t v223 = kCLErrorDomainPrivate;
                    NSErrorUserInfoKey v236 = NSLocalizedDescriptionKey;
                    CFStringRef v237 = sub_101640864(0x27uLL);
                    v224 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v223, 39, +[NSDictionary dictionaryWithObjects:&v237 forKeys:&v236 count:1]);
                    id v124 = [a3 uuid];
                    CFStringRef v122 = &stru_10234F018;
                    NSErrorUserInfoKey v123 = v9;
                    v125 = v224;
                    break;
                  case 777:
                    id v129 = [[objc_msgSend(a5, "payload") subdataWithRange:2, [objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2]];
                    id v130 = [(CLDurianService *)self getDeviceUUID:a3];
                    if (qword_102419390 != -1) {
                      dispatch_once(&qword_102419390, &stru_102331ED8);
                    }
                    __int16 v131 = qword_102419398;
                    if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_204;
                    }
                    id v199 = [[[v130 description] substringToIndex:8];
                    *(_DWORD *)uint64_t buf = 68289539;
                    int v245 = 0;
                    __int16 v246 = 2082;
                    v247 = "";
                    __int16 v248 = 2113;
                    id v249 = v199;
                    __int16 v250 = 2113;
                    *(void *)v251 = v129;
                    __int16 v133 = "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchAccessoryCategoryAIS NonOwner\", \"item\":%{p"
                           "rivate, location:escape_only}@, \"bytes\":%{private, location:escape_only}@}";
                    goto LABEL_203;
                  case 778:
                    id v134 = [[objc_msgSend(a5, "payload") subdataWithRange:2, [objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2]];
                    if (qword_102419390 != -1) {
                      dispatch_once(&qword_102419390, &stru_102331ED8);
                    }
                    v200 = qword_102419398;
                    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
                    {
                      id v201 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
                      *(_DWORD *)uint64_t buf = 68289539;
                      int v245 = 0;
                      __int16 v246 = 2082;
                      v247 = "";
                      __int16 v248 = 2113;
                      id v249 = v201;
                      __int16 v250 = 2113;
                      *(void *)v251 = v134;
                      _os_log_impl((void *)&_mh_execute_header, v200, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchAccessoryCapabilitiesAIS NonOwner\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@}", buf, 0x26u);
                    }
                    id v139 = [a3 uuid];
                    BOOL v138 = v9;
                    goto LABEL_210;
                  case 779:
                    id v40 = [objc_msgSend(a5, "payload") subdataWithRange:2, [objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2]];
                    if (qword_102419390 != -1) {
                      dispatch_once(&qword_102419390, &stru_102331ED8);
                    }
                    v202 = qword_102419398;
                    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
                    {
                      id v203 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
                      *(_DWORD *)uint64_t buf = 68289539;
                      int v245 = 0;
                      __int16 v246 = 2082;
                      v247 = "";
                      __int16 v248 = 2113;
                      id v249 = v203;
                      __int16 v250 = 2113;
                      *(void *)v251 = v40;
                      _os_log_impl((void *)&_mh_execute_header, v202, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchFirmwareVersionAIS NonOwner\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@}", buf, 0x26u);
                    }
                    goto LABEL_55;
                  case 780:
                    id v144 = [[objc_msgSend(a5, "payload") subdataWithRange:2, [objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2]];
                    if (qword_102419390 != -1) {
                      dispatch_once(&qword_102419390, &stru_102331ED8);
                    }
                    v145 = qword_102419398;
                    if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_222;
                    }
                    id v204 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
                    *(_DWORD *)uint64_t buf = 68289539;
                    int v245 = 0;
                    __int16 v246 = 2082;
                    v247 = "";
                    __int16 v248 = 2113;
                    id v249 = v204;
                    __int16 v250 = 2113;
                    *(void *)v251 = v144;
                    v147 = "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchFindMyVersionAIS NonOwner\", \"item\":%{priva"
                           "te, location:escape_only}@, \"bytes\":%{private, location:escape_only}@}";
                    goto LABEL_221;
                  case 781:
                    id v148 = [objc_msgSend(a5, "payload") subdataWithRange:2, (char *)objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2];
                    if (qword_102419390 != -1) {
                      dispatch_once(&qword_102419390, &stru_102331ED8);
                    }
                    v149 = qword_102419398;
                    if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_228;
                    }
                    id v205 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
                    *(_DWORD *)uint64_t buf = 68289539;
                    int v245 = 0;
                    __int16 v246 = 2082;
                    v247 = "";
                    __int16 v248 = 2113;
                    id v249 = v205;
                    __int16 v250 = 2113;
                    *(void *)v251 = v148;
                    v151 = "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchBatteryTypeAIS NonOwner\", \"item\":%{private"
                           ", location:escape_only}@, \"bytes\":%{private, location:escape_only}@}";
                    goto LABEL_227;
                  case 782:
                    id v152 = [[objc_msgSend(a5, "payload") subdataWithRange:2, (char *)objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2];
                    v153 = (unsigned __int8 *)[v152 bytes];
                    if (qword_102419390 != -1) {
                      dispatch_once(&qword_102419390, &stru_102331ED8);
                    }
                    v154 = qword_102419398;
                    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_232;
                    }
                    goto LABEL_233;
                  default:
                    goto LABEL_299;
                }
LABEL_263:
                [v123 didFetchHawkeyeAISModelNameFromDevice:v124 modelName:v122 error:v125];
                goto LABEL_18;
              }
              if (v102 <= 1027)
              {
                if (v102 == 1024)
                {
                  [v9 didFetchHawkeyeCurrentPrimaryKeyFromDevice:objc_msgSend(a3, "uuid") currentPrimaryKey:objc_msgSend(objc_msgSend(a5, "payload"), "subdataWithRange:", 2, (char *)objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2) error:0];
                  goto LABEL_18;
                }
                if (v102 == 1025)
                {
                  [v9 didFetchHawkeyeiCloudIdentifierFromDevice:objc_msgSend(a3, "uuid") iCloudIdentifier:objc_msgSend(objc_msgSend(a5, "payload"), "subdataWithRange:", 2, (char *)objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2) error:0];
                  goto LABEL_18;
                }
              }
              else
              {
                switch(v102)
                {
                  case 1285:
                    [v9 didSetHawkeyeUTMotionConfigForDevice:[a3 uuid] withError:nil];
                    goto LABEL_18;
                  case 1281:
                    if (qword_102419390 != -1) {
                      dispatch_once(&qword_102419390, &stru_102331ED8);
                    }
                    v206 = qword_102419398;
                    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
                    {
                      id v207 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
                      *(_DWORD *)uint64_t buf = 68289283;
                      int v245 = 0;
                      __int16 v246 = 2082;
                      v247 = "";
                      __int16 v248 = 2113;
                      id v249 = v207;
                      _os_log_impl((void *)&_mh_execute_header, v206, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye log final\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
                    }
                    id v208 = [objc_msgSend(a5, "payload") subdataWithRange:2, [objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2]];
                    id v92 = [a3 uuid];
                    v93 = v9;
                    id v94 = v208;
                    uint64_t v95 = 4;
LABEL_152:
                    [v93 didDumpLogs:v94 ofType:v95 fromTag:v92 withError:0];
                    goto LABEL_18;
                  case 1028:
                    [v9 didFetchHawkeyeSerialNumberFromDevice:objc_msgSend(a3, "uuid") serialNumber:objc_msgSend(objc_msgSend(a5, "payload"), "subdataWithRange:", 2, (char *)objc_msgSend(objc_msgSend(a5, "payload"), "length") - 2) error:0];
                    goto LABEL_18;
                }
              }
            }
LABEL_299:
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            uint64_t v182 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v183 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
              uint64_t v184 = [objc_msgSend(a4, "command") opcode];
              unsigned int v185 = [a4 hawkeyeOpcode];
              *(_DWORD *)uint64_t buf = 68289795;
              int v245 = 0;
              __int16 v246 = 2082;
              v247 = "";
              __int16 v248 = 2113;
              id v249 = v183;
              __int16 v250 = 2049;
              *(void *)v251 = v184;
              *(_WORD *)&v251[8] = 2049;
              *(void *)&v251[10] = v185;
              v63 = "{\"msg%{public}.0s\":\"#durian #hawkeye unhandled didComplete hawkeye task\", \"item\":%{private, lo"
                    "cation:escape_only}@, \"DurianOpcode\":%{private}lu, \"HawkeyeOpcode\":%{private}lu}";
              uint64_t v67 = v182;
              uint32_t v68 = 48;
              goto LABEL_150;
            }
            break;
          case 209:
            id v103 = [a4 characteristicPayload];
            id v104 = [(CLDurianService *)self getDeviceUUID:a3];
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            id v105 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v106 = [[[v104 description] substringToIndex:8];
              *(_DWORD *)uint64_t buf = 68289539;
              int v245 = 0;
              __int16 v246 = 2082;
              v247 = "";
              __int16 v248 = 2113;
              id v249 = v106;
              __int16 v250 = 2113;
              *(void *)v251 = v103;
              v107 = "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchProductDataAIS\", \"item\":%{private, location:esca"
                     "pe_only}@, \"bytes\":%{private, location:escape_only}@}";
LABEL_178:
              _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, v107, buf, 0x26u);
            }
LABEL_179:
            [v9 didFetchHawkeyeAISProductDataFromDevice:v104 productData:v103 error:0];
            goto LABEL_18;
          case 210:
            id v108 = [a4 characteristicPayload];
            id v109 = [(CLDurianService *)self getDeviceUUID:a3];
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            v110 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v111 = [[objc_msgSend(v109, "description") substringToIndex:8];
              *(_DWORD *)uint64_t buf = 68289539;
              int v245 = 0;
              __int16 v246 = 2082;
              v247 = "";
              __int16 v248 = 2113;
              id v249 = v111;
              __int16 v250 = 2113;
              *(void *)v251 = v108;
              _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchManufacturerNameAIS\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@}", buf, 0x26u);
            }
            CFStringRef v112 = (const __CFString *)[objc_alloc((Class)NSString) initWithUTF8String:[v108 bytes]];
            if (v112)
            {
              CFStringRef v113 = v112;
              CFStringRef v114 = v9;
              id v115 = v109;
LABEL_186:
              CFStringRef v116 = 0;
            }
            else
            {
              if (qword_102419390 != -1) {
                dispatch_once(&qword_102419390, &stru_102331ED8);
              }
              v164 = qword_102419398;
              if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
              {
                id v165 = [[objc_msgSend(v109, "description") substringToIndex:8];
                *(_DWORD *)uint64_t buf = 68289283;
                int v245 = 0;
                __int16 v246 = 2082;
                v247 = "";
                __int16 v248 = 2113;
                id v249 = v165;
                _os_log_impl((void *)&_mh_execute_header, v164, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchManufacturerNameAIS failed to convert to string\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
                if (qword_102419390 != -1) {
                  dispatch_once(&qword_102419390, &stru_102331ED8);
                }
              }
              v166 = qword_102419398;
              if (os_signpost_enabled((os_log_t)qword_102419398))
              {
                id v167 = [[objc_msgSend(v109, "description") substringToIndex:8];
                *(_DWORD *)uint64_t buf = 68289283;
                int v245 = 0;
                __int16 v246 = 2082;
                v247 = "";
                __int16 v248 = 2113;
                id v249 = v167;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v166, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye didFetchManufacturerNameAIS failed to convert to string", "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchManufacturerNameAIS failed to convert to string\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
              }
              uint64_t v168 = kCLErrorDomainPrivate;
              NSErrorUserInfoKey v242 = NSLocalizedDescriptionKey;
              CFStringRef v243 = sub_101640864(0x27uLL);
              CFStringRef v116 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v168, 39, +[NSDictionary dictionaryWithObjects:&v243 forKeys:&v242 count:1]);
              CFStringRef v113 = &stru_10234F018;
              CFStringRef v114 = v9;
              id v115 = v109;
            }
LABEL_254:
            [v114 didFetchHawkeyeAISManufacturerNameFromDevice:v115 manufacturerName:v113 error:v116];
            goto LABEL_18;
          case 211:
            id v117 = [a4 characteristicPayload];
            id v118 = [(CLDurianService *)self getDeviceUUID:a3];
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            NSErrorUserInfoKey v119 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v120 = [[objc_msgSend(v118, "description") substringToIndex:8];
              *(_DWORD *)uint64_t buf = 68289539;
              int v245 = 0;
              __int16 v246 = 2082;
              v247 = "";
              __int16 v248 = 2113;
              id v249 = v120;
              __int16 v250 = 2113;
              *(void *)v251 = v117;
              _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchModelNameAIS\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@}", buf, 0x26u);
            }
            CFStringRef v121 = (const __CFString *)[objc_alloc((Class)NSString) initWithUTF8String:[v117 bytes]];
            if (v121)
            {
              CFStringRef v122 = v121;
              NSErrorUserInfoKey v123 = v9;
              id v124 = v118;
LABEL_193:
              v125 = 0;
            }
            else
            {
              if (qword_102419390 != -1) {
                dispatch_once(&qword_102419390, &stru_102331ED8);
              }
              v169 = qword_102419398;
              if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
              {
                id v170 = [[objc_msgSend(v118, "description") substringToIndex:8];
                *(_DWORD *)uint64_t buf = 68289283;
                int v245 = 0;
                __int16 v246 = 2082;
                v247 = "";
                __int16 v248 = 2113;
                id v249 = v170;
                _os_log_impl((void *)&_mh_execute_header, v169, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchModelNameAIS failed to convert to string\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
                if (qword_102419390 != -1) {
                  dispatch_once(&qword_102419390, &stru_102331ED8);
                }
              }
              v171 = qword_102419398;
              if (os_signpost_enabled((os_log_t)qword_102419398))
              {
                id v172 = [[objc_msgSend(v118, "description") substringToIndex:8];
                *(_DWORD *)uint64_t buf = 68289283;
                int v245 = 0;
                __int16 v246 = 2082;
                v247 = "";
                __int16 v248 = 2113;
                id v249 = v172;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v171, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye didFetchModelNameAIS failed to convert to string", "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchModelNameAIS failed to convert to string\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
              }
              uint64_t v173 = kCLErrorDomainPrivate;
              NSErrorUserInfoKey v240 = NSLocalizedDescriptionKey;
              CFStringRef v241 = sub_101640864(0x27uLL);
              v125 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v173, 39, +[NSDictionary dictionaryWithObjects:&v241 forKeys:&v240 count:1]);
              CFStringRef v122 = &stru_10234F018;
              NSErrorUserInfoKey v123 = v9;
              id v124 = v118;
            }
            goto LABEL_263;
          case 212:
            id v126 = [a4 characteristicPayload];
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            __int16 v127 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v128 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
              *(_DWORD *)uint64_t buf = 68289539;
              int v245 = 0;
              __int16 v246 = 2082;
              v247 = "";
              __int16 v248 = 2113;
              id v249 = v128;
              __int16 v250 = 2113;
              *(void *)v251 = v126;
              _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchModelColorCodeAIS\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@}", buf, 0x26u);
            }
            [v9 didFetchHawkeyeAISModelColorCodeFromDevice:[a3 uuid] modelColorCode:v126 error:0];
            goto LABEL_18;
          case 213:
            id v129 = [a4 characteristicPayload];
            id v130 = [(CLDurianService *)self getDeviceUUID:a3];
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            __int16 v131 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v132 = [[[v130 description] substringToIndex:8];
              *(_DWORD *)uint64_t buf = 68289539;
              int v245 = 0;
              __int16 v246 = 2082;
              v247 = "";
              __int16 v248 = 2113;
              id v249 = v132;
              __int16 v250 = 2113;
              *(void *)v251 = v129;
              __int16 v133 = "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchAccessoryCategoryAIS\", \"item\":%{private, locatio"
                     "n:escape_only}@, \"bytes\":%{private, location:escape_only}@}";
LABEL_203:
              _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_DEFAULT, v133, buf, 0x26u);
            }
LABEL_204:
            [v9 didFetchHawkeyeAISAccessoryCategoryFromDevice:v130 accessoryCategory:v129 error:0];
            goto LABEL_18;
          case 214:
            id v134 = [a4 characteristicPayload];
            id v135 = [(CLDurianService *)self getDeviceUUID:a3];
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            id v136 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v137 = [[objc_msgSend(v135, "description") substringToIndex:8];
              *(_DWORD *)uint64_t buf = 68289539;
              int v245 = 0;
              __int16 v246 = 2082;
              v247 = "";
              __int16 v248 = 2113;
              id v249 = v137;
              __int16 v250 = 2113;
              *(void *)v251 = v134;
              _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchAccessoryCapabilitiesAIS\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@}", buf, 0x26u);
            }
            BOOL v138 = v9;
            id v139 = v135;
LABEL_210:
            [v138 didFetchHawkeyeAISAccessoryCapabilitiesFromDevice:v139 accessoryCapabilities:v134 error:0];
            goto LABEL_18;
          case 215:
            id v140 = [a4 characteristicPayload];
            id v141 = [(CLDurianService *)self getDeviceUUID:a3];
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            v142 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v143 = [[objc_msgSend(v141, "description") substringToIndex:8];
              *(_DWORD *)uint64_t buf = 68289539;
              int v245 = 0;
              __int16 v246 = 2082;
              v247 = "";
              __int16 v248 = 2113;
              id v249 = v143;
              __int16 v250 = 2113;
              *(void *)v251 = v140;
              _os_log_impl((void *)&_mh_execute_header, v142, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchFirmwareVersionAIS\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@}", buf, 0x26u);
            }
            id v42 = v9;
            id v43 = v140;
            id v41 = v141;
            goto LABEL_216;
          case 216:
            id v144 = [a4 characteristicPayload];
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            v145 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v146 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
              *(_DWORD *)uint64_t buf = 68289539;
              int v245 = 0;
              __int16 v246 = 2082;
              v247 = "";
              __int16 v248 = 2113;
              id v249 = v146;
              __int16 v250 = 2113;
              *(void *)v251 = v144;
              v147 = "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchFindMyVersionAIS\", \"item\":%{private, location:es"
                     "cape_only}@, \"bytes\":%{private, location:escape_only}@}";
LABEL_221:
              _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_DEFAULT, v147, buf, 0x26u);
            }
LABEL_222:
            [v9 didFetchHawkeyeAISFindMyVersionFromDevice:[a3 uuid] findMyVersion:*(unsigned int *)[v144 bytes] error:0];
            goto LABEL_18;
          case 217:
            id v148 = [a4 characteristicPayload];
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            v149 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v150 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
              *(_DWORD *)uint64_t buf = 68289539;
              int v245 = 0;
              __int16 v246 = 2082;
              v247 = "";
              __int16 v248 = 2113;
              id v249 = v150;
              __int16 v250 = 2113;
              *(void *)v251 = v148;
              v151 = "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchBatteryTypeAIS\", \"item\":%{private, location:esca"
                     "pe_only}@, \"bytes\":%{private, location:escape_only}@}";
LABEL_227:
              _os_log_impl((void *)&_mh_execute_header, v149, OS_LOG_TYPE_DEFAULT, v151, buf, 0x26u);
            }
LABEL_228:
            [v9 didFetchHawkeyeAISBatteryTypeFromDevice:[a3 uuid] batteryType:v148 error:0];
            goto LABEL_18;
          case 218:
            id v152 = [a4 characteristicPayload];
            v153 = (unsigned __int8 *)[v152 bytes];
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            v154 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
LABEL_232:
              id v155 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
              *(_DWORD *)uint64_t buf = 68289539;
              int v245 = 0;
              __int16 v246 = 2082;
              v247 = "";
              __int16 v248 = 2113;
              id v249 = v155;
              __int16 v250 = 2113;
              *(void *)v251 = v152;
              _os_log_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchBatteryLevelAIS\", \"item\":%{private, location:escape_only}@, \"bytes\":%{private, location:escape_only}@}", buf, 0x26u);
            }
LABEL_233:
            uint64_t v76 = *v153;
            goto LABEL_234;
          case 220:
            if ([a3 isHawkeyeAccessory]) {
              [v9 didStopPlayingUnauthorizedSoundOnTag:[a3 uuid] withError:0];
            }
            goto LABEL_18;
          case 221:
            id v157 = [a4 characteristicPayload];
            v233[0] = 0;
            [v157 getBytes:v233 length:1];
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            v158 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v159 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
              *(_DWORD *)uint64_t buf = 68289795;
              int v245 = 0;
              __int16 v246 = 2082;
              v247 = "";
              __int16 v248 = 2113;
              id v249 = v159;
              __int16 v250 = 2113;
              *(void *)v251 = v157;
              *(_WORD *)&v251[8] = 1025;
              *(_DWORD *)&v251[10] = v233[0];
              v160 = "{\"msg%{public}.0s\":\"#durian #hawkeye didFetchTxPower (gatt)\", \"item\":%{private, location:esca"
                     "pe_only}@, \"bytes\":%{private, location:escape_only}@, \"txpower\":%{private}d}";
LABEL_241:
              _os_log_impl((void *)&_mh_execute_header, v158, OS_LOG_TYPE_DEFAULT, v160, buf, 0x2Cu);
            }
LABEL_242:
            [v9 didFetchTxPower:[NSNumber numberWithChar:v233[0]] fromDevice:[a3 uuid] withError:0];
            goto LABEL_18;
          default:
            switch((int)v10)
            {
              case 2049:
                goto LABEL_79;
              case 2050:
                goto LABEL_80;
              case 2051:
                goto LABEL_81;
              case 2052:
                goto LABEL_18;
              case 2053:
                goto LABEL_82;
              default:
                if (v10 != 2061) {
                  goto LABEL_18;
                }
                if ([a3 isAirTag]) {
                  [v9 didCompletePlayingUnauthorizedSoundOnTag:[a3 uuid] withError:0];
                }
                break;
            }
LABEL_141:
            -[self->_trackingAvoidanceProxy didSuccessfullyPlayUnauthorizedSound:[a3 uuid] address:[a3 addressFromUnknownBeacon]];
            goto LABEL_18;
        }
        goto LABEL_18;
      }
      switch((int)v10)
      {
        case 1:
LABEL_79:
          -[CLDurianService completeRangingInit:client:data:opcode:](self, "completeRangingInit:client:data:opcode:", [a3 uuid], v9, v11, v10);
          goto LABEL_18;
        case 3:
LABEL_81:
          -[CLDurianService completeRangingStart:client:data:opcode:](self, "completeRangingStart:client:data:opcode:", [a3 uuid], v9, v11, v10);
          goto LABEL_18;
        case 6:
LABEL_82:
          -[CLDurianService completeRangingDeinit:client:data:opcode:](self, "completeRangingDeinit:client:data:opcode:", [a3 uuid], v9, v11, v10);
          goto LABEL_18;
        case 7:
        case 18:
          id v40 = [[objc_msgSend(a5, "payload") subdataWithRange:1, [objc_msgSend(objc_msgSend(a5, "payload"), "length") - 1]];
LABEL_55:
          id v41 = [a3 uuid];
          id v42 = v9;
          id v43 = v40;
LABEL_216:
          [v42 didFetchFirmwareVersion:v43 fromTag:v41 withError:0];
          goto LABEL_18;
        case 8:
          [v9 didStopPlayingSoundOnTag:[a3 uuid] withError:0];
          if (([a3 isRoseInitialized] & 1) == 0)
          {
            CFStringRef v58 = @"SoundStop";
            goto LABEL_124;
          }
          goto LABEL_18;
        case 10:
          if ([a3 isAirTag]
            && !*((unsigned char *)objc_msgSend(objc_msgSend(objc_msgSend(a4, "command"), "payload"), "bytes") + 2)
            && [a3 isOnlyRemainingTask]
            && !-[CLDurianDeviceManager shouldHoldLeashForDevice:](self->_deviceManager, "shouldHoldLeashForDevice:", a3)&& ([a3 firmwareUpdateMode] & 1) == 0)
          {
            [a3 setDisconnectionReason:@"LeashDisable"];
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            id v59 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v60 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
              *(_DWORD *)uint64_t buf = 68289283;
              int v245 = 0;
              __int16 v246 = 2082;
              v247 = "";
              __int16 v248 = 2113;
              id v249 = v60;
              _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian disconnecting peripheral from leash\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
            }
            [(CLDurianDeviceManager *)self->_deviceManager disconnectDevice:a3];
          }
          if ([a3 isHawkeyeAccessory])
          {
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            uint64_t v61 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v62 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
              *(_DWORD *)uint64_t buf = 68289283;
              int v245 = 0;
              __int16 v246 = 2082;
              v247 = "";
              __int16 v248 = 2113;
              id v249 = v62;
              v63 = "{\"msg%{public}.0s\":\"#durian #hawkeye CLDurianCommandOpcodeLeashing TBD\", \"item\":%{private, loc"
                    "ation:escape_only}@}";
LABEL_149:
              uint64_t v67 = v61;
              uint32_t v68 = 28;
              goto LABEL_150;
            }
          }
          goto LABEL_18;
        case 12:
          id v64 = [a3 getMultiStatusFromData:v11];
          [v9 didGetMultiStatus:v64 forTag:[a3 uuid] withError:0];
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331ED8);
          }
          uint64_t v65 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id v66 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
            *(_DWORD *)uint64_t buf = 68289539;
            int v245 = 0;
            __int16 v246 = 2082;
            v247 = "";
            __int16 v248 = 2113;
            id v249 = v66;
            __int16 v250 = 1026;
            *(_DWORD *)v251 = v64;
            v63 = "{\"msg%{public}.0s\":\"#durian didGetMultiStatus\", \"item\":%{private, location:escape_only}@, \"multi\":%{public}d}";
            uint64_t v67 = v65;
            uint32_t v68 = 34;
LABEL_150:
            _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, v63, buf, v68);
          }
          goto LABEL_18;
        case 13:
          [v9 didSetObfuscatedIdentifierOnTag:[a3 uuid] withError:0];
          goto LABEL_18;
        case 14:
          int v69 = *v11;
          unsigned int v70 = v11[1];
          int v71 = v11[2];
          if (v69)
          {
            if (v69 != 1) {
              goto LABEL_270;
            }
            if (v70 < 2)
            {
              id v72 = a3;
              uint64_t v73 = 3;
LABEL_269:
              [v72 setMutexState:v73];
              goto LABEL_270;
            }
            if (v70 == 4)
            {
              if (qword_102419390 != -1) {
                dispatch_once(&qword_102419390, &stru_102331ED8);
              }
              v178 = qword_102419398;
              if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
              {
                id v179 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
                *(_DWORD *)uint64_t buf = 68289283;
                int v245 = 0;
                __int16 v246 = 2082;
                v247 = "";
                __int16 v248 = 2113;
                id v249 = v179;
                _os_log_impl((void *)&_mh_execute_header, v178, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #mutex BUSY\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
              }
              [a3 setMutexState:4];
              [a3 handleMutexErrorOnAction:1];
            }
          }
          else if (v70 == 3 || !v70)
          {
            id v72 = a3;
            uint64_t v73 = 0;
            goto LABEL_269;
          }
LABEL_270:
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331ED8);
          }
          v174 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id v175 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
            unsigned int v176 = [a3 mutexState];
            int v177 = v71 & 8;
            *(_DWORD *)uint64_t buf = 68290563;
            int v245 = 0;
            __int16 v246 = 2082;
            v247 = "";
            __int16 v248 = 2113;
            id v249 = v175;
            __int16 v250 = 1025;
            *(_DWORD *)v251 = v69;
            *(_WORD *)&v251[4] = 1025;
            *(_DWORD *)&v251[6] = v70;
            *(_WORD *)&v251[10] = 1025;
            *(_DWORD *)&v251[12] = v176;
            *(_WORD *)&v251[16] = 1025;
            *(_DWORD *)&v251[18] = v71;
            *(_WORD *)&v251[22] = 1025;
            *(_DWORD *)v252 = v177;
            _os_log_impl((void *)&_mh_execute_header, v174, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #mutex task response\", \"item\":%{private, location:escape_only}@, \"mutexAction\":%{private}d, \"mutexResponse\":%{private}d, \"mutexState\":%{private}d, \"status\":%{private}d, \"fwdl\":%{private}d}", buf, 0x3Au);
          }
          else
          {
            int v177 = v71 & 8;
          }
          if (v177) {
            [a3 handleMultiDownloading];
          }
          goto LABEL_18;
        case 15:
          [v9 didSetNearOwnerTimeoutOnTag:[a3 uuid] withError:0];
          goto LABEL_18;
        case 19:
          [v9 didUnpairFromTag:[a3 uuid] withError:0];
          CFStringRef v74 = @"Task:Unpair";
LABEL_114:
          [a3 setDisconnectionReason:v74];
          deviceManager = self->_deviceManager;
LABEL_115:
          [(CLDurianDeviceManager *)deviceManager disconnectDevice:a3];
          goto LABEL_18;
        case 21:
LABEL_80:
          -[CLDurianService completeRangingConfigure:client:data:opcode:](self, "completeRangingConfigure:client:data:opcode:", [a3 uuid], v9, v11, v10);
          goto LABEL_18;
        case 23:
          id v75 = [objc_alloc((Class)CLFindMyAccessoryUserStats) initWithPayloadV2:[a4 userStatsData]];
          [(CLDurianMetricManager *)self->_metricManager submitUserStats:a3 payload:v75];
          goto LABEL_119;
        case 24:
          [v9 didFetchUserStats_Deprecated:[a5 payload] fromTag:[a3 uuid] withError:0];
          goto LABEL_18;
        case 25:
          id v75 = [objc_alloc((Class)CLFindMyAccessoryUserStats) initWithPayloadV1:[a5 payload]];
LABEL_119:
          [v9 didFetchUserStats:v75 fromTag:[a3 uuid] withError:0];
          goto LABEL_18;
        case 38:
          [v9 didSetTagTypeOnTag:[a3 uuid] withError:0];
          goto LABEL_18;
        case 39:
          uint64_t v76 = v11[1];
LABEL_234:
          unint64_t v156 = +[CLDurianService convertBatteryStatus:v76];
          [v9 didFetchBatteryStatus:v156 fromTag:[a3 uuid] withError:0];
          [(CLDurianDeviceManager *)self->_deviceManager updateBatteryStatus:v156 forDevice:a3];
          goto LABEL_18;
        case 40:
          [v9 didCompletePlayingSoundOnTag:[a3 uuid] withError:0];
          if (([a3 isRoseInitialized] & 1) == 0)
          {
            CFStringRef v58 = @"SoundDone";
LABEL_124:
            [a3 releaseMutexWithReason:v58];
          }
          goto LABEL_18;
        case 42:
          id v77 = [(char *)[a5 payload] bytes];
          if (objc_msgSend(objc_msgSend(a5, "payload"), "length") == (id)13)
          {
            unsigned int v78 = *(_DWORD *)(v77 + 9);
          }
          else
          {
            int v161 = *(_DWORD *)(v77 + 5);
            unsigned int v78 = v161 - [objc_msgSend(objc_msgSend(a4, "configuration"), "keysRemaining")];
          }
          uint64_t v84 = v78;
          -[CLDurianDeviceManager setWildKeyBase:interval:fallback:forDevice:](self->_deviceManager, "setWildKeyBase:interval:fallback:forDevice:", *(unsigned int *)(v77 + 5), objc_msgSend(objc_msgSend(a4, "configuration"), "keyCount"), *(unsigned int *)(v77 + 1), a3);
          v162 = +[NSDate date];
          mach_continuous_time();
          [a4 completionTime];
          TMConvertTicksToSeconds();
          id v87 = [(NSDate *)v162 dateByAddingTimeInterval:-v163];
          [a4 executionDuration];
          v88 = self->_deviceManager;
          goto LABEL_245;
        case 43:
          if ([a3 isAirTag])
          {
            uint64_t v79 = *(unsigned int *)[a5 payload subdataWithRange:1, 4 bytes];
            [(CLDurianDeviceManager *)self->_deviceManager setCurrentWildKeyIndex:v79 forDevice:a3 forEvent:@"rollwild"];
            [a3 setLastObservedIndex:v79];
          }
          if ([a3 isHawkeyeAccessory])
          {
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            id v80 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v81 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
              unsigned int v82 = [a3 lastObservedIndex];
              *(_DWORD *)uint64_t buf = 68289539;
              int v245 = 0;
              __int16 v246 = 2082;
              v247 = "";
              __int16 v248 = 2113;
              id v249 = v81;
              __int16 v250 = 1026;
              *(_DWORD *)v251 = v82;
              _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye CLDurianCommandOpcodeRollWildKey\", \"item\":%{private, location:escape_only}@, \"lastObserved\":%{public}d}", buf, 0x22u);
            }
            -[CLDurianDeviceManager setCurrentWildKeyIndex:forDevice:forEvent:](self->_deviceManager, "setCurrentWildKeyIndex:forDevice:forEvent:", [a3 lastObservedIndex], a3, @"latchresponse");
          }
          [a3 alignClockWithCurrentIndex:[a3 lastObservedIndex]];
          [v9 didRollWildKeyOnTag:[a3 uuid] withError:0];
          goto LABEL_18;
        case 45:
          id v83 = (unsigned int *)[objc_msgSend(a5, "payload") bytes];
          uint64_t v84 = v83[2];
          [(CLDurianDeviceManager *)self->_deviceManager setWildKeyBase:v83[1] interval:96 fallback:*v83 forDevice:a3];
          id v85 = +[NSDate date];
          mach_continuous_time();
          [a4 completionTime];
          TMConvertTicksToSeconds();
          id v87 = [(NSDate *)v85 dateByAddingTimeInterval:-v86];
          [a4 executionDuration];
          v88 = self->_deviceManager;
LABEL_245:
          -[CLDurianDeviceManager setAlignmentUncertainty:atIndex:date:forDevice:](v88, "setAlignmentUncertainty:atIndex:date:forDevice:", v84, v87, a3);
          [v9 didSetWildModeConfigruationOnTag:[a3 uuid] withError:0];
          goto LABEL_18;
        default:
          goto LABEL_18;
      }
    }
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    id v34 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      id v35 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
      unsigned int v36 = [a4 translatedOpcode];
      *(_DWORD *)uint64_t buf = 68289795;
      int v245 = 0;
      __int16 v246 = 2082;
      v247 = "";
      __int16 v248 = 2113;
      id v249 = v35;
      __int16 v250 = 1025;
      *(_DWORD *)v251 = v36;
      *(_WORD *)&v251[4] = 2113;
      *(void *)&v251[6] = a4;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye mismatch opcode/task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"task\":%{private, location:escape_only}@}", buf, 0x2Cu);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
    }
    id v37 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      id v38 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
      unsigned int v39 = [a4 translatedOpcode];
      *(_DWORD *)uint64_t buf = 68289795;
      int v245 = 0;
      __int16 v246 = 2082;
      v247 = "";
      __int16 v248 = 2113;
      id v249 = v38;
      __int16 v250 = 1025;
      *(_DWORD *)v251 = v39;
      *(_WORD *)&v251[4] = 2113;
      *(void *)&v251[6] = a4;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye mismatch opcode/task", "{\"msg%{public}.0s\":\"#durian #hawkeye mismatch opcode/task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"task\":%{private, location:escape_only}@}", buf, 0x2Cu);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    __int16 v23 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "#durian didCompleteTask task is nil", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
      *(_WORD *)v233 = 0;
      id v24 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDurianService device:didCompleteTask:withCompletionCommand:]", "%s\n", v24);
      if (v24 != (char *)buf) {
        free(v24);
      }
    }
  }
}

- (void)device:(id)a3 didFailToCompleteTask:(id)a4 withError:(int64_t)a5 andDisconnect:(BOOL)a6
{
  if (a4)
  {
    BOOL v6 = a6;
    id v126 = -[NSMutableDictionary objectForKey:](self->_taskClientMap, "objectForKey:", [a4 uuid]);
    id v11 = objc_alloc((Class)NSError);
    uint64_t v12 = kCLErrorDomainPrivate;
    NSErrorUserInfoKey v143 = NSLocalizedDescriptionKey;
    CFStringRef v144 = sub_101640864(a5);
    id v13 = [v11 initWithDomain:v12 code:a5 userInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v144, &v143, 1)];
    int v14 = [a4 command].opcode;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    uint64_t v15 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
      [a4 queueDuration];
      uint64_t v18 = v17;
      [a4 executionDuration];
      *(_DWORD *)uint64_t buf = 68290819;
      int v146 = 0;
      __int16 v147 = 2082;
      id v148 = "";
      __int16 v149 = 2113;
      id v150 = v16;
      __int16 v151 = 1025;
      *(_DWORD *)id v152 = v14;
      *(_WORD *)&v152[4] = 2113;
      *(void *)&v152[6] = a4;
      *(_WORD *)&v152[14] = 2050;
      *(void *)&v152[16] = v18;
      __int16 v153 = 2050;
      uint64_t v154 = v19;
      __int16 v155 = 1025;
      BOOL v156 = v126 != 0;
      __int16 v157 = 1026;
      BOOL v158 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian didFailToCompleteTask\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"task\":%{private, location:escape_only}@, \"queueDuration\":\"%{public}.5f\", \"executionDuration\":\"%{public}.5f\", \"client\":%{private}hhd, \"disconnect\":%{public}hhd}", buf, 0x4Cu);
    }
    if ([a3 pendingDisconnect]
      && [a3 isTaskQueueEmpty]
      && !v6)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
      id v20 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)uint64_t buf = 68289026;
        int v146 = 0;
        __int16 v147 = 2082;
        id v148 = "";
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #disconnectbackstop device pending disconnection finished all tasks, scheduling for disconnection\"}", buf, 0x12u);
      }
      -[CLDurianDeviceManager scheduleDisconnectionOnMissingBeaconWithUUID:](self->_deviceManager, "scheduleDisconnectionOnMissingBeaconWithUUID:", [a3 uuid]);
    }
    if (v14 != 208 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      int64_t v125 = a5;
      BOOL v124 = v6;
      if (![a3 isPoshAccessory])
      {
        if (v14 <= 173)
        {
          switch(v14)
          {
            case 1:
LABEL_55:
              [v126 didInitRangingOnTag:[a3 uuid] withStatus:0 error:v13];
              break;
            case 3:
LABEL_67:
              unsigned __int8 v34 = [a3 isRanging];
              id v35 = [a3 uuid];
              if (v34) {
                [v126 didCompleteRangingOnTag:v35 withStatus:0 endReason:0 error:v13];
              }
              else {
                [v126 didStartRangingOnTag:v35 error:v13];
              }
              break;
            case 6:
LABEL_69:
              [v126 didDeinitRangingOnTag:[a3 uuid] withStatus:0 error:v13];
              break;
            case 7:
            case 18:
LABEL_43:
              id v30 = [a3 uuid];
              id v31 = v126;
              unsigned int v32 = 0;
LABEL_174:
              [v31 didFetchFirmwareVersion:v32 fromTag:v30 withError:v13];
              break;
            case 8:
              [v126 didStopPlayingSoundOnTag:[a3 uuid] withError:v13];
              break;
            case 10:
              if (qword_102419390 != -1) {
                dispatch_once(&qword_102419390, &stru_102331ED8);
              }
              id v64 = qword_102419398;
              if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
              {
                id v65 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
                unsigned int v66 = [a3 leashState];
                id v67 = [a3 lastAlertDate];
                *(_DWORD *)uint64_t buf = 68289795;
                int v146 = 0;
                __int16 v147 = 2082;
                id v148 = "";
                __int16 v149 = 2113;
                id v150 = v65;
                __int16 v151 = 1025;
                *(_DWORD *)id v152 = v66;
                *(_WORD *)&v152[4] = 2113;
                *(void *)&v152[6] = v67;
                _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian leash break\", \"item\":%{private, location:escape_only}@, \"leashstate\":%{private}d, \"last\":%{private, location:escape_only}@}", buf, 0x2Cu);
              }
              if ([a3 isLeashSlotInUse])
              {
                if (![a3 lastAlertDate]
                  || (-[NSDate timeIntervalSinceDate:](+[NSDate now](NSDate, "now"), "timeIntervalSinceDate:", [a3 lastAlertDate]), fabs(v68) > 60.0))
                {
                  [a3 setLastAlertDate:+[NSDate now](NSDate, "now")];
                  int v69 = [(CLDurianDeviceManager *)self->_deviceManager lastLocation];
                  BOOL v73 = 0;
                  if (v69)
                  {
                    unsigned int v70 = v69;
                    [(CLLocation *)v69 horizontalAccuracy];
                    if (v71 <= 65.0)
                    {
                      [(NSDate *)[(CLLocation *)v70 timestamp] timeIntervalSinceNow];
                      if (fabs(v72) <= 30.0) {
                        BOOL v73 = 1;
                      }
                    }
                  }
                  [(CLDurianDeviceManager *)self->_deviceManager sendSeparationStateForDevice:a3 state:SPTagSeparationStateLeashFailed includeLocation:v73];
                }
              }
              break;
            case 12:
              [v126 didGetMultiStatus:0 forTag:[a3 uuid] withError:v13];
              break;
            case 13:
              [v126 didSetObfuscatedIdentifierOnTag:[a3 uuid] withError:v13];
              break;
            case 15:
              [v126 didSetNearOwnerTimeoutOnTag:[a3 uuid] withError:v13];
              break;
            case 19:
              [v126 didUnpairFromTag:[a3 uuid] withError:v13];
              break;
            case 21:
LABEL_66:
              [v126 didConfigureRangingOnTag:[a3 uuid] withStatus:0 error:v13];
              break;
            case 23:
            case 25:
              [v126 didFetchUserStats:0 fromTag:[a3 uuid] withError:v13];
              break;
            case 24:
              [v126 didFetchUserStats_Deprecated:0 fromTag:[a3 uuid] withError:v13];
              break;
            case 32:
              if (qword_102419390 != -1) {
                dispatch_once(&qword_102419390, &stru_102331ED8);
              }
              __int16 v23 = qword_102419398;
              if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
              {
                id v74 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
                *(_DWORD *)uint64_t buf = 68289283;
                int v146 = 0;
                __int16 v147 = 2082;
                id v148 = "";
                __int16 v149 = 2113;
                id v150 = v74;
                id v25 = "{\"msg%{public}.0s\":\"#durian abortfwdl failed to complete\", \"item\":%{private, location:escape_only}@}";
LABEL_144:
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v25, buf, 0x1Cu);
              }
              break;
            case 38:
              [v126 didSetTagTypeOnTag:[a3 uuid] withError:v13];
              break;
            case 40:
              unsigned __int8 v75 = [a3 isPlayingSound];
              id v76 = [a3 uuid];
              if (v75) {
                [v126 didCompletePlayingSoundOnTag:v76 withError:v13];
              }
              else {
                [v126 didStartPlayingSoundOnTag:v76 withError:v13];
              }
              break;
            case 42:
            case 45:
              [v126 didSetWildModeConfigruationOnTag:[a3 uuid] withError:v13];
              break;
            case 43:
              [v126 didRollWildKeyOnTag:[a3 uuid] withError:v13];
              break;
            default:
              goto LABEL_86;
          }
          goto LABEL_86;
        }
        switch(v14)
        {
          case 174:
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            __int16 v23 = qword_102419398;
            if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT)) {
              break;
            }
            id v24 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
            *(_DWORD *)uint64_t buf = 68289283;
            int v146 = 0;
            __int16 v147 = 2082;
            id v148 = "";
            __int16 v149 = 2113;
            id v150 = v24;
            id v25 = "{\"msg%{public}.0s\":\"#durian failed to fetch current key index\", \"item\":%{private, location:escape_only}@}";
            goto LABEL_144;
          case 175:
LABEL_118:
            if ([a3 isPlayingSound])
            {
              id v63 = [a3 uuid];
              if (a5 == 5)
              {
                [v126 didCompletePlayingUnauthorizedSoundOnTag:v63 withError:0];
                -[self->_trackingAvoidanceProxy didSuccessfullyPlayUnauthorizedSound:[a3 uuid] address:[a3 addressFromUnknownBeacon]];
                break;
              }
              [v126 didCompletePlayingUnauthorizedSoundOnTag:v63 withError:v13];
            }
            else
            {
              [v126 didStartPlayingUnauthorizedSoundOnTag:[a3 uuid] withError:v13];
            }
            -[self->_trackingAvoidanceProxy didUnsuccessfullyPlayUnauthorizedSound:[a3 uuid] address:[a3 addressFromUnknownBeacon]];
            break;
          case 176:
          case 177:
          case 178:
          case 179:
          case 181:
          case 182:
          case 183:
          case 184:
          case 185:
          case 186:
          case 187:
          case 188:
          case 189:
          case 190:
          case 191:
          case 192:
          case 193:
          case 194:
          case 196:
          case 197:
          case 198:
          case 204:
          case 205:
          case 206:
          case 207:
            break;
          case 180:
            uint64_t v77 = *((unsigned __int8 *)[objc_msgSend(objc_msgSend(objc_msgSend(a4, "command"), "payload"), "bytes") + 1];
            id v78 = [a3 uuid];
            uint64_t v79 = v126;
            id v80 = 0;
            uint64_t v81 = v77;
            goto LABEL_150;
          case 195:
            [v126 didSetUnauthorizedPlaySoundRateLimitFromTag:[a3 uuid] error:v13];
            break;
          case 199:
            [v126 didSetAccelerometerSlopeModeConfigurationOnTag:[a3 uuid] error:v13];
            break;
          case 200:
            [v126 didSetAccelerometerOrientationModeConfigurationOnTag:[a3 uuid] error:v13];
            break;
          case 201:
            [v126 didFetchAccelerometerSlopeModeConfiguration:0 onTag:[a3 uuid] error:v13];
            break;
          case 202:
            [v126 didFetchAccelerometerOrientationModeConfiguration:0 onTag:[a3 uuid] error:v13];
            break;
          case 203:
            [v126 didFetchAccelerometerMode:0 onTag:[a3 uuid] error:v13];
            break;
          case 208:
            int v82 = [a4 hawkeyeOpcode];
            if (v82 <= 771)
            {
              switch(v82)
              {
                case 527:
                  id v111 = [a3 btFindingState];
                  id v112 = [a3 uuid];
                  if (v111 == (id)2) {
                    [v126 didCompleteAggressiveAdvertisingOnDevice:v112 withError:v13];
                  }
                  else {
                    [v126 didStartAggressiveAdvertisingOnDevice:v112 withError:v13];
                  }
                  goto LABEL_86;
                case 528:
                  [v126 didStopAggressiveAdvertisingOnDevice:[a3 uuid] withError:v13];
                  goto LABEL_86;
                case 529:
                  goto LABEL_189;
                case 530:
                case 531:
                case 532:
                case 533:
                case 534:
                case 535:
                case 536:
                case 539:
                case 540:
                  goto LABEL_203;
                case 537:
                case 541:
                  goto LABEL_86;
                case 538:
                  goto LABEL_43;
                default:
                  if (v82 == 517) {
                    goto LABEL_86;
                  }
                  if (v82 != 551) {
                    goto LABEL_203;
                  }
                  [v126 didReceiveGroupRelationStatus:255 maintenanceStatus:255 onTag:[a3 uuid] withError:v13];
                  break;
              }
            }
            else
            {
              if (v82 > 1023)
              {
                if (v82 <= 1027)
                {
                  if (v82 == 1024)
                  {
                    [v126 didFetchHawkeyeCurrentPrimaryKeyFromDevice:objc_msgSend(a3, "uuid") currentPrimaryKey:[+[NSData data](NSData, "data")] error:v13];
                    break;
                  }
                  if (v82 == 1025)
                  {
                    [v126 didFetchHawkeyeiCloudIdentifierFromDevice:[a3 uuid] iCloudIdentifier:[+[NSData data](NSData, "data")] error:v13];
                    break;
                  }
                }
                else
                {
                  switch(v82)
                  {
                    case 1285:
                      [v126 didSetHawkeyeUTMotionConfigForDevice:[a3 uuid] withError:v13];
                      goto LABEL_86;
                    case 1281:
                      if (qword_102419390 != -1) {
                        dispatch_once(&qword_102419390, &stru_102331ED8);
                      }
                      CFStringRef v121 = qword_102419398;
                      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
                      {
                        id v122 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
                        *(_DWORD *)uint64_t buf = 68289283;
                        int v146 = 0;
                        __int16 v147 = 2082;
                        id v148 = "";
                        __int16 v149 = 2113;
                        id v150 = v122;
                        _os_log_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye log final fail\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
                      }
                      NSErrorUserInfoKey v123 = +[NSData data];
                      id v78 = [a3 uuid];
                      uint64_t v79 = v126;
                      id v80 = v123;
                      uint64_t v81 = 4;
LABEL_150:
                      [v79 didDumpLogs:v80 ofType:v81 fromTag:v78 withError:v13];
                      goto LABEL_86;
                    case 1028:
                      [v126 didFetchHawkeyeSerialNumberFromDevice:[a3 uuid] serialNumber:[+[NSData data](NSData, "data")] error:v13];
                      goto LABEL_86;
                  }
                }
LABEL_203:
                if (qword_102419390 != -1) {
                  dispatch_once(&qword_102419390, &stru_102331ED8);
                }
                CFStringRef v113 = qword_102419398;
                if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_FAULT))
                {
                  id v114 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
                  uint64_t v115 = [objc_msgSend(a4, "command") opcode];
                  unsigned int v116 = [a4 hawkeyeOpcode];
                  *(_DWORD *)uint64_t buf = 68289795;
                  int v146 = 0;
                  __int16 v147 = 2082;
                  id v148 = "";
                  __int16 v149 = 2113;
                  id v150 = v114;
                  __int16 v151 = 2049;
                  *(void *)id v152 = v115;
                  *(_WORD *)&v152[8] = 2049;
                  *(void *)&v152[10] = v116;
                  _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye unhandled didFail hawkeye task\", \"item\":%{private, location:escape_only}@, \"DurianOpcode\":%{private}lu, \"HawkeyeOpcode\":%{private}lu}", buf, 0x30u);
                  if (qword_102419390 != -1) {
                    dispatch_once(&qword_102419390, &stru_102331ED8);
                  }
                }
                id v117 = qword_102419398;
                if (os_signpost_enabled((os_log_t)qword_102419398))
                {
                  id v118 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
                  uint64_t v119 = [a4 command].opcode;
                  unsigned int v120 = [a4 hawkeyeOpcode];
                  *(_DWORD *)uint64_t buf = 68289795;
                  int v146 = 0;
                  __int16 v147 = 2082;
                  id v148 = "";
                  __int16 v149 = 2113;
                  id v150 = v118;
                  __int16 v151 = 2049;
                  *(void *)id v152 = v119;
                  *(_WORD *)&v152[8] = 2049;
                  *(void *)&v152[10] = v120;
                  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v117, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye unhandled didFail hawkeye task", "{\"msg%{public}.0s\":\"#durian #hawkeye unhandled didFail hawkeye task\", \"item\":%{private, location:escape_only}@, \"DurianOpcode\":%{private}lu, \"HawkeyeOpcode\":%{private}lu}", buf, 0x30u);
                }
                break;
              }
              switch(v82)
              {
                case 772:
                  [v126 didStartUnauthorizedAggressiveAdvertisingOnDevice:[a3 uuid] withError:v13];
                  break;
                case 773:
                  goto LABEL_189;
                case 774:
                  id v86 = [(CLDurianService *)self getDeviceUUID:a3];
                  id v85 = v126;
                  uint64_t v84 = 0;
                  goto LABEL_163;
                case 775:
                  id v90 = [a3 uuid];
                  CFStringRef v88 = &stru_10234F018;
                  id v89 = v126;
                  goto LABEL_165;
                case 776:
                  id v94 = [a3 uuid];
                  CFStringRef v92 = &stru_10234F018;
                  v93 = v126;
                  goto LABEL_167;
                case 777:
                  id v98 = [(CLDurianService *)self getDeviceUUID:a3];
                  id v97 = v126;
                  id v96 = 0;
                  goto LABEL_170;
                case 778:
                  id v102 = [a3 uuid];
                  id v101 = v126;
                  uint64_t v100 = 0;
                  goto LABEL_172;
                case 779:
                  goto LABEL_43;
                case 780:
                  goto LABEL_161;
                case 781:
                  id v107 = [a3 uuid];
                  id v106 = v126;
                  id v105 = 0;
                  goto LABEL_176;
                case 782:
                  id v108 = [a3 uuid];
                  id v109 = v126;
                  uint64_t v110 = 0;
                  goto LABEL_178;
                default:
                  goto LABEL_203;
              }
            }
            break;
          case 209:
            id v83 = [(CLDurianService *)self getDeviceUUID:a3];
            uint64_t v84 = +[NSData data];
            id v85 = v126;
            id v86 = v83;
LABEL_163:
            [v85 didFetchHawkeyeAISProductDataFromDevice:v86 productData:v84 error:v13];
            break;
          case 210:
            id v87 = [(CLDurianService *)self getDeviceUUID:a3];
            CFStringRef v88 = +[NSString string];
            id v89 = v126;
            id v90 = v87;
LABEL_165:
            [v89 didFetchHawkeyeAISManufacturerNameFromDevice:v90 manufacturerName:v88 error:v13];
            break;
          case 211:
            id v91 = [(CLDurianService *)self getDeviceUUID:a3];
            CFStringRef v92 = +[NSString string];
            v93 = v126;
            id v94 = v91;
LABEL_167:
            [v93 didFetchHawkeyeAISModelNameFromDevice:v94 modelName:v92 error:v13];
            break;
          case 212:
            [v126 didFetchHawkeyeAISModelColorCodeFromDevice:[a3 uuid] modelColorCode:[+[NSData data](NSData, "data")] error:v13];
            break;
          case 213:
            id v95 = [(CLDurianService *)self getDeviceUUID:a3];
            id v96 = +[NSData data];
            id v97 = v126;
            id v98 = v95;
LABEL_170:
            [v97 didFetchHawkeyeAISAccessoryCategoryFromDevice:v98 accessoryCategory:v96 error:v13];
            break;
          case 214:
            id v99 = [(CLDurianService *)self getDeviceUUID:a3];
            uint64_t v100 = +[NSData data];
            id v101 = v126;
            id v102 = v99;
LABEL_172:
            [v101 didFetchHawkeyeAISAccessoryCapabilitiesFromDevice:v102 accessoryCapabilities:v100 error:v13];
            break;
          case 215:
            id v103 = [(CLDurianService *)self getDeviceUUID:a3];
            unsigned int v32 = +[NSData data];
            id v31 = v126;
            id v30 = v103;
            goto LABEL_174;
          case 216:
LABEL_161:
            [v126 didFetchHawkeyeAISFindMyVersionFromDevice:[a3 uuid] findMyVersion:0 error:v13];
            break;
          case 217:
            id v104 = [a3 uuid];
            id v105 = +[NSData data];
            id v106 = v126;
            id v107 = v104;
LABEL_176:
            [v106 didFetchHawkeyeAISBatteryTypeFromDevice:v107 batteryType:v105 error:v13];
            break;
          case 218:
            id v108 = [a3 uuid];
            id v109 = v126;
            uint64_t v110 = 4;
LABEL_178:
            [v109 didFetchBatteryStatus:v110 fromTag:v108 withError:v13];
            break;
          case 219:
            [(CLDurianService *)self didFailFirmwareUpdateForDevice:a3 withError:v13];
            break;
          case 220:
            if ([a3 isHawkeyeAccessory]) {
              [v126 didStopPlayingUnauthorizedSoundOnTag:[a3 uuid] withError:v13];
            }
            break;
          case 221:
LABEL_189:
            [v126 didFetchTxPower:[NSNumber numberWithInt:0] fromDevice:[a3 uuid] withError:v13];
            break;
          default:
            switch(v14)
            {
              case 2049:
                goto LABEL_55;
              case 2050:
                goto LABEL_66;
              case 2051:
                goto LABEL_67;
              case 2052:
                goto LABEL_86;
              case 2053:
                goto LABEL_69;
              default:
                if (v14 == 2061) {
                  goto LABEL_118;
                }
                break;
            }
            break;
        }
LABEL_86:
        if ([a3 isHawkeyeAccessory])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            id v45 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v46 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
              unsigned int v47 = [a4 hawkeyeOpcode];
              unsigned int v48 = [(NSMutableSet *)self->_clients count];
              *(_DWORD *)uint64_t buf = 68289795;
              int v146 = 0;
              __int16 v147 = 2082;
              id v148 = "";
              __int16 v149 = 2113;
              id v150 = v46;
              __int16 v151 = 1025;
              *(_DWORD *)id v152 = v47;
              *(_WORD *)&v152[4] = 1026;
              *(_DWORD *)&v152[6] = v48;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didFailToCompleteTask\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"clients\":%{public}d}", buf, 0x28u);
            }
            long long v133 = 0u;
            long long v134 = 0u;
            long long v131 = 0u;
            long long v132 = 0u;
            clients = self->_clients;
            id v50 = [(NSMutableSet *)clients countByEnumeratingWithState:&v131 objects:v141 count:16];
            if (v50)
            {
              id v51 = v50;
              uint64_t v52 = *(void *)v132;
              do
              {
                for (i = 0; i != v51; i = (char *)i + 1)
                {
                  if (*(void *)v132 != v52) {
                    objc_enumerationMutation(clients);
                  }
                  [*(id *)(*((void *)&v131 + 1) + 8 * i) didCompleteHawkeyeTaskWithOpcode:[a4 hawkeyeOpcode] fromDevice:[a3 uuid] withError:v13];
                }
                id v51 = [(NSMutableSet *)clients countByEnumeratingWithState:&v131 objects:v141 count:16];
              }
              while (v51);
            }
          }
        }
        if ([a3 isAirTag])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            id v54 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v55 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
              unsigned int v56 = [a4 command].opcode;
              unsigned int v57 = [(NSMutableSet *)self->_clients count];
              *(_DWORD *)uint64_t buf = 68289795;
              int v146 = 0;
              __int16 v147 = 2082;
              id v148 = "";
              __int16 v149 = 2113;
              id v150 = v55;
              __int16 v151 = 1025;
              *(_DWORD *)id v152 = v56;
              *(_WORD *)&v152[4] = 1026;
              *(_DWORD *)&v152[6] = v57;
              _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut didFailToCompleteTask\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"clients\":%{public}d}", buf, 0x28u);
            }
            long long v129 = 0u;
            long long v130 = 0u;
            long long v127 = 0u;
            long long v128 = 0u;
            CFStringRef v58 = self->_clients;
            id v59 = [(NSMutableSet *)v58 countByEnumeratingWithState:&v127 objects:v140 count:16];
            if (v59)
            {
              id v60 = v59;
              uint64_t v61 = *(void *)v128;
              do
              {
                for (j = 0; j != v60; j = (char *)j + 1)
                {
                  if (*(void *)v128 != v61) {
                    objc_enumerationMutation(v58);
                  }
                  [*(id *)(*((void *)&v127 + 1) + 8 * (void)j) didCompleteHawkeyeTaskWithOpcode:[objc_msgSend(objc_msgSend(a4, "command"), "opcode")] fromDevice:[objc_msgSend(a3, "uuid")] withError:v13];
                }
                id v60 = [(NSMutableSet *)v58 countByEnumeratingWithState:&v127 objects:v140 count:16];
              }
              while (v60);
            }
          }
        }
        -[NSMutableDictionary removeObjectForKey:](self->_taskClientMap, "removeObjectForKey:", [a4 uuid]);
        -[NSMutableDictionary removeObjectForKey:](self->_pendingTaskMap, "removeObjectForKey:", [a4 uuid]);
        if ([a3 activePeripheral])
        {
          if (v124)
          {
            [a3 setDisconnectionReason:@"TaskFailed"];
            [(CLDurianDeviceManager *)self->_deviceManager disconnectDevice:a3];
            [a3 resetLeashState];
          }
        }
        [(CLDurianMetricManager *)self->_metricManager submitTaskMetricsForDevice:a3 task:a4 completed:0 errorCode:v125];
        return;
      }
      if (v14 <= 767)
      {
        switch(v14)
        {
          case 3:
            [v126 didFetchAISProductDataFromDevice:[a3 uuid] productData:0 error:v13];
            break;
          case 4:
            [v126 didFetchAISManufacturerNameFromDevice:[a3 uuid] manufacturerName:&stru_10234F018 error:v13];
            break;
          case 5:
            [v126 didFetchAISModelNameFromDevice:[a3 uuid] modelName:&stru_10234F018 error:v13];
            break;
          case 6:
            [v126 didFetchAISAccessoryCategoryFromDevice:[a3 uuid] accessoryCategory:0 error:v13];
            break;
          case 7:
            [v126 didFetchAISProtocolImplementationFromDevice:[a3 uuid] protocolImplementation:0 error:v13];
            break;
          case 8:
            [v126 didFetchAISAccessoryCapabilitiesFromDevice:[a3 uuid] accessoryCapabilities:0 error:v13];
            break;
          case 9:
            [v126 didFetchAISNetworkIDFromDevice:[a3 uuid] networkID:0 error:v13];
            break;
          case 10:
            [v126 didFetchAISFirmwareVersionFromDevice:[a3 uuid] firmwareVersion:0 error:v13];
            break;
          case 11:
            [v126 didFetchAISBatteryTypeFromDevice:[a3 uuid] batteryType:0 error:v13];
            break;
          case 12:
            [v126 didFetchAISBatteryLevelFromDevice:[a3 uuid] batteryLevel:0 error:v13];
            break;
          default:
            goto LABEL_74;
        }
        goto LABEL_74;
      }
      if (v14 > 793)
      {
        if (v14 != 794)
        {
          if (v14 == 1028) {
            [v126 didFetchAISSerialNumberFromDevice:[a3 uuid] serialNumber:0 error:v13];
          }
          goto LABEL_74;
        }
      }
      else if (v14 != 768)
      {
        if (v14 == 772) {
          [v126 didStartUnauthorizedAggressiveAdvertisingOnDevice:[a3 uuid] withError:v13];
        }
        goto LABEL_74;
      }
      if ([a3 isPlayingSound])
      {
        id v33 = [a3 uuid];
        if (a5 == 5)
        {
          [v126 didCompletePlayingUnauthorizedSoundOnTag:v33 withError:0];
          -[CLTrackingAvoidanceServiceProtocol didSuccessfullyPlayUnauthorizedSound:address:](self->_trackingAvoidanceProxy, "didSuccessfullyPlayUnauthorizedSound:address:", [a3 uuid], [a3 addressFromUnknownBeacon]);
          goto LABEL_74;
        }
        [v126 didCompletePlayingUnauthorizedSoundOnTag:v33 withError:v13];
      }
      else
      {
        [v126 didStartPlayingUnauthorizedSoundOnTag:[a3 uuid] withError:v13];
      }
      -[self->_trackingAvoidanceProxy didUnsuccessfullyPlayUnauthorizedSound:[a3 uuid] address:[a3 addressFromUnknownBeacon]];
LABEL_74:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102331ED8);
        }
        unsigned int v36 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
        {
          id v37 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
          unsigned int v38 = [a4 command].opcode;
          unsigned int v39 = [(NSMutableSet *)self->_clients count];
          *(_DWORD *)uint64_t buf = 68289795;
          int v146 = 0;
          __int16 v147 = 2082;
          id v148 = "";
          __int16 v149 = 2113;
          id v150 = v37;
          __int16 v151 = 1025;
          *(_DWORD *)id v152 = v38;
          *(_WORD *)&v152[4] = 1026;
          *(_DWORD *)&v152[6] = v39;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut didFailToCompleteTask\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"clients\":%{public}d}", buf, 0x28u);
        }
        long long v137 = 0u;
        long long v138 = 0u;
        long long v135 = 0u;
        long long v136 = 0u;
        id v40 = self->_clients;
        id v41 = [(NSMutableSet *)v40 countByEnumeratingWithState:&v135 objects:v142 count:16];
        if (v41)
        {
          id v42 = v41;
          uint64_t v43 = *(void *)v136;
          do
          {
            for (k = 0; k != v42; k = (char *)k + 1)
            {
              if (*(void *)v136 != v43) {
                objc_enumerationMutation(v40);
              }
              [*(id *)(*((void *)&v135 + 1) + 8 * (void)k) didCompleteHawkeyeTaskWithOpcode:[objc_msgSend(objc_msgSend(a4, "command"), "opcode")] fromDevice:[objc_msgSend(a3, "uuid")] withError:v13];
            }
            id v42 = [(NSMutableSet *)v40 countByEnumeratingWithState:&v135 objects:v142 count:16];
          }
          while (v42);
        }
      }
      goto LABEL_86;
    }
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    id v26 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      id v27 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
      *(_DWORD *)uint64_t buf = 68289795;
      int v146 = 0;
      __int16 v147 = 2082;
      id v148 = "";
      __int16 v149 = 2113;
      id v150 = v27;
      __int16 v151 = 1025;
      *(_DWORD *)id v152 = 208;
      *(_WORD *)&v152[4] = 2113;
      *(void *)&v152[6] = a4;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye mismatch opcode/task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"task\":%{private, location:escape_only}@}", buf, 0x2Cu);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
    }
    id v28 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      id v29 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
      *(_DWORD *)uint64_t buf = 68289795;
      int v146 = 0;
      __int16 v147 = 2082;
      id v148 = "";
      __int16 v149 = 2113;
      id v150 = v29;
      __int16 v151 = 1025;
      *(_DWORD *)id v152 = 208;
      *(_WORD *)&v152[4] = 2113;
      *(void *)&v152[6] = a4;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye mismatch opcode/task", "{\"msg%{public}.0s\":\"#durian #hawkeye mismatch opcode/task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"task\":%{private, location:escape_only}@}", buf, 0x2Cu);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    unsigned int v21 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "#durian didFailToCompleteTask task is nil", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
      __int16 v139 = 0;
      unsigned int v22 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDurianService device:didFailToCompleteTask:withError:andDisconnect:]", "%s\n", v22);
      if (v22 != (char *)buf) {
        free(v22);
      }
    }
  }
}

- (id)getDeviceUUID:(id)a3
{
  id v4 = [a3 uuid];
  if (![a3 taUnknownBeacon]) {
    return v4;
  }
  id v5 = [a3 taUnknownBeacon];

  return [v5 identifier];
}

- (void)device:(id)a3 didReceiveInvalidDataWithError:(int64_t)a4
{
  if ([a3 activePeripheral])
  {
    [a3 setDisconnectionReason:@"InvalidRxData"];
    [(CLDurianDeviceManager *)self->_deviceManager disconnectDevice:a3];
    [a3 resetLeashState];
  }
}

- (void)device:(id)a3 checkForEchoOfOpcode:(unsigned __int16)a4 fromAck:(BOOL)a5
{
  BOOL v5 = a5;
  int v6 = a4;
  BOOL v9 = a4 == 40 && a5;
  BOOL v10 = a4 == 40 && !a5;
  BOOL v11 = a4 != 8 && v9;
  if (a4 == 8) {
    BOOL v12 = !a5;
  }
  else {
    BOOL v12 = v10;
  }
  BOOL v13 = a4 == 8 || a4 == 40;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  int v14 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v23 = v13;
    id v15 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    unsigned int v16 = [(NSMutableSet *)self->_clients count];
    uint64_t buf = 68290819;
    __int16 v30 = 2082;
    id v31 = "";
    __int16 v32 = 2113;
    id v33 = v15;
    __int16 v34 = 1025;
    int v35 = v6;
    __int16 v36 = 1025;
    BOOL v37 = v5;
    __int16 v38 = 1026;
    BOOL v39 = v23;
    __int16 v40 = 1025;
    unsigned int v41 = v16;
    __int16 v42 = 1025;
    BOOL v43 = v11;
    __int16 v44 = 1025;
    BOOL v45 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian opcode echo\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"ack\":%{private}d, \"multi\":%{public}d, \"clients\":%{private}d, \"soundstart\":%{private}d, \"soundcomplete\":%{private}d}", (uint8_t *)&buf, 0x40u);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v17 = [(NSMutableSet *)self->_clients allObjects];
  id v18 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v25;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v17);
        }
        unsigned int v22 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (v11) {
          [v22 didStartPlayingSoundOnTag:[a3 uuid] withError:0];
        }
        if (v12) {
          [v22 didCompletePlayingSoundOnTag:[a3 uuid] withError:0];
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v19);
  }
}

- (void)device:(id)a3 didReceiveKeyRollIndex:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  clients = self->_clients;
  id v7 = [(NSMutableSet *)clients countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(clients);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) didReceiveKeyRollIndex:v4 onTag:[a3 uuid]];
      }
      id v8 = [(NSMutableSet *)clients countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)device:(id)a3 didReceiveGroupRelationStatus:(unsigned __int8)a4 andMainteanceStatus:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  clients = self->_clients;
  id v9 = [(NSMutableSet *)clients countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(clients);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * i) didReceiveGroupRelationStatus:v6 maintenanceStatus:v5 onTag:[a3 uuid] withError:0];
      }
      id v10 = [(NSMutableSet *)clients countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)device:(id)a3 didReceiveRangingResponse:(id)a4 withOpcode:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  id v9 = 0;
  if (a5 == 20 || a5 == 2060) {
    goto LABEL_6;
  }
  if (objc_msgSend(objc_msgSend(a4, "payload", a3, 0), "length"))
  {
    if (v5 == 2060) {
      goto LABEL_18;
    }
    id v9 = [objc_msgSend(a4, "payload") bytes];
LABEL_6:
    if ((int)v5 > 1801)
    {
      if ((int)v5 <= 2056)
      {
        if (v5 == 1802)
        {
LABEL_21:
          [a3 getRangingStatusForOpcode:v5 data:v9];
          activeRangingClient = self->_activeRangingClient;
          id v13 = [a3 uuid];
          -[CLDurianClientProtocol didReceiveRangingErrorFromTag:withStatus:](activeRangingClient, "didReceiveRangingErrorFromTag:withStatus:", v13);
          return;
        }
        if (v5 != 1804) {
          return;
        }
        goto LABEL_18;
      }
      if (v5 != 2057)
      {
        if (v5 != 2060)
        {
          if (v5 != 2058) {
            return;
          }
          goto LABEL_21;
        }
        goto LABEL_18;
      }
      goto LABEL_32;
    }
    if ((int)v5 > 35)
    {
      if (v5 != 36 && v5 != 1801) {
        return;
      }
LABEL_32:
      [objc_msgSend(a4, "payload") bytes];
      long long v15 = self->_activeRangingClient;
      id v16 = [a3 uuid];
      -[CLDurianClientProtocol didReceiveRangingTimestampsFromTag:eventStatus:rtt:tat:cycleIndex:](v15, "didReceiveRangingTimestampsFromTag:eventStatus:rtt:tat:cycleIndex:", v16);
      return;
    }
    if (v5 != 20)
    {
      if (v5 != 34) {
        return;
      }
      goto LABEL_21;
    }
LABEL_18:
    id v10 = self->_activeRangingClient;
    id v11 = [a3 uuid];
    [(CLDurianClientProtocol *)v10 didHaveRangingMovementOnTag:v11];
    return;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  long long v14 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v17[0] = 68289539;
    v17[1] = 0;
    __int16 v18 = 2082;
    id v19 = "";
    __int16 v20 = 2113;
    id v21 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    __int16 v22 = 1026;
    int v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian payload is empty\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)v17, 0x22u);
  }
}

- (void)requestDisconnectionForDevice:(id)a3
{
}

- (void)cancelConnectionTimeoutForPeripheral:(id)a3
{
}

- (void)didRetrievePersonalizationInfo:(id)a3 forDevice:(id)a4 error:(id)a5
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v9 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 68290051;
    v10[1] = 0;
    __int16 v11 = 2082;
    long long v12 = "";
    __int16 v13 = 2113;
    id v14 = [[[objc_msgSend(objc_msgSend(a4, "uuid"), "description") substringToIndex:8];
    __int16 v15 = 2113;
    id v16 = [[[objc_msgSend(objc_msgSend(objc_msgSend(a4, "activePeripheral"), "identifier"), "description") substringToIndex:8];
    __int16 v17 = 2113;
    id v18 = a3;
    __int16 v19 = 2113;
    id v20 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian Durian Service, notify client - didRetrievePersonalizationInfo\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"info\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)v10, 0x3Au);
  }
  [self->_firmwareUpdateClientMap[objc_msgSend(a4, "uuid")] didRetrievePersonalizationInformation:a3 forTag:objc_msgSend(a4, "uuid") error:a5];
  if (a5)
  {
    if ([a4 activePeripheral]) {
      [(CLDurianDeviceManager *)self->_deviceManager scheduleConnectionEvaluationForDevice:a4];
    }
  }
}

- (void)didUpdateFirmwareForDevice:(id)a3 error:(id)a4
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 68289795;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2113;
    id v15 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    __int16 v16 = 2113;
    id v17 = [[[objc_msgSend(objc_msgSend(objc_msgSend(a3, "activePeripheral"), "identifier"), "description") substringToIndex:8];
    __int16 v18 = 2113;
    id v19 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye #firmwareUpdate Durian Service, notify client - didUpdateFirmwareForDevice\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v10, 0x30u);
  }
  if (+[CLDurianSettings uarpPacketCaptureEnabled])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    id v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [[[objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description")) substringToIndex:8];
      int v10 = 68289283;
      int v11 = 0;
      __int16 v12 = 2082;
      __int16 v13 = "";
      __int16 v14 = 2113;
      id v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate didUpdateFirmwareForDevice - stopping UARP Packet Capture\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v10, 0x1Cu);
    }
    [(UARPController *)self->_uarpController stopPacketCapture];
  }
  [[self->_firmwareUpdateClientMap objectForKeyedSubscript:[a3 uuid]] didUpdateFirmwareForTag:[a3 uuid] error:a4];
  -[NSMutableArray removeObject:](self->_devicesUndergoingFirmwareUpdate, "removeObject:", [a3 uuid]);
  -[NSMutableDictionary removeObjectForKey:](self->_firmwareUpdateClientMap, "removeObjectForKey:", [a3 uuid]);
  if ([a3 activePeripheral]) {
    [(CLDurianDeviceManager *)self->_deviceManager scheduleConnectionEvaluationForDevice:a3];
  }
}

- (void)didReceiveUarpMessage:(id)a3 fromDevice:(id)a4
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = 68289539;
    __int16 v21 = 2082;
    __int16 v22 = "";
    __int16 v23 = 2113;
    id v24 = [[[objc_msgSend(objc_msgSend(a4, "uuid"), "description") substringToIndex:8];
    __int16 v25 = 2113;
    id v26 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - got UARP message from accessory\", \"item\":%{private, location:escape_only}@, \"message\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  devicesUndergoingFirmwareUpdate = self->_devicesUndergoingFirmwareUpdate;
  id v9 = [(NSMutableArray *)devicesUndergoingFirmwareUpdate countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(devicesUndergoingFirmwareUpdate);
        }
        if (objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "isEqual:", objc_msgSend(a4, "uuid")))
        {
          [(UARPController *)self->_uarpController recvDataFromAccessory:[(CLDurianService *)self getUarpAccessoryForDevice:a4] data:a3 error:0];
          return;
        }
      }
      id v10 = [(NSMutableArray *)devicesUndergoingFirmwareUpdate countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  __int16 v13 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [[[objc_msgSend(objc_msgSend(a4, "uuid"), "description") substringToIndex:8];
    uint64_t buf = 68289283;
    __int16 v21 = 2082;
    __int16 v22 = "";
    __int16 v23 = 2113;
    id v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - received random UARP message when not doing firmware update from accessory\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
  }
}

- (void)requestDiscoveryScan
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  objc_super v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    uint64_t v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian requestDiscoveryScan\"}", (uint8_t *)v4, 0x12u);
  }
  if (_os_feature_enabled_impl()) {
    [(CLAvengerScannerClient *)self->_scannerClient performTemporaryAggressiveScan];
  }
  else {
    [(CLAvengerScannerServiceProtocol *)self->_avengerScannerProxy performTemporaryAggressiveScan:CLISP_ME_TOKEN];
  }
}

- (double)getLastCarScanTime
{
  return self->_carLastScanned;
}

- (void)sendConnectionMetrics:(id)a3 forDevice:(id)a4
{
}

- (void)sendFirmwareUpdateMetrics:(id)a3 forDevice:(id)a4
{
}

- (void)startMonitoringDeviceForFirmwareUpdate:(id)a3
{
  if ([a3 isCapableOfFirmwareUpdate])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    __int16 v5 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v34 = 0;
      __int16 v35 = 2082;
      __int16 v36 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - Not monitoring Apple manufactured Hawkeye accessory for UARP firmware updates\"}", buf, 0x12u);
    }
  }
  else if (![(CLDurianService *)self getUarpAccessoryForDevice:a3])
  {
    id v6 = [NSString convertToHexString:[objc_msgSend(objc_msgSend(a3, "beacon"), "vendorId")];
    id v7 = [NSString convertToHexString:[objc_msgSend(objc_msgSend(a3, "beacon"), "productId")]];
    id v8 = +[NSString stringWithFormat:@"%@%@", v6, v7];
    id v9 = [objc_alloc((Class)UARPAccessory) initWithManufacturer:objc_msgSend(objc_msgSend(a3, "beacon"), "manufacturerName") modelName:objc_msgSend(objc_msgSend(a3, "beacon"), "modelName") serialNumber:objc_msgSend(objc_msgSend(a3, "beacon"), "serialNumber") firmwareVersion:objc_msgSend(objc_msgSend(a3, "beacon"), "systemVersion") productGroup:v6 productNumber:v7];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    id v10 = qword_102419398;
    uint64_t v11 = &OBJC_IVAR___CLOdometerAlarmManager_currentlyScheduled;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v32 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
      id v31 = [[objc_msgSend(a3, "beacon") manufacturerName];
      id v30 = [[[a3 beacon] modelName];
      id v12 = [[objc_msgSend(a3, "beacon") serialNumber];
      id v13 = [objc_msgSend(a3, "beacon") systemVersion];
      id v29 = [v6 UTF8String];
      id v14 = [v7 UTF8String];
      long long v15 = [(NSString *)v8 UTF8String];
      id v16 = v9;
      long long v17 = v8;
      id v18 = [[self->_localFirmwareUpdateAssetMap objectForKeyedSubscript:v8] UTF8String];
      *(_DWORD *)uint64_t buf = 68291587;
      int v34 = 0;
      __int16 v35 = 2082;
      __int16 v36 = "";
      __int16 v37 = 2113;
      id v38 = v32;
      __int16 v39 = 2113;
      id v40 = v31;
      __int16 v41 = 2113;
      id v42 = v30;
      __int16 v43 = 2113;
      id v44 = v12;
      __int16 v45 = 2113;
      id v46 = v13;
      __int16 v47 = 2081;
      id v48 = v29;
      __int16 v49 = 2081;
      id v50 = v14;
      __int16 v51 = 2081;
      uint64_t v52 = v15;
      uint64_t v11 = &OBJC_IVAR___CLOdometerAlarmManager_currentlyScheduled;
      __int16 v53 = 2081;
      id v54 = v18;
      id v8 = v17;
      id v9 = v16;
      __int16 v55 = 2081;
      uint64_t v56 = UARPAssetLocationTypeToString();
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Start monitoring device with detailed information for firmware updates\", \"item\":%{private, location:escape_only}@, \"manufacturer\":%{private, location:escape_only}@, \"modelName\":%{private, location:escape_only}@, \"serialNumber\":%{private, location:escape_only}@, \"firmwareVersion\":%{private, location:escape_only}@, \"productGroup\":%{private, location:escape_only}s, \"productNumber\":%{private, location:escape_only}s, \"productInfo\":%{private, location:escape_only}s, \"user provided asset\":%{private, location:escape_only}s, \"assetLocationType\":%{private, location:escape_only}s}", buf, 0x76u);
    }
    [v9 setUuid:[a3 uuid]];
    [v9 setTransport:3];
    if (self->_runningFindMyCertificationAssistant
      && [(NSMutableDictionary *)self->_localFirmwareUpdateAssetMap objectForKeyedSubscript:v8])
    {
      id v19 = objc_alloc((Class)UARPAssetID);
      id v20 = (NSString *)[(NSMutableDictionary *)self->_localFirmwareUpdateAssetMap objectForKeyedSubscript:v8];
      id v21 = v19;
      uint64_t v22 = 0;
    }
    else
    {
      uint64_t v23 = v11[779];
      if (*(void *)&self->CLIntersiloService_opaque[v23])
      {
        id v21 = objc_alloc((Class)UARPAssetID);
        uint64_t v22 = *(void *)&self->CLIntersiloService_opaque[v23];
        id v20 = 0;
      }
      else
      {
        id v24 = [(NSURL *)self->_localHawkeyeFirmwareDirectory URLByAppendingPathComponent:@"HawkeyeUARPSuperBinary.uarp"];
        id v25 = objc_alloc((Class)UARPAssetID);
        uint64_t v26 = *(void *)&self->CLIntersiloService_opaque[v23];
        id v20 = [(NSURL *)v24 path];
        id v21 = v25;
        uint64_t v22 = v26;
      }
    }
    id v27 = [v21 initWithLocationType:v22 remotePath:v20];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    id v28 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      int v34 = 0;
      __int16 v35 = 2082;
      __int16 v36 = "";
      __int16 v37 = 2113;
      id v38 = v27;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate asset to add\", \"AssetID\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    [(UARPController *)self->_uarpController addAccessory:v9 assetID:v27];
    -[self->_uarpController updateProperty:4 value:[objc_msgSend(objc_msgSend(a3, "beacon"), "systemVersion")] forAccessory:v9];
  }
}

- (void)stopMonitoringDeviceForFirmwareUpdate:(id)a3
{
  if ([a3 isCapableOfFirmwareUpdate])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    __int16 v5 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 68289026;
      v8[1] = 0;
      __int16 v9 = 2082;
      id v10 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - No need to stop monitoring Apple manufactured Hawkeye accessory for UARP firmware updates\"}", (uint8_t *)v8, 0x12u);
    }
  }
  else
  {
    uarpController = self->_uarpController;
    id v7 = [(CLDurianService *)self getUarpAccessoryForDevice:a3];
    [(UARPController *)uarpController removeAccessory:v7];
  }
}

- (void)performTask:(id)a3 forClient:(id)a4 onDevice:(id)a5
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  __int16 v9 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68290051;
    int v29 = 0;
    __int16 v30 = 2082;
    id v31 = "";
    __int16 v32 = 2113;
    id v33 = [[[objc_msgSend(objc_msgSend(a5, "uuid"), "description") substringToIndex:8];
    __int16 v34 = 1026;
    *(_DWORD *)__int16 v35 = [objc_msgSend(a3, "command") opcode];
    *(_WORD *)&v35[4] = 2050;
    *(void *)&v35[6] = a4;
    __int16 v36 = 2113;
    id v37 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian performing task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"clientPtr\":\"%{public}p\", \"task\":%{private, location:escape_only}@}", buf, 0x36u);
  }
  if ([a5 isHawkeyeAccessory]
    && [(CLDurianService *)self deviceUndergoingFirmwareUpdate:a5]
    && objc_msgSend(objc_msgSend(a3, "command"), "opcode") != 219)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    uint64_t v26 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = [[[objc_msgSend(objc_msgSend(a5, "uuid"), "description") substringToIndex:8];
      *(_DWORD *)uint64_t buf = 68289283;
      int v29 = 0;
      __int16 v30 = 2082;
      id v31 = "";
      __int16 v32 = 2113;
      id v33 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate device undergoing firmware update - blocking other interactions\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    long long v15 = self;
    id v16 = a5;
    id v17 = a3;
    uint64_t v18 = 9;
    uint64_t v19 = 0;
    goto LABEL_37;
  }
  if (a4)
  {
    [(NSMutableSet *)self->_clients addObject:a4];
    -[NSMutableDictionary setObject:forKey:](self->_taskClientMap, "setObject:forKey:", a4, [a3 uuid]);
  }
  -[NSMutableDictionary setObject:forKey:](self->_pendingTaskMap, "setObject:forKey:", a3, [a3 uuid]);
  if (![(CLDurianDeviceManager *)self->_deviceManager ready])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    id v13 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [[[objc_msgSend(objc_msgSend(a5, "uuid"), "description") substringToIndex:8];
      *(_DWORD *)uint64_t buf = 68289283;
      int v29 = 0;
      __int16 v30 = 2082;
      id v31 = "";
      __int16 v32 = 2113;
      id v33 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian ignoring task, device manager not ready\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    long long v15 = self;
    id v16 = a5;
    id v17 = a3;
    uint64_t v18 = 43;
    uint64_t v19 = 1;
LABEL_37:
    [(CLDurianService *)v15 device:v16 didFailToCompleteTask:v17 withError:v18 andDisconnect:v19];
    return;
  }
  [a5 setConnectionReason:+[NSString stringWithFormat:](@"Task:%@", objc_msgSend(a3, "opcodeDescription"))];
  [(CLDurianDeviceManager *)self->_deviceManager attemptConnectionToDevice:a5];
  [a5 setDelegate:self];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v10 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [[[objc_msgSend(objc_msgSend(a5, "uuid"), "description") substringToIndex:8];
    unsigned int v12 = [a3 requiresMutex];
    *(_DWORD *)uint64_t buf = 68289539;
    int v29 = 0;
    __int16 v30 = 2082;
    id v31 = "";
    __int16 v32 = 2113;
    id v33 = v11;
    __int16 v34 = 1026;
    *(_DWORD *)__int16 v35 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #mutex check\", \"item\":%{private, location:escape_only}@, \"required\":%{public}d}", buf, 0x22u);
  }
  if ([a3 requiresMutex])
  {
    if ([a5 mutexState] == (id)4)
    {
      [a5 handleMutexAlreadyHeldOnTask:a3];
      return;
    }
    [a5 acquireMutexForTask:a3];
  }
  else if ([a5 isTAAISDevice] && objc_msgSend(a5, "unownedBeacon"))
  {
    BOOL v20 = +[CLDurianSettings forceEnablePosh];
    SEL v21 = NSSelectorFromString(@"isPosh");
    [a5 unownedBeacon];
    if (objc_opt_respondsToSelector()) {
      BOOL v20 = [objc_msgSend(a5, "unownedBeacon") performSelector:v21] != 0;
    }
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    uint64_t v22 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = [[[a5 uuid] description] substringToIndex:8];
      id v24 = [a5 uuid];
      *(_DWORD *)uint64_t buf = 68289795;
      int v29 = 0;
      __int16 v30 = 2082;
      id v31 = "";
      __int16 v32 = 2113;
      id v33 = v23;
      __int16 v34 = 2113;
      *(void *)__int16 v35 = v24;
      *(_WORD *)&v35[8] = 1025;
      *(_DWORD *)&v35[10] = v20;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian two durian devices associated with the same peripheral  for\", \"item\":%{private, location:escape_only}@, \"full\":%{private, location:escape_only}@, \"posh\":%{private}hhd}", buf, 0x2Cu);
    }
    id v25 = [[self->_deviceManager deviceWithUUID:[objc_msgSend(objc_msgSend(a5, "unownedBeacon"), "identifier")] beaconType:[objc_msgSend(objc_msgSend(a5, "unownedBeacon"), "type")] isPosh:v20];
    goto LABEL_40;
  }
  id v25 = a5;
LABEL_40:
  [v25 enqueueTask:a3];
}

- (void)onConnectionStateChangeForDeviceWithUUID:(id)a3 fromState:(unint64_t)a4 toState:(unint64_t)a5
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  __int16 v9 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = 68289283;
    __int16 v21 = 2082;
    uint64_t v22 = "";
    __int16 v23 = 2113;
    id v24 = [[objc_msgSend(a3, "description") substringToIndex:8];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian device connection state change\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  connectionStateChangeClients = self->_connectionStateChangeClients;
  id v11 = [(NSMutableSet *)connectionStateChangeClients countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(connectionStateChangeClients);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * i) didChangeConnectionStateForDevice:a3 fromState:a4 toState:a5];
      }
      id v12 = [(NSMutableSet *)connectionStateChangeClients countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)onObservationForDeviceWithUUID:(id)a3 type:(int64_t)a4
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 68289539;
    v8[1] = 0;
    __int16 v9 = 2082;
    id v10 = "";
    __int16 v11 = 2113;
    id v12 = [[objc_msgSend(a3, "description") substringToIndex:8];
    __int16 v13 = 2050;
    int64_t v14 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian device observation\", \"item\":%{private, location:escape_only}@, \"type\":%{public}ld}", (uint8_t *)v8, 0x26u);
  }
  if (a4 == 2) {
    [(CLDurianCommuteMetricManager *)self->_commuteMetricManager didObserveScanForDevice:a3];
  }
}

- (void)fetchFirmwareVersionFromTag:(id)a3 forClient:(id)a4 includeCrashLogs:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  id v10 = [v9 createFetchFirmwareVersionTaskWithCrashLogs:v5];
  if (v10)
  {
    [(CLDurianService *)self performTask:v10 forClient:a4 onDevice:v9];
  }
  else
  {
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    CFStringRef v12 = @"Not supported for this device type";
    [a4 didFetchFirmwareVersion:0 fromTag:a3 withError:+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1))];
  }
}

- (void)fetchBatteryStateFromTag:(id)a3 forClient:(id)a4
{
  id v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  id v8 = [v7 createFetchBatteryStatusTask];
  if (v8)
  {
    [(CLDurianService *)self performTask:v8 forClient:a4 onDevice:v7];
  }
  else
  {
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    CFStringRef v10 = @"Not supported for this device type";
    [a4 didFetchBatteryStatus:4 fromTag:a3 withError:[NSError errorWithDomain:kCLErrorDomainPrivate code:6 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1)]];
  }
}

- (void)setBatteryStatus:(unint64_t)a3 onTag:(id)a4 forClient:(id)a5
{
  id v9 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a4];
  id v10 = [v9 createSetBatteryStatusTaskWithStatus:a3];
  if (v10)
  {
    [(CLDurianService *)self performTask:v10 forClient:a5 onDevice:v9];
  }
  else
  {
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    CFStringRef v12 = @"Not supported for this device type";
    [a5 didSetBatteryStatusOnTag:a4 error:[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1))];
  }
}

- (void)fetchUserStatsWithPersistence:(BOOL)a3 fromTag:(id)a4 forClient:(id)a5
{
  BOOL v7 = a3;
  id v9 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a4];
  id v10 = [v9 createFetchUserStatsTaskWithPersistence:v7];
  if (v10)
  {
    [(CLDurianService *)self performTask:v10 forClient:a5 onDevice:v9];
  }
  else
  {
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    CFStringRef v14 = @"Not supported for this device type";
    NSErrorUserInfoKey v11 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
    id v12 = [v9 buildNumber];
    if (v12 <= (id)[CLDurianVersionNumberUtilities getNumberFromString:](CLDurianVersionNumberUtilities, "getNumberFromString:", @"2.0.36"))[a5 didFetchUserStats_Deprecated:+[NSData data](NSData, "data") fromTag:a4 withError:v11]; {
    else
    }
      [a5 didFetchUserStats:0 fromTag:a4 withError:v11];
  }
}

- (void)unpairFromTag:(id)a3 forClient:(id)a4
{
  id v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  id v8 = [v7 createStopPlayingSoundTask];
  if (self->_activeRangingClient) {
    [(CLDurianService *)self deinitRangingOnTag:a3 forClient:a4];
  }
  if ([v7 isPlayingSound]) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9) {
    [(CLDurianService *)self performTask:v8 forClient:a4 onDevice:v7];
  }
  if ([v7 isMultiConnectionEnabled])
  {
    id v10 = [v7 createSetMaxConnectionsTaskWithCount:1];
    if (v10) {
      [(CLDurianService *)self performTask:v10 forClient:a4 onDevice:v7];
    }
  }
  id v11 = [v7 createUnpairDeviceTask];
  if (v11)
  {
    [(CLDurianService *)self performTask:v11 forClient:a4 onDevice:v7];
  }
}

- (void)unpairFromTagWithAddress:(id)a3 forClient:(id)a4
{
  id v6 = [(CLDurianDeviceManager *)self->_deviceManager connectToDeviceWithAddress:a3];
  id v7 = [v6 createUnpairDeviceTask];
  if (v7)
  {
    [(CLDurianService *)self performTask:v7 forClient:a4 onDevice:v6];
  }
}

- (void)setObfuscatedIdentifier:(id)a3 onTag:(id)a4 forClient:(id)a5
{
  id v9 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a4];
  id v10 = [v9 createSetObfuscatedIdentifierTaskWithIdentifier:a3];
  if (v10)
  {
    [(CLDurianService *)self performTask:v10 forClient:a5 onDevice:v9];
  }
  else
  {
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    CFStringRef v12 = @"Not supported for this device type";
    [a5 didSetObfuscatedIdentifierOnTag:a4 withError:+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1))];
  }
}

- (void)setNearOwnerTimeout:(unsigned __int16)a3 onTag:(id)a4 forClient:(id)a5
{
  uint64_t v6 = a3;
  id v8 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a4];
  [v8 setNearOwnerTimeoutOverride:v6];
  id v9 = [v8 createSetNearOwnerTimeoutTaskInSeconds:v6];
  if ([v8 isConnected]) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    [(CLDurianService *)self performTask:v9 forClient:a5 onDevice:v8];
  }
}

- (void)setTagType:(unsigned __int8)a3 onTag:(id)a4 forClient:(id)a5
{
  id v8 = [[-[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a4) createSetTagTypeTaskWithType:a3];
  if (v8)
  {
    id v9 = v8;
    id v10 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a4];
    [(CLDurianService *)self performTask:v9 forClient:a5 onDevice:v10];
  }
  else
  {
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    CFStringRef v12 = @"Stop sound not supported for this device type";
    [a5 didSetTagTypeOnTag:a4 withError:[NSError errorWithDomain:kCLErrorDomainPrivate code:6 userInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)]];
  }
}

- (void)setWildModeConfiguration:(id)a3 onTag:(id)a4 forClient:(id)a5
{
  id v8 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a4];
  id v9 = [v8 createSetWildModeTaskWithConfiguration:a3];
  if (v9)
  {
    [(CLDurianService *)self performTask:v9 forClient:a5 onDevice:v8];
  }
}

- (void)rollWildKeyOnTag:(id)a3 forClient:(id)a4
{
  id v6 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a3];
  id v7 = [v6 createRollWildKeyTask];
  if (v7)
  {
    [(CLDurianService *)self performTask:v7 forClient:a4 onDevice:v6];
  }
}

- (void)playSoundSequence:(id)a3 onTag:(id)a4 forClient:(id)a5
{
  id v9 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a4];
  id v10 = [v9 createPlaySoundTaskWithSequence:a3];
  if (v10)
  {
    [(CLDurianService *)self performTask:v10 forClient:a5 onDevice:v9];
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    NSErrorUserInfoKey v11 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      int v14 = 68289283;
      int v15 = 0;
      __int16 v16 = 2082;
      long long v17 = "";
      __int16 v18 = 2113;
      id v19 = [[[v9 uuid] description] substringToIndex:8];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian failed to construct play sound task\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v14, 0x1Cu);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
    }
    CFStringRef v12 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      id v13 = [[[v9 uuid] description] substringToIndex:8];
      int v14 = 68289283;
      int v15 = 0;
      __int16 v16 = 2082;
      long long v17 = "";
      __int16 v18 = 2113;
      id v19 = v13;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian failed to construct play sound task", "{\"msg%{public}.0s\":\"#durian failed to construct play sound task\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v14, 0x1Cu);
    }
    [a5 didStartPlayingSoundOnTag:a4 withError:[NSError errorWithDomain:kCLErrorDomainPrivate code:6 userInfo:0]];
  }
}

- (void)playUnauthorizedSoundSequence:(id)a3 onTag:(id)a4 forClient:(id)a5
{
  id v9 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a4];
  id v10 = [v9 createPlayUnauthorizedSoundTaskWithSequence:a3];
  if (v10)
  {
    [(CLDurianService *)self performTask:v10 forClient:a5 onDevice:v9];
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    NSErrorUserInfoKey v11 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      int v14 = 68289283;
      int v15 = 0;
      __int16 v16 = 2082;
      long long v17 = "";
      __int16 v18 = 2113;
      id v19 = [[[v9 uuid] description] substringToIndex:8];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian failed to construct non-owner play sound task\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v14, 0x1Cu);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
    }
    CFStringRef v12 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      id v13 = [[[v9 uuid] description] substringToIndex:8];
      int v14 = 68289283;
      int v15 = 0;
      __int16 v16 = 2082;
      long long v17 = "";
      __int16 v18 = 2113;
      id v19 = v13;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian failed to construct non-owner play sound task", "{\"msg%{public}.0s\":\"#durian failed to construct non-owner play sound task\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v14, 0x1Cu);
    }
    [a5 didStartPlayingUnauthorizedSoundOnTag:a4 withError:+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, 0)];
  }
}

- (void)stopPlayingSoundOnTag:(id)a3 forClient:(id)a4
{
  id v6 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a3];
  if ([v6 cancelAnyPendingPlaySound])
  {
    id v7 = objc_alloc((Class)NSError);
    uint64_t v8 = kCLErrorDomainPrivate;
    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    CFStringRef v11 = sub_101640864(0x2DuLL);
    [a4 didStartPlayingSoundOnTag:[v6 uuid] withError:[v7 initWithDomain:v8 code:45 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1)]];
    [a4 didStopPlayingSoundOnTag:[v6 uuid] withError:0];
    if ([v6 isOnlyRemainingTask]) {
      [(CLDurianDeviceManager *)self->_deviceManager cancelConnectionAttemptToDevice:v6];
    }
  }
  else
  {
    id v9 = [v6 createStopPlayingSoundTask];
    [(CLDurianService *)self performTask:v9 forClient:a4 onDevice:v6];
  }
}

- (void)stopPlayingUnauthorizedSoundOnTag:(id)a3 forClient:(id)a4
{
  id v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  id v8 = [v7 createStopPlayingUnauthorizedSoundTask];
  if (v8)
  {
    [(CLDurianService *)self performTask:v8 forClient:a4 onDevice:v7];
  }
  else
  {
    id v9 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    CFStringRef v11 = @"Stop sound not supported for this device type";
    [a4 didStopPlayingUnauthorizedSoundOnTag:a3 withError:[v9 initWithDomain:kCLErrorDomainPrivate code:6 userInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1)]];
  }
}

- (void)connectToTag:(id)a3 forClient:(id)a4
{
  id v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  [v7 setDelegate:self];
  [(NSMutableSet *)self->_clients addObject:a4];
  if ([v7 activePeripheral])
  {
    [a4 didConnectToTag:a3 withMacAddress:[v7 address] withError:0];
    deviceManager = self->_deviceManager;
    [(CLDurianDeviceManager *)deviceManager scheduleConnectionEvaluationForDevice:v7];
  }
  else
  {
    [v7 setConnectionReason:@"Prewarm"];
    id v9 = self->_deviceManager;
    [(CLDurianDeviceManager *)v9 attemptConnectionToDevice:v7];
  }
}

- (void)disconnectFromTag:(id)a3 forClient:(id)a4
{
  id v6 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a3];
  [v6 setDelegate:self];
  [(NSMutableSet *)self->_clients addObject:a4];
  if ([v6 isConnected])
  {
    [v6 setDisconnectionReason:@"SPI"];
    deviceManager = self->_deviceManager;
    [(CLDurianDeviceManager *)deviceManager requestDisconnectionForDevice:v6];
  }
  else
  {
    id v8 = [v6 uuid];
    [a4 didDisconnectFromTag:v8 withError:0];
  }
}

- (void)shouldDisconnectReconnectForDevice:(id)a3
{
  BOOL v5 = [a3 commandedLatency] == (id)-6 || [a3 currentLatency] == (id)-6;
  BOOL v6 = 0;
  unsigned int v7 = [(CLDurianSystemMonitor *)self->_systemMonitor coexImpactState] & 3;
  if (v5 && !v7) {
    BOOL v6 = [a3 numPendingTasks] == 0;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v8 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 68290307;
    v9[1] = 0;
    __int16 v10 = 2082;
    CFStringRef v11 = "";
    __int16 v12 = 2113;
    id v13 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    __int16 v14 = 1026;
    BOOL v15 = v6;
    __int16 v16 = 1026;
    BOOL v17 = v5;
    __int16 v18 = 1026;
    unsigned int v19 = v7;
    __int16 v20 = 1026;
    unsigned int v21 = [a3 numPendingTasks];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection disreconnect\", \"item\":%{private, location:escape_only}@, \"reconnect\":%{public}hhd, \"990\":%{public}d, \"coex\":%{public}d, \"tasks\":%{public}d}", (uint8_t *)v9, 0x34u);
  }
  if (v6) {
    [(CLDurianDeviceManager *)self->_deviceManager reconnectDevice:a3];
  }
}

- (void)initRangingWithMacAddress:(id)a3 onTag:(id)a4 forClient:(id)a5
{
  id v9 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a4];
  id v10 = [v9 createInitRangingTaskWithMacAddress:a3];
  if (v10)
  {
    id v11 = v10;
    [(CLDurianService *)self shouldDisconnectReconnectForDevice:v9];
    [(CLDurianService *)self performTask:v11 forClient:a5 onDevice:v9];
    self->_activeRangingClient = (CLDurianClientProtocol *)a5;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    roseOnForClientOnDevice = self->_roseOnForClientOnDevice;
    id v13 = [(NSMutableSet *)roseOnForClientOnDevice countByEnumeratingWithState:&v22 objects:v32 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v23;
LABEL_4:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(roseOnForClientOnDevice);
        }
        if ([*(id *)(*((void *)&v22 + 1) + 8 * v16) client] == a5) {
          break;
        }
        if (v14 == (id)++v16)
        {
          id v14 = [(NSMutableSet *)roseOnForClientOnDevice countByEnumeratingWithState:&v22 objects:v32 count:16];
          if (v14) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
      __int16 v18 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
      {
        id v21 = [[[v9 uuid] description] substringToIndex:8];
        *(_DWORD *)uint64_t buf = 68289283;
        int v27 = 0;
        __int16 v28 = 2082;
        int v29 = "";
        __int16 v30 = 2113;
        id v31 = v21;
        __int16 v20 = "{\"msg%{public}.0s\":\"#durian #rose already initialize by client\", \"item\":%{private, location:escape_only}@}";
        goto LABEL_18;
      }
    }
    else
    {
LABEL_10:
      BOOL v17 = objc_alloc_init(RoseOnClientAndDevicePair);
      [(RoseOnClientAndDevicePair *)v17 setClient:a5];
      [(RoseOnClientAndDevicePair *)v17 setDeviceUUID:a4];
      [(NSMutableSet *)self->_roseOnForClientOnDevice addObject:v17];
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
      __int16 v18 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
      {
        id v19 = [[[v9 uuid] description] substringToIndex:8];
        *(_DWORD *)uint64_t buf = 68289283;
        int v27 = 0;
        __int16 v28 = 2082;
        int v29 = "";
        __int16 v30 = 2113;
        id v31 = v19;
        __int16 v20 = "{\"msg%{public}.0s\":\"#durian #rose added client to rose on list\", \"item\":%{private, location:escape_only}@}";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, v20, buf, 0x1Cu);
      }
    }
  }
}

- (void)deinitRangingOnTag:(id)a3 forClient:(id)a4
{
  id v6 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a3];
  id v7 = [v6 createDeinitRangingTask];
  if (v7)
  {
    [(CLDurianService *)self performTask:v7 forClient:a4 onDevice:v6];
  }
}

- (void)configureRangingWithMacAddress:(id)a3 countryCode:(unsigned __int8)a4 uwbChannel:(unsigned __int8)a5 acqPreamble:(unsigned __int8)a6 trackingPreamble:(unsigned __int8)a7 interval:(unsigned __int16)a8 onTag:(id)a9 forClient:(id)a10
{
  uint64_t v10 = a8;
  uint64_t v11 = a7;
  uint64_t v12 = a6;
  uint64_t v13 = a5;
  uint64_t v14 = a4;
  id v17 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a9];
  id v18 = [v17 createConfigureRangingTaskWithMacAddress:a3 countryCode:v14 uwbChannel:v13 acqPreamble:v12 trackingPreamble:v11 interval:v10];
  if (v18)
  {
    [(CLDurianService *)self performTask:v18 forClient:a10 onDevice:v17];
  }
}

- (void)prepareRangingOnTag:(id)a3 forClient:(id)a4
{
  id v6 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a3];
  if ([v6 isHeleAccessory])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    id v7 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 68289283;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2113;
      id v12 = [[[v6 uuid] description] substringToIndex:8];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele ranging not supported\", \"item\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
    }
  }
  else
  {
    if (a4)
    {
      [(NSMutableSet *)self->_clients addObject:a4];
      -[NSMutableDictionary setObject:forKey:](self->_taskClientMap, "setObject:forKey:", a4, [v6 uuid]);
    }
    [v6 checkPrepareRanging];
  }
}

- (void)startRangingWithTargetEventCounter:(unsigned __int16)a3 onTag:(id)a4 forClient:(id)a5
{
  uint64_t v6 = a3;
  id v8 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a4];
  id v9 = [v8 createStartRangingTaskWithTargetEventCounter:v6];
  if (v9)
  {
    [(CLDurianService *)self performTask:v9 forClient:a5 onDevice:v8];
  }
}

- (void)stopRangingOnTag:(id)a3 forClient:(id)a4
{
  id v6 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a3];
  id v7 = [v6 createStopRangingTask];
  if (v7)
  {
    [(CLDurianService *)self performTask:v7 forClient:a4 onDevice:v6];
  }
}

- (void)startEventCounterOnTag:(id)a3 forClient:(id)a4
{
  id v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  if ([(CLDurianDevice *)v7 isHeleAccessory])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    id v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 68289283;
      int v14 = 0;
      __int16 v15 = 2082;
      uint64_t v16 = "";
      __int16 v17 = 2113;
      id v18 = [[-[NSUUID description](-[CLDurianDevice uuid](v7, "uuid"), "description") substringToIndex:8];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele ranging not supported\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v13, 0x1Cu);
    }
  }
  else
  {
    eventCounterOnForDevice = self->_eventCounterOnForDevice;
    if (eventCounterOnForDevice) {
      BOOL v10 = v7 == eventCounterOnForDevice;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
      __int16 v11 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 68289283;
        int v14 = 0;
        __int16 v15 = 2082;
        uint64_t v16 = "";
        __int16 v17 = 2113;
        id v18 = [[-[NSUUID description](-[CLDurianDevice uuid](v7, "uuid"), "description") substringToIndex:8];
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Turning off an event counter before turning it on for another device\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v13, 0x1Cu);
      }
      [(CLDurianDevice *)self->_eventCounterOnForDevice stopEventCounter];
    }
    id v12 = [(CLDurianDevice *)v7 startEventCounter];
    if (v12) {
      [a4 didFailRangingEventCounterActionForTag:a3 error:v12];
    }
    self->_eventCounterOnForDevice = v7;
  }
}

- (void)stopEventCounterOnTag:(id)a3 forClient:(id)a4
{
  id v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  if ([v7 isHeleAccessory])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    id v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 68289283;
      v10[1] = 0;
      __int16 v11 = 2082;
      id v12 = "";
      __int16 v13 = 2113;
      id v14 = [[[v7 uuid] description] substringToIndex:8];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele ranging not supported\", \"item\":%{private, location:escape_only}@}", (uint8_t *)v10, 0x1Cu);
    }
  }
  else
  {
    id v9 = [v7 stopEventCounter];
    if (v9) {
      [a4 didFailRangingEventCounterActionForTag:a3 error:v9];
    }
    self->_eventCounterOnForDevice = 0;
  }
}

- (void)getMultiStatusForTag:(id)a3 forClient:(id)a4
{
  id v6 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a3];
  id v7 = [v6 createGetMultiStatusTask];
  if (v7)
  {
    [(CLDurianService *)self performTask:v7 forClient:a4 onDevice:v6];
  }
}

- (void)getGroupStatusForTag:(id)a3 forClient:(id)a4
{
  id v6 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a3];
  id v7 = [v6 createGetGroupStatusTask];
  if (v7)
  {
    [(CLDurianService *)self performTask:v7 forClient:a4 onDevice:v6];
  }
}

- (void)completeRangingInit:(id)a3 client:(id)a4 data:(char *)a5 opcode:(unsigned __int16)a6
{
  uint64_t v6 = a6;
  id v9 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a3];
  id v10 = [v9 getRangingStatusForOpcode:v6 data:a5];
  id v11 = [v9 uuid];

  [a4 didInitRangingOnTag:v11 withStatus:v10 error:0];
}

- (void)completeRangingConfigure:(id)a3 client:(id)a4 data:(char *)a5 opcode:(unsigned __int16)a6
{
  uint64_t v6 = a6;
  id v9 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a3];
  id v10 = [v9 getRangingStatusForOpcode:v6 data:a5];
  id v11 = [v9 uuid];

  [a4 didConfigureRangingOnTag:v11 withStatus:v10 error:0];
}

- (void)completeRangingStart:(id)a3 client:(id)a4 data:(char *)a5 opcode:(unsigned __int16)a6
{
  uint64_t v6 = a6;
  id v9 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", a3, a4);
  id v10 = [v9 getRangingStatusForOpcode:v6 data:a5];
  id v11 = [v9 getRangeEndReasonForOpcode:v6 data:a5];
  activeRangingClient = self->_activeRangingClient;
  id v13 = [v9 uuid];

  [(CLDurianClientProtocol *)activeRangingClient didCompleteRangingOnTag:v13 withStatus:v10 endReason:v11 error:0];
}

- (void)completeRangingDeinit:(id)a3 client:(id)a4 data:(char *)a5 opcode:(unsigned __int16)a6
{
  unsigned int v6 = a6;
  id v10 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a3];
  unsigned int v20 = v6;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v11 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
  {
    uint64_t buf = 68289283;
    __int16 v27 = 2082;
    __int16 v28 = "";
    __int16 v29 = 2113;
    id v30 = [[[v10 uuid] description] substringToIndex:8];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#durian #rose ack for rose stop processed\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  roseOnForClientOnDevice = self->_roseOnForClientOnDevice;
  id v13 = [(NSMutableSet *)roseOnForClientOnDevice countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(roseOnForClientOnDevice);
        }
        __int16 v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v17 client] == a4)
        {
          [(NSMutableSet *)self->_roseOnForClientOnDevice removeObject:v17];
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331ED8);
          }
          id v18 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
          {
            id v19 = [[[v10 uuid] description] substringToIndex:8];
            uint64_t buf = 68289283;
            __int16 v27 = 2082;
            __int16 v28 = "";
            __int16 v29 = 2113;
            id v30 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#durian #rose removed from rose on list\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
          }
          goto LABEL_18;
        }
      }
      id v14 = [(NSMutableSet *)roseOnForClientOnDevice countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_18:
  [a4 didDeinitRangingOnTag:[v10 uuid] withStatus:[v10 getRangingStatusForOpcode:v20 data:a5] error:0];
  [v10 releaseMutexWithReason:@"RoseStop"];
}

- (void)fetchConnectionStateForTag:(id)a3 forClient:(id)a4
{
  id v6 = [[self->_deviceManager deviceWithUUID:](-[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:")) connectionState];

  _[a4 didFetchConnectionState:v6 forTag:a3 withError:0];
}

- (void)dumpLogsOfType:(unint64_t)a3 forTag:(id)a4 forClient:(id)a5
{
  id v9 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a4];
  id v10 = [v9 createDumpLogsTaskOfType:a3];
  if (v10)
  {
    [(CLDurianService *)self performTask:v10 forClient:a5 onDevice:v9];
  }
  else
  {
    id v11 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    CFStringRef v14 = @"Invalid log dump request";
    id v12 = [[v11 initWithDomain:kCLErrorDomainPrivate code:6 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1)];
    [a5 didDumpLogs:0 ofType:a3 fromTag:a4 withError:v12];
  }
}

- (void)setKeyRollInterval:(unsigned int)a3 onTag:(id)a4 forClient:(id)a5
{
  LODWORD(v6) = a3;
  id v8 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a4];
  if (v6 <= 0x3C) {
    uint64_t v6 = 60;
  }
  else {
    uint64_t v6 = v6;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v9 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 68289539;
    v12[1] = 0;
    __int16 v13 = 2082;
    CFStringRef v14 = "";
    __int16 v15 = 2113;
    id v16 = [[[v8 uuid] description] substringToIndex:8];
    __int16 v17 = 1026;
    int v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian setKeyRollInterval\", \"item\":%{private, location:escape_only}@, \"seconds\":%{public}d}", (uint8_t *)v12, 0x22u);
  }
  [v8 setKeyRollInterval:v6];
  id v10 = [v8 createSetKeyRollTimeoutTaskWithInterval:v6];
  if ([v8 isConnected]) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11) {
    [(CLDurianService *)self performTask:v10 forClient:a5 onDevice:v8];
  }
}

- (void)induceCrashOnTag:(id)a3 forClient:(id)a4
{
  id v6 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a3];
  id v7 = [v6 createInduceCrashTask];

  [(CLDurianService *)self performTask:v7 forClient:a4 onDevice:v6];
}

- (void)setUnauthorizedPlaySoundRateLimit:(BOOL)a3 onTag:(id)a4 forClient:(id)a5
{
  BOOL v7 = a3;
  id v9 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a4];
  id v10 = [v9 createSetUnauthorizedPlaySoundRateLimitTask:v7];
  if (v10)
  {
    [(CLDurianService *)self performTask:v10 forClient:a5 onDevice:v9];
  }
  else
  {
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    CFStringRef v12 = @"Not supported for this device type";
    [a5 didSetUnauthorizedPlaySoundRateLimitFromTag:a4 error:[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1))];
  }
}

- (void)getPersonalizationInfoForDevice:(id)a3 forClient:(id)a4
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  BOOL v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289283;
    int v33 = 0;
    __int16 v34 = 2082;
    __int16 v35 = "";
    __int16 v36 = 2113;
    id v37 = [[objc_msgSend(a3, "description") substringToIndex:8];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian DurianService - getPersonalizationInfoForDevice\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  id v8 = [(NSMutableDictionary *)[(CLDurianDeviceManager *)self->_deviceManager devices] objectForKey:a3];
  id v9 = v8;
  if (!v8)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    CFStringRef v12 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v33 = 0;
      __int16 v34 = 2082;
      __int16 v35 = "";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #firmwareUpdate getPersonalizationInfoForDevice unknown nil device\"}", buf, 0x12u);
      NSErrorUserInfoKey v11 = @"InvalidRequest";
      id v10 = @"No tag found";
      goto LABEL_34;
    }
    id v10 = @"No tag found";
LABEL_26:
    NSErrorUserInfoKey v11 = @"InvalidRequest";
LABEL_36:
    unsigned int v20 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [(__CFString *)v11 UTF8String];
      id v22 = [[objc_msgSend(a3, "description") substringToIndex:8];
      id v23 = [(__CFString *)v10 UTF8String];
      *(_DWORD *)uint64_t buf = 68289795;
      int v33 = 0;
      __int16 v34 = 2082;
      __int16 v35 = "";
      __int16 v36 = 2082;
      id v37 = v21;
      __int16 v38 = 2113;
      id v39 = v22;
      __int16 v40 = 2082;
      id v41 = v23;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian DurianService failed getPersonalizationInfoForDevice \", \"reason\":%{public, location:escape_only}s, \"item\":%{private, location:escape_only}@, \"blockingReason\":%{public, location:escape_only}s}", buf, 0x30u);
    }
    id v24 = objc_alloc((Class)NSError);
    uint64_t v25 = kCLErrorDomainPrivate;
    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    id v31 = +[NSString stringWithFormat:@"%@:%@", v11, v10];
    [a4 didRetrievePersonalizationInformation:0 forTag:a3 error:[v24 initWithDomain:v25 code:9 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1)]];
    v28[0] = @"event";
    v28[1] = @"reason";
    v29[0] = @"firmwareUpdateFailed";
    v29[1] = v11;
    v28[2] = @"firmwareUpdateblockingTask";
    v29[2] = v10;
    [(CLDurianService *)self sendFirmwareUpdateMetrics:+[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3] forDevice:v9];
    return;
  }
  if (![v8 isAirTag]
    || [v9 numPendingTasks]
    || ([v9 firmwareUpdateMode] & 1) != 0
    || ([v9 isRoseInitialized] & 1) != 0)
  {
    if ([v9 isAirTag])
    {
      if ([v9 numPendingTasks])
      {
        id v10 = (__CFString *)[v9 currentTaskName];
        NSErrorUserInfoKey v11 = @"TagBusy";
      }
      else
      {
        NSErrorUserInfoKey v11 = @"TagBusy";
        if ([v9 firmwareUpdateMode])
        {
          id v10 = @"Already Doing FW update";
        }
        else
        {
          unsigned int v19 = [v9 isRoseInitialized];
          if (v19) {
            id v10 = @"Rose Initialized - user in details pane";
          }
          else {
            id v10 = @"Unknown";
          }
          if (!v19) {
            NSErrorUserInfoKey v11 = @"Unknown";
          }
        }
      }
      goto LABEL_34;
    }
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    __int16 v13 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_FAULT))
    {
      id v14 = [[objc_msgSend(a3, "description") substringToIndex:8];
      id v15 = [objc_msgSend(v9, "beacon") type];
      *(_DWORD *)uint64_t buf = 68289539;
      int v33 = 0;
      __int16 v34 = 2082;
      __int16 v35 = "";
      __int16 v36 = 2113;
      id v37 = v14;
      __int16 v38 = 2113;
      id v39 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian #firmwareUpdate getPersonalizationInfoForDevice unknown\", \"item\":%{private, location:escape_only}@, \"beaconType\":%{private, location:escape_only}@}", buf, 0x26u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
    }
    id v16 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      id v17 = [[[a3 description] substringToIndex:8];
      id v18 = [objc_msgSend(v9, "beacon") type];
      *(_DWORD *)uint64_t buf = 68289539;
      int v33 = 0;
      __int16 v34 = 2082;
      __int16 v35 = "";
      __int16 v36 = 2113;
      id v37 = v17;
      __int16 v38 = 2113;
      id v39 = v18;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #firmwareUpdate getPersonalizationInfoForDevice unknown", "{\"msg%{public}.0s\":\"#durian #firmwareUpdate getPersonalizationInfoForDevice unknown\", \"item\":%{private, location:escape_only}@, \"beaconType\":%{private, location:escape_only}@}", buf, 0x26u);
      NSErrorUserInfoKey v11 = @"InvalidRequest";
      id v10 = @"Device is not airtag";
LABEL_34:
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
      goto LABEL_36;
    }
    id v10 = @"Device is not airtag";
    goto LABEL_26;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  uint64_t v26 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v27 = [[objc_msgSend(a3, "description") substringToIndex:8];
    *(_DWORD *)uint64_t buf = 68289283;
    int v33 = 0;
    __int16 v34 = 2082;
    __int16 v35 = "";
    __int16 v36 = 2113;
    id v37 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian DurianService - kicking off getPersonalizationInfoForDevice\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  [(NSMutableDictionary *)self->_firmwareUpdateClientMap setObject:a4 forKeyedSubscript:a3];
  [v9 setConnectionReason:@"FWDL:KickOff"];
  [(CLDurianDeviceManager *)self->_deviceManager attemptConnectionToDevice:v9];
  [v9 getPersonalizationInformation];
  [(NSMutableArray *)self->_devicesUndergoingFirmwareUpdate addObject:a3];
}

- (void)fetchTxPowerForDevice:(id)a3 forClient:(id)a4 asOwner:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  id v10 = [v9 createFetchTxPowerTaskAsOwner:v5];
  if (v10)
  {
    id v11 = v10;
    if (([v9 isCapableOfAllHawkeyeServices] & 1) != 0 || v5) {
      [(CLDurianService *)self shouldDisconnectReconnectForDevice:v9];
    }
    [(CLDurianService *)self performTask:v11 forClient:a4 onDevice:v9];
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    CFStringRef v12 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 68289283;
      v13[1] = 0;
      __int16 v14 = 2082;
      id v15 = "";
      __int16 v16 = 2113;
      id v17 = [[objc_msgSend(a3, "description") substringToIndex:8];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian fetchTxPower not supported\", \"item\":%{private, location:escape_only}@}", (uint8_t *)v13, 0x1Cu);
    }
    [a4 didFetchTxPower:[NSNumber numberWithInt:0] fromDevice:[v9 uuid] withError:[NSError _cl_DurianFeatureNotSupportedError]];
  }
}

- (void)startAggressiveAdvertisingForDevice:(id)a3 withTimeout:(unsigned int)a4 forClient:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v10 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 68290051;
    v13[1] = 0;
    __int16 v14 = 2082;
    id v15 = "";
    __int16 v16 = 2113;
    id v17 = [[[a3 description] substringToIndex:8];
    __int16 v18 = 2113;
    id v19 = [v9 uuid];
    __int16 v20 = 1026;
    int v21 = v6;
    __int16 v22 = 2114;
    id v23 = [v9 prettyBeaconType];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #aggadv requested\", \"item\":%{private, location:escape_only}@, \"device\":%{private, location:escape_only}@, \"timeout\":%{public}d, \"type\":%{public, location:escape_only}@}", (uint8_t *)v13, 0x36u);
  }
  id v11 = [v9 createStartAggressiveAdvertisingTaskWithTimeout:v6];
  if (v11)
  {
    id v12 = v11;
    [(CLDurianService *)self shouldDisconnectReconnectForDevice:v9];
    [(CLDurianService *)self performTask:v12 forClient:a5 onDevice:v9];
    [v9 setAggressiveAdvertisingTimeout:v6];
  }
  else
  {
    [a5 didStartAggressiveAdvertisingOnDevice:[v9 uuid] withError:+[NSError _cl_DurianFeatureNotSupportedError](NSError, "_cl_DurianFeatureNotSupportedError")];
  }
}

- (void)stopAggressiveAdvertisingForDevice:(id)a3 forClient:(id)a4
{
  id v6 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a3];
  id v7 = [v6 createStopAggressiveAdvertisingTask];
  if (v7)
  {
    id v8 = v7;
    [(CLDurianService *)self shouldDisconnectReconnectForDevice:v6];
    [(CLDurianService *)self performTask:v8 forClient:a4 onDevice:v6];
  }
  else
  {
    id v9 = +[NSError _cl_DurianFeatureNotSupportedError];
    id v10 = [v6 uuid];
    [a4 didStartAggressiveAdvertisingOnDevice:v10 withError:v9];
  }
}

- (void)startUnauthorizedAggressiveAdvertisingForDevice:(id)a3 forClient:(id)a4
{
  id v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v8 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 68290051;
    v10[1] = 0;
    __int16 v11 = 2082;
    id v12 = "";
    __int16 v13 = 2113;
    id v14 = [[objc_msgSend(a3, "description") substringToIndex:8];
    __int16 v15 = 2113;
    id v16 = [v7 uuid];
    __int16 v17 = 1026;
    int v18 = 1;
    __int16 v19 = 2114;
    id v20 = [v7 prettyBeaconType];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #aggadv requested\", \"item\":%{private, location:escape_only}@, \"device\":%{private, location:escape_only}@, \"ut\":%{public}d, \"type\":%{public, location:escape_only}@}", (uint8_t *)v10, 0x36u);
  }
  id v9 = [v7 createStartUnauthorizedAggressiveAdvertisingTask];
  if (v9) {
    [(CLDurianService *)self performTask:v9 forClient:a4 onDevice:v7];
  }
  else {
    [a4 didStartUnauthorizedAggressiveAdvertisingOnDevice:[v7 uuid] withError:[+[NSError _cl_DurianFeatureNotSupportedError](NSError, "_cl_DurianFeatureNotSupportedError")]];
  }
}

- (void)setHawkeyeTestMode:(int)a3 onTag:(id)a4 forClient:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  id v9 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a4];
  id v10 = [v9 createSetTestModeTaskWithMode:v7];
  if (v10)
  {
    id v11 = v10;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    id v12 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 68289795;
      v13[1] = 0;
      __int16 v14 = 2082;
      __int16 v15 = "";
      __int16 v16 = 2113;
      id v17 = [[objc_msgSend(a4, "description") substringToIndex:8];
      __int16 v18 = 1026;
      int v19 = v7;
      __int16 v20 = 1026;
      int v21 = 1;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye setHawkeyeTestMode\", \"item\":%{private, location:escape_only}@, \"mode\":%{public}d, \"task\":%{public}hhd}", (uint8_t *)v13, 0x28u);
    }
    [v9 setHawkeyeTestMode:v7];
    [(CLDurianService *)self performTask:v11 forClient:a5 onDevice:v9];
  }
}

- (void)setHawkeyeUTMotionConfigWithSeparatedUTTimeoutSeconds:(unsigned int)a3 separatedUTBackoffTimeoutSeconds:(unsigned int)a4 forDevice:(id)a5 forClient:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  id v11 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a5];
  id v12 = +[CLDurianTask setHawkeyeUTMotionConfigWithSeparatedUTTimeoutSeconds:v9 separatedUTBackoffTimeoutSeconds:v8];
  if (v12)
  {
    id v13 = v12;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    __int16 v14 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      int v18 = 0;
      __int16 v19 = 2082;
      __int16 v20 = "";
      __int16 v21 = 2113;
      id v22 = [[objc_msgSend(a5, "description") substringToIndex:8];
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye induceCrash\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    [(CLDurianService *)self performTask:v13 forClient:a6 onDevice:v11];
  }
  else
  {
    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    CFStringRef v16 = @"Not supported for this device type";
    [a6 didSetHawkeyeUTMotionConfigForDevice:a5 withError:+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1))];
  }
}

- (id)getUarpAccessoryForDevice:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(UARPController *)self->_uarpController accessoryList];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = *(void *)v13;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v4);
      }
      id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
      if (objc_msgSend(objc_msgSend(v10, "uuid"), "isEqual:", objc_msgSend(a3, "uuid"))) {
        uint64_t v7 = v10;
      }
    }
    id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v6);
  return v7;
}

- (id)getDevicesForProductGroup:(id)a3 andProductNumber:(id)a4
{
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = [(UARPController *)self->_uarpController accessoryList];
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v30 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(v13, "productGroup"), "isEqualToString:", a3)
          && objc_msgSend(objc_msgSend(v13, "productNumber"), "isEqual:", a4))
        {
          [v7 addObject:-[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", objc_msgSend(v13, "uuid"))];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v30 count:16];
    }
    while (v10);
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  long long v14 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289795;
    int v21 = 0;
    __int16 v22 = 2082;
    id v23 = "";
    __int16 v24 = 2114;
    id v25 = a3;
    __int16 v26 = 2114;
    id v27 = a4;
    __int16 v28 = 2113;
    id v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - found devices with PG/PN\", \"Product group\":%{public, location:escape_only}@, \"Product Number\":%{public, location:escape_only}@, \"Devices\":%{private, location:escape_only}@}", buf, 0x30u);
  }
  return v7;
}

- (void)didFailFirmwareUpdateForDevice:(id)a3 withError:(id)a4
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289539;
    int v13 = 0;
    __int16 v14 = 2082;
    long long v15 = "";
    __int16 v16 = 2113;
    id v17 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    __int16 v18 = 2113;
    id v19 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #Hawkeye #firmwareUpdate - Firmware update failed\", \"item\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
  }
  [(UARPController *)self->_uarpController accessoryUnreachable:[(CLDurianService *)self getUarpAccessoryForDevice:a3]];
  -[UARPController cancelFirmwareStagingForAccessory:assetID:](self->_uarpController, "cancelFirmwareStagingForAccessory:assetID:", -[CLDurianService getUarpAccessoryForDevice:](self, "getUarpAccessoryForDevice:", a3), -[NSMutableDictionary objectForKeyedSubscript:](self->_assetIdMap, "objectForKeyedSubscript:", [a3 uuid]));
  if (!a4)
  {
    uint64_t v8 = kCLErrorDomainPrivate;
    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    CFStringRef v11 = sub_101640864(0xFFFFFFFFFFFFFFFFLL);
    id v9 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v8, -1, v9, v10);
  }
  [(CLDurianService *)self didUpdateFirmwareForDevice:a3 error:a4];
  -[SPFirmwareUpdateSessionProtocol updateBeaconUUID:firmwareUpdateState:systemVersion:error:completion:](self->_spFirmwareUpdateSession, "updateBeaconUUID:firmwareUpdateState:systemVersion:error:completion:", [a3 uuid], 1, 0, a4, &stru_102331DC8);
}

- (BOOL)deviceUndergoingFirmwareUpdate:(id)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  devicesUndergoingFirmwareUpdate = self->_devicesUndergoingFirmwareUpdate;
  id v5 = [(NSMutableArray *)devicesUndergoingFirmwareUpdate countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(devicesUndergoingFirmwareUpdate);
        }
        if (objc_msgSend(objc_msgSend(a3, "uuid"), "isEqual:", *(void *)(*((void *)&v15 + 1) + 8 * i)))
        {
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331ED8);
          }
          int v13 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            id v14 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
            *(_DWORD *)uint64_t buf = 68289283;
            int v20 = 0;
            __int16 v21 = 2082;
            __int16 v22 = "";
            __int16 v23 = 2113;
            id v24 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye #firmwareUpdate Update device undergoing FirmwareUpdate\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
          }
          return 1;
        }
      }
      id v6 = [(NSMutableArray *)devicesUndergoingFirmwareUpdate countByEnumeratingWithState:&v15 objects:v25 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v9 = qword_102419398;
  BOOL v10 = os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v10)
  {
    id v12 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    *(_DWORD *)uint64_t buf = 68289283;
    int v20 = 0;
    __int16 v21 = 2082;
    __int16 v22 = "";
    __int16 v23 = 2113;
    id v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye #firmwareUpdate Update device NOT undergoing FirmwareUpdate\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
    return 0;
  }
  return result;
}

- (void)updateFirmwareForDevice:(id)a3 withAssetURL:(id)a4 forClient:(id)a5
{
  id v9 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  if ([v9 isHawkeyeAccessory])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    BOOL v10 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      int v24 = 0;
      __int16 v25 = 2082;
      __int16 v26 = "";
      __int16 v27 = 2113;
      id v28 = [[[v9 uuid] description] substringToIndex:8];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye #firmwareUpdate Update updateFirmwareForDevice\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    id v11 = [(CLDurianService *)self getUarpAccessoryForDevice:v9];
    id v12 = [(NSMutableDictionary *)self->_assetIdMap objectForKeyedSubscript:a3];
    if (v11) {
      BOOL v13 = v12 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (!v13)
    {
      long long v18 = v12;
      [(NSMutableArray *)self->_devicesUndergoingFirmwareUpdate addObject:a3];
      [(CLDurianDeviceManager *)self->_deviceManager attemptConnectionToDevice:v9];
      [v9 enterFirmwareUpdateMode];
      [(UARPController *)self->_uarpController downloadAvailableFirmwareUpdate:v11 assetID:v18 withUserIntent:1];
      -[SPFirmwareUpdateSessionProtocol updateBeaconUUID:firmwareUpdateState:systemVersion:error:completion:](self->_spFirmwareUpdateSession, "updateBeaconUUID:firmwareUpdateState:systemVersion:error:completion:", a3, 0, [v18 assetVersion], 0, &stru_102331DE8);
      [(NSMutableDictionary *)self->_firmwareUpdateClientMap setObject:a5 forKeyedSubscript:a3];
      return;
    }
    id v14 = objc_alloc((Class)NSError);
    uint64_t v15 = kCLErrorDomainPrivate;
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    CFStringRef v22 = @"This accessory is not registered or there is no update available for it";
    long long v16 = &v22;
    long long v17 = &v21;
    goto LABEL_18;
  }
  if ([(NSMutableDictionary *)self->_firmwareUpdateClientMap objectForKeyedSubscript:a3] != a5
    || ![v9 allowFirmwareUpdate])
  {
    id v14 = objc_alloc((Class)NSError);
    uint64_t v15 = kCLErrorDomainPrivate;
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    CFStringRef v20 = @"Not in firmware update state, please request personalization information first.";
    long long v16 = &v20;
    long long v17 = &v19;
LABEL_18:
    [a5 didUpdateFirmwareForTag:a3 error:[v14 initWithDomain:v15 code:6 userInfo:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v17, 1, v19, v20, v21, v22)]]];
    return;
  }

  _[v9 updateFirmwareWithAssetURL:a4];
}

- (void)abortFirmwareUpdateForDevice:(id)a3 forClient:(id)a4
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289283;
    v6[1] = 0;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    __int16 v9 = 2113;
    id v10 = [[[a3 description] substringToIndex:8];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye #firmwareUpdate - abortFirmwareUpdate\", \"item\":%{private, location:escape_only}@}", (uint8_t *)v6, 0x1Cu);
  }
}

- (void)submitFirmwareVersionsForOwnedTags
{
  double Current = CFAbsoluteTimeGetCurrent();
  +[CLDurianSettings lastFirmwareVersionForAllTagsSubmission];
  double v5 = vabdd_f64(Current, v4);
  if (v5 >= (double)+[CLDurianSettings firmwareVersionForAllTagsMetricsBackOff])
  {
    [(CLDurianDeviceManager *)self->_deviceManager submitFirmwareVersionsForOwnedTags];
    *(float *)&double v7 = Current;
    +[CLDurianSettings setLastFirmwareVersionForAllTagsSubmission:v7];
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    id v6 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 68289282;
      v8[1] = 0;
      __int16 v9 = 2082;
      id v10 = "";
      __int16 v11 = 2050;
      double v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian skip submitFirmwareVersionsForOwnedTags\", \"timeSinceLastSubmission\":\"%{public}f\"}", (uint8_t *)v8, 0x1Cu);
    }
  }
}

- (void)setAccelerometerSlopeModeConfiguration:(id)a3 onTag:(id)a4 forClient:(id)a5
{
  id v8 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a4];
  id v9 = [v8 createSetAccelerometerSlopeModeTaskWithConfiguration:a3];
  if (v9)
  {
    [(CLDurianService *)self performTask:v9 forClient:a5 onDevice:v8];
  }
}

- (void)setAccelerometerOrientationModeConfiguration:(id)a3 onTag:(id)a4 forClient:(id)a5
{
  id v8 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a4];
  id v9 = [v8 createSetAccelerometerOrientationModeTaskWithConfiguration:a3];
  if (v9)
  {
    [(CLDurianService *)self performTask:v9 forClient:a5 onDevice:v8];
  }
}

- (void)fetchAccelerometerSlopeModeConfigurationOnTag:(id)a3 forClient:(id)a4
{
  id v6 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a3];
  id v7 = [v6 createFetchAccelerometerSlopeModeTaskWithConfiguration];
  if (v7)
  {
    [(CLDurianService *)self performTask:v7 forClient:a4 onDevice:v6];
  }
}

- (void)fetchAccelerometerOrientationModeConfigurationOnTag:(id)a3 forClient:(id)a4
{
  id v6 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a3];
  id v7 = [v6 createFetchAccelerometerOrientationModeTaskWithConfiguration];
  if (v7)
  {
    [(CLDurianService *)self performTask:v7 forClient:a4 onDevice:v6];
  }
}

- (void)fetchAccelerometerModeOnTag:(id)a3 forClient:(id)a4
{
  id v6 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a3];
  id v7 = [v6 createFetchAccelerometerModeTask];
  if (v7)
  {
    [(CLDurianService *)self performTask:v7 forClient:a4 onDevice:v6];
  }
}

- (void)scanForNearbyOwner
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  objc_super v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    id v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian scanForNearbyOwner\"}", (uint8_t *)v4, 0x12u);
  }
  if (_os_feature_enabled_impl()) {
    [(CLAvengerScannerClient *)self->_scannerClient performTemporaryAggressiveScan];
  }
  else {
    [(CLAvengerScannerServiceProtocol *)self->_avengerScannerProxy performTemporaryAggressiveScan:CLISP_ME_TOKEN];
  }
}

- (void)teardownClient:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  __int16 v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)uint64_t buf = 68289026;
    LOWORD(v58) = 2082;
    *(void *)((char *)&v58 + 2) = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian teardownClient\"}", buf, 0x12u);
  }
  *(void *)uint64_t buf = 0;
  *(void *)&long long v58 = buf;
  *((void *)&v58 + 1) = 0x3052000000;
  id v59 = sub_10017802C;
  id v60 = sub_100177774;
  id v61 = 0;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  taskClientMap = self->_taskClientMap;
  id v61 = v6;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1015EC01C;
  v46[3] = &unk_102331E10;
  v46[5] = self;
  v46[6] = buf;
  v46[4] = a3;
  [(NSMutableDictionary *)taskClientMap enumerateKeysAndObjectsUsingBlock:v46];
  [(NSMutableDictionary *)self->_taskClientMap removeObjectsForKeys:*(void *)(v58 + 40)];
  [(NSMutableDictionary *)self->_pendingTaskMap removeObjectsForKeys:*(void *)(v58 + 40)];

  [(NSMutableSet *)self->_clients removeObject:a3];
  if (self->_activeRangingClient == a3) {
    self->_activeRangingClient = 0;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  roseOnForClientOnDevice = self->_roseOnForClientOnDevice;
  id v9 = [(NSMutableSet *)roseOnForClientOnDevice countByEnumeratingWithState:&v42 objects:v56 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v43;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(roseOnForClientOnDevice);
        }
        double v12 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if ([v12 client] == a3)
        {
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331ED8);
          }
          BOOL v13 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)__int16 v47 = 68289026;
            int v48 = 0;
            __int16 v49 = 2082;
            id v50 = "";
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#durian #rose found a device that client was using where rose may be on\"}", v47, 0x12u);
          }
          id v14 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", [v12 deviceUUID]);
          uint64_t v15 = v14;
          if (v14 && [v14 isRoseInitialized])
          {
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            long long v16 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)__int16 v47 = 68289026;
              int v48 = 0;
              __int16 v49 = 2082;
              id v50 = "";
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #rose client left rose on and is being torn down, turning it off\"}", v47, 0x12u);
              if (qword_102419390 != -1) {
                dispatch_once(&qword_102419390, &stru_102331ED8);
              }
            }
            long long v17 = qword_102419398;
            if (os_signpost_enabled((os_log_t)qword_102419398))
            {
              *(_DWORD *)__int16 v47 = 68289026;
              int v48 = 0;
              __int16 v49 = 2082;
              id v50 = "";
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #rose client left rose on and is being torn down, turning it off", "{\"msg%{public}.0s\":\"#durian #rose client left rose on and is being torn down, turning it off\"}", v47, 0x12u);
            }
            id v18 = [v15 createDeinitRangingTask];
            if (v18) {
              [(CLDurianService *)self performTask:v18 forClient:0 onDevice:v15];
            }
          }
          [(NSMutableSet *)self->_roseOnForClientOnDevice removeObject:v12];
          goto LABEL_32;
        }
      }
      id v9 = [(NSMutableSet *)roseOnForClientOnDevice countByEnumeratingWithState:&v42 objects:v56 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_32:
  id v37 = objc_alloc_init((Class)NSMutableArray);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  firmwareUpdateClientMap = self->_firmwareUpdateClientMap;
  id v20 = [(NSMutableDictionary *)firmwareUpdateClientMap countByEnumeratingWithState:&v38 objects:v55 count:16];
  if (v20)
  {
    uint64_t v22 = *(void *)v39;
    uint64_t v36 = kCLErrorDomainPrivate;
    *(void *)&long long v21 = 68289283;
    long long v35 = v21;
    do
    {
      __int16 v23 = 0;
      do
      {
        if (*(void *)v39 != v22) {
          objc_enumerationMutation(firmwareUpdateClientMap);
        }
        uint64_t v24 = *(void *)(*((void *)&v38 + 1) + 8 * (void)v23);
        if (-[NSMutableDictionary objectForKeyedSubscript:](self->_firmwareUpdateClientMap, "objectForKeyedSubscript:", v24, v35) == a3)
        {
          id v25 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:v24];
          [(NSMutableArray *)self->_devicesUndergoingFirmwareUpdate removeObject:v24];
          [v37 addObject:v24];
          NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
          CFStringRef v54 = sub_101640864(0x2CuLL);
          __int16 v26 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v36, 44, +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1]);
          if ([v25 isAirTag])
          {
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            __int16 v27 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v28 = [[[v25 uuid] description] substringToIndex:8];
              *(_DWORD *)__int16 v47 = v35;
              int v48 = 0;
              __int16 v49 = 2082;
              id v50 = "";
              __int16 v51 = 2113;
              id v52 = v28;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian Stopping firmware update because client disconnected\", \"item\":%{private, location:escape_only}@}", v47, 0x1Cu);
            }
            [v25 abortFirmwareUpdate:v26];
          }
          else if ([v25 isHawkeyeAccessory])
          {
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            id v29 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
            {
              id v30 = [[[v25 uuid] description] substringToIndex:8];
              *(_DWORD *)__int16 v47 = v35;
              int v48 = 0;
              __int16 v49 = 2082;
              id v50 = "";
              __int16 v51 = 2113;
              id v52 = v30;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye Stopping firmware update because client disconnected\", \"item\":%{private, location:escape_only}@}", v47, 0x1Cu);
            }
            [(CLDurianService *)self didFailFirmwareUpdateForDevice:v25 withError:v26];
          }
          else
          {
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            id v31 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_FAULT))
            {
              id v32 = [[[v25 uuid] description] substringToIndex:8];
              *(_DWORD *)__int16 v47 = v35;
              int v48 = 0;
              __int16 v49 = 2082;
              id v50 = "";
              __int16 v51 = 2113;
              id v52 = v32;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye Neither Hawkeye or Apple accessory, doing nothing\", \"item\":%{private, location:escape_only}@}", v47, 0x1Cu);
              if (qword_102419390 != -1) {
                dispatch_once(&qword_102419390, &stru_102331ED8);
              }
            }
            int v33 = qword_102419398;
            if (os_signpost_enabled((os_log_t)qword_102419398))
            {
              id v34 = [[[v25 uuid] description] substringToIndex:8];
              *(_DWORD *)__int16 v47 = v35;
              int v48 = 0;
              __int16 v49 = 2082;
              id v50 = "";
              __int16 v51 = 2113;
              id v52 = v34;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye Neither Hawkeye or Apple accessory, doing nothing", "{\"msg%{public}.0s\":\"#durian #hawkeye Neither Hawkeye or Apple accessory, doing nothing\", \"item\":%{private, location:escape_only}@}", v47, 0x1Cu);
            }
          }
        }
        __int16 v23 = (char *)v23 + 1;
      }
      while (v20 != v23);
      id v20 = [(NSMutableDictionary *)firmwareUpdateClientMap countByEnumeratingWithState:&v38 objects:v55 count:16];
    }
    while (v20);
  }
  [(NSMutableDictionary *)self->_firmwareUpdateClientMap removeObjectsForKeys:v37];
  _Block_object_dispose(buf, 8);
}

- (void)airplaneModeChanged
{
  deviceManager = self->_deviceManager;
  id v3 = [(RadiosPreferences *)self->_radiosPreferences airplaneMode];

  [(CLDurianDeviceManager *)deviceManager setAirplaneModeEnabled:v3];
}

- (void)onAggressiveScanStarted
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 68289026;
    v3[1] = 0;
    __int16 v4 = 2082;
    __int16 v5 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian onAggressiveScanStarted\"}", (uint8_t *)v3, 0x12u);
  }
}

- (void)onAggressiveScanEnded
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    id v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian onAggressiveScanEnded\"}", (uint8_t *)v4, 0x12u);
  }
  [(CLDurianDeviceManager *)self->_deviceManager pruneScanCacheToQuarterHour];
}

- (id)clientIdentifier
{
  return @"CLDurianService";
}

- (void)systemWillSleep:(id)a3
{
}

- (void)systemConnectivity:(id)a3 isConnected:(BOOL)a4
{
}

- (void)systemCoexImpact:(id)a3 toState:(int)a4
{
}

- (void)systemMetricHeartbeat
{
}

- (void)systemWaking:(id)a3 atTime:(double)a4
{
}

- (void)findMyAppDidBackgroundOrExit
{
}

- (void)updateSystemLoiType:(unint64_t)a3 isEntry:(BOOL)a4
{
}

- (void)updateDeviceConnectionState:(id)a3 state:(unint64_t)a4
{
}

- (void)onFirstUnlock
{
}

- (void)onVehicularState
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 68289026;
    int v11 = 0;
    __int16 v12 = 2082;
    BOOL v13 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye #hele requesting discovery scan to speed up proactive maintenance upon connecting to CarPlay or car BT\"}", (uint8_t *)&v10, 0x12u);
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  double v5 = vabdd_f64(Current, self->_carLastScanned);
  unsigned int v6 = [(CLDurianDeviceManager *)self->_deviceManager checkIfAllDevicesLastRecentlyDisconnected];
  unsigned int v7 = v6;
  if (v5 <= 120.0 || (v6 & 1) != 0)
  {
    if (v5 <= 120.0)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
      id v8 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 68289026;
        int v11 = 0;
        __int16 v12 = 2082;
        BOOL v13 = "";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian already attempted scanning within the last 2 mins\"}", (uint8_t *)&v10, 0x12u);
      }
    }
    if (v7)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
      id v9 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 68289026;
        int v11 = 0;
        __int16 v12 = 2082;
        BOOL v13 = "";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian all devices have been last connected within the BOM backstop time period (6 hours)\"}", (uint8_t *)&v10, 0x12u);
      }
    }
  }
  else
  {
    self->_carLastScanned = Current;
    [(CLDurianMetricManager *)self->_metricManager submitCarMaintMetrics:1];
    [(CLDurianService *)self requestDiscoveryScan];
  }
}

- (void)fetchHawkeyeAISProductDataForDevice:(id)a3 forClient:(id)a4
{
  id v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v8 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289539;
    int v14 = 0;
    __int16 v15 = 2082;
    long long v16 = "";
    __int16 v17 = 2113;
    id v18 = [[[v7 uuid] description] substringToIndex:8];
    __int16 v19 = 2114;
    id v20 = [v7 prettyBeaconType];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetch AIS ProductData\", \"item\":%{private, location:escape_only}@, \"type\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  id v9 = [v7 createFetchAISProductDataTask];
  if (v9)
  {
    [(CLDurianService *)self performTask:v9 forClient:a4 onDevice:v7];
  }
  else
  {
    id v10 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    CFStringRef v12 = @"Not supported for this device type";
    [a4 didFetchHawkeyeAISProductDataFromDevice:a3 productData:[NSData data] error:[v10 initWithDomain:kCLErrorDomainPrivate code:6 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)]];
  }
}

- (void)fetchHawkeyeAISManufacturerNameForDevice:(id)a3 forClient:(id)a4
{
  id v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v8 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289539;
    int v14 = 0;
    __int16 v15 = 2082;
    long long v16 = "";
    __int16 v17 = 2113;
    id v18 = [[[v7 uuid] description] substringToIndex:8];
    __int16 v19 = 2114;
    id v20 = [v7 prettyBeaconType];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetch AIS ManufacturerName\", \"item\":%{private, location:escape_only}@, \"type\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  id v9 = [v7 createFetchAISManufacturerNameTask];
  if (v9)
  {
    [(CLDurianService *)self performTask:v9 forClient:a4 onDevice:v7];
  }
  else
  {
    id v10 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    CFStringRef v12 = @"Not supported for this device type";
    [a4 didFetchHawkeyeAISManufacturerNameFromDevice:a3 manufacturerName:&stru_10234F018 error:[v10 initWithDomain:kCLErrorDomainPrivate code:6 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)]];
  }
}

- (void)fetchHawkeyeAISModelNameForDevice:(id)a3 forClient:(id)a4
{
  id v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v8 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289539;
    int v14 = 0;
    __int16 v15 = 2082;
    long long v16 = "";
    __int16 v17 = 2113;
    id v18 = [[[v7 uuid] description] substringToIndex:8];
    __int16 v19 = 2114;
    id v20 = [v7 prettyBeaconType];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetch AIS ModelName\", \"item\":%{private, location:escape_only}@, \"type\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  id v9 = [v7 createFetchAISModelNameTask];
  if (v9)
  {
    [(CLDurianService *)self performTask:v9 forClient:a4 onDevice:v7];
  }
  else
  {
    id v10 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    CFStringRef v12 = @"Not supported for this device type";
    [a4 didFetchHawkeyeAISModelNameFromDevice:a3 modelName:&stru_10234F018 error:[v10 initWithDomain:kCLErrorDomainPrivate code:6 userInfo:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)]]];
  }
}

- (void)fetchHawkeyeAISModelColorCodeForDevice:(id)a3 forClient:(id)a4
{
  id v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v8 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289539;
    int v14 = 0;
    __int16 v15 = 2082;
    long long v16 = "";
    __int16 v17 = 2113;
    id v18 = [[[v7 uuid] description] substringToIndex:8];
    __int16 v19 = 2114;
    id v20 = [v7 prettyBeaconType];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetch AIS ModelColorCode\", \"item\":%{private, location:escape_only}@, \"type\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  id v9 = [v7 createFetchAISModelColorCodeTask];
  if (v9)
  {
    [(CLDurianService *)self performTask:v9 forClient:a4 onDevice:v7];
  }
  else
  {
    id v10 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    CFStringRef v12 = @"Not supported for this device type";
    [a4 didFetchHawkeyeAISModelColorCodeFromDevice:a3 data:[NSData data] error:[v10 initWithDomain:kCLErrorDomainPrivate code:6 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:]]];
  }
}

- (void)fetchHawkeyeAISAccessoryCategoryForDevice:(id)a3 forClient:(id)a4
{
  id v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v8 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289539;
    int v14 = 0;
    __int16 v15 = 2082;
    long long v16 = "";
    __int16 v17 = 2113;
    id v18 = [[[v7 uuid] description] substringToIndex:8];
    __int16 v19 = 2114;
    id v20 = [v7 prettyBeaconType];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetch AIS AccessoryCategory\", \"item\":%{private, location:escape_only}@, \"type\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  id v9 = [v7 createFetchAISAccessoryCategoryTask];
  if (v9)
  {
    [(CLDurianService *)self performTask:v9 forClient:a4 onDevice:v7];
  }
  else
  {
    id v10 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    CFStringRef v12 = @"Not supported for this device type";
    [a4 didFetchHawkeyeAISAccessoryCategoryFromDevice:a3 data:[NSData data] error:[NSError errorWithDomain:kCLErrorDomainPrivate code:6 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)]];
  }
}

- (void)fetchHawkeyeAISAccessoryCapabilitiesForDevice:(id)a3 forClient:(id)a4
{
  id v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v8 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289539;
    int v14 = 0;
    __int16 v15 = 2082;
    long long v16 = "";
    __int16 v17 = 2113;
    id v18 = [[[v7 uuid] description] substringToIndex:8];
    __int16 v19 = 2114;
    id v20 = [v7 prettyBeaconType];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetch AIS AccessoryCapabilities\", \"item\":%{private, location:escape_only}@, \"type\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  id v9 = [v7 createFetchAISAccessoryCapabilitiesTask];
  if (v9)
  {
    [(CLDurianService *)self performTask:v9 forClient:a4 onDevice:v7];
  }
  else
  {
    id v10 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    CFStringRef v12 = @"Not supported for this device type";
    [a4 didFetchHawkeyeAISAccessoryCapabilitiesFromDevice:a3 data:[NSData data] error:[NSError errorWithDomain:kCLErrorDomainPrivate code:6 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)]];
  }
}

- (void)fetchHawkeyeAISFirmwareVersionForDevice:(id)a3 forClient:(id)a4
{
  id v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  id v8 = [v7 createFetchAISFirmwareVersionTask];
  if (v8)
  {
    [(CLDurianService *)self performTask:v8 forClient:a4 onDevice:v7];
  }
  else
  {
    id v9 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    CFStringRef v11 = @"Not supported for this device type";
    [a4 didFetchFirmwareVersion:0 fromTag:a3 withError:[v9 initWithDomain:kCLErrorDomainPrivate code:6 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1)]];
  }
}

- (void)fetchHawkeyeAISFindMyVersionForDevice:(id)a3 forClient:(id)a4
{
  id v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v8 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289539;
    int v14 = 0;
    __int16 v15 = 2082;
    long long v16 = "";
    __int16 v17 = 2113;
    id v18 = [[[v7 uuid] description] substringToIndex:8];
    __int16 v19 = 2114;
    id v20 = [v7 prettyBeaconType];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetch AIS FindMyVersion\", \"item\":%{private, location:escape_only}@, \"type\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  id v9 = [v7 createFetchAISFindMyVersionTask];
  if (v9)
  {
    [(CLDurianService *)self performTask:v9 forClient:a4 onDevice:v7];
  }
  else
  {
    id v10 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    CFStringRef v12 = @"Not supported for this device type";
    [a4 didFetchHawkeyeAISFindMyVersionFromDevice:a3 findMyVersion:0 error:[v10 initWithDomain:kCLErrorDomainPrivate code:6 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)]];
  }
}

- (void)fetchHawkeyeAISBatteryTypeForDevice:(id)a3 forClient:(id)a4
{
  id v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:");
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v8 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289539;
    int v14 = 0;
    __int16 v15 = 2082;
    long long v16 = "";
    __int16 v17 = 2113;
    id v18 = [[[v7 uuid] description] substringToIndex:8];
    __int16 v19 = 2114;
    id v20 = [v7 prettyBeaconType];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetch AIS BatteryType\", \"item\":%{private, location:escape_only}@, \"type\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  id v9 = [v7 createFetchAISBatteryTypeTask];
  if (v9)
  {
    [(CLDurianService *)self performTask:v9 forClient:a4 onDevice:v7];
  }
  else
  {
    id v10 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    CFStringRef v12 = @"Not supported for this device type";
    [a4 didFetchHawkeyeAISBatteryTypeFromDevice:a3 data:[NSData data] error:[v10 initWithDomain:kCLErrorDomainPrivate code:6 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)]];
  }
}

- (void)fetchHawkeyeSerialNumber:(id)a3 forClient:(id)a4
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289283;
    int v11 = 0;
    __int16 v12 = 2082;
    BOOL v13 = "";
    __int16 v14 = 2113;
    id v15 = [[objc_msgSend(a3, "description") substringToIndex:8];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye received fetch serial number request\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  deviceManager = self->_deviceManager;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  _DWORD v9[2] = sub_1015ED884;
  v9[3] = &unk_102331E58;
  v9[4] = self;
  v9[5] = a4;
  v9[6] = a3;
  [(CLDurianDeviceManager *)deviceManager deviceWithUUID:a3 withCompletion:v9];
}

- (void)fetchHawkeyeCurrentPrimaryKey:(id)a3 forClient:(id)a4
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289283;
    int v11 = 0;
    __int16 v12 = 2082;
    BOOL v13 = "";
    __int16 v14 = 2113;
    id v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye received fetch current primary key request\", \"UUID\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  deviceManager = self->_deviceManager;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  _DWORD v9[2] = sub_1015EDB94;
  v9[3] = &unk_102331E58;
  v9[4] = self;
  v9[5] = a4;
  v9[6] = a3;
  [(CLDurianDeviceManager *)deviceManager deviceWithUUID:a3 withCompletion:v9];
}

- (void)fetchHawkeyeiCloudIdentifier:(id)a3 forClient:(id)a4
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289283;
    int v11 = 0;
    __int16 v12 = 2082;
    BOOL v13 = "";
    __int16 v14 = 2113;
    id v15 = [[objc_msgSend(a3, "description") substringToIndex:8];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye received fetch iCloud Identifier request\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  deviceManager = self->_deviceManager;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  _DWORD v9[2] = sub_1015EDEB4;
  v9[3] = &unk_102331E58;
  v9[4] = self;
  v9[5] = a4;
  v9[6] = a3;
  [(CLDurianDeviceManager *)deviceManager deviceWithUUID:a3 withCompletion:v9];
}

- (void)startMonitoringConnectionStateChangeForClient:(id)a3
{
}

- (void)stopMonitoringConnectionStateChangeForClient:(id)a3
{
}

- (void)useLocalFirmwareAssetFromUrl:(id)a3 forProductGroup:(id)a4 forProductNumber:(id)a5 withSandboxExtension:(id)a6 forClient:(id)a7
{
  BOOL v13 = +[NSString stringWithFormat:@"%@%@", a4, a5];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  __int16 v14 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68290306;
    int v53 = 0;
    __int16 v54 = 2082;
    __int16 v55 = "";
    __int16 v56 = 2114;
    id v57 = a3;
    __int16 v58 = 2114;
    id v59 = a4;
    __int16 v60 = 2114;
    id v61 = a5;
    __int16 v62 = 2114;
    id v63 = v13;
    __int16 v64 = 2114;
    id v65 = a6;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Use local firmware asset from\", \"URL\":%{public, location:escape_only}@, \"Product Group\":%{public, location:escape_only}@, \"Product Number\":%{public, location:escape_only}@, \"Product Info\":%{public, location:escape_only}@, \"extension\":%{public, location:escape_only}@}", buf, 0x44u);
  }
  [a6 UTF8String];
  uint64_t v15 = sandbox_extension_consume();
  if (v15 == -1)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    id v28 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v53 = 0;
      __int16 v54 = 2082;
      __int16 v55 = "";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Unable to consume sandbox extension for local firmware asset\"}", buf, 0x12u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
    }
    id v29 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v53 = 0;
      __int16 v54 = 2082;
      __int16 v55 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#hawkeye #firmwareUpdate Unable to consume sandbox extension for local firmware asset", "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Unable to consume sandbox extension for local firmware asset\"}", buf, 0x12u);
    }
    id v30 = objc_alloc((Class)NSError);
    uint64_t v31 = kCLErrorDomainPrivate;
    NSErrorUserInfoKey v50 = NSLocalizedDescriptionKey;
    CFStringRef v51 = @"Unable to consume sandbox extension for local firmware asset";
    id v32 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    int v33 = v30;
    uint64_t v34 = v31;
    uint64_t v35 = 35;
    goto LABEL_45;
  }
  uint64_t v16 = v15;
  __int16 v17 = [(NSURL *)self->_localHawkeyeFirmwareDirectory URLByAppendingPathComponent:+[NSString stringWithFormat:@"%@%@", v13, @".uarp"]];
  if ([+[NSFileManager defaultManager] fileExistsAtPath:[(NSURL *)v17 path]])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    id v18 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v53 = 0;
      __int16 v54 = 2082;
      __int16 v55 = "";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Deleting existing user provided local file for PG/PN\"}", buf, 0x12u);
    }
    id v43 = 0;
    if (![+[NSFileManager defaultManager] removeItemAtPath:[(NSURL *)v17 path] error:&v43])
    {
      [(CLDurianService *)self releaseExtension:v16];
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
      long long v39 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289282;
        int v53 = 0;
        __int16 v54 = 2082;
        __int16 v55 = "";
        __int16 v56 = 2114;
        id v57 = v43;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Failed to delete asset in local cache\", \"errorOut\":%{public, location:escape_only}@}", buf, 0x1Cu);
      }
      id v40 = objc_alloc((Class)NSError);
      uint64_t v41 = kCLErrorDomainPrivate;
      NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
      __int16 v49 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Failed to delete asset in local cache with error: %@", [v43 description]);
      id v32 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      int v33 = v40;
      uint64_t v34 = v41;
      uint64_t v35 = 37;
LABEL_45:
      [a7 didUseLocalFirmwareAssetRequestForProductGroup:a4 andProductNumber:a5 withError:[v33 initWithDomain:v34 code:v35 userInfo:v32]];
      return;
    }
  }
  id v43 = 0;
  if (-[NSFileManager copyItemAtPath:toPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "copyItemAtPath:toPath:error:", [a3 path], -[NSURL path](v17, "path"), &v43))
  {
    [(NSMutableDictionary *)self->_localFirmwareUpdateAssetMap setObject:[(NSURL *)v17 path] forKeyedSubscript:v13];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    __int16 v19 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [[-[NSMutableDictionary objectForKeyedSubscript:](self->_localFirmwareUpdateAssetMap, "objectForKeyedSubscript:", v13) UTF8String];
      *(_DWORD *)uint64_t buf = 68289538;
      int v53 = 0;
      __int16 v54 = 2082;
      __int16 v55 = "";
      __int16 v56 = 2114;
      id v57 = v13;
      __int16 v58 = 2082;
      id v59 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Copied local firmware asset to local cache\", \"Product Info\":%{public, location:escape_only}@, \"local cache file\":%{public, location:escape_only}s}", buf, 0x26u);
    }
    long long v42 = 0;
    long long v21 = +[NSFileManager defaultManager];
    NSFileAttributeKey v44 = NSFilePosixPermissions;
    long long v45 = +[NSNumber numberWithInt:493];
    if (![(NSFileManager *)v21 setAttributes:+[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1] ofItemAtPath:[(NSURL *)v17 path] error:&v42])
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
      uint64_t v22 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
      {
        id v23 = [[self->_localFirmwareUpdateAssetMap objectForKeyedSubscript:v13] UTF8String];
        *(_DWORD *)uint64_t buf = 68289539;
        int v53 = 0;
        __int16 v54 = 2082;
        __int16 v55 = "";
        __int16 v56 = 2081;
        id v57 = v23;
        __int16 v58 = 2113;
        id v59 = v42;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate failed to set attributes\", \"filename\":%{private, location:escape_only}s, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102331ED8);
        }
      }
      uint64_t v24 = qword_102419398;
      if (os_signpost_enabled((os_log_t)qword_102419398))
      {
        id v25 = [[-[NSMutableDictionary objectForKeyedSubscript:](self->_localFirmwareUpdateAssetMap, "objectForKeyedSubscript:", v13) UTF8String];
        *(_DWORD *)uint64_t buf = 68289539;
        int v53 = 0;
        __int16 v54 = 2082;
        __int16 v55 = "";
        __int16 v56 = 2081;
        id v57 = v25;
        __int16 v58 = 2113;
        id v59 = v42;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#hawkeye #firmwareUpdate failed to set attributes", "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate failed to set attributes\", \"filename\":%{private, location:escape_only}s, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
      }
    }
    id v26 = a7;
    id v27 = v42;
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    uint64_t v36 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      int v53 = 0;
      __int16 v54 = 2082;
      __int16 v55 = "";
      __int16 v56 = 2114;
      id v57 = v43;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Failed to copy local firmware asset to local cache\", \"errorOut\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
    id v37 = objc_alloc((Class)NSError);
    uint64_t v38 = kCLErrorDomainPrivate;
    NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
    __int16 v47 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Failed to copy local firmware asset to local cache with error: %@", [v43 description]);
    id v27 = [v37 initWithDomain:v38 code:36 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1)];
    id v26 = a7;
  }
  [v26 didUseLocalFirmwareAssetRequestForProductGroup:a4 andProductNumber:a5 withError:v27];
  [(CLDurianService *)self releaseExtension:v16];
  [(CLDurianService *)self informCoreUarpOfAssetChangeForProductGroup:a4 andProductNumber:a5];
}

- (void)useDefaultFirmwareAssetSourceForProductGroup:(id)a3 andProductNumber:(id)a4 forClient:(id)a5
{
  id v9 = +[NSString stringWithFormat:@"%@%@", a3, a4];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v10 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289794;
    int v18 = 0;
    __int16 v19 = 2082;
    id v20 = "";
    __int16 v21 = 2114;
    id v22 = a3;
    __int16 v23 = 2114;
    id v24 = a4;
    __int16 v25 = 2114;
    id v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Use default firmware asset from\", \"Product Group\":%{public, location:escape_only}@, \"Product Number\":%{public, location:escape_only}@, \"Product Info\":%{public, location:escape_only}@}", buf, 0x30u);
  }
  if ([(NSMutableDictionary *)self->_localFirmwareUpdateAssetMap objectForKeyedSubscript:v9]&& [+[NSFileManager defaultManager](NSFileManager, "defaultManager") fileExistsAtPath:[(NSMutableDictionary *)self->_localFirmwareUpdateAssetMap objectForKeyedSubscript:v9]]&& (id v14 = 0, ![+[NSFileManager defaultManager] removeItemAtPath:[(NSMutableDictionary *)self->_localFirmwareUpdateAssetMap objectForKeyedSubscript:v9] error:&v14]))
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    int v11 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      int v18 = 0;
      __int16 v19 = 2082;
      id v20 = "";
      __int16 v21 = 2114;
      id v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Failed to delete asset in local cache\", \"errorOut\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
    id v12 = objc_alloc((Class)NSError);
    uint64_t v13 = kCLErrorDomainPrivate;
    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    uint64_t v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Failed to delete asset in local cache with error: %@", [v14 description]);
    [a5 didUseDefaultFirmwareAssetRequestForProductGroup:a3 andProductNumber:a4 withError:[v12 initWithDomain:v13 code:37 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1)]];
  }
  else
  {
    [(NSMutableDictionary *)self->_localFirmwareUpdateAssetMap removeObjectForKey:v9];
    [a5 didUseDefaultFirmwareAssetRequestForProductGroup:a3 andProductNumber:a4 withError:0];
    [(CLDurianService *)self informCoreUarpOfAssetChangeForProductGroup:a3 andProductNumber:a4];
  }
}

- (void)fetchWhetherLocalFirmwareAssetIsInUseForProductGroup:(id)a3 andProductNumber:(id)a4 forClient:(id)a5
{
  id v9 = +[NSString stringWithFormat:@"%@%@", a3, a4];
  id v10 = [(NSMutableDictionary *)self->_localFirmwareUpdateAssetMap objectForKeyedSubscript:v9];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  int v11 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = "NO";
    *(_DWORD *)uint64_t buf = 68290050;
    int v14 = 0;
    uint64_t v16 = "";
    __int16 v15 = 2082;
    if (v10) {
      id v12 = "YES";
    }
    __int16 v17 = 2114;
    id v18 = a3;
    __int16 v19 = 2114;
    id v20 = a4;
    __int16 v21 = 2114;
    id v22 = v9;
    __int16 v23 = 2082;
    id v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate check whether local firmware asset is in use for\", \"Product Group\":%{public, location:escape_only}@, \"Product Number\":%{public, location:escape_only}@, \"Product Info\":%{public, location:escape_only}@, \"localAssetInUse\":%{public, location:escape_only}s}", buf, 0x3Au);
  }
  [a5 didFetchWhetherLocalFirmwareAssetIsInUseForProductGroup:a3 andProductNumber:a4 withResult:v10 != 0];
}

- (void)releaseExtension:(int64_t)a3
{
  if (sandbox_extension_release() == -1)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    id v3 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_FAULT))
    {
      int v5 = 68289026;
      int v6 = 0;
      __int16 v7 = 2082;
      id v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Failed to release sandbox extension\"}", (uint8_t *)&v5, 0x12u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
    }
    __int16 v4 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      int v5 = 68289026;
      int v6 = 0;
      __int16 v7 = 2082;
      id v8 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#hawkeye #firmwareUpdate Failed to release sandbox extension", "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Failed to release sandbox extension\"}", (uint8_t *)&v5, 0x12u);
    }
  }
}

- (void)informCoreUarpOfAssetChangeForProductGroup:(id)a3 andProductNumber:(id)a4
{
  id v5 = [(CLDurianService *)self getDevicesForProductGroup:a3 andProductNumber:a4];
  if ([v5 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v26 count:16];
    if (v6)
    {
      id v8 = v6;
      uint64_t v9 = *(void *)v17;
      *(void *)&long long v7 = 68289283;
      long long v15 = v7;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v5);
          }
          int v11 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v10);
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331ED8);
          }
          id v12 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t buf = v15;
            int v21 = 0;
            __int16 v22 = 2082;
            __int16 v23 = "";
            __int16 v24 = 2113;
            __int16 v25 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Restart monitoring for device\", \"Device\":%{private, location:escape_only}@}", buf, 0x1Cu);
          }
          -[CLDurianService stopMonitoringDeviceForFirmwareUpdate:](self, "stopMonitoringDeviceForFirmwareUpdate:", v11, v15);
          if ([v11 beacon])
          {
            [(CLDurianService *)self startMonitoringDeviceForFirmwareUpdate:v11];
          }
          else
          {
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331ED8);
            }
            uint64_t v13 = qword_102419398;
            if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)uint64_t buf = v15;
              int v21 = 0;
              __int16 v22 = 2082;
              __int16 v23 = "";
              __int16 v24 = 2113;
              __int16 v25 = v11;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - Not monitoring device any more, because beacon record seems to not exist\", \"Device\":%{private, location:escape_only}@}", buf, 0x1Cu);
              if (qword_102419390 != -1) {
                dispatch_once(&qword_102419390, &stru_102331ED8);
              }
            }
            int v14 = qword_102419398;
            if (os_signpost_enabled((os_log_t)qword_102419398))
            {
              *(_DWORD *)uint64_t buf = v15;
              int v21 = 0;
              __int16 v22 = 2082;
              __int16 v23 = "";
              __int16 v24 = 2113;
              __int16 v25 = v11;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#hawkeye #firmwareUpdate - Not monitoring device any more, because beacon record seems to not exist", "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - Not monitoring device any more, because beacon record seems to not exist\", \"Device\":%{private, location:escape_only}@}", buf, 0x1Cu);
            }
          }
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v5 countByEnumeratingWithState:&v16 objects:v26 count:16];
      }
      while (v8);
    }
  }
}

- (void)assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4
{
  id v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", [a3 uuid]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_assetIdMap, "setObject:forKeyedSubscript:", a4, [a3 uuid]);
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v8 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289795;
    int v27 = 0;
    __int16 v28 = 2082;
    id v29 = "";
    __int16 v30 = 2113;
    id v31 = a3;
    __int16 v32 = 2113;
    id v33 = a4;
    __int16 v34 = 2081;
    id v35 = [[objc_msgSend(a4, "assetVersion") UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate assetAvailablityUpdateForAccessoryID\", \"Accessory\":%{private, location:escape_only}@, \"AssetID\":%{private, location:escape_only}@, \"AssetVersion\":%{private, location:escape_only}s}", buf, 0x30u);
  }
  if ([a4 downloadStatus] == (id)2
    && [(CLDurianService *)self deviceUndergoingFirmwareUpdate:v7])
  {
    id v9 = objc_alloc((Class)NSError);
    id v10 = [a4 downloadStatus];
    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    [a4 downloadStatus];
    __int16 v25 = +[NSString stringWithUTF8String:UARPAssetDownloadStatusToString()];
    -[CLDurianService didFailFirmwareUpdateForDevice:withError:](self, "didFailFirmwareUpdateForDevice:withError:", v7, [[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1) initWithDomain:@"UARPDownloadFailure" code:v10 userInfo:v9]);
    return;
  }
  id v11 = [a4 updateAvailabilityStatus];
  if (v11 == (id)3)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    long long v17 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v27 = 0;
      __int16 v28 = 2082;
      id v29 = "";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate availability: kUARPFirmwareUpdateAvailabilityStatusOnLocalStorage / kUARPFirmwareUpdateAvailabilityStatusOnDropbox\"}", buf, 0x12u);
    }
    if (![(CLDurianService *)self deviceUndergoingFirmwareUpdate:v7])
    {
      spFirmwareUpdateSession = self->_spFirmwareUpdateSession;
      id v14 = [a3 uuid];
      id v15 = [a4 assetVersion];
      long long v16 = &stru_102331E98;
LABEL_37:
      [(SPFirmwareUpdateSessionProtocol *)spFirmwareUpdateSession updateBeaconUUID:v14 firmwareUpdateState:6 systemVersion:v15 error:0 completion:v16];
      return;
    }
    if (+[CLDurianSettings uarpPacketCaptureEnabled])
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
      long long v18 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289026;
        int v27 = 0;
        __int16 v28 = 2082;
        id v29 = "";
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - going to kick off firmware update, starting UARP Packet Capture\"}", buf, 0x12u);
      }
      [(UARPController *)self->_uarpController startPacketCapture:@"/tmp/com.apple.locationd/hawkeyeUARPPacketCapture.pcap"];
    }
    [(UARPController *)self->_uarpController accessoryReachable:a3];
    [(UARPController *)self->_uarpController stageFirmwareUpdateOnAccessoryList:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", a3, 0) withUserIntent:1];
  }
  else if (v11 == (id)2)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    uint64_t v19 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v27 = 0;
      __int16 v28 = 2082;
      id v29 = "";
      __int16 v30 = 2113;
      id v31 = a3;
      __int16 v32 = 2113;
      id v33 = a4;
      id v20 = "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - Downloading Asset\", \"Accessory\":%{private, location:esc"
            "ape_only}@, \"AssetID\":%{private, location:escape_only}@}";
      int v21 = v19;
      uint32_t v22 = 38;
LABEL_35:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
    }
  }
  else
  {
    if (v11 == (id)1)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
      id v12 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289026;
        int v27 = 0;
        __int16 v28 = 2082;
        id v29 = "";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate availability: kUARPFirmwareUpdateAvailabilityStatusOnAssetServer\"}", buf, 0x12u);
      }
      spFirmwareUpdateSession = self->_spFirmwareUpdateSession;
      id v14 = [a3 uuid];
      id v15 = [a4 assetVersion];
      long long v16 = &stru_102331E78;
      goto LABEL_37;
    }
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    uint64_t v23 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v27 = 0;
      __int16 v28 = 2082;
      id v29 = "";
      id v20 = "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate availability: other\"}";
      int v21 = v23;
      uint32_t v22 = 18;
      goto LABEL_35;
    }
  }
}

- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v8 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289538;
    int v13 = 0;
    __int16 v14 = 2082;
    id v15 = "";
    __int16 v16 = 2050;
    id v17 = [a4 length];
    __int16 v18 = 2114;
    id v19 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - sendMessageToAccessory \", \"UARPMessageLength\":%{public}lu, \"uarpMsg\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1015EFA30;
  block[3] = &unk_10229FF28;
  block[4] = self;
  block[5] = a4;
  block[6] = a3;
  dispatch_async(queue, block);
  return 1;
}

- (void)firmwareUpdateResult:(id)a3 vendorSpecificStatus:(unsigned int)a4 error:(id)a5
{
  id v7 = -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", [a3 uuid]);

  [(CLDurianService *)self didFailFirmwareUpdateForDevice:v7 withError:a5];
}

- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v8 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 68289539;
    v9[1] = 0;
    __int16 v10 = 2082;
    id v11 = "";
    __int16 v12 = 2049;
    unint64_t v13 = a5;
    __int16 v14 = 2049;
    unint64_t v15 = a6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - firmwareStagingProgress\", \"bytesSent\":%{private}lu, \"bytesTotal\":%{private}lu}", (uint8_t *)v9, 0x26u);
  }
}

- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  if (a5)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    id v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      int v14 = 0;
      __int16 v15 = 2082;
      __int16 v16 = "";
      __int16 v17 = 2081;
      uint64_t v18 = UARPFirmwareStagingCompletionStatusToString();
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - firmwareStagingComplete - failed\", \"status\":%{private, location:escape_only}s}", buf, 0x1Cu);
    }
    id v9 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    __int16 v12 = +[NSString stringWithUTF8String:UARPFirmwareStagingCompletionStatusToString()];
    -[CLDurianService didFailFirmwareUpdateForDevice:withError:](self, "didFailFirmwareUpdateForDevice:withError:", -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", [a3 uuid]), [[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1) initWithDomain:@"UARPStagingFailure" code:a5 userInfo:nil]);
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    __int16 v10 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v14 = 0;
      __int16 v15 = 2082;
      __int16 v16 = "";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - firmwareStagingComplete - Success, going to apply new FW\"}", buf, 0x12u);
    }
    [(UARPController *)self->_uarpController applyStagedFirmwareOnAccessoryList:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", a3, 0) withUserIntent:1];
  }
}

- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v7 = -[NSMutableDictionary objectForKeyedSubscript:](self->_assetIdMap, "objectForKeyedSubscript:", [a3 uuid]);
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  id v8 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289283;
    int v15 = 0;
    __int16 v16 = 2082;
    __int16 v17 = "";
    __int16 v18 = 2081;
    uint64_t v19 = UARPFirmwareApplicationStatusToString();
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate - stagedFirmwareApplicationComplete\", \"status\":%{private, location:escape_only}s}", buf, 0x1Cu);
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    id v9 = objc_alloc((Class)NSError);
    unint64_t v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", UARPFirmwareApplicationStatusToString(), NSLocalizedDescriptionKey);
    uint64_t v10 = 1;
    id v11 = [v9 initWithDomain:@"UARPFirmwareApplicationFailure" code:a4 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1)];
    -[CLDurianService didFailFirmwareUpdateForDevice:withError:](self, "didFailFirmwareUpdateForDevice:withError:", -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", [a3 uuid]), v11);
  }
  else
  {
    -[CLDurianService didUpdateFirmwareForDevice:error:](self, "didUpdateFirmwareForDevice:error:", -[CLDurianDeviceManager deviceWithUUID:](self->_deviceManager, "deviceWithUUID:", [a3 uuid]), 0);
    id v11 = 0;
    uint64_t v10 = 2;
  }
  -[SPFirmwareUpdateSessionProtocol updateBeaconUUID:firmwareUpdateState:systemVersion:error:completion:](self->_spFirmwareUpdateSession, "updateBeaconUUID:firmwareUpdateState:systemVersion:error:completion:", [a3 uuid], v10, objc_msgSend(v7, "assetVersion"), v11, &stru_102331EB8);
}

- (id)_convertTASPAdvertisementDeviceTypeToSPBeaconType:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    id v3 = (id *)&SPBeaconTypeNone;
  }
  else {
    id v3 = (id *)*(&off_102331F10 + a3 - 1);
  }
  return *v3;
}

- (void)_attachTAUnknownBeaconToDurianDevice:(id)a3
{
  if ([a3 identifier])
  {
    BOOL v5 = +[CLDurianSettings forceEnablePosh];
    SEL v6 = NSSelectorFromString(@"isPoshAccessory");
    if (a3)
    {
      SEL v7 = v6;
      if (objc_opt_respondsToSelector())
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102331ED8);
        }
        id v8 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 68289283;
          int v18 = 0;
          __int16 v19 = 2082;
          id v20 = "";
          __int16 v21 = 2113;
          id v22 = [[[a3 identifier] description] substringToIndex:8];
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh enabled for TAUnknownBeacon\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
        }
        BOOL v5 = [a3 performSelector:v7] != 0;
      }
    }
    id v9 = -[CLDurianService _convertTASPAdvertisementDeviceTypeToSPBeaconType:](self, "_convertTASPAdvertisementDeviceTypeToSPBeaconType:", [a3 deviceType]);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    uint64_t v10 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [[[a3 identifier] description] substringToIndex:8];
      *(_DWORD *)uint64_t buf = 68289795;
      int v18 = 0;
      __int16 v19 = 2082;
      id v20 = "";
      __int16 v21 = 2113;
      id v22 = v11;
      __int16 v23 = 2114;
      id v24 = v9;
      __int16 v25 = 1025;
      BOOL v26 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian attaching TAUnknownBeacon to CLDurianDevice with beacon type\", \"item\":%{private, location:escape_only}@, \"type\":%{public, location:escape_only}@, \"posh\":%{private}hhd}", buf, 0x2Cu);
    }
    id v12 = -[CLDurianDeviceManager deviceWithUUID:beaconType:isPosh:](self->_deviceManager, "deviceWithUUID:beaconType:isPosh:", [a3 identifier], v9, v5);
    if (![v12 taUnknownBeacon])
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
      unint64_t v13 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [[[a3 identifier] description] substringToIndex:8];
        *(_DWORD *)uint64_t buf = 68289283;
        int v18 = 0;
        __int16 v19 = 2082;
        id v20 = "";
        __int16 v21 = 2113;
        id v22 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian successfully attach TAUnknownBeacon to CLDurianDevice\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
      }
      [v12 setTaUnknownBeacon:a3];
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    int v15 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "#durian received nil uuid when attaching TAUnknownBeacon to CLDurianDevice", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331ED8);
      }
      __int16 v16 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLDurianService _attachTAUnknownBeaconToDurianDevice:]", "%s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
  }
}

- (void)fetchHawkeyeAISProductDataForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  id v7 = [a3 identifier];

  [(CLDurianService *)self fetchHawkeyeAISProductDataForDevice:v7 forClient:a4];
}

- (void)fetchHawkeyeAISManufacturerNameForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  id v7 = [a3 identifier];

  [(CLDurianService *)self fetchHawkeyeAISManufacturerNameForDevice:v7 forClient:a4];
}

- (void)fetchHawkeyeAISModelNameForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  id v7 = [a3 identifier];

  [(CLDurianService *)self fetchHawkeyeAISModelNameForDevice:v7 forClient:a4];
}

- (void)fetchHawkeyeAISAccessoryCategoryForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  id v7 = [a3 identifier];

  [(CLDurianService *)self fetchHawkeyeAISAccessoryCategoryForDevice:v7 forClient:a4];
}

- (void)fetchHawkeyeAISAccessoryCapabilitiesForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  id v7 = [a3 identifier];

  [(CLDurianService *)self fetchHawkeyeAISAccessoryCapabilitiesForDevice:v7 forClient:a4];
}

- (void)fetchHawkeyeAISFirmwareVersionForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  id v7 = [a3 identifier];

  [(CLDurianService *)self fetchHawkeyeAISFirmwareVersionForDevice:v7 forClient:a4];
}

- (void)fetchAISProductDataForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  id v7 = [a3 identifier];

  [(CLDurianService *)self fetchAISProductDataForDevice:v7 forClient:a4];
}

- (void)fetchAISManufacturerNameForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  id v7 = [a3 identifier];

  [(CLDurianService *)self fetchAISManufacturerNameForDevice:v7 forClient:a4];
}

- (void)fetchAISModelNameForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  id v7 = [a3 identifier];

  [(CLDurianService *)self fetchAISModelNameForDevice:v7 forClient:a4];
}

- (void)fetchAISProtocolImplementationForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  id v7 = [a3 identifier];

  [(CLDurianService *)self fetchAISProtocolImplementationForDevice:v7 forClient:a4];
}

- (void)fetchAISAccessoryCapabilitiesForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  id v7 = [a3 identifier];

  [(CLDurianService *)self fetchAISAccessoryCapabilitiesForDevice:v7 forClient:a4];
}

- (void)fetchAISAccessoryCategoryForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  id v7 = [a3 identifier];

  [(CLDurianService *)self fetchAISAccessoryCategoryForDevice:v7 forClient:a4];
}

- (void)fetchAISNetworkIDForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  id v7 = [a3 identifier];

  [(CLDurianService *)self fetchAISNetworkIDForDevice:v7 forClient:a4];
}

- (void)fetchAISFirmwareVersionForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  id v7 = [a3 identifier];

  [(CLDurianService *)self fetchAISFirmwareVersionForDevice:v7 forClient:a4];
}

- (void)fetchAISBatteryTypeForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  id v7 = [a3 identifier];

  [(CLDurianService *)self fetchAISBatteryTypeForDevice:v7 forClient:a4];
}

- (void)fetchAISBatteryLevelForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  id v7 = [a3 identifier];

  [(CLDurianService *)self fetchAISBatteryLevelForDevice:v7 forClient:a4];
}

- (void)fetchAISSerialNumberForTAUnknownBeacon:(id)a3 forClient:(id)a4
{
  -[CLDurianService _attachTAUnknownBeaconToDurianDevice:](self, "_attachTAUnknownBeaconToDurianDevice:");
  id v7 = [a3 identifier];

  [(CLDurianService *)self fetchAISSerialNumberForDevice:v7 forClient:a4];
}

- (void)cleanUpTAUnknownBeaconRecord:(id)a3
{
}

- (void)fetchAISProductDataForDevice:(id)a3 forClient:(id)a4
{
  if (_os_feature_enabled_impl())
  {
    id v7 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a3];
    id v8 = [v7 createFetchAISProductDataTask];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    id v9 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289795;
      int v14 = 0;
      __int16 v15 = 2082;
      __int16 v16 = "";
      __int16 v17 = 2113;
      id v18 = [[objc_msgSend(v7, "description") substringToIndex:8];
      __int16 v19 = 2114;
      id v20 = v7;
      __int16 v21 = 2114;
      id v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getProductData  - durian service\", \"item\":%{private, location:escape_only}@, \"device\":%{public, location:escape_only}@, \"task\":%{public, location:escape_only}@}", buf, 0x30u);
    }
    if (v8)
    {
      [(CLDurianService *)self performTask:v8 forClient:a4 onDevice:v7];
    }
    else
    {
      id v10 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
      CFStringRef v12 = @"Not supported for this device type";
      [a4 didFetchAISProductDataFromDevice:a3 productData:0 error:[v10 initWithDomain:kCLErrorDomainPrivate code:6 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)]];
    }
  }
}

- (void)fetchAISManufacturerNameForDevice:(id)a3 forClient:(id)a4
{
  if (_os_feature_enabled_impl())
  {
    id v7 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a3];
    id v8 = [v7 createFetchAISManufacturerNameTask];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    id v9 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289795;
      int v14 = 0;
      __int16 v15 = 2082;
      __int16 v16 = "";
      __int16 v17 = 2113;
      id v18 = [[[v7 uuid] description] substringToIndex:8];
      __int16 v19 = 2114;
      id v20 = [v7 prettyBeaconType];
      __int16 v21 = 2114;
      id v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh fetch AIS ManufacturerName\", \"item\":%{private, location:escape_only}@, \"type\":%{public, location:escape_only}@, \"task\":%{public, location:escape_only}@}", buf, 0x30u);
    }
    if (v8)
    {
      [(CLDurianService *)self performTask:v8 forClient:a4 onDevice:v7];
    }
    else
    {
      id v10 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
      CFStringRef v12 = @"Not supported for this device type";
      [a4 didFetchAISManufacturerNameFromDevice:a3 manufacturerName:&stru_10234F018 error:[v10 initWithDomain:kCLErrorDomainPrivate code:6 userInfo:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)]]];
    }
  }
}

- (void)fetchAISModelNameForDevice:(id)a3 forClient:(id)a4
{
  if (_os_feature_enabled_impl())
  {
    id v7 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a3];
    id v8 = [v7 createFetchAISModelNameTask];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    id v9 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289795;
      int v14 = 0;
      __int16 v15 = 2082;
      __int16 v16 = "";
      __int16 v17 = 2113;
      id v18 = [[[v7 uuid] description] substringToIndex:8];
      __int16 v19 = 2114;
      id v20 = [v7 prettyBeaconType];
      __int16 v21 = 2114;
      id v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh fetch AIS ModelName\", \"item\":%{private, location:escape_only}@, \"type\":%{public, location:escape_only}@, \"task\":%{public, location:escape_only}@}", buf, 0x30u);
    }
    if (v8)
    {
      [(CLDurianService *)self performTask:v8 forClient:a4 onDevice:v7];
    }
    else
    {
      id v10 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
      CFStringRef v12 = @"Not supported for this device type";
      [a4 didFetchAISModelNameFromDevice:a3 modelName:&stru_10234F018 error:[v10 initWithDomain:kCLErrorDomainPrivate code:6 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)]];
    }
  }
}

- (void)fetchAISProtocolImplementationForDevice:(id)a3 forClient:(id)a4
{
  if (_os_feature_enabled_impl())
  {
    id v7 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a3];
    id v8 = [v7 createFetchAISProtocolImplementationTask];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    id v9 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289538;
      int v14 = 0;
      __int16 v15 = 2082;
      __int16 v16 = "";
      __int16 v17 = 2114;
      id v18 = v7;
      __int16 v19 = 2114;
      id v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getProtocolImplementation - durian service\", \"device\":%{public, location:escape_only}@, \"task\":%{public, location:escape_only}@}", buf, 0x26u);
    }
    if (v8)
    {
      [(CLDurianService *)self performTask:v8 forClient:a4 onDevice:v7];
    }
    else
    {
      id v10 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
      CFStringRef v12 = @"Not supported for this device type";
      [a4 didFetchAISProtocolImplementationFromDevice:a3 protocolImplementation:0x7FFFFFFFLL error:[v10 initWithDomain:kCLErrorDomainPrivate code:6 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)]];
    }
  }
}

- (void)fetchAISAccessoryCategoryForDevice:(id)a3 forClient:(id)a4
{
  if (_os_feature_enabled_impl())
  {
    deviceManager = self->_deviceManager;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    _DWORD v8[2] = sub_1015F1404;
    v8[3] = &unk_102331E58;
    v8[4] = self;
    v8[5] = a4;
    v8[6] = a3;
    [(CLDurianDeviceManager *)deviceManager deviceWithUUID:a3 withCompletion:v8];
  }
}

- (void)fetchAISAccessoryCapabilitiesForDevice:(id)a3 forClient:(id)a4
{
  if (_os_feature_enabled_impl())
  {
    id v7 = [(CLDurianDeviceManager *)self->_deviceManager deviceWithUUID:a3];
    id v8 = [v7 createFetchAISAccessoryCapabilitiesTask];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    id v9 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289795;
      int v14 = 0;
      __int16 v15 = 2082;
      __int16 v16 = "";
      __int16 v17 = 2113;
      id v18 = [[[v7 uuid] description] substringToIndex:8];
      __int16 v19 = 2114;
      id v20 = [v7 prettyBeaconType];
      __int16 v21 = 2114;
      id v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh fetch AIS AccessoryCapabilities\", \"item\":%{private, location:escape_only}@, \"type\":%{public, location:escape_only}@, \"task\":%{public, location:escape_only}@}", buf, 0x30u);
    }
    if (v8)
    {
      [(CLDurianService *)self performTask:v8 forClient:a4 onDevice:v7];
    }
    else
    {
      id v10 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
      CFStringRef v12 = @"Not supported for this device type";
      [a4 didFetchAISAccessoryCapabilitiesFromDevice:a3 data:[NSData data] error:[v10 initWithDomain:kCLErrorDomainPrivate code:6 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:]]];
    }
  }
}

- (void)fetchAISNetworkIDForDevice:(id)a3 forClient:(id)a4
{
  if (_os_feature_enabled_impl())
  {
    deviceManager = self->_deviceManager;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    _DWORD v8[2] = sub_1015F187C;
    v8[3] = &unk_102331E58;
    v8[4] = self;
    v8[5] = a4;
    v8[6] = a3;
    [(CLDurianDeviceManager *)deviceManager deviceWithUUID:a3 withCompletion:v8];
  }
}

- (void)fetchAISFirmwareVersionForDevice:(id)a3 forClient:(id)a4
{
  if (_os_feature_enabled_impl())
  {
    deviceManager = self->_deviceManager;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    _DWORD v8[2] = sub_1015F1ADC;
    v8[3] = &unk_102331E58;
    v8[4] = self;
    v8[5] = a4;
    v8[6] = a3;
    [(CLDurianDeviceManager *)deviceManager deviceWithUUID:a3 withCompletion:v8];
  }
}

- (void)fetchAISBatteryTypeForDevice:(id)a3 forClient:(id)a4
{
  if (_os_feature_enabled_impl())
  {
    deviceManager = self->_deviceManager;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    _DWORD v8[2] = sub_1015F1D3C;
    v8[3] = &unk_102331E58;
    v8[4] = self;
    v8[5] = a4;
    v8[6] = a3;
    [(CLDurianDeviceManager *)deviceManager deviceWithUUID:a3 withCompletion:v8];
  }
}

- (void)fetchAISBatteryLevelForDevice:(id)a3 forClient:(id)a4
{
  if (_os_feature_enabled_impl())
  {
    deviceManager = self->_deviceManager;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    _DWORD v8[2] = sub_1015F1F9C;
    v8[3] = &unk_102331E58;
    v8[4] = self;
    v8[5] = a4;
    v8[6] = a3;
    [(CLDurianDeviceManager *)deviceManager deviceWithUUID:a3 withCompletion:v8];
  }
}

- (void)fetchAISSerialNumberForDevice:(id)a3 forClient:(id)a4
{
  if (_os_feature_enabled_impl())
  {
    deviceManager = self->_deviceManager;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    _DWORD v8[2] = sub_1015F21FC;
    v8[3] = &unk_102331E58;
    v8[4] = self;
    v8[5] = a4;
    v8[6] = a3;
    [(CLDurianDeviceManager *)deviceManager deviceWithUUID:a3 withCompletion:v8];
  }
}

@end