@interface UARPHIDUpdater
+ (id)sharedInstance;
- (BOOL)_queryProperties:(id)a3 accessoryID:(id)a4 goldrestoreQuery:(BOOL)a5;
- (BOOL)applyStagedFirmwareForAccessories:(id)a3;
- (BOOL)queryProperties:(id)a3 accessoryID:(id)a4 goldrestoreQuery:(BOOL)a5;
- (BOOL)registerHIDCallbacksForUARPHIDAccessory:(id)a3;
- (BOOL)registerHIDForAccessory:(id)a3;
- (BOOL)rescindStagedFirmwareForAccessories:(id)a3;
- (BOOL)sendHIDReportToAccessory:(id)a3 forUARPMessage:(id)a4 error:(id *)a5;
- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5;
- (BOOL)unRegisterHIDCallbacksForUARPHIDAccessory:(id)a3;
- (GoldRestoreUARPStatusDelegate)goldRestoreDelegate;
- (NSString)uarpCaptureFileName;
- (OS_dispatch_queue)uarpHIDQueue;
- (OS_os_log)log;
- (UARPHIDUpdater)init;
- (id)copyManagedPrefsValueForKey:(id)a3;
- (id)createAndSaveUARPHIDAccessoryFromService:(unsigned int)a3 identifier:(id)a4;
- (id)createUARPAccessoryFromAccessoryID:(id)a3;
- (id)createUARPAssetIDForAccessoryID:(id)a3;
- (id)getAccessoriesForIdentifier:(id)a3;
- (id)getAccessoryForIORegEntryID:(unint64_t)a3 identifier:(id)a4;
- (id)getContainerIDFromCFPrefsForAccessory:(id)a3;
- (id)getUARPHIDAccessoryForUARPAccessory:(id)a3;
- (id)getUARPHIDAccessoryForUARPAccessoryID:(id)a3;
- (id)matchingDictionaryForIdentifier:(id)a3;
- (id)matchingDictionaryForIdentifier:(id)a3 hardwareID:(UARPHIDHardwareID *)a4;
- (id)matchingDictionaryForVendorID:(id)a3 productID:(id)a4;
- (id)pendingTatsuRequests;
- (id)uuidForAccessoryID:(id)a3;
- (unsigned)getReportSizeForReportUsage:(unsigned int)a3 forAccessory:(id)a4;
- (void)_accessoryTransportNeeded:(id)a3 isNeeded:(BOOL)a4;
- (void)_assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4;
- (void)_assetSolicitationComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5;
- (void)_assetSolicitationProgress:(id)a3 assetID:(id)a4 bytesReceived:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)_firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5;
- (void)_firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)_queryCompleteForAccessory:(id)a3 appleModelNumber:(id)a4 error:(id)a5;
- (void)_queryCompleteForAccessory:(id)a3 firmwareVersion:(id)a4 error:(id)a5;
- (void)_queryCompleteForAccessory:(id)a3 friendlyName:(id)a4 error:(id)a5;
- (void)_queryCompleteForAccessory:(id)a3 hardwareVersion:(id)a4 error:(id)a5;
- (void)_queryCompleteForAccessory:(id)a3 hwFusingType:(id)a4 error:(id)a5;
- (void)_queryCompleteForAccessory:(id)a3 manufacturer:(id)a4 error:(id)a5;
- (void)_queryCompleteForAccessory:(id)a3 modelName:(id)a4 error:(id)a5;
- (void)_queryCompleteForAccessory:(id)a3 serialNumber:(id)a4 error:(id)a5;
- (void)_queryCompleteForAccessory:(id)a3 stagedFirmwareVersion:(id)a4 error:(id)a5;
- (void)_queryCompleteForAccessory:(id)a3 stats:(id)a4 error:(id)a5;
- (void)_queryCompleteForAccessoryID:(id)a3 appleModelNumber:(id)a4 error:(id)a5;
- (void)_queryCompleteForAccessoryID:(id)a3 friendlyName:(id)a4 error:(id)a5;
- (void)_queryCompleteForAccessoryID:(id)a3 hwFusingType:(id)a4 error:(id)a5;
- (void)_solicitDynamicAssetForAccessory:(id)a3 assetID:(id)a4;
- (void)_solicitDynamicAssetMTICForAccessory:(id)a3;
- (void)_solicitDynamicAssetTICSForAccessory:(id)a3;
- (void)_stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4;
- (void)_stagedFirmwareRescindComplete:(id)a3 withStatus:(unint64_t)a4;
- (void)_startUpdateForAccessories:(id)a3 assetID:(id)a4;
- (void)accessoryTransportNeeded:(id)a3 isNeeded:(BOOL)a4;
- (void)allocateController;
- (void)applyStagedAssets:(id)a3;
- (void)assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4;
- (void)assetCheckForProductGroup:(id)a3 productNumber:(id)a4 assetID:(id)a5 options:(unsigned int)a6;
- (void)assetDownloadFailed:(id)a3 assetID:(id)a4;
- (void)assetNotFound:(id)a3 assetID:(id)a4;
- (void)assetOnAssetServer:(id)a3 assetID:(id)a4;
- (void)assetOnDropbox:(id)a3 assetID:(id)a4;
- (void)assetOnLocalStorage:(id)a3 assetID:(id)a4;
- (void)assetSolicitationComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5;
- (void)assetSolicitationProgress:(id)a3 assetID:(id)a4 bytesReceived:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)assetStagingPause:(id)a3;
- (void)assetStagingResume:(id)a3;
- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5;
- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)handleHIDDisconnectForAccessory:(id)a3;
- (void)parseInputReport:(id)a3 forAccessory:(id)a4;
- (void)processUARPMessage:(id)a3 fromAccessory:(id)a4;
- (void)qHoldPowerAssertionForAccessory:(id)a3;
- (void)qPostStagingStatusNotificationForAccessory:(id)a3 status:(unint64_t)a4;
- (void)qReleasePowerAssertionForAccessory:(id)a3;
- (void)queryCompleteForAccessory:(id)a3 appleModelNumber:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 boardID:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 chipID:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 chipRevision:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 ecid:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 enableMixMatch:(BOOL)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 epoch:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 firmwareVersion:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 friendlyName:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 hardwareVersion:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 hwFusingType:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 liveNonce:(BOOL)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 manifestPrefix:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 manufacturer:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 modelName:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 prefixNeedsLUN:(BOOL)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 productionMode:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 securityDomain:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 securityMode:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 serialNumber:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 stagedFirmwareVersion:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 stats:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 suffixNeedsLUN:(BOOL)a4 error:(id)a5;
- (void)queryCompleteForAccessoryID:(id)a3 appleModelNumber:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessoryID:(id)a3 friendlyName:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessoryID:(id)a3 hwFusingType:(id)a4 error:(id)a5;
- (void)queryFailedForAccessory:(id)a3 property:(unint64_t)a4 error:(int64_t)a5;
- (void)queryPropertiesForUARPHIDAccessory:(id)a3 completionCallback:(id)a4;
- (void)removeAccessoryID:(id)a3;
- (void)runHIDRegistrationThread:(id)a3;
- (void)scheduleHIDDeviceForAccessory:(id)a3;
- (void)setGoldRestoreDelegate:(id)a3;
- (void)setLog:(id)a3;
- (void)setUarpCaptureFileName:(id)a3;
- (void)setUarpHIDQueue:(id)a3;
- (void)solicitDynamicAssetForAccessories:(id)a3 assetID:(id)a4;
- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4;
- (void)stagedFirmwareRescindComplete:(id)a3 withStatus:(unint64_t)a4;
- (void)startTapToRadar:(id)a3;
- (void)startUpdateForAccessories:(id)a3 assetID:(id)a4;
- (void)stopHIDRegistrationThread;
- (void)stopPacketCapture;
- (void)stopTapToRadar;
- (void)tssResponse:(id)a3;
- (void)unScheduleHIDDeviceForAccessory:(id)a3;
- (void)unsolicitedDynamicAssetForAccessories:(id)a3 assetTag:(id)a4;
@end

@implementation UARPHIDUpdater

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001A38;
  block[3] = &unk_100028520;
  block[4] = a1;
  if (qword_10002F938 != -1) {
    dispatch_once(&qword_10002F938, block);
  }
  v2 = (void *)qword_10002F930;
  return v2;
}

- (UARPHIDUpdater)init
{
  v18.receiver = self;
  v18.super_class = (Class)UARPHIDUpdater;
  v2 = [(UARPHIDUpdater *)&v18 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    uarpHIDAccessories = v2->_uarpHIDAccessories;
    v2->_uarpHIDAccessories = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.accessoryupdater.uarpOverHID.queue", 0);
    uarpHIDQueue = v2->_uarpHIDQueue;
    v2->_uarpHIDQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.accessoryupdater.uarpOverHID.delegate_queue", 0);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = (OS_dispatch_queue *)v7;

    os_log_t v9 = os_log_create("com.apple.accessoryupdater.uarp", "hidUpdater");
    log = v2->_log;
    v2->_log = (OS_os_log *)v9;

    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    uarpHIDRegistrationThreadSemaphore = v2->_uarpHIDRegistrationThreadSemaphore;
    v2->_uarpHIDRegistrationThreadSemaphore = (OS_dispatch_semaphore *)v11;

    v13 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.UARPHIDUpdater.database"];
    database = v2->_database;
    v2->_database = v13;

    v2->_sessionID = 1;
    v2->_unregisterOnComplete = 1;
    v2->_powerAssertionID = 0;
    v2->_powerAssertionRefCount = 0;
    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    stagingStatusNotificationTokens = v2->_stagingStatusNotificationTokens;
    v2->_stagingStatusNotificationTokens = v15;
  }
  return v2;
}

- (id)getAccessoriesForIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = +[NSMutableArray array];
  v6 = +[UARPSupportedAccessory supportedAccessoriesByTransport:1];
  uarpHIDQueue = self->_uarpHIDQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100001CA8;
  v14[3] = &unk_100028548;
  id v15 = v6;
  id v16 = v4;
  v17 = self;
  id v8 = v5;
  id v18 = v8;
  id v9 = v4;
  id v10 = v6;
  dispatch_sync(uarpHIDQueue, v14);
  dispatch_semaphore_t v11 = v18;
  id v12 = v8;

  return v12;
}

- (id)getAccessoryForIORegEntryID:(unint64_t)a3 identifier:(id)a4
{
  id v6 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_100002148;
  v23 = sub_100002158;
  id v24 = 0;
  uarpHIDQueue = self->_uarpHIDQueue;
  dispatch_semaphore_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_100002160;
  v14 = &unk_100028570;
  v17 = &v19;
  unint64_t v18 = a3;
  id v15 = self;
  id v8 = v6;
  id v16 = v8;
  dispatch_sync(uarpHIDQueue, &v11);
  id v9 = objc_msgSend((id)v20[5], "uarpAccessoryID", v11, v12, v13, v14, v15);

  _Block_object_dispose(&v19, 8);
  return v9;
}

- (void)setUarpCaptureFileName:(id)a3
{
  id v4 = a3;
  uarpHIDQueue = self->_uarpHIDQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100002274;
  v7[3] = &unk_100028598;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(uarpHIDQueue, v7);
}

- (NSString)uarpCaptureFileName
{
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100002148;
  id v10 = sub_100002158;
  id v11 = 0;
  uarpHIDQueue = self->_uarpHIDQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000023D8;
  v5[3] = &unk_1000285C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(uarpHIDQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)allocateController
{
  if (!self->_uarpController)
  {
    id v3 = (UARPController *)objc_alloc_init((Class)UARPController);
    uarpController = self->_uarpController;
    self->_uarpController = v3;

    [(UARPController *)self->_uarpController setDelegate:self];
    [(UARPController *)self->_uarpController setChipInfoDelegate:self];
    if (self->_uarpCaptureFileName) {
      -[UARPController startPacketCapture:](self->_uarpController, "startPacketCapture:");
    }
    dispatch_queue_t v5 = +[UARPHIDUpdaterPreferences sharedPrefs];
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = [v5 powerLogStagingWindowSecondsOverride];
      if (v7)
      {
        id v8 = v7;
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          v10[0] = 67109120;
          v10[1] = v8;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Overriding power log staging update interval to %u s", (uint8_t *)v10, 8u);
        }
        [(UARPController *)self->_uarpController setPowerLogStagingWindowPeriodSeconds:v8];
      }
    }
  }
}

- (void)startUpdateForAccessories:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v17[0] = 0;
        v17[1] = v17;
        v17[2] = 0x3032000000;
        v17[3] = sub_100002148;
        v17[4] = sub_100002158;
        id v18 = 0;
        uarpHIDQueue = self->_uarpHIDQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000026EC;
        block[3] = &unk_100028610;
        id v16 = v17;
        block[4] = self;
        void block[5] = v12;
        id v15 = v7;
        dispatch_sync(uarpHIDQueue, block);

        _Block_object_dispose(v17, 8);
      }
      id v9 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
}

- (void)qPostStagingStatusNotificationForAccessory:(id)a3 status:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 getID];
  id v8 = [v7 modelIdentifier];

  id v9 = +[UARPSupportedAccessory findByAppleModelNumber:v8];
  if ([v9 postStagingNotifications])
  {
    stagingStatusNotificationTokens = self->_stagingStatusNotificationTokens;
    id v11 = [v6 getID];
    uint64_t v12 = [(NSMutableDictionary *)stagingStatusNotificationTokens objectForKeyedSubscript:v11];

    if (v12)
    {
      notify_cancel((int)[v12 intValue]);
      v13 = self->_stagingStatusNotificationTokens;
      v14 = [v6 getID];
      [(NSMutableDictionary *)v13 removeObjectForKey:v14];
    }
    uint64_t v15 = postStagingStatusForModelIdentifier();
    if (v15 == -1)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        sub_10001C16C();
      }
    }
    else if (a4)
    {
      id v16 = +[NSNumber numberWithInt:v15];
      v17 = self->_stagingStatusNotificationTokens;
      id v18 = [v6 getID];
      [(NSMutableDictionary *)v17 setObject:v16 forKeyedSubscript:v18];
    }
    else
    {
      notify_cancel(v15);
    }
  }
}

- (void)qHoldPowerAssertionForAccessory:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [v4 modelNumber];
  id v6 = +[UARPSupportedAccessory findByAppleModelNumber:v5];

  if ([v6 updateRequiresPowerAssertion])
  {
    if (self->_powerAssertionID)
    {
      ++self->_powerAssertionRefCount;
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        int powerAssertionRefCount = self->_powerAssertionRefCount;
        *(_DWORD *)buf = 138412546;
        id v12 = v4;
        __int16 v13 = 1024;
        int v14 = powerAssertionRefCount;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Already holding power assertion for %@ refCount=%u", buf, 0x12u);
      }
    }
    else
    {
      *(_DWORD *)buf = 0;
      id v9 = [v6 hardwareID];
      [v9 transport];
      uint64_t v10 = +[NSString stringWithFormat:@"com.apple.UARPPowerAssertion-%s", UARPAccessoryTransportToString()];

      if (createPowerAssertion())
      {
        self->_powerAssertionID = *(_DWORD *)buf;
        ++self->_powerAssertionRefCount;
      }
      else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      {
        sub_10001C1D4();
      }
    }
  }
}

- (void)qReleasePowerAssertionForAccessory:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [v4 modelNumber];
  id v6 = +[UARPSupportedAccessory findByAppleModelNumber:v5];

  if ([v6 updateRequiresPowerAssertion])
  {
    if (self->_powerAssertionID)
    {
      if (self->_powerAssertionRefCount)
      {
        unsigned __int8 powerAssertionRefCount = self->_powerAssertionRefCount - 1;
        self->_unsigned __int8 powerAssertionRefCount = powerAssertionRefCount;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
          sub_10001C30C();
        }
        unsigned __int8 powerAssertionRefCount = self->_powerAssertionRefCount;
      }
      if (!powerAssertionRefCount)
      {
        char v8 = releasePowerAssertion();
        self->_powerAssertionID = 0;
        if ((v8 & 1) == 0 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
          sub_10001C2A4();
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_10001C23C();
    }
  }
}

- (void)_startUpdateForAccessories:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(UARPHIDUpdater *)self allocateController];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v33 objects:v41 count:16];
  v32 = v7;
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        __int16 v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        int v14 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessoryID:v13];
        if (!v14)
        {
          log = self->_log;
          if (!os_log_type_enabled(log, OS_LOG_TYPE_INFO)) {
            goto LABEL_21;
          }
          *(_DWORD *)buf = 136315394;
          v38 = "-[UARPHIDUpdater _startUpdateForAccessories:assetID:]";
          __int16 v39 = 2112;
          v40 = v13;
          v29 = log;
          v30 = "%s: Unknown UARPAccessoryID %@, dropping it";
LABEL_18:
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, v30, buf, 0x16u);
          goto LABEL_21;
        }
        if (![(UARPHIDUpdater *)self registerHIDCallbacksForUARPHIDAccessory:v14])
        {
          v31 = self->_log;
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
            goto LABEL_21;
          }
          *(_DWORD *)buf = 136315394;
          v38 = "-[UARPHIDUpdater _startUpdateForAccessories:assetID:]";
          __int16 v39 = 2112;
          v40 = v14;
          v29 = v31;
          v30 = "%s: Failed to register for HID Callbacks for %@, dropping it";
          goto LABEL_18;
        }
        uint64_t v15 = [v14 uarpAccessory];

        if (!v15)
        {
          id v16 = [v14 uarpAccessoryID];
          v17 = [(UARPHIDUpdater *)self createUARPAccessoryFromAccessoryID:v16];
          [v14 setUarpAccessory:v17];

          id v18 = [v14 uarpAccessory];
          [v18 setDownloadOnCellularAllowed:0];

          long long v19 = [v14 uarpAccessory];
          [v19 setAutoDownloadAllowed:0];

          long long v20 = [v14 uarpAccessory];
          [v20 setTransport:1];

          id v21 = [v13 capability];
          long long v22 = [v14 uarpAccessory];
          [v22 setCapability:v21];
        }
        [v14 setUpdateInProgress:1];
        v23 = +[NSDate distantPast];
        [v14 setLastReportedStagingTime:v23];

        id v24 = [v14 uarpAccessory];
        [(UARPHIDUpdater *)self qHoldPowerAssertionForAccessory:v24];

        if (!v7)
        {
          id v7 = [(UARPHIDUpdater *)self createUARPAssetIDForAccessoryID:v14];
        }
        unsigned __int8 v25 = [v7 isDynamicAsset];
        uarpController = self->_uarpController;
        v27 = [v14 uarpAccessory];
        if (v25) {
          [(UARPController *)uarpController dynamicAssetAvailableForAccessory:v27 assetID:v7 error:0];
        }
        else {
          [(UARPController *)uarpController changeAssetLocation:v27 assetID:v7];
        }

LABEL_21:
      }
      id v10 = [v8 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v10);
  }
}

- (id)getContainerIDFromCFPrefsForAccessory:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [v4 vendorID];
  id v6 = [v5 unsignedIntegerValue];
  id v7 = [v4 productID];

  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"vid0x%04lXpid0x%04lX", v6, [v7 unsignedIntegerValue]);
  id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  id v9 = (id)CFPreferencesCopyAppValue(v8, @"com.apple.UARPUpdaterServiceHID");
  if (!v9)
  {
    id v10 = [(UARPHIDUpdater *)self copyManagedPrefsValueForKey:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v15 = "-[UARPHIDUpdater getContainerIDFromCFPrefsForAccessory:]";
        __int16 v16 = 2112;
        v17 = v8;
        __int16 v18 = 2112;
        id v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: ContainerID found in managed prefs for %@: %@", buf, 0x20u);
      }
      id v9 = v10;
    }
    else
    {
      id v9 = 0;
    }
  }
  id v12 = self->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v15 = "-[UARPHIDUpdater getContainerIDFromCFPrefsForAccessory:]";
    __int16 v16 = 2112;
    v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s: ContainerID override found for %@: %@", buf, 0x20u);
  }

  return v9;
}

- (id)copyManagedPrefsValueForKey:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = +[NSURL fileURLWithPath:@"/Library/Managed Preferences/mobile/com.apple.UARPUpdaterServiceHID.plist"];
  id v6 = 0;
  if ([v5 checkResourceIsReachableAndReturnError:0])
  {
    id v11 = 0;
    id v7 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v5 error:&v11];
    id v8 = v11;
    if (v7)
    {
      id v9 = [v7 objectForKeyedSubscript:v4];
      id v6 = [v9 copy];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        sub_10001C374();
      }
      id v6 = 0;
    }
  }
  return v6;
}

- (id)createUARPAssetIDForAccessoryID:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [v4 uarpAccessoryID];
  uint64_t v6 = [v5 productGroup];
  if (!v6)
  {

    goto LABEL_8;
  }
  id v7 = (void *)v6;
  id v8 = [v4 uarpAccessoryID];
  id v9 = [v8 productNumber];

  if (!v9)
  {
LABEL_8:
    uint64_t v11 = 3;
    goto LABEL_13;
  }
  id v10 = [(UARPHIDUpdater *)self getContainerIDFromCFPrefsForAccessory:v4];
  if (MGGetBoolAnswer())
  {
    if (v10 && ([v10 isEqualToString:@"UARPiCloudPublicContainer"] & 1) == 0)
    {
      if ([v10 isEqualToString:@"UARPiCloudStagingContainer"])
      {
        uint64_t v11 = 2;
      }
      else if ([v10 isEqualToString:@"UARPiCloudPublicContainerBeta"])
      {
        uint64_t v11 = 7;
      }
      else if ([v10 isEqualToString:@"UARPiCloudStagingContainerBeta"])
      {
        uint64_t v11 = 8;
      }
      else if ([v10 isEqualToString:@"UARPiCloudPublicContainerUAT"])
      {
        uint64_t v11 = 5;
      }
      else if ([v10 isEqualToString:@"UARPiCloudStagingContainerUAT"])
      {
        uint64_t v11 = 6;
      }
      else
      {
        log = self->_log;
        uint64_t v11 = 1;
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          int v15 = 136315138;
          __int16 v16 = "-[UARPHIDUpdater createUARPAssetIDForAccessoryID:]";
          uint64_t v11 = 1;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: Unsupported containerID in defaults write, pointing to Production Container by default", (uint8_t *)&v15, 0xCu);
        }
      }
    }
    else
    {
      uint64_t v11 = 1;
    }
  }
  else if ([v10 isEqualToString:@"UARPiCloudStagingContainer"])
  {
    uint64_t v11 = 2;
  }
  else
  {
    uint64_t v11 = 1;
  }

LABEL_13:
  id v12 = [objc_alloc((Class)UARPAssetID) initWithLocationType:v11 remoteURL:0];

  return v12;
}

- (BOOL)_queryProperties:(id)a3 accessoryID:(id)a4 goldrestoreQuery:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v38 = 136315394;
    __int16 v39 = "-[UARPHIDUpdater _queryProperties:accessoryID:goldrestoreQuery:]";
    __int16 v40 = 2112;
    id v41 = v8;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: properties %@", (uint8_t *)&v38, 0x16u);
  }
  [(UARPHIDUpdater *)self allocateController];
  uint64_t v11 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessoryID:v9];
  if (!v11)
  {
    id v21 = self->_log;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v38 = 136315394;
      __int16 v39 = "-[UARPHIDUpdater _queryProperties:accessoryID:goldrestoreQuery:]";
      __int16 v40 = 2112;
      id v41 = v9;
      long long v22 = "%s: Unknown UARPAccessoryID %@";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v22, (uint8_t *)&v38, 0x16u);
    }
LABEL_14:
    BOOL v23 = 0;
    goto LABEL_20;
  }
  if (![(UARPHIDUpdater *)self registerHIDCallbacksForUARPHIDAccessory:v11])
  {
    id v21 = self->_log;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v38 = 136315394;
      __int16 v39 = "-[UARPHIDUpdater _queryProperties:accessoryID:goldrestoreQuery:]";
      __int16 v40 = 2112;
      id v41 = v11;
      long long v22 = "%s: Failed to register for HID Callbacks for %@";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  id v12 = [v11 uarpAccessory];

  if (!v12)
  {
    uint64_t v13 = [v9 productGroup];
    if (v13
      && (int v14 = (void *)v13,
          [v9 productNumber],
          int v15 = objc_claimAutoreleasedReturnValue(),
          v15,
          v14,
          v15))
    {
      id v16 = objc_alloc((Class)UARPAccessory);
      v17 = [v9 productGroup];
      __int16 v18 = [v9 productNumber];
      id v19 = +[NSUUID UUID];
      id v20 = [v16 initWithProductGroup:v17 productNumber:v18 uuid:v19];
      [v11 setUarpAccessory:v20];
    }
    else
    {
      v17 = [(UARPHIDUpdater *)self createUARPAccessoryFromAccessoryID:v9];
      [v11 setUarpAccessory:v17];
    }

    id v24 = [v11 uarpAccessory];
    [v24 setDownloadOnCellularAllowed:0];

    unsigned __int8 v25 = [v11 uarpAccessory];
    [v25 setAutoDownloadAllowed:0];

    v26 = [v11 uarpAccessory];
    [v26 setTransport:1];

    id v27 = [v9 capability];
    v28 = [v11 uarpAccessory];
    [v28 setCapability:v27];

    id v29 = [v9 suppressAutomaticDynamicAssets];
    v30 = [v11 uarpAccessory];
    [v30 setSuppressAutomaticDynamicAssets:v29];

    id v31 = [v9 suppressInfoQueries];
    v32 = [v11 uarpAccessory];
    [v32 setSuppressInfoQueries:v31];

    uarpController = self->_uarpController;
    long long v34 = [v11 uarpAccessory];
    [(UARPController *)uarpController addAccessory:v34 assetID:0];

    long long v35 = self->_uarpController;
    long long v36 = [v11 uarpAccessory];
    [(UARPController *)v35 accessoryReachable:v36];
  }
  if (v5) {
    [v11 setGoldrestoreQueryInProgress:1];
  }
  [v11 proceedWithUpdate];
  BOOL v23 = 1;
LABEL_20:

  return v23;
}

- (BOOL)queryProperties:(id)a3 accessoryID:(id)a4 goldrestoreQuery:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003B34;
  block[3] = &unk_100028638;
  block[4] = self;
  id v15 = v8;
  id v16 = v9;
  v17 = &v19;
  BOOL v18 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(uarpHIDQueue, block);
  LOBYTE(uarpHIDQueue) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)uarpHIDQueue;
}

- (void)queryFailedForAccessory:(id)a3 property:(unint64_t)a4 error:(int64_t)a5
{
  id v11 = a3;
  id v8 = +[NSError errorWithDomain:kUARPErrorDomain code:a5 userInfo:0];
  switch(a4)
  {
    case 0uLL:
      id v9 = [v11 uarpAccessory];
      [(UARPHIDUpdater *)self _queryCompleteForAccessory:v9 manufacturer:0 error:v8];
      goto LABEL_12;
    case 1uLL:
      id v9 = [v11 uarpAccessory];
      [(UARPHIDUpdater *)self _queryCompleteForAccessory:v9 modelName:0 error:v8];
      goto LABEL_12;
    case 2uLL:
      id v9 = [v11 uarpAccessory];
      [(UARPHIDUpdater *)self _queryCompleteForAccessory:v9 serialNumber:0 error:v8];
      goto LABEL_12;
    case 3uLL:
      id v9 = [v11 uarpAccessory];
      [(UARPHIDUpdater *)self _queryCompleteForAccessory:v9 hardwareVersion:0 error:v8];
      goto LABEL_12;
    case 4uLL:
      id v9 = [v11 uarpAccessory];
      [(UARPHIDUpdater *)self _queryCompleteForAccessory:v9 firmwareVersion:0 error:v8];
      goto LABEL_12;
    case 5uLL:
      id v9 = [v11 uarpAccessory];
      [(UARPHIDUpdater *)self _queryCompleteForAccessory:v9 stagedFirmwareVersion:0 error:v8];
      goto LABEL_12;
    case 6uLL:
      id v9 = [v11 uarpAccessory];
      [(UARPHIDUpdater *)self _queryCompleteForAccessory:v9 stats:0 error:v8];
      goto LABEL_12;
    case 0xBuLL:
      id v9 = [v11 uarpAccessory];
      [(UARPHIDUpdater *)self _queryCompleteForAccessory:v9 appleModelNumber:0 error:v8];
      goto LABEL_12;
    case 0xCuLL:
      id v10 = [v11 uarpAccessory];
      [(UARPHIDUpdater *)self _queryCompleteForAccessory:v10 hwFusingType:0 error:v8];

      goto LABEL_11;
    case 0xDuLL:
LABEL_11:
      id v9 = [v11 uarpAccessory];
      [(UARPHIDUpdater *)self _queryCompleteForAccessory:v9 friendlyName:0 error:v8];
LABEL_12:

      break;
    default:
      break;
  }
}

- (BOOL)applyStagedFirmwareForAccessories:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003EB0;
  block[3] = &unk_100028660;
  block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(uarpHIDQueue, block);
  LOBYTE(uarpHIDQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)uarpHIDQueue;
}

- (BOOL)rescindStagedFirmwareForAccessories:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000042A8;
  block[3] = &unk_100028660;
  block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(uarpHIDQueue, block);
  LOBYTE(uarpHIDQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)uarpHIDQueue;
}

- (void)assetCheckForProductGroup:(id)a3 productNumber:(id)a4 assetID:(id)a5 options:(unsigned int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000046C8;
  block[3] = &unk_100028688;
  unsigned int v21 = a6;
  block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_sync(uarpHIDQueue, block);
}

- (void)unsolicitedDynamicAssetForAccessories:(id)a3 assetTag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000048A8;
  block[3] = &unk_1000286B0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(uarpHIDQueue, block);
}

- (void)_solicitDynamicAssetTICSForAccessory:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 modelNumber];
  id v6 = +[UARPSupportedAccessory findByAppleModelNumber:v5];

  unsigned __int8 v7 = [v6 supportsAnalytics];
  log = self->_log;
  BOOL v9 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Solicit TICS for HID <%@>", (uint8_t *)&v14, 0xCu);
    }
    id v10 = (char *)uarpAssetTagStructAnalytics();
    id v11 = [objc_alloc((Class)UARPAssetTag) initWithChar1:*v10 char2:v10[1] char3:v10[2] char4:v10[3]];
    id v12 = uarpDynamicAssetURL();
    id v13 = [objc_alloc((Class)UARPAssetID) initWithLocationType:10 assetTag:v11 url:v12];
    [(UARPHIDUpdater *)self _solicitDynamicAssetForAccessory:v4 assetID:v13];
  }
  else if (v9)
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "HID Accessory does not support TICS <%@>", (uint8_t *)&v14, 0xCu);
  }
}

- (void)_solicitDynamicAssetMTICForAccessory:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 modelNumber];
  id v6 = +[UARPSupportedAccessory findByAppleModelNumber:v5];

  unsigned __int8 v7 = [v6 supportsMappedAnalytics];
  log = self->_log;
  BOOL v9 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Solicit MTIC for HID <%@>", (uint8_t *)&v14, 0xCu);
    }
    id v10 = (char *)uarpAssetTagStructMappedAnalytics();
    id v11 = [objc_alloc((Class)UARPAssetTag) initWithChar1:*v10 char2:v10[1] char3:v10[2] char4:v10[3]];
    id v12 = uarpDynamicAssetURL();
    id v13 = [objc_alloc((Class)UARPAssetID) initWithLocationType:10 assetTag:v11 url:v12];
    [(UARPHIDUpdater *)self _solicitDynamicAssetForAccessory:v4 assetID:v13];
  }
  else if (v9)
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "HID Accessory does not support MTIC <%@>", (uint8_t *)&v14, 0xCu);
  }
}

- (void)_solicitDynamicAssetForAccessory:(id)a3 assetID:(id)a4
{
  id v6 = (char *)a3;
  unsigned __int8 v7 = (char *)a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Solicit Dynamic Asset HID <%@> assetID <%@>", (uint8_t *)&v14, 0x16u);
  }
  BOOL v9 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessory:v6];
  id v10 = v9;
  if (v9)
  {
    uarpController = self->_uarpController;
    id v12 = [v9 uarpAccessory];
    [(UARPController *)uarpController solicitDynamicAsset:v12 assetID:v7];
  }
  else
  {
    id v13 = self->_log;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315394;
      id v15 = "-[UARPHIDUpdater _solicitDynamicAssetForAccessory:assetID:]";
      __int16 v16 = 2112;
      v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s: Unknown UARPAccessory %@, dropping it", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)_assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = log;
    id v10 = [v6 availableFirmwareVersion];
    int v13 = 136315906;
    int v14 = "-[UARPHIDUpdater _assetAvailablityUpdateForAccessoryID:assetID:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s: accessory = %@, available version = %@, assetID = %@", (uint8_t *)&v13, 0x2Au);
  }
  id v11 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessory:v6];
  if (v11)
  {
    if ([v7 downloadStatus] == (id)2)
    {
      [(UARPHIDUpdater *)self assetDownloadFailed:v11 assetID:v7];
    }
    else if ([v7 updateAvailabilityStatus] == (id)1)
    {
      [(UARPHIDUpdater *)self assetOnAssetServer:v11 assetID:v7];
    }
    else if ([v7 updateAvailabilityStatus] == (id)3)
    {
      [(UARPHIDUpdater *)self assetOnLocalStorage:v11 assetID:v7];
    }
    else if ([v7 updateAvailabilityStatus] == (id)4)
    {
      [(UARPHIDUpdater *)self assetOnDropbox:v11 assetID:v7];
    }
    else if ([v7 updateAvailabilityStatus] == (id)6 {
           || [v7 updateAvailabilityStatus] == (id)7)
    }
    {
      [(UARPHIDUpdater *)self assetNotFound:v11 assetID:v7];
    }
  }
  else
  {
    id v12 = self->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315394;
      int v14 = "-[UARPHIDUpdater _assetAvailablityUpdateForAccessoryID:assetID:]";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s: Unknown UARPAccessory %@, dropping it", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)assetDownloadFailed:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 uarpAccessory];
  BOOL v9 = [v8 modelNumber];
  id v10 = +[UARPSupportedAccessory findByAppleModelNumber:v9];

  [v6 setUpdateInProgress:0];
  id v11 = [v6 uarpAccessory];
  [(UARPHIDUpdater *)self qReleasePowerAssertionForAccessory:v11];

  id v12 = [v6 uarpAccessory];
  [(UARPHIDUpdater *)self qPostStagingStatusNotificationForAccessory:v12 status:0];

  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000054E0;
  block[3] = &unk_100028598;
  block[4] = self;
  id v14 = v6;
  id v20 = v14;
  dispatch_async(uarpHIDQueue, block);
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000055EC;
    v16[3] = &unk_1000286B0;
    v16[4] = self;
    id v17 = v14;
    id v18 = v7;
    dispatch_async(delegateQueue, v16);
  }
}

- (void)assetOnAssetServer:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 uarpAccessory];
  unsigned int v9 = [v8 reachable];

  if (v9)
  {
    id v10 = [v6 uarpAccessory];
    unsigned __int8 v11 = [v10 autoDownloadAllowed];

    if (v11) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if ([v6 options])
  {
LABEL_7:
    uarpController = self->_uarpController;
    id v14 = [v6 uarpAccessory];
    [(UARPController *)uarpController downloadAvailableFirmwareUpdate:v14 assetID:v7 withUserIntent:1];

    goto LABEL_8;
  }
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000057A8;
    block[3] = &unk_1000286B0;
    block[4] = self;
    id v16 = v6;
    id v17 = v7;
    dispatch_async(delegateQueue, block);
  }
LABEL_8:
}

- (void)assetOnLocalStorage:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 uarpAccessory];
  unsigned int v9 = [v8 reachable];

  if (v9)
  {
    if ([v6 needsConsentToStage])
    {
      [(UARPHIDUpdater *)self obtainConsentToStageForAccessoryID:v6];
    }
    else
    {
      uarpController = self->_uarpController;
      id v12 = [v6 uarpAccessory];
      id v17 = v12;
      int v13 = +[NSArray arrayWithObjects:&v17 count:1];
      [(UARPController *)uarpController stageFirmwareUpdateOnAccessoryList:v13 withUserIntent:1];
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000059A0;
    block[3] = &unk_1000286B0;
    block[4] = self;
    id v15 = v6;
    id v16 = v7;
    dispatch_async(delegateQueue, block);
  }
}

- (void)assetOnDropbox:(id)a3 assetID:(id)a4
{
  uarpController = self->_uarpController;
  id v6 = a4;
  id v7 = [a3 uarpAccessory];
  [(UARPController *)uarpController downloadAvailableFirmwareUpdate:v7 assetID:v6 withUserIntent:1];
}

- (void)assetNotFound:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 uarpAccessory];
  unsigned int v9 = [v8 modelNumber];
  id v10 = +[UARPSupportedAccessory findByAppleModelNumber:v9];

  [v6 setUpdateInProgress:0];
  unsigned __int8 v11 = [v6 uarpAccessory];
  [(UARPHIDUpdater *)self qReleasePowerAssertionForAccessory:v11];

  id v12 = [v6 uarpAccessory];
  [(UARPHIDUpdater *)self qPostStagingStatusNotificationForAccessory:v12 status:0];

  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005C58;
  block[3] = &unk_100028598;
  block[4] = self;
  id v14 = v6;
  id v20 = v14;
  dispatch_async(uarpHIDQueue, block);
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100005D64;
    v16[3] = &unk_1000286B0;
    v16[4] = self;
    id v17 = v14;
    id v18 = v7;
    dispatch_async(delegateQueue, v16);
  }
}

- (void)assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005E88;
  block[3] = &unk_1000286B0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(uarpHIDQueue, block);
}

- (void)_firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    unsigned __int8 v25 = "-[UARPHIDUpdater _firmwareStagingComplete:assetID:withStatus:]";
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    __int16 v30 = 2048;
    unint64_t v31 = a5;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: accessory=%@, assetID=%@, status=%lu", buf, 0x2Au);
  }
  unsigned __int8 v11 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessory:v8];
  id v12 = v11;
  if (v11)
  {
    if (a5)
    {
      [v11 setUpdateInProgress:0];
      id v13 = [v12 uarpAccessory];
      [(UARPHIDUpdater *)self qReleasePowerAssertionForAccessory:v13];

      id v14 = [v12 uarpAccessory];
      [(UARPHIDUpdater *)self qPostStagingStatusNotificationForAccessory:v14 status:0];
    }
    id v15 = self->_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = v15;
      id v17 = [v12 uarpAccessory];
      *(_DWORD *)buf = 138412290;
      unsigned __int8 v25 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Solicit TICS/MTIC (firmware staging complete) for HID <%@>", buf, 0xCu);
    }
    [(UARPHIDUpdater *)self _solicitDynamicAssetTICSForAccessory:v8];
    id v18 = [v12 uarpAccessory];
    [(UARPHIDUpdater *)self _solicitDynamicAssetMTICForAccessory:v18];

    if (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100006178;
      block[3] = &unk_1000286D8;
      block[4] = self;
      id v22 = v12;
      unint64_t v23 = a5;
      dispatch_async(delegateQueue, block);
    }
  }
  else
  {
    id v20 = self->_log;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      unsigned __int8 v25 = "-[UARPHIDUpdater _firmwareStagingComplete:assetID:withStatus:]";
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s: Unknown UARPAccessory %@, dropping it", buf, 0x16u);
    }
  }
}

- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000062A0;
  v13[3] = &unk_100028700;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(uarpHIDQueue, v13);
}

- (void)applyStagedAssets:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    long long v33 = "-[UARPHIDUpdater applyStagedAssets:]";
    __int16 v34 = 2112;
    id v35 = v4;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: accessory=%@", buf, 0x16u);
  }
  uint64_t v6 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessoryID:v4];
  id v7 = (void *)v6;
  if (v6)
  {
    unsigned __int8 v25 = (void *)v6;
    +[UARPSupportedAccessory supportedAccessoriesByTransport:1];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v27;
LABEL_6:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
        id v14 = [v13 identifier];
        id v15 = [v4 modelIdentifier];
        unsigned __int8 v16 = [v14 isEqualToString:v15];

        if (v16) {
          break;
        }
        if (v10 == (id)++v12)
        {
          id v10 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
          if (v10) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
      id v17 = v13;

      if (!v17) {
        goto LABEL_17;
      }
      id v7 = v25;
      if ([v17 autoAppliesStagedFirmware])
      {
        id v18 = self->_log;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          __int16 v19 = v18;
          id v20 = [v17 identifier];
          *(_DWORD *)buf = 136315394;
          long long v33 = "-[UARPHIDUpdater applyStagedAssets:]";
          __int16 v34 = 2112;
          id v35 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s: Accessory Identifier %@ auro-applies firmware ", buf, 0x16u);
        }
        goto LABEL_19;
      }
    }
    else
    {
LABEL_12:

      id v17 = 0;
LABEL_17:
      id v7 = v25;
    }
    uarpController = self->_uarpController;
    id v22 = [v7 uarpAccessory];
    __int16 v30 = v22;
    unint64_t v23 = +[NSArray arrayWithObjects:&v30 count:1];
    [(UARPController *)uarpController applyStagedFirmwareOnAccessoryList:v23 withUserIntent:0];

LABEL_19:
  }
  else
  {
    id v24 = self->_log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      long long v33 = "-[UARPHIDUpdater applyStagedAssets:]";
      __int16 v34 = 2112;
      id v35 = v4;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s: Unknown UARPAccessory %@, dropping it", buf, 0x16u);
    }
  }
}

- (void)_assetSolicitationComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v47 = "-[UARPHIDUpdater _assetSolicitationComplete:assetID:withStatus:]";
    __int16 v48 = 2112;
    id v49 = v8;
    __int16 v50 = 2112;
    id v51 = v9;
    __int16 v52 = 2048;
    unint64_t v53 = a5;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: accessory=%@, assetID=%@, status=%lu", buf, 0x2Au);
  }
  uint64_t v11 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessory:v8];
  if (v11)
  {
    uint64_t v12 = (char *)uarpAssetTagStructAnalytics();
    id v13 = [objc_alloc((Class)UARPAssetTag) initWithChar1:*v12 char2:v12[1] char3:v12[2] char4:v12[3]];
    id v14 = [v9 tag];
    unsigned int v15 = [v14 isEqual:v13];

    if (!a5 && v15)
    {
      id v16 = objc_alloc((Class)UARPDynamicAssetAnalyticsEvent);
      id v17 = [v9 localURL];
      id v18 = [v16 initWithURL:v17];

      if ([v18 decomposeUARP]) {
        [v18 send];
      }
    }
    __int16 v19 = +[UARPDynamicAssetMappedAnalyticsEvent tag];
    id v20 = [v9 tag];
    unsigned int v21 = [v20 isEqual:v19];

    if (!a5 && v21)
    {
      id v22 = objc_alloc((Class)UARPDynamicAssetMappedAnalyticsEvent);
      unint64_t v23 = [v9 localURL];
      id v24 = [v22 initWithURL:v23];

      if (([v24 prepareAndSend] & 1) == 0)
      {
        unsigned __int8 v25 = self->_log;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_10001C400(v25, v26, v27, v28, v29, v30, v31, v32);
        }
      }
    }
    if (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100006A3C;
      block[3] = &unk_1000286D8;
      block[4] = self;
      id v44 = v11;
      unint64_t v45 = a5;
      dispatch_async(delegateQueue, block);
    }
    if (objc_opt_respondsToSelector())
    {
      __int16 v34 = self->_delegateQueue;
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_100006A9C;
      v39[3] = &unk_100028700;
      v39[4] = self;
      id v40 = v11;
      id v41 = v9;
      unint64_t v42 = a5;
      dispatch_async(v34, v39);
    }
    id v35 = [v8 pendingAssets];
    id v36 = [v35 count];

    if (!v36 && !self->_unregisterOnComplete)
    {
      v37 = self->_log;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v47 = "-[UARPHIDUpdater _assetSolicitationComplete:assetID:withStatus:]";
        __int16 v48 = 2112;
        id v49 = v8;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%s: Configured to not unregister upon completion for UARPAccessory %@", buf, 0x16u);
      }
    }
  }
  else
  {
    int v38 = self->_log;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v47 = "-[UARPHIDUpdater _assetSolicitationComplete:assetID:withStatus:]";
      __int16 v48 = 2112;
      id v49 = v8;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%s: Unknown UARPAccessory %@, dropping it", buf, 0x16u);
    }
  }
}

- (void)assetSolicitationComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100006BC4;
  v13[3] = &unk_100028700;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(uarpHIDQueue, v13);
}

- (void)_accessoryTransportNeeded:(id)a3 isNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    CFStringRef v8 = @"NO";
    *(_DWORD *)buf = 136315650;
    unint64_t v16 = "-[UARPHIDUpdater _accessoryTransportNeeded:isNeeded:]";
    __int16 v17 = 2112;
    id v18 = v6;
    if (v4) {
      CFStringRef v8 = @"YES";
    }
    __int16 v19 = 2112;
    CFStringRef v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: accessory=%@, isNeeded=%@", buf, 0x20u);
  }
  id v9 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessory:v6];
  if (v9)
  {
    if (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100006DC0;
      block[3] = &unk_100028728;
      block[4] = self;
      id v13 = v9;
      BOOL v14 = v4;
      dispatch_async(delegateQueue, block);
    }
  }
  else
  {
    id v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      unint64_t v16 = "-[UARPHIDUpdater _accessoryTransportNeeded:isNeeded:]";
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s: Unknown UARPAccessory %@, dropping it", buf, 0x16u);
    }
  }
}

- (void)accessoryTransportNeeded:(id)a3 isNeeded:(BOOL)a4
{
  id v6 = a3;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006EC8;
  block[3] = &unk_100028728;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(uarpHIDQueue, block);
}

- (void)_queryCompleteForAccessory:(id)a3 manufacturer:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessory:a3];
  BOOL v11 = v10;
  if (v10)
  {
    if [v10 goldrestoreQueryInProgress] && (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100007008;
      v13[3] = &unk_100028548;
      v13[4] = self;
      id v14 = v11;
      id v15 = v8;
      id v16 = v9;
      dispatch_async(delegateQueue, v13);
    }
    else
    {
      [v11 updateProperty:0 value:v8];
    }
  }
}

- (void)queryCompleteForAccessory:(id)a3 manufacturer:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000714C;
  v15[3] = &unk_100028548;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(uarpHIDQueue, v15);
}

- (void)_queryCompleteForAccessory:(id)a3 modelName:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessory:a3];
  BOOL v11 = v10;
  if (v10)
  {
    if [v10 goldrestoreQueryInProgress] && (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10000728C;
      v13[3] = &unk_100028548;
      v13[4] = self;
      id v14 = v11;
      id v15 = v8;
      id v16 = v9;
      dispatch_async(delegateQueue, v13);
    }
    else
    {
      [v11 updateProperty:1 value:v8];
    }
  }
}

- (void)queryCompleteForAccessory:(id)a3 modelName:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000073D0;
  v15[3] = &unk_100028548;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(uarpHIDQueue, v15);
}

- (void)_queryCompleteForAccessory:(id)a3 firmwareVersion:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessory:a3];
  BOOL v11 = v10;
  if (v10)
  {
    if [v10 goldrestoreQueryInProgress] && (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100007510;
      v13[3] = &unk_100028548;
      v13[4] = self;
      id v14 = v11;
      id v15 = v8;
      id v16 = v9;
      dispatch_async(delegateQueue, v13);
    }
    else
    {
      [v11 updateProperty:4 value:v8];
    }
  }
}

- (void)queryCompleteForAccessory:(id)a3 firmwareVersion:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100007654;
  v15[3] = &unk_100028548;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(uarpHIDQueue, v15);
}

- (void)_queryCompleteForAccessory:(id)a3 stagedFirmwareVersion:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessory:a3];
  BOOL v11 = v10;
  if (v10)
  {
    if [v10 goldrestoreQueryInProgress] && (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100007794;
      v13[3] = &unk_100028548;
      v13[4] = self;
      id v14 = v11;
      id v15 = v8;
      id v16 = v9;
      dispatch_async(delegateQueue, v13);
    }
    else
    {
      [v11 updateProperty:5 value:v8];
    }
  }
}

- (void)queryCompleteForAccessory:(id)a3 stagedFirmwareVersion:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000078D8;
  v15[3] = &unk_100028548;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(uarpHIDQueue, v15);
}

- (void)_queryCompleteForAccessory:(id)a3 stats:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessory:a3];
  BOOL v11 = v10;
  if (v10 && [v10 goldrestoreQueryInProgress] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100007A04;
    v13[3] = &unk_100028548;
    v13[4] = self;
    id v14 = v11;
    id v15 = v8;
    id v16 = v9;
    dispatch_async(delegateQueue, v13);
  }
}

- (void)queryCompleteForAccessory:(id)a3 stats:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100007B48;
  v15[3] = &unk_100028548;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(uarpHIDQueue, v15);
}

- (void)_queryCompleteForAccessory:(id)a3 hardwareVersion:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessory:a3];
  BOOL v11 = v10;
  if (v10)
  {
    if [v10 goldrestoreQueryInProgress] && (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100007C88;
      v13[3] = &unk_100028548;
      v13[4] = self;
      id v14 = v11;
      id v15 = v8;
      id v16 = v9;
      dispatch_async(delegateQueue, v13);
    }
    else
    {
      [v11 updateProperty:3 value:v8];
    }
  }
}

- (void)queryCompleteForAccessory:(id)a3 hardwareVersion:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100007DCC;
  v15[3] = &unk_100028548;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(uarpHIDQueue, v15);
}

- (void)_queryCompleteForAccessory:(id)a3 serialNumber:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessory:a3];
  BOOL v11 = v10;
  if (v10)
  {
    if [v10 goldrestoreQueryInProgress] && (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100007F0C;
      v13[3] = &unk_100028548;
      v13[4] = self;
      id v14 = v11;
      id v15 = v8;
      id v16 = v9;
      dispatch_async(delegateQueue, v13);
    }
    else
    {
      [v11 updateProperty:2 value:v8];
    }
  }
}

- (void)queryCompleteForAccessory:(id)a3 serialNumber:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100008050;
  v15[3] = &unk_100028548;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(uarpHIDQueue, v15);
}

- (void)_queryCompleteForAccessory:(id)a3 appleModelNumber:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessory:a3];
  BOOL v11 = v10;
  if (v10)
  {
    if [v10 goldrestoreQueryInProgress] && (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000081FC;
      v17[3] = &unk_100028548;
      v17[4] = self;
      id v18 = v11;
      id v19 = v8;
      id v20 = v9;
      dispatch_async(delegateQueue, v17);
    }
    else
    {
      if (!v9)
      {
        id v13 = [v11 uarpAccessoryID];
        id v14 = [v13 modelNumber];
        unsigned __int8 v15 = [v8 isEqualToString:v14];

        if ((v15 & 1) == 0)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
            sub_10001C478((uint64_t)v8, log, v11);
          }
        }
      }
      [v11 updateProperty:11 value:v8];
    }
  }
}

- (void)queryCompleteForAccessory:(id)a3 appleModelNumber:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100008340;
  v15[3] = &unk_100028548;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(uarpHIDQueue, v15);
}

- (void)_queryCompleteForAccessory:(id)a3 hwFusingType:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessory:a3];
  BOOL v11 = v10;
  if (v10)
  {
    if [v10 goldrestoreQueryInProgress] && (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100008480;
      v13[3] = &unk_100028548;
      v13[4] = self;
      id v14 = v11;
      id v15 = v8;
      id v16 = v9;
      dispatch_async(delegateQueue, v13);
    }
    else
    {
      [v11 updateProperty:12 value:v8];
    }
  }
}

- (void)queryCompleteForAccessory:(id)a3 hwFusingType:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000085C4;
  v15[3] = &unk_100028548;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(uarpHIDQueue, v15);
}

- (void)_queryCompleteForAccessory:(id)a3 friendlyName:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessory:a3];
  BOOL v11 = v10;
  if (v10)
  {
    if [v10 goldrestoreQueryInProgress] && (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100008704;
      v13[3] = &unk_100028548;
      v13[4] = self;
      id v14 = v11;
      id v15 = v8;
      id v16 = v9;
      dispatch_async(delegateQueue, v13);
    }
    else
    {
      [v11 updateProperty:13 value:v8];
    }
  }
}

- (void)queryCompleteForAccessory:(id)a3 friendlyName:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100008848;
  v15[3] = &unk_100028548;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(uarpHIDQueue, v15);
}

- (void)queryCompleteForAccessory:(id)a3 manifestPrefix:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000893C;
  v15[3] = &unk_100028548;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(uarpHIDQueue, v15);
}

- (void)queryCompleteForAccessory:(id)a3 boardID:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100008B68;
  v13[3] = &unk_100028700;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(uarpHIDQueue, v13);
}

- (void)queryCompleteForAccessory:(id)a3 chipID:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100008D84;
  v13[3] = &unk_100028700;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(uarpHIDQueue, v13);
}

- (void)queryCompleteForAccessory:(id)a3 chipRevision:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100008FA0;
  v13[3] = &unk_100028700;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(uarpHIDQueue, v13);
}

- (void)queryCompleteForAccessory:(id)a3 ecid:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000091BC;
  v13[3] = &unk_100028700;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(uarpHIDQueue, v13);
}

- (void)queryCompleteForAccessory:(id)a3 securityDomain:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000093D8;
  v13[3] = &unk_100028700;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(uarpHIDQueue, v13);
}

- (void)queryCompleteForAccessory:(id)a3 securityMode:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000095F4;
  v13[3] = &unk_100028700;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(uarpHIDQueue, v13);
}

- (void)queryCompleteForAccessory:(id)a3 productionMode:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100009810;
  v13[3] = &unk_100028700;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(uarpHIDQueue, v13);
}

- (void)queryCompleteForAccessory:(id)a3 epoch:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100009A2C;
  v13[3] = &unk_100028700;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(uarpHIDQueue, v13);
}

- (void)queryCompleteForAccessory:(id)a3 enableMixMatch:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100009C4C;
  v13[3] = &unk_100028750;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(uarpHIDQueue, v13);
}

- (void)queryCompleteForAccessory:(id)a3 liveNonce:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100009E74;
  v13[3] = &unk_100028750;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(uarpHIDQueue, v13);
}

- (void)queryCompleteForAccessory:(id)a3 prefixNeedsLUN:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000A09C;
  v13[3] = &unk_100028750;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(uarpHIDQueue, v13);
}

- (void)queryCompleteForAccessory:(id)a3 suffixNeedsLUN:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000A2C4;
  v13[3] = &unk_100028750;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(uarpHIDQueue, v13);
}

- (void)_queryCompleteForAccessoryID:(id)a3 appleModelNumber:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessory:a3];
  id v11 = v10;
  if (v10 && [v10 goldrestoreQueryInProgress] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000A53C;
    v13[3] = &unk_100028548;
    v13[4] = self;
    id v14 = v11;
    id v15 = v8;
    id v16 = v9;
    dispatch_async(delegateQueue, v13);
  }
}

- (void)queryCompleteForAccessoryID:(id)a3 appleModelNumber:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000A680;
  v15[3] = &unk_100028548;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(uarpHIDQueue, v15);
}

- (void)_queryCompleteForAccessoryID:(id)a3 hwFusingType:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessory:a3];
  id v11 = v10;
  if (v10 && [v10 goldrestoreQueryInProgress] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000A7AC;
    v13[3] = &unk_100028548;
    v13[4] = self;
    id v14 = v11;
    id v15 = v8;
    id v16 = v9;
    dispatch_async(delegateQueue, v13);
  }
}

- (void)queryCompleteForAccessoryID:(id)a3 hwFusingType:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000A8F0;
  v15[3] = &unk_100028548;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(uarpHIDQueue, v15);
}

- (void)_queryCompleteForAccessoryID:(id)a3 friendlyName:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessory:a3];
  id v11 = v10;
  if (v10 && [v10 goldrestoreQueryInProgress] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000AA1C;
    v13[3] = &unk_100028548;
    v13[4] = self;
    id v14 = v11;
    id v15 = v8;
    id v16 = v9;
    dispatch_async(delegateQueue, v13);
  }
}

- (void)queryCompleteForAccessoryID:(id)a3 friendlyName:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000AB60;
  v15[3] = &unk_100028548;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(uarpHIDQueue, v15);
}

- (void)_firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessory:v10];
  log = self->_log;
  BOOL v14 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v14)
    {
      *(_DWORD *)buf = 136315906;
      unsigned __int8 v25 = "-[UARPHIDUpdater _firmwareStagingProgress:assetID:bytesSent:bytesTotal:]";
      __int16 v26 = 2112;
      id v27 = v10;
      __int16 v28 = 2112;
      id v29 = v11;
      __int16 v30 = 2048;
      double v31 = (float)((float)((float)a5 / (float)a6) * 100.0);
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: accessory=%@, assetID=%@, progress=%f", buf, 0x2Au);
    }
    id v15 = +[NSDate now];
    id v16 = [v12 lastReportedStagingTime];
    id v17 = [v16 dateByAddingTimeInterval:300.0];

    if ([v15 compare:v17] == (id)1)
    {
      [v12 setLastReportedStagingTime:v15];
      id v18 = [v12 uarpAccessory];
      [(UARPHIDUpdater *)self qPostStagingStatusNotificationForAccessory:v18 status:1];
    }
    if (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10000AE08;
      v20[3] = &unk_100028778;
      v20[4] = self;
      id v21 = v12;
      unint64_t v22 = a5;
      unint64_t v23 = a6;
      dispatch_async(delegateQueue, v20);
    }
  }
  else if (v14)
  {
    *(_DWORD *)buf = 136315394;
    unsigned __int8 v25 = "-[UARPHIDUpdater _firmwareStagingProgress:assetID:bytesSent:bytesTotal:]";
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: Unknown UARPAccessory %@, dropping it", buf, 0x16u);
  }
}

- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AF40;
  block[3] = &unk_1000287A0;
  block[4] = self;
  id v16 = v10;
  id v17 = v11;
  unint64_t v18 = a5;
  unint64_t v19 = a6;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(uarpHIDQueue, block);
}

- (void)_assetSolicitationProgress:(id)a3 assetID:(id)a4 bytesReceived:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessory:v10];
  log = self->_log;
  BOOL v14 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v14)
    {
      *(_DWORD *)buf = 136315906;
      id v21 = "-[UARPHIDUpdater _assetSolicitationProgress:assetID:bytesReceived:bytesTotal:]";
      __int16 v22 = 2112;
      id v23 = v10;
      __int16 v24 = 2112;
      id v25 = v11;
      __int16 v26 = 2048;
      double v27 = (float)((float)((float)a5 / (float)a6) * 100.0);
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: accessory=%@, assetID=%@, progress=%f", buf, 0x2Au);
    }
    delegateQueue = self->_delegateQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000B148;
    v16[3] = &unk_100028778;
    v16[4] = self;
    id v17 = v12;
    unint64_t v18 = a5;
    unint64_t v19 = a6;
    dispatch_async(delegateQueue, v16);
  }
  else if (v14)
  {
    *(_DWORD *)buf = 136315394;
    id v21 = "-[UARPHIDUpdater _assetSolicitationProgress:assetID:bytesReceived:bytesTotal:]";
    __int16 v22 = 2112;
    id v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: Unknown UARPAccessory %@, dropping it", buf, 0x16u);
  }
}

- (void)assetSolicitationProgress:(id)a3 assetID:(id)a4 bytesReceived:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B280;
  block[3] = &unk_1000287A0;
  block[4] = self;
  id v16 = v10;
  id v17 = v11;
  unint64_t v18 = a5;
  unint64_t v19 = a6;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(uarpHIDQueue, block);
}

- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v17 = 0;
  unint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000B38C;
  v13[3] = &unk_100028610;
  v13[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v16 = &v17;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(uarpHIDQueue, v13);
  LOBYTE(uarpHIDQueue) = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)uarpHIDQueue;
}

- (void)_stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessory:v6];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B534;
    block[3] = &unk_1000286D8;
    block[4] = self;
    id v14 = v7;
    unint64_t v15 = a4;
    dispatch_async(delegateQueue, block);
  }
  id v9 = [v6 pendingAssets];
  id v10 = [v9 count];

  if (!v10)
  {
    [v7 setUpdateInProgress:0];
    id v11 = [v7 uarpAccessory];
    [(UARPHIDUpdater *)self qReleasePowerAssertionForAccessory:v11];

    id v12 = [v7 uarpAccessory];
    [(UARPHIDUpdater *)self qPostStagingStatusNotificationForAccessory:v12 status:0];
  }
}

- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v6 = a3;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B63C;
  block[3] = &unk_1000286D8;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(uarpHIDQueue, block);
}

- (void)_stagedFirmwareRescindComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v6 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessory:a3];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B710;
    block[3] = &unk_1000286D8;
    block[4] = self;
    id v9 = v6;
    unint64_t v10 = a4;
    dispatch_async(delegateQueue, block);
  }
}

- (void)stagedFirmwareRescindComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v6 = a3;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B818;
  block[3] = &unk_1000286D8;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(uarpHIDQueue, block);
}

- (id)createAndSaveUARPHIDAccessoryFromService:(unsigned int)a3 identifier:(id)a4
{
  id v8 = a4;
  CFMutableDictionaryRef properties = 0;
  IOHIDDeviceRef v9 = IOHIDDeviceCreate(kCFAllocatorDefault, a3);
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10001C548();
    }
    goto LABEL_44;
  }
  IOHIDDeviceRef v10 = v9;
  IORegistryEntryCreateCFProperties(a3, &properties, kCFAllocatorDefault, 0);
  if (!properties)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10001C5BC();
    }
LABEL_44:
    id v36 = 0;
    goto LABEL_58;
  }
  IOHIDDeviceRef v58 = v10;
  unint64_t v11 = CFDictionaryGetValue(properties, @"SerialNumber");
  v62 = CFDictionaryGetValue(properties, @"LocationID");
  unint64_t v53 = self;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v79 = "-[UARPHIDUpdater createAndSaveUARPHIDAccessoryFromService:identifier:]";
    __int16 v80 = 2112;
    id v81 = v11;
    __int16 v82 = 2112;
    id v83 = v62;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: serialNumber=%@ locationID=%@", buf, 0x20u);
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  obj = v53->_uarpHIDAccessories;
  id v13 = [(NSMutableSet *)obj countByEnumeratingWithState:&v71 objects:v86 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v72;
LABEL_7:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v72 != v15) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void **)(*((void *)&v71 + 1) + 8 * v16);
      if (v11)
      {
        BOOL v4 = [*(id *)(*((void *)&v71 + 1) + 8 * v16) uarpAccessoryID];
        BOOL v5 = [v4 serialNumber];
        if ([v5 isEqualToString:v11])
        {

LABEL_46:
          v37 = v53->_log;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            int v38 = v37;
            __int16 v39 = [v17 uarpAccessoryID];
            *(_DWORD *)buf = 136315906;
            v79 = "-[UARPHIDUpdater createAndSaveUARPHIDAccessoryFromService:identifier:]";
            __int16 v80 = 2112;
            id v81 = v39;
            __int16 v82 = 2112;
            id v83 = v11;
            __int16 v84 = 2112;
            v85 = v62;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%s: hidAccessory %@ exists for serialNumber %@, locationID = %@", buf, 0x2Au);
          }
          id v36 = v17;
          char v20 = (UARPHIDAccessory *)obj;
          goto LABEL_57;
        }
        if (v62)
        {
LABEL_15:
          unint64_t v18 = [v17 locationID];
          unsigned int v19 = [v18 isEqualToNumber:v62];

          if (v11)
          {

            if (v19) {
              goto LABEL_46;
            }
          }
          else if (v19)
          {
            goto LABEL_46;
          }
          goto LABEL_19;
        }
      }
      else if (v62)
      {
        goto LABEL_15;
      }
LABEL_19:
      if (v14 == (id)++v16)
      {
        id v14 = [(NSMutableSet *)obj countByEnumeratingWithState:&v71 objects:v86 count:16];
        if (v14) {
          goto LABEL_7;
        }
        break;
      }
    }
  }

  char v20 = [[UARPHIDAccessory alloc] initWithHIDDeviceRef:v58];
  __int16 v52 = CFDictionaryGetValue(properties, @"Transport");
  -[UARPHIDAccessory setTransport:](v20, "setTransport:");
  +[UARPSupportedAccessory supportedAccessoriesByTransport:1];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  id v57 = [v21 countByEnumeratingWithState:&v67 objects:v77 count:16];
  if (v57)
  {
    obja = v20;
    id v22 = 0;
    v55 = v11;
    uint64_t v56 = *(void *)v68;
    id v54 = v21;
    while (2)
    {
      for (i = 0; i != v57; i = (char *)i + 1)
      {
        if (*(void *)v68 != v56) {
          objc_enumerationMutation(v21);
        }
        __int16 v24 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        id v25 = [v24 identifier];
        unsigned int v26 = [v25 isEqualToString:v8];

        if (v26)
        {
          id v40 = v24;

          id v22 = v40;
          goto LABEL_50;
        }
        double v27 = [v24 hardwareID];
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        __int16 v28 = [v27 personalities];
        id v29 = [v28 countByEnumeratingWithState:&v63 objects:v76 count:16];
        if (v29)
        {
          id v30 = v29;
          v59 = v22;
          uint64_t v31 = *(void *)v64;
          while (2)
          {
            for (j = 0; j != v30; j = (char *)j + 1)
            {
              if (*(void *)v64 != v31) {
                objc_enumerationMutation(v28);
              }
              long long v33 = *(void **)(*((void *)&v63 + 1) + 8 * (void)j);
              __int16 v34 = [v24 identifier];
              id v35 = [v33 personalityIdentifier:v34];

              if ([v35 isEqualToString:v8])
              {
                id v22 = v24;

                id v21 = v54;
                unint64_t v11 = v55;
                goto LABEL_37;
              }
            }
            id v30 = [v28 countByEnumeratingWithState:&v63 objects:v76 count:16];
            if (v30) {
              continue;
            }
            break;
          }
          id v21 = v54;
          unint64_t v11 = v55;
          id v22 = v59;
        }
LABEL_37:
      }
      id v57 = [v21 countByEnumeratingWithState:&v67 objects:v77 count:16];
      if (v57) {
        continue;
      }
      break;
    }
LABEL_50:

    if (v22)
    {
      id v41 = objc_alloc((Class)UARPAccessoryID);
      unint64_t v42 = [v22 identifier];
      id v43 = [v41 initWithModelNumber:v42];
      char v20 = obja;
      [(UARPHIDAccessory *)obja setUarpAccessoryID:v43];

      id v44 = [(UARPHIDAccessory *)obja uarpAccessoryID];
      [v44 setSerialNumber:v11];

      [(UARPHIDAccessory *)obja setLocationID:v62];
      id v45 = [v22 capabilities];
      v46 = [(UARPHIDAccessory *)obja uarpAccessoryID];
      [v46 setCapability:v45];

      v47 = v53->_log;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v48 = v47;
        id v49 = [(UARPHIDAccessory *)obja uarpAccessoryID];
        id v50 = [v49 capability];
        *(_DWORD *)buf = 136315650;
        v79 = "-[UARPHIDUpdater createAndSaveUARPHIDAccessoryFromService:identifier:]";
        __int16 v80 = 2112;
        id v81 = v8;
        __int16 v82 = 2048;
        id v83 = v50;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%s: identifier=%@ cap=0x%llx", buf, 0x20u);
      }
      [(NSMutableSet *)v53->_uarpHIDAccessories addObject:obja];
      CFRelease(properties);
      id v36 = obja;
    }
    else
    {
      id v36 = 0;
      char v20 = obja;
    }
  }
  else
  {

    id v22 = 0;
    id v36 = 0;
  }

LABEL_57:
LABEL_58:

  return v36;
}

- (void)queryPropertiesForUARPHIDAccessory:(id)a3 completionCallback:(id)a4
{
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_10000C084;
  uint64_t v15 = &unk_1000287C8;
  uint64_t v16 = self;
  id v17 = a4;
  id v6 = v17;
  id v7 = a3;
  [v7 internalQueryStartWithCompletionCallback:&v12];
  id v8 = objc_msgSend(v7, "propertiesToQuery", v12, v13, v14, v15, v16);
  IOHIDDeviceRef v9 = [v8 allObjects];
  IOHIDDeviceRef v10 = +[NSArray arrayWithArray:v9];

  unint64_t v11 = [v7 uarpAccessoryID];

  [(UARPHIDUpdater *)self _queryProperties:v10 accessoryID:v11 goldrestoreQuery:0];
}

- (id)createUARPAccessoryFromAccessoryID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UARPHIDUpdater *)self uuidForAccessoryID:v4];
  uint64_t v6 = [v4 productGroup];
  if (v6
    && (id v7 = (void *)v6,
        [v4 productNumber],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    id v9 = objc_alloc((Class)UARPAccessory);
    IOHIDDeviceRef v10 = [v4 productGroup];
    unint64_t v11 = [v4 productNumber];
    id v12 = [v9 initWithProductGroup:v10 productNumber:v11 uuid:v5];
  }
  else
  {
    uint64_t v13 = [v4 modelNumber];
    IOHIDDeviceRef v10 = +[UARPSupportedAccessory findByAppleModelNumber:v13];

    id v14 = objc_alloc((Class)UARPAccessory);
    unint64_t v11 = [v10 hardwareID];
    id v12 = [v14 initWithHardwareID:v11 uuid:v5];
  }
  uint64_t v15 = v12;

  objc_msgSend(v15, "setSuppressAutomaticDynamicAssets:", objc_msgSend(v4, "suppressAutomaticDynamicAssets"));
  objc_msgSend(v15, "setSuppressInfoQueries:", objc_msgSend(v4, "suppressInfoQueries"));

  return v15;
}

- (id)uuidForAccessoryID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 serialNumber];

  if (!v5) {
    goto LABEL_12;
  }
  uint64_t v6 = [v4 productGroup];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [v4 productNumber];

    if (v8)
    {
      id v9 = [v4 productGroup];
      IOHIDDeviceRef v10 = [v4 productNumber];
      unint64_t v11 = [v4 serialNumber];
      id v12 = +[NSString stringWithFormat:@"%@%@-%@", v9, v10, v11];

      goto LABEL_7;
    }
  }
  uint64_t v13 = [v4 modelNumber];

  if (!v13)
  {
LABEL_12:
    uint64_t v16 = +[NSUUID UUID];
    goto LABEL_18;
  }
  id v9 = [v4 modelNumber];
  IOHIDDeviceRef v10 = [v4 serialNumber];
  id v12 = +[NSString stringWithFormat:@"%@-%@", v9, v10];
LABEL_7:

  uint64_t v14 = [(NSUserDefaults *)self->_database objectForKey:v12];
  if (!v14)
  {
    uint64_t v16 = +[NSUUID UUID];
    unint64_t v18 = +[NSKeyedArchiver archivedDataWithRootObject:v16 requiringSecureCoding:1 error:0];
    [(NSUserDefaults *)self->_database setObject:v18 forKey:v12];
    log = self->_log;
    if (!os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
LABEL_16:
    *(_DWORD *)buf = 138412546;
    id v22 = v16;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Created new UUID:%@ for accessoryID:%@ in database", buf, 0x16u);
    goto LABEL_17;
  }
  uint64_t v15 = (void *)v14;
  uint64_t v16 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v14 error:0];
  id v17 = self->_log;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v16;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Found UUID:%@ for accessoryID:%@ in database", buf, 0x16u);
  }
  if (!v16)
  {
    [(NSUserDefaults *)self->_database removeObjectForKey:v12];
    uint64_t v16 = +[NSUUID UUID];
    unint64_t v18 = +[NSKeyedArchiver archivedDataWithRootObject:v16 requiringSecureCoding:1 error:0];

    [(NSUserDefaults *)self->_database setObject:v18 forKey:v12];
    log = self->_log;
    if (!os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  unint64_t v18 = v15;
LABEL_17:

LABEL_18:
  return v16;
}

- (id)getUARPHIDAccessoryForUARPAccessoryID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_100002148;
  uint64_t v16 = sub_100002158;
  id v17 = 0;
  uarpHIDAccessories = self->_uarpHIDAccessories;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000C750;
  v9[3] = &unk_1000287F0;
  id v6 = v4;
  id v10 = v6;
  unint64_t v11 = &v12;
  [(NSMutableSet *)uarpHIDAccessories enumerateObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)getUARPHIDAccessoryForUARPAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_100002148;
  uint64_t v16 = sub_100002158;
  id v17 = 0;
  uarpHIDAccessories = self->_uarpHIDAccessories;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000C914;
  v9[3] = &unk_1000287F0;
  id v6 = v4;
  id v10 = v6;
  unint64_t v11 = &v12;
  [(NSMutableSet *)uarpHIDAccessories enumerateObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)registerHIDForAccessory:(id)a3
{
  id v4 = a3;
  IOReturn v5 = IOHIDDeviceOpen((IOHIDDeviceRef)[v4 hidDeviceRef], 0);
  if (!v5)
  {
    IOHIDDeviceRegisterRemovalCallback((IOHIDDeviceRef)[v4 hidDeviceRef], (IOHIDCallback)sub_10000CB40, v4);
    id v6 = (__IOHIDDevice *)[v4 hidDeviceRef];
    id v7 = [v4 hidBuffer];
    id v8 = (uint8_t *)[v7 mutableBytes];
    id v9 = [v4 hidBuffer];
    IOHIDDeviceRegisterInputReportCallback(v6, v8, (CFIndex)[v9 length], (IOHIDReportCallback)sub_10000CC9C, v4);

    ++self->_hidDevicesRegistered;
    uarpHIDRegistrationThread = self->_uarpHIDRegistrationThread;
    if (uarpHIDRegistrationThread)
    {
      [(UARPHIDUpdater *)self performSelector:"scheduleHIDDeviceForAccessory:" onThread:uarpHIDRegistrationThread withObject:v4 waitUntilDone:1];
    }
    else
    {
      unint64_t v11 = (NSThread *)[objc_alloc((Class)NSThread) initWithTarget:self selector:"runHIDRegistrationThread:" object:v4];
      uint64_t v12 = self->_uarpHIDRegistrationThread;
      self->_uarpHIDRegistrationThread = v11;

      [(NSThread *)self->_uarpHIDRegistrationThread start];
      uarpHIDRegistrationThreadSemaphore = self->_uarpHIDRegistrationThreadSemaphore;
      dispatch_time_t v14 = dispatch_time(0, 2000000000);
      if (dispatch_semaphore_wait(uarpHIDRegistrationThreadSemaphore, v14))
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
          sub_10001C6C0(log, v16, v17, v18, v19, v20, v21, v22);
        }
      }
    }
  }

  return v5 == 0;
}

- (BOOL)registerHIDCallbacksForUARPHIDAccessory:(id)a3
{
  id v4 = a3;
  if (![v4 hidDeviceRef])
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10001C738();
    }
    goto LABEL_8;
  }
  if (![v4 hidDeviceScheduled])
  {
    objc_msgSend(v4, "setHidReportSizeInput:", -[UARPHIDUpdater getReportSizeForReportUsage:forAccessory:](self, "getReportSizeForReportUsage:forAccessory:", 1, v4) >> 3);
    if ([v4 hidReportSizeInput])
    {
      objc_msgSend(v4, "setHidReportSizeOutput:", -[UARPHIDUpdater getReportSizeForReportUsage:forAccessory:](self, "getReportSizeForReportUsage:forAccessory:", 2, v4) >> 3);
      if ([v4 hidReportSizeOutput])
      {
        id v5 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", objc_msgSend(v4, "hidReportSizeInput") + 1);
        [v4 setHidBuffer:v5];

        BOOL v6 = [(UARPHIDUpdater *)self registerHIDForAccessory:v4];
        goto LABEL_9;
      }
    }
LABEL_8:
    BOOL v6 = 0;
    goto LABEL_9;
  }
  log = self->_log;
  BOOL v6 = 1;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    id v10 = "-[UARPHIDUpdater registerHIDCallbacksForUARPHIDAccessory:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: accessory=%@ already registered for HID Callbacks", (uint8_t *)&v9, 0x16u);
  }
LABEL_9:

  return v6;
}

- (BOOL)unRegisterHIDCallbacksForUARPHIDAccessory:(id)a3
{
  id v4 = a3;
  if ([v4 hidDeviceScheduled])
  {
    if ([v4 hidDeviceScheduled])
    {
      --self->_hidDevicesRegistered;
      [(UARPHIDUpdater *)self performSelector:"unScheduleHIDDeviceForAccessory:" onThread:self->_uarpHIDRegistrationThread withObject:v4 waitUntilDone:1];
      IOHIDDeviceClose((IOHIDDeviceRef)[v4 hidDeviceRef], 0);
      CFRelease([v4 hidDeviceRef]);
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        int v10 = 136315394;
        __int16 v11 = "-[UARPHIDUpdater unRegisterHIDCallbacksForUARPHIDAccessory:]";
        __int16 v12 = 2112;
        id v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: accessory=%@ now unregistered for HID Callbacks", (uint8_t *)&v10, 0x16u);
      }
    }
    if (!self->_hidDevicesRegistered)
    {
      BOOL v6 = self->_log;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v10 = 136315138;
        __int16 v11 = "-[UARPHIDUpdater unRegisterHIDCallbacksForUARPHIDAccessory:]";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s: No more accessories registered for HID Callbacks, cancelling _uarpHIDRegistrationThread", (uint8_t *)&v10, 0xCu);
      }
      [(UARPHIDUpdater *)self performSelector:"stopHIDRegistrationThread" onThread:self->_uarpHIDRegistrationThread withObject:0 waitUntilDone:1];
      [(NSThread *)self->_uarpHIDRegistrationThread cancel];
      uarpHIDRegistrationThread = self->_uarpHIDRegistrationThread;
      self->_uarpHIDRegistrationThread = 0;
    }
    [v4 setHidReportSizeInput:0];
    [v4 setHidReportSizeOutput:0];
    [v4 setHidReportID:0];
    [v4 setExpectedHIDMessageID:1];
    [v4 setHidMessageID:0];
    [v4 setHidDeviceScheduled:0];
    [(NSMutableSet *)self->_uarpHIDAccessories removeObject:v4];
  }
  else
  {
    int v9 = self->_log;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      __int16 v11 = "-[UARPHIDUpdater unRegisterHIDCallbacksForUARPHIDAccessory:]";
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s: accessory=%@ already unRegistered for HID Callbacks", (uint8_t *)&v10, 0x16u);
    }
  }

  return 1;
}

- (unsigned)getReportSizeForReportUsage:(unsigned int)a3 forAccessory:(id)a4
{
  id v5 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  CFArrayRef v6 = IOHIDDeviceCopyMatchingElements((IOHIDDeviceRef)[v5 hidDeviceRef], (CFDictionaryRef)&off_100029290, 0);
  id v7 = [(__CFArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        __int16 v11 = *(__IOHIDElement **)(*((void *)&v15 + 1) + 8 * i);
        if (IOHIDElementGetUsage(v11) == a3)
        {
          uint32_t ReportSize = IOHIDElementGetReportSize(v11);
          unsigned __int8 ReportID = IOHIDElementGetReportID(v11);
          objc_msgSend(v5, "setHidReportID:", ReportID, (void)v15);
          goto LABEL_11;
        }
      }
      id v8 = [(__CFArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint32_t ReportSize = 0;
LABEL_11:

  return ReportSize;
}

- (BOOL)sendHIDReportToAccessory:(id)a3 forUARPMessage:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  id v10 = 0;
  BOOL v11 = 0;
  __int16 v12 = 0;
  if (!v7 || !v8) {
    goto LABEL_13;
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[UARPHIDUpdater sendHIDReportToAccessory:forUARPMessage:error:]";
    __int16 v38 = 2112;
    id v39 = v9;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: Sending uarpMsg %@ to accessory", buf, 0x16u);
  }
  dispatch_time_t v14 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessory:v7];
  if (v14)
  {
    __int16 v12 = v14;
    if ([v14 hidDeviceScheduled])
    {
      unsigned __int16 v35 = (unsigned __int16)[v9 length];
      id v10 = objc_alloc_init((Class)NSMutableData);
      long long v15 = [v12 transport];
      unsigned int v16 = [v15 containsString:@"Bluetooth"];

      if (v16)
      {
        buf[0] = [v12 hidReportID];
        [v10 appendBytes:buf length:1];
      }
      __int16 v34 = (self->_sessionID << 14) | 2;
      [v10 appendBytes:&v34 length:2];
      objc_msgSend(v12, "setHidMessageID:", (unsigned __int16)((unsigned __int16)objc_msgSend(v12, "hidMessageID") + 1));
      unsigned __int16 v33 = (unsigned __int16)[v12 hidMessageID];
      [v10 appendBytes:&v33 length:2];
      [v10 appendBytes:&v35 length:2];
      id v17 = v9;
      objc_msgSend(v10, "appendBytes:length:", objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"));
      id v18 = [v10 length];
      unsigned int v19 = [v12 hidReportSizeOutput];
      uint64_t v20 = self->_log;
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
      if ((unint64_t)v18 > v19)
      {
        if (v21)
        {
          __int16 v28 = v20;
          id v29 = (const char *)[v10 length];
          unsigned int v30 = [v12 hidReportSizeOutput];
          *(_DWORD *)buf = 134218240;
          v37 = v29;
          __int16 v38 = 1024;
          LODWORD(v39) = v30;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "ERROR: Size of outputReport %lu > HID Output Report Size from accessory descriptor %d", buf, 0x12u);
        }
      }
      else
      {
        if (v21)
        {
          *(_DWORD *)buf = 136315394;
          v37 = "-[UARPHIDUpdater sendHIDReportToAccessory:forUARPMessage:error:]";
          __int16 v38 = 2112;
          id v39 = v10;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s: Sending hidReport %@ to accessory", buf, 0x16u);
        }
        uint64_t v22 = (__IOHIDDevice *)[v12 hidDeviceRef];
        CFIndex v23 = [v12 hidReportID];
        id v10 = v10;
        BOOL v11 = 1;
        IOReturn v24 = IOHIDDeviceSetReport(v22, kIOHIDReportTypeOutput, v23, (const uint8_t *)[v10 bytes], (int)objc_msgSend(v10, "length"));
        if (!v24) {
          goto LABEL_13;
        }
        IOReturn v31 = v24;
        uint64_t v32 = self->_log;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v37) = v31;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Failed to send HID Report status = 0x%x\n", buf, 8u);
        }
      }
      BOOL v11 = 0;
      goto LABEL_13;
    }
    double v27 = self->_log;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[UARPHIDUpdater sendHIDReportToAccessory:forUARPMessage:error:]";
      __int16 v38 = 2112;
      id v39 = v7;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s: Unregistered UARPAccessory %@, dropping it", buf, 0x16u);
    }
    BOOL v11 = 0;
    id v10 = 0;
  }
  else
  {
    unsigned int v26 = self->_log;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[UARPHIDUpdater sendHIDReportToAccessory:forUARPMessage:error:]";
      __int16 v38 = 2112;
      id v39 = v7;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s: Unknown UARPAccessory %@, dropping it", buf, 0x16u);
    }
    BOOL v11 = 0;
    id v10 = 0;
    __int16 v12 = 0;
  }
LABEL_13:

  return v11;
}

- (id)matchingDictionaryForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[UARPSupportedAccessory findByAppleModelNumber:v4];
  CFArrayRef v6 = [v5 hardwareID];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = [v5 hardwareID];
    uint64_t v9 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v8 vendorID]);
    id v10 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v8 productID]);

    if (v9) {
      BOOL v11 = v10 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      __int16 v12 = [(UARPHIDUpdater *)self matchingDictionaryForVendorID:v9 productID:v10];
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v9 = 0;
    id v10 = 0;
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
    sub_10001C7AC();
  }
  __int16 v12 = 0;
LABEL_11:

  return v12;
}

- (id)matchingDictionaryForIdentifier:(id)a3 hardwareID:(UARPHIDHardwareID *)a4
{
  id v5 = a3;
  CFArrayRef v6 = +[UARPSupportedAccessory findByAppleModelNumber:v5];
  id v7 = [v6 hardwareID];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v9 = [v6 hardwareID];
    id v10 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v9 vendorID]);
    BOOL v11 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v9 productID]);

    if (v10) {
      BOOL v12 = v11 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12)
    {
      id v13 = [(UARPHIDUpdater *)self matchingDictionaryForVendorID:v10 productID:v11];
      goto LABEL_11;
    }
  }
  else
  {
    id v10 = 0;
    BOOL v11 = 0;
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
    sub_10001C7AC();
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (id)matchingDictionaryForVendorID:(id)a3 productID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedInt:70];
  id v8 = +[NSNumber numberWithUnsignedInt:65280];
  CFMutableDictionaryRef v9 = IOServiceMatching("IOHIDDevice");
  [(__CFDictionary *)v9 setObject:v6 forKey:@"VendorID"];

  [(__CFDictionary *)v9 setObject:v5 forKey:@"ProductID"];
  [(__CFDictionary *)v9 setObject:v7 forKey:@"DeviceUsage"];
  [(__CFDictionary *)v9 setObject:v8 forKey:@"DeviceUsagePage"];
  [(__CFDictionary *)v9 setObject:&__kCFBooleanTrue forKey:@"IOMatchLaunchStream"];

  return v9;
}

- (void)runHIDRegistrationThread:(id)a3
{
  [(UARPHIDUpdater *)self scheduleHIDDeviceForAccessory:a3];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_uarpHIDRegistrationThreadSemaphore);
  CFRunLoopRun();
}

- (void)stopHIDRegistrationThread
{
  Current = CFRunLoopGetCurrent();
  CFRunLoopStop(Current);
}

- (void)scheduleHIDDeviceForAccessory:(id)a3
{
  id v4 = a3;
  Current = CFRunLoopGetCurrent();
  IOHIDDeviceScheduleWithRunLoop((IOHIDDeviceRef)[v4 hidDeviceRef], Current, kCFRunLoopDefaultMode);
  [v4 setHidDeviceScheduled:1];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[UARPHIDUpdater scheduleHIDDeviceForAccessory:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: accessory=%@ now scheduled for HID Callbacks", (uint8_t *)&v7, 0x16u);
  }
}

- (void)unScheduleHIDDeviceForAccessory:(id)a3
{
  id v4 = a3;
  Current = CFRunLoopGetCurrent();
  IOHIDDeviceUnscheduleFromRunLoop((IOHIDDeviceRef)[v4 hidDeviceRef], Current, kCFRunLoopDefaultMode);
  [v4 setHidDeviceScheduled:0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[UARPHIDUpdater unScheduleHIDDeviceForAccessory:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: accessory=%@ now unscheduled for HID Callbacks", (uint8_t *)&v7, 0x16u);
  }
}

- (void)handleHIDDisconnectForAccessory:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 updateInProgress])
    {
      [v5 setUpdateInProgress:0];
      id v6 = [v5 uarpAccessory];
      [(UARPHIDUpdater *)self qReleasePowerAssertionForAccessory:v6];

      int v7 = [v5 uarpAccessory];
      [(UARPHIDUpdater *)self qPostStagingStatusNotificationForAccessory:v7 status:0];
    }
    uarpController = self->_uarpController;
    __int16 v9 = [v5 uarpAccessory];
    [(UARPController *)uarpController removeAccessory:v9];

    if (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      BOOL v12 = _NSConcreteStackBlock;
      uint64_t v13 = 3221225472;
      dispatch_time_t v14 = sub_10000DFB4;
      long long v15 = &unk_100028598;
      unsigned int v16 = self;
      id v17 = v5;
      dispatch_async(delegateQueue, &v12);
    }
    -[UARPHIDUpdater unRegisterHIDCallbacksForUARPHIDAccessory:](self, "unRegisterHIDCallbacksForUARPHIDAccessory:", v5, v12, v13, v14, v15, v16);
    [(NSMutableSet *)self->_uarpHIDAccessories removeObject:v5];
    [v5 handleHIDDisconnect];
    if (![(NSMutableSet *)self->_uarpHIDAccessories count])
    {
      BOOL v11 = self->_uarpController;
      self->_uarpController = 0;
    }
  }
}

- (void)parseInputReport:(id)a3 forAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E0D4;
  block[3] = &unk_1000286B0;
  id v12 = v6;
  id v13 = v7;
  dispatch_time_t v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(uarpHIDQueue, block);
}

- (void)processUARPMessage:(id)a3 fromAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  id v9 = 0;
  if (v6)
  {
    if (v7)
    {
      id v9 = [v7 uarpAccessory];

      if (v9)
      {
        uarpController = self->_uarpController;
        BOOL v11 = [v8 uarpAccessory];
        id v14 = 0;
        unsigned __int8 v12 = [(UARPController *)uarpController recvDataFromAccessory:v11 data:v6 error:&v14];
        id v9 = v14;

        if ((v12 & 1) == 0)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v16 = v9;
            _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "ERROR: Received UARPController recvDataFromAccessory error: %@", buf, 0xCu);
          }
        }
      }
    }
  }
}

- (void)stopPacketCapture
{
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E478;
  block[3] = &unk_100028818;
  void block[4] = self;
  dispatch_sync(uarpHIDQueue, block);
}

- (void)solicitDynamicAssetForAccessories:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E548;
  block[3] = &unk_1000286B0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(uarpHIDQueue, block);
}

- (void)removeAccessoryID:(id)a3
{
  id v4 = [(UARPHIDUpdater *)self getUARPHIDAccessoryForUARPAccessoryID:a3];
  if (v4)
  {
    uarpController = self->_uarpController;
    id v7 = v4;
    id v6 = [v4 uarpAccessory];
    [(UARPController *)uarpController accessoryUnreachable:v6];

    id v4 = v7;
  }
}

- (void)startTapToRadar:(id)a3
{
  id v4 = a3;
  uarpHIDQueue = self->_uarpHIDQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000E994;
  v7[3] = &unk_100028598;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(uarpHIDQueue, v7);
}

- (void)stopTapToRadar
{
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EA48;
  block[3] = &unk_100028818;
  void block[4] = self;
  dispatch_sync(uarpHIDQueue, block);
}

- (id)pendingTatsuRequests
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[UARPHIDUpdater pendingTatsuRequests]";
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s:", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_100002148;
  id v17 = sub_100002158;
  id v18 = (id)objc_opt_new();
  uarpHIDQueue = self->_uarpHIDQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000EC64;
  v9[3] = &unk_100028840;
  void v9[4] = self;
  v9[5] = &buf;
  dispatch_sync(uarpHIDQueue, v9);
  id v5 = self->_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)id v10 = 136315394;
    BOOL v11 = "-[UARPHIDUpdater pendingTatsuRequests]";
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s: Pending Tatsu Requests %@", v10, 0x16u);
  }
  id v7 = +[NSArray arrayWithArray:*(void *)(*((void *)&buf + 1) + 40)];
  _Block_object_dispose(&buf, 8);

  return v7;
}

- (void)tssResponse:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    BOOL v11 = "-[UARPHIDUpdater tssResponse:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: Tatsu Response, %@", buf, 0x16u);
  }
  uarpHIDQueue = self->_uarpHIDQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000EDF4;
  v8[3] = &unk_100028598;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(uarpHIDQueue, v8);
}

- (void)assetStagingPause:(id)a3
{
  id v4 = a3;
  uarpHIDQueue = self->_uarpHIDQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000EE98;
  v7[3] = &unk_100028598;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(uarpHIDQueue, v7);
}

- (void)assetStagingResume:(id)a3
{
  id v4 = a3;
  uarpHIDQueue = self->_uarpHIDQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000EF40;
  v7[3] = &unk_100028598;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(uarpHIDQueue, v7);
}

- (GoldRestoreUARPStatusDelegate)goldRestoreDelegate
{
  return (GoldRestoreUARPStatusDelegate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setGoldRestoreDelegate:(id)a3
{
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLog:(id)a3
{
}

- (OS_dispatch_queue)uarpHIDQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUarpHIDQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_goldRestoreDelegate, 0);
  objc_storeStrong((id *)&self->_stagingStatusNotificationTokens, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_uarpCaptureFileName, 0);
  objc_storeStrong((id *)&self->_uarpHIDRegistrationThreadSemaphore, 0);
  objc_storeStrong((id *)&self->_uarpHIDRegistrationThread, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_uarpHIDQueue, 0);
  objc_storeStrong((id *)&self->_uarpHIDAccessories, 0);
  objc_storeStrong((id *)&self->_uarpController, 0);
}

@end