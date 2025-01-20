@interface PLAggregateDictionaryService
+ (BOOL)metrickitClientsAvailable;
+ (id)defaults;
+ (id)entryEventNoneDefinitionSessionsFile;
+ (id)entryEventNoneDefinitions;
+ (void)load;
- (AggState)last_state;
- (BOOL)firstScreenOnAfterWake;
- (NSMutableArray)registeredNotifications;
- (NSMutableDictionary)localCache;
- (NSMutableDictionary)validReasonsDictionary;
- (NSNumber)currentMachWakeTime;
- (NSString)wakeReasonString;
- (NSString)wakeReasons;
- (PLAggregateDictionaryService)init;
- (PLCFNotificationOperatorComposition)aggregateMetrics1hrForceListener;
- (PLCFNotificationOperatorComposition)aggregateMetrics1hrListener;
- (PLCFNotificationOperatorComposition)aggregateMetrics24hrsForceListener;
- (PLCFNotificationOperatorComposition)aggregateMetrics24hrsListener;
- (PLCFNotificationOperatorComposition)aggregateMetricsForceListener;
- (PLCFNotificationOperatorComposition)aggregateMetricsListener;
- (PLCFNotificationOperatorComposition)aggregateMetricsTodayForceListener;
- (PLCFNotificationOperatorComposition)aggregateMetricsTodayListener;
- (PLCFNotificationOperatorComposition)blmAggregateCFNotification;
- (PLMonotonicTimer)dailyTaskTimer;
- (PLXPCResponderOperatorComposition)metricSummarizationStateResponder;
- (unint64_t)abstimeToNanosec:(unint64_t)a3;
- (unint64_t)bucketWakeTime:(unint64_t)a3;
- (void)addToDurationScalarKey:(id)a3 withDuration:(double)a4;
- (void)createMetricsFile:(id)a3;
- (void)initOperatorDependancies;
- (void)initValidReasonsDictionary;
- (void)logAggregateUIKitActivityKey:(id)a3 withInfo:(id)a4 AggDKey:(id)a5;
- (void)logAggregateUIKitKeyboardActivityKey:(id)a3 withInfo:(id)a4 AggDKey:(id)a5;
- (void)logDuration:(double)a3 asDistribution:(id)a4;
- (void)logEventNoneSessionsFile;
- (void)registerForApplicationNotifications;
- (void)registerForAudioNotifications;
- (void)registerForBacklightLatencyNotifications;
- (void)registerForBatteryNotifications;
- (void)registerForBluetoothNotifications;
- (void)registerForCalendarNotifications;
- (void)registerForCameraNotifications;
- (void)registerForLocationNotifications;
- (void)registerForMailNotifications;
- (void)registerForSCDynamicStoreNotifications;
- (void)registerForSafariNotifications;
- (void)registerForSpringboardNotifications;
- (void)registerForUIKitNotifications;
- (void)registerForVideoNotifications;
- (void)setAggregateMetrics1hrForceListener:(id)a3;
- (void)setAggregateMetrics1hrListener:(id)a3;
- (void)setAggregateMetrics24hrsForceListener:(id)a3;
- (void)setAggregateMetrics24hrsListener:(id)a3;
- (void)setAggregateMetricsForceListener:(id)a3;
- (void)setAggregateMetricsListener:(id)a3;
- (void)setAggregateMetricsTodayForceListener:(id)a3;
- (void)setAggregateMetricsTodayListener:(id)a3;
- (void)setBlmAggregateCFNotification:(id)a3;
- (void)setCurrentMachWakeTime:(id)a3;
- (void)setDailyTaskTimer:(id)a3;
- (void)setFirstScreenOnAfterWake:(BOOL)a3;
- (void)setLast_state:(AggState *)a3;
- (void)setLocalCache:(id)a3;
- (void)setMetricSummarizationStateResponder:(id)a3;
- (void)setRegisteredNotifications:(id)a3;
- (void)setValidReasonsDictionary:(id)a3;
- (void)setWakeReasonString:(id)a3;
- (void)setWakeReasons:(id)a3;
- (void)setupMetricsAggregation;
- (void)setupMetricsListeners;
- (void)updateAggregateStateWithEntry:(id)a3;
@end

@implementation PLAggregateDictionaryService

void __67__PLAggregateDictionaryService_registerForApplicationNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = [a2 objectForKeyedSubscript:@"entry"];
  v3 = [v2 objectForKeyedSubscript:@"Identifier"];
  v23 = v2;
  v4 = [v2 objectForKeyedSubscript:@"Reason"];
  v5 = v4;
  if (v4)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      unint64_t v8 = 0x1E4F92000uLL;
      uint64_t v9 = *(void *)v26;
      v22 = v5;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * v10) unsignedIntegerValue];
          v11 = SBSProcessAssertionGetNameForReason();
          if (v11) {
            BOOL v12 = v3 == 0;
          }
          else {
            BOOL v12 = 1;
          }
          if (!v12)
          {
            v19 = [@"appBackgroundActiveReason." stringByAppendingString:v11];
            v20 = [v19 stringByAppendingString:@"."];
            v21 = [v20 stringByAppendingString:v3];

            MEMORY[0x1D94294C0](v21, 1);
LABEL_19:

            goto LABEL_20;
          }
          if ([*(id *)(v8 + 2496) debugEnabled])
          {
            uint64_t v13 = objc_opt_class();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __67__PLAggregateDictionaryService_registerForApplicationNotifications__block_invoke_2;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v13;
            if (qword_1EBD5B0E8 != -1) {
              dispatch_once(&qword_1EBD5B0E8, block);
            }
            if (byte_1EBD5B0A7)
            {
              v21 = [NSString stringWithFormat:@"WARNING: reason or bundleid string for application notification is nil for entry %@", v23];
              v14 = (void *)MEMORY[0x1E4F929B8];
              v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateDictionaryService.m"];
              v16 = [v15 lastPathComponent];
              v17 = [NSString stringWithUTF8String:"-[PLAggregateDictionaryService registerForApplicationNotifications]_block_invoke"];
              [v14 logMessage:v21 fromFile:v16 fromFunction:v17 fromLineNumber:599];

              v18 = PLLogCommon();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v30 = v21;
                _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v5 = v22;
              unint64_t v8 = 0x1E4F92000;
              goto LABEL_19;
            }
          }
LABEL_20:

          ++v10;
        }
        while (v7 != v10);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v7);
    }
  }
}

void __63__PLAggregateDictionaryService_registerForBatteryNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 objectForKeyedSubscript:@"entry"];
  v3 = [v6 objectForKeyedSubscript:@"Level"];
  unint64_t v4 = [v3 unsignedIntegerValue];
  if (currentBatteryState <= 1 && v4 <= 1) {
    MEMORY[0x1D94294C0](@"com.apple.power.batterytraps", 1);
  }
  [*(id *)(a1 + 32) updateAggregateStateWithEntry:v6];
}

- (void)updateAggregateStateWithEntry:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"AdapterInfo"];
  uint64_t v6 = [v5 longValue];
  BOOL v7 = v6 != 0;

  unint64_t v8 = [v4 objectForKeyedSubscript:@"RawLevel"];
  [v8 doubleValue];
  double v10 = v9;

  v11 = [v4 entryDate];
  [v11 timeIntervalSince1970];
  double v13 = v12;

  [(PLAggregateDictionaryService *)self last_state];
  if (v47 == -1)
  {
    v44[0] = v6 != 0;
    v44[1] = 0;
    double v45 = v10;
    double v46 = v13;
    v16 = (BOOL *)v44;
LABEL_20:
    -[PLAggregateDictionaryService setLast_state:](self, "setLast_state:", v16, v24, *(void *)&v25, *(void *)&v26);
    goto LABEL_21;
  }
  [(PLAggregateDictionaryService *)self last_state];
  double v14 = v42 - v10;
  long double __y = v42 - v10;
  [(PLAggregateDictionaryService *)self last_state];
  double v15 = v13 - v40;
  double v41 = v13 - v40;
  [(PLAggregateDictionaryService *)self last_state];
  [(PLAggregateDictionaryService *)self last_state];
  if (!v38 && !v6)
  {
    if (fabs(v14) <= 1.0) {
      goto LABEL_18;
    }
LABEL_10:
    v17 = [v4 objectForKeyedSubscript:@"NominalChargeCapacity"];
    if (v17) {
      v18 = @"NominalChargeCapacity";
    }
    else {
      v18 = @"AppleRawMaxCapacity";
    }
    v19 = [v4 objectForKeyedSubscript:v18];
    uint64_t v20 = [v19 longValue];

    self->remainderUnpluggedEnergy = modf(v14 / 100.0 * (double)v20, &__y) + self->remainderUnpluggedEnergy;
    double remainderUnpluggedTime = modf(v15, &v41) + self->remainderUnpluggedTime;
    self->double remainderUnpluggedTime = remainderUnpluggedTime;
    double v37 = 0.0;
    if (fabs(self->remainderUnpluggedEnergy) > 1.0)
    {
      self->remainderUnpluggedEnergy = modf(self->remainderUnpluggedEnergy, &v37);
      long double __y = v37 + __y;
      double remainderUnpluggedTime = self->remainderUnpluggedTime;
    }
    double v22 = v41;
    if (fabs(remainderUnpluggedTime) > 1.0)
    {
      self->double remainderUnpluggedTime = modf(remainderUnpluggedTime, &v37);
      double v22 = v22 + v37;
    }
    long double v23 = __y;
    MEMORY[0x1D94294C0](@"com.apple.power.state.t_unplugged.energy", (uint64_t)__y);
    MEMORY[0x1D94294C0](@"com.apple.power.state.t_unplugged.duration", (uint64_t)v22);
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __62__PLAggregateDictionaryService_updateAggregateStateWithEntry___block_invoke_2;
    v34 = &__block_descriptor_48_e19___NSDictionary_8__0l;
    long double v35 = v23;
    double v36 = v22;
    AnalyticsSendEventLazy();
    v28[0] = v7;
    v28[1] = 0;
    double v29 = v10;
    double v30 = v13;
    v16 = (BOOL *)v28;
    goto LABEL_20;
  }
  if (!v39 && v6)
  {
    MEMORY[0x1D94294C0](@"com.apple.power.state.t_unplugged.count", 1);
    AnalyticsSendEventLazy();
    goto LABEL_10;
  }
LABEL_18:
  [(PLAggregateDictionaryService *)self last_state];
  if (v27 == 1)
  {
    BOOL v24 = v6 != 0;
    double v25 = v10;
    double v26 = v13;
    v16 = &v24;
    goto LABEL_20;
  }
LABEL_21:
}

- (AggState)last_state
{
  objc_copyStruct(retstr, &self->_last_state, 24, 1, 0);
  return result;
}

- (void)setLast_state:(AggState *)a3
{
}

void __61__PLAggregateDictionaryService_registerForAudioNotifications__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a2 objectForKeyedSubscript:@"entry"];
  BOOL v7 = [*(id *)(a1 + 32) localCache];
  unint64_t v8 = [v7 objectForKeyedSubscript:*(void *)(a1 + 40)];

  double v9 = [*(id *)(a1 + 32) localCache];
  [v9 setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];

  if (v6)
  {
    if (v8)
    {
      uint64_t v10 = [v8 objectForKeyedSubscript:@"Active"];
      if (v10)
      {
        v11 = (void *)v10;
        uint64_t v12 = [v8 objectForKeyedSubscript:@"ActivePID"];
        if (v12)
        {
          double v13 = (void *)v12;
          double v14 = [v8 objectForKeyedSubscript:@"ActiveRoute"];

          if (v14)
          {
            double v15 = [v6 entryDate];
            v16 = [v8 entryDate];
            [v15 timeIntervalSinceDate:v16];
            double v18 = v17;

            v19 = [v8 objectForKeyedSubscript:@"Active"];
            LODWORD(v16) = [v19 isEqual:MEMORY[0x1E4F1CC38]];

            if (v16)
            {
              uint64_t v20 = objc_opt_new();
              v21 = [v8 objectForKeyedSubscript:@"ActivePID"];

              if (v21)
              {
                double v22 = [NSString stringWithFormat:@"com.apple.power.audio.NowPlayingApp.%@", &stru_1F294E108];
                [*(id *)(a1 + 32) addToDurationScalarKey:v22 withDuration:v18];
                [v20 setObject:&stru_1F294E108 forKeyedSubscript:@"bundleID"];
              }
              long double v23 = [v8 objectForKeyedSubscript:@"ActiveRoute"];
              uint64_t v24 = [v23 plCompare:@"Speaker"];

              if (v24)
              {
                double v25 = [v8 objectForKeyedSubscript:@"ActiveRoute"];
                uint64_t v26 = [v25 plCompare:@"Headphone"];

                if (v26)
                {
                  int v27 = [v8 objectForKeyedSubscript:@"ActiveRoute"];
                  uint64_t v28 = [v27 plCompare:@"HeadphonesBT"];

                  if (v28)
                  {
                    double v29 = [v8 objectForKeyedSubscript:@"ActiveRoute"];
                    uint64_t v30 = [v29 plCompare:@"Headset"];

                    if (v30)
                    {
LABEL_26:
                      int v39 = [v8 objectForKeyedSubscript:@"ActiveRoute"];
                      [v20 setObject:v39 forKeyedSubscript:@"activeRoute"];

                      double v40 = [NSNumber numberWithDouble:v18];
                      [v20 setObject:v40 forKeyedSubscript:@"duration"];

                      id v33 = v20;
                      AnalyticsSendEventLazy();

LABEL_27:
                      goto LABEL_28;
                    }
                    uint64_t v31 = @"com.apple.power.audio.headset.duration";
                  }
                  else
                  {
                    uint64_t v31 = @"com.apple.power.audio.headphonesbt.duration";
                  }
                }
                else
                {
                  uint64_t v31 = @"com.apple.power.audio.headphone.duration";
                }
              }
              else
              {
                uint64_t v31 = @"com.apple.power.audio.speaker.duration";
              }
              [*(id *)(a1 + 32) addToDurationScalarKey:v31 withDuration:v18];
              goto LABEL_26;
            }
          }
        }
        else
        {
        }
      }
    }
  }
  else if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v32 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__PLAggregateDictionaryService_registerForAudioNotifications__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v32;
    if (qword_1EBD5B0B8 != -1) {
      dispatch_once(&qword_1EBD5B0B8, block);
    }
    if (byte_1EBD5B0A1)
    {
      id v33 = [NSString stringWithFormat:@"WARNING: PLEntryNotification for %@ triggered but lastEntry returns nil", v5];
      v34 = (void *)MEMORY[0x1E4F929B8];
      long double v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateDictionaryService.m"];
      double v36 = [v35 lastPathComponent];
      double v37 = [NSString stringWithUTF8String:"-[PLAggregateDictionaryService registerForAudioNotifications]_block_invoke"];
      [v34 logMessage:v33 fromFile:v36 fromFunction:v37 fromLineNumber:260];

      int v38 = PLLogCommon();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v43 = v33;
        _os_log_debug_impl(&dword_1D2690000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_27;
    }
  }
LABEL_28:
}

void __64__PLAggregateDictionaryService_registerForLocationNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v32 = [a2 objectForKeyedSubscript:@"entry"];
  v3 = [*(id *)(a1 + 32) localCache];
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];

  id v5 = [*(id *)(a1 + 32) localCache];
  [v5 setObject:v32 forKeyedSubscript:*(void *)(a1 + 40)];

  if (v4)
  {
    uint64_t v6 = [v32 entryDate];
    BOOL v7 = [v4 entryDate];
    [v6 timeIntervalSinceDate:v7];
    double v9 = v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"accessory"];
    LODWORD(v7) = [v10 isEqual:MEMORY[0x1E4F1CC38]];

    if (v7) {
      [*(id *)(a1 + 32) addToDurationScalarKey:@"com.apple.power.location.accessory.duration" withDuration:v9];
    }
    v11 = [v4 objectForKeyedSubscript:@"cell"];
    int v12 = [v11 isEqual:MEMORY[0x1E4F1CC38]];

    if (v12) {
      [*(id *)(a1 + 32) addToDurationScalarKey:@"com.apple.power.location.cell.duration" withDuration:v9];
    }
    double v13 = [v4 objectForKeyedSubscript:@"gps"];
    int v14 = [v13 isEqual:MEMORY[0x1E4F1CC38]];

    if (v14) {
      [*(id *)(a1 + 32) addToDurationScalarKey:@"com.apple.power.location.gps.duration" withDuration:v9];
    }
    double v15 = [v4 objectForKeyedSubscript:@"gps_coarse"];
    int v16 = [v15 isEqual:MEMORY[0x1E4F1CC38]];

    if (v16) {
      [*(id *)(a1 + 32) addToDurationScalarKey:@"com.apple.power.location.gps_coarse.duration" withDuration:v9];
    }
    double v17 = [v4 objectForKeyedSubscript:@"lac"];
    int v18 = [v17 isEqual:MEMORY[0x1E4F1CC38]];

    if (v18) {
      [*(id *)(a1 + 32) addToDurationScalarKey:@"com.apple.power.location.lac.duration" withDuration:v9];
    }
    v19 = [v4 objectForKeyedSubscript:@"mcc"];
    int v20 = [v19 isEqual:MEMORY[0x1E4F1CC38]];

    if (v20) {
      [*(id *)(a1 + 32) addToDurationScalarKey:@"com.apple.power.location.mcc.duration" withDuration:v9];
    }
    v21 = [v4 objectForKeyedSubscript:@"nmea"];
    int v22 = [v21 isEqual:MEMORY[0x1E4F1CC38]];

    if (v22) {
      [*(id *)(a1 + 32) addToDurationScalarKey:@"com.apple.power.location.nmea.duration" withDuration:v9];
    }
    long double v23 = [v4 objectForKeyedSubscript:@"pipeline"];
    int v24 = [v23 isEqual:MEMORY[0x1E4F1CC38]];

    if (v24) {
      [*(id *)(a1 + 32) addToDurationScalarKey:@"com.apple.power.location.pipeline.duration" withDuration:v9];
    }
    double v25 = [v4 objectForKeyedSubscript:@"skyhook"];
    int v26 = [v25 isEqual:MEMORY[0x1E4F1CC38]];

    if (v26) {
      [*(id *)(a1 + 32) addToDurationScalarKey:@"com.apple.power.location.skyhook.duration" withDuration:v9];
    }
    int v27 = [v4 objectForKeyedSubscript:@"wifi"];
    int v28 = [v27 isEqual:MEMORY[0x1E4F1CC38]];

    if (v28) {
      [*(id *)(a1 + 32) addToDurationScalarKey:@"com.apple.power.location.wifi.duration" withDuration:v9];
    }
    double v29 = [v4 objectForKey:@"wifi2"];

    if (v29)
    {
      uint64_t v30 = [v4 objectForKeyedSubscript:@"wifi2"];
      int v31 = [v30 isEqual:MEMORY[0x1E4F1CC38]];

      if (v31) {
        [*(id *)(a1 + 32) addToDurationScalarKey:@"com.apple.power.location.wifi2.duration" withDuration:v9];
      }
    }
  }
}

- (NSMutableDictionary)localCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)addToDurationScalarKey:(id)a3 withDuration:(double)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__PLAggregateDictionaryService_addToDurationScalarKey_withDuration___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1EBD5B0B0 != -1) {
      dispatch_once(&qword_1EBD5B0B0, block);
    }
    if (_MergedGlobals_1_69)
    {
      BOOL v7 = [NSString stringWithFormat:@"AGGD DURATION: %@ += %f", v5, *(void *)&a4];
      double v8 = (void *)MEMORY[0x1E4F929B8];
      double v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateDictionaryService.m"];
      uint64_t v10 = [v9 lastPathComponent];
      v11 = [NSString stringWithUTF8String:"-[PLAggregateDictionaryService addToDurationScalarKey:withDuration:]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:241];

      int v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v15 = v7;
        _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  MEMORY[0x1D94294C0](v5, (uint64_t)a4);
}

+ (id)defaults
{
  return &unk_1F29ED640;
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAggregateDictionaryService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventNoneDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v5 = @"SessionsFile";
  objc_super v2 = [a1 entryEventNoneDefinitionSessionsFile];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventNoneDefinitionSessionsFile
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F1590;
  v12[1] = MEMORY[0x1E4F1CC28];
  v11[2] = *MEMORY[0x1E4F92CE8];
  v12[2] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  double v9 = @"SessionsFileData";
  id v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  uint64_t v10 = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

- (PLAggregateDictionaryService)init
{
  if ([MEMORY[0x1E4F92A38] isHomePod])
  {
    v3 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PLAggregateDictionaryService;
    id v4 = [(PLOperator *)&v14 init];
    if (v4)
    {
      uint64_t v5 = objc_opt_new();
      registeredNotifications = v4->_registeredNotifications;
      v4->_registeredNotifications = (NSMutableArray *)v5;

      v4->_last_state.state = -1;
      v4->_last_state.level = 0.0;
      v4->_last_state.timestamp = 0.0;
      v4->remainderUnpluggedEnergy = 0.0;
      v4->double remainderUnpluggedTime = 0.0;
      v4->_firstScreenOnAfterWake = 0;
      uint64_t v7 = [NSNumber numberWithDouble:0.0];
      currentMachWakeTime = v4->_currentMachWakeTime;
      v4->_currentMachWakeTime = (NSNumber *)v7;

      wakeReasons = v4->_wakeReasons;
      v4->_wakeReasons = 0;

      wakeReasonString = v4->_wakeReasonString;
      v4->_wakeReasonString = 0;

      uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
      localCache = v4->_localCache;
      v4->_localCache = (NSMutableDictionary *)v11;

      [(PLAggregateDictionaryService *)v4 initValidReasonsDictionary];
    }
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  [(PLAggregateDictionaryService *)self registerForAudioNotifications];
  [(PLAggregateDictionaryService *)self registerForCameraNotifications];
  [(PLAggregateDictionaryService *)self registerForBluetoothNotifications];
  [(PLAggregateDictionaryService *)self registerForUIKitNotifications];
  [(PLAggregateDictionaryService *)self registerForSpringboardNotifications];
  [(PLAggregateDictionaryService *)self registerForVideoNotifications];
  [(PLAggregateDictionaryService *)self registerForMailNotifications];
  [(PLAggregateDictionaryService *)self registerForCalendarNotifications];
  [(PLAggregateDictionaryService *)self registerForApplicationNotifications];
  [(PLAggregateDictionaryService *)self registerForLocationNotifications];
  currentBatteryState = 0;
  [(PLAggregateDictionaryService *)self registerForBatteryNotifications];
  [(PLAggregateDictionaryService *)self registerForSCDynamicStoreNotifications];
  [(PLAggregateDictionaryService *)self registerForSafariNotifications];
  [(PLAggregateDictionaryService *)self registerForBacklightLatencyNotifications];
  [(PLAggregateDictionaryService *)self setupMetricsAggregation];
}

- (void)initValidReasonsDictionary
{
  v62[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  validReasonsDictionary = self->_validReasonsDictionary;
  self->_validReasonsDictionary = v3;

  uint64_t v5 = self->_validReasonsDictionary;
  v61[0] = @"aggdKey";
  v61[1] = @"isUserEvent";
  uint64_t v6 = MEMORY[0x1E4F1CC28];
  v62[0] = @"com.apple.performance.wake_latency.acc";
  v62[1] = MEMORY[0x1E4F1CC28];
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:2];
  [(NSMutableDictionary *)v5 setObject:v7 forKey:@"acc"];

  double v8 = self->_validReasonsDictionary;
  v59[0] = @"aggdKey";
  v59[1] = @"isUserEvent";
  v60[0] = @"com.apple.performance.wake_latency.baseband";
  v60[1] = v6;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:2];
  [(NSMutableDictionary *)v8 setObject:v9 forKey:@"baseband"];

  uint64_t v10 = self->_validReasonsDictionary;
  v57[0] = @"aggdKey";
  v57[1] = @"isUserEvent";
  uint64_t v11 = MEMORY[0x1E4F1CC38];
  v58[0] = @"com.apple.performance.wake_latency.bluetooth";
  v58[1] = MEMORY[0x1E4F1CC38];
  int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];
  [(NSMutableDictionary *)v10 setObject:v12 forKey:@"bluetooth"];

  double v13 = self->_validReasonsDictionary;
  v55[0] = @"aggdKey";
  v55[1] = @"isUserEvent";
  v56[0] = @"com.apple.performance.wake_latency.halleffect";
  v56[1] = v11;
  objc_super v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];
  [(NSMutableDictionary *)v13 setObject:v14 forKey:@"halleffect"];

  double v15 = self->_validReasonsDictionary;
  v53[0] = @"aggdKey";
  v53[1] = @"isUserEvent";
  v54[0] = @"com.apple.performance.wake_latency.halleffect";
  v54[1] = v11;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:2];
  [(NSMutableDictionary *)v15 setObject:v16 forKey:@"halleffect1"];

  double v17 = self->_validReasonsDictionary;
  v51[0] = @"aggdKey";
  v51[1] = @"isUserEvent";
  v52[0] = @"com.apple.performance.wake_latency.halleffect";
  v52[1] = v11;
  int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:2];
  [(NSMutableDictionary *)v17 setObject:v18 forKey:@"halleffect2"];

  v19 = self->_validReasonsDictionary;
  v49[0] = @"aggdKey";
  v49[1] = @"isUserEvent";
  v50[0] = @"com.apple.performance.wake_latency.hold";
  v50[1] = v11;
  int v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];
  [(NSMutableDictionary *)v19 setObject:v20 forKey:@"hold"];

  v21 = self->_validReasonsDictionary;
  v47[0] = @"aggdKey";
  v47[1] = @"isUserEvent";
  v48[0] = @"com.apple.performance.wake_latency.menu";
  v48[1] = v11;
  int v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:2];
  [(NSMutableDictionary *)v21 setObject:v22 forKey:@"menu"];

  long double v23 = self->_validReasonsDictionary;
  v45[0] = @"aggdKey";
  v45[1] = @"isUserEvent";
  v46[0] = @"com.apple.performance.wake_latency.mikey";
  v46[1] = v11;
  int v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
  [(NSMutableDictionary *)v23 setObject:v24 forKey:@"mikey"];

  double v25 = self->_validReasonsDictionary;
  v43[0] = @"aggdKey";
  v43[1] = @"isUserEvent";
  v44[0] = @"com.apple.performance.wake_latency.ringer";
  v44[1] = v11;
  int v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];
  [(NSMutableDictionary *)v25 setObject:v26 forKey:@"ringer"];

  int v27 = self->_validReasonsDictionary;
  v41[0] = @"aggdKey";
  v41[1] = @"isUserEvent";
  v42[0] = @"com.apple.performance.wake_latency.rtc";
  v42[1] = v6;
  int v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
  [(NSMutableDictionary *)v27 setObject:v28 forKey:@"rtc"];

  double v29 = self->_validReasonsDictionary;
  v39[0] = @"aggdKey";
  v39[1] = @"isUserEvent";
  v40[0] = @"com.apple.performance.wake_latency.stockholm";
  v40[1] = v11;
  uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
  [(NSMutableDictionary *)v29 setObject:v30 forKey:@"stockholm"];

  int v31 = self->_validReasonsDictionary;
  v37[0] = @"aggdKey";
  v37[1] = @"isUserEvent";
  v38[0] = @"com.apple.performance.wake_latency.usb";
  v38[1] = v6;
  id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
  [(NSMutableDictionary *)v31 setObject:v32 forKey:@"usb"];

  id v33 = self->_validReasonsDictionary;
  v35[0] = @"aggdKey";
  v35[1] = @"isUserEvent";
  v36[0] = @"com.apple.performance.wake_latency.wlan";
  v36[1] = v6;
  v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
  [(NSMutableDictionary *)v33 setObject:v34 forKey:@"wlan"];
}

uint64_t __68__PLAggregateDictionaryService_addToDurationScalarKey_withDuration___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_69 = result;
  return result;
}

- (void)logDuration:(double)a3 asDistribution:(id)a4
{
}

- (void)registerForAudioNotifications
{
  v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"Routing"];
  id v4 = [(PLAggregateDictionaryService *)self registeredNotifications];
  id v5 = objc_alloc(MEMORY[0x1E4F929E8]);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __61__PLAggregateDictionaryService_registerForAudioNotifications__block_invoke;
  uint64_t v11 = &unk_1E6932648;
  int v12 = self;
  id v13 = v3;
  id v6 = v3;
  uint64_t v7 = (void *)[v5 initWithOperator:self forEntryKey:v6 withBlock:&v8];
  objc_msgSend(v4, "addObject:", v7, v8, v9, v10, v11, v12);
}

uint64_t __61__PLAggregateDictionaryService_registerForAudioNotifications__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B0A1 = result;
  return result;
}

id __61__PLAggregateDictionaryService_registerForAudioNotifications__block_invoke_181(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)registerForCameraNotifications
{
  uint64_t v3 = *MEMORY[0x1E4F92D30];
  id v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"Camera"];
  id v5 = +[PLOperator entryKeyForType:v3 andName:@"Torch"];
  id v6 = [(PLAggregateDictionaryService *)self registeredNotifications];
  id v7 = objc_alloc(MEMORY[0x1E4F929E8]);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__PLAggregateDictionaryService_registerForCameraNotifications__block_invoke;
  v15[3] = &unk_1E692A0F0;
  v15[4] = self;
  uint64_t v8 = (void *)[v7 initWithOperator:self forEntryKey:v4 withBlock:v15];
  [v6 addObject:v8];

  uint64_t v9 = [(PLAggregateDictionaryService *)self registeredNotifications];
  id v10 = objc_alloc(MEMORY[0x1E4F929E8]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __62__PLAggregateDictionaryService_registerForCameraNotifications__block_invoke_3;
  v13[3] = &unk_1E6932648;
  v13[4] = self;
  id v14 = v5;
  id v11 = v5;
  int v12 = (void *)[v10 initWithOperator:self forEntryKey:v11 withBlock:v13];
  [v9 addObject:v12];
}

void __62__PLAggregateDictionaryService_registerForCameraNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:@"entry"];
  id v4 = [v3 objectForKeyedSubscript:@"CameraType"];
  id v5 = +[PLCameraAgent distributionFromCameraType:](PLCameraAgent, "distributionFromCameraType:", [v4 intValue]);

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) localCache];
    id v7 = [v6 objectForKeyedSubscript:v5];

    uint64_t v8 = [*(id *)(a1 + 32) localCache];
    [v8 setObject:v3 forKeyedSubscript:v5];

    if (v7)
    {
      uint64_t v9 = [v7 objectForKeyedSubscript:@"State"];

      if (v9)
      {
        id v10 = [v3 entryDate];
        id v11 = [v7 entryDate];
        [v10 timeIntervalSinceDate:v11];
        double v13 = v12;

        id v14 = [v7 objectForKeyedSubscript:@"State"];
        LODWORD(v11) = [v14 isEqual:MEMORY[0x1E4F1CC38]];

        if (v11)
        {
          [*(id *)(a1 + 32) logDuration:v5 asDistribution:v13];
          id v15 = v3;
          AnalyticsSendEventLazy();
        }
      }
    }
  }
}

id __62__PLAggregateDictionaryService_registerForCameraNotifications__block_invoke_2(uint64_t a1)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CameraType";
  uint64_t v2 = NSNumber;
  uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"CameraType"];
  id v4 = objc_msgSend(v2, "numberWithInt:", objc_msgSend(v3, "intValue"));
  v8[1] = @"StateDuration";
  v9[0] = v4;
  id v5 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

void __62__PLAggregateDictionaryService_registerForCameraNotifications__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 objectForKeyedSubscript:@"entry"];
  id v4 = [*(id *)(a1 + 32) localCache];
  id v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];

  id v6 = [*(id *)(a1 + 32) localCache];
  [v6 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];

  if (v5)
  {
    id v7 = [v5 objectForKeyedSubscript:@"Level"];

    if (v7)
    {
      uint64_t v8 = [v3 entryDate];
      uint64_t v9 = [v5 entryDate];
      [v8 timeIntervalSinceDate:v9];
      double v11 = v10;

      if ([*(id *)(a1 + 32) isDebugEnabled]
        && [MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v12 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __62__PLAggregateDictionaryService_registerForCameraNotifications__block_invoke_4;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v12;
        if (qword_1EBD5B0C0 != -1) {
          dispatch_once(&qword_1EBD5B0C0, block);
        }
        if (byte_1EBD5B0A2)
        {
          double v13 = NSString;
          id v14 = [v5 objectForKeyedSubscript:@"Level"];
          id v15 = [v13 stringWithFormat:@"LastEntry for Torch:%@ and last Level is %@", v5, v14];

          uint64_t v16 = (void *)MEMORY[0x1E4F929B8];
          double v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateDictionaryService.m"];
          int v18 = [v17 lastPathComponent];
          v19 = [NSString stringWithUTF8String:"-[PLAggregateDictionaryService registerForCameraNotifications]_block_invoke_3"];
          [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:345];

          int v20 = PLLogCommon();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            double v25 = v15;
            _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      v21 = [v5 objectForKeyedSubscript:@"Level"];
      char v22 = [v21 isEqual:&unk_1F29E86C8];

      if ((v22 & 1) == 0)
      {
        [*(id *)(a1 + 32) logDuration:@"com.apple.power.torch.activeDuration" asDistribution:v11];
        AnalyticsSendEventLazy();
      }
    }
  }
}

uint64_t __62__PLAggregateDictionaryService_registerForCameraNotifications__block_invoke_4(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B0A2 = result;
  return result;
}

id __62__PLAggregateDictionaryService_registerForCameraNotifications__block_invoke_210(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"StateDuration";
  v1 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)logAggregateUIKitKeyboardActivityKey:(id)a3 withInfo:(id)a4 AggDKey:(id)a5
{
  id v26 = a3;
  id v8 = a5;
  uint64_t v9 = [a4 objectForKeyedSubscript:@"entry"];
  double v10 = v9;
  if (v9)
  {
    double v11 = [v9 objectForKeyedSubscript:@"Process-ID"];
    uint64_t v12 = [(PLAggregateDictionaryService *)self localCache];
    double v13 = [v12 objectForKeyedSubscript:v26];

    if (!v13)
    {
      id v14 = [MEMORY[0x1E4F1CA60] dictionary];
      id v15 = [(PLAggregateDictionaryService *)self localCache];
      [v15 setObject:v14 forKeyedSubscript:v26];
    }
    uint64_t v16 = [(PLAggregateDictionaryService *)self localCache];
    double v17 = [v16 objectForKeyedSubscript:v26];
    int v18 = [v17 objectForKeyedSubscript:v11];

    v19 = [v10 objectForKeyedSubscript:@"Status"];
    LODWORD(v17) = [v19 isEqual:MEMORY[0x1E4F1CC38]];

    if (v17)
    {
      if (!v18)
      {
        int v20 = [v10 entryDate];
        v21 = [(PLAggregateDictionaryService *)self localCache];
        char v22 = [v21 objectForKeyedSubscript:v26];
        [v22 setObject:v20 forKeyedSubscript:v11];
LABEL_9:
      }
    }
    else if (v18)
    {
      long double v23 = [v10 entryDate];
      [v23 timeIntervalSinceDate:v18];
      double v25 = v24;

      int v20 = [NSString stringWithFormat:@"com.apple.UIKit.%@.screenOnTime", v8];
      [(PLAggregateDictionaryService *)self logDuration:v20 asDistribution:v25];
      v21 = [(PLAggregateDictionaryService *)self localCache];
      char v22 = [v21 objectForKeyedSubscript:v26];
      [v22 removeObjectForKey:v11];
      goto LABEL_9;
    }
  }
}

- (void)logAggregateUIKitActivityKey:(id)a3 withInfo:(id)a4 AggDKey:(id)a5
{
  id v23 = a3;
  id v8 = a5;
  uint64_t v9 = [a4 objectForKeyedSubscript:@"entry"];
  if (v9)
  {
    double v10 = [(PLAggregateDictionaryService *)self localCache];
    double v11 = [v10 objectForKeyedSubscript:v23];

    if (v11)
    {
      uint64_t v12 = [v9 objectForKeyedSubscript:@"Status"];
      double v13 = [v11 objectForKeyedSubscript:@"Status"];
      char v14 = [v12 isEqual:v13];

      if (v14)
      {
LABEL_7:

        goto LABEL_8;
      }
      id v15 = [v11 objectForKeyedSubscript:@"Status"];
      int v16 = [v15 isEqual:MEMORY[0x1E4F1CC38]];

      if (v16)
      {
        double v17 = [v9 entryDate];
        int v18 = [v11 entryDate];
        [v17 timeIntervalSinceDate:v18];
        double v20 = v19;

        v21 = [NSString stringWithFormat:@"com.apple.UIKit.%@.screenOnTime", v8];
        [(PLAggregateDictionaryService *)self logDuration:v21 asDistribution:v20];
      }
    }
    char v22 = [(PLAggregateDictionaryService *)self localCache];
    [v22 setObject:v9 forKeyedSubscript:v23];

    goto LABEL_7;
  }
LABEL_8:
}

- (void)registerForUIKitNotifications
{
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly])
  {
    uint64_t v3 = *MEMORY[0x1E4F92D30];
    id v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"UIKitKeyboard"];
    id v5 = +[PLOperator entryKeyForType:v3 andName:@"UIKitAlert"];
    id v6 = +[PLOperator entryKeyForType:v3 andName:@"UIKitActivity"];
    id v7 = [(PLAggregateDictionaryService *)self registeredNotifications];
    id v8 = objc_alloc(MEMORY[0x1E4F929E8]);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __61__PLAggregateDictionaryService_registerForUIKitNotifications__block_invoke;
    v27[3] = &unk_1E6932648;
    v27[4] = self;
    id v28 = v4;
    id v9 = v4;
    double v10 = (void *)[v8 initWithOperator:self forEntryKey:v9 withBlock:v27];
    [v7 addObject:v10];

    double v11 = [(PLAggregateDictionaryService *)self registeredNotifications];
    id v12 = objc_alloc(MEMORY[0x1E4F929E8]);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __61__PLAggregateDictionaryService_registerForUIKitNotifications__block_invoke_2;
    v25[3] = &unk_1E6932648;
    v25[4] = self;
    id v26 = v5;
    id v13 = v5;
    char v14 = (void *)[v12 initWithOperator:self forEntryKey:v13 withBlock:v25];
    [v11 addObject:v14];

    id v15 = [(PLAggregateDictionaryService *)self registeredNotifications];
    id v16 = objc_alloc(MEMORY[0x1E4F929E8]);
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __61__PLAggregateDictionaryService_registerForUIKitNotifications__block_invoke_3;
    char v22 = &unk_1E6932648;
    id v23 = self;
    id v24 = v6;
    id v17 = v6;
    int v18 = (void *)[v16 initWithOperator:self forEntryKey:v17 withBlock:&v19];
    objc_msgSend(v15, "addObject:", v18, v19, v20, v21, v22, v23);
  }
}

uint64_t __61__PLAggregateDictionaryService_registerForUIKitNotifications__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) logAggregateUIKitKeyboardActivityKey:*(void *)(a1 + 40) withInfo:a2 AggDKey:@"UIKeyboard"];
}

uint64_t __61__PLAggregateDictionaryService_registerForUIKitNotifications__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) logAggregateUIKitActivityKey:*(void *)(a1 + 40) withInfo:a2 AggDKey:@"UIAlert"];
}

uint64_t __61__PLAggregateDictionaryService_registerForUIKitNotifications__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) logAggregateUIKitActivityKey:*(void *)(a1 + 40) withInfo:a2 AggDKey:@"UIActivity"];
}

- (void)registerForSpringboardNotifications
{
  uint64_t v3 = *MEMORY[0x1E4F92D48];
  id v9 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"SBAutoLock"];
  id v4 = +[PLOperator entryKeyForType:v3 andName:@"SBNotifications"];
  id v5 = [(PLAggregateDictionaryService *)self registeredNotifications];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929E8]) initWithOperator:self forNotification:v9 withBlock:&__block_literal_global_51];
  [v5 addObject:v6];

  id v7 = [(PLAggregateDictionaryService *)self registeredNotifications];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F929E8]) initWithOperator:self forEntryKey:v4 withBlock:&__block_literal_global_245];
  [v7 addObject:v8];
}

void __67__PLAggregateDictionaryService_registerForSpringboardNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v7 = [a2 objectForKeyedSubscript:@"entry"];
  uint64_t v2 = [v7 objectForKeyedSubscript:@"AutoLockType"];
  char v3 = [v2 isEqual:&unk_1F29E86C8];

  if (v3)
  {
    id v4 = @"com.apple.springboard.autolockCount";
  }
  else
  {
    id v5 = [v7 objectForKeyedSubscript:@"AutoLockType"];
    int v6 = [v5 isEqual:&unk_1F29E86E0];

    if (!v6) {
      goto LABEL_6;
    }
    id v4 = @"com.apple.springboard.lockscreenDimCount";
  }
  MEMORY[0x1D94294C0](v4, 1);
LABEL_6:
}

void __67__PLAggregateDictionaryService_registerForSpringboardNotifications__block_invoke_243(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 objectForKeyedSubscript:@"entry"];
  char v3 = objc_opt_new();
  id v4 = [v2 objectForKeyedSubscript:@"NotificationType"];
  char v5 = [v4 isEqual:&unk_1F29E86C8];

  if (v5)
  {
    int v6 = @"local";
    id v7 = @"com.apple.power.App.LocalNotifications";
LABEL_5:
    MEMORY[0x1D94294C0](v7, 1);
    [v3 setObject:v6 forKeyedSubscript:@"type"];
    goto LABEL_6;
  }
  id v8 = [v2 objectForKeyedSubscript:@"NotificationType"];
  int v9 = [v8 isEqual:&unk_1F29E86E0];

  if (v9)
  {
    int v6 = @"remote";
    id v7 = @"com.apple.power.App.RemoteNotifications";
    goto LABEL_5;
  }
LABEL_6:
  double v11 = v3;
  id v10 = v3;
  AnalyticsSendEventLazy();
}

id __67__PLAggregateDictionaryService_registerForSpringboardNotifications__block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)registerForBluetoothNotifications
{
  char v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"DeviceState"];
  id v4 = [(PLAggregateDictionaryService *)self registeredNotifications];
  id v5 = objc_alloc(MEMORY[0x1E4F929E8]);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __65__PLAggregateDictionaryService_registerForBluetoothNotifications__block_invoke;
  double v11 = &unk_1E6932648;
  id v12 = self;
  id v13 = v3;
  id v6 = v3;
  id v7 = (void *)[v5 initWithOperator:self forEntryKey:v6 withBlock:&v8];
  objc_msgSend(v4, "addObject:", v7, v8, v9, v10, v11, v12);
}

void __65__PLAggregateDictionaryService_registerForBluetoothNotifications__block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 objectForKeyedSubscript:@"entry"];
  id v4 = [*(id *)(a1 + 32) localCache];
  id v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];

  id v6 = [*(id *)(a1 + 32) localCache];
  [v6 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];

  id v7 = [v3 entryDate];
  uint64_t v8 = [v5 entryDate];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  double v11 = [v5 objectForKeyedSubscript:@"DeviceConnected"];
  LODWORD(v8) = [v11 isEqual:MEMORY[0x1E4F1CC38]];

  if (v8)
  {
    [*(id *)(a1 + 32) logDuration:@"com.apple.power.bluetooth.connected.duration" asDistribution:v10];
    AnalyticsSendEventLazy();
  }
  id v12 = [v5 objectForKeyedSubscript:@"DeviceDiscoverable"];
  int v13 = [v12 isEqual:MEMORY[0x1E4F1CC38]];

  if (v13)
  {
    [*(id *)(a1 + 32) logDuration:@"com.apple.power.bluetooth.discoverable.duration" asDistribution:v10];
    AnalyticsSendEventLazy();
  }
}

id __65__PLAggregateDictionaryService_registerForBluetoothNotifications__block_invoke_2(uint64_t a1)
{
  void v5[2] = *MEMORY[0x1E4F143B8];
  v4[1] = @"duration";
  v5[0] = @"connected";
  v4[0] = @"state";
  v1 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

id __65__PLAggregateDictionaryService_registerForBluetoothNotifications__block_invoke_3(uint64_t a1)
{
  void v5[2] = *MEMORY[0x1E4F143B8];
  v4[1] = @"duration";
  v5[0] = @"discoverable";
  v4[0] = @"state";
  v1 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

- (void)registerForVideoNotifications
{
  char v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"Video"];
  id v4 = [(PLAggregateDictionaryService *)self registeredNotifications];
  id v5 = objc_alloc(MEMORY[0x1E4F929E8]);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  double v10 = __61__PLAggregateDictionaryService_registerForVideoNotifications__block_invoke;
  double v11 = &unk_1E6932648;
  id v12 = self;
  id v13 = v3;
  id v6 = v3;
  id v7 = (void *)[v5 initWithOperator:self forEntryKey:v6 withBlock:&v8];
  objc_msgSend(v4, "addObject:", v7, v8, v9, v10, v11, v12);
}

void __61__PLAggregateDictionaryService_registerForVideoNotifications__block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 objectForKeyedSubscript:@"entry"];
  id v4 = [*(id *)(a1 + 32) localCache];
  id v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];

  id v6 = [*(id *)(a1 + 32) localCache];
  [v6 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];

  id v7 = [v3 entryDate];
  uint64_t v8 = [v5 entryDate];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  double v11 = [v3 objectForKeyedSubscript:@"State"];
  LODWORD(v8) = [v11 isEqual:&unk_1F29E86F8];

  if (v8)
  {
    [*(id *)(a1 + 32) logDuration:@"com.apple.power.video.duration" asDistribution:v10];
    id v12 = v3;
    AnalyticsSendEventLazy();
  }
}

id __61__PLAggregateDictionaryService_registerForVideoNotifications__block_invoke_301(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"BundleId";
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"clientDisplayID"];
  v6[1] = @"StateDuration";
  v7[0] = v2;
  char v3 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)registerForMailNotifications
{
  char v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"MailFetch"];
  id v4 = [(PLAggregateDictionaryService *)self registeredNotifications];
  id v5 = objc_alloc(MEMORY[0x1E4F929E8]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__PLAggregateDictionaryService_registerForMailNotifications__block_invoke;
  void v7[3] = &unk_1E692A0F0;
  v7[4] = self;
  id v6 = (void *)[v5 initWithOperator:self forEntryKey:v3 withBlock:v7];
  [v4 addObject:v6];
}

void __60__PLAggregateDictionaryService_registerForMailNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a2 objectForKeyedSubscript:@"entry"];
  char v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 objectForKeyedSubscript:@"account"];
    if (v4)
    {
      id v5 = (void *)v4;
      id v6 = [MEMORY[0x1E4F28E58] characterSetWithCharactersInString:@"/"];
      uint64_t v7 = [v5 rangeOfCharacterFromSet:v6];

      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (![MEMORY[0x1E4F929C0] debugEnabled]) {
          goto LABEL_36;
        }
        uint64_t v8 = objc_opt_class();
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        void v43[2] = __60__PLAggregateDictionaryService_registerForMailNotifications__block_invoke_329;
        v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v43[4] = v8;
        if (qword_1EBD5B0D0 != -1) {
          dispatch_once(&qword_1EBD5B0D0, v43);
        }
        if (!byte_1EBD5B0A4) {
          goto LABEL_36;
        }
        double v9 = [NSString stringWithFormat:@"WARNING: mail account type has no slash: %@", v5];
        double v10 = (void *)MEMORY[0x1E4F929B8];
        double v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateDictionaryService.m"];
        id v12 = [v11 lastPathComponent];
        id v13 = [NSString stringWithUTF8String:"-[PLAggregateDictionaryService registerForMailNotifications]_block_invoke_2"];
        [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:541];

        char v14 = PLLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v46 = (uint64_t)v9;
          _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        uint64_t v15 = (uint64_t)v5;
      }
      else
      {
        uint64_t v15 = [v5 substringToIndex:v7];

        int v27 = [v3 objectForKeyedSubscript:@"duration"];
        double v9 = v27;
        if (v27 && [v27 length])
        {
          id v28 = [v9 substringToIndex:[v9 length] - 1];

          double v29 = NSNumber;
          [v28 doubleValue];
          uint64_t v30 = objc_msgSend(v29, "numberWithDouble:");
          int v31 = [@"com.apple.mobilemail." stringByAppendingString:v15];
          MEMORY[0x1D94294C0]([v31 stringByAppendingString:@".fetchCount"], 1);
          uint64_t v32 = [v31 stringByAppendingString:@".fetchDuration"];
          [v30 doubleValue];
          MEMORY[0x1D94294C0](v32, (int)(v33 * 1000.0));

          double v9 = v28;
        }
        else if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v34 = objc_opt_class();
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          void v44[2] = __60__PLAggregateDictionaryService_registerForMailNotifications__block_invoke_2;
          v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v44[4] = v34;
          if (qword_1EBD5B0C8 != -1) {
            dispatch_once(&qword_1EBD5B0C8, v44);
          }
          if (byte_1EBD5B0A3)
          {
            long double v35 = [NSString stringWithFormat:@"WARNING: mail fetch durationString is invalid or empty"];
            double v36 = (void *)MEMORY[0x1E4F929B8];
            double v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateDictionaryService.m"];
            int v38 = [v37 lastPathComponent];
            int v39 = [NSString stringWithUTF8String:"-[PLAggregateDictionaryService registerForMailNotifications]_block_invoke"];
            [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:538];

            double v40 = PLLogCommon();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v46 = (uint64_t)v35;
              _os_log_debug_impl(&dword_1D2690000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
      }
    }
    else
    {
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_27;
      }
      uint64_t v21 = objc_opt_class();
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      void v42[2] = __60__PLAggregateDictionaryService_registerForMailNotifications__block_invoke_336;
      v42[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v42[4] = v21;
      if (qword_1EBD5B0D8 != -1) {
        dispatch_once(&qword_1EBD5B0D8, v42);
      }
      if (!byte_1EBD5B0A5)
      {
LABEL_27:
        id v5 = 0;
LABEL_36:

        goto LABEL_37;
      }
      double v9 = [NSString stringWithFormat:@"WARNING: mail notification account type is nil for entry %@", v3];
      char v22 = (void *)MEMORY[0x1E4F929B8];
      id v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateDictionaryService.m"];
      id v24 = [v23 lastPathComponent];
      double v25 = [NSString stringWithUTF8String:"-[PLAggregateDictionaryService registerForMailNotifications]_block_invoke_2"];
      [v22 logMessage:v9 fromFile:v24 fromFunction:v25 fromLineNumber:544];

      id v26 = PLLogCommon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v46 = (uint64_t)v9;
        _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      uint64_t v15 = 0;
    }
LABEL_35:

    id v5 = (void *)v15;
    goto LABEL_36;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v16 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__PLAggregateDictionaryService_registerForMailNotifications__block_invoke_342;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v16;
    if (qword_1EBD5B0E0 != -1) {
      dispatch_once(&qword_1EBD5B0E0, block);
    }
    if (byte_1EBD5B0A6)
    {
      uint64_t v15 = [NSString stringWithFormat:@"WARNING: mail notification: thisEntry is invalid! Serious bug in entryNotification system"];
      id v17 = (void *)MEMORY[0x1E4F929B8];
      int v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateDictionaryService.m"];
      uint64_t v19 = [v18 lastPathComponent];
      uint64_t v20 = [NSString stringWithUTF8String:"-[PLAggregateDictionaryService registerForMailNotifications]_block_invoke_2"];
      [v17 logMessage:v15 fromFile:v19 fromFunction:v20 fromLineNumber:547];

      double v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v46 = v15;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      goto LABEL_35;
    }
  }
LABEL_37:
}

uint64_t __60__PLAggregateDictionaryService_registerForMailNotifications__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B0A3 = result;
  return result;
}

uint64_t __60__PLAggregateDictionaryService_registerForMailNotifications__block_invoke_329(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B0A4 = result;
  return result;
}

uint64_t __60__PLAggregateDictionaryService_registerForMailNotifications__block_invoke_336(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B0A5 = result;
  return result;
}

uint64_t __60__PLAggregateDictionaryService_registerForMailNotifications__block_invoke_342(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B0A6 = result;
  return result;
}

- (void)registerForCalendarNotifications
{
  uint64_t v3 = *MEMORY[0x1E4F92D48];
  uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"DACalendarItemsDownloaded"];
  id v5 = +[PLOperator entryKeyForType:v3 andName:@"DACalendarItemsUploaded"];
  id v6 = [(PLAggregateDictionaryService *)self registeredNotifications];
  id v7 = objc_alloc(MEMORY[0x1E4F929E8]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__PLAggregateDictionaryService_registerForCalendarNotifications__block_invoke;
  void v14[3] = &unk_1E692A0F0;
  uint64_t v15 = @"com.apple.power.calendar";
  uint64_t v8 = (void *)[v7 initWithOperator:self forEntryKey:v4 withBlock:v14];
  [v6 addObject:v8];

  double v9 = [(PLAggregateDictionaryService *)self registeredNotifications];
  id v10 = objc_alloc(MEMORY[0x1E4F929E8]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__PLAggregateDictionaryService_registerForCalendarNotifications__block_invoke_3;
  void v12[3] = &unk_1E692A0F0;
  id v13 = @"com.apple.power.calendar";
  double v11 = (void *)[v10 initWithOperator:self forEntryKey:v5 withBlock:v12];
  [v9 addObject:v11];
}

void __64__PLAggregateDictionaryService_registerForCalendarNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 objectForKeyedSubscript:@"entry"];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"NumberOfItemsChanged"];
  MEMORY[0x1D94294C0](@"com.apple.power.calendar.numberItemsDownloaded", [v3 unsignedLongValue]);
  MEMORY[0x1D94294C0](@"com.apple.power.calendar.syncCount", 1);
  id v5 = v3;
  id v4 = v3;
  AnalyticsSendEventLazy();
}

id __64__PLAggregateDictionaryService_registerForCalendarNotifications__block_invoke_2(uint64_t a1)
{
  void v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"numberItemsDownloaded";
  v1 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(*(id *)(a1 + 32), "unsignedLongValue"));
  v4[1] = @"syncCount";
  v5[0] = v1;
  v5[1] = &unk_1F29E86E0;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

void __64__PLAggregateDictionaryService_registerForCalendarNotifications__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 objectForKeyedSubscript:@"entry"];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"NumberOfItemsChanged"];
  MEMORY[0x1D94294C0](@"com.apple.power.calendar.numberItemsUploaded", [v3 unsignedLongValue]);
  id v5 = v3;
  id v4 = v3;
  AnalyticsSendEventLazy();
}

id __64__PLAggregateDictionaryService_registerForCalendarNotifications__block_invoke_4(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"numberItemsUploaded";
  v1 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(*(id *)(a1 + 32), "unsignedLongValue"));
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)registerForApplicationNotifications
{
  uint64_t v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"Application"];
  id v4 = [(PLAggregateDictionaryService *)self registeredNotifications];
  id v5 = objc_alloc(MEMORY[0x1E4F929E8]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__PLAggregateDictionaryService_registerForApplicationNotifications__block_invoke;
  void v7[3] = &unk_1E692A0F0;
  v7[4] = self;
  id v6 = (void *)[v5 initWithOperator:self forNotification:v3 withBlock:v7];
  [v4 addObject:v6];
}

uint64_t __67__PLAggregateDictionaryService_registerForApplicationNotifications__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B0A7 = result;
  return result;
}

- (void)registerForLocationNotifications
{
  uint64_t v3 = [(PLAggregateDictionaryService *)self registeredNotifications];
  id v4 = objc_alloc(MEMORY[0x1E4F929E8]);
  id v6 = @"PLLocationAgent_EventForward_TechStatus";
  id v5 = objc_msgSend(v4, "initWithOperator:forEntryKey:withBlock:", self, MEMORY[0x1E4F143A8], 3221225472, __64__PLAggregateDictionaryService_registerForLocationNotifications__block_invoke, &unk_1E6932648, self);
  [v3 addObject:v5];
}

- (void)registerForBatteryNotifications
{
  uint64_t v3 = [(PLAggregateDictionaryService *)self registeredNotifications];
  id v4 = objc_alloc(MEMORY[0x1E4F929E8]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __63__PLAggregateDictionaryService_registerForBatteryNotifications__block_invoke;
  v6[3] = &unk_1E692A0F0;
  v6[4] = self;
  id v5 = (void *)[v4 initWithOperator:self forEntryKey:@"PLBatteryAgent_EventBackward_Battery" withBlock:v6];
  [v3 addObject:v5];
}

- (void)registerForSCDynamicStoreNotifications
{
  uint64_t v3 = *MEMORY[0x1E4F92D30];
  id v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"CellularActive"];
  id v5 = +[PLOperator entryKeyForType:v3 andName:@"WifiActive"];
  id v6 = +[PLOperator entryKeyForType:v3 andName:@"HotspotActive"];
  id v7 = [(PLAggregateDictionaryService *)self registeredNotifications];
  id v8 = objc_alloc(MEMORY[0x1E4F929E8]);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __70__PLAggregateDictionaryService_registerForSCDynamicStoreNotifications__block_invoke;
  v27[3] = &unk_1E6932648;
  v27[4] = self;
  id v28 = v4;
  id v9 = v4;
  id v10 = (void *)[v8 initWithOperator:self forEntryKey:v9 withBlock:v27];
  [v7 addObject:v10];

  double v11 = [(PLAggregateDictionaryService *)self registeredNotifications];
  id v12 = objc_alloc(MEMORY[0x1E4F929E8]);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __70__PLAggregateDictionaryService_registerForSCDynamicStoreNotifications__block_invoke_487;
  v25[3] = &unk_1E6932648;
  v25[4] = self;
  id v26 = v5;
  id v13 = v5;
  char v14 = (void *)[v12 initWithOperator:self forEntryKey:v13 withBlock:v25];
  [v11 addObject:v14];

  uint64_t v15 = [(PLAggregateDictionaryService *)self registeredNotifications];
  id v16 = objc_alloc(MEMORY[0x1E4F929E8]);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __70__PLAggregateDictionaryService_registerForSCDynamicStoreNotifications__block_invoke_2;
  char v22 = &unk_1E6932648;
  id v23 = self;
  id v24 = v6;
  id v17 = v6;
  int v18 = (void *)[v16 initWithOperator:self forEntryKey:v17 withBlock:&v19];
  objc_msgSend(v15, "addObject:", v18, v19, v20, v21, v22, v23);
}

void __70__PLAggregateDictionaryService_registerForSCDynamicStoreNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 objectForKeyedSubscript:@"entry"];
  id v4 = [*(id *)(a1 + 32) localCache];
  id v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];

  id v6 = [*(id *)(a1 + 32) localCache];
  [v6 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];

  if (!v5) {
    goto LABEL_17;
  }
  id v7 = [v5 objectForKeyedSubscript:@"Active"];
  int v8 = [v7 isEqual:MEMORY[0x1E4F1CC38]];

  if (!v8) {
    goto LABEL_17;
  }
  id v9 = [v3 entryDate];
  uint64_t v10 = [v5 entryDate];
  [v9 timeIntervalSinceDate:v10];
  double v12 = v11;

  [*(id *)(a1 + 32) addToDurationScalarKey:@"com.apple.power.reachability.cellular.duration" withDuration:v12];
  id v13 = [v5 objectForKeyedSubscript:@"LinkQuality"];
  LOBYTE(v10) = [v13 isEqual:&unk_1F29E8710];

  if (v10)
  {
    char v14 = @"com.apple.power.link_quality.Good.duration";
  }
  else
  {
    uint64_t v15 = [v5 objectForKeyedSubscript:@"LinkQuality"];
    char v16 = [v15 isEqual:&unk_1F29E8728];

    if (v16)
    {
      char v14 = @"com.apple.power.link_quality.Bad.duration";
    }
    else
    {
      id v17 = [v5 objectForKeyedSubscript:@"LinkQuality"];
      char v18 = [v17 isEqual:&unk_1F29E8740];

      if (v18) {
        goto LABEL_10;
      }
      char v14 = @"com.apple.power.link_quality.Poor.duration";
    }
  }
  [*(id *)(a1 + 32) addToDurationScalarKey:v14 withDuration:v12];
LABEL_10:
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v19 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    id v28 = __70__PLAggregateDictionaryService_registerForSCDynamicStoreNotifications__block_invoke_483;
    double v29 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v30 = v19;
    if (qword_1EBD5B0F0 != -1) {
      dispatch_once(&qword_1EBD5B0F0, &block);
    }
    if (byte_1EBD5B0A8)
    {
      uint64_t v20 = [NSString stringWithFormat:@"Entry for SCDS: %@", v3, block, v27, v28, v29, v30];
      uint64_t v21 = (void *)MEMORY[0x1E4F929B8];
      char v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateDictionaryService.m"];
      id v23 = [v22 lastPathComponent];
      id v24 = [NSString stringWithUTF8String:"-[PLAggregateDictionaryService registerForSCDynamicStoreNotifications]_block_invoke_2"];
      [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:715];

      double v25 = PLLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v32 = v20;
        _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
LABEL_17:
}

uint64_t __70__PLAggregateDictionaryService_registerForSCDynamicStoreNotifications__block_invoke_483(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B0A8 = result;
  return result;
}

void __70__PLAggregateDictionaryService_registerForSCDynamicStoreNotifications__block_invoke_487(uint64_t a1, void *a2)
{
  id v12 = [a2 objectForKeyedSubscript:@"entry"];
  uint64_t v3 = [*(id *)(a1 + 32) localCache];
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];

  id v5 = [*(id *)(a1 + 32) localCache];
  [v5 setObject:v12 forKeyedSubscript:*(void *)(a1 + 40)];

  if (v4)
  {
    id v6 = [v4 objectForKeyedSubscript:@"Active"];
    int v7 = [v6 isEqual:MEMORY[0x1E4F1CC38]];

    if (v7)
    {
      int v8 = [v12 entryDate];
      id v9 = [v4 entryDate];
      [v8 timeIntervalSinceDate:v9];
      double v11 = v10;

      [*(id *)(a1 + 32) addToDurationScalarKey:@"com.apple.power.reachability.wifi.duration" withDuration:v11];
    }
  }
}

void __70__PLAggregateDictionaryService_registerForSCDynamicStoreNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  id v12 = [a2 objectForKeyedSubscript:@"entry"];
  uint64_t v3 = [*(id *)(a1 + 32) localCache];
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];

  id v5 = [*(id *)(a1 + 32) localCache];
  [v5 setObject:v12 forKeyedSubscript:*(void *)(a1 + 40)];

  if (v4)
  {
    id v6 = [v4 objectForKeyedSubscript:@"Active"];
    int v7 = [v6 isEqual:MEMORY[0x1E4F1CC38]];

    if (v7)
    {
      int v8 = [v12 entryDate];
      id v9 = [v4 entryDate];
      [v8 timeIntervalSinceDate:v9];
      double v11 = v10;

      [*(id *)(a1 + 32) addToDurationScalarKey:@"com.apple.power.reachability.hotspot.duration" withDuration:v11];
    }
  }
}

- (void)registerForSafariNotifications
{
  uint64_t v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"SafariFetcher"];
  id v4 = [(PLAggregateDictionaryService *)self registeredNotifications];
  id v5 = objc_alloc(MEMORY[0x1E4F929E8]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__PLAggregateDictionaryService_registerForSafariNotifications__block_invoke;
  void v7[3] = &unk_1E692A0F0;
  v7[4] = self;
  id v6 = (void *)[v5 initWithOperator:self forEntryKey:v3 withBlock:v7];
  [v4 addObject:v6];
}

void __62__PLAggregateDictionaryService_registerForSafariNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a2 objectForKeyedSubscript:@"entry"];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"FetcherState"];
  int v4 = [v3 isEqualToString:@"start"];

  if (v4)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v5 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__PLAggregateDictionaryService_registerForSafariNotifications__block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v5;
      if (qword_1EBD5B0F8 != -1) {
        dispatch_once(&qword_1EBD5B0F8, block);
      }
      if (byte_1EBD5B0A9)
      {
        id v6 = [NSString stringWithFormat:@"adding to safari fetcher state"];
        int v7 = (void *)MEMORY[0x1E4F929B8];
        int v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateDictionaryService.m"];
        id v9 = [v8 lastPathComponent];
        double v10 = [NSString stringWithUTF8String:"-[PLAggregateDictionaryService registerForSafariNotifications]_block_invoke"];
        [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:747];

        double v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          char v14 = v6;
          _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    MEMORY[0x1D94294C0](@"com.apple.safari.reading_list_items.count", 1);
  }
}

uint64_t __62__PLAggregateDictionaryService_registerForSafariNotifications__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B0A9 = result;
  return result;
}

- (void)registerForBacklightLatencyNotifications
{
  if (+[PLDisplayAgent shouldLogBacklightControl])
  {
    uint64_t v3 = *MEMORY[0x1E4F92D48];
    int v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"BacklightControl"];
    uint64_t v5 = [(PLAggregateDictionaryService *)self registeredNotifications];
    id v6 = objc_alloc(MEMORY[0x1E4F929E8]);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __72__PLAggregateDictionaryService_registerForBacklightLatencyNotifications__block_invoke;
    void v14[3] = &unk_1E692A0F0;
    void v14[4] = self;
    int v7 = (void *)[v6 initWithOperator:self forEntryKey:v4 withBlock:v14];
    [v5 addObject:v7];

    int v8 = +[PLOperator entryKeyForType:v3 andName:@"CurrentMachWakeTime"];
    id v9 = [(PLAggregateDictionaryService *)self registeredNotifications];
    id v10 = objc_alloc(MEMORY[0x1E4F929E8]);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __72__PLAggregateDictionaryService_registerForBacklightLatencyNotifications__block_invoke_2;
    void v12[3] = &unk_1E6932648;
    void v12[4] = self;
    id v13 = @"CurrentMachWakeTime";
    double v11 = (void *)[v10 initWithOperator:self forEntryKey:v8 withBlock:v12];
    [v9 addObject:v11];
  }
}

void __72__PLAggregateDictionaryService_registerForBacklightLatencyNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 objectForKey:@"entry"];
  int v4 = [v3 objectForKey:@"backlightEnabledTimestamp"];
  [v4 doubleValue];
  double v6 = v5;

  int v7 = [*(id *)(a1 + 32) currentMachWakeTime];
  [v7 doubleValue];
  double v9 = v8;

  if ([*(id *)(a1 + 32) firstScreenOnAfterWake] && (unint64_t)v9)
  {
    uint64_t v33 = v3;
    unint64_t v32 = objc_msgSend(*(id *)(a1 + 32), "bucketWakeTime:", objc_msgSend(*(id *)(a1 + 32), "abstimeToNanosec:", (unint64_t)v6 - (unint64_t)v9)/ 0xF4240uLL);
    id v10 = [*(id *)(a1 + 32) wakeReasons];
    double v11 = [v10 componentsSeparatedByString:@" "];

    [*(id *)(a1 + 32) setWakeReasonString:@"com.apple.performance.wake_latency.other"];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v35;
LABEL_5:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v34 + 1) + 8 * v16);
        char v18 = [*(id *)(a1 + 32) validReasonsDictionary];
        uint64_t v19 = [v18 allKeys];
        int v20 = [v19 containsObject:v17];

        if (v20)
        {
          uint64_t v21 = *(void **)(a1 + 32);
          uint64_t v22 = [v21 validReasonsDictionary];
          id v23 = [(id)v22 objectForKeyedSubscript:v17];
          id v24 = [v23 objectForKeyedSubscript:@"aggdKey"];
          [v21 setWakeReasonString:v24];

          double v25 = [*(id *)(a1 + 32) validReasonsDictionary];
          id v26 = [v25 objectForKeyedSubscript:v17];
          uint64_t v27 = [v26 objectForKeyedSubscript:@"isUserEvent"];
          LOBYTE(v22) = [v27 BOOLValue];

          if (v22) {
            break;
          }
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
          if (v14) {
            goto LABEL_5;
          }
          break;
        }
      }
    }

    id v28 = *(void **)(a1 + 32);
    double v29 = [v28 wakeReasonString];
    [v28 logDuration:v29 asDistribution:(double)v32];

    [*(id *)(a1 + 32) setFirstScreenOnAfterWake:0];
    uint64_t v30 = *(void **)(a1 + 32);
    int v31 = [NSNumber numberWithDouble:0.0];
    [v30 setCurrentMachWakeTime:v31];

    uint64_t v3 = v33;
  }
}

void __72__PLAggregateDictionaryService_registerForBacklightLatencyNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = [a2 objectForKey:@"entry"];
  uint64_t v3 = *(void **)(a1 + 32);
  int v4 = [v7 objectForKey:*(void *)(a1 + 40)];
  [v3 setCurrentMachWakeTime:v4];

  double v5 = *(void **)(a1 + 32);
  double v6 = [v7 objectForKey:@"WakeReasons"];
  [v5 setWakeReasons:v6];

  [*(id *)(a1 + 32) setFirstScreenOnAfterWake:1];
}

- (unint64_t)abstimeToNanosec:(unint64_t)a3
{
  double v4 = *(double *)&abstimeToNanosec__tmScale;
  if (*(double *)&abstimeToNanosec__tmScale < 0.0)
  {
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    LODWORD(v6) = info.denom;
    LODWORD(v5) = info.numer;
    double v4 = (double)v5 / (double)v6;
    abstimeToNanosec__tmScale = *(void *)&v4;
  }
  return (unint64_t)(v4 * (double)a3);
}

- (unint64_t)bucketWakeTime:(unint64_t)a3
{
  if (a3 < 0x3E8)
  {
    unsigned int v3 = 10;
    return a3 - (unsigned __int16)a3 % v3;
  }
  if (a3 >> 3 < 0x271)
  {
    unsigned int v3 = 100;
    return a3 - (unsigned __int16)a3 % v3;
  }
  if (a3 >> 4 <= 0x270)
  {
    unsigned int v3 = 500;
    return a3 - (unsigned __int16)a3 % v3;
  }
  return 10000;
}

void *__62__PLAggregateDictionaryService_updateAggregateStateWithEntry___block_invoke()
{
  return &unk_1F29ED668;
}

id __62__PLAggregateDictionaryService_updateAggregateStateWithEntry___block_invoke_2(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"Energy";
  uint64_t v2 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v6[1] = @"Duration";
  v7[0] = v2;
  unsigned int v3 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v7[1] = v3;
  double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)logEventNoneSessionsFile
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"SessionsFile"];
  unsigned int v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  double v4 = [v3 contentsOfDirectoryAtPath:@"/var/mobile/Library/Logs/CrashReporter/" error:0];
  unint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self BEGINSWITH[cd] 'log-power-'"];
  unint64_t v6 = [v4 filteredArrayUsingPredicate:v5];

  if (![v6 count]) {
    goto LABEL_32;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (!v8) {
    goto LABEL_31;
  }
  uint64_t v9 = v8;
  uint64_t v39 = v2;
  double v40 = v6;
  int v38 = v4;
  id v44 = 0;
  uint64_t v10 = *(void *)v51;
  double v11 = 0.0;
  unint64_t v12 = 0x1E4F92000uLL;
  uint64_t v45 = *(void *)v51;
  id v41 = v7;
  do
  {
    uint64_t v13 = 0;
    uint64_t v42 = v9;
    do
    {
      if (*(void *)v51 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v14 = [@"/var/mobile/Library/Logs/CrashReporter/" stringByAppendingString:*(void *)(*((void *)&v50 + 1) + 8 * v13)];
      id v49 = 0;
      uint64_t v15 = [v3 attributesOfItemAtPath:v14 error:&v49];
      id v16 = v49;
      if (!v16)
      {
        double v25 = [v15 fileModificationDate];
        [v25 timeIntervalSince1970];
        double v27 = v26;

        if (v27 <= v11) {
          goto LABEL_18;
        }
        uint64_t v19 = v44;
        id v44 = v14;
        double v11 = v27;
        goto LABEL_17;
      }
      if ([*(id *)(v12 + 2496) debugEnabled])
      {
        uint64_t v17 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __56__PLAggregateDictionaryService_logEventNoneSessionsFile__block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v17;
        if (qword_1EBD5B100 != -1) {
          dispatch_once(&qword_1EBD5B100, block);
        }
        if (byte_1EBD5B0AA)
        {
          char v18 = v3;
          uint64_t v19 = [NSString stringWithFormat:@"Reading file error: %@", v16];
          int v20 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateDictionaryService.m"];
          uint64_t v22 = [v21 lastPathComponent];
          id v23 = [NSString stringWithUTF8String:"-[PLAggregateDictionaryService logEventNoneSessionsFile]"];
          [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:940];

          id v24 = PLLogCommon();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v55 = v19;
            _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unsigned int v3 = v18;
          unint64_t v12 = 0x1E4F92000;
          id v7 = v41;
          uint64_t v9 = v42;
LABEL_17:

          uint64_t v10 = v45;
        }
      }
LABEL_18:

      ++v13;
    }
    while (v9 != v13);
    uint64_t v9 = [v7 countByEnumeratingWithState:&v50 objects:v56 count:16];
  }
  while (v9);

  double v4 = v38;
  uint64_t v2 = v39;
  unint64_t v6 = v40;
  if (v44)
  {
    id v28 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v39];
    id v47 = 0;
    double v29 = [NSString stringWithContentsOfFile:v44 encoding:4 error:&v47];
    id v30 = v47;
    [v28 setObject:v29 forKeyedSubscript:@"SessionsFileData"];

    if (v30)
    {
      if ([*(id *)(v12 + 2496) debugEnabled])
      {
        uint64_t v31 = objc_opt_class();
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        void v46[2] = __56__PLAggregateDictionaryService_logEventNoneSessionsFile__block_invoke_581;
        v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v46[4] = v31;
        if (qword_1EBD5B108 != -1) {
          dispatch_once(&qword_1EBD5B108, v46);
        }
        if (byte_1EBD5B0AB)
        {
          unint64_t v32 = [NSString stringWithFormat:@"Error reading file content: %@", v30];
          uint64_t v33 = (void *)MEMORY[0x1E4F929B8];
          long long v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateDictionaryService.m"];
          long long v35 = [v34 lastPathComponent];
          long long v36 = [NSString stringWithUTF8String:"-[PLAggregateDictionaryService logEventNoneSessionsFile]"];
          [v33 logMessage:v32 fromFile:v35 fromFunction:v36 fromLineNumber:957];

          long long v37 = PLLogCommon();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v55 = v32;
            _os_log_debug_impl(&dword_1D2690000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v6 = v40;
        }
      }
    }
    else
    {
      [(PLOperator *)self logEntry:v28];
    }

    id v7 = v44;
LABEL_31:
  }
LABEL_32:
}

uint64_t __56__PLAggregateDictionaryService_logEventNoneSessionsFile__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B0AA = result;
  return result;
}

uint64_t __56__PLAggregateDictionaryService_logEventNoneSessionsFile__block_invoke_581(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B0AB = result;
  return result;
}

- (void)setupMetricsAggregation
{
  void v12[3] = *MEMORY[0x1E4F143B8];
  [(PLAggregateDictionaryService *)self setupMetricsListeners];
  if ((([MEMORY[0x1E4F92A88] isAppAnalyticsEnabled] & 1) != 0
     || +[PLAggregateDictionaryService metrickitClientsAvailable](PLAggregateDictionaryService, "metrickitClientsAvailable"))&& ![MEMORY[0x1E4F929C0] BOOLForKey:@"DisableMetricsAggregation" ifNotSet:0])
  {
    [(PLOperator *)self defaultDoubleForKey:@"Interval"];
    unint64_t v5 = objc_msgSend(MEMORY[0x1E4F92978], "timeCriterionWithInterval:");
    v12[0] = v5;
    unint64_t v6 = [MEMORY[0x1E4F92970] pluggedInCriterion];
    v12[1] = v6;
    id v7 = [MEMORY[0x1E4F92970] displayOffCriterion];
    v12[2] = v7;
    double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];

    uint64_t v8 = [MEMORY[0x1E4F92980] sharedInstance];
    uint64_t v9 = [(PLOperator *)self workQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__PLAggregateDictionaryService_setupMetricsAggregation__block_invoke;
    v10[3] = &unk_1E6931388;
    v10[4] = self;
    [v8 scheduleActivityWithIdentifier:@"com.apple.powerlogd.PLAggregateDictionaryService.dailyTasks" withCriteria:v4 withMustRunCriterion:0 withQueue:v9 withInterruptBlock:0 withActivityBlock:v10];
  }
  else
  {
    unsigned int v3 = [MEMORY[0x1E4F92980] sharedInstance];
    [v3 cancelActivityWithIdentifier:@"com.apple.powerlogd.PLAggregateDictionaryService.dailyTasks"];

    double v4 = PLLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2690000, v4, OS_LOG_TYPE_INFO, "aggregation disabled", buf, 2u);
    }
  }
}

void __55__PLAggregateDictionaryService_setupMetricsAggregation__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    unsigned int v3 = [*(id *)(a1 + 32) workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__PLAggregateDictionaryService_setupMetricsAggregation__block_invoke_2;
    block[3] = &unk_1E692A250;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v3, block);

    double v4 = PLLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v5 = 0;
      _os_log_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEFAULT, "Dispatched metric summarization activity", v5, 2u);
    }
  }
}

void __55__PLAggregateDictionaryService_setupMetricsAggregation__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEFAULT, "Starting metric summarization activity", buf, 2u);
  }

  [*(id *)(a1 + 32) createMetricsFile:0];
  if ([MEMORY[0x1E4F929C0] taskMode]) {
    [*(id *)(a1 + 32) logEventNoneSessionsFile];
  }
  unsigned int v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEFAULT, "Finished metric summarization activity", v4, 2u);
  }
}

- (void)setupMetricsListeners
{
  if ([MEMORY[0x1E4F92A38] internalBuild])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F929A0]);
    double v4 = [(PLOperator *)self workQueue];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    void v35[2] = __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke;
    v35[3] = &unk_1E692A0F0;
    v35[4] = self;
    unint64_t v5 = (void *)[v3 initWithWorkQueue:v4 forNotification:@"com.apple.powerlogd.metricsAggregate" requireState:0 withBlock:v35];
    [(PLAggregateDictionaryService *)self setAggregateMetricsListener:v5];

    id v6 = objc_alloc(MEMORY[0x1E4F929A0]);
    id v7 = [(PLOperator *)self workQueue];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_601;
    v34[3] = &unk_1E692A0F0;
    v34[4] = self;
    uint64_t v8 = (void *)[v6 initWithWorkQueue:v7 forNotification:@"com.apple.powerlogd.metricsAggregateToday" requireState:0 withBlock:v34];
    [(PLAggregateDictionaryService *)self setAggregateMetricsTodayListener:v8];

    id v9 = objc_alloc(MEMORY[0x1E4F929A0]);
    uint64_t v10 = [(PLOperator *)self workQueue];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_614;
    v33[3] = &unk_1E692A0F0;
    v33[4] = self;
    double v11 = (void *)[v9 initWithWorkQueue:v10 forNotification:@"com.apple.powerlogd.metricsAggregateForce" requireState:0 withBlock:v33];
    [(PLAggregateDictionaryService *)self setAggregateMetricsForceListener:v11];

    id v12 = objc_alloc(MEMORY[0x1E4F929A0]);
    uint64_t v13 = [(PLOperator *)self workQueue];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_618;
    v32[3] = &unk_1E692A0F0;
    v32[4] = self;
    uint64_t v14 = (void *)[v12 initWithWorkQueue:v13 forNotification:@"com.apple.powerlogd.metricsAggregateTodayForce" requireState:0 withBlock:v32];
    [(PLAggregateDictionaryService *)self setAggregateMetricsTodayForceListener:v14];

    id v15 = objc_alloc(MEMORY[0x1E4F929A0]);
    id v16 = [(PLOperator *)self workQueue];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_622;
    v31[3] = &unk_1E692A0F0;
    v31[4] = self;
    uint64_t v17 = (void *)[v15 initWithWorkQueue:v16 forNotification:@"com.apple.powerlogd.metricsAggregate24hrs" requireState:0 withBlock:v31];
    [(PLAggregateDictionaryService *)self setAggregateMetrics24hrsListener:v17];

    id v18 = objc_alloc(MEMORY[0x1E4F929A0]);
    uint64_t v19 = [(PLOperator *)self workQueue];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_629;
    v30[3] = &unk_1E692A0F0;
    v30[4] = self;
    int v20 = (void *)[v18 initWithWorkQueue:v19 forNotification:@"com.apple.powerlogd.metricsAggregate24hrsForce" requireState:0 withBlock:v30];
    [(PLAggregateDictionaryService *)self setAggregateMetrics24hrsForceListener:v20];

    id v21 = objc_alloc(MEMORY[0x1E4F929A0]);
    uint64_t v22 = [(PLOperator *)self workQueue];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_633;
    v29[3] = &unk_1E692A0F0;
    v29[4] = self;
    id v23 = (void *)[v21 initWithWorkQueue:v22 forNotification:@"com.apple.powerlogd.metricsAggregate1hr" requireState:0 withBlock:v29];
    [(PLAggregateDictionaryService *)self setAggregateMetrics1hrListener:v23];

    id v24 = objc_alloc(MEMORY[0x1E4F929A0]);
    double v25 = [(PLOperator *)self workQueue];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    _DWORD v28[2] = __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_640;
    v28[3] = &unk_1E692A0F0;
    v28[4] = self;
    double v26 = (void *)[v24 initWithWorkQueue:v25 forNotification:@"com.apple.powerlogd.metricsAggregate1hrForce" requireState:0 withBlock:v28];
    [(PLAggregateDictionaryService *)self setAggregateMetrics1hrForceListener:v26];

    double v27 = (void *)[objc_alloc(MEMORY[0x1E4F92AA8]) initWithOperator:self withRegistration:&unk_1F29ED690 withBlock:&__block_literal_global_661];
    [(PLAggregateDictionaryService *)self setMetricSummarizationStateResponder:v27];
  }
}

void __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke(uint64_t a1)
{
  if (([MEMORY[0x1E4F92A88] isAppAnalyticsEnabled] & 1) != 0
    || +[PLAggregateDictionaryService metrickitClientsAvailable])
  {
    uint64_t v2 = PLLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v4 = 0;
      _os_log_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEFAULT, "creating metrics file", v4, 2u);
    }

    [*(id *)(a1 + 32) createMetricsFile:0];
  }
  else
  {
    id v3 = PLLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEFAULT, "metrics file notification ignored", buf, 2u);
    }
  }
}

void __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_601(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A88] isAppAnalyticsEnabled] & 1) != 0
    || +[PLAggregateDictionaryService metrickitClientsAvailable])
  {
    uint64_t v2 = PLLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEFAULT, "creating metrics file for today", v6, 2u);
    }

    v7[0] = @"AppAnalyticsEnabled";
    id v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x1E4F92A88], "isAppAnalyticsEnabled"));
    v8[0] = v3;
    v7[1] = @"MetrickitClientsAvailable";
    double v4 = objc_msgSend(NSNumber, "numberWithBool:", +[PLAggregateDictionaryService metrickitClientsAvailable](PLAggregateDictionaryService, "metrickitClientsAvailable"));
    v7[2] = @"today";
    v8[1] = v4;
    void v8[2] = MEMORY[0x1E4F1CC38];
    unint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

    [*(id *)(a1 + 32) createMetricsFile:v5];
  }
  else
  {
    unint64_t v5 = PLLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEFAULT, "metrics file notification ignored", v6, 2u);
    }
  }
}

void __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_614(uint64_t a1)
{
  void v8[2] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A88] isAppAnalyticsEnabled] & 1) == 0)
  {
    uint64_t v2 = PLLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEFAULT, "metrics creation forced", v6, 2u);
    }
  }
  v7[0] = @"AppAnalyticsEnabled";
  v7[1] = @"MetrickitClientsAvailable";
  v8[0] = MEMORY[0x1E4F1CC38];
  id v3 = objc_msgSend(NSNumber, "numberWithBool:", +[PLAggregateDictionaryService metrickitClientsAvailable](PLAggregateDictionaryService, "metrickitClientsAvailable"));
  v8[1] = v3;
  double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  unint64_t v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEFAULT, "creating metrics file", v6, 2u);
  }

  [*(id *)(a1 + 32) createMetricsFile:v4];
}

void __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_618(uint64_t a1)
{
  void v9[3] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A88] isAppAnalyticsEnabled] & 1) == 0)
  {
    uint64_t v2 = PLLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEFAULT, "metrics creation forced", v7, 2u);
    }
  }
  id v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEFAULT, "creating metrics file for today", v7, 2u);
  }

  uint64_t v4 = MEMORY[0x1E4F1CC38];
  v9[0] = MEMORY[0x1E4F1CC38];
  v8[0] = @"AppAnalyticsEnabled";
  v8[1] = @"MetrickitClientsAvailable";
  unint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", +[PLAggregateDictionaryService metrickitClientsAvailable](PLAggregateDictionaryService, "metrickitClientsAvailable"));
  void v8[2] = @"today";
  v9[1] = v5;
  v9[2] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  [*(id *)(a1 + 32) createMetricsFile:v6];
}

void __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_622(uint64_t a1)
{
  void v8[3] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A88] isAppAnalyticsEnabled] & 1) != 0
    || +[PLAggregateDictionaryService metrickitClientsAvailable])
  {
    uint64_t v2 = PLLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEFAULT, "creating metrics file for last 24hrs", v6, 2u);
    }

    v7[0] = @"AppAnalyticsEnabled";
    id v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x1E4F92A88], "isAppAnalyticsEnabled"));
    v8[0] = v3;
    v7[1] = @"MetrickitClientsAvailable";
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", +[PLAggregateDictionaryService metrickitClientsAvailable](PLAggregateDictionaryService, "metrickitClientsAvailable"));
    void v7[2] = @"last24hrs";
    v8[1] = v4;
    void v8[2] = MEMORY[0x1E4F1CC38];
    unint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

    [*(id *)(a1 + 32) createMetricsFile:v5];
  }
  else
  {
    unint64_t v5 = PLLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEFAULT, "metrics file notification ignored", v6, 2u);
    }
  }
}

void __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_629(uint64_t a1)
{
  void v9[3] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A88] isAppAnalyticsEnabled] & 1) == 0)
  {
    uint64_t v2 = PLLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEFAULT, "metrics creation forced", v7, 2u);
    }
  }
  id v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEFAULT, "creating metrics file for last 24hrs", v7, 2u);
  }

  uint64_t v4 = MEMORY[0x1E4F1CC38];
  v9[0] = MEMORY[0x1E4F1CC38];
  v8[0] = @"AppAnalyticsEnabled";
  v8[1] = @"MetrickitClientsAvailable";
  unint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", +[PLAggregateDictionaryService metrickitClientsAvailable](PLAggregateDictionaryService, "metrickitClientsAvailable"));
  void v8[2] = @"last24hrs";
  v9[1] = v5;
  v9[2] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  [*(id *)(a1 + 32) createMetricsFile:v6];
}

void __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_633(uint64_t a1)
{
  void v8[3] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A88] isAppAnalyticsEnabled] & 1) != 0
    || +[PLAggregateDictionaryService metrickitClientsAvailable])
  {
    uint64_t v2 = PLLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEFAULT, "creating metrics file for last 1hrs", v6, 2u);
    }

    v7[0] = @"AppAnalyticsEnabled";
    id v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x1E4F92A88], "isAppAnalyticsEnabled"));
    v8[0] = v3;
    v7[1] = @"MetrickitClientsAvailable";
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", +[PLAggregateDictionaryService metrickitClientsAvailable](PLAggregateDictionaryService, "metrickitClientsAvailable"));
    void v7[2] = @"last1hr";
    v8[1] = v4;
    void v8[2] = MEMORY[0x1E4F1CC38];
    unint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

    [*(id *)(a1 + 32) createMetricsFile:v5];
  }
  else
  {
    unint64_t v5 = PLLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEFAULT, "metrics file notification ignored", v6, 2u);
    }
  }
}

void __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_640(uint64_t a1)
{
  void v9[3] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A88] isAppAnalyticsEnabled] & 1) == 0)
  {
    uint64_t v2 = PLLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEFAULT, "metrics creation forced", v7, 2u);
    }
  }
  id v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEFAULT, "creating metrics file for last 1hrs", v7, 2u);
  }

  uint64_t v4 = MEMORY[0x1E4F1CC38];
  v9[0] = MEMORY[0x1E4F1CC38];
  v8[0] = @"AppAnalyticsEnabled";
  v8[1] = @"MetrickitClientsAvailable";
  unint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", +[PLAggregateDictionaryService metrickitClientsAvailable](PLAggregateDictionaryService, "metrickitClientsAvailable"));
  void v8[2] = @"last1hr";
  v9[1] = v5;
  v9[2] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  [*(id *)(a1 + 32) createMetricsFile:v6];
}

id __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_658()
{
  void v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"AppAnalyticsEnabled";
  v0 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x1E4F92A88], "isAppAnalyticsEnabled"));
  v4[1] = @"MetrickitClientsAvailable";
  v5[0] = v0;
  v1 = objc_msgSend(NSNumber, "numberWithBool:", +[PLAggregateDictionaryService metrickitClientsAvailable](PLAggregateDictionaryService, "metrickitClientsAvailable"));
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

- (void)createMetricsFile:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (([MEMORY[0x1E4F92A38] nonUIBuild] & 1) == 0)
  {
    if ([MEMORY[0x1E4F92A38] internalBuild]
      && [MEMORY[0x1E4F929C0] BOOLForKey:@"SignpostReaderDisable" ifNotSet:0])
    {
      uint64_t v4 = PLLogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEFAULT, "signpost collection disabled", buf, 2u);
      }
    }
    else
    {
      if (!v3)
      {
        v17[0] = @"AppAnalyticsEnabled";
        unint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x1E4F92A88], "isAppAnalyticsEnabled"));
        v18[0] = v5;
        v17[1] = @"MetrickitClientsAvailable";
        id v6 = objc_msgSend(NSNumber, "numberWithBool:", +[PLAggregateDictionaryService metrickitClientsAvailable](PLAggregateDictionaryService, "metrickitClientsAvailable"));
        v18[1] = v6;
        id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
      }
      uint64_t v4 = PLQueryRegistered();
      id v7 = PLLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v16[0] = v4;
        _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Response to metrics file: %@", buf, 0xCu);
      }

      uint64_t v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v11 = [MEMORY[0x1E4F92A88] isAppAnalyticsEnabled];
        BOOL v12 = +[PLAggregateDictionaryService metrickitClientsAvailable];
        *(_DWORD *)buf = 67109376;
        LODWORD(v16[0]) = v11;
        WORD2(v16[0]) = 1024;
        *(_DWORD *)((char *)v16 + 6) = v12;
        _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "AppAnalyticsEnabled : %d, MetrickitClientsAvailable : %d", buf, 0xEu);
      }

      id v9 = [v4 objectForKey:@"launchesTimeSeries"];

      if (v9)
      {
        uint64_t v10 = [MEMORY[0x1E4F92A88] workQueueForClass:objc_opt_class()];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __50__PLAggregateDictionaryService_createMetricsFile___block_invoke;
        block[3] = &unk_1E692A250;
        uint64_t v4 = v4;
        uint64_t v14 = v4;
        dispatch_async(v10, block);
      }
    }
  }
}

void __50__PLAggregateDictionaryService_createMetricsFile___block_invoke(uint64_t a1)
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [MEMORY[0x1E4F92AD0] sharedCore];
  uint64_t v4 = [v3 agents];
  unint64_t v5 = [v4 operators];
  id v6 = [v5 objectForKey:v8];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"launchesTimeSeries"];
    [v6 logEventBackwardAppLaunchTimeSeries:v7];
  }
}

+ (BOOL)metrickitClientsAvailable
{
  if (qword_1EBD5B110 != -1) {
    dispatch_once(&qword_1EBD5B110, &__block_literal_global_674);
  }
  return byte_1EBD5B0AC;
}

void __57__PLAggregateDictionaryService_metrickitClientsAvailable__block_invoke()
{
  id v0 = [MEMORY[0x1E4F929C0] objectForKey:@"MXClientsAvailable" forApplicationID:@"com.apple.metrickitd" synchronize:1];
  byte_1EBD5B0AC = [v0 BOOLValue];
}

- (NSMutableArray)registeredNotifications
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRegisteredNotifications:(id)a3
{
}

- (PLMonotonicTimer)dailyTaskTimer
{
  return (PLMonotonicTimer *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDailyTaskTimer:(id)a3
{
}

- (PLCFNotificationOperatorComposition)blmAggregateCFNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBlmAggregateCFNotification:(id)a3
{
}

- (BOOL)firstScreenOnAfterWake
{
  return self->_firstScreenOnAfterWake;
}

- (void)setFirstScreenOnAfterWake:(BOOL)a3
{
  self->_firstScreenOnAfterWake = a3;
}

- (NSNumber)currentMachWakeTime
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCurrentMachWakeTime:(id)a3
{
}

- (NSString)wakeReasons
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setWakeReasons:(id)a3
{
}

- (NSString)wakeReasonString
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setWakeReasonString:(id)a3
{
}

- (NSMutableDictionary)validReasonsDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setValidReasonsDictionary:(id)a3
{
}

- (void)setLocalCache:(id)a3
{
}

- (PLCFNotificationOperatorComposition)aggregateMetricsListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAggregateMetricsListener:(id)a3
{
}

- (PLCFNotificationOperatorComposition)aggregateMetricsForceListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setAggregateMetricsForceListener:(id)a3
{
}

- (PLCFNotificationOperatorComposition)aggregateMetricsTodayListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAggregateMetricsTodayListener:(id)a3
{
}

- (PLCFNotificationOperatorComposition)aggregateMetricsTodayForceListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void)setAggregateMetricsTodayForceListener:(id)a3
{
}

- (PLCFNotificationOperatorComposition)aggregateMetrics24hrsListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 168, 1);
}

- (void)setAggregateMetrics24hrsListener:(id)a3
{
}

- (PLCFNotificationOperatorComposition)aggregateMetrics24hrsForceListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAggregateMetrics24hrsForceListener:(id)a3
{
}

- (PLCFNotificationOperatorComposition)aggregateMetrics1hrListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 184, 1);
}

- (void)setAggregateMetrics1hrListener:(id)a3
{
}

- (PLCFNotificationOperatorComposition)aggregateMetrics1hrForceListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 192, 1);
}

- (void)setAggregateMetrics1hrForceListener:(id)a3
{
}

- (PLXPCResponderOperatorComposition)metricSummarizationStateResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 200, 1);
}

- (void)setMetricSummarizationStateResponder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricSummarizationStateResponder, 0);
  objc_storeStrong((id *)&self->_aggregateMetrics1hrForceListener, 0);
  objc_storeStrong((id *)&self->_aggregateMetrics1hrListener, 0);
  objc_storeStrong((id *)&self->_aggregateMetrics24hrsForceListener, 0);
  objc_storeStrong((id *)&self->_aggregateMetrics24hrsListener, 0);
  objc_storeStrong((id *)&self->_aggregateMetricsTodayForceListener, 0);
  objc_storeStrong((id *)&self->_aggregateMetricsTodayListener, 0);
  objc_storeStrong((id *)&self->_aggregateMetricsForceListener, 0);
  objc_storeStrong((id *)&self->_aggregateMetricsListener, 0);
  objc_storeStrong((id *)&self->_localCache, 0);
  objc_storeStrong((id *)&self->_validReasonsDictionary, 0);
  objc_storeStrong((id *)&self->_wakeReasonString, 0);
  objc_storeStrong((id *)&self->_wakeReasons, 0);
  objc_storeStrong((id *)&self->_currentMachWakeTime, 0);
  objc_storeStrong((id *)&self->_blmAggregateCFNotification, 0);
  objc_storeStrong((id *)&self->_dailyTaskTimer, 0);
  objc_storeStrong((id *)&self->_registeredNotifications, 0);
}

@end