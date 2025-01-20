@interface PLBBAgent
+ (id)defaults;
+ (id)entryAggregateDefinitions;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventForwardSDM;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneBBReport;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitions;
+ (id)entryIceMsgLite;
+ (id)getBBAgent;
+ (id)getNameBBReport;
+ (id)humanReadableStateFromKey:(id)a3;
+ (id)indexToRat:(unint64_t)a3;
+ (void)load;
- (BOOL)agentInited;
- (BOOL)changed;
- (BOOL)isBBDataStandard;
- (BOOL)isBBOOS;
- (BOOL)isChangedAndSetAirplaneMode;
- (BOOL)isEarfcnHighBand:(int)a3;
- (BOOL)isFirstTimeAccountingOOS;
- (BOOL)isTimeToRequestReport;
- (BOOL)lteCurrentState;
- (BOOL)setupChannel:(id)a3 withLogCodes:(id)a4 andEvents:(id)a5 andExtracode:(id)a6;
- (CoreTelephonyClient)telephonyClient;
- (NSDate)lastBBActivityTimestamp;
- (NSDate)lastModeledOOSTimestamp;
- (NSDate)lastOOSTimestamp;
- (NSDate)lastReportRequestDate;
- (NSMutableArray)dsdsActivityMsgs;
- (NSMutableArray)dsdsRegMsgs;
- (NSMutableDictionary)currentCallList;
- (NSNumber)inDCH;
- (NSNumber)inUTBF;
- (NSNumber)lastReportedSignal;
- (NSString)operatorName;
- (NSString)simStatus;
- (OS_dispatch_queue)telephonyClientQueue;
- (PLABMClient)abmClient;
- (PLBBAgent)init;
- (PLBBTelephonyActivityMsg)telActMsgHelper;
- (PLBBTelephonyRegMsg)telRegMsgHelper;
- (PLCFNotificationOperatorComposition)cfNotifyBBReport;
- (PLCFNotificationOperatorComposition)cfNotifyBBReport30s;
- (PLEntryNotificationOperatorComposition)batteryLevelChanged;
- (PLEntryNotificationOperatorComposition)canSleepNotification;
- (PLEntryNotificationOperatorComposition)didNotSleepNotification;
- (PLEntryNotificationOperatorComposition)sleepEntryNotifications;
- (PLEntryNotificationOperatorComposition)telephonyActivityNotification;
- (PLEntryNotificationOperatorComposition)wakeEntryNotifications;
- (PLNSNotificationOperatorComposition)bbICEModelLTEMetricsNotification;
- (PLNSNotificationOperatorComposition)thermalMonitorListener;
- (PLTelephonyConnection)connection;
- (PLTimer)cacheCommitTimer;
- (PLTimer)channelReconnectTimer;
- (PLXPCResponderOperatorComposition)BBLogsSysdiagnoseResponder;
- (TUCallCenter)callCenter;
- (double)lastBBProtoPower;
- (double)lastGWPower;
- (double)lastOOSPower;
- (double)oosCDMAPower;
- (double)oosGWPower;
- (double)oosHDRPower;
- (double)totalOosCDMAScanEnergy;
- (double)totalOosGWScanEnergy;
- (double)totalOosHDRScanEnergy;
- (double)translateChannelRBsToChannelBW:(double)a3;
- (float)translateTransBW:(int)a3;
- (id)humanReadableDataActiveString;
- (id)humanReadableDataIndicator:(id)a3;
- (id)humanReadableRegistrationStatus:(id)a3;
- (id)humanReadableSimStatusString;
- (id)setupIOKitNotifications;
- (id)translateCallStatus:(int)a3;
- (int64_t)getSubsIdFromCTContext:(id)a3;
- (void)accountVoicePower:(id)a3 state:(id)a4;
- (void)bootStateChange:(id)a3;
- (void)cacheCommitTimerFired;
- (void)callStatusChanged:(id)a3;
- (void)cancelCacheCommitTimer;
- (void)cellChanged:(id)a3 cell:(id)a4;
- (void)channel:(id)a3 hasDataAvailable:(id)a4;
- (void)channelDidBecomeInvalid:(id)a3;
- (void)checkKICEChannelTimeout;
- (void)commitBBCacheWithClientInfo:(int64_t)a3;
- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5;
- (void)createOOSAccountingEvent:(id)a3;
- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4;
- (void)dealloc;
- (void)displayStatusChanged:(id)a3 status:(id)a4;
- (void)eventToCommitCacheOccurred;
- (void)eventToFlushCacheOccurred;
- (void)flushBBCacheWithClientInfo:(int64_t)a3;
- (void)handlePLBasebandEventNotification:(id)a3;
- (void)handlePostCDRXCapability;
- (void)initCacheCommitTimer;
- (void)initOperatorDependancies;
- (void)loadOOSModelValues;
- (void)log;
- (void)logBasebandConfig;
- (void)logDSDSEventForwardSDMwithSubsId:(int64_t)a3 SDMEnable:(BOOL)a4;
- (void)logDSDSEventForwardTelephonyRegistrationWithKVPairs:(id)a3 subsId:(int64_t)a4 andOperator:(id)a5;
- (void)logDSDSEventPointTelephonyActivityWithSubsId:(int64_t)a3 context:(id)a4 callStatus:(id)a5 simStatus:(id)a6 signalInfo:(id)a7 RATselection:(id)a8 andCurrCampedRAT:(id)a9;
- (void)logEntries:(id)a3 withGroupID:(id)a4;
- (void)logEntry:(id)a3;
- (void)logEventNoneBBReportBy:(int64_t)a3 withAction:(int64_t)a4;
- (void)logMessage:(id)a3 andState:(id)a4;
- (void)logOperatorName;
- (void)logTelephonyActivity;
- (void)logTelephonyActivityAtInit;
- (void)logTelephonyActivityDSDSAtInit;
- (void)logTelephonyRegMsgWith:(id)a3;
- (void)logTelephonyRegistrationAtInit;
- (void)logTelephonyRegistrationDSDSAtInit;
- (void)metricMessage:(id)a3;
- (void)metricMessageDebugLog:(id)a3;
- (void)modelGPSPower:(id)a3;
- (void)modelLTESLEEPMGRPower:(id)a3;
- (void)modelMav10BBHWPower:(id)a3;
- (void)modelMavBBHWOtherPerRATPower:(id)a3;
- (void)modelOOSPower:(id)a3;
- (void)modelScanPower:(id)a3;
- (void)modelStateTransitionPower:(id)a3 rat:(id)a4 state:(id)a5;
- (void)operatorNameChanged:(id)a3 name:(id)a4;
- (void)postCDRXCapability:(BOOL)a3;
- (void)processTimeUpdateInfoDict:(id)a3;
- (void)ratSelectionChanged:(id)a3 selection:(id)a4;
- (void)reconnectTimerFired;
- (void)refreshBBReport;
- (void)refreshRequestHandler;
- (void)registerForAirplaneModeChange;
- (void)registerForICEModelMetricsNotifications:(id)a3;
- (void)registerForMAVModelMetricsNotifications:(id)a3;
- (void)resetCacheCommitTimer;
- (void)scheduleFlushPostCacheCommit;
- (void)scheduleReconnect;
- (void)setAbmClient:(id)a3;
- (void)setAgentInited:(BOOL)a3;
- (void)setBBLogsSysdiagnoseResponder:(id)a3;
- (void)setBatteryLevelChanged:(id)a3;
- (void)setBbICEModelLTEMetricsNotification:(id)a3;
- (void)setCacheCommitTimer:(id)a3;
- (void)setCallCenter:(id)a3;
- (void)setCanSleepNotification:(id)a3;
- (void)setCfNotifyBBReport30s:(id)a3;
- (void)setCfNotifyBBReport:(id)a3;
- (void)setChanged:(BOOL)a3;
- (void)setChannelReconnectTimer:(id)a3;
- (void)setCurrentCallList:(id)a3;
- (void)setDidNotSleepNotification:(id)a3;
- (void)setDsdsActivityMsgs:(id)a3;
- (void)setDsdsRegMsgs:(id)a3;
- (void)setInDCH:(id)a3;
- (void)setInUTBF:(id)a3;
- (void)setIsBBDataStandard:(BOOL)a3;
- (void)setIsBBOOS:(BOOL)a3;
- (void)setIsFirstTimeAccountingOOS:(BOOL)a3;
- (void)setLastBBActivityTimestamp:(id)a3;
- (void)setLastBBProtoPower:(double)a3;
- (void)setLastGWPower:(double)a3;
- (void)setLastModeledOOSTimestamp:(id)a3;
- (void)setLastOOSPower:(double)a3;
- (void)setLastOOSTimestamp:(id)a3;
- (void)setLastReportRequestDate:(id)a3;
- (void)setLastReportedSignal:(id)a3;
- (void)setLteCurrentState:(BOOL)a3;
- (void)setOosCDMAPower:(double)a3;
- (void)setOosGWPower:(double)a3;
- (void)setOosHDRPower:(double)a3;
- (void)setOpName:(id)a3;
- (void)setOperatorName:(id)a3;
- (void)setSimStatus:(id)a3;
- (void)setTelActMsgHelper:(id)a3;
- (void)setTelRegMsgHelper:(id)a3;
- (void)setTelephonyActivityNotification:(id)a3;
- (void)setTelephonyClient:(id)a3;
- (void)setTelephonyClientQueue:(id)a3;
- (void)setThermalMonitorListener:(id)a3;
- (void)setTotalOosCDMAScanEnergy:(double)a3;
- (void)setTotalOosGWScanEnergy:(double)a3;
- (void)setTotalOosHDRScanEnergy:(double)a3;
- (void)setupBBChannelsWithAction:(int64_t)a3;
- (void)setupKICEChannels;
- (void)setupKICEChannelsForDebug;
- (void)setupMavABMChannel;
- (void)setupTelephonyActivityChannels;
- (void)setupTelephonyRegistrationChannels;
- (void)setupTimeUpdateChannel;
- (void)signalStrengthChanged:(id)a3 info:(id)a4;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
- (void)smartDataModeChanged:(id)a3 userEnabled:(BOOL)a4;
- (void)telephonyActivityNotificationCB_Agent:(id)a3 withName:(__CFString *)a4;
- (void)triggerMessage:(id)a3;
- (void)wakeMessage:(id)a3;
@end

@implementation PLBBAgent

- (void)metricMessage:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __27__PLBBAgent_metricMessage___block_invoke;
    v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v48[4] = v5;
    if (qword_1EBD58FA0 != -1) {
      dispatch_once(&qword_1EBD58FA0, v48);
    }
    if (byte_1EBD58CF6)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBAgent metricMessage:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBAgent metricMessage:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:692];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v12 = objc_opt_class();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__PLBBAgent_metricMessage___block_invoke_1060;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = v12;
  if (qword_1EBD58FA8 != -1) {
    dispatch_once(&qword_1EBD58FA8, block);
  }
  if (byte_1EBD58CF7) {
    [(PLBBAgent *)self metricMessageDebugLog:v4];
  }
  v13 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [(PLBBAgent *)self setLastBBActivityTimestamp:v13];

  if ([MEMORY[0x1E4F92A38] isBasebandMav])
  {
    v14 = +[PLMAVBBMetric sharedInstance];
    if (!v14)
    {
      v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D2690000, v15, OS_LOG_TYPE_ERROR, "BBAgent Unable to access shared object", buf, 2u);
      }

      if ([MEMORY[0x1E4F929C0] debugEnabled]) {
        __assert_rtn("-[PLBBAgent metricMessage:]", "PLBBAgent.m", 706, "0");
      }
    }
    uint64_t v16 = *MEMORY[0x1E4F92AF0];
    v17 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F92AF0]];
    if ([v17 intValue] == 680000)
    {

      goto LABEL_28;
    }
    v28 = [v4 objectForKeyedSubscript:v16];
    int v29 = [v28 intValue];

    if (v29 == 703488)
    {
LABEL_28:
      if ([(PLOperator *)self isDebugEnabled])
      {
        v22 = [NSString stringWithFormat:@"periodic MAV metric handler: %@", v4];
        v30 = (void *)MEMORY[0x1E4F929B8];
        v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        v32 = [v31 lastPathComponent];
        v33 = [NSString stringWithUTF8String:"-[PLBBAgent metricMessage:]"];
        [v30 logMessage:v22 fromFile:v32 fromFunction:v33 fromLineNumber:711];

        v27 = PLLogCommon();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = 138412290;
        v50 = v22;
        goto LABEL_41;
      }
      goto LABEL_31;
    }
    if ([(PLOperator *)self isDebugEnabled])
    {
      v37 = [NSString stringWithFormat:@"aperiodic MAV metric handler: %@", v4];
      v43 = (void *)MEMORY[0x1E4F929B8];
      v44 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      v45 = [v44 lastPathComponent];
      v46 = [NSString stringWithUTF8String:"-[PLBBAgent metricMessage:]"];
      [v43 logMessage:v37 fromFile:v45 fromFunction:v46 fromLineNumber:718];

      v42 = PLLogCommon();
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_37;
      }
      *(_DWORD *)buf = 138412290;
      v50 = v37;
      goto LABEL_43;
    }
    goto LABEL_38;
  }
  v14 = +[PLICEBBMetric sharedInstance];
  if (!v14)
  {
    v18 = PLLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D2690000, v18, OS_LOG_TYPE_ERROR, "BBAgent Unable to access shared object", buf, 2u);
    }

    if ([MEMORY[0x1E4F929C0] debugEnabled]) {
      __assert_rtn("-[PLBBAgent metricMessage:]", "PLBBAgent.m", 753, "0");
    }
  }
  uint64_t v16 = *MEMORY[0x1E4F92AF0];
  v19 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F92AF0]];
  int v20 = [v19 intValue];

  BOOL v21 = [(PLOperator *)self isDebugEnabled];
  if (v20 != 1)
  {
    if (v21)
    {
      v37 = [NSString stringWithFormat:@"aperiodic ICE metric handler: %@", v4];
      v38 = (void *)MEMORY[0x1E4F929B8];
      v39 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      v40 = [v39 lastPathComponent];
      v41 = [NSString stringWithUTF8String:"-[PLBBAgent metricMessage:]"];
      [v38 logMessage:v37 fromFile:v40 fromFunction:v41 fromLineNumber:765];

      v42 = PLLogCommon();
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
LABEL_37:

        goto LABEL_38;
      }
      *(_DWORD *)buf = 138412290;
      v50 = v37;
LABEL_43:
      _os_log_debug_impl(&dword_1D2690000, v42, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      goto LABEL_37;
    }
LABEL_38:
    v34 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F92AE0]];
    v35 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F92AE8]];
    v36 = [v4 objectForKeyedSubscript:v16];
    [v14 queueAperiodicMetricId:v34 payload:v35 profileId:v36];
    goto LABEL_39;
  }
  if (v21)
  {
    v22 = [NSString stringWithFormat:@"periodic ICE metric handler: %@", v4];
    v23 = (void *)MEMORY[0x1E4F929B8];
    v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
    v25 = [v24 lastPathComponent];
    v26 = [NSString stringWithUTF8String:"-[PLBBAgent metricMessage:]"];
    [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:758];

    v27 = PLLogCommon();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
LABEL_30:

      goto LABEL_31;
    }
    *(_DWORD *)buf = 138412290;
    v50 = v22;
LABEL_41:
    _os_log_debug_impl(&dword_1D2690000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    goto LABEL_30;
  }
LABEL_31:
  v34 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F92AE0]];
  v35 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F92AE8]];
  v36 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F92AF8]];
  [v14 queuePeriodicMetricId:v34 payload:v35 forTrigger:v36];
LABEL_39:
}

- (void)setLastBBActivityTimestamp:(id)a3
{
}

uint64_t __53__PLBBAgent_registerForMAVModelMetricsNotifications___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) modelMavPower:a2];
}

- (void)logEntry:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)PLBBAgent;
  [(PLOperator *)&v49 logEntry:v4];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __22__PLBBAgent_logEntry___block_invoke;
    v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v48[4] = v5;
    if (qword_1EBD59168 != -1) {
      dispatch_once(&qword_1EBD59168, v48);
    }
    if (byte_1EBD58D2D)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBAgent logEntry:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBAgent logEntry:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:2935];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v51 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v12 = objc_opt_class();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__PLBBAgent_logEntry___block_invoke_1534;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = v12;
  if (qword_1EBD59170 != -1) {
    dispatch_once(&qword_1EBD59170, block);
  }
  if (byte_1EBD58D2E)
  {
    v13 = [NSString stringWithFormat:@"\n\n\n\n\nAgent has sent PL Entry"];
    v14 = (void *)MEMORY[0x1E4F929B8];
    v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
    uint64_t v16 = [v15 lastPathComponent];
    v17 = [NSString stringWithUTF8String:"-[PLBBAgent logEntry:]"];
    [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:2938];

    v18 = PLLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v51 = v13;
      _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    v19 = [NSString stringWithFormat:@"*** START of PLEntry ***"];
    int v20 = (void *)MEMORY[0x1E4F929B8];
    BOOL v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
    v22 = [v21 lastPathComponent];
    v23 = [NSString stringWithUTF8String:"-[PLBBAgent logEntry:]"];
    [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:2939];

    v24 = PLLogCommon();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v51 = v19;
      _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    v25 = NSString;
    v26 = [v4 entryKey];
    v27 = [v25 stringWithFormat:@"Name: %@\n", v26];

    v28 = (void *)MEMORY[0x1E4F929B8];
    int v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
    v30 = [v29 lastPathComponent];
    v31 = [NSString stringWithUTF8String:"-[PLBBAgent logEntry:]"];
    [v28 logMessage:v27 fromFile:v30 fromFunction:v31 fromLineNumber:2940];

    v32 = PLLogCommon();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v51 = v27;
      _os_log_debug_impl(&dword_1D2690000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    v33 = NSString;
    v34 = [v4 description];
    v35 = [v33 stringWithFormat:@"Description:%@\n", v34];

    v36 = (void *)MEMORY[0x1E4F929B8];
    v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
    v38 = [v37 lastPathComponent];
    v39 = [NSString stringWithUTF8String:"-[PLBBAgent logEntry:]"];
    [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:2941];

    v40 = PLLogCommon();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v51 = v35;
      _os_log_debug_impl(&dword_1D2690000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    v41 = [NSString stringWithFormat:@"*** END of PLEntry ***\n\n\n\n\n"];
    v42 = (void *)MEMORY[0x1E4F929B8];
    v43 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
    v44 = [v43 lastPathComponent];
    v45 = [NSString stringWithUTF8String:"-[PLBBAgent logEntry:]"];
    [v42 logMessage:v41 fromFile:v44 fromFunction:v45 fromLineNumber:2942];

    v46 = PLLogCommon();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v51 = v41;
      _os_log_debug_impl(&dword_1D2690000, v46, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
}

- (PLBBTelephonyRegMsg)telRegMsgHelper
{
  return (PLBBTelephonyRegMsg *)objc_getProperty(self, a2, 208, 1);
}

- (void)logTelephonyRegMsgWith:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F929C0];
  id v5 = a3;
  if ([v4 debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__PLBBAgent_logTelephonyRegMsgWith___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1EBD591C0 != -1) {
      dispatch_once(&qword_1EBD591C0, block);
    }
    if (byte_1EBD58D38)
    {
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBAgent logTelephonyRegMsgWith:]");
      v8 = (void *)MEMORY[0x1E4F929B8];
      v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      v10 = [v9 lastPathComponent];
      v11 = [NSString stringWithUTF8String:"-[PLBBAgent logTelephonyRegMsgWith:]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:3019];

      uint64_t v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v7;
        _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v13 = [(PLBBAgent *)self telRegMsgHelper];
  [v13 setTelRegInfo:v5];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v14 = objc_opt_class();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __36__PLBBAgent_logTelephonyRegMsgWith___block_invoke_1587;
    v21[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v21[4] = v14;
    if (qword_1EBD591C8 != -1) {
      dispatch_once(&qword_1EBD591C8, v21);
    }
    if (byte_1EBD58D39)
    {
      v15 = [NSString stringWithFormat:@"Decoded Telephony Registration msgs"];
      uint64_t v16 = (void *)MEMORY[0x1E4F929B8];
      v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      v18 = [v17 lastPathComponent];
      v19 = [NSString stringWithUTF8String:"-[PLBBAgent logTelephonyRegMsgWith:]"];
      [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:3025];

      int v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v15;
        _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [v13 logEventPointTelephonyRegistration];
}

- (int64_t)getSubsIdFromCTContext:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3) {
    goto LABEL_15;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __36__PLBBAgent_getSubsIdFromCTContext___block_invoke;
    v24 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v25 = v4;
    if (qword_1EBD590B8 != -1) {
      dispatch_once(&qword_1EBD590B8, &block);
    }
    if (byte_1EBD58D17)
    {
      id v5 = NSString;
      uint64_t v6 = [v3 slotID];
      v7 = [v3 userDataPreferred];
      v8 = [v3 userDefaultVoice];
      v9 = [v5 stringWithFormat:@"Slot ID %d, data preferred: %@, default voice: %@", v6, v7, v8, block, v22, v23, v24, v25];

      v10 = (void *)MEMORY[0x1E4F929B8];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      uint64_t v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLBBAgent getSubsIdFromCTContext:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:1890];

      uint64_t v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v9;
        _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if ([v3 slotID] == 1)
  {
    v15 = [v3 userDataPreferred];
    int v16 = [v15 BOOLValue];

    int64_t v17 = v16 ^ 1u;
    goto LABEL_16;
  }
  if ([v3 slotID] != 2)
  {
LABEL_15:
    int64_t v17 = -1;
    goto LABEL_16;
  }
  v18 = [v3 userDataPreferred];
  int v19 = [v18 BOOLValue];

  if (v19) {
    int64_t v17 = 2;
  }
  else {
    int64_t v17 = 3;
  }
LABEL_16:

  return v17;
}

- (NSMutableArray)dsdsActivityMsgs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 392, 1);
}

- (void)cellChanged:(id)a3 cell:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x1E4F92A38] isBasebandDSDS];
  if (v7 && v8)
  {
    int64_t v9 = [(PLBBAgent *)self getSubsIdFromCTContext:v6];
    uint64_t v10 = *MEMORY[0x1E4F24110];
    v11 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F24110]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = [v7 objectForKeyedSubscript:v10];

      if (v12)
      {
        v43 = v12;
        v13 = removeCTPrefixFromString(@"kCTRegistrationRadioAccessTechnology", v12);
        int64_t v42 = v9;
        if (v9 == -1)
        {
          char v19 = 0;
        }
        else
        {
          uint64_t v14 = [(PLBBAgent *)self dsdsActivityMsgs];
          uint64_t v15 = (int)v9;
          int v16 = [v14 objectAtIndexedSubscript:(int)v9];
          int64_t v17 = [v16 campedRAT];
          char v18 = [v13 isEqualToString:v17];

          if (v18)
          {
            char v19 = 1;
          }
          else
          {
            int v20 = [(PLBBAgent *)self dsdsActivityMsgs];
            BOOL v21 = [v20 objectAtIndexedSubscript:v15];
            [v21 setCampedRAT:v13];

            char v19 = 0;
          }
          int64_t v9 = v42;
        }
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v22 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __30__PLBBAgent_cellChanged_cell___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v22;
          if (qword_1EBD59058 != -1) {
            dispatch_once(&qword_1EBD59058, block);
          }
          if (byte_1EBD58D0B)
          {
            v40 = v13;
            v23 = objc_msgSend(NSString, "stringWithFormat:", @"cellChanged:cell: called with subsId: %d", v9);
            v24 = (void *)MEMORY[0x1E4F929B8];
            uint64_t v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
            v26 = [v25 lastPathComponent];
            v27 = [NSString stringWithUTF8String:"-[PLBBAgent cellChanged:cell:]"];
            [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:1637];

            uint64_t v28 = PLLogCommon();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v48 = v23;
              _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v13 = v40;
            int64_t v9 = v42;
          }
        }
        if ((v19 & 1) == 0) {
          [(PLBBAgent *)self logDSDSEventPointTelephonyActivityWithSubsId:v9 context:v6 callStatus:0 simStatus:0 signalInfo:0 RATselection:0 andCurrCampedRAT:v13];
        }
        if ([MEMORY[0x1E4F92A88] isFullModeDaemon])
        {
          uint64_t v29 = *MEMORY[0x1E4F23FC8];
          v30 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F23FC8]];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v31 = [v7 objectForKeyedSubscript:v29];
          }
          else
          {
            uint64_t v31 = 0;
          }

          uint64_t v32 = *MEMORY[0x1E4F24090];
          v33 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F24090]];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v34 = [v7 objectForKeyedSubscript:v32];
          }
          else
          {
            uint64_t v34 = 0;
          }

          if (v31 | v34)
          {
            v45[0] = @"cellId";
            v45[1] = @"lac";
            v46[0] = v31;
            v46[1] = v34;
            [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
            v35 = v41 = v13;
            v36 = [(PLBBAgent *)self dsdsRegMsgs];
            [v36 objectAtIndexedSubscript:(int)v9];
            v38 = int64_t v37 = v9;
            v39 = [v38 operatorName];

            [(PLBBAgent *)self logDSDSEventForwardTelephonyRegistrationWithKVPairs:v35 subsId:v37 andOperator:v39];
            v13 = v41;
          }
        }
      }
    }
    else
    {
    }
  }
}

+ (id)getBBAgent
{
  return (id)qword_1EBD58F28;
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLBBAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)eventToFlushCacheOccurred
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __38__PLBBAgent_eventToFlushCacheOccurred__block_invoke;
    v14[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v14[4] = v3;
    if (qword_1EBD58F30 != -1) {
      dispatch_once(&qword_1EBD58F30, v14);
    }
    if (_MergedGlobals_1_41)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBAgent eventToFlushCacheOccurred]");
      id v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      id v7 = [v6 lastPathComponent];
      int v8 = [NSString stringWithUTF8String:"-[PLBBAgent eventToFlushCacheOccurred]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:504];

      int64_t v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        int v16 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = [(PLOperator *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__PLBBAgent_eventToFlushCacheOccurred__block_invoke_971;
  block[3] = &unk_1E692A250;
  block[4] = self;
  dispatch_async(v10, block);

  v11 = [(PLOperator *)self workQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __38__PLBBAgent_eventToFlushCacheOccurred__block_invoke_2;
  v12[3] = &unk_1E692A250;
  v12[4] = self;
  dispatch_async(v11, v12);
}

uint64_t __38__PLBBAgent_eventToFlushCacheOccurred__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_41 = result;
  return result;
}

uint64_t __38__PLBBAgent_eventToFlushCacheOccurred__block_invoke_971(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) flush];
}

void __38__PLBBAgent_eventToFlushCacheOccurred__block_invoke_2(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  objc_super v2 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v3 = [*(id *)(a1 + 32) lastBBActivityTimestamp];
  [v2 timeIntervalSinceDate:v3];
  double v5 = fabs(v4);

  int v6 = [MEMORY[0x1E4F929C0] debugEnabled];
  if (v5 <= 7200.0)
  {
    if (v6)
    {
      uint64_t v21 = objc_opt_class();
      uint64_t v30 = MEMORY[0x1E4F143A8];
      uint64_t v31 = 3221225472;
      uint64_t v32 = __38__PLBBAgent_eventToFlushCacheOccurred__block_invoke_984;
      v33 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v34 = v21;
      if (qword_1EBD58F40 != -1) {
        dispatch_once(&qword_1EBD58F40, &v30);
      }
      if (byte_1EBD58CEA)
      {
        uint64_t v22 = NSString;
        v23 = [*(id *)(a1 + 32) lastBBActivityTimestamp];
        v24 = [v22 stringWithFormat:@"no reset needed! lastEventTimestamp=%@ timeIntevalSinceLastEvent=%f triggerTimeInterval=%f", v23, *(void *)&v5, 0x40BC200000000000, v30, v31, v32, v33, v34];

        uint64_t v25 = (void *)MEMORY[0x1E4F929B8];
        v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        v27 = [v26 lastPathComponent];
        uint64_t v28 = [NSString stringWithUTF8String:"-[PLBBAgent eventToFlushCacheOccurred]_block_invoke_2"];
        [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:518];

        uint64_t v29 = PLLogCommon();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v39 = v24;
          _os_log_debug_impl(&dword_1D2690000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    if (v6)
    {
      uint64_t v7 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __38__PLBBAgent_eventToFlushCacheOccurred__block_invoke_3;
      block[3] = &unk_1E692A830;
      v36 = @"Critical";
      uint64_t v37 = v7;
      if (qword_1EBD58F38 != -1) {
        dispatch_once(&qword_1EBD58F38, block);
      }
      int v8 = byte_1EBD58CE9;

      if (v8)
      {
        int64_t v9 = NSString;
        uint64_t v10 = (void *)MEMORY[0x1E4F92A98];
        v11 = [*(id *)(a1 + 32) lastBBActivityTimestamp];
        uint64_t v12 = [v10 formattedStringForDate:v11];
        v13 = [v9 stringWithFormat:@"Trigger reset of channel! lastEventTimestamp=%@ timeIntevalSinceLastEvent=%f triggerTimeInterval=%f", v12, *(void *)&v5, 0x40BC200000000000];

        uint64_t v14 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        int v16 = [v15 lastPathComponent];
        uint64_t v17 = [NSString stringWithUTF8String:"-[PLBBAgent eventToFlushCacheOccurred]_block_invoke_2"];
        [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:514];

        char v18 = PLLogCommon();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v39 = v13;
          _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    char v19 = *(void **)(a1 + 32);
    int v20 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [v19 setLastBBActivityTimestamp:v20];

    [*(id *)(a1 + 32) scheduleReconnect];
  }
}

uint64_t __38__PLBBAgent_eventToFlushCacheOccurred__block_invoke_3(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  byte_1EBD58CE9 = result;
  return result;
}

uint64_t __38__PLBBAgent_eventToFlushCacheOccurred__block_invoke_984(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58CEA = result;
  return result;
}

- (void)checkKICEChannelTimeout
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __36__PLBBAgent_checkKICEChannelTimeout__block_invoke;
    v12[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v12[4] = v3;
    if (qword_1EBD58F48 != -1) {
      dispatch_once(&qword_1EBD58F48, v12);
    }
    if (byte_1EBD58CEB)
    {
      double v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBAgent checkKICEChannelTimeout]");
      double v5 = (void *)MEMORY[0x1E4F929B8];
      int v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      uint64_t v7 = [v6 lastPathComponent];
      int v8 = [NSString stringWithUTF8String:"-[PLBBAgent checkKICEChannelTimeout]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:526];

      int64_t v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = [(PLOperator *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_988;
  block[3] = &unk_1E692A250;
  void block[4] = self;
  dispatch_async(v10, block);
}

uint64_t __36__PLBBAgent_checkKICEChannelTimeout__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58CEB = result;
  return result;
}

void __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_988(uint64_t a1)
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  objc_super v2 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v3 = [*(id *)(a1 + 32) lastBBActivityTimestamp];
  [v2 timeIntervalSinceDate:v3];
  double v5 = fabs(v4);

  int v6 = [MEMORY[0x1E4F929C0] debugEnabled];
  if (v5 <= 7200.0)
  {
    if (v6)
    {
      uint64_t v33 = objc_opt_class();
      uint64_t v73 = MEMORY[0x1E4F143A8];
      uint64_t v74 = 3221225472;
      v75 = __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_1038;
      v76 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v77 = v33;
      if (qword_1EBD58F78 != -1) {
        dispatch_once(&qword_1EBD58F78, &v73);
      }
      if (byte_1EBD58CF1)
      {
        uint64_t v34 = NSString;
        v35 = [*(id *)(a1 + 32) lastBBActivityTimestamp];
        [v34 stringWithFormat:@"no reset needed! lastEventTimestamp=%@ timeIntevalSinceLastEvent=%f triggerTimeInterval=%f", v35, *(void *)&v5, 0x40BC200000000000, v73, v74, v75, v76, v77];
        id v19 = (id)objc_claimAutoreleasedReturnValue();

        v36 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        v38 = [v37 lastPathComponent];
        v39 = [NSString stringWithUTF8String:"-[PLBBAgent checkKICEChannelTimeout]_block_invoke_2"];
        [v36 logMessage:v19 fromFile:v38 fromFunction:v39 fromLineNumber:565];

        uint64_t v32 = PLLogCommon();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v86 = v19;
          _os_log_debug_impl(&dword_1D2690000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        goto LABEL_54;
      }
    }
  }
  else
  {
    if (v6)
    {
      uint64_t v7 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_2;
      block[3] = &unk_1E692A830;
      v83 = @"Critical";
      uint64_t v84 = v7;
      if (qword_1EBD58F50 != -1) {
        dispatch_once(&qword_1EBD58F50, block);
      }
      int v8 = byte_1EBD58CEC;

      if (v8)
      {
        int64_t v9 = NSString;
        uint64_t v10 = (void *)MEMORY[0x1E4F92A98];
        v11 = [*(id *)(a1 + 32) lastBBActivityTimestamp];
        uint64_t v12 = [v10 formattedStringForDate:v11];
        v13 = [v9 stringWithFormat:@"Trigger reset of channel! lastEventTimestamp=%@ timeIntevalSinceLastEvent=%f triggerTimeInterval=%f", v12, *(void *)&v5, 0x40BC200000000000];

        uint64_t v14 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        int v16 = [v15 lastPathComponent];
        uint64_t v17 = [NSString stringWithUTF8String:"-[PLBBAgent checkKICEChannelTimeout]_block_invoke"];
        [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:531];

        char v18 = PLLogCommon();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v86 = v13;
          _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    if (([MEMORY[0x1E4F92A38] isBasebandProto] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isBasebandMav] & 1) != 0
      || [MEMORY[0x1E4F92A38] isBasebandIce])
    {
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      int v20 = [*(id *)(a1 + 32) abmClient];

      int v21 = [MEMORY[0x1E4F929C0] debugEnabled];
      if (v20)
      {
        if (v21)
        {
          uint64_t v22 = objc_opt_class();
          v80[0] = MEMORY[0x1E4F143A8];
          v80[1] = 3221225472;
          v80[2] = __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_1006;
          v80[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v80[4] = v22;
          if (qword_1EBD58F60 != -1) {
            dispatch_once(&qword_1EBD58F60, v80);
          }
          if (byte_1EBD58CEE)
          {
            v23 = [NSString stringWithFormat:@"PLABMClient exists"];
            v24 = (void *)MEMORY[0x1E4F929B8];
            uint64_t v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
            v26 = [v25 lastPathComponent];
            v27 = [NSString stringWithUTF8String:"-[PLBBAgent checkKICEChannelTimeout]_block_invoke_2"];
            [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:542];

            uint64_t v28 = PLLogCommon();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v86 = v23;
              _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        uint64_t v29 = NSString;
        uint64_t v30 = [*(id *)(a1 + 32) abmClient];
        uint64_t v31 = [v30 getBasebandBootState];
        uint64_t v32 = [v29 stringWithFormat:@"%@", v31];
      }
      else
      {
        if (v21)
        {
          uint64_t v40 = objc_opt_class();
          v81[0] = MEMORY[0x1E4F143A8];
          v81[1] = 3221225472;
          v81[2] = __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_993;
          v81[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v81[4] = v40;
          if (qword_1EBD58F58 != -1) {
            dispatch_once(&qword_1EBD58F58, v81);
          }
          if (byte_1EBD58CED)
          {
            v41 = [NSString stringWithFormat:@"PLABMClient lost, init again"];
            int64_t v42 = (void *)MEMORY[0x1E4F929B8];
            v43 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
            v44 = [v43 lastPathComponent];
            v45 = [NSString stringWithUTF8String:"-[PLBBAgent checkKICEChannelTimeout]_block_invoke_2"];
            [v42 logMessage:v41 fromFile:v44 fromFunction:v45 fromLineNumber:538];

            v46 = PLLogCommon();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v86 = v41;
              _os_log_debug_impl(&dword_1D2690000, v46, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        uint64_t v32 = [NSString stringWithFormat:@"%@", @"ICEChannelReset"];
        [*(id *)(a1 + 32) setupKICEChannels];
      }
      v47 = [*(id *)(a1 + 32) abmClient];
      v48 = [v47 getBasebandTimeAndLatency];

      if (v48)
      {
        uint64_t v49 = [v48 time];
        [v48 latency];
        uint64_t v51 = [v49 dateByAddingTimeInterval:-v50];
        uint64_t v52 = [v51 convertFromBasebandToMonotonic];

        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v53 = objc_opt_class();
          v78[0] = MEMORY[0x1E4F143A8];
          v78[1] = 3221225472;
          v78[2] = __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_1018;
          v78[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v78[4] = v53;
          if (qword_1EBD58F70 != -1) {
            dispatch_once(&qword_1EBD58F70, v78);
          }
          if (byte_1EBD58CF0)
          {
            v54 = [NSString stringWithFormat:@"PLBBAgent iceChannelTimeout::currentTime=%@", v52];
            v55 = (void *)MEMORY[0x1E4F929B8];
            v56 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
            v57 = [v56 lastPathComponent];
            v58 = [NSString stringWithUTF8String:"-[PLBBAgent checkKICEChannelTimeout]_block_invoke_2"];
            [v55 logMessage:v54 fromFile:v57 fromFunction:v58 fromLineNumber:551];

            v59 = PLLogCommon();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v86 = v54;
              _os_log_debug_impl(&dword_1D2690000, v59, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        v60 = NSString;
        v61 = [*(id *)(a1 + 32) abmClient];
        v62 = [v61 getBasebandBootState];
        uint64_t v63 = [v60 stringWithFormat:@"%@", v62];

        v64 = [MEMORY[0x1E4F92A98] formattedStringForDate:v52];
        uint64_t v32 = v63;
      }
      else
      {
        if (![MEMORY[0x1E4F929C0] debugEnabled]) {
          goto LABEL_52;
        }
        uint64_t v65 = objc_opt_class();
        v79[0] = MEMORY[0x1E4F143A8];
        v79[1] = 3221225472;
        v79[2] = __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_1012;
        v79[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v79[4] = v65;
        if (qword_1EBD58F68 != -1) {
          dispatch_once(&qword_1EBD58F68, v79);
        }
        if (!byte_1EBD58CEF)
        {
LABEL_52:
          v64 = 0;
          goto LABEL_53;
        }
        uint64_t v52 = [NSString stringWithFormat:@"Failed to query baseband timestamp"];
        v66 = (void *)MEMORY[0x1E4F929B8];
        v67 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        v68 = [v67 lastPathComponent];
        v69 = [NSString stringWithUTF8String:"-[PLBBAgent checkKICEChannelTimeout]_block_invoke_2"];
        [v66 logMessage:v52 fromFile:v68 fromFunction:v69 fromLineNumber:548];

        v70 = PLLogCommon();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v86 = v52;
          _os_log_debug_impl(&dword_1D2690000, v70, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v64 = 0;
      }

LABEL_53:
      [v19 setObject:v32 forKeyedSubscript:@"BBState"];
      [v19 setObject:v64 forKeyedSubscript:@"BBTime"];
      v71 = objc_opt_new();
      [v71 setAgent:*(void *)(a1 + 32)];
      [v71 setMsgProcErr:0];
      v72 = [NSString stringWithFormat:@"%@ %@", @"ChannelTimeout:", v19];
      [v71 setPayload:v72];

      [v71 setMsgType:&unk_1F29E6670];
      [v71 logEventNoneBBMsgAll];

LABEL_54:
    }
  }
}

uint64_t __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  byte_1EBD58CEC = result;
  return result;
}

uint64_t __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_993(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58CED = result;
  return result;
}

uint64_t __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_1006(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58CEE = result;
  return result;
}

uint64_t __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_1012(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58CEF = result;
  return result;
}

uint64_t __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_1018(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58CF0 = result;
  return result;
}

uint64_t __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_1038(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58CF1 = result;
  return result;
}

- (void)eventToCommitCacheOccurred
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __39__PLBBAgent_eventToCommitCacheOccurred__block_invoke;
    v12[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v12[4] = v3;
    if (qword_1EBD58F80 != -1) {
      dispatch_once(&qword_1EBD58F80, v12);
    }
    if (byte_1EBD58CF2)
    {
      double v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBAgent eventToCommitCacheOccurred]");
      double v5 = (void *)MEMORY[0x1E4F929B8];
      int v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      uint64_t v7 = [v6 lastPathComponent];
      int v8 = [NSString stringWithUTF8String:"-[PLBBAgent eventToCommitCacheOccurred]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:572];

      int64_t v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = [(PLOperator *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PLBBAgent_eventToCommitCacheOccurred__block_invoke_1039;
  block[3] = &unk_1E692A250;
  void block[4] = self;
  dispatch_async(v10, block);
}

uint64_t __39__PLBBAgent_eventToCommitCacheOccurred__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58CF2 = result;
  return result;
}

uint64_t __39__PLBBAgent_eventToCommitCacheOccurred__block_invoke_1039(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) commitHardwareLogs];
}

- (void)reconnectTimerFired
{
  uint64_t v3 = [(PLBBAgent *)self channelReconnectTimer];

  if (v3)
  {
    double v4 = [(PLBBAgent *)self channelReconnectTimer];
    [v4 invalidate];
  }
  [(PLBBAgent *)self setChannelReconnectTimer:0];
  [(PLBBAgent *)self setupBBChannelsWithAction:2];
}

- (void)scheduleReconnect
{
  [(PLBasebandLogChannel *)self->streamingChannel close];
  [(PLBasebandLogChannel *)self->cachedChannel close];
  uint64_t v3 = [(PLBBAgent *)self channelReconnectTimer];
  char v4 = [v3 timerActive];

  if ((v4 & 1) == 0)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F92A80]);
    int v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:60.0];
    uint64_t v7 = [(PLOperator *)self workQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __30__PLBBAgent_scheduleReconnect__block_invoke;
    v9[3] = &unk_1E692A200;
    v9[4] = self;
    int v8 = (void *)[v5 initWithFireDate:v6 withInterval:0 withTolerance:0 repeats:v7 withUserInfo:v9 withQueue:0.0 withBlock:0.0];
    [(PLBBAgent *)self setChannelReconnectTimer:v8];
  }
}

uint64_t __30__PLBBAgent_scheduleReconnect__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reconnectTimerFired];
}

- (void)channelDidBecomeInvalid:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__PLBBAgent_channelDidBecomeInvalid___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v5;
    if (qword_1EBD58F88 != -1) {
      dispatch_once(&qword_1EBD58F88, block);
    }
    if (byte_1EBD58CF3)
    {
      int v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBAgent channelDidBecomeInvalid:]");
      uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      int v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      int64_t v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLBBAgent channelDidBecomeInvalid:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:602];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (([MEMORY[0x1E4F92A38] isBasebandProto] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isBasebandMav] & 1) != 0
    || [MEMORY[0x1E4F92A38] isBasebandIce])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v12 = objc_opt_class();
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __37__PLBBAgent_channelDidBecomeInvalid___block_invoke_1044;
      v19[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v19[4] = v12;
      if (qword_1EBD58F90 != -1) {
        dispatch_once(&qword_1EBD58F90, v19);
      }
      if (byte_1EBD58CF4)
      {
        v13 = [NSString stringWithFormat:@"channelDidBecomeInvalid not valid for Protobuf channel"];
        uint64_t v14 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        int v16 = [v15 lastPathComponent];
        uint64_t v17 = [NSString stringWithUTF8String:"-[PLBBAgent channelDidBecomeInvalid:]"];
        [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:604];

        char v18 = PLLogCommon();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v22 = v13;
          _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled]) {
      __assert_rtn("-[PLBBAgent channelDidBecomeInvalid:]", "PLBBAgent.m", 605, "0");
    }
  }
  else
  {
    [(PLBBAgent *)self scheduleReconnect];
  }
}

uint64_t __37__PLBBAgent_channelDidBecomeInvalid___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58CF3 = result;
  return result;
}

uint64_t __37__PLBBAgent_channelDidBecomeInvalid___block_invoke_1044(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58CF4 = result;
  return result;
}

- (void)channel:(id)a3 hasDataAvailable:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)MEMORY[0x1D942A350]();
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    int v20 = __38__PLBBAgent_channel_hasDataAvailable___block_invoke;
    int v21 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v22 = v9;
    if (qword_1EBD58F98 != -1) {
      dispatch_once(&qword_1EBD58F98, &block);
    }
    if (byte_1EBD58CF5)
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s \n CT channel has data available", "-[PLBBAgent channel:hasDataAvailable:]", block, v19, v20, v21, v22);
      v11 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      v13 = [v12 lastPathComponent];
      uint64_t v14 = [NSString stringWithUTF8String:"-[PLBBAgent channel:hasDataAvailable:]"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:614];

      uint64_t v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  int v16 = +[PLBasebandMessage messageWithData:v7];
  [v16 setAgent:self];
  [v16 logWithLogger:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v16 eventCode] == 2275) {
    [(PLBBAgent *)self postCDRXCapability:1];
  }

  uint64_t v17 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [(PLBBAgent *)self setLastBBActivityTimestamp:v17];
}

uint64_t __38__PLBBAgent_channel_hasDataAvailable___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58CF5 = result;
  return result;
}

- (void)metricMessageDebugLog:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F92A38] isBasebandMav]) {
    uint64_t v5 = @"BBMAVMsgMetricDump";
  }
  else {
    uint64_t v5 = @"BBICEMsgMetricDump";
  }
  id v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:v5];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6];
  if (v7)
  {
    uint64_t v8 = *MEMORY[0x1E4F92AE0];
    uint64_t v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F92AE0]];
    [v7 setObject:v9 forKeyedSubscript:v8];

    uint64_t v10 = *MEMORY[0x1E4F92AE8];
    v11 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F92AE8]];
    uint64_t v12 = +[PLICEBBMetricUtility convertToStringData:v11];
    [v7 setObject:v12 forKeyedSubscript:v10];

    uint64_t v13 = *MEMORY[0x1E4F92AF8];
    uint64_t v14 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F92AF8]];
    [v7 setObject:v14 forKeyedSubscript:v13];

    uint64_t v15 = *MEMORY[0x1E4F92AF0];
    int v16 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F92AF0]];
    [v7 setObject:v16 forKeyedSubscript:v15];

    uint64_t v17 = *MEMORY[0x1E4F92AD8];
    char v18 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F92AD8]];
    [v7 setObject:v18 forKeyedSubscript:v17];

    if (([MEMORY[0x1E4F92A38] isBasebandMav] & 1) != 0
      || [MEMORY[0x1E4F92A38] isBasebandIce])
    {
      [(PLBBAgent *)self logEntry:v7];
    }
  }
  else
  {
    uint64_t v19 = PLLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v20 = 0;
      _os_log_error_impl(&dword_1D2690000, v19, OS_LOG_TYPE_ERROR, "metricMessage Unable to allocate memory for PLEntry", v20, 2u);
    }
  }
}

uint64_t __27__PLBBAgent_metricMessage___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58CF6 = result;
  return result;
}

uint64_t __27__PLBBAgent_metricMessage___block_invoke_1060(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58CF7 = result;
  return result;
}

- (void)triggerMessage:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __28__PLBBAgent_triggerMessage___block_invoke;
    v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v35[4] = v5;
    if (qword_1EBD58FB0 != -1) {
      dispatch_once(&qword_1EBD58FB0, v35);
    }
    if (byte_1EBD58CF8)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBAgent triggerMessage:]");
      id v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      uint64_t v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLBBAgent triggerMessage:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:775];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v37 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v12 = objc_opt_class();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__PLBBAgent_triggerMessage___block_invoke_1077;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  void block[4] = v12;
  if (qword_1EBD58FB8 != -1) {
    dispatch_once(&qword_1EBD58FB8, block);
  }
  if (byte_1EBD58CF9)
  {
    if ([MEMORY[0x1E4F92A38] isBasebandMav]) {
      uint64_t v13 = @"BBMAVMsgTriggerDump";
    }
    else {
      uint64_t v13 = @"BBICEMsgTriggerDump";
    }
    uint64_t v14 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:v13];
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v14];
    if (v15)
    {
      uint64_t v16 = *MEMORY[0x1E4F92B00];
      uint64_t v17 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F92B00]];
      [v15 setObject:v17 forKeyedSubscript:v16];

      uint64_t v18 = *MEMORY[0x1E4F92B08];
      uint64_t v19 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F92B08]];
      [v15 setObject:v19 forKeyedSubscript:v18];

      uint64_t v20 = *MEMORY[0x1E4F92B18];
      int v21 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F92B18]];
      [v15 setObject:v21 forKeyedSubscript:v20];

      uint64_t v22 = *MEMORY[0x1E4F92B10];
      uint64_t v23 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F92B10]];
      [v15 setObject:v23 forKeyedSubscript:v22];

      uint64_t v24 = *MEMORY[0x1E4F92AD8];
      uint64_t v25 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F92AD8]];
      [v15 setObject:v25 forKeyedSubscript:v24];

      if (([MEMORY[0x1E4F92A38] isBasebandMav] & 1) != 0
        || [MEMORY[0x1E4F92A38] isBasebandIce])
      {
        [(PLBBAgent *)self logEntry:v15];
      }
    }
    else if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v26 = objc_opt_class();
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __28__PLBBAgent_triggerMessage___block_invoke_2;
      v33[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v33[4] = v26;
      if (qword_1EBD58FC0 != -1) {
        dispatch_once(&qword_1EBD58FC0, v33);
      }
      if (byte_1EBD58CFA)
      {
        v27 = [NSString stringWithFormat:@"PLBBICEMsg unable to allocate memory for PLEntry"];
        uint64_t v28 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        uint64_t v30 = [v29 lastPathComponent];
        uint64_t v31 = [NSString stringWithUTF8String:"-[PLBBAgent triggerMessage:]"];
        [v28 logMessage:v27 fromFile:v30 fromFunction:v31 fromLineNumber:796];

        uint64_t v32 = PLLogCommon();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v37 = v27;
          _os_log_debug_impl(&dword_1D2690000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
}

uint64_t __28__PLBBAgent_triggerMessage___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58CF8 = result;
  return result;
}

uint64_t __28__PLBBAgent_triggerMessage___block_invoke_1077(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58CF9 = result;
  return result;
}

uint64_t __28__PLBBAgent_triggerMessage___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58CFA = result;
  return result;
}

- (void)wakeMessage:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __25__PLBBAgent_wakeMessage___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v5;
    if (qword_1EBD58FC8 != -1) {
      dispatch_once(&qword_1EBD58FC8, block);
    }
    if (byte_1EBD58CFB)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBAgent wakeMessage:]");
      id v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      uint64_t v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLBBAgent wakeMessage:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:817];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if ([(PLOperator *)self isDebugEnabled])
  {
    uint64_t v12 = objc_opt_new();
    [v12 setAgent:self];
    [v12 setMsgProcErr:0];
    uint64_t v13 = [NSString stringWithFormat:@"%@ %@", @"SleepWakeDataABM:", v4];
    [v12 setPayload:v13];

    [v12 setMsgType:&unk_1F29E6688];
    [v12 logEventNoneBBMsgAll];
  }
  uint64_t v14 = objc_opt_new();
  [v14 setAgent:self];
  [v14 setMsgProcErr:0];
  [v14 setSwReason:@"baseband"];
  uint64_t v15 = [v4 objectForKeyedSubscript:@"kKeyBasebandWakeType"];
  [v14 setBbWakeType:v15];

  uint64_t v16 = [v4 objectForKeyedSubscript:@"kKeyBasebandWakeSubType"];
  [v14 setBbWakeSubType:v16];

  uint64_t v17 = [v4 objectForKeyedSubscript:@"kKeyBasebandWakeChannel"];

  if (v17)
  {
    uint64_t v18 = NSString;
    uint64_t v19 = [v4 objectForKeyedSubscript:@"kKeyBasebandWakeChannel"];
    uint64_t v20 = [v18 stringWithFormat:@"%@", v19];
    [v14 setBbWakeChannel:v20];
  }
  int v21 = [v4 objectForKeyedSubscript:@"kKeyBasebandWakeData"];

  if (v21)
  {
    uint64_t v22 = [v4 objectForKeyedSubscript:@"kKeyBasebandWakeData"];
    [v14 setBbWakeDataBin:v22];
  }
  uint64_t v23 = [v4 objectForKeyedSubscript:@"kKeyBasebandWakeDataParsed"];

  if (v23)
  {
    uint64_t v24 = [v4 objectForKeyedSubscript:@"kKeyBasebandWakeDataParsed"];
    [v14 setBbWakeDataParsed:v24];
  }
  [v14 logEventPointSleepWakeABM];
}

uint64_t __25__PLBBAgent_wakeMessage___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58CFB = result;
  return result;
}

- (void)bootStateChange:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __29__PLBBAgent_bootStateChange___block_invoke;
    v16[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v16[4] = v5;
    if (qword_1EBD58FD0 != -1) {
      dispatch_once(&qword_1EBD58FD0, v16);
    }
    if (byte_1EBD58CFC)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBAgent bootStateChange:]");
      id v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      uint64_t v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLBBAgent bootStateChange:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:849];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v12 = [(PLOperator *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__PLBBAgent_bootStateChange___block_invoke_1104;
  block[3] = &unk_1E692B128;
  void block[4] = self;
  id v15 = v4;
  id v13 = v4;
  dispatch_async(v12, block);
}

uint64_t __29__PLBBAgent_bootStateChange___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58CFC = result;
  return result;
}

void __29__PLBBAgent_bootStateChange___block_invoke_1104(uint64_t a1)
{
  id v5 = (id)objc_opt_new();
  [v5 setAgent:*(void *)(a1 + 32)];
  [v5 setMsgProcErr:0];
  objc_super v2 = [NSString stringWithFormat:@"%@ %@", @"BootStateChange:", *(void *)(a1 + 40)];
  [v5 setPayload:v2];

  [v5 setMsgType:&unk_1F29E6670];
  [v5 logEventNoneBBMsgAll];
  uint64_t v3 = [*(id *)(a1 + 40) objectForKey:@"KeyBasebandBootState"];
  int v4 = [v3 isEqualToString:@"BasebandBootStateIsReady"];

  if (v4)
  {
    if (([MEMORY[0x1E4F92A38] isBasebandProto] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isBasebandMav] & 1) != 0
      || [MEMORY[0x1E4F92A38] isBasebandIce])
    {
      [*(id *)(a1 + 32) setupKICEChannels];
    }
    else
    {
      [*(id *)(a1 + 32) setupMavABMChannel];
      [*(id *)(a1 + 32) setupBBChannelsWithAction:0];
    }
  }
}

+ (id)defaults
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (void)handlePLBasebandEventNotification:(id)a3
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__10;
  v7[4] = __Block_byref_object_dispose__10;
  id v4 = a3;
  id v8 = v4;
  id v5 = [(PLOperator *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__PLBBAgent_handlePLBasebandEventNotification___block_invoke;
  v6[3] = &unk_1E692EEF0;
  v6[4] = self;
  v6[5] = v7;
  dispatch_async(v5, v6);

  _Block_object_dispose(v7, 8);
}

void __47__PLBBAgent_handlePLBasebandEventNotification___block_invoke(uint64_t a1)
{
  objc_super v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    uint64_t v3 = [v2 userInfo];

    if (v3)
    {
      id v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) userInfo];
      id v5 = [v4 objectForKeyedSubscript:@"rat"];
      if ([v5 caseInsensitiveCompare:@"LTE"])
      {
      }
      else
      {
        id v6 = [v4 objectForKeyedSubscript:@"state"];
        uint64_t v7 = [v6 caseInsensitiveCompare:@"Connected"];

        if (!v7)
        {
          [(id)qword_1EBD58FD8 timeIntervalSinceNow];
          if (fabs(v8) > 30.0 && qword_1EBD58FE0 == 0)
          {
            objc_initWeak(&location, *(id *)(a1 + 32));
            id v10 = objc_alloc(MEMORY[0x1E4F92A80]);
            v11 = [MEMORY[0x1E4F1C9C8] monotonicDateWithTimeIntervalSinceNow:30.0];
            uint64_t v12 = [*(id *)(a1 + 32) workQueue];
            uint64_t v15 = MEMORY[0x1E4F143A8];
            uint64_t v16 = 3221225472;
            uint64_t v17 = __47__PLBBAgent_handlePLBasebandEventNotification___block_invoke_2;
            uint64_t v18 = &unk_1E692AC18;
            objc_copyWeak(&v19, &location);
            uint64_t v13 = [v10 initWithFireDate:v11 withInterval:0 withTolerance:0 repeats:v12 withUserInfo:&v15 withQueue:0.0 withBlock:0.0];
            uint64_t v14 = (void *)qword_1EBD58FE0;
            qword_1EBD58FE0 = v13;

            objc_msgSend((id)qword_1EBD58FE0, "arm", v15, v16, v17, v18);
            objc_destroyWeak(&v19);
            objc_destroyWeak(&location);
          }
        }
      }
    }
  }
}

void __47__PLBBAgent_handlePLBasebandEventNotification___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handlePostCDRXCapability];
}

- (void)handlePostCDRXCapability
{
  [(PLBBAgent *)self postCDRXCapability:0];
  objc_super v2 = (void *)qword_1EBD58FE0;
  qword_1EBD58FE0 = 0;
}

- (void)postCDRXCapability:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (qword_1EBD58FE0)
  {
    [(id)qword_1EBD58FE0 invalidate];
    id v4 = (void *)qword_1EBD58FE0;
    qword_1EBD58FE0 = 0;
  }
  if (v3)
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    id v6 = (void *)qword_1EBD58FD8;
    qword_1EBD58FD8 = v5;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__PLBBAgent_postCDRXCapability___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v7;
    if (qword_1EBD58FE8 != -1) {
      dispatch_once(&qword_1EBD58FE8, block);
    }
    if (byte_1EBD58CFD)
    {
      double v8 = NSString;
      uint64_t v9 = [MEMORY[0x1E4F92A98] formattedStringForDate:qword_1EBD58FD8];
      id v10 = NSStringFromBOOL();
      v11 = [v8 stringWithFormat:@"%@ %@", v9, v10];

      uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      uint64_t v14 = [v13 lastPathComponent];
      uint64_t v15 = [NSString stringWithUTF8String:"-[PLBBAgent postCDRXCapability:]"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:917];

      uint64_t v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        int out_token = 138412290;
        id v19 = v11;
        _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&out_token, 0xCu);
      }
    }
  }
  int out_token = 0;
  if (!notify_register_check("com.apple.powerlog.BasebandHasCDRXCapability", &out_token))
  {
    if (!notify_set_state(out_token, v3)) {
      notify_post("com.apple.powerlog.BasebandHasCDRXCapability");
    }
    notify_cancel(out_token);
  }
}

uint64_t __32__PLBBAgent_postCDRXCapability___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58CFD = result;
  return result;
}

+ (id)entryEventPointDefinitions
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isBasebandMav])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v2 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __39__PLBBAgent_entryEventPointDefinitions__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v2;
      if (qword_1EBD58FF0 != -1) {
        dispatch_once(&qword_1EBD58FF0, block);
      }
      if (byte_1EBD58CFE)
      {
        BOOL v3 = [NSString stringWithFormat:@"KMAV point defs"];
        id v4 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        id v6 = [v5 lastPathComponent];
        uint64_t v7 = [NSString stringWithUTF8String:"+[PLBBAgent entryEventPointDefinitions]"];
        [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:941];

        double v8 = PLLogCommon();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v37 = v3;
          _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v34[0] = @"SleepWakeActivityMavABM";
    uint64_t v9 = +[PLBBSleepWakeMsg entryEventPointDefinitionSleepWakeActivityMavABM];
    v34[1] = @"TelephonyActivity";
    v35[0] = v9;
    id v10 = +[PLBBTelephonyActivityMsg entryEventPointDefinitionTelephonyActivity];
    v35[1] = v10;
    v11 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v12 = v35;
    uint64_t v13 = v34;
LABEL_19:
    int v21 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:2];
    goto LABEL_21;
  }
  if ([MEMORY[0x1E4F92A38] isBasebandIce])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v14 = objc_opt_class();
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      uint64_t v26 = __39__PLBBAgent_entryEventPointDefinitions__block_invoke_1128;
      v27 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v28 = v14;
      if (qword_1EBD58FF8 != -1) {
        dispatch_once(&qword_1EBD58FF8, &v24);
      }
      if (byte_1EBD58CFF)
      {
        uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"KICE point defs", v24, v25, v26, v27, v28);
        uint64_t v16 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        uint64_t v18 = [v17 lastPathComponent];
        id v19 = [NSString stringWithUTF8String:"+[PLBBAgent entryEventPointDefinitions]"];
        [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:956];

        uint64_t v20 = PLLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v37 = v15;
          _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v32[0] = @"SleepWakeActivityIceABM";
    uint64_t v9 = +[PLBBSleepWakeMsg entryEventPointDefinitionSleepWakeActivityIceABM];
    v32[1] = @"TelephonyActivity";
    v33[0] = v9;
    id v10 = +[PLBBTelephonyActivityMsg entryEventPointDefinitionTelephonyActivity];
    v33[1] = v10;
    v11 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v12 = v33;
    uint64_t v13 = v32;
    goto LABEL_19;
  }
  v30[0] = @"CMCDMAExitCode";
  uint64_t v9 = +[PLBBEurekaEventMsg bbEuEvMsgNameCMCDMAExit];
  v31[0] = v9;
  v30[1] = @"SleepWakeActivityMavABM";
  id v10 = +[PLBBSleepWakeMsg entryEventPointDefinitionSleepWakeActivityMavABM];
  v31[1] = v10;
  v30[2] = @"TelephonyActivity";
  uint64_t v22 = +[PLBBTelephonyActivityMsg entryEventPointDefinitionTelephonyActivity];
  v31[2] = v22;
  int v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];

LABEL_21:
  return v21;
}

uint64_t __39__PLBBAgent_entryEventPointDefinitions__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58CFE = result;
  return result;
}

uint64_t __39__PLBBAgent_entryEventPointDefinitions__block_invoke_1128(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58CFF = result;
  return result;
}

+ (id)entryEventForwardDefinitions
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isBasebandMav] & 1) != 0
    || [MEMORY[0x1E4F92A38] isBasebandIce])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v3 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41__PLBBAgent_entryEventForwardDefinitions__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v3;
      if (qword_1EBD59000 != -1) {
        dispatch_once(&qword_1EBD59000, block);
      }
      if (byte_1EBD58D00)
      {
        id v4 = [NSString stringWithFormat:@"KICE forward defs"];
        uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
        id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        uint64_t v7 = [v6 lastPathComponent];
        double v8 = [NSString stringWithUTF8String:"+[PLBBAgent entryEventForwardDefinitions]"];
        [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:981];

        uint64_t v9 = PLLogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v30 = v4;
          _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v27[0] = @"TelephonyRegistration";
    id v10 = +[PLBBTelephonyRegMsg bbEuLogMsgNameTelephonyReg];
    v27[1] = @"SDM";
    v28[0] = v10;
    v11 = [a1 entryEventForwardSDM];
    v28[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  }
  else
  {
    if (([MEMORY[0x1E4F92A38] isBasebandClass:1003003] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isBasebandClass:1003002] & 1) != 0)
    {
      v23[0] = @"TelephonyRegistration";
      id v10 = +[PLBBTelephonyRegMsg bbEuLogMsgNameTelephonyReg];
      v24[0] = v10;
      v23[1] = @"SDEventActionCode";
      v11 = +[PLBBEurekaEventMsg bbEuEvMsgNameSDEventActionCode];
      v24[1] = v11;
      v23[2] = @"WCDMARRCState";
      uint64_t v13 = +[PLBBEurekaEventMsg bbEuEvMsgNameWCDMARRCState];
      v24[2] = v13;
      v23[3] = @"LTERRCState";
      uint64_t v14 = +[PLBBEurekaEventMsg bbEuEvMsgNameLTERRCState];
      v24[3] = v14;
      v23[4] = @"UTRANRRCState";
      uint64_t v15 = +[PLBBEurekaEventMsg bbEuEvMsgUTRANRRCState];
      v24[4] = v15;
      v23[5] = @"GSML1State";
      uint64_t v16 = +[PLBBEurekaEventMsg bbEuEvMsgNameGSML1State];
      v24[5] = v16;
      v23[6] = @"CMCallEventOrigCode";
      uint64_t v17 = +[PLBBEurekaEventMsg bbEuEvMsgNameCMCallEventOrigV2];
      v24[6] = v17;
      uint64_t v18 = (void *)MEMORY[0x1E4F1C9E8];
      id v19 = v24;
      uint64_t v20 = v23;
    }
    else
    {
      v25[0] = @"TelephonyRegistration";
      id v10 = +[PLBBTelephonyRegMsg bbEuLogMsgNameTelephonyReg];
      v26[0] = v10;
      v25[1] = @"SDEventActionCode";
      v11 = +[PLBBEurekaEventMsg bbEuEvMsgNameSDEventActionCode];
      v26[1] = v11;
      v25[2] = @"WCDMARRCState";
      uint64_t v13 = +[PLBBEurekaEventMsg bbEuEvMsgNameWCDMARRCState];
      v26[2] = v13;
      v25[3] = @"LTERRCState";
      uint64_t v14 = +[PLBBEurekaEventMsg bbEuEvMsgNameLTERRCState];
      v26[3] = v14;
      v25[4] = @"UTRANRRCState";
      uint64_t v15 = +[PLBBEurekaEventMsg bbEuEvMsgUTRANRRCState];
      v26[4] = v15;
      v25[5] = @"GSML1State";
      uint64_t v16 = +[PLBBEurekaEventMsg bbEuEvMsgNameGSML1State];
      v26[5] = v16;
      v25[6] = @"CMCallEventOrigCode";
      uint64_t v17 = +[PLBBEurekaEventMsg bbEuEvMsgNameCMCallEventOrig];
      v26[6] = v17;
      uint64_t v18 = (void *)MEMORY[0x1E4F1C9E8];
      id v19 = v26;
      uint64_t v20 = v25;
    }
    uint64_t v12 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:7];
  }
  return v12;
}

uint64_t __41__PLBBAgent_entryEventForwardDefinitions__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D00 = result;
  return result;
}

+ (id)entryEventBackwardDefinitions
{
  v64[11] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isBasebandClass:1003007])
  {
    v63[0] = @"LTESleepMgrStats";
    uint64_t v44 = +[PLBBEurekaLogMsg bbEuLogMsgNameLTESleepMgrStats];
    v64[0] = v44;
    v63[1] = @"MavBBHwOther";
    uint64_t v43 = +[PLBBMavLogMsg entryEventMavBBMav16BHwOther];
    v64[1] = v43;
    v63[2] = @"MavBBHwOtherPerRAT";
    uint64_t v2 = +[PLBBMavLogMsg entryEventBackwardMavBBHwOtherPerRAT];
    v64[2] = v2;
    v63[3] = @"BBMavHwRfLTE";
    uint64_t v3 = +[PLBBMav16BHwRfLTELogMsg entryEventBackwardDefinitionBBMav16BHwRfLTE];
    v64[3] = v3;
    v63[4] = @"BBMavHwRfWCDMA";
    id v4 = +[PLBBMavHwRfWCDMALogMsg entryEventBackwardDefinitionBBMav16BHwRfWCDMA];
    v64[4] = v4;
    v63[5] = @"BBMavHwRfGSM";
    uint64_t v5 = +[PLBBMavHwRfGSMLogMsg entryEventBackwardDefinitionBBMavHwRfGSM];
    v64[5] = v5;
    v63[6] = @"BBMavHwRfTDS";
    id v6 = +[PLBBMavHwRfTDSLogMsg entryEventBackwardDefinitionBBMavHwRfTDS];
    v64[6] = v6;
    v63[7] = @"BBMavHwRf1x";
    uint64_t v7 = +[PLBBMavHwRf1xLogMsg entryEventBackwardDefinitionBBMavHwRf1x];
    v64[7] = v7;
    v63[8] = @"BBMavHwRfHDR";
    double v8 = +[PLBBMavHwRfHDRLogMsg entryEventBackwardDefinitionBBMavHwRfHDR];
    v64[8] = v8;
    v63[9] = @"BBMavHwRfOos";
    uint64_t v9 = +[PLBBMavHwRfOOSLogMsg entryEventBackwardDefinitionOOSPerRat];
    v64[9] = v9;
    v63[10] = @"CMCallEventEndCode";
    id v10 = +[PLBBEurekaEventMsg bbEuEvMsgNameCMCallEventEndV2];
    v64[10] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:11];

LABEL_10:
    uint64_t v18 = (void *)v43;
    id v19 = (void *)v44;
LABEL_11:

    goto LABEL_12;
  }
  if ([MEMORY[0x1E4F92A38] isBasebandClass:1003005])
  {
    v61[0] = @"LTESleepMgrStats";
    uint64_t v44 = +[PLBBEurekaLogMsg bbEuLogMsgNameLTESleepMgrStats];
    v62[0] = v44;
    v61[1] = @"MavBBHwOther";
    uint64_t v43 = +[PLBBMavLogMsg entryEventMavBBMav16HwOther];
    v62[1] = v43;
    v61[2] = @"MavBBHwOtherPerRAT";
    uint64_t v2 = +[PLBBMavLogMsg entryEventBackwardMavBBHwOtherPerRAT];
    v62[2] = v2;
    v61[3] = @"BBMavHwRfLTE";
    uint64_t v3 = +[PLBBMav16HwRfLTELogMsg entryEventBackwardDefinitionBBMav16HwRfLTE];
    v62[3] = v3;
    v61[4] = @"BBMavHwRfWCDMA";
    id v4 = +[PLBBMavHwRfWCDMALogMsg entryEventBackwardDefinitionBBMav16HwRfWCDMA];
    v62[4] = v4;
    v61[5] = @"BBMavHwRfGSM";
    uint64_t v5 = +[PLBBMavHwRfGSMLogMsg entryEventBackwardDefinitionBBMavHwRfGSM];
    v62[5] = v5;
    v61[6] = @"BBMavHwRfTDS";
    id v6 = +[PLBBMavHwRfTDSLogMsg entryEventBackwardDefinitionBBMavHwRfTDS];
    v62[6] = v6;
    v61[7] = @"BBMavHwRf1x";
    uint64_t v7 = +[PLBBMavHwRf1xLogMsg entryEventBackwardDefinitionBBMavHwRf1x];
    v62[7] = v7;
    v61[8] = @"BBMavHwRfHDR";
    uint64_t v12 = +[PLBBMavHwRfHDRLogMsg entryEventBackwardDefinitionBBMavHwRfHDR];
    v62[8] = v12;
    v61[9] = @"BBMavHwRfOos";
    uint64_t v13 = +[PLBBMavHwRfOOSLogMsg entryEventBackwardDefinitionOOSPerRat];
    v62[9] = v13;
    v61[10] = @"CMCallEventEndCode";
    uint64_t v14 = +[PLBBEurekaEventMsg bbEuEvMsgNameCMCallEventEndV2];
    v62[10] = v14;
    uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v16 = v62;
    uint64_t v17 = v61;
LABEL_9:
    v11 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:11];

    goto LABEL_10;
  }
  if ([MEMORY[0x1E4F92A38] isBasebandClass:1003004])
  {
    v59[0] = @"LTESleepMgrStats";
    uint64_t v44 = +[PLBBEurekaLogMsg bbEuLogMsgNameLTESleepMgrStats];
    v60[0] = v44;
    v59[1] = @"MavBBHwOther";
    uint64_t v43 = +[PLBBMavLogMsg entryEventMavBBMav13HwOther];
    v60[1] = v43;
    v59[2] = @"MavBBHwOtherPerRAT";
    uint64_t v2 = +[PLBBMavLogMsg entryEventBackwardMavBBHwOtherPerRAT];
    v60[2] = v2;
    v59[3] = @"BBMavHwRfLTE";
    uint64_t v3 = +[PLBBMavHwRfLTELogMsg entryEventBackwardDefinitionBBMav13HwRfLTE];
    v60[3] = v3;
    v59[4] = @"BBMavHwRfWCDMA";
    id v4 = +[PLBBMavHwRfWCDMALogMsg entryEventBackwardDefinitionBBMavHwRfWCDMA];
    v60[4] = v4;
    v59[5] = @"BBMavHwRfGSM";
    uint64_t v5 = +[PLBBMavHwRfGSMLogMsg entryEventBackwardDefinitionBBMavHwRfGSM];
    v60[5] = v5;
    v59[6] = @"BBMavHwRfTDS";
    id v6 = +[PLBBMavHwRfTDSLogMsg entryEventBackwardDefinitionBBMavHwRfTDS];
    v60[6] = v6;
    v59[7] = @"BBMavHwRf1x";
    uint64_t v7 = +[PLBBMavHwRf1xLogMsg entryEventBackwardDefinitionBBMavHwRf1x];
    v60[7] = v7;
    v59[8] = @"BBMavHwRfHDR";
    uint64_t v12 = +[PLBBMavHwRfHDRLogMsg entryEventBackwardDefinitionBBMavHwRfHDR];
    v60[8] = v12;
    v59[9] = @"BBMavHwRfOos";
    uint64_t v13 = +[PLBBMavHwRfOOSLogMsg entryEventBackwardDefinitionOOSPerRat];
    v60[9] = v13;
    v59[10] = @"CMCallEventEndCode";
    uint64_t v14 = +[PLBBEurekaEventMsg bbEuEvMsgNameCMCallEventEndV2];
    v60[10] = v14;
    uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v16 = v60;
    uint64_t v17 = v59;
    goto LABEL_9;
  }
  if ([MEMORY[0x1E4F92A38] isBasebandClass:1003003])
  {
    v57[0] = @"LTESleepMgrStats";
    uint64_t v44 = +[PLBBEurekaLogMsg bbEuLogMsgNameLTESleepMgrStats];
    v58[0] = v44;
    v57[1] = @"MavBBHwOther";
    uint64_t v43 = +[PLBBMavLogMsg entryEventMavBBMav10HwOther];
    v58[1] = v43;
    v57[2] = @"MavBBHwOtherPerRAT";
    uint64_t v2 = +[PLBBMavLogMsg entryEventBackwardMavBBHwOtherPerRAT];
    v58[2] = v2;
    v57[3] = @"BBMavHwRfLTE";
    uint64_t v3 = +[PLBBMavHwRfLTELogMsg entryEventBackwardDefinitionBBMav10HwRfLTE];
    v58[3] = v3;
    v57[4] = @"BBMavHwRfWCDMA";
    id v4 = +[PLBBMavHwRfWCDMALogMsg entryEventBackwardDefinitionBBMavHwRfWCDMA];
    v58[4] = v4;
    v57[5] = @"BBMavHwRfGSM";
    uint64_t v5 = +[PLBBMavHwRfGSMLogMsg entryEventBackwardDefinitionBBMavHwRfGSM];
    v58[5] = v5;
    v57[6] = @"BBMavHwRfTDS";
    id v6 = +[PLBBMavHwRfTDSLogMsg entryEventBackwardDefinitionBBMavHwRfTDS];
    v58[6] = v6;
    v57[7] = @"BBMavHwRf1x";
    uint64_t v7 = +[PLBBMavHwRf1xLogMsg entryEventBackwardDefinitionBBMavHwRf1x];
    v58[7] = v7;
    v57[8] = @"BBMavHwRfHDR";
    uint64_t v12 = +[PLBBMavHwRfHDRLogMsg entryEventBackwardDefinitionBBMavHwRfHDR];
    v58[8] = v12;
    v57[9] = @"BBMavHwRfOos";
    uint64_t v13 = +[PLBBMavHwRfOOSLogMsg entryEventBackwardDefinitionOOSPerRat];
    v58[9] = v13;
    v57[10] = @"CMCallEventEndCode";
    uint64_t v14 = +[PLBBEurekaEventMsg bbEuEvMsgNameCMCallEventEndV2];
    v58[10] = v14;
    uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v16 = v58;
    uint64_t v17 = v57;
    goto LABEL_9;
  }
  if ([MEMORY[0x1E4F92A38] isBasebandClass:1003002])
  {
    v55[0] = @"LTESleepMgrStats";
    id v19 = +[PLBBEurekaLogMsg bbEuLogMsgNameLTESleepMgrStats];
    v56[0] = v19;
    v55[1] = @"MavBBHwOther";
    uint64_t v18 = +[PLBBMavLogMsg entryEventBackwardMavBBHwOther];
    v56[1] = v18;
    v55[2] = @"MavBBHwOtherPerRAT";
    int v21 = +[PLBBMavLogMsg entryEventBackwardMavBBHwOtherPerRAT];
    v56[2] = v21;
    v55[3] = @"CMCallEventEndCode";
    uint64_t v22 = +[PLBBEurekaEventMsg bbEuEvMsgNameCMCallEventEndV2];
    v56[3] = v22;
    uint64_t v23 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v24 = v56;
    uint64_t v25 = v55;
LABEL_19:
    v11 = [v23 dictionaryWithObjects:v24 forKeys:v25 count:4];

    goto LABEL_11;
  }
  if ([MEMORY[0x1E4F92A38] isBasebandClass:1003001])
  {
    v53[0] = @"LTESleepMgrStats";
    id v19 = +[PLBBEurekaLogMsg bbEuLogMsgNameLTESleepMgrStats];
    v54[0] = v19;
    v53[1] = @"MavBBHwOther";
    uint64_t v18 = +[PLBBMavLogMsg entryEventBackwardMavBBHwOther];
    v54[1] = v18;
    v53[2] = @"MavBBHwOtherPerRAT";
    int v21 = +[PLBBMavLogMsg entryEventBackwardMavBBHwOtherPerRAT];
    v54[2] = v21;
    v53[3] = @"CMCallEventEndCode";
    uint64_t v22 = +[PLBBEurekaEventMsg bbEuEvMsgNameCMCallEventEnd];
    v54[3] = v22;
    uint64_t v23 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v24 = v54;
    uint64_t v25 = v53;
    goto LABEL_19;
  }
  if ([MEMORY[0x1E4F92A38] isBasebandMav])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v26 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__PLBBAgent_entryEventBackwardDefinitions__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v26;
      if (qword_1EBD59008 != -1) {
        dispatch_once(&qword_1EBD59008, block);
      }
      if (byte_1EBD58D01)
      {
        v27 = [NSString stringWithFormat:@"KMAV backward defs"];
        uint64_t v28 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        uint64_t v30 = [v29 lastPathComponent];
        uint64_t v31 = [NSString stringWithUTF8String:"+[PLBBAgent entryEventBackwardDefinitions]"];
        [v28 logMessage:v27 fromFile:v30 fromFunction:v31 fromLineNumber:1232];

        uint64_t v32 = PLLogCommon();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v52 = v27;
          _os_log_debug_impl(&dword_1D2690000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v49[0] = @"BBMavPeriodicMetrics";
    id v19 = +[PLMAVBBHardwareMessage entryEventBackwardDefinitionBBMavPeriodicMetrics];
    v49[1] = @"BBMavEventMetrics";
    v50[0] = v19;
    uint64_t v18 = +[PLMAVBBHardwareMessage entryEventBackwardDefinitionBBMavEventMetrics];
    v50[1] = v18;
    uint64_t v33 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v34 = v50;
    v35 = v49;
LABEL_38:
    v11 = [v33 dictionaryWithObjects:v34 forKeys:v35 count:2];
    goto LABEL_11;
  }
  if ([MEMORY[0x1E4F92A38] isBasebandIce])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v36 = objc_opt_class();
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      void v45[2] = __42__PLBBAgent_entryEventBackwardDefinitions__block_invoke_1154;
      v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v45[4] = v36;
      if (qword_1EBD59010 != -1) {
        dispatch_once(&qword_1EBD59010, v45);
      }
      if (byte_1EBD58D02)
      {
        uint64_t v37 = [NSString stringWithFormat:@"KICE backward defs"];
        uint64_t v38 = (void *)MEMORY[0x1E4F929B8];
        v39 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        uint64_t v40 = [v39 lastPathComponent];
        v41 = [NSString stringWithUTF8String:"+[PLBBAgent entryEventBackwardDefinitions]"];
        [v38 logMessage:v37 fromFile:v40 fromFunction:v41 fromLineNumber:1242];

        int64_t v42 = PLLogCommon();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v52 = v37;
          _os_log_debug_impl(&dword_1D2690000, v42, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v47[0] = @"BBIcePeriodicMetrics";
    id v19 = +[PLICEBBHardwareMessage entryEventBackwardDefinitionBBIcePeriodicMetrics];
    v47[1] = @"BBIceEventMetrics";
    v48[0] = v19;
    uint64_t v18 = +[PLICEBBHardwareMessage entryEventBackwardDefinitionBBIceEventMetrics];
    v48[1] = v18;
    uint64_t v33 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v34 = v48;
    v35 = v47;
    goto LABEL_38;
  }
  v11 = (void *)MEMORY[0x1E4F1CC08];
LABEL_12:
  return v11;
}

uint64_t __42__PLBBAgent_entryEventBackwardDefinitions__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D01 = result;
  return result;
}

uint64_t __42__PLBBAgent_entryEventBackwardDefinitions__block_invoke_1154(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D02 = result;
  return result;
}

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventNoneDefinitions
{
  void v21[5] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isBasebandMav])
  {
    v20[0] = @"BBMAVMsgTriggerDump";
    uint64_t v3 = +[PLBBICEMsg msgTriggerTableSchema];
    v21[0] = v3;
    v20[1] = @"BBMAVMsgMetricDump";
    id v4 = +[PLBBICEMsg msgMetricTableSchema];
    v21[1] = v4;
    uint64_t v5 = +[PLBBAgent getNameBBReport];
    v20[2] = v5;
    id v6 = [a1 entryEventNoneBBReport];
    v21[2] = v6;
    v20[3] = @"BBMsgLite";
    uint64_t v7 = [a1 entryIceMsgLite];
    v21[3] = v7;
    v20[4] = @"BBMsgAll";
    double v8 = +[PLBBMsgAll entryEventNoneBBMsgAll];
    v21[4] = v8;
    uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
    id v10 = v21;
    v11 = v20;
  }
  else if ([MEMORY[0x1E4F92A38] isBasebandIce])
  {
    v18[0] = @"BBICEMsgTriggerDump";
    uint64_t v3 = +[PLBBICEMsg msgTriggerTableSchema];
    v19[0] = v3;
    v18[1] = @"BBICEMsgMetricDump";
    id v4 = +[PLBBICEMsg msgMetricTableSchema];
    v19[1] = v4;
    uint64_t v5 = +[PLBBAgent getNameBBReport];
    v18[2] = v5;
    id v6 = [a1 entryEventNoneBBReport];
    v19[2] = v6;
    v18[3] = @"BBMsgLite";
    uint64_t v7 = [a1 entryIceMsgLite];
    v19[3] = v7;
    v18[4] = @"BBMsgAll";
    double v8 = +[PLBBMsgAll entryEventNoneBBMsgAll];
    v19[4] = v8;
    uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
    id v10 = v19;
    v11 = v18;
  }
  else if (([MEMORY[0x1E4F92A38] isBasebandClass:1003003] & 1) != 0 {
         || ([MEMORY[0x1E4F92A38] isBasebandClass:1003002] & 1) != 0)
  }
  {
    v14[0] = @"CMCallEventConnCode";
    uint64_t v3 = +[PLBBEurekaEventMsg bbEuEvMsgNameCMCallEventConnV2];
    v15[0] = v3;
    v14[1] = @"BBEurekaEventMsgLite";
    id v4 = +[PLBBEurekaEventMsg bbEuEvMsgNameBBEurekaMsgLite];
    v15[1] = v4;
    v14[2] = @"EventNotProcessed";
    uint64_t v5 = +[PLBBEurekaEventMsg bbEuEvMsgEventNotProcessed];
    v15[2] = v5;
    v14[3] = @"BBMsgAll";
    id v6 = +[PLBBMsgAll entryEventNoneBBMsgAll];
    v15[3] = v6;
    uint64_t v7 = +[PLBBAgent getNameBBReport];
    v14[4] = v7;
    double v8 = [a1 entryEventNoneBBReport];
    v15[4] = v8;
    uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
    id v10 = v15;
    v11 = v14;
  }
  else
  {
    v16[0] = @"CMCallEventConnCode";
    uint64_t v3 = +[PLBBEurekaEventMsg bbEuEvMsgNameCMCallEventConn];
    v17[0] = v3;
    v16[1] = @"BBEurekaEventMsgLite";
    id v4 = +[PLBBEurekaEventMsg bbEuEvMsgNameBBEurekaMsgLite];
    v17[1] = v4;
    v16[2] = @"EventNotProcessed";
    uint64_t v5 = +[PLBBEurekaEventMsg bbEuEvMsgEventNotProcessed];
    v17[2] = v5;
    v16[3] = @"BBMsgAll";
    id v6 = +[PLBBMsgAll entryEventNoneBBMsgAll];
    v17[3] = v6;
    uint64_t v7 = +[PLBBAgent getNameBBReport];
    v16[4] = v7;
    double v8 = [a1 entryEventNoneBBReport];
    v17[4] = v8;
    uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
    id v10 = v17;
    v11 = v16;
  }
  uint64_t v12 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:5];

  return v12;
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLBBAgent)init
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (![MEMORY[0x1E4F92A38] hasBaseband])
  {
LABEL_29:
    uint64_t v22 = 0;
    goto LABEL_30;
  }
  v34.receiver = self;
  v34.super_class = (Class)PLBBAgent;
  uint64_t v3 = [(PLAgent *)&v34 init];
  self = v3;
  if (!v3)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v15 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __17__PLBBAgent_init__block_invoke_1174;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v15;
      if (qword_1EBD59028 != -1) {
        dispatch_once(&qword_1EBD59028, block);
      }
      if (byte_1EBD58D05)
      {
        uint64_t v16 = [NSString stringWithFormat:@"PLBBAgent: failed to init"];
        uint64_t v17 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        id v19 = [v18 lastPathComponent];
        uint64_t v20 = [NSString stringWithUTF8String:"-[PLBBAgent init]"];
        [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:1364];

        int v21 = PLLogCommon();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v36 = v16;
          _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    goto LABEL_21;
  }
  v3->_agentInited = 0;
  id v4 = (PLTelephonyConnection *)+[PLTelephonyConnection sharedTelephonyConnection];
  self->_connection = v4;
  if (!v4)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v5 = objc_opt_class();
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      void v33[2] = __17__PLBBAgent_init__block_invoke;
      v33[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v33[4] = v5;
      if (qword_1EBD59018 != -1) {
        dispatch_once(&qword_1EBD59018, v33);
      }
      if (byte_1EBD58D03)
      {
        id v6 = [NSString stringWithFormat:@"no telephony connection"];
        uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
        double v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        uint64_t v9 = [v8 lastPathComponent];
        id v10 = [NSString stringWithUTF8String:"-[PLBBAgent init]"];
        [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:1349];

        v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v36 = v6;
          _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [MEMORY[0x1E4F929C0] debugEnabled];
  }
  self->_lastBBProtoPower = 0.0;
  self->_lastGWPower = 0.0;
  connection = self->_connection;
  if (!connection)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v23 = objc_opt_class();
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      void v32[2] = __17__PLBBAgent_init__block_invoke_1168;
      v32[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v32[4] = v23;
      if (qword_1EBD59020 != -1) {
        dispatch_once(&qword_1EBD59020, v32);
      }
      if (byte_1EBD58D04)
      {
        uint64_t v24 = [NSString stringWithFormat:@"Error: BBAgent no connection"];
        uint64_t v25 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        v27 = [v26 lastPathComponent];
        uint64_t v28 = [NSString stringWithUTF8String:"-[PLBBAgent init]"];
        [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:1356];

        uint64_t v29 = PLLogCommon();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v36 = v24;
          _os_log_debug_impl(&dword_1D2690000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    goto LABEL_29;
  }
  [(PLTelephonyConnection *)connection setObserverAgent:self];
  uint64_t v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  currentCallList = self->_currentCallList;
  self->_currentCallList = v13;

  self->_lteCurrentState = 0;
LABEL_21:
  self = self;
  uint64_t v22 = self;
LABEL_30:

  return v22;
}

uint64_t __17__PLBBAgent_init__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D03 = result;
  return result;
}

uint64_t __17__PLBBAgent_init__block_invoke_1168(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D04 = result;
  return result;
}

uint64_t __17__PLBBAgent_init__block_invoke_1174(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D05 = result;
  return result;
}

- (void)setupTelephonyRegistrationChannels
{
  uint64_t v3 = [(PLBBAgent *)self connection];
  [v3 registerCallback:TelephonyNotificationCB forTelephonyNotification:*MEMORY[0x1E4F23FC0]];

  id v4 = [(PLBBAgent *)self connection];
  [v4 registerCallback:TelephonyNotificationCB forTelephonyNotification:*MEMORY[0x1E4F24178]];

  uint64_t v5 = [(PLBBAgent *)self connection];
  [v5 registerCallback:TelephonyNotificationCB forTelephonyNotification:*MEMORY[0x1E4F24080]];

  id v6 = [(PLBBAgent *)self connection];
  [v6 registerCallback:TelephonyNotificationCB forTelephonyNotification:*MEMORY[0x1E4F240A0]];

  id v7 = [(PLBBAgent *)self connection];
  [v7 registerCallback:TelephonyNotificationCB forTelephonyNotification:*MEMORY[0x1E4F24298]];
}

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int v10 = [MEMORY[0x1E4F92A38] isBasebandDSDS];
  if (!v9 || !v10) {
    goto LABEL_20;
  }
  int64_t v11 = [(PLBBAgent *)self getSubsIdFromCTContext:v8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v12 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__PLBBAgent_connectionStateChanged_connection_dataConnectionStatusInfo___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v12;
    if (qword_1EBD59030 != -1) {
      dispatch_once(&qword_1EBD59030, block);
    }
    if (byte_1EBD58D06)
    {
      uint64_t v40 = NSString;
      v39 = [v9 pdp];
      uint64_t v38 = [v9 interfaceName];
      uint64_t v13 = [v9 apnName];
      uint64_t v37 = [v9 wirelessTechnologyMask];
      uint64_t v14 = [v9 state];
      uint64_t v15 = [v9 ipFamily];
      uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "suspended"));
      uint64_t v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "publicNetAllowed"));
      uint64_t v18 = [v40 stringWithFormat:@"connectionStateChanged:connection:dataConnectionStatusInfo: called with                               subsId: %d, CTDataConnectionType: %d                               pdp: %@                               interface name: %@                               apnName: %@                               wirelessTechnologyMask: %d                               state: %d                               ipFamily: %d                               suspended: %@                               publicNetAllowed: %@                               contextType: %d", v11, v6, v39, v38, v13, v37, v14, v15, v16, v17, objc_msgSend(v9, "contextType")];

      id v19 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      int v21 = [v20 lastPathComponent];
      uint64_t v22 = [NSString stringWithUTF8String:"-[PLBBAgent connectionStateChanged:connection:dataConnectionStatusInfo:]"];
      [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:1412];

      uint64_t v23 = PLLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v18;
        _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (v11 == -1) {
    goto LABEL_16;
  }
  if ([MEMORY[0x1E4F92A88] isFullModeDaemon])
  {
    int v24 = [v9 state];
    uint64_t v25 = [(PLBBAgent *)self dsdsRegMsgs];
    uint64_t v26 = [v25 objectAtIndexedSubscript:(int)v11];
    int v27 = [v26 dataActive];

    if (v24 != v27)
    {
      if ([MEMORY[0x1E4F92A88] isFullModeDaemon])
      {
        uint64_t v29 = [v9 state];
        uint64_t v30 = [(PLBBAgent *)self dsdsRegMsgs];
        uint64_t v31 = [v30 objectAtIndexedSubscript:(int)v11];
        [v31 setDataActive:v29];
      }
LABEL_16:
      int v28 = 1;
      goto LABEL_17;
    }
  }
  int v28 = 0;
LABEL_17:
  uint64_t v32 = [(PLBBAgent *)self dsdsRegMsgs];
  uint64_t v33 = [v32 objectAtIndexedSubscript:(int)v11];
  objc_super v34 = [v33 operatorName];

  if (v28)
  {
    int64_t v42 = @"dataActive";
    v35 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "state"));
    uint64_t v43 = v35;
    uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];

    [(PLBBAgent *)self logDSDSEventForwardTelephonyRegistrationWithKVPairs:v36 subsId:v11 andOperator:v34];
  }

LABEL_20:
}

uint64_t __72__PLBBAgent_connectionStateChanged_connection_dataConnectionStatusInfo___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D06 = result;
  return result;
}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x1E4F92A38] isBasebandDSDS];
  if (!v7 || !v8) {
    goto LABEL_26;
  }
  int64_t v9 = [(PLBBAgent *)self getSubsIdFromCTContext:v6];
  uint64_t v10 = (int)v9;
  int64_t v62 = v9;
  id v63 = v6;
  if (v9 != -1)
  {
    int v11 = [v7 indicator];
    uint64_t v12 = [(PLBBAgent *)self dsdsRegMsgs];
    uint64_t v13 = [v12 objectAtIndexedSubscript:v10];
    if (v11 == [v13 dataIndicator])
    {
      int v14 = [v7 dataBearerSoMask];
      uint64_t v15 = [(PLBBAgent *)self dsdsRegMsgs];
      uint64_t v16 = [v15 objectAtIndexedSubscript:v10];
      int v17 = [v16 serviceOpt];

      if (v14 != v17) {
        goto LABEL_12;
      }
      if (![MEMORY[0x1E4F92A88] isFullModeDaemon])
      {
LABEL_9:
        int v22 = 0;
LABEL_15:
        id v6 = v63;
        goto LABEL_16;
      }
      uint64_t v12 = [(PLBBAgent *)self dsdsRegMsgs];
      uint64_t v13 = [v12 objectAtIndexedSubscript:v10];
      if ([v13 dataAttached] != -1)
      {
        uint64_t v18 = [(PLBBAgent *)self dsdsRegMsgs];
        id v19 = [v18 objectAtIndexedSubscript:v10];
        BOOL v20 = [v19 dataAttached] == 0;
        char v21 = v20 ^ [v7 attached];

        if (v21) {
          goto LABEL_9;
        }
LABEL_12:
        uint64_t v23 = [v7 indicator];
        int v24 = [(PLBBAgent *)self dsdsRegMsgs];
        uint64_t v25 = [v24 objectAtIndexedSubscript:v10];
        [v25 setDataIndicator:v23];

        uint64_t v26 = [v7 dataBearerSoMask];
        int v27 = [(PLBBAgent *)self dsdsRegMsgs];
        int v28 = [v27 objectAtIndexedSubscript:v10];
        [v28 setServiceOpt:v26];

        if ([MEMORY[0x1E4F92A88] isFullModeDaemon])
        {
          uint64_t v29 = [v7 attached];
          uint64_t v30 = [(PLBBAgent *)self dsdsRegMsgs];
          uint64_t v31 = [v30 objectAtIndexedSubscript:v10];
          [v31 setDataAttached:v29];
        }
        int v22 = 1;
        goto LABEL_15;
      }
    }

    goto LABEL_12;
  }
  int v22 = 1;
LABEL_16:
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v32 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PLBBAgent_dataStatus_dataStatusInfo___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v32;
    if (qword_1EBD59038 != -1) {
      dispatch_once(&qword_1EBD59038, block);
    }
    if (byte_1EBD58D07)
    {
      int v61 = v22;
      uint64_t v59 = v10;
      v60 = NSString;
      uint64_t v33 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "attached"));
      uint64_t v58 = [v7 indicator];
      uint64_t v57 = [v7 indicatorOverride];
      v56 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "roamAllowed"));
      uint64_t v55 = [v7 radioTechnology];
      uint64_t v34 = [v7 dataBearerSoMask];
      v35 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "dataPlanSignalingReductionOverride"));
      uint64_t v36 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "cellularDataPossible"));
      uint64_t v37 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "activeContexts"));
      uint64_t v38 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "totalActiveContexts"));
      v39 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "inHomeCountry"));
      uint64_t v54 = v34;
      uint64_t v40 = (void *)v33;
      v41 = [v60 stringWithFormat:@"dataStatus:dataStatusInfo: called with subsId: %d                               attached: %@                               indicator: %d                               indicatorOverride: %d                               roamAllowed: %@                               radioTechnology: %d                               dataBearerSoMask: %d                               dataPlanSignalingReductionOverride: %@                               cellularDataPossible: %@                               activeContexts: %@                               totalActiveContexts: %@                               inHomeCountry: %@", v62, v33, v58, v57, v56, v55, v54, v35, v36, v37, v38, v39];

      int64_t v42 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v43 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      uint64_t v44 = [v43 lastPathComponent];
      v45 = [NSString stringWithUTF8String:"-[PLBBAgent dataStatus:dataStatusInfo:]"];
      [v42 logMessage:v41 fromFile:v44 fromFunction:v45 fromLineNumber:1494];

      uint64_t v46 = PLLogCommon();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v68 = v41;
        _os_log_debug_impl(&dword_1D2690000, v46, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      id v6 = v63;
      int v22 = v61;
      uint64_t v10 = v59;
    }
  }
  v47 = [(PLBBAgent *)self dsdsRegMsgs];
  v48 = [v47 objectAtIndexedSubscript:v10];
  uint64_t v49 = [v48 operatorName];

  if (v22)
  {
    v65[0] = @"dataAttached";
    double v50 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "attached"));
    v66[0] = v50;
    v65[1] = @"dataInd";
    uint64_t v51 = dataIndicatorToString([v7 indicator]);
    v66[1] = v51;
    v65[2] = @"serviceOpt";
    uint64_t v52 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "dataBearerSoMask"));
    v66[2] = v52;
    uint64_t v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:3];

    [(PLBBAgent *)self logDSDSEventForwardTelephonyRegistrationWithKVPairs:v53 subsId:v62 andOperator:v49];
  }

LABEL_26:
}

uint64_t __39__PLBBAgent_dataStatus_dataStatusInfo___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D07 = result;
  return result;
}

- (void)operatorNameChanged:(id)a3 name:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x1E4F92A38] isBasebandDSDS];
  if (!v7 || !v8) {
    goto LABEL_17;
  }
  int64_t v9 = [(PLBBAgent *)self getSubsIdFromCTContext:v6];
  if (v9 == -1) {
    goto LABEL_7;
  }
  uint64_t v10 = [(PLBBAgent *)self dsdsRegMsgs];
  int v11 = [v10 objectAtIndexedSubscript:(int)v9];
  uint64_t v12 = [v11 operatorName];
  char v13 = [v7 isEqualToString:v12];

  if ((v13 & 1) == 0)
  {
    uint64_t v15 = [(PLBBAgent *)self dsdsRegMsgs];
    uint64_t v16 = [v15 objectAtIndexedSubscript:(int)v9];
    [v16 setOperatorName:v7];

LABEL_7:
    char v14 = 0;
    goto LABEL_8;
  }
  char v14 = 1;
LABEL_8:
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v17 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    uint64_t v26 = __38__PLBBAgent_operatorNameChanged_name___block_invoke;
    int v27 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v28 = v17;
    if (qword_1EBD59040 != -1) {
      dispatch_once(&qword_1EBD59040, &block);
    }
    if (byte_1EBD58D08)
    {
      uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"operatorNameChanged:name: called with subsId: %d", v9, block, v25, v26, v27, v28);
      id v19 = (void *)MEMORY[0x1E4F929B8];
      BOOL v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      char v21 = [v20 lastPathComponent];
      int v22 = [NSString stringWithUTF8String:"-[PLBBAgent operatorNameChanged:name:]"];
      [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:1524];

      uint64_t v23 = PLLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v30 = v18;
        _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if ((v14 & 1) == 0) {
    [(PLBBAgent *)self logDSDSEventForwardTelephonyRegistrationWithKVPairs:0 subsId:v9 andOperator:v7];
  }
LABEL_17:
}

uint64_t __38__PLBBAgent_operatorNameChanged_name___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D08 = result;
  return result;
}

- (void)displayStatusChanged:(id)a3 status:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x1E4F92A38] isBasebandDSDS];
  if (!v7 || !v8) {
    goto LABEL_25;
  }
  int64_t v9 = [(PLBBAgent *)self getSubsIdFromCTContext:v6];
  uint64_t v10 = [v7 registrationDisplayStatus];
  int v11 = removeCTPrefixFromString(@"kCTRegistrationStatus", v10);

  int64_t v50 = v9;
  if (v9 == -1)
  {
    int v25 = 1;
    uint64_t v13 = -1;
    goto LABEL_15;
  }
  uint64_t v12 = [(PLBBAgent *)self dsdsRegMsgs];
  uint64_t v13 = (int)v9;
  char v14 = [v12 objectAtIndexedSubscript:(int)v9];
  uint64_t v15 = [v14 status];
  uint64_t v16 = v11;
  int v17 = [v11 isEqualToString:v15];

  unint64_t v18 = 0x1E4F92000uLL;
  if (!v17) {
    goto LABEL_12;
  }
  id v19 = v16;
  if (![MEMORY[0x1E4F92A88] isFullModeDaemon])
  {
    int v25 = 0;
    int v11 = v16;
    goto LABEL_15;
  }
  BOOL v20 = [(PLBBAgent *)self dsdsRegMsgs];
  char v21 = [v20 objectAtIndexedSubscript:v13];
  if ([v21 isHome] == -1)
  {

    goto LABEL_12;
  }
  int v22 = [(PLBBAgent *)self dsdsRegMsgs];
  uint64_t v23 = [v22 objectAtIndexedSubscript:v13];
  BOOL v24 = [v23 isHome] == 0;
  int v48 = v24 ^ [v7 isInHomeCountry];

  unint64_t v18 = 0x1E4F92000;
  uint64_t v16 = v19;
  if ((v48 & 1) == 0)
  {
LABEL_12:
    uint64_t v26 = [(PLBBAgent *)self dsdsRegMsgs];
    int v27 = [v26 objectAtIndexedSubscript:v13];
    [v27 setStatus:v16];

    int v11 = v16;
    if ([*(id *)(v18 + 2696) isFullModeDaemon])
    {
      uint64_t v28 = [v7 isInHomeCountry];
      uint64_t v29 = [(PLBBAgent *)self dsdsRegMsgs];
      uint64_t v30 = [v29 objectAtIndexedSubscript:v13];
      [v30 setIsHome:v28];
    }
    int v25 = 1;
    goto LABEL_15;
  }
  int v25 = 0;
  int v11 = v19;
LABEL_15:
  uint64_t v31 = [(PLBBAgent *)self dsdsRegMsgs];
  uint64_t v32 = [v31 objectAtIndexedSubscript:v13];
  uint64_t v33 = [v32 operatorName];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v34 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__PLBBAgent_displayStatusChanged_status___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v34;
    if (qword_1EBD59048 != -1) {
      dispatch_once(&qword_1EBD59048, block);
    }
    if (byte_1EBD58D09)
    {
      uint64_t v49 = v11;
      v35 = NSString;
      uint64_t v36 = [v7 registrationDisplayStatus];
      uint64_t v37 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isInHomeCountry"));
      uint64_t v38 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "changedDueToSimRemoval"));
      v39 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isRegistrationForcedHome"));
      uint64_t v40 = [v35 stringWithFormat:@"displayStatusChanged:status: called with subsId: %d                               registrationDisplayStatus: %@                               isInHomeCountry: %@                               changedDueToSimRemoval: %@                               isRegistrationForcedHome: %@", v50, v36, v37, v38, v39];

      v41 = (void *)MEMORY[0x1E4F929B8];
      int64_t v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      uint64_t v43 = [v42 lastPathComponent];
      uint64_t v44 = [NSString stringWithUTF8String:"-[PLBBAgent displayStatusChanged:status:]"];
      [v41 logMessage:v40 fromFile:v43 fromFunction:v44 fromLineNumber:1574];

      v45 = PLLogCommon();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v55 = v40;
        _os_log_debug_impl(&dword_1D2690000, v45, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      int v11 = v49;
    }
  }
  if (v25)
  {
    v52[0] = @"home";
    uint64_t v46 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isInHomeCountry"));
    v52[1] = @"status";
    v53[0] = v46;
    v53[1] = v11;
    v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];

    [(PLBBAgent *)self logDSDSEventForwardTelephonyRegistrationWithKVPairs:v47 subsId:v50 andOperator:v33];
  }

LABEL_25:
}

uint64_t __41__PLBBAgent_displayStatusChanged_status___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D09 = result;
  return result;
}

- (void)signalStrengthChanged:(id)a3 info:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x1E4F92A38] isBasebandDSDS];
  if (!v7 || !v8) {
    goto LABEL_19;
  }
  int64_t v9 = [(PLBBAgent *)self getSubsIdFromCTContext:v6];
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  if (v9 == -1) {
    goto LABEL_8;
  }
  int v11 = [(PLBBAgent *)self dsdsActivityMsgs];
  uint64_t v12 = [v11 objectAtIndexedSubscript:(int)v9];
  uint64_t v13 = [v12 signalStrengthLogTimestamp];
  [v10 timeIntervalSinceDate:v13];
  double v15 = v14;

  if (v15 >= 60.0 || v15 <= 0.0)
  {
    int v17 = [(PLBBAgent *)self dsdsActivityMsgs];
    unint64_t v18 = [v17 objectAtIndexedSubscript:(int)v9];
    [v18 setSignalStrengthLogTimestamp:v10];

    id v19 = [v7 bars];
    BOOL v20 = [(PLBBAgent *)self dsdsActivityMsgs];
    char v21 = [v20 objectAtIndexedSubscript:(int)v9];
    [v21 setSignalBars:v19];

LABEL_8:
    int v16 = 1;
    goto LABEL_9;
  }
  int v16 = 0;
LABEL_9:
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v22 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__PLBBAgent_signalStrengthChanged_info___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v22;
    if (qword_1EBD59050 != -1) {
      dispatch_once(&qword_1EBD59050, block);
    }
    if (byte_1EBD58D0A)
    {
      uint64_t v30 = v10;
      uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"signalStrengthChanged:info: called with subsId: %d", v9);
      BOOL v24 = (void *)MEMORY[0x1E4F929B8];
      int v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      uint64_t v26 = [v25 lastPathComponent];
      int v27 = [NSString stringWithUTF8String:"-[PLBBAgent signalStrengthChanged:info:]"];
      [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:1605];

      uint64_t v28 = PLLogCommon();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v33 = v23;
        _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      uint64_t v10 = v30;
    }
  }
  if (v16)
  {
    uint64_t v29 = [v7 bars];
    [(PLBBAgent *)self logDSDSEventPointTelephonyActivityWithSubsId:v9 context:0 callStatus:0 simStatus:0 signalInfo:v29 RATselection:0 andCurrCampedRAT:0];
  }
LABEL_19:
}

uint64_t __40__PLBBAgent_signalStrengthChanged_info___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D0A = result;
  return result;
}

uint64_t __30__PLBBAgent_cellChanged_cell___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D0B = result;
  return result;
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F92A38] isBasebandDSDS])
  {
    if (v7)
    {
      int64_t v8 = [(PLBBAgent *)self getSubsIdFromCTContext:v6];
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v9 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __39__PLBBAgent_simStatusDidChange_status___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        void block[4] = v9;
        if (qword_1EBD59060 != -1) {
          dispatch_once(&qword_1EBD59060, block);
        }
        if (byte_1EBD58D0C)
        {
          uint64_t v10 = [NSString stringWithFormat:@"simStatusDidChange:status: called with subsId: %d, status: %@", v8, v7];
          int v11 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
          uint64_t v13 = [v12 lastPathComponent];
          double v14 = [NSString stringWithUTF8String:"-[PLBBAgent simStatusDidChange:status:]"];
          [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:1666];

          double v15 = PLLogCommon();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            char v21 = v10;
            _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      int v16 = removeCTPrefixFromString(@"kCTSIMSupportSIMStatus", v7);

      if (v8 != -1)
      {
        int v17 = [(PLBBAgent *)self dsdsActivityMsgs];
        unint64_t v18 = [v17 objectAtIndexedSubscript:(int)v8];
        [v18 setSimStatus:v16];
      }
      [(PLBBAgent *)self logDSDSEventPointTelephonyActivityWithSubsId:v8 context:v6 callStatus:0 simStatus:v16 signalInfo:0 RATselection:0 andCurrCampedRAT:0];
    }
    else
    {
      int v16 = 0;
    }
  }
  else
  {
    int v16 = v7;
  }
}

uint64_t __39__PLBBAgent_simStatusDidChange_status___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D0C = result;
  return result;
}

- (void)ratSelectionChanged:(id)a3 selection:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x1E4F92A38] isBasebandDSDS];
  if (!v7 || !v8) {
    goto LABEL_26;
  }
  uint64_t v9 = [MEMORY[0x1E4F23A68] contextWithServiceDescriptor:v6];
  int64_t v10 = [(PLBBAgent *)self getSubsIdFromCTContext:v9];
  int v11 = [v7 selection];
  uint64_t v12 = removeCTPrefixFromString(@"kCTRegistrationRATSelection", v11);

  if ([v12 isEqualToString:@"NRStandAlone"])
  {
    uint64_t v13 = @"NR_SA";
  }
  else
  {
    if (![v12 isEqualToString:@"NRNonStandAlone"]) {
      goto LABEL_8;
    }
    uint64_t v13 = @"NR_NSA";
  }

  uint64_t v12 = v13;
LABEL_8:
  int64_t v41 = v10;
  int64_t v42 = v9;
  if (v10 != -1)
  {
    id v40 = v6;
    double v14 = [(PLBBAgent *)self dsdsActivityMsgs];
    uint64_t v15 = (int)v10;
    int v16 = [v14 objectAtIndexedSubscript:(int)v10];
    int v17 = [v16 currentRAT];
    if ([v12 isEqualToString:v17])
    {
      unint64_t v18 = [v7 preferred];
      [(PLBBAgent *)self dsdsActivityMsgs];
      id v19 = v38 = self;
      BOOL v20 = [v19 objectAtIndexedSubscript:v15];
      char v21 = [v20 preferredRAT];
      char v37 = [v18 isEqualToString:v21];

      self = v38;
      if (v37)
      {
        char v22 = 1;
LABEL_15:
        id v6 = v40;
        int64_t v10 = v41;
        uint64_t v9 = v42;
        goto LABEL_16;
      }
    }
    else
    {
    }
    uint64_t v23 = [(PLBBAgent *)self dsdsActivityMsgs];
    BOOL v24 = [v23 objectAtIndexedSubscript:v15];
    [v24 setCurrentRAT:v12];

    int v25 = [v7 preferred];
    uint64_t v26 = removeCTPrefixFromString(@"kCTRegistrationRATSelection", v25);
    int v27 = [(PLBBAgent *)self dsdsActivityMsgs];
    [v27 objectAtIndexedSubscript:v15];
    uint64_t v29 = v28 = self;
    [v29 setPreferredRAT:v26];

    self = v28;
    char v22 = 0;
    goto LABEL_15;
  }
  char v22 = 0;
LABEL_16:
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v30 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__PLBBAgent_ratSelectionChanged_selection___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v30;
    if (qword_1EBD59068 != -1) {
      dispatch_once(&qword_1EBD59068, block);
    }
    if (byte_1EBD58D0D)
    {
      v39 = self;
      uint64_t v31 = [NSString stringWithFormat:@"ratSelectionChanged:selection: called with subsId: %d, selection: %@", v10, v7];
      uint64_t v32 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      uint64_t v34 = [v33 lastPathComponent];
      v35 = [NSString stringWithUTF8String:"-[PLBBAgent ratSelectionChanged:selection:]"];
      [v32 logMessage:v31 fromFile:v34 fromFunction:v35 fromLineNumber:1706];

      uint64_t v36 = PLLogCommon();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v31;
        _os_log_debug_impl(&dword_1D2690000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      self = v39;
      int64_t v10 = v41;
      uint64_t v9 = v42;
    }
  }
  if ((v22 & 1) == 0) {
    [(PLBBAgent *)self logDSDSEventPointTelephonyActivityWithSubsId:v10 context:v9 callStatus:0 simStatus:0 signalInfo:0 RATselection:v7 andCurrCampedRAT:0];
  }

LABEL_26:
}

uint64_t __43__PLBBAgent_ratSelectionChanged_selection___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D0D = result;
  return result;
}

- (void)callStatusChanged:(id)a3
{
  if (objc_msgSend(MEMORY[0x1E4F92A38], "isBasebandDSDS", a3))
  {
    id v4 = [(PLBBAgent *)self callCenter];
    uint64_t v5 = [v4 currentCalls];

    id v6 = [(PLBBAgent *)self telephonyClientQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __31__PLBBAgent_callStatusChanged___block_invoke;
    v8[3] = &unk_1E692B128;
    id v9 = v5;
    int64_t v10 = self;
    id v7 = v5;
    dispatch_async(v6, v8);
  }
}

void __31__PLBBAgent_callStatusChanged___block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v49 = 0;
  int64_t v50 = &v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = -1;
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 0;
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x3032000000;
  int64_t v42 = __Block_byref_object_copy__10;
  uint64_t v43 = __Block_byref_object_dispose__10;
  id v44 = 0;
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = [*(id *)(a1 + 32) objectAtIndex:0];
    if ((unint64_t)[*(id *)(a1 + 32) count] <= 1)
    {
      objc_msgSend(*(id *)(a1 + 40), "translateCallStatus:", objc_msgSend(v2, "status"));
      uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v3 = @"Multiple";
    }
    id v9 = [*(id *)(a1 + 40) telephonyClient];
    id v38 = 0;
    int64_t v10 = [v9 getSubscriptionInfoWithError:&v38];
    id v11 = v38;

    if (v10)
    {
      uint64_t v12 = [v10 subscriptionsInUse];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __31__PLBBAgent_callStatusChanged___block_invoke_2;
      void v31[3] = &unk_1E692EF18;
      id v13 = v2;
      uint64_t v14 = *(void *)(a1 + 40);
      id v32 = v13;
      uint64_t v33 = v14;
      v35 = &v49;
      uint64_t v36 = &v39;
      uint64_t v34 = v3;
      char v37 = &v45;
      [v12 enumerateObjectsUsingBlock:v31];

      uint64_t v15 = v32;
    }
    else
    {
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_19;
      }
      uint64_t v16 = objc_opt_class();
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __31__PLBBAgent_callStatusChanged___block_invoke_3;
      void v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v30[4] = v16;
      if (qword_1EBD59070 != -1) {
        dispatch_once(&qword_1EBD59070, v30);
      }
      if (!byte_1EBD58D0E) {
        goto LABEL_19;
      }
      uint64_t v15 = [NSString stringWithFormat:@"Could not determine CoreTelephony Subscription Info. Error: %@", v11];
      int v17 = (void *)MEMORY[0x1E4F929B8];
      unint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      id v19 = [v18 lastPathComponent];
      BOOL v20 = [NSString stringWithUTF8String:"-[PLBBAgent callStatusChanged:]_block_invoke"];
      [v17 logMessage:v15 fromFile:v19 fromFunction:v20 fromLineNumber:1765];

      char v21 = PLLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v54 = v15;
        _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
LABEL_19:

    goto LABEL_21;
  }
  uint64_t v4 = 0;
  *((unsigned char *)v46 + 24) = 1;
  uint64_t v3 = @"Inactive";
  while (1)
  {
    uint64_t v5 = [*(id *)(a1 + 40) dsdsActivityMsgs];
    id v6 = [v5 objectAtIndexedSubscript:v4];
    id v7 = [v6 callStatus];
    BOOL v8 = v7 == @"Inactive";

    if (!v8) {
      break;
    }
    if (++v4 == 4) {
      goto LABEL_22;
    }
  }
  v50[3] = v4;
  uint64_t v2 = [*(id *)(a1 + 40) dsdsActivityMsgs];
  id v11 = [v2 objectAtIndexedSubscript:v4];
  uint64_t v3 = @"Inactive";
  [v11 setCallStatus:@"Inactive"];
LABEL_21:

LABEL_22:
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v22 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__PLBBAgent_callStatusChanged___block_invoke_1265;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v22;
    if (qword_1EBD59078 != -1) {
      dispatch_once(&qword_1EBD59078, block);
    }
    if (byte_1EBD58D0F)
    {
      uint64_t v23 = [NSString stringWithFormat:@"callStatusChanged:status: called with subsId: %d callStatus: %@", v50[3], v3];
      BOOL v24 = (void *)MEMORY[0x1E4F929B8];
      int v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      uint64_t v26 = [v25 lastPathComponent];
      int v27 = [NSString stringWithUTF8String:"-[PLBBAgent callStatusChanged:]_block_invoke_2"];
      [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:1770];

      uint64_t v28 = PLLogCommon();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v54 = v23;
        _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (*((unsigned char *)v46 + 24)) {
    [*(id *)(a1 + 40) logDSDSEventPointTelephonyActivityWithSubsId:v50[3] context:v40[5] callStatus:v3 simStatus:0 signalInfo:0 RATselection:0 andCurrCampedRAT:0];
  }
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
}

void __31__PLBBAgent_callStatusChanged___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v15 = a2;
  id v7 = [*(id *)(a1 + 32) localSenderIdentity];
  BOOL v8 = [v7 UUID];

  id v9 = [v15 uuid];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 40) getSubsIdFromCTContext:v15];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    if (v11 != -1)
    {
      uint64_t v12 = *(void *)(a1 + 48);
      id v13 = [*(id *)(a1 + 40) dsdsActivityMsgs];
      uint64_t v14 = [v13 objectAtIndexedSubscript:(int)v11];
      [v14 setCallStatus:v12];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    *a4 = 1;
  }
}

uint64_t __31__PLBBAgent_callStatusChanged___block_invoke_3(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D0E = result;
  return result;
}

uint64_t __31__PLBBAgent_callStatusChanged___block_invoke_1265(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D0F = result;
  return result;
}

- (void)smartDataModeChanged:(id)a3 userEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (([MEMORY[0x1E4F92A38] isBasebandMav] & 1) != 0
    || [MEMORY[0x1E4F92A38] isBasebandProto])
  {
    int64_t v7 = [(PLBBAgent *)self getSubsIdFromCTContext:v6];
    if (v7 != -1)
    {
      int64_t v8 = v7;
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v9 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __46__PLBBAgent_smartDataModeChanged_userEnabled___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        void block[4] = v9;
        if (qword_1EBD59080 != -1) {
          dispatch_once(&qword_1EBD59080, block);
        }
        if (byte_1EBD58D10)
        {
          int v10 = objc_msgSend(NSString, "stringWithFormat:", @"smartDataModeChanged:userEnabled: called with subsId: %d SDMEnable: %d", v8, v4);
          uint64_t v11 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
          id v13 = [v12 lastPathComponent];
          uint64_t v14 = [NSString stringWithUTF8String:"-[PLBBAgent smartDataModeChanged:userEnabled:]"];
          [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:1786];

          id v15 = PLLogCommon();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v18 = v10;
            _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      [(PLBBAgent *)self logDSDSEventForwardSDMwithSubsId:v8 SDMEnable:v4];
    }
  }
}

uint64_t __46__PLBBAgent_smartDataModeChanged_userEnabled___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D10 = result;
  return result;
}

- (id)translateCallStatus:(int)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 < 7) {
    return off_1E692F0B8[a3];
  }
  BOOL v4 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown call status: %d", *(void *)&a3);
  uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
  id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
  int64_t v7 = [v6 lastPathComponent];
  int64_t v8 = [NSString stringWithUTF8String:"-[PLBBAgent translateCallStatus:]"];
  [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:1801];

  uint64_t v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v4;
    _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  return @"Unknown";
}

- (void)logTelephonyRegistrationDSDSAtInit
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLBBAgent_logTelephonyRegistrationDSDSAtInit__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v3;
    if (qword_1EBD59088 != -1) {
      dispatch_once(&qword_1EBD59088, block);
    }
    if (byte_1EBD58D11)
    {
      BOOL v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBAgent logTelephonyRegistrationDSDSAtInit]");
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      int64_t v7 = [v6 lastPathComponent];
      int64_t v8 = [NSString stringWithUTF8String:"-[PLBBAgent logTelephonyRegistrationDSDSAtInit]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:1808];

      uint64_t v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  int v10 = [(PLBBAgent *)self telephonyClient];
  id v23 = 0;
  uint64_t v11 = [v10 getSubscriptionInfoWithError:&v23];
  id v12 = v23;

  if (v11)
  {
    id v13 = [v11 subscriptions];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __47__PLBBAgent_logTelephonyRegistrationDSDSAtInit__block_invoke_1297;
    v22[3] = &unk_1E692EF40;
    v22[4] = self;
    [v13 enumerateObjectsUsingBlock:v22];
  }
  else if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v14 = objc_opt_class();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __47__PLBBAgent_logTelephonyRegistrationDSDSAtInit__block_invoke_1303;
    v21[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v21[4] = v14;
    if (qword_1EBD59098 != -1) {
      dispatch_once(&qword_1EBD59098, v21);
    }
    if (byte_1EBD58D13)
    {
      id v15 = [NSString stringWithFormat:@"Could not determine CoreTelephony Subscription Info. Error: %@", v12];
      uint64_t v16 = (void *)MEMORY[0x1E4F929B8];
      int v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      unint64_t v18 = [v17 lastPathComponent];
      uint64_t v19 = [NSString stringWithUTF8String:"-[PLBBAgent logTelephonyRegistrationDSDSAtInit]"];
      [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:1831];

      BOOL v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = v15;
        _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __47__PLBBAgent_logTelephonyRegistrationDSDSAtInit__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D11 = result;
  return result;
}

void __47__PLBBAgent_logTelephonyRegistrationDSDSAtInit__block_invoke_1297(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 getSubsIdFromCTContext:v4];
  id v6 = [*(id *)(a1 + 32) telephonyClient];
  id v28 = 0;
  int64_t v7 = [v6 getDataStatus:v4 error:&v28];
  id v8 = v28;

  uint64_t v9 = dataIndicatorToString([v7 indicator]);
  int v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "dataBearerSoMask"));
  uint64_t v11 = [*(id *)(a1 + 32) telephonyClient];
  id v27 = v8;
  id v12 = [v11 getLocalizedOperatorName:v4 error:&v27];
  id v13 = v27;

  uint64_t v14 = [*(id *)(a1 + 32) telephonyClient];
  id v26 = v13;
  id v15 = (void *)[v14 copyRegistrationStatus:v4 error:&v26];

  id v16 = v26;
  if (!v16 && v5 != -1)
  {
    v29[0] = @"dataInd";
    v29[1] = @"serviceOpt";
    v30[0] = v9;
    v30[1] = v10;
    v29[2] = @"status";
    int v17 = removeCTPrefixFromString(@"kCTRegistrationStatus", v15);
    v30[2] = v17;
    unint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];

    [*(id *)(a1 + 32) logDSDSEventForwardTelephonyRegistrationWithKVPairs:v18 subsId:v5 andOperator:v12];
LABEL_11:

    goto LABEL_12;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v19 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLBBAgent_logTelephonyRegistrationDSDSAtInit__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v19;
    if (qword_1EBD59090 != -1) {
      dispatch_once(&qword_1EBD59090, block);
    }
    if (byte_1EBD58D12)
    {
      unint64_t v18 = [NSString stringWithFormat:@"Failed to query TelephonyRegistration Messages At Init. Error: %@ SubsId: %d", v16, v5];
      BOOL v24 = (void *)MEMORY[0x1E4F929B8];
      BOOL v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      char v21 = [v20 lastPathComponent];
      uint64_t v22 = [NSString stringWithUTF8String:"-[PLBBAgent logTelephonyRegistrationDSDSAtInit]_block_invoke"];
      [v24 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:1824];

      id v23 = PLLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v18;
        _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_11;
    }
  }
LABEL_12:
}

uint64_t __47__PLBBAgent_logTelephonyRegistrationDSDSAtInit__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D12 = result;
  return result;
}

uint64_t __47__PLBBAgent_logTelephonyRegistrationDSDSAtInit__block_invoke_1303(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D13 = result;
  return result;
}

- (void)logTelephonyActivityDSDSAtInit
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__PLBBAgent_logTelephonyActivityDSDSAtInit__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v3;
    if (qword_1EBD590A0 != -1) {
      dispatch_once(&qword_1EBD590A0, block);
    }
    if (byte_1EBD58D14)
    {
      id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBAgent logTelephonyActivityDSDSAtInit]");
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      int64_t v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLBBAgent logTelephonyActivityDSDSAtInit]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:1836];

      uint64_t v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  int v10 = [(PLBBAgent *)self telephonyClient];
  id v23 = 0;
  uint64_t v11 = [v10 getSubscriptionInfoWithError:&v23];
  id v12 = v23;

  if (v11)
  {
    id v13 = [v11 subscriptions];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __43__PLBBAgent_logTelephonyActivityDSDSAtInit__block_invoke_1304;
    v22[3] = &unk_1E692EF40;
    v22[4] = self;
    [v13 enumerateObjectsUsingBlock:v22];
  }
  else if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v14 = objc_opt_class();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __43__PLBBAgent_logTelephonyActivityDSDSAtInit__block_invoke_1311;
    v21[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v21[4] = v14;
    if (qword_1EBD590B0 != -1) {
      dispatch_once(&qword_1EBD590B0, v21);
    }
    if (byte_1EBD58D16)
    {
      id v15 = [NSString stringWithFormat:@"Could not determine CoreTelephony Subscription Info. Error: %@", v12];
      id v16 = (void *)MEMORY[0x1E4F929B8];
      int v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      unint64_t v18 = [v17 lastPathComponent];
      uint64_t v19 = [NSString stringWithUTF8String:"-[PLBBAgent logTelephonyActivityDSDSAtInit]"];
      [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:1881];

      BOOL v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v15;
        _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __43__PLBBAgent_logTelephonyActivityDSDSAtInit__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D14 = result;
  return result;
}

void __43__PLBBAgent_logTelephonyActivityDSDSAtInit__block_invoke_1304(uint64_t a1, void *a2)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) getSubsIdFromCTContext:v3];
  uint64_t v5 = [MEMORY[0x1E4F23A18] descriptorWithSubscriptionContext:v3];
  id v6 = [*(id *)(a1 + 32) telephonyClient];
  id v65 = 0;
  int64_t v7 = (void *)[v6 copyRadioAccessTechnology:v3 error:&v65];
  id v8 = v65;

  uint64_t v9 = [*(id *)(a1 + 32) dsdsActivityMsgs];
  uint64_t v58 = v4;
  int v10 = [v9 objectAtIndexedSubscript:(int)v4];
  uint64_t v56 = [v10 callStatus];

  uint64_t v11 = [*(id *)(a1 + 32) telephonyClient];
  id v64 = v8;
  id v12 = [v11 getSIMStatus:v3 error:&v64];
  id v13 = v64;

  uint64_t v14 = [*(id *)(a1 + 32) telephonyClient];
  id v63 = v13;
  uint64_t v54 = v3;
  id v15 = [v14 getSignalStrengthInfo:v3 error:&v63];
  id v16 = v63;

  int v17 = [*(id *)(a1 + 32) telephonyClient];
  id v62 = v16;
  uint64_t v59 = (void *)v5;
  unint64_t v18 = [v17 getRatSelectionMask:v5 error:&v62];
  id v19 = v62;

  BOOL v20 = v15;
  char v21 = [v15 bars];
  uint64_t v22 = [*(id *)(a1 + 32) dsdsActivityMsgs];
  id v23 = [v22 objectAtIndexedSubscript:(int)v4];
  [v23 setSignalBars:v21];

  uint64_t v57 = v7;
  BOOL v24 = removeCTPrefixFromString(@"kCTRegistrationRadioAccessTechnology", v7);
  int v25 = [*(id *)(a1 + 32) dsdsActivityMsgs];
  id v26 = [v25 objectAtIndexedSubscript:(int)v4];
  [v26 setCampedRAT:v24];

  uint64_t v55 = v12;
  uint64_t v27 = removeCTPrefixFromString(@"kCTSIMSupportSIMStatus", v12);
  id v28 = [*(id *)(a1 + 32) dsdsActivityMsgs];
  uint64_t v29 = [v28 objectAtIndexedSubscript:(int)v4];
  [v29 setSimStatus:v27];

  uint64_t v30 = [v18 selection];
  uint64_t v31 = removeCTPrefixFromString(@"kCTRegistrationRATSelection", v30);

  if ([v31 isEqualToString:@"NRStandAlone"])
  {
    id v32 = @"NR_SA";
LABEL_5:

    uint64_t v31 = v32;
    goto LABEL_6;
  }
  if ([v31 isEqualToString:@"NRNonStandAlone"])
  {
    id v32 = @"NR_NSA";
    goto LABEL_5;
  }
LABEL_6:
  uint64_t v33 = [*(id *)(a1 + 32) telephonyClient];
  id v61 = v19;
  uint64_t v34 = [v33 smartDataMode:v59 error:&v61];
  id v35 = v61;

  uint64_t v36 = [*(id *)(a1 + 32) dsdsActivityMsgs];
  char v37 = [v36 objectAtIndexedSubscript:(int)v4];
  [v37 setCurrentRAT:v31];

  id v38 = [v18 preferred];
  uint64_t v39 = removeCTPrefixFromString(@"kCTRegistrationRATSelection", v38);
  id v40 = [*(id *)(a1 + 32) dsdsActivityMsgs];
  uint64_t v41 = [v40 objectAtIndexedSubscript:(int)v4];
  [v41 setPreferredRAT:v39];

  if (v35 || v58 == -1)
  {
    uint64_t v46 = v59;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v47 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __43__PLBBAgent_logTelephonyActivityDSDSAtInit__block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v47;
      if (qword_1EBD590A8 != -1) {
        dispatch_once(&qword_1EBD590A8, block);
      }
      if (byte_1EBD58D15)
      {
        char v48 = [NSString stringWithFormat:@"Failed to query TelephonyActivity Messages At Init. Error: %@ SubsId: %d", v35, v58];
        uint64_t v49 = (void *)MEMORY[0x1E4F929B8];
        int64_t v50 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        uint64_t v51 = [v50 lastPathComponent];
        uint64_t v52 = [NSString stringWithUTF8String:"-[PLBBAgent logTelephonyActivityDSDSAtInit]_block_invoke"];
        [v49 logMessage:v48 fromFile:v51 fromFunction:v52 fromLineNumber:1872];

        uint64_t v53 = PLLogCommon();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v67 = v48;
          _os_log_debug_impl(&dword_1D2690000, v53, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        uint64_t v46 = v59;
      }
    }
  }
  else
  {
    int64_t v42 = *(void **)(a1 + 32);
    uint64_t v43 = removeCTPrefixFromString(@"kCTSIMSupportSIMStatus", v55);
    id v44 = [v20 bars];
    uint64_t v45 = removeCTPrefixFromString(@"kCTRegistrationRadioAccessTechnology", v57);
    [v42 logDSDSEventPointTelephonyActivityWithSubsId:v58 context:v54 callStatus:v56 simStatus:v43 signalInfo:v44 RATselection:v18 andCurrCampedRAT:v45];

    uint64_t v46 = v59;
    if ((int)[MEMORY[0x1E4F92A38] kPLBasebandClassOfDevice] >= 1003012) {
      [*(id *)(a1 + 32) logDSDSEventForwardSDMwithSubsId:v58 SDMEnable:v34];
    }
  }
}

uint64_t __43__PLBBAgent_logTelephonyActivityDSDSAtInit__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D15 = result;
  return result;
}

uint64_t __43__PLBBAgent_logTelephonyActivityDSDSAtInit__block_invoke_1311(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D16 = result;
  return result;
}

uint64_t __36__PLBBAgent_getSubsIdFromCTContext___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D17 = result;
  return result;
}

- (void)logDSDSEventForwardTelephonyRegistrationWithKVPairs:(id)a3 subsId:(int64_t)a4 andOperator:(id)a5
{
  uint64_t v8 = *MEMORY[0x1E4F92D30];
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = +[PLOperator entryKeyForType:v8 andName:@"TelephonyRegistration"];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  id v13 = [NSNumber numberWithInteger:a4];
  [v12 setObject:v13 forKeyedSubscript:@"subsId"];

  [v12 setObject:v9 forKeyedSubscript:@"operator"];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__PLBBAgent_logDSDSEventForwardTelephonyRegistrationWithKVPairs_subsId_andOperator___block_invoke;
  v15[3] = &unk_1E692EF68;
  id v16 = v12;
  id v14 = v12;
  [v10 enumerateKeysAndObjectsUsingBlock:v15];

  [(PLBBAgent *)self logEntry:v14];
}

uint64_t __84__PLBBAgent_logDSDSEventForwardTelephonyRegistrationWithKVPairs_subsId_andOperator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

- (void)logDSDSEventPointTelephonyActivityWithSubsId:(int64_t)a3 context:(id)a4 callStatus:(id)a5 simStatus:(id)a6 signalInfo:(id)a7 RATselection:(id)a8 andCurrCampedRAT:(id)a9
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  BOOL v20 = [(PLOperator *)self workQueue];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  void v27[2] = __128__PLBBAgent_logDSDSEventPointTelephonyActivityWithSubsId_context_callStatus_simStatus_signalInfo_RATselection_andCurrCampedRAT___block_invoke;
  v27[3] = &unk_1E692EF90;
  id v28 = v19;
  id v29 = v14;
  uint64_t v30 = self;
  id v31 = v15;
  id v32 = v16;
  id v33 = v17;
  id v34 = v18;
  int64_t v35 = a3;
  id v21 = v18;
  id v22 = v17;
  id v23 = v16;
  id v24 = v15;
  id v25 = v14;
  id v26 = v19;
  dispatch_async(v20, v27);
}

void __128__PLBBAgent_logDSDSEventPointTelephonyActivityWithSubsId_context_callStatus_simStatus_signalInfo_RATselection_andCurrCampedRAT___block_invoke(uint64_t a1)
{
  id v31 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"TelephonyActivity"];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v31];
  uint64_t v3 = *(void *)(a1 + 88);
  uint64_t v4 = [NSNumber numberWithInteger:v3];
  [v2 setObject:v4 forKeyedSubscript:@"subsId"];

  [v2 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"timestamp"];
  [v2 setObject:airplaneModeCurrent forKeyedSubscript:@"airplaneMode"];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    [v2 setObject:v5 forKeyedSubscript:@"callStatus"];
  }
  else if (*(void *)(a1 + 88) != -1)
  {
    id v6 = [*(id *)(a1 + 48) dsdsActivityMsgs];
    int64_t v7 = [v6 objectAtIndexedSubscript:(int)v3];
    uint64_t v8 = [v7 callStatus];
    [v2 setObject:v8 forKeyedSubscript:@"callStatus"];
  }
  uint64_t v9 = *(void *)(a1 + 56);
  if (v9)
  {
    [v2 setObject:v9 forKeyedSubscript:@"simStatus"];
  }
  else if (*(void *)(a1 + 88) != -1)
  {
    id v10 = [*(id *)(a1 + 48) dsdsActivityMsgs];
    uint64_t v11 = [v10 objectAtIndexedSubscript:(int)v3];
    id v12 = [v11 simStatus];
    [v2 setObject:v12 forKeyedSubscript:@"simStatus"];
  }
  uint64_t v13 = *(void *)(a1 + 64);
  if (v13)
  {
    [v2 setObject:v13 forKeyedSubscript:@"signalBars"];
  }
  else if (*(void *)(a1 + 88) != -1)
  {
    id v14 = [*(id *)(a1 + 48) dsdsActivityMsgs];
    id v15 = [v14 objectAtIndexedSubscript:(int)v3];
    id v16 = [v15 signalBars];
    [v2 setObject:v16 forKeyedSubscript:@"signalBars"];
  }
  id v17 = *(void **)(a1 + 72);
  if (v17)
  {
    id v18 = [v17 selection];
    id v19 = removeCTPrefixFromString(@"kCTRegistrationRATSelection", v18);

    if ([v19 isEqualToString:@"NRStandAlone"])
    {
      BOOL v20 = @"NR_SA";
    }
    else
    {
      if (![v19 isEqualToString:@"NRNonStandAlone"])
      {
LABEL_21:
        [v2 setObject:v19 forKeyedSubscript:@"currentRat"];
        id v24 = [*(id *)(a1 + 72) preferred];
        uint64_t v25 = removeCTPrefixFromString(@"kCTRegistrationRATSelection", v24);
        goto LABEL_22;
      }
      BOOL v20 = @"NR_NSA";
    }

    id v19 = v20;
    goto LABEL_21;
  }
  if (*(void *)(a1 + 88) == -1) {
    goto LABEL_23;
  }
  id v21 = [*(id *)(a1 + 48) dsdsActivityMsgs];
  id v22 = [v21 objectAtIndexedSubscript:(int)v3];
  id v23 = [v22 currentRAT];
  [v2 setObject:v23 forKeyedSubscript:@"currentRat"];

  id v19 = [*(id *)(a1 + 48) dsdsActivityMsgs];
  id v24 = [v19 objectAtIndexedSubscript:(int)v3];
  uint64_t v25 = [v24 preferredRAT];
LABEL_22:
  id v26 = (void *)v25;
  [v2 setObject:v25 forKeyedSubscript:@"preferredRat"];

LABEL_23:
  uint64_t v27 = *(void *)(a1 + 80);
  if (v27)
  {
    [v2 setObject:v27 forKeyedSubscript:@"campedRat"];
  }
  else if (*(void *)(a1 + 88) != -1)
  {
    id v28 = [*(id *)(a1 + 48) dsdsActivityMsgs];
    id v29 = [v28 objectAtIndexedSubscript:(int)v3];
    uint64_t v30 = [v29 campedRAT];
    [v2 setObject:v30 forKeyedSubscript:@"campedRat"];
  }
  if (([MEMORY[0x1E4F92A38] isBasebandMav] & 1) != 0
    || [MEMORY[0x1E4F92A38] isBasebandIce])
  {
    [*(id *)(a1 + 48) logEntry:v2];
  }
}

- (void)logDSDSEventForwardSDMwithSubsId:(int64_t)a3 SDMEnable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int64_t v7 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v8 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"SDM"];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v8];
  id v10 = [NSNumber numberWithInteger:a3];
  [v9 setObject:v10 forKeyedSubscript:@"subsId"];

  [v9 setObject:v7 forKeyedSubscript:@"timestamp"];
  uint64_t v11 = [NSNumber numberWithBool:v4];
  [v9 setObject:v11 forKeyedSubscript:@"SDMState"];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v12 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__PLBBAgent_logDSDSEventForwardSDMwithSubsId_SDMEnable___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v12;
    if (qword_1EBD590C0 != -1) {
      dispatch_once(&qword_1EBD590C0, block);
    }
    if (byte_1EBD58D18)
    {
      uint64_t v13 = NSString;
      id v14 = [NSNumber numberWithBool:v4];
      id v15 = [v13 stringWithFormat:@"logDSDSEventForwardSDMwithSubsId: %d SDMEnable: %@", a3, v14];

      id v16 = (void *)MEMORY[0x1E4F929B8];
      id v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      id v18 = [v17 lastPathComponent];
      id v19 = [NSString stringWithUTF8String:"-[PLBBAgent logDSDSEventForwardSDMwithSubsId:SDMEnable:]"];
      [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:2009];

      BOOL v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v15;
        _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(PLBBAgent *)self logEntry:v9];
}

uint64_t __56__PLBBAgent_logDSDSEventForwardSDMwithSubsId_SDMEnable___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D18 = result;
  return result;
}

- (void)setupKICEChannels
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F92960] sharedABMClient];
  [(PLBBAgent *)self setAbmClient:v3];

  BOOL v4 = [(PLBBAgent *)self abmClient];

  if (v4)
  {
    uint64_t v5 = [(PLBBAgent *)self abmClient];
    [v5 setDelegate:self];

    id v6 = [(PLBBAgent *)self abmClient];
    [v6 removeDeviceConfig];

    int v7 = [MEMORY[0x1E4F92A38] isBasebandMav];
    uint64_t v8 = PLLogCommon();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v7)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "Add MAV DeviceConfig for ABM", buf, 2u);
      }

      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v10 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __30__PLBBAgent_setupKICEChannels__block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        void block[4] = v10;
        if (qword_1EBD590C8 != -1) {
          dispatch_once(&qword_1EBD590C8, block);
        }
        if (byte_1EBD58D19)
        {
          uint64_t v11 = [NSString stringWithFormat:@"Add MAV DeviceConfig for ABM"];
          uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
          id v14 = [v13 lastPathComponent];
          id v15 = [NSString stringWithUTF8String:"-[PLBBAgent setupKICEChannels]"];
          [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:2083];

          id v16 = PLLogCommon();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v47 = v11;
            _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      id v17 = [(PLBBAgent *)self abmClient];
      [v17 addMavDeviceConfig];
    }
    else
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "Add ICE DeviceConfig for ABM", buf, 2u);
      }

      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v24 = objc_opt_class();
        uint64_t v40 = MEMORY[0x1E4F143A8];
        uint64_t v41 = 3221225472;
        int64_t v42 = __30__PLBBAgent_setupKICEChannels__block_invoke_1361;
        uint64_t v43 = &__block_descriptor_40_e5_v8__0lu32l8;
        uint64_t v44 = v24;
        if (qword_1EBD590D0 != -1) {
          dispatch_once(&qword_1EBD590D0, &v40);
        }
        if (byte_1EBD58D1A)
        {
          uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"Add ICE DeviceConfig for ABM", v40, v41, v42, v43, v44);
          id v26 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
          id v28 = [v27 lastPathComponent];
          id v29 = [NSString stringWithUTF8String:"-[PLBBAgent setupKICEChannels]"];
          [v26 logMessage:v25 fromFile:v28 fromFunction:v29 fromLineNumber:2095];

          uint64_t v30 = PLLogCommon();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v47 = v25;
            _os_log_debug_impl(&dword_1D2690000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      id v17 = [(PLBBAgent *)self abmClient];
      [v17 addICEDeviceConfig];
    }

    id v31 = [(PLBBAgent *)self abmClient];
    [v31 regMetricListener];

    id v32 = [(PLBBAgent *)self abmClient];
    [v32 regBBWakeListener];

    id v33 = [(PLBBAgent *)self abmClient];
    [v33 regBootStateListener];

    id v34 = [(PLBBAgent *)self abmClient];
    [v34 startListening];

    if ([MEMORY[0x1E4F92A38] isBasebandMav])
    {
      int64_t v35 = +[PLMAVBBMetric sharedInstance];
      uint64_t v36 = v35;
      if (v35)
      {
        [v35 setLogAgent:self];
        [(PLBBAgent *)self registerForMAVModelMetricsNotifications:@"MAV_METRIC_PROD"];
        char v37 = @"PLBBAgentMAVModel";
        id v38 = &unk_1F29E66A0;
LABEL_31:
        [v36 registerForNotifClient:v37 andProfile:v38];
      }
    }
    else
    {
      uint64_t v39 = +[PLICEBBMetric sharedInstance];
      uint64_t v36 = v39;
      if (v39)
      {
        [v39 setLogAgent:self];
        [(PLBBAgent *)self registerForICEModelMetricsNotifications:@"METRIC_PROD"];
        char v37 = @"PLBBAgentICEModel";
        id v38 = &unk_1F29E66B8;
        goto LABEL_31;
      }
    }

    return;
  }
  id v18 = [NSString stringWithFormat:@"Failed to init PLABMClient"];
  id v19 = (void *)MEMORY[0x1E4F929B8];
  BOOL v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
  id v21 = [v20 lastPathComponent];
  id v22 = [NSString stringWithUTF8String:"-[PLBBAgent setupKICEChannels]"];
  [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:2073];

  id v23 = PLLogCommon();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v47 = v18;
    _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  [MEMORY[0x1E4F929C0] debugEnabled];
}

uint64_t __30__PLBBAgent_setupKICEChannels__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D19 = result;
  return result;
}

uint64_t __30__PLBBAgent_setupKICEChannels__block_invoke_1361(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D1A = result;
  return result;
}

- (void)setupKICEChannelsForDebug
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F92960] sharedABMClient];
  BOOL v4 = v3;
  if (v3)
  {
    [v3 setDelegate:self];
    [v4 removeDeviceConfig];
    int v5 = [MEMORY[0x1E4F92A38] isBasebandMav];
    id v6 = PLLogCommon();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEBUG, "Add MAV DeviceConfig for ABM", buf, 2u);
      }

      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v8 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __38__PLBBAgent_setupKICEChannelsForDebug__block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        void block[4] = v8;
        if (qword_1EBD590D8 != -1) {
          dispatch_once(&qword_1EBD590D8, block);
        }
        if (byte_1EBD58D1B)
        {
          BOOL v9 = [NSString stringWithFormat:@"Add MAV DeviceConfigDebug for ABM"];
          uint64_t v10 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
          uint64_t v12 = [v11 lastPathComponent];
          uint64_t v13 = [NSString stringWithUTF8String:"-[PLBBAgent setupKICEChannelsForDebug]"];
          [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:2146];

          id v14 = PLLogCommon();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v41 = v9;
            _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      id v15 = [(PLBBAgent *)self abmClient];
      [v15 addMavDeviceConfigDebug];
    }
    else
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEBUG, "Add ICE DeviceConfig for ABM", buf, 2u);
      }

      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v22 = objc_opt_class();
        uint64_t v34 = MEMORY[0x1E4F143A8];
        uint64_t v35 = 3221225472;
        uint64_t v36 = __38__PLBBAgent_setupKICEChannelsForDebug__block_invoke_1386;
        char v37 = &__block_descriptor_40_e5_v8__0lu32l8;
        uint64_t v38 = v22;
        if (qword_1EBD590E0 != -1) {
          dispatch_once(&qword_1EBD590E0, &v34);
        }
        if (byte_1EBD58D1C)
        {
          id v23 = objc_msgSend(NSString, "stringWithFormat:", @"Add ICE DeviceConfigDebug for ABM", v34, v35, v36, v37, v38);
          uint64_t v24 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
          id v26 = [v25 lastPathComponent];
          uint64_t v27 = [NSString stringWithUTF8String:"-[PLBBAgent setupKICEChannelsForDebug]"];
          [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:2158];

          id v28 = PLLogCommon();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v41 = v23;
            _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      id v15 = [(PLBBAgent *)self abmClient];
      [v15 addICEDeviceConfigDebug];
    }

    [v4 regMetricListener];
    [v4 regBBWakeListener];
    [v4 regBootStateListener];
    [v4 startListening];
    if ([MEMORY[0x1E4F92A38] isBasebandMav])
    {
      id v29 = +[PLMAVBBMetric sharedInstance];
      uint64_t v30 = v29;
      if (v29)
      {
        [v29 setLogAgent:self];
        [(PLBBAgent *)self registerForMAVModelMetricsNotifications:@"MAV_METRIC_PROD"];
        id v31 = @"PLBBAgentMAVModel";
        id v32 = &unk_1F29E66A0;
LABEL_31:
        [v30 registerForNotifClient:v31 andProfile:v32];
      }
    }
    else
    {
      id v33 = +[PLICEBBMetric sharedInstance];
      uint64_t v30 = v33;
      if (v33)
      {
        [v33 setLogAgent:self];
        [(PLBBAgent *)self registerForICEModelMetricsNotifications:@"METRIC_PROD"];
        id v31 = @"PLBBAgentICEModel";
        id v32 = &unk_1F29E66B8;
        goto LABEL_31;
      }
    }

    goto LABEL_33;
  }
  id v16 = [NSString stringWithFormat:@"Failed to init PLABMClient"];
  id v17 = (void *)MEMORY[0x1E4F929B8];
  id v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
  id v19 = [v18 lastPathComponent];
  BOOL v20 = [NSString stringWithUTF8String:"-[PLBBAgent setupKICEChannelsForDebug]"];
  [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:2136];

  id v21 = PLLogCommon();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v41 = v16;
    _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  [MEMORY[0x1E4F929C0] debugEnabled];
LABEL_33:
}

uint64_t __38__PLBBAgent_setupKICEChannelsForDebug__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D1B = result;
  return result;
}

uint64_t __38__PLBBAgent_setupKICEChannelsForDebug__block_invoke_1386(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D1C = result;
  return result;
}

- (void)setupMavABMChannel
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F92960] sharedABMClient];
  [(PLBBAgent *)self setAbmClient:v3];

  BOOL v4 = [(PLBBAgent *)self abmClient];

  if (v4)
  {
    int v5 = [(PLBBAgent *)self abmClient];
    [v5 setDelegate:self];

    id v6 = [(PLBBAgent *)self abmClient];
    [v6 regBBWakeListener];

    BOOL v7 = [(PLBBAgent *)self abmClient];
    [v7 regBootStateListener];

    id v14 = [(PLBBAgent *)self abmClient];
    [v14 startListening];
  }
  else
  {
    uint64_t v8 = [NSString stringWithFormat:@"Failed to init PLABMClient"];
    BOOL v9 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
    uint64_t v11 = [v10 lastPathComponent];
    uint64_t v12 = [NSString stringWithUTF8String:"-[PLBBAgent setupMavABMChannel]"];
    [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:2201];

    uint64_t v13 = PLLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v8;
      _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
}

- (void)registerForICEModelMetricsNotifications:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F92A28];
  id v5 = a3;
  id v6 = [v4 alloc];
  BOOL v7 = [MEMORY[0x1E4F92A88] workQueueForClass:objc_opt_class()];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__PLBBAgent_registerForICEModelMetricsNotifications___block_invoke;
  v10[3] = &unk_1E692A0F0;
  v10[4] = self;
  uint64_t v8 = (PLNSNotificationOperatorComposition *)[v6 initWithWorkQueue:v7 forNotification:v5 withBlock:v10];

  bbICEModelLTEMetricsNotification = self->_bbICEModelLTEMetricsNotification;
  self->_bbICEModelLTEMetricsNotification = v8;
}

uint64_t __53__PLBBAgent_registerForICEModelMetricsNotifications___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) modelBB16Power:a2];
}

- (void)registerForMAVModelMetricsNotifications:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F92A28];
  id v5 = a3;
  id v6 = [v4 alloc];
  BOOL v7 = [MEMORY[0x1E4F92A88] workQueueForClass:objc_opt_class()];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__PLBBAgent_registerForMAVModelMetricsNotifications___block_invoke;
  v10[3] = &unk_1E692A0F0;
  v10[4] = self;
  uint64_t v8 = (PLNSNotificationOperatorComposition *)[v6 initWithWorkQueue:v7 forNotification:v5 withBlock:v10];

  bbICEModelLTEMetricsNotification = self->_bbICEModelLTEMetricsNotification;
  self->_bbICEModelLTEMetricsNotification = v8;
}

- (void)setupTimeUpdateChannel
{
  id v2 = [(PLBBAgent *)self connection];
  [v2 registerCallback:TimeUpdateNotificationCB forTelephonyNotification:*MEMORY[0x1E4F24298]];
}

- (void)setupTelephonyActivityChannels
{
  [(PLBBAgent *)self setSimStatus:CTSIMSupportGetSIMStatus()];
  uint64_t v3 = [(PLBBAgent *)self connection];
  [v3 registerCallback:TelephonyActivityNotificationCB forTelephonyNotification:*MEMORY[0x1E4F23DA8]];

  BOOL v4 = [(PLBBAgent *)self connection];
  [v4 registerCallback:TelephonyActivityNotificationCB forTelephonyNotification:*MEMORY[0x1E4F23CE0]];

  id v5 = [(PLBBAgent *)self connection];
  [v5 registerCallback:TelephonyActivityNotificationCB forTelephonyNotification:*MEMORY[0x1E4F23B38]];

  id v6 = [(PLBBAgent *)self connection];
  [v6 registerCallback:TelephonyActivityNotificationCB forTelephonyNotification:*MEMORY[0x1E4F23B28]];

  BOOL v7 = [(PLBBAgent *)self connection];
  [v7 registerCallback:TelephonyActivityNotificationCB forTelephonyNotification:*MEMORY[0x1E4F23D80]];

  uint64_t v8 = [(PLBBAgent *)self connection];
  [v8 registerCallback:TelephonyActivityNotificationCB forTelephonyNotification:*MEMORY[0x1E4F23E70]];

  BOOL v9 = [(PLBBAgent *)self connection];
  [v9 registerCallback:TelephonyActivityNotificationCB forTelephonyNotification:*MEMORY[0x1E4F23E68]];

  uint64_t v10 = [(PLBBAgent *)self connection];
  [v10 registerCallback:TelephonyActivityNotificationCB forTelephonyNotification:*MEMORY[0x1E4F241E0]];

  [(PLBBAgent *)self setLastReportedSignal:0];
  [(PLBBAgent *)self setInDCH:0];
  [(PLBBAgent *)self setInUTBF:0];
  operatorName = self->_operatorName;
  self->_operatorName = 0;

  [(PLBBAgent *)self setChanged:1];
}

- (BOOL)setupChannel:(id)a3 withLogCodes:(id)a4 andEvents:(id)a5 andExtracode:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v11 count] || objc_msgSend(v12, "count"))
  {
    if (![v10 openWithConnection:self->_connection])
    {
      BOOL v14 = 0;
      goto LABEL_7;
    }
    [v10 enableLogCodes:v11 andEvents:v12 andExtraCode:v13];
  }
  else if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v16 = objc_opt_class();
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    id v26 = __62__PLBBAgent_setupChannel_withLogCodes_andEvents_andExtracode___block_invoke;
    uint64_t v27 = &unk_1E692A830;
    id v28 = @"Critical";
    uint64_t v29 = v16;
    if (qword_1EBD590E8 != -1) {
      dispatch_once(&qword_1EBD590E8, &v24);
    }
    int v17 = byte_1EBD58D1D;

    if (v17)
    {
      id v18 = objc_msgSend(NSString, "stringWithFormat:", @"Empty log and event codes - leaving channel disabled", v24, v25, v26, v27);
      id v19 = (void *)MEMORY[0x1E4F929B8];
      BOOL v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      id v21 = [v20 lastPathComponent];
      uint64_t v22 = [NSString stringWithUTF8String:"-[PLBBAgent setupChannel:withLogCodes:andEvents:andExtracode:]"];
      [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:2283];

      id v23 = PLLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v18;
        _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  BOOL v14 = 1;
LABEL_7:

  return v14;
}

uint64_t __62__PLBBAgent_setupChannel_withLogCodes_andEvents_andExtracode___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  byte_1EBD58D1D = result;
  return result;
}

- (void)setupBBChannelsWithAction:(int64_t)a3
{
  uint64_t v237 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [(PLBBAgent *)self setLastBBActivityTimestamp:v5];

  id v127 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v125 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v126 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(PLBBAgent *)self logEventNoneBBReportBy:0 withAction:a3];
  id v6 = (PLBasebandLogChannel *)objc_opt_new();
  cachedChannel = self->cachedChannel;
  self->cachedChannel = v6;

  [(PLBasebandLogChannel *)self->cachedChannel setDelegate:self];
  v128 = self;
  [(PLBasebandLogChannel *)self->cachedChannel setCachingEnabled:1];
  uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
  BOOL v9 = [NSNumber numberWithInt:45452];
  uint64_t v129 = objc_msgSend(v8, "arrayWithObjects:", v9, 0);

  id v10 = (void *)MEMORY[0x1E4F1C978];
  id v11 = [NSNumber numberWithInt:28978];
  id v12 = [NSNumber numberWithInt:45309];
  id v13 = [NSNumber numberWithInt:45310];
  BOOL v14 = [NSNumber numberWithInt:45311];
  v135 = objc_msgSend(v10, "arrayWithObjects:", v11, v12, v13, v14, 0);

  id v15 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v16 = [NSNumber numberWithInt:311];
  int v17 = [NSNumber numberWithInt:389];
  id v18 = [NSNumber numberWithInt:424];
  id v19 = [NSNumber numberWithInt:571];
  uint64_t v133 = objc_msgSend(v15, "arrayWithObjects:", v16, v17, v18, v19, 0);

  BOOL v20 = (void *)MEMORY[0x1E4F1C978];
  id v21 = [NSNumber numberWithInt:629];
  uint64_t v22 = [NSNumber numberWithInt:630];
  id v23 = [NSNumber numberWithInt:631];
  v130 = objc_msgSend(v20, "arrayWithObjects:", v21, v22, v23, 0);

  uint64_t v24 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v25 = [NSNumber numberWithInt:621];
  id v26 = [NSNumber numberWithInt:622];
  v148 = objc_msgSend(v24, "arrayWithObjects:", v25, v26, 0);

  v152 = (void *)MEMORY[0x1E4F1C978];
  v229 = [NSNumber numberWithInt:275];
  v226 = [NSNumber numberWithInt:301];
  v223 = [NSNumber numberWithInt:302];
  v220 = [NSNumber numberWithInt:303];
  v217 = [NSNumber numberWithInt:312];
  v214 = [NSNumber numberWithInt:320];
  v211 = [NSNumber numberWithInt:324];
  v205 = [NSNumber numberWithInt:325];
  v208 = [NSNumber numberWithInt:336];
  v190 = [NSNumber numberWithInt:338];
  v202 = [NSNumber numberWithInt:349];
  v184 = [NSNumber numberWithInt:350];
  v199 = [NSNumber numberWithInt:351];
  v196 = [NSNumber numberWithInt:360];
  v193 = [NSNumber numberWithInt:362];
  v187 = [NSNumber numberWithInt:370];
  v175 = [NSNumber numberWithInt:375];
  v181 = [NSNumber numberWithInt:393];
  v149 = [NSNumber numberWithInt:414];
  v178 = [NSNumber numberWithInt:425];
  v146 = [NSNumber numberWithInt:427];
  v172 = [NSNumber numberWithInt:433];
  v169 = [NSNumber numberWithInt:434];
  v142 = [NSNumber numberWithInt:445];
  v166 = [NSNumber numberWithInt:446];
  v139 = [NSNumber numberWithInt:530];
  v163 = [NSNumber numberWithInt:531];
  v160 = [NSNumber numberWithInt:532];
  v157 = [NSNumber numberWithInt:533];
  v154 = [NSNumber numberWithInt:635];
  v136 = [NSNumber numberWithInt:897];
  v131 = [NSNumber numberWithInt:1049];
  v123 = [NSNumber numberWithInt:1119];
  uint64_t v27 = [NSNumber numberWithInt:1121];
  v121 = [NSNumber numberWithInt:1299];
  id v28 = [NSNumber numberWithInt:1300];
  uint64_t v29 = [NSNumber numberWithInt:1301];
  uint64_t v30 = [NSNumber numberWithInt:1549];
  id v31 = [NSNumber numberWithInt:1550];
  objc_msgSend(v152, "arrayWithObjects:", v229, v226, v223, v220, v217, v214, v211, v205, v208, v190, v202, v184, v199, v196, v193, v187, v175,
    v181,
    v149,
    v178,
    v146,
    v172,
    v169,
    v142,
    v166,
    v139,
    v163,
    v160,
    v157,
    v154,
    v136,
    v131,
    v123,
    v27,
    v121,
    v28,
    v29,
    v30,
    v31,
  v134 = 0);

  uint64_t v32 = (void *)MEMORY[0x1E4F1C978];
  id v33 = [NSNumber numberWithInt:1606];
  uint64_t v34 = [NSNumber numberWithInt:1130];
  uint64_t v35 = [NSNumber numberWithInt:1924];
  v153 = objc_msgSend(v32, "arrayWithObjects:", v33, v34, v35, 0);

  v161 = (void *)MEMORY[0x1E4F1C978];
  v230 = [NSNumber numberWithInt:1889];
  v227 = [NSNumber numberWithInt:1890];
  v224 = [NSNumber numberWithInt:1607];
  v218 = [NSNumber numberWithInt:1608];
  v221 = [NSNumber numberWithInt:1930];
  v203 = [NSNumber numberWithInt:1931];
  v215 = [NSNumber numberWithInt:1970];
  v197 = [NSNumber numberWithInt:1971];
  v212 = [NSNumber numberWithInt:1989];
  v209 = [NSNumber numberWithInt:1990];
  v206 = [NSNumber numberWithInt:415];
  v200 = [NSNumber numberWithInt:564];
  v188 = [NSNumber numberWithInt:619];
  v194 = [NSNumber numberWithInt:1010];
  v185 = [NSNumber numberWithInt:1210];
  v191 = [NSNumber numberWithInt:565];
  v158 = [NSNumber numberWithInt:1496];
  v182 = [NSNumber numberWithInt:1497];
  v179 = [NSNumber numberWithInt:1223];
  v155 = [NSNumber numberWithInt:1224];
  v176 = [NSNumber numberWithInt:1226];
  v150 = [NSNumber numberWithInt:1227];
  v173 = [NSNumber numberWithInt:1604];
  v170 = [NSNumber numberWithInt:538];
  v167 = [NSNumber numberWithInt:1072];
  v164 = [NSNumber numberWithInt:1036];
  v143 = [NSNumber numberWithInt:300];
  v140 = [NSNumber numberWithInt:1120];
  uint64_t v36 = [NSNumber numberWithInt:1076];
  char v37 = [NSNumber numberWithInt:1465];
  v137 = [NSNumber numberWithInt:1466];
  uint64_t v38 = [NSNumber numberWithInt:2260];
  uint64_t v39 = [NSNumber numberWithInt:2261];
  uint64_t v40 = [NSNumber numberWithInt:2262];
  uint64_t v41 = [NSNumber numberWithInt:2284];
  objc_msgSend(v161, "arrayWithObjects:", v230, v227, v224, v218, v221, v203, v215, v197, v212, v209, v206, v200, v188, v194, v185, v191, v158,
    v182,
    v179,
    v155,
    v176,
    v150,
    v173,
    v170,
    v167,
    v164,
    v143,
    v140,
    v36,
    v37,
    v137,
    v38,
    v39,
    v40,
    v41,
  v147 = 0);

  uint64_t v42 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v43 = [NSNumber numberWithInt:2275];
  uint64_t v44 = [NSNumber numberWithInt:2274];
  uint64_t v45 = [NSNumber numberWithInt:2276];
  uint64_t v46 = [NSNumber numberWithInt:2265];
  v151 = objc_msgSend(v42, "arrayWithObjects:", v43, v44, v45, v46, 0);

  uint64_t v47 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v48 = [NSNumber numberWithInt:6144];
  uint64_t v49 = [NSNumber numberWithInt:16678];
  int64_t v50 = [NSNumber numberWithInt:33];
  uint64_t v51 = [NSNumber numberWithInt:34];
  uint64_t v52 = [NSNumber numberWithInt:35];
  uint64_t v53 = [NSNumber numberWithInt:36];
  uint64_t v54 = [NSNumber numberWithInt:37];
  v132 = objc_msgSend(v47, "arrayWithObjects:", v48, v49, v50, v51, v52, v53, v54, 0);

  uint64_t v55 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v56 = [NSNumber numberWithInt:1];
  v231 = objc_msgSend(v55, "arrayWithObjects:", v56, 0);

  uint64_t v57 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v58 = [NSNumber numberWithInt:2011];
  uint64_t v59 = [NSNumber numberWithInt:2471];
  v60 = [NSNumber numberWithInt:2472];
  id v61 = [NSNumber numberWithInt:2473];
  v141 = objc_msgSend(v57, "arrayWithObjects:", v58, v59, v60, v61, 0);

  id v62 = (void *)MEMORY[0x1E4F1C978];
  id v63 = [NSNumber numberWithInt:3];
  v138 = objc_msgSend(v62, "arrayWithObjects:", v63, 0);

  v144 = (void *)MEMORY[0x1E4F1C978];
  v228 = [NSNumber numberWithInt:316];
  v225 = [NSNumber numberWithInt:2258];
  v222 = [NSNumber numberWithInt:2273];
  v219 = [NSNumber numberWithInt:2270];
  v216 = [NSNumber numberWithInt:2271];
  v213 = [NSNumber numberWithInt:2279];
  v207 = [NSNumber numberWithInt:1615];
  v210 = [NSNumber numberWithInt:2287];
  v192 = [NSNumber numberWithInt:625];
  v204 = [NSNumber numberWithInt:1613];
  v186 = [NSNumber numberWithInt:1614];
  v201 = [NSNumber numberWithInt:2006];
  v198 = [NSNumber numberWithInt:2007];
  v195 = [NSNumber numberWithInt:2028];
  v189 = [NSNumber numberWithInt:2029];
  v177 = [NSNumber numberWithInt:2131];
  v183 = [NSNumber numberWithInt:2176];
  v124 = [NSNumber numberWithInt:2177];
  v180 = [NSNumber numberWithInt:2244];
  v122 = [NSNumber numberWithInt:2245];
  v174 = [NSNumber numberWithInt:1807];
  v171 = [NSNumber numberWithInt:1808];
  v120 = [NSNumber numberWithInt:2476];
  v168 = [NSNumber numberWithInt:2477];
  v119 = [NSNumber numberWithInt:2478];
  v165 = [NSNumber numberWithInt:567];
  v162 = [NSNumber numberWithInt:568];
  v159 = [NSNumber numberWithInt:1013];
  v156 = [NSNumber numberWithInt:1131];
  v118 = [NSNumber numberWithInt:1132];
  v117 = [NSNumber numberWithInt:2288];
  v116 = [NSNumber numberWithInt:2289];
  id v64 = [NSNumber numberWithInt:2290];
  v115 = [NSNumber numberWithInt:2493];
  id v65 = [NSNumber numberWithInt:2494];
  v66 = [NSNumber numberWithInt:2485];
  v67 = [NSNumber numberWithInt:2486];
  uint64_t v68 = [NSNumber numberWithInt:2488];
  objc_msgSend(v144, "arrayWithObjects:", v228, v225, v222, v219, v216, v213, v207, v210, v192, v204, v186, v201, v198, v195, v189, v177, v183,
    v124,
    v180,
    v122,
    v174,
    v171,
    v120,
    v168,
    v119,
    v165,
    v162,
    v159,
    v156,
    v118,
    v117,
    v116,
    v64,
    v115,
    v65,
    v66,
    v67,
    v68,
  v145 = 0);

  uint64_t v69 = (void *)MEMORY[0x1E4F1C978];
  v70 = [NSNumber numberWithInt:2521];
  v71 = [NSNumber numberWithInt:2549];
  v72 = [NSNumber numberWithInt:2555];
  uint64_t v73 = [NSNumber numberWithInt:2556];
  uint64_t v74 = [NSNumber numberWithInt:2557];
  v75 = [NSNumber numberWithInt:2558];
  v76 = [NSNumber numberWithInt:2559];
  uint64_t v77 = [NSNumber numberWithInt:2560];
  v78 = objc_msgSend(v69, "arrayWithObjects:", v70, v71, v72, v73, v74, v75, v76, v77, 0);

  v79 = (void *)v129;
  [v125 addObjectsFromArray:v231];
  int v80 = [MEMORY[0x1E4F92A38] kPLBasebandClassOfDevice];
  if ((v80 - 1003001) < 5 || v80 == 1003007) {
    [v125 addObjectsFromArray:v129];
  }
  v81 = (void *)v133;
  v82 = v128;
  if ([MEMORY[0x1E4F929C0] fullMode])
  {
    int v83 = [MEMORY[0x1E4F92A38] kPLBasebandClassOfDevice];
    if ((v83 - 1003002) >= 4)
    {
      uint64_t v84 = v135;
      if (v83 == 1003001) {
        goto LABEL_6;
      }
      if (v83 != 1003007) {
        goto LABEL_7;
      }
    }
    [v125 addObjectsFromArray:v135];
    uint64_t v84 = v132;
LABEL_6:
    [v125 addObjectsFromArray:v84];
  }
LABEL_7:
  [v127 addObjectsFromArray:v133];
  int v85 = [MEMORY[0x1E4F92A38] kPLBasebandClassOfDevice];
  if ((v85 - 1003002) < 4 || v85 == 1003007)
  {
    [v127 addObjectsFromArray:v153];
    [v127 addObjectsFromArray:v151];
    [v127 addObjectsFromArray:v141];
    id v86 = v126;
    uint64_t v87 = v138;
LABEL_9:
    [v86 addObjectsFromArray:v87];
    goto LABEL_10;
  }
  if (v85 == 1003001)
  {
    [v127 addObjectsFromArray:v153];
    [v127 addObjectsFromArray:v151];
    id v86 = v127;
    uint64_t v87 = v130;
    goto LABEL_9;
  }
LABEL_10:
  if ([MEMORY[0x1E4F929C0] fullMode])
  {
    [v127 addObjectsFromArray:v134];
    int v88 = [MEMORY[0x1E4F92A38] kPLBasebandClassOfDevice];
    v90 = v145;
    v89 = v147;
    v91 = v147;
    v92 = v148;
    switch(v88)
    {
      case 1003001:
        goto LABEL_14;
      case 1003002:
        goto LABEL_13;
      case 1003003:
      case 1003004:
      case 1003005:
      case 1003007:
        [v127 addObjectsFromArray:v147];
        v91 = v145;
        v90 = v148;
        v92 = v78;
LABEL_13:
        [v127 addObjectsFromArray:v91];
        v89 = v90;
LABEL_14:
        [v127 addObjectsFromArray:v89];
        [v127 addObjectsFromArray:v92];
        break;
      default:
        break;
    }
  }
  if ([(PLBBAgent *)v128 setupChannel:v128->cachedChannel withLogCodes:v125 andEvents:v127 andExtracode:v126])
  {
    [(PLBasebandLogChannel *)v128->cachedChannel setChannelTimeout:10.0];
    v93 = [NSNumber numberWithInt:1];
    int v94 = [v125 containsObject:v93];

    if (v94)
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v95 = objc_opt_class();
        v233[0] = MEMORY[0x1E4F143A8];
        v233[1] = 3221225472;
        v233[2] = __39__PLBBAgent_setupBBChannelsWithAction___block_invoke_1403;
        v233[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v233[4] = v95;
        if (qword_1EBD590F8 != -1) {
          dispatch_once(&qword_1EBD590F8, v233);
        }
        if (byte_1EBD58D1F)
        {
          v96 = [NSString stringWithFormat:@"Hw log level %d, win size %d", 6, 420000];
          v97 = (void *)MEMORY[0x1E4F929B8];
          v98 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
          v99 = [v98 lastPathComponent];
          v100 = [NSString stringWithUTF8String:"-[PLBBAgent setupBBChannelsWithAction:]"];
          [v97 logMessage:v96 fromFile:v99 fromFunction:v100 fromLineNumber:2624];

          v101 = PLLogCommon();
          if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v236 = v96;
            _os_log_debug_impl(&dword_1D2690000, v101, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v82 = v128;
          v79 = (void *)v129;
          v81 = (void *)v133;
        }
      }
      [(PLBasebandLogChannel *)v82->cachedChannel setHardwareLoggingLevel:6 withWindowSize:420000];
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v102 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __39__PLBBAgent_setupBBChannelsWithAction___block_invoke_1409;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v102;
      if (qword_1EBD59100 != -1) {
        dispatch_once(&qword_1EBD59100, block);
      }
      if (byte_1EBD58D20)
      {
        v103 = v79;
        v104 = [NSString stringWithFormat:@"Initializing BB channels complete"];
        v105 = (void *)MEMORY[0x1E4F929B8];
        v106 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        v107 = [v106 lastPathComponent];
        v108 = [NSString stringWithUTF8String:"-[PLBBAgent setupBBChannelsWithAction:]"];
        [v105 logMessage:v104 fromFile:v107 fromFunction:v108 fromLineNumber:2629];

        v109 = PLLogCommon();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v236 = v104;
LABEL_47:
          _os_log_debug_impl(&dword_1D2690000, v109, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          goto LABEL_36;
        }
        goto LABEL_36;
      }
    }
  }
  else
  {
    [(PLBBAgent *)v128 scheduleReconnect];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v110 = objc_opt_class();
      v234[0] = MEMORY[0x1E4F143A8];
      v234[1] = 3221225472;
      v234[2] = __39__PLBBAgent_setupBBChannelsWithAction___block_invoke;
      v234[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v234[4] = v110;
      if (qword_1EBD590F0 != -1) {
        dispatch_once(&qword_1EBD590F0, v234);
      }
      if (byte_1EBD58D1E)
      {
        v103 = (void *)v129;
        v104 = [NSString stringWithFormat:@"ERROR: need to schedule reconnect"];
        v111 = (void *)MEMORY[0x1E4F929B8];
        v112 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        v113 = [v112 lastPathComponent];
        v114 = [NSString stringWithUTF8String:"-[PLBBAgent setupBBChannelsWithAction:]"];
        [v111 logMessage:v104 fromFile:v113 fromFunction:v114 fromLineNumber:2616];

        v109 = PLLogCommon();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v236 = v104;
          goto LABEL_47;
        }
LABEL_36:
        v79 = v103;
        v81 = (void *)v133;
      }
    }
  }
}

uint64_t __39__PLBBAgent_setupBBChannelsWithAction___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D1E = result;
  return result;
}

uint64_t __39__PLBBAgent_setupBBChannelsWithAction___block_invoke_1403(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D1F = result;
  return result;
}

uint64_t __39__PLBBAgent_setupBBChannelsWithAction___block_invoke_1409(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D20 = result;
  return result;
}

- (id)setupIOKitNotifications
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    mach_port_t v3 = *MEMORY[0x1E4F2EF00];
    BOOL v4 = IONotificationPortCreate(*MEMORY[0x1E4F2EF00]);
    self->ioNotifyPort = v4;
    id v5 = [(PLOperator *)self workQueue];
    IONotificationPortSetDispatchQueue(v4, v5);

    CFDictionaryRef v6 = IOServiceMatching("AppleBaseband");
    io_service_t MatchingService = IOServiceGetMatchingService(v3, v6);
    self->baseband_service = MatchingService;
    int v8 = [MEMORY[0x1E4F929C0] debugEnabled];
    if (!MatchingService)
    {
      if (!v8) {
        goto LABEL_23;
      }
      uint64_t v25 = objc_opt_class();
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __36__PLBBAgent_setupIOKitNotifications__block_invoke;
      v42[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v42[4] = v25;
      if (qword_1EBD59108 != -1) {
        dispatch_once(&qword_1EBD59108, v42);
      }
      if (!byte_1EBD58D21) {
        goto LABEL_23;
      }
      id v19 = objc_msgSend(NSString, "stringWithFormat:", @"Could not find %s service\n", "AppleBaseband");
      id v26 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      id v28 = [v27 lastPathComponent];
      uint64_t v29 = [NSString stringWithUTF8String:"-[PLBBAgent setupIOKitNotifications]"];
      [v26 logMessage:v19 fromFile:v28 fromFunction:v29 fromLineNumber:2642];

      uint64_t v24 = PLLogCommon();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v44 = v19;
      goto LABEL_36;
    }
    if (v8)
    {
      uint64_t v9 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __36__PLBBAgent_setupIOKitNotifications__block_invoke_1419;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v9;
      if (qword_1EBD59110 != -1) {
        dispatch_once(&qword_1EBD59110, block);
      }
      if (byte_1EBD58D22)
      {
        id v10 = [NSString stringWithFormat:@"found matching service for baseband"];
        id v11 = (void *)MEMORY[0x1E4F929B8];
        id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        id v13 = [v12 lastPathComponent];
        BOOL v14 = [NSString stringWithUTF8String:"-[PLBBAgent setupIOKitNotifications]"];
        [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:2645];

        id v15 = PLLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v44 = v10;
          _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    uint64_t v16 = IOServiceAddInterestNotification(self->ioNotifyPort, self->baseband_service, "IOGeneralInterest", (IOServiceInterestCallback)BasebandResetCallback, self, &self->notificationRef);
    int v17 = [MEMORY[0x1E4F929C0] debugEnabled];
    if (v16)
    {
      if (!v17) {
        goto LABEL_23;
      }
      uint64_t v18 = objc_opt_class();
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __36__PLBBAgent_setupIOKitNotifications__block_invoke_1426;
      v40[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v40[4] = v18;
      if (qword_1EBD59118 != -1) {
        dispatch_once(&qword_1EBD59118, v40);
      }
      if (!byte_1EBD58D23) {
        goto LABEL_23;
      }
      id v19 = objc_msgSend(NSString, "stringWithFormat:", @"Error calling IOServiceAddInterestNotification (0x%08x)", v16);
      BOOL v20 = (void *)MEMORY[0x1E4F929B8];
      id v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      uint64_t v22 = [v21 lastPathComponent];
      id v23 = [NSString stringWithUTF8String:"-[PLBBAgent setupIOKitNotifications]"];
      [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:2652];

      uint64_t v24 = PLLogCommon();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
LABEL_22:

LABEL_23:
        uint64_t v30 = 0;
        goto LABEL_32;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v44 = v19;
LABEL_36:
      _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      goto LABEL_22;
    }
    if (v17)
    {
      uint64_t v31 = objc_opt_class();
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __36__PLBBAgent_setupIOKitNotifications__block_invoke_1432;
      v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v39[4] = v31;
      if (qword_1EBD59120 != -1) {
        dispatch_once(&qword_1EBD59120, v39);
      }
      if (byte_1EBD58D24)
      {
        uint64_t v32 = [NSString stringWithFormat:@"Subscribed to notification for baseband"];
        id v33 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        uint64_t v35 = [v34 lastPathComponent];
        uint64_t v36 = [NSString stringWithUTF8String:"-[PLBBAgent setupIOKitNotifications]"];
        [v33 logMessage:v32 fromFile:v35 fromFunction:v36 fromLineNumber:2655];

        char v37 = PLLogCommon();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v44 = v32;
          _os_log_debug_impl(&dword_1D2690000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
  uint64_t v30 = self;
LABEL_32:
  return v30;
}

uint64_t __36__PLBBAgent_setupIOKitNotifications__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D21 = result;
  return result;
}

uint64_t __36__PLBBAgent_setupIOKitNotifications__block_invoke_1419(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D22 = result;
  return result;
}

uint64_t __36__PLBBAgent_setupIOKitNotifications__block_invoke_1426(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D23 = result;
  return result;
}

uint64_t __36__PLBBAgent_setupIOKitNotifications__block_invoke_1432(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D24 = result;
  return result;
}

- (BOOL)isTimeToRequestReport
{
  mach_port_t v3 = [(PLBBAgent *)self lastReportRequestDate];

  if (v3)
  {
    BOOL v4 = [(PLBBAgent *)self lastReportRequestDate];
    [v4 timeIntervalSinceNow];
    double v6 = v5;

    if (v6 >= -300.0)
    {
      uint64_t v7 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __34__PLBBAgent_isTimeToRequestReport__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v7;
      if (qword_1EBD59128 != -1) {
        dispatch_once(&qword_1EBD59128, block);
      }
      if (!byte_1EBD58D25) {
        return 0;
      }
      int v8 = [(PLBBAgent *)self lastReportRequestDate];
      [v8 timeIntervalSinceNow];
      double v10 = v9;

      if (v10 >= -30.0) {
        return 0;
      }
    }
  }
  id v11 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [(PLBBAgent *)self setLastReportRequestDate:v11];

  return 1;
}

uint64_t __34__PLBBAgent_isTimeToRequestReport__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D25 = result;
  return result;
}

- (void)cacheCommitTimerFired
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __34__PLBBAgent_cacheCommitTimerFired__block_invoke;
    id v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v14 = v3;
    if (qword_1EBD59130 != -1) {
      dispatch_once(&qword_1EBD59130, &block);
    }
    if (byte_1EBD58D26)
    {
      BOOL v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBAgent cacheCommitTimerFired]", block, v11, v12, v13, v14);
      double v5 = (void *)MEMORY[0x1E4F929B8];
      double v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      uint64_t v7 = [v6 lastPathComponent];
      int v8 = [NSString stringWithUTF8String:"-[PLBBAgent cacheCommitTimerFired]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:2688];

      double v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(PLBBAgent *)self logEventNoneBBReportBy:1 withAction:3];
}

uint64_t __34__PLBBAgent_cacheCommitTimerFired__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D26 = result;
  return result;
}

- (void)scheduleFlushPostCacheCommit
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __41__PLBBAgent_scheduleFlushPostCacheCommit__block_invoke;
    v13[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v13[4] = v3;
    if (qword_1EBD59138 != -1) {
      dispatch_once(&qword_1EBD59138, v13);
    }
    if (byte_1EBD58D27)
    {
      BOOL v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBAgent scheduleFlushPostCacheCommit]");
      double v5 = (void *)MEMORY[0x1E4F929B8];
      double v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      uint64_t v7 = [v6 lastPathComponent];
      int v8 = [NSString stringWithUTF8String:"-[PLBBAgent scheduleFlushPostCacheCommit]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:2694];

      double v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  dispatch_time_t v10 = dispatch_time(0, 30000000000);
  uint64_t v11 = [(PLOperator *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PLBBAgent_scheduleFlushPostCacheCommit__block_invoke_1436;
  block[3] = &unk_1E692A250;
  void block[4] = self;
  dispatch_after(v10, v11, block);
}

uint64_t __41__PLBBAgent_scheduleFlushPostCacheCommit__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D27 = result;
  return result;
}

uint64_t __41__PLBBAgent_scheduleFlushPostCacheCommit__block_invoke_1436(uint64_t a1)
{
  return [*(id *)(a1 + 32) logEventNoneBBReportBy:2 withAction:4];
}

- (void)initCacheCommitTimer
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__PLBBAgent_initCacheCommitTimer__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v3;
    if (qword_1EBD59140 != -1) {
      dispatch_once(&qword_1EBD59140, block);
    }
    if (byte_1EBD58D28)
    {
      BOOL v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBAgent initCacheCommitTimer]");
      double v5 = (void *)MEMORY[0x1E4F929B8];
      double v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      uint64_t v7 = [v6 lastPathComponent];
      int v8 = [NSString stringWithUTF8String:"-[PLBBAgent initCacheCommitTimer]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:2704];

      double v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v17 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v10 = objc_alloc(MEMORY[0x1E4F92A80]);
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:300.0];
  id v12 = [(PLOperator *)self workQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __33__PLBBAgent_initCacheCommitTimer__block_invoke_1437;
  v14[3] = &unk_1E692A200;
  v14[4] = self;
  id v13 = (void *)[v10 initWithFireDate:v11 withInterval:1 withTolerance:0 repeats:v12 withUserInfo:v14 withQueue:300.0 withBlock:0.0];
  [(PLBBAgent *)self setCacheCommitTimer:v13];
}

uint64_t __33__PLBBAgent_initCacheCommitTimer__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D28 = result;
  return result;
}

uint64_t __33__PLBBAgent_initCacheCommitTimer__block_invoke_1437(uint64_t a1)
{
  [*(id *)(a1 + 32) cacheCommitTimerFired];
  id v2 = *(void **)(a1 + 32);
  return [v2 scheduleFlushPostCacheCommit];
}

- (void)cancelCacheCommitTimer
{
  id v2 = [(PLBBAgent *)self cacheCommitTimer];
  [v2 setTimerActive:0];
}

- (void)resetCacheCommitTimer
{
  id v3 = [(PLBBAgent *)self cacheCommitTimer];
  id v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:300.0];
  [v3 setFireDate:v2];
}

- (void)initOperatorDependancies
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__PLBBAgent_initOperatorDependancies__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v3;
    if (qword_1EBD59148 != -1) {
      dispatch_once(&qword_1EBD59148, block);
    }
    if (byte_1EBD58D29)
    {
      BOOL v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBAgent initOperatorDependancies]");
      double v5 = (void *)MEMORY[0x1E4F929B8];
      double v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      uint64_t v7 = [v6 lastPathComponent];
      int v8 = [NSString stringWithUTF8String:"-[PLBBAgent initOperatorDependancies]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:2726];

      double v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v102 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v10 = [MEMORY[0x1E4F1CA48] array];
  [(PLBBAgent *)self setDsdsRegMsgs:v10];

  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  [(PLBBAgent *)self setDsdsActivityMsgs:v11];

  int v12 = 4;
  do
  {
    id v13 = [(PLBBAgent *)self dsdsRegMsgs];
    uint64_t v14 = objc_alloc_init(PLBBTelephonyDsdsRegMsg);
    [v13 addObject:v14];

    id v15 = [(PLBBAgent *)self dsdsActivityMsgs];
    uint64_t v16 = objc_alloc_init(PLBBTelephonyDsdsActivityMsg);
    [v15 addObject:v16];

    --v12;
  }
  while (v12);
  if ([MEMORY[0x1E4F92A38] isBasebandDSDS])
  {
    uint64_t v17 = (OS_dispatch_queue *)dispatch_queue_create("Telephony Client Queue", 0);
    telephonyClientQueue = self->_telephonyClientQueue;
    self->_telephonyClientQueue = v17;

    id v19 = objc_alloc(MEMORY[0x1E4F23A80]);
    BOOL v20 = [(PLBBAgent *)self telephonyClientQueue];
    id v21 = (CoreTelephonyClient *)[v19 initWithQueue:v20];
    telephonyClient = self->_telephonyClient;
    self->_telephonyClient = v21;

    [(CoreTelephonyClient *)self->_telephonyClient setDelegate:self];
    id v23 = (void *)MEMORY[0x1E4FADA90];
    uint64_t v24 = [(PLBBAgent *)self telephonyClientQueue];
    uint64_t v25 = [v23 callCenterWithQueue:v24];
    callCenter = self->_callCenter;
    self->_callCenter = v25;

    uint64_t v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v27 addObserver:self selector:sel_callStatusChanged_ name:*MEMORY[0x1E4FADD90] object:0];
  }
  self->_isBBOOS = 0;
  self->_isFirstTimeAccountingOOS = 1;
  self->_isBBDataStandard = 1;
  [(PLBBAgent *)self logBasebandConfig];
  [(PLBBAgent *)self setupTelephonyRegistrationChannels];
  [(PLBBAgent *)self setupTelephonyActivityChannels];
  [(PLBBAgent *)self setupTimeUpdateChannel];
  if (([MEMORY[0x1E4F92A38] isBasebandProto] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isBasebandMav] & 1) != 0
    || [MEMORY[0x1E4F92A38] isBasebandIce])
  {
    v91[0] = MEMORY[0x1E4F143A8];
    v91[1] = 3221225472;
    v91[2] = __37__PLBBAgent_initOperatorDependancies__block_invoke_1447;
    v91[3] = &unk_1E692A0F0;
    v91[4] = self;
    id v28 = [MEMORY[0x1E4F929E8] significantBatteryChangeNotificationWithOperator:self withBlock:v91];
    batteryLevelChanged = self->_batteryLevelChanged;
    self->_batteryLevelChanged = v28;

    [(PLBBAgent *)self setupKICEChannels];
LABEL_16:
    [(PLBBAgent *)self setAgentInited:1];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v30 = objc_opt_class();
      v89[0] = MEMORY[0x1E4F143A8];
      v89[1] = 3221225472;
      v89[2] = __37__PLBBAgent_initOperatorDependancies__block_invoke_1455;
      v89[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v89[4] = v30;
      if (qword_1EBD59158 != -1) {
        dispatch_once(&qword_1EBD59158, v89);
      }
      if (byte_1EBD58D2B)
      {
        uint64_t v31 = [NSString stringWithFormat:@"Setup TelephonyRegistration init"];
        uint64_t v32 = (void *)MEMORY[0x1E4F929B8];
        id v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        uint64_t v34 = [v33 lastPathComponent];
        uint64_t v35 = [NSString stringWithUTF8String:"-[PLBBAgent initOperatorDependancies]"];
        [v32 logMessage:v31 fromFile:v34 fromFunction:v35 fromLineNumber:2792];

        uint64_t v36 = PLLogCommon();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v102 = v31;
          _os_log_debug_impl(&dword_1D2690000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    char v37 = objc_opt_new();
    [(PLBBAgent *)self setTelRegMsgHelper:v37];

    uint64_t v38 = [(PLBBAgent *)self telRegMsgHelper];
    [v38 setAgent:self];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v39 = objc_opt_class();
      v88[0] = MEMORY[0x1E4F143A8];
      v88[1] = 3221225472;
      v88[2] = __37__PLBBAgent_initOperatorDependancies__block_invoke_1461;
      v88[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v88[4] = v39;
      if (qword_1EBD59160 != -1) {
        dispatch_once(&qword_1EBD59160, v88);
      }
      if (byte_1EBD58D2C)
      {
        uint64_t v40 = [NSString stringWithFormat:@"Setup TelephonyActivity init"];
        uint64_t v41 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        uint64_t v43 = [v42 lastPathComponent];
        uint64_t v44 = [NSString stringWithUTF8String:"-[PLBBAgent initOperatorDependancies]"];
        [v41 logMessage:v40 fromFile:v43 fromFunction:v44 fromLineNumber:2797];

        uint64_t v45 = PLLogCommon();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v102 = v40;
          _os_log_debug_impl(&dword_1D2690000, v45, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    uint64_t v46 = objc_opt_new();
    [(PLBBAgent *)self setTelActMsgHelper:v46];

    uint64_t v47 = [(PLBBAgent *)self telActMsgHelper];
    [v47 setAgent:self];

    [(PLBBAgent *)self logTelephonyRegistrationAtInit];
    [(PLBBAgent *)self logTelephonyActivityAtInit];
    id v48 = objc_alloc(MEMORY[0x1E4F929A0]);
    uint64_t v49 = [MEMORY[0x1E4F92A88] workQueueForClass:objc_opt_class()];
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __37__PLBBAgent_initOperatorDependancies__block_invoke_1469;
    v87[3] = &unk_1E692A0F0;
    v87[4] = self;
    int64_t v50 = (void *)[v48 initWithWorkQueue:v49 forNotification:@"com.apple.powerlogd.bbreport" requireState:0 withBlock:v87];
    [(PLBBAgent *)self setCfNotifyBBReport:v50];

    id v51 = objc_alloc(MEMORY[0x1E4F929A0]);
    uint64_t v52 = [MEMORY[0x1E4F92A88] workQueueForClass:objc_opt_class()];
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __37__PLBBAgent_initOperatorDependancies__block_invoke_2_1473;
    v86[3] = &unk_1E692A0F0;
    v86[4] = self;
    uint64_t v53 = (void *)[v51 initWithWorkQueue:v52 forNotification:@"com.apple.powerlogd.bbreport30s" requireState:0 withBlock:v86];
    [(PLBBAgent *)self setCfNotifyBBReport30s:v53];

    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __37__PLBBAgent_initOperatorDependancies__block_invoke_3;
    v85[3] = &unk_1E692A0F0;
    v85[4] = self;
    uint64_t v54 = [MEMORY[0x1E4F929E8] canSleepEntryNotificationWithOperator:self withBlock:v85];
    [(PLBBAgent *)self setCanSleepNotification:v54];

    id v55 = objc_alloc(MEMORY[0x1E4F929E8]);
    v97 = &unk_1F29E66D0;
    v98 = &unk_1F29E66E8;
    v99[0] = @"State";
    uint64_t v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
    v99[1] = @"Event";
    v100[0] = v56;
    uint64_t v95 = &unk_1F29E66D0;
    v96 = &unk_1F29E6700;
    uint64_t v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
    v100[1] = v57;
    uint64_t v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:v99 count:2];
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __37__PLBBAgent_initOperatorDependancies__block_invoke_1490;
    v84[3] = &unk_1E692A0F0;
    v84[4] = self;
    uint64_t v59 = (void *)[v55 initWithOperator:self forEntryKey:@"PLSleepWakeAgent_EventForward_PowerState" withFilter:v58 withBlock:v84];
    [(PLBBAgent *)self setDidNotSleepNotification:v59];

    id v60 = objc_alloc(MEMORY[0x1E4F929E8]);
    id v61 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"TelephonyActivity"];
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __37__PLBBAgent_initOperatorDependancies__block_invoke_2_1491;
    v83[3] = &unk_1E692A0F0;
    v83[4] = self;
    id v62 = (void *)[v60 initWithOperator:self forEntryKey:v61 withBlock:v83];
    [(PLBBAgent *)self setTelephonyActivityNotification:v62];

    id v63 = [MEMORY[0x1E4F92900] sharedInstance];
    v93 = @"BB-Standard";
    int v94 = &unk_1F29F0D20;
    id v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
    id v65 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [v63 createDistributionEventForwardWithDistributionID:6 withChildNodeNameToWeight:v64 withStartDate:v65];

    id v66 = objc_alloc(MEMORY[0x1E4F92A28]);
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __37__PLBBAgent_initOperatorDependancies__block_invoke_1499;
    v82[3] = &unk_1E692A0F0;
    v82[4] = self;
    v67 = (PLNSNotificationOperatorComposition *)[v66 initWithOperator:self forNotification:@"PLThermalMonitorNotification" withBlock:v82];
    thermalMonitorListener = self->_thermalMonitorListener;
    self->_thermalMonitorListener = v67;

    id v69 = objc_alloc(MEMORY[0x1E4F92AA8]);
    v70 = [(PLOperator *)self workQueue];
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __37__PLBBAgent_initOperatorDependancies__block_invoke_2_1515;
    v81[3] = &unk_1E692A118;
    v81[4] = self;
    v71 = (void *)[v69 initWithWorkQueue:v70 withRegistration:&unk_1F29EA6C0 withBlock:v81];

    [(PLBBAgent *)self setBBLogsSysdiagnoseResponder:v71];
    objc_storeStrong((id *)&qword_1EBD58F28, self);
    v72 = PLLogCommon();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D2690000, v72, OS_LOG_TYPE_DEBUG, "BBAgent: End of initOperatorDependencies", buf, 2u);
    }

    return;
  }
  uint64_t v73 = [(PLBBAgent *)self setupIOKitNotifications];

  if (v73)
  {
    [(PLBBAgent *)self setupMavABMChannel];
    [(PLBBAgent *)self setupBBChannelsWithAction:0];
    [(PLBasebandLogChannel *)self->cachedChannel flush];
    [(PLBBAgent *)self initCacheCommitTimer];
    goto LABEL_16;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v74 = objc_opt_class();
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __37__PLBBAgent_initOperatorDependancies__block_invoke_2;
    v90[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v90[4] = v74;
    if (qword_1EBD59150 != -1) {
      dispatch_once(&qword_1EBD59150, v90);
    }
    if (byte_1EBD58D2A)
    {
      v75 = [NSString stringWithFormat:@"Error: BBAgent no ioKitNotifications"];
      v76 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v77 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      v78 = [v77 lastPathComponent];
      v79 = [NSString stringWithUTF8String:"-[PLBBAgent initOperatorDependancies]"];
      [v76 logMessage:v75 fromFile:v78 fromFunction:v79 fromLineNumber:2774];

      int v80 = PLLogCommon();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v102 = v75;
        _os_log_debug_impl(&dword_1D2690000, v80, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __37__PLBBAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D29 = result;
  return result;
}

uint64_t __37__PLBBAgent_initOperatorDependancies__block_invoke_1447(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkKICEChannelTimeout];
}

uint64_t __37__PLBBAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D2A = result;
  return result;
}

uint64_t __37__PLBBAgent_initOperatorDependancies__block_invoke_1455(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D2B = result;
  return result;
}

uint64_t __37__PLBBAgent_initOperatorDependancies__block_invoke_1461(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D2C = result;
  return result;
}

uint64_t __37__PLBBAgent_initOperatorDependancies__block_invoke_1469(uint64_t a1)
{
  return [*(id *)(a1 + 32) refreshBBReport];
}

uint64_t __37__PLBBAgent_initOperatorDependancies__block_invoke_2_1473(uint64_t a1)
{
  return [*(id *)(a1 + 32) setupKICEChannelsForDebug];
}

uint64_t __37__PLBBAgent_initOperatorDependancies__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelCacheCommitTimer];
}

uint64_t __37__PLBBAgent_initOperatorDependancies__block_invoke_1490(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetCacheCommitTimer];
}

void __37__PLBBAgent_initOperatorDependancies__block_invoke_2_1491(uint64_t a1, void *a2)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 objectForKeyedSubscript:@"entry"];
  BOOL v4 = [v3 objectForKeyedSubscript:@"callStatus"];
  double v5 = [v3 objectForKeyedSubscript:@"campedRat"];
  if (([MEMORY[0x1E4F92A38] isBasebandClass:1003001] & 1) != 0
    || [MEMORY[0x1E4F92A38] isBasebandClass:1003002])
  {
    uint64_t v7 = *(void **)(a1 + 32);
    double v6 = (id *)(a1 + 32);
    if ([v7 isBBDataStandard]
      && [v4 isEqualToString:@"Active"])
    {
      int v8 = [MEMORY[0x1E4F92900] sharedInstance];
      uint64_t v22 = @"BB-PhoneCall";
      v23[0] = &unk_1F29F0D20;
      double v9 = (void *)MEMORY[0x1E4F1C9E8];
      id v10 = (void **)v23;
      uint64_t v11 = &v22;
LABEL_6:
      int v12 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:1];
      id v13 = [v3 entryDate];
      [v8 createDistributionEventForwardWithDistributionID:6 withChildNodeNameToWeight:v12 withStartDate:v13];
      uint64_t v14 = 0;
LABEL_10:

      [*v6 setIsBBDataStandard:v14];
      goto LABEL_20;
    }
    if (([*v6 isBBDataStandard] & 1) == 0
      && [v4 isEqualToString:@"Inactive"])
    {
      int v8 = [MEMORY[0x1E4F92900] sharedInstance];
      BOOL v20 = @"BB-Standard";
      id v21 = &unk_1F29F0D20;
      uint64_t v14 = 1;
      int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      id v13 = [v3 entryDate];
      [v8 createDistributionEventForwardWithDistributionID:6 withChildNodeNameToWeight:v12 withStartDate:v13];
      goto LABEL_10;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = *(void **)(a1 + 32);
        double v6 = (id *)(a1 + 32);
        if ([v15 isBBDataStandard]
          && [v4 isEqualToString:@"Active"]
          && [v5 isEqualToString:@"LTE"])
        {
          int v8 = [MEMORY[0x1E4F92900] sharedInstance];
          uint64_t v18 = @"BB-PhoneCall";
          id v19 = &unk_1F29F0D20;
          double v9 = (void *)MEMORY[0x1E4F1C9E8];
          id v10 = &v19;
          uint64_t v11 = &v18;
          goto LABEL_6;
        }
        if (([*v6 isBBDataStandard] & 1) == 0
          && (([v4 isEqualToString:@"Inactive"] & 1) != 0
           || ([v5 isEqualToString:@"LTE"] & 1) == 0))
        {
          int v8 = [MEMORY[0x1E4F92900] sharedInstance];
          uint64_t v16 = @"BB-Standard";
          uint64_t v17 = &unk_1F29F0D20;
          uint64_t v14 = 1;
          int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
          id v13 = [v3 entryDate];
          [v8 createDistributionEventForwardWithDistributionID:6 withChildNodeNameToWeight:v12 withStartDate:v13];
          goto LABEL_10;
        }
      }
    }
  }
LABEL_20:
}

void __37__PLBBAgent_initOperatorDependancies__block_invoke_1499(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412290;
    id v13 = v3;
    _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "Notification from ThermalMonitor: %@", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v5 = [v3 objectForKeyedSubscript:@"Source"];
  if (v5)
  {
    double v6 = (void *)v5;
    uint64_t v7 = [v3 objectForKeyedSubscript:@"Source"];
    int v8 = [v7 isEqual:&unk_1F29E66A0];

    if (v8)
    {
      if (([MEMORY[0x1E4F92A38] isBasebandProto] & 1) != 0
        || ([MEMORY[0x1E4F92A38] isBasebandMav] & 1) != 0
        || [MEMORY[0x1E4F92A38] isBasebandIce])
      {
        double v9 = PLLogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          int v12 = 138412290;
          id v13 = v3;
          _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "Recieved trigger for sysdiagnose: %@", (uint8_t *)&v12, 0xCu);
        }

        if ((int)[MEMORY[0x1E4F92A38] kPLBasebandClassOfDevice] <= 1003014
          || (int)[MEMORY[0x1E4F92A38] kPLBasebandClassOfDevice] >= 1003018)
        {
          [*(id *)(a1 + 32) logEventNoneBBReportBy:4 withAction:7];
        }
        else
        {
          [*(id *)(a1 + 32) logEventNoneBBReportBy:4 withAction:8];
          dispatch_time_t v10 = dispatch_time(0, 1000000000);
          uint64_t v11 = [*(id *)(a1 + 32) workQueue];
          dispatch_after(v10, v11, &__block_literal_global_36);
        }
      }
    }
  }
}

void __37__PLBBAgent_initOperatorDependancies__block_invoke_1503()
{
  id v0 = +[PLMAVBBMetric sharedInstance];
  [v0 flushPeriodicMetrics];
}

void *__37__PLBBAgent_initOperatorDependancies__block_invoke_2_1515(uint64_t a1)
{
  id v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEBUG, "XPC Call from TS Sysdiagnose", buf, 2u);
  }

  if ((int)[MEMORY[0x1E4F92A38] kPLBasebandClassOfDevice] <= 1003014
    || (int)[MEMORY[0x1E4F92A38] kPLBasebandClassOfDevice] >= 1003018)
  {
    uint64_t v5 = PLLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Assert flush not supported on older platforms", v7, 2u);
    }

    id v3 = &unk_1F29EA6E8;
    uint64_t v4 = 7;
  }
  else
  {
    id v3 = &unk_1F29EA710;
    uint64_t v4 = 8;
  }
  [*(id *)(a1 + 32) logEventNoneBBReportBy:4 withAction:v4];
  return v3;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FADD90] object:0];

  v4.receiver = self;
  v4.super_class = (Class)PLBBAgent;
  [(PLAgent *)&v4 dealloc];
}

uint64_t __22__PLBBAgent_logEntry___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D2D = result;
  return result;
}

uint64_t __22__PLBBAgent_logEntry___block_invoke_1534(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D2E = result;
  return result;
}

- (void)logEntries:(id)a3 withGroupID:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PLBBAgent;
  [(PLOperator *)&v22 logEntries:v6 withGroupID:a4];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __36__PLBBAgent_logEntries_withGroupID___block_invoke;
    BOOL v20 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v21 = v7;
    if (qword_1EBD59178 != -1) {
      dispatch_once(&qword_1EBD59178, &block);
    }
    if (byte_1EBD58D2F)
    {
      int v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBAgent logEntries:withGroupID:]", block, v18, v19, v20, v21);
      double v9 = (void *)MEMORY[0x1E4F929B8];
      dispatch_time_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      uint64_t v11 = [v10 lastPathComponent];
      int v12 = [NSString stringWithUTF8String:"-[PLBBAgent logEntries:withGroupID:]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:2954];

      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if ([MEMORY[0x1E4F92A38] isBasebandMavLeg]) {
    [(PLBBAgent *)self modelMav10BBHWPower:v6];
  }
  else {
    [(PLBBAgent *)self modelMavBBHWOtherPerRATPower:v6];
  }
  uint64_t v14 = [v6 objectForKeyedSubscript:@"PLBBAgent_EventBackward_MavBBHwOther"];

  if (v14)
  {
    id v15 = [v6 objectForKeyedSubscript:@"PLBBAgent_EventBackward_MavBBHwOther"];
    uint64_t v16 = [v15 objectAtIndexedSubscript:0];

    [(PLBBAgent *)self modelGPSPower:v16];
  }
  if (([MEMORY[0x1E4F92A38] isBasebandClass:1003001] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isBasebandClass:1003002] & 1) != 0
    || [MEMORY[0x1E4F92A38] isBasebandMavLeg])
  {
    [(PLBBAgent *)self modelScanPower:v6];
  }
}

uint64_t __36__PLBBAgent_logEntries_withGroupID___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D2F = result;
  return result;
}

- (void)log
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __16__PLBBAgent_log__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v3;
    if (qword_1EBD59180 != -1) {
      dispatch_once(&qword_1EBD59180, block);
    }
    if (byte_1EBD58D30)
    {
      objc_super v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBAgent log]");
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      uint64_t v7 = [v6 lastPathComponent];
      int v8 = [NSString stringWithUTF8String:"-[PLBBAgent log]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:2977];

      double v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v29 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (([MEMORY[0x1E4F92A38] isBasebandProto] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isBasebandMav] & 1) != 0
    || [MEMORY[0x1E4F92A38] isBasebandIce])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v10 = objc_opt_class();
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __16__PLBBAgent_log__block_invoke_1554;
      v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v26[4] = v10;
      if (qword_1EBD59188 != -1) {
        dispatch_once(&qword_1EBD59188, v26);
      }
      if (byte_1EBD58D31)
      {
        uint64_t v11 = [NSString stringWithFormat:@"PLBBAgent:log for Protobuf platforms"];
        int v12 = (void *)MEMORY[0x1E4F929B8];
        id v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        uint64_t v14 = [v13 lastPathComponent];
        id v15 = [NSString stringWithUTF8String:"-[PLBBAgent log]"];
        [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:2980];

        uint64_t v16 = PLLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v29 = v11;
          _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    uint64_t v17 = 7;
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v18 = objc_opt_class();
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __16__PLBBAgent_log__block_invoke_1560;
      v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v25[4] = v18;
      if (qword_1EBD59190 != -1) {
        dispatch_once(&qword_1EBD59190, v25);
      }
      if (byte_1EBD58D32)
      {
        id v19 = [NSString stringWithFormat:@"PLBBAgent:log for Mav"];
        BOOL v20 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        objc_super v22 = [v21 lastPathComponent];
        id v23 = [NSString stringWithUTF8String:"-[PLBBAgent log]"];
        [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:2983];

        uint64_t v24 = PLLogCommon();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v29 = v19;
          _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    uint64_t v17 = 4;
    [(PLBBAgent *)self logEventNoneBBReportBy:4 withAction:3];
  }
  [(PLBBAgent *)self logEventNoneBBReportBy:4 withAction:v17];
}

uint64_t __16__PLBBAgent_log__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D30 = result;
  return result;
}

uint64_t __16__PLBBAgent_log__block_invoke_1554(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D31 = result;
  return result;
}

uint64_t __16__PLBBAgent_log__block_invoke_1560(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D32 = result;
  return result;
}

- (void)flushBBCacheWithClientInfo:(int64_t)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__PLBBAgent_flushBBCacheWithClientInfo___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v5;
    if (qword_1EBD59198 != -1) {
      dispatch_once(&qword_1EBD59198, block);
    }
    if (byte_1EBD58D33)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBAgent flushBBCacheWithClientInfo:]");
      uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      int v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      double v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLBBAgent flushBBCacheWithClientInfo:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:2991];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v34 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v12 = objc_opt_class();
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __40__PLBBAgent_flushBBCacheWithClientInfo___block_invoke_1566;
    void v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void v31[4] = v12;
    if (qword_1EBD591A0 != -1) {
      dispatch_once(&qword_1EBD591A0, v31);
    }
    if (byte_1EBD58D34)
    {
      id v13 = objc_msgSend(NSString, "stringWithFormat:", @"PLBBAgent log method called by:%ld", a3);
      uint64_t v14 = (void *)MEMORY[0x1E4F929B8];
      id v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      uint64_t v16 = [v15 lastPathComponent];
      uint64_t v17 = [NSString stringWithUTF8String:"-[PLBBAgent flushBBCacheWithClientInfo:]"];
      [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:2992];

      uint64_t v18 = PLLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v34 = v13;
        _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if ([(PLBBAgent *)self agentInited])
  {
    [(PLBBAgent *)self eventToFlushCacheOccurred];
  }
  else if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v19 = objc_opt_class();
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    id v28 = __40__PLBBAgent_flushBBCacheWithClientInfo___block_invoke_1572;
    uint64_t v29 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v30 = v19;
    if (qword_1EBD591A8 != -1) {
      dispatch_once(&qword_1EBD591A8, &v26);
    }
    if (byte_1EBD58D35)
    {
      BOOL v20 = objc_msgSend(NSString, "stringWithFormat:", @"Error: PLBBAgent log method called by %ld before init", a3, v26, v27, v28, v29, v30);
      uint64_t v21 = (void *)MEMORY[0x1E4F929B8];
      objc_super v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      id v23 = [v22 lastPathComponent];
      uint64_t v24 = [NSString stringWithUTF8String:"-[PLBBAgent flushBBCacheWithClientInfo:]"];
      [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:2995];

      uint64_t v25 = PLLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v34 = v20;
        _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __40__PLBBAgent_flushBBCacheWithClientInfo___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D33 = result;
  return result;
}

uint64_t __40__PLBBAgent_flushBBCacheWithClientInfo___block_invoke_1566(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D34 = result;
  return result;
}

uint64_t __40__PLBBAgent_flushBBCacheWithClientInfo___block_invoke_1572(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D35 = result;
  return result;
}

- (void)commitBBCacheWithClientInfo:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__PLBBAgent_commitBBCacheWithClientInfo___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v5;
    if (qword_1EBD591B0 != -1) {
      dispatch_once(&qword_1EBD591B0, block);
    }
    if (byte_1EBD58D36)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s client: %ld", "-[PLBBAgent commitBBCacheWithClientInfo:]", a3);
      uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      int v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      double v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLBBAgent commitBBCacheWithClientInfo:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:3004];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        objc_super v22 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if ([(PLBBAgent *)self agentInited])
  {
    [(PLBBAgent *)self eventToCommitCacheOccurred];
  }
  else if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v12 = objc_opt_class();
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __41__PLBBAgent_commitBBCacheWithClientInfo___block_invoke_1581;
    v19[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v19[4] = v12;
    if (qword_1EBD591B8 != -1) {
      dispatch_once(&qword_1EBD591B8, v19);
    }
    if (byte_1EBD58D37)
    {
      id v13 = objc_msgSend(NSString, "stringWithFormat:", @"Error: method called by %ld before init", a3);
      uint64_t v14 = (void *)MEMORY[0x1E4F929B8];
      id v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      uint64_t v16 = [v15 lastPathComponent];
      uint64_t v17 = [NSString stringWithUTF8String:"-[PLBBAgent commitBBCacheWithClientInfo:]"];
      [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:3008];

      uint64_t v18 = PLLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        objc_super v22 = v13;
        _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __41__PLBBAgent_commitBBCacheWithClientInfo___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D36 = result;
  return result;
}

uint64_t __41__PLBBAgent_commitBBCacheWithClientInfo___block_invoke_1581(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D37 = result;
  return result;
}

uint64_t __36__PLBBAgent_logTelephonyRegMsgWith___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D38 = result;
  return result;
}

uint64_t __36__PLBBAgent_logTelephonyRegMsgWith___block_invoke_1587(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D39 = result;
  return result;
}

- (id)humanReadableRegistrationStatus:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_super v4 = [v3 substringFromIndex:objc_msgSend(@"kCTRegistrationStatus", "length")];
  }
  else
  {
    objc_super v4 = @"<unknown>";
  }
  return v4;
}

- (id)humanReadableDataIndicator:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_super v4 = [v3 substringFromIndex:objc_msgSend(@"kCTRegistrationDataIndicator", "length")];
  }
  else
  {
    objc_super v4 = @"<unknown>";
  }
  return v4;
}

+ (id)humanReadableStateFromKey:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"kCTRegistrationBasebandState"])
  {
    id v4 = [v3 substringFromIndex:objc_msgSend(@"kCTRegistrationBasebandState", "length")];
  }
  else
  {
    id v4 = v3;
  }
  uint64_t v5 = v4;

  return v5;
}

- (void)logTelephonyRegistrationAtInit
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v18 = "-[PLBBAgent logTelephonyRegistrationAtInit]";
    _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __43__PLBBAgent_logTelephonyRegistrationAtInit__block_invoke;
    id v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v4;
    if (qword_1EBD591D0 != -1) {
      dispatch_once(&qword_1EBD591D0, &block);
    }
    if (byte_1EBD58D3A)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBAgent logTelephonyRegistrationAtInit]", block, v13, v14, v15, v16);
      uint64_t v5 = (char *)objc_claimAutoreleasedReturnValue();
      id v6 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      int v8 = [v7 lastPathComponent];
      double v9 = [NSString stringWithUTF8String:"-[PLBBAgent logTelephonyRegistrationAtInit]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:3058];

      uint64_t v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v11 = [(PLBBAgent *)self telRegMsgHelper];
  [v11 logEventPointTelephonyRegistrationAtInit];
  [(PLBBAgent *)self logTelephonyRegistrationDSDSAtInit];
}

uint64_t __43__PLBBAgent_logTelephonyRegistrationAtInit__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D3A = result;
  return result;
}

- (void)logTelephonyActivityAtInit
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v18 = "-[PLBBAgent logTelephonyActivityAtInit]";
    _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __39__PLBBAgent_logTelephonyActivityAtInit__block_invoke;
    id v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v4;
    if (qword_1EBD591D8 != -1) {
      dispatch_once(&qword_1EBD591D8, &block);
    }
    if (byte_1EBD58D3B)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBAgent logTelephonyActivityAtInit]", block, v13, v14, v15, v16);
      uint64_t v5 = (char *)objc_claimAutoreleasedReturnValue();
      id v6 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      int v8 = [v7 lastPathComponent];
      double v9 = [NSString stringWithUTF8String:"-[PLBBAgent logTelephonyActivityAtInit]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:3069];

      uint64_t v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v11 = [(PLBBAgent *)self telActMsgHelper];
  [(PLBBAgent *)self registerForAirplaneModeChange];
  if ([(PLBBAgent *)self isChangedAndSetAirplaneMode])
  {
    [v11 setAirplaneMode:airplaneModeCurrent];
    [v11 logPointIntervalTelephonyActivityAirplaneModeChange];
  }
  [(PLBBAgent *)self logTelephonyActivityDSDSAtInit];
}

uint64_t __39__PLBBAgent_logTelephonyActivityAtInit__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D3B = result;
  return result;
}

+ (id)getNameBBReport
{
  return @"BBReport";
}

+ (id)entryIceMsgLite
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v15[0] = *MEMORY[0x1E4F92CD0];
  v15[1] = v2;
  v16[0] = &unk_1F29F0D20;
  v16[1] = @"refreshRequestHandler";
  v15[2] = *MEMORY[0x1E4F92CC0];
  v16[2] = MEMORY[0x1E4F1CC38];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E4F92CA8];
  v13[0] = @"value_enabled";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v14[0] = v5;
  v13[1] = @"value_history";
  id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  v14[1] = v7;
  v13[2] = @"unit";
  int v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v14[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v18[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v11;
}

+ (id)entryEventNoneBBReport
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F29F0D30;
  v14[1] = @"refreshBBReport";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"ClientName";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v11[1] = @"ClientAction";
  v12[0] = v5;
  id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v12[1] = v7;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventForwardSDM
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  if ((int)[MEMORY[0x1E4F92A38] kPLBasebandClassOfDevice] < 1003012)
  {
    int v8 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    v14[0] = *MEMORY[0x1E4F92C50];
    uint64_t v12 = *MEMORY[0x1E4F92CD0];
    uint64_t v13 = &unk_1F29F0D20;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    v15[0] = v2;
    v14[1] = *MEMORY[0x1E4F92CA8];
    v10[0] = @"SDMState";
    id v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v10[1] = @"subsId";
    v11[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v11[1] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    v15[1] = v7;
    int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  }
  return v8;
}

- (void)refreshBBReport
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D942A350](self, a2);
  uint64_t v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v19 = "-[PLBBAgent refreshBBReport]";
    _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __28__PLBBAgent_refreshBBReport__block_invoke;
    uint64_t v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v17 = v5;
    if (qword_1EBD591E0 != -1) {
      dispatch_once(&qword_1EBD591E0, &block);
    }
    if (byte_1EBD58D3C)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBAgent refreshBBReport]", block, v14, v15, v16, v17);
      id v6 = (char *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      int v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      double v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLBBAgent refreshBBReport]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:3141];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (([MEMORY[0x1E4F929C0] debugEnabled] & 1) != 0
    || ([MEMORY[0x1E4F929C0] isDevBoard] & 1) != 0
    || [MEMORY[0x1E4F929C0] isModelTrigger])
  {
    if (([MEMORY[0x1E4F92A38] isBasebandProto] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isBasebandMav] & 1) != 0
      || [MEMORY[0x1E4F92A38] isBasebandIce])
    {
      if ((int)[MEMORY[0x1E4F92A38] kPLBasebandClassOfDevice] <= 1003014) {
        uint64_t v12 = 7;
      }
      else {
        uint64_t v12 = 8;
      }
    }
    else
    {
      uint64_t v12 = 4;
      [(PLBBAgent *)self logEventNoneBBReportBy:4 withAction:3];
    }
    [(PLBBAgent *)self logEventNoneBBReportBy:4 withAction:v12];
  }
}

uint64_t __28__PLBBAgent_refreshBBReport__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D3C = result;
  return result;
}

- (void)logEventNoneBBReportBy:(int64_t)a3 withAction:(int64_t)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLBBAgent_logEventNoneBBReportBy_withAction___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v7;
    if (qword_1EBD591E8 != -1) {
      dispatch_once(&qword_1EBD591E8, block);
    }
    if (byte_1EBD58D3D)
    {
      int v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBAgent logEventNoneBBReportBy:withAction:]");
      double v9 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      uint64_t v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLBBAgent logEventNoneBBReportBy:withAction:]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:3161];

      uint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        int64_t v41 = (int64_t)v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (([MEMORY[0x1E4F929C0] debugEnabled] & 1) != 0
    || ([MEMORY[0x1E4F929C0] fullMode] & 1) != 0
    || [MEMORY[0x1E4F92A38] internalBuild])
  {
    uint64_t v14 = *MEMORY[0x1E4F92D40];
    id v15 = +[PLBBAgent getNameBBReport];
    uint64_t v16 = +[PLOperator entryKeyForType:v14 andName:v15];

    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v16];
    uint64_t v18 = [NSNumber numberWithInteger:a3];
    [v17 setObject:v18 forKeyedSubscript:@"ClientName"];

    uint64_t v19 = [NSNumber numberWithInteger:a4];
    [v17 setObject:v19 forKeyedSubscript:@"ClientAction"];

    if (([MEMORY[0x1E4F92A38] isBasebandMav] & 1) != 0
      || [MEMORY[0x1E4F92A38] isBasebandIce])
    {
      [(PLBBAgent *)self logEntry:v17];
    }
  }
  uint64_t v20 = PLLogCommon();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    int64_t v41 = a3;
    __int16 v42 = 2048;
    int64_t v43 = a4;
    _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "logEventNoneBBReportBy Client %ld, Action %ld", buf, 0x16u);
  }

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v21 = objc_opt_class();
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __47__PLBBAgent_logEventNoneBBReportBy_withAction___block_invoke_1629;
    v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v38[4] = v21;
    if (qword_1EBD591F0 != -1) {
      dispatch_once(&qword_1EBD591F0, v38);
    }
    if (byte_1EBD58D3E)
    {
      objc_super v22 = [NSString stringWithFormat:@"Client: %ld, Action: %ld", a3, a4];
      uint64_t v23 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      uint64_t v25 = [v24 lastPathComponent];
      uint64_t v26 = [NSString stringWithUTF8String:"-[PLBBAgent logEventNoneBBReportBy:withAction:]"];
      [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:3185];

      uint64_t v27 = PLLogCommon();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        int64_t v41 = (int64_t)v22;
        _os_log_debug_impl(&dword_1D2690000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  switch(a4)
  {
    case 3:
      [(PLBBAgent *)self commitBBCacheWithClientInfo:a3];
      return;
    case 4:
      [(PLBBAgent *)self flushBBCacheWithClientInfo:a3];
      return;
    case 7:
      uint64_t v35 = [MEMORY[0x1E4F92960] sharedABMClient];
      uint64_t v29 = v35;
      uint64_t v36 = 520207;
      goto LABEL_36;
    case 8:
      uint64_t v35 = [MEMORY[0x1E4F92960] sharedABMClient];
      uint64_t v29 = v35;
      uint64_t v36 = 703488;
LABEL_36:
      [v35 triggerPeriodicMetrics:v36];
      goto LABEL_37;
    default:
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        return;
      }
      uint64_t v28 = objc_opt_class();
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __47__PLBBAgent_logEventNoneBBReportBy_withAction___block_invoke_1635;
      v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v37[4] = v28;
      if (qword_1EBD591F8 != -1) {
        dispatch_once(&qword_1EBD591F8, v37);
      }
      if (!byte_1EBD58D3F) {
        return;
      }
      uint64_t v29 = [NSString stringWithFormat:@"***NOOP*** Client: %ld, Action: %ld", a3, a4];
      uint64_t v30 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      uint64_t v32 = [v31 lastPathComponent];
      id v33 = [NSString stringWithUTF8String:"-[PLBBAgent logEventNoneBBReportBy:withAction:]"];
      [v30 logMessage:v29 fromFile:v32 fromFunction:v33 fromLineNumber:3199];

      uint64_t v34 = PLLogCommon();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        int64_t v41 = (int64_t)v29;
        _os_log_debug_impl(&dword_1D2690000, v34, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

LABEL_37:
      return;
  }
}

uint64_t __47__PLBBAgent_logEventNoneBBReportBy_withAction___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D3D = result;
  return result;
}

uint64_t __47__PLBBAgent_logEventNoneBBReportBy_withAction___block_invoke_1629(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D3E = result;
  return result;
}

uint64_t __47__PLBBAgent_logEventNoneBBReportBy_withAction___block_invoke_1635(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D3F = result;
  return result;
}

- (void)modelLTESLEEPMGRPower:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F92A88] MavRevStringQuery];
  if (([MEMORY[0x1E4F92A38] isBasebandClass:1003001] & 1) != 0
    || [MEMORY[0x1E4F92A38] isBasebandClass:1003002])
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:@"ML1State"];
    [v5 doubleValue];
    double v7 = v6;

    int v8 = [v3 objectForKeyedSubscript:@"StateDuration"];
    [v8 doubleValue];
    double v10 = v9 / 1000.0;

    uint64_t v11 = [v3 objectForKeyedSubscript:@"LightSleepDuration"];
    [v11 doubleValue];
    double v13 = v12;

    uint64_t v14 = [v3 objectForKeyedSubscript:@"DeepSleepDuration"];
    [v14 doubleValue];
    double v16 = v15;

    uint64_t v17 = [v3 entryDate];
    uint64_t v18 = [MEMORY[0x1E4F92A88] powerModelForOperatorName:@"baseband"];
    uint64_t v19 = [v18 objectForKeyedSubscript:v4];
    uint64_t v20 = [v19 objectForKeyedSubscript:@"LTE"];
    uint64_t v21 = [v20 objectForKeyedSubscript:@"SleepStateAwakePower"];
    [v21 doubleValue];
    double v23 = v22;

    uint64_t v24 = [v18 objectForKeyedSubscript:v4];
    uint64_t v25 = [v24 objectForKeyedSubscript:@"LTE"];
    uint64_t v26 = [v25 objectForKeyedSubscript:@"SleepStateLightSleepPower"];
    [v26 doubleValue];
    double v28 = v27;

    double v29 = 0.0;
    if (v7 > 0.0)
    {
      double v30 = v13 / 1000.0;
      double v31 = v10 - v13 / 1000.0 - v16 / 1000.0;
      if (v31 >= 0.0 && v30 >= 0.0) {
        double v29 = v30 * v28 + v31 * v23;
      }
    }
    if (LTESleepMgrStatCumulativeTimestamp)
    {
      [(id)LTESleepMgrStatLastTimestamp timeIntervalSince1970];
      double v33 = v32;
      [(id)LTESleepMgrStatCumulativeTimestamp timeIntervalSince1970];
      double v35 = v34;
      [v17 timeIntervalSince1970];
      double v37 = 0.0;
      if (v33 < v35 && v35 < v36)
      {
        double v38 = v36 - v35;
        if (v38 > 0.0) {
          double v37 = (v29 - *(double *)&LTESleepMgrStatCumulativeEnergy) / v38;
        }
      }
    }
    else
    {
      double v37 = 0.0;
      if (v10 > 0.0) {
        double v37 = v29 / v10;
      }
    }
    LTESleepMgrStatLastEnergy = 0;
    objc_storeStrong((id *)&LTESleepMgrStatLastTimestamp, v17);
    LTESleepMgrStatCumulativeEnergy = 0;
    uint64_t v39 = (void *)LTESleepMgrStatCumulativeTimestamp;
    LTESleepMgrStatCumulativeTimestamp = 0;

    [v17 timeIntervalSince1970];
    uint64_t v41 = v40;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v42 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __35__PLBBAgent_modelLTESLEEPMGRPower___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v42;
      if (qword_1EBD59200 != -1) {
        dispatch_once(&qword_1EBD59200, block);
      }
      if (byte_1EBD58D40)
      {
        int64_t v43 = [NSString stringWithFormat:@"SleepStats --> Model power: %f, power=%f", v41, *(void *)&v37];
        uint64_t v44 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v45 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        uint64_t v46 = [v45 lastPathComponent];
        uint64_t v47 = [NSString stringWithUTF8String:"-[PLBBAgent modelLTESLEEPMGRPower:]"];
        [v44 logMessage:v43 fromFile:v46 fromFunction:v47 fromLineNumber:3298];

        id v48 = PLLogCommon();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v52 = v43;
          _os_log_debug_impl(&dword_1D2690000, v48, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    uint64_t v49 = [MEMORY[0x1E4F92900] sharedInstance];
    [v49 createPowerEventBackwardWithRootNodeID:21 withPower:v17 withEndDate:v37];
  }
}

uint64_t __35__PLBBAgent_modelLTESLEEPMGRPower___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D40 = result;
  return result;
}

- (void)modelStateTransitionPower:(id)a3 rat:(id)a4 state:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F92A88] MavRevStringQuery];
  if (([MEMORY[0x1E4F92A38] isBasebandMavLeg] & 1) == 0)
  {
    if ([v9 isEqualToString:@"LTE"]
      && (([MEMORY[0x1E4F92A38] isBasebandClass:1003002] & 1) != 0
       || [MEMORY[0x1E4F92A38] isBasebandClass:1003001]))
    {
      if ([v10 isEqualToString:@"Connected"])
      {
        double v12 = self;
        uint64_t v13 = 1;
      }
      else
      {
        double v12 = self;
        uint64_t v13 = 0;
      }
      [(PLBBAgent *)v12 setLteCurrentState:v13];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F92A88] powerModelForOperatorName:@"baseband"];
      double v15 = [v14 objectForKeyedSubscript:v11];
      double v16 = [v15 objectForKeyedSubscript:v9];
      uint64_t v17 = [v16 objectForKeyedSubscript:v10];

      if (v17)
      {
        uint64_t v18 = [v14 objectForKeyedSubscript:v11];
        uint64_t v19 = [v18 objectForKeyedSubscript:v9];
        uint64_t v20 = [v19 objectForKeyedSubscript:v10];
        [v20 doubleValue];
        double v22 = v21;
      }
      else
      {
        double v22 = 0.0;
      }
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v23 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __49__PLBBAgent_modelStateTransitionPower_rat_state___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        void block[4] = v23;
        if (qword_1EBD59208 != -1) {
          dispatch_once(&qword_1EBD59208, block);
        }
        if (byte_1EBD58D41)
        {
          uint64_t v24 = NSString;
          double v36 = v14;
          uint64_t v25 = [v14 objectForKeyedSubscript:v11];
          uint64_t v26 = [v25 objectForKeyedSubscript:v9];
          double v27 = [v26 objectForKeyedSubscript:v10];
          double v28 = [v24 stringWithFormat:@"Model RRC state transistion: mavVersion=%@, rat=%@, state=%@, basebandModel=%@", v11, v9, v10, v27];

          double v29 = (void *)MEMORY[0x1E4F929B8];
          double v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
          double v31 = [v30 lastPathComponent];
          double v32 = [NSString stringWithUTF8String:"-[PLBBAgent modelStateTransitionPower:rat:state:]"];
          [v29 logMessage:v28 fromFile:v31 fromFunction:v32 fromLineNumber:3336];

          double v33 = PLLogCommon();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v39 = v28;
            _os_log_debug_impl(&dword_1D2690000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          uint64_t v14 = v36;
        }
      }
      double v34 = [v8 entryDate];
      double v35 = [MEMORY[0x1E4F92900] sharedInstance];
      [(PLBBAgent *)self lastBBProtoPower];
      objc_msgSend(v35, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 22, v34);

      [(PLBBAgent *)self setLastBBProtoPower:v22];
    }
  }
}

uint64_t __49__PLBBAgent_modelStateTransitionPower_rat_state___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D41 = result;
  return result;
}

- (void)modelMav10BBHWPower:(id)a3
{
  uint64_t v1186 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"PLBBAgent_EventBackward_MavBBHwOtherPerRAT"];

  id v1136 = v3;
  if (v4)
  {
    long long v1182 = 0u;
    long long v1180 = 0u;
    long long v1181 = 0u;
    long long v1179 = 0u;
    uint64_t v5 = [v3 objectForKeyedSubscript:@"PLBBAgent_EventBackward_MavBBHwOtherPerRAT"];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v1179 objects:v1185 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      v1167 = 0;
      v1166 = 0;
      v1170 = 0;
      v1168 = 0;
      v1169 = 0;
      id v8 = 0;
      uint64_t v9 = *(void *)v1180;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v1180 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void **)(*((void *)&v1179 + 1) + 8 * i);
          double v12 = [v11 objectForKeyedSubscript:@"RadioTech"];
          int v13 = [v12 intValue];

          uint64_t v14 = v8;
          double v15 = v11;
          switch(v13)
          {
            case 0:
              goto LABEL_14;
            case 1:
              uint64_t v14 = v1169;
              v1169 = v11;
              goto LABEL_13;
            case 2:
              uint64_t v14 = v1168;
              v1168 = v11;
              goto LABEL_13;
            case 3:
              uint64_t v14 = v1170;
              v1170 = v11;
              goto LABEL_13;
            case 4:
              uint64_t v14 = v1166;
              v1166 = v11;
              goto LABEL_13;
            case 5:
              uint64_t v14 = v1167;
              v1167 = v11;
LABEL_13:
              double v15 = v8;
LABEL_14:
              id v16 = v11;

              id v8 = v15;
              break;
            default:
              continue;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v1179 objects:v1185 count:16];
      }
      while (v7);
    }
    else
    {
      v1167 = 0;
      v1166 = 0;
      v1170 = 0;
      v1168 = 0;
      v1169 = 0;
      id v8 = 0;
    }

    id v3 = v1136;
  }
  else
  {
    v1167 = 0;
    v1166 = 0;
    v1170 = 0;
    v1168 = 0;
    v1169 = 0;
    id v8 = 0;
  }
  uint64_t v17 = [v3 objectForKeyedSubscript:@"PLBBAgent_EventBackward_BBMavHwRf1x"];
  if (v17)
  {
    uint64_t v18 = [v3 objectForKeyedSubscript:@"PLBBAgent_EventBackward_BBMavHwRf1x"];
    id v1143 = [v18 objectAtIndexedSubscript:0];
  }
  else
  {
    id v1143 = 0;
  }

  uint64_t v19 = [v3 objectForKeyedSubscript:@"PLBBAgent_EventBackward_BBMavHwRfHDR"];
  if (v19)
  {
    uint64_t v20 = [v3 objectForKeyedSubscript:@"PLBBAgent_EventBackward_BBMavHwRfHDR"];
    id v1142 = [v20 objectAtIndexedSubscript:0];
  }
  else
  {
    id v1142 = 0;
  }

  double v21 = [v3 objectForKeyedSubscript:@"PLBBAgent_EventBackward_BBMavHwRfGSM"];
  if (v21)
  {
    double v22 = [v3 objectForKeyedSubscript:@"PLBBAgent_EventBackward_BBMavHwRfGSM"];
    id v1137 = [v22 objectAtIndexedSubscript:0];
  }
  else
  {
    id v1137 = 0;
  }

  uint64_t v23 = [v3 objectForKeyedSubscript:@"PLBBAgent_EventBackward_BBMavHwRfWCDMA"];
  if (v23)
  {
    uint64_t v24 = [v3 objectForKeyedSubscript:@"PLBBAgent_EventBackward_BBMavHwRfWCDMA"];
    id v25 = [v24 objectAtIndexedSubscript:0];
  }
  else
  {
    id v25 = 0;
  }

  uint64_t v26 = [v3 objectForKeyedSubscript:@"PLBBAgent_EventBackward_BBMavHwRfLTE"];
  if (v26)
  {
    double v27 = [v3 objectForKeyedSubscript:@"PLBBAgent_EventBackward_BBMavHwRfLTE"];
    id v1144 = [v27 objectAtIndexedSubscript:0];
  }
  else
  {
    id v1144 = 0;
  }

  double v28 = [v3 objectForKeyedSubscript:@"PLBBAgent_EventBackward_BBMavHwRfTDS"];
  if (v28)
  {
    double v29 = [v3 objectForKeyedSubscript:@"PLBBAgent_EventBackward_BBMavHwRfTDS"];
    id v1145 = [v29 objectAtIndexedSubscript:0];
  }
  else
  {
    id v1145 = 0;
  }

  double v30 = [v3 objectForKeyedSubscript:@"PLBBAgent_EventBackward_MavBBHwOther"];
  double v31 = [v30 objectAtIndexedSubscript:0];

  double v32 = [v31 entryDate];
  v1131 = v31;
  double v33 = [v31 objectForKeyedSubscript:@"LogDuration"];
  [v33 doubleValue];
  double v35 = v34;

  v1165 = [MEMORY[0x1E4F92A88] MavRevStringQuery];
  if (v35 > 0.0)
  {
    [MEMORY[0x1E4F92A88] powerModelForOperatorName:@"baseband"];
    double v1117 = 0.0;
    double v1122 = 0.0;
    double v1123 = 0.0;
    double v36 = 0.0;
    id v1135 = v25;
    double v37 = v1116 = v32;
    v1164 = v37;
    if (v1143)
    {
      double v38 = [v1143 objectForKeyedSubscript:@"DTxOn"];
      [v38 doubleValue];
      double v40 = v39;
      uint64_t v41 = [v37 objectForKeyedSubscript:v1165];
      uint64_t v42 = [v41 objectForKeyedSubscript:@"CDMA2K"];
      int64_t v43 = [v42 objectForKeyedSubscript:@"DTxOn"];
      [v43 doubleValue];
      double v45 = v40 * v44;

      uint64_t v46 = [v1143 objectForKeyedSubscript:@"DurationInCallType"];
      uint64_t v47 = [v46 objectAtIndexedSubscript:1];
      [v47 doubleValue];
      double v49 = v48;
      int64_t v50 = [v37 objectForKeyedSubscript:v1165];
      id v51 = [v50 objectForKeyedSubscript:@"CDMA2K"];
      uint64_t v52 = [v51 objectForKeyedSubscript:@"Voice"];
      [v52 doubleValue];
      double v54 = v49 * v53;

      v1153 = [v46 objectAtIndexedSubscript:2];
      [v1153 doubleValue];
      double v56 = v55;
      [v46 objectAtIndexedSubscript:3];
      v58 = uint64_t v57 = v37;
      [v58 doubleValue];
      double v60 = v56 + v59;
      id v61 = [v46 objectAtIndexedSubscript:4];
      [v61 doubleValue];
      double v63 = v60 + v62;
      v1158 = v46;
      id v64 = [v46 objectAtIndexedSubscript:5];
      [v64 doubleValue];
      double v66 = v63 + v65;
      v67 = [v57 objectForKeyedSubscript:v1165];
      uint64_t v68 = [v67 objectForKeyedSubscript:@"CDMA2K"];
      id v69 = [v68 objectForKeyedSubscript:@"Connected"];
      [v69 doubleValue];
      double v71 = v66 * v70;

      double v72 = 0.0;
      double v73 = 0.0;
      if (v8)
      {
        uint64_t v74 = [v8 objectForKeyedSubscript:@"TxPowerHist"];
        for (uint64_t j = 0; j != 12; ++j)
        {
          v76 = [v74 objectAtIndexedSubscript:j];
          [v76 doubleValue];
          double v78 = v77;
          v79 = [v1164 objectForKeyedSubscript:v1165];
          int v80 = [v79 objectForKeyedSubscript:@"CDMA2K"];
          v81 = [v80 objectForKeyedSubscript:@"txPower"];
          v82 = [v81 objectAtIndexedSubscript:j];
          [v82 doubleValue];
          double v73 = v73 + v78 * v83;
        }
        double v36 = 0.0;
        for (uint64_t k = 8; k != 12; ++k)
        {
          int v85 = [v74 objectAtIndexedSubscript:k];
          [v85 doubleValue];
          double v36 = v36 + v86;
        }
      }
      double v87 = v45 / v35 + v73 / v35;
      if (v87 <= 0.0)
      {
        double v89 = 0.0;
        id v25 = v1135;
        double v37 = v1164;
      }
      else
      {
        double v88 = v54 + v71;
        double v89 = 0.0;
        id v25 = v1135;
        double v37 = v1164;
        if (v54 + v71 > 0.0)
        {
          double v89 = v54 * v87 / v88;
          double v72 = v71 * v87 / v88;
        }
      }
      double v1122 = v71 / v35 + v72;
      double v1123 = v54 / v35 + v89;
    }
    unint64_t v90 = 0x1E4F92000uLL;
    double v1146 = v35;
    if (v1142 && v1169)
    {
      v91 = [v1169 objectForKeyedSubscript:@"ProtocolStateHist"];
      v92 = [v91 objectAtIndexedSubscript:8];
      [v92 doubleValue];
      double v94 = v93;

      uint64_t v95 = [v37 objectForKeyedSubscript:v1165];
      v96 = [v95 objectForKeyedSubscript:@"1xEVDO"];
      v97 = [v96 objectForKeyedSubscript:@"Connected"];
      [v97 doubleValue];
      double v1154 = v98;

      v99 = [v1142 objectForKeyedSubscript:@"SDTXOnFrames"];
      [v99 doubleValue];
      double v101 = v100;

      uint64_t v102 = [v1142 objectForKeyedSubscript:@"SDTXOffFrames"];
      [v102 doubleValue];
      uint64_t v104 = v103;

      v105 = [v1142 objectForKeyedSubscript:@"LTXOnFrames"];
      [v105 doubleValue];
      double v107 = v106;

      v108 = [v1142 objectForKeyedSubscript:@"LTXOffFrames"];
      [v108 doubleValue];
      uint64_t v110 = v109;

      v111 = [v1142 objectForKeyedSubscript:@"TTXOnFrames"];
      [v111 doubleValue];
      uint64_t v113 = v112;

      v114 = [v1142 objectForKeyedSubscript:@"TTXOffFrames"];
      [v114 doubleValue];
      uint64_t v116 = v115;

      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v117 = objc_opt_class();
        v1178[0] = MEMORY[0x1E4F143A8];
        v1178[1] = 3221225472;
        v1178[2] = __33__PLBBAgent_modelMav10BBHWPower___block_invoke;
        v1178[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v1178[4] = v117;
        v118 = v1178;
        if (qword_1EBD59210 != -1) {
          dispatch_once(&qword_1EBD59210, v118);
        }

        if (byte_1EBD58D42)
        {
          v119 = objc_msgSend(NSString, "stringWithFormat:", @"EVDO stats: %f %f %f %f %f %f", *(void *)&v101, v104, *(void *)&v107, v110, v113, v116);
          v120 = (void *)MEMORY[0x1E4F929B8];
          v121 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
          v122 = [v121 lastPathComponent];
          v123 = [NSString stringWithUTF8String:"-[PLBBAgent modelMav10BBHWPower:]"];
          [v120 logMessage:v119 fromFile:v122 fromFunction:v123 fromLineNumber:3566];

          v124 = PLLogCommon();
          if (os_log_type_enabled(v124, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v1184 = v119;
            _os_log_debug_impl(&dword_1D2690000, v124, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      double v125 = v94 * v1154;
      v1159 = v91;
      if (v101 + v107 <= v94)
      {
        id v126 = [v37 objectForKeyedSubscript:v1165];
        id v127 = [v126 objectForKeyedSubscript:@"1xEVDO"];
        v128 = [v127 objectForKeyedSubscript:@"DTXSavings"];
        [v128 doubleValue];
        double v130 = (v101 + v107) * v129;

        double v125 = v125 - v130;
      }
      double v35 = v1146;
      v131 = [v1169 objectForKeyedSubscript:@"TxPowerHist"];
      uint64_t v132 = 0;
      double v133 = 0.0;
      do
      {
        v134 = [v131 objectAtIndexedSubscript:v132];
        [v134 doubleValue];
        double v136 = v135;
        v137 = [v1164 objectForKeyedSubscript:v1165];
        v138 = [v137 objectForKeyedSubscript:@"1xEVDO"];
        v139 = [v138 objectForKeyedSubscript:@"txPower"];
        v140 = [v139 objectAtIndexedSubscript:v132];
        [v140 doubleValue];
        double v133 = v133 + v136 * v141;

        ++v132;
      }
      while (v132 != 12);
      uint64_t v142 = 8;
      unint64_t v90 = 0x1E4F92000;
      do
      {
        v143 = [v131 objectAtIndexedSubscript:v142];
        [v143 doubleValue];
        double v36 = v36 + v144;

        ++v142;
      }
      while (v142 != 12);
      double v1117 = v125 / v1146 + v133 / v1146;

      id v25 = v1135;
      double v37 = v1164;
    }
    double v1126 = 0.0;
    if (v1137)
    {
      v145 = [v1137 objectForKeyedSubscript:@"ConnStates"];
      v146 = [v145 objectAtIndexedSubscript:1];
      [v146 doubleValue];
      double v148 = v147;
      v149 = [v37 objectForKeyedSubscript:v1165];
      v150 = [v149 objectForKeyedSubscript:@"GSM"];
      v151 = [v150 objectForKeyedSubscript:@"ConnStates"];
      v152 = [v151 objectAtIndexedSubscript:1];
      [v152 doubleValue];
      double v154 = v148 * v153;

      v1160 = v145;
      v155 = [v145 objectAtIndexedSubscript:2];
      [v155 doubleValue];
      double v157 = v156;
      v158 = [v37 objectForKeyedSubscript:v1165];
      v159 = [v158 objectForKeyedSubscript:@"GSM"];
      v160 = [v159 objectForKeyedSubscript:@"ConnStates"];
      v161 = [v160 objectAtIndexedSubscript:2];
      [v161 doubleValue];
      double v163 = v157 * v162;

      if (v1168)
      {
        v164 = [v1168 objectForKeyedSubscript:@"TxPowerHist"];
        uint64_t v165 = 0;
        double v166 = 0.0;
        do
        {
          v167 = [v164 objectAtIndexedSubscript:v165];
          [v167 doubleValue];
          double v169 = v168;
          v170 = [v1164 objectForKeyedSubscript:v1165];
          v171 = [v170 objectForKeyedSubscript:@"GSM"];
          v172 = [v171 objectForKeyedSubscript:@"txPower"];
          v173 = [v172 objectAtIndexedSubscript:v165];
          [v173 doubleValue];
          double v166 = v166 + v169 * v174;

          ++v165;
        }
        while (v165 != 12);
        for (uint64_t m = 8; m != 12; ++m)
        {
          v176 = [v164 objectAtIndexedSubscript:m];
          [v176 doubleValue];
          double v36 = v36 + v177;
        }
        v178 = [v1168 objectForKeyedSubscript:@"RSSIModeCount"];
        v179 = [v178 objectAtIndexedSubscript:1];
        [v179 doubleValue];
        double v181 = v180;
        v182 = [v178 objectAtIndexedSubscript:2];
        [v182 doubleValue];
        double v184 = v181 + v183;
        v185 = [v178 objectAtIndexedSubscript:3];
        [v185 doubleValue];
        double v187 = v184 + v186;
        v188 = [v1164 objectForKeyedSubscript:v1165];
        v189 = [v188 objectForKeyedSubscript:@"GSM"];
        v190 = [v189 objectForKeyedSubscript:@"RX"];
        [v190 doubleValue];
        double v192 = v187 * v191;

        double v193 = v166 / v35 + v192 / v35;
        double v194 = 0.0;
        if (v193 <= 0.0)
        {
          double v195 = 0.0;
        }
        else
        {
          double v194 = v154 * v193 / (v154 + v163);
          if (v154 + v163 > 0.0)
          {
            double v195 = v163 * v193 / (v154 + v163);
          }
          else
          {
            double v194 = 0.0;
            double v195 = 0.0;
          }
        }
        id v25 = v1135;
        double v37 = v1164;
        unint64_t v90 = 0x1E4F92000uLL;
      }
      else
      {
        double v194 = 0.0;
        double v195 = 0.0;
        double v37 = v1164;
        unint64_t v90 = 0x1E4F92000;
        id v25 = v1135;
      }
      double v1114 = v163 / v35 + v195;
      double v1115 = v154 / v35 + v194;
    }
    else
    {
      double v1114 = 0.0;
      double v1115 = 0.0;
    }
    unint64_t v196 = 0x1E4F92000;
    if (!v25)
    {
      double v374 = 0.0;
      goto LABEL_140;
    }
    double v197 = 0.0;
    double v198 = 0.0;
    if (v1170)
    {
      v199 = [v1170 objectForKeyedSubscript:@"ProtocolStateHist"];
      v200 = [v199 objectAtIndexedSubscript:6];
      [v200 doubleValue];
      double v198 = v201;
    }
    v1161 = [v25 objectForKeyedSubscript:@"TxPwrBktArr"];
    v202 = [v25 objectForKeyedSubscript:@"DurationInPsRabType"];
    v203 = [v25 objectForKeyedSubscript:@"DurationInRabMode"];
    v1155 = [v25 objectForKeyedSubscript:@"SCEqTypeDuration"];
    v1147 = [v25 objectForKeyedSubscript:@"DCEqTypeDuration"];
    v1139 = [v25 objectForKeyedSubscript:@"SCQSetNumCell"];
    v1132 = [v25 objectForKeyedSubscript:@"DCQSetNumCell"];
    v1150 = [v25 objectForKeyedSubscript:@"TimeInCarrierMode"];
    v204 = [v25 objectForKeyedSubscript:@"FetCnt"];

    if (v204)
    {
      v205 = [v25 objectForKeyedSubscript:@"FetCnt"];
      [v205 doubleValue];
      double v197 = v206;
    }
    v1106 = v203;
    if ([*(id *)(v90 + 2496) debugEnabled])
    {
      uint64_t v207 = objc_opt_class();
      v1177[0] = MEMORY[0x1E4F143A8];
      v1177[1] = 3221225472;
      v1177[2] = __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1665;
      v1177[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v1177[4] = v207;
      v208 = v1177;
      if (qword_1EBD59218 != -1) {
        dispatch_once(&qword_1EBD59218, v208);
      }

      if (byte_1EBD58D43)
      {
        v209 = [NSString stringWithFormat:@"DurationInRabType = %@, DurationInRabMode = %@, SCEqTypeDuratiouint64_t n = %@, DCEqTypeDuratiouint64_t n = %@, SCQSetNumCell = %@, DCQSetNumCell = %@, TimeInCarrierMode=%@, fetCount=%f", v202, v203, v1155, v1147, v1139, v1132, v1150, *(void *)&v197];
        v210 = (void *)MEMORY[0x1E4F929B8];
        v211 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        v212 = [v211 lastPathComponent];
        v213 = [NSString stringWithUTF8String:"-[PLBBAgent modelMav10BBHWPower:]"];
        [v210 logMessage:v209 fromFile:v212 fromFunction:v213 fromLineNumber:3676];

        v214 = PLLogCommon();
        if (os_log_type_enabled(v214, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v1184 = v209;
          _os_log_debug_impl(&dword_1D2690000, v214, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v203 = v1106;
      }
    }
    double v1097 = v197;
    v215 = [v37 objectForKeyedSubscript:v1165];
    v216 = [v215 objectForKeyedSubscript:@"WCDMA"];
    v217 = [v216 objectForKeyedSubscript:@"Cell_FACH"];
    [v217 doubleValue];
    double v1093 = v218;

    v219 = [v203 objectAtIndexedSubscript:1];
    [v219 doubleValue];
    double v1128 = v220;

    v221 = [v203 objectAtIndexedSubscript:2];
    [v221 doubleValue];
    double v1127 = v222;

    v223 = [v203 objectAtIndexedSubscript:3];
    [v223 doubleValue];
    double v1124 = v224;

    v225 = [v37 objectForKeyedSubscript:v1165];
    v226 = [v225 objectForKeyedSubscript:@"WCDMA"];
    v227 = [v226 objectForKeyedSubscript:@"RabMode"];
    v228 = [v227 objectAtIndexedSubscript:1];
    [v228 doubleValue];
    double v1090 = v229;

    v230 = [v37 objectForKeyedSubscript:v1165];
    v231 = [v230 objectForKeyedSubscript:@"WCDMA"];
    v232 = [v231 objectForKeyedSubscript:@"RabMode"];
    v233 = [v232 objectAtIndexedSubscript:2];
    [v233 doubleValue];
    double v1085 = v234;

    v235 = [v37 objectForKeyedSubscript:v1165];
    v236 = [v235 objectForKeyedSubscript:@"WCDMA"];
    uint64_t v237 = [v236 objectForKeyedSubscript:@"RabMode"];
    v238 = [v237 objectAtIndexedSubscript:3];
    [v238 doubleValue];
    double v1082 = v239;

    v1118 = [v202 objectAtIndexedSubscript:1];
    [v1118 doubleValue];
    double v241 = v240;
    v1111 = [v37 objectForKeyedSubscript:v1165];
    v1071 = [v1111 objectForKeyedSubscript:@"WCDMA"];
    v1067 = [v1071 objectForKeyedSubscript:@"RabType"];
    v1063 = [v1067 objectAtIndexedSubscript:1];
    [v1063 doubleValue];
    double v243 = v242;
    v1060 = [v202 objectAtIndexedSubscript:2];
    [v1060 doubleValue];
    double v245 = v244;
    v246 = [v37 objectForKeyedSubscript:v1165];
    v247 = [v246 objectForKeyedSubscript:@"WCDMA"];
    v248 = [v247 objectForKeyedSubscript:@"RabType"];
    v249 = [v248 objectAtIndexedSubscript:2];
    [v249 doubleValue];
    double v251 = v245 * v250;
    v1102 = v202;
    v252 = [v202 objectAtIndexedSubscript:3];
    [v252 doubleValue];
    double v1078 = v253;
    v254 = [v1164 objectForKeyedSubscript:v1165];
    v255 = [v254 objectForKeyedSubscript:@"WCDMA"];
    v256 = [v255 objectForKeyedSubscript:@"RabType"];
    v257 = [v256 objectAtIndexedSubscript:3];
    [v257 doubleValue];
    double v1075 = v258;

    v259 = [v1155 objectAtIndexedSubscript:2];
    [v259 doubleValue];
    double v261 = v260;
    v262 = [v1147 objectAtIndexedSubscript:2];
    [v262 doubleValue];
    double v264 = v261 - v263;

    double v1112 = 0.0;
    double v265 = 0.0;
    if (v264 > 0.0)
    {
      v266 = [v1155 objectAtIndexedSubscript:2];
      [v266 doubleValue];
      double v268 = v267;
      v269 = [v1147 objectAtIndexedSubscript:2];
      [v269 doubleValue];
      double v271 = v268 - v270;
      v272 = [v1164 objectForKeyedSubscript:v1165];
      v273 = [v272 objectForKeyedSubscript:@"WCDMA"];
      v274 = [v273 objectForKeyedSubscript:@"SCeq"];
      v275 = [v274 objectAtIndexedSubscript:1];
      [v275 doubleValue];
      double v265 = v271 * v276 + 0.0;
    }
    double v1072 = v251 + v241 * v243;
    v277 = [v1147 objectAtIndexedSubscript:2];
    [v277 doubleValue];
    double v279 = v278;
    v280 = [v1164 objectForKeyedSubscript:v1165];
    v281 = [v280 objectForKeyedSubscript:@"WCDMA"];
    v282 = [v281 objectForKeyedSubscript:@"DCeq"];
    v283 = [v282 objectAtIndexedSubscript:2];
    [v283 doubleValue];
    double v285 = v265 + v279 * v284;

    v286 = [v1139 objectAtIndexedSubscript:2];
    [v286 doubleValue];
    double v288 = v287;
    v289 = [v1164 objectForKeyedSubscript:v1165];
    v290 = [v289 objectForKeyedSubscript:@"WCDMA"];
    v291 = [v290 objectForKeyedSubscript:@"SCeq"];
    v292 = [v291 objectAtIndexedSubscript:1];
    [v292 doubleValue];
    double v294 = v285 + v288 * v293;

    v295 = [v1139 objectAtIndexedSubscript:3];
    [v295 doubleValue];
    double v1068 = v296;
    v297 = [v1164 objectForKeyedSubscript:v1165];
    v298 = [v297 objectForKeyedSubscript:@"WCDMA"];
    v299 = [v298 objectForKeyedSubscript:@"SCeq"];
    v300 = [v299 objectAtIndexedSubscript:2];
    [v300 doubleValue];
    double v1064 = v301;

    v1119 = [v1139 objectAtIndexedSubscript:1];
    [v1119 doubleValue];
    double v303 = v302;
    v1056 = [v1164 objectForKeyedSubscript:v1165];
    v1054 = [v1056 objectForKeyedSubscript:@"WCDMA"];
    v1053 = [v1054 objectForKeyedSubscript:@"SCqset"];
    v1052 = [v1053 objectAtIndexedSubscript:1];
    [v1052 doubleValue];
    double v305 = v304;
    v1051 = [v1139 objectAtIndexedSubscript:2];
    [v1051 doubleValue];
    double v307 = v306;
    v1050 = [v1164 objectForKeyedSubscript:v1165];
    v1049 = [v1050 objectForKeyedSubscript:@"WCDMA"];
    v1048 = [v1049 objectForKeyedSubscript:@"SCqset"];
    v1047 = [v1048 objectAtIndexedSubscript:2];
    [v1047 doubleValue];
    double v309 = v307 * v308 + v303 * v305;
    v1046 = [v1139 objectAtIndexedSubscript:3];
    [v1046 doubleValue];
    double v311 = v310;
    v1045 = [v1164 objectForKeyedSubscript:v1165];
    v1044 = [v1045 objectForKeyedSubscript:@"WCDMA"];
    v1043 = [v1044 objectForKeyedSubscript:@"SCqset"];
    v1042 = [v1043 objectAtIndexedSubscript:3];
    [v1042 doubleValue];
    double v313 = v309 + v311 * v312;
    v1041 = [v1132 objectAtIndexedSubscript:1];
    [v1041 doubleValue];
    double v315 = v314;
    v1040 = [v1164 objectForKeyedSubscript:v1165];
    v1039 = [v1040 objectForKeyedSubscript:@"WCDMA"];
    v1038 = [v1039 objectForKeyedSubscript:@"DCqset"];
    v1037 = [v1038 objectAtIndexedSubscript:1];
    [v1037 doubleValue];
    double v317 = v313 + v315 * v316;
    v1036 = [v1132 objectAtIndexedSubscript:2];
    [v1036 doubleValue];
    double v319 = v318;
    v320 = [v1164 objectForKeyedSubscript:v1165];
    v321 = [v320 objectForKeyedSubscript:@"WCDMA"];
    v322 = [v321 objectForKeyedSubscript:@"DCqset"];
    v323 = [v322 objectAtIndexedSubscript:2];
    [v323 doubleValue];
    double v1061 = v317 + v319 * v324;
    v325 = [v1132 objectAtIndexedSubscript:3];
    [v325 doubleValue];
    double v1059 = v326;
    v327 = [v1164 objectForKeyedSubscript:v1165];
    v328 = [v327 objectForKeyedSubscript:@"WCDMA"];
    v329 = [v328 objectForKeyedSubscript:@"DCqset"];
    v330 = [v329 objectAtIndexedSubscript:3];
    [v330 doubleValue];
    double v1058 = v331;

    v332 = [v1150 objectAtIndexedSubscript:1];
    [v332 doubleValue];
    double v1057 = v333;
    v334 = [v1164 objectForKeyedSubscript:v1165];
    v335 = [v334 objectForKeyedSubscript:@"WCDMA"];
    v336 = [v335 objectForKeyedSubscript:@"DC"];
    [v336 doubleValue];
    double v1055 = v337;

    v1120 = [v1170 objectForKeyedSubscript:@"RSSIModeCount"];
    v338 = [v1164 objectForKeyedSubscript:v1165];
    v339 = [v338 objectForKeyedSubscript:@"WCDMA"];
    v340 = [v339 objectForKeyedSubscript:@"RXD"];
    v341 = [v340 objectForKeyedSubscript:@"DC"];
    [v341 doubleValue];
    double v343 = v342;

    v344 = [v1164 objectForKeyedSubscript:v1165];
    v345 = [v344 objectForKeyedSubscript:@"WCDMA"];
    v346 = [v345 objectForKeyedSubscript:@"RXD"];
    v347 = [v346 objectForKeyedSubscript:@"SC"];
    [v347 doubleValue];
    double v349 = v348;

    v350 = [v1150 objectAtIndexedSubscript:0];
    [v350 doubleValue];
    double v352 = v351;
    v353 = [v1150 objectAtIndexedSubscript:1];
    [v353 doubleValue];
    double v355 = v352 + v354;

    if (v355 > 0.0)
    {
      v356 = [v1120 objectAtIndexedSubscript:3];
      [v356 doubleValue];
      double v358 = v357;
      v359 = [v1150 objectAtIndexedSubscript:0];
      [v359 doubleValue];
      double v361 = v360 / v355;
      v362 = [v1150 objectAtIndexedSubscript:1];
      [v362 doubleValue];
      double v1112 = v358 * (v343 * (v363 / v355) + v349 * v361);
    }
    double v1094 = v198 * v1093;
    double v364 = v1127 * v1085;
    double v365 = v1072 + v1078 * v1075;
    double v366 = v294 + v1068 * v1064;
    v367 = [v1164 objectForKeyedSubscript:v1165];
    v368 = [v367 objectForKeyedSubscript:@"WCDMA"];
    v369 = [v368 objectForKeyedSubscript:@"FetCnt"];
    [v369 doubleValue];
    double v371 = v1097 * v370;

    v372 = v1161;
    if ([MEMORY[0x1E4F92A38] isBasebandClass:1003003])
    {
      unsigned int v373 = 12;
    }
    else
    {
      unsigned int v373 = 12;
      if (([MEMORY[0x1E4F92A38] isBasebandClass:1003004] & 1) == 0)
      {
        int v375 = [MEMORY[0x1E4F92A38] isBasebandClass:1003005];
        if (v375) {
          int v376 = 12;
        }
        else {
          int v376 = 8;
        }
        unsigned int v1079 = v376;
        if (v375) {
          unsigned int v373 = 16;
        }
        else {
          unsigned int v373 = 12;
        }
        goto LABEL_110;
      }
    }
    unsigned int v1079 = 8;
LABEL_110:
    uint64_t v377 = 0;
    double v1095 = v1094 / v1146;
    double v1098 = v1128 * v1090 / v1146;
    double v1086 = v1124 * v1082 / v1146;
    double v1091 = v364 / v1146;
    uint64_t v378 = v373;
    double v379 = 0.0;
    double v380 = v371 / v1146;
    do
    {
      v381 = [v372 objectAtIndexedSubscript:v377];
      [v381 doubleValue];
      double v383 = v382;
      v384 = [v1164 objectForKeyedSubscript:v1165];
      v385 = [v384 objectForKeyedSubscript:@"WCDMA"];
      v386 = [v385 objectForKeyedSubscript:@"txPower"];
      v387 = [v386 objectAtIndexedSubscript:v377];
      [v387 doubleValue];
      double v379 = v379 + v383 * v388;

      v372 = v1161;
      ++v377;
    }
    while (v378 != v377);
    if (v1079 >= v378)
    {
      double v37 = v1164;
      unint64_t v90 = 0x1E4F92000uLL;
    }
    else
    {
      uint64_t v389 = v1079;
      double v37 = v1164;
      unint64_t v90 = 0x1E4F92000;
      do
      {
        v390 = [v1161 objectAtIndexedSubscript:v389];
        [v390 doubleValue];
        double v36 = v36 + v391;

        ++v389;
      }
      while (v378 != v389);
    }
    double v392 = v365 / v1146
         + v366 / v1146
         + (v1061 + v1059 * v1058) / v1146
         + v1057 * v1055 / v1146
         + v1112 / v1146
         + v379 / v1146;
    double v393 = 0.0;
    if (v392 <= v380) {
      double v394 = 0.0;
    }
    else {
      double v394 = v380;
    }
    double v395 = v1128 + v1127 + v1124;
    double v396 = 0.0;
    unint64_t v196 = 0x1E4F92000;
    if (v395 > 0.0)
    {
      double v397 = v392 - v394;
      if (v1128 + v1124 > 0.0) {
        double v393 = (v1128 + v1124 * 0.5) * v397 / v395;
      }
      if (v1127 + v1124 > 0.0) {
        double v396 = (v1127 + v1124 * 0.5) * v397 / v395;
      }
    }
    double v374 = v1095 + v1091 + v1086 + v396;
    double v35 = v1146;
    if ([*(id *)(v90 + 2496) debugEnabled])
    {
      uint64_t v398 = objc_opt_class();
      v1176[0] = MEMORY[0x1E4F143A8];
      v1176[1] = 3221225472;
      v1176[2] = __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1671;
      v1176[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v1176[4] = v398;
      v399 = v1176;
      if (qword_1EBD59220 != -1) {
        dispatch_once(&qword_1EBD59220, v399);
      }

      if (byte_1EBD58D44)
      {
        v400 = [NSString stringWithFormat:@"wcdmaDataPower = %f, wcdmaFACHPower = %f, wcdmaPSonlyPower = %f, wcdmaMRABPower = %f, wcdmaDataAdder = %f", *(void *)&v374, *(void *)&v1095, *(void *)&v1091, *(void *)&v1086, *(void *)&v396];
        v401 = (void *)MEMORY[0x1E4F929B8];
        v402 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        v403 = [v402 lastPathComponent];
        v404 = [NSString stringWithUTF8String:"-[PLBBAgent modelMav10BBHWPower:]"];
        [v401 logMessage:v400 fromFile:v403 fromFunction:v404 fromLineNumber:3825];

        v405 = PLLogCommon();
        if (os_log_type_enabled(v405, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v1184 = v400;
          _os_log_debug_impl(&dword_1D2690000, v405, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        unint64_t v196 = 0x1E4F92000;
      }
    }
    double v1126 = v1098 + v393;
    if ([*(id *)(v90 + 2496) debugEnabled])
    {
      uint64_t v406 = objc_opt_class();
      v1175[0] = MEMORY[0x1E4F143A8];
      v1175[1] = 3221225472;
      v1175[2] = __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1677;
      v1175[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v1175[4] = v406;
      v407 = v1175;
      if (qword_1EBD59228 != -1) {
        dispatch_once(&qword_1EBD59228, v407);
      }

      if (byte_1EBD58D45)
      {
        v408 = [NSString stringWithFormat:@"wcdmaVoicePower = %f, wcdmaCSonlyPower = %f, wcdmaVoiceAdder = %f", *(void *)&v1126, *(void *)&v1098, *(void *)&v393];
        v409 = (void *)MEMORY[0x1E4F929B8];
        v410 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        v411 = [v410 lastPathComponent];
        v412 = [NSString stringWithUTF8String:"-[PLBBAgent modelMav10BBHWPower:]"];
        [v409 logMessage:v408 fromFile:v411 fromFunction:v412 fromLineNumber:3826];

        v413 = PLLogCommon();
        if (os_log_type_enabled(v413, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v1184 = v408;
          _os_log_debug_impl(&dword_1D2690000, v413, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        unint64_t v196 = 0x1E4F92000;
      }
    }

LABEL_140:
    double v1121 = 0.0;
    double v1113 = v374;
    if (!v1144)
    {
      double v450 = 0.0;
      id v25 = v1135;
LABEL_269:
      double v1163 = v450;
      if (v1145)
      {
        v850 = [v1145 objectForKeyedSubscript:@"SrvcType"];
        v851 = [v850 objectAtIndexedSubscript:0];
        [v851 doubleValue];
        double v853 = v852;
        v854 = [v37 objectForKeyedSubscript:v1165];
        v855 = [v854 objectForKeyedSubscript:@"UTRAN"];
        v856 = [v855 objectForKeyedSubscript:@"SrvcType"];
        v857 = [v856 objectAtIndexedSubscript:0];
        [v857 doubleValue];
        double v858 = 0.0;
        double v860 = v853 * v859 + 0.0;

        v861 = [v850 objectAtIndexedSubscript:1];
        [v861 doubleValue];
        double v863 = v862;
        v864 = [v37 objectForKeyedSubscript:v1165];
        v865 = [v864 objectForKeyedSubscript:@"UTRAN"];
        v866 = [v865 objectForKeyedSubscript:@"SrvcType"];
        v867 = [v866 objectAtIndexedSubscript:1];
        [v867 doubleValue];
        double v869 = v863 * v868 + 0.0;

        v870 = [v850 objectAtIndexedSubscript:2];
        [v870 doubleValue];
        double v872 = v871;
        v873 = [v37 objectForKeyedSubscript:v1165];
        v874 = [v873 objectForKeyedSubscript:@"UTRAN"];
        v875 = [v874 objectForKeyedSubscript:@"SrvcType"];
        v876 = [v875 objectAtIndexedSubscript:2];
        [v876 doubleValue];
        double v878 = v869 + v872 * v877;

        v879 = [v850 objectAtIndexedSubscript:5];
        [v879 doubleValue];
        double v881 = v880;
        v882 = [v37 objectForKeyedSubscript:v1165];
        v883 = [v882 objectForKeyedSubscript:@"UTRAN"];
        v884 = [v883 objectForKeyedSubscript:@"SrvcType"];
        v885 = [v884 objectAtIndexedSubscript:5];
        [v885 doubleValue];
        double v887 = v878 + v881 * v886;

        v1157 = v850;
        v888 = [v850 objectAtIndexedSubscript:3];
        [v888 doubleValue];
        double v890 = v889;
        v891 = [v37 objectForKeyedSubscript:v1165];
        v892 = [v891 objectForKeyedSubscript:@"UTRAN"];
        v893 = [v892 objectForKeyedSubscript:@"SrvcType"];
        v894 = [v893 objectAtIndexedSubscript:0];
        [v894 doubleValue];
        double v896 = v860 + v890 * v895;

        v897 = [v850 objectAtIndexedSubscript:3];
        [v897 doubleValue];
        double v899 = v898;
        v900 = [v37 objectForKeyedSubscript:v1165];
        v901 = [v900 objectForKeyedSubscript:@"UTRAN"];
        v902 = [v901 objectForKeyedSubscript:@"SrvcType"];
        v903 = [v902 objectAtIndexedSubscript:3];
        [v903 doubleValue];
        double v905 = v904;
        v906 = [v1164 objectForKeyedSubscript:v1165];
        v907 = [v906 objectForKeyedSubscript:@"UTRAN"];
        v908 = [v907 objectForKeyedSubscript:@"SrvcType"];
        v909 = [v908 objectAtIndexedSubscript:0];
        [v909 doubleValue];
        double v911 = v887 + v899 * (v905 - v910);

        v912 = [v1157 objectAtIndexedSubscript:4];
        [v912 doubleValue];
        double v914 = v913;
        v915 = [v1164 objectForKeyedSubscript:v1165];
        v916 = [v915 objectForKeyedSubscript:@"UTRAN"];
        v917 = [v916 objectForKeyedSubscript:@"SrvcType"];
        v918 = [v917 objectAtIndexedSubscript:0];
        [v918 doubleValue];
        double v920 = v896 + v914 * v919;

        v921 = [v1157 objectAtIndexedSubscript:4];
        [v921 doubleValue];
        double v923 = v922;
        v924 = [v1164 objectForKeyedSubscript:v1165];
        v925 = [v924 objectForKeyedSubscript:@"UTRAN"];
        v926 = [v925 objectForKeyedSubscript:@"SrvcType"];
        v927 = [v926 objectAtIndexedSubscript:4];
        [v927 doubleValue];
        double v929 = v928;
        v930 = [v1164 objectForKeyedSubscript:v1165];
        v931 = [v930 objectForKeyedSubscript:@"UTRAN"];
        v932 = [v931 objectForKeyedSubscript:@"SrvcType"];
        v933 = [v932 objectAtIndexedSubscript:0];
        [v933 doubleValue];
        double v935 = v911 + v923 * (v929 - v934);

        v1152 = [v1145 objectForKeyedSubscript:@"RxDState"];
        v936 = [v1152 objectAtIndexedSubscript:1];
        [v936 doubleValue];
        double v1149 = v937;
        v938 = [v1164 objectForKeyedSubscript:v1165];
        v939 = [v938 objectForKeyedSubscript:@"UTRAN"];
        v940 = [v939 objectForKeyedSubscript:@"RxDState"];
        v941 = [v940 objectAtIndexedSubscript:1];
        [v941 doubleValue];
        double v1141 = v942;

        if (v1167)
        {
          double v1134 = v920;
          v943 = [v1167 objectForKeyedSubscript:@"RSSIModeCount"];
          v944 = [v943 objectAtIndexedSubscript:1];
          [v944 doubleValue];
          double v946 = v945;
          v947 = [v943 objectAtIndexedSubscript:2];
          [v947 doubleValue];
          double v949 = v948;
          v1130 = v943;
          v950 = [v943 objectAtIndexedSubscript:3];
          [v950 doubleValue];
          double v952 = v951;
          v953 = [v1164 objectForKeyedSubscript:v1165];
          v954 = [v953 objectForKeyedSubscript:@"UTRAN"];
          v955 = [v954 objectForKeyedSubscript:@"RX"];
          [v955 doubleValue];
          double v957 = v956;

          v958 = [v1167 objectForKeyedSubscript:@"TxPowerHist"];
          uint64_t v959 = 0;
          double v960 = 0.0;
          do
          {
            v961 = [v958 objectAtIndexedSubscript:v959];
            [v961 doubleValue];
            double v963 = v962;
            v964 = [v1164 objectForKeyedSubscript:v1165];
            v965 = [v964 objectForKeyedSubscript:@"UTRAN"];
            v966 = [v965 objectForKeyedSubscript:@"txPower"];
            v967 = [v966 objectAtIndexedSubscript:v959];
            [v967 doubleValue];
            double v960 = v960 + v963 * v968;

            ++v959;
          }
          while (v959 != 12);
          double v969 = v946 + v949 + v952;
          for (uint64_t n = 8; n != 12; ++n)
          {
            v971 = [v958 objectAtIndexedSubscript:n];
            [v971 doubleValue];
            double v36 = v36 + v972;
          }
          double v973 = v1146;
          double v858 = v969 * v957 / v1146;
          double v974 = v960 / v1146;

          id v25 = v1135;
          unint64_t v90 = 0x1E4F92000;
          v975 = v1157;
          double v920 = v1134;
        }
        else
        {
          double v974 = 0.0;
          id v25 = v1135;
          double v973 = v1146;
          unint64_t v90 = 0x1E4F92000uLL;
          v975 = v1157;
        }
        double v977 = v920 / v973;
        double v976 = v935 / v973;
        v978 = [v975 objectAtIndexedSubscript:0];
        [v978 doubleValue];
        double v980 = v979;
        v981 = [v975 objectAtIndexedSubscript:3];
        [v981 doubleValue];
        double v983 = v980 + v982;
        v984 = [v975 objectAtIndexedSubscript:4];
        [v984 doubleValue];
        double v986 = v983 + v985;

        v987 = [v975 objectAtIndexedSubscript:1];
        [v987 doubleValue];
        double v989 = v988;
        v990 = [v975 objectAtIndexedSubscript:2];
        [v990 doubleValue];
        double v992 = v989 + v991;
        v993 = [v975 objectAtIndexedSubscript:3];
        [v993 doubleValue];
        double v995 = v992 + v994;
        v996 = [v975 objectAtIndexedSubscript:4];
        [v996 doubleValue];
        double v998 = v995 + v997;
        v999 = [v975 objectAtIndexedSubscript:5];
        [v999 doubleValue];
        double v1001 = v998 + v1000;

        double v1002 = v986 + v1001;
        double v32 = v1116;
        if (v986 + v1001 > 0.0)
        {
          double v1003 = v1149 * v1141 / v973 + v858 + v974;
          double v977 = v977 + v1003 * v986 / v1002;
          double v976 = v976 + v1003 * v1001 / v1002;
        }
        id v3 = v1136;
        double v1121 = v977;
      }
      else
      {
        double v976 = 0.0;
        id v3 = v1136;
        double v32 = v1116;
      }
      if (v1122 >= 0.0) {
        double v1004 = v1122;
      }
      else {
        double v1004 = 0.0;
      }
      if (v1117 >= 0.0) {
        double v1005 = v1117;
      }
      else {
        double v1005 = 0.0;
      }
      if (v1114 >= 0.0) {
        double v1006 = v1114;
      }
      else {
        double v1006 = 0.0;
      }
      if (v1113 >= 0.0) {
        double v1007 = v1113;
      }
      else {
        double v1007 = 0.0;
      }
      if (v1163 >= 0.0) {
        double v1008 = v1163;
      }
      else {
        double v1008 = 0.0;
      }
      double v1009 = v1004 + v1005 + v1006 + v1007 + v1008 + v976;
      if (v1009 > 3000.0 || v1009 < 0.0) {
        double v1011 = 0.0;
      }
      else {
        double v1011 = v1004 + v1005 + v1006 + v1007 + v1008 + v976;
      }
      if ([*(id *)(v90 + 2496) debugEnabled])
      {
        uint64_t v1012 = objc_opt_class();
        v1172[0] = MEMORY[0x1E4F143A8];
        v1172[1] = 3221225472;
        v1172[2] = __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1705;
        v1172[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v1172[4] = v1012;
        v1013 = v1172;
        if (qword_1EBD59240 != -1) {
          dispatch_once(&qword_1EBD59240, v1013);
        }

        if (byte_1EBD58D48)
        {
          id v1014 = v25;
          v1015 = [NSString stringWithFormat:@"cdma2kDataPower=%f, evdoPower=%f, gsmDataPower=%f, wcdmaDataPower=%f, ltePower=%f, tdscdmaDataPower=%f, basebandDataPower=%f, BBDate=%@", *(void *)&v1004, *(void *)&v1005, *(void *)&v1006, *(void *)&v1007, *(void *)&v1008, *(void *)&v976, *(void *)&v1011, v32];
          v1016 = (void *)MEMORY[0x1E4F929B8];
          v1017 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
          v1018 = [v1017 lastPathComponent];
          v1019 = [NSString stringWithUTF8String:"-[PLBBAgent modelMav10BBHWPower:]"];
          [v1016 logMessage:v1015 fromFile:v1018 fromFunction:v1019 fromLineNumber:4235];

          v1020 = PLLogCommon();
          if (os_log_type_enabled(v1020, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v1184 = v1015;
            _os_log_debug_impl(&dword_1D2690000, v1020, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          id v3 = v1136;
          id v25 = v1014;
        }
      }
      v1021 = [MEMORY[0x1E4F92900] sharedInstance];
      [v1021 createPowerEventBackwardWithRootNodeID:37 withPower:v32 withEndDate:v1011];

      if ([*(id *)(v90 + 2496) debugEnabled])
      {
        uint64_t v1022 = objc_opt_class();
        v1171[0] = MEMORY[0x1E4F143A8];
        v1171[1] = 3221225472;
        v1171[2] = __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1711;
        v1171[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v1171[4] = v1022;
        v1023 = v1171;
        if (qword_1EBD59248 != -1) {
          dispatch_once(&qword_1EBD59248, v1023);
        }

        if (byte_1EBD58D49)
        {
          id v1024 = v25;
          v1025 = [NSString stringWithFormat:@"cdma2kVoicePower=%f, wcdmaVoicePower=%f, gsmVoicePower=%f, tdscdmaVoicePower=%f", *(void *)&v1123, *(void *)&v1126, *(void *)&v1115, *(void *)&v1121];
          v1026 = (void *)MEMORY[0x1E4F929B8];
          v1027 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
          v1028 = [v1027 lastPathComponent];
          v1029 = [NSString stringWithUTF8String:"-[PLBBAgent modelMav10BBHWPower:]"];
          [v1026 logMessage:v1025 fromFile:v1028 fromFunction:v1029 fromLineNumber:4243];

          v1030 = PLLogCommon();
          if (os_log_type_enabled(v1030, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v1184 = v1025;
            _os_log_debug_impl(&dword_1D2690000, v1030, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          id v3 = v1136;
          id v25 = v1024;
        }
      }
      v1031 = [MEMORY[0x1E4F92900] sharedInstance];
      [v1031 createPowerEventBackwardWithRootNodeID:38 withPower:v32 withEndDate:v1115 + v1123 + v1126 + v1121];

      v1032 = [v32 dateByAddingTimeInterval:v1146 * -0.0000305175781];
      v1033 = [MEMORY[0x1E4F92900] sharedInstance];
      v1034 = v1033;
      if (v36 / v1146 <= 0.100000001) {
        v1035 = (void *)MEMORY[0x1E4F1CBF0];
      }
      else {
        v1035 = &unk_1F29EE390;
      }
      [v1033 createQualificationEventForwardWithQualificationID:1 withChildNodeNames:v1035 withStartDate:v1032];

      goto LABEL_320;
    }
    v1096 = [v1144 objectForKeyedSubscript:@"SleepStateArr"];
    v1092 = [v1144 objectForKeyedSubscript:@"SleepStateConnArr"];
    v1162 = [v1144 objectForKeyedSubscript:@"TxPwrBktArr"];
    v414 = [v1144 objectForKeyedSubscript:@"CAFreqInfo"];
    uint64_t v415 = [v1144 objectForKeyedSubscript:@"C0TBSzArr"];
    uint64_t v416 = [v1144 objectForKeyedSubscript:@"C1TBSzArr"];
    uint64_t v1140 = [v1144 objectForKeyedSubscript:@"DLTBSzArr"];
    v1129 = [v1144 objectForKeyedSubscript:@"CASCCStateArr"];
    v417 = [v1144 objectForKeyedSubscript:@"DupMode"];
    int v418 = [v417 longValue];

    v1125 = v414;
    v1151 = (void *)v415;
    v1148 = (void *)v416;
    if ([*(id *)(v90 + 2496) debugEnabled])
    {
      uint64_t v419 = objc_opt_class();
      v1174[0] = MEMORY[0x1E4F143A8];
      v1174[1] = 3221225472;
      v1174[2] = __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1683;
      v1174[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v1174[4] = v419;
      v420 = v1174;
      if (qword_1EBD59230 != -1) {
        dispatch_once(&qword_1EBD59230, v420);
      }

      if (byte_1EBD58D46)
      {
        v421 = [NSString stringWithFormat:@"C0TBSz = %@, C1TBSz = %@, carrierAggregationStates = %@", v415, v416, v1129];
        v422 = (void *)MEMORY[0x1E4F929B8];
        v423 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        v424 = [v423 lastPathComponent];
        v425 = [NSString stringWithUTF8String:"-[PLBBAgent modelMav10BBHWPower:]"];
        [v422 logMessage:v421 fromFile:v424 fromFunction:v425 fromLineNumber:3844];

        v426 = PLLogCommon();
        if (os_log_type_enabled(v426, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v1184 = v421;
          _os_log_debug_impl(&dword_1D2690000, v426, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        unint64_t v196 = 0x1E4F92000uLL;
        v414 = v1125;
      }
    }
    v427 = @"FDD";
    if (v418 == 1) {
      v427 = @"TDD";
    }
    v1156 = v427;
    if (objc_msgSend(*(id *)(v196 + 2616), "isBasebandClass:"))
    {
      v428 = [v1096 objectAtIndexedSubscript:1];
      [v428 doubleValue];
      double v430 = v429;

      v431 = [v1096 objectAtIndexedSubscript:2];
      [v431 doubleValue];
      double v433 = v432;
      v434 = [v37 objectForKeyedSubscript:v1165];
      v435 = [v434 objectForKeyedSubscript:@"LTE"];
      v1107 = [v435 objectForKeyedSubscript:@"SemiLite"];
      [v1107 doubleValue];
      double v437 = v436;
      v1103 = [v1096 objectAtIndexedSubscript:3];
      [v1103 doubleValue];
      double v439 = v438;
      v1099 = [v37 objectForKeyedSubscript:v1165];
      v1087 = [v1099 objectForKeyedSubscript:@"LTE"];
      v1083 = [v1087 objectForKeyedSubscript:@"FullLite"];
      [v1083 doubleValue];
      double v441 = v439 * v440 + v433 * v437;
      v442 = [v1096 objectAtIndexedSubscript:4];
      [v442 doubleValue];
      double v444 = v443;
      v445 = [v37 objectForKeyedSubscript:v1165];
      v446 = [v445 objectForKeyedSubscript:@"LTE"];
      v447 = [v446 objectForKeyedSubscript:@"DeepLite"];
      [v447 doubleValue];
      double v449 = v441 + v444 * v448;
    }
    else
    {
      v451 = [v1092 objectAtIndexedSubscript:1];
      [v451 doubleValue];
      double v430 = v452;

      v1076 = [v1092 objectAtIndexedSubscript:2];
      [v1076 doubleValue];
      double v454 = v453;
      v1080 = [v37 objectForKeyedSubscript:v1165];
      v1073 = [v1080 objectForKeyedSubscript:@"LTE"];
      v1107 = [v1073 objectForKeyedSubscript:@"MacroSleep"];
      [v1107 doubleValue];
      double v456 = v455;
      v1103 = [v1092 objectAtIndexedSubscript:3];
      [v1103 doubleValue];
      double v458 = v457;
      v1099 = [v37 objectForKeyedSubscript:v1165];
      v1087 = [v1099 objectForKeyedSubscript:@"LTE"];
      v1083 = [v1087 objectForKeyedSubscript:@"LightSleep"];
      [v1083 doubleValue];
      double v460 = v458 * v459 + v454 * v456;
      v1069 = [v1092 objectAtIndexedSubscript:4];
      [v1069 doubleValue];
      double v462 = v461;
      v1065 = [v37 objectForKeyedSubscript:v1165];
      v1062 = [v1065 objectForKeyedSubscript:@"LTE"];
      v447 = [v1062 objectForKeyedSubscript:@"DeepLightSleep"];
      [v447 doubleValue];
      double v464 = v460 + v462 * v463;
      v465 = [v1092 objectAtIndexedSubscript:5];
      [v465 doubleValue];
      double v467 = v466;
      v468 = [v37 objectForKeyedSubscript:v1165];
      [v468 objectForKeyedSubscript:@"LTE"];
      v470 = v469 = v37;
      v471 = [v470 objectForKeyedSubscript:@"QuickDeepLightSleep"];
      [v471 doubleValue];
      double v473 = v464 + v467 * v472;
      v474 = [v1092 objectAtIndexedSubscript:6];
      [v474 doubleValue];
      double v476 = v475;
      v477 = [v469 objectForKeyedSubscript:v1165];
      v478 = [v477 objectForKeyedSubscript:@"LTE"];
      v479 = [v478 objectForKeyedSubscript:@"DeepSleep"];
      [v479 doubleValue];
      double v449 = v473 + v476 * v480;

      v414 = v1125;
      unint64_t v196 = 0x1E4F92000uLL;

      v431 = v1076;
      v442 = v1069;

      v435 = v1073;
      v446 = v1062;

      v445 = v1065;
      v434 = v1080;
    }

    if (([*(id *)(v196 + 2616) isBasebandClass:1003003] & 1) != 0
      || [*(id *)(v196 + 2616) isBasebandClass:1003004])
    {
      v481 = [v414 objectAtIndexedSubscript:0];
    }
    else
    {
      v481 = [v1144 objectForKeyedSubscript:@"PCC_Band"];
    }
    v482 = v481;
    [v481 doubleValue];
    double v484 = v483;

    v1088 = (void *)MEMORY[0x1E4F1CAD0];
    v1108 = [NSNumber numberWithInt:1];
    v1084 = [NSNumber numberWithInt:2];
    v1104 = [NSNumber numberWithInt:3];
    v1081 = [NSNumber numberWithInt:4];
    v1100 = [NSNumber numberWithInt:7];
    v1077 = [NSNumber numberWithInt:9];
    v1074 = [NSNumber numberWithInt:10];
    v1070 = [NSNumber numberWithInt:15];
    v1066 = [NSNumber numberWithInt:16];
    v485 = [NSNumber numberWithInt:22];
    v486 = [NSNumber numberWithInt:23];
    v487 = [NSNumber numberWithInt:24];
    v488 = [NSNumber numberWithInt:25];
    v489 = [NSNumber numberWithInt:30];
    v490 = objc_msgSend(v1088, "setWithObjects:", v1108, v1084, v1104, v1081, v1100, v1077, v1074, v1070, v1066, v485, v486, v487, v488, v489, 0);

    v491 = [NSNumber numberWithInt:(int)v484];
    int v492 = [v490 containsObject:v491];
    v493 = @"txPowerLowBand";
    if (v492) {
      v493 = @"txPowerHighBand";
    }
    v494 = v493;

    v495 = [NSNumber numberWithInt:(int)v484];
    v1101 = v490;
    int v496 = [v490 containsObject:v495];

    double v497 = 0.0;
    if (v496)
    {
      unint64_t v498 = 0x1E4F92000uLL;
      v499 = v1165;
      v500 = v1164;
      v501 = v1129;
      if (([MEMORY[0x1E4F92A38] isBasebandClass:1003004] & 1) != 0
        || ([MEMORY[0x1E4F92A38] isBasebandClass:1003005] & 1) != 0
        || [MEMORY[0x1E4F92A38] isBasebandClass:1003007])
      {
        v502 = [v1164 objectForKeyedSubscript:v1165];
        v503 = [v502 objectForKeyedSubscript:@"LTE"];
        v504 = [v503 objectForKeyedSubscript:@"elnaAdder"];
        [v504 doubleValue];
        double v497 = v505;

        v501 = v1129;
      }
    }
    else
    {
      v499 = v1165;
      v500 = v1164;
      unint64_t v498 = 0x1E4F92000uLL;
      v501 = v1129;
    }
    v1105 = v494;
    if (([MEMORY[0x1E4F92A38] isBasebandClass:1003003] & 1) != 0
      || [MEMORY[0x1E4F92A38] isBasebandClass:1003004])
    {
      v506 = [v501 objectAtIndexedSubscript:3];
      [v506 doubleValue];
      double v508 = v430 - v507;
      v509 = [v500 objectForKeyedSubscript:v499];
      v510 = [v509 objectForKeyedSubscript:@"LTE"];
      v511 = [v510 objectForKeyedSubscript:@"Active"];
      v512 = [v511 objectForKeyedSubscript:v1156];
      [v512 doubleValue];
      double v514 = v508 * (v497 + v513) / v35;
    }
    else if ([MEMORY[0x1E4F92A38] isBasebandClass:1003005])
    {
      v1109 = [v501 objectAtIndexedSubscript:1];
      [v1109 doubleValue];
      double v523 = v430 - v522;
      v524 = [v501 objectAtIndexedSubscript:2];
      [v524 doubleValue];
      double v526 = v523 - v525;
      [v501 objectAtIndexedSubscript:3];
      v528 = v527 = v499;
      [v528 doubleValue];
      double v530 = v526 - v529;
      [v501 objectAtIndexedSubscript:4];
      v532 = v531 = v500;
      [v532 doubleValue];
      double v534 = v530 - v533;
      v535 = [v501 objectAtIndexedSubscript:5];
      [v535 doubleValue];
      double v537 = v534 - v536;
      v538 = [v531 objectForKeyedSubscript:v527];
      v539 = [v538 objectForKeyedSubscript:@"LTE"];
      v540 = [v539 objectForKeyedSubscript:@"Active"];
      v541 = [v540 objectForKeyedSubscript:v1156];
      [v541 doubleValue];
      double v543 = v537 * (v497 + v542) / v35;

      unint64_t v498 = 0x1E4F92000;
      v501 = v1129;

      v506 = [v1129 objectAtIndexedSubscript:4];
      [v506 doubleValue];
      double v545 = v544;
      v509 = [v531 objectForKeyedSubscript:v1165];
      v510 = [v509 objectForKeyedSubscript:@"LTE"];
      v511 = [v510 objectForKeyedSubscript:@"ActiveCA1configured"];
      v512 = [v511 objectForKeyedSubscript:v1156];
      [v512 doubleValue];
      double v514 = v543 + v545 * v546 / v35;
    }
    else
    {
      double v599 = 0.0;
      for (iuint64_t i = 1; ii != 10; ++ii)
      {
        v601 = [v501 objectAtIndexedSubscript:ii];
        [v601 doubleValue];
        double v599 = v599 + v602;
      }
      double v603 = 0.0;
      if (v430 > v599)
      {
        v604 = [v500 objectForKeyedSubscript:v499];
        v605 = [v604 objectForKeyedSubscript:@"LTE"];
        v606 = [v605 objectForKeyedSubscript:@"Active"];
        v607 = [v606 objectForKeyedSubscript:v1156];
        [v607 doubleValue];
        double v603 = (v430 - v599) * (v497 + v608) / v35;

        v501 = v1129;
      }
      v609 = [v501 objectAtIndexedSubscript:1];
      [v609 doubleValue];
      double v611 = v610;
      v612 = [v500 objectForKeyedSubscript:v499];
      v613 = [v612 objectForKeyedSubscript:@"LTE"];
      v614 = [v613 objectForKeyedSubscript:@"ActiveCA1configured"];
      v615 = [v614 objectForKeyedSubscript:v1156];
      [v615 doubleValue];
      double v617 = v603 + v611 * v616 / v35;

      v618 = [v1129 objectAtIndexedSubscript:2];
      [v618 doubleValue];
      double v620 = v619;
      v621 = [v500 objectForKeyedSubscript:v499];
      v622 = [v621 objectForKeyedSubscript:@"LTE"];
      v623 = [v622 objectForKeyedSubscript:@"ActiveCA2configured"];
      v624 = [v623 objectForKeyedSubscript:v1156];
      [v624 doubleValue];
      double v626 = v617 + v620 * v625 / v35;

      v501 = v1129;
      v506 = [v1129 objectAtIndexedSubscript:3];
      [v506 doubleValue];
      double v628 = v627;
      v509 = [v500 objectForKeyedSubscript:v499];
      v510 = [v509 objectForKeyedSubscript:@"LTE"];
      v511 = [v510 objectForKeyedSubscript:@"ActiveCA3configured"];
      v512 = [v511 objectForKeyedSubscript:v1156];
      [v512 doubleValue];
      double v514 = v626 + v628 * v629 / v35;
      unint64_t v498 = 0x1E4F92000;
    }

    if (v514 >= 0.0) {
      double v515 = v514;
    }
    else {
      double v515 = 0.0;
    }
    v516 = v1125;
    if (([*(id *)(v498 + 2616) isBasebandClass:1003003] & 1) != 0
      || [*(id *)(v498 + 2616) isBasebandClass:1003004])
    {
      v517 = [v1125 objectAtIndexedSubscript:2];

      v518 = v1165;
      v519 = v1164;
      if (!v517) {
        goto LABEL_183;
      }
      v520 = NSString;
      v521 = [v1125 objectAtIndexedSubscript:2];
    }
    else
    {
      v547 = [v1144 objectForKeyedSubscript:@"PCC_BW"];

      v518 = v1165;
      v519 = v1164;
      if (!v547) {
        goto LABEL_183;
      }
      v520 = NSString;
      v521 = [v1144 objectForKeyedSubscript:@"PCC_BW"];
    }
    v548 = v521;
    v549 = objc_msgSend(v520, "stringWithFormat:", @"%i", objc_msgSend(v521, "intValue"));

    v550 = [v519 objectForKeyedSubscript:v518];
    v551 = [v550 objectForKeyedSubscript:@"LTE"];
    v552 = [v551 objectForKeyedSubscript:@"NonCAMultiplier"];
    v553 = [v552 objectForKeyedSubscript:v549];
    [v553 doubleValue];
    double v555 = v554;

    double v556 = 1.0;
    if (v555 > 0.0) {
      double v556 = v555;
    }
    double v515 = v515 * v556;

    v518 = v1165;
    v519 = v1164;
LABEL_183:
    if (([*(id *)(v498 + 2616) isBasebandClass:1003003] & 1) != 0
      || [*(id *)(v498 + 2616) isBasebandClass:1003004])
    {
      v557 = [v501 objectAtIndexedSubscript:3];
      [v557 doubleValue];
      double v559 = v558;
      v560 = [v519 objectForKeyedSubscript:v518];
      v561 = [v560 objectForKeyedSubscript:@"LTE"];
      v562 = [v561 objectForKeyedSubscript:@"ActiveCA"];
      v563 = [v562 objectForKeyedSubscript:v1156];
      [v563 doubleValue];
      double v565 = 0.0;
      double v566 = v35;
      double v567 = 0.0;
      double v568 = 0.0;
      double v1110 = v559 * v564 / v566;
    }
    else
    {
      if ([*(id *)(v498 + 2616) isBasebandClass:1003005])
      {
        v569 = [v501 objectAtIndexedSubscript:1];
        [v569 doubleValue];
        double v571 = v570;
        v572 = [v519 objectForKeyedSubscript:v518];
        v573 = [v572 objectForKeyedSubscript:@"LTE"];
        v574 = [v573 objectForKeyedSubscript:@"ActiveCA2configured"];
        v575 = [v574 objectForKeyedSubscript:v1156];
        [v575 doubleValue];
        double v577 = v571 * v576 / v35;

        v578 = [v1129 objectAtIndexedSubscript:2];
        [v578 doubleValue];
        double v580 = v579;
        v581 = [v519 objectForKeyedSubscript:v518];
        v582 = [v581 objectForKeyedSubscript:@"LTE"];
        v583 = [v582 objectForKeyedSubscript:@"Active2CA1configured"];
        v584 = [v583 objectForKeyedSubscript:v1156];
        [v584 doubleValue];
        double v586 = v577 + v580 * v585 / v35;

        v587 = [v1129 objectAtIndexedSubscript:3];
        [v587 doubleValue];
        double v589 = v588;
        v590 = [v519 objectForKeyedSubscript:v518];
        v591 = [v590 objectForKeyedSubscript:@"LTE"];
        v592 = [v591 objectForKeyedSubscript:@"Active2CA"];
        v593 = [v592 objectForKeyedSubscript:v1156];
        [v593 doubleValue];
        double v595 = v586 + v589 * v594 / v35;

        v557 = [v1129 objectAtIndexedSubscript:5];
        [v557 doubleValue];
        double v597 = v596;
        v560 = [v519 objectForKeyedSubscript:v518];
        v561 = [v560 objectForKeyedSubscript:@"LTE"];
        v562 = [v561 objectForKeyedSubscript:@"Active3CA"];
        v563 = [v562 objectForKeyedSubscript:v1156];
        [v563 doubleValue];
        double v1110 = v595 + v597 * v598 / v35;
        double v565 = 0.0;
        double v567 = 0.0;
        double v568 = 0.0;
      }
      else
      {
        v630 = [v501 objectAtIndexedSubscript:4];
        [v630 doubleValue];
        double v632 = v631;
        v633 = [v519 objectForKeyedSubscript:v518];
        v634 = [v633 objectForKeyedSubscript:@"LTE"];
        v635 = [v634 objectForKeyedSubscript:@"Active2CA"];
        v636 = [v635 objectForKeyedSubscript:v1156];
        [v636 doubleValue];
        double v638 = v632 * v637 / v35;

        v639 = [v1129 objectAtIndexedSubscript:5];
        [v639 doubleValue];
        double v641 = v640;
        v642 = [v519 objectForKeyedSubscript:v518];
        v643 = [v642 objectForKeyedSubscript:@"LTE"];
        v644 = [v643 objectForKeyedSubscript:@"Active2CA1configured"];
        v645 = [v644 objectForKeyedSubscript:v1156];
        [v645 doubleValue];
        double v647 = v638 + v641 * v646 / v35;

        v648 = [v1129 objectAtIndexedSubscript:6];
        [v648 doubleValue];
        double v650 = v649;
        v651 = [v519 objectForKeyedSubscript:v518];
        v652 = [v651 objectForKeyedSubscript:@"LTE"];
        v653 = [v652 objectForKeyedSubscript:@"Active2CA2configured"];
        v654 = [v653 objectForKeyedSubscript:v1156];
        [v654 doubleValue];
        double v565 = v647 + v650 * v655 / v35;

        v656 = [v1129 objectAtIndexedSubscript:7];
        [v656 doubleValue];
        double v658 = v657;
        v659 = [v519 objectForKeyedSubscript:v518];
        v660 = [v659 objectForKeyedSubscript:@"LTE"];
        v661 = [v660 objectForKeyedSubscript:@"Active3CA"];
        v662 = [v661 objectForKeyedSubscript:v1156];
        [v662 doubleValue];
        double v664 = v658 * v663 / v35;

        v665 = [v1129 objectAtIndexedSubscript:8];
        [v665 doubleValue];
        double v667 = v666;
        v668 = [v519 objectForKeyedSubscript:v518];
        v669 = [v668 objectForKeyedSubscript:@"LTE"];
        v670 = [v669 objectForKeyedSubscript:@"Active3CA1configured"];
        v671 = [v670 objectForKeyedSubscript:v1156];
        [v671 doubleValue];
        double v673 = v35;
        double v567 = v664 + v667 * v672 / v35;

        v557 = [v1129 objectAtIndexedSubscript:9];
        [v557 doubleValue];
        double v675 = v674;
        v560 = [v519 objectForKeyedSubscript:v518];
        v561 = [v560 objectForKeyedSubscript:@"LTE"];
        v562 = [v561 objectForKeyedSubscript:@"Active4CA"];
        v563 = [v562 objectForKeyedSubscript:v1156];
        [v563 doubleValue];
        double v1110 = 0.0;
        double v568 = v675 * v676 / v673;
      }
      unint64_t v498 = 0x1E4F92000uLL;
      v516 = v1125;
    }

    v677 = v1162;
    if (([*(id *)(v498 + 2616) isBasebandClass:1003003] & 1) != 0
      || [*(id *)(v498 + 2616) isBasebandClass:1003004])
    {
      uint64_t v678 = [v516 objectAtIndexedSubscript:2];
      v679 = v1165;
      v680 = v1164;
      if (v678)
      {
        v681 = (void *)v678;
        v682 = [v516 objectAtIndexedSubscript:3];

        double v683 = v1146;
        if (!v682) {
          goto LABEL_225;
        }
        v684 = [v516 objectAtIndexedSubscript:2];
        [v684 doubleValue];
        -[PLBBAgent translateChannelRBsToChannelBW:](self, "translateChannelRBsToChannelBW:");
        double v686 = v685;
        v687 = [v516 objectAtIndexedSubscript:3];
        [v687 doubleValue];
        -[PLBBAgent translateChannelRBsToChannelBW:](self, "translateChannelRBsToChannelBW:");
        double v689 = v686 + v688;

        v690 = objc_msgSend(NSString, "stringWithFormat:", @"%i", (int)v689);
        v691 = [v1164 objectForKeyedSubscript:v1165];
        v692 = [v691 objectForKeyedSubscript:@"LTE"];
        v693 = [v692 objectForKeyedSubscript:@"CAMultiplier"];
        v694 = v1165;
        goto LABEL_200;
      }
      goto LABEL_224;
    }
    int v700 = [*(id *)(v498 + 2616) isBasebandClass:1003005];
    uint64_t v701 = [v1144 objectForKeyedSubscript:@"PCC_BW"];
    v690 = (void *)v701;
    v679 = v1165;
    v680 = v1164;
    if (v700)
    {
      if (v701)
      {
        uint64_t v702 = [v1144 objectForKeyedSubscript:@"SCC1_BW"];
        double v683 = v1146;
        if (!v702)
        {
LABEL_203:

          goto LABEL_225;
        }
        v703 = (void *)v702;
        v704 = [v1144 objectForKeyedSubscript:@"SCC2_BW"];

        if (v704)
        {
          v705 = [v1144 objectForKeyedSubscript:@"PCC_BW"];
          [v705 doubleValue];
          v694 = v1165;
          -[PLBBAgent translateChannelRBsToChannelBW:](self, "translateChannelRBsToChannelBW:");
          double v707 = v706;
          v708 = [v1144 objectForKeyedSubscript:@"SCC1_BW"];
          [v708 doubleValue];
          -[PLBBAgent translateChannelRBsToChannelBW:](self, "translateChannelRBsToChannelBW:");
          double v710 = v707 + v709;
          v711 = [v1144 objectForKeyedSubscript:@"SCC2_BW"];
          [v711 doubleValue];
          -[PLBBAgent translateChannelRBsToChannelBW:](self, "translateChannelRBsToChannelBW:");
          double v713 = v710 + v712;

          v690 = objc_msgSend(NSString, "stringWithFormat:", @"%i", (int)v713);
          v691 = [v1164 objectForKeyedSubscript:v1165];
          v692 = [v691 objectForKeyedSubscript:@"LTE"];
          v693 = [v692 objectForKeyedSubscript:@"CAMultiplier"];
LABEL_200:
          v695 = v693;
          v696 = [v693 objectForKeyedSubscript:v690];
          [v696 doubleValue];
          double v698 = v697;

          v679 = v694;
          double v699 = 1.0;
          if (v698 > 0.0) {
            double v699 = v698;
          }
          double v1110 = v1110 * v699;
          goto LABEL_203;
        }
LABEL_225:
        uint64_t v752 = 0;
        double v753 = 0.0;
        double v754 = v449 / v683;
        do
        {
          v755 = [v677 objectAtIndexedSubscript:v752];
          [v755 doubleValue];
          double v757 = v756;
          v758 = [v680 objectForKeyedSubscript:v679];
          v759 = [v758 objectForKeyedSubscript:@"LTE"];
          [v759 objectForKeyedSubscript:v1105];
          v760 = v680;
          v762 = v761 = v679;
          v763 = [v762 objectAtIndexedSubscript:v752];
          [v763 doubleValue];
          double v753 = v753 + v757 * v764;

          v679 = v761;
          v680 = v760;

          v677 = v1162;
          ++v752;
        }
        while (v752 != 12);
        for (juint64_t j = 8; jj != 12; ++jj)
        {
          v766 = [v1162 objectAtIndexedSubscript:jj];
          [v766 doubleValue];
          double v36 = v36 + v767;
        }
        if ([MEMORY[0x1E4F92A38] isBasebandClass:1003003])
        {
          double v768 = 0.0;
          uint64_t v769 = 1;
          double v770 = 0.0;
          do
          {
            v771 = [v1151 objectAtIndexedSubscript:v769];
            [v771 doubleValue];
            double v773 = v772;
            v774 = [v1164 objectForKeyedSubscript:v1165];
            v775 = [v774 objectForKeyedSubscript:@"LTE"];
            v776 = [v775 objectForKeyedSubscript:@"C0TBSz"];
            v777 = [v776 objectForKeyedSubscript:v1156];
            v778 = [v777 objectAtIndexedSubscript:v769];
            [v778 doubleValue];
            double v770 = v770 + v773 * v779;

            v780 = [v1148 objectAtIndexedSubscript:v769];
            [v780 doubleValue];
            double v782 = v781;
            v783 = [v1164 objectForKeyedSubscript:v1165];
            v784 = [v783 objectForKeyedSubscript:@"LTE"];
            v785 = [v784 objectForKeyedSubscript:@"C1TBSz"];
            v786 = [v785 objectForKeyedSubscript:v1156];
            v787 = [v786 objectAtIndexedSubscript:v769];
            [v787 doubleValue];
            double v768 = v768 + v782 * v788;

            ++v769;
          }
          while (v769 != 16);
          double v789 = v770 + v768;
          double v683 = v1146;
          v790 = (void *)v1140;
        }
        else if ([MEMORY[0x1E4F92A38] isBasebandClass:1003004])
        {
          double v791 = 0.0;
          uint64_t v792 = 1;
          double v793 = 0.0;
          do
          {
            v794 = [v1151 objectAtIndexedSubscript:v792];
            [v794 doubleValue];
            double v796 = v795;
            v797 = [v1164 objectForKeyedSubscript:v1165];
            v798 = [v797 objectForKeyedSubscript:@"LTE"];
            v799 = [v798 objectForKeyedSubscript:@"C0TBSz"];
            v800 = [v799 objectForKeyedSubscript:v1156];
            v801 = [v800 objectAtIndexedSubscript:v792];
            [v801 doubleValue];
            double v793 = v793 + v796 * v802;

            v803 = [v1148 objectAtIndexedSubscript:v792];
            [v803 doubleValue];
            double v805 = v804;
            v806 = [v1164 objectForKeyedSubscript:v1165];
            v807 = [v806 objectForKeyedSubscript:@"LTE"];
            v808 = [v807 objectForKeyedSubscript:@"C1TBSz"];
            v809 = [v808 objectForKeyedSubscript:v1156];
            v810 = [v809 objectAtIndexedSubscript:v792];
            [v810 doubleValue];
            double v791 = v791 + v805 * v811;

            ++v792;
          }
          while (v792 != 18);
          double v789 = v793 + v791;
          double v683 = v1146;
          v790 = (void *)v1140;
        }
        else
        {
          v812 = v1165;
          v790 = (void *)v1140;
          if (([MEMORY[0x1E4F92A38] isBasebandClass:1003005] & 1) != 0
            || (double v789 = 0.0, [MEMORY[0x1E4F92A38] isBasebandClass:1003007]))
          {
            double v789 = 0.0;
            for (kuint64_t k = 1; kk != 17; ++kk)
            {
              v814 = [v790 objectAtIndexedSubscript:kk];
              [v814 doubleValue];
              double v816 = v815;
              v817 = [v1164 objectForKeyedSubscript:v812];
              v818 = [v817 objectForKeyedSubscript:@"LTE"];
              v819 = [v818 objectForKeyedSubscript:@"C0TBSz"];
              v820 = [v819 objectForKeyedSubscript:v1156];
              v821 = [v820 objectAtIndexedSubscript:kk];
              [v821 doubleValue];
              double v789 = v789 + v816 * v822;

              v790 = (void *)v1140;
              v812 = v1165;
            }
          }
        }
        double v823 = v753 / v683;
        double v1133 = v789 / v683;
        if (([MEMORY[0x1E4F92A38] isBasebandClass:1003004] & 1) != 0
          || (double v824 = 0.0,
              double v825 = 0.0,
              double v826 = 0.0,
              [MEMORY[0x1E4F92A38] isBasebandClass:1003005]))
        {
          v827 = [v1144 objectForKeyedSubscript:@"RfBPEArr"];
          v828 = [v827 objectAtIndexedSubscript:7];
          [v828 doubleValue];
          double v1089 = v515;
          double v830 = v829 * 3.7 / (v1146 * 0.0000305175781) / 1000.0;

          v831 = [v827 objectAtIndexedSubscript:6];
          [v831 doubleValue];
          double v833 = v823;
          double v834 = v754;
          double v835 = v832 * 3.7 / (v1146 * 0.0000305175781) / 1000.0;

          v836 = [v827 objectAtIndexedSubscript:5];
          [v836 doubleValue];
          double v826 = v837 * 3.7 / (v1146 * 0.0000305175781) / 1000.0;

          if (v830 > 3000.0 || v830 < 0.0) {
            double v824 = 0.0;
          }
          else {
            double v824 = v830;
          }
          double v515 = v1089;
          if (v835 > 3000.0 || v835 < 0.0) {
            double v825 = 0.0;
          }
          else {
            double v825 = v835;
          }
          double v754 = v834;
          double v823 = v833;
          if (v826 > 3000.0 || v826 < 0.0) {
            double v826 = 0.0;
          }
        }
        double v450 = v754 + v515 + v1110 + v823 + v1133 + v824 + v825 + v826;
        unint64_t v90 = 0x1E4F92000uLL;
        id v25 = v1135;
        double v37 = v1164;
        v841 = v1125;
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v842 = objc_opt_class();
          v1173[0] = MEMORY[0x1E4F143A8];
          v1173[1] = 3221225472;
          v1173[2] = __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1693;
          v1173[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v1173[4] = v842;
          v843 = v1173;
          if (qword_1EBD59238 != -1) {
            dispatch_once(&qword_1EBD59238, v843);
          }

          if (byte_1EBD58D47)
          {
            v844 = [NSString stringWithFormat:@"lteSleepPowerAdder=%f, lteNonCaActivePowerAdder=%f, CAActivePowerAdder=%f, lteTxPowerAdder=%f, TBSzPowerAdder=%f, lnaAdder=%f, nlicAdder=%f, advRxAdder=%f, ltePower=%f", *(void *)&v754, *(void *)&v515, *(void *)&v1110, *(void *)&v823, *(void *)&v1133, *(void *)&v824, *(void *)&v825, *(void *)&v826, *(void *)&v450];
            v845 = (void *)MEMORY[0x1E4F929B8];
            v846 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
            v847 = [v846 lastPathComponent];
            v848 = [NSString stringWithUTF8String:"-[PLBBAgent modelMav10BBHWPower:]"];
            [v845 logMessage:v844 fromFile:v847 fromFunction:v848 fromLineNumber:4135];

            v849 = PLLogCommon();
            if (os_log_type_enabled(v849, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v1184 = v844;
              _os_log_debug_impl(&dword_1D2690000, v849, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v841 = v1125;
            v790 = (void *)v1140;
            id v25 = v1135;
          }
        }

        goto LABEL_269;
      }
LABEL_224:
      double v683 = v1146;
      goto LABEL_225;
    }
    if (v701)
    {
      v714 = [v1144 objectForKeyedSubscript:@"SCC1_BW"];

      if (v714)
      {
        v715 = [v1144 objectForKeyedSubscript:@"PCC_BW"];
        [v715 doubleValue];
        -[PLBBAgent translateChannelRBsToChannelBW:](self, "translateChannelRBsToChannelBW:");
        double v717 = v716;
        v718 = [v1144 objectForKeyedSubscript:@"SCC1_BW"];
        [v718 doubleValue];
        -[PLBBAgent translateChannelRBsToChannelBW:](self, "translateChannelRBsToChannelBW:");
        double v720 = v717 + v719;

        v721 = objc_msgSend(NSString, "stringWithFormat:", @"%i", (int)v720);
        v722 = [v1164 objectForKeyedSubscript:v1165];
        v723 = [v722 objectForKeyedSubscript:@"LTE"];
        v724 = [v723 objectForKeyedSubscript:@"2CAMultiplier"];
        v725 = [v724 objectForKeyedSubscript:v721];
        [v725 doubleValue];
        double v727 = v726;

        v679 = v1165;
        double v728 = 1.0;
        if (v727 > 0.0) {
          double v728 = v727;
        }
        double v565 = v565 * v728;
      }
      v729 = v1144;
    }
    else
    {
      v729 = v1144;
    }
    uint64_t v730 = [v729 objectForKeyedSubscript:@"PCC_BW"];
    if (v730)
    {
      v731 = (void *)v730;
      uint64_t v732 = [v729 objectForKeyedSubscript:@"SCC1_BW"];
      if (!v732)
      {
LABEL_222:

        goto LABEL_223;
      }
      v733 = (void *)v732;
      v734 = [v729 objectForKeyedSubscript:@"SCC2_BW"];

      if (v734)
      {
        v735 = [v729 objectForKeyedSubscript:@"PCC_BW"];
        [v735 doubleValue];
        v736 = v679;
        -[PLBBAgent translateChannelRBsToChannelBW:](self, "translateChannelRBsToChannelBW:");
        double v738 = v737;
        v739 = [v729 objectForKeyedSubscript:@"SCC1_BW"];
        [v739 doubleValue];
        -[PLBBAgent translateChannelRBsToChannelBW:](self, "translateChannelRBsToChannelBW:");
        double v741 = v738 + v740;
        v742 = [v729 objectForKeyedSubscript:@"SCC2_BW"];
        [v742 doubleValue];
        -[PLBBAgent translateChannelRBsToChannelBW:](self, "translateChannelRBsToChannelBW:");
        double v744 = v741 + v743;

        v731 = objc_msgSend(NSString, "stringWithFormat:", @"%i", (int)v744);
        v745 = [v1164 objectForKeyedSubscript:v679];
        v746 = [v745 objectForKeyedSubscript:@"LTE"];
        v747 = [v746 objectForKeyedSubscript:@"3CAMultiplier"];
        v748 = [v747 objectForKeyedSubscript:v731];
        [v748 doubleValue];
        double v750 = v749;

        v679 = v736;
        double v751 = 1.0;
        if (v750 > 0.0) {
          double v751 = v750;
        }
        double v567 = v567 * v751;
        goto LABEL_222;
      }
    }
LABEL_223:
    double v1110 = v568 + v565 + v567;
    goto LABEL_224;
  }
LABEL_320:
}

uint64_t __33__PLBBAgent_modelMav10BBHWPower___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D42 = result;
  return result;
}

uint64_t __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1665(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D43 = result;
  return result;
}

uint64_t __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1671(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D44 = result;
  return result;
}

uint64_t __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1677(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D45 = result;
  return result;
}

uint64_t __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1683(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D46 = result;
  return result;
}

uint64_t __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1693(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D47 = result;
  return result;
}

uint64_t __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1705(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D48 = result;
  return result;
}

uint64_t __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1711(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D49 = result;
  return result;
}

- (double)translateChannelRBsToChannelBW:(double)a3
{
  double v3 = 0.0;
  if (a3 != 0.0)
  {
    double v3 = 20.0;
    if (a3 != 100.0)
    {
      double v3 = 15.0;
      if (a3 != 75.0)
      {
        double v3 = 10.0;
        if (a3 != 50.0)
        {
          double v3 = 5.0;
          if (a3 != 25.0)
          {
            double v3 = 3.0;
            if (a3 != 15.0) {
              return 1.5;
            }
          }
        }
      }
    }
  }
  return v3;
}

- (void)modelMavBBHWOtherPerRATPower:(id)a3
{
  id v143 = a3;
  uint64_t v4 = [v143 objectForKeyedSubscript:@"PLBBAgent_EventBackward_MavBBHwOtherPerRAT"];

  if (v4)
  {
    uint64_t v5 = [v143 objectForKeyedSubscript:@"PLBBAgent_EventBackward_MavBBHwOtherPerRAT"];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      uint64_t v7 = 0;
      while (1)
      {
        id v8 = [v143 objectForKeyedSubscript:@"PLBBAgent_EventBackward_MavBBHwOtherPerRAT"];
        uint64_t v9 = [v8 objectAtIndexedSubscript:v7];

        if (!v9) {
          break;
        }
        if (v6 == ++v7) {
          goto LABEL_6;
        }
      }
    }
    else
    {
LABEL_6:
      id v10 = [v143 objectForKeyedSubscript:@"PLBBAgent_EventBackward_MavBBHwOther"];
      uint64_t v11 = [v10 objectAtIndexedSubscript:0];

      if (v11)
      {
        double v12 = [v143 objectForKeyedSubscript:@"PLBBAgent_EventBackward_MavBBHwOther"];
        int v13 = [v12 objectAtIndexedSubscript:0];

        uint64_t v14 = [v13 entryDate];
        double v15 = [v13 objectForKeyedSubscript:@"LogDuration"];
        [v15 doubleValue];
        double v17 = v16;

        if (v17 > 0.0)
        {
          double v124 = v17;
          double v129 = v13;
          uint64_t v18 = [MEMORY[0x1E4F92A88] MavRevStringQuery];
          uint64_t v19 = [MEMORY[0x1E4F92A88] powerModelForOperatorName:@"baseband"];
          double v130 = v14;
          v131 = self;
          if (objc_msgSend(MEMORY[0x1E4F92A38], "isBasebandClass:")) {
            goto LABEL_10;
          }
          double v20 = 0.0;
          double v21 = 0.0;
          double v22 = 0.0;
          double v23 = 0.0;
          double v24 = 0.0;
          double v25 = 0.0;
          double v26 = 0.0;
          double v27 = 0.0;
          if ([MEMORY[0x1E4F92A38] isBasebandClass:1003002])
          {
LABEL_10:
            double v28 = [v143 objectForKeyedSubscript:@"PLBBAgent_EventBackward_MavBBHwOtherPerRAT"];
            double v29 = [v28 objectAtIndexedSubscript:0];

            double v30 = [v143 objectForKeyedSubscript:@"PLBBAgent_EventBackward_MavBBHwOtherPerRAT"];
            double v31 = [v30 objectAtIndexedSubscript:1];

            double v32 = [v143 objectForKeyedSubscript:@"PLBBAgent_EventBackward_MavBBHwOtherPerRAT"];
            double v33 = [v32 objectAtIndexedSubscript:2];

            double v34 = [v143 objectForKeyedSubscript:@"PLBBAgent_EventBackward_MavBBHwOtherPerRAT"];
            double v35 = [v34 objectAtIndexedSubscript:3];

            id v127 = v29;
            v134 = [v29 objectForKeyedSubscript:@"TxPowerHist"];
            id v126 = v31;
            uint64_t v132 = [v31 objectForKeyedSubscript:@"TxPowerHist"];
            double v125 = v33;
            v138 = [v33 objectForKeyedSubscript:@"TxPowerHist"];
            double v136 = [v35 objectForKeyedSubscript:@"TxPowerHist"];
            uint64_t v36 = 0;
            double v27 = 0.0;
            double v26 = 0.0;
            double v25 = 0.0;
            double v24 = 0.0;
            double v23 = 0.0;
            double v22 = 0.0;
            double v21 = 0.0;
            double v20 = 0.0;
            do
            {
              double v37 = [v134 objectAtIndexedSubscript:v36];
              [v37 doubleValue];
              double v27 = v27 + v38;

              double v39 = [v132 objectAtIndexedSubscript:v36];
              [v39 doubleValue];
              double v141 = v26 + v40;

              uint64_t v41 = [v138 objectAtIndexedSubscript:v36];
              [v41 doubleValue];
              double v43 = v25 + v42;

              double v44 = [v136 objectAtIndexedSubscript:v36];
              [v44 doubleValue];
              double v24 = v24 + v45;

              uint64_t v46 = [v134 objectAtIndexedSubscript:v36];
              [v46 doubleValue];
              double v48 = v47;
              double v49 = [v19 objectForKeyedSubscript:v18];
              int64_t v50 = [v49 objectForKeyedSubscript:@"CDMA2K"];
              id v51 = [v50 objectForKeyedSubscript:@"txPower"];
              uint64_t v52 = [v51 objectAtIndexedSubscript:v36];
              [v52 doubleValue];
              double v20 = v20 + v48 * v53;

              double v54 = [v132 objectAtIndexedSubscript:v36];
              [v54 doubleValue];
              double v56 = v55;
              uint64_t v57 = [v19 objectForKeyedSubscript:v18];
              uint64_t v58 = [v57 objectForKeyedSubscript:@"1xEVDO"];
              double v59 = [v58 objectForKeyedSubscript:@"txPower"];
              double v60 = [v59 objectAtIndexedSubscript:v36];
              [v60 doubleValue];
              double v21 = v21 + v56 * v61;

              double v62 = [v138 objectAtIndexedSubscript:v36];
              [v62 doubleValue];
              double v64 = v63;
              double v65 = [v19 objectForKeyedSubscript:v18];
              double v66 = [v65 objectForKeyedSubscript:@"GSM"];
              v67 = [v66 objectForKeyedSubscript:@"txPower"];
              uint64_t v68 = [v67 objectAtIndexedSubscript:v36];
              [v68 doubleValue];
              double v22 = v22 + v64 * v69;

              double v70 = [v136 objectAtIndexedSubscript:v36];
              [v70 doubleValue];
              double v72 = v71;
              double v73 = [v19 objectForKeyedSubscript:v18];
              uint64_t v74 = [v73 objectForKeyedSubscript:@"WCDMA"];
              v75 = [v74 objectForKeyedSubscript:@"txPower"];
              v76 = [v75 objectAtIndexedSubscript:v36];
              [v76 doubleValue];
              double v23 = v23 + v72 * v77;
              double v25 = v43;
              double v26 = v141;

              ++v36;
            }
            while (v36 != 12);

            uint64_t v14 = v130;
            self = v131;
          }
          double v133 = v22;
          double v137 = v24;
          double v142 = v26;
          if (([MEMORY[0x1E4F92A38] isBasebandClass:1003001] & 1) != 0
            || (double v78 = 0.0, v79 = 0.0, [MEMORY[0x1E4F92A38] isBasebandClass:1003002]))
          {
            double v80 = v25;
            v81 = [v143 objectForKeyedSubscript:@"PLBBAgent_EventBackward_MavBBHwOtherPerRAT"];
            v82 = [v81 objectAtIndexedSubscript:4];

            v139 = v82;
            double v83 = [v82 objectForKeyedSubscript:@"TxPowerHist"];
            uint64_t v84 = 0;
            double v79 = 0.0;
            double v78 = 0.0;
            do
            {
              int v85 = [v83 objectAtIndexedSubscript:v84];
              [v85 doubleValue];
              double v79 = v79 + v86;

              double v87 = [v83 objectAtIndexedSubscript:v84];
              [v87 doubleValue];
              double v89 = v88;
              unint64_t v90 = [v19 objectForKeyedSubscript:v18];
              v91 = [v90 objectForKeyedSubscript:@"LTE"];
              v92 = [v91 objectForKeyedSubscript:@"txPower"];
              double v93 = [v92 objectAtIndexedSubscript:v84];
              [v93 doubleValue];
              double v78 = v78 + v89 * v94;

              ++v84;
            }
            while (v84 != 12);

            uint64_t v14 = v130;
            self = v131;
            double v25 = v80;
            double v26 = v142;
          }
          double v135 = v23;
          double v140 = v27;
          double v95 = 0.0;
          double v96 = 0.0;
          if ([MEMORY[0x1E4F92A38] isBasebandClass:1003002])
          {
            double v97 = v25;
            double v98 = [v143 objectForKeyedSubscript:@"PLBBAgent_EventBackward_MavBBHwOtherPerRAT"];
            v99 = [v98 objectAtIndexedSubscript:5];

            v128 = v99;
            double v100 = [v99 objectForKeyedSubscript:@"TxPowerHist"];
            for (uint64_t i = 0; i != 12; ++i)
            {
              uint64_t v102 = [v100 objectAtIndexedSubscript:i];
              [v102 doubleValue];
              double v95 = v95 + v103;

              uint64_t v104 = [v100 objectAtIndexedSubscript:i];
              [v104 doubleValue];
              double v106 = v105;
              double v107 = [v19 objectForKeyedSubscript:v18];
              v108 = [v107 objectForKeyedSubscript:@"UTRAN"];
              uint64_t v109 = [v108 objectForKeyedSubscript:@"txPower"];
              uint64_t v110 = [v109 objectAtIndexedSubscript:i];
              [v110 doubleValue];
              double v96 = v96 + v106 * v111;
            }
            uint64_t v14 = v130;
            self = v131;
            double v25 = v97;
            double v26 = v142;
          }
          double v112 = v20 / v140;
          if (v140 <= 0.0) {
            double v112 = 0.0;
          }
          double v113 = v21 / v26;
          if (v26 <= 0.0) {
            double v113 = 0.0;
          }
          double v114 = v133 / v25;
          if (v25 <= 0.0) {
            double v114 = 0.0;
          }
          double v115 = v135 / v137;
          if (v137 <= 0.0) {
            double v115 = 0.0;
          }
          double v116 = v78 / v79;
          if (v79 <= 0.0) {
            double v116 = 0.0;
          }
          double v117 = v96 / v95;
          if (v95 <= 0.0) {
            double v117 = 0.0;
          }
          double v118 = v115 + v114 + v113 + v112 + v116 + v117;
          v119 = [MEMORY[0x1E4F92900] sharedInstance];
          [v119 createPowerEventBackwardWithRootNodeID:45 withPower:v14 withEndDate:v118];

          v120 = [MEMORY[0x1E4F92900] sharedInstance];
          [(PLBBAgent *)self lastBBProtoPower];
          objc_msgSend(v120, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 22, v14);

          if ((([MEMORY[0x1E4F92A38] isBasebandClass:1003001] & 1) != 0
             || [MEMORY[0x1E4F92A38] isBasebandClass:1003002])
            && ![(PLBBAgent *)self lteCurrentState])
          {
            v121 = [MEMORY[0x1E4F92900] sharedInstance];
            [v121 createPowerEventBackwardWithRootNodeID:21 withPower:v14 withEndDate:0.0];
          }
          if (v118 > 100.0)
          {
            v122 = [v14 dateByAddingTimeInterval:v124 * -0.0000305175781];
            v123 = [MEMORY[0x1E4F92900] sharedInstance];
            [v123 createQualificationEventForwardWithQualificationID:1 withChildNodeNames:&unk_1F29EE3A8 withStartDate:v122];
          }
          int v13 = v129;
        }
      }
    }
  }
}

- (float)translateTransBW:(int)a3
{
  if (a3 > 5) {
    return 50.0;
  }
  else {
    return flt_1D2B03208[a3];
  }
}

- (BOOL)isEarfcnHighBand:(int)a3
{
  int32x4_t v3 = vdupq_n_s32(a3);
  uint32x4_t v4 = (uint32x4_t)vaddq_s32(v3, (int32x4_t)xmmword_1D2B031C0);
  uint32x4_t v5 = (uint32x4_t)vaddq_s32(v3, (int32x4_t)xmmword_1D2B031D0);
  BOOL v7 = a3 < 0x960 || (a3 - 59140) < 0x3E8;
  char v8 = vmaxv_u8((uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vcgtq_u32((uint32x4_t)xmmword_1D2B031E0, v4), (int16x8_t)vcgtq_u32((uint32x4_t)xmmword_1D2B031F0, v5)))) | ((a3 - 2750) < 0x2BC);
  BOOL v10 = (a3 - 0x10000) < 0x708 || (a3 - 67836) < 0x2EE;
  return (v8 | (v7 || v10)) & 1;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D4A = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2093(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D4B = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2099(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D4C = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2105(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D4D = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2111(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D4E = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2117(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D4F = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2123(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D50 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2129(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D51 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2135(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D52 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2141(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D53 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2147(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D54 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2153(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D55 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2159(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D56 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2165(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D57 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2171(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D58 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2177(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D59 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2183(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D5A = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2189(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D5B = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2195(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D5C = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2201(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D5D = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2207(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D5E = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2213(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D5F = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2219(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D60 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2225(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D61 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2231(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D62 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2237(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D63 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2243(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D64 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2249(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D65 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2255(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D66 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2261(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D67 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2267(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D68 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2273(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D69 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2279(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D6A = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2285(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D6B = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2291(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D6C = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2297(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D6D = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2303(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D6E = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2309(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D6F = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2315(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D70 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2321(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D71 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2327(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D72 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2333(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D73 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2339(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D74 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2345(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D75 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2351(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D76 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2357(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D77 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2363(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D78 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2369(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D79 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2375(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D7A = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2381(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D7B = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2387(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D7C = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2393(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D7D = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2399(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D7E = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2405(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D7F = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2411(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D80 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2417(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D81 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2423(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D82 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2429(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D83 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2435(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D84 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2441(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D85 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2447(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D86 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2453(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D87 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2459(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D88 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2465(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D89 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2471(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D8A = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2477(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D8B = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2483(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D8C = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2489(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D8D = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2495(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D8E = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2501(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D8F = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2507(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D90 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2513(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D91 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2519(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D92 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2522(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D93 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2528(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D94 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2534(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D95 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2540(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D96 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2546(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D97 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2549(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D98 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2552(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D99 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2558(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D9A = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2564(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D9B = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2570(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D9C = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2576(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D9D = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2579(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D9E = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2582(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58D9F = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2588(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DA0 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2594(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DA1 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2600(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DA2 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2606(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DA3 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2612(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DA4 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2618(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DA5 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2624(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DA6 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2630(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DA7 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2636(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DA8 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2642(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DA9 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2648(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DAA = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2654(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DAB = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2660(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DAC = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2666(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DAD = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2672(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DAE = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2678(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DAF = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2684(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DB0 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2690(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DB1 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2696(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DB2 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2702(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DB3 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2708(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DB4 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2714(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DB5 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2720(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DB6 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2726(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DB7 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2732(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DB8 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2738(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DB9 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2744(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DBA = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2750(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DBB = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2756(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DBC = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2762(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DBD = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2768(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DBE = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2774(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DBF = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2780(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DC0 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2786(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DC1 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2792(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DC2 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2798(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DC3 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2804(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DC4 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2810(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DC5 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2816(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DC6 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2822(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DC7 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2828(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DC8 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2834(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DC9 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2840(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DCA = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2846(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DCB = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2852(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DCC = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2858(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DCD = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2864(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DCE = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2870(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DCF = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2876(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DD0 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2882(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DD1 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2888(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DD2 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2894(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DD3 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2900(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DD4 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2906(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DD5 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2912(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DD6 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2918(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DD7 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2924(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DD8 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2930(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DD9 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2936(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DDA = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2942(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DDB = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2948(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DDC = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2954(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DDD = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2960(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DDE = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2966(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DDF = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2972(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DE0 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2978(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DE1 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2984(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DE2 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2990(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DE3 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2996(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DE4 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3002(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DE5 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3008(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DE6 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3014(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DE7 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3020(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DE8 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3026(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DE9 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3032(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DEA = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3038(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DEB = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3044(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DEC = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3050(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DED = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3056(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DEE = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3062(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DEF = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3068(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DF0 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3074(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DF1 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3080(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DF2 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3086(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DF3 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3092(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DF4 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3098(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DF5 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3104(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DF6 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3110(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DF7 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3116(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DF8 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3122(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DF9 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3128(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DFA = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3134(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DFB = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3140(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DFC = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3146(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DFD = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3152(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DFE = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3158(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58DFF = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3164(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E00 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3170(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E01 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3176(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E02 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3182(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E03 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3188(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E04 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3194(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E05 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3200(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E06 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3206(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E07 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3212(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E08 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3218(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E09 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3224(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E0A = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3230(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E0B = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3236(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E0C = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3242(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E0D = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3248(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E0E = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_3260(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E0F = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E10 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3266(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E11 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3272(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E12 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3278(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E13 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3284(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E14 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3290(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E15 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3296(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E16 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3302(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E17 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3308(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E18 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3314(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E19 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3320(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E1A = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3326(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E1B = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3332(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E1C = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3338(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E1D = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3344(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E1E = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3350(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E1F = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3356(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E20 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3362(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E21 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3368(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E22 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3374(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E23 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3380(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E24 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3386(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E25 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3392(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E26 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3398(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E27 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3404(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E28 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3410(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E29 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3416(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E2A = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3422(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E2B = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3428(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E2C = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3434(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E2D = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3440(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E2E = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3446(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E2F = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3452(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E30 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3458(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E31 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3464(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E32 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3470(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E33 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3476(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E34 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3482(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E35 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3488(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E36 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3494(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E37 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3500(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E38 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3506(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E39 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3512(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E3A = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3518(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E3B = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3524(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E3C = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3530(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E3D = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3536(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E3E = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3542(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E3F = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3548(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E40 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3554(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E41 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3560(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E42 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3566(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E43 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3572(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E44 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3578(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E45 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3584(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E46 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3590(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E47 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3596(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E48 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3602(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E49 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3608(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E4A = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3614(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E4B = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3620(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E4C = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3626(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E4D = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3632(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E4E = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3638(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E4F = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3644(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E50 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3650(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E51 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3656(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E52 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3662(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E53 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3668(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E54 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3674(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E55 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3680(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E56 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3686(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E57 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3692(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E58 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3698(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E59 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3701(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E5A = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3707(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E5B = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3713(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E5C = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3719(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E5D = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3725(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E5E = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3731(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E5F = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3737(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E60 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3743(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E61 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3749(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E62 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3755(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E63 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3761(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E64 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3767(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E65 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3773(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E66 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3779(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E67 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3785(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E68 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3791(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E69 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3797(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E6A = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3803(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E6B = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3809(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E6C = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3815(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E6D = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3821(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E6E = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3827(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E6F = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3833(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E70 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3839(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E71 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3845(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E72 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3851(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E73 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3857(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E74 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3863(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E75 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3869(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E76 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3875(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E77 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3881(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E78 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3887(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E79 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3893(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E7A = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3899(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E7B = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3905(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E7C = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3911(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E7D = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3917(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E7E = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3923(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E7F = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3929(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E80 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3935(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E81 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3941(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E82 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3947(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E83 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3953(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E84 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3959(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E85 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3965(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E86 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3971(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E87 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3977(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E88 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3983(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E89 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3989(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E8A = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3995(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E8B = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4001(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E8C = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4007(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E8D = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4013(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E8E = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4019(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E8F = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4025(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E90 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4031(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E91 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4037(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E92 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4043(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E93 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4049(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E94 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4055(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E95 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4061(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E96 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4067(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E97 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4073(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E98 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4079(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E99 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4085(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E9A = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4091(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E9B = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4097(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E9C = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4103(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E9D = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4109(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E9E = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4115(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58E9F = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4121(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EA0 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4127(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EA1 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4133(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EA2 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4139(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EA3 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4145(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EA4 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4151(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EA5 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4157(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EA6 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4163(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EA7 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4169(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EA8 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4175(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EA9 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4181(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EAA = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4187(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EAB = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4193(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EAC = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4199(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EAD = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4205(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EAE = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4211(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EAF = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4217(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EB0 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4223(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EB1 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4229(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EB2 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4235(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EB3 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4241(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EB4 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4247(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EB5 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4253(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EB6 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4259(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EB7 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4265(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EB8 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4271(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EB9 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4277(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EBA = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4283(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EBB = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4289(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EBC = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4295(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EBD = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4301(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EBE = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4307(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EBF = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4313(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EC0 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4319(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EC1 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4325(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EC2 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4331(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EC3 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4337(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EC4 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4343(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EC5 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4349(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EC6 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4355(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EC7 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4361(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EC8 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4367(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EC9 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4373(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58ECA = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4379(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58ECB = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4385(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58ECC = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4391(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58ECD = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4397(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58ECE = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4403(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58ECF = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4409(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58ED0 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4415(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58ED1 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4421(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58ED2 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4424(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58ED3 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4427(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58ED4 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4430(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58ED5 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4433(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58ED6 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4439(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58ED7 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4445(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58ED8 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4451(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58ED9 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4457(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EDA = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4463(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EDB = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4469(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EDC = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4475(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EDD = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4481(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EDE = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4487(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EDF = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4493(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EE0 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4499(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EE1 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4505(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EE2 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4511(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EE3 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4517(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EE4 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4523(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EE5 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4529(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EE6 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4535(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EE7 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4541(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EE8 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4547(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EE9 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4553(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EEA = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4559(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EEB = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4562(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EEC = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4565(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EED = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4568(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EEE = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4571(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EEF = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4577(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EF0 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4580(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EF1 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4586(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EF2 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4592(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EF3 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4598(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EF4 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4604(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EF5 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4610(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EF6 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4616(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EF7 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4622(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EF8 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4628(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EF9 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4634(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EFA = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4640(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EFB = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4646(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EFC = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4652(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EFD = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4655(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EFE = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4658(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58EFF = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4661(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F00 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4664(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F01 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4667(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F02 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4670(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F03 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4673(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F04 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4676(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F05 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4679(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F06 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4682(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F07 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4685(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F08 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4688(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F09 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4694(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F0A = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4700(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F0B = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4703(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F0C = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4709(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F0D = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4712(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F0E = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4715(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F0F = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4721(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F10 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_4730(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F11 = result;
  return result;
}

+ (id)indexToRat:(unint64_t)a3
{
  if (a3 > 5) {
    return &stru_1F294E108;
  }
  else {
    return off_1E692F0F0[a3];
  }
}

- (void)modelScanPower:(id)a3
{
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint32x4_t v4 = [v3 objectForKeyedSubscript:@"PLBBAgent_EventBackward_MavBBHwOtherPerRAT"];

  if (!v4) {
    goto LABEL_63;
  }
  uint32x4_t v5 = [v3 objectForKeyedSubscript:@"PLBBAgent_EventBackward_MavBBHwOtherPerRAT"];
  uint64_t v6 = [v5 count];

  uint64_t v157 = v6;
  if (!v6) {
    goto LABEL_63;
  }
  BOOL v7 = [MEMORY[0x1E4F92A88] MavRevStringQuery];
  char v8 = [v3 objectForKeyedSubscript:@"PLBBAgent_EventBackward_MavBBHwOther"];
  uint64_t v9 = [v8 objectAtIndexedSubscript:0];

  BOOL v10 = [v9 entryDate];
  uint64_t v11 = [v9 objectForKeyedSubscript:@"LogDuration"];
  [v11 doubleValue];
  double v13 = v12;

  if (v13 <= 0.0) {
    goto LABEL_62;
  }
  double v137 = v9;
  v138 = v10;
  double v154 = v7;
  v155 = v3;
  double v156 = [MEMORY[0x1E4F92A88] powerModelForOperatorName:@"baseband"];
  uint64_t v14 = 0;
  double v15 = 0.0;
  double v16 = 0.0;
  do
  {
    double v17 = [v3 objectForKeyedSubscript:@"PLBBAgent_EventBackward_MavBBHwOtherPerRAT"];
    uint64_t v18 = [v17 objectAtIndexedSubscript:v14];

    if (!v18) {
      goto LABEL_12;
    }
    uint64_t v19 = [v3 objectForKeyedSubscript:@"PLBBAgent_EventBackward_MavBBHwOtherPerRAT"];
    double v20 = [v19 objectAtIndexedSubscript:v14];
    double v21 = [v20 objectForKeyedSubscript:@"RadioTech"];
    int v22 = [v21 intValue];

    uint64_t v23 = +[PLBBAgent indexToRat:v22];
    if (!v23) {
      goto LABEL_61;
    }
    double v24 = (void *)v23;
    double v25 = [v156 objectForKeyedSubscript:v7];
    double v26 = [v25 objectForKeyedSubscript:v24];
    double v27 = [v26 objectForKeyedSubscript:@"SCAN"];
    [v27 doubleValue];
    double v29 = v28;

    double v30 = [v156 objectForKeyedSubscript:v7];
    double v31 = [v30 objectForKeyedSubscript:v24];
    double v32 = [v31 objectForKeyedSubscript:@"CELL_SEL_RESEL"];
    [v32 doubleValue];
    double v34 = v33;

    double v35 = [v156 objectForKeyedSubscript:v7];
    uint64_t v36 = [v35 objectForKeyedSubscript:v24];
    double v37 = [v36 objectForKeyedSubscript:@"IDLE"];
    [v37 doubleValue];

    double v38 = [v3 objectForKeyedSubscript:@"PLBBAgent_EventBackward_MavBBHwOtherPerRAT"];
    double v39 = [v38 objectAtIndexedSubscript:v14];

    double v40 = [v39 objectForKeyedSubscript:@"ProtocolStateHist"];
    uint64_t v41 = [v40 objectAtIndexedSubscript:2];
    [v41 doubleValue];
    double v43 = v42;

    if (([MEMORY[0x1E4F92A38] isBasebandClass:1003001] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isBasebandClass:1003002] & 1) != 0)
    {
      uint64_t v44 = 12;
    }
    else
    {
      if (![MEMORY[0x1E4F92A38] isBasebandMavLeg]) {
        goto LABEL_11;
      }
      uint64_t v44 = 11;
    }
    double v45 = [v40 objectAtIndexedSubscript:v44];
    [v45 doubleValue];
    double v15 = v46;

LABEL_11:
    double v47 = [v40 objectAtIndexedSubscript:3];
    [v47 doubleValue];

    double v16 = v16 + v34 * v15 + v43 * v29;
LABEL_12:
    ++v14;
  }
  while (v157 != v14);
  char v48 = [MEMORY[0x1E4F92A38] isBasebandClass:1003001];
  if ((v48 & 1) != 0 || [MEMORY[0x1E4F92A38] isBasebandClass:1003002])
  {
    double v49 = [MEMORY[0x1E4F92900] sharedInstance];
    [v49 createPowerEventBackwardWithRootNodeID:46 withPower:v138 withEndDate:v16 / v13];
  }
  if (![MEMORY[0x1E4F92A38] isBasebandMavLeg]) {
    goto LABEL_61;
  }
  int64_t v50 = [v3 objectForKeyedSubscript:@"PLBBAgent_EventBackward_MavBBHwOtherPerRAT"];

  double v51 = 0.0;
  if (!v50)
  {
    double v53 = 0;
    v158 = 0;
    double v65 = 0.0;
    double v66 = v138;
    double v62 = v156;
    goto LABEL_51;
  }
  long long v161 = 0u;
  long long v162 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  uint64_t v52 = [v3 objectForKeyedSubscript:@"PLBBAgent_EventBackward_MavBBHwOtherPerRAT"];
  double v53 = (void *)[v52 countByEnumeratingWithState:&v159 objects:v163 count:16];
  if (!v53)
  {
    v158 = 0;
    double v65 = 0.0;
    double v66 = v138;
    double v62 = v156;
    goto LABEL_50;
  }
  double v54 = 0;
  v158 = 0;
  uint64_t v55 = *(void *)v160;
  while (2)
  {
    uint64_t v56 = 0;
    while (2)
    {
      if (*(void *)v160 != v55) {
        objc_enumerationMutation(v52);
      }
      uint64_t v57 = *(void **)(*((void *)&v159 + 1) + 8 * v56);
      uint64_t v58 = [v57 objectForKeyedSubscript:@"RadioTech"];
      int v59 = [v58 intValue];

      if (v59)
      {
        if (v59 == 1)
        {
          double v60 = v158;
          v158 = v57;
          goto LABEL_30;
        }
      }
      else
      {
        double v60 = v54;
        double v54 = v57;
LABEL_30:
        id v61 = v57;
      }
      if (v53 != (void *)++v56) {
        continue;
      }
      break;
    }
    double v53 = (void *)[v52 countByEnumeratingWithState:&v159 objects:v163 count:16];
    if (v53) {
      continue;
    }
    break;
  }

  double v62 = v156;
  double v53 = v54;
  if (v54)
  {
    double v63 = [v54 objectForKeyedSubscript:@"ProtocolStateHist"];
    double v64 = [v63 objectAtIndexedSubscript:2];
    [v64 doubleValue];
    double v65 = 0.0;
    double v66 = v138;
    if (v67 >= v13) {
      goto LABEL_37;
    }
    uint64_t v68 = [v63 objectAtIndexedSubscript:3];
    [v68 doubleValue];
    double v70 = v69;

    if (v70 < v13)
    {
      double v71 = [v63 objectAtIndexedSubscript:2];
      [v71 doubleValue];
      double v73 = v72;
      uint64_t v74 = [v156 objectForKeyedSubscript:v154];
      v75 = [v74 objectForKeyedSubscript:@"CDMA2K"];
      v76 = [v75 objectForKeyedSubscript:@"SCAN"];
      [v76 doubleValue];
      double v78 = v73 * v77 + 0.0;

      double v64 = [v63 objectAtIndexedSubscript:3];
      [v64 doubleValue];
      double v80 = v79;
      v81 = [v156 objectForKeyedSubscript:v154];
      v82 = [v81 objectForKeyedSubscript:@"CDMA2K"];
      double v83 = [v82 objectForKeyedSubscript:@"CELL_SEL_RESEL"];
      [v83 doubleValue];
      double v65 = v78 + v80 * v84;

LABEL_37:
    }

    double v53 = v54;
  }
  else
  {
    double v65 = 0.0;
    double v66 = v138;
  }
  if (v158)
  {
    uint64_t v52 = [v158 objectForKeyedSubscript:@"ProtocolStateHist"];
    int v85 = [v52 objectAtIndexedSubscript:2];
    [v85 doubleValue];
    if (v86 >= v13) {
      goto LABEL_46;
    }
    double v87 = [v52 objectAtIndexedSubscript:3];
    [v87 doubleValue];
    double v89 = v88;

    if (v89 >= v13)
    {
      double v53 = v54;
    }
    else
    {
      unint64_t v90 = [v52 objectAtIndexedSubscript:2];
      [v90 doubleValue];
      double v92 = v91;
      double v93 = [v156 objectForKeyedSubscript:v154];
      double v94 = [v93 objectForKeyedSubscript:@"1xEVDO"];
      double v95 = [v94 objectForKeyedSubscript:@"SCAN"];
      [v95 doubleValue];
      double v97 = v65 + v92 * v96;

      int v85 = [v52 objectAtIndexedSubscript:3];
      [v85 doubleValue];
      double v99 = v98;
      double v62 = v156;
      double v100 = [v156 objectForKeyedSubscript:v154];
      double v101 = [v100 objectForKeyedSubscript:@"1xEVDO"];
      uint64_t v102 = [v101 objectForKeyedSubscript:@"CELL_SEL_RESEL"];
      [v102 doubleValue];
      double v65 = v97 + v99 * v103;

      double v53 = v54;
LABEL_46:
    }
    id v3 = v155;
LABEL_50:
  }
  else
  {
    v158 = 0;
    id v3 = v155;
  }
LABEL_51:
  uint64_t v104 = [v3 objectForKeyedSubscript:@"PLBBAgent_EventBackward_BBMavHwRfOos"];

  if (v104)
  {
    double v136 = v53;
    double v105 = [v155 objectForKeyedSubscript:@"PLBBAgent_EventBackward_BBMavHwRfOos"];
    double v106 = [v105 objectAtIndexedSubscript:0];

    double v142 = [v106 objectForKeyedSubscript:@"oosGsmPssiStatTicks"];
    double v141 = [v106 objectForKeyedSubscript:@"oosWcdmaPssiStatTicks"];
    double v140 = [v106 objectForKeyedSubscript:@"oosLtePssiStatTicks"];
    double v135 = v106;
    v139 = [v106 objectForKeyedSubscript:@"oosTdsPssiStatTicks"];
    for (uint64_t i = 0; i != 6; ++i)
    {
      double v153 = [v142 objectAtIndexedSubscript:i];
      [v153 doubleValue];
      double v109 = v108;
      v152 = [v62 objectForKeyedSubscript:v154];
      v151 = [v152 objectForKeyedSubscript:@"GSM"];
      v150 = [v151 objectForKeyedSubscript:@"Pssi"];
      v149 = [v150 objectAtIndexedSubscript:i];
      [v149 doubleValue];
      double v111 = v110;
      double v148 = [v141 objectAtIndexedSubscript:i];
      [v148 doubleValue];
      double v113 = v112;
      double v147 = [v62 objectForKeyedSubscript:v154];
      v146 = [v147 objectForKeyedSubscript:@"WCDMA"];
      v145 = [v146 objectForKeyedSubscript:@"Pssi"];
      double v144 = [v145 objectAtIndexedSubscript:i];
      [v144 doubleValue];
      double v115 = v113 * v114 + v109 * v111;
      id v143 = [v140 objectAtIndexedSubscript:i];
      [v143 doubleValue];
      double v117 = v116;
      double v118 = [v62 objectForKeyedSubscript:v154];
      v119 = [v118 objectForKeyedSubscript:@"LTE"];
      v120 = [v119 objectForKeyedSubscript:@"Pssi"];
      v121 = [v120 objectAtIndexedSubscript:i];
      [v121 doubleValue];
      double v123 = v115 + v117 * v122;
      double v124 = [v139 objectAtIndexedSubscript:i];
      [v124 doubleValue];
      double v126 = v125;
      id v127 = [v156 objectForKeyedSubscript:v154];
      v128 = [v127 objectForKeyedSubscript:@"UTRAN"];
      double v129 = [v128 objectForKeyedSubscript:@"Pssi"];
      double v130 = [v129 objectAtIndexedSubscript:i];
      [v130 doubleValue];
      double v65 = v65 + v123 + v126 * v131;

      double v62 = v156;
    }
    double v51 = v65 / v13;

    double v66 = v138;
    double v53 = v136;
  }
  double v132 = 0.0;
  if (v51 >= 0.0) {
    double v132 = v51;
  }
  if (v132 <= 2000.0) {
    double v133 = v132;
  }
  else {
    double v133 = 2000.0;
  }
  v134 = [MEMORY[0x1E4F92900] sharedInstance];
  [v134 createPowerEventBackwardWithRootNodeID:47 withPower:v66 withEndDate:v133];

  id v3 = v155;
LABEL_61:

  BOOL v7 = v154;
  uint64_t v9 = v137;
  BOOL v10 = v138;
LABEL_62:

LABEL_63:
}

- (void)loadOOSModelValues
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__PLBBAgent_loadOOSModelValues__block_invoke;
  block[3] = &unk_1E692A250;
  void block[4] = self;
  if (loadOOSModelValues_onceToken != -1) {
    dispatch_once(&loadOOSModelValues_onceToken, block);
  }
}

void __31__PLBBAgent_loadOOSModelValues__block_invoke(uint64_t a1)
{
  id v12 = [MEMORY[0x1E4F92A88] MavRevStringQuery];
  uint64_t v2 = [MEMORY[0x1E4F92A88] powerModelForOperatorName:@"baseband"];
  id v3 = [v2 objectForKeyedSubscript:v12];
  uint32x4_t v4 = [v3 objectForKeyedSubscript:@"OOS"];
  uint32x4_t v5 = [v4 objectForKeyedSubscript:@"gw"];
  [v5 doubleValue];
  objc_msgSend(*(id *)(a1 + 32), "setOosGWPower:");

  uint64_t v6 = [v2 objectForKeyedSubscript:v12];
  BOOL v7 = [v6 objectForKeyedSubscript:@"OOS"];
  char v8 = [v7 objectForKeyedSubscript:@"cdma"];
  [v8 doubleValue];
  objc_msgSend(*(id *)(a1 + 32), "setOosCDMAPower:");

  uint64_t v9 = [v2 objectForKeyedSubscript:v12];
  BOOL v10 = [v9 objectForKeyedSubscript:@"OOS"];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"hdr"];
  [v11 doubleValue];
  objc_msgSend(*(id *)(a1 + 32), "setOosHDRPower:");
}

- (void)modelOOSPower:(id)a3
{
  id v31 = a3;
  [(PLBBAgent *)self loadOOSModelValues];
  uint32x4_t v4 = [v31 objectForKeyedSubscript:@"Event"];
  int v5 = [v4 intValue];

  uint64_t v6 = [v31 objectForKeyedSubscript:@"Action"];
  int v7 = [v6 intValue];

  if (v7 != 11)
  {
    if ((v5 - 1001) < 2 || !v7)
    {
      uint64_t v18 = [v31 entryDate];
      [v18 timeIntervalSinceDate:self->_lastOOSTimestamp];
      double v20 = v19;

      self->_totalOosGWScanEnergy = self->_totalOosGWScanEnergy + v20 * self->_lastGWPower;
      self->_lastGWPower = 0.0;
      double v21 = [v31 entryDate];
      lastOOSTimestamp = self->_lastOOSTimestamp;
      self->_lastOOSTimestamp = v21;
LABEL_21:

      goto LABEL_22;
    }
    if (v5 == 801)
    {
      if (self->_lastOOSTimestamp)
      {
        uint64_t v23 = [v31 entryDate];
        [v23 timeIntervalSinceDate:self->_lastOOSTimestamp];
        double v16 = v24;

        if (v16 < 0.15)
        {
          double v17 = &OBJC_IVAR___PLBBAgent__oosHDRPower;
          goto LABEL_16;
        }
      }
      uint64_t v25 = 360;
      double oosHDRPower = self->_oosHDRPower;
      double totalOosHDRScanEnergy = self->_totalOosHDRScanEnergy;
    }
    else
    {
      if (v5 != 301) {
        goto LABEL_22;
      }
      if (self->_lastOOSTimestamp)
      {
        uint64_t v14 = [v31 entryDate];
        [v14 timeIntervalSinceDate:self->_lastOOSTimestamp];
        double v16 = v15;

        if (v16 < 0.15)
        {
          double v17 = &OBJC_IVAR___PLBBAgent__oosCDMAPower;
LABEL_16:
          uint64_t v26 = *v17;
          uint64_t v25 = v17[1];
          double v27 = *(double *)((char *)&self->super.super.super.isa + v25)
              + v16 * *(double *)((char *)&self->super.super.super.isa + v26);
LABEL_20:
          *(double *)((char *)&self->super.super.super.isa + v25) = v27;
          double v30 = [v31 entryDate];
          lastOOSTimestamp = self->_lastOOSTimestamp;
          self->_lastOOSTimestamp = v30;
          goto LABEL_21;
        }
      }
      uint64_t v25 = 352;
      double oosHDRPower = self->_oosCDMAPower;
      double totalOosHDRScanEnergy = self->_totalOosCDMAScanEnergy;
    }
    double v27 = totalOosHDRScanEnergy + oosHDRPower * 0.15;
    goto LABEL_20;
  }
  double oosGWPower = self->_oosGWPower;
  if (self->_lastGWPower != oosGWPower)
  {
    uint64_t v9 = [v31 entryDate];
    BOOL v10 = self->_lastOOSTimestamp;
    self->_lastOOSTimestamp = v9;

    uint64_t v11 = [v31 entryDate];
    [v11 timeIntervalSinceDate:self->_lastOOSTimestamp];
    double v13 = v12;

    self->_totalOosGWScanEnergy = self->_totalOosGWScanEnergy + v13 * self->_lastGWPower;
    double oosGWPower = self->_oosGWPower;
  }
  self->_lastGWPower = oosGWPower;
LABEL_22:
}

- (void)modelGPSPower:(id)a3
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint32x4_t v4 = [MEMORY[0x1E4F92A88] MavRevStringQuery];
  int v5 = [MEMORY[0x1E4F92A88] powerModelForOperatorName:@"baseband"];
  if (([MEMORY[0x1E4F92A38] isBasebandClass:1003002] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isBasebandClass:1003003] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isBasebandClass:1003004] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isBasebandClass:1003005] & 1) != 0
    || [MEMORY[0x1E4F92A38] isBasebandClass:1003007])
  {
    uint64_t v6 = [v5 objectForKeyedSubscript:v4];
    int v7 = [v6 objectForKeyedSubscript:@"GPS"];
    char v8 = [v7 objectForKeyedSubscript:@"gps_dpo_bins_80ms"];
    [v8 doubleValue];
    double v124 = v9;

    BOOL v10 = [v5 objectForKeyedSubscript:v4];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"GPS"];
    double v12 = [v11 objectForKeyedSubscript:@"gps_dpo_bins_200ms"];
    [v12 doubleValue];
    double v123 = v13;

    uint64_t v14 = [v5 objectForKeyedSubscript:v4];
    double v15 = [v14 objectForKeyedSubscript:@"GPS"];
    double v16 = [v15 objectForKeyedSubscript:@"gps_dpo_bins_400ms"];
    [v16 doubleValue];
    double v122 = v17;

    uint64_t v18 = [v5 objectForKeyedSubscript:v4];
    double v19 = [v18 objectForKeyedSubscript:@"GPS"];
    double v20 = [v19 objectForKeyedSubscript:@"gps_dpo_bins_1000ms"];
    [v20 doubleValue];
    double v121 = v21;

    int v22 = [v5 objectForKeyedSubscript:v4];
    uint64_t v23 = [v22 objectForKeyedSubscript:@"GPS"];
    double v24 = [v23 objectForKeyedSubscript:@"gps_dpo_bins_unknown"];
    [v24 doubleValue];
    double v120 = v25;

    uint64_t v26 = [v5 objectForKeyedSubscript:v4];
    double v27 = [v26 objectForKeyedSubscript:@"GPS"];
    double v28 = [v27 objectForKeyedSubscript:@"gps_dpo_bins_aborted"];
    [v28 doubleValue];
    double v119 = v29;

    double v30 = [v3 objectForKeyedSubscript:@"GPSOnOffStateHistogram"];
    id v31 = [v3 objectForKeyedSubscript:@"GPSDPOOnOffStateHistogram"];
    double v32 = [v3 objectForKeyedSubscript:@"GPSDPOBins"];
    double v33 = [v3 objectForKeyedSubscript:@"LogDuration"];
    [v33 doubleValue];
    double v35 = v34;

    uint64_t v36 = [v30 objectAtIndexedSubscript:0];
    [v36 doubleValue];
    double v126 = v37;

    double v38 = [v30 objectAtIndexedSubscript:1];
    [v38 doubleValue];
    double v40 = v39;

    uint64_t v41 = [v31 objectAtIndexedSubscript:0];
    [v41 doubleValue];
    double v43 = v42;

    uint64_t v44 = [v31 objectAtIndexedSubscript:1];
    [v44 doubleValue];
    double v46 = v45;

    double v47 = [v32 objectAtIndexedSubscript:0];
    [v47 doubleValue];
    double v118 = v48;

    double v49 = [v32 objectAtIndexedSubscript:1];
    [v49 doubleValue];
    double v117 = v50;

    double v51 = [v32 objectAtIndexedSubscript:2];
    [v51 doubleValue];
    double v53 = v52;

    double v54 = [v32 objectAtIndexedSubscript:3];
    [v54 doubleValue];
    double v56 = v55;

    uint64_t v57 = [v32 objectAtIndexedSubscript:4];
    [v57 doubleValue];
    double v59 = v58;

    double v60 = [v32 objectAtIndexedSubscript:5];
    [v60 doubleValue];
    double v62 = v61;

    if (v126 + v40 >= v35 && v43 + v46 >= v35)
    {
      double v63 = 0.0;
      if (v35 > 0.0) {
        double v63 = (v123 * v117 + v118 * v124 + v53 * v122 + v56 * v121 + v59 * v120 + v62 * v119) / v35 * 32768.0;
      }
      goto LABEL_10;
    }

    goto LABEL_21;
  }
  if ([MEMORY[0x1E4F92A38] isBasebandClass:1003001])
  {
    double v73 = [v5 objectForKeyedSubscript:v4];
    uint64_t v74 = [v73 objectForKeyedSubscript:@"GPS"];
    v75 = [v74 objectForKeyedSubscript:@"gps_dpo"];
    [v75 doubleValue];
    double v77 = v76;

    double v30 = [v3 objectForKeyedSubscript:@"GPSOnOffStateHistogram"];
    id v31 = [v3 objectForKeyedSubscript:@"GPSDPOOnOffStateHistogram"];
    double v78 = [v3 objectForKeyedSubscript:@"LogDuration"];
    [v78 doubleValue];
    double v80 = v79;

    v81 = [v30 objectAtIndexedSubscript:0];
    [v81 doubleValue];
    double v83 = v82;

    double v84 = [v30 objectAtIndexedSubscript:1];
    [v84 doubleValue];
    double v86 = v85;

    double v87 = [v31 objectAtIndexedSubscript:0];
    [v87 doubleValue];
    double v89 = v88;

    unint64_t v90 = [v31 objectAtIndexedSubscript:1];
    [v90 doubleValue];
    double v92 = v91;

    double v94 = v83 + v86;
    if (v94 < v80 || (double v93 = v89 + v92, v89 + v92 < v80))
    {
      if (objc_msgSend(MEMORY[0x1E4F929C0], "debugEnabled", v93))
      {
        uint64_t v104 = objc_opt_class();
        v134[0] = MEMORY[0x1E4F143A8];
        v134[1] = 3221225472;
        v134[2] = __27__PLBBAgent_modelGPSPower___block_invoke;
        v134[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v134[4] = v104;
        if (qword_1EBD5B4C8 != -1) {
          dispatch_once(&qword_1EBD5B4C8, v134);
        }
        if (byte_1EBD58F12)
        {
          v128 = v30;
          v105 = objc_msgSend(NSString, "stringWithFormat:", @"gpsOnDuration + gpsOffDuratiouint64_t n = %f", *(void *)&v94);
          double v106 = (void *)MEMORY[0x1E4F929B8];
          double v107 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
          double v108 = [v107 lastPathComponent];
          double v109 = [NSString stringWithUTF8String:"-[PLBBAgent modelGPSPower:]"];
          [v106 logMessage:v105 fromFile:v108 fromFunction:v109 fromLineNumber:9562];

          double v110 = PLLogCommon();
          if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            double v136 = v105;
            _os_log_debug_impl(&dword_1D2690000, v110, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          double v30 = v128;
        }
      }
      double v111 = [MEMORY[0x1E4F92900] sharedInstance];
      double v112 = [v3 entryDate];
      [v111 createPowerEventBackwardWithRootNodeID:48 withPower:v112 withEndDate:0.0];
    }
    else
    {
      if (v86 >= v92) {
        double v86 = v92;
      }
      if (v80 > 0.0)
      {
        double v63 = v77 * v86 / v80;
        if (![MEMORY[0x1E4F929C0] debugEnabled]) {
          goto LABEL_11;
        }
        uint64_t v95 = objc_opt_class();
        v133[0] = MEMORY[0x1E4F143A8];
        v133[1] = 3221225472;
        v133[2] = __27__PLBBAgent_modelGPSPower___block_invoke_4793;
        v133[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v133[4] = v95;
        if (qword_1EBD5B4D0 != -1) {
          dispatch_once(&qword_1EBD5B4D0, v133);
        }
        if (!byte_1EBD58F13) {
          goto LABEL_11;
        }
        double v32 = [NSString stringWithFormat:@"gpsDPOOnDuration = %f, logDuration = %f, power = %f", *(void *)&v86, *(void *)&v80, *(void *)&v63];
        double v125 = (void *)MEMORY[0x1E4F929B8];
        id v127 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
        double v96 = [v127 lastPathComponent];
        double v97 = [NSString stringWithUTF8String:"-[PLBBAgent modelGPSPower:]"];
        [v125 logMessage:v32 fromFile:v96 fromFunction:v97 fromLineNumber:9579];

        double v98 = PLLogCommon();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          double v136 = v32;
          _os_log_debug_impl(&dword_1D2690000, v98, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

LABEL_10:
LABEL_11:

        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v64 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __27__PLBBAgent_modelGPSPower___block_invoke_4811;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          void block[4] = v64;
          if (qword_1EBD5B4E8 != -1) {
            dispatch_once(&qword_1EBD5B4E8, block);
          }
          if (byte_1EBD58F16)
          {
            double v65 = objc_msgSend(NSString, "stringWithFormat:", @"modelGPSPower: Add %f to rail", *(void *)&v63);
            double v66 = (void *)MEMORY[0x1E4F929B8];
            double v67 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
            uint64_t v68 = [v67 lastPathComponent];
            double v69 = [NSString stringWithUTF8String:"-[PLBBAgent modelGPSPower:]"];
            [v66 logMessage:v65 fromFile:v68 fromFunction:v69 fromLineNumber:9594];

            double v70 = PLLogCommon();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              double v136 = v65;
              _os_log_debug_impl(&dword_1D2690000, v70, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        double v71 = [MEMORY[0x1E4F92900] sharedInstance];
        double v72 = [v3 entryDate];
        [v71 createPowerEventBackwardWithRootNodeID:48 withPower:v72 withEndDate:v63];
LABEL_19:

        goto LABEL_22;
      }
      if (!objc_msgSend(MEMORY[0x1E4F929C0], "debugEnabled", v93)) {
        goto LABEL_21;
      }
      uint64_t v113 = objc_opt_class();
      v132[0] = MEMORY[0x1E4F143A8];
      v132[1] = 3221225472;
      v132[2] = __27__PLBBAgent_modelGPSPower___block_invoke_4799;
      v132[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v132[4] = v113;
      if (qword_1EBD5B4D8 != -1) {
        dispatch_once(&qword_1EBD5B4D8, v132);
      }
      if (!byte_1EBD58F14)
      {
LABEL_21:

        goto LABEL_22;
      }
      double v111 = [NSString stringWithFormat:@"modelGPSPower: LogDuration is zero"];
      double v129 = (void *)MEMORY[0x1E4F929B8];
      double v114 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      double v115 = [v114 lastPathComponent];
      double v116 = [NSString stringWithUTF8String:"-[PLBBAgent modelGPSPower:]"];
      [v129 logMessage:v111 fromFile:v115 fromFunction:v116 fromLineNumber:9581];

      double v112 = PLLogCommon();
      if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v136 = v111;
        _os_log_debug_impl(&dword_1D2690000, v112, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }

    goto LABEL_21;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v99 = objc_opt_class();
    v131[0] = MEMORY[0x1E4F143A8];
    v131[1] = 3221225472;
    v131[2] = __27__PLBBAgent_modelGPSPower___block_invoke_4805;
    v131[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v131[4] = v99;
    if (qword_1EBD5B4E0 != -1) {
      dispatch_once(&qword_1EBD5B4E0, v131);
    }
    if (byte_1EBD58F15)
    {
      double v71 = [NSString stringWithFormat:@"Mav version not found, return"];
      double v100 = (void *)MEMORY[0x1E4F929B8];
      double v101 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      uint64_t v102 = [v101 lastPathComponent];
      double v103 = [NSString stringWithUTF8String:"-[PLBBAgent modelGPSPower:]"];
      [v100 logMessage:v71 fromFile:v102 fromFunction:v103 fromLineNumber:9586];

      double v72 = PLLogCommon();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v136 = v71;
        _os_log_debug_impl(&dword_1D2690000, v72, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      goto LABEL_19;
    }
  }
LABEL_22:
}

uint64_t __27__PLBBAgent_modelGPSPower___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F12 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelGPSPower___block_invoke_4793(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F13 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelGPSPower___block_invoke_4799(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F14 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelGPSPower___block_invoke_4805(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F15 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelGPSPower___block_invoke_4811(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F16 = result;
  return result;
}

- (void)accountVoicePower:(id)a3 state:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  if (([MEMORY[0x1E4F92A38] isBasebandMavLeg] & 1) == 0)
  {
    int v7 = [v19 objectForKey:@"callId"];

    if (v7)
    {
      if ([v6 isEqualToString:@"voice_start"])
      {
        char v8 = [(PLBBAgent *)self currentCallList];
        [v8 count];

        double v9 = [(PLBBAgent *)self currentCallList];
        BOOL v10 = [v19 objectForKeyedSubscript:@"callId"];
        uint64_t v11 = [v10 description];
        [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v11];

LABEL_8:
        goto LABEL_9;
      }
      if ([v6 isEqualToString:@"voice_end"])
      {
        double v12 = [(PLBBAgent *)self currentCallList];
        double v13 = [v19 objectForKeyedSubscript:@"callId"];
        uint64_t v14 = [v13 description];
        double v15 = [v12 objectForKey:v14];

        if (v15)
        {
          double v16 = [(PLBBAgent *)self currentCallList];
          double v17 = [v19 objectForKeyedSubscript:@"callId"];
          uint64_t v18 = [v17 description];
          [v16 removeObjectForKey:v18];

          double v9 = [(PLBBAgent *)self currentCallList];
          [v9 count];
          goto LABEL_8;
        }
      }
    }
  }
LABEL_9:
}

- (void)createOOSAccountingEvent:(id)a3
{
  id v18 = a3;
  uint32x4_t v4 = [v18 objectForKey:@"status"];

  if (v4)
  {
    int v5 = [v18 objectForKeyedSubscript:@"status"];
    id v6 = [v5 description];
    if ([v6 isEqualToString:@"NotRegistered"])
    {
      uint64_t v7 = 1;
    }
    else
    {
      char v8 = [v18 objectForKeyedSubscript:@"status"];
      double v9 = [v8 description];
      uint64_t v7 = [v9 isEqualToString:@"EmergencyOnly"];
    }
    if ([(PLBBAgent *)self isFirstTimeAccountingOOS])
    {
      [(PLBBAgent *)self setIsBBOOS:v7 ^ 1];
      [(PLBBAgent *)self setIsFirstTimeAccountingOOS:0];
    }
    BOOL v10 = [(PLBBAgent *)self isBBOOS];
    if (v7)
    {
      if (v10) {
        goto LABEL_13;
      }
      uint64_t v11 = [MEMORY[0x1E4F92900] sharedInstance];
      double v12 = [v18 entryDate];
      [v11 createDistributionEventForwardWithDistributionID:40 withChildNodeNameToWeight:&unk_1F29EA738 withStartDate:v12];

      double v13 = [MEMORY[0x1E4F92900] sharedInstance];
      uint64_t v14 = [v18 entryDate];
      double v15 = &unk_1F29EE3F0;
    }
    else
    {
      if (!v10) {
        goto LABEL_13;
      }
      double v16 = [MEMORY[0x1E4F92900] sharedInstance];
      double v17 = [v18 entryDate];
      [v16 createDistributionEventForwardWithDistributionID:40 withChildNodeNameToWeight:MEMORY[0x1E4F1CC08] withStartDate:v17];

      double v13 = [MEMORY[0x1E4F92900] sharedInstance];
      uint64_t v14 = [v18 entryDate];
      double v15 = (void *)MEMORY[0x1E4F1CBF0];
    }
    [v13 createQualificationEventForwardWithQualificationID:1 withChildNodeNames:v15 withStartDate:v14];

    [(PLBBAgent *)self setIsBBOOS:v7];
  }
LABEL_13:
  MEMORY[0x1F41817F8]();
}

- (void)registerForAirplaneModeChange
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28B50] mainBundle];
  uint32x4_t v4 = [v3 bundleIdentifier];

  if (!v4)
  {
    int v5 = [MEMORY[0x1E4F28F80] processInfo];
    uint32x4_t v4 = [v5 processName];
  }
  context.versiouint64_t n = 0;
  memset(&context.retain, 0, 24);
  context.info = self;
  id v6 = SCPreferencesCreate(0, v4, @"com.apple.radios.plist");
  qword_1EBD5B4F0 = (uint64_t)v6;
  if (v6)
  {
    SCPreferencesSetCallback(v6, (SCPreferencesCallBack)preferencesChanged, &context);
    uint64_t v7 = (const __SCPreferences *)qword_1EBD5B4F0;
    char v8 = [(PLOperator *)self workQueue];
    SCPreferencesSetDispatchQueue(v7, v8);
LABEL_5:

    goto LABEL_13;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __42__PLBBAgent_registerForAirplaneModeChange__block_invoke;
    double v20 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v21 = v9;
    if (qword_1EBD5B4F8 != -1) {
      dispatch_once(&qword_1EBD5B4F8, &block);
    }
    if (byte_1EBD58F17)
    {
      BOOL v10 = NSString;
      int v11 = SCError();
      char v8 = objc_msgSend(v10, "stringWithFormat:", @"Unable to create preferences handle: %s", SCErrorString(v11), block, v18, v19, v20, v21, context.version, context.info, context.retain, context.release, context.copyDescription);
      double v12 = (void *)MEMORY[0x1E4F929B8];
      double v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      uint64_t v14 = [v13 lastPathComponent];
      double v15 = [NSString stringWithUTF8String:"-[PLBBAgent registerForAirplaneModeChange]"];
      [v12 logMessage:v8 fromFile:v14 fromFunction:v15 fromLineNumber:9775];

      double v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v24 = v8;
        _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_5;
    }
  }
LABEL_13:
}

uint64_t __42__PLBBAgent_registerForAirplaneModeChange__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F17 = result;
  return result;
}

- (BOOL)isChangedAndSetAirplaneMode
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 bundleIdentifier];

  if (!v3)
  {
    uint32x4_t v4 = [MEMORY[0x1E4F28F80] processInfo];
    id v3 = [v4 processName];
  }
  int v5 = SCPreferencesCreateWithAuthorization((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v3, @"com.apple.radios.plist", 0);
  if (SCPreferencesGetValue(v5, @"AirplaneMode") == (CFPropertyListRef)*MEMORY[0x1E4F1CFD0]) {
    id v6 = @"on";
  }
  else {
    id v6 = @"off";
  }
  uint64_t v7 = v6;
  CFRelease(v5);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __40__PLBBAgent_isChangedAndSetAirplaneMode__block_invoke;
    double v20 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v21 = v8;
    if (qword_1EBD5B508 != -1) {
      dispatch_once(&qword_1EBD5B508, &block);
    }
    if (byte_1EBD58F19)
    {
      uint64_t v9 = [NSString stringWithFormat:@"Airplane mode %@", v7, block, v18, v19, v20, v21];
      BOOL v10 = (void *)MEMORY[0x1E4F929B8];
      int v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      double v12 = [v11 lastPathComponent];
      double v13 = [NSString stringWithUTF8String:"-[PLBBAgent isChangedAndSetAirplaneMode]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:9835];

      uint64_t v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v9;
        _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  char v15 = [airplaneModeCurrent isEqualToString:v7];
  if ((v15 & 1) == 0) {
    objc_storeStrong((id *)&airplaneModeCurrent, v6);
  }

  return v15 ^ 1;
}

uint64_t __40__PLBBAgent_isChangedAndSetAirplaneMode__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F19 = result;
  return result;
}

- (void)telephonyActivityNotificationCB_Agent:(id)a3 withName:(__CFString *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4)
  {
    CFRetain(a4);
  }
  else if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__PLBBAgent_telephonyActivityNotificationCB_Agent_withName___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v7;
    if (qword_1EBD5B510 != -1) {
      dispatch_once(&qword_1EBD5B510, block);
    }
    if (byte_1EBD58F1A)
    {
      uint64_t v8 = [NSString stringWithFormat:@"Bad name in Tel Act CB"];
      uint64_t v9 = (void *)MEMORY[0x1E4F929B8];
      BOOL v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      int v11 = [v10 lastPathComponent];
      double v12 = [NSString stringWithUTF8String:"-[PLBBAgent telephonyActivityNotificationCB_Agent:withName:]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:9851];

      double v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v14 = [(PLOperator *)self workQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60__PLBBAgent_telephonyActivityNotificationCB_Agent_withName___block_invoke_4871;
  void v16[3] = &unk_1E692CE00;
  id v17 = v6;
  uint64_t v18 = a4;
  v16[4] = self;
  id v15 = v6;
  dispatch_async(v14, v16);
}

uint64_t __60__PLBBAgent_telephonyActivityNotificationCB_Agent_withName___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F1A = result;
  return result;
}

void __60__PLBBAgent_telephonyActivityNotificationCB_Agent_withName___block_invoke_4871(uint64_t a1)
{
  if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F240A0]))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v3 = [*(id *)(a1 + 40) objectForKey:*MEMORY[0x1E4F24098]];
    [v2 setOpName:v3];
LABEL_3:

    goto LABEL_14;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F23DA8]))
  {
    id v4 = [*(id *)(a1 + 40) objectForKey:*MEMORY[0x1E4F23DA0]];
    int v5 = [*(id *)(a1 + 32) lastReportedSignal];
    int v6 = [v5 integerValue];
    int v7 = v6 - [v4 integerValue];
    if (v7 >= 0) {
      unsigned int v8 = v7;
    }
    else {
      unsigned int v8 = -v7;
    }

    if (v8 >= 6) {
      [*(id *)(a1 + 32) setChanged:1];
    }
    goto LABEL_10;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F23D80]))
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __60__PLBBAgent_telephonyActivityNotificationCB_Agent_withName___block_invoke_2;
    v26[3] = &unk_1E692EF68;
    uint64_t v9 = *(void **)(a1 + 40);
    v26[4] = *(void *)(a1 + 32);
    [v9 enumerateKeysAndObjectsUsingBlock:v26];
LABEL_13:
    [*(id *)(a1 + 32) setChanged:1];
    goto LABEL_14;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F241E0]))
  {
    double v12 = *(void **)(a1 + 32);
    id v3 = [*(id *)(a1 + 40) objectForKey:*MEMORY[0x1E4F241D8]];
    [v12 setSimStatus:v3];
    goto LABEL_3;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F23CE0])) {
    goto LABEL_13;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F23B38]))
  {
    [*(id *)(a1 + 32) setChanged:1];
    [*(id *)(a1 + 32) logEventNoneBBReportBy:5 withAction:3];
    goto LABEL_14;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F23B28])) {
    goto LABEL_13;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F23E70]))
  {
    id v4 = *(id *)(a1 + 40);
    double v13 = [v4 objectForKey:*MEMORY[0x1E4F23E78]];
    int v14 = [v13 intValue];
    id v15 = @"Unknown SMS/MMS";
    if (v14 == 2) {
      id v15 = @"MMS";
    }
    if (v14 == 1) {
      double v16 = @"SMS";
    }
    else {
      double v16 = v15;
    }
    id v17 = *(void **)(a1 + 32);
    uint64_t v18 = @"Sent";
LABEL_42:
    [v17 logMessage:v16 andState:v18];

LABEL_10:
    goto LABEL_14;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F23E68]))
  {
    id v4 = *(id *)(a1 + 40);
    double v13 = [v4 objectForKey:*MEMORY[0x1E4F23E78]];
    int v19 = [v13 intValue];
    double v20 = @"Unknown SMS/MMS";
    if (v19 == 2) {
      double v20 = @"MMS";
    }
    if (v19 == 1) {
      double v16 = @"SMS";
    }
    else {
      double v16 = v20;
    }
    id v17 = *(void **)(a1 + 32);
    uint64_t v18 = @"Received";
    goto LABEL_42;
  }
LABEL_14:
  if ([*(id *)(a1 + 32) changed])
  {
    [*(id *)(a1 + 32) logTelephonyActivity];
    [*(id *)(a1 + 32) setChanged:0];
    uint64_t v10 = objc_opt_class();
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    uint64_t v23 = __60__PLBBAgent_telephonyActivityNotificationCB_Agent_withName___block_invoke_3;
    uint64_t v24 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v25 = v10;
    if (qword_1EBD5B518 != -1) {
      dispatch_once(&qword_1EBD5B518, &v21);
    }
    if (byte_1EBD58F1B) {
      objc_msgSend(*(id *)(a1 + 32), "logEventNoneBBReportBy:withAction:", 6, 4, v21, v22, v23, v24, v25);
    }
  }
  int v11 = *(const void **)(a1 + 48);
  if (v11) {
    CFRelease(v11);
  }
}

void __60__PLBBAgent_telephonyActivityNotificationCB_Agent_withName___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v6 isEqualToString:*MEMORY[0x1E4F23FA8]])
  {
    [*(id *)(a1 + 32) setInDCH:v5];
  }
  else if ([v6 isEqualToString:*MEMORY[0x1E4F23FB0]])
  {
    [*(id *)(a1 + 32) setInUTBF:v5];
  }
}

uint64_t __60__PLBBAgent_telephonyActivityNotificationCB_Agent_withName___block_invoke_3(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F1B = result;
  return result;
}

- (void)logTelephonyActivity
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v37 = 0;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__PLBBAgent_logTelephonyActivity__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v3;
    if (qword_1EBD5B520 != -1) {
      dispatch_once(&qword_1EBD5B520, block);
    }
    if (byte_1EBD58F1C)
    {
      id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBAgent logTelephonyActivity]");
      id v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      int v7 = [v6 lastPathComponent];
      unsigned int v8 = [NSString stringWithUTF8String:"-[PLBBAgent logTelephonyActivity]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:9954];

      uint64_t v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v41 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = [(PLBBAgent *)self connection];
  id v34 = 0;
  id v35 = 0;
  id v33 = 0;
  [v10 getRAT:&v35 preferredRAT:&v34 campedRAT:&v33];
  id v11 = v35;
  id v12 = v34;
  id v13 = v33;

  int v14 = [(PLBBAgent *)self connection];
  [v14 getSignalStrength:&v39 asPercentage:&v38 withBars:&v37];

  id v15 = [(PLBBAgent *)self telActMsgHelper];
  [v15 setActiveBand:0];
  double v16 = [(PLBBAgent *)self humanReadableDataActiveString];
  [v15 setDataStatus:v16];

  [v15 setCurrentRat:v11];
  [v15 setPreferredRat:v12];
  [v15 setCampedRat:v13];
  id v17 = [(PLBBAgent *)self connection];
  uint64_t v18 = [v17 currentCallStatus];
  [v15 setCallStatus:v18];

  [v15 setAirplaneMode:airplaneModeCurrent];
  int v19 = [(PLBBAgent *)self humanReadableSimStatusString];
  [v15 setSimStatus:v19];

  double v20 = [NSNumber numberWithInteger:v39];
  [v15 setSignalStrength:v20];

  uint64_t v21 = [NSNumber numberWithInteger:v37];
  [v15 setSignalBars:v21];

  uint64_t v22 = [NSNumber numberWithLong:v39];
  [(PLBBAgent *)self setLastReportedSignal:v22];

  if (([MEMORY[0x1E4F929C0] fullMode] & 1) == 0)
  {
    uint64_t v23 = [(PLBBAgent *)self operatorName];

    if (v23)
    {
      if (![(PLBBAgent *)self changed]) {
        [(PLBBAgent *)self logOperatorName];
      }
    }
    else
    {
      uint64_t v24 = (void *)CTRegistrationCopyOperatorName();
      [(PLBBAgent *)self setOperatorName:v24];
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v25 = objc_opt_class();
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    void v32[2] = __33__PLBBAgent_logTelephonyActivity__block_invoke_4889;
    v32[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v32[4] = v25;
    if (qword_1EBD5B528 != -1) {
      dispatch_once(&qword_1EBD5B528, v32);
    }
    if (byte_1EBD58F1D)
    {
      uint64_t v26 = [NSString stringWithFormat:@"Decoded Telephony activity line"];
      double v27 = (void *)MEMORY[0x1E4F929B8];
      double v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      double v29 = [v28 lastPathComponent];
      double v30 = [NSString stringWithUTF8String:"-[PLBBAgent logTelephonyActivity]"];
      [v27 logMessage:v26 fromFile:v29 fromFunction:v30 fromLineNumber:10002];

      id v31 = PLLogCommon();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v41 = v26;
        _os_log_debug_impl(&dword_1D2690000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [v15 logPointIntervalTelephonyActivity];
}

uint64_t __33__PLBBAgent_logTelephonyActivity__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F1C = result;
  return result;
}

uint64_t __33__PLBBAgent_logTelephonyActivity__block_invoke_4889(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F1D = result;
  return result;
}

- (void)logMessage:(id)a3 andState:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__PLBBAgent_logMessage_andState___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v7;
    if (qword_1EBD5B530 != -1) {
      dispatch_once(&qword_1EBD5B530, block);
    }
    if (byte_1EBD58F1E)
    {
      unsigned int v8 = [NSString stringWithFormat:@"Messages: type=%@ state=%@;", v5, v6];;
      uint64_t v9 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      id v11 = [v10 lastPathComponent];
      id v12 = [NSString stringWithUTF8String:"-[PLBBAgent logMessage:andState:]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:10008];

      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v16 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __33__PLBBAgent_logMessage_andState___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F1E = result;
  return result;
}

- (void)setOpName:(id)a3
{
  id v6 = a3;
  if ((-[NSString isEqual:](self->_operatorName, "isEqual:") & 1) == 0)
  {
    id v4 = (NSString *)[v6 copy];
    operatorName = self->_operatorName;
    self->_operatorName = v4;

    [(PLBBAgent *)self logOperatorName];
  }
}

- (void)logOperatorName
{
  uint64_t v3 = [(PLBBAgent *)self operatorName];
  if (v3)
  {
    id v5 = v3;
    id v4 = [(PLBBAgent *)self operatorName];
    [v4 isEqualToString:&stru_1F294E108];

    uint64_t v3 = v5;
  }
}

- (id)humanReadableDataActiveString
{
  uint64_t v3 = [(PLBBAgent *)self inDCH];
  if (v3)
  {
  }
  else
  {
    id v4 = [(PLBBAgent *)self inUTBF];

    if (!v4) {
      return 0;
    }
  }
  id v5 = [(PLBBAgent *)self inDCH];
  if ([v5 BOOLValue])
  {
    id v6 = [(PLBBAgent *)self inUTBF];
    char v7 = [v6 BOOLValue];

    if (v7) {
      return @"DCH/UTBF";
    }
  }
  else
  {
  }
  uint64_t v9 = [(PLBBAgent *)self inDCH];
  char v10 = [v9 BOOLValue];

  if (v10) {
    return @"Active";
  }
  id v11 = [(PLBBAgent *)self inUTBF];
  int v12 = [v11 BOOLValue];

  if (v12) {
    return @"UTBF";
  }
  else {
    return @"inactive";
  }
}

- (id)humanReadableSimStatusString
{
  uint64_t v3 = [(PLBBAgent *)self simStatus];
  if (v3
    && (id v4 = (void *)v3,
        [(PLBBAgent *)self simStatus],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isEqualToString:&stru_1F294E108],
        v5,
        v4,
        (v6 & 1) == 0))
  {
    unsigned int v8 = [(PLBBAgent *)self simStatus];
    char v7 = objc_msgSend(v8, "substringFromIndex:", objc_msgSend((id)*MEMORY[0x1E4F241D8], "length"));
  }
  else
  {
    char v7 = 0;
  }
  return v7;
}

- (void)processTimeUpdateInfoDict:(id)a3
{
  id v4 = a3;
  [MEMORY[0x1E4F92A88] postNotificationName:@"BasebandTimeChangeNotification" object:self userInfo:v4];
  uint64_t v5 = objc_opt_class();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PLBBAgent_processTimeUpdateInfoDict___block_invoke;
  block[3] = &unk_1E692A830;
  char v10 = @"Critical";
  uint64_t v11 = v5;
  if (qword_1EBD5B538 != -1) {
    dispatch_once(&qword_1EBD5B538, block);
  }
  int v6 = byte_1EBD58F1F;

  if (v6)
  {
    char v7 = objc_opt_new();
    [v7 setAgent:self];
    [v7 setMsgProcErr:0];
    unsigned int v8 = [NSString stringWithFormat:@"TimeUpdate Dict: %@", v4];
    [v7 setPayload:v8];

    [v7 logEventNoneBBMsgAll];
  }
}

uint64_t __39__PLBBAgent_processTimeUpdateInfoDict___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  byte_1EBD58F1F = result;
  return result;
}

- (void)refreshRequestHandler
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__PLBBAgent_refreshRequestHandler__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v2;
    if (qword_1EBD5B540 != -1) {
      dispatch_once(&qword_1EBD5B540, block);
    }
    if (byte_1EBD58F20)
    {
      uint64_t v3 = [NSString stringWithFormat:@"refreshRequestHandler not implemented"];
      id v4 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      int v6 = [v5 lastPathComponent];
      char v7 = [NSString stringWithUTF8String:"-[PLBBAgent refreshRequestHandler]"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:10104];

      unsigned int v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v11 = v3;
        _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __34__PLBBAgent_refreshRequestHandler__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F20 = result;
  return result;
}

- (void)logBasebandConfig
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__PLBBAgent_logBasebandConfig__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v3;
    if (qword_1EBD5B548 != -1) {
      dispatch_once(&qword_1EBD5B548, block);
    }
    if (byte_1EBD58F21)
    {
      id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBAgent logBasebandConfig]");
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      int v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m"];
      char v7 = [v6 lastPathComponent];
      unsigned int v8 = [NSString stringWithUTF8String:"-[PLBBAgent logBasebandConfig]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:10110];

      uint64_t v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  char v10 = objc_alloc_init(PLBBEurekaEventMsg);
  [(PLBasebandMessage *)v10 setAgent:self];
  [(PLBBEurekaEventMsg *)v10 setEventCode:0];
  [(PLBBEurekaEventMsg *)v10 setError:&stru_1F294E108];
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [(PLBBEurekaEventMsg *)v10 setHeaderWithSeqNum:&unk_1F29E6718 andDate:v11 andTimeCal:0.0];

  uint64_t v12 = 0;
  uint64_t v21 = *MEMORY[0x1E4F92D40];
  do
  {
    id v13 = logBasebandConfig_basebandConfigPropertyKeys[v12];
    int v14 = [(PLBBAgent *)self connection];
    id v15 = [v14 getProperty:@"enabled" forTrace:v13];

    if (!v15) {
      id v15 = @"null";
    }
    double v16 = [(PLBBAgent *)self connection];
    uint64_t v17 = [v16 getProperty:@"history" forTrace:v13];

    if (!v17) {
      uint64_t v17 = @"null";
    }
    uint64_t v18 = [NSString stringWithFormat:@"%@(%@)", v15, v17];
    [(PLBBEurekaEventMsg *)v10 addPairWithKey:v13 andWithVal:v18];

    if (([MEMORY[0x1E4F92A38] isBasebandProto] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isBasebandMav] & 1) != 0
      || [MEMORY[0x1E4F92A38] isBasebandIce])
    {
      int v19 = +[PLOperator entryKeyForType:v21 andName:@"BBMsgLite"];
      double v20 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v19];
      [v20 setObject:v13 forKeyedSubscript:@"unit"];
      [v20 setObject:v15 forKeyedSubscript:@"value_enabled"];
      [v20 setObject:v17 forKeyedSubscript:@"value_history"];
      if (([MEMORY[0x1E4F92A38] isBasebandIce] & 1) != 0
        || [MEMORY[0x1E4F92A38] isBasebandMav])
      {
        [(PLBBAgent *)self logEntry:v20];
      }
    }
    ++v12;
  }
  while (v12 != 11);
  if (([MEMORY[0x1E4F92A38] isBasebandMav] & 1) != 0
    || [MEMORY[0x1E4F92A38] isBasebandIce])
  {
    [(PLBBEurekaEventMsg *)v10 logEventForwardBBEurekaEventMsgLite];
  }
}

uint64_t __30__PLBBAgent_logBasebandConfig__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58F21 = result;
  return result;
}

- (PLEntryNotificationOperatorComposition)batteryLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBatteryLevelChanged:(id)a3
{
}

- (PLTelephonyConnection)connection
{
  return self->_connection;
}

- (PLABMClient)abmClient
{
  return (PLABMClient *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAbmClient:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)sleepEntryNotifications
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (PLEntryNotificationOperatorComposition)wakeEntryNotifications
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (PLCFNotificationOperatorComposition)cfNotifyBBReport30s
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCfNotifyBBReport30s:(id)a3
{
}

- (PLCFNotificationOperatorComposition)cfNotifyBBReport
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCfNotifyBBReport:(id)a3
{
}

- (PLNSNotificationOperatorComposition)thermalMonitorListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setThermalMonitorListener:(id)a3
{
}

- (NSDate)lastReportRequestDate
{
  return (NSDate *)objc_getProperty(self, a2, 152, 1);
}

- (void)setLastReportRequestDate:(id)a3
{
}

- (BOOL)changed
{
  return self->_changed;
}

- (void)setChanged:(BOOL)a3
{
  self->_changed = a3;
}

- (BOOL)agentInited
{
  return self->_agentInited;
}

- (void)setAgentInited:(BOOL)a3
{
  self->_agentInited = a3;
}

- (NSMutableDictionary)currentCallList
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCurrentCallList:(id)a3
{
}

- (BOOL)lteCurrentState
{
  return self->_lteCurrentState;
}

- (void)setLteCurrentState:(BOOL)a3
{
  self->_lteCurrentState = a3;
}

- (NSNumber)lastReportedSignal
{
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)setLastReportedSignal:(id)a3
{
}

- (NSNumber)inDCH
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setInDCH:(id)a3
{
}

- (NSNumber)inUTBF
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setInUTBF:(id)a3
{
}

- (NSString)simStatus
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setSimStatus:(id)a3
{
}

- (NSString)operatorName
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setOperatorName:(id)a3
{
}

- (void)setTelRegMsgHelper:(id)a3
{
}

- (PLBBTelephonyActivityMsg)telActMsgHelper
{
  return (PLBBTelephonyActivityMsg *)objc_getProperty(self, a2, 216, 1);
}

- (void)setTelActMsgHelper:(id)a3
{
}

- (PLNSNotificationOperatorComposition)bbICEModelLTEMetricsNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 224, 1);
}

- (void)setBbICEModelLTEMetricsNotification:(id)a3
{
}

- (NSDate)lastBBActivityTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 232, 1);
}

- (PLEntryNotificationOperatorComposition)canSleepNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 240, 1);
}

- (void)setCanSleepNotification:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)didNotSleepNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 248, 1);
}

- (void)setDidNotSleepNotification:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)telephonyActivityNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 256, 1);
}

- (void)setTelephonyActivityNotification:(id)a3
{
}

- (PLTimer)channelReconnectTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 264, 1);
}

- (void)setChannelReconnectTimer:(id)a3
{
}

- (PLTimer)cacheCommitTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 272, 1);
}

- (void)setCacheCommitTimer:(id)a3
{
}

- (double)lastBBProtoPower
{
  return self->_lastBBProtoPower;
}

- (void)setLastBBProtoPower:(double)a3
{
  self->_lastBBProtoPower = a3;
}

- (double)lastOOSPower
{
  return self->_lastOOSPower;
}

- (void)setLastOOSPower:(double)a3
{
  self->_lastOOSPower = a3;
}

- (NSDate)lastModeledOOSTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 296, 1);
}

- (void)setLastModeledOOSTimestamp:(id)a3
{
}

- (double)lastGWPower
{
  return self->_lastGWPower;
}

- (void)setLastGWPower:(double)a3
{
  self->_lastGWPower = a3;
}

- (NSDate)lastOOSTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 312, 1);
}

- (void)setLastOOSTimestamp:(id)a3
{
}

- (double)oosGWPower
{
  return self->_oosGWPower;
}

- (void)setOosGWPower:(double)a3
{
  self->_double oosGWPower = a3;
}

- (double)oosCDMAPower
{
  return self->_oosCDMAPower;
}

- (void)setOosCDMAPower:(double)a3
{
  self->_oosCDMAPower = a3;
}

- (double)oosHDRPower
{
  return self->_oosHDRPower;
}

- (void)setOosHDRPower:(double)a3
{
  self->_double oosHDRPower = a3;
}

- (double)totalOosGWScanEnergy
{
  return self->_totalOosGWScanEnergy;
}

- (void)setTotalOosGWScanEnergy:(double)a3
{
  self->_totalOosGWScanEnergy = a3;
}

- (double)totalOosCDMAScanEnergy
{
  return self->_totalOosCDMAScanEnergy;
}

- (void)setTotalOosCDMAScanEnergy:(double)a3
{
  self->_totalOosCDMAScanEnergy = a3;
}

- (double)totalOosHDRScanEnergy
{
  return self->_totalOosHDRScanEnergy;
}

- (void)setTotalOosHDRScanEnergy:(double)a3
{
  self->_double totalOosHDRScanEnergy = a3;
}

- (BOOL)isBBOOS
{
  return self->_isBBOOS;
}

- (void)setIsBBOOS:(BOOL)a3
{
  self->_isBBOOS = a3;
}

- (BOOL)isFirstTimeAccountingOOS
{
  return self->_isFirstTimeAccountingOOS;
}

- (void)setIsFirstTimeAccountingOOS:(BOOL)a3
{
  self->_isFirstTimeAccountingOOS = a3;
}

- (BOOL)isBBDataStandard
{
  return self->_isBBDataStandard;
}

- (void)setIsBBDataStandard:(BOOL)a3
{
  self->_isBBDataStandard = a3;
}

- (OS_dispatch_queue)telephonyClientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 368, 1);
}

- (void)setTelephonyClientQueue:(id)a3
{
}

- (CoreTelephonyClient)telephonyClient
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 376, 1);
}

- (void)setTelephonyClient:(id)a3
{
}

- (NSMutableArray)dsdsRegMsgs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 384, 1);
}

- (void)setDsdsRegMsgs:(id)a3
{
}

- (void)setDsdsActivityMsgs:(id)a3
{
}

- (TUCallCenter)callCenter
{
  return (TUCallCenter *)objc_getProperty(self, a2, 400, 1);
}

- (void)setCallCenter:(id)a3
{
}

- (PLXPCResponderOperatorComposition)BBLogsSysdiagnoseResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 408, 1);
}

- (void)setBBLogsSysdiagnoseResponder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_BBLogsSysdiagnoseResponder, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_dsdsActivityMsgs, 0);
  objc_storeStrong((id *)&self->_dsdsRegMsgs, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_telephonyClientQueue, 0);
  objc_storeStrong((id *)&self->_lastOOSTimestamp, 0);
  objc_storeStrong((id *)&self->_lastModeledOOSTimestamp, 0);
  objc_storeStrong((id *)&self->_cacheCommitTimer, 0);
  objc_storeStrong((id *)&self->_channelReconnectTimer, 0);
  objc_storeStrong((id *)&self->_telephonyActivityNotification, 0);
  objc_storeStrong((id *)&self->_didNotSleepNotification, 0);
  objc_storeStrong((id *)&self->_canSleepNotification, 0);
  objc_storeStrong((id *)&self->_lastBBActivityTimestamp, 0);
  objc_storeStrong((id *)&self->_bbICEModelLTEMetricsNotification, 0);
  objc_storeStrong((id *)&self->_telActMsgHelper, 0);
  objc_storeStrong((id *)&self->_telRegMsgHelper, 0);
  objc_storeStrong((id *)&self->_operatorName, 0);
  objc_storeStrong((id *)&self->_simStatus, 0);
  objc_storeStrong((id *)&self->_inUTBF, 0);
  objc_storeStrong((id *)&self->_inDCH, 0);
  objc_storeStrong((id *)&self->_lastReportedSignal, 0);
  objc_storeStrong((id *)&self->_currentCallList, 0);
  objc_storeStrong((id *)&self->_lastReportRequestDate, 0);
  objc_storeStrong((id *)&self->_thermalMonitorListener, 0);
  objc_storeStrong((id *)&self->_cfNotifyBBReport, 0);
  objc_storeStrong((id *)&self->_cfNotifyBBReport30s, 0);
  objc_storeStrong((id *)&self->_wakeEntryNotifications, 0);
  objc_storeStrong((id *)&self->_sleepEntryNotifications, 0);
  objc_storeStrong((id *)&self->_abmClient, 0);
  objc_storeStrong((id *)&self->_batteryLevelChanged, 0);
  objc_storeStrong((id *)&self->cachedChannel, 0);
  objc_storeStrong((id *)&self->streamingChannel, 0);
}

@end