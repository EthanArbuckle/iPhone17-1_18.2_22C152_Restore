@interface PowerUIAudioAccessorySmartChargeManager
+ (id)readArrayForPreferenceKey:(id)a3;
+ (id)readNumberForPreferenceKeyPrefix:(id)a3 andDevice:(id)a4;
+ (id)readStringForPreferenceKeyPrefix:(id)a3 andDevice:(id)a4;
+ (void)bulkDeleteDefaultsEntries:(id)a3;
+ (void)setArray:(id)a3 forPreferenceKey:(id)a4;
+ (void)setNumber:(id)a3 forPreferenceKeyPrefix:(id)a4 andDevice:(id)a5;
+ (void)setString:(id)a3 forPreferenceKeyPrefix:(id)a4 andDevice:(id)a5;
- (BOOL)firstNotificationDisplayed;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)runUpdateForDevice:(BTDeviceImpl *)a3 withHash:(id)a4;
- (BOOL)runUpdateForDevice:(BTDeviceImpl *)a3 withHash:(id)a4 asInitialUpdate:(BOOL)a5;
- (BOOL)setOBCState:(BOOL)a3 forDevice:(id)a4;
- (BOOL)setStateViaV2Protocol:(unint64_t)a3 forDevice:(BTDeviceImpl *)a4;
- (BTSessionImpl)session;
- (CBDiscovery)discovery;
- (NSDistributedNotificationCenter)notificationCenter;
- (NSLock)deviceArrayLock;
- (NSMutableArray)deviceArray;
- (NSMutableDictionary)acceptMessageFromLeftBudForDevice;
- (NSMutableDictionary)acceptMessageFromRightBudForDevice;
- (NSMutableDictionary)accessoryStates;
- (NSMutableDictionary)latestAnalyticsForDevice;
- (NSNumber)budSideToRecord;
- (NSNumber)hardcodedTimeBetweenUpdates;
- (NSNumber)hardcodedTimeDelta;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (OS_dispatch_semaphore)btConnectionSemaphore;
- (OS_os_log)accessoryLog;
- (PowerUIAudioAccessorySmartChargeManager)init;
- (PowerUIBluetoothHandler)btHandler;
- (PowerUIMLAudioAccessoryModelPredictor)predictor;
- (PowerUIWalletSignalMonitor)walletMonitor;
- (id)defaultDateToDisableUntilGivenDate:(id)a3;
- (id)firstUseNotificationRequestForDeviceType:(unsigned int)a3;
- (id)getOBCDeadlineFromCBDevice:(id)a3;
- (id)nameForProductID:(unsigned int)a3;
- (id)returnAccessoryStatusForDevice:(id)a3;
- (id)stringFromState:(unint64_t)a3;
- (unint64_t)sendTimeDeltaInSeconds:(unsigned int)a3 toAccessory:(BTDeviceImpl *)a4;
- (void)addTimeSeriesDataToStream:(timeSeriesData *)a3 withSide:(unsigned __int8)a4 withFirmwareVersion:(unsigned __int16)a5 withLog:(id)a6;
- (void)attachToBluetoothSession;
- (void)clearLastActionForDevice:(id)a3;
- (void)client:(id)a3 connectAndDisableOBCforDevice:(id)a4 withHandler:(id)a5;
- (void)client:(id)a3 setState:(unint64_t)a4 forDevice:(id)a5 withHandler:(id)a6;
- (void)client:(id)a3 updateOBCDeadline:(id)a4 forDevice:(id)a5 withHandler:(id)a6;
- (void)currentLeewayWithHandler:(id)a3;
- (void)deleteRecordsForDevices:(id)a3;
- (void)engageUntil:(id)a3 forDevice:(id)a4 overrideAllSignals:(BOOL)a5 withHandler:(id)a6;
- (void)fakeConnectionForDevice:(id)a3;
- (void)fullChargeDeadlineForDevice:(id)a3 withHandler:(id)a4;
- (void)getAvailableDevicesWithHandler:(id)a3;
- (void)getStatusForDevice:(id)a3 withHandler:(id)a4;
- (void)isSmartChargingCurrentlyEnabledForDevice:(id)a3 withHandler:(id)a4;
- (void)lastActionForDevice:(id)a3 withHandler:(id)a4;
- (void)monitor:(id)a3 maySuggestNewFullChargeDeadline:(id)a4;
- (void)persistentlyHandleSeeingDevice:(id)a3;
- (void)persistentlySetExpectedHash:(id)a3 forDevice:(id)a4;
- (void)persistentlySetLastSentDate:(id)a3 forDevice:(id)a4;
- (void)persistentlySetLastTimeseriesDate:(id)a3 forDevice:(id)a4;
- (void)persistentlySetLastUnderchargeRecordedForPrediction:(id)a3 forDevice:(id)a4;
- (void)persistentlySetStatusForDevice:(id)a3 withCurrentState:(unint64_t)a4 withEnabled:(BOOL)a5 withDisabledUntilDate:(id)a6 withTemporarilyDisabled:(BOOL)a7;
- (void)recordBudMetricsLocallyForDevice:(id)a3 withTimeSpendAtLowerSoC:(unsigned __int16)a4 timeSpentAtHigherSoC:(unsigned __int16)a5 engagementEventsSinceLastReport:(unsigned __int8)a6 underchargeEventsSinceLastReport:(unsigned __int8)a7 chargingEventsSinceLastReport:(unsigned __int8)a8 budSocAtLastEngagement:(unsigned __int8)a9 successRatio:(unsigned __int16)a10;
- (void)reportDailyMetrics;
- (void)reportSessionMetricsForSide:(unsigned __int8)a3 withTimeSpendAtLowerSoC:(unsigned __int16)a4 timeSpentAtHigherSoC:(unsigned __int16)a5 engagementEventsSinceLastReport:(unsigned __int8)a6 underchargeEventsSinceLastReport:(unsigned __int8)a7 chargingEventsSinceLastReport:(unsigned __int8)a8 budSocAtLastEngagement:(unsigned __int8)a9 successRatio:(unsigned __int16)a10 deviceType:(id)a11;
- (void)setAcceptMessageFromLeftBudForDevice:(id)a3;
- (void)setAcceptMessageFromRightBudForDevice:(id)a3;
- (void)setAccessoryLog:(id)a3;
- (void)setAccessoryStates:(id)a3;
- (void)setBtConnectionSemaphore:(id)a3;
- (void)setBtHandler:(id)a3;
- (void)setBudSideToRecord:(id)a3;
- (void)setDeviceArray:(id)a3;
- (void)setDeviceArrayLock:(id)a3;
- (void)setDiscovery:(id)a3;
- (void)setFakeConnectionStatusTo:(BOOL)a3;
- (void)setFirstNotificationDisplayed:(BOOL)a3;
- (void)setHardcodedTimeBetweenUpdates:(id)a3;
- (void)setHardcodedTimeDelta:(id)a3;
- (void)setLatestAnalyticsForDevice:(id)a3;
- (void)setListener:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setPredictor:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSession:(BTSessionImpl *)a3;
- (void)setTemporarilyDisabled:(BOOL)a3 until:(id)a4 forDevice:(id)a5;
- (void)setWalletMonitor:(id)a3;
- (void)startMockingBluetoothForFakeDevice:(id)a3;
- (void)stopMockingBluetooth;
- (void)timeSeriesForDevice:(id)a3;
- (void)unfilteredDeadlineForDevice:(id)a3 withHandler:(id)a4;
@end

@implementation PowerUIAudioAccessorySmartChargeManager

- (PowerUIAudioAccessorySmartChargeManager)init
{
  uint64_t v134 = *MEMORY[0x263EF8340];
  v128.receiver = self;
  v128.super_class = (Class)PowerUIAudioAccessorySmartChargeManager;
  v2 = [(PowerUIAudioAccessorySmartChargeManager *)&v128 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.powerui.smartcharging.AudioAccessory", "main");
    accessoryLog = v2->_accessoryLog;
    v2->_accessoryLog = (OS_os_log *)v3;

    v5 = v2->_accessoryLog;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, v5, OS_LOG_TYPE_DEFAULT, "PowerUIAudioAccessorySmartChargeManager initializing...", buf, 2u);
    }
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.PowerUIAgent.btQueue", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    latestAnalyticsForDevice = v2->_latestAnalyticsForDevice;
    v2->_latestAnalyticsForDevice = (NSMutableDictionary *)v9;

    v11 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    deviceArrayLock = v2->_deviceArrayLock;
    v2->_deviceArrayLock = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    accessoryStates = v2->_accessoryStates;
    v2->_accessoryStates = v13;

    unint64_t v15 = 0x2645A5000uLL;
    uint64_t v16 = +[PowerUIAudioAccessorySmartChargeManager readArrayForPreferenceKey:@"com.apple.smartcharging.audioaccessories.deviceArray"];
    deviceArray = v2->_deviceArray;
    v2->_deviceArray = (NSMutableArray *)v16;

    if (!v2->_deviceArray)
    {
      v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      v19 = v2->_deviceArray;
      v2->_deviceArray = v18;

      v20 = v2->_accessoryLog;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22135E000, v20, OS_LOG_TYPE_DEFAULT, "No deviceArray loaded, set up new", buf, 2u);
      }
    }
    v21 = v2->_accessoryLog;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v2->_deviceArray;
      v23 = v21;
      uint64_t v24 = [(NSMutableArray *)v22 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v130 = v24;
      _os_log_impl(&dword_22135E000, v23, OS_LOG_TYPE_DEFAULT, "Device array with %lu entries was loaded", buf, 0xCu);
    }
    id v105 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v124 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    obj = v2->_deviceArray;
    uint64_t v108 = [(NSMutableArray *)obj countByEnumeratingWithState:&v124 objects:v133 count:16];
    if (v108)
    {
      uint64_t v106 = *(void *)v125;
      *(void *)&long long v25 = 138412546;
      long long v103 = v25;
      v107 = v2;
      do
      {
        for (uint64_t i = 0; i != v108; ++i)
        {
          if (*(void *)v125 != v106) {
            objc_enumerationMutation(obj);
          }
          uint64_t v27 = *(void *)(*((void *)&v124 + 1) + 8 * i);
          v28 = objc_alloc_init(PowerUIAccessoryStatus);
          v29 = [*(id *)(v15 + 2360) readNumberForPreferenceKeyPrefix:@"com.apple.smartcharging.audioaccessories.currentState." andDevice:v27];
          if (!v29)
          {
            v30 = v2->_accessoryLog;
            v29 = &unk_26D385588;
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v130 = v27;
              _os_log_error_impl(&dword_22135E000, v30, OS_LOG_TYPE_ERROR, "ERROR: No proper value stored for 'currentState' for device '%@'", buf, 0xCu);
            }
          }
          -[PowerUIAccessoryStatus setCurrentState:](v28, "setCurrentState:", objc_msgSend(v29, "unsignedIntegerValue", v103));
          v31 = [*(id *)(v15 + 2360) readNumberForPreferenceKeyPrefix:@"com.apple.smartcharging.audioaccessories.enabled." andDevice:v27];
          if (!v31)
          {
            v32 = v2->_accessoryLog;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v130 = v27;
              _os_log_error_impl(&dword_22135E000, v32, OS_LOG_TYPE_ERROR, "ERROR: No proper value stored for 'enabled' for device '%@'", buf, 0xCu);
            }
            v31 = [NSNumber numberWithBool:1];
          }
          -[PowerUIAccessoryStatus setEnabled:](v28, "setEnabled:", [v31 BOOLValue]);
          v33 = [*(id *)(v15 + 2360) readNumberForPreferenceKeyPrefix:@"com.apple.smartcharging.audioaccessories.disabledUntilDate." andDevice:v27];
          v109 = v33;
          v110 = v29;
          if (v33)
          {
            v34 = (void *)MEMORY[0x263EFF910];
            [v33 doubleValue];
            v35 = objc_msgSend(v34, "dateWithTimeIntervalSinceReferenceDate:");
            [v35 timeIntervalSinceNow];
            if (v36 >= 0.0)
            {
              double v37 = v36;
              [(PowerUIAccessoryStatus *)v28 setDisabledUntilDate:v35];
              [(PowerUIAccessoryStatus *)v28 setTemporarilyDisabled:1];
              dispatch_time_t v38 = dispatch_walltime(0, (uint64_t)(v37 * 1000000000.0));
              v39 = v2->_queue;
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke;
              block[3] = &unk_2645A6878;
              v122 = v2;
              uint64_t v123 = v27;
              dispatch_after(v38, v39, block);
              v40 = v2->_accessoryLog;
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v103;
                uint64_t v130 = v27;
                __int16 v131 = 2048;
                double v132 = v37 / 60.0;
                _os_log_impl(&dword_22135E000, v40, OS_LOG_TYPE_DEFAULT, "PowerUI restart: Re-enable device '%@' in %f minutes", buf, 0x16u);
              }
            }
            else
            {
              [(PowerUIAccessoryStatus *)v28 setDisabledUntilDate:0];
              [(PowerUIAccessoryStatus *)v28 setTemporarilyDisabled:0];
            }
          }
          else
          {
            [(PowerUIAccessoryStatus *)v28 setDisabledUntilDate:0];
            [(PowerUIAccessoryStatus *)v28 setTemporarilyDisabled:0];
          }
          v41 = [*(id *)(v15 + 2360) readNumberForPreferenceKeyPrefix:@"com.apple.smartcharging.audioaccessories.lastSentDate." andDevice:v27];
          v42 = v41;
          if (v41)
          {
            v43 = (void *)MEMORY[0x263EFF910];
            [v41 doubleValue];
            v44 = objc_msgSend(v43, "dateWithTimeIntervalSinceReferenceDate:");
            [(PowerUIAccessoryStatus *)v28 setLastSentDate:v44];
          }
          else
          {
            [(PowerUIAccessoryStatus *)v28 setLastSentDate:0];
          }
          v45 = [*(id *)(v15 + 2360) readNumberForPreferenceKeyPrefix:@"com.apple.smartcharging.audioaccessories.lastSeenDate." andDevice:v27];
          v46 = v45;
          if (!v45)
          {
            [(PowerUIAccessoryStatus *)v28 setLastSeenDate:0];
LABEL_36:
            [v105 addObject:v27];
            goto LABEL_37;
          }
          v47 = (void *)MEMORY[0x263EFF910];
          [v45 doubleValue];
          v48 = objc_msgSend(v47, "dateWithTimeIntervalSinceReferenceDate:");
          [(PowerUIAccessoryStatus *)v28 setLastSeenDate:v48];

          v49 = [MEMORY[0x263EFF910] date];
          v50 = [(PowerUIAccessoryStatus *)v28 lastSeenDate];
          [v49 timeIntervalSinceDate:v50];
          double v52 = v51;

          unint64_t v15 = 0x2645A5000;
          if (v52 > 2592000.0) {
            goto LABEL_36;
          }
LABEL_37:
          v53 = [*(id *)(v15 + 2360) readNumberForPreferenceKeyPrefix:@"com.apple.smartcharging.audioaccessories.lastTimeseriesDate." andDevice:v27];
          v54 = v53;
          v55 = (void *)MEMORY[0x263EFF910];
          if (v53)
          {
            [v53 doubleValue];
            objc_msgSend(v55, "dateWithTimeIntervalSinceReferenceDate:");
          }
          else
          {
            [MEMORY[0x263EFF910] distantPast];
          v56 = };
          [(PowerUIAccessoryStatus *)v28 setLastTimeseriesDate:v56];

          v57 = [*(id *)(v15 + 2360) readNumberForPreferenceKeyPrefix:@"com.apple.smartcharging.audioaccessories.lastUnderchargeRecordedForPrediction." andDevice:v27];
          v58 = v57;
          if (v57)
          {
            v59 = (void *)MEMORY[0x263EFF910];
            [v57 doubleValue];
            v60 = objc_msgSend(v59, "dateWithTimeIntervalSinceReferenceDate:");
            [(PowerUIAccessoryStatus *)v28 setLastUnderchargeRecordedForPrediction:v60];
          }
          else
          {
            [(PowerUIAccessoryStatus *)v28 setLastUnderchargeRecordedForPrediction:0];
          }
          v61 = +[PowerUIAudioAccessorySmartChargeManager readStringForPreferenceKeyPrefix:@"com.apple.smartcharging.audioaccessories.expectedHash." andDevice:v27];
          if (v61)
          {
            id v62 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v61];
          }
          else
          {
            v63 = v2->_accessoryLog;
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v130 = v27;
              _os_log_impl(&dword_22135E000, v63, OS_LOG_TYPE_DEFAULT, "No proper value stored for 'expectedHash' for device '%@'", buf, 0xCu);
            }
            id v62 = objc_alloc_init(MEMORY[0x263F08C38]);
          }
          v64 = v62;
          [(PowerUIAccessoryStatus *)v28 setExpectedHash:v62];

          v2 = v107;
          [(NSMutableDictionary *)v107->_accessoryStates setObject:v28 forKey:v27];

          unint64_t v15 = 0x2645A5000;
        }
        uint64_t v108 = [(NSMutableArray *)obj countByEnumeratingWithState:&v124 objects:v133 count:16];
      }
      while (v108);
    }

    v65 = v2->_accessoryLog;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      v66 = v2->_accessoryStates;
      v67 = v65;
      uint64_t v68 = [(NSMutableDictionary *)v66 count];
      double v69 = COERCE_DOUBLE([v105 count]);
      *(_DWORD *)buf = 134218240;
      uint64_t v130 = v68;
      __int16 v131 = 2048;
      double v132 = v69;
      _os_log_impl(&dword_22135E000, v67, OS_LOG_TYPE_DEFAULT, "AccessoryStates dict with %lu entries was loaded, %lu devices are old", buf, 0x16u);
    }
    [(PowerUIAudioAccessorySmartChargeManager *)v2 deleteRecordsForDevices:v105];
    v70 = objc_alloc_init(PowerUIMLAudioAccessoryModelPredictor);
    predictor = v2->_predictor;
    v2->_predictor = v70;

    [(PowerUIAudioAccessorySmartChargeManager *)v2 attachToBluetoothSession];
    uint64_t v72 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.powerui.audioAccessorySmartChargeManager"];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v72;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
    uint64_t v74 = [MEMORY[0x263F087C8] defaultCenter];
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (NSDistributedNotificationCenter *)v74;

    dispatch_semaphore_t v76 = dispatch_semaphore_create(0);
    btConnectionSemaphore = v2->_btConnectionSemaphore;
    v2->_btConnectionSemaphore = (OS_dispatch_semaphore *)v76;

    uint64_t v78 = +[PowerUIWalletSignalMonitor monitorWithDelegate:v2];
    walletMonitor = v2->_walletMonitor;
    v2->_walletMonitor = (PowerUIWalletSignalMonitor *)v78;

    uint64_t v80 = +[PowerUISmartChargeUtilities numberForPreferenceKey:@"com.apple.smartcharging.audioaccessories.hardcodedTimeDeltaInSeconds" inDomain:@"com.apple.smartcharging.topoffprotection.audioaccessories"];
    hardcodedTimeDelta = v2->_hardcodedTimeDelta;
    v2->_hardcodedTimeDelta = (NSNumber *)v80;

    uint64_t v82 = +[PowerUISmartChargeUtilities numberForPreferenceKey:@"com.apple.smartcharging.audioaccessories.hardcodedTimeBetweenUpdatesInSeconds" inDomain:@"com.apple.smartcharging.topoffprotection.audioaccessories"];
    hardcodedTimeBetweenUpdates = v2->_hardcodedTimeBetweenUpdates;
    v2->_hardcodedTimeBetweenUpdates = (NSNumber *)v82;

    v84 = +[PowerUISmartChargeUtilities numberForPreferenceKey:@"firstNoteDisplayed" inDomain:@"com.apple.smartcharging.topoffprotection.audioaccessories"];
    v2->_firstNotificationDisplayed = [v84 BOOLValue];

    uint64_t v85 = +[PowerUISmartChargeUtilities numberForPreferenceKey:@"com.apple.smartcharging.audioaccessories.budSideToRecord" inDomain:@"com.apple.smartcharging.topoffprotection.audioaccessories"];
    budSideToRecord = v2->_budSideToRecord;
    v2->_budSideToRecord = (NSNumber *)v85;

    if (!v2->_budSideToRecord)
    {
      uint64_t v87 = [NSNumber numberWithUnsignedInt:arc4random_uniform(2u) + 1];
      v88 = v2->_budSideToRecord;
      v2->_budSideToRecord = (NSNumber *)v87;

      +[PowerUISmartChargeUtilities setNumber:v2->_budSideToRecord forPreferenceKey:@"com.apple.smartcharging.audioaccessories.budSideToRecord" inDomain:@"com.apple.smartcharging.topoffprotection.audioaccessories"];
    }
    v89 = (void *)*MEMORY[0x263EF8188];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_288;
    handler[3] = &unk_2645A6698;
    v90 = v2;
    v120 = v90;
    xpc_activity_register("com.apple.poweruiagent.audioAccessoriesDailyMetrics", v89, handler);
    v91 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    acceptMessageFromRightBudForDevice = v90->_acceptMessageFromRightBudForDevice;
    v90->_acceptMessageFromRightBudForDevice = v91;

    v93 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    acceptMessageFromLeftBudForDevice = v90->_acceptMessageFromLeftBudForDevice;
    v90->_acceptMessageFromLeftBudForDevice = v93;

    v95 = objc_alloc_init(PowerUIBluetoothHandler);
    btHandler = v90->_btHandler;
    v90->_btHandler = v95;

    *(_DWORD *)buf = 0;
    v97 = v2->_queue;
    v117[0] = MEMORY[0x263EF8330];
    v117[1] = 3221225472;
    v117[2] = __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_292;
    v117[3] = &unk_2645A5CA8;
    v98 = v90;
    v118 = v98;
    notify_register_dispatch("com.apple.powerui.audioAccessoryFirstUseNote", (int *)buf, v97, v117);
    int out_token = 0;
    v99 = v2->_queue;
    v114[0] = MEMORY[0x263EF8330];
    v114[1] = 3221225472;
    v114[2] = __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_296;
    v114[3] = &unk_2645A5CA8;
    v100 = v98;
    v115 = v100;
    notify_register_dispatch("com.apple.powerui.startBTScan", &out_token, v99, v114);
    int v113 = 0;
    v101 = v2->_queue;
    v111[0] = MEMORY[0x263EF8330];
    v111[1] = 3221225472;
    v111[2] = __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_304;
    v111[3] = &unk_2645A5CA8;
    v112 = v100;
    notify_register_dispatch("com.apple.powerui.stopBTScan", &v113, v101, v111);
  }
  return v2;
}

uint64_t __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTemporarilyDisabled:0 until:0 forDevice:*(void *)(a1 + 40)];
}

void __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_288(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    v5 = *(void **)(a1 + 32);
    [v5 reportDailyMetrics];
  }
  else if (!state)
  {
    v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_22135E000, v4, OS_LOG_TYPE_DEFAULT, "Daily metrics checking in!", v6, 2u);
    }
  }
}

void __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_292(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_22135E000, v2, OS_LOG_TYPE_DEFAULT, "First use note was called", v6, 2u);
  }
  os_log_t v3 = +[PowerUINotificationManager sharedInstance];
  v4 = [*(id *)(a1 + 32) firstUseNotificationRequestForDeviceType:8206];
  id v5 = (id)[v3 postNotificationWithRequest:v4];
}

void __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_296(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22135E000, v2, OS_LOG_TYPE_DEFAULT, "startBTScan was called", buf, 2u);
  }
  id v3 = objc_alloc_init(MEMORY[0x263EFEF30]);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 152);
  *(void *)(v4 + 152) = v3;

  [*(id *)(*(void *)(a1 + 32) + 152) setDiscoveryFlags:0x20000000];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_298;
  v23[3] = &unk_2645A68A0;
  objc_copyWeak(&v24, &location);
  [*(id *)(*(void *)(a1 + 32) + 152) setDeviceFoundHandler:v23];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_300;
  v21[3] = &unk_2645A68A0;
  objc_copyWeak(&v22, &location);
  [*(id *)(*(void *)(a1 + 32) + 152) setDeviceLostHandler:v21];
  v6 = *(void **)(a1 + 32);
  dispatch_queue_t v7 = (void *)v6[19];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_301;
  v19[3] = &unk_2645A5FA8;
  v20 = v6;
  [v7 activateWithCompletion:v19];
  [MEMORY[0x263EFEF30] devicesWithDiscoveryFlags:0x20000000 error:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v13 = *(id *)(*(void *)(a1 + 32) + 40);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = [v12 identifier];
          *(_DWORD *)buf = 138412290;
          uint64_t v27 = v14;
          _os_log_impl(&dword_22135E000, v13, OS_LOG_TYPE_DEFAULT, "device array: %@", buf, 0xCu);
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v28 count:16];
    }
    while (v9);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_298(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained accessoryLog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v3 identifier];
    dispatch_queue_t v7 = NSNumber;
    [v3 accessoryStatusOBCTime];
    id v8 = objc_msgSend(v7, "numberWithDouble:");
    int v9 = 138412546;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_22135E000, v5, OS_LOG_TYPE_DEFAULT, "Device found: %@ - Reported time interval: %@", (uint8_t *)&v9, 0x16u);
  }
}

void __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_300(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained accessoryLog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v3 stableIdentifier];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_22135E000, v5, OS_LOG_TYPE_DEFAULT, "Device lost: %@", (uint8_t *)&v7, 0xCu);
  }
}

void __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_301(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_22135E000, v4, OS_LOG_TYPE_DEFAULT, "Error: %@", (uint8_t *)&v5, 0xCu);
  }
}

uint64_t __47__PowerUIAudioAccessorySmartChargeManager_init__block_invoke_304(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_22135E000, v2, OS_LOG_TYPE_DEFAULT, "stopBTScan was called", v4, 2u);
  }
  return [*(id *)(*(void *)(a1 + 32) + 152) invalidate];
}

- (id)returnAccessoryStatusForDevice:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    int v5 = [(NSMutableDictionary *)self->_accessoryStates objectForKey:v4];
    if (!v5)
    {
      int v5 = objc_alloc_init(PowerUIAccessoryStatus);
      [(NSMutableDictionary *)self->_accessoryStates setObject:v5 forKey:v4];
      uint64_t v6 = [(PowerUIAccessoryStatus *)v5 currentState];
      uint64_t v7 = [(PowerUIAccessoryStatus *)v5 enabled];
      id v8 = [(PowerUIAccessoryStatus *)v5 disabledUntilDate];
      [(PowerUIAudioAccessorySmartChargeManager *)self persistentlySetStatusForDevice:v4 withCurrentState:v6 withEnabled:v7 withDisabledUntilDate:v8 withTemporarilyDisabled:[(PowerUIAccessoryStatus *)v5 temporarilyDisabled]];

      [(NSLock *)self->_deviceArrayLock lock];
      [(NSMutableArray *)self->_deviceArray addObject:v4];
      +[PowerUIAudioAccessorySmartChargeManager setArray:self->_deviceArray forPreferenceKey:@"com.apple.smartcharging.audioaccessories.deviceArray"];
      accessoryLog = self->_accessoryLog;
      if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v4;
        _os_log_impl(&dword_22135E000, accessoryLog, OS_LOG_TYPE_DEFAULT, "Add new device '%@' to deviceArray", (uint8_t *)&v11, 0xCu);
      }
      [(NSLock *)self->_deviceArrayLock unlock];
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_accessoryLog, OS_LOG_TYPE_ERROR)) {
      -[PowerUIAudioAccessorySmartChargeManager returnAccessoryStatusForDevice:]();
    }
    int v5 = objc_alloc_init(PowerUIAccessoryStatus);
  }

  return v5;
}

- (void)attachToBluetoothSession
{
}

- (void)addTimeSeriesDataToStream:(timeSeriesData *)a3 withSide:(unsigned __int8)a4 withFirmwareVersion:(unsigned __int16)a5 withLog:(id)a6
{
  unsigned int v47 = a5;
  int v6 = a4;
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v8 = a6;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  uint64_t v58 = 0;
  v49 = (void *)[objc_alloc(MEMORY[0x263F2A8B0]) initWithStartDate:0 endDate:0 maxEvents:0 lastN:0 reversed:1];
  uint64_t v9 = BiomeLibrary();
  uint64_t v10 = [v9 Device];
  int v11 = [v10 Charging];
  id v12 = [v11 AccessoryChargingSession];
  uint64_t v13 = [v12 publisherWithOptions:v49];
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __106__PowerUIAudioAccessorySmartChargeManager_addTimeSeriesDataToStream_withSide_withFirmwareVersion_withLog___block_invoke;
  v53[3] = &__block_descriptor_33_e22_B16__0__BMStoreEvent_8l;
  char v54 = v6;
  v14 = [v13 filterWithIsIncluded:v53];
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __106__PowerUIAudioAccessorySmartChargeManager_addTimeSeriesDataToStream_withSide_withFirmwareVersion_withLog___block_invoke_2;
  v51[3] = &unk_2645A5C58;
  long long v15 = v8;
  double v52 = v15;
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __106__PowerUIAudioAccessorySmartChargeManager_addTimeSeriesDataToStream_withSide_withFirmwareVersion_withLog___block_invoke_326;
  v50[3] = &unk_2645A6198;
  v50[4] = &v55;
  id v16 = (id)[v14 sinkWithCompletion:v51 shouldContinue:v50];

  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = v56[3];
    *(_DWORD *)buf = 134218240;
    *(void *)v60 = v17;
    *(_WORD *)&v60[8] = 1024;
    *(_DWORD *)&v60[10] = v6;
    _os_log_impl(&dword_22135E000, v15, OS_LOG_TYPE_INFO, "Previous end date set to %llu from previous record for bud side: %hhu.", buf, 0x12u);
  }
  int v48 = 0;
  unint64_t v18 = 0;
  int v19 = v6 == 2;
  if (v6 == 1) {
    int v19 = 2;
  }
  unsigned int v46 = v19;
  while (1)
  {
    v20 = &a3[v18];
    p_var1 = &v20->var1;
    if (!v20->var1) {
      break;
    }
    if (v20->var2 && (unint64_t v22 = v18 + 1, v23 = &a3[v18 + 1], v23->var2))
    {
      if (v20->var1 == 1)
      {
        if (a3[v22].var1 == 2)
        {
          if (v23->var0 >= v20->var0)
          {
            if (v56[3] > v20->var0)
            {
              v30 = v15;
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                v31 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)(unint64_t)v56[3]];
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v60 = v18;
                *(_WORD *)&v60[4] = 2112;
                *(void *)&v60[6] = v31;
                _os_log_impl(&dword_22135E000, v30, OS_LOG_TYPE_INFO, "Skipping event at i == %d because startDate is earlier than previous end date (%@)", buf, 0x12u);
              }
              goto LABEL_23;
            }
            if (v23->var0 - v20->var0 < 0x278D01)
            {
              id v32 = objc_alloc(MEMORY[0x263F2A038]);
              v33 = [NSNumber numberWithUnsignedShort:v47];
              v34 = [NSNumber numberWithUnsignedLongLong:v20->var0];
              v35 = [NSNumber numberWithUnsignedLongLong:v23->var0];
              double v36 = (void *)[v32 initWithProductID:&unk_26D3855D0 firmwareVersion:v33 startTimestamp:v34 endTimestamp:v35 side:v46];

              double v37 = BiomeLibrary();
              dispatch_time_t v38 = [v37 Device];
              v39 = [v38 Charging];
              v40 = [v39 AccessoryChargingSession];
              v41 = [v40 source];
              [v41 sendEvent:v36];

              ++v48;
              unint64_t v18 = v22;
              goto LABEL_23;
            }
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v60 = v18;
              id v24 = v15;
              long long v25 = "Skipping event at i == %d because charge duration was longer than 30 days";
LABEL_16:
              uint32_t v26 = 8;
LABEL_22:
              _os_log_impl(&dword_22135E000, v24, OS_LOG_TYPE_INFO, v25, buf, v26);
            }
          }
          else if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v60 = v18;
            id v24 = v15;
            long long v25 = "Skipping event at i == %d because startDate is later than endDate";
            goto LABEL_16;
          }
        }
        else if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v28 = *p_var1;
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v60 = v18;
          *(_WORD *)&v60[4] = 1024;
          *(_DWORD *)&v60[6] = v28;
          id v24 = v15;
          long long v25 = "Skipping event at i == %d because event data at i+1 is %hhu (!= 2).";
          goto LABEL_21;
        }
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v27 = *p_var1;
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v60 = v18;
        *(_WORD *)&v60[4] = 1024;
        *(_DWORD *)&v60[6] = v27;
        id v24 = v15;
        long long v25 = "Skipping event at i == %d because event data is %hhu (!= 1).";
LABEL_21:
        uint32_t v26 = 14;
        goto LABEL_22;
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v60 = v18;
      id v24 = v15;
      long long v25 = "Skipping event at i == %d because 'offset' is FALSE for i or i+1.";
      goto LABEL_16;
    }
LABEL_23:
    if (v18++ >= 0x60) {
      goto LABEL_36;
    }
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v60 = v18;
    _os_log_impl(&dword_22135E000, v15, OS_LOG_TYPE_INFO, "Reached end of records at i == %d", buf, 8u);
  }
LABEL_36:
  BOOL v42 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v48 < 1)
  {
    if (v42)
    {
      *(_WORD *)buf = 0;
      v43 = "No valid charging time series events found for accessory.";
      v44 = v15;
      uint32_t v45 = 2;
LABEL_41:
      _os_log_impl(&dword_22135E000, v44, OS_LOG_TYPE_INFO, v43, buf, v45);
    }
  }
  else if (v42)
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v60 = v48;
    v43 = "Saved %d charging time series events to stream.";
    v44 = v15;
    uint32_t v45 = 8;
    goto LABEL_41;
  }

  _Block_object_dispose(&v55, 8);
}

uint64_t __106__PowerUIAudioAccessorySmartChargeManager_addTimeSeriesDataToStream_withSide_withFirmwareVersion_withLog___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 eventBody];
  if ([v4 side] == 1)
  {
    int v5 = *(unsigned __int8 *)(a1 + 32);

    if (v5 == 2)
    {
      uint64_t v6 = 1;
      goto LABEL_10;
    }
  }
  else
  {
  }
  uint64_t v7 = [v3 eventBody];
  if ([v7 side] == 2)
  {
    uint64_t v6 = *(unsigned __int8 *)(a1 + 32);

    if (v6 == 1) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  uint64_t v6 = 0;
LABEL_10:

  return v6;
}

void __106__PowerUIAudioAccessorySmartChargeManager_addTimeSeriesDataToStream_withSide_withFirmwareVersion_withLog___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    id v4 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __106__PowerUIAudioAccessorySmartChargeManager_addTimeSeriesDataToStream_withSide_withFirmwareVersion_withLog___block_invoke_2_cold_1(v4, v3);
    }
  }
}

uint64_t __106__PowerUIAudioAccessorySmartChargeManager_addTimeSeriesDataToStream_withSide_withFirmwareVersion_withLog___block_invoke_326(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  [v3 endTimestamp];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (unint64_t)v4;

  return 0;
}

- (void)recordBudMetricsLocallyForDevice:(id)a3 withTimeSpendAtLowerSoC:(unsigned __int16)a4 timeSpentAtHigherSoC:(unsigned __int16)a5 engagementEventsSinceLastReport:(unsigned __int8)a6 underchargeEventsSinceLastReport:(unsigned __int8)a7 chargingEventsSinceLastReport:(unsigned __int8)a8 budSocAtLastEngagement:(unsigned __int8)a9 successRatio:(unsigned __int16)a10
{
  unsigned int v47 = a7;
  unsigned int v48 = a8;
  unsigned int v45 = a5;
  unsigned int v46 = a6;
  unsigned int v44 = a4;
  uint64_t v10 = [NSString stringWithFormat:@"%@.budMetrics", a3];
  int v11 = (void *)MEMORY[0x263EFF9A0];
  id v49 = (id)v10;
  id v12 = +[PowerUISmartChargeUtilities readDictForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "readDictForPreferenceKey:inDomain:");
  uint64_t v13 = [v11 dictionaryWithDictionary:v12];

  uint64_t v14 = 4;
  do
  {
    long long v15 = objc_msgSend(NSString, "stringWithFormat:", @"%d.timeSpentAtLowerSoC", v14);
    id v16 = [v13 objectForKeyedSubscript:v15];
    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%d.timeSpentAtLowerSoC", (v14 + 1));
    [v13 setObject:v16 forKeyedSubscript:v17];

    unint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"%d.timeSpentAtHigherSoC", v14);
    int v19 = [v13 objectForKeyedSubscript:v18];
    v20 = objc_msgSend(NSString, "stringWithFormat:", @"%d.timeSpentAtHigherSoC", (v14 + 1));
    [v13 setObject:v19 forKeyedSubscript:v20];

    v21 = objc_msgSend(NSString, "stringWithFormat:", @"%d.engagementEventsSinceLastReport", v14);
    unint64_t v22 = [v13 objectForKeyedSubscript:v21];
    v23 = objc_msgSend(NSString, "stringWithFormat:", @"%d.engagementEventsSinceLastReport", (v14 + 1));
    [v13 setObject:v22 forKeyedSubscript:v23];

    id v24 = objc_msgSend(NSString, "stringWithFormat:", @"%d.underchargeEventsSinceLastReport", v14);
    long long v25 = [v13 objectForKeyedSubscript:v24];
    uint32_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"%d.underchargeEventsSinceLastReport", (v14 + 1));
    [v13 setObject:v25 forKeyedSubscript:v26];

    int v27 = objc_msgSend(NSString, "stringWithFormat:", @"%d.chargingEventsSinceLastReport", v14);
    int v28 = [v13 objectForKeyedSubscript:v27];
    uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"%d.chargingEventsSinceLastReport", (v14 + 1));
    [v13 setObject:v28 forKeyedSubscript:v29];

    v30 = objc_msgSend(NSString, "stringWithFormat:", @"%d.budSocAtLastEngagement", v14);
    v31 = [v13 objectForKeyedSubscript:v30];
    id v32 = objc_msgSend(NSString, "stringWithFormat:", @"%d.budSocAtLastEngagement", (v14 + 1));
    [v13 setObject:v31 forKeyedSubscript:v32];

    v33 = objc_msgSend(NSString, "stringWithFormat:", @"%d.successRatio", v14);
    v34 = [v13 objectForKeyedSubscript:v33];
    v35 = objc_msgSend(NSString, "stringWithFormat:", @"%d.successRatio", (v14 + 1));
    [v13 setObject:v34 forKeyedSubscript:v35];

    BOOL v36 = v14 != 0;
    uint64_t v14 = (v14 - 1);
  }
  while (v14 != 0 && v36);
  double v37 = [NSNumber numberWithUnsignedShort:v44];
  [v13 setObject:v37 forKeyedSubscript:@"1.timeSpentAtLowerSoC"];

  dispatch_time_t v38 = [NSNumber numberWithUnsignedShort:v45];
  [v13 setObject:v38 forKeyedSubscript:@"1.timeSpentAtHigherSoC"];

  v39 = [NSNumber numberWithUnsignedChar:v46];
  [v13 setObject:v39 forKeyedSubscript:@"1.engagementEventsSinceLastReport"];

  v40 = [NSNumber numberWithUnsignedChar:v47];
  [v13 setObject:v40 forKeyedSubscript:@"1.underchargeEventsSinceLastReport"];

  v41 = [NSNumber numberWithUnsignedChar:v48];
  [v13 setObject:v41 forKeyedSubscript:@"1.chargingEventsSinceLastReport"];

  BOOL v42 = [NSNumber numberWithUnsignedChar:a9];
  [v13 setObject:v42 forKeyedSubscript:@"1.budSocAtLastEngagement"];

  v43 = [NSNumber numberWithUnsignedShort:a10];
  [v13 setObject:v43 forKeyedSubscript:@"1.successRatio"];

  +[PowerUISmartChargeUtilities setDict:v13 forPreferenceKey:v49 inDomain:@"com.apple.smartcharging.topoffprotection.audioaccessories"];
}

- (void)reportSessionMetricsForSide:(unsigned __int8)a3 withTimeSpendAtLowerSoC:(unsigned __int16)a4 timeSpentAtHigherSoC:(unsigned __int16)a5 engagementEventsSinceLastReport:(unsigned __int8)a6 underchargeEventsSinceLastReport:(unsigned __int8)a7 chargingEventsSinceLastReport:(unsigned __int8)a8 budSocAtLastEngagement:(unsigned __int8)a9 successRatio:(unsigned __int16)a10 deviceType:(id)a11
{
  uint64_t v11 = a8;
  uint64_t v12 = a7;
  uint64_t v13 = a6;
  uint64_t v14 = a5;
  uint64_t v15 = a4;
  uint64_t v16 = a3;
  uint64_t v36 = *MEMORY[0x263EF8340];
  unint64_t v18 = (void *)MEMORY[0x263EFF9A0];
  id v19 = a11;
  v20 = [v18 dictionary];
  v21 = [NSNumber numberWithUnsignedChar:v16];
  [v20 setObject:v21 forKeyedSubscript:@"BudSide"];

  unint64_t v22 = [NSNumber numberWithUnsignedShort:v15];
  [v20 setObject:v22 forKeyedSubscript:@"TimeSpentAtLowerSoC"];

  v23 = [NSNumber numberWithUnsignedShort:v14];
  [v20 setObject:v23 forKeyedSubscript:@"TimeSpentAtHigherSoC"];

  id v24 = [NSNumber numberWithUnsignedChar:v13];
  [v20 setObject:v24 forKeyedSubscript:@"EngagementEventsSinceLastReport"];

  long long v25 = [NSNumber numberWithInt:v13 != 0];
  [v20 setObject:v25 forKeyedSubscript:@"AtLeastOneEngagementEventSinceLastReport"];

  uint32_t v26 = [NSNumber numberWithUnsignedChar:v12];
  [v20 setObject:v26 forKeyedSubscript:@"UnderchargeEventsSinceLastReport"];

  int v27 = [NSNumber numberWithInt:v12 != 0];
  [v20 setObject:v27 forKeyedSubscript:@"AtLeastOneUnderchargeEventSinceLastReport"];

  int v28 = [NSNumber numberWithUnsignedChar:v11];
  [v20 setObject:v28 forKeyedSubscript:@"ChargingEventsSinceLastReport"];

  uint64_t v29 = [NSNumber numberWithUnsignedChar:a9];
  [v20 setObject:v29 forKeyedSubscript:@"BudSocAtLastEngagement"];

  v30 = [NSNumber numberWithUnsignedShort:a10];
  [v20 setObject:v30 forKeyedSubscript:@"SuccessRatio"];

  [v20 setObject:v19 forKeyedSubscript:@"AudioAccessoryType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    accessoryLog = self->_accessoryLog;
    if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v20;
      _os_log_impl(&dword_22135E000, accessoryLog, OS_LOG_TYPE_DEFAULT, "In mocking mode, do not report session analytics: %@", buf, 0xCu);
    }
  }
  else
  {
    id v32 = v20;
    AnalyticsSendEventLazy();
    v33 = self->_accessoryLog;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v32;
      _os_log_impl(&dword_22135E000, v33, OS_LOG_TYPE_DEFAULT, "Reported session metrics to CoreAnalytics %@", buf, 0xCu);
    }
  }
}

id __258__PowerUIAudioAccessorySmartChargeManager_reportSessionMetricsForSide_withTimeSpendAtLowerSoC_timeSpentAtHigherSoC_engagementEventsSinceLastReport_underchargeEventsSinceLastReport_chargingEventsSinceLastReport_budSocAtLastEngagement_successRatio_deviceType___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)runUpdateForDevice:(BTDeviceImpl *)a3 withHash:(id)a4
{
  return [(PowerUIAudioAccessorySmartChargeManager *)self runUpdateForDevice:a3 withHash:a4 asInitialUpdate:0];
}

- (BOOL)runUpdateForDevice:(BTDeviceImpl *)a3 withHash:(id)a4 asInitialUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v116 = *MEMORY[0x263EF8340];
  id v8 = a4;
  if (a3)
  {
    uint64_t v9 = (void *)os_transaction_create();
    hardcodedTimeDelta = self->_hardcodedTimeDelta;
    uint64_t v11 = [(PowerUIBluetoothHandler *)self->_btHandler getAddressStringForDevice:a3];
    uint64_t v12 = [(PowerUIAudioAccessorySmartChargeManager *)self returnAccessoryStatusForDevice:v11];
    uint64_t v13 = v12;
    if (v8)
    {
      id v14 = [v12 expectedHash];

      if (v14 != v8)
      {
        accessoryLog = self->_accessoryLog;
        LOBYTE(a3) = 0;
        if (!os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
        {
LABEL_37:

          goto LABEL_38;
        }
        *(_DWORD *)buf = 138412290;
        double v113 = *(double *)&v8;
        _os_log_impl(&dword_22135E000, accessoryLog, OS_LOG_TYPE_DEFAULT, "runUpdate hash '%@' does not match, this message must be old.", buf, 0xCu);
LABEL_16:
        LOBYTE(a3) = 0;
        goto LABEL_37;
      }
    }
    else
    {
      uint64_t v17 = self->_accessoryLog;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22135E000, v17, OS_LOG_TYPE_DEFAULT, "runUpdate called without hash, proceed.", buf, 2u);
      }
    }
    if (![(PowerUIBluetoothHandler *)self->_btHandler isDeviceConnected:a3 forSession:self->_session])
    {
      unint64_t v22 = self->_accessoryLog;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v113 = *(double *)&v11;
        _os_log_impl(&dword_22135E000, v22, OS_LOG_TYPE_DEFAULT, "Device with address '%@' is not connected to AACP, do not run OBC update.", buf, 0xCu);
      }
      [v13 setManagerState:4];
      goto LABEL_16;
    }
    uint64_t v108 = v9;
    uint64_t v18 = [(PowerUIWalletSignalMonitor *)self->_walletMonitor requiredFullChargeDate];
    v107 = (void *)v18;
    if (v18)
    {
      id v19 = (void *)v18;
      v20 = [MEMORY[0x263EFF910] distantPast];
      int v21 = [v19 isEqualToDate:v20];
    }
    else
    {
      int v21 = 0;
    }
    v23 = [(PowerUIAudioAccessorySmartChargeManager *)self btHandler];
    int v24 = [v23 protocolForDevice:a3];

    if (v24 == 3)
    {
      if (v21)
      {
        long long v25 = self->_accessoryLog;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22135E000, v25, OS_LOG_TYPE_DEFAULT, "A boarding pass was found within 24 hours, temporarily disable OBC via v2 protocol", buf, 2u);
        }
        LOBYTE(a3) = [(PowerUIAudioAccessorySmartChargeManager *)self setStateViaV2Protocol:3 forDevice:a3];
      }
      else
      {
        LOBYTE(a3) = 1;
      }
      goto LABEL_36;
    }
    if ([v13 temporarilyDisabled])
    {
      uint32_t v26 = self->_accessoryLog;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v113 = *(double *)&v11;
        int v27 = "Device with address '%@' has OBC temporarily disabled, do not run OBC update.";
LABEL_34:
        _os_log_impl(&dword_22135E000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 0xCu);
        goto LABEL_35;
      }
      goto LABEL_35;
    }
    if (([v13 enabled] & 1) == 0)
    {
      uint32_t v26 = self->_accessoryLog;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v113 = *(double *)&v11;
        int v27 = "Device with address '%@' has OBC disabled, do not run OBC update.";
        goto LABEL_34;
      }
LABEL_35:
      [v13 setManagerState:2];
      LOBYTE(a3) = 0;
LABEL_36:
      uint64_t v9 = v108;

      goto LABEL_37;
    }
    if (v21)
    {
      int v28 = self->_accessoryLog;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22135E000, v28, OS_LOG_TYPE_DEFAULT, "A boarding pass was found within 24 hours, temporarily disable OBC", buf, 2u);
      }
      uint64_t v29 = [MEMORY[0x263EFF910] date];
      v30 = [(PowerUIAudioAccessorySmartChargeManager *)self defaultDateToDisableUntilGivenDate:v29];
      LOBYTE(a3) = 1;
      [(PowerUIAudioAccessorySmartChargeManager *)self setTemporarilyDisabled:1 until:v30 forDevice:v11];

      [v13 setManagerState:5];
      goto LABEL_36;
    }
    id v32 = [v13 lastSentDate];
    v33 = self->_accessoryLog;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      double v113 = *(double *)&v11;
      __int16 v114 = 2112;
      id v115 = v8;
      _os_log_impl(&dword_22135E000, v33, OS_LOG_TYPE_DEFAULT, "runUpdate called for device '%@', hash: %@", buf, 0x16u);
    }
    uint64_t v34 = [MEMORY[0x263EFF910] date];
    uint64_t v106 = (void *)v34;
    if (v5)
    {
      id v35 = self->_accessoryLog;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22135E000, v35, OS_LOG_TYPE_DEFAULT, "This is the initial update, re-send last prediction.", buf, 2u);
      }
      uint64_t v36 = v32;
      [v32 timeIntervalSinceDate:v34];
      double v38 = v37;
      int v39 = _os_feature_enabled_impl();
      unint64_t v40 = 0;
      if (v39 && v38 > 0.0) {
        unint64_t v40 = [(PowerUIAudioAccessorySmartChargeManager *)self sendTimeDeltaInSeconds:v38 toAccessory:a3];
      }
      unint64_t v105 = v40;
      [v13 setManagerState:1];
      uint64_t v41 = 60;
LABEL_85:
      dispatch_time_t v89 = dispatch_walltime(0, 1000000000 * v41);
      id v90 = objc_alloc_init(MEMORY[0x263F08C38]);
      [(PowerUIAudioAccessorySmartChargeManager *)self persistentlySetExpectedHash:v90 forDevice:v11];
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __87__PowerUIAudioAccessorySmartChargeManager_runUpdateForDevice_withHash_asInitialUpdate___block_invoke;
      block[3] = &unk_2645A6910;
      void block[4] = self;
      v111 = a3;
      id v92 = v90;
      id v110 = v92;
      dispatch_after(v89, queue, block);
      v93 = self->_accessoryLog;
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        v94 = NSNumber;
        v95 = v93;
        v96 = [v94 numberWithDouble:(double)v41 / 60.0];
        *(_DWORD *)buf = 138412290;
        double v113 = *(double *)&v96;
        _os_log_impl(&dword_22135E000, v95, OS_LOG_TYPE_DEFAULT, "Next update queued in %@ minutes", buf, 0xCu);
      }
      LOBYTE(a3) = v105 == 0;

      goto LABEL_36;
    }
    v104 = [(PowerUIMLAudioAccessoryModelPredictor *)self->_predictor chargingDecisionForDate:v34 forAudioAccessory:v11];
    if ([v104 state] != 1 || hardcodedTimeDelta)
    {
      if ([v104 state] != 2 || hardcodedTimeDelta)
      {
        if ([v104 state] != 3 || hardcodedTimeDelta)
        {
          if (![v104 state] || hardcodedTimeDelta)
          {
            [v104 smartChargeDuration];
            if (hardcodedTimeDelta)
            {
              double v98 = (double)[(NSNumber *)self->_hardcodedTimeDelta integerValue];
              v99 = self->_accessoryLog;
              if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                double v113 = v98;
                _os_log_impl(&dword_22135E000, v99, OS_LOG_TYPE_DEFAULT, "Applied manual override for prediction, it is now: %f", buf, 0xCu);
              }
            }
            else
            {
              double v98 = v97 * 60.0;
            }
            if (_os_feature_enabled_impl())
            {
              unint64_t v105 = [(PowerUIAudioAccessorySmartChargeManager *)self sendTimeDeltaInSeconds:v98 toAccessory:a3];
            }
            else
            {
              v100 = self->_accessoryLog;
              if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_22135E000, v100, OS_LOG_TYPE_DEFAULT, "FeatureFlag not enabled or device type not supported, do not send message.", buf, 2u);
              }
              unint64_t v105 = 0;
            }
            [v13 setManagerState:6];
            goto LABEL_65;
          }
          if (os_log_type_enabled((os_log_t)self->_accessoryLog, OS_LOG_TYPE_ERROR)) {
            -[PowerUIAudioAccessorySmartChargeManager runUpdateForDevice:withHash:asInitialUpdate:]();
          }
LABEL_64:
          unint64_t v105 = 0;
LABEL_65:
          unsigned int v47 = [MEMORY[0x263EFF9A0] dictionary];
          unsigned int v48 = [(PowerUIAudioAccessorySmartChargeManager *)self btHandler];
          id v49 = -[PowerUIAudioAccessorySmartChargeManager nameForProductID:](self, "nameForProductID:", [v48 productIDForDevice:a3]);
          [v47 setObject:v49 forKeyedSubscript:@"AudioAccessoryType"];

          v50 = NSNumber;
          [v104 engagementConfidence];
          double v51 = objc_msgSend(v50, "numberWithDouble:");
          [v47 setObject:v51 forKeyedSubscript:@"EngagementModelPrediction"];

          double v52 = NSNumber;
          [v104 engagementConfidence];
          long long v103 = [v52 numberWithInt:(5 * ((int)(v53 * 100.0) / 5))];
          objc_msgSend(v47, "setObject:forKeyedSubscript:");
          char v54 = NSNumber;
          [v104 smartChargeDuration];
          uint64_t v55 = objc_msgSend(v54, "numberWithDouble:");
          [v47 setObject:v55 forKeyedSubscript:@"DurationModelPrediction"];

          v56 = NSNumber;
          [v104 smartChargeDuration];
          int v58 = 30 * (int)(v57 / 30.0);
          if (v58 < 0) {
            uint64_t v59 = 0xFFFFFFFFLL;
          }
          else {
            uint64_t v59 = v58;
          }
          v102 = [v56 numberWithInt:v59];
          objc_msgSend(v47, "setObject:forKeyedSubscript:");
          v60 = [v104 modelVersion];
          [v47 setObject:v60 forKeyedSubscript:@"ModelVersion"];

          uint64_t v61 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v104, "state"));
          [v47 setObject:v61 forKeyedSubscript:@"PredictionContainerState"];

          id v62 = [v13 lastSeenDate];
          [v62 timeIntervalSinceDate:v32];
          double v64 = v63;

          v65 = [NSNumber numberWithDouble:v64];
          [v47 setObject:v65 forKeyedSubscript:@"PredictionRealityDelta"];

          double v66 = v64 / 3600.0;
          if (v64 / 3600.0 > 48.0) {
            double v66 = 48.0;
          }
          v101 = [NSNumber numberWithDouble:v66];
          objc_msgSend(v47, "setObject:forKeyedSubscript:");
          [v32 timeIntervalSinceDate:v106];
          double v68 = v67;
          uint64_t v69 = [(NSMutableDictionary *)self->_latestAnalyticsForDevice objectForKey:v11];
          uint64_t v36 = v32;
          if (!v69) {
            goto LABEL_104;
          }
          v70 = (void *)v69;
          v71 = [(NSMutableDictionary *)self->_latestAnalyticsForDevice objectForKeyedSubscript:v11];
          uint64_t v72 = [v71 objectForKey:@"UnderchargeHappened"];

          if (v72)
          {
            v73 = [(NSMutableDictionary *)self->_latestAnalyticsForDevice objectForKeyedSubscript:v11];
            uint64_t v74 = [v73 objectForKey:@"UnderchargeHappened"];
            [v47 setObject:v74 forKeyedSubscript:@"UnderchargeHappened"];

            v75 = self->_accessoryLog;
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
            {
              dispatch_semaphore_t v76 = v75;
              v77 = [v47 objectForKeyedSubscript:@"UnderchargeHappened"];
              *(_DWORD *)buf = 138412290;
              double v113 = *(double *)&v77;
              _os_log_impl(&dword_22135E000, v76, OS_LOG_TYPE_DEFAULT, "Undercharge decision already made, it was: %@", buf, 0xCu);
            }
          }
          else
          {
LABEL_104:
            if (v68 <= 0.0
              || ([v13 lastUnderchargeRecordedForPrediction],
                  uint64_t v78 = objc_claimAutoreleasedReturnValue(),
                  char v79 = [v36 isEqualToDate:v78],
                  v78,
                  (v79 & 1) != 0))
            {
              uint64_t v80 = self->_accessoryLog;
              if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
              {
                v81 = NSNumber;
                uint64_t v82 = v80;
                v83 = [v81 numberWithDouble:v68];
                *(_DWORD *)buf = 138412546;
                double v113 = *(double *)&v83;
                __int16 v114 = 2112;
                id v115 = v36;
                _os_log_impl(&dword_22135E000, v82, OS_LOG_TYPE_DEFAULT, "Not an undercharge, either last prediciton delta  %@ < 0 or already recorded for last prediction %@", buf, 0x16u);
              }
              [v47 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"UnderchargeHappened"];
            }
            else
            {
              v84 = self->_accessoryLog;
              if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v85 = NSNumber;
                v86 = v84;
                uint64_t v87 = [v85 numberWithDouble:v68];
                *(_DWORD *)buf = 138412546;
                double v113 = *(double *)&v87;
                __int16 v114 = 2112;
                id v115 = v36;
                _os_log_impl(&dword_22135E000, v86, OS_LOG_TYPE_DEFAULT, "New undercharge, last prediciton delta %@ > 0 and not already recorded for last prediction %@", buf, 0x16u);
              }
              [v47 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"UnderchargeHappened"];
              [(PowerUIAudioAccessorySmartChargeManager *)self persistentlySetLastUnderchargeRecordedForPrediction:v36 forDevice:v11];
            }
          }
          [(NSMutableDictionary *)self->_latestAnalyticsForDevice setObject:v47 forKeyedSubscript:v11];

          hardcodedTimeBetweenUpdates = self->_hardcodedTimeBetweenUpdates;
          if (hardcodedTimeBetweenUpdates) {
            uint64_t v41 = [(NSNumber *)hardcodedTimeBetweenUpdates integerValue];
          }
          else {
            uint64_t v41 = 3600;
          }
          goto LABEL_85;
        }
        unsigned int v46 = self->_accessoryLog;
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22135E000, v46, OS_LOG_TYPE_DEFAULT, "Model prediction timeDelta is below zero, do not send timeDelta.", buf, 2u);
        }
        v43 = v13;
        uint64_t v44 = 11;
      }
      else
      {
        unsigned int v45 = self->_accessoryLog;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22135E000, v45, OS_LOG_TYPE_DEFAULT, "Model did not engage, do not send a timeDelta.", buf, 2u);
        }
        v43 = v13;
        uint64_t v44 = 3;
      }
    }
    else
    {
      BOOL v42 = self->_accessoryLog;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22135E000, v42, OS_LOG_TYPE_DEFAULT, "Not enough data, do not send a timeDelta.", buf, 2u);
      }
      v43 = v13;
      uint64_t v44 = 10;
    }
    [v43 setManagerState:v44];
    [(PowerUIAudioAccessorySmartChargeManager *)self setOBCState:0 forDevice:v11];
    goto LABEL_64;
  }
  uint64_t v16 = self->_accessoryLog;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22135E000, v16, OS_LOG_TYPE_DEFAULT, "runUpdate called for nil device.", buf, 2u);
    LOBYTE(a3) = 0;
  }
LABEL_38:

  return (char)a3;
}

uint64_t __87__PowerUIAudioAccessorySmartChargeManager_runUpdateForDevice_withHash_asInitialUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) runUpdateForDevice:*(void *)(a1 + 48) withHash:*(void *)(a1 + 40)];
}

- (id)nameForProductID:(unsigned int)a3
{
  id result = @"B768E";
  switch(a3)
  {
    case 0x200Eu:
      id result = @"B298";
      break;
    case 0x200Fu:
      id result = @"B288";
      break;
    case 0x2010u:
    case 0x2011u:
    case 0x2012u:
    case 0x2015u:
    case 0x2016u:
    case 0x2017u:
    case 0x2018u:
    case 0x201Au:
    case 0x201Cu:
    case 0x201Du:
    case 0x201Fu:
      goto LABEL_6;
    case 0x2013u:
      id result = @"B688";
      break;
    case 0x2014u:
      id result = @"B698";
      break;
    case 0x2019u:
      return result;
    case 0x201Bu:
      id result = @"B768M";
      break;
    case 0x201Eu:
      id result = @"B768CHE";
      break;
    case 0x2020u:
      id result = @"B768CHM";
      break;
    default:
      if (a3 == 8194)
      {
        id result = @"B188";
      }
      else if (a3 == 8228)
      {
        id result = @"B698c";
      }
      else
      {
LABEL_6:
        if (os_log_type_enabled((os_log_t)self->_accessoryLog, OS_LOG_TYPE_ERROR)) {
          -[PowerUIAudioAccessorySmartChargeManager nameForProductID:]();
        }
        id result = @"Unknown";
      }
      break;
  }
  return result;
}

- (unint64_t)sendTimeDeltaInSeconds:(unsigned int)a3 toAccessory:(BTDeviceImpl *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  BTAccessoryManagerGetDefault();
  uint64_t v7 = [(PowerUIBluetoothHandler *)self->_btHandler getAddressStringForDevice:a4];
  char v28 = 0;
  uint64_t v27 = 0;
  id v8 = [(PowerUIAudioAccessorySmartChargeManager *)self btHandler];
  prepare9ByteMessage(&v27, 1000 * v5, [v8 protocolForDevice:a4]);

  unint64_t v9 = [(PowerUIBluetoothHandler *)self->_btHandler sendCustomMessageWrapperWithManager:0 withMessageType:0x20000 withDeviceHandle:a4 withData:&v27 withDataSize:9];
  accessoryLog = self->_accessoryLog;
  if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = NSNumber;
    uint64_t v12 = accessoryLog;
    uint64_t v13 = [v11 numberWithUnsignedInt:v5];
    id v14 = [NSNumber numberWithUnsignedInt:v5 / 0xE10uLL];
    uint64_t v15 = [NSNumber numberWithUnsignedLong:v9];
    *(_DWORD *)buf = 138412802;
    unint64_t v22 = v13;
    __int16 v23 = 2112;
    int v24 = v14;
    __int16 v25 = 2112;
    uint32_t v26 = v15;
    _os_log_impl(&dword_22135E000, v12, OS_LOG_TYPE_DEFAULT, "... custom message sent - timeDelta: %@ seconds (%@ hours) - Error code: %@", buf, 0x20u);
  }
  if (!v9)
  {
    uint64_t v16 = (void *)MEMORY[0x263EFF910];
    uint64_t v17 = [MEMORY[0x263EFF910] date];
    uint64_t v18 = [v16 dateWithTimeInterval:v17 sinceDate:(double)v5];

    [(PowerUIAudioAccessorySmartChargeManager *)self persistentlySetLastSentDate:v18 forDevice:v7];
    id v19 = self->_accessoryLog;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v22 = v18;
      _os_log_impl(&dword_22135E000, v19, OS_LOG_TYPE_DEFAULT, "Update AccessoryStatus with last sent date: %@", buf, 0xCu);
    }
    [(NSDistributedNotificationCenter *)self->_notificationCenter postNotificationName:@"com.apple.powerui.audioaccessorysmartchargedeadlinechanged" object:v7];
  }
  return v9;
}

- (void)reportDailyMetrics
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl())
  {
    [(NSLock *)self->_deviceArrayLock lock];
    if ([(NSMutableArray *)self->_deviceArray count])
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v3 = self->_deviceArray;
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        LODWORD(v6) = 0;
        LODWORD(v7) = 0;
        LODWORD(v8) = 0;
        uint64_t v9 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v21 != v9) {
              objc_enumerationMutation(v3);
            }
            uint64_t v11 = [(PowerUIAudioAccessorySmartChargeManager *)self returnAccessoryStatusForDevice:*(void *)(*((void *)&v20 + 1) + 8 * i)];
            int v12 = [v11 enabled];
            uint64_t v7 = v7 + (v12 ^ 1);
            uint64_t v8 = (v8 + v12);
            uint64_t v6 = v6 + [v11 temporarilyDisabled];
          }
          uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v20 objects:v26 count:16];
        }
        while (v5);
      }
      else
      {
        uint64_t v6 = 0;
        uint64_t v7 = 0;
        uint64_t v8 = 0;
      }

      [(NSLock *)self->_deviceArrayLock unlock];
      id v14 = [MEMORY[0x263EFF9A0] dictionary];
      uint64_t v15 = [NSNumber numberWithInt:v8];
      [v14 setObject:v15 forKeyedSubscript:@"NumberOfEnabledDevices"];

      uint64_t v16 = [NSNumber numberWithInt:v7];
      [v14 setObject:v16 forKeyedSubscript:@"NumberOfDisabledDevices"];

      uint64_t v17 = [NSNumber numberWithInt:v6];
      [v14 setObject:v17 forKeyedSubscript:@"NumberOfTemporarilyDisabledDevices"];

      id v18 = v14;
      AnalyticsSendEventLazy();
      accessoryLog = self->_accessoryLog;
      if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v18;
        _os_log_impl(&dword_22135E000, accessoryLog, OS_LOG_TYPE_DEFAULT, "Reported daily metrics to CoreAnalytics %@", buf, 0xCu);
      }
    }
    else
    {
      deviceArrayLock = self->_deviceArrayLock;
      [(NSLock *)deviceArrayLock unlock];
    }
  }
}

id __61__PowerUIAudioAccessorySmartChargeManager_reportDailyMetrics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)firstUseNotificationRequestForDeviceType:(unsigned int)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  uint64_t v5 = (void *)[objc_alloc(NSURL) initFileURLWithPath:@"/System/Library/PrivateFrameworks/PowerUI.framework"];
  uint64_t v6 = [MEMORY[0x263F086E0] bundleWithURL:v5];
  uint64_t v7 = [v6 localizedStringForKey:@"OBC_FEATURE_ENABLED_TITLE" value:&stru_26D3439E8 table:@"Localizable"];
  [v4 setTitle:v7];

  id v8 = objc_alloc_init(MEMORY[0x263F08A30]);
  uint64_t v9 = [MEMORY[0x263EFF960] currentLocale];
  [v8 setLocale:v9];

  [v8 setNumberStyle:3];
  [v8 setMaximumFractionDigits:0];
  [v8 setMultiplier:&unk_26D3855A0];
  uint64_t v10 = [v8 stringFromNumber:&unk_26D3855E8];
  if (a3 - 8206 <= 0x16 && ((1 << (a3 - 14)) & 0x400041) != 0)
  {
    uint64_t v11 = NSString;
    int v12 = @"Localizable";
  }
  else
  {
    uint64_t v11 = NSString;
    int v12 = @"Localizable-B688";
  }
  uint64_t v13 = [v6 localizedStringForKey:@"AUDIOACCESSORY_OBC_FIRST_USE_BODY" value:&stru_26D3439E8 table:v12];
  id v14 = objc_msgSend(v11, "stringWithFormat:", v13, v10);
  [v4 setBody:v14];

  [v4 setCategoryIdentifier:@"firstTimeCategory"];
  [v4 setShouldHideDate:1];
  [v4 setShouldHideTime:1];
  [v4 setShouldSuppressDefaultAction:1];
  uint64_t v15 = [MEMORY[0x263F1DF40] iconForSystemImageNamed:@"bolt.fill"];
  [v4 setIcon:v15];

  uint64_t v16 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:21600.0];
  [v4 setExpirationDate:v16];

  uint64_t v17 = [MEMORY[0x263F1DF48] requestWithIdentifier:@"audioAccessoryFirstUseNotification" content:v4 trigger:0];
  [v17 setDestinations:6];

  return v17;
}

- (void)client:(id)a3 connectAndDisableOBCforDevice:(id)a4 withHandler:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessoryLog = self->_accessoryLog;
  if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412290;
    id v28 = v9;
    _os_log_impl(&dword_22135E000, accessoryLog, OS_LOG_TYPE_DEFAULT, "Request connectAndDisableOBCforDevice for address: %@", (uint8_t *)&v27, 0xCu);
  }
  int v12 = [(PowerUIBluetoothHandler *)self->_btHandler getDeviceForAddressString:v9 forSession:self->_session];
  if (!v12)
  {
    long long v22 = self->_accessoryLog;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_22135E000, v22, OS_LOG_TYPE_DEFAULT, "No device for connectAndDisableOBCforDevice.", (uint8_t *)&v27, 2u);
    }
    goto LABEL_12;
  }
  uint64_t v13 = v12;
  if (![(PowerUIBluetoothHandler *)self->_btHandler isDeviceConnected:v12 forSession:self->_session])
  {
    id v14 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    btConnectionSemaphore = self->_btConnectionSemaphore;
    self->_btConnectionSemaphore = v14;

    int v16 = [(PowerUIBluetoothHandler *)self->_btHandler deviceConnectWrapper:v13];
    uint64_t v17 = self->_btConnectionSemaphore;
    dispatch_time_t v18 = dispatch_time(0, 15000000000);
    intptr_t v19 = dispatch_semaphore_wait(v17, v18);
    intptr_t v20 = v19;
    if (v16 || v19)
    {
      long long v23 = self->_accessoryLog;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = NSNumber;
        id v25 = v23;
        uint32_t v26 = [v24 numberWithLong:v20];
        int v27 = 138412546;
        id v28 = v9;
        __int16 v29 = 2112;
        v30 = v26;
        _os_log_impl(&dword_22135E000, v25, OS_LOG_TYPE_DEFAULT, "Connecting device '%@' was not successful. timeout = %@", (uint8_t *)&v27, 0x16u);
      }
LABEL_12:
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
      goto LABEL_13;
    }
  }
  [(PowerUIAudioAccessorySmartChargeManager *)self client:v8 setState:3 forDevice:v9 withHandler:v10];
  long long v21 = [(PowerUIAudioAccessorySmartChargeManager *)self returnAccessoryStatusForDevice:v9];
  [v21 setManagerState:8];

LABEL_13:
}

- (void)isSmartChargingCurrentlyEnabledForDevice:(id)a3 withHandler:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  if (v6)
  {
    id v8 = [(PowerUIAudioAccessorySmartChargeManager *)self returnAccessoryStatusForDevice:v6];
    accessoryLog = self->_accessoryLog;
    if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = NSNumber;
      uint64_t v11 = accessoryLog;
      int v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v8, "currentState"));
      int v13 = 138412290;
      id v14 = v12;
      _os_log_impl(&dword_22135E000, v11, OS_LOG_TYPE_DEFAULT, "Returning current state: %@", (uint8_t *)&v13, 0xCu);
    }
    v7[2](v7, [v8 currentState], 0);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_accessoryLog, OS_LOG_TYPE_ERROR)) {
      -[PowerUIAudioAccessorySmartChargeManager isSmartChargingCurrentlyEnabledForDevice:withHandler:]();
    }
    v7[2](v7, 0, 0);
  }
}

- (BOOL)setOBCState:(BOOL)a3 forDevice:(id)a4
{
  BOOL v4 = a3;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (self->_session)
  {
    uint64_t v7 = -[PowerUIBluetoothHandler getDeviceForAddressString:forSession:](self->_btHandler, "getDeviceForAddressString:forSession:", v6);
    BTAccessoryManagerGetDefault();
    BOOL v8 = [(PowerUIBluetoothHandler *)self->_btHandler isDeviceConnected:v7 forSession:self->_session];
    accessoryLog = self->_accessoryLog;
    BOOL v10 = os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v4)
      {
        if (v10)
        {
          uint64_t v11 = NSNumber;
          int v12 = accessoryLog;
          int v13 = [v11 numberWithBool:1];
          *(_DWORD *)buf = 138412546;
          id v31 = v13;
          __int16 v32 = 2112;
          id v33 = v6;
          _os_log_impl(&dword_22135E000, v12, OS_LOG_TYPE_DEFAULT, "Sending enabling state '%@' to device with address '%@'.", buf, 0x16u);
        }
        [(PowerUIAudioAccessorySmartChargeManager *)self runUpdateForDevice:v7 withHash:0];
LABEL_18:
        BOOL v15 = 1;
        goto LABEL_19;
      }
      if (v10)
      {
        dispatch_time_t v18 = NSNumber;
        intptr_t v19 = accessoryLog;
        intptr_t v20 = [v18 numberWithBool:0];
        *(_DWORD *)buf = 138412546;
        id v31 = v20;
        __int16 v32 = 2112;
        id v33 = v6;
        _os_log_impl(&dword_22135E000, v19, OS_LOG_TYPE_DEFAULT, "Sending disabling state '%@' to device with address '%@'.", buf, 0x16u);
      }
      char v29 = 0;
      uint64_t v28 = 0;
      long long v21 = [(PowerUIAudioAccessorySmartChargeManager *)self btHandler];
      prepare9ByteMessage(&v28, 0, [v21 protocolForDevice:v7]);

      int v22 = [(PowerUIBluetoothHandler *)self->_btHandler sendCustomMessageWrapperWithManager:0 withMessageType:0x20000 withDeviceHandle:v7 withData:&v28 withDataSize:9];
      long long v23 = self->_accessoryLog;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = NSNumber;
        id v25 = v23;
        uint32_t v26 = [v24 numberWithUnsignedLong:v22];
        *(_DWORD *)buf = 138412546;
        id v31 = v6;
        __int16 v32 = 2112;
        id v33 = v26;
        _os_log_impl(&dword_22135E000, v25, OS_LOG_TYPE_DEFAULT, "Message sent to disable OBC for device '%@' - Error code: %@", buf, 0x16u);
      }
      if (!v22) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    if (!v10)
    {
LABEL_17:
      BOOL v15 = 0;
      goto LABEL_19;
    }
    *(_DWORD *)buf = 138412290;
    id v31 = v6;
    int v16 = "Device with address '%@' is not connected to AACP, do not try to set OBC state.";
    uint64_t v17 = accessoryLog;
LABEL_11:
    _os_log_impl(&dword_22135E000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
    goto LABEL_17;
  }
  id v14 = self->_accessoryLog;
  BOOL v15 = 0;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v6;
    int v16 = "Bluetooth session has not been intialized, device with address '%@' is not connected, do not try to set OBC state.";
    uint64_t v17 = v14;
    goto LABEL_11;
  }
LABEL_19:

  return v15;
}

- (void)client:(id)a3 setState:(unint64_t)a4 forDevice:(id)a5 withHandler:(id)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  int v12 = (void (**)(id, void, void *))a6;
  int v13 = [(PowerUIBluetoothHandler *)self->_btHandler getDeviceForAddressString:v11 forSession:self->_session];
  if (!v13)
  {
    accessoryLog = self->_accessoryLog;
    if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
    {
      int v40 = 138412546;
      id v41 = v10;
      __int16 v42 = 2048;
      unint64_t v43 = a4;
      _os_log_impl(&dword_22135E000, accessoryLog, OS_LOG_TYPE_DEFAULT, "No device for client '%@' setState '%lu' request.", (uint8_t *)&v40, 0x16u);
    }
LABEL_12:
    uint32_t v26 = (void *)MEMORY[0x263F087E8];
    uint64_t v27 = 1;
LABEL_28:
    id v35 = [v26 errorWithDomain:@"PowerUISmartChargingErrorDomain" code:v27 userInfo:0];
    v12[2](v12, 0, v35);

    goto LABEL_36;
  }
  id v14 = v13;
  int v15 = [(PowerUIBluetoothHandler *)self->_btHandler protocolForDevice:v13];
  int v16 = self->_accessoryLog;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = v16;
    dispatch_time_t v18 = [(PowerUIAudioAccessorySmartChargeManager *)self stringFromState:a4];
    int v40 = 138412802;
    id v41 = v10;
    __int16 v42 = 2112;
    unint64_t v43 = (unint64_t)v18;
    __int16 v44 = 1024;
    int v45 = v15;
    _os_log_impl(&dword_22135E000, v17, OS_LOG_TYPE_DEFAULT, "%@ requests state %@. Using protocol: %hhu", (uint8_t *)&v40, 0x1Cu);
  }
  if ((v15 - 1) > 1)
  {
    if (v15)
    {
      if (v15 == 3)
      {
        switch(a4)
        {
          case 0uLL:
            [(PowerUIAudioAccessorySmartChargeManager *)self persistentlySetStatusForDevice:v11 withCurrentState:0 withEnabled:0 withDisabledUntilDate:0 withTemporarilyDisabled:0];
            uint64_t v28 = self;
            uint64_t v29 = 0;
            goto LABEL_39;
          case 3uLL:
            int v39 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:86400.0];
            [(PowerUIAudioAccessorySmartChargeManager *)self setTemporarilyDisabled:1 until:v39 forDevice:v11];

            uint64_t v28 = self;
            uint64_t v29 = 3;
            goto LABEL_39;
          case 1uLL:
            [(PowerUIAudioAccessorySmartChargeManager *)self persistentlySetStatusForDevice:v11 withCurrentState:1 withEnabled:1 withDisabledUntilDate:0 withTemporarilyDisabled:0];
            uint64_t v28 = self;
            uint64_t v29 = 1;
LABEL_39:
            ((void (**)(id, BOOL, void *))v12)[2](v12, [(PowerUIAudioAccessorySmartChargeManager *)v28 setStateViaV2Protocol:v29 forDevice:v14], 0);
            goto LABEL_36;
        }
        goto LABEL_12;
      }
      uint64_t v34 = self->_accessoryLog;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        int v40 = 67109120;
        LODWORD(v41) = v15;
        _os_log_impl(&dword_22135E000, v34, OS_LOG_TYPE_DEFAULT, "protocol %hhu is unsupported, do nothing", (uint8_t *)&v40, 8u);
      }
    }
    else if (os_log_type_enabled((os_log_t)self->_accessoryLog, OS_LOG_TYPE_ERROR))
    {
      -[PowerUIAudioAccessorySmartChargeManager client:setState:forDevice:withHandler:]();
    }
    uint32_t v26 = (void *)MEMORY[0x263F087E8];
    uint64_t v27 = 4;
    goto LABEL_28;
  }
  intptr_t v19 = [(PowerUIAudioAccessorySmartChargeManager *)self returnAccessoryStatusForDevice:v11];
  uint64_t v20 = [v19 currentState];
  long long v21 = self->_accessoryLog;
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v20 == a4)
  {
    if (v22)
    {
      long long v23 = v21;
      int v24 = [(PowerUIAudioAccessorySmartChargeManager *)self stringFromState:a4];
      int v40 = 138412546;
      id v41 = v10;
      __int16 v42 = 2112;
      unint64_t v43 = (unint64_t)v24;
      _os_log_impl(&dword_22135E000, v23, OS_LOG_TYPE_DEFAULT, "%@ requests state %@, but this is already the current state. Do nothing.", (uint8_t *)&v40, 0x16u);
    }
    v12[2](v12, 1, 0);
  }
  else
  {
    if (v22)
    {
      v30 = v21;
      id v31 = [(PowerUIAudioAccessorySmartChargeManager *)self stringFromState:a4];
      int v40 = 138412546;
      id v41 = v10;
      __int16 v42 = 2112;
      unint64_t v43 = (unint64_t)v31;
      _os_log_impl(&dword_22135E000, v30, OS_LOG_TYPE_DEFAULT, "%@ requests state: %@", (uint8_t *)&v40, 0x16u);
    }
    switch(a4)
    {
      case 0uLL:
        [(PowerUIAudioAccessorySmartChargeManager *)self persistentlySetStatusForDevice:v11 withCurrentState:0 withEnabled:0 withDisabledUntilDate:0 withTemporarilyDisabled:0];
        __int16 v32 = self;
        uint64_t v33 = 0;
        goto LABEL_30;
      case 1uLL:
        [(PowerUIAudioAccessorySmartChargeManager *)self persistentlySetStatusForDevice:v11 withCurrentState:1 withEnabled:1 withDisabledUntilDate:0 withTemporarilyDisabled:0];
        __int16 v32 = self;
        uint64_t v33 = 1;
LABEL_30:
        [(PowerUIAudioAccessorySmartChargeManager *)v32 setOBCState:v33 forDevice:v11];
        goto LABEL_33;
      case 2uLL:
        v12[2](v12, 0, 0);
        break;
      case 3uLL:
        uint64_t v36 = [MEMORY[0x263EFF910] date];
        double v37 = [(PowerUIAudioAccessorySmartChargeManager *)self defaultDateToDisableUntilGivenDate:v36];
        [(PowerUIAudioAccessorySmartChargeManager *)self setTemporarilyDisabled:1 until:v37 forDevice:v11];

LABEL_33:
        v12[2](v12, 1, 0);
        [(NSDistributedNotificationCenter *)self->_notificationCenter postNotificationName:@"com.apple.powerui.audioaccessorysmartchargestatuschanged" object:v11];
        break;
      default:
        double v38 = [MEMORY[0x263F087E8] errorWithDomain:@"PowerUISmartChargingErrorDomain" code:1 userInfo:0];
        v12[2](v12, 0, v38);

        break;
    }
  }

LABEL_36:
}

- (BOOL)setStateViaV2Protocol:(unint64_t)a3 forDevice:(BTDeviceImpl *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (!self->_session)
  {
    accessoryLog = self->_accessoryLog;
    BOOL v9 = os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT);
    LOBYTE(v10) = 0;
    if (!v9) {
      return v10;
    }
    *(_WORD *)buf = 0;
    id v11 = "Bluetooth session has not been intialized, device  is not connected, do not try to set OBC state.";
    goto LABEL_11;
  }
  BTAccessoryManagerGetDefault();
  if (![(PowerUIBluetoothHandler *)self->_btHandler isDeviceConnected:a4 forSession:self->_session])
  {
    accessoryLog = self->_accessoryLog;
    BOOL v12 = os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT);
    LOBYTE(v10) = 0;
    if (!v12) {
      return v10;
    }
    *(_WORD *)buf = 0;
    id v11 = "Device is not connected to AACP, do not try to set OBC state.";
LABEL_11:
    _os_log_impl(&dword_22135E000, accessoryLog, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
LABEL_12:
    LOBYTE(v10) = 0;
    return v10;
  }
  char v22 = 0;
  uint64_t v21 = 0;
  if (a3 == 3)
  {
    int v7 = 254;
    goto LABEL_15;
  }
  if (a3 == 1)
  {
    int v7 = 253;
    goto LABEL_15;
  }
  if (a3)
  {
    BOOL v10 = os_log_type_enabled((os_log_t)self->_accessoryLog, OS_LOG_TYPE_ERROR);
    if (!v10) {
      return v10;
    }
    -[PowerUIAudioAccessorySmartChargeManager setStateViaV2Protocol:forDevice:]();
    goto LABEL_12;
  }
  int v7 = 255;
LABEL_15:
  prepare9ByteMessage(&v21, v7, 3);
  int v13 = [(PowerUIBluetoothHandler *)self->_btHandler sendCustomMessageWrapperWithManager:0 withMessageType:0x20000 withDeviceHandle:a4 withData:&v21 withDataSize:9];
  for (uint64_t i = 0; i != 9; ++i)
  {
    int v15 = self->_accessoryLog;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      int v16 = *((unsigned __int8 *)&v21 + i);
      *(_DWORD *)buf = 67109120;
      LODWORD(v20) = v16;
      _os_log_debug_impl(&dword_22135E000, v15, OS_LOG_TYPE_DEBUG, "  var: %u", buf, 8u);
    }
  }
  uint64_t v17 = self->_accessoryLog;
  if (v13)
  {
    BOOL v10 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (!v10) {
      return v10;
    }
    -[PowerUIAudioAccessorySmartChargeManager setStateViaV2Protocol:forDevice:](v17, v13);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v20 = a3;
    _os_log_impl(&dword_22135E000, v17, OS_LOG_TYPE_DEFAULT, "OBC Message (%lu) sent to device", buf, 0xCu);
  }
  LOBYTE(v10) = 1;
  return v10;
}

- (id)getOBCDeadlineFromCBDevice:(id)a3
{
  v34[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = (CBDiscovery *)objc_alloc_init(MEMORY[0x263EFEF30]);
  discovery = self->_discovery;
  self->_discovery = v6;

  [(CBDiscovery *)self->_discovery setDiscoveryFlags:0x20000000];
  v34[0] = v4;
  BOOL v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];
  [(CBDiscovery *)self->_discovery setDeviceFilter:v8];

  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__6;
  uint64_t v28 = __Block_byref_object_dispose__6;
  id v29 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __70__PowerUIAudioAccessorySmartChargeManager_getOBCDeadlineFromCBDevice___block_invoke;
  v21[3] = &unk_2645A6938;
  uint64_t v23 = &v24;
  BOOL v9 = v5;
  char v22 = v9;
  [(CBDiscovery *)self->_discovery setDeviceFoundHandler:v21];
  BOOL v10 = self->_discovery;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __70__PowerUIAudioAccessorySmartChargeManager_getOBCDeadlineFromCBDevice___block_invoke_2;
  v20[3] = &unk_2645A5FA8;
  v20[4] = self;
  [(CBDiscovery *)v10 activateWithCompletion:v20];
  dispatch_time_t v11 = dispatch_time(0, 3000000000);
  intptr_t v12 = dispatch_semaphore_wait(v9, v11);
  accessoryLog = self->_accessoryLog;
  if (v12)
  {
    if (os_log_type_enabled((os_log_t)self->_accessoryLog, OS_LOG_TYPE_ERROR)) {
      -[PowerUIAudioAccessorySmartChargeManager getOBCDeadlineFromCBDevice:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_accessoryLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = v25[5];
    *(_DWORD *)buf = 138412546;
    id v31 = v4;
    __int16 v32 = 2112;
    uint64_t v33 = v14;
    _os_log_impl(&dword_22135E000, accessoryLog, OS_LOG_TYPE_DEFAULT, "Got deadline from device (%@): %@", buf, 0x16u);
  }
  [(CBDiscovery *)self->_discovery invalidate];
  int v15 = (void *)v25[5];
  int v16 = [MEMORY[0x263EFF910] date];
  uint64_t v17 = [v15 laterDate:v16];
  LODWORD(v15) = v17 == (void *)v25[5];

  if (v15) {
    id v18 = (id)v25[5];
  }
  else {
    id v18 = 0;
  }

  _Block_object_dispose(&v24, 8);
  return v18;
}

intptr_t __70__PowerUIAudioAccessorySmartChargeManager_getOBCDeadlineFromCBDevice___block_invoke(intptr_t result, void *a2)
{
  if (!*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    intptr_t v2 = result;
    [a2 accessoryStatusOBCTime];
    if (v3 <= 0.0) {
      [MEMORY[0x263EFF910] distantPast];
    }
    else {
    uint64_t v4 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:");
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    int v7 = *(NSObject **)(v2 + 32);
    return dispatch_semaphore_signal(v7);
  }
  return result;
}

void __70__PowerUIAudioAccessorySmartChargeManager_getOBCDeadlineFromCBDevice___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_22135E000, v4, OS_LOG_TYPE_DEFAULT, "Error: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)fullChargeDeadlineForDevice:(id)a3 withHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void))a4;
  BOOL v8 = [(PowerUIAudioAccessorySmartChargeManager *)self btHandler];
  uint64_t v9 = [v8 getDeviceForAddressString:v6 forSession:self->_session];

  BOOL v10 = [(PowerUIAudioAccessorySmartChargeManager *)self btHandler];
  int v11 = [v10 protocolForDevice:v9];

  if (v11 == 3)
  {
    if (os_log_type_enabled((os_log_t)self->_accessoryLog, OS_LOG_TYPE_DEBUG)) {
      -[PowerUIAudioAccessorySmartChargeManager fullChargeDeadlineForDevice:withHandler:]();
    }
    intptr_t v12 = [(PowerUIAudioAccessorySmartChargeManager *)self getOBCDeadlineFromCBDevice:v6];
    if (v12)
    {
      int v13 = +[PowerUISmartChargeUtilities roundedDateFromDate:v12];
      v7[2](v7, v13, 0);
    }
    else
    {
      v7[2](v7, 0, 0);
    }
  }
  else if ((v11 + 1) > 1u)
  {
    intptr_t v12 = [(PowerUIAudioAccessorySmartChargeManager *)self returnAccessoryStatusForDevice:v6];
    int v15 = [v12 lastSentDate];
    int v16 = +[PowerUISmartChargeUtilities roundedDateFromDate:v15];

    [v16 timeIntervalSinceNow];
    if (v17 <= 0.0)
    {

      int v16 = 0;
    }
    accessoryLog = self->_accessoryLog;
    if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v16;
      _os_log_impl(&dword_22135E000, accessoryLog, OS_LOG_TYPE_DEFAULT, "fullChargeDeadline requested, returning: %@", (uint8_t *)&v19, 0xCu);
    }
    v7[2](v7, v16, 0);
  }
  else
  {
    uint64_t v14 = self->_accessoryLog;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412546;
      id v20 = v6;
      __int16 v21 = 1024;
      int v22 = v11;
      _os_log_impl(&dword_22135E000, v14, OS_LOG_TYPE_DEFAULT, "Query for OBC deadline for device %@, but protocol is: %hhu", (uint8_t *)&v19, 0x12u);
    }
    intptr_t v12 = [MEMORY[0x263F087E8] errorWithDomain:@"PowerUISmartChargingErrorDomain" code:4 userInfo:0];
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v12);
  }
}

- (void)unfilteredDeadlineForDevice:(id)a3 withHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, void *, void))a4;
  uint64_t v7 = [(PowerUIAudioAccessorySmartChargeManager *)self returnAccessoryStatusForDevice:a3];
  BOOL v8 = [v7 lastSentDate];
  accessoryLog = self->_accessoryLog;
  if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    int v11 = v8;
    _os_log_impl(&dword_22135E000, accessoryLog, OS_LOG_TYPE_DEFAULT, "Unfiltered deadline requested, returning: %@", (uint8_t *)&v10, 0xCu);
  }
  v6[2](v6, v8, 0);
}

- (void)client:(id)a3 updateOBCDeadline:(id)a4 forDevice:(id)a5 withHandler:(id)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = (void (**)(id, uint64_t, void))a6;
  uint64_t v14 = [MEMORY[0x263EFF910] date];
  if (v11 && ([v11 timeIntervalSinceDate:v14], v15 <= 172800.0))
  {
    double v17 = [(PowerUIAudioAccessorySmartChargeManager *)self returnAccessoryStatusForDevice:v12];
    uint64_t v18 = [v17 lastSentDate];
    if (v18
      && (int v19 = (void *)v18,
          [v17 lastSentDate],
          id v20 = objc_claimAutoreleasedReturnValue(),
          uint64_t v21 = [v20 compare:v11],
          v20,
          v19,
          v21 == 1))
    {
      accessoryLog = self->_accessoryLog;
      if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = accessoryLog;
        uint64_t v24 = [v17 lastSentDate];
        int v33 = 138413058;
        id v34 = v10;
        __int16 v35 = 2112;
        id v36 = v11;
        __int16 v37 = 2112;
        id v38 = v12;
        __int16 v39 = 2112;
        int v40 = v24;
        _os_log_impl(&dword_22135E000, v23, OS_LOG_TYPE_DEFAULT, "%@ requests deadline update '%@' for device '%@', but on device deadline (%@) is newer", (uint8_t *)&v33, 0x2Au);
      }
      [(NSDistributedNotificationCenter *)self->_notificationCenter postNotificationName:@"com.apple.powerui.audioaccessorysmartchargedeadlinechanged" object:v12];
    }
    else
    {
      uint64_t v25 = [v17 lastSentDate];
      if (!v25
        || (uint64_t v26 = (void *)v25,
            [v17 lastSentDate],
            uint64_t v27 = objc_claimAutoreleasedReturnValue(),
            uint64_t v28 = [v27 compare:v11],
            v27,
            v26,
            v28 == -1))
      {
        v30 = self->_accessoryLog;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          id v31 = v30;
          __int16 v32 = [v17 lastSentDate];
          int v33 = 138413058;
          id v34 = v10;
          __int16 v35 = 2112;
          id v36 = v11;
          __int16 v37 = 2112;
          id v38 = v12;
          __int16 v39 = 2112;
          int v40 = v32;
          _os_log_impl(&dword_22135E000, v31, OS_LOG_TYPE_DEFAULT, "%@ requests deadline update '%@' for device '%@'. Update on device deadline (%@)", (uint8_t *)&v33, 0x2Au);
        }
        [(PowerUIAudioAccessorySmartChargeManager *)self persistentlySetLastSentDate:v11 forDevice:v12];
      }
      else
      {
        id v29 = self->_accessoryLog;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          int v33 = 138412802;
          id v34 = v10;
          __int16 v35 = 2112;
          id v36 = v11;
          __int16 v37 = 2112;
          id v38 = v12;
          _os_log_impl(&dword_22135E000, v29, OS_LOG_TYPE_DEFAULT, "%@ requests deadline update '%@' for device '%@', but dates are equal", (uint8_t *)&v33, 0x20u);
        }
      }
    }
    [v17 setManagerState:9];
    v13[2](v13, 1, 0);
  }
  else
  {
    int v16 = self->_accessoryLog;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 138412802;
      id v34 = v10;
      __int16 v35 = 2112;
      id v36 = v11;
      __int16 v37 = 2112;
      id v38 = v12;
      _os_log_impl(&dword_22135E000, v16, OS_LOG_TYPE_DEFAULT, "ERROR: %@ requests invalid deadline update '%@' for device '%@'", (uint8_t *)&v33, 0x20u);
    }
    double v17 = [MEMORY[0x263F087E8] errorWithDomain:@"PowerUISmartChargingErrorDomain" code:3 userInfo:0];
    ((void (**)(id, uint64_t, void *))v13)[2](v13, 0, v17);
  }
}

- (void)persistentlySetStatusForDevice:(id)a3 withCurrentState:(unint64_t)a4 withEnabled:(BOOL)a5 withDisabledUntilDate:(id)a6 withTemporarilyDisabled:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a5;
  id v12 = a6;
  id v13 = a3;
  id v24 = [(PowerUIAudioAccessorySmartChargeManager *)self returnAccessoryStatusForDevice:v13];
  [v24 setCurrentState:a4];
  uint64_t v14 = [NSNumber numberWithUnsignedInteger:a4];
  +[PowerUIAudioAccessorySmartChargeManager setNumber:v14 forPreferenceKeyPrefix:@"com.apple.smartcharging.audioaccessories.currentState." andDevice:v13];

  [v24 setEnabled:v8];
  double v15 = [NSNumber numberWithBool:v8];
  +[PowerUIAudioAccessorySmartChargeManager setNumber:v15 forPreferenceKeyPrefix:@"com.apple.smartcharging.audioaccessories.enabled." andDevice:v13];

  [v24 setDisabledUntilDate:v12];
  int v16 = NSNumber;
  [v12 timeIntervalSinceReferenceDate];
  double v18 = v17;

  int v19 = [v16 numberWithDouble:v18];
  +[PowerUIAudioAccessorySmartChargeManager setNumber:v19 forPreferenceKeyPrefix:@"com.apple.smartcharging.audioaccessories.disabledUntilDate." andDevice:v13];

  [v24 setTemporarilyDisabled:v7];
  id v20 = [MEMORY[0x263EFF910] date];
  [v24 setLastSeenDate:v20];

  uint64_t v21 = NSNumber;
  int v22 = [v24 lastSeenDate];
  [v22 timeIntervalSinceReferenceDate];
  uint64_t v23 = objc_msgSend(v21, "numberWithDouble:");
  +[PowerUIAudioAccessorySmartChargeManager setNumber:v23 forPreferenceKeyPrefix:@"com.apple.smartcharging.audioaccessories.lastSeenDate." andDevice:v13];
}

- (void)persistentlySetLastSentDate:(id)a3 forDevice:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v12 = [(PowerUIAudioAccessorySmartChargeManager *)self returnAccessoryStatusForDevice:v6];
  [v12 setLastSentDate:v7];
  BOOL v8 = NSNumber;
  [v7 timeIntervalSinceReferenceDate];
  double v10 = v9;

  id v11 = [v8 numberWithDouble:v10];
  +[PowerUIAudioAccessorySmartChargeManager setNumber:v11 forPreferenceKeyPrefix:@"com.apple.smartcharging.audioaccessories.lastSentDate." andDevice:v6];

  [(NSDistributedNotificationCenter *)self->_notificationCenter postNotificationName:@"com.apple.powerui.audioaccessorysmartchargedeadlinechanged" object:v6];
}

- (void)persistentlySetLastTimeseriesDate:(id)a3 forDevice:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v12 = [(PowerUIAudioAccessorySmartChargeManager *)self returnAccessoryStatusForDevice:v6];
  [v12 setLastTimeseriesDate:v7];
  BOOL v8 = NSNumber;
  [v7 timeIntervalSinceReferenceDate];
  double v10 = v9;

  id v11 = [v8 numberWithDouble:v10];
  +[PowerUIAudioAccessorySmartChargeManager setNumber:v11 forPreferenceKeyPrefix:@"com.apple.smartcharging.audioaccessories.lastTimeseriesDate." andDevice:v6];
}

- (void)persistentlySetLastUnderchargeRecordedForPrediction:(id)a3 forDevice:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v12 = [(PowerUIAudioAccessorySmartChargeManager *)self returnAccessoryStatusForDevice:v6];
  [v12 setLastUnderchargeRecordedForPrediction:v7];
  BOOL v8 = NSNumber;
  [v7 timeIntervalSinceReferenceDate];
  double v10 = v9;

  id v11 = [v8 numberWithDouble:v10];
  +[PowerUIAudioAccessorySmartChargeManager setNumber:v11 forPreferenceKeyPrefix:@"com.apple.smartcharging.audioaccessories.lastUnderchargeRecordedForPrediction." andDevice:v6];
}

- (void)persistentlyHandleSeeingDevice:(id)a3
{
  id v4 = a3;
  id v9 = [(PowerUIAudioAccessorySmartChargeManager *)self returnAccessoryStatusForDevice:v4];
  int v5 = [MEMORY[0x263EFF910] date];
  [v9 setLastSeenDate:v5];

  id v6 = NSNumber;
  id v7 = [v9 lastSeenDate];
  [v7 timeIntervalSinceReferenceDate];
  BOOL v8 = objc_msgSend(v6, "numberWithDouble:");
  +[PowerUIAudioAccessorySmartChargeManager setNumber:v8 forPreferenceKeyPrefix:@"com.apple.smartcharging.audioaccessories.lastSeenDate." andDevice:v4];
}

- (void)persistentlySetExpectedHash:(id)a3 forDevice:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(PowerUIAudioAccessorySmartChargeManager *)self returnAccessoryStatusForDevice:v6];
  [v9 setExpectedHash:v7];
  BOOL v8 = [v7 UUIDString];

  +[PowerUIAudioAccessorySmartChargeManager setString:v8 forPreferenceKeyPrefix:@"com.apple.smartcharging.audioaccessories.expectedHash." andDevice:v6];
}

+ (void)setNumber:(id)a3 forPreferenceKeyPrefix:(id)a4 andDevice:(id)a5
{
  id value = a3;
  CFPreferencesSetAppValue((CFStringRef)[a4 stringByAppendingString:a5], value, @"com.apple.smartcharging.topoffprotection.audioaccessories");
}

+ (id)readNumberForPreferenceKeyPrefix:(id)a3 andDevice:(id)a4
{
  id v4 = (void *)CFPreferencesCopyAppValue((CFStringRef)[a3 stringByAppendingString:a4], @"com.apple.smartcharging.topoffprotection.audioaccessories");
  return v4;
}

+ (void)setString:(id)a3 forPreferenceKeyPrefix:(id)a4 andDevice:(id)a5
{
  id value = a3;
  CFPreferencesSetAppValue((CFStringRef)[a4 stringByAppendingString:a5], value, @"com.apple.smartcharging.topoffprotection.audioaccessories");
}

+ (id)readStringForPreferenceKeyPrefix:(id)a3 andDevice:(id)a4
{
  id v4 = (void *)CFPreferencesCopyAppValue((CFStringRef)[a3 stringByAppendingString:a4], @"com.apple.smartcharging.topoffprotection.audioaccessories");
  return v4;
}

+ (void)setArray:(id)a3 forPreferenceKey:(id)a4
{
}

+ (id)readArrayForPreferenceKey:(id)a3
{
  id v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.smartcharging.topoffprotection.audioaccessories");
  if (v3)
  {
    id v4 = [MEMORY[0x263EFF980] arrayWithArray:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (void)bulkDeleteDefaultsEntries:(id)a3
{
}

- (id)stringFromState:(unint64_t)a3
{
  if (a3 > 3) {
    return @"Unknown state";
  }
  else {
    return off_2645A6958[a3];
  }
}

- (id)defaultDateToDisableUntilGivenDate:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (defaultDateToDisableUntilGivenDate__onceToken != -1) {
    dispatch_once(&defaultDateToDisableUntilGivenDate__onceToken, &__block_literal_global_14);
  }
  int v5 = [(id)defaultDateToDisableUntilGivenDate__calendar components:60 fromDate:v4];
  if ([v5 hour] >= 6) {
    objc_msgSend(v5, "setDay:", objc_msgSend(v5, "day") + 1);
  }
  [v5 setHour:6];
  id v6 = [(id)defaultDateToDisableUntilGivenDate__calendar dateFromComponents:v5];
  accessoryLog = self->_accessoryLog;
  if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    double v10 = v6;
    _os_log_impl(&dword_22135E000, accessoryLog, OS_LOG_TYPE_DEFAULT, "Feature disabled until: %@", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

uint64_t __78__PowerUIAudioAccessorySmartChargeManager_defaultDateToDisableUntilGivenDate___block_invoke()
{
  defaultDateToDisableUntilGivenDate__calendar = [MEMORY[0x263EFF8F0] currentCalendar];
  return MEMORY[0x270F9A758]();
}

- (void)setTemporarilyDisabled:(BOOL)a3 until:(id)a4 forDevice:(id)a5
{
  BOOL v6 = a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    if (v8)
    {
      [v8 timeIntervalSinceNow];
      double v11 = v10;
      if (v10 < 0.0) {
        BOOL v6 = 0;
      }
    }
    else
    {
      double v11 = 0.0;
    }
    id v12 = [(PowerUIAudioAccessorySmartChargeManager *)self returnAccessoryStatusForDevice:v9];
    id v13 = [(PowerUIBluetoothHandler *)self->_btHandler getDeviceForAddressString:v9 forSession:self->_session];
    if (!v13 && os_log_type_enabled((os_log_t)self->_accessoryLog, OS_LOG_TYPE_ERROR)) {
      -[PowerUIAudioAccessorySmartChargeManager setTemporarilyDisabled:until:forDevice:]();
    }
    int v14 = [(PowerUIBluetoothHandler *)self->_btHandler protocolForDevice:v13];
    int v15 = [v12 temporarilyDisabled];
    if (v6)
    {
      char v16 = v15 ^ 1;
      if (!v8) {
        char v16 = 1;
      }
      if ((v16 & 1) != 0
        || ([v12 disabledUntilDate],
            double v17 = objc_claimAutoreleasedReturnValue(),
            char v18 = [v8 isEqualToDate:v17],
            v17,
            (v18 & 1) == 0))
      {
        [(PowerUIAudioAccessorySmartChargeManager *)self persistentlySetStatusForDevice:v9 withCurrentState:3 withEnabled:1 withDisabledUntilDate:v8 withTemporarilyDisabled:1];
        if ((v14 - 1) <= 1) {
          [(PowerUIAudioAccessorySmartChargeManager *)self setOBCState:0 forDevice:v9];
        }
        [(NSDistributedNotificationCenter *)self->_notificationCenter postNotificationName:@"com.apple.powerui.audioaccessorysmartchargestatuschanged" object:v9];
        accessoryLog = self->_accessoryLog;
        if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v29 = v9;
          _os_log_impl(&dword_22135E000, accessoryLog, OS_LOG_TYPE_DEFAULT, "Set state to temporarilyDisabled for device '%@'", buf, 0xCu);
        }
        dispatch_time_t v20 = dispatch_walltime(0, (uint64_t)(v11 * 1000000000.0));
        queue = self->_queue;
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __82__PowerUIAudioAccessorySmartChargeManager_setTemporarilyDisabled_until_forDevice___block_invoke;
        v26[3] = &unk_2645A6878;
        v26[4] = self;
        id v22 = v9;
        id v27 = v22;
        dispatch_after(v20, queue, v26);
        uint64_t v23 = self->_accessoryLog;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v29 = v22;
          __int16 v30 = 2048;
          double v31 = v11 / 60.0;
          _os_log_impl(&dword_22135E000, v23, OS_LOG_TYPE_DEFAULT, "Re-enable device '%@' in %f minutes", buf, 0x16u);
        }
      }
      goto LABEL_29;
    }
    if (v15)
    {
      [(PowerUIAudioAccessorySmartChargeManager *)self persistentlySetStatusForDevice:v9 withCurrentState:1 withEnabled:1 withDisabledUntilDate:0 withTemporarilyDisabled:0];
      if ((v14 - 1) <= 1) {
        [(PowerUIAudioAccessorySmartChargeManager *)self setOBCState:1 forDevice:v9];
      }
      [(NSDistributedNotificationCenter *)self->_notificationCenter postNotificationName:@"com.apple.powerui.audioaccessorysmartchargestatuschanged" object:v9];
      id v24 = self->_accessoryLog;
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      *(_DWORD *)buf = 138412290;
      id v29 = v9;
      uint64_t v25 = "Re-enable device '%@' (previously temporarily disabled)";
    }
    else
    {
      id v24 = self->_accessoryLog;
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
LABEL_29:

        goto LABEL_30;
      }
      *(_DWORD *)buf = 138412290;
      id v29 = v9;
      uint64_t v25 = "Attempted to re-enable device '%@', but it was not temporarily disabled";
    }
    _os_log_impl(&dword_22135E000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
    goto LABEL_29;
  }
LABEL_30:
}

uint64_t __82__PowerUIAudioAccessorySmartChargeManager_setTemporarilyDisabled_until_forDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTemporarilyDisabled:0 until:0 forDevice:*(void *)(a1 + 40)];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v21 = a3;
  id v6 = a4;
  accessoryLog = self->_accessoryLog;
  if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v6;
    _os_log_impl(&dword_22135E000, accessoryLog, OS_LOG_TYPE_DEFAULT, "Received new connection: %@", buf, 0xCu);
  }
  id v8 = [v6 valueForEntitlement:@"com.apple.powerui.smartcharging.AudioAccessory"];
  id v9 = v8;
  if ((!v8 || ([v8 BOOLValue] & 1) == 0)
    && os_log_type_enabled((os_log_t)self->_accessoryLog, OS_LOG_TYPE_ERROR))
  {
    -[PowerUIAudioAccessorySmartChargeManager listener:shouldAcceptNewConnection:]();
  }
  double v10 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D38E700];
  double v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v12 = objc_opt_class();
  id v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  [v10 setClasses:v13 forSelector:sel_getAvailableDevicesWithHandler_ argumentIndex:0 ofReply:1];

  int v14 = (void *)MEMORY[0x263EFFA08];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  int v19 = objc_msgSend(v14, "setWithObjects:", v15, v16, v17, v18, objc_opt_class(), 0);
  [v10 setClasses:v19 forSelector:sel_getStatusForDevice_withHandler_ argumentIndex:0 ofReply:1];

  [v6 setExportedInterface:v10];
  [v6 setExportedObject:self];
  [v6 resume];

  return 1;
}

- (void)engageUntil:(id)a3 forDevice:(id)a4 overrideAllSignals:(BOOL)a5 withHandler:(id)a6
{
  btHandler = self->_btHandler;
  session = self->_session;
  double v11 = (void (**)(id, BOOL, void))a6;
  id v12 = a3;
  uint64_t v13 = [(PowerUIBluetoothHandler *)btHandler getDeviceForAddressString:a4 forSession:session];
  id v16 = [MEMORY[0x263EFF910] date];
  [v12 timeIntervalSinceDate:v16];
  double v15 = v14;

  v11[2](v11, [(PowerUIAudioAccessorySmartChargeManager *)self sendTimeDeltaInSeconds:v15 toAccessory:v13] == 0, 0);
}

- (void)getAvailableDevicesWithHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  deviceArrayLock = self->_deviceArrayLock;
  int v5 = (void (**)(id, void *))a3;
  [(NSLock *)deviceArrayLock lock];
  id v6 = (void *)[(NSMutableArray *)self->_deviceArray copy];
  accessoryLog = self->_accessoryLog;
  if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSNumber;
    deviceArray = self->_deviceArray;
    double v10 = accessoryLog;
    double v11 = objc_msgSend(v8, "numberWithUnsignedInteger:", -[NSMutableArray count](deviceArray, "count"));
    id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    int v13 = 138412546;
    double v14 = v11;
    __int16 v15 = 2112;
    id v16 = v12;
    _os_log_impl(&dword_22135E000, v10, OS_LOG_TYPE_DEFAULT, "Available devices were requested, available: %@ - copy count: %@", (uint8_t *)&v13, 0x16u);
  }
  [(NSLock *)self->_deviceArrayLock unlock];
  v5[2](v5, v6);
}

- (void)getStatusForDevice:(id)a3 withHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = (void *)MEMORY[0x263EFF9A0];
  id v7 = (void (**)(id, void *))a4;
  id v8 = a3;
  id v9 = [v6 dictionary];
  double v10 = [(PowerUIAudioAccessorySmartChargeManager *)self returnAccessoryStatusForDevice:v8];
  if ([v10 enabled]) {
    double v11 = @"YES";
  }
  else {
    double v11 = @"NO";
  }
  [v9 setValue:v11 forKey:@"enabled"];
  if ([v10 temporarilyDisabled]) {
    id v12 = @"YES";
  }
  else {
    id v12 = @"NO";
  }
  [v9 setValue:v12 forKey:@"temporarilyDisabled"];
  id v13 = objc_alloc_init(MEMORY[0x263F08790]);
  [v13 setDateFormat:@"yyyy-MM-dd 'at' HH:mm"];
  double v14 = [v10 lastSentDate];
  __int16 v15 = [v13 stringFromDate:v14];

  [v9 setValue:v15 forKey:@"lastSentDate"];
  id v16 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v10, "minutesSavedSinceLastReport"));
  uint64_t v17 = [v16 description];
  [v9 setValue:v17 forKey:@"minutesSavedSinceLastReport"];

  uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v10, "underchargesSinceLastReport"));
  int v19 = [v18 description];
  [v9 setValue:v19 forKey:@"underchargesSinceLastReport"];

  dispatch_time_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v10, "chargingEventsSinceLastReport"));
  id v21 = [v20 description];
  [v9 setValue:v21 forKey:@"chargingEventsSinceLastReport"];

  [v9 setValue:v8 forKey:@"deviceName"];
  id v22 = (void *)[v9 copy];
  accessoryLog = self->_accessoryLog;
  if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    uint64_t v25 = v22;
    _os_log_impl(&dword_22135E000, accessoryLog, OS_LOG_TYPE_DEFAULT, "Status Requested: %@", (uint8_t *)&v24, 0xCu);
  }
  v7[2](v7, v22);
}

- (void)deleteRecordsForDevices:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NSLock *)self->_deviceArrayLock lock];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
  uint64_t v24 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v27;
    *(void *)&long long v5 = 138412546;
    long long v21 = v5;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        accessoryLog = self->_accessoryLog;
        if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
        {
          deviceArray = self->_deviceArray;
          double v10 = accessoryLog;
          uint64_t v11 = [(NSMutableArray *)deviceArray count];
          *(_DWORD *)buf = v21;
          uint64_t v32 = v7;
          __int16 v33 = 2048;
          uint64_t v34 = v11;
          _os_log_impl(&dword_22135E000, v10, OS_LOG_TYPE_DEFAULT, "Delete device '%@' from known devices (%lu).", buf, 0x16u);
        }
        -[NSMutableArray removeObject:](self->_deviceArray, "removeObject:", v7, v21);
        [(NSMutableDictionary *)self->_accessoryStates removeObjectForKey:v7];
        uint64_t v25 = [@"com.apple.smartcharging.audioaccessories.currentState." stringByAppendingString:v7];
        v30[0] = v25;
        id v12 = [@"com.apple.smartcharging.audioaccessories.enabled." stringByAppendingString:v7];
        v30[1] = v12;
        id v13 = [@"com.apple.smartcharging.audioaccessories.disabledUntilDate." stringByAppendingString:v7];
        v30[2] = v13;
        double v14 = [@"com.apple.smartcharging.audioaccessories.temporarilyDisabled." stringByAppendingString:v7];
        v30[3] = v14;
        __int16 v15 = [@"com.apple.smartcharging.audioaccessories.lastSentDate." stringByAppendingString:v7];
        v30[4] = v15;
        id v16 = [@"com.apple.smartcharging.audioaccessories.lastSeenDate." stringByAppendingString:v7];
        v30[5] = v16;
        uint64_t v17 = [@"com.apple.smartcharging.audioaccessories.lastTimeseriesDate." stringByAppendingString:v7];
        v30[6] = v17;
        uint64_t v18 = [@"com.apple.smartcharging.audioaccessories.lastUnderchargeRecordedForPrediction." stringByAppendingString:v7];
        v30[7] = v18;
        [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:8];
        v20 = int v19 = self;

        +[PowerUIAudioAccessorySmartChargeManager bulkDeleteDefaultsEntries:v20];
        self = v19;
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v24);
  }

  +[PowerUIAudioAccessorySmartChargeManager setArray:self->_deviceArray forPreferenceKey:@"com.apple.smartcharging.audioaccessories.deviceArray"];
  [(NSLock *)self->_deviceArrayLock unlock];
}

- (void)lastActionForDevice:(id)a3 withHandler:(id)a4
{
  id v6 = (void (**)(id, uint64_t))a4;
  id v7 = [(PowerUIAudioAccessorySmartChargeManager *)self returnAccessoryStatusForDevice:a3];
  v6[2](v6, [v7 managerState]);
}

- (void)clearLastActionForDevice:(id)a3
{
  id v3 = [(PowerUIAudioAccessorySmartChargeManager *)self returnAccessoryStatusForDevice:a3];
  [v3 setManagerState:0];
}

- (void)startMockingBluetoothForFakeDevice:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!+[PowerUISmartChargeUtilities isInternalBuild]
    && os_log_type_enabled((os_log_t)self->_accessoryLog, OS_LOG_TYPE_ERROR))
  {
    -[PowerUIAudioAccessorySmartChargeManager startMockingBluetoothForFakeDevice:]();
  }
  accessoryLog = self->_accessoryLog;
  if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_22135E000, accessoryLog, OS_LOG_TYPE_DEFAULT, "Start mocking bluetooth for fake device name: %@", (uint8_t *)&v10, 0xCu);
  }
  id v6 = [(PowerUIAudioAccessorySmartChargeManager *)self returnAccessoryStatusForDevice:v4];
  id v7 = objc_alloc_init(MEMORY[0x263F08C38]);
  [v6 setExpectedHash:v7];

  id v8 = [[PowerUIBluetoothHandlerFake alloc] init:v4];
  btHandler = self->_btHandler;
  self->_btHandler = v8;
}

- (void)stopMockingBluetooth
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "ERROR: Not in mocking mode", v2, v3, v4, v5, v6);
}

- (void)fakeConnectionForDevice:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(PowerUIBluetoothHandler *)self->_btHandler getDeviceForAddressString:v4 forSession:self->_session];
    btConnectionUpdateCallback((uint64_t)v5, v6, 0, 11, 0, self);
    accessoryLog = self->_accessoryLog;
    if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      id v8 = "Connection callback called with fake event";
      id v9 = (uint8_t *)&v10;
LABEL_6:
      _os_log_impl(&dword_22135E000, accessoryLog, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
  }
  else
  {
    accessoryLog = self->_accessoryLog;
    if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v8 = "Abort faking connections: Not in mocking mode";
      id v9 = buf;
      goto LABEL_6;
    }
  }
}

- (void)setFakeConnectionStatusTo:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    btHandler = self->_btHandler;
    [(PowerUIBluetoothHandler *)btHandler setFakeDeviceConnected:v3];
  }
  else
  {
    accessoryLog = self->_accessoryLog;
    if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_22135E000, accessoryLog, OS_LOG_TYPE_DEFAULT, "Abort setting fake connection status: Not in mocking mode", v7, 2u);
    }
  }
}

- (void)currentLeewayWithHandler:(id)a3
{
  uint64_t v5 = NSNumber;
  id v6 = a3;
  id v8 = [(PowerUIAudioAccessorySmartChargeManager *)self predictor];
  [v8 lastUsedLeeway];
  id v7 = objc_msgSend(v5, "numberWithDouble:");
  (*((void (**)(id, void *, void))a3 + 2))(v6, v7, 0);
}

- (void)timeSeriesForDevice:(id)a3
{
  buf[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  accessoryLog = self->_accessoryLog;
  if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf[0]) = 138412290;
    *(void *)((char *)buf + 4) = v4;
    _os_log_impl(&dword_22135E000, accessoryLog, OS_LOG_TYPE_DEFAULT, "Triggering time series response for device '%@'.", (uint8_t *)buf, 0xCu);
  }
  buf[0] = 0;
  BTAccessoryManagerGetDefault();
  id v6 = [(PowerUIBluetoothHandler *)self->_btHandler getDeviceForAddressString:v4 forSession:self->_session];
  if (v6)
  {
    id v7 = v6;
    char v13 = 0;
    id v8 = self->_accessoryLog;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_22135E000, v8, OS_LOG_TYPE_DEFAULT, "memset done, about to send message...", v12, 2u);
    }
    uint64_t v9 = [(PowerUIBluetoothHandler *)self->_btHandler sendCustomMessageWrapperWithManager:buf[0] withMessageType:0x80000 withDeviceHandle:v7 withData:&v13 withDataSize:1];
    __int16 v10 = self->_accessoryLog;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_22135E000, v10, OS_LOG_TYPE_DEFAULT, "timeseries message sent...", v12, 2u);
    }
    if (v9)
    {
      id v11 = self->_accessoryLog;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[PowerUIAudioAccessorySmartChargeManager timeSeriesForDevice:](v11, v9);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_accessoryLog, OS_LOG_TYPE_ERROR))
  {
    -[PowerUIAudioAccessorySmartChargeManager timeSeriesForDevice:]();
  }
}

- (void)monitor:(id)a3 maySuggestNewFullChargeDeadline:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [MEMORY[0x263EFF910] distantFuture];
  char v7 = [v5 isEqualToDate:v6];

  if ((v7 & 1) == 0)
  {
    accessoryLog = self->_accessoryLog;
    if (os_log_type_enabled(accessoryLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v5;
      _os_log_impl(&dword_22135E000, accessoryLog, OS_LOG_TYPE_DEFAULT, "Force reevaluation, signal monitor sent a new deadline: %@", buf, 0xCu);
    }
    [(NSLock *)self->_deviceArrayLock lock];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v9 = self->_deviceArray;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          __int16 v15 = self->_accessoryLog;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v22 = v14;
            _os_log_debug_impl(&dword_22135E000, v15, OS_LOG_TYPE_DEBUG, "  handling device %@...", buf, 0xCu);
          }
          [(PowerUIAudioAccessorySmartChargeManager *)self runUpdateForDevice:[(PowerUIBluetoothHandler *)self->_btHandler getDeviceForAddressString:v14 forSession:self->_session] withHash:0];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    [(NSLock *)self->_deviceArrayLock unlock];
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (PowerUIMLAudioAccessoryModelPredictor)predictor
{
  return self->_predictor;
}

- (void)setPredictor:(id)a3
{
}

- (BTSessionImpl)session
{
  return self->_session;
}

- (void)setSession:(BTSessionImpl *)a3
{
  self->_session = a3;
}

- (OS_os_log)accessoryLog
{
  return self->_accessoryLog;
}

- (void)setAccessoryLog:(id)a3
{
}

- (NSMutableArray)deviceArray
{
  return self->_deviceArray;
}

- (void)setDeviceArray:(id)a3
{
}

- (NSLock)deviceArrayLock
{
  return self->_deviceArrayLock;
}

- (void)setDeviceArrayLock:(id)a3
{
}

- (NSMutableDictionary)accessoryStates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAccessoryStates:(id)a3
{
}

- (NSNumber)hardcodedTimeDelta
{
  return self->_hardcodedTimeDelta;
}

- (void)setHardcodedTimeDelta:(id)a3
{
}

- (NSNumber)hardcodedTimeBetweenUpdates
{
  return self->_hardcodedTimeBetweenUpdates;
}

- (void)setHardcodedTimeBetweenUpdates:(id)a3
{
}

- (NSDistributedNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (OS_dispatch_semaphore)btConnectionSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBtConnectionSemaphore:(id)a3
{
}

- (PowerUIWalletSignalMonitor)walletMonitor
{
  return self->_walletMonitor;
}

- (void)setWalletMonitor:(id)a3
{
}

- (NSMutableDictionary)acceptMessageFromRightBudForDevice
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAcceptMessageFromRightBudForDevice:(id)a3
{
}

- (NSMutableDictionary)acceptMessageFromLeftBudForDevice
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAcceptMessageFromLeftBudForDevice:(id)a3
{
}

- (PowerUIBluetoothHandler)btHandler
{
  return (PowerUIBluetoothHandler *)objc_getProperty(self, a2, 128, 1);
}

- (void)setBtHandler:(id)a3
{
}

- (BOOL)firstNotificationDisplayed
{
  return self->_firstNotificationDisplayed;
}

- (void)setFirstNotificationDisplayed:(BOOL)a3
{
  self->_firstNotificationDisplayed = a3;
}

- (NSMutableDictionary)latestAnalyticsForDevice
{
  return self->_latestAnalyticsForDevice;
}

- (void)setLatestAnalyticsForDevice:(id)a3
{
}

- (NSNumber)budSideToRecord
{
  return self->_budSideToRecord;
}

- (void)setBudSideToRecord:(id)a3
{
}

- (CBDiscovery)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong((id *)&self->_budSideToRecord, 0);
  objc_storeStrong((id *)&self->_latestAnalyticsForDevice, 0);
  objc_storeStrong((id *)&self->_btHandler, 0);
  objc_storeStrong((id *)&self->_acceptMessageFromLeftBudForDevice, 0);
  objc_storeStrong((id *)&self->_acceptMessageFromRightBudForDevice, 0);
  objc_storeStrong((id *)&self->_walletMonitor, 0);
  objc_storeStrong((id *)&self->_btConnectionSemaphore, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_hardcodedTimeBetweenUpdates, 0);
  objc_storeStrong((id *)&self->_hardcodedTimeDelta, 0);
  objc_storeStrong((id *)&self->_accessoryStates, 0);
  objc_storeStrong((id *)&self->_deviceArrayLock, 0);
  objc_storeStrong((id *)&self->_deviceArray, 0);
  objc_storeStrong((id *)&self->_accessoryLog, 0);
  objc_storeStrong((id *)&self->_predictor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)returnAccessoryStatusForDevice:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "ERROR: accessory status requested for nil device", v2, v3, v4, v5, v6);
}

void __106__PowerUIAudioAccessorySmartChargeManager_addTimeSeriesDataToStream_withSide_withFirmwareVersion_withLog___block_invoke_2_cold_1(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 error];
  uint64_t v5 = [v4 description];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_22135E000, v3, v6, "Error getting accessory charging event: %@", v7);
}

- (void)runUpdateForDevice:withHash:asInitialUpdate:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "Unknown prediction container state!", v2, v3, v4, v5, v6);
}

- (void)nameForProductID:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "Audio accessory type is unknown.", v2, v3, v4, v5, v6);
}

- (void)isSmartChargingCurrentlyEnabledForDevice:withHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "ERROR: smart charging status requested for nil device", v2, v3, v4, v5, v6);
}

- (void)client:setState:forDevice:withHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "ERROR: Failure when determining device protocol", v2, v3, v4, v5, v6);
}

- (void)setStateViaV2Protocol:forDevice:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "ERROR: setStateViaV2Protocol is trying to set unsupported state", v2, v3, v4, v5, v6);
}

- (void)setStateViaV2Protocol:(void *)a1 forDevice:(uint64_t)a2 .cold.2(void *a1, uint64_t a2)
{
  uint64_t v3 = NSNumber;
  id v4 = a1;
  uint64_t v11 = [v3 numberWithUnsignedLong:a2];
  OUTLINED_FUNCTION_5_0(&dword_22135E000, v5, v6, "Failed to send OBC Message (%lu) to device - Error code: %@", v7, v8, v9, v10, 2u);
}

- (void)getOBCDeadlineFromCBDevice:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "Error: Timeout occurred to obtain device deadline", v2, v3, v4, v5, v6);
}

- (void)fullChargeDeadlineForDevice:withHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_22135E000, v0, OS_LOG_TYPE_DEBUG, "Query CB OBC deadline from device %@", v1, 0xCu);
}

- (void)setTemporarilyDisabled:until:forDevice:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "No device for setTemporarilyDisabled request, proceed anyways", v2, v3, v4, v5, v6);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "Client does not have necessary entitlement.", v2, v3, v4, v5, v6);
}

- (void)startMockingBluetoothForFakeDevice:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "ERROR: Not an internal build, mocking mode is forbidden.", v2, v3, v4, v5, v6);
}

- (void)timeSeriesForDevice:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_22135E000, v0, v1, "Error: No device with address '%@' can be found.", v2);
}

- (void)timeSeriesForDevice:(void *)a1 .cold.2(void *a1, uint64_t a2)
{
  uint64_t v3 = NSNumber;
  id v4 = a1;
  uint64_t v5 = [v3 numberWithUnsignedLong:a2];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_22135E000, v6, v7, "Error code '%@' sending OBCv2 message to device '%@'.", v8, v9, v10, v11, v12);
}

@end