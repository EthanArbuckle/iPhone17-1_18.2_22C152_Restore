@interface PowerUIAnalyticsManager
+ (id)sharedInstance;
+ (int)convertTimelineStringToOBCEvent:(id)a3;
+ (int)obcModeOfOperationToBiomeModeOfOperation:(unint64_t)a3;
- (BOOL)submitEngagementEventWithBatteryLevel:(id)a3 targetSoC:(id)a4 predictedEndOfCharge:(id)a5 modeOfOperation:(int)a6 eventType:(int)a7;
- (BOOL)submitGaugingEventWithUpdateType:(int)a3 qmaxState:(int)a4 daysSinceQMax:(id)a5 ocvState:(int)a6 daysSinceOCV:(id)a7 fullChargeState:(int)a8 daysSinceFullChargeAttempt:(id)a9;
- (OS_dispatch_queue)eventSubmissionQueue;
- (OS_os_log)log;
- (PowerUIAnalyticsManager)init;
- (id)chargingStatisticsForSessionBetween:(id)a3 and:(id)a4;
- (id)chargingStatisticsFrom:(id)a3 to:(id)a4;
- (id)chargingStatisticsSince:(id)a3;
- (id)gaugingMitigationStatisticsSince:(id)a3;
- (id)stringFromEngagementEvent:(id)a3;
- (void)printExistingEvents;
- (void)setEventSubmissionQueue:(id)a3;
- (void)setLog:(id)a3;
@end

@implementation PowerUIAnalyticsManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__PowerUIAnalyticsManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __41__PowerUIAnalyticsManager_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (PowerUIAnalyticsManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)PowerUIAnalyticsManager;
  v2 = [(PowerUIAnalyticsManager *)&v11 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.powerui.smartcharging", "analyticsmanager");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_22135E000, v5, OS_LOG_TYPE_DEFAULT, "Log created", v10, 2u);
    }
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.poweruianalyticsmanager.eventsubmissionqueue", v6);
    eventSubmissionQueue = v2->_eventSubmissionQueue;
    v2->_eventSubmissionQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

+ (int)convertTimelineStringToOBCEvent:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"EligibleForIdle"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Plugin"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Unplug"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"FullyCharged"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"Engaged"])
  {
    int v4 = 8;
  }
  else if (([v3 isEqualToString:@"TopOff"] & 1) != 0 {
         || ([v3 isEqualToString:@"Interrupted"] & 1) != 0)
  }
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"Disabled"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 3;
    if (([v3 isEqualToString:@"TempDisabled"] & 1) == 0)
    {
      if ([v3 isEqualToString:@"TemporarilyDisabled"]) {
        int v4 = 3;
      }
      else {
        int v4 = 0;
      }
    }
  }

  return v4;
}

+ (int)obcModeOfOperationToBiomeModeOfOperation:(unint64_t)a3
{
  if (a3 - 1 > 6) {
    return 0;
  }
  else {
    return dword_2214311C8[a3 - 1];
  }
}

- (void)printExistingEvents
{
  id v3 = BiomeLibrary();
  int v4 = [v3 Device];
  v5 = [v4 Charging];
  v6 = [v5 SmartCharging];
  dispatch_queue_t v7 = [v6 publisher];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__PowerUIAnalyticsManager_printExistingEvents__block_invoke_2;
  v9[3] = &unk_2645A5D58;
  v9[4] = self;
  id v8 = (id)[v7 sinkWithCompletion:&__block_literal_global_2 receiveInput:v9];
}

void __46__PowerUIAnalyticsManager_printExistingEvents__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = (void *)MEMORY[0x263EFF910];
    log = v3;
    id v5 = a2;
    [v5 timestamp];
    v6 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
    dispatch_queue_t v7 = [v5 eventBody];
    int v8 = [v7 batteryLevel];
    v9 = [v5 eventBody];
    int v10 = [v9 targetSoC];
    objc_super v11 = [v5 eventBody];
    [v11 predictedEndOfCharge];
    uint64_t v13 = v12;
    v14 = [v5 eventBody];
    [v14 mode];
    v15 = BMDeviceSmartChargingModeOfOperationAsString();
    v16 = [v5 eventBody];

    [v16 obcEvent];
    v17 = BMDeviceSmartChargingOBCEventAsString();
    *(_DWORD *)buf = 138413570;
    v20 = v6;
    __int16 v21 = 1024;
    int v22 = v8;
    __int16 v23 = 1024;
    int v24 = v10;
    __int16 v25 = 2048;
    uint64_t v26 = v13;
    __int16 v27 = 2112;
    v28 = v15;
    __int16 v29 = 2112;
    v30 = v17;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Event (%@): SoC: %d - TargetSoC: %d - PredictedEoC: %f - Mode: %@ - event: %@", buf, 0x36u);
  }
}

- (BOOL)submitEngagementEventWithBatteryLevel:(id)a3 targetSoC:(id)a4 predictedEndOfCharge:(id)a5 modeOfOperation:(int)a6 eventType:(int)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  log = self->_log;
  BOOL v16 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (a7)
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Queuing engagementEvent", buf, 2u);
    }
    eventSubmissionQueue = self->_eventSubmissionQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __122__PowerUIAnalyticsManager_submitEngagementEventWithBatteryLevel_targetSoC_predictedEndOfCharge_modeOfOperation_eventType___block_invoke;
    block[3] = &unk_2645A5D80;
    id v20 = v12;
    id v21 = v13;
    int v24 = a6;
    int v25 = a7;
    id v22 = v14;
    __int16 v23 = self;
    dispatch_sync(eventSubmissionQueue, block);
  }
  else if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Unknown engagement event for AnalyticsManager, do not add to stream", buf, 2u);
  }

  return a7 != 0;
}

void __122__PowerUIAnalyticsManager_submitEngagementEventWithBatteryLevel_targetSoC_predictedEndOfCharge_modeOfOperation_eventType___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = (void *)os_transaction_create();
  id v3 = objc_alloc(MEMORY[0x263F2A0B8]);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v6 = NSNumber;
  [*(id *)(a1 + 48) timeIntervalSinceReferenceDate];
  dispatch_queue_t v7 = objc_msgSend(v6, "numberWithDouble:");
  int v8 = (void *)[v3 initWithBatteryLevel:v4 targetSoC:v5 predictedEndOfCharge:v7 mode:*(unsigned int *)(a1 + 64) obcEvent:*(unsigned int *)(a1 + 68)];

  v9 = BiomeLibrary();
  int v10 = [v9 Device];
  objc_super v11 = [v10 Charging];
  id v12 = [v11 SmartCharging];
  id v13 = [v12 source];
  [v13 sendEvent:v8];

  id v14 = *(NSObject **)(*(void *)(a1 + 56) + 8);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    int v16 = [v8 batteryLevel];
    int v17 = [v8 targetSoC];
    [v8 predictedEndOfCharge];
    v19[0] = 67110144;
    v19[1] = v16;
    __int16 v20 = 1024;
    int v21 = v17;
    __int16 v22 = 2048;
    uint64_t v23 = v18;
    __int16 v24 = 1024;
    int v25 = [v8 mode];
    __int16 v26 = 1024;
    int v27 = [v8 obcEvent];
    _os_log_impl(&dword_22135E000, v15, OS_LOG_TYPE_DEFAULT, "Sent engagementEvent Event: SoC: %d - TargetSoC: %d - PredictedEoC: %f - Mode: %d - event: %d", (uint8_t *)v19, 0x24u);
  }
}

- (BOOL)submitGaugingEventWithUpdateType:(int)a3 qmaxState:(int)a4 daysSinceQMax:(id)a5 ocvState:(int)a6 daysSinceOCV:(id)a7 fullChargeState:(int)a8 daysSinceFullChargeAttempt:(id)a9
{
  id v15 = a5;
  id v16 = a7;
  id v17 = a9;
  log = self->_log;
  if (a3)
  {
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
      -[PowerUIAnalyticsManager submitGaugingEventWithUpdateType:qmaxState:daysSinceQMax:ocvState:daysSinceOCV:fullChargeState:daysSinceFullChargeAttempt:](log);
    }
    eventSubmissionQueue = self->_eventSubmissionQueue;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __149__PowerUIAnalyticsManager_submitGaugingEventWithUpdateType_qmaxState_daysSinceQMax_ocvState_daysSinceOCV_fullChargeState_daysSinceFullChargeAttempt___block_invoke;
    v21[3] = &unk_2645A5DA8;
    int v26 = a3;
    int v27 = a4;
    id v22 = v15;
    int v28 = a6;
    id v23 = v16;
    int v29 = a8;
    id v24 = v17;
    int v25 = self;
    dispatch_async(eventSubmissionQueue, v21);
  }
  else if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Unknown gauging event for AnalyticsManager, do not add to stream", buf, 2u);
  }

  return a3 != 0;
}

void __149__PowerUIAnalyticsManager_submitGaugingEventWithUpdateType_qmaxState_daysSinceQMax_ocvState_daysSinceOCV_fullChargeState_daysSinceFullChargeAttempt___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v2 = (void *)[objc_alloc(MEMORY[0x263F2A058]) initWithUpdateType:*(unsigned int *)(a1 + 64) qmaxState:*(unsigned int *)(a1 + 68) daysSinceQMax:*(void *)(a1 + 32) ocvState:*(unsigned int *)(a1 + 72) daysSinceOCV:*(void *)(a1 + 40) fullChargeState:*(unsigned int *)(a1 + 76) daysSinceFullChargeAttempt:*(void *)(a1 + 48)];
  id v3 = BiomeLibrary();
  uint64_t v4 = [v3 Device];
  uint64_t v5 = [v4 Charging];
  v6 = [v5 BatteryGauging];
  dispatch_queue_t v7 = [v6 source];
  [v7 sendEvent:v2];

  int v8 = *(NSObject **)(*(void *)(a1 + 56) + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    int v10 = [v2 updateType];
    [v2 qmaxState];
    objc_super v11 = BMDeviceBatteryGaugingQMaxStateAsString();
    int v12 = [v2 daysSinceQMax];
    [v2 ocvState];
    id v13 = BMDeviceBatteryGaugingOCVStateAsString();
    int v14 = [v2 daysSinceOCV];
    [v2 fullChargeState];
    id v15 = BMDeviceBatteryGaugingPeriodicFullChargeStateAsString();
    *(_DWORD *)buf = 67110658;
    int v17 = v10;
    __int16 v18 = 2112;
    v19 = v11;
    __int16 v20 = 1024;
    int v21 = v12;
    __int16 v22 = 2112;
    id v23 = v13;
    __int16 v24 = 1024;
    int v25 = v14;
    __int16 v26 = 2112;
    int v27 = v15;
    __int16 v28 = 1024;
    int v29 = [v2 daysSinceFullChargeAttempt];
    _os_log_impl(&dword_22135E000, v9, OS_LOG_TYPE_DEFAULT, "Sent gauging Event: Type: %d - qmaxState: %@ - daysSinceQMax: %d - ocvState: %@ - daysSinceOCV: %d - fullChargeState: %@ - daysSinceFullChargeAttempt: %d", buf, 0x38u);
  }
}

- (id)stringFromEngagementEvent:(id)a3
{
  __int16 v18 = NSString;
  id v3 = (void *)MEMORY[0x263EFF910];
  id v4 = a3;
  [v4 timestamp];
  uint64_t v5 = objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  v6 = [v4 eventBody];
  uint64_t v7 = [v6 batteryLevel];
  int v8 = [v4 eventBody];
  uint64_t v9 = [v8 targetSoC];
  int v10 = [v4 eventBody];
  [v10 predictedEndOfCharge];
  uint64_t v12 = v11;
  id v13 = [v4 eventBody];
  uint64_t v14 = [v13 mode];
  id v15 = [v4 eventBody];

  id v16 = [v18 stringWithFormat:@"%@: SoC: %d - TargetSoC: %d - PredictedEoC: %f - Mode: %d - event: %d", v5, v7, v9, v12, v14, objc_msgSend(v15, "obcEvent")];

  return v16;
}

- (id)chargingStatisticsForSessionBetween:(id)a3 and:(id)a4
{
  v83[8] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v80[0] = 0;
  v80[1] = v80;
  v80[2] = 0x3032000000;
  v80[3] = __Block_byref_object_copy__0;
  v80[4] = __Block_byref_object_dispose__0;
  id v81 = 0;
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__0;
  v78 = __Block_byref_object_dispose__0;
  id v79 = 0;
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x3032000000;
  v72[3] = __Block_byref_object_copy__0;
  v72[4] = __Block_byref_object_dispose__0;
  id v73 = 0;
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x3032000000;
  v70[3] = __Block_byref_object_copy__0;
  v70[4] = __Block_byref_object_dispose__0;
  id v71 = 0;
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__0;
  v68 = __Block_byref_object_dispose__0;
  id v69 = 0;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x2020000000;
  int v63 = 0;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x2020000000;
  v61[3] = 0;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__0;
  v59 = __Block_byref_object_dispose__0;
  v60 = &stru_26D3439E8;
  uint64_t v51 = 0;
  v52 = (double *)&v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 0;
  uint64_t v47 = 0;
  v48 = (double *)&v47;
  uint64_t v49 = 0x2020000000;
  uint64_t v50 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__0;
  v45 = __Block_byref_object_dispose__0;
  id v46 = [MEMORY[0x263EFF980] arrayWithCapacity:8];
  int v8 = 8;
  do
  {
    [(id)v42[5] addObject:&unk_26D385210];
    --v8;
  }
  while (v8);
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v9 = BiomeLibrary();
  int v10 = [v9 Device];
  uint64_t v11 = [v10 Charging];
  uint64_t v12 = [v11 SmartCharging];
  id v13 = [v12 publisher];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke;
  v30[3] = &unk_2645A5DD0;
  id v14 = v6;
  id v31 = v14;
  id v15 = v7;
  id v32 = v15;
  id v16 = [v13 filterWithIsIncluded:v30];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_2;
  v29[3] = &unk_2645A5C58;
  v29[4] = self;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_72;
  v28[3] = &unk_2645A5DF8;
  v28[4] = self;
  v28[5] = v80;
  v28[6] = &v55;
  v28[7] = v72;
  v28[8] = v70;
  v28[9] = &v41;
  v28[10] = v62;
  v28[11] = &v33;
  v28[12] = v61;
  v28[13] = &v74;
  v28[14] = &v64;
  v28[15] = &v51;
  v28[16] = &v47;
  v28[17] = &v37;
  id v17 = (id)[v16 sinkWithCompletion:v29 receiveInput:v28];

  v82[0] = @"pluginTime";
  uint64_t v18 = [NSNumber numberWithDouble:v52[3]];
  v19 = (void *)v18;
  if (v75[5]) {
    __int16 v20 = &unk_26D385228;
  }
  else {
    __int16 v20 = &unk_26D385210;
  }
  v83[0] = v18;
  v83[1] = v20;
  v82[1] = @"wasOBCEligible";
  v82[2] = @"eligibleIdleTime";
  int v21 = [NSNumber numberWithDouble:v48[3]];
  uint64_t v22 = v42[5];
  v83[2] = v21;
  v83[3] = v22;
  v82[3] = @"idleTimes";
  v82[4] = @"reachedTargetSoC";
  if (v65[5]) {
    id v23 = &unk_26D385228;
  }
  else {
    id v23 = &unk_26D385210;
  }
  v83[4] = v23;
  v82[5] = @"wasUndercharged";
  __int16 v24 = [NSNumber numberWithBool:*((unsigned __int8 *)v38 + 24)];
  v83[5] = v24;
  v82[6] = @"wasTempDisabled";
  int v25 = [NSNumber numberWithBool:*((unsigned __int8 *)v34 + 24)];
  v83[6] = v25;
  v82[7] = @"sessionDescription";
  v83[7] = v56[5];
  __int16 v26 = [NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:8];

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(v61, 8);
  _Block_object_dispose(v62, 8);
  _Block_object_dispose(&v64, 8);

  _Block_object_dispose(v70, 8);
  _Block_object_dispose(v72, 8);

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(v80, 8);

  return v26;
}

BOOL __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 timestamp];
  double v5 = v4;
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  if (v5 >= v6)
  {
    [v3 timestamp];
    double v9 = v8;
    [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
    BOOL v7 = v9 <= v10;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

void __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    double v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_2_cold_1(v3);
    }
  }
}

void __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_72(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = v3;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    || ([v3 eventBody],
        double v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 obcEvent],
        v5,
        v6 == 6))
  {
    BOOL v7 = [v4 eventBody];
    int v8 = [v7 obcEvent];

    switch(v8)
    {
      case 0:
        double v10 = *(void **)(a1 + 32);
        double v9 = (id *)(a1 + 32);
        uint64_t v11 = [v10 log];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_72_cold_1(v9, (uint64_t)v4);
        }

        break;
      case 1:
        uint64_t v12 = NSString;
        uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        id v14 = (void *)MEMORY[0x263EFF910];
        [v4 timestamp];
        id v15 = objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
        id v16 = +[PowerUISmartChargeUtilities timeStringFromDate:v15];
        [v12 stringWithFormat:@"%@ Device was restarted at %@.", v13, v16];
        goto LABEL_50;
      case 2:
        id v17 = NSString;
        uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        v19 = (void *)MEMORY[0x263EFF910];
        [v4 timestamp];
        id v15 = objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
        id v16 = +[PowerUISmartChargeUtilities timeStringFromDate:v15];
        [v17 stringWithFormat:@"%@ PowerUI restarted at %@.", v18, v16];
        goto LABEL_50;
      case 3:
        __int16 v20 = NSString;
        uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        uint64_t v22 = (void *)MEMORY[0x263EFF910];
        [v4 timestamp];
        id v23 = objc_msgSend(v22, "dateWithTimeIntervalSinceReferenceDate:");
        __int16 v24 = +[PowerUISmartChargeUtilities timeStringFromDate:v23];
        uint64_t v25 = [v20 stringWithFormat:@"%@ OBC was temp disabled at %@.", v21, v24];
        uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
        int v27 = *(void **)(v26 + 40);
        *(void *)(v26 + 40) = v25;

        if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
        {
          __int16 v28 = (void *)MEMORY[0x263EFF910];
          [v4 timestamp];
          uint64_t v29 = objc_msgSend(v28, "dateWithTimeIntervalSinceReferenceDate:");
          uint64_t v30 = *(void *)(*(void *)(a1 + 64) + 8);
          id v31 = *(void **)(v30 + 40);
          *(void *)(v30 + 40) = v29;

          id v32 = NSNumber;
          uint64_t v33 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) objectAtIndexedSubscript:*(int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
          [v33 doubleValue];
          double v35 = v34;
          [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
          uint64_t v37 = [v32 numberWithDouble:v35 + v36];
          [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setObject:v37 atIndexedSubscript:*(int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
        goto LABEL_54;
      case 4:
        v38 = NSString;
        uint64_t v39 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        char v40 = (void *)MEMORY[0x263EFF910];
        [v4 timestamp];
        uint64_t v41 = objc_msgSend(v40, "dateWithTimeIntervalSinceReferenceDate:");
        v42 = +[PowerUISmartChargeUtilities timeStringFromDate:v41];
        uint64_t v43 = [v38 stringWithFormat:@"%@ OBC was feature disabled at %@.", v39, v42];
        uint64_t v44 = *(void *)(*(void *)(a1 + 48) + 8);
        v45 = *(void **)(v44 + 40);
        *(void *)(v44 + 40) = v43;

        if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
          goto LABEL_54;
        }
        id v46 = (void *)MEMORY[0x263EFF910];
        [v4 timestamp];
        uint64_t v47 = objc_msgSend(v46, "dateWithTimeIntervalSinceReferenceDate:");
        uint64_t v48 = *(void *)(*(void *)(a1 + 64) + 8);
        uint64_t v49 = *(void **)(v48 + 40);
        *(void *)(v48 + 40) = v47;

        uint64_t v50 = NSNumber;
        uint64_t v51 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) objectAtIndexedSubscript:*(int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
        [v51 doubleValue];
        double v53 = v52;
        [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
        uint64_t v55 = [v50 numberWithDouble:v53 + v54];
        [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setObject:v55 atIndexedSubscript:*(int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];

        goto LABEL_24;
      case 6:
        if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
        {
          v56 = [*(id *)(a1 + 32) log];
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
            __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_72_cold_2((id *)(a1 + 32), (uint64_t)v4);
          }
        }
        uint64_t v57 = (void *)MEMORY[0x263EFF910];
        [v4 timestamp];
        uint64_t v58 = objc_msgSend(v57, "dateWithTimeIntervalSinceReferenceDate:");
        uint64_t v59 = *(void *)(*(void *)(a1 + 40) + 8);
        v60 = *(void **)(v59 + 40);
        *(void *)(v59 + 40) = v58;

        v61 = NSString;
        uint64_t v62 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        int v63 = +[PowerUISmartChargeUtilities timeStringFromDate:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
        uint64_t v64 = [v61 stringWithFormat:@"%@ Device was plugged in at %@.", v62, v63];
        uint64_t v65 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v66 = *(void **)(v65 + 40);
        *(void *)(v65 + 40) = v64;

        break;
      case 7:
        v67 = [v4 eventBody];
        int v68 = [v67 batteryLevel];

        if (v68 == 80)
        {
          +[PowerUISmartChargeUtilities cachedHistorical80ToFullDuration];
          *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = v69;
        }
        else
        {
          v134 = [v4 eventBody];
          v135 = +[PowerUISmartChargeUtilities historicalFullChargeDurationStartingAt:withMinimumPluginDuration:](PowerUISmartChargeUtilities, "historicalFullChargeDurationStartingAt:withMinimumPluginDuration:", [v134 batteryLevel], 300);

          if ((unint64_t)[v135 count] >= 3)
          {
            v136 = [v135 sortedArrayUsingSelector:sel_compare_];
            uint64_t v137 = objc_msgSend(v136, "subarrayWithRange:", 1, objc_msgSend(v136, "count") - 2);

            v135 = (void *)v137;
          }
          [v135 percentile:0.9];
          *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = v138 / 60.0;
        }
        v139 = (void *)MEMORY[0x263EFF910];
        [v4 timestamp];
        uint64_t v140 = objc_msgSend(v139, "dateWithTimeIntervalSinceReferenceDate:");
        uint64_t v141 = *(void *)(*(void *)(a1 + 104) + 8);
        v142 = *(void **)(v141 + 40);
        *(void *)(v141 + 40) = v140;

        v143 = NSString;
        uint64_t v144 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        v145 = (void *)MEMORY[0x263EFF910];
        [v4 timestamp];
        id v15 = objc_msgSend(v145, "dateWithTimeIntervalSinceReferenceDate:");
        id v16 = +[PowerUISmartChargeUtilities timeStringFromDate:v15];
        [v143 stringWithFormat:@"%@ Device became OBC eligible at %@.", v144, v16];
        goto LABEL_50;
      case 8:
        v70 = (void *)MEMORY[0x263EFF910];
        [v4 timestamp];
        uint64_t v71 = objc_msgSend(v70, "dateWithTimeIntervalSinceReferenceDate:");
        uint64_t v72 = *(void *)(*(void *)(a1 + 56) + 8);
        id v73 = *(void **)(v72 + 40);
        *(void *)(v72 + 40) = v71;

        uint64_t v74 = [v4 eventBody];
        *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [v74 mode];

        v75 = NSString;
        uint64_t v76 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        v77 = (void *)MEMORY[0x263EFF910];
        [v4 timestamp];
        id v15 = objc_msgSend(v77, "dateWithTimeIntervalSinceReferenceDate:");
        id v16 = +[PowerUISmartChargeUtilities timeStringFromDate:v15];
        [v75 stringWithFormat:@"%@ PowerUI started controlling charging at %@.", v76, v16];
        goto LABEL_50;
      case 9:
        if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
        {
          v78 = (void *)MEMORY[0x263EFF910];
          [v4 timestamp];
          uint64_t v79 = objc_msgSend(v78, "dateWithTimeIntervalSinceReferenceDate:");
          uint64_t v80 = *(void *)(*(void *)(a1 + 64) + 8);
          id v81 = *(void **)(v80 + 40);
          *(void *)(v80 + 40) = v79;

          v82 = NSNumber;
          v83 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) objectAtIndexedSubscript:*(int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
          [v83 doubleValue];
          double v85 = v84;
          [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
          v87 = [v82 numberWithDouble:v85 + v86];
          [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setObject:v87 atIndexedSubscript:*(int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];

          v88 = NSString;
          uint64_t v89 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          uint64_t v51 = +[PowerUISmartChargeUtilities timeStringFromDate:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
          uint64_t v90 = [v88 stringWithFormat:@"%@ PowerUI stopped controlling charging at %@.", v89, v51];
          uint64_t v91 = *(void *)(*(void *)(a1 + 48) + 8);
          v92 = *(void **)(v91 + 40);
          *(void *)(v91 + 40) = v90;

LABEL_24:
        }
        else
        {
          v149 = [*(id *)(a1 + 32) log];
          if (os_log_type_enabled(v149, OS_LOG_TYPE_FAULT)) {
            __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_72_cold_3(v149);
          }

          uint64_t v150 = [NSString stringWithFormat:@"%@ Error: Found charging pause end, but not charging pause start.", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
          uint64_t v151 = *(void *)(*(void *)(a1 + 48) + 8);
          v152 = *(void **)(v151 + 40);
          *(void *)(v151 + 40) = v150;
        }
LABEL_54:
        uint64_t v153 = *(void *)(*(void *)(a1 + 64) + 8);
        v154 = *(void **)(v153 + 40);
        *(void *)(v153 + 40) = 0;

        uint64_t v155 = *(void *)(*(void *)(a1 + 56) + 8);
        v156 = *(void **)(v155 + 40);
        *(void *)(v155 + 40) = 0;

        break;
      case 10:
        v93 = (void *)MEMORY[0x263EFF910];
        [v4 timestamp];
        uint64_t v94 = objc_msgSend(v93, "dateWithTimeIntervalSinceReferenceDate:");
        uint64_t v95 = *(void *)(*(void *)(a1 + 112) + 8);
        v96 = *(void **)(v95 + 40);
        *(void *)(v95 + 40) = v94;

        v97 = NSString;
        uint64_t v98 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        v99 = (void *)MEMORY[0x263EFF910];
        [v4 timestamp];
        id v15 = objc_msgSend(v99, "dateWithTimeIntervalSinceReferenceDate:");
        id v16 = +[PowerUISmartChargeUtilities timeStringFromDate:v15];
        [v97 stringWithFormat:@"%@ Device reached target SoC at %@.", v98, v16];
        goto LABEL_50;
      case 11:
        uint64_t v100 = *(void *)(*(void *)(a1 + 112) + 8);
        v101 = *(void **)(v100 + 40);
        *(void *)(v100 + 40) = 0;

        v102 = NSString;
        uint64_t v103 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        v104 = (void *)MEMORY[0x263EFF910];
        [v4 timestamp];
        id v15 = objc_msgSend(v104, "dateWithTimeIntervalSinceReferenceDate:");
        id v16 = +[PowerUISmartChargeUtilities timeStringFromDate:v15];
        [v102 stringWithFormat:@"%@ Device lost target SoC at %@.", v103, v16];
        goto LABEL_50;
      case 12:
        [v4 timestamp];
        double v106 = v105;
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) timeIntervalSinceReferenceDate];
        *(double *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = v106 - v107;
        if (*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40))
        {
          [v4 timestamp];
          double v109 = v108;
          [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) timeIntervalSinceReferenceDate];
          *(double *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = (v109 - v110) / 60.0;
          *(double *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = fmax(*(double *)(*(void *)(*(void *)(a1 + 128)+ 8)+ 24)- *(double *)(*(void *)(*(void *)(a1 + 96)+ 8)+ 24), 0.0);
        }
        if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
        {
          if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
          {
            v111 = NSNumber;
            v112 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) objectAtIndexedSubscript:*(int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
            [v112 doubleValue];
            double v114 = v113;
            [v4 timestamp];
            double v116 = v115;
            [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) timeIntervalSinceReferenceDate];
            v118 = [v111 numberWithDouble:v114 + v116 - v117];
            [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setObject:v118 atIndexedSubscript:*(int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];

            if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
            {
              v119 = [*(id *)(a1 + 32) log];
              if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_72_cold_5(a1 + 56, v4, v119);
              }
            }
          }
        }
        v120 = [*(id *)(a1 + 32) log];
        if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG)) {
          __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_72_cold_4(v120);
        }

        if ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count])
        {
          unint64_t v121 = 0;
          do
          {
            if (!*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40))
            {
              v122 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) objectAtIndexedSubscript:v121];
              [v122 doubleValue];
              double v124 = v123;

              if (v124 > 0.0) {
                *(unsigned char *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) = 1;
              }
            }
            ++v121;
          }
          while ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count] > v121);
        }
        v125 = NSString;
        uint64_t v126 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        v127 = (void *)MEMORY[0x263EFF910];
        [v4 timestamp];
        id v15 = objc_msgSend(v127, "dateWithTimeIntervalSinceReferenceDate:");
        id v16 = +[PowerUISmartChargeUtilities timeStringFromDate:v15];
        [v125 stringWithFormat:@"%@ Device was plugged out at %@.", v126, v16];
        goto LABEL_50;
      case 13:
        v128 = NSString;
        uint64_t v129 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        v130 = (void *)MEMORY[0x263EFF910];
        [v4 timestamp];
        id v15 = objc_msgSend(v130, "dateWithTimeIntervalSinceReferenceDate:");
        id v16 = +[PowerUISmartChargeUtilities timeStringFromDate:v15];
        [v128 stringWithFormat:@"%@ SMC charge token was created at %@.", v129, v16];
        goto LABEL_50;
      case 14:
        v131 = NSString;
        uint64_t v132 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        v133 = (void *)MEMORY[0x263EFF910];
        [v4 timestamp];
        id v15 = objc_msgSend(v133, "dateWithTimeIntervalSinceReferenceDate:");
        id v16 = +[PowerUISmartChargeUtilities timeStringFromDate:v15];
        [v131 stringWithFormat:@"%@ SMC charge token was dismissed at %@.", v132, v16];
        uint64_t v146 = LABEL_50:;
        uint64_t v147 = *(void *)(*(void *)(a1 + 48) + 8);
        v148 = *(void **)(v147 + 40);
        *(void *)(v147 + 40) = v146;

        break;
      default:
        break;
    }
  }
}

- (id)chargingStatisticsSince:(id)a3
{
  double v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  int v6 = [v4 now];
  BOOL v7 = [(PowerUIAnalyticsManager *)self chargingStatisticsFrom:v5 to:v6];

  return v7;
}

- (id)chargingStatisticsFrom:(id)a3 to:(id)a4
{
  id v45 = a3;
  id v6 = a4;
  uint64_t v7 = os_transaction_create();
  v94[0] = 0;
  v94[1] = v94;
  v94[2] = 0x3032000000;
  v94[3] = __Block_byref_object_copy__0;
  v94[4] = __Block_byref_object_dispose__0;
  id v95 = 0;
  v92[0] = 0;
  v92[1] = v92;
  v92[2] = 0x3032000000;
  v92[3] = __Block_byref_object_copy__0;
  v92[4] = __Block_byref_object_dispose__0;
  id v93 = 0;
  uint64_t v88 = 0;
  uint64_t v89 = (double *)&v88;
  uint64_t v90 = 0x2020000000;
  uint64_t v91 = 0;
  uint64_t v84 = 0;
  double v85 = (double *)&v84;
  uint64_t v86 = 0x2020000000;
  uint64_t v87 = 0;
  uint64_t v80 = 0;
  id v81 = &v80;
  uint64_t v82 = 0x2020000000;
  int v83 = 0;
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x2020000000;
  int v79 = 0;
  uint64_t v72 = 0;
  id v73 = &v72;
  uint64_t v74 = 0x2020000000;
  int v75 = 0;
  uint64_t v68 = 0;
  uint64_t v69 = &v68;
  uint64_t v70 = 0x2020000000;
  int v71 = 0;
  uint64_t v64 = 0;
  uint64_t v65 = &v64;
  uint64_t v66 = 0x2020000000;
  int v67 = 0;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x2020000000;
  int v63 = 0;
  uint64_t v54 = 0;
  uint64_t v55 = &v54;
  uint64_t v56 = 0x3032000000;
  uint64_t v57 = __Block_byref_object_copy__0;
  uint64_t v58 = __Block_byref_object_dispose__0;
  [MEMORY[0x263EFF980] arrayWithCapacity:8];
  uint64_t v44 = (void *)v7;
  id v59 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x3032000000;
  uint64_t v51 = __Block_byref_object_copy__0;
  double v52 = __Block_byref_object_dispose__0;
  id v53 = [MEMORY[0x263EFF980] arrayWithCapacity:8];
  int v8 = 8;
  do
  {
    [(id)v55[5] addObject:&unk_26D385210];
    [(id)v49[5] addObject:&unk_26D385210];
    --v8;
  }
  while (v8);
  uint64_t v9 = [objc_alloc(MEMORY[0x263F2A8B0]) initWithStartDate:v45 endDate:v6 maxEvents:0 lastN:0 reversed:0];
  double v10 = BiomeLibrary();
  uint64_t v11 = [v10 Device];
  uint64_t v12 = [v11 Charging];
  uint64_t v13 = [v12 SmartCharging];
  id v14 = [v13 publisherWithOptions:v9];
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __53__PowerUIAnalyticsManager_chargingStatisticsFrom_to___block_invoke;
  v47[3] = &unk_2645A5C58;
  v47[4] = self;
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __53__PowerUIAnalyticsManager_chargingStatisticsFrom_to___block_invoke_123;
  v46[3] = &unk_2645A5E20;
  v46[4] = self;
  v46[5] = v94;
  v46[6] = v92;
  v46[7] = &v80;
  v46[8] = &v88;
  v46[9] = &v68;
  v46[10] = &v76;
  v46[11] = &v72;
  v46[12] = &v84;
  v46[13] = &v54;
  v46[14] = &v48;
  v46[15] = &v60;
  v46[16] = &v64;
  id v15 = (id)[v14 sinkWithCompletion:v47 receiveInput:v46];

  id v16 = [MEMORY[0x263EFF9A0] dictionary];
  id v17 = [NSNumber numberWithInt:*((unsigned int *)v81 + 6)];
  [v16 setObject:v17 forKeyedSubscript:@"numberChargeSessions"];

  uint64_t v18 = [NSNumber numberWithInt:*((unsigned int *)v77 + 6)];
  [v16 setObject:v18 forKeyedSubscript:@"numberChargeSessionsWithEligibleTime"];

  v19 = [NSNumber numberWithInt:*((unsigned int *)v69 + 6)];
  [v16 setObject:v19 forKeyedSubscript:@"numberChargeSessionsReachingTargetSoC"];

  __int16 v20 = [NSNumber numberWithInt:*((unsigned int *)v73 + 6)];
  [v16 setObject:v20 forKeyedSubscript:@"numberUnderCharges"];

  uint64_t v21 = [NSNumber numberWithDouble:v89[3] / 3600.0];
  [v16 setObject:v21 forKeyedSubscript:@"totalTime"];

  uint64_t v22 = [NSNumber numberWithDouble:v85[3] / 60.0];
  [v16 setObject:v22 forKeyedSubscript:@"totalEligible"];

  id v23 = [NSNumber numberWithInt:*((unsigned int *)v61 + 6)];
  [v16 setObject:v23 forKeyedSubscript:@"totalFullDisableEvents"];

  __int16 v24 = [NSNumber numberWithInt:*((unsigned int *)v65 + 6)];
  [v16 setObject:v24 forKeyedSubscript:@"totalTempDisableEvents"];

  for (unint64_t i = 0; [(id)v55[5] count] > i; ++i)
  {
    uint64_t v26 = NSNumber;
    int v27 = [(id)v55[5] objectAtIndexedSubscript:i];
    [v27 doubleValue];
    uint64_t v29 = [v26 numberWithDouble:v28 / 3600.0];
    uint64_t v30 = BMDeviceSmartChargingModeOfOperationAsString();
    [v16 setObject:v29 forKeyedSubscript:v30];
  }
  uint64_t v43 = (void *)v9;
  unint64_t v31 = 0;
  char v32 = 0;
  while ([(id)v49[5] count] > v31)
  {
    if (v31)
    {
      uint64_t v33 = [(id)v49[5] objectAtIndexedSubscript:v31];
      BOOL v34 = (int)[v33 intValue] > 0;
    }
    else
    {
      BOOL v34 = 0;
    }
    double v35 = NSString;
    double v36 = BMDeviceSmartChargingModeOfOperationAsString();
    uint64_t v37 = [v35 stringWithFormat:@"%@%@", v36, @"Count"];

    v38 = NSNumber;
    uint64_t v39 = [(id)v49[5] objectAtIndexedSubscript:v31];
    char v40 = objc_msgSend(v38, "numberWithInt:", objc_msgSend(v39, "intValue"));
    [v16 setObject:v40 forKeyedSubscript:v37];
    v32 |= v34;

    ++v31;
  }
  uint64_t v41 = [NSNumber numberWithBool:v32 & 1];
  [v16 setObject:v41 forKeyedSubscript:@"sawEngagement"];

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v84, 8);
  _Block_object_dispose(&v88, 8);
  _Block_object_dispose(v92, 8);

  _Block_object_dispose(v94, 8);
  return v16;
}

void __53__PowerUIAnalyticsManager_chargingStatisticsFrom_to___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    double v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_2_cold_1(v3);
    }
  }
}

void __53__PowerUIAnalyticsManager_chargingStatisticsFrom_to___block_invoke_123(uint64_t a1, void *a2)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v3 = a2;
  double v4 = [v3 eventBody];
  int v5 = [v4 obcEvent];

  if (v5 == 6)
  {
    id v6 = (void *)MEMORY[0x263EFF910];
    [v3 timestamp];
    uint64_t v7 = objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
      || ([v3 eventBody],
          double v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v10 obcEvent],
          v10,
          v11 != 12))
    {
      id v45 = [v3 eventBody];
      int v46 = [v45 obcEvent];

      if (v46 == 4)
      {
        uint64_t v47 = *(void *)(a1 + 120);
      }
      else
      {
        uint64_t v48 = [v3 eventBody];
        int v49 = [v48 obcEvent];

        if (v49 != 3) {
          goto LABEL_25;
        }
        uint64_t v47 = *(void *)(a1 + 128);
      }
      ++*(_DWORD *)(*(void *)(v47 + 8) + 24);
      goto LABEL_25;
    }
    uint64_t v12 = (void *)MEMORY[0x263EFF910];
    [v3 timestamp];
    uint64_t v13 = objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    id v16 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v50 = 138412546;
      uint64_t v51 = v17;
      __int16 v52 = 2112;
      uint64_t v53 = v18;
      _os_log_impl(&dword_22135E000, v16, OS_LOG_TYPE_INFO, "Found plugin between %@ and %@:", (uint8_t *)&v50, 0x16u);
    }

    v19 = [*(id *)(a1 + 32) chargingStatisticsForSessionBetween:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) and:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    __int16 v20 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v50 = 138412290;
      uint64_t v51 = v19;
      _os_log_impl(&dword_22135E000, v20, OS_LOG_TYPE_INFO, "Session: %@", (uint8_t *)&v50, 0xCu);
    }

    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v21 = [v19 objectForKeyedSubscript:@"pluginTime"];
    *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 24)
                                                                + (double)(int)[v21 intValue];

    uint64_t v22 = [v19 objectForKeyedSubscript:@"reachedTargetSoC"];
    int v23 = [v22 BOOLValue];

    if (v23) {
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    }
    __int16 v24 = [v19 objectForKeyedSubscript:@"eligibleIdleTime"];
    int v25 = [v24 intValue];

    if (v25 >= 1)
    {
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
      uint64_t v26 = [v19 objectForKeyedSubscript:@"wasUndercharged"];
      int v27 = [v26 BOOLValue];

      if (v27) {
        ++*(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
      }
    }
    *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 96) + 8)
                                                                            + 24)
                                                                + (double)v25;
    double v28 = [v19 objectForKeyedSubscript:@"idleTimes"];
    if ([v28 count])
    {
      unint64_t v29 = 0;
      do
      {
        uint64_t v30 = [v28 objectAtIndexedSubscript:v29];
        [v30 doubleValue];
        double v32 = v31;

        if (v32 > 0.0)
        {
          uint64_t v33 = NSNumber;
          BOOL v34 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) objectAtIndexedSubscript:v29];
          [v34 doubleValue];
          double v36 = v35;
          uint64_t v37 = [v28 objectAtIndexedSubscript:v29];
          [v37 doubleValue];
          uint64_t v39 = [v33 numberWithDouble:v36 + v38];
          [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) setObject:v39 atIndexedSubscript:v29];

          char v40 = NSNumber;
          uint64_t v41 = [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) objectAtIndexedSubscript:v29];
          v42 = objc_msgSend(v40, "numberWithInt:", objc_msgSend(v41, "intValue") + 1);
          [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) setObject:v42 atIndexedSubscript:v29];
        }
        ++v29;
      }
      while ([v28 count] > v29);
    }
    uint64_t v43 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v44 = *(void **)(v43 + 40);
    *(void *)(v43 + 40) = 0;
  }
LABEL_25:
}

- (id)gaugingMitigationStatisticsSince:(id)a3
{
  id v30 = a3;
  double v28 = (void *)os_transaction_create();
  uint64_t v78 = 0;
  int v79 = &v78;
  uint64_t v80 = 0x2020000000;
  int v81 = 0;
  uint64_t v74 = 0;
  int v75 = &v74;
  uint64_t v76 = 0x2020000000;
  int v77 = 0;
  uint64_t v70 = 0;
  int v71 = &v70;
  uint64_t v72 = 0x2020000000;
  int v73 = 0;
  uint64_t v66 = 0;
  int v67 = &v66;
  uint64_t v68 = 0x2020000000;
  int v69 = 0;
  uint64_t v62 = 0;
  int v63 = &v62;
  uint64_t v64 = 0x2020000000;
  int v65 = 0;
  uint64_t v58 = 0;
  id v59 = &v58;
  uint64_t v60 = 0x2020000000;
  int v61 = 0;
  uint64_t v54 = 0;
  uint64_t v55 = &v54;
  uint64_t v56 = 0x2020000000;
  int v57 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x2020000000;
  int v53 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000;
  int v49 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x2020000000;
  int v45 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  char v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  char v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__0;
  v36[4] = __Block_byref_object_dispose__0;
  id v37 = 0;
  id v3 = objc_alloc(MEMORY[0x263F2A8B0]);
  double v4 = [MEMORY[0x263EFF910] distantFuture];
  uint64_t v33 = (void *)[v3 initWithStartDate:v30 endDate:v4 maxEvents:0 lastN:0 reversed:0];

  double v32 = BiomeLibrary();
  double v31 = [v32 Device];
  int v5 = [v31 Charging];
  id v6 = [v5 SmartCharging];
  uint64_t v7 = [v6 publisherWithOptions:v33];
  uint64_t v8 = BiomeLibrary();
  uint64_t v9 = [v8 Device];
  double v10 = [v9 Charging];
  int v11 = [v10 BatteryGauging];
  uint64_t v12 = [v11 publisherWithOptions:v33];
  uint64_t v13 = [v7 orderedMergeWithOther:v12 comparator:&__block_literal_global_161];
  uint64_t v14 = [v13 filterWithIsIncluded:&__block_literal_global_163];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __60__PowerUIAnalyticsManager_gaugingMitigationStatisticsSince___block_invoke_3;
  v35[3] = &unk_2645A5C58;
  v35[4] = self;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __60__PowerUIAnalyticsManager_gaugingMitigationStatisticsSince___block_invoke_164;
  v34[3] = &unk_2645A5E68;
  v34[4] = v40;
  v34[5] = v36;
  v34[6] = &v74;
  v34[7] = &v70;
  v34[8] = &v66;
  v34[9] = &v62;
  v34[10] = &v58;
  v34[11] = v38;
  v34[12] = &v42;
  v34[13] = &v78;
  v34[14] = &v54;
  v34[15] = &v50;
  v34[16] = &v46;
  id v15 = (id)[v14 sinkWithCompletion:v35 receiveInput:v34];

  id v16 = [MEMORY[0x263EFF9A0] dictionary];
  id v17 = [NSNumber numberWithInt:*((unsigned int *)v79 + 6)];
  [v16 setObject:v17 forKeyedSubscript:@"nrOfDOD0AtQualifiedQmaxUpdates"];

  uint64_t v18 = [NSNumber numberWithInt:*((unsigned int *)v75 + 6)];
  [v16 setObject:v18 forKeyedSubscript:@"nrOfQMaxTooOld"];

  v19 = [NSNumber numberWithInt:*((unsigned int *)v71 + 6)];
  [v16 setObject:v19 forKeyedSubscript:@"nrOfDOD0TooSmall"];

  __int16 v20 = [NSNumber numberWithInt:*((unsigned int *)v67 + 6)];
  [v16 setObject:v20 forKeyedSubscript:@"nrOfQMaxRequested"];

  uint64_t v21 = [NSNumber numberWithInt:*((unsigned int *)v63 + 6)];
  [v16 setObject:v21 forKeyedSubscript:@"nrOfOCVRequested"];

  uint64_t v22 = [NSNumber numberWithInt:*((unsigned int *)v59 + 6)];
  [v16 setObject:v22 forKeyedSubscript:@"nrOfPeriodicFullChargeRequested"];

  int v23 = [NSNumber numberWithInt:*((unsigned int *)v55 + 6)];
  [v16 setObject:v23 forKeyedSubscript:@"maxDaysSinceQmax"];

  __int16 v24 = [NSNumber numberWithInt:*((unsigned int *)v51 + 6)];
  [v16 setObject:v24 forKeyedSubscript:@"maxDaysSinceOCV"];

  int v25 = [NSNumber numberWithInt:*((unsigned int *)v47 + 6)];
  [v16 setObject:v25 forKeyedSubscript:@"maxDaysSinceLastFullCharge"];

  uint64_t v26 = [NSNumber numberWithInt:*((unsigned int *)v43 + 6)];
  [v16 setObject:v26 forKeyedSubscript:@"nrOfSessionsReachingFullCharge"];

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);

  return v16;
}

uint64_t __60__PowerUIAnalyticsManager_gaugingMitigationStatisticsSince___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  id v6 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  double v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

BOOL __60__PowerUIAnalyticsManager_gaugingMitigationStatisticsSince___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [v2 eventBody];
    if ([v5 obcEvent] == 6)
    {
      BOOL v6 = 1;
    }
    else
    {
      uint64_t v7 = [v2 eventBody];
      BOOL v6 = [v7 obcEvent] == 12;
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

void __60__PowerUIAnalyticsManager_gaugingMitigationStatisticsSince___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    double v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __60__PowerUIAnalyticsManager_gaugingMitigationStatisticsSince___block_invoke_3_cold_1(v3);
    }
  }
}

void __60__PowerUIAnalyticsManager_gaugingMitigationStatisticsSince___block_invoke_164(void *a1, void *a2)
{
  id v38 = a2;
  id v3 = [v38 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v5 = [v38 eventBody];
  BOOL v6 = v5;
  if (isKindOfClass)
  {
    int v7 = [v5 obcEvent];

    if (v7 == 6)
    {
      *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
      goto LABEL_37;
    }
    uint64_t v12 = [v38 eventBody];
    int v13 = [v12 obcEvent];

    if (v13 == 12)
    {
      if (!*(unsigned char *)(*(void *)(a1[4] + 8) + 24) || (uint64_t v14 = *(void **)(*(void *)(a1[5] + 8) + 40)) == 0)
      {
LABEL_36:
        *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
        *(unsigned char *)(*(void *)(a1[11] + 8) + 24) = 0;
        uint64_t v36 = *(void *)(a1[5] + 8);
        id v37 = *(void **)(v36 + 40);
        *(void *)(v36 + 40) = 0;

        goto LABEL_37;
      }
      int v15 = [v14 qmaxState];
      switch(v15)
      {
        case 4:
          uint64_t v16 = a1[8];
          break;
        case 3:
          uint64_t v16 = a1[7];
          break;
        case 2:
          uint64_t v16 = a1[6];
          break;
        default:
LABEL_30:
          if ([*(id *)(*(void *)(a1[5] + 8) + 40) ocvState] == 2) {
            ++*(_DWORD *)(*(void *)(a1[9] + 8) + 24);
          }
          if ([*(id *)(*(void *)(a1[5] + 8) + 40) fullChargeState] == 2) {
            ++*(_DWORD *)(*(void *)(a1[10] + 8) + 24);
          }
          if (*(unsigned char *)(*(void *)(a1[11] + 8) + 24)) {
            ++*(_DWORD *)(*(void *)(a1[12] + 8) + 24);
          }
          goto LABEL_36;
      }
      ++*(_DWORD *)(*(void *)(v16 + 8) + 24);
      goto LABEL_30;
    }
  }
  else
  {
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass();

    if (v8)
    {
      id v9 = v38;
      double v10 = [v9 eventBody];
      int v11 = [v10 updateType];

      if (v11 == 2)
      {
        ++*(_DWORD *)(*(void *)(a1[13] + 8) + 24);
      }
      else if (*(unsigned char *)(*(void *)(a1[4] + 8) + 24))
      {
        id v17 = [v9 eventBody];
        int v18 = [v17 updateType];

        if (v18 == 3)
        {
          *(unsigned char *)(*(void *)(a1[11] + 8) + 24) = 1;
        }
        else
        {
          v19 = [v9 eventBody];
          int v20 = [v19 updateType];

          if (v20 == 1)
          {
            if (!*(void *)(*(void *)(a1[5] + 8) + 40))
            {
              uint64_t v21 = [v9 eventBody];
              uint64_t v22 = *(void *)(a1[5] + 8);
              int v23 = *(void **)(v22 + 40);
              *(void *)(v22 + 40) = v21;
            }
            __int16 v24 = [v9 eventBody];
            int v25 = [v24 daysSinceQMax];
            int v26 = *(_DWORD *)(*(void *)(a1[14] + 8) + 24);

            if (v25 > v26)
            {
              int v27 = [v9 eventBody];
              *(_DWORD *)(*(void *)(a1[14] + 8) + 24) = [v27 daysSinceQMax];
            }
            double v28 = [v9 eventBody];
            int v29 = [v28 daysSinceOCV];
            int v30 = *(_DWORD *)(*(void *)(a1[15] + 8) + 24);

            if (v29 > v30)
            {
              double v31 = [v9 eventBody];
              *(_DWORD *)(*(void *)(a1[15] + 8) + 24) = [v31 daysSinceOCV];
            }
            double v32 = [v9 eventBody];
            int v33 = [v32 daysSinceFullChargeAttempt];
            int v34 = *(_DWORD *)(*(void *)(a1[16] + 8) + 24);

            if (v33 > v34)
            {
              double v35 = [v9 eventBody];
              *(_DWORD *)(*(void *)(a1[16] + 8) + 24) = [v35 daysSinceFullChargeAttempt];
            }
          }
        }
      }
    }
  }
LABEL_37:
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (OS_dispatch_queue)eventSubmissionQueue
{
  return self->_eventSubmissionQueue;
}

- (void)setEventSubmissionQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventSubmissionQueue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)submitGaugingEventWithUpdateType:(os_log_t)log qmaxState:daysSinceQMax:ocvState:daysSinceOCV:fullChargeState:daysSinceFullChargeAttempt:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22135E000, log, OS_LOG_TYPE_DEBUG, "Queuing gauging event", v1, 2u);
}

void __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_2_cold_1(void *a1)
{
  v1 = [a1 error];
  id v2 = [v1 description];
  [v2 UTF8String];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22135E000, v3, v4, "Error getting chargingExperience biome events in chargingStatisticsSince: %s", v5, v6, v7, v8, v9);
}

void __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_72_cold_1(id *a1, uint64_t a2)
{
  id v2 = [*a1 stringFromEngagementEvent:a2];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22135E000, v3, v4, "Charging event with unknown state: %@", v5, v6, v7, v8, v9);
}

void __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_72_cold_2(id *a1, uint64_t a2)
{
  id v2 = [*a1 stringFromEngagementEvent:a2];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22135E000, v3, v4, "Second plugin event without unplug: %@", v5, v6, v7, v8, v9);
}

void __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_72_cold_3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_22135E000, log, OS_LOG_TYPE_FAULT, "Found charging pause end, but not charging pause start", v1, 2u);
}

void __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_72_cold_4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22135E000, log, OS_LOG_TYPE_DEBUG, "Check undercharges", v1, 2u);
}

void __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_72_cold_5(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = +[PowerUISmartChargeUtilities timeStringFromDate:*(void *)(*(void *)(*(void *)a1 + 8) + 40)];
  uint64_t v6 = (void *)MEMORY[0x263EFF910];
  [a2 timestamp];
  uint64_t v7 = objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v8 = +[PowerUISmartChargeUtilities timeStringFromDate:v7];
  int v9 = 138412546;
  double v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = v8;
  _os_log_error_impl(&dword_22135E000, a3, OS_LOG_TYPE_ERROR, "Unaccounted OBC engagement time from %@ to %@", (uint8_t *)&v9, 0x16u);
}

void __60__PowerUIAnalyticsManager_gaugingMitigationStatisticsSince___block_invoke_3_cold_1(void *a1)
{
  v1 = [a1 error];
  id v2 = [v1 description];
  [v2 UTF8String];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22135E000, v3, v4, "Error getting gauging mitigation events in analytics manager: %s", v5, v6, v7, v8, v9);
}

@end