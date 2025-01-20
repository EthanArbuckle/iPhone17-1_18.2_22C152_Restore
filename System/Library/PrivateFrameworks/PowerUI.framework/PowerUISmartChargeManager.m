@interface PowerUISmartChargeManager
+ (id)manager;
- (ACCConnectionInfo)connectionInfoProvider;
- (BOOL)OBCReengagementEvaluated;
- (BOOL)_hasLegitimateUsage;
- (BOOL)becameOBCEligible;
- (BOOL)deviceHasEnoughPluggedInTime;
- (BOOL)deviceHasOverriddenLegitimateUsageDetection;
- (BOOL)deviceWasRecentlyConnectedToCharger;
- (BOOL)enabled;
- (BOOL)encounteredTLCDuringTopOff;
- (BOOL)isCECSupported;
- (BOOL)isChargePackConnected;
- (BOOL)isDEoCSupported;
- (BOOL)isDesktopDevice;
- (BOOL)isDeviceWithLegitimateUsage;
- (BOOL)isExternalConnected;
- (BOOL)isMCLSupported;
- (BOOL)isMCMSupported;
- (BOOL)lastChargerWasWireless;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)manualChargeLimitWasEverEnabled;
- (BOOL)mcmForbidsCharging;
- (BOOL)overrideAllSignals;
- (BOOL)reachedTargetSoC;
- (BOOL)remoteOBCEngaged;
- (BOOL)shouldContinueAfterMCMCheckWithBatteryLevel:(int)a3 withIsCharging:(BOOL)a4 withIsExternalConnected:(BOOL)a5 withIsPluggedIn:(BOOL)a6;
- (BOOL)shouldDisableChargingOverrideModel:(unint64_t)a3;
- (BOOL)shouldOBCRoutineReengage;
- (BOOL)signalsIgnored;
- (BOOL)temporarilyDisabled;
- (BOOL)watchIsInternalAndCarrySwitchDisabled;
- (NSArray)monitors;
- (NSDate)_fullChargeDeadline;
- (NSDate)disabledUntilDate;
- (NSDate)engagementTimeOverride;
- (NSDate)fullChargeDeadlineOverride;
- (NSDate)lastComputedSignalDeadline;
- (NSDate)lastDesktopModeChangeDate;
- (NSDate)lastInterruptedTime;
- (NSDate)mclDisabledUntilDate;
- (NSDate)potentialUnplugDate;
- (NSDate)previousDecisionMakerDate;
- (NSDate)repeatEngagementOverrideEndDate;
- (NSDate)uiDeadline;
- (NSDictionary)powerLogStatus;
- (NSDictionary)previousPowerLogStatus;
- (NSDictionary)signalDeadline;
- (NSDistributedNotificationCenter)notificationCenter;
- (NSLock)deocCurrentStatusLock;
- (NSNumber)engagementsLastMonthBucket;
- (NSNumber)lastNonEngagementSignalID;
- (NSNumber)lastReportedNumberOfPluginEvents;
- (NSNumber)medianPluginLength;
- (NSString)currentChargePackInductiveConnectionUUID;
- (NSString)currentChargePackNFCConnectionUUID;
- (NSString)defaultsDomain;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)xpcCallbackQueue;
- (OS_dispatch_source)mcmFidgetMitigationTimer;
- (OS_dispatch_source)timer;
- (OS_os_log)log;
- (OS_os_log)mcmLog;
- (OS_xpc_object)bdcConnection;
- (PowerUIAnalyticsManager)analyticsManager;
- (PowerUIBDCDataManager)bdcDataManager;
- (PowerUIBatteryMitigationManager)batteryMitigationManager;
- (PowerUIChargingController)chargingController;
- (PowerUIIntelligenceManager)intelligenceManager;
- (PowerUIMLTwoStageModelPredictor)modelTwoStagePredictor;
- (PowerUISmartChargeManager)initWithDefaultsDomain:(id)a3 contextStore:(id)a4 beforeHandlingBatteryChangeCallback:(id)a5 afterHandlingBatteryChangeCallback:(id)a6;
- (PowerUITrialManager)trialManager;
- (_CDContextualKeyPath)checkpointKP;
- (_CDLocalContext)context;
- (__CFString)chargeLimitToken;
- (double)debounceOverride;
- (double)durationToFullChargeFromBatteryLevel:(unint64_t)a3;
- (double)durationToFullChargeFromBatteryLevel:(unint64_t)a3 includeTLCDelay:(BOOL)a4;
- (double)empiricalTimeToFullChargeDurationMinutes;
- (double)idleDurationWithEngagedCheckpoints:(id)a3 withTopOffStartCheckpoints:(id)a4 withDisabledCheckpoints:(id)a5 withTopOffStart:(id)a6 withIdleStart:(id)a7 withTemporarilyDisabledStart:(id)a8 withPluginEnd:(id)a9;
- (double)periodicCheckDuration;
- (double)totalTemporarilyDisabledHours:(id)a3 withEngagements:(id)a4 withPluginEnd:(id)a5;
- (double)totalTopOffDurationWithTopOffStartCheckpoints:(id)a3 withFullyChargedCheckpoints:(id)a4 withTopOffStart:(id)a5 withFullyChargedDate:(id)a6 withPluginEnd:(id)a7;
- (id)adjustedFullChargeDeadlineWithSignals:(id)a3 withDesktopMode:(BOOL)a4 withFullChargeDeadline:(id)a5 withResult:(id)a6;
- (id)afterBatteryCallback;
- (id)beforeBatteryCallback;
- (id)chargePrediction:(unint64_t)a3 fullyCharged:(BOOL)a4 previousCheckpoint:(unint64_t)a5 predictor:(unint64_t)a6;
- (id)checkpointNameFromCheckpoint:(unint64_t)a3;
- (id)cloakingMetrics:(id)a3 withIdleCheckpoints:(id)a4 withIdleStart:(id)a5 withTopOffStart:(id)a6 withPluginEnd:(id)a7;
- (id)computeSignalDeadline;
- (id)constructAnalyticsStatus;
- (id)constructAnalyticsStatusFromEvents:(id)a3;
- (id)constructDailyStats:(id)a3;
- (id)dailyStatsFromLastReported:(id)a3;
- (id)defaultDateToDisableUntilGivenDate:(id)a3;
- (id)desktopModeOverride;
- (id)eligibleEngagementIntervalFromTimelineEvents:(id)a3;
- (id)fullChargeDeadline;
- (id)genericOBCFailureNotification:(id)a3;
- (id)getCurrentSystemChargeLimit;
- (id)lastAcquiredLocation;
- (id)mcmActiveNotificationRequest;
- (id)readAndRemoveRecentEngagements;
- (id)readDateForPreferenceKey:(id)a3;
- (id)readNumberForPreferenceKey:(id)a3;
- (id)readStringForPreferenceKey:(id)a3;
- (id)recentEngagements;
- (id)setFullChargeDeadline:(id)a3;
- (id)shouldDisableChargingAsOfDate:(id)a3 atBatteryLevel:(unint64_t)a4 overrideAllSignals:(BOOL)a5 withPredictor:(id)a6 bypassSaved:(BOOL)a7;
- (id)shouldDisableChargingAtBatteryLevel:(unint64_t)a3 withPredictor:(id)a4;
- (id)smartTopOffFailureNotificationAtBatteryLevel:(int)a3 withDate:(id)a4;
- (id)stringFromDecisionMaker:(int64_t)a3 decisionDate:(id)a4;
- (id)stringFromInterval:(id)a3;
- (id)stringFromState:(unint64_t)a3;
- (id)timeStringFromDate:(id)a3;
- (id)ttrURLforBatteryLevel:(int)a3 withDate:(id)a4;
- (id)ttrURLforGenericFailure:(id)a3;
- (id)uiDeadlineFromFullChargeDeadline:(id)a3 atDate:(id)a4;
- (id)updateAnalyticsWithPluginMetrics:(id)a3 withBatteryLevel:(int)a4;
- (int)lastBatteryLevel;
- (int)lastFullyCharged;
- (int)lastPluginStatus;
- (int)powerlogToken;
- (int64_t)deadlineSignalID;
- (int64_t)previousDecisionMakerID;
- (unint64_t)checkpoint;
- (unint64_t)currentChargeLimit;
- (unint64_t)currentDecisionMaker;
- (unint64_t)currentModeOfOperation;
- (unint64_t)currentRecommendedChargeLimit;
- (unint64_t)currentState;
- (unint64_t)deocFeatureState;
- (unint64_t)manualChargeLimitStatus;
- (unint64_t)mcmCurrentState;
- (unint64_t)numberOfTimesMCMNotificationWasDisplayed;
- (unint64_t)predictorType;
- (unint64_t)projectedBatteryLevelForDuration:(unint64_t)a3 withInitialBatteryLevel:(unint64_t)a4;
- (unint64_t)recommendedLimit;
- (unsigned)getUISoCChargeLimit;
- (unsigned)mclTargetSoC;
- (unsigned)service;
- (void)_submitEngagementEventWithBatteryLevel:(id)a3 eventType:(int)a4;
- (void)accessoryConnectionAttached:(id)a3 type:(int)a4;
- (void)accessoryConnectionDetached:(id)a3;
- (void)accessoryNFCConnectionCallback:(id)a3;
- (void)addEngagementFromDate:(id)a3 withDuration:(double)a4;
- (void)addPowerLogEventForCheckpoint:(unint64_t)a3 decisionSignalID:(id)a4 decisionDate:(id)a5;
- (void)cacheCurrentDEoCBehaviorForced:(BOOL)a3;
- (void)cecFullChargeDeadlineWithHandler:(id)a3;
- (void)checkWhetherMCLTempDisablementCanBeClearedOnPlugin:(BOOL)a3;
- (void)cleanupOverrides;
- (void)clearAllNotificationState;
- (void)clearManualChargeLimit;
- (void)clearPluginTimeline;
- (void)client:(id)a3 getMCLLimitWithHandler:(id)a4;
- (void)client:(id)a3 setCECState:(unint64_t)a4 withHandler:(id)a5;
- (void)client:(id)a3 setDEoCState:(unint64_t)a4 withHandler:(id)a5;
- (void)client:(id)a3 setMCLLimit:(unsigned __int8)a4 withHandler:(id)a5;
- (void)client:(id)a3 setMCMState:(unint64_t)a4 withHandler:(id)a5;
- (void)client:(id)a3 setState:(unint64_t)a4 withHandler:(id)a5;
- (void)currentChargeLimitWithHandler:(id)a3;
- (void)currentLeewayWithHandler:(id)a3;
- (void)currentRecommendedChargeLimitWithHandler:(id)a3;
- (void)disableCharging;
- (void)disableDEoC;
- (void)disableMCL;
- (void)dispatchAlarmAfter:(int64_t)a3 withName:(id)a4;
- (void)enableCharging;
- (void)enableDEoC;
- (void)enableMCL;
- (void)engageFrom:(id)a3 until:(id)a4 repeatUntil:(id)a5 overrideAllSignals:(BOOL)a6 withHandler:(id)a7;
- (void)engageManualChargeLimit;
- (void)enterDevelopmentMode;
- (void)evaluateChargeLimitRecommendationForced:(BOOL)a3;
- (void)evaluateIfDEoCDevice;
- (void)evaluateIfDesktopDeviceForced:(BOOL)a3;
- (void)forceDEoCReevaluation;
- (void)fullChargeDeadlineWithHandler:(id)a3;
- (void)getDEoCPredictionsWithHandler:(id)a3;
- (void)handleAlarmEvent:(id)a3;
- (void)handleCallback;
- (void)handleCallback:(BOOL)a3;
- (void)handleDebounceTimerEvent;
- (void)handleInternalCarryPromptEvent;
- (void)handleNewBatteryLevel:(int)a3 whileExternalConnected:(BOOL)a4 fullyCharged:(BOOL)a5;
- (void)handleNewBatteryLevelForMCL:(int)a3 whileExternalConnected:(BOOL)a4;
- (void)handleNewPluginWithBatteryLevel:(int)a3 pluginDate:(id)a4;
- (void)handleNotificationResponse:(id)a3;
- (void)handleTopOffSupervisorEvent;
- (void)handleTopOffSupervisorEventInternal;
- (void)handleUnplugAtDate:(id)a3 withBatteryLevel:(int)a4;
- (void)handleXPCActivityOnBoot;
- (void)incomingBDCRequest:(id)a3;
- (void)isCECCurrentlyEnabledWithHandler:(id)a3;
- (void)isCECSupportedWithHandler:(id)a3;
- (void)isDEoCCurrentlyEnabledWithHandler:(id)a3;
- (void)isDEoCSupportedWithHandler:(id)a3;
- (void)isMCLCurrentlyEnabledWithHandler:(id)a3;
- (void)isMCLSupportedWithHandler:(id)a3;
- (void)isMCMCurrentlyEnabledWithHandler:(id)a3;
- (void)isOBCEngagedOrChargeLimitedWithHandler:(id)a3;
- (void)isOBCSupportedWithHandler:(id)a3;
- (void)isSmartChargingCurrentlyEnabledWithHandler:(id)a3;
- (void)legacy_isOBCEngagedWithHandler:(id)a3;
- (void)listMonitorSignals;
- (void)loadCheckpoint;
- (void)loadDefaults;
- (void)mcmDisableCharging;
- (void)mcmEnableCharging;
- (void)monitor:(id)a3 maySuggestNewFullChargeDeadline:(id)a4;
- (void)monitorMayInvalidateDEoCCache:(id)a3;
- (void)pluginTimelineAddEvent:(id)a3 atDate:(id)a4 withBatteryLevel:(unint64_t)a5;
- (void)postOBCNotificationWithTopOff:(BOOL)a3;
- (void)powerLogStatusWithHandler:(id)a3;
- (void)powerStateChangedCallback;
- (void)promptBDCToQueryCurrentState;
- (void)recallPeriodicCheck;
- (void)recomputeEmpiricalTimeToFullCharge;
- (void)recordAnalytics;
- (void)recordDEoCAnalytics:(id)a3;
- (void)registerBDCXPC;
- (void)reportAggDKeys:(id)a3;
- (void)reportBatteryHealthMetrics;
- (void)reportMCMStatusWithBatteryLevel:(int)a3;
- (void)reportMonthlyData;
- (void)requestPeriodicCheck;
- (void)requestPeriodicCheckWithDuration:(double)a3 withAlarmKey:(const char *)a4;
- (void)resetDevelopmentMode;
- (void)resetDeviceHasLegitimateUsage;
- (void)resetEngagementOverrideWithHandler:(id)a3;
- (void)resetState;
- (void)sendBDCData:(id)a3 withMessage:(id)a4;
- (void)sendChargeLimitRecommendationAnalytics;
- (void)sendDEoCAnalyticsToCA:(id)a3;
- (void)sendHistoricalDEoCEngagementEventToCA:(id)a3;
- (void)sendLegacyData;
- (void)setAfterBatteryCallback:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setBatteryMitigationManager:(id)a3;
- (void)setBdcConnection:(id)a3;
- (void)setBdcDataManager:(id)a3;
- (void)setBecameOBCEligible:(BOOL)a3;
- (void)setBeforeBatteryCallback:(id)a3;
- (void)setChargeLimitToken:(__CFString *)a3;
- (void)setChargingController:(id)a3;
- (void)setCheckpoint:(unint64_t)a3;
- (void)setCheckpoint:(unint64_t)a3 withSelector:(SEL)a4;
- (void)setCheckpoint:(unint64_t)a3 withSelector:(SEL)a4 forceWrite:(BOOL)a5;
- (void)setCheckpointKP:(id)a3;
- (void)setConnectionInfoProvider:(id)a3;
- (void)setContext:(id)a3;
- (void)setCurrentChargePackInductiveConnectionUUID:(id)a3;
- (void)setCurrentChargePackNFCConnectionUUID:(id)a3;
- (void)setCurrentState:(unint64_t)a3;
- (void)setDate:(id)a3 forPreferenceKey:(id)a4;
- (void)setDeadlineSignalID:(int64_t)a3;
- (void)setDebounceOverride:(double)a3;
- (void)setDefaultsDomain:(id)a3;
- (void)setDeocCurrentStatusLock:(id)a3;
- (void)setDeocFeatureState:(unint64_t)a3;
- (void)setDisabledUntilDate:(id)a3;
- (void)setEmpiricalTimeToFullChargeDurationMinutes:(double)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEncounteredTLCDuringTopOff:(BOOL)a3;
- (void)setEngagementTimeOverride:(id)a3;
- (void)setEngagementsLastMonthBucket:(id)a3;
- (void)setFullChargeDeadlineOverride:(id)a3;
- (void)setIntelligenceManager:(id)a3;
- (void)setIsChargePackConnected:(BOOL)a3;
- (void)setIsDesktopDevice:(BOOL)a3;
- (void)setLastBatteryLevel:(int)a3;
- (void)setLastChargerWasWireless:(BOOL)a3;
- (void)setLastComputedSignalDeadline:(id)a3;
- (void)setLastDesktopModeChangeDate:(id)a3;
- (void)setLastFullyCharged:(int)a3;
- (void)setLastInterruptedTime:(id)a3;
- (void)setLastNonEngagementSignalID:(id)a3;
- (void)setLastPluginStatus:(int)a3;
- (void)setLastReportedNumberOfPluginEvents:(id)a3;
- (void)setListener:(id)a3;
- (void)setLog:(id)a3;
- (void)setMCLLimit:(unsigned __int8)a3;
- (void)setManualChargeLimitStatus:(unint64_t)a3;
- (void)setManualChargeLimitWasEverEnabled:(BOOL)a3;
- (void)setMclDisabledUntilDate:(id)a3;
- (void)setMclTargetSoC:(unsigned __int8)a3;
- (void)setMcmCurrentState:(unint64_t)a3;
- (void)setMcmFidgetMitigationTimer:(id)a3;
- (void)setMcmForbidsCharging:(BOOL)a3;
- (void)setMcmLog:(id)a3;
- (void)setMedianPluginLength:(id)a3;
- (void)setModelTwoStagePredictor:(id)a3;
- (void)setMonitors:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setNumber:(id)a3 forPreferenceKey:(id)a4;
- (void)setNumberOfTimesMCMNotificationWasDisplayed:(unint64_t)a3;
- (void)setOBCReengagementEvaluated:(BOOL)a3;
- (void)setOverrideAllSignals:(BOOL)a3;
- (void)setPotentialUnplugDate:(id)a3;
- (void)setPowerLogStatus:(id)a3;
- (void)setPowerlogToken:(int)a3;
- (void)setPredictorType:(unint64_t)a3;
- (void)setPreviousDecisionMakerDate:(id)a3;
- (void)setPreviousDecisionMakerID:(int64_t)a3;
- (void)setPreviousPowerLogStatus:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReachedTargetSoC:(BOOL)a3;
- (void)setRecommendedLimit:(unint64_t)a3;
- (void)setRemoteOBCEngaged:(BOOL)a3;
- (void)setRepeatEngagementOverrideEndDate:(id)a3;
- (void)setService:(unsigned int)a3;
- (void)setSignalDeadline:(id)a3;
- (void)setSignalsIgnored:(BOOL)a3;
- (void)setString:(id)a3 forPreferenceKey:(id)a4;
- (void)setTemporarilyDisabled:(BOOL)a3;
- (void)setTemporarilyDisabled:(BOOL)a3 until:(id)a4;
- (void)setTimer:(id)a3;
- (void)setTrialManager:(id)a3;
- (void)setUiDeadline:(id)a3;
- (void)setXpcCallbackQueue:(id)a3;
- (void)set_fullChargeDeadline:(id)a3;
- (void)set_hasLegitimateUsage:(BOOL)a3;
- (void)shouldMCMBeDisplayedWithHandler:(id)a3;
- (void)simulateCurrentOutputAsOfDate:(id)a3 overrideAllSignals:(BOOL)a4 withHandler:(id)a5;
- (void)smartChargingUIStateWithHandler:(id)a3;
- (void)startAllMonitoring;
- (void)startFidgetMitigationTimer;
- (void)statusWithHandler:(id)a3;
- (void)stopAllMonitoring;
- (void)tempDisableMCL;
- (void)tmpDisableMCLViaClient:(id)a3 withHandler:(id)a4;
- (void)updateChargingTimeSaved;
- (void)updateCurrentDEoCStatusAsGaugingMitigated;
- (void)updateDecisionMakerID:(int64_t)a3 withCheckpoint:(unint64_t)a4;
- (void)updateNotificationSettings:(BOOL)a3;
- (void)updateTimeLineForCurrentBatteryLevel:(int)a3 withIsExternalConnected:(BOOL)a4 forDate:(id)a5;
@end

@implementation PowerUISmartChargeManager

- (void)handleCallback:(BOOL)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  v58 = (void *)os_transaction_create();
  +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:@"Beginning of handleCallback"];
  v5 = [(PowerUISmartChargeManager *)self context];
  v6 = [MEMORY[0x263F351D0] keyPathForBatteryStateDataDictionary];
  v7 = [v5 objectForKeyedSubscript:v6];

  v8 = [(PowerUISmartChargeManager *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_22135E000, v8, OS_LOG_TYPE_DEFAULT, "Handling data dictionary: %@", (uint8_t *)&buf, 0xCu);
  }

  if (v7)
  {
    v9 = [MEMORY[0x263F351D0] batteryPercentageKey];
    v10 = [v7 objectForKeyedSubscript:v9];
    uint64_t v11 = [v10 intValue];

    v12 = [MEMORY[0x263F351D0] batteryExternalConnectedKey];
    v13 = [v7 objectForKeyedSubscript:v12];
    uint64_t v14 = [v13 BOOLValue];

    v15 = [MEMORY[0x263F351D0] batteryFullyChargedKey];
    v16 = [v7 objectForKeyedSubscript:v15];
    unsigned int v57 = [v16 BOOLValue];

    context = self->_context;
    v18 = [MEMORY[0x263F351D0] keyPathForPluginStatus];
    v19 = [(_CDLocalContext *)context objectForKeyedSubscript:v18];
    uint64_t v20 = [v19 BOOLValue];

    [(PowerUISmartChargeManager *)self updateNotificationSettings:v14];
    id v21 = [MEMORY[0x263EFF910] date];
    if ([(PowerUISmartChargeManager *)self lastPluginStatus]) {
      int v22 = 0;
    }
    else {
      int v22 = v14;
    }
    if (v22 == 1)
    {
      [v21 timeIntervalSinceDate:self->_disabledUntilDate];
      if (v23 > 0.0) {
        [(PowerUISmartChargeManager *)self setTemporarilyDisabled:0 until:0];
      }
    }
    v24 = [MEMORY[0x263F351D0] batteryIsChargingKey];
    v25 = [v7 objectForKeyedSubscript:v24];
    uint64_t v26 = [v25 BOOLValue];

    if (v11 != [(PowerUISmartChargeManager *)self lastBatteryLevel]
      || [(PowerUISmartChargeManager *)self lastPluginStatus] < 1)
    {
      goto LABEL_25;
    }
    int v27 = [(PowerUISmartChargeManager *)self lastPluginStatus];
    if (v14)
    {
      if (v27 > 0) {
        int v28 = v26;
      }
      else {
        int v28 = 0;
      }
      if (v28 != 1 || v57 && self->_checkpoint - 5 < 2) {
        goto LABEL_25;
      }
    }
    else if (v27 > 0)
    {
      goto LABEL_25;
    }
    if (!a3)
    {
      v29 = [(PowerUISmartChargeManager *)self log];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        -[PowerUISmartChargeManager handleCallback:].cold.5();
      }
      goto LABEL_24;
    }
LABEL_25:
    if (![(PowerUISmartChargeManager *)self shouldContinueAfterMCMCheckWithBatteryLevel:v11 withIsCharging:v26 withIsExternalConnected:v14 withIsPluggedIn:v20])goto LABEL_97; {
    if (os_log_type_enabled((os_log_t)self->_mcmLog, OS_LOG_TYPE_DEBUG))
    }
      -[PowerUISmartChargeManager handleCallback:].cold.4();
    v30 = [(PowerUISmartChargeManager *)self log];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      [(PowerUISmartChargeManager *)self handleCallback:v30];
    }

    double debounceOverride = 300.0;
    if (+[PowerUISmartChargeUtilities isInternalBuild]
      && self->_debounceOverride >= 0.0)
    {
      double debounceOverride = self->_debounceOverride;
    }
    if ([(PowerUISmartChargeManager *)self lastPluginStatus] == v14) {
      char v32 = 1;
    }
    else {
      char v32 = v14;
    }
    if (v32)
    {
      if (v14 && self->_potentialUnplugDate)
      {
        v33 = [(PowerUISmartChargeManager *)self log];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_22135E000, v33, OS_LOG_TYPE_DEFAULT, "Plugged in within debounce limit, ignore previous unplug", (uint8_t *)&buf, 2u);
        }

        potentialUnplugDate = self->_potentialUnplugDate;
        self->_potentialUnplugDate = 0;

        [(PowerUISmartChargeManager *)self setDate:0 forPreferenceKey:@"potentialUnplugDate"];
        if (!self->_isDesktopDevice && self->_manualChargeLimitStatus != 1 && self->_checkpoint - 2 <= 2)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "OBC still engaged on re-plug, re-post notification", (uint8_t *)&buf, 2u);
          }
          [(PowerUISmartChargeManager *)self postOBCNotificationWithTopOff:0];
        }
      }
      goto LABEL_58;
    }
    if (self->_potentialUnplugDate)
    {
      objc_msgSend(v21, "timeIntervalSinceDate:");
      if (v36 < debounceOverride)
      {
        [v21 timeIntervalSinceDate:self->_potentialUnplugDate];
        double v38 = v37;
        v39 = [(PowerUISmartChargeManager *)self log];
        double v40 = fmax(debounceOverride - v38, 10.0);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 134217984;
          *(double *)((char *)&buf + 4) = v40;
          _os_log_impl(&dword_22135E000, v39, OS_LOG_TYPE_DEFAULT, "Potential disconnect, debounce for %f more seconds", (uint8_t *)&buf, 0xCu);
        }

        [(PowerUISmartChargeManager *)self requestPeriodicCheckWithDuration:"DebounceTimer" withAlarmKey:v40];
        goto LABEL_97;
      }
      v41 = [(PowerUISmartChargeManager *)self log];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 134217984;
        *(double *)((char *)&buf + 4) = debounceOverride;
        _os_log_impl(&dword_22135E000, v41, OS_LOG_TYPE_DEFAULT, "Device not reconnected to power within %f seconds, treat as unplugged", (uint8_t *)&buf, 0xCu);
      }

      v42 = self->_potentialUnplugDate;
      v43 = self->_potentialUnplugDate;
      self->_potentialUnplugDate = 0;

      [(PowerUISmartChargeManager *)self setDate:0 forPreferenceKey:@"potentialUnplugDate"];
      id v21 = v42;
LABEL_58:
      [(PowerUISmartChargeManager *)self updateTimeLineForCurrentBatteryLevel:v11 withIsExternalConnected:v14 forDate:v21];
      [(PowerUISmartChargeManager *)self setLastBatteryLevel:v11];
      id v21 = v21;
      if ([(PowerUISmartChargeManager *)self lastPluginStatus] != v14) {
        [(PowerUIIntelligenceManager *)self->_intelligenceManager handleCallback];
      }
      int v44 = [(PowerUISmartChargeManager *)self lastPluginStatus];
      char v45 = v14 ^ 1;
      if (v44 == v14) {
        char v45 = 1;
      }
      if (v45)
      {
        if ([(PowerUISmartChargeManager *)self lastPluginStatus] == v14) {
          char v49 = 1;
        }
        else {
          char v49 = v14;
        }
        if (v49)
        {
          v50 = v21;
          if ([(PowerUISmartChargeManager *)self lastPluginStatus] == v14)
          {
            v50 = v21;
            if (self->_manualChargeLimitStatus != 1)
            {
              v50 = v21;
              if (!self->_checkpoint)
              {
                if (!self->_enabled || (v50 = v21, self->_temporarilyDisabled))
                {
                  v51 = [(PowerUISmartChargeManager *)self log];
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
                    -[PowerUISmartChargeManager handleCallback:]((uint64_t)self, v51);
                  }

                  v50 = v21;
                  goto LABEL_96;
                }
              }
            }
          }
        }
        else
        {
          [(PowerUISmartChargeManager *)self handleUnplugAtDate:v21 withBatteryLevel:v11];
          v50 = v21;
        }
      }
      else
      {
        v46 = +[PowerUISmartChargeUtilities timelineEventDate:@"Plugin" withDefaultsDomain:self->_defaultsDomain];
        v47 = v46;
        if (v46)
        {
          id v48 = v46;
        }
        else
        {
          id v48 = +[PowerUISmartChargeUtilities lastPluggedInDate];
        }
        v50 = v48;

        v52 = [(PowerUISmartChargeManager *)self log];
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
          -[PowerUISmartChargeManager handleCallback:]();
        }

        BOOL v53 = +[PowerUISmartChargeUtilities deviceConnectedToWirelessChargerWithContext:self->_context];
        self->_lastChargerWasWireless = v53;
        v54 = [NSNumber numberWithBool:v53];
        [(PowerUISmartChargeManager *)self setNumber:v54 forPreferenceKey:@"wirelessCharger"];

        [(PowerUISmartChargeManager *)self resetDeviceHasLegitimateUsage];
        [(PowerUIMLTwoStageModelPredictor *)self->_modelTwoStagePredictor setPluginDate:v50];
        if (!v47) {
          [(PowerUISmartChargeManager *)self handleNewPluginWithBatteryLevel:v11 pluginDate:v50];
        }
        v55 = +[PowerUISmartChargeUtilities readDictForPreferenceKey:@"CurrentDEoCStatus" inDomain:self->_defaultsDomain];
        v56 = v55;
        if (v55)
        {
          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v60 = 0x3032000000;
          v61 = __Block_byref_object_copy__7;
          v62 = __Block_byref_object_dispose__7;
          id v63 = [v55 objectForKey:@"featureAnalytics"];
          if (*(void *)(*((void *)&buf + 1) + 40)) {
            AnalyticsSendEventLazy();
          }
          _Block_object_dispose(&buf, 8);
        }
      }
      [(PowerUISmartChargeManager *)self setLastPluginStatus:v14];
      if ((((v20 | v14) & 1) != 0 || self->_isChargePackConnected)
        && self->_manualChargeLimitStatus == 1)
      {
        [(PowerUISmartChargeManager *)self engageManualChargeLimit];
      }
      if (self->_manualChargeLimitStatus == 1)
      {
        [(PowerUISmartChargeManager *)self handleNewBatteryLevelForMCL:v11 whileExternalConnected:v14];
      }
      else if (+[PowerUISmartChargeUtilities isiPhone])
      {
        [(PowerUISmartChargeManager *)self handleNewBatteryLevel:v11 whileExternalConnected:v14 fullyCharged:v57];
      }
LABEL_96:

      goto LABEL_97;
    }
    objc_storeStrong((id *)&self->_potentialUnplugDate, v21);
    [(PowerUISmartChargeManager *)self setDate:self->_potentialUnplugDate forPreferenceKey:@"potentialUnplugDate"];
    [(PowerUISmartChargeManager *)self requestPeriodicCheckWithDuration:"DebounceTimer" withAlarmKey:debounceOverride];
    [(PowerUISmartChargeManager *)self clearAllNotificationState];
    v29 = [(PowerUISmartChargeManager *)self log];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = debounceOverride;
      _os_log_impl(&dword_22135E000, v29, OS_LOG_TYPE_DEFAULT, "Potential disconnect, debounce for %f seconds", (uint8_t *)&buf, 0xCu);
    }
LABEL_24:

LABEL_97:
  }
}

- (int)lastPluginStatus
{
  return self->_lastPluginStatus;
}

- (OS_os_log)log
{
  return self->_log;
}

- (BOOL)shouldContinueAfterMCMCheckWithBatteryLevel:(int)a3 withIsCharging:(BOOL)a4 withIsExternalConnected:(BOOL)a5 withIsPluggedIn:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v26 = a5;
  BOOL v7 = a4;
  uint64_t v8 = *(void *)&a3;
  uint64_t v39 = *MEMORY[0x263EF8340];
  mcmLog = self->_mcmLog;
  if (os_log_type_enabled(mcmLog, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = NSNumber;
    BOOL isChargePackConnected = self->_isChargePackConnected;
    v13 = mcmLog;
    uint64_t v14 = [v11 numberWithBool:isChargePackConnected];
    v15 = [NSNumber numberWithBool:v7];
    v16 = [NSNumber numberWithBool:self->_mcmForbidsCharging];
    [NSNumber numberWithInt:v8];
    v18 = uint64_t v17 = v8;
    v19 = [NSNumber numberWithBool:v6];
    uint64_t v20 = [NSNumber numberWithBool:v26];
    *(_DWORD *)long long buf = 138413570;
    int v28 = v14;
    __int16 v29 = 2112;
    v30 = v15;
    __int16 v31 = 2112;
    char v32 = v16;
    __int16 v33 = 2112;
    v34 = v18;
    __int16 v35 = 2112;
    double v36 = v19;
    __int16 v37 = 2112;
    double v38 = v20;
    _os_log_impl(&dword_22135E000, v13, OS_LOG_TYPE_INFO, "Handle callback. _isChargePackConnected: %@ - isCharging: %@ - mcmForbidsCharging: %@ - batteryLevel: %@, isPluggedIn: %@ - isExternalConnected: %@", buf, 0x3Eu);

    uint64_t v8 = v17;
  }
  if (!self->_isChargePackConnected || self->_manualChargeLimitStatus == 1) {
    return 1;
  }
  BOOL v21 = v26 || v6;
  if (!v26 && !v6)
  {
    if (self->_mcmCurrentState == 1)
    {
      if (v8 < 0x5B)
      {
        if (v8 != 90 && self->_mcmForbidsCharging)
        {
          double v23 = self->_mcmLog;
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_21;
          }
          *(_WORD *)long long buf = 0;
          v24 = "Mobile Charge Mode enable charging";
          goto LABEL_11;
        }
      }
      else if (!self->_mcmForbidsCharging)
      {
        v25 = self->_mcmLog;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_22135E000, v25, OS_LOG_TYPE_DEFAULT, "Mobile Charge Mode disable charging", buf, 2u);
        }
        [(PowerUISmartChargeManager *)self mcmDisableCharging];
        goto LABEL_22;
      }
    }
    else if (self->_mcmForbidsCharging)
    {
      if (os_log_type_enabled((os_log_t)self->_mcmLog, OS_LOG_TYPE_ERROR)) {
        -[PowerUISmartChargeManager shouldContinueAfterMCMCheckWithBatteryLevel:withIsCharging:withIsExternalConnected:withIsPluggedIn:]();
      }
      goto LABEL_21;
    }
    return 0;
  }
  if (self->_mcmForbidsCharging)
  {
    double v23 = self->_mcmLog;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
LABEL_21:
      [(PowerUISmartChargeManager *)self mcmEnableCharging];
LABEL_22:
      [(PowerUISmartChargeManager *)self reportMCMStatusWithBatteryLevel:v8];
      return v21;
    }
    *(_WORD *)long long buf = 0;
    v24 = "Mobile Charge Mode enable charging - external power available";
LABEL_11:
    _os_log_impl(&dword_22135E000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
    goto LABEL_21;
  }
  return 1;
}

uint64_t __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2(void *a1)
{
  v2 = (void *)a1[4];
  if (v2[8])
  {
    (*(void (**)(void))(a1[5] + 16))();
    v2 = (void *)a1[4];
  }
  uint64_t result = [v2 handleCallback];
  if (*(void *)(a1[4] + 72))
  {
    v4 = *(uint64_t (**)(void))(a1[6] + 16);
    return v4();
  }
  return result;
}

uint64_t __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_597(id *a1)
{
  v2 = [a1[4] queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2;
  block[3] = &unk_2645A6A38;
  id v5 = a1[4];
  id v6 = a1[5];
  id v7 = a1[6];
  dispatch_sync(v2, block);

  return 1;
}

- (void)updateTimeLineForCurrentBatteryLevel:(int)a3 withIsExternalConnected:(BOOL)a4 forDate:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  id v13 = a5;
  BOOL v8 = self->_isDesktopDevice || self->_manualChargeLimitStatus == 1;
  int v9 = [(PowerUISmartChargeManager *)self lastBatteryLevel];
  if ((int)v6 <= 99 && v9 == 100 && !v8)
  {
    v10 = [NSNumber numberWithInt:v6];
    [(PowerUISmartChargeManager *)self _submitEngagementEventWithBatteryLevel:v10 eventType:11];

    self->_reachedTargetSoC = 0;
    [(PowerUISmartChargeManager *)self setNumber:&unk_26D385618 forPreferenceKey:@"reachedTargetSoC"];
  }
  if ((v6 - 80) > 0xE || self->_becameOBCEligible)
  {
    uint64_t v11 = v6 == 100 && v5;
    if (v11 == 1 && !self->_lastFullyCharged)
    {
      [(PowerUISmartChargeManager *)self pluginTimelineAddEvent:@"FullyCharged" atDate:v13 withBatteryLevel:100];
      notify_post((const char *)[@"com.apple.smartcharging.statechange" UTF8String]);
      uint64_t v11 = 1;
    }
  }
  else
  {
    [(PowerUISmartChargeManager *)self pluginTimelineAddEvent:@"EligibleForIdle" atDate:v13 withBatteryLevel:v6];
    self->_becameOBCEligible = 1;
    [(PowerUISmartChargeManager *)self setNumber:&unk_26D385648 forPreferenceKey:@"becameOBCEligible"];
    uint64_t v11 = 0;
  }
  [(PowerUISmartChargeManager *)self setLastFullyCharged:v11];
  if (v8 && (int)v6 >= 80 && !self->_reachedTargetSoC)
  {
    v12 = [NSNumber numberWithInt:v6];
    [(PowerUISmartChargeManager *)self _submitEngagementEventWithBatteryLevel:v12 eventType:10];

    self->_reachedTargetSoC = 1;
    [(PowerUISmartChargeManager *)self setNumber:&unk_26D385648 forPreferenceKey:@"reachedTargetSoC"];
  }
}

- (void)updateNotificationSettings:(BOOL)a3
{
  if (a3)
  {
    id v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v4, "Notification", "com.apple.system.powermanagement.useractivity2");
    xpc_set_event();
  }
  else
  {
    xpc_set_event();
  }
}

- (void)setLastPluginStatus:(int)a3
{
  self->_lastPluginStatus = a3;
}

- (void)setLastFullyCharged:(int)a3
{
  self->_lastFullyCharged = a3;
}

- (void)setLastBatteryLevel:(int)a3
{
  self->_lastBatteryLevel = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int)lastBatteryLevel
{
  return self->_lastBatteryLevel;
}

- (BOOL)isDeviceWithLegitimateUsage
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__PowerUISmartChargeManager_isDeviceWithLegitimateUsage__block_invoke;
  block[3] = &unk_2645A5CF0;
  void block[4] = self;
  if (isDeviceWithLegitimateUsage_onceToken != -1) {
    dispatch_once(&isDeviceWithLegitimateUsage_onceToken, block);
  }
  return self->__hasLegitimateUsage;
}

- (void)handleNewBatteryLevel:(int)a3 whileExternalConnected:(BOOL)a4 fullyCharged:(BOOL)a5
{
  BOOL v5 = a4;
  *(void *)&v66[5] = *MEMORY[0x263EF8340];
  +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:@"Beginning of handleNewBatteryLevel", a4, a5];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109376;
    v66[0] = a3;
    LOWORD(v66[1]) = 1024;
    *(_DWORD *)((char *)&v66[1] + 2) = v5;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Called for battery level=%d, externalConnected=%u", buf, 0xEu);
  }
  if (!v5)
  {
    v10 = [(PowerUISmartChargeManager *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __87__PowerUISmartChargeManager_handleNewBatteryLevel_whileExternalConnected_fullyCharged___block_invoke;
    block[3] = &unk_2645A5CF0;
    void block[4] = self;
    dispatch_async(v10, block);
  }
  BOOL v11 = a3 == 100 && v5;
  if ([(PowerUISmartChargeManager *)self isDeviceWithLegitimateUsage])
  {
    unint64_t checkpoint = self->_checkpoint;
    if (!self->_enabled || self->_temporarilyDisabled)
    {
      [(PowerUISmartChargeManager *)self stopAllMonitoring];
      if (checkpoint - 1 > 8)
      {
        if ((checkpoint & 0xFFFFFFFFFFFFFFFELL) != 0xA)
        {
LABEL_19:
          v18 = self->_log;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = NSNumber;
            unint64_t v20 = self->_checkpoint;
            BOOL v21 = v18;
            int v22 = [v19 numberWithUnsignedInteger:v20];
            *(_DWORD *)long long buf = 138412290;
            *(void *)v66 = v22;
            _os_log_impl(&dword_22135E000, v21, OS_LOG_TYPE_DEFAULT, "Checkpoint: %@", buf, 0xCu);
          }
          unint64_t v23 = self->_checkpoint;
          if (checkpoint != v23 && v23)
          {
            switch(v23)
            {
              case 2uLL:
                if (!self->_isDesktopDevice)
                {
                  v24 = self->_log;
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)long long buf = 0;
                    _os_log_impl(&dword_22135E000, v24, OS_LOG_TYPE_DEFAULT, "Top-Off Detected. Provide non-obvious notification", buf, 2u);
                  }
                  v25 = self;
                  uint64_t v26 = 0;
                  goto LABEL_50;
                }
                break;
              case 5uLL:
                int v44 = self->_log;
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_impl(&dword_22135E000, v44, OS_LOG_TYPE_DEFAULT, "Top-Off Engaged. Provide obvious notification", buf, 2u);
                }
                [(PowerUISmartChargeManager *)self clearAllNotificationState];
                v25 = self;
                uint64_t v26 = 1;
LABEL_50:
                [(PowerUISmartChargeManager *)v25 postOBCNotificationWithTopOff:v26];
                break;
              case 7uLL:
                char v45 = self->_log;
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_impl(&dword_22135E000, v45, OS_LOG_TYPE_DEFAULT, "Success: Removing all notifications.", buf, 2u);
                }
                goto LABEL_56;
              case 8uLL:
                v46 = [(PowerUISmartChargeManager *)self fullChargeDeadlineOverride];
                if (v46) {
                  goto LABEL_54;
                }
                if (!self->_lastChargerWasWireless)
                {
                  v46 = [MEMORY[0x263EFF910] date];
                  [(PowerUISmartChargeManager *)self setDate:v46 forPreferenceKey:@"lastInterrupted"];
LABEL_54:
                }
LABEL_56:
                [(PowerUISmartChargeManager *)self clearAllNotificationState];
                break;
              default:
                break;
            }
          }
          if (checkpoint != self->_checkpoint) {
            [(PowerUISmartChargeManager *)self promptBDCToQueryCurrentState];
          }
          if (!v5 && (self->_checkpoint & 0xFFFFFFFFFFFFFFFELL) == 8)
          {
            v47 = [MEMORY[0x263EFF910] date];
            [(PowerUISmartChargeManager *)self addPowerLogEventForCheckpoint:0 decisionSignalID:0 decisionDate:v47];

            [(PowerUISmartChargeManager *)self setCheckpoint:0 withSelector:a2];
            [(PowerUIChargingController *)self->_chargingController clearAllChargeLimits];
            notify_post((const char *)[@"com.apple.powerui.smartchargestatuschanged" UTF8String]);
          }
          +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:@"End of handleNewBatterylevel"];
          return;
        }
        uint64_t v17 = [MEMORY[0x263EFF910] date];
        [(PowerUISmartChargeManager *)self addPowerLogEventForCheckpoint:0 decisionSignalID:0 decisionDate:v17];

        uint64_t v14 = self;
        uint64_t v15 = 0;
      }
      else
      {
        id v13 = [MEMORY[0x263EFF910] date];
        [(PowerUISmartChargeManager *)self addPowerLogEventForCheckpoint:10 decisionSignalID:0 decisionDate:v13];

        uint64_t v14 = self;
        uint64_t v15 = 10;
      }
      [(PowerUISmartChargeManager *)v14 setCheckpoint:v15 withSelector:a2];
      goto LABEL_19;
    }
    if (!v5)
    {
      v41 = [MEMORY[0x263EFF910] date];
      [(PowerUISmartChargeManager *)self updateChargingTimeSaved];
      [(PowerUISmartChargeManager *)self stopAllMonitoring];
      if (checkpoint > 6 || (uint64_t v42 = 8, ((1 << checkpoint) & 0x43) != 0))
      {
        if (checkpoint == 1) {
          unint64_t v43 = 0;
        }
        else {
          unint64_t v43 = checkpoint;
        }
        if (checkpoint - 6 >= 3) {
          uint64_t v42 = v43;
        }
        else {
          uint64_t v42 = 0;
        }
      }
      [(PowerUISmartChargeManager *)self addPowerLogEventForCheckpoint:v42 decisionSignalID:0 decisionDate:v41];
      [(PowerUISmartChargeManager *)self setCheckpoint:v42 withSelector:a2];
      [(PowerUISmartChargeManager *)self cleanupOverrides];

      goto LABEL_19;
    }
    int v27 = [(PowerUISmartChargeManager *)self readDateForPreferenceKey:@"lastInterrupted"];
    int v28 = [MEMORY[0x263EFF910] date];
    __int16 v29 = v28;
    if (v27)
    {
      [v28 timeIntervalSinceDate:v27];
      if (v30 < 8.0)
      {
        __int16 v31 = self->_log;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_22135E000, v31, OS_LOG_TYPE_DEFAULT, "Device unplugged and reconnected...logging this behavior", buf, 2u);
        }
        [(PowerUISmartChargeManager *)self setNumber:&unk_26D385648 forPreferenceKey:@"recentlyInterrupted"];
      }
    }
    uint64_t v32 = a3;
    __int16 v33 = [(PowerUISmartChargeManager *)self chargePrediction:a3 fullyCharged:v11 previousCheckpoint:checkpoint predictor:self->_predictorType];
    v34 = [v33 objectForKeyedSubscript:@"checkpoint"];

    if (!v34)
    {
LABEL_68:
      [(PowerUISmartChargeManager *)self requestPeriodicCheck];
      uint64_t v49 = [v33 objectForKeyedSubscript:@"checkpoint"];
      if (!v49) {
        goto LABEL_78;
      }
      v50 = (void *)v49;
      v51 = [v33 objectForKeyedSubscript:@"shouldDisableCharging"];

      if (!v51) {
        goto LABEL_78;
      }
      v52 = v29;
      BOOL v53 = [v33 objectForKeyedSubscript:@"shouldDisableCharging"];
      int v54 = [v53 BOOLValue];

      if (v54)
      {
        [(PowerUISmartChargeManager *)self disableCharging];
        unint64_t v55 = self->_checkpoint;
        __int16 v29 = v52;
        if (checkpoint == v55 || v55 == 4) {
          goto LABEL_78;
        }
        [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
        double v57 = v56;
        v58 = objc_msgSend(NSNumber, "numberWithDouble:");
        [(PowerUISmartChargeManager *)self setNumber:v58 forPreferenceKey:@"chargingDisabledAt"];

        __int16 v29 = v52;
        v59 = [NSNumber numberWithDouble:v57];
        [(PowerUISmartChargeManager *)self setNumber:v59 forPreferenceKey:@"lastEnabled"];
      }
      else
      {
        [(PowerUISmartChargeManager *)self enableCharging];
        unint64_t v60 = self->_checkpoint;
        __int16 v29 = v52;
        if (checkpoint == v60 || v60 == 3) {
          goto LABEL_78;
        }
        [(PowerUISmartChargeManager *)self updateChargingTimeSaved];
      }
      notify_post((const char *)[@"com.apple.powerui.smartchargestatuschanged" UTF8String]);
LABEL_78:

      goto LABEL_19;
    }
    v62 = v29;
    id v63 = v27;
    __int16 v35 = [v33 objectForKeyedSubscript:@"checkpoint"];
    unint64_t v36 = [v35 unsignedIntegerValue];

    __int16 v37 = [v33 objectForKeyedSubscript:@"decisionMaker"];
    uint64_t v38 = [v37 integerValue];

    uint64_t v39 = [v33 objectForKeyedSubscript:@"decisionDate"];
    [(PowerUISmartChargeManager *)self updateDecisionMakerID:v38 withCheckpoint:v36];
    double v40 = [NSNumber numberWithInteger:v38];
    [(PowerUISmartChargeManager *)self addPowerLogEventForCheckpoint:v36 decisionSignalID:v40 decisionDate:v39];

    if (checkpoint == v36)
    {
LABEL_67:

      __int16 v29 = v62;
      int v27 = v63;
      goto LABEL_68;
    }
    if (v36 != 7)
    {
      v61 = [(PowerUISmartChargeManager *)self checkpointNameFromCheckpoint:v36];
      id v48 = [MEMORY[0x263EFF910] date];
      [(PowerUISmartChargeManager *)self pluginTimelineAddEvent:v61 atDate:v48 withBatteryLevel:v32];

      if (v36 == 2)
      {
        [(PowerUISmartChargeManager *)self startAllMonitoring];
        goto LABEL_65;
      }
      if (v36 < 5) {
        goto LABEL_66;
      }
    }
    [(PowerUISmartChargeManager *)self stopAllMonitoring];
LABEL_65:
    notify_post((const char *)[@"com.apple.smartcharging.statechange" UTF8String]);
LABEL_66:
    [(PowerUISmartChargeManager *)self setCheckpoint:v36 withSelector:a2];
    goto LABEL_67;
  }
  v16 = [(PowerUISmartChargeManager *)self log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[PowerUISmartChargeManager handleNewBatteryLevel:whileExternalConnected:fullyCharged:]();
  }
}

- (void)handleCallback
{
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (PowerUISmartChargeManager)initWithDefaultsDomain:(id)a3 contextStore:(id)a4 beforeHandlingBatteryChangeCallback:(id)a5 afterHandlingBatteryChangeCallback:(id)a6
{
  v251[4] = *MEMORY[0x263EF8340];
  id v156 = a3;
  id v157 = a4;
  id v163 = a5;
  id v160 = a6;
  v246.receiver = self;
  v246.super_class = (Class)PowerUISmartChargeManager;
  BOOL v11 = [(PowerUISmartChargeManager *)&v246 init];
  if (v11)
  {
    v151 = (void *)os_transaction_create();
    os_log_t v12 = os_log_create("com.apple.powerui.smartcharging", "");
    id v13 = (void *)*((void *)v11 + 12);
    *((void *)v11 + 12) = v12;

    uint64_t v14 = (id *)(v11 + 48);
    objc_storeStrong((id *)v11 + 6, a4);
    objc_storeStrong((id *)v11 + 7, a3);
    uint64_t v15 = +[PowerUIChargingController sharedInstance];
    v16 = (void *)*((void *)v11 + 50);
    *((void *)v11 + 50) = v15;

    uint64_t v17 = +[PowerUIAnalyticsManager sharedInstance];
    v18 = (void *)*((void *)v11 + 51);
    *((void *)v11 + 51) = v17;

    v155 = [v11 readStringForPreferenceKey:@"bootUUIDOnLastInit"];
    v159 = +[PowerUISmartChargeUtilities getCurrentBootSessionUUID];
    int v19 = [v159 isEqualToString:v155];
    [v11 setString:v159 forPreferenceKey:@"bootUUIDOnLastInit"];
    unint64_t v20 = *((void *)v11 + 12);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v21 = NSNumber;
      int v22 = v20;
      unint64_t v23 = [v21 numberWithBool:v19 ^ 1u];
      *(_DWORD *)long long buf = 138412290;
      v248 = v23;
      _os_log_impl(&dword_22135E000, v22, OS_LOG_TYPE_DEFAULT, "SmartChargeManager initializing. Was the device restarted: %@", buf, 0xCu);
    }
    if (v19) {
      uint64_t v24 = 2;
    }
    else {
      uint64_t v24 = 1;
    }
    [*((id *)v11 + 51) submitEngagementEventWithBatteryLevel:0 targetSoC:0 predictedEndOfCharge:0 modeOfOperation:0 eventType:v24];
    uint64_t v25 = MEMORY[0x223C80C20](v163);
    uint64_t v26 = (void *)*((void *)v11 + 8);
    *((void *)v11 + 8) = v25;

    uint64_t v27 = MEMORY[0x223C80C20](v163);
    int v28 = (void *)*((void *)v11 + 9);
    *((void *)v11 + 9) = v27;

    if ((v19 & 1) == 0) {
      [*((id *)v11 + 50) clearAllChargeLimits];
    }
    __int16 v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v30 = dispatch_queue_create("com.apple.powerui.queue", v29);
    __int16 v31 = (void *)*((void *)v11 + 21);
    *((void *)v11 + 21) = v30;

    id v32 = objc_alloc_init(MEMORY[0x263F08958]);
    __int16 v33 = (void *)*((void *)v11 + 59);
    *((void *)v11 + 59) = v32;

    v34 = [MEMORY[0x263F08A00] defaultCenter];
    [v34 addObserver:v11 selector:sel_powerStateChangedCallback name:*MEMORY[0x263F08450] object:0];

    os_log_t v35 = os_log_create("com.apple.powerui.mobilechargemode", "");
    unint64_t v36 = (void *)*((void *)v11 + 13);
    *((void *)v11 + 13) = v35;

    uint64_t v37 = [MEMORY[0x263F087C8] defaultCenter];
    uint64_t v38 = (void *)*((void *)v11 + 11);
    *((void *)v11 + 11) = v37;

    v162 = [v11 readNumberForPreferenceKey:@"MCMCurrentState"];
    if (!v162)
    {
      [v11 setNumber:&unk_26D385600 forPreferenceKey:@"MCMCurrentState"];
      v162 = &unk_26D385600;
    }
    v161 = [v11 readNumberForPreferenceKey:@"MCMForbidsCharging"];
    if (!v161)
    {
      [v11 setNumber:MEMORY[0x263EFFA80] forPreferenceKey:@"MCMForbidsCharging"];
      v161 = (void *)MEMORY[0x263EFFA80];
    }
    v11[17] = 0;
    unsigned int v39 = [v162 unsignedIntValue];
    *((void *)v11 + 52) = v39;
    if (v39 == 2) {
      [v11 startFidgetMitigationTimer];
    }
    v11[18] = [v161 BOOLValue];
    uint64_t v40 = [MEMORY[0x263F340C0] sharedInstance];
    v41 = (void *)*((void *)v11 + 53);
    *((void *)v11 + 53) = v40;

    if ([v11 isMCMSupported]) {
      [*((id *)v11 + 53) registerDelegate:v11];
    }
    uint64_t v42 = [v11 readNumberForPreferenceKey:@"NumberOfTimesMCMNotificationWasDisplayed"];
    v154 = v42;
    if (v42)
    {
      *((void *)v11 + 57) = [v42 unsignedIntValue];
    }
    else
    {
      *((void *)v11 + 57) = 0;
      [v11 setNumber:&unk_26D385618 forPreferenceKey:@"NumberOfTimesMCMNotificationWasDisplayed"];
    }
    uint64_t v43 = [MEMORY[0x263F351F0] keyPathWithKey:@"/charging/topOffCheckpoint"];
    int v44 = (void *)*((void *)v11 + 10);
    *((void *)v11 + 10) = v43;

    +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:@"smartChargeManager init before trialManager"];
    char v45 = [[PowerUITrialManager alloc] initWithDefaultsDomain:*((void *)v11 + 7)];
    v46 = (void *)*((void *)v11 + 49);
    *((void *)v11 + 49) = v45;

    +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:@"smartChargeManager init before monitors"];
    v47 = +[PowerUIAlarmSignalMonitor monitorWithDelegate:v11 trialManager:*((void *)v11 + 49) withContext:*((void *)v11 + 6)];
    v251[0] = v47;
    id v48 = +[PowerUICalendarSignalMonitor monitorWithDelegate:v11 trialManager:*((void *)v11 + 49) withContext:*((void *)v11 + 6)];
    v251[1] = v48;
    uint64_t v49 = +[PowerUILocationSignalMonitor monitorWithDelegate:v11 trialManager:*((void *)v11 + 49) withContext:*((void *)v11 + 6)];
    v251[2] = v49;
    v50 = +[PowerUIWalletSignalMonitor monitorWithDelegate:v11];
    v251[3] = v50;
    uint64_t v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:v251 count:4];
    v52 = (void *)*((void *)v11 + 39);
    *((void *)v11 + 39) = v51;

    v11[16] = 0;
    +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:@"smartChargeManager init before CEC manager"];
    BOOL v53 = +[PowerUICECManager manager];
    if (v53)
    {
      int v54 = (void *)[*((id *)v11 + 39) mutableCopy];
      [v54 addObject:v53];
      unint64_t v55 = (void *)*((void *)v11 + 39);
      *((void *)v11 + 39) = v54;
    }
    *((void *)v11 + 4) = -1;
    if (([v11 isExternalConnected] & v19) == 1)
    {
      *((_DWORD *)v11 + 9) = 1;
      double v56 = *((void *)v11 + 12);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22135E000, v56, OS_LOG_TYPE_DEFAULT, "Device is still plugged in on daemon restart.", buf, 2u);
      }
    }
    *((_DWORD *)v11 + 10) = -1;
    v11[14] = 0;
    *((void *)v11 + 34) = -1;
    uint64_t v57 = [v11 readNumberForPreferenceKey:@"engagementsLastMonthBucket"];
    v58 = (void *)*((void *)v11 + 27);
    *((void *)v11 + 27) = v57;

    if (!*((void *)v11 + 27))
    {
      *((void *)v11 + 27) = &unk_26D385630;
    }
    uint64_t v59 = [v11 readNumberForPreferenceKey:@"numberOfPluginEvents"];
    unint64_t v60 = (void *)*((void *)v11 + 28);
    *((void *)v11 + 28) = v59;

    if (!*((void *)v11 + 28))
    {
      *((void *)v11 + 28) = &unk_26D385630;
    }
    uint64_t v61 = [v11 readNumberForPreferenceKey:@"medianPluginLength"];
    v62 = (void *)*((void *)v11 + 29);
    *((void *)v11 + 29) = v61;

    if (!*((void *)v11 + 29))
    {
      *((void *)v11 + 29) = &unk_26D385630;
    }
    v158 = [v11 readNumberForPreferenceKey:@"previousDecisionMaker"];
    if (v158) {
      *((void *)v11 + 34) = [v158 integerValue];
    }
    uint64_t v63 = [v11 readDateForPreferenceKey:@"previousDecisionMakerDate"];
    uint64_t v64 = (void *)*((void *)v11 + 36);
    *((void *)v11 + 36) = v63;

    +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:@"smartChargeManager init before predictor"];
    v65 = [(PowerUIMLTwoStageModelPredictor *)[PowerUIMLPhonePredictor alloc] initWithDefaultsDomain:*((void *)v11 + 7) withContextStore:*((void *)v11 + 6) withTrialManager:*((void *)v11 + 49)];
    v66 = (void *)*((void *)v11 + 37);
    *((void *)v11 + 37) = v65;

    v67 = [[PowerUIIntelligenceManager alloc] initWithDefaultsDomain:*((void *)v11 + 7) withContextStore:*((void *)v11 + 6) withTrialManager:*((void *)v11 + 49)];
    v68 = (void *)*((void *)v11 + 38);
    *((void *)v11 + 38) = v67;

    if (*((int *)v11 + 9) >= 1)
    {
      v69 = +[PowerUISmartChargeUtilities lastPluggedInDate];
      [*((id *)v11 + 37) setPluginDate:v69];
    }
    objc_initWeak(&location, v11);
    v70 = (void *)*((void *)v11 + 49);
    v243[0] = MEMORY[0x263EF8330];
    v243[1] = 3221225472;
    v243[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke;
    v243[3] = &unk_2645A6A10;
    objc_copyWeak(&v244, &location);
    [v70 addUpdateHandler:v243];
    if (!+[PowerUISmartChargeUtilities isUltraWatch]) {
      kMaxDEoCBatteryDrain = 1;
    }
    [v11 handleXPCActivityOnBoot];
    +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:@"smartChargeManager init before loadDefaults"];
    [v11 loadDefaults];
    if ((v19 & 1) != 0 || v11[15])
    {
      [v11 loadCheckpoint];
      v71 = *((id *)v11 + 12);
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        v72 = [NSNumber numberWithUnsignedInteger:*((void *)v11 + 14)];
        *(_DWORD *)long long buf = 138412290;
        v248 = v72;
        _os_log_impl(&dword_22135E000, v71, OS_LOG_TYPE_DEFAULT, "Loading checkpoint value: %@", buf, 0xCu);
      }
    }
    else
    {
      [v11 setCheckpoint:0 withSelector:a2 forceWrite:1];
      v150 = *((void *)v11 + 12);
      if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22135E000, v150, OS_LOG_TYPE_DEFAULT, "Device was restarted, reset checkpoint.", buf, 2u);
      }
    }
    v73 = (void *)MEMORY[0x263EFF910];
    v74 = [v11 readNumberForPreferenceKey:@"disabledUntil"];
    [v74 doubleValue];
    uint64_t v75 = objc_msgSend(v73, "dateWithTimeIntervalSinceReferenceDate:");
    v76 = (void *)*((void *)v11 + 16);
    *((void *)v11 + 16) = v75;

    [v11 setTemporarilyDisabled:1 until:*((void *)v11 + 16)];
    v77 = *((id *)v11 + 12);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      v78 = (void *)*((void *)v11 + 16);
      [v78 timeIntervalSinceNow];
      *(_DWORD *)long long buf = 138412546;
      v248 = v78;
      __int16 v249 = 1024;
      BOOL v250 = v79 > 0.0;
      _os_log_impl(&dword_22135E000, v77, OS_LOG_TYPE_DEFAULT, "Temp disabled until date: %@ (temp disabled: %u)", buf, 0x12u);
    }

    +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:@"smartChargeManager init before mitigationManager"];
    uint64_t v80 = +[PowerUIBatteryMitigationManager sharedManager];
    v81 = (void *)*((void *)v11 + 46);
    *((void *)v11 + 46) = v80;

    +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:@"smartChargeManager init before BDC manager"];
    uint64_t v82 = +[PowerUIBDCDataManager sharedInstance];
    v83 = (void *)*((void *)v11 + 47);
    *((void *)v11 + 47) = v82;

    +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:@"smartChargeManager init after BDC manager"];
    if (+[PowerUISmartChargeUtilities isInternalBuild]) {
      kMaximumDurationUntilFullyCharged = 0x40E89C0000000000;
    }
    if (*((void *)v11 + 60) == 1) {
      [v11 engageManualChargeLimit];
    }
    v84 = (void *)MEMORY[0x263F351F8];
    v85 = [MEMORY[0x263F351D0] keyPathForBatteryStateDataDictionary];
    v86 = [MEMORY[0x263F351D0] keyPathForBatteryStateDataDictionary];
    v87 = [MEMORY[0x263F351D0] keyPathForForegroundApp];
    v88 = [MEMORY[0x263F351D0] keyPathForBatteryStateDataDictionary];
    v153 = [v84 predicateForKeyPath:v85, @"(SELF.%@.value.rawExternalConnected = %@) AND NOT (SELF.%@.value = %@) AND NOT (SELF.%@.value.fullyCharged = %@)", v86, MEMORY[0x263EFFA88], v87, @"com.apple.camera", v88, &unk_26D385648 withFormat];

    v239[0] = MEMORY[0x263EF8330];
    v239[1] = 3221225472;
    v239[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_597;
    v239[3] = &unk_2645A6A60;
    v89 = v11;
    v240 = v89;
    id v241 = v163;
    id v242 = v160;
    v90 = (void *)MEMORY[0x223C80C20](v239);
    v91 = (void *)MEMORY[0x263F351F8];
    v92 = [MEMORY[0x263F351D0] keyPathForPluginStatus];
    v93 = [v91 predicateForChangeAtKeyPath:v92];

    v94 = [MEMORY[0x263F351E8] localWakingRegistrationWithIdentifier:@"com.apple.powerui.smartcharge" contextualPredicate:v153 callback:v90];
    v95 = [MEMORY[0x263F351E8] localWakingRegistrationWithIdentifier:@"com.apple.powerui.smartcharge.unplug" contextualPredicate:v93 callback:v90];
    [*v14 registerCallback:v94];
    [*v14 registerCallback:v95];
    v96 = *((void *)v11 + 21);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_3;
    block[3] = &unk_2645A5CF0;
    v97 = v89;
    v238 = v97;
    dispatch_async(v96, block);
    uint64_t v98 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.powerui.smartChargeManager"];
    id v99 = v97[48];
    v97[48] = (id)v98;

    [v97[48] setDelegate:v97];
    [v97[48] resume];
    [v97 registerBDCXPC];
    *(_DWORD *)long long buf = 0;
    v100 = *((void *)v11 + 21);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_4;
    handler[3] = &unk_2645A5CA8;
    v101 = v97;
    v236 = v101;
    notify_register_dispatch("AppleLanguagePreferencesChangedNotification", (int *)buf, v100, handler);
    int out_token = 0;
    v102 = *((void *)v11 + 21);
    v232[0] = MEMORY[0x263EF8330];
    v232[1] = 3221225472;
    v232[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_618;
    v232[3] = &unk_2645A5CA8;
    v103 = v101;
    v233 = v103;
    notify_register_dispatch("com.apple.powerui.checkpoint", &out_token, v102, v232);
    int v231 = 0;
    v104 = (const char *)[@"com.apple.smartcharging.defaultschanged" UTF8String];
    v105 = *((void *)v11 + 21);
    v229[0] = MEMORY[0x263EF8330];
    v229[1] = 3221225472;
    v229[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_619;
    v229[3] = &unk_2645A5CA8;
    v106 = v103;
    v230 = v106;
    notify_register_dispatch(v104, &v231, v105, v229);
    int v228 = 0;
    v107 = *((void *)v11 + 21);
    v226[0] = MEMORY[0x263EF8330];
    v226[1] = 3221225472;
    v226[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_3_621;
    v226[3] = &unk_2645A5CA8;
    v108 = v106;
    v227 = v108;
    notify_register_dispatch("com.apple.powerui.requiredFullCharge", &v228, v107, v226);
    int v225 = 0;
    v109 = *((void *)v11 + 21);
    v223[0] = MEMORY[0x263EF8330];
    v223[1] = 3221225472;
    v223[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_623;
    v223[3] = &unk_2645A5CA8;
    v110 = v108;
    v224 = v110;
    notify_register_dispatch("com.apple.powerui.ptoengaged", &v225, v109, v223);
    int v222 = 0;
    v111 = *((void *)v11 + 21);
    v220[0] = MEMORY[0x263EF8330];
    v220[1] = 3221225472;
    v220[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_625;
    v220[3] = &unk_2645A5CA8;
    v112 = v110;
    v221 = v112;
    notify_register_dispatch("com.apple.powerui.ttr", &v222, v111, v220);
    int v219 = 0;
    v113 = *((void *)v11 + 21);
    v216[0] = MEMORY[0x263EF8330];
    v216[1] = 3221225472;
    v216[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_3_627;
    v216[3] = &unk_2645A6A88;
    v114 = v112;
    v217 = v114;
    SEL v218 = a2;
    notify_register_dispatch("com.apple.system.powersources.gaugingmitigation", &v219, v113, v216);
    int v215 = 0;
    v115 = *((void *)v11 + 21);
    v213[0] = MEMORY[0x263EF8330];
    v213[1] = 3221225472;
    v213[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_629;
    v213[3] = &unk_2645A5CA8;
    v116 = v114;
    v214 = v116;
    notify_register_dispatch("com.apple.powerui.computehistorical", &v215, v115, v213);
    int v212 = 0;
    v117 = *((void *)v11 + 21);
    v210[0] = MEMORY[0x263EF8330];
    v210[1] = 3221225472;
    v210[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_631;
    v210[3] = &unk_2645A5CA8;
    v118 = v116;
    id v211 = v118;
    notify_register_dispatch("com.apple.powerui.testMCMActiveNotificationRequest", &v212, v117, v210);
    int v209 = 0;
    v119 = *((void *)v11 + 21);
    v207[0] = MEMORY[0x263EF8330];
    v207[1] = 3221225472;
    v207[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_633;
    v207[3] = &unk_2645A5CA8;
    id v120 = v118;
    id v208 = v120;
    notify_register_dispatch("com.apple.powerui.genericttr", &v209, v119, v207);
    int v206 = 0;
    v121 = *((void *)v11 + 21);
    v204[0] = MEMORY[0x263EF8330];
    v204[1] = 3221225472;
    v204[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_3_638;
    v204[3] = &unk_2645A5CA8;
    id v122 = v120;
    id v205 = v122;
    notify_register_dispatch("com.apple.powerui.checklocation", &v206, v121, v204);
    int v203 = 0;
    v123 = *((void *)v11 + 21);
    v201[0] = MEMORY[0x263EF8330];
    v201[1] = 3221225472;
    v201[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_640;
    v201[3] = &unk_2645A5CA8;
    id v124 = v122;
    id v202 = v124;
    notify_register_dispatch("com.apple.powerui.testMonthlyAnalytics", &v203, v123, v201);
    int v200 = 0;
    v125 = *((void *)v11 + 21);
    v198[0] = MEMORY[0x263EF8330];
    v198[1] = 3221225472;
    v198[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_642;
    v198[3] = &unk_2645A5CA8;
    id v126 = v124;
    id v199 = v126;
    notify_register_dispatch("com.apple.powerui.testHardwareCheck", &v200, v125, v198);
    int v197 = 0;
    v127 = *((void *)v11 + 21);
    v195[0] = MEMORY[0x263EF8330];
    v195[1] = 3221225472;
    v195[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_647;
    v195[3] = &unk_2645A5CA8;
    id v128 = v126;
    id v196 = v128;
    notify_register_dispatch("com.apple.powerui.evaluateDEoC", &v197, v127, v195);
    int v194 = 0;
    v129 = *((void *)v11 + 21);
    v192[0] = MEMORY[0x263EF8330];
    v192[1] = 3221225472;
    v192[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_649;
    v192[3] = &unk_2645A5CA8;
    id v130 = v128;
    id v193 = v130;
    notify_register_dispatch("com.apple.powerui.printBiomeStreams", &v194, v129, v192);
    int v191 = 0;
    v131 = *((void *)v11 + 21);
    v189[0] = MEMORY[0x263EF8330];
    v189[1] = 3221225472;
    v189[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_651;
    v189[3] = &unk_2645A5CA8;
    id v132 = v130;
    id v190 = v132;
    notify_register_dispatch("com.apple.powerui.pluginEvents", &v191, v131, v189);
    int v188 = 0;
    v133 = *((void *)v11 + 21);
    v186[0] = MEMORY[0x263EF8330];
    v186[1] = 3221225472;
    v186[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_653;
    v186[3] = &unk_2645A5CA8;
    id v134 = v132;
    id v187 = v134;
    notify_register_dispatch("com.apple.powerui.gaugingStatistics", &v188, v133, v186);
    int v185 = 0;
    v135 = *((void *)v11 + 21);
    v183[0] = MEMORY[0x263EF8330];
    v183[1] = 3221225472;
    v183[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_655;
    v183[3] = &unk_2645A5CA8;
    id v136 = v134;
    id v184 = v136;
    notify_register_dispatch("com.apple.powerui.evaluateChargeLimitRecommendation", &v185, v135, v183);
    int v182 = 0;
    v137 = *((void *)v11 + 21);
    v180[0] = MEMORY[0x263EF8330];
    v180[1] = 3221225472;
    v180[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_657;
    v180[3] = &unk_2645A5CA8;
    id v138 = v136;
    id v181 = v138;
    notify_register_dispatch("com.apple.powerui.postChargeLimitRecommendation", &v182, v137, v180);
    int v179 = 0;
    v139 = *((void *)v11 + 21);
    v177[0] = MEMORY[0x263EF8330];
    v177[1] = 3221225472;
    v177[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_3_659;
    v177[3] = &unk_2645A5CA8;
    id v140 = v138;
    id v178 = v140;
    notify_register_dispatch("com.apple.powerui.testTmpDisableChargeLimit", &v179, v139, v177);
    int v176 = 0;
    v141 = *((void *)v11 + 21);
    v174[0] = MEMORY[0x263EF8330];
    v174[1] = 3221225472;
    v174[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_4_661;
    v174[3] = &unk_2645A5CA8;
    v142 = (int *)v140;
    v175 = v142;
    notify_register_dispatch("com.apple.powerui.testCheckForTempDisabled", &v176, v141, v174);
    v143 = *((void *)v11 + 21);
    v172[0] = MEMORY[0x263EF8330];
    v172[1] = 3221225472;
    v172[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_5;
    v172[3] = &unk_2645A5CA8;
    v144 = v142;
    v173 = v144;
    notify_register_dispatch("com.apple.perfpowerservices.reportobcanalytics", v142 + 7, v143, v172);
    v145 = (void *)*MEMORY[0x263EF8188];
    v170[0] = MEMORY[0x263EF8330];
    v170[1] = 3221225472;
    v170[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_663;
    v170[3] = &unk_2645A6698;
    v146 = v144;
    v171 = v146;
    xpc_activity_register("com.apple.poweruiagent.reportAnalyticsRepeating", v145, v170);
    v168[0] = MEMORY[0x263EF8330];
    v168[1] = 3221225472;
    v168[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_666;
    v168[3] = &unk_2645A6698;
    v147 = v146;
    v169 = v147;
    xpc_activity_register("com.apple.poweruiagent.reportMonthlyAnalytics", v145, v168);
    v166[0] = MEMORY[0x263EF8330];
    v166[1] = 3221225472;
    v166[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_667;
    v166[3] = &unk_2645A6698;
    v148 = v147;
    v167 = v148;
    xpc_activity_register("com.apple.poweruiagent.reportBatteryHealthMetrics", v145, v166);
    if ([v148 isMCLSupported])
    {
      v164[0] = MEMORY[0x263EF8330];
      v164[1] = 3221225472;
      v164[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_668;
      v164[3] = &unk_2645A6698;
      v165 = v148;
      xpc_activity_register("com.apple.poweruiagent.evaluateRecommendedLimit", v145, v164);
    }
    else
    {
      xpc_activity_unregister("com.apple.poweruiagent.evaluateRecommendedLimit");
    }
    +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:@"End of smartChargeManager init"];

    objc_destroyWeak(&v244);
    objc_destroyWeak(&location);
  }
  return (PowerUISmartChargeManager *)v11;
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v1 = objc_loadWeakRetained(&to);

  if (v1)
  {
    id v2 = objc_loadWeakRetained(&to);
    uint64_t v3 = [v2 modelTwoStagePredictor];
    [v3 loadTrial];
  }
  objc_destroyWeak(&to);
}

uint64_t __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_3(uint64_t a1)
{
  if (+[PowerUISmartChargeUtilities isInternalBuild])
  {
    id v2 = +[PowerUINotificationManager sharedInstance];
    [v2 cancelNotificationRequestWithIdentifier:@"com.apple.powerui.note.location"];
  }
  uint64_t v3 = [MEMORY[0x263F08AB0] processInfo];
  int v4 = [v3 isLowPowerModeEnabled];

  BOOL v5 = *(void **)(a1 + 32);
  if (v4)
  {
    [v5 forceDEoCReevaluation];
  }
  else if ([v5 isExternalConnected])
  {
    [*(id *)(a1 + 32) evaluateIfDesktopDevice];
  }
  uint64_t v6 = *(void **)(a1 + 32);
  return [v6 handleCallback];
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_22135E000, v1, OS_LOG_TYPE_DEFAULT, "Language preference has changed, exit daemon!", v2, 2u);
  }

  exit(0);
}

uint64_t __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_618(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  return [*(id *)(a1 + 32) handleNewBatteryLevel:state64 % 0x64 whileExternalConnected:state64 > 0x64 fullyCharged:0];
}

uint64_t __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_619(uint64_t a1)
{
  [*(id *)(a1 + 32) loadDefaults];
  id v2 = *(void **)(a1 + 32);
  return [v2 handleCallback];
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_3_621(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = [*(id *)(a1 + 32) monitors];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v13;
    *(void *)&long long v4 = 138412546;
    long long v11 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        BOOL v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        int v9 = objc_msgSend(*(id *)(a1 + 32), "log", v11);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = [v8 requiredFullChargeDate];
          *(_DWORD *)long long buf = v11;
          uint64_t v17 = v8;
          __int16 v18 = 2112;
          int v19 = v10;
          _os_log_impl(&dword_22135E000, v9, OS_LOG_TYPE_DEFAULT, "%@ requires full charge by %@", buf, 0x16u);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v5);
  }
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_623(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  if (state64 == 42)
  {
    uint64_t v3 = +[PowerUINotificationManager sharedInstance];
    [v3 removeAllNotifications];
  }
  else
  {
    long long v4 = *(void **)(a1 + 32);
    if (v4[17])
    {
      [v4 postOBCNotificationWithTopOff:state64 != 0];
    }
    else
    {
      uint64_t v5 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:21600.0];
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void **)(v6 + 136);
      *(void *)(v6 + 136) = v5;

      [*(id *)(a1 + 32) postOBCNotificationWithTopOff:state64 != 0];
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = *(void **)(v8 + 136);
      *(void *)(v8 + 136) = 0;
    }
  }
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_625(uint64_t a1)
{
  id v2 = +[PowerUINotificationManager sharedInstance];
  [v2 removeAllNotifications];

  id v7 = +[PowerUINotificationManager sharedInstance];
  uint64_t v3 = *(void **)(a1 + 32);
  long long v4 = [MEMORY[0x263EFF910] date];
  uint64_t v5 = [v3 smartTopOffFailureNotificationAtBatteryLevel:42 withDate:v4];
  id v6 = (id)[v7 postNotificationWithRequest:v5];
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_3_627(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  char v2 = [*(id *)(*(void *)(a1 + 32) + 368) fetchCurrentMitigationState];
  uint64_t v3 = *(void *)(a1 + 32);
  long long v4 = *(void **)(v3 + 96);
  if (v2)
  {
    if (os_log_type_enabled(*(os_log_t *)(v3 + 96), OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 368);
      id v6 = v4;
      v10[0] = 67109120;
      v10[1] = [v5 mitigationsCurrentlyEnabled];
      _os_log_impl(&dword_22135E000, v6, OS_LOG_TYPE_DEFAULT, "Gauging mitigation state changed, new state: %d", (uint8_t *)v10, 8u);
    }
    if ([*(id *)(*(void *)(a1 + 32) + 368) mitigationsCurrentlyEnabled]) {
      [*(id *)(a1 + 32) updateCurrentDEoCStatusAsGaugingMitigated];
    }
    if (+[PowerUISmartChargeUtilities isPluggedInWithContext:*(void *)(*(void *)(a1 + 32) + 48)])
    {
      int v7 = [*(id *)(*(void *)(a1 + 32) + 368) mitigationsCurrentlyEnabled];
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      if (v7)
      {
        [v8 setCheckpoint:6 withSelector:v9];
        [*(id *)(a1 + 32) clearAllNotificationState];
      }
      else
      {
        [v8 setCheckpoint:0 withSelector:v9];
      }
      [*(id *)(a1 + 32) handleCallback:1];
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(v3 + 96), OS_LOG_TYPE_DEBUG))
  {
    __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_3_627_cold_1();
  }
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_629(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  char v2 = +[PowerUISmartChargeUtilities historicalFullChargeDurationStartingAt:80 withMinimumPluginDuration:1200];
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    long long v4 = v3;
    [v2 percentile:0.95];
    int v6 = 138412546;
    int v7 = v2;
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    _os_log_impl(&dword_22135E000, v4, OS_LOG_TYPE_DEFAULT, "Durations are %@, and 95th percentile is %.0lf", (uint8_t *)&v6, 0x16u);
  }
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_631(uint64_t a1)
{
  id v4 = +[PowerUINotificationManager sharedInstance];
  char v2 = [*(id *)(a1 + 32) mcmActiveNotificationRequest];
  id v3 = (id)[v4 postNotificationWithRequest:v2];
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_633(uint64_t a1)
{
  char v2 = +[PowerUINotificationManager sharedInstance];
  [v2 removeAllNotifications];

  id v5 = +[PowerUINotificationManager sharedInstance];
  id v3 = [*(id *)(a1 + 32) genericOBCFailureNotification:@"TTR Debugging"];
  id v4 = (id)[v5 postNotificationWithRequest:v3];
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_3_638(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 312);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v15;
    *(void *)&long long v4 = 138412290;
    long long v13 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        __int16 v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v8, "signalID", v13, (void)v14) == 4)
        {
          id v9 = v8;
          uint64_t v10 = *(NSObject **)(*(void *)(a1 + 32) + 96);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v11 = v10;
            long long v12 = [v9 requiredFullChargeDate];
            *(_DWORD *)long long buf = v13;
            int v19 = v12;
            _os_log_impl(&dword_22135E000, v11, OS_LOG_TYPE_DEFAULT, "Required full charge date from location monitor: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v5);
  }
}

uint64_t __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_640(uint64_t a1)
{
  return [*(id *)(a1 + 32) reportMonthlyData];
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_642(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSNumber;
    long long v4 = *(void **)(a1 + 32);
    uint64_t v5 = v2;
    uint64_t v6 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isDEoCSupported"));
    int v7 = objc_msgSend(NSNumber, "numberWithBool:", +[PowerUISmartChargeUtilities isDEoCDryRunSupported](PowerUISmartChargeUtilities, "isDEoCDryRunSupported"));
    __int16 v8 = [NSNumber numberWithBool:MGGetBoolAnswer()];
    int v9 = 138412802;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    long long v12 = v7;
    __int16 v13 = 2112;
    long long v14 = v8;
    _os_log_impl(&dword_22135E000, v5, OS_LOG_TYPE_DEFAULT, "DEoC Supported: %@ - DEoC DryRun Supported: %@ - BOOL answer: %@", (uint8_t *)&v9, 0x20u);
  }
}

uint64_t __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_647(uint64_t a1)
{
  return [*(id *)(a1 + 32) forceDEoCReevaluation];
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_649(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 408) printExistingEvents];
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 408);
    long long v4 = (void *)MEMORY[0x263EFF910];
    uint64_t v5 = v2;
    uint64_t v6 = [v4 distantPast];
    int v7 = [v3 chargingStatisticsSince:v6];
    int v14 = 138412290;
    uint64_t v15 = v7;
    _os_log_impl(&dword_22135E000, v5, OS_LOG_TYPE_DEFAULT, "chargingStatisticsSince: %@", (uint8_t *)&v14, 0xCu);
  }
  __int16 v8 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_22135E000, v8, OS_LOG_TYPE_DEFAULT, "Get charging statistics since last charge session", (uint8_t *)&v14, 2u);
  }
  int v9 = +[PowerUISmartChargeUtilities lastPluggedInDate];
  uint64_t v10 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = *(void **)(*(void *)(a1 + 32) + 408);
    long long v12 = v10;
    __int16 v13 = [v11 chargingStatisticsSince:v9];
    int v14 = 138412290;
    uint64_t v15 = v13;
    _os_log_impl(&dword_22135E000, v12, OS_LOG_TYPE_DEFAULT, "chargingStatistics since last charge session: %@", (uint8_t *)&v14, 0xCu);
  }
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_651(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_22135E000, v2, OS_LOG_TYPE_DEFAULT, "Charge sessions WITHOUT filtering debounces:", buf, 2u);
  }
  uint64_t v3 = [MEMORY[0x263EFF910] date];
  [*(id *)(*(void *)(a1 + 32) + 296) minInputChargeDuration];
  long long v4 = +[PowerUISmartChargeUtilities pluginEventsBefore:withMinimumDuration:ignoringDisconnectsShorterThan:](PowerUISmartChargeUtilities, "pluginEventsBefore:withMinimumDuration:ignoringDisconnectsShorterThan:", v3);

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v35;
    *(void *)&long long v7 = 138412546;
    long long v29 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v5);
        }
        __int16 v11 = *(NSObject **)(*(void *)(a1 + 32) + 96);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          long long v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          __int16 v13 = v11;
          int v14 = [v12 startDate];
          uint64_t v15 = [v12 endDate];
          *(_DWORD *)long long buf = v29;
          uint64_t v40 = v14;
          __int16 v41 = 2112;
          uint64_t v42 = v15;
          _os_log_impl(&dword_22135E000, v13, OS_LOG_TYPE_DEFAULT, "  start: %@ - end %@", buf, 0x16u);
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v8);
  }

  uint64_t v16 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_22135E000, v16, OS_LOG_TYPE_DEFAULT, "Charge sessions WITH filtering debounces:", buf, 2u);
  }
  long long v17 = objc_msgSend(MEMORY[0x263EFF910], "date", v29);
  [*(id *)(*(void *)(a1 + 32) + 296) minInputChargeDuration];
  __int16 v18 = +[PowerUISmartChargeUtilities pluginEventsBefore:withMinimumDuration:ignoringDisconnectsShorterThan:](PowerUISmartChargeUtilities, "pluginEventsBefore:withMinimumDuration:ignoringDisconnectsShorterThan:", v17);

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v19 = v18;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(NSObject **)(*(void *)(a1 + 32) + 96);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = *(void **)(*((void *)&v30 + 1) + 8 * j);
          uint64_t v26 = v24;
          uint64_t v27 = [v25 startDate];
          int v28 = [v25 endDate];
          *(_DWORD *)long long buf = 138412546;
          uint64_t v40 = v27;
          __int16 v41 = 2112;
          uint64_t v42 = v28;
          _os_log_impl(&dword_22135E000, v26, OS_LOG_TYPE_DEFAULT, "  start: %@ - end %@", buf, 0x16u);
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v21);
  }
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_653(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 408);
    long long v4 = (void *)MEMORY[0x263EFF910];
    id v5 = v2;
    uint64_t v6 = [v4 distantPast];
    long long v7 = [v3 gaugingMitigationStatisticsSince:v6];
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl(&dword_22135E000, v5, OS_LOG_TYPE_DEFAULT, "gaugingMitigationStatisticsSince: %@", (uint8_t *)&v8, 0xCu);
  }
}

uint64_t __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_655(uint64_t a1)
{
  return [*(id *)(a1 + 32) evaluateChargeLimitRecommendationForced:1];
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_657(uint64_t a1)
{
  id v3 = +[PowerUINotificationManager sharedInstance];
  id v2 = (id)objc_msgSend(v3, "postChargeLimitRecommendationWithLimit:", objc_msgSend(*(id *)(a1 + 32), "getUISoCChargeLimit"));
}

uint64_t __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_3_659(uint64_t a1)
{
  return [*(id *)(a1 + 32) tempDisableMCL];
}

uint64_t __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_4_661(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkWhetherMCLTempDisablementCanBeClearedOnPlugin:0];
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_5(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    long long v4 = v2;
    id v5 = [v3 powerLogStatus];
    int v8 = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_22135E000, v4, OS_LOG_TYPE_DEFAULT, "Writing to PowerLog %@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v6 = (void *)MEMORY[0x223C80A30]();
  long long v7 = [*(id *)(a1 + 32) powerLogStatus];
  PLLogRegisteredEvent();
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_663(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    long long v4 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_664;
    block[3] = &unk_2645A5CF0;
    id v6 = *(id *)(a1 + 32);
    dispatch_async(v4, block);
  }
  else if (!state && os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 96), OS_LOG_TYPE_DEBUG))
  {
    __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_663_cold_1();
  }
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_664(uint64_t a1)
{
  id v2 = +[PowerUISmartChargeUtilities readDictForPreferenceKey:@"AggDStatus" inDomain:*(void *)(*(void *)(a1 + 32) + 56)];
  [*(id *)(a1 + 32) reportAggDKeys:v2];
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_666(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    long long v4 = *(void **)(a1 + 32);
    [v4 reportMonthlyData];
  }
  else if (!state && os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 96), OS_LOG_TYPE_DEBUG))
  {
    __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_666_cold_1();
  }
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_667(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    long long v4 = *(void **)(a1 + 32);
    [v4 reportBatteryHealthMetrics];
  }
  else if (!state && os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 96), OS_LOG_TYPE_DEBUG))
  {
    __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_667_cold_1();
  }
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_668(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 96);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_22135E000, v5, OS_LOG_TYPE_DEFAULT, "Running EvaluateRecommendedLimitActivity", v6, 2u);
    }
    [*(id *)(a1 + 32) evaluateChargeLimitRecommendationForced:0];
  }
  else if (!state)
  {
    long long v4 = *(NSObject **)(*(void *)(a1 + 32) + 96);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_22135E000, v4, OS_LOG_TYPE_DEFAULT, "EvaluateRecommendedLimitActivity checking in!", buf, 2u);
    }
  }
}

+ (id)manager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__PowerUISmartChargeManager_manager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (manager_onceToken != -1) {
    dispatch_once(&manager_onceToken, block);
  }
  id v2 = (void *)manager_manager;
  return v2;
}

void __36__PowerUISmartChargeManager_manager__block_invoke()
{
  id v0 = objc_alloc((Class)objc_opt_class());
  id v3 = [MEMORY[0x263F351B8] userContext];
  uint64_t v1 = [v0 initWithDefaultsDomain:@"com.apple.smartcharging.topoffprotection" contextStore:v3 beforeHandlingBatteryChangeCallback:0 afterHandlingBatteryChangeCallback:0];
  id v2 = (void *)manager_manager;
  manager_manager = v1;
}

- (void)handleXPCActivityOnBoot
{
  id v2 = (void *)*MEMORY[0x263EF8188];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __52__PowerUISmartChargeManager_handleXPCActivityOnBoot__block_invoke;
  handler[3] = &unk_2645A6698;
  void handler[4] = self;
  xpc_activity_register("com.apple.poweruiagent.runOnBoot", v2, handler);
}

void __52__PowerUISmartChargeManager_handleXPCActivityOnBoot__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_activity_get_state(v3) && xpc_activity_get_state(v3) == 2)
  {
    long long v4 = *(NSObject **)(*(void *)(a1 + 32) + 96);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_22135E000, v4, OS_LOG_TYPE_DEFAULT, "Activity run on boot!", v5, 2u);
    }
    [*(id *)(*(void *)(a1 + 32) + 296) deleteCompiledModels];
  }
}

- (void)loadCheckpoint
{
  id v3 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"checkpoint"];
  self->_unint64_t checkpoint = [v3 unsignedIntegerValue];

  long long v4 = [NSNumber numberWithUnsignedInteger:self->_checkpoint];
  [(_CDLocalContext *)self->_context setObject:v4 forKeyedSubscript:self->_checkpointKP];

  if (self->_checkpoint == 2)
  {
    [(PowerUISmartChargeManager *)self startAllMonitoring];
    if (!self->_isDesktopDevice && self->_manualChargeLimitStatus != 1)
    {
      id v5 = +[PowerUINotificationManager sharedInstance];
      id v6 = [v5 getDeliveredNotifications];

      if (![v6 count])
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int v8 = 0;
          _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Top-Off Detected and no notification delivered. Provide non-obvious notification", v8, 2u);
        }
        [(PowerUISmartChargeManager *)self postOBCNotificationWithTopOff:0];
      }
    }
  }
}

- (id)checkpointNameFromCheckpoint:(unint64_t)a3
{
  if (a3 - 1 > 0xA) {
    return @"None";
  }
  else {
    return off_2645A6C68[a3 - 1];
  }
}

- (void)setCheckpoint:(unint64_t)a3 withSelector:(SEL)a4
{
}

- (void)setCheckpoint:(unint64_t)a3 withSelector:(SEL)a4 forceWrite:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v9 = (void *)os_transaction_create();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = log;
    long long v12 = NSStringFromSelector(a4);
    *(_DWORD *)long long buf = 134218242;
    unint64_t v22 = a3;
    __int16 v23 = 2112;
    uint64_t v24 = v12;
    _os_log_impl(&dword_22135E000, v11, OS_LOG_TYPE_DEFAULT, "Set Checkpoint: %llu from %@", buf, 0x16u);
  }
  __int16 v13 = (void *)MEMORY[0x223C80A30]();
  if (self->_checkpoint != a3 || v5)
  {
    uint64_t v15 = self->_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      unint64_t v22 = a3;
      _os_log_impl(&dword_22135E000, v15, OS_LOG_TYPE_DEFAULT, "Saving Checkpoint: %llu to defaults", buf, 0xCu);
    }
    uint64_t v16 = [NSNumber numberWithUnsignedInteger:a3];
    [(PowerUISmartChargeManager *)self setNumber:v16 forPreferenceKey:@"checkpoint"];

    long long v17 = [NSNumber numberWithUnsignedInteger:a3];
    [(_CDLocalContext *)self->_context setObject:v17 forKeyedSubscript:self->_checkpointKP];

    self->_unint64_t checkpoint = a3;
    [(PowerUISmartChargeManager *)self setPreviousPowerLogStatus:0];
    __int16 v18 = [(PowerUISmartChargeManager *)self checkpointNameFromCheckpoint:a3];
    id v19 = [v18 lowercaseString];

    uint64_t v20 = [NSString stringWithFormat:@"com.apple.das.smartcharging.%@", v19];
    ADClientSetValueForScalarKey();
    if (a3 >= 9) {
      [(PowerUISmartChargeManager *)self promptBDCToQueryCurrentState];
    }
  }
}

- (void)setNumber:(id)a3 forPreferenceKey:(id)a4
{
}

- (id)readNumberForPreferenceKey:(id)a3
{
  id v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)self->_defaultsDomain);
  return v3;
}

- (void)setDate:(id)a3 forPreferenceKey:(id)a4
{
  key = (__CFString *)a4;
  if (a3)
  {
    id v6 = NSNumber;
    [a3 timeIntervalSinceReferenceDate];
    long long v7 = (const void *)objc_msgSend(v6, "numberWithDouble:");
  }
  else
  {
    long long v7 = 0;
  }
  CFPreferencesSetAppValue(key, v7, (CFStringRef)self->_defaultsDomain);
}

- (void)setString:(id)a3 forPreferenceKey:(id)a4
{
}

- (id)readDateForPreferenceKey:(id)a3
{
  id v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)self->_defaultsDomain);
  long long v4 = v3;
  if (v3)
  {
    BOOL v5 = (void *)MEMORY[0x263EFF910];
    [v3 doubleValue];
    id v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)readStringForPreferenceKey:(id)a3
{
  id v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)self->_defaultsDomain);
  return v3;
}

- (id)eligibleEngagementIntervalFromTimelineEvents:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  BOOL v5 = (void *)[v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v5)
  {
    int v28 = self;
    double v6 = 1.79769313e308;
    uint64_t v7 = *(void *)v30;
    double v8 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        __int16 v11 = [v10 objectForKeyedSubscript:@"event"];
        int v12 = [v11 isEqualToString:@"EligibleForIdle"];

        if (v12)
        {
          __int16 v13 = [v10 objectForKeyedSubscript:@"date"];
          [v13 doubleValue];
          double v15 = v14;

          if (v15 < v8 && v15 > 0.0) {
            double v8 = v15;
          }
        }
        else
        {
          long long v17 = [v10 objectForKeyedSubscript:@"event"];
          int v18 = [v17 isEqualToString:@"Unplug"];

          if (v18)
          {
            id v19 = [v10 objectForKeyedSubscript:@"date"];
            [v19 doubleValue];
            double v21 = v20;

            if (v21 < v6 && v21 > 0.0) {
              double v6 = v21;
            }
          }
        }
      }
      BOOL v5 = (void *)[v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v5);
    if (v6 != 1.79769313e308 && v8 <= v6)
    {
      double empiricalTimeToFullChargeDurationMinutes = v28->_empiricalTimeToFullChargeDurationMinutes;
      if (empiricalTimeToFullChargeDurationMinutes <= 2.22507386e-308) {
        double v24 = 5400.0;
      }
      else {
        double v24 = empiricalTimeToFullChargeDurationMinutes * 60.0;
      }
      id v25 = objc_alloc(MEMORY[0x263F08798]);
      uint64_t v26 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v8];
      BOOL v5 = objc_msgSend(v25, "initWithStartDate:duration:", v26, fmax(v6 - v8 - v24, 0.0));
    }
  }

  return v5;
}

- (void)_submitEngagementEventWithBatteryLevel:(id)a3 eventType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = +[PowerUIAnalyticsManager obcModeOfOperationToBiomeModeOfOperation:[(PowerUISmartChargeManager *)self currentModeOfOperation]];
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PowerUISmartChargeManager currentChargeLimit](self, "currentChargeLimit"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  analyticsManager = self->_analyticsManager;
  uint64_t v9 = [(PowerUISmartChargeManager *)self fullChargeDeadline];
  [(PowerUIAnalyticsManager *)analyticsManager submitEngagementEventWithBatteryLevel:v6 targetSoC:v10 predictedEndOfCharge:v9 modeOfOperation:v7 eventType:v4];
}

- (void)pluginTimelineAddEvent:(id)a3 atDate:(id)a4 withBatteryLevel:(unint64_t)a5
{
  v19[3] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [NSNumber numberWithUnsignedInteger:a5];
  [(PowerUISmartChargeManager *)self _submitEngagementEventWithBatteryLevel:v10 eventType:+[PowerUIAnalyticsManager convertTimelineStringToOBCEvent:v8]];

  __int16 v11 = (void *)CFPreferencesCopyAppValue(@"timeline", (CFStringRef)self->_defaultsDomain);
  int v12 = (void *)[v11 mutableCopy];

  if (!v12)
  {
    int v12 = [MEMORY[0x263EFF980] array];
  }
  v19[0] = v8;
  v18[0] = @"event";
  v18[1] = @"date";
  __int16 v13 = NSNumber;
  [v9 timeIntervalSinceReferenceDate];
  double v14 = objc_msgSend(v13, "numberWithDouble:");
  v19[1] = v14;
  v18[2] = @"batteryLevel";
  double v15 = [NSNumber numberWithUnsignedInteger:a5];
  v19[2] = v15;
  uint64_t v16 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
  [v12 addObject:v16];

  long long v17 = (void *)[v12 copy];
  CFPreferencesSetAppValue(@"timeline", v17, (CFStringRef)self->_defaultsDomain);
}

- (void)clearPluginTimeline
{
  value = (void *)CFPreferencesCopyAppValue(@"timeline", (CFStringRef)self->_defaultsDomain);
  id v3 = -[PowerUISmartChargeManager eligibleEngagementIntervalFromTimelineEvents:](self, "eligibleEngagementIntervalFromTimelineEvents:");
  [v3 duration];
  if (v4 >= 4500.0) {
    CFPreferencesSetAppValue(@"timeline.archive", value, (CFStringRef)self->_defaultsDomain);
  }
  CFPreferencesSetAppValue(@"timeline", 0, (CFStringRef)self->_defaultsDomain);
}

- (void)reportMonthlyData
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = (void *)os_transaction_create();
  if (self->_enabled || [(PowerUISmartChargeManager *)self isMCLSupported])
  {
    double v4 = [(PowerUISmartChargeManager *)self readDateForPreferenceKey:@"MonthlyDataReportedDate"];
    BOOL v5 = [MEMORY[0x263EFF910] date];
    id v6 = v5;
    if (v4 && ([v5 timeIntervalSinceDate:v4], v7 < 2592000.0))
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        double v14 = v4;
        _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Considered submitting monthly OBC analytics, but not enough time has passed since last submission: %@", buf, 0xCu);
      }
    }
    else
    {
      [(PowerUISmartChargeManager *)self sendLegacyData];
      id v12 = v4;
      AnalyticsSendEventLazy();
      id v9 = [(PowerUIAnalyticsManager *)self->_analyticsManager gaugingMitigationStatisticsSince:v12];
      id v10 = [NSNumber numberWithUnsignedInteger:self->_manualChargeLimitStatus];
      [v9 setObject:v10 forKeyedSubscript:@"CurrentMCLEnabled"];

      id v11 = v9;
      AnalyticsSendEventLazy();
    }
  }
}

uint64_t __46__PowerUISmartChargeManager_reportMonthlyData__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) chargingStatisticsSince:*(void *)(a1 + 40)];
}

id __46__PowerUISmartChargeManager_reportMonthlyData__block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)sendLegacyData
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  double v4 = [NSNumber numberWithUnsignedInteger:self->_deocFeatureState];
  [v3 setObject:v4 forKeyedSubscript:@"currentDEoCState"];

  BOOL v5 = [NSNumber numberWithUnsignedInteger:self->_manualChargeLimitStatus];
  [v3 setObject:v5 forKeyedSubscript:@"currentMCLState"];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Reporting monthly metrics to CoreAnalytics %@", buf, 0xCu);
  }
  double v7 = [MEMORY[0x263EFF910] date];
  [(PowerUISmartChargeManager *)self setDate:v7 forPreferenceKey:@"MonthlyDataReportedDate"];

  id v9 = v3;
  id v8 = v3;
  AnalyticsSendEventLazy();
}

id __43__PowerUISmartChargeManager_sendLegacyData__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)sendHistoricalDEoCEngagementEventToCA:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

id __67__PowerUISmartChargeManager_sendHistoricalDEoCEngagementEventToCA___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)reportBatteryHealthMetrics
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = +[PowerUISmartChargeUtilities batteryProperties];
  BOOL v5 = [v4 objectForKey:@"CycleCount"];
  [v3 setObject:v5 forKeyedSubscript:@"CycleCount"];
  double v21 = v5;
  double v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 50 * (objc_msgSend(v5, "unsignedIntegerValue") / 0x32uLL));
  objc_msgSend(v3, "setObject:forKeyedSubscript:");
  id v6 = [v4 objectForKey:@"BatteryData"];
  uint64_t v7 = [v6 objectForKey:@"ChemID"];

  id v19 = (void *)v7;
  [v3 setObject:v7 forKeyedSubscript:@"BatteryChemID"];
  id v8 = [v4 objectForKey:@"BatteryData"];
  id v9 = [v8 objectForKey:@"ChemicalWeightedRa"];

  [v3 setObject:v9 forKeyedSubscript:@"ChemicalWeightedRa"];
  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 50 * (objc_msgSend(v9, "unsignedIntegerValue") / 0x32uLL));
  [v3 setObject:v10 forKeyedSubscript:@"ChemicalWeightedRaBuckets"];
  uint64_t v11 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"com.apple.das.smartcharging.analytics.countChargeSessionsEngaged"];
  if (v11) {
    uint64_t v12 = (void *)v11;
  }
  else {
    uint64_t v12 = &unk_26D385618;
  }
  [v3 setObject:v12 forKeyedSubscript:@"LifetimeEngagements"];
  __int16 v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 25 * (objc_msgSend(v12, "unsignedIntegerValue") / 0x19uLL));
  [v3 setObject:v13 forKeyedSubscript:@"LifetimeEngagementsBuckets"];
  uint64_t v14 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"com.apple.das.smartcharging.analytics.countMinutesIdled"];
  if (v14) {
    uint64_t v15 = (void *)v14;
  }
  else {
    uint64_t v15 = &unk_26D385618;
  }
  [v3 setObject:v15 forKeyedSubscript:@"LifetimeIdleDurationMins"];
  uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 100 * (objc_msgSend(v15, "unsignedIntegerValue") / 0x1770uLL));
  [v3 setObject:v16 forKeyedSubscript:@"LifetimeIdleDurationMinsBuckets"];
  id v17 = v3;
  AnalyticsSendEventLazy();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v23 = v17;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Reported battery health metrics to CoreAnalytics %@", buf, 0xCu);
  }
}

id __55__PowerUISmartChargeManager_reportBatteryHealthMetrics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (double)idleDurationWithEngagedCheckpoints:(id)a3 withTopOffStartCheckpoints:(id)a4 withDisabledCheckpoints:(id)a5 withTopOffStart:(id)a6 withIdleStart:(id)a7 withTemporarilyDisabledStart:(id)a8 withPluginEnd:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  unint64_t v22 = v21;
  if (v18 && v19)
  {
    [v18 timeIntervalSinceDate:v19];
    double v24 = v23;
    if (v23 < 0.0)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        -[PowerUISmartChargeManager idleDurationWithEngagedCheckpoints:withTopOffStartCheckpoints:withDisabledCheckpoints:withTopOffStart:withIdleStart:withTemporarilyDisabledStart:withPluginEnd:](log);
      }
    }
  }
  else if (v19 && v20)
  {
    [v20 timeIntervalSinceDate:v19];
    double v24 = v26;
    if (v26 < 0.0)
    {
      uint64_t v27 = self->_log;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[PowerUISmartChargeManager idleDurationWithEngagedCheckpoints:withTopOffStartCheckpoints:withDisabledCheckpoints:withTopOffStart:withIdleStart:withTemporarilyDisabledStart:withPluginEnd:](v27);
      }
    }
  }
  else
  {
    double v24 = 0.0;
    if (v19)
    {
      if (v21)
      {
        [v21 timeIntervalSinceDate:v19];
        double v24 = v28;
        if (v28 < 0.0)
        {
          long long v29 = self->_log;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            -[PowerUISmartChargeManager idleDurationWithEngagedCheckpoints:withTopOffStartCheckpoints:withDisabledCheckpoints:withTopOffStart:withIdleStart:withTemporarilyDisabledStart:withPluginEnd:](v29);
          }
        }
      }
    }
  }
  BOOL v30 = +[PowerUISmartChargeUtilities isInternalBuild];
  if (v24 < 0.0 && v30)
  {
    long long v31 = +[PowerUINotificationManager sharedInstance];
    long long v32 = [(PowerUISmartChargeManager *)self genericOBCFailureNotification:@"negative idle duration"];
    id v33 = (id)[v31 postNotificationWithRequest:v32];
  }
  return v24;
}

- (double)totalTopOffDurationWithTopOffStartCheckpoints:(id)a3 withFullyChargedCheckpoints:(id)a4 withTopOffStart:(id)a5 withFullyChargedDate:(id)a6 withPluginEnd:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v13 && (v16 = v14) != 0 || (double v17 = 0.0, v13) && (v16 = v15) != 0)
  {
    [v16 timeIntervalSinceDate:v13];
    double v17 = v18;
  }

  return v17;
}

- (double)totalTemporarilyDisabledHours:(id)a3 withEngagements:(id)a4 withPluginEnd:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v33 = a5;
  uint64_t v9 = [v8 count];
  uint64_t v10 = [v7 count];
  uint64_t v11 = v10 - 1;
  if (v10 - 1 >= 0)
  {
    uint64_t v12 = v10;
    uint64_t v13 = v9 - 1;
    double v14 = 0.0;
    while (1)
    {
      uint64_t v15 = v11;
      id v16 = [v7 objectAtIndexedSubscript:v11];
      double v17 = [v16 objectForKeyedSubscript:@"date"];
      [v17 doubleValue];
      double v19 = v18;

      id v20 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v19];
      if ((v13 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_14:

      uint64_t v11 = v15 - 1;
      uint64_t v12 = v15;
      if (v15 <= 0) {
        goto LABEL_20;
      }
    }
    uint64_t v34 = v16;
    id v21 = 0;
    double v22 = 0.0;
    while (1)
    {
      double v23 = v21;
      double v24 = [v8 objectAtIndexedSubscript:v13];
      id v25 = [v24 objectForKeyedSubscript:@"date"];
      [v25 doubleValue];
      double v27 = v26;

      id v21 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v27];

      [v21 timeIntervalSinceDate:v20];
      if (v28 <= 0.0) {
        break;
      }
      double v29 = v28;

      double v22 = v29;
      if (v13-- <= 0)
      {
        uint64_t v13 = -1;
        id v16 = v34;
        goto LABEL_13;
      }
    }
    if (v22 == 0.0)
    {
      if (v33)
      {
        id v16 = v34;
        if (v12 == [v7 count])
        {
          [v33 timeIntervalSinceDate:v20];
          double v14 = v14 + v31;
        }
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
    }
    else
    {
      double v14 = v14 + v22;
    }
    id v16 = v34;
    goto LABEL_12;
  }
  double v14 = 0.0;
LABEL_20:

  return v14;
}

- (id)cloakingMetrics:(id)a3 withIdleCheckpoints:(id)a4 withIdleStart:(id)a5 withTopOffStart:(id)a6 withPluginEnd:(id)a7
{
  id v43 = a3;
  id v11 = a4;
  id v45 = a5;
  id v46 = a6;
  id v44 = a7;
  if ([v11 count])
  {
    unint64_t v12 = 0;
    LODWORD(v13) = 0;
    LODWORD(v14) = 0;
    double v15 = 0.0;
    unint64_t v16 = 0x263EFF000uLL;
    double v17 = 0.0;
    do
    {
      double v18 = [v11 objectAtIndexedSubscript:v12];
      double v19 = [v18 objectForKeyedSubscript:@"event"];
      id v20 = [v18 objectForKeyedSubscript:@"date"];
      [v20 doubleValue];
      double v22 = v21;

      double v23 = [*(id *)(v16 + 2320) dateWithTimeIntervalSinceReferenceDate:v22];
      int v47 = [v19 isEqualToString:@"EngagedFloor"];
      if (v12)
      {
        [v11 objectAtIndexedSubscript:v12 - 1];
        v25 = id v24 = v11;
        double v26 = [v25 objectForKeyedSubscript:@"date"];
        [v26 doubleValue];
        double v28 = v27;

        double v29 = [*(id *)(v16 + 2320) dateWithTimeIntervalSinceReferenceDate:v28];
        int v30 = [v19 isEqualToString:@"EngagedFloor"];
        [v23 timeIntervalSinceDate:v29];
        if (v30) {
          double v32 = -0.0;
        }
        else {
          double v32 = v31;
        }
        double v17 = v17 + v32;
        if (!v30) {
          double v31 = -0.0;
        }
        double v15 = v15 + v31;

        id v11 = v24;
      }
      else if (v45)
      {
        objc_msgSend(v23, "timeIntervalSinceDate:");
        double v15 = v15 + v33;
      }
      if ([v11 count] == ++v12)
      {
        unint64_t v16 = 0x263EFF000;
        if ([v19 isEqualToString:@"EngagedFloor"])
        {
          uint64_t v34 = v46;
          if (v46 || (uint64_t v34 = v44) != 0)
          {
            [v34 timeIntervalSinceDate:v23];
            double v17 = v17 + v35;
          }
        }
        else
        {
          long long v36 = v46;
          if (v46 || (long long v36 = v44) != 0)
          {
            [v36 timeIntervalSinceDate:v23];
            double v15 = v15 + v37;
          }
        }
      }
      else
      {
        unint64_t v16 = 0x263EFF000;
      }
      uint64_t v14 = v14 + (v47 ^ 1);
      uint64_t v13 = (v13 + v47);
    }
    while ([v11 count] > v12);
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v13 = 0;
    double v17 = 0.0;
    double v15 = 0.0;
  }
  uint64_t v38 = [NSNumber numberWithInt:v13];
  [v43 setObject:v38 forKeyedSubscript:@"DrainedToFloorCount"];

  unsigned int v39 = [NSNumber numberWithInt:v14];
  [v43 setObject:v39 forKeyedSubscript:@"ToppedOffToCeilingCount"];

  uint64_t v40 = [NSNumber numberWithDouble:v17];
  [v43 setObject:v40 forKeyedSubscript:@"CloakingTopOffToCeilingDuration"];

  if (v15 == 0.0) {
    [v43 objectForKeyedSubscript:@"IdleDuration"];
  }
  else {
  __int16 v41 = [NSNumber numberWithDouble:v15];
  }
  [v43 setObject:v41 forKeyedSubscript:@"DrainedDuration"];

  return v43;
}

- (id)constructAnalyticsStatusFromEvents:(id)a3
{
  uint64_t v179 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v150 = self->_enabled && !self->_temporarilyDisabled;
  id v157 = [MEMORY[0x263EFF980] array];
  BOOL isDesktopDevice = self->_isDesktopDevice;
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  id v6 = self->_log;
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v178 = v4;
    _os_log_impl(&dword_22135E000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "Events are %@", buf, 0xCu);
  }
  v161 = (void *)v5;
  v152 = self;

  long long v173 = 0u;
  long long v174 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v171 objects:v176 count:16];
  v164 = v7;
  if (v8)
  {
    uint64_t v9 = v8;
    id v153 = 0;
    id v154 = 0;
    id v155 = 0;
    uint64_t v156 = 0;
    unint64_t v151 = 0;
    id v158 = 0;
    uint64_t v159 = 0;
    id v160 = 0;
    v162 = 0;
    int v10 = 0;
    uint64_t v11 = *(void *)v172;
    unint64_t v12 = @"event";
    uint64_t v13 = @"Plugin";
    uint64_t v165 = *(void *)v172;
    while (1)
    {
      uint64_t v14 = 0;
      uint64_t v166 = v9;
      do
      {
        if (*(void *)v172 != v11) {
          objc_enumerationMutation(v7);
        }
        double v15 = *(void **)(*((void *)&v171 + 1) + 8 * v14);
        unint64_t v16 = [v15 objectForKeyedSubscript:v12];
        int v17 = [v16 isEqualToString:v13];
        if (v17 & v10)
        {
          int v10 = 1;
          goto LABEL_35;
        }
        double v18 = v13;
        id v19 = v7;
        id v20 = v12;
        v10 |= v17;
        double v21 = [v15 objectForKeyedSubscript:@"date"];
        [v21 doubleValue];
        double v23 = v22;

        id v24 = [v15 objectForKeyedSubscript:@"batteryLevel"];
        uint64_t v25 = [v24 unsignedIntegerValue];

        if (v23 <= 0.0 || v25 == 0)
        {
          unint64_t v12 = v20;
          uint64_t v11 = v165;
          uint64_t v9 = v166;
          id v7 = v19;
          uint64_t v13 = v18;
          goto LABEL_35;
        }
        double v27 = [NSString stringWithFormat:@"%@BatteryLevel", v16];
        double v28 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v23];
        uint64_t v13 = v18;
        if ([v16 isEqualToString:v18])
        {
          int v30 = v28;
          if (!v162 || ([v162 timeIntervalSinceDate:v28], v31 < 0.0))
          {
            id v32 = v28;

            double v33 = [NSNumber numberWithUnsignedInteger:v25];
            [v161 setObject:v33 forKeyedSubscript:v27];

            v162 = v32;
            int v30 = v28;
          }
          uint64_t v13 = v18;
          goto LABEL_34;
        }
        if (![v16 isEqualToString:@"EligibleForIdle"] || v160)
        {
          if ([v16 isEqualToString:@"Engaged"])
          {
            if (v158) {
              goto LABEL_33;
            }
            id v158 = v28;
            double v35 = [NSNumber numberWithUnsignedInteger:v25];
            [v161 setObject:v35 forKeyedSubscript:v27];

            int v30 = v28;
            uint64_t v156 = v25;
          }
          else
          {
            if (([v16 isEqualToString:@"EngagedFloor"] & 1) != 0
              || [v16 isEqualToString:@"EngagedCeiling"])
            {
              [v157 addObject:v15];
              goto LABEL_33;
            }
            if ([v16 isEqualToString:@"TopOff"])
            {
              int v30 = v28;
              if (v154) {
                goto LABEL_34;
              }
              id v154 = v28;
LABEL_43:
              long long v36 = [NSNumber numberWithUnsignedInteger:v25];
              [v161 setObject:v36 forKeyedSubscript:v27];

LABEL_33:
              int v30 = v28;
              goto LABEL_34;
            }
            int v30 = v28;
            if (![v16 isEqualToString:@"FullyCharged"])
            {
              if ([v16 isEqualToString:@"Unplug"] && !v153)
              {
                id v153 = v28;
                double v37 = [NSNumber numberWithUnsignedInteger:v25];
                [v161 setObject:v37 forKeyedSubscript:v27];

                int v30 = v28;
                unint64_t v151 = v25;
              }
              goto LABEL_34;
            }
            if (!v155)
            {
              id v155 = v28;
              goto LABEL_43;
            }
          }
        }
        else
        {
          id v160 = v28;
          uint64_t v34 = [NSNumber numberWithUnsignedInteger:v25];
          [v161 setObject:v34 forKeyedSubscript:v27];

          int v30 = v28;
          uint64_t v159 = v25;
        }
LABEL_34:

        unint64_t v12 = v20;
        id v7 = v164;
        uint64_t v11 = v165;
        uint64_t v9 = v166;
LABEL_35:

        ++v14;
      }
      while (v9 != v14);
      uint64_t v38 = [v7 countByEnumeratingWithState:&v171 objects:v176 count:16];
      uint64_t v9 = v38;
      if (!v38) {
        goto LABEL_50;
      }
    }
  }
  id v153 = 0;
  id v154 = 0;
  id v155 = 0;
  uint64_t v156 = 0;
  unint64_t v151 = 0;
  id v158 = 0;
  uint64_t v159 = 0;
  id v160 = 0;
  v162 = 0;
LABEL_50:

  unsigned int v39 = [NSNumber numberWithBool:isDesktopDevice];
  [v161 setObject:v39 forKeyedSubscript:@"ChargeLimited"];

  if (v152->_manualChargeLimitStatus) {
    uint64_t v40 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v40 = MEMORY[0x263EFFA80];
  }
  [v161 setObject:v40 forKeyedSubscript:@"ManualChargeLimit"];
  uint64_t v42 = v162;
  if (!v162)
  {
    uint64_t v42 = +[PowerUISmartChargeUtilities lastPluggedInDate];
  }
  if (v153 && v42)
  {
    id v43 = NSNumber;
    [v42 timeIntervalSince1970];
    id v44 = objc_msgSend(v43, "numberWithDouble:");
    [v161 setObject:v44 forKeyedSubscript:@"AnalyticsPluginDate"];

    id v45 = NSNumber;
    [v153 timeIntervalSinceDate:v42];
    id v46 = objc_msgSend(v45, "numberWithDouble:");
    [v161 setObject:v46 forKeyedSubscript:@"PluginDuration"];
  }
  if (v160) {
    BOOL v47 = v150;
  }
  else {
    BOOL v47 = 0;
  }
  unint64_t v48 = 0x263F08000uLL;
  unint64_t v49 = v151;
  if (v153 && v47)
  {
    v50 = [NSNumber numberWithUnsignedInteger:v159];
    [v161 setObject:v50 forKeyedSubscript:@"EligibleForIdleBatteryLevelScore"];

    uint64_t v51 = [(PowerUISmartChargeManager *)v152 readNumberForPreferenceKey:@"recentlyInterrupted"];
    int v52 = [v51 BOOLValue];

    if (v52)
    {
      [v161 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"recentlyInterrupted"];
      [(PowerUISmartChargeManager *)v152 setNumber:0 forPreferenceKey:@"recentlyInterrupted"];
    }
    BOOL v53 = [v161 objectForKeyedSubscript:@"PluginDuration"];
    uint64_t v54 = [v53 unsignedIntegerValue];

    if (!v54)
    {
      [v161 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"BadSession"];
LABEL_77:
      unint64_t v48 = 0x263F08000;
      goto LABEL_79;
    }
    [(PowerUISmartChargeManager *)v152 durationToFullChargeFromBatteryLevel:v159];
    double v56 = v55;
    [v153 timeIntervalSinceDate:v160];
    double v58 = v57;
    uint64_t v59 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v161 setObject:v59 forKeyedSubscript:@"TotalEligibleDuration"];

    double v60 = v58 - v56;
    double v61 = 0.0;
    if (v60 >= 0.0) {
      double v61 = v60;
    }
    v62 = [NSNumber numberWithDouble:v61];
    [v161 setObject:v62 forKeyedSubscript:@"EstimatedUsableEligibleDuration"];

    if (v155 && v154)
    {
      uint64_t v63 = v155;
LABEL_75:
      [v63 timeIntervalSinceDate:v154];
      double v65 = v64;
      v66 = objc_msgSend(NSNumber, "numberWithDouble:");
      [v161 setObject:v66 forKeyedSubscript:@"TopOffDuration"];

      unint64_t v48 = 0x263F08000uLL;
      double v41 = v58 - v65;
      if (v58 - v65 <= 0.0) {
        goto LABEL_79;
      }
      v67 = [NSNumber numberWithDouble:v41];
      [v161 setObject:v67 forKeyedSubscript:@"ActualUsableEligibleDuration"];

      goto LABEL_77;
    }
    if (v154 && v151 == 100)
    {
      uint64_t v63 = v153;
      goto LABEL_75;
    }
    v68 = [NSNumber numberWithDouble:v60];
    [v161 setObject:v68 forKeyedSubscript:@"ActualUsableEligibleDuration"];

    unint64_t v48 = 0x263F08000uLL;
  }
LABEL_79:
  -[PowerUISmartChargeManager idleDurationWithEngagedCheckpoints:withTopOffStartCheckpoints:withDisabledCheckpoints:withTopOffStart:withIdleStart:withTemporarilyDisabledStart:withPluginEnd:](v152, "idleDurationWithEngagedCheckpoints:withTopOffStartCheckpoints:withDisabledCheckpoints:withTopOffStart:withIdleStart:withTemporarilyDisabledStart:withPluginEnd:", 0, 0, 0, v154, v158, 0, v41, v153);
  double v70 = v69;
  v71 = objc_msgSend(*(id *)(v48 + 2584), "numberWithDouble:");
  [v161 setObject:v71 forKeyedSubscript:@"IdleDuration"];

  if (v70 < 0.0)
  {
    v72 = v152->_log;
    if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT)) {
      -[PowerUISmartChargeManager constructAnalyticsStatusFromEvents:]((uint64_t)v7, v72);
    }

    [v161 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"BadSession"];
  }
  v73 = [NSNumber numberWithInt:v70 > 0.0];
  [v161 setObject:v73 forKeyedSubscript:@"Engaged"];

  v74 = [v161 objectForKeyedSubscript:@"ActualUsableEligibleDuration"];
  [v74 doubleValue];
  double v76 = v75 - v70;

  if (v76 > 0.0)
  {
    v77 = [NSNumber numberWithDouble:v76];
    [v161 setObject:v77 forKeyedSubscript:@"EstimatedMissedIdleDuration"];
  }
  v78 = [(PowerUISmartChargeManager *)v152 cloakingMetrics:v161 withIdleCheckpoints:v157 withIdleStart:v158 withTopOffStart:v154 withPluginEnd:v153];

  if (v153 && v155)
  {
    double v79 = NSNumber;
    [v153 timeIntervalSinceDate:v155];
    uint64_t v80 = objc_msgSend(v79, "numberWithDouble:");
    [v78 setObject:v80 forKeyedSubscript:@"FullChargeDuration"];
  }
  if (v153 && v151)
  {
    unint64_t v49 = v151 & 0xFFFFFFFFFFFFFFFELL;
    v81 = [NSNumber numberWithUnsignedInteger:v151 & 0xFFFFFFFFFFFFFFFELL];
    [v78 setObject:v81 forKeyedSubscript:@"PluginEndBatteryLevelScore"];
  }
  if (v153 && v158)
  {
    uint64_t v82 = [v78 objectForKeyedSubscript:@"PluginDuration"];
    uint64_t v83 = [v82 unsignedIntegerValue];

    if (!v83) {
      [v78 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"BadSession"];
    }
    uint64_t v84 = MEMORY[0x263EFFA80];
    [v78 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"UnderChargedAvoidable"];
    [v78 setObject:v84 forKeyedSubscript:@"UnderChargedUnavoidable"];
    [v78 setObject:v84 forKeyedSubscript:@"UnderChargedTLC"];
    if (v49 <= 0x63)
    {
      [(PowerUISmartChargeManager *)v152 durationToFullChargeFromBatteryLevel:v156];
      double v86 = v85;
      v87 = [v78 objectForKeyedSubscript:@"TotalEligibleDuration"];
      double v88 = (double)(unint64_t)[v87 unsignedIntegerValue];

      if (v86 <= v88)
      {
        if (v152->_encounteredTLCDuringTopOff) {
          v89 = @"UnderChargedTLC";
        }
        else {
          v89 = @"UnderChargedAvoidable";
        }
      }
      else
      {
        v89 = @"UnderChargedUnavoidable";
      }
      [v78 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v89];
    }
  }
  else if (!v158)
  {
    if (!v154) {
      goto LABEL_101;
    }
    goto LABEL_100;
  }
  v145 = [NSNumber numberWithUnsignedInteger:v156 & 0xFFFFFFFFFFFFFFFELL];
  [v78 setObject:v145 forKeyedSubscript:@"IdleBatteryLevelScore"];

  v146 = [v78 objectForKeyedSubscript:@"IdleDuration"];
  uint64_t v147 = -[PowerUISmartChargeManager projectedBatteryLevelForDuration:withInitialBatteryLevel:](v152, "projectedBatteryLevelForDuration:withInitialBatteryLevel:", [v146 unsignedIntegerValue], v156 & 0xFFFFFFFFFFFFFFFELL);

  v148 = [NSNumber numberWithUnsignedInteger:v147 & 0xFFFFFFFFFFFFFFFELL];
  [v78 setObject:v148 forKeyedSubscript:@"ProjectedPluginEndBatteryLevelScore"];

  if (v154) {
LABEL_100:
  }
    [v78 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"TopOffInitiated"];
LABEL_101:
  if (v155) {
    [v78 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"FullCharged"];
  }
  if (v153 && v154 && v158)
  {
    [(PowerUISmartChargeManager *)v152 totalTopOffDurationWithTopOffStartCheckpoints:0 withFullyChargedCheckpoints:0 withTopOffStart:v154 withFullyChargedDate:v155 withPluginEnd:v153];
    v91 = [NSNumber numberWithDouble:v70 / (v70 + v90) * 100.0];
    [v78 setObject:v91 forKeyedSubscript:@"ImpactRatio"];
  }
  [v78 setObject:v152->_engagementsLastMonthBucket forKeyedSubscript:@"EngagementsLastMonthBucket"];
  [v78 setObject:v152->_lastReportedNumberOfPluginEvents forKeyedSubscript:@"NumberOfPluginEvents"];
  [v78 setObject:v152->_medianPluginLength forKeyedSubscript:@"MedianPluginLength"];
  [(NSDate *)v152->_previousDecisionMakerDate timeIntervalSinceDate:v42];
  if (v92 > 0.0)
  {
    v93 = [NSNumber numberWithInteger:v152->_previousDecisionMakerID];
    [v78 setObject:v93 forKeyedSubscript:@"DecisionMaker"];

    v94 = [(PowerUIBatteryMitigationManager *)v152->_batteryMitigationManager getGaugingMitigationDict];
    v95 = [v94 objectForKeyedSubscript:@"lastDOD0Update"];

    if (v95)
    {
      v96 = [v94 objectForKeyedSubscript:@"lastDOD0Update"];
      v97 = NSNumber;
      uint64_t v98 = [MEMORY[0x263EFF910] date];
      [v98 timeIntervalSinceDate:v96];
      v100 = [v97 numberWithDouble:v99 / 86400.0];
      [v78 setObject:v100 forKeyedSubscript:@"DaysSinceOCVUpdate"];
    }
    else
    {
      [v78 setObject:&unk_26D385618 forKeyedSubscript:@"DaysSinceOCVUpdate"];
    }
    v101 = [v94 objectForKeyedSubscript:@"lastQMaxUpdate"];

    if (v101)
    {
      v102 = [v94 objectForKeyedSubscript:@"lastQMaxUpdate"];
      v103 = NSNumber;
      v104 = [MEMORY[0x263EFF910] date];
      [v104 timeIntervalSinceDate:v102];
      v106 = [v103 numberWithDouble:v105 / 86400.0];
      [v78 setObject:v106 forKeyedSubscript:@"DaysSinceQmaxUpdate"];
    }
    else
    {
      [v78 setObject:&unk_26D385618 forKeyedSubscript:@"DaysSinceQmaxUpdate"];
    }
  }
  id v163 = v42;
  v107 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PowerUIMLTwoStageModelPredictor engagementModelVersion](v152->_modelTwoStagePredictor, "engagementModelVersion"));
  [v78 setObject:v107 forKeyedSubscript:@"EngageModelVersion"];

  v108 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PowerUIMLTwoStageModelPredictor durationModelVersion](v152->_modelTwoStagePredictor, "durationModelVersion"));
  [v78 setObject:v108 forKeyedSubscript:@"DurationModelVersion"];

  v109 = [(PowerUIMLTwoStageModelPredictor *)v152->_modelTwoStagePredictor engagementModelBoltID];
  [v78 setObject:v109 forKeyedSubscript:@"EngageModelBoltID"];

  v110 = [(PowerUIMLTwoStageModelPredictor *)v152->_modelTwoStagePredictor durationModelBoltID];
  [v78 setObject:v110 forKeyedSubscript:@"DurationModelBoltID"];

  v111 = [(PowerUITrialManager *)v152->_trialManager treatmentID];
  v112 = [v111 description];
  [v78 setObject:v112 forKeyedSubscript:@"TrackingID"];

  v113 = [(PowerUITrialManager *)v152->_trialManager experimentID];
  v114 = [v113 description];
  [v78 setObject:v114 forKeyedSubscript:@"ExperimentID"];

  v115 = [NSNumber numberWithBool:v152->_enabled];
  [v78 setObject:v115 forKeyedSubscript:@"Enabled"];

  v116 = [NSNumber numberWithBool:v152->_temporarilyDisabled];
  [v78 setObject:v116 forKeyedSubscript:@"TempDisabled"];

  v117 = [NSNumber numberWithBool:v152->_encounteredTLCDuringTopOff];
  [v78 setObject:v117 forKeyedSubscript:@"EncounteredTLC"];

  v118 = NSNumber;
  [(PowerUIMLTwoStageModelPredictor *)v152->_modelTwoStagePredictor lastEngagementResult];
  v119 = objc_msgSend(v118, "numberWithDouble:");
  [v78 setObject:v119 forKeyedSubscript:@"EngagementModelResult"];

  [(PowerUIMLTwoStageModelPredictor *)v152->_modelTwoStagePredictor threshold];
  double v121 = v120;
  [(PowerUIMLTwoStageModelPredictor *)v152->_modelTwoStagePredictor lastEngagementResult];
  double v123 = v121 - v122;
  BOOL v124 = v123 <= 0.05 && v123 > 0.0;
  v125 = [NSNumber numberWithInt:v124];
  [v78 setObject:v125 forKeyedSubscript:@"EngagementModelResultCloseBelowThreshold"];

  id v126 = NSNumber;
  [(PowerUIMLTwoStageModelPredictor *)v152->_modelTwoStagePredictor lastDurationResult];
  v127 = objc_msgSend(v126, "numberWithDouble:");
  [v78 setObject:v127 forKeyedSubscript:@"DurationModelResult"];

  int v128 = 1;
  v129 = [NSNumber numberWithInt:1];
  [v78 setObject:v129 forKeyedSubscript:@"AnalyticsVersion"];

  id v130 = [v78 objectForKeyedSubscript:@"EstimatedUsableEligibleDuration"];
  unint64_t v131 = [v130 unsignedIntegerValue];

  id v132 = [v78 objectForKeyedSubscript:@"IdleDuration"];
  unint64_t v133 = [v132 unsignedIntegerValue];

  id v134 = [v78 objectForKeyedSubscript:@"EligibleForIdleBatteryLevelScore"];
  unint64_t v135 = [v134 unsignedIntegerValue];

  long long v169 = 0u;
  long long v170 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  id v136 = v152->_monitors;
  uint64_t v137 = [(NSArray *)v136 countByEnumeratingWithState:&v167 objects:v175 count:16];
  if (v137)
  {
    uint64_t v138 = v137;
    uint64_t v139 = *(void *)v168;
    do
    {
      for (uint64_t i = 0; i != v138; ++i)
      {
        if (*(void *)v168 != v139) {
          objc_enumerationMutation(v136);
        }
        v141 = *(void **)(*((void *)&v167 + 1) + 8 * i);
        if ([v141 signalID] == 4) {
          int v128 = [v141 notAuthorizedForLocation] ^ 1;
        }
      }
      uint64_t v138 = [(NSArray *)v136 countByEnumeratingWithState:&v167 objects:v175 count:16];
    }
    while (v138);
  }

  if (v152->_enabled)
  {
    if (([(PowerUISmartChargeManager *)v152 isDeviceWithLegitimateUsage] & v128) == 1
      && !v152->_temporarilyDisabled
      && v133 <= 0x3B
      && v131 >> 2 >= 0x717
      && v135 <= 0x5E)
    {
      [v78 setObject:&unk_26D385648 forKeyedSubscript:@"ShouldHaveEngaged"];
    }
    if (v152->_enabled
      && ([(PowerUISmartChargeManager *)v152 isDeviceWithLegitimateUsage] & v128) == 1
      && !v152->_temporarilyDisabled
      && v131 >> 2 >= 0x717
      && v135 <= 0x5E)
    {
      [v78 setObject:&unk_26D385648 forKeyedSubscript:@"AbsoluteShouldHaveEngaged"];
    }
  }
  v142 = objc_msgSend(NSNumber, "numberWithLong:", -[PowerUITrialManager longFactorForName:](v152->_trialManager, "longFactorForName:", @"modelExecutionPath"));
  [v78 setObject:v142 forKeyedSubscript:@"ModelExecutionPath"];

  v143 = (void *)[v78 copy];
  return v143;
}

- (id)constructAnalyticsStatus
{
  id v3 = (void *)CFPreferencesCopyAppValue(@"timeline", (CFStringRef)self->_defaultsDomain);
  id v4 = [(PowerUISmartChargeManager *)self constructAnalyticsStatusFromEvents:v3];

  return v4;
}

- (void)recordDEoCAnalytics:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[PowerUISmartChargeUtilities readDictForPreferenceKey:@"PreviousDEoCStatus" inDomain:self->_defaultsDomain];
  log = self->_log;
  BOOL v7 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)double v58 = v5;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Got previous DEoC status: %@", buf, 0xCu);
    }
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v9 = [v5 objectForKeyedSubscript:@"dryRun"];
    [v8 setObject:v9 forKeyedSubscript:@"dryRun"];

    int v10 = [v5 objectForKeyedSubscript:@"limitCharge"];
    int v11 = [v10 BOOLValue];

    unint64_t v12 = [v5 objectForKeyedSubscript:@"DEoCStatus"];
    uint64_t v13 = [v12 unsignedIntValue];

    uint64_t v14 = [v5 objectForKeyedSubscript:@"mostRecentDrain"];
    unsigned int v15 = [v14 intValue];

    unint64_t v16 = [(PowerUISmartChargeManager *)self log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109632;
      *(_DWORD *)double v58 = v15;
      *(_WORD *)&v58[4] = 1024;
      *(_DWORD *)&v58[6] = v11;
      __int16 v59 = 2048;
      uint64_t v60 = v13;
      _os_log_impl(&dword_22135E000, v16, OS_LOG_TYPE_DEFAULT, "DEoC Analytics - most recent drain: %d, last charge DEoC: %d, last status: %lu", buf, 0x18u);
    }

    if ((v13 - 1) >= 5 && (v13 - 200) > 1)
    {
      double v41 = [NSNumber numberWithUnsignedInteger:v13];
      [v8 setObject:v41 forKeyedSubscript:@"DEoCStatus"];

      id v19 = &unk_26D385678;
    }
    else
    {
      if (v15 < 0x3E9)
      {
        if (kMaxDEoCBatteryDrain) {
          unsigned int v20 = 60;
        }
        else {
          unsigned int v20 = 70;
        }
        BOOL v21 = v15 >= v20;
        uint64_t v22 = 3;
        if (v21) {
          uint64_t v22 = 1;
        }
        uint64_t v23 = 4;
        if (!v21) {
          uint64_t v23 = 2;
        }
        if (v11) {
          uint64_t v24 = v23;
        }
        else {
          uint64_t v24 = v22;
        }
        uint64_t v25 = [(PowerUISmartChargeManager *)self log];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 134217984;
          *(void *)double v58 = v24;
          _os_log_impl(&dword_22135E000, v25, OS_LOG_TYPE_DEFAULT, "Last DEoC decision was: %lu", buf, 0xCu);
        }

        double v26 = [NSNumber numberWithUnsignedInteger:v13];
        [v8 setObject:v26 forKeyedSubscript:@"DEoCStatus"];

        double v27 = [NSNumber numberWithUnsignedInteger:v24];
        [v8 setObject:v27 forKeyedSubscript:@"DEoCDecision"];

        int v28 = v15 - (unsigned __int16)v15 % 5u;
        if (v28 >= 100) {
          uint64_t v29 = 100;
        }
        else {
          uint64_t v29 = v28;
        }
        int v30 = [NSNumber numberWithInt:v29];
        [v8 setObject:v30 forKeyedSubscript:@"lastDrainBucket"];

        double v31 = [v5 objectForKeyedSubscript:@"idleDurationMinutes"];
        [v8 setObject:v31 forKeyedSubscript:@"idleDurationMinutes"];

        id v32 = [v5 objectForKeyedSubscript:@"totalEligibleDurationMinutes"];
        if (v32)
        {
          [v8 setObject:v32 forKeyedSubscript:@"totalEligibleDurationMinutes"];
          double v33 = NSNumber;
          int v34 = (int)[v32 intValue] / 60;
          if (v34 >= 19) {
            uint64_t v35 = 19;
          }
          else {
            uint64_t v35 = v34;
          }
          long long v36 = [v33 numberWithInt:v35];
          [v8 setObject:v36 forKeyedSubscript:@"totalEligibleDurationHoursBucket"];
        }
        double v37 = [v5 objectForKeyedSubscript:@"modelThreshold"];

        if (v37)
        {
          uint64_t v38 = NSString;
          unsigned int v39 = [v5 objectForKeyedSubscript:@"modelThreshold"];
          uint64_t v40 = [v38 stringWithFormat:@"threshold:%@", v39];
          [v8 setObject:v40 forKeyedSubscript:@"trialExperimentID"];
        }
        goto LABEL_40;
      }
      int v17 = [(PowerUISmartChargeManager *)self log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[PowerUISmartChargeManager recordDEoCAnalytics:](v15, v17);
      }

      double v18 = [NSNumber numberWithUnsignedInteger:v13];
      [v8 setObject:v18 forKeyedSubscript:@"DEoCStatus"];

      id v19 = &unk_26D385660;
    }
    [v8 setObject:v19 forKeyedSubscript:@"DEoCDecision"];
LABEL_40:
    uint64_t v42 = self->_log;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)double v58 = v8;
      _os_log_impl(&dword_22135E000, v42, OS_LOG_TYPE_DEFAULT, "Reporting DEoC plugout metrics to CoreAnalytics %@", buf, 0xCu);
    }
    +[PowerUISmartChargeUtilities setDict:0 forPreferenceKey:@"PreviousDEoCStatus" inDomain:self->_defaultsDomain];
    id v43 = [NSDictionary dictionaryWithDictionary:v8];
    [(PowerUISmartChargeManager *)self sendDEoCAnalyticsToCA:v43];

    goto LABEL_43;
  }
  if (v7)
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "No previous DEoC charge found, no analytics to send.", buf, 2u);
  }
LABEL_43:
  [(NSLock *)self->_deocCurrentStatusLock lock];
  id v44 = +[PowerUISmartChargeUtilities readDictForPreferenceKey:@"CurrentDEoCStatus" inDomain:self->_defaultsDomain];
  [(NSLock *)self->_deocCurrentStatusLock unlock];
  if (v44)
  {
    id v45 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v44];
    id v46 = v45;
    if (self->_isDesktopDevice)
    {
      BOOL v47 = NSNumber;
      unint64_t v48 = [v4 objectForKeyedSubscript:@"IdleDuration"];
      unint64_t v49 = objc_msgSend(v47, "numberWithInt:", ((int)objc_msgSend(v48, "intValue") / 60));
      [v46 setObject:v49 forKeyedSubscript:@"idleDurationMinutes"];
    }
    else
    {
      [v45 setObject:&unk_26D385618 forKeyedSubscript:@"idleDurationMinutes"];
    }
    v50 = NSNumber;
    uint64_t v51 = [v4 objectForKeyedSubscript:@"TotalEligibleDuration"];
    int v52 = objc_msgSend(v50, "numberWithInt:", ((int)objc_msgSend(v51, "intValue") / 60));
    [v46 setObject:v52 forKeyedSubscript:@"totalEligibleDurationMinutes"];

    if (+[PowerUISmartChargeUtilities isInternalBuild]
      || +[PowerUISmartChargeUtilities isUltraWatch])
    {
      BOOL v53 = +[PowerUISmartChargeUtilities numberForPreferenceKey:@"NoLoIButRegularCharges" inDomain:@"com.apple.smartcharging.topoffprotection"];
      uint64_t v54 = v53;
      if (v53)
      {
        if ([v53 intValue] == 1)
        {
          double v55 = [v46 objectForKeyedSubscript:@"DEoCStatus"];
          int v56 = [v55 unsignedIntValue];

          if ((v56 - 2) <= 3) {
            [v46 setObject:qword_2645A6CC0[v56 - 2] forKeyedSubscript:@"DEoCStatus"];
          }
        }
      }
    }
    +[PowerUISmartChargeUtilities setDict:v46 forPreferenceKey:@"PreviousDEoCStatus" inDomain:self->_defaultsDomain];
  }
}

- (void)sendDEoCAnalyticsToCA:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

id __51__PowerUISmartChargeManager_sendDEoCAnalyticsToCA___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)defaultDateToDisableUntilGivenDate:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (defaultDateToDisableUntilGivenDate__onceToken_0 != -1) {
    dispatch_once(&defaultDateToDisableUntilGivenDate__onceToken_0, &__block_literal_global_15);
  }
  uint64_t v5 = [(id)defaultDateToDisableUntilGivenDate__calendar_0 components:60 fromDate:v4];
  if ([v5 hour] >= 6) {
    objc_msgSend(v5, "setDay:", objc_msgSend(v5, "day") + 1);
  }
  [v5 setHour:6];
  id v6 = [(id)defaultDateToDisableUntilGivenDate__calendar_0 dateFromComponents:v5];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    int v10 = v6;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Feature disabled until: %@", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

uint64_t __64__PowerUISmartChargeManager_defaultDateToDisableUntilGivenDate___block_invoke()
{
  defaultDateToDisableUntilGivenDate__calendar_0 = [MEMORY[0x263EFF8F0] currentCalendar];
  return MEMORY[0x270F9A758]();
}

- (void)setTemporarilyDisabled:(BOOL)a3 until:(id)a4
{
  BOOL v5 = a3;
  id v8 = a4;
  int v9 = v8;
  if (v8)
  {
    [v8 timeIntervalSinceNow];
    double v11 = v10;
    if (v10 >= 0.0 && v5)
    {
LABEL_4:
      if (!self->_temporarilyDisabled)
      {
        unint64_t v12 = NSNumber;
        [v9 timeIntervalSinceReferenceDate];
        uint64_t v13 = objc_msgSend(v12, "numberWithDouble:");
        [(PowerUISmartChargeManager *)self setNumber:v13 forPreferenceKey:@"disabledUntil"];

        objc_storeStrong((id *)&self->_disabledUntilDate, a4);
        self->_temporarilyDisabled = 1;
        [(PowerUISmartChargeManager *)self setCurrentState:3];
        uint64_t v14 = [MEMORY[0x263EFF910] now];
        [(PowerUISmartChargeManager *)self pluginTimelineAddEvent:@"TemporarilyDisabled" atDate:v14 withBatteryLevel:+[PowerUISmartChargeUtilities currentBatteryLevelWithContext:self->_context]];

        unsigned int v15 = [MEMORY[0x263EFF910] date];
        [(PowerUISmartChargeManager *)self addPowerLogEventForCheckpoint:11 decisionSignalID:0 decisionDate:v15];

        [(PowerUISmartChargeManager *)self setCheckpoint:11 withSelector:a2];
        dispatch_time_t v16 = dispatch_walltime(0, (uint64_t)(v11 * 1000000000.0));
        queue = self->_queue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __58__PowerUISmartChargeManager_setTemporarilyDisabled_until___block_invoke;
        block[3] = &unk_2645A5CF0;
        void block[4] = self;
        dispatch_after(v16, queue, block);
        [(PowerUISmartChargeManager *)self forceDEoCReevaluation];
      }
      goto LABEL_16;
    }
  }
  else
  {
    double v11 = 0.0;
    if (v5) {
      goto LABEL_4;
    }
  }
  [(PowerUISmartChargeManager *)self setNumber:0 forPreferenceKey:@"disabledUntil"];
  disabledUntilDate = self->_disabledUntilDate;
  self->_disabledUntilDate = 0;

  if (+[PowerUISmartChargeUtilities isPluggedInWithContext:self->_context]&& self->_temporarilyDisabled)
  {
    uint64_t v19 = 6;
LABEL_12:
    [(PowerUISmartChargeManager *)self setCheckpoint:v19 withSelector:a2];
    goto LABEL_13;
  }
  if ((self->_checkpoint & 0xFFFFFFFFFFFFFFFELL) == 0xA)
  {
    uint64_t v19 = 0;
    goto LABEL_12;
  }
LABEL_13:
  self->_temporarilyDisabled = 0;
  if (self->_currentState == 3)
  {
    [(PowerUISmartChargeManager *)self setCurrentState:1];
    notify_post((const char *)[@"com.apple.powerui.smartchargestatuschanged" UTF8String]);
  }
  unint64_t checkpoint = self->_checkpoint;
  BOOL v21 = [MEMORY[0x263EFF910] date];
  [(PowerUISmartChargeManager *)self addPowerLogEventForCheckpoint:checkpoint decisionSignalID:0 decisionDate:v21];

LABEL_16:
}

uint64_t __58__PowerUISmartChargeManager_setTemporarilyDisabled_until___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTemporarilyDisabled:0 until:0];
}

- (void)loadDefaults
{
  v108[1] = *MEMORY[0x263EF8340];
  id v3 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"enabled"];
  if (+[PowerUISmartChargeUtilities isiPad])
  {
    self->_BOOL enabled = 0;
  }
  else
  {
    if (v3) {
      char v4 = [v3 BOOLValue];
    }
    else {
      char v4 = 1;
    }
    self->_BOOL enabled = v4;
  }
  ADClientSetValueForScalarKey();
  v107 = @"enabled";
  BOOL v5 = [NSNumber numberWithInt:self->_enabled];
  v108[0] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v108 forKeys:&v107 count:1];
  AnalyticsSendEvent();

  BOOL v7 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"currentState"];
  id v8 = v7;
  if (!v7)
  {
    if (self->_enabled)
    {
      self->_unint64_t currentState = 1;
    }
    else
    {
      self->_unint64_t currentState = 0;
      double v11 = [MEMORY[0x263EFF910] date];
      [(PowerUISmartChargeManager *)self addPowerLogEventForCheckpoint:10 decisionSignalID:0 decisionDate:v11];
    }
    double v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [(PowerUISmartChargeManager *)self setNumber:v10 forPreferenceKey:@"currentState"];
    goto LABEL_15;
  }
  unint64_t v9 = [v7 unsignedIntegerValue];
  self->_unint64_t currentState = v9;
  if (!self->_enabled && v9 == 1)
  {
    [(PowerUISmartChargeManager *)self setCurrentState:0];
    double v10 = [MEMORY[0x263EFF910] date];
    [(PowerUISmartChargeManager *)self addPowerLogEventForCheckpoint:10 decisionSignalID:0 decisionDate:v10];
LABEL_15:
  }
  unint64_t v12 = [(PowerUISmartChargeManager *)self readDateForPreferenceKey:@"potentialUnplugDate"];
  potentialUnplugDate = self->_potentialUnplugDate;
  self->_potentialUnplugDate = v12;

  if (+[PowerUISmartChargeUtilities isInternalBuild])
  {
    uint64_t v14 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"debounceOverrideInSeconds"];
    unsigned int v15 = v14;
    if (v14) {
      [v14 doubleValue];
    }
    else {
      double v16 = -1.0;
    }
    self->_double debounceOverride = v16;
  }
  int v17 = [(PowerUISmartChargeManager *)self readDateForPreferenceKey:@"MCLTempDisabledUntilDate"];
  mclDisabledUntilDate = self->_mclDisabledUntilDate;
  self->_mclDisabledUntilDate = v17;

  uint64_t v19 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"MCLFeatureState"];
  unsigned int v20 = v19;
  if (v19) {
    unint64_t v21 = [v19 unsignedIntValue];
  }
  else {
    unint64_t v21 = 0;
  }
  self->_unint64_t manualChargeLimitStatus = v21;
  uint64_t v22 = [(PowerUISmartChargeManager *)self readDateForPreferenceKey:@"initialChargeLimitSetDate"];
  if (v22)
  {
    self->_manualChargeLimitWasEverEnabled = 1;
  }
  else if (self->_manualChargeLimitStatus)
  {
    self->_manualChargeLimitWasEverEnabled = 1;
    uint64_t v23 = [MEMORY[0x263EFF910] now];
    [(PowerUISmartChargeManager *)self setDate:v23 forPreferenceKey:@"initialChargeLimitSetDate"];

    [(PowerUISmartChargeManager *)self setNumber:&unk_26D3856C0 forPreferenceKey:@"mclLimitValue"];
  }
  else
  {
    self->_manualChargeLimitWasEverEnabled = 0;
  }
  uint64_t v24 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"mclLimitValue"];
  double v86 = v24;
  if (v24) {
    unsigned __int8 v25 = [v24 unsignedCharValue];
  }
  else {
    unsigned __int8 v25 = 100;
  }
  self->_mclTargetSoC = v25;
  double v26 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"ChargeLimitRecommendation"];
  double v85 = v26;
  if (v26) {
    unint64_t v27 = [v26 unsignedIntValue];
  }
  else {
    unint64_t v27 = 0;
  }
  self->_recommendedLimit = v27;
  int v28 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"DEoCFeatureState"];

  uint64_t v84 = v28;
  if (+[PowerUISmartChargeUtilities isiPad])
  {
    self->_deocFeatureState = 0;
  }
  else
  {
    if (v28) {
      unint64_t v29 = [v28 unsignedIntValue] != 0;
    }
    else {
      unint64_t v29 = 1;
    }
    self->_deocFeatureState = v29;
  }
  int v30 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"alarmsIgnored"];
  self->_BOOL signalsIgnored = [v30 BOOLValue];

  [(NSLock *)self->_deocCurrentStatusLock lock];
  double v31 = +[PowerUISmartChargeUtilities readDictForPreferenceKey:@"CurrentDEoCStatus" inDomain:self->_defaultsDomain];
  [(NSLock *)self->_deocCurrentStatusLock unlock];
  if (v31)
  {
    id v32 = [v31 objectForKeyedSubscript:@"dryRun"];
    char v33 = [v32 BOOLValue];

    if ((v33 & 1) == 0)
    {
      int v34 = [v31 objectForKeyedSubscript:@"limitCharge"];
      self->_BOOL isDesktopDevice = [v34 BOOLValue];
    }
  }
  uint64_t v35 = [(PowerUISmartChargeManager *)self readDateForPreferenceKey:@"lastDesktopModeChangeDate"];
  lastDesktopModeChangeDate = self->_lastDesktopModeChangeDate;
  self->_lastDesktopModeChangeDate = v35;

  double v37 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"lastNonEngagementSignalID"];
  lastNonEngagementSignalID = self->_lastNonEngagementSignalID;
  self->_lastNonEngagementSignalID = v37;

  unsigned int v39 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"chargePredictionModel"];
  uint64_t v40 = self->_log;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    *(void *)double v88 = v39;
    _os_log_impl(&dword_22135E000, v40, OS_LOG_TYPE_DEFAULT, "Loading model: %@", buf, 0xCu);
  }
  if (!v39 || [v39 unsignedIntegerValue] == 2)
  {
    unint64_t v41 = 2;
LABEL_49:
    self->_unint64_t predictorType = v41;
    goto LABEL_50;
  }
  if ([v39 unsignedIntegerValue] == 4)
  {
    unint64_t v41 = 4;
    goto LABEL_49;
  }
  if ([v39 unsignedIntegerValue] == -1)
  {
    unint64_t v41 = -1;
    goto LABEL_49;
  }
  self->_unint64_t predictorType = 2;
  v73 = [NSNumber numberWithUnsignedInteger:2];
  [(PowerUISmartChargeManager *)self setNumber:v73 forPreferenceKey:@"chargePredictionModel"];

LABEL_50:
  uint64_t v42 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"fullChargeDeadline"];
  id v43 = v42;
  if (v42)
  {
    id v44 = (void *)MEMORY[0x263EFF910];
    [v42 doubleValue];
    objc_msgSend(v44, "dateWithTimeIntervalSinceReferenceDate:");
    id v45 = (NSDate *)objc_claimAutoreleasedReturnValue();
    fullChargeDeadline = self->__fullChargeDeadline;
    self->__fullChargeDeadline = v45;
  }
  BOOL v47 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"empiricalFullChargeDuration"];
  [v47 doubleValue];
  self->_double empiricalTimeToFullChargeDurationMinutes = v48;

  double empiricalTimeToFullChargeDurationMinutes = self->_empiricalTimeToFullChargeDurationMinutes;
  double v50 = fmax(fmin(empiricalTimeToFullChargeDurationMinutes, 180.0), 40.0);
  double v51 = empiricalTimeToFullChargeDurationMinutes - v50;
  if (v51 < 0.0) {
    double v51 = -v51;
  }
  if (v51 > 1.0)
  {
    self->_double empiricalTimeToFullChargeDurationMinutes = v50;
    int v52 = objc_msgSend(NSNumber, "numberWithDouble:");
    [(PowerUISmartChargeManager *)self setNumber:v52 forPreferenceKey:@"empiricalFullChargeDuration"];
  }
  BOOL v53 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"wirelessCharger"];
  self->_lastChargerWasWireless = [v53 BOOLValue];

  uint64_t v54 = [(PowerUISmartChargeManager *)self readDateForPreferenceKey:@"engagementTimeOverride"];
  [(PowerUISmartChargeManager *)self setEngagementTimeOverride:v54];

  double v55 = [(PowerUISmartChargeManager *)self readDateForPreferenceKey:@"fullChargeDeadlineOverride"];
  [(PowerUISmartChargeManager *)self setFullChargeDeadlineOverride:v55];

  int v56 = [(PowerUISmartChargeManager *)self readDateForPreferenceKey:@"repeatEngagementOverrideEndDate"];
  [(PowerUISmartChargeManager *)self setRepeatEngagementOverrideEndDate:v56];

  [(PowerUISmartChargeManager *)self cleanupOverrides];
  double v57 = +[PowerUISmartChargeUtilities readDictForPreferenceKey:@"powerLogStatus" inDomain:self->_defaultsDomain];
  [(PowerUISmartChargeManager *)self setPowerLogStatus:v57];

  double v58 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"becameOBCEligible"];
  __int16 v59 = v58;
  uint64_t v82 = v43;
  if (v58) {
    LOBYTE(v58) = [v58 BOOLValue];
  }
  self->_becameOBCEligible = (char)v58;
  uint64_t v60 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"reachedTargetSoC"];
  uint64_t v61 = v60;
  uint64_t v83 = v39;
  if (v60) {
    LOBYTE(v60) = [v60 BOOLValue];
  }
  self->_reachedTargetSoC = (char)v60;
  v62 = self->_log;
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v80 = v22;
    v81 = v8;
    uint64_t v63 = v20;
    BOOL enabled = self->_enabled;
    unint64_t currentState = self->_currentState;
    BOOL signalsIgnored = self->_signalsIgnored;
    BOOL isDesktopDevice = self->_isDesktopDevice;
    unint64_t manualChargeLimitStatus = self->_manualChargeLimitStatus;
    double v65 = NSNumber;
    unint64_t predictorType = self->_predictorType;
    log = v62;
    v67 = [v65 numberWithUnsignedInteger:predictorType];
    signalDeadline = self->_signalDeadline;
    double v69 = [(PowerUISmartChargeManager *)self engagementTimeOverride];
    double v70 = [(PowerUISmartChargeManager *)self fullChargeDeadlineOverride];
    [(PowerUISmartChargeManager *)self repeatEngagementOverrideEndDate];
    v71 = double v79 = v31;
    v72 = [NSNumber numberWithBool:self->_overrideAllSignals];
    *(_DWORD *)long long buf = 67111682;
    *(_DWORD *)double v88 = enabled;
    unsigned int v20 = v63;
    uint64_t v22 = v80;
    *(_WORD *)&v88[4] = 2048;
    *(void *)&v88[6] = currentState;
    __int16 v89 = 1024;
    BOOL v90 = signalsIgnored;
    __int16 v91 = 1024;
    BOOL v92 = isDesktopDevice;
    __int16 v93 = 2048;
    unint64_t v94 = manualChargeLimitStatus;
    __int16 v95 = 2112;
    v96 = v67;
    __int16 v97 = 2112;
    uint64_t v98 = signalDeadline;
    __int16 v99 = 2112;
    v100 = v69;
    __int16 v101 = 2112;
    v102 = v70;
    __int16 v103 = 2112;
    v104 = v71;
    __int16 v105 = 2112;
    v106 = v72;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Loaded Settings: Enabled=%u, CurrentState=%lu, Signals Ignored=%u, Desktop device=%u, Manual Charge Limit=%lu, Predictor = %@, Full Charge Deadline=%@, EngagementTimeOverride=%@, FullChargeDeadlineOverride=%@, repeatEngagementOverrideEndDate=%@ OverrideAllSignals=%@", buf, 0x64u);

    double v31 = v79;
    id v8 = v81;
  }
}

- (BOOL)isExternalConnected
{
  if ([(PowerUISmartChargeManager *)self lastPluginStatus] > 0) {
    return 1;
  }
  if (([(PowerUISmartChargeManager *)self lastPluginStatus] & 0x80000000) == 0) {
    return 0;
  }
  char v4 = [(PowerUISmartChargeManager *)self context];
  BOOL v5 = [MEMORY[0x263F351D0] keyPathForBatteryStateDataDictionary];
  id v6 = [v4 objectForKeyedSubscript:v5];

  BOOL v7 = [MEMORY[0x263F351D0] batteryExternalConnectedKey];
  id v8 = [v6 objectForKeyedSubscript:v7];
  char v9 = [v8 BOOLValue];

  return v9;
}

- (void)handleTopOffSupervisorEventInternal
{
  if ([(PowerUISmartChargeManager *)self isExternalConnected])
  {
    id v3 = [(PowerUISmartChargeManager *)self log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v4 = 0;
      _os_log_impl(&dword_22135E000, v3, OS_LOG_TYPE_DEFAULT, "Handling periodic check for callback", v4, 2u);
    }

    [(PowerUISmartChargeManager *)self handleCallback:1];
  }
}

- (void)handleTopOffSupervisorEvent
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__PowerUISmartChargeManager_handleTopOffSupervisorEvent__block_invoke;
  block[3] = &unk_2645A5CF0;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __56__PowerUISmartChargeManager_handleTopOffSupervisorEvent__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) recallPeriodicCheck];
  id v2 = *(void **)(a1 + 32);
  return [v2 handleTopOffSupervisorEventInternal];
}

- (double)periodicCheckDuration
{
  return (double)(arc4random_uniform(0xB4u) + 720);
}

- (void)requestPeriodicCheckWithDuration:(double)a3 withAlarmKey:(const char *)a4
{
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  time_t v5 = time(0);
  xpc_dictionary_set_date(xdict, "Date", 1000000000 * (unint64_t)((double)v5 + a3));
  xpc_set_event();
}

- (void)requestPeriodicCheck
{
  [(PowerUISmartChargeManager *)self periodicCheckDuration];
  -[PowerUISmartChargeManager requestPeriodicCheckWithDuration:withAlarmKey:](self, "requestPeriodicCheckWithDuration:withAlarmKey:", "TopOffSupervisor");
}

- (void)recallPeriodicCheck
{
}

- (void)handleInternalCarryPromptEvent
{
  xpc_set_event();
  if (+[PowerUISmartChargeUtilities isInternalBuild])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__PowerUISmartChargeManager_handleInternalCarryPromptEvent__block_invoke;
    block[3] = &unk_2645A5CF0;
    void block[4] = self;
    dispatch_sync(queue, block);
  }
}

void __59__PowerUISmartChargeManager_handleInternalCarryPromptEvent__block_invoke(uint64_t a1)
{
  if (+[PowerUISmartChargeUtilities isPluggedInWithContext:*(void *)(*(void *)(a1 + 32) + 48)])
  {
    ADClientSetValueForScalarKey();
  }
  else
  {
    id v2 = *(NSObject **)(*(void *)(a1 + 32) + 96);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl(&dword_22135E000, v2, OS_LOG_TYPE_DEFAULT, "Failure: Providing notification to charge.", v7, 2u);
    }
    id v3 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-5.0];
    char v4 = +[PowerUINotificationManager sharedInstance];
    time_t v5 = [*(id *)(a1 + 32) smartTopOffFailureNotificationAtBatteryLevel:*(unsigned int *)(*(void *)(a1 + 32) + 32) withDate:v3];
    id v6 = (id)[v4 postNotificationWithRequest:v5];

    ADClientSetValueForScalarKey();
  }
}

- (void)handleDebounceTimerEvent
{
  id v3 = [(PowerUISmartChargeManager *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_22135E000, v3, OS_LOG_TYPE_DEFAULT, "Handling debounce timer callback", buf, 2u);
  }

  xpc_set_event();
  char v4 = [(PowerUISmartChargeManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__PowerUISmartChargeManager_handleDebounceTimerEvent__block_invoke;
  block[3] = &unk_2645A5CF0;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __53__PowerUISmartChargeManager_handleDebounceTimerEvent__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleCallback:1];
}

- (void)handleAlarmEvent:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  char v4 = NSString;
  time_t v5 = (const char *)*MEMORY[0x263EF86C8];
  id v6 = a3;
  BOOL v7 = objc_msgSend(v4, "stringWithUTF8String:", xpc_dictionary_get_string(v6, v5));
  xpc_object_t reply = xpc_dictionary_create_reply(v6);
  xpc_dictionary_get_remote_connection(v6);
  char v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();

  xpc_connection_send_message(v9, reply);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    unint64_t v12 = v7;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Alarm fired for %@", (uint8_t *)&v11, 0xCu);
  }
  if ([v7 isEqualToString:@"TopOffSupervisor"])
  {
    [(PowerUISmartChargeManager *)self handleTopOffSupervisorEvent];
  }
  else if ([v7 isEqualToString:@"InternalCarryPrompt"])
  {
    [(PowerUISmartChargeManager *)self handleInternalCarryPromptEvent];
  }
  else if ([v7 isEqualToString:@"DebounceTimer"])
  {
    [(PowerUISmartChargeManager *)self handleDebounceTimerEvent];
  }
}

- (void)dispatchAlarmAfter:(int64_t)a3 withName:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218242;
    int64_t v12 = a3;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Requesting wake in %llu seconds for %@", (uint8_t *)&v11, 0x16u);
  }
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  time_t v9 = time(0);
  xpc_dictionary_set_date(v8, "Date", 1000000000 * (v9 + a3));
  id v10 = v6;
  [v10 UTF8String];
  xpc_set_event();
}

- (void)promptBDCToQueryCurrentState
{
  id v7 = [(PowerUIBDCDataManager *)self->_bdcDataManager getBDCDataDictTemplate];
  [v7 setObject:&unk_26D385630 forKeyedSubscript:@"ChargingState"];
  [v7 setObject:&unk_26D385630 forKeyedSubscript:@"InflowState"];
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PowerUISmartChargeManager currentChargeLimit](self, "currentChargeLimit"));
  [v7 setObject:v3 forKeyedSubscript:@"ChargeLimit"];

  char v4 = [NSNumber numberWithUnsignedInteger:self->_checkpoint];
  [v7 setObject:v4 forKeyedSubscript:@"CheckPoint"];

  time_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PowerUISmartChargeManager currentModeOfOperation](self, "currentModeOfOperation"));
  [v7 setObject:v5 forKeyedSubscript:@"ModeOfOperation"];

  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PowerUISmartChargeManager currentDecisionMaker](self, "currentDecisionMaker"));
  [v7 setObject:v6 forKeyedSubscript:@"DecisionMaker"];

  [(PowerUIBDCDataManager *)self->_bdcDataManager promptBDCToQueryState:v7];
}

- (void)registerBDCXPC
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  char v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.powerui.xpcCallbackQueue", v3);
  xpcCallbackQueue = self->_xpcCallbackQueue;
  self->_xpcCallbackQueue = v4;

  mach_service = xpc_connection_create_mach_service("com.apple.powerui.bdcdata", (dispatch_queue_t)self->_xpcCallbackQueue, 1uLL);
  bdcConnection = self->_bdcConnection;
  self->_bdcConnection = mach_service;

  xpc_object_t v8 = self->_bdcConnection;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __43__PowerUISmartChargeManager_registerBDCXPC__block_invoke;
  handler[3] = &unk_2645A6698;
  void handler[4] = self;
  xpc_connection_set_event_handler(v8, handler);
  xpc_connection_activate(self->_bdcConnection);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_INFO, "registerBDCXPC done", v10, 2u);
  }
}

void __43__PowerUISmartChargeManager_registerBDCXPC__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_22135E000, v4, OS_LOG_TYPE_DEFAULT, "xpcRegister event handler called", (uint8_t *)&v7, 2u);
  }
  if (MEMORY[0x223C80F50](v3) == MEMORY[0x263EF86F0])
  {
    [*(id *)(a1 + 32) incomingBDCRequest:v3];
  }
  else
  {
    time_t v5 = (void *)MEMORY[0x223C80E90](v3);
    id v6 = *(NSObject **)(*(void *)(a1 + 32) + 96);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      xpc_object_t v8 = v5;
      _os_log_impl(&dword_22135E000, v6, OS_LOG_TYPE_DEFAULT, "Received object: %s", (uint8_t *)&v7, 0xCu);
    }
    free(v5);
  }
}

- (void)incomingBDCRequest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__PowerUISmartChargeManager_incomingBDCRequest___block_invoke;
  v6[3] = &unk_2645A6AD8;
  v6[4] = self;
  id v5 = v4;
  id v7 = v5;
  xpc_connection_set_event_handler((xpc_connection_t)v5, v6);
  xpc_connection_activate((xpc_connection_t)v5);
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    -[PowerUISmartChargeManager incomingBDCRequest:]();
  }
}

void __48__PowerUISmartChargeManager_incomingBDCRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_22135E000, v4, OS_LOG_TYPE_INFO, "incomingBDCRequest event handler called", (uint8_t *)&v10, 2u);
  }
  if (MEMORY[0x223C80F50](v3) == MEMORY[0x263EF8720])
  {
    xpc_object_t v8 = (void *)MEMORY[0x223C80E90](v3);
    uint64_t v9 = *(NSObject **)(*(void *)(a1 + 32) + 96);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      int v11 = v8;
      _os_log_impl(&dword_22135E000, v9, OS_LOG_TYPE_INFO, "Connection received error: %s", (uint8_t *)&v10, 0xCu);
    }
    free(v8);
  }
  else if (MEMORY[0x223C80F50](v3) == MEMORY[0x263EF8708])
  {
    if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 96), OS_LOG_TYPE_DEBUG)) {
      __48__PowerUISmartChargeManager_incomingBDCRequest___block_invoke_cold_2();
    }
    id v5 = xpc_dictionary_get_value(v3, "currentSmartChargingStateRequest");

    id v6 = *(NSObject **)(*(void *)(a1 + 32) + 96);
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_22135E000, v6, OS_LOG_TYPE_DEFAULT, "incoming xpc connection event: currentSmartChargingStateRequest", (uint8_t *)&v10, 2u);
      }
      [*(id *)(a1 + 32) sendBDCData:*(void *)(a1 + 40) withMessage:v3];
      id v7 = [*(id *)(*(void *)(a1 + 32) + 376) bdcSemaphoreToUse];
      dispatch_semaphore_signal(v7);
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __48__PowerUISmartChargeManager_incomingBDCRequest___block_invoke_cold_1();
    }
  }
}

- (void)sendBDCData:(id)a3 withMessage:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  xpc_object_t v8 = v7;
  if (v6 && v7)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v7);
    if (reply)
    {
      *(_OWORD *)long long buf = 0u;
      long long v39 = 0u;
      xpc_connection_get_audit_token();
      CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      memset(&token, 0, sizeof(token));
      int v11 = SecTaskCreateWithAuditToken(v10, &token);
      if (v11
        && (uint64_t v12 = v11,
            CFTypeRef v13 = SecTaskCopyValueForEntitlement(v11, @"com.apple.powerui.bdcdata", 0),
            CFRelease(v12),
            v13))
      {
        CFRelease(v13);
        id v14 = [(PowerUIBDCDataManager *)self->_bdcDataManager getNextBDCDataDict];
        uint64_t v15 = [v14 objectForKeyedSubscript:@"MessageVersion"];
        xpc_dictionary_set_int64(reply, "MessageVersion", (int)[v15 intValue]);

        double v16 = [v14 objectForKeyedSubscript:@"ChargingState"];
        xpc_dictionary_set_BOOL(reply, "ChargingState", [v16 BOOLValue]);

        int v17 = [v14 objectForKeyedSubscript:@"InflowState"];
        xpc_dictionary_set_BOOL(reply, "InflowState", [v17 BOOLValue]);

        double v18 = [v14 objectForKeyedSubscript:@"ChargeLimit"];
        xpc_dictionary_set_int64(reply, "ChargeLimit", (int)[v18 intValue]);

        uint64_t v19 = [v14 objectForKeyedSubscript:@"CheckPoint"];
        xpc_dictionary_set_int64(reply, "CheckPoint", (int)[v19 intValue]);

        unsigned int v20 = [v14 objectForKeyedSubscript:@"DecisionMaker"];
        xpc_dictionary_set_int64(reply, "DecisionMaker", (int)[v20 intValue]);

        unint64_t v21 = [v14 objectForKeyedSubscript:@"ModeOfOperation"];
        xpc_dictionary_set_int64(reply, "ModeOfOperation", (int)[v21 intValue]);

        xpc_dictionary_send_reply();
        uint64_t v22 = [(PowerUISmartChargeManager *)self log];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          long long v36 = [v14 objectForKeyedSubscript:@"MessageVersion"];
          int v32 = [v36 intValue];
          uint64_t v35 = [v14 objectForKeyedSubscript:@"ChargingState"];
          int v31 = [v35 BOOLValue];
          int v34 = [v14 objectForKeyedSubscript:@"InflowState"];
          int v30 = [v34 BOOLValue];
          char v33 = [v14 objectForKeyedSubscript:@"ChargeLimit"];
          int v29 = [v33 intValue];
          uint64_t v23 = [v14 objectForKeyedSubscript:@"CheckPoint"];
          int v24 = [v23 intValue];
          unsigned __int8 v25 = [v14 objectForKeyedSubscript:@"DecisionMaker"];
          int v26 = [v25 intValue];
          unint64_t v27 = [v14 objectForKeyedSubscript:@"ModeOfOperation"];
          int v28 = [v27 intValue];
          *(_DWORD *)long long buf = 67110656;
          *(_DWORD *)&uint8_t buf[4] = v32;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = v31;
          *(_WORD *)&buf[14] = 1024;
          LODWORD(v39) = v30;
          WORD2(v39) = 1024;
          *(_DWORD *)((char *)&v39 + 6) = v29;
          WORD5(v39) = 1024;
          HIDWORD(v39) = v24;
          __int16 v40 = 1024;
          int v41 = v26;
          __int16 v42 = 1024;
          int v43 = v28;
          _os_log_impl(&dword_22135E000, v22, OS_LOG_TYPE_INFO, "Sent data to BDC: MessageVersion=%d - ChargingState=%d - InflowState=%d - ChargeLimit=%d - CheckPoint=%d - DecisionMaker=%d - ModeOfOperation: %d", buf, 0x2Cu);
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
          -[PowerUISmartChargeManager sendBDCData:withMessage:]();
        }
        xpc_dictionary_set_uint64(reply, "returnCode", 0xFFFFFFFFE00002C1);
        xpc_dictionary_send_reply();
      }
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      -[PowerUISmartChargeManager sendBDCData:withMessage:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[PowerUISmartChargeManager sendBDCData:withMessage:]();
  }
}

- (unint64_t)currentModeOfOperation
{
  id v3 = +[PowerUISmartChargeUtilities timelineEventDate:@"Plugin" withDefaultsDomain:self->_defaultsDomain];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[PowerUISmartChargeUtilities lastPluggedInDate];
  }
  id v6 = v5;
  [v5 timeIntervalSinceNow];
  if (self->_checkpoint - 5 >= 0xFFFFFFFFFFFFFFFCLL)
  {
    if (self->_manualChargeLimitStatus == 1)
    {
      unint64_t v8 = 7;
    }
    else if (self->_isDesktopDevice)
    {
      unint64_t v8 = 5;
    }
    else if (self->_remoteOBCEngaged)
    {
      unint64_t v8 = 4;
    }
    else if (v7 >= -72000.0)
    {
      unint64_t v8 = 1;
    }
    else
    {
      unint64_t v8 = 3;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (unint64_t)currentDecisionMaker
{
  id v3 = +[PowerUISmartChargeUtilities lastPluggedInDate];
  [(NSDate *)self->_previousDecisionMakerDate timeIntervalSinceDate:v3];
  if (v4 <= 0.0)
  {
    unint64_t v6 = -1;
  }
  else
  {
    unint64_t previousDecisionMakerID = self->_previousDecisionMakerID;
    if (previousDecisionMakerID > 9) {
      unint64_t v6 = 1;
    }
    else {
      unint64_t v6 = qword_2214313A8[previousDecisionMakerID];
    }
  }

  return v6;
}

id __44__PowerUISmartChargeManager_handleCallback___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
}

- (void)handleNewPluginWithBatteryLevel:(int)a3 pluginDate:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [(PowerUISmartChargeManager *)self checkWhetherMCLTempDisablementCanBeClearedOnPlugin:1];
  [(PowerUIMLTwoStageModelPredictor *)self->_modelTwoStagePredictor resetSavedDeadline];
  double v7 = +[PowerUISmartChargeUtilities readDictForPreferenceKey:@"CAPluggedInStatus" inDomain:self->_defaultsDomain];
  unint64_t v8 = [(PowerUISmartChargeManager *)self updateAnalyticsWithPluginMetrics:v7 withBatteryLevel:v4];

  if (v8)
  {
    id v9 = v8;
    AnalyticsSendEventLazy();
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v20 = (uint64_t)v9;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Reported Plugin Metrics to CoreAnalytics %@", buf, 0xCu);
    }
    +[PowerUISmartChargeUtilities setDict:0 forPreferenceKey:@"CAPluggedInStatus" inDomain:self->_defaultsDomain];
  }
  [(PowerUISmartChargeManager *)self evaluateIfDesktopDevice];
  [(PowerUISmartChargeManager *)self pluginTimelineAddEvent:@"Plugin" atDate:v6 withBatteryLevel:(int)v4];

  if ([(PowerUITrialManager *)self->_trialManager useTrialEnabledFeature:@"useSleepBasedPredictor"]&& +[PowerUISleepBasedPredictor shouldUseSleepPredictorWithLog:self->_log])
  {
    [(PowerUISmartChargeManager *)self setNumber:&unk_26D3856D8 forPreferenceKey:@"chargePredictionModel"];
    self->_unint64_t predictorType = 4;
    int v11 = [(PowerUISmartChargeManager *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_22135E000, v11, OS_LOG_TYPE_DEFAULT, "Sleep schedule is relevant, use sleep predictor for smart charging", buf, 2u);
    }
  }
  if (+[PowerUISmartChargeUtilities isInternalBuild]
    && _os_feature_enabled_impl()
    && !self->_isDesktopDevice)
  {
    if ((int)v4 <= 80) {
      uint64_t v12 = 80;
    }
    else {
      uint64_t v12 = v4;
    }
    CFTypeRef v13 = +[PowerUISmartChargeUtilities historicalFullChargeDurationStartingAt:v12 withMinimumPluginDuration:300];
    id v14 = [(PowerUISmartChargeManager *)self log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v13 count];
      *(_DWORD *)long long buf = 134218242;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      _os_log_impl(&dword_22135E000, v14, OS_LOG_TYPE_DEFAULT, "Found %lu applicable charge sessions for duration estimation: %@", buf, 0x16u);
    }

    if ([v13 count])
    {
      [v13 percentile:0.1];
      double v16 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceNow:");
      int v17 = +[PowerUINotificationManager sharedInstance];
      id v18 = (id)[v17 postOBCEngagedTopOffNotificationWithDate:v16];
    }
  }
}

id __72__PowerUISmartChargeManager_handleNewPluginWithBatteryLevel_pluginDate___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)handleUnplugAtDate:(id)a3 withBatteryLevel:(int)a4
{
  id v6 = a3;
  double v7 = +[PowerUISmartChargeUtilities timelineEventDate:@"Unplug" withDefaultsDomain:self->_defaultsDomain];
  if (!v7)
  {
    [(PowerUISmartChargeManager *)self pluginTimelineAddEvent:@"Unplug" atDate:v6 withBatteryLevel:a4];
    [(PowerUISmartChargeManager *)self recordAnalytics];
  }
  [(PowerUISmartChargeManager *)self clearPluginTimeline];
  [(PowerUISmartChargeManager *)self setNumber:&unk_26D385618 forPreferenceKey:@"becameOBCEligible"];
  [(PowerUISmartChargeManager *)self setNumber:&unk_26D385618 forPreferenceKey:@"reachedTargetSoC"];
  *(_WORD *)&self->_becameOBCEligible = 0;
  [(PowerUISmartChargeManager *)self cacheCurrentDEoCBehaviorForced:1];
  if (self->_predictorType == 4)
  {
    [(PowerUISmartChargeManager *)self setNumber:&unk_26D3856F0 forPreferenceKey:@"chargePredictionModel"];
    self->_unint64_t predictorType = 2;
    unint64_t v8 = [(PowerUISmartChargeManager *)self log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_22135E000, v8, OS_LOG_TYPE_DEFAULT, "Reset predictor type back to default", v9, 2u);
    }
  }
  [(PowerUISmartChargeManager *)self checkWhetherMCLTempDisablementCanBeClearedOnPlugin:0];
  [(PowerUISmartChargeManager *)self clearManualChargeLimit];
}

- (void)reportAggDKeys:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Reporting to aggd %@", (uint8_t *)&v6, 0xCu);
  }
  [v4 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_937];
}

void __44__PowerUISmartChargeManager_reportAggDKeys___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  [a3 integerValue];
  ADClientSetValueForScalarKey();
}

- (void)recordAnalytics
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "Plugin date is coming back as 0, do not attempt Biome plugout analysis", v2, v3, v4, v5, v6);
}

id __44__PowerUISmartChargeManager_recordAnalytics__block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  v4[0] = @"DeviceNotLegitimate";
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  return v1;
}

id __44__PowerUISmartChargeManager_recordAnalytics__block_invoke_980(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  v4[0] = @"DeviceOverride";
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  return v1;
}

id __44__PowerUISmartChargeManager_recordAnalytics__block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __44__PowerUISmartChargeManager_recordAnalytics__block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __44__PowerUISmartChargeManager_recordAnalytics__block_invoke_4(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  v4[0] = @"EnabledAndLegitimate";
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  return v1;
}

id __44__PowerUISmartChargeManager_recordAnalytics__block_invoke_999(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __44__PowerUISmartChargeManager_recordAnalytics__block_invoke_1003(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __44__PowerUISmartChargeManager_recordAnalytics__block_invoke_1004(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  v4[0] = @"FeatureDisabled";
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  return v1;
}

- (id)dailyStatsFromLastReported:(id)a3
{
  v35[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)CFPreferencesCopyAppValue(@"timeline", (CFStringRef)self->_defaultsDomain);
  uint8_t v6 = [MEMORY[0x263EFF980] array];
  context = self->_context;
  uint64_t v8 = [MEMORY[0x263F351D0] keyPathForBatteryLevel];
  id v9 = [(_CDLocalContext *)context objectForKeyedSubscript:v8];

  if (v5) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    int v11 = (void *)[v5 mutableCopy];

    v35[0] = @"Unplug";
    v34[0] = @"event";
    v34[1] = @"date";
    uint64_t v12 = NSNumber;
    CFTypeRef v13 = [MEMORY[0x263EFF910] date];
    [v13 timeIntervalSinceReferenceDate];
    id v14 = objc_msgSend(v12, "numberWithDouble:");
    v34[2] = @"batteryLevel";
    v35[1] = v14;
    v35[2] = v9;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];
    [v11 addObject:v15];

    uint8_t v6 = v11;
  }
  double v16 = [(PowerUISmartChargeManager *)self constructAnalyticsStatusFromEvents:v6];
  int v17 = [(PowerUISmartChargeManager *)self constructDailyStats:v16];
  id v18 = (void *)[v17 mutableCopy];

  uint64_t v19 = [v18 objectForKeyedSubscript:@"DailyHoursEngaged"];
  [v19 doubleValue];

  uint64_t v20 = [v18 objectForKeyedSubscript:@"DailyHoursEstimated"];
  [v20 doubleValue];

  __int16 v21 = [v18 objectForKeyedSubscript:@"EligibleForIdleTime"];
  if (v21)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 timeIntervalSinceDate:v21];
    }
  }
  [v4 timeIntervalSinceNow];
  double v23 = v22 / -3600.0;
  int v24 = [v18 objectForKeyedSubscript:@"DailyHoursEngaged"];
  [v24 doubleValue];
  double v26 = v25;

  unint64_t v27 = [v18 objectForKeyedSubscript:@"DailyHoursEstimated"];
  [v27 doubleValue];
  double v29 = v28;

  if (v29 >= v23) {
    double v30 = v29;
  }
  else {
    double v30 = v23;
  }
  if (v30 > 0.0)
  {
    if (v26 >= v23) {
      double v31 = v26;
    }
    else {
      double v31 = v23;
    }
    int v32 = [NSNumber numberWithDouble:v31 / v30];
    [v18 setObject:v32 forKeyedSubscript:@"DailyHoursSaved"];
  }
  return v18;
}

- (id)constructDailyStats:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PowerUISmartChargeUtilities readDictForPreferenceKey:@"DailyStatus" inDomain:self->_defaultsDomain];
  uint8_t v6 = (void *)[v5 mutableCopy];

  if (!v6)
  {
    uint8_t v6 = [MEMORY[0x263EFF9A0] dictionary];
  }
  id v7 = [v4 objectForKeyedSubscript:@"IdleDuration"];
  unint64_t v8 = [v7 unsignedIntegerValue];
  double v9 = (double)(v8 / 0xE10);

  if (v8 >> 6 > 0x7E8)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[PowerUISmartChargeManager constructDailyStats:](log);
    }
  }
  else
  {
    BOOL v10 = [v6 objectForKeyedSubscript:@"DailyEngagements"];
    double v11 = (double)(unint64_t)[v10 unsignedIntegerValue];

    uint64_t v12 = [NSNumber numberWithDouble:v11 + 1.0];
    [v6 setObject:v12 forKeyedSubscript:@"DailyEngagements"];

    CFTypeRef v13 = [v6 objectForKeyedSubscript:@"DailyHoursEngaged"];
    [v13 doubleValue];
    double v15 = v14;

    double v16 = [NSNumber numberWithDouble:v15 + v9];
    [v6 setObject:v16 forKeyedSubscript:@"DailyHoursEngaged"];
  }
  id v18 = [v4 objectForKeyedSubscript:@"EstimatedUsableEligibleDuration"];
  unint64_t v19 = [v18 unsignedIntegerValue];

  if (v19 >= 0x1FA40)
  {
    int v24 = self->_log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[PowerUISmartChargeManager constructDailyStats:](v24);
    }
  }
  else
  {
    uint64_t v20 = [v6 objectForKeyedSubscript:@"DailyHoursEstimated"];
    [v20 doubleValue];
    double v22 = v21;

    double v23 = [NSNumber numberWithDouble:v22 + (double)(v19 / 0xE10)];
    [v6 setObject:v23 forKeyedSubscript:@"DailyHoursEstimated"];
  }
  double v25 = [v4 objectForKeyedSubscript:@"UnderChargedAvoidable"];
  int v26 = [v25 BOOLValue];

  if (v26)
  {
    unint64_t v27 = [v6 objectForKeyedSubscript:@"DailyUndercharges"];
    double v28 = (double)(unint64_t)[v27 unsignedIntegerValue];

    double v29 = [NSNumber numberWithDouble:v28 + 1.0];
    [v6 setObject:v29 forKeyedSubscript:@"DailyUndercharges"];
  }
  double v30 = [v6 objectForKeyedSubscript:@"DailyPluggedInSessions"];
  double v31 = (double)(unint64_t)[v30 unsignedIntegerValue];

  int v32 = [NSNumber numberWithDouble:v31 + 1.0];
  [v6 setObject:v32 forKeyedSubscript:@"DailyPluggedInSessions"];

  char v33 = [v4 objectForKeyedSubscript:@"EligibleForIdleTime"];
  [v6 setObject:v33 forKeyedSubscript:@"EligibleForIdleTime"];

  return v6;
}

- (id)updateAnalyticsWithPluginMetrics:(id)a3 withBatteryLevel:(int)a4
{
  uint8_t v6 = (void *)[a3 mutableCopy];
  id v7 = v6;
  if (a4 <= 19) {
    [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"MeaningfulUndercharge"];
  }
  [v7 setObject:self->_engagementsLastMonthBucket forKeyedSubscript:@"EngagementsLastMonthBucket"];
  [v7 setObject:self->_lastReportedNumberOfPluginEvents forKeyedSubscript:@"NumberOfPluginEvents"];
  [v7 setObject:self->_medianPluginLength forKeyedSubscript:@"MedianPluginLength"];
  return v7;
}

- (void)startAllMonitoring
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = self->_monitors;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "startMonitoring", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)stopAllMonitoring
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = self->_monitors;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "stopMonitoring", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)addPowerLogEventForCheckpoint:(unint64_t)a3 decisionSignalID:(id)a4 decisionDate:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  long long v10 = [(PowerUISmartChargeManager *)self powerLogStatus];
  [(PowerUISmartChargeManager *)self setPreviousPowerLogStatus:v10];

  double v11 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v12 = v11;
  if (self->_enabled)
  {
    CFTypeRef v13 = &unk_26D385648;
  }
  else if (self->_temporarilyDisabled)
  {
    CFTypeRef v13 = &unk_26D385708;
  }
  else
  {
    CFTypeRef v13 = &unk_26D385618;
  }
  [v11 setObject:v13 forKeyedSubscript:@"status"];
  double v14 = [NSNumber numberWithUnsignedInteger:a3];
  [v12 setObject:v14 forKeyedSubscript:@"checkpoint"];

  double v15 = [NSNumber numberWithUnsignedInteger:self->_currentState];
  [v12 setObject:v15 forKeyedSubscript:@"state"];

  if (v8)
  {
    [v12 setObject:v8 forKeyedSubscript:@"decisionMaker"];
    [v12 setObject:v9 forKeyedSubscript:@"decisionTime"];
  }
  [(PowerUISmartChargeManager *)self durationToFullChargeFromBatteryLevel:self->_lastBatteryLevel];
  double v16 = objc_msgSend(NSNumber, "numberWithDouble:");
  [v12 setObject:v16 forKeyedSubscript:@"timeTillTopOff"];

  if (self->_predictorType == 2)
  {
    int v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PowerUIMLTwoStageModelPredictor engagementModelVersion](self->_modelTwoStagePredictor, "engagementModelVersion"));
    [v12 setObject:v17 forKeyedSubscript:@"engagementModelVersion"];

    id v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PowerUIMLTwoStageModelPredictor durationModelVersion](self->_modelTwoStagePredictor, "durationModelVersion"));
    [v12 setObject:v18 forKeyedSubscript:@"modelVersion"];

    unint64_t v19 = NSNumber;
    [(PowerUIMLTwoStageModelPredictor *)self->_modelTwoStagePredictor lastEngagementResult];
    uint64_t v20 = objc_msgSend(v19, "numberWithDouble:");
    [v12 setObject:v20 forKeyedSubscript:@"engagementProbability"];

    double v21 = NSNumber;
    [(PowerUIMLTwoStageModelPredictor *)self->_modelTwoStagePredictor lastDurationResult];
    double v22 = objc_msgSend(v21, "numberWithDouble:");
    [v12 setObject:v22 forKeyedSubscript:@"durationPrediction"];
  }
  double v23 = objc_msgSend(NSNumber, "numberWithInteger:", +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", self->_context));
  [v12 setObject:v23 forKeyedSubscript:@"batteryLevel"];

  if (a3 - 2 >= 3) {
    uint64_t v24 = MEMORY[0x263EFFA80];
  }
  else {
    uint64_t v24 = MEMORY[0x263EFFA88];
  }
  [v12 setObject:v24 forKeyedSubscript:@"isEngaged"];
  double v25 = [NSNumber numberWithBool:self->_isDesktopDevice];
  [v12 setObject:v25 forKeyedSubscript:@"isMaxChargeLimited"];

  int v26 = [NSNumber numberWithUnsignedInteger:self->_manualChargeLimitStatus];
  [v12 setObject:v26 forKeyedSubscript:@"isManuallyChargeLimited"];

  unint64_t v27 = [NSNumber numberWithUnsignedChar:self->_mclTargetSoC];
  [v12 setObject:v27 forKeyedSubscript:@"chargeLimitTargetSoC"];

  double v28 = [NSNumber numberWithUnsignedInteger:self->_recommendedLimit];
  [v12 setObject:v28 forKeyedSubscript:@"recommendedChargeLimit"];

  if (a3 <= 8 && ((1 << a3) & 0x181) != 0)
  {
    if (self->_enabled) {
      uint64_t v29 = (16 * self->_temporarilyDisabled) ^ 0x10;
    }
    else {
      uint64_t v29 = 0;
    }
    double v30 = [v12 objectForKeyedSubscript:@"modelVersion"];
    uint64_t v31 = [v30 unsignedIntegerValue];

    uint64_t v32 = v29 | (32 * v31);
  }
  else
  {
    char v33 = [v12 objectForKeyedSubscript:@"decisionMaker"];
    uint64_t v32 = 16 * [v33 unsignedIntegerValue];
  }
  int v34 = [NSNumber numberWithUnsignedInteger:v32 | a3];
  [v12 setObject:v34 forKeyedSubscript:@"aggDBitmap"];

  [(PowerUISmartChargeManager *)self setPowerLogStatus:v12];
  uint64_t v35 = [(PowerUISmartChargeManager *)self powerLogStatus];
  +[PowerUISmartChargeUtilities setDict:v35 forPreferenceKey:@"powerLogStatus" inDomain:self->_defaultsDomain];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = 138412290;
    long long v39 = v12;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Writing to PowerLog %@", (uint8_t *)&v38, 0xCu);
  }
  double v37 = (void *)MEMORY[0x223C80A30]();
  PLLogRegisteredEvent();
}

- (id)adjustedFullChargeDeadlineWithSignals:(id)a3 withDesktopMode:(BOOL)a4 withFullChargeDeadline:(id)a5 withResult:(id)a6
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  double v11 = [v8 objectForKeyedSubscript:@"decisionDate"];
  uint64_t v12 = [v9 earlierDate:v11];
  if (([v9 isEqualToDate:v12] & 1) == 0)
  {
    id v13 = v12;

    double v14 = [v8 objectForKeyedSubscript:@"decisionMaker"];
    [v10 setObject:v14 forKeyedSubscript:@"decisionMaker"];

    id v9 = v13;
  }
  [v10 setObject:v9 forKeyedSubscript:@"decisionDate"];

  return v10;
}

- (void)resetState
{
  lastComputedSignalDeadline = self->_lastComputedSignalDeadline;
  self->_lastComputedSignalDeadline = 0;

  signalDeadline = self->_signalDeadline;
  self->_signalDeadline = 0;

  id v5 = [(PowerUISmartChargeManager *)self setFullChargeDeadline:0];
  [(PowerUISmartChargeManager *)self recallPeriodicCheck];
  [(PowerUIMLTwoStageModelPredictor *)self->_modelTwoStagePredictor resetSavedDeadline];
  uint64_t v6 = (const char *)[@"com.apple.smartcharging.statechange" UTF8String];
  notify_post(v6);
}

- (id)stringFromDecisionMaker:(int64_t)a3 decisionDate:(id)a4
{
  id v5 = a4;
  if (stringFromDecisionMaker_decisionDate__onceToken != -1) {
    dispatch_once(&stringFromDecisionMaker_decisionDate__onceToken, &__block_literal_global_1113);
  }
  if (unint64_t)a3 <= 0xD && ((0x33FFu >> a3))
  {
    long long v7 = off_2645A6CE0[a3];
    id v8 = [(id)stringFromDecisionMaker_decisionDate__formatter stringFromDate:v5];
    uint64_t v6 = [NSString stringWithFormat:@"%@ %@", v7, v8];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __66__PowerUISmartChargeManager_stringFromDecisionMaker_decisionDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v1 = (void *)stringFromDecisionMaker_decisionDate__formatter;
  stringFromDecisionMaker_decisionDate__formatter = (uint64_t)v0;

  uint64_t v2 = (void *)stringFromDecisionMaker_decisionDate__formatter;
  return [v2 setDateFormat:@"MM/dd HH:mm"];
}

- (void)cleanupOverrides
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(PowerUISmartChargeManager *)self fullChargeDeadlineOverride];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    id v5 = [(PowerUISmartChargeManager *)self fullChargeDeadlineOverride];
    [v5 timeIntervalSinceNow];
    double v7 = v6;

    if (v7 <= 0.0)
    {
      id v9 = [(PowerUISmartChargeManager *)self fullChargeDeadlineOverride];
      id v10 = [v9 dateByAddingTimeInterval:86400.0];

      uint64_t v11 = [(PowerUISmartChargeManager *)self repeatEngagementOverrideEndDate];
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        id v13 = [(PowerUISmartChargeManager *)self repeatEngagementOverrideEndDate];
        [v10 timeIntervalSinceDate:v13];
        if (v14 >= 0.0)
        {
        }
        else
        {
          double v15 = [(PowerUISmartChargeManager *)self repeatEngagementOverrideEndDate];
          [v15 timeIntervalSinceNow];
          double v17 = v16;

          if (v17 > 0.0)
          {
            id v18 = [(PowerUISmartChargeManager *)self engagementTimeOverride];
            unint64_t v19 = [v18 dateByAddingTimeInterval:86400.0];

            uint64_t v20 = NSNumber;
            [v10 timeIntervalSinceReferenceDate];
            double v21 = objc_msgSend(v20, "numberWithDouble:");
            [(PowerUISmartChargeManager *)self setNumber:v21 forPreferenceKey:@"fullChargeDeadlineOverride"];

            double v22 = NSNumber;
            [v19 timeIntervalSinceReferenceDate];
            double v23 = objc_msgSend(v22, "numberWithDouble:");
            [(PowerUISmartChargeManager *)self setNumber:v23 forPreferenceKey:@"engagementTimeOverride"];

            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
            {
              double v25 = log;
              int v26 = [(PowerUISmartChargeManager *)self fullChargeDeadlineOverride];
              unint64_t v27 = [(PowerUISmartChargeManager *)self engagementTimeOverride];
              int v30 = 138413058;
              uint64_t v31 = v26;
              __int16 v32 = 2112;
              char v33 = v10;
              __int16 v34 = 2112;
              uint64_t v35 = v27;
              __int16 v36 = 2112;
              double v37 = v19;
              _os_log_impl(&dword_22135E000, v25, OS_LOG_TYPE_DEFAULT, "Forwarding fullChargeDeadlineOverride = %@ to %@ and engagementTimeOverrideDate = %@ to %@", (uint8_t *)&v30, 0x2Au);
            }
            [(PowerUISmartChargeManager *)self setFullChargeDeadlineOverride:v10];
            [(PowerUISmartChargeManager *)self setEngagementTimeOverride:v19];
            double v28 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"overrideAllSignals"];
            -[PowerUISmartChargeManager setOverrideAllSignals:](self, "setOverrideAllSignals:", [v28 BOOLValue]);

            goto LABEL_19;
          }
        }
      }
      [(PowerUISmartChargeManager *)self resetEngagementOverrideWithHandler:&__block_literal_global_1153];
LABEL_19:

      return;
    }
  }
  id v8 = [(PowerUISmartChargeManager *)self fullChargeDeadlineOverride];
  if (v8)
  {
  }
  else
  {
    uint64_t v29 = [(PowerUISmartChargeManager *)self engagementTimeOverride];

    if (v29)
    {
      [(PowerUISmartChargeManager *)self resetEngagementOverrideWithHandler:&__block_literal_global_1155];
    }
  }
}

- (void)updateDecisionMakerID:(int64_t)a3 withCheckpoint:(unint64_t)a4
{
  if (a3 == -1) {
    return;
  }
  uint64_t v15 = v4;
  int64_t previousDecisionMakerID = self->_previousDecisionMakerID;
  if (a4 > 1)
  {
    if ((unint64_t)a3 >= 0xE || ((0x30BDu >> a3) & 1) == 0) {
      goto LABEL_11;
    }
    id v10 = &unk_221431460;
  }
  else
  {
    if ((unint64_t)a3 >= 0xD || ((0x193Du >> a3) & 1) == 0) {
      goto LABEL_11;
    }
    id v10 = &unk_2214313F8;
  }
  int64_t previousDecisionMakerID = v10[a3];
LABEL_11:
  if (a3 == 14) {
    int64_t previousDecisionMakerID = 14;
  }
  self->_int64_t previousDecisionMakerID = previousDecisionMakerID;
  objc_msgSend(MEMORY[0x263EFF910], "date", v5, v15, v6);
  uint64_t v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
  previousDecisionMakerDate = self->_previousDecisionMakerDate;
  self->_previousDecisionMakerDate = v11;

  id v13 = [NSNumber numberWithInteger:self->_previousDecisionMakerID];
  [(PowerUISmartChargeManager *)self setNumber:v13 forPreferenceKey:@"previousDecisionMaker"];

  double v14 = self->_previousDecisionMakerDate;
  [(PowerUISmartChargeManager *)self setDate:v14 forPreferenceKey:@"previousDecisionMakerDate"];
}

void *__87__PowerUISmartChargeManager_handleNewBatteryLevel_whileExternalConnected_fullyCharged___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) resetState];
  uint64_t result = *(void **)(a1 + 32);
  if (!result[14])
  {
    return (void *)[result promptBDCToQueryCurrentState];
  }
  return result;
}

- (void)handleNewBatteryLevelForMCL:(int)a3 whileExternalConnected:(BOOL)a4
{
  BOOL v4 = a4;
  *(void *)&v23[5] = *MEMORY[0x263EF8340];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 67109376;
    v23[0] = a3;
    LOWORD(v23[1]) = 1024;
    *(_DWORD *)((char *)&v23[1] + 2) = v4;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Called for MCL battery level=%d, externalConnected=%u", (uint8_t *)&v22, 0xEu);
  }
  if (v4)
  {
    unint64_t checkpoint = self->_checkpoint;
    if ([(PowerUIBatteryMitigationManager *)self->_batteryMitigationManager mitigationsCurrentlyEnabled])
    {
      id v10 = self->_log;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_22135E000, v10, OS_LOG_TYPE_DEFAULT, "Battery mitigations are in place, MCL will be ignored", (uint8_t *)&v22, 2u);
      }
      if (a3 == 100) {
        uint64_t v11 = 7;
      }
      else {
        uint64_t v11 = 6;
      }
    }
    else
    {
      int mclTargetSoC = self->_mclTargetSoC;
      if (mclTargetSoC <= a3 || checkpoint >= 2)
      {
        if (checkpoint < 2 && mclTargetSoC <= a3) {
          uint64_t v11 = 2;
        }
        else {
          uint64_t v11 = checkpoint;
        }
      }
      else
      {
        uint64_t v11 = 1;
      }
    }
    if (checkpoint != v11)
    {
      uint64_t v15 = [MEMORY[0x263EFF910] date];
      [(PowerUISmartChargeManager *)self updateDecisionMakerID:14 withCheckpoint:v11];
      [(PowerUISmartChargeManager *)self addPowerLogEventForCheckpoint:v11 decisionSignalID:&unk_26D385720 decisionDate:v15];
      double v16 = [(PowerUISmartChargeManager *)self checkpointNameFromCheckpoint:v11];
      [(PowerUISmartChargeManager *)self pluginTimelineAddEvent:v16 atDate:v15 withBatteryLevel:a3];

      [(PowerUISmartChargeManager *)self setCheckpoint:v11 withSelector:a2];
      [(PowerUISmartChargeManager *)self promptBDCToQueryCurrentState];
      notify_post((const char *)[@"com.apple.smartcharging.statechange" UTF8String]);
    }
    [(PowerUISmartChargeManager *)self requestPeriodicCheck];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263EFF910] date];
    [(PowerUISmartChargeManager *)self addPowerLogEventForCheckpoint:0 decisionSignalID:0 decisionDate:v12];

    [(PowerUISmartChargeManager *)self setCheckpoint:0 withSelector:a2];
    [(PowerUISmartChargeManager *)self promptBDCToQueryCurrentState];
    notify_post((const char *)[@"com.apple.powerui.smartchargestatuschanged" UTF8String]);
  }
  double v17 = self->_log;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = NSNumber;
    unint64_t v19 = self->_checkpoint;
    uint64_t v20 = v17;
    double v21 = [v18 numberWithUnsignedInteger:v19];
    int v22 = 138412290;
    *(void *)double v23 = v21;
    _os_log_impl(&dword_22135E000, v20, OS_LOG_TYPE_DEFAULT, "Checkpoint through MCL: %@", (uint8_t *)&v22, 0xCu);
  }
}

- (id)shouldDisableChargingAtBatteryLevel:(unint64_t)a3 withPredictor:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x263EFF910];
  id v7 = a4;
  id v8 = [v6 date];
  id v9 = [(PowerUISmartChargeManager *)self shouldDisableChargingAsOfDate:v8 atBatteryLevel:a3 overrideAllSignals:self->_signalsIgnored withPredictor:v7 bypassSaved:0];

  return v9;
}

- (id)shouldDisableChargingAsOfDate:(id)a3 atBatteryLevel:(unint64_t)a4 overrideAllSignals:(BOOL)a5 withPredictor:(id)a6 bypassSaved:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = (PowerUIMLTwoStageModelPredictor *)a6;
  double v14 = [MEMORY[0x263EFF9A0] dictionary];
  id v15 = v12;
  double v16 = v15;
  if (self->_isDesktopDevice)
  {
    double v17 = [MEMORY[0x263EFF910] distantFuture];
    [v14 setObject:&unk_26D385738 forKeyedSubscript:@"decisionMaker"];
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Engage DEoC", buf, 2u);
    }
  }
  else
  {
    if (v7 && self->_modelTwoStagePredictor == v13)
    {
      uint64_t v38 = [v15 dateByAddingTimeInterval:-1800.0];
      [(PowerUIMLTwoStageModelPredictor *)v13 adjustedChargingDecision:a4 withPluginDate:v38 withPluginBatteryLevel:v16 forDate:1 forStatus:20.0];
      double v40 = v39;

      unint64_t v19 = [v16 dateByAddingTimeInterval:v40];
    }
    else
    {
      unint64_t v19 = [(PowerUIMLTwoStageModelPredictor *)v13 predictFullChargeDateWithBatteryLevel:a4];
    }
    double v17 = v19;
    [v19 timeIntervalSinceDate:v16];
    double v21 = v20;
    if (v20 > *(double *)&kMaximumDurationUntilFullyCharged)
    {
      int v22 = self->_log;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        double v23 = NSNumber;
        uint64_t v24 = v22;
        double v25 = [v23 numberWithDouble:v21 / 60.0];
        *(_DWORD *)long long buf = 138412290;
        double v64 = v25;
        _os_log_impl(&dword_22135E000, v24, OS_LOG_TYPE_DEFAULT, "Very lengthy prediction (%@ mins); limiting idle time",
          buf,
          0xCu);
      }
      uint64_t v26 = [v16 dateByAddingTimeInterval:*(double *)&kMaximumDurationUntilFullyCharged];

      double v17 = (void *)v26;
    }
    if ([(PowerUIMLTwoStageModelPredictor *)v13 predictorType] == 4) {
      unint64_t v27 = &unk_26D385750;
    }
    else {
      unint64_t v27 = &unk_26D385768;
    }
    [v14 setObject:v27 forKeyedSubscript:@"decisionMaker"];
  }
  [v14 setObject:v17 forKeyedSubscript:@"decisionDate"];
  [v17 timeIntervalSinceDate:v16];
  if (v28 >= 0.0 && !a5)
  {
    uint64_t v29 = [(PowerUISmartChargeManager *)self computeSignalDeadline];
    int v30 = [(PowerUISmartChargeManager *)self adjustedFullChargeDeadlineWithSignals:v29 withDesktopMode:self->_isDesktopDevice withFullChargeDeadline:v17 withResult:v14];

    uint64_t v31 = [v30 objectForKeyedSubscript:@"decisionDate"];

    unint64_t v62 = a4;
    if ([(PowerUIBatteryMitigationManager *)self->_batteryMitigationManager mitigationsCurrentlyEnabled])
    {
      __int16 v32 = self->_log;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22135E000, v32, OS_LOG_TYPE_DEFAULT, "Gauging mitigations enabled, adjust deadline", buf, 2u);
      }
      double v17 = [MEMORY[0x263EFF910] distantPast];
    }
    else
    {
      double v17 = v31;
    }
    if (!+[PowerUISmartChargeUtilities isDEoCDryRunSupported])goto LABEL_50; {
    __int16 v34 = [MEMORY[0x263EFF910] distantPast];
    }
    if (![v17 isEqualToDate:v34]) {
      goto LABEL_49;
    }
    uint64_t v35 = [v30 objectForKeyedSubscript:@"decisionMaker"];
    if ([&unk_26D3856D8 isEqualToNumber:v35])
    {
      BOOL v36 = [(PowerUITrialManager *)self->_trialManager useTrialEnabledFeature:@"disableLocationCheckForDEoC"];

      unint64_t v37 = 0x2645A5000;
      if (v36) {
        goto LABEL_50;
      }
    }
    else
    {

      unint64_t v37 = 0x2645A5000uLL;
    }
    [(NSLock *)self->_deocCurrentStatusLock lock];
    __int16 v34 = [*(id *)(v37 + 2584) readDictForPreferenceKey:@"CurrentDEoCStatus" inDomain:self->_defaultsDomain];
    if (!v34)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        -[PowerUISmartChargeManager shouldDisableChargingAsOfDate:atBatteryLevel:overrideAllSignals:withPredictor:bypassSaved:]();
      }
      goto LABEL_48;
    }
    int v41 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v34];
    [v41 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"limitCharge"];
    self->_BOOL isDesktopDevice = 0;
    __int16 v42 = [v30 objectForKeyedSubscript:@"decisionMaker"];

    if (!v42)
    {
      [v41 setObject:&unk_26D385678 forKeyedSubscript:@"DEoCStatus"];
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        -[PowerUISmartChargeManager shouldDisableChargingAsOfDate:atBatteryLevel:overrideAllSignals:withPredictor:bypassSaved:]();
      }
      goto LABEL_45;
    }
    int v43 = [v30 objectForKeyedSubscript:@"decisionMaker"];
    int v44 = [&unk_26D3856D8 isEqualToNumber:v43];

    if (v44)
    {
      id v45 = &unk_26D385750;
    }
    else
    {
      id v46 = [v30 objectForKeyedSubscript:@"decisionMaker"];
      int v47 = [&unk_26D385780 isEqualToNumber:v46];

      if (v47)
      {
        id v45 = &unk_26D385720;
      }
      else
      {
        double v48 = [v30 objectForKeyedSubscript:@"decisionMaker"];
        int v49 = [&unk_26D385798 isEqualToNumber:v48];

        if (!v49)
        {
          [v41 setObject:&unk_26D385678 forKeyedSubscript:@"DEoCStatus"];
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
            -[PowerUISmartChargeManager shouldDisableChargingAsOfDate:atBatteryLevel:overrideAllSignals:withPredictor:bypassSaved:]();
          }
          goto LABEL_45;
        }
        id v45 = &unk_26D3857B0;
      }
    }
    [v41 setObject:v45 forKeyedSubscript:@"DEoCStatus"];
LABEL_45:
    +[PowerUISmartChargeUtilities setDict:v41 forPreferenceKey:@"CurrentDEoCStatus" inDomain:self->_defaultsDomain];
    double v50 = self->_log;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      double v64 = v41;
      _os_log_impl(&dword_22135E000, v50, OS_LOG_TYPE_DEFAULT, "SignalMonitors updated currentDEoCStatus: %@", buf, 0xCu);
    }

LABEL_48:
    [(NSLock *)self->_deocCurrentStatusLock unlock];
LABEL_49:

LABEL_50:
    a4 = v62;
    goto LABEL_51;
  }
  char v33 = self->_log;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_22135E000, v33, OS_LOG_TYPE_DEFAULT, "Ignoring all signals", buf, 2u);
  }
  int v30 = v14;
LABEL_51:
  double v51 = [(PowerUISmartChargeManager *)self setFullChargeDeadline:v17];

  [v51 timeIntervalSinceDate:v16];
  if (v52 > 0.0) {
    [(PowerUISmartChargeManager *)self recomputeEmpiricalTimeToFullCharge];
  }
  uint64_t v53 = MEMORY[0x263EFFA80];
  [(PowerUISmartChargeManager *)self durationToFullChargeFromBatteryLevel:a4 includeTLCDelay:1];
  double v55 = v54;
  int v56 = self->_log;
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    double v57 = v56;
    double v58 = [v16 dateByAddingTimeInterval:v55];
    *(_DWORD *)long long buf = 138412546;
    double v64 = v51;
    __int16 v65 = 2112;
    v66 = v58;
    _os_log_impl(&dword_22135E000, v57, OS_LOG_TYPE_DEFAULT, "Deadline for full charge is: %@ and resuming now would get us there by %@", buf, 0x16u);
  }
  [v51 timeIntervalSinceDate:v16];
  if (v59 <= v55) {
    uint64_t v60 = v53;
  }
  else {
    uint64_t v60 = MEMORY[0x263EFFA88];
  }
  [v30 setObject:v60 forKeyedSubscript:@"shouldDisableCharging"];

  return v30;
}

- (BOOL)shouldDisableChargingOverrideModel:(unint64_t)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(PowerUISmartChargeManager *)self fullChargeDeadlineOverride];

  if (!v5) {
    return 0;
  }
  uint64_t v6 = [MEMORY[0x263EFF910] date];
  uint64_t v7 = [(PowerUISmartChargeManager *)self engagementTimeOverride];
  if (v7
    && (id v8 = (void *)v7,
        [(PowerUISmartChargeManager *)self engagementTimeOverride],
        id v9 = objc_claimAutoreleasedReturnValue(),
        [v6 timeIntervalSinceDate:v9],
        double v11 = v10,
        v9,
        v8,
        v11 < 0.0))
  {
    BOOL v12 = 0;
  }
  else
  {
    id v13 = [(PowerUISmartChargeManager *)self fullChargeDeadlineOverride];
    if (!self->_overrideAllSignals)
    {
      double v14 = [(PowerUISmartChargeManager *)self computeSignalDeadline];
      id v15 = [v14 objectForKeyedSubscript:@"decisionDate"];
      double v16 = [v14 objectForKeyedSubscript:@"decisionMaker"];
      self->_deadlineSignalID = [v16 integerValue];

      uint64_t v17 = [v13 earlierDate:v15];

      id v13 = (void *)v17;
    }
    id v18 = [(PowerUISmartChargeManager *)self setFullChargeDeadline:v13];

    [(PowerUISmartChargeManager *)self durationToFullChargeFromBatteryLevel:a3 includeTLCDelay:1];
    double v20 = v19;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = log;
      double v23 = [v6 dateByAddingTimeInterval:v20];
      int v26 = 138412546;
      unint64_t v27 = v18;
      __int16 v28 = 2112;
      uint64_t v29 = v23;
      _os_log_impl(&dword_22135E000, v22, OS_LOG_TYPE_DEFAULT, "Deadline for full charge is: %@ and resuming now would get us there by %@", (uint8_t *)&v26, 0x16u);
    }
    [v18 timeIntervalSinceDate:v6];
    BOOL v12 = v24 > v20;
  }
  return v12;
}

- (BOOL)shouldOBCRoutineReengage
{
  return 0;
}

- (id)chargePrediction:(unint64_t)a3 fullyCharged:(BOOL)a4 previousCheckpoint:(unint64_t)a5 predictor:(unint64_t)a6
{
  BOOL v8 = a4;
  uint64_t v43 = *MEMORY[0x263EF8340];
  double v11 = [MEMORY[0x263EFF9A0] dictionary];
  [v11 setObject:&unk_26D385630 forKeyedSubscript:@"decisionMaker"];
  if (a5) {
    goto LABEL_2;
  }
  BOOL v17 = [(PowerUISmartChargeManager *)self deviceWasRecentlyConnectedToCharger];
  if ((a3 < 0x50 || v17) && !self->_isDesktopDevice)
  {
    char v33 = [NSNumber numberWithUnsignedInteger:0];
    [v11 setObject:v33 forKeyedSubscript:@"checkpoint"];

    __int16 v34 = [NSNumber numberWithBool:0];
    [v11 setObject:v34 forKeyedSubscript:@"shouldDisableCharging"];

    id v15 = [(PowerUISmartChargeManager *)self log];
    BOOL v35 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (a3 > 0x4F)
    {
      if (!v35) {
        goto LABEL_85;
      }
      *(_WORD *)long long buf = 0;
      BOOL v36 = "Skipping prediction check: Device was just recently plugged-in";
      unint64_t v37 = v15;
      uint32_t v38 = 2;
    }
    else
    {
      if (!v35) {
        goto LABEL_85;
      }
      *(_DWORD *)long long buf = 67109120;
      int v42 = 80;
      BOOL v36 = "Skipping prediction check: Battery level below %d%%";
      unint64_t v37 = v15;
      uint32_t v38 = 8;
    }
    _os_log_impl(&dword_22135E000, v37, OS_LOG_TYPE_DEFAULT, v36, buf, v38);
    goto LABEL_85;
  }
  if (a3 <= 0x5F && !v8 || self->_isDesktopDevice || self->_remoteOBCEngaged)
  {
LABEL_2:
    BOOL v12 = [(PowerUISmartChargeManager *)self shouldOBCRoutineReengage];
    switch(a6)
    {
      case 4uLL:
        int v22 = a5 < 5 || v12;
        if (v22 != 1) {
          goto LABEL_36;
        }
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __88__PowerUISmartChargeManager_chargePrediction_fullyCharged_previousCheckpoint_predictor___block_invoke;
        block[3] = &unk_2645A5CF0;
        void block[4] = self;
        if (chargePrediction_fullyCharged_previousCheckpoint_predictor__onceToken != -1) {
          dispatch_once(&chargePrediction_fullyCharged_previousCheckpoint_predictor__onceToken, block);
        }
        modelTwoStagePredictor = (PowerUIMLTwoStageModelPredictor *)chargePrediction_fullyCharged_previousCheckpoint_predictor__sleepPredictor;
        break;
      case 2uLL:
        int v20 = a5 < 5 || v12;
        if (v20 != 1) {
          goto LABEL_36;
        }
        modelTwoStagePredictor = self->_modelTwoStagePredictor;
        break;
      case 0xFFFFFFFFFFFFFFFFLL:
        int v13 = a5 < 5 || v12;
        if (v13 == 1)
        {
          uint64_t v14 = [(PowerUISmartChargeManager *)self shouldDisableChargingOverrideModel:a3];
          id v15 = 0;
          double v16 = &unk_26D385630;
          if (a5) {
            goto LABEL_40;
          }
          goto LABEL_33;
        }
LABEL_36:
        id v15 = 0;
        uint64_t v14 = 0;
        double v16 = &unk_26D385630;
        goto LABEL_37;
      default:
        uint64_t v14 = 0;
        id v15 = 0;
        double v16 = &unk_26D385630;
        goto LABEL_40;
    }
    double v23 = [(PowerUISmartChargeManager *)self shouldDisableChargingAtBatteryLevel:a3 withPredictor:modelTwoStagePredictor];
    double v16 = [v23 objectForKeyedSubscript:@"decisionMaker"];
    id v15 = [v23 objectForKeyedSubscript:@"decisionDate"];
    double v24 = [v23 objectForKeyedSubscript:@"shouldDisableCharging"];
    uint64_t v14 = [v24 BOOLValue];

    if (a5) {
      goto LABEL_40;
    }
LABEL_33:
    if (v14)
    {
      uint64_t v14 = 1;
      if (a3 <= 0x4F)
      {
        unint64_t v25 = 1;
        goto LABEL_67;
      }
      unint64_t v25 = 2;
      goto LABEL_62;
    }
LABEL_40:
    if (!a5 && !v14)
    {
      [(PowerUISmartChargeManager *)self setNumber:v16 forPreferenceKey:@"lastNonEngagementSignalID"];
      objc_storeStrong((id *)&self->_lastNonEngagementSignalID, v16);
LABEL_58:
      uint64_t v29 = self->_lastNonEngagementSignalID;

      unint64_t v25 = 6;
      double v16 = v29;
LABEL_59:
      if (a5 - 5 <= 1 && v8)
      {
        self->_OBCReengagementEvaluated = 0;
        notify_post((const char *)[@"com.apple.smartcharging.statechange" UTF8String]);
        unint64_t v25 = 7;
      }
      goto LABEL_62;
    }
    char v26 = v14 ^ 1;
    if (a5 == 1) {
      char v27 = v14 ^ 1;
    }
    else {
      char v27 = 0;
    }
    if (v27)
    {
      uint64_t v14 = 0;
      goto LABEL_58;
    }
    if (a5 - 5 <= 0xFFFFFFFFFFFFFFFCLL) {
      char v26 = 0;
    }
    if ((v26 & 1) == 0)
    {
      if (a5 <= 4)
      {
        if (a3 > 0x4F)
        {
          unint64_t v28 = 4;
          if (a5 != 3) {
            unint64_t v28 = a5;
          }
          if (a5 == 1) {
            unint64_t v25 = 2;
          }
          else {
            unint64_t v25 = v28;
          }
          goto LABEL_62;
        }
        unint64_t v25 = a5;
LABEL_67:
        if (a3 > 0x4B)
        {
          if (a5 != 3 && v25 != 1 && v25 != 2 && v25 != 4)
          {
            double v39 = [(PowerUISmartChargeManager *)self log];
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
              -[PowerUISmartChargeManager chargePrediction:fullyCharged:previousCheckpoint:predictor:]();
            }
          }
        }
        else if (a5 == 4 || a5 == 2)
        {
          unint64_t v25 = 3;
        }
        goto LABEL_62;
      }
LABEL_37:
      unint64_t v25 = a5;
      if (a5 != 6) {
        goto LABEL_59;
      }
      goto LABEL_58;
    }
    uint64_t v14 = 0;
    unint64_t v25 = 5;
LABEL_62:
    uint64_t v30 = [NSNumber numberWithUnsignedInteger:v25];
    [v11 setObject:v30 forKeyedSubscript:@"checkpoint"];

    uint64_t v31 = [NSNumber numberWithBool:v14];
    [v11 setObject:v31 forKeyedSubscript:@"shouldDisableCharging"];

    [v11 setObject:v16 forKeyedSubscript:@"decisionMaker"];
    [v11 setObject:v15 forKeyedSubscript:@"decisionDate"];
    goto LABEL_63;
  }
  id v18 = [NSNumber numberWithUnsignedInteger:0];
  [v11 setObject:v18 forKeyedSubscript:@"checkpoint"];

  double v19 = [NSNumber numberWithBool:0];
  [v11 setObject:v19 forKeyedSubscript:@"shouldDisableCharging"];

  id v15 = [(PowerUISmartChargeManager *)self log];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[PowerUISmartChargeManager chargePrediction:fullyCharged:previousCheckpoint:predictor:]();
  }
LABEL_85:
  double v16 = &unk_26D385630;
LABEL_63:

  return v11;
}

uint64_t __88__PowerUISmartChargeManager_chargePrediction_fullyCharged_previousCheckpoint_predictor___block_invoke(uint64_t a1)
{
  chargePrediction_fullyCharged_previousCheckpoint_predictor__sleepPredictor = [[PowerUISleepBasedPredictor alloc] initWithLog:*(void *)(*(void *)(a1 + 32) + 96)];
  return MEMORY[0x270F9A758]();
}

- (id)stringFromInterval:(id)a3
{
  uint64_t v3 = stringFromInterval__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&stringFromInterval__onceToken, &__block_literal_global_1186);
  }
  uint64_t v5 = NSString;
  uint64_t v6 = (void *)stringFromInterval__formatter;
  uint64_t v7 = [v4 startDate];
  BOOL v8 = [v6 stringFromDate:v7];
  id v9 = (void *)stringFromInterval__formatter;
  double v10 = [v4 endDate];

  double v11 = [v9 stringFromDate:v10];
  BOOL v12 = [v5 stringWithFormat:@"%@ - %@", v8, v11];

  return v12;
}

uint64_t __48__PowerUISmartChargeManager_stringFromInterval___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v1 = (void *)stringFromInterval__formatter;
  stringFromInterval__formatter = (uint64_t)v0;

  [(id)stringFromInterval__formatter setDateStyle:1];
  uint64_t v2 = (void *)stringFromInterval__formatter;
  return [v2 setTimeStyle:1];
}

- (id)timeStringFromDate:(id)a3
{
  uint64_t v3 = timeStringFromDate__onceToken_1;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&timeStringFromDate__onceToken_1, &__block_literal_global_1191);
  }
  uint64_t v5 = [(id)timeStringFromDate__formatter_1 stringFromDate:v4];

  return v5;
}

uint64_t __48__PowerUISmartChargeManager_timeStringFromDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v1 = (void *)timeStringFromDate__formatter_1;
  timeStringFromDate__formatter_1 = (uint64_t)v0;

  [(id)timeStringFromDate__formatter_1 setDateStyle:0];
  uint64_t v2 = (void *)timeStringFromDate__formatter_1;
  return [v2 setTimeStyle:1];
}

- (void)recomputeEmpiricalTimeToFullCharge
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF910] date];
  if (!recomputeEmpiricalTimeToFullCharge_lastComputedDate
    || ([(id)recomputeEmpiricalTimeToFullCharge_lastComputedDate timeIntervalSinceDate:v3],
        v4 < -43200.0))
  {
    objc_storeStrong((id *)&recomputeEmpiricalTimeToFullCharge_lastComputedDate, v3);
    uint64_t v5 = +[PowerUISmartChargeUtilities historicalFullChargeDurationStartingAt:80 withMinimumPluginDuration:1200];
    if ((unint64_t)[v5 count] >= 3)
    {
      uint64_t v6 = [v5 sortedArrayUsingSelector:sel_compare_];
      uint64_t v7 = objc_msgSend(v6, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 2);

      uint64_t v5 = (void *)v7;
    }
    [v5 percentile:0.95];
    double v9 = v8 / 60.0;
    unint64_t v10 = [v5 count];
    double v11 = fmax(fmin(v9, 180.0), 40.0);
    if (v10 <= 3) {
      double v11 = 90.0;
    }
    self->_double empiricalTimeToFullChargeDurationMinutes = v11;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      double empiricalTimeToFullChargeDurationMinutes = self->_empiricalTimeToFullChargeDurationMinutes;
      int v15 = 134218240;
      double v16 = v9;
      __int16 v17 = 2048;
      double v18 = empiricalTimeToFullChargeDurationMinutes;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Recompiled empirical TTFC - raw: %f, adjusted: %f", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v14 = [NSNumber numberWithDouble:self->_empiricalTimeToFullChargeDurationMinutes];
    [(PowerUISmartChargeManager *)self setNumber:v14 forPreferenceKey:@"empiricalFullChargeDuration"];
  }
}

- (double)durationToFullChargeFromBatteryLevel:(unint64_t)a3
{
  [(PowerUISmartChargeManager *)self durationToFullChargeFromBatteryLevel:a3 includeTLCDelay:0];
  return result;
}

- (double)durationToFullChargeFromBatteryLevel:(unint64_t)a3 includeTLCDelay:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a4)
  {
    uint64_t v6 = +[PowerUISmartChargeUtilities batteryProperties];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"ChargerData"];
    double v8 = [v7 objectForKeyedSubscript:@"NotChargingReason"];

    if (([v8 unsignedLongLongValue] & 0x11E) != 0)
    {
      if (self->_checkpoint - 5 <= 4) {
        self->_encounteredTLCDuringTopOff = 1;
      }
      log = self->_log;
      double v10 = 2700.0;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        double v11 = log;
        int v16 = 134217984;
        uint64_t v17 = [v8 unsignedLongLongValue];
        _os_log_impl(&dword_22135E000, v11, OS_LOG_TYPE_DEFAULT, "TLC Engaged; Projecting additional charge delay (Not Charging reason: %llu)",
          (uint8_t *)&v16,
          0xCu);
      }
    }
    else
    {
      double v10 = 900.0;
    }
  }
  else
  {
    double v10 = 900.0;
  }
  double empiricalTimeToFullChargeDurationMinutes = self->_empiricalTimeToFullChargeDurationMinutes;
  if (empiricalTimeToFullChargeDurationMinutes <= 2.22507386e-308) {
    double empiricalTimeToFullChargeDurationMinutes = 90.0;
  }
  double v13 = empiricalTimeToFullChargeDurationMinutes / 20.0 * (double)(100 - a3);
  double v14 = empiricalTimeToFullChargeDurationMinutes + 80.0 - (double)a3;
  if (a3 > 0x4F) {
    double v14 = v13;
  }
  return v10 + v14 * 60.0;
}

- (unint64_t)projectedBatteryLevelForDuration:(unint64_t)a3 withInitialBatteryLevel:(unint64_t)a4
{
  [(PowerUISmartChargeManager *)self durationToFullChargeFromBatteryLevel:a4];
  if (v6 <= (double)a3) {
    return 100;
  }
  else {
    return (unint64_t)((double)(100 - a4) / (v6 / (double)a3)) + a4;
  }
}

- (BOOL)deviceHasEnoughPluggedInTime
{
  uint64_t v3 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"activityMinHistory"];
  double v4 = v3;
  if (v3) {
    double v5 = (double)(int)[v3 intValue];
  }
  else {
    double v5 = 14.0;
  }
  BOOL v6 = +[PowerUISmartChargeUtilities deviceHasEnoughPluggedInTimeWithMinimumDays:self->_context withContext:self->_defaultsDomain withDefaultsDomain:v5];

  return v6;
}

- (id)desktopModeOverride
{
  return [(PowerUISmartChargeManager *)self readStringForPreferenceKey:@"overrideDesktopMode"];
}

- (void)evaluateIfDesktopDeviceForced:(BOOL)a3
{
  self->_BOOL isDesktopDevice = 0;
}

- (void)forceDEoCReevaluation
{
  [(PowerUISmartChargeManager *)self cacheCurrentDEoCBehaviorForced:1];
  [(PowerUISmartChargeManager *)self evaluateIfDEoCDevice];
}

- (void)cacheCurrentDEoCBehaviorForced:(BOOL)a3
{
  uint64_t v161 = *MEMORY[0x263EF8340];
  double v5 = (void *)os_transaction_create();
  unint64_t v6 = 0x2645A5000uLL;
  +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:@"Beginning of cacheCurrentDEoC"];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    -[PowerUISmartChargeManager cacheCurrentDEoCBehaviorForced:].cold.6((unsigned __int8 *)self, log);
  }
  if (!+[PowerUISmartChargeUtilities isOBCSupported]
    || !+[PowerUISmartChargeUtilities isDEoCDryRunSupported])
  {
    goto LABEL_42;
  }
  if (+[PowerUISmartChargeUtilities isPluggedInWithContext:self->_context]&& !a3)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
      -[PowerUISmartChargeManager cacheCurrentDEoCBehaviorForced:].cold.5();
    }
    goto LABEL_42;
  }
  BOOL v133 = a3;
  double v8 = [MEMORY[0x263EFF9A0] dictionary];
  [v8 setObject:&unk_26D385768 forKeyedSubscript:@"DEoCStatus"];
  unint64_t v9 = 0x263EFF000uLL;
  double v10 = [MEMORY[0x263EFF910] date];
  [v8 setObject:v10 forKeyedSubscript:@"cacheDate"];

  double v11 = [MEMORY[0x263EFF910] distantPast];
  [v8 setObject:v11 forKeyedSubscript:@"committedDate"];

  if ([(PowerUISmartChargeManager *)self isDEoCSupported]) {
    uint64_t v12 = MEMORY[0x263EFFA80];
  }
  else {
    uint64_t v12 = MEMORY[0x263EFFA88];
  }
  [v8 setObject:v12 forKeyedSubscript:@"dryRun"];
  unint64_t v13 = 0x263F08000uLL;
  if (self->_temporarilyDisabled)
  {
    double v14 = &unk_26D3857C8;
LABEL_19:
    [v8 setObject:v14 forKeyedSubscript:@"DEoCStatus"];
    uint64_t v17 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"forcedDEoC"];
    goto LABEL_20;
  }
  if (!self->_enabled || !self->_deocFeatureState)
  {
    double v14 = &unk_26D3857E0;
    goto LABEL_19;
  }
  int v15 = [MEMORY[0x263F08AB0] processInfo];
  char v16 = [v15 isLowPowerModeEnabled];

  if (v16)
  {
    double v14 = &unk_26D3857F8;
    goto LABEL_19;
  }
  if (self->_deocFeatureState != 1)
  {
    uint64_t v30 = self->_log;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      [(PowerUISmartChargeManager *)(uint64_t *)&self->_deocFeatureState cacheCurrentDEoCBehaviorForced:v31];
    }
    double v14 = &unk_26D385660;
    goto LABEL_19;
  }
  if ([(PowerUIBatteryMitigationManager *)self->_batteryMitigationManager mitigationsCurrentlyEnabled])
  {
    double v14 = &unk_26D385810;
    goto LABEL_19;
  }
  __int16 v32 = [MEMORY[0x263EFF910] date];
  uint64_t v33 = +[PowerUISmartChargeUtilities drainSessionsInfoBetweenRelevantChargesBefore:v32 withMinimumDuration:0.0];

  __int16 v34 = self->_log;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v149 = v33;
    _os_log_impl(&dword_22135E000, v34, OS_LOG_TYPE_DEFAULT, "Drain sessions info found: %@", buf, 0xCu);
  }
  BOOL v35 = +[PowerUISmartChargeUtilities drainBetweenRelevantEventsFromDrainSessionInfo:v33];
  BOOL v36 = self->_log;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v37 = v36;
    uint64_t v38 = [v35 count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v149 = v38;
    _os_log_impl(&dword_22135E000, v37, OS_LOG_TYPE_DEFAULT, "Found %lu instances of historic drain between relevant charge sessions", buf, 0xCu);
  }
  if ([v35 count])
  {
    double v39 = [v35 lastObject];
    [v8 setObject:v39 forKeyedSubscript:@"mostRecentDrain"];
  }
  else
  {
    [v8 setObject:&unk_26D385630 forKeyedSubscript:@"mostRecentDrain"];
  }
  if (kMaxDEoCBatteryDrain) {
    int v40 = 60;
  }
  else {
    int v40 = 70;
  }
  int v41 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"DEoCThresholdOverride"];
  if (v41)
  {
    int v42 = self->_log;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v43 = v42;
      int v44 = [v41 intValue];
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v149) = v44;
      _os_log_impl(&dword_22135E000, v43, OS_LOG_TYPE_DEFAULT, "Using DEoC override value: %d", buf, 8u);
    }
    int v40 = [v41 intValue];
  }
  v127 = v41;
  int v128 = v5;
  v129 = (void *)v33;
  id v130 = v8;
  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  obuint64_t j = v35;
  uint64_t v45 = [obj countByEnumeratingWithState:&v143 objects:v160 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    int v47 = 0;
    uint64_t v48 = *(void *)v144;
    do
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v144 != v48) {
          objc_enumerationMutation(obj);
        }
        double v50 = *(void **)(*((void *)&v143 + 1) + 8 * i);
        double v51 = self->_log;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v149 = (uint64_t)v50;
          _os_log_impl(&dword_22135E000, v51, OS_LOG_TYPE_DEFAULT, "  drain: %@", buf, 0xCu);
        }
        if ((int)[v50 intValue] >= v40) {
          ++v47;
        }
      }
      uint64_t v46 = [obj countByEnumeratingWithState:&v143 objects:v160 count:16];
    }
    while (v46);
  }
  else
  {
    int v47 = 0;
  }

  double v52 = self->_log;
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218240;
    uint64_t v149 = v47;
    __int16 v150 = 2048;
    unint64_t v151 = (void *)v40;
    _os_log_impl(&dword_22135E000, v52, OS_LOG_TYPE_DEFAULT, "Found %lu instances of historic drain above the threshold of %lu between relevant charge sessions", buf, 0x16u);
  }
  unint64_t v53 = [v129 firstObject];
  double v5 = v128;
  id v126 = (void *)v53;
  if (v53)
  {
    double v54 = [MEMORY[0x263EFF910] date];
    double v55 = [(id)v53 objectForKeyedSubscript:@"start"];
    [v54 timeIntervalSinceDate:v55];
    unint64_t v53 = (int)v56 / 86400;
  }
  unint64_t v57 = [(PowerUITrialManager *)self->_trialManager longFactorForName:@"minDaysOfChargingHistoryRequiredForDEoCModel"];
  unint64_t v58 = [(PowerUITrialManager *)self->_trialManager longFactorForName:@"minNumberOfRelevantDrainsRequiredForDEoCModel"];
  double v59 = self->_log;
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    trialManager = self->_trialManager;
    uint64_t v61 = v59;
    unint64_t v62 = [(PowerUITrialManager *)trialManager experimentID];
    uint64_t v63 = [(PowerUITrialManager *)self->_trialManager treatmentID];
    *(_DWORD *)long long buf = 138413570;
    uint64_t v149 = (uint64_t)v62;
    __int16 v150 = 2112;
    unint64_t v151 = v63;
    __int16 v152 = 2112;
    id v153 = @"minDaysOfChargingHistoryRequiredForDEoCModel";
    __int16 v154 = 2048;
    unint64_t v155 = v57;
    __int16 v156 = 2112;
    id v157 = @"minNumberOfRelevantDrainsRequiredForDEoCModel";
    __int16 v158 = 2048;
    unint64_t v159 = v58;
    _os_log_impl(&dword_22135E000, v61, OS_LOG_TYPE_DEFAULT, "DEoC Trial parameters from experiment: %@ and treatment: %@ \n loaded: \n %@:%ld \n %@:%ld", buf, 0x3Eu);
  }
  if (v53 < v57)
  {
    [v130 setObject:&unk_26D385828 forKeyedSubscript:@"DEoCStatus"];
    unint64_t v125 = v53;
    double v8 = v130;
    objc_msgSend(NSString, "stringWithFormat:", @"daysSinceFirstChargeSession : %ld < minDaysOfChargingHistoryRequiredForDEoCModel : %ld", v125, v57);
    double v64 = (PowerUIMLRelevantDrainPredictor *)objc_claimAutoreleasedReturnValue();
    __int16 v65 = v130;
LABEL_86:
    [v65 setObject:v64 forKeyedSubscript:@"reasonString"];
    char v66 = 0;
    goto LABEL_87;
  }
  if ([v129 count] < v58)
  {
    double v8 = v130;
    [v130 setObject:&unk_26D385840 forKeyedSubscript:@"DEoCStatus"];
    objc_msgSend(NSString, "stringWithFormat:", @"numberOfHistoricalDrainSessions : %ld < minNumberOfRelevantDrainsRequiredForDEoCModel : %ld", objc_msgSend(v129, "count"), v58);
    double v64 = (PowerUIMLRelevantDrainPredictor *)objc_claimAutoreleasedReturnValue();
    __int16 v65 = v130;
    goto LABEL_86;
  }
  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  id v134 = self->_monitors;
  uint64_t v67 = [(NSArray *)v134 countByEnumeratingWithState:&v139 objects:v147 count:16];
  if (!v67)
  {

    unint64_t v6 = 0x2645A5000uLL;
    double v8 = v130;
    unint64_t v9 = 0x263EFF000uLL;
    goto LABEL_121;
  }
  uint64_t v68 = v67;
  char v131 = 1;
  uint64_t v69 = *(void *)v140;
  do
  {
    for (uint64_t j = 0; j != v68; ++j)
    {
      if (*(void *)v140 != v69) {
        objc_enumerationMutation(v134);
      }
      v71 = *(void **)(*((void *)&v139 + 1) + 8 * j);
      if (![(PowerUITrialManager *)self->_trialManager useTrialEnabledFeature:@"disableLocationCheckForDEoC"]|| (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v73 = [v71 requiredFullChargeDate];
        if (!v73) {
          goto LABEL_115;
        }
        v74 = [MEMORY[0x263EFF910] distantPast];
        int v75 = [v73 isEqualToDate:v74];

        if (!v75) {
          goto LABEL_115;
        }
        uint64_t v76 = [v71 signalID];
        switch(v76)
        {
          case 3:
            [v130 setObject:&unk_26D3857B0 forKeyedSubscript:@"DEoCStatus"];
            uint64_t v80 = self->_log;
            char v131 = 0;
            if (!os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_115;
            }
            *(_WORD *)long long buf = 0;
            v78 = v80;
            double v79 = "Opting out of DEoC due to calendar";
            break;
          case 5:
            [v130 setObject:&unk_26D385720 forKeyedSubscript:@"DEoCStatus"];
            v81 = self->_log;
            char v131 = 0;
            if (!os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_115;
            }
            *(_WORD *)long long buf = 0;
            v78 = v81;
            double v79 = "Opting out of DEoC due to wallet";
            break;
          case 4:
            [v130 setObject:&unk_26D385750 forKeyedSubscript:@"DEoCStatus"];
            v77 = self->_log;
            char v131 = 0;
            if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              v78 = v77;
              double v79 = "Opting out of DEoC due to location";
              break;
            }
LABEL_115:

            continue;
          default:
            [v130 setObject:&unk_26D385678 forKeyedSubscript:@"DEoCStatus"];
            uint64_t v82 = self->_log;
            if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT)) {
              [(PowerUISmartChargeManager *)&v137 cacheCurrentDEoCBehaviorForced:v82];
            }
LABEL_114:
            char v131 = 0;
            goto LABEL_115;
        }
        _os_log_impl(&dword_22135E000, v78, OS_LOG_TYPE_DEFAULT, v79, buf, 2u);
        goto LABEL_114;
      }
      v72 = self->_log;
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22135E000, v72, OS_LOG_TYPE_DEFAULT, "Skipping location check for DEoC", buf, 2u);
      }
    }
    uint64_t v68 = [(NSArray *)v134 countByEnumeratingWithState:&v139 objects:v147 count:16];
  }
  while (v68);

  unint64_t v6 = 0x2645A5000;
  double v8 = v130;
  unint64_t v9 = 0x263EFF000;
  char v66 = v131;
  if (v131)
  {
LABEL_121:
    double v64 = [[PowerUIMLRelevantDrainPredictor alloc] initWithDefaultsDomain:self->_defaultsDomain withContextStore:self->_context withTrialManager:self->_trialManager];
    uint64_t v83 = [*(id *)(v6 + 2584) currentBatteryLevelWithContext:self->_context];
    uint64_t v84 = [*(id *)(v9 + 2320) date];
    double v85 = [NSNumber numberWithInteger:v83];
    double v86 = [(PowerUIMLRelevantDrainPredictor *)v64 featuresForChargeSessionAtDate:v84 withChargeStartSoC:v85 withChargeAndDrainSessionHistory:v129];

    v87 = [(PowerUIMLRelevantDrainPredictor *)v64 predictedRelevantDrainwithFeatures:v86];
    double v88 = [(PowerUIMLRelevantDrainPredictor *)v64 predictedRelevantDrainWithFeatures:v86 forSchemes:&unk_26D385B28];
    __int16 v89 = [v88 objectForKey:&unk_26D385858];
    BOOL v90 = v89;
    if (v89)
    {
      unint64_t v135 = v88;
      int v91 = [v89 significantDrainAhead];
      BOOL v92 = self->_log;
      BOOL v93 = os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT);
      if (v91)
      {
        if (v93)
        {
          unint64_t v94 = v92;
          [v90 confidence];
          *(_DWORD *)long long buf = 134217984;
          uint64_t v149 = v95;
          _os_log_impl(&dword_22135E000, v94, OS_LOG_TYPE_DEFAULT, "80%% model predicts deep drain ahead, check 95%% model. (confidence: %f)", buf, 0xCu);
        }
        id v132 = [v135 objectForKey:&unk_26D385870];
        if (v132)
        {
          int v96 = [v132 significantDrainAhead];
          __int16 v97 = self->_log;
          BOOL v98 = os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT);
          if (v96)
          {
            if (v98)
            {
              __int16 v99 = v97;
              [v132 confidence];
              *(_DWORD *)long long buf = 134217984;
              uint64_t v149 = v100;
              _os_log_impl(&dword_22135E000, v99, OS_LOG_TYPE_DEFAULT, "95%% model predicts deep drain ahead, do not engage. (confidence: %f)", buf, 0xCu);
            }
            double v8 = v130;
            [v130 setObject:&unk_26D385600 forKeyedSubscript:@"DEoCStatus"];
            __int16 v101 = NSString;
            v102 = [v132 description];
            __int16 v103 = [v101 stringWithFormat:@"Prediction output %@", v102];
            [v130 setObject:v103 forKeyedSubscript:@"reasonString"];

            v104 = [(PowerUIMLRelevantDrainPredictor *)v64 analyticsEventFromFeatures:v86];
            [v130 setObject:v104 forKeyedSubscript:@"featureAnalytics"];

            __int16 v105 = NSNumber;
            [(PowerUIMLRelevantDrainPredictor *)v64 threshold];
            v106 = objc_msgSend(v105, "numberWithDouble:");
            [v130 setObject:v106 forKeyedSubscript:@"modelThreshold"];

            v107 = &unk_26D385678;
            v108 = @"socLimit";
            goto LABEL_139;
          }
          if (v98)
          {
            v117 = v97;
            [v132 confidence];
            *(_DWORD *)long long buf = 134217984;
            uint64_t v149 = v118;
            _os_log_impl(&dword_22135E000, v117, OS_LOG_TYPE_DEFAULT, "95%% model engaged. (confidence: %f)", buf, 0xCu);
          }
          double v8 = v130;
          [v130 setObject:&unk_26D385798 forKeyedSubscript:@"DEoCStatus"];
          v119 = NSString;
          double v120 = [v132 description];
          double v121 = [v119 stringWithFormat:@"Prediction output %@", v120];
          [v130 setObject:v121 forKeyedSubscript:@"reasonString"];

          double v122 = [(PowerUIMLRelevantDrainPredictor *)v64 analyticsEventFromFeatures:v86];
          [v130 setObject:v122 forKeyedSubscript:@"featureAnalytics"];

          double v123 = NSNumber;
          [(PowerUIMLRelevantDrainPredictor *)v64 threshold];
          BOOL v124 = objc_msgSend(v123, "numberWithDouble:");
          [v130 setObject:v124 forKeyedSubscript:@"modelThreshold"];

          [v130 setObject:&unk_26D385888 forKeyedSubscript:@"socLimit"];
          char v66 = 1;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_FAULT)) {
            -[PowerUISmartChargeManager cacheCurrentDEoCBehaviorForced:]();
          }
          v107 = &unk_26D385660;
          v108 = @"DEoCStatus";
          double v8 = v130;
LABEL_139:
          [v8 setObject:v107 forKeyedSubscript:v108];
          char v66 = 0;
        }
        double v5 = v128;
      }
      else
      {
        if (v93)
        {
          v109 = v92;
          [v90 confidence];
          *(_DWORD *)long long buf = 134217984;
          uint64_t v149 = v110;
          _os_log_impl(&dword_22135E000, v109, OS_LOG_TYPE_DEFAULT, "80%% model engaged. (confidence: %f)", buf, 0xCu);
        }
        [v8 setObject:&unk_26D385798 forKeyedSubscript:@"DEoCStatus"];
        v111 = NSString;
        v112 = [v90 description];
        v113 = [v111 stringWithFormat:@"Prediction output %@", v112];
        [v8 setObject:v113 forKeyedSubscript:@"reasonString"];

        v114 = [(PowerUIMLRelevantDrainPredictor *)v64 analyticsEventFromFeatures:v86];
        [v8 setObject:v114 forKeyedSubscript:@"featureAnalytics"];

        v115 = NSNumber;
        [(PowerUIMLRelevantDrainPredictor *)v64 threshold];
        v116 = objc_msgSend(v115, "numberWithDouble:");
        [v8 setObject:v116 forKeyedSubscript:@"modelThreshold"];

        [v8 setObject:&unk_26D3858A0 forKeyedSubscript:@"socLimit"];
        char v66 = 1;
      }
      double v88 = v135;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_FAULT)) {
        -[PowerUISmartChargeManager cacheCurrentDEoCBehaviorForced:]();
      }
      [v8 setObject:&unk_26D385660 forKeyedSubscript:@"DEoCStatus"];
      char v66 = 0;
    }

LABEL_87:
    unint64_t v6 = 0x2645A5000;
    unint64_t v9 = 0x263EFF000;
  }
  uint64_t v17 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"forcedDEoC"];
  if (v66)
  {
    BOOL v18 = 1;
    unint64_t v13 = 0x263F08000;
  }
  else
  {
    unint64_t v13 = 0x263F08000;
LABEL_20:
    BOOL v18 = 0;
    if ([*(id *)(v6 + 2584) isInternalBuild] && v17)
    {
      if ([v17 BOOLValue] && !self->_temporarilyDisabled && self->_deocFeatureState == 1)
      {
        uint64_t v19 = self->_log;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_22135E000, v19, OS_LOG_TYPE_DEFAULT, "DEoC engagement forced by internal settings override", buf, 2u);
        }
        [v8 setObject:&unk_26D3858B8 forKeyedSubscript:@"DEoCStatus"];
        BOOL v18 = 1;
      }
      else
      {
        BOOL v18 = 0;
      }
    }
  }
  int v20 = [*(id *)(v13 + 2584) numberWithBool:v18];
  [v8 setObject:v20 forKeyedSubscript:@"limitCharge"];

  self->_BOOL isDesktopDevice = v18;
  double v21 = self->_log;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isDesktopDevice = self->_isDesktopDevice;
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v149) = isDesktopDevice;
    _os_log_impl(&dword_22135E000, v21, OS_LOG_TYPE_DEFAULT, "Device is detected to be eligible for DEoC: %hhd", buf, 8u);
  }
  [(NSLock *)self->_deocCurrentStatusLock lock];
  if (!v133)
  {
    double v23 = [*(id *)(v6 + 2584) readDictForPreferenceKey:@"CurrentDEoCStatus" inDomain:self->_defaultsDomain];
    double v24 = [*(id *)(v9 + 2320) date];
    unint64_t v25 = [v23 objectForKeyedSubscript:@"committedDate"];
    [v24 timeIntervalSinceDate:v25];
    double v27 = v26;

    if (v27 > 0.0 && v27 < 20.0)
    {
      unint64_t v28 = self->_log;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22135E000, v28, OS_LOG_TYPE_DEFAULT, "Abort caching the DEoC state, we are commited to current cache!", buf, 2u);
      }
      [(NSLock *)self->_deocCurrentStatusLock unlock];

      goto LABEL_41;
    }
  }
  [*(id *)(v6 + 2584) setDict:v8 forPreferenceKey:@"CurrentDEoCStatus" inDomain:self->_defaultsDomain];
  uint64_t v29 = self->_log;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v149 = (uint64_t)v8;
    _os_log_impl(&dword_22135E000, v29, OS_LOG_TYPE_DEFAULT, "Saved current DEoC status: %@", buf, 0xCu);
  }
  [(NSLock *)self->_deocCurrentStatusLock unlock];
  [*(id *)(v6 + 2584) logMemoryUsageInternalForEvent:@"End of cacheCurrentDEoC"];
LABEL_41:

LABEL_42:
}

- (void)evaluateChargeLimitRecommendationForced:(BOOL)a3
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  double v5 = (void *)os_transaction_create();
  unint64_t v6 = [MEMORY[0x263EFF910] date];
  uint64_t v7 = +[PowerUISmartChargeUtilities drainSessionsInfoBetweenRelevantChargesBefore:v6 withMinimumDuration:0.0];

  double v8 = [v7 firstObject];
  if (v8)
  {
    unint64_t v9 = [MEMORY[0x263EFF910] date];
    double v10 = [v8 objectForKeyedSubscript:@"start"];
    [v9 timeIntervalSinceDate:v10];
    unint64_t v12 = (int)v11 / 86400;
  }
  else
  {
    unint64_t v12 = 0;
  }
  if (v12 > 0xB || a3)
  {
    double v14 = +[PowerUISmartChargeUtilities drainBetweenRelevantEventsFromDrainSessionInfo:v7];
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      char v16 = log;
      *(_DWORD *)long long buf = 134217984;
      *(void *)v71 = [v14 count];
      _os_log_impl(&dword_22135E000, v16, OS_LOG_TYPE_DEFAULT, "Found %lu instances of historic drain between relevant charge sessions", buf, 0xCu);
    }
    if ((unint64_t)[v14 count] <= 0xD && !a3)
    {
      uint64_t v17 = self->_log;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v18 = v17;
        uint64_t v19 = [v14 count];
        *(_DWORD *)long long buf = 134217984;
        *(void *)v71 = v19;
        _os_log_impl(&dword_22135E000, v18, OS_LOG_TYPE_DEFAULT, "Only %lu available", buf, 0xCu);
      }
      self->_unint64_t recommendedLimit = 202;
      +[PowerUISmartChargeUtilities setNumber:&unk_26D3858D0 forPreferenceKey:@"ChargeLimitRecommendation" inDomain:self->_defaultsDomain];
LABEL_66:

      goto LABEL_67;
    }
    unsigned int v20 = vcvtpd_s64_f64((double)v12 / 6.0);
    double v21 = self->_log;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)v71 = v20;
      _os_log_impl(&dword_22135E000, v21, OS_LOG_TYPE_DEFAULT, "  max instances above threshold: %d", buf, 8u);
    }
    signed int v60 = v20;
    unint64_t v62 = v8;
    uint64_t v63 = v7;
    int v22 = self;
    double v64 = v5;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    uint64_t v61 = v14;
    obuint64_t j = v14;
    uint64_t v23 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      signed int v25 = 0;
      signed int v26 = 0;
      signed int v27 = 0;
      signed int v28 = 0;
      uint64_t v29 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v67 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v31 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          __int16 v32 = v22->_log;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)v71 = v31;
            _os_log_impl(&dword_22135E000, v32, OS_LOG_TYPE_DEFAULT, "  drain: %@", buf, 0xCu);
          }
          if ((int)[v31 intValue] > 60) {
            ++v28;
          }
          if ((int)[v31 intValue] > 65) {
            ++v27;
          }
          if ((int)[v31 intValue] > 70) {
            ++v26;
          }
          if ((int)[v31 intValue] > 75) {
            ++v25;
          }
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
      }
      while (v24);
    }
    else
    {
      signed int v25 = 0;
      signed int v26 = 0;
      signed int v27 = 0;
      signed int v28 = 0;
    }

    if (v28 <= v60)
    {
      __int16 v34 = v22;
      int v41 = v22->_log;
      double v5 = v64;
      unint64_t v35 = 0x263EFF000;
      unint64_t v36 = 0x2645A5000;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        uint64_t v39 = 80;
        *(void *)v71 = 80;
        _os_log_impl(&dword_22135E000, v41, OS_LOG_TYPE_DEFAULT, "Recommend limit %lu", buf, 0xCu);
        int v40 = &unk_26D3858A0;
      }
      else
      {
        int v40 = &unk_26D3858A0;
        uint64_t v39 = 80;
      }
      uint64_t v7 = v63;
    }
    else
    {
      BOOL v33 = v27 <= v60;
      double v5 = v64;
      __int16 v34 = v22;
      unint64_t v35 = 0x263EFF000uLL;
      unint64_t v36 = 0x2645A5000uLL;
      if (v33)
      {
        int v42 = v22->_log;
        uint64_t v7 = v63;
        if (os_log_type_enabled((os_log_t)v34->_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 134217984;
          uint64_t v39 = 85;
          *(void *)v71 = 85;
          _os_log_impl(&dword_22135E000, v42, OS_LOG_TYPE_DEFAULT, "Recommend limit %lu", buf, 0xCu);
          int v40 = &unk_26D3858E8;
        }
        else
        {
          int v40 = &unk_26D3858E8;
          uint64_t v39 = 85;
        }
      }
      else
      {
        if (v26 > v60)
        {
          unint64_t v37 = v22->_log;
          BOOL v38 = os_log_type_enabled((os_log_t)v34->_log, OS_LOG_TYPE_DEFAULT);
          uint64_t v7 = v63;
          if (v25 <= v60)
          {
            double v14 = v61;
            if (v38)
            {
              *(_DWORD *)long long buf = 134217984;
              uint64_t v39 = 95;
              *(void *)v71 = 95;
              _os_log_impl(&dword_22135E000, v37, OS_LOG_TYPE_DEFAULT, "Recommend limit %lu", buf, 0xCu);
              int v40 = &unk_26D385888;
            }
            else
            {
              int v40 = &unk_26D385888;
              uint64_t v39 = 95;
            }
          }
          else
          {
            double v14 = v61;
            if (v38)
            {
              *(_DWORD *)long long buf = 134217984;
              uint64_t v39 = 100;
              *(void *)v71 = 100;
              _os_log_impl(&dword_22135E000, v37, OS_LOG_TYPE_DEFAULT, "Recommend limit %lu", buf, 0xCu);
              int v40 = &unk_26D385678;
            }
            else
            {
              int v40 = &unk_26D385678;
              uint64_t v39 = 100;
            }
          }
          goto LABEL_56;
        }
        uint64_t v43 = v22->_log;
        uint64_t v7 = v63;
        if (os_log_type_enabled((os_log_t)v34->_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 134217984;
          uint64_t v39 = 90;
          *(void *)v71 = 90;
          _os_log_impl(&dword_22135E000, v43, OS_LOG_TYPE_DEFAULT, "Recommend limit %lu", buf, 0xCu);
          int v40 = &unk_26D3858B8;
        }
        else
        {
          int v40 = &unk_26D3858B8;
          uint64_t v39 = 90;
        }
      }
    }
    double v14 = v61;
LABEL_56:
    v34->_unint64_t recommendedLimit = v39;
    [*(id *)(v36 + 2584) setNumber:v40 forPreferenceKey:@"ChargeLimitRecommendation" inDomain:v34->_defaultsDomain];
    if (v34->_manualChargeLimitWasEverEnabled
      || (unint64_t v44 = v34->_recommendedLimit, v44 - 80 > 0x13)
      || v44 == v34->_mclTargetSoC
      || ![*(id *)(v36 + 2584) isiPhone])
    {
      uint64_t v48 = v34->_log;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        BOOL manualChargeLimitWasEverEnabled = v34->_manualChargeLimitWasEverEnabled;
        unint64_t recommendedLimit = v34->_recommendedLimit;
        int mclTargetSoC = v34->_mclTargetSoC;
        *(_DWORD *)long long buf = 67109632;
        *(_DWORD *)v71 = manualChargeLimitWasEverEnabled;
        *(_WORD *)&v71[4] = 2048;
        *(void *)&v71[6] = recommendedLimit;
        __int16 v72 = 1024;
        int v73 = mclTargetSoC;
        _os_log_impl(&dword_22135E000, v48, OS_LOG_TYPE_DEFAULT, "Don't recommend new limit - MCLWasEverEnabled: %d - _recommendedLimit: %lu - _mclTargetSoC: %hhu", buf, 0x18u);
      }
    }
    else
    {
      uint64_t v45 = [(PowerUISmartChargeManager *)v34 readDateForPreferenceKey:@"chargeLimitRecommendationPostDate"];
      uint64_t v46 = v34->_log;
      BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
      if (v45)
      {
        if (v47)
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)v71 = v45;
          _os_log_impl(&dword_22135E000, v46, OS_LOG_TYPE_DEFAULT, "Don't recommend new limit, already recommended at %@", buf, 0xCu);
        }
      }
      else
      {
        if (v47)
        {
          double v52 = NSNumber;
          unint64_t v53 = v34->_recommendedLimit;
          double v54 = v46;
          double v55 = [v52 numberWithUnsignedInteger:v53];
          *(_DWORD *)long long buf = 138412290;
          *(void *)v71 = v55;
          _os_log_impl(&dword_22135E000, v54, OS_LOG_TYPE_DEFAULT, "Recommend charge limit for %@", buf, 0xCu);
        }
        double v56 = +[PowerUINotificationManager sharedInstance];
        id v57 = (id)objc_msgSend(v56, "postChargeLimitRecommendationWithLimit:", -[PowerUISmartChargeManager getUISoCChargeLimit](v34, "getUISoCChargeLimit"));

        unint64_t v58 = [*(id *)(v35 + 2320) now];
        [(PowerUISmartChargeManager *)v34 setDate:v58 forPreferenceKey:@"chargeLimitRecommendationPostDate"];

        double v59 = [NSNumber numberWithUnsignedInteger:v34->_recommendedLimit];
        [(PowerUISmartChargeManager *)v34 setNumber:v59 forPreferenceKey:@"chargeLimitRecommendationValue"];
      }
    }
    [(PowerUISmartChargeManager *)v34 sendChargeLimitRecommendationAnalytics];
    double v8 = v62;
    goto LABEL_66;
  }
  unint64_t v13 = self->_log;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)v71 = v12;
    _os_log_impl(&dword_22135E000, v13, OS_LOG_TYPE_DEFAULT, "Earliest charge session is only %lu days old", buf, 0xCu);
  }
  self->_unint64_t recommendedLimit = 201;
  +[PowerUISmartChargeUtilities setNumber:&unk_26D3856A8 forPreferenceKey:@"ChargeLimitRecommendation" inDomain:self->_defaultsDomain];
LABEL_67:
}

- (void)sendChargeLimitRecommendationAnalytics
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  double v4 = v3;
  if (self->_manualChargeLimitStatus == 1)
  {
    double v5 = [NSNumber numberWithUnsignedChar:self->_mclTargetSoC];
    [v4 setObject:v5 forKeyedSubscript:@"currentLimit"];
  }
  else
  {
    [v3 setObject:&unk_26D385900 forKeyedSubscript:@"currentLimit"];
  }
  unint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_recommendedLimit];
  [v4 setObject:v6 forKeyedSubscript:@"currentRecommendation"];

  uint64_t v7 = [(PowerUISmartChargeManager *)self readDateForPreferenceKey:@"mostRecentChargeLimitSetDate"];
  if (v7)
  {
    double v8 = [MEMORY[0x263EFF910] now];
    [v8 timeIntervalSinceDate:v7];
    double v10 = v9;

    double v11 = [NSNumber numberWithDouble:v10 / 86400.0];
    [v4 setObject:v11 forKeyedSubscript:@"daysSinceLastChange"];
  }
  else
  {
    [v4 setObject:&unk_26D385630 forKeyedSubscript:@"daysSinceLastChange"];
  }
  uint64_t v12 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"chargeLimitRecommendationValue"];
  unint64_t v13 = (void *)v12;
  if (v12) {
    double v14 = (void *)v12;
  }
  else {
    double v14 = &unk_26D385630;
  }
  [v4 setObject:v14 forKeyedSubscript:@"initialChargeLimitRecommendation"];
  uint64_t v15 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"didTapChargeLimitRecommendation"];
  char v16 = (void *)v15;
  if (v15) {
    uint64_t v17 = (void *)v15;
  }
  else {
    uint64_t v17 = &unk_26D385630;
  }
  [v4 setObject:v17 forKeyedSubscript:@"tappedChargeLimitNotification"];
  BOOL v18 = [(PowerUISmartChargeManager *)self readDateForPreferenceKey:@"chargeLimitRecommendationPostDate"];
  uint64_t v19 = [(PowerUISmartChargeManager *)self readDateForPreferenceKey:@"initialChargeLimitSetDate"];
  unsigned int v20 = v19;
  if (v18 || !v19)
  {
    if (!v18 || v19)
    {
      if (v18 && v19)
      {
        [v19 timeIntervalSinceDate:v18];
        uint64_t v23 = [NSNumber numberWithDouble:v22 / 86400.0];
        [v4 setObject:v23 forKeyedSubscript:@"limitEnabledDaysAfterNotification"];

        goto LABEL_24;
      }
      double v21 = &unk_26D385930;
    }
    else
    {
      double v21 = &unk_26D385918;
    }
  }
  else
  {
    double v21 = &unk_26D385630;
  }
  [v4 setObject:v21 forKeyedSubscript:@"limitEnabledDaysAfterNotification"];
LABEL_24:
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    signed int v28 = v4;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Sending chargelimitrecommendation to CA: %@", buf, 0xCu);
  }
  signed int v26 = v4;
  id v25 = v4;
  AnalyticsSendEventLazy();
}

id __67__PowerUISmartChargeManager_sendChargeLimitRecommendationAnalytics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)powerStateChangedCallback
{
  if (+[PowerUISmartChargeUtilities isPluggedInWithContext:](PowerUISmartChargeUtilities, "isPluggedInWithContext:", self->_context)&& ([MEMORY[0x263F08AB0] processInfo], uint64_t v3 = objc_claimAutoreleasedReturnValue(), v4 = objc_msgSend(v3, "isLowPowerModeEnabled"), v3, (v4 & 1) == 0))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_INFO, "LPM disabled on charger", buf, 2u);
    }
  }
  else
  {
    double v5 = self->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_22135E000, v5, OS_LOG_TYPE_DEFAULT, "LPM state changed, reevaluate DEoC", v7, 2u);
    }
    [(PowerUISmartChargeManager *)self forceDEoCReevaluation];
  }
}

- (void)evaluateIfDEoCDevice
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(NSLock *)self->_deocCurrentStatusLock lock];
  uint64_t v3 = +[PowerUISmartChargeUtilities readDictForPreferenceKey:@"CurrentDEoCStatus" inDomain:self->_defaultsDomain];
  [(NSLock *)self->_deocCurrentStatusLock unlock];
  char v4 = [MEMORY[0x263EFF910] date];
  double v5 = [v3 objectForKeyedSubscript:@"cacheDate"];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  log = self->_log;
  BOOL v9 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (!v3 || v7 < 0.0)
  {
    if (v9)
    {
      int v11 = 138412290;
      uint64_t v12 = v3;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "DEoC cached prediction is invalid, do not engage DEoC: %@", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_9;
  }
  if (v9)
  {
    int v11 = 138412290;
    uint64_t v12 = v3;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "DEoC has a valid cached prediction: %@", (uint8_t *)&v11, 0xCu);
  }
  if (![(PowerUISmartChargeManager *)self isDEoCSupported])
  {
LABEL_9:
    self->_BOOL isDesktopDevice = 0;
    goto LABEL_10;
  }
  double v10 = [v3 objectForKeyedSubscript:@"limitCharge"];
  self->_BOOL isDesktopDevice = [v10 BOOLValue];

LABEL_10:
}

- (void)resetDeviceHasLegitimateUsage
{
  if (self->_checkpoint
    || [(PowerUISmartChargeManager *)self deviceHasOverriddenLegitimateUsageDetection])
  {
    self->__hasLegitimateUsage = 1;
  }
  else
  {
    BOOL v3 = [(PowerUISmartChargeManager *)self deviceHasEnoughPluggedInTime];
    self->__hasLegitimateUsage = v3;
    if (!v3)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v5 = 0;
        _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Legitimate Usage = 0", v5, 2u);
      }
    }
  }
  ADClientSetValueForScalarKey();
}

- (BOOL)deviceHasOverriddenLegitimateUsageDetection
{
  uint64_t v2 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"overrideCarryDetection"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)watchIsInternalAndCarrySwitchDisabled
{
  return 0;
}

void __56__PowerUISmartChargeManager_isDeviceWithLegitimateUsage__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) resetDeviceHasLegitimateUsage];
  dispatch_source_t v2 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 168));
  char v3 = (void *)isDeviceWithLegitimateUsage_legitimateDeviceDetectionTimer;
  isDeviceWithLegitimateUsage_legitimateDeviceDetectionTimer = (uint64_t)v2;

  char v4 = isDeviceWithLegitimateUsage_legitimateDeviceDetectionTimer;
  dispatch_time_t v5 = dispatch_walltime(0, 21600000000000);
  dispatch_source_set_timer(v4, v5, 0x13A52453C000uLL, 0xDF8475800uLL);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __56__PowerUISmartChargeManager_isDeviceWithLegitimateUsage__block_invoke_2;
  handler[3] = &unk_2645A5CF0;
  void handler[4] = *(void *)(a1 + 32);
  dispatch_source_set_event_handler((dispatch_source_t)isDeviceWithLegitimateUsage_legitimateDeviceDetectionTimer, handler);
  dispatch_activate((dispatch_object_t)isDeviceWithLegitimateUsage_legitimateDeviceDetectionTimer);
}

unsigned char *__56__PowerUISmartChargeManager_isDeviceWithLegitimateUsage__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) resetDeviceHasLegitimateUsage];
  double result = *(unsigned char **)(a1 + 32);
  if (!result[10])
  {
    double result = (unsigned char *)[result resetState];
    uint64_t v3 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v3 + 10))
    {
      [*(id *)(v3 + 400) clearChargeLimitForLimitType:1];
      char v4 = *(void **)(*(void *)(a1 + 32) + 400);
      return (unsigned char *)[v4 clearChargeLimitForLimitType:2];
    }
  }
  return result;
}

- (id)computeSignalDeadline
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF910] distantFuture];
  double v22 = [MEMORY[0x263EFF9A0] dictionary];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  char v4 = self->_monitors;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    uint64_t v23 = -1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (!self->_checkpoint || [*(id *)(*((void *)&v24 + 1) + 8 * i) signalID] != 4)
        {
          double v10 = objc_msgSend(v9, "requiredFullChargeDate", v22);
          if (v10)
          {
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412546;
              uint64_t v29 = v9;
              __int16 v30 = 2112;
              uint64_t v31 = v10;
              _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Monitor %@ suggested %@", buf, 0x16u);
            }
            uint64_t v12 = [v3 earlierDate:v10];

            if (v10 == (void *)v12)
            {
              uint64_t v13 = [MEMORY[0x263EFF910] distantFuture];

              uint64_t v3 = v10;
              if (v10 != v13)
              {
                uint64_t v23 = [v9 signalID];
                uint64_t v3 = v10;
              }
            }
            else
            {
              uint64_t v3 = (void *)v12;
            }
          }
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v23 = -1;
  }

  double v14 = [NSNumber numberWithInteger:v23];
  [v22 setObject:v14 forKeyedSubscript:@"decisionMaker"];

  [v22 setObject:v3 forKeyedSubscript:@"decisionDate"];
  if (self->_isDesktopDevice)
  {
    uint64_t v15 = [MEMORY[0x263EFF910] distantFuture];
    if ([v3 isEqualToDate:v15])
    {
    }
    else
    {
      char v16 = [MEMORY[0x263EFF910] distantPast];
      char v17 = [v3 isEqualToDate:v16];

      if ((v17 & 1) == 0)
      {
        [v22 setObject:&unk_26D385630 forKeyedSubscript:@"decisionMaker"];
        BOOL v18 = [MEMORY[0x263EFF910] distantFuture];
        [v22 setObject:v18 forKeyedSubscript:@"decisionDate"];

        uint64_t v19 = self->_log;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_22135E000, v19, OS_LOG_TYPE_DEFAULT, "In DEoC, ignore signals not requiring immediate charge", buf, 2u);
        }
      }
    }
  }
  unsigned int v20 = self->_log;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v29 = v3;
    _os_log_impl(&dword_22135E000, v20, OS_LOG_TYPE_DEFAULT, "Monitors suggested: %@", buf, 0xCu);
  }

  return v22;
}

- (NSDictionary)signalDeadline
{
  uint64_t v3 = [MEMORY[0x263EFF910] date];
  char v4 = v3;
  if (self->_lastComputedSignalDeadline && (objc_msgSend(v3, "timeIntervalSinceDate:"), v5 <= 600.0))
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [(PowerUISmartChargeManager *)self computeSignalDeadline];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"decisionMaker"];
    self->_deadlineSignalID = [v7 unsignedIntegerValue];

    objc_storeStrong((id *)&self->_lastComputedSignalDeadline, v4);
  }
  double v8 = [MEMORY[0x263EFF9A0] dictionary];
  BOOL v9 = [NSNumber numberWithInteger:self->_deadlineSignalID];
  [v8 setObject:v9 forKeyedSubscript:@"decisionMaker"];

  double v10 = [v6 objectForKeyedSubscript:@"decisionDate"];
  [v8 setObject:v10 forKeyedSubscript:@"decisionDate"];

  return (NSDictionary *)v8;
}

- (id)uiDeadlineFromFullChargeDeadline:(id)a3 atDate:(id)a4
{
  char v4 = a3;
  if (a3)
  {
    context = self->_context;
    id v7 = a4;
    id v8 = v4;
    [(PowerUISmartChargeManager *)self durationToFullChargeFromBatteryLevel:+[PowerUISmartChargeUtilities currentBatteryLevelWithContext:context]];
    BOOL v9 = objc_msgSend(v7, "dateByAddingTimeInterval:");

    char v4 = +[PowerUISmartChargeUtilities roundedDateFromDate:v8];

    [v4 timeIntervalSinceDate:v9];
    if (v10 < 0.0)
    {
      uint64_t v11 = +[PowerUISmartChargeUtilities roundedDateFromDate:v9];

      char v4 = (void *)v11;
    }
  }
  return v4;
}

- (id)fullChargeDeadline
{
  return self->__fullChargeDeadline;
}

- (id)setFullChargeDeadline:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  p_fullChargeDeadline = &self->__fullChargeDeadline;
  fullChargeDeadline = self->__fullChargeDeadline;
  if (!v5 || !fullChargeDeadline) {
    goto LABEL_9;
  }
  unint64_t checkpoint = self->_checkpoint;
  if (checkpoint - 5 < 2) {
    goto LABEL_11;
  }
  if (checkpoint - 2 <= 2)
  {
    objc_msgSend(v5, "timeIntervalSinceDate:");
    if (v10 < 0.0)
    {
      objc_storeStrong((id *)&self->__fullChargeDeadline, a3);
      [(PowerUISmartChargeManager *)self setDate:self->__fullChargeDeadline forPreferenceKey:@"fullChargeDeadline"];
      uint64_t v11 = [MEMORY[0x263EFF910] date];
      uint64_t v12 = [(PowerUISmartChargeManager *)self uiDeadlineFromFullChargeDeadline:v6 atDate:v11];
      uiDeadline = self->_uiDeadline;
      self->_uiDeadline = v12;

      double v14 = +[PowerUINotificationManager sharedInstance];
      uint64_t v15 = [v14 currentOBCEngagedNotification];

      if (v15)
      {
        char v16 = self->_uiDeadline;
        if (v16)
        {
          char v17 = v16;
        }
        else
        {
          long long v24 = [(PowerUISmartChargeManager *)self fullChargeDeadline];
          long long v25 = [MEMORY[0x263EFF910] date];
          char v17 = [(PowerUISmartChargeManager *)self uiDeadlineFromFullChargeDeadline:v24 atDate:v25];
        }
        long long v26 = +[PowerUINotificationManager sharedInstance];
        [v26 updateOBCEngagedNotificationWithDate:v17];
      }
      else
      {
        uint64_t v23 = +[PowerUINotificationManager sharedInstance];
        [v23 removeAllNotifications];

        [(PowerUISmartChargeManager *)self postOBCNotificationWithTopOff:0];
      }
      notify_post((const char *)[@"com.apple.smartcharging.fullChargeDeadlineChanged" UTF8String]);
    }
  }
  else
  {
LABEL_9:
    objc_storeStrong((id *)&self->__fullChargeDeadline, a3);
    [(PowerUISmartChargeManager *)self setDate:self->__fullChargeDeadline forPreferenceKey:@"fullChargeDeadline"];
    BOOL v18 = [MEMORY[0x263EFF910] date];
    uint64_t v19 = [(PowerUISmartChargeManager *)self uiDeadlineFromFullChargeDeadline:v6 atDate:v18];
    unsigned int v20 = self->_uiDeadline;
    self->_uiDeadline = v19;
  }
  fullChargeDeadline = *p_fullChargeDeadline;
LABEL_11:
  double v21 = fullChargeDeadline;

  return v21;
}

- (BOOL)deviceWasRecentlyConnectedToCharger
{
  return +[PowerUISmartChargeUtilities deviceWasConnectedToChargerWithinSeconds:self->_context withContext:900.0];
}

- (void)updateChargingTimeSaved
{
  id v14 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"chargingDisabledAt"];
  uint64_t v3 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"totalTimeSaved"];
  if (v14)
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    double v5 = v4;
    [v14 doubleValue];
    double v7 = fmax(v5 - v6, 0.0);
    id v8 = [NSNumber numberWithDouble:v7];
    [(PowerUISmartChargeManager *)self setNumber:v8 forPreferenceKey:@"lastSavedSeconds"];

    BOOL v9 = NSNumber;
    [v3 doubleValue];
    uint64_t v11 = [v9 numberWithDouble:v7 + v10];
    [(PowerUISmartChargeManager *)self setNumber:v11 forPreferenceKey:@"totalTimeSaved"];

    uint64_t v12 = (void *)MEMORY[0x263EFF910];
    [v14 doubleValue];
    uint64_t v13 = objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
    [(PowerUISmartChargeManager *)self addEngagementFromDate:v13 withDuration:v7];

    [(PowerUISmartChargeManager *)self setNumber:0 forPreferenceKey:@"chargingDisabledAt"];
    ADClientSetValueForScalarKey();
  }
}

- (void)enableCharging
{
  [(PowerUIChargingController *)self->_chargingController clearChargeLimitForLimitType:1];
  chargingController = self->_chargingController;
  [(PowerUIChargingController *)chargingController clearChargeLimitForLimitType:2];
}

- (void)disableCharging
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "ERROR: No current DEoC prediction cached", v2, v3, v4, v5, v6);
}

- (id)ttrURLforBatteryLevel:(int)a3 withDate:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint8_t v6 = NSString;
  double v7 = NSNumber;
  id v8 = a4;
  BOOL v9 = [v7 numberWithInt:v4];
  double v10 = [(PowerUISmartChargeManager *)self timeStringFromDate:v8];

  uint64_t v11 = [v6 stringWithFormat:@"tap-to-radar://new?Title=Potential Optimized Battery Charging Failure (Unplugged at %@ percent)&Classification=Serious Bug&ComponentID=971083&ComponentName=PowerUI&ComponentVersion=all&Reproducible=Sometimes&Description=PLEASE ANSWER THESE QUESTIONS TO AID DEBUGGING:\n\n* Why did you unplug your device at %@?\n* Do you usually leave your device charged for a while at this time?\n* Is this your regular carry device?", v9, v10];

  uint64_t v12 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
  uint64_t v13 = [v11 stringByAddingPercentEncodingWithAllowedCharacters:v12];

  id v14 = [NSURL URLWithString:v13];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    BOOL v18 = v14;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "TTR URL is %@", buf, 0xCu);
  }

  return v14;
}

- (id)ttrURLforGenericFailure:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = [NSString stringWithFormat:@"tap-to-radar://new?Title=Optimized Battery Charging Error of type: %@&Classification=Serious Bug&ComponentID=971083&ComponentName=PowerUI&ComponentVersion=all&Reproducible=Sometimes&Description=Could you please describe how you were (or are currently) charging your phone/watch?", a3];
  uint64_t v5 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
  uint8_t v6 = [v4 stringByAddingPercentEncodingWithAllowedCharacters:v5];

  double v7 = [NSURL URLWithString:v6];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v11 = v7;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "TTR URL is %@", buf, 0xCu);
  }

  return v7;
}

- (id)lastAcquiredLocation
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = self->_monitors;
  uint64_t v3 = (void *)[(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint8_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v3 = objc_msgSend(v6, "lastAcquiredLocation", (void)v8);
          goto LABEL_11;
        }
      }
      uint64_t v3 = (void *)[(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)clearManualChargeLimit
{
}

- (void)engageManualChargeLimit
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
  {
    [(PowerUIChargingController *)self->_chargingController setChargeLimitTo:self->_mclTargetSoC forLimitType:3];
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      int mclTargetSoC = self->_mclTargetSoC;
      v5[0] = 67109120;
      v5[1] = mclTargetSoC;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Limiting charging to %hhu%% SoC", (uint8_t *)v5, 8u);
    }
  }
}

- (void)clearAllNotificationState
{
  uint64_t v2 = +[PowerUINotificationManager sharedInstance];
  [v2 removeAllNotifications];

  id v3 = +[PowerUINotificationManager sharedInstance];
  [v3 resetAll];
}

- (id)smartTopOffFailureNotificationAtBatteryLevel:(int)a3 withDate:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = (objc_class *)MEMORY[0x263F1DEF0];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  long long v9 = (void *)[objc_alloc(NSURL) initFileURLWithPath:@"/System/Library/PrivateFrameworks/PowerUI.framework"];
  long long v10 = [MEMORY[0x263F086E0] bundleWithURL:v9];
  long long v11 = [v10 localizedStringForKey:@"OBC_FEATURE_TITLE" value:&stru_26D3439E8 table:@"Localizable"];
  [v8 setTitle:v11];

  [v8 setBody:@"Potential charging issue detected. Please file a radar by tapping on the notification."];
  [v8 setShouldIgnoreDoNotDisturb:1];
  uint64_t v12 = [(PowerUISmartChargeManager *)self ttrURLforBatteryLevel:v4 withDate:v7];

  [v8 setDefaultActionURL:v12];
  uint64_t v13 = (void *)MEMORY[0x263F1DF48];
  id v14 = NSString;
  uint64_t v15 = [MEMORY[0x263EFF910] date];
  char v16 = [v14 stringWithFormat:@"chargingRequest-%@", v15];
  char v17 = [v13 requestWithIdentifier:v16 content:v8 trigger:0];

  return v17;
}

- (id)genericOBCFailureNotification:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263F1DEF0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = (void *)[objc_alloc(NSURL) initFileURLWithPath:@"/System/Library/PrivateFrameworks/PowerUI.framework"];
  id v8 = [MEMORY[0x263F086E0] bundleWithURL:v7];
  long long v9 = [v8 localizedStringForKey:@"OBC_FEATURE_TITLE" value:&stru_26D3439E8 table:@"Localizable"];
  [v6 setTitle:v9];

  [v6 setBody:@"Potential charging issue detected. Please file a radar by tapping on the notification."];
  [v6 setShouldIgnoreDoNotDisturb:1];
  long long v10 = [(PowerUISmartChargeManager *)self ttrURLforGenericFailure:v5];

  [v6 setDefaultActionURL:v10];
  long long v11 = (void *)MEMORY[0x263F1DF48];
  uint64_t v12 = NSString;
  uint64_t v13 = [MEMORY[0x263EFF910] date];
  id v14 = [v12 stringWithFormat:@"chargingRequest-%@", v13];
  uint64_t v15 = [v11 requestWithIdentifier:v14 content:v6 trigger:0];

  return v15;
}

- (void)postOBCNotificationWithTopOff:(BOOL)a3
{
  BOOL v3 = a3;
  uiDeadline = self->_uiDeadline;
  if (uiDeadline)
  {
    id v5 = uiDeadline;
  }
  else
  {
    id v7 = [(PowerUISmartChargeManager *)self fullChargeDeadline];
    id v8 = [MEMORY[0x263EFF910] date];
    uint64_t v13 = [(PowerUISmartChargeManager *)self uiDeadlineFromFullChargeDeadline:v7 atDate:v8];

    id v5 = v13;
    if (!v13) {
      return;
    }
  }
  id v14 = v5;
  long long v9 = +[PowerUINotificationManager sharedInstance];
  long long v10 = v9;
  if (v3) {
    id v11 = (id)[v9 postOBCEngagedTopOffNotificationWithDate:v14];
  }
  else {
    id v12 = (id)[v9 postOBCEngagedNotificationWithDate:v14];
  }
}

- (void)monitor:(id)a3 maySuggestNewFullChargeDeadline:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PowerUISmartChargeManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__PowerUISmartChargeManager_monitor_maySuggestNewFullChargeDeadline___block_invoke;
  block[3] = &unk_2645A6B68;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __69__PowerUISmartChargeManager_monitor_maySuggestNewFullChargeDeadline___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  if ((unint64_t)(v2[14] - 2) <= 2)
  {
    BOOL v3 = *(void **)(a1 + 40);
    uint64_t v4 = [v2 fullChargeDeadline];
    id v5 = [v3 earlierDate:v4];
    int v6 = [v5 isEqual:*(void *)(a1 + 40)];

    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 96);
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        uint64_t v10 = *(void *)(a1 + 40);
        uint64_t v9 = *(void *)(a1 + 48);
        int v15 = 138412546;
        uint64_t v16 = v9;
        __int16 v17 = 2112;
        uint64_t v18 = v10;
        _os_log_impl(&dword_22135E000, v7, OS_LOG_TYPE_DEFAULT, "Monitor %@ with new data (%@). Recomputing full charge deadline", (uint8_t *)&v15, 0x16u);
      }
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = *(void **)(v11 + 160);
      *(void *)(v11 + 160) = 0;

      [*(id *)(a1 + 32) handleCallback:1];
    }
    else if (v8)
    {
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      int v15 = 138412546;
      uint64_t v16 = v13;
      __int16 v17 = 2112;
      uint64_t v18 = v14;
      _os_log_impl(&dword_22135E000, v7, OS_LOG_TYPE_DEFAULT, "Monitor %@ with new data (%@). Not recomputing as it is later than target date.", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)monitorMayInvalidateDEoCCache:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Monitor %@ forced DEoC re-caching", (uint8_t *)&v6, 0xCu);
  }
  [(PowerUISmartChargeManager *)self forceDEoCReevaluation];
}

- (void)handleNotificationResponse:(id)a3
{
  id v4 = a3;
  id v5 = [v4 actionIdentifier];
  int v6 = [v5 isEqualToString:@"fullCharge"];

  if (!v6)
  {
    uint64_t v8 = [v4 notification];
    uint64_t v9 = [v8 request];
    uint64_t v10 = [v9 content];
    uint64_t v11 = [v10 categoryIdentifier];
    if ([v11 isEqualToString:@"mcmActiveCategory"])
    {
      id v12 = [v4 actionIdentifier];
      int v13 = [v12 isEqualToString:*MEMORY[0x263F1E0D0]];

      if (v13)
      {
        mcmLog = self->_mcmLog;
        if (os_log_type_enabled(mcmLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int16 v30 = 0;
          _os_log_impl(&dword_22135E000, mcmLog, OS_LOG_TYPE_DEFAULT, "User dismissed MCM notification", v30, 2u);
        }
        self->_numberOfTimesMCMNotificationWasDisplayed = -1;
        int v15 = [NSNumber numberWithUnsignedInteger:-1];
        [(PowerUISmartChargeManager *)self setNumber:v15 forPreferenceKey:@"NumberOfTimesMCMNotificationWasDisplayed"];
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {
    }
    uint64_t v16 = [v4 notification];
    __int16 v17 = [v16 request];
    uint64_t v18 = [v17 content];
    uint64_t v19 = [v18 categoryIdentifier];
    int v20 = [v19 isEqualToString:@"chargeRecommendationCategory"];

    if (!v20) {
      goto LABEL_24;
    }
    double v21 = [v4 actionIdentifier];
    int v22 = [v21 isEqualToString:*MEMORY[0x263F1E0C8]];

    if (v22)
    {
      uint64_t v23 = [(PowerUISmartChargeManager *)self log];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v29 = 0;
        _os_log_impl(&dword_22135E000, v23, OS_LOG_TYPE_DEFAULT, "User selected defaultAction on charge recommendation", v29, 2u);
      }

      long long v24 = &unk_26D385648;
    }
    else
    {
      long long v25 = [v4 actionIdentifier];
      int v26 = [v25 isEqualToString:*MEMORY[0x263F1E0D0]];

      long long v27 = [(PowerUISmartChargeManager *)self log];
      int v15 = v27;
      if (!v26)
      {
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[PowerUISmartChargeManager handleNotificationResponse:]();
        }
        goto LABEL_23;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)signed int v28 = 0;
        _os_log_impl(&dword_22135E000, v15, OS_LOG_TYPE_DEFAULT, "User dismissed charge recommendation", v28, 2u);
      }

      long long v24 = &unk_26D385618;
    }
    [(PowerUISmartChargeManager *)self setNumber:v24 forPreferenceKey:@"didTapChargeLimitRecommendation"];
    goto LABEL_24;
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "User requested immediate charge.", buf, 2u);
  }
  [(PowerUISmartChargeManager *)self client:@"Notification" setState:2 withHandler:&__block_literal_global_1347];
LABEL_24:
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    -[PowerUISmartChargeManager listener:shouldAcceptNewConnection:]();
  }
  id v7 = [v6 valueForEntitlement:@"com.apple.powerui.smartcharging"];
  uint64_t v8 = v7;
  if ((!v7 || ([v7 BOOLValue] & 1) == 0) && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
    -[PowerUIAudioAccessorySmartChargeManager listener:shouldAcceptNewConnection:]();
  }
  uint64_t v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D38F4E0];
  uint64_t v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  int v15 = self;
  uint64_t v16 = objc_opt_class();
  __int16 v17 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v16, objc_opt_class(), 0);
  [v9 setClasses:v17 forSelector:sel_statusWithHandler_ argumentIndex:0 ofReply:1];

  [v6 setExportedInterface:v9];
  [v6 setExportedObject:v15];
  [v6 resume];

  return 1;
}

- (id)stringFromState:(unint64_t)a3
{
  if (a3 > 3) {
    return @"Unknown state";
  }
  else {
    return off_2645A6D50[a3];
  }
}

- (id)readAndRemoveRecentEngagements
{
  uint64_t v2 = (void *)CFPreferencesCopyAppValue(@"recentEngagements", (CFStringRef)self->_defaultsDomain);
  BOOL v3 = (void *)[v2 mutableCopy];

  if (v3)
  {
    id v4 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-2592000.0];
    id v5 = [MEMORY[0x263EFF9C0] set];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __59__PowerUISmartChargeManager_readAndRemoveRecentEngagements__block_invoke;
    uint64_t v14 = &unk_2645A6BB0;
    id v15 = v4;
    id v16 = v5;
    id v6 = v5;
    id v7 = v4;
    [v3 enumerateKeysAndObjectsUsingBlock:&v11];
    uint64_t v8 = objc_msgSend(v6, "allObjects", v11, v12, v13, v14);
    [v3 removeObjectsForKeys:v8];

    id v9 = v3;
  }
  else
  {
    id v9 = [MEMORY[0x263EFF9A0] dictionary];
  }

  return v9;
}

void __59__PowerUISmartChargeManager_readAndRemoveRecentEngagements__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263EFF910];
  id v7 = v3;
  [v3 doubleValue];
  id v5 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  [v5 timeIntervalSinceDate:*(void *)(a1 + 32)];
  if (v6 < 0.0) {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

- (id)recentEngagements
{
  id v3 = [(PowerUISmartChargeManager *)self readAndRemoveRecentEngagements];
  id v4 = (void *)[v3 copy];
  CFPreferencesSetAppValue(@"recentEngagements", v4, (CFStringRef)self->_defaultsDomain);

  return v4;
}

- (void)addEngagementFromDate:(id)a3 withDuration:(double)a4
{
  id v6 = a3;
  id v13 = [(PowerUISmartChargeManager *)self readAndRemoveRecentEngagements];
  id v7 = NSString;
  [v6 timeIntervalSinceReferenceDate];
  uint64_t v9 = v8;

  uint64_t v10 = objc_msgSend(v7, "stringWithFormat:", @"%lf", v9);
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithDouble:", fmax(a4, 0.0));
  [v13 setObject:v11 forKeyedSubscript:v10];

  uint64_t v12 = (void *)[v13 copy];
  CFPreferencesSetAppValue(@"recentEngagements", v12, (CFStringRef)self->_defaultsDomain);
}

- (void)statusWithHandler:(id)a3
{
  v93[2] = *MEMORY[0x263EF8340];
  uint64_t v75 = (void (**)(id, void *))a3;
  uint64_t v80 = (void *)CFPreferencesCopyAppValue(@"timeline", (CFStringRef)self->_defaultsDomain);
  v74 = (void *)CFPreferencesCopyAppValue(@"timeline.archive", (CFStringRef)self->_defaultsDomain);
  id v4 = -[PowerUISmartChargeManager eligibleEngagementIntervalFromTimelineEvents:](self, "eligibleEngagementIntervalFromTimelineEvents:");
  double v79 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"lastEnabled"];
  v78 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"lastSavedSeconds"];
  id v5 = NSNumber;
  id v6 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"totalTimeSaved"];
  [v6 doubleValue];
  v77 = [v5 numberWithDouble:v7 / 3600.0];

  v81 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v76 = v4;
  if (self->_predictorType == 2)
  {
    unint64_t v8 = +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:self->_context];
    uint64_t v9 = [MEMORY[0x263EFF910] date];
    modelTwoStagePredictor = self->_modelTwoStagePredictor;
    uint64_t v82 = v9;
    if (self->_lastPluginStatus < 1)
    {
      uint64_t v36 = 1;
      [(PowerUIMLTwoStageModelPredictor *)modelTwoStagePredictor adjustedChargingDecision:v8 withPluginDate:v9 withPluginBatteryLevel:v9 forDate:1 forStatus:(double)v8];
      uint64_t v11 = objc_msgSend(v9, "dateByAddingTimeInterval:");
      v90[0] = v9;
      v90[1] = v11;
      unint64_t v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v90 count:2];
      [v81 setObject:v37 forKeyedSubscript:@"CurrentPluginPrediction"];

      char v38 = 0;
      unint64_t v39 = v8 - 5;
      unint64_t v40 = 3600;
      do
      {
        int v41 = v11;
        int v42 = [v9 dateByAddingTimeInterval:(double)v40];
        uint64_t v43 = [v42 dateByAddingTimeInterval:1.0];
        if (v39 <= 1) {
          unint64_t v44 = 1;
        }
        else {
          unint64_t v44 = v39;
        }
        -[PowerUIMLTwoStageModelPredictor adjustedChargingDecision:withPluginDate:withPluginBatteryLevel:forDate:forStatus:](self->_modelTwoStagePredictor, "adjustedChargingDecision:withPluginDate:withPluginBatteryLevel:forDate:forStatus:", (double)v44);
        double v46 = v45;
        uint64_t v11 = objc_msgSend(v42, "dateByAddingTimeInterval:");

        if ((v38 & 1) == 0 && v46 > 3600.0)
        {
          v89[0] = v42;
          v89[1] = v11;
          BOOL v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v89 count:2];
          [v81 setObject:v47 forKeyedSubscript:@"NextPluginPrediction"];

          char v38 = 1;
        }
        uint64_t v48 = NSString;
        int v49 = [NSNumber numberWithUnsignedInteger:v36];
        double v50 = [v48 stringWithFormat:@"PluginPredictionIn%@Hours", v49];

        v88[0] = v42;
        v88[1] = v11;
        double v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:v88 count:2];
        [v81 setObject:v51 forKeyedSubscript:v50];

        ++v36;
        v39 -= 5;
        v40 += 3600;
        uint64_t v9 = v82;
      }
      while (v36 != 24);
    }
    else
    {
      uint64_t v11 = [(PowerUIMLTwoStageModelPredictor *)modelTwoStagePredictor pluginDate];
      uint64_t v12 = self->_modelTwoStagePredictor;
      [(PowerUIMLTwoStageModelPredictor *)v12 pluginBatteryLevel];
      unint64_t v14 = (unint64_t)v13;
      [(PowerUIMLTwoStageModelPredictor *)self->_modelTwoStagePredictor pluginBatteryLevel];
      uint64_t v15 = 1;
      -[PowerUIMLTwoStageModelPredictor adjustedChargingDecision:withPluginDate:withPluginBatteryLevel:forDate:forStatus:](v12, "adjustedChargingDecision:withPluginDate:withPluginBatteryLevel:forDate:forStatus:", v14, v11, v11, 1);
      id v16 = objc_msgSend(v11, "dateByAddingTimeInterval:");
      v93[0] = v11;
      v93[1] = v16;
      __int16 v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v93 count:2];
      [v81 setObject:v17 forKeyedSubscript:@"PluginPredictionAtPlugin"];

      uint64_t v18 = self->_modelTwoStagePredictor;
      [(PowerUIMLTwoStageModelPredictor *)v18 pluginBatteryLevel];
      double v20 = v19;
      double v21 = [MEMORY[0x263EFF910] date];
      [(PowerUIMLTwoStageModelPredictor *)v18 adjustedChargingDecision:v8 withPluginDate:v11 withPluginBatteryLevel:v21 forDate:1 forStatus:v20];
      double v23 = v22;

      long long v24 = [v11 dateByAddingTimeInterval:v23];

      v92[0] = v11;
      v92[1] = v24;
      long long v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v92 count:2];
      [v81 setObject:v25 forKeyedSubscript:@"CurrentPluginPrediction"];

      unint64_t v26 = v8 - 5;
      unint64_t v27 = 3600;
      do
      {
        signed int v28 = v24;
        uint64_t v29 = [v9 dateByAddingTimeInterval:(double)v27];
        __int16 v30 = [v29 dateByAddingTimeInterval:1.0];
        if (v26 <= 1) {
          unint64_t v31 = 1;
        }
        else {
          unint64_t v31 = v26;
        }
        -[PowerUIMLTwoStageModelPredictor adjustedChargingDecision:withPluginDate:withPluginBatteryLevel:forDate:forStatus:](self->_modelTwoStagePredictor, "adjustedChargingDecision:withPluginDate:withPluginBatteryLevel:forDate:forStatus:", (double)v31);
        long long v24 = objc_msgSend(v29, "dateByAddingTimeInterval:");

        __int16 v32 = NSString;
        uint64_t v33 = [NSNumber numberWithUnsignedInteger:v15];
        __int16 v34 = [v32 stringWithFormat:@"PluginPredictionIn%@Hours", v33];

        v91[0] = v29;
        v91[1] = v24;
        unint64_t v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v91 count:2];
        [v81 setObject:v35 forKeyedSubscript:v34];

        uint64_t v9 = v82;
        ++v15;
        v26 -= 5;
        v27 += 3600;
      }
      while (v15 != 24);
    }
    id v4 = v76;
  }
  uint64_t v52 = [(PowerUISmartChargeManager *)self stringFromDecisionMaker:self->_previousDecisionMakerID decisionDate:self->_previousDecisionMakerDate];
  unint64_t v53 = [(PowerUISmartChargeManager *)self recentEngagements];
  v86[0] = @"Enabled";
  double v54 = [NSNumber numberWithBool:self->_enabled];
  v87[0] = v54;
  v86[1] = @"TemporarilyDisabled";
  double v55 = [NSNumber numberWithBool:self->_temporarilyDisabled];
  v87[1] = v55;
  v86[2] = @"CurrentState";
  double v56 = [NSNumber numberWithUnsignedInteger:self->_currentState];
  v87[2] = v56;
  v86[3] = @"Checkpoint";
  uint64_t v57 = [NSNumber numberWithUnsignedInteger:self->_checkpoint];
  unint64_t v58 = (void *)v57;
  double v59 = (void *)MEMORY[0x263EFFA68];
  if (v80) {
    double v59 = v80;
  }
  v87[3] = v57;
  v87[4] = v59;
  v86[4] = @"Timeline";
  v86[5] = @"LastEnabled";
  signed int v60 = &unk_26D385618;
  unint64_t v62 = v78;
  uint64_t v61 = v79;
  if (!v79) {
    uint64_t v61 = &unk_26D385618;
  }
  if (!v78) {
    unint64_t v62 = &unk_26D385618;
  }
  v87[5] = v61;
  v87[6] = v62;
  v86[6] = @"LastSavedSeconds";
  v86[7] = @"TotalHoursSaved";
  if (v77) {
    signed int v60 = v77;
  }
  uint64_t v63 = (void *)MEMORY[0x263EFFA78];
  if (v53) {
    uint64_t v63 = v53;
  }
  v87[7] = v60;
  v87[8] = v63;
  v86[8] = @"RecentEngagements";
  v86[9] = @"PreviousDecisionMaker";
  double v64 = &stru_26D3439E8;
  uint64_t v83 = (void *)v52;
  if (v52) {
    double v64 = (__CFString *)v52;
  }
  v87[9] = v64;
  v86[10] = @"LastEligibleStart";
  __int16 v65 = [v4 startDate];
  long long v66 = v65;
  if (!v65)
  {
    long long v66 = [MEMORY[0x263EFF910] distantFuture];
  }
  v87[10] = v66;
  v86[11] = @"LastEligibleDuration";
  long long v67 = NSNumber;
  [v4 duration];
  long long v68 = objc_msgSend(v67, "numberWithDouble:");
  v87[11] = v68;
  long long v69 = [NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:12];

  if (!v65) {
  [v81 addEntriesFromDictionary:v69];
  }
  double v70 = +[PowerUICECManager manager];
  v71 = [v70 status];

  [v81 addEntriesFromDictionary:v71];
  __int16 v72 = (void *)[v81 copy];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    double v85 = v72;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Status Requested: %@", buf, 0xCu);
  }
  v75[2](v75, v72);
}

- (void)powerLogStatusWithHandler:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = [(PowerUISmartChargeManager *)self powerLogStatus];
  id v6 = (id)[v5 copy];

  v4[2](v4, v6);
}

- (void)legacy_isOBCEngagedWithHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  context = self->_context;
  id v5 = (void (**)(id, BOOL, BOOL, BOOL, void))a3;
  BOOL v6 = +[PowerUISmartChargeUtilities isPluggedInWithContext:context];
  unint64_t checkpoint = self->_checkpoint;
  BOOL v8 = checkpoint - 2 < 3 && v6;
  BOOL v9 = checkpoint - 1 < 4 && v6;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isDesktopDevice = self->_isDesktopDevice;
    v12[0] = 67109632;
    v12[1] = v8;
    __int16 v13 = 1024;
    BOOL v14 = isDesktopDevice;
    __int16 v15 = 1024;
    BOOL v16 = v9;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Returning currently engaged state: %u, desktop device: %u, chargingOverrideAllowed: %u", (uint8_t *)v12, 0x14u);
  }
  v5[2](v5, v8, self->_isDesktopDevice, v9, 0);
}

- (id)getCurrentSystemChargeLimit
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = (id)IOPSCopyBatteryLevelLimits();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        BOOL v8 = objc_msgSend(v7, "objectForKeyedSubscript:", @"Owner", (void)v12);
        BOOL v9 = v8;
        if (v8 && ![v8 intValue])
        {
          id v10 = v7;

          goto LABEL_12;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_12:

  return v10;
}

- (void)smartChargingUIStateWithHandler:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  context = self->_context;
  uint64_t v5 = (void (**)(id, uint64_t, unint64_t, BOOL, void))a3;
  uint64_t v6 = +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:context];
  BOOL v7 = +[PowerUISmartChargeUtilities isPluggedInWithContext:self->_context];
  unint64_t v8 = [(PowerUISmartChargeManager *)self currentChargeLimit];
  unint64_t checkpoint = self->_checkpoint;
  unint64_t v10 = checkpoint - 1;
  BOOL v11 = checkpoint - 1 < 4 && v7;
  if (self->_temporarilyDisabled)
  {
    uint64_t v12 = 3;
    goto LABEL_19;
  }
  if (!checkpoint)
  {
    if (self->_isDesktopDevice && self->_enabled)
    {
      uint64_t v12 = 17;
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (checkpoint >= 7 || !v7)
  {
LABEL_18:
    uint64_t v12 = 1;
    goto LABEL_19;
  }
  uint64_t v12 = 2;
  switch(v10)
  {
    case 0uLL:
    case 2uLL:
      if (self->_isDesktopDevice) {
        uint64_t v12 = 9;
      }
      else {
        uint64_t v12 = 5;
      }
      break;
    case 1uLL:
    case 3uLL:
      long long v15 = [(PowerUISmartChargeManager *)self getCurrentSystemChargeLimit];
      BOOL v16 = v15;
      if (v15)
      {
        uint64_t v17 = [v15 objectForKeyedSubscript:@"chargeSocLimitDrain"];
        char v18 = [v17 BOOLValue];

        double v19 = [v16 objectForKeyedSubscript:@"chargeSocLimitSoc"];
        int v20 = [v19 intValue];

        uint64_t v21 = v20;
      }
      else
      {
        char v18 = 0;
        uint64_t v21 = 100;
      }
      BOOL v22 = +[PowerUISmartChargeUtilities deviceConnectedToWirelessChargerWithContext:self->_context];
      if ((v18 & 1) != 0 || v22)
      {
        uint64_t v23 = 7;
        if (v6 > 80) {
          uint64_t v23 = 8;
        }
        uint64_t v24 = 11;
        if (v6 > v21) {
          uint64_t v24 = 12;
        }
        if (self->_isDesktopDevice) {
          uint64_t v12 = v24;
        }
        else {
          uint64_t v12 = v23;
        }
      }
      else if (self->_isDesktopDevice)
      {
        uint64_t v12 = 10;
      }
      else
      {
        uint64_t v12 = 6;
      }

      break;
    case 4uLL:
      uint64_t v12 = 4;
      break;
    case 5uLL:
      break;
    default:
      uint64_t v12 = 0;
      break;
  }
LABEL_19:
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 134218496;
    uint64_t v26 = v12;
    __int16 v27 = 2048;
    unint64_t v28 = v8;
    __int16 v29 = 1024;
    BOOL v30 = v11;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Returning currently desired UI state: %lu, charge limit: %lu, chargingOverrideAllowed: %u", (uint8_t *)&v25, 0x1Cu);
  }
  v5[2](v5, v12, v8, v11, 0);
}

- (void)isSmartChargingCurrentlyEnabledWithHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, unint64_t, void))a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSNumber;
    unint64_t currentState = self->_currentState;
    unint64_t v8 = log;
    BOOL v9 = [v6 numberWithUnsignedInteger:currentState];
    int v10 = 138412290;
    BOOL v11 = v9;
    _os_log_impl(&dword_22135E000, v8, OS_LOG_TYPE_DEFAULT, "Returning current state: %@", (uint8_t *)&v10, 0xCu);
  }
  v4[2](v4, self->_currentState, 0);
}

- (void)fullChargeDeadlineWithHandler:(id)a3
{
  BOOL v7 = (void (**)(id, void *, void))a3;
  if (self->_checkpoint - 1 > 4)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v4 = [(PowerUISmartChargeManager *)self fullChargeDeadline];
    uint64_t v5 = [MEMORY[0x263EFF910] date];
    uint64_t v6 = [(PowerUISmartChargeManager *)self uiDeadlineFromFullChargeDeadline:v4 atDate:v5];
  }
  v7[2](v7, v6, 0);
}

- (void)setEnabled:(BOOL)a3
{
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:");
  [(PowerUISmartChargeManager *)self setNumber:v5 forPreferenceKey:@"enabled"];

  self->_BOOL enabled = a3;
}

- (void)setCurrentState:(unint64_t)a3
{
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  [(PowerUISmartChargeManager *)self setNumber:v5 forPreferenceKey:@"currentState"];

  if (a3 <= 3 && a3 != 1) {
    [(PowerUISmartChargeManager *)self enableCharging];
  }
  self->_unint64_t currentState = a3;
}

- (void)client:(id)a3 setState:(unint64_t)a4 withHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v9 = a3;
  int v10 = (void (**)(id, void, void *))a5;
  if (a4 == 1
    && !+[PowerUISmartChargeUtilities isOBCSupported])
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[PowerUISmartChargeManager client:setState:withHandler:]();
    }
    long long v15 = [MEMORY[0x263F087E8] errorWithDomain:@"PowerUISmartChargingErrorDomain" code:4 userInfo:0];
    v10[2](v10, 0, v15);
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = log;
      long long v13 = [(PowerUISmartChargeManager *)self stringFromState:a4];
      *(_DWORD *)long long buf = 138412546;
      id v21 = v9;
      __int16 v22 = 2112;
      uint64_t v23 = v13;
      _os_log_impl(&dword_22135E000, v12, OS_LOG_TYPE_DEFAULT, "%@ requests state: %@", buf, 0x16u);
    }
    queue = self->_queue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __57__PowerUISmartChargeManager_client_setState_withHandler___block_invoke;
    v16[3] = &unk_2645A6BD8;
    unint64_t v18 = a4;
    SEL v19 = a2;
    v16[4] = self;
    uint64_t v17 = v10;
    dispatch_async(queue, v16);
  }
}

uint64_t __57__PowerUISmartChargeManager_client_setState_withHandler___block_invoke(uint64_t a1)
{
  switch(*(void *)(a1 + 48))
  {
    case 0:
      [*(id *)(a1 + 32) setCurrentState:0];
      id v2 = *(void **)(a1 + 32);
      uint64_t v3 = [MEMORY[0x263EFF910] date];
      [v2 addPowerLogEventForCheckpoint:10 decisionSignalID:0 decisionDate:v3];

      [*(id *)(a1 + 32) setCheckpoint:10 withSelector:*(void *)(a1 + 56)];
      [*(id *)(a1 + 32) setEnabled:0];
      [*(id *)(a1 + 32) clearAllNotificationState];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      notify_post((const char *)[@"com.apple.powerui.smartchargestatuschanged" UTF8String]);
      uint64_t v31 = MEMORY[0x263EF8330];
      uint64_t v32 = 3221225472;
      uint64_t v33 = __57__PowerUISmartChargeManager_client_setState_withHandler___block_invoke_2;
      __int16 v34 = &unk_2645A5FD0;
      uint64_t v35 = *(void *)(a1 + 32);
      AnalyticsSendEventLazy();
      [*(id *)(a1 + 32) forceDEoCReevaluation];
      break;
    case 1:
      [*(id *)(a1 + 32) setCurrentState:1];
      [*(id *)(a1 + 32) setTemporarilyDisabled:0 until:0];
      [*(id *)(a1 + 32) setEnabled:1];
      BOOL v7 = *(void **)(a1 + 32);
      unint64_t v8 = [MEMORY[0x263EFF910] date];
      [v7 addPowerLogEventForCheckpoint:0 decisionSignalID:0 decisionDate:v8];

      [*(id *)(a1 + 32) setCheckpoint:0 withSelector:*(void *)(a1 + 56)];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      notify_post((const char *)[@"com.apple.powerui.smartchargestatuschanged" UTF8String]);
      break;
    case 2:
      id v9 = *(void **)(a1 + 32);
      unint64_t v10 = v9[14];
      if (v10 > 4) {
        goto LABEL_10;
      }
      if (v10)
      {
        [v9 setCurrentState:2];
        BOOL v11 = *(void **)(a1 + 32);
        uint64_t v12 = [MEMORY[0x263EFF910] date];
        [v11 addPowerLogEventForCheckpoint:9 decisionSignalID:0 decisionDate:v12];

        [*(id *)(a1 + 32) setCheckpoint:9 withSelector:*(void *)(a1 + 56)];
        long long v13 = *(void **)(a1 + 32);
        long long v14 = [MEMORY[0x263EFF910] date];
        long long v15 = [v13 defaultDateToDisableUntilGivenDate:v14];

        [*(id *)(a1 + 32) setTemporarilyDisabled:1 until:v15];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        notify_post((const char *)[@"com.apple.powerui.smartchargestatuschanged" UTF8String]);
        [*(id *)(a1 + 32) clearAllNotificationState];
      }
      else
      {
        [v9 setCheckpoint:9 withSelector:*(void *)(a1 + 56)];
        uint64_t v23 = *(void **)(a1 + 32);
        uint64_t v24 = [MEMORY[0x263EFF910] date];
        long long v15 = [v23 defaultDateToDisableUntilGivenDate:v24];

        [*(id *)(a1 + 32) setTemporarilyDisabled:1 until:v15];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        notify_post((const char *)[@"com.apple.powerui.smartchargestatuschanged" UTF8String]);
      }

      uint64_t v26 = MEMORY[0x263EF8330];
      uint64_t v27 = 3221225472;
      unint64_t v28 = __57__PowerUISmartChargeManager_client_setState_withHandler___block_invoke_1534;
      __int16 v29 = &unk_2645A5FD0;
      uint64_t v30 = *(void *)(a1 + 32);
      AnalyticsSendEventLazy();
      break;
    case 3:
      BOOL v16 = *(unsigned char **)(a1 + 32);
      if (!v16[8])
      {
LABEL_10:
        uint64_t v4 = *(void *)(a1 + 40);
        uint64_t v5 = (void *)MEMORY[0x263F087E8];
        uint64_t v6 = 2;
        goto LABEL_11;
      }
      uint64_t v17 = [MEMORY[0x263EFF910] date];
      unint64_t v18 = [v16 defaultDateToDisableUntilGivenDate:v17];

      [*(id *)(a1 + 32) setTemporarilyDisabled:1 until:v18];
      [*(id *)(a1 + 32) clearAllNotificationState];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      notify_post((const char *)[@"com.apple.powerui.smartchargestatuschanged" UTF8String]);
      uint64_t v19 = *(void *)(a1 + 32);
      int v20 = *(void **)(v19 + 408);
      id v21 = objc_msgSend(NSNumber, "numberWithInteger:", +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", *(void *)(v19 + 48)));
      [v20 submitEngagementEventWithBatteryLevel:v21 targetSoC:0 predictedEndOfCharge:0 modeOfOperation:2 eventType:3];

      break;
    default:
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = (void *)MEMORY[0x263F087E8];
      uint64_t v6 = 1;
LABEL_11:
      __int16 v22 = [v5 errorWithDomain:@"PowerUISmartChargingErrorDomain" code:v6 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v22);

      break;
  }
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 96), OS_LOG_TYPE_DEBUG)) {
    __57__PowerUISmartChargeManager_client_setState_withHandler___block_invoke_cold_1();
  }
  return notify_post((const char *)objc_msgSend(@"com.apple.smartcharging.statechange", "UTF8String", v26, v27, v28, v29, v30, v31, v32, v33, v34, v35));
}

id __57__PowerUISmartChargeManager_client_setState_withHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = +[PowerUISmartChargeUtilities recentEngagementHistory];
  uint64_t v3 = (void *)[v2 mutableCopy];
  [v3 setObject:@"Disabled" forKeyedSubscript:@"DisableType"];
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    unint64_t v8 = v3;
    _os_log_impl(&dword_22135E000, v4, OS_LOG_TYPE_DEFAULT, "After disablement, reporting %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = (void *)[v3 copy];

  return v5;
}

id __57__PowerUISmartChargeManager_client_setState_withHandler___block_invoke_1534(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = +[PowerUISmartChargeUtilities recentEngagementHistory];
  uint64_t v3 = (void *)[v2 mutableCopy];
  [v3 setObject:@"TemporaryDisabled" forKeyedSubscript:@"DisableType"];
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    unint64_t v8 = v3;
    _os_log_impl(&dword_22135E000, v4, OS_LOG_TYPE_DEFAULT, "After disablement, reporting %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = (void *)[v3 copy];

  return v5;
}

- (void)isOBCSupportedWithHandler:(id)a3
{
  id v4 = a3;
  (*((void (**)(id, BOOL, void))a3 + 2))(v4, +[PowerUISmartChargeUtilities isOBCSupported], 0);
}

- (void)isMCLSupportedWithHandler:(id)a3
{
  id v5 = a3;
  (*((void (**)(id, BOOL, void))a3 + 2))(v5, [(PowerUISmartChargeManager *)self isMCLSupported], 0);
}

- (BOOL)isMCLSupported
{
  if _os_feature_enabled_impl() && (MGGetBoolAnswer())
  {
    LOBYTE(v3) = 1;
  }
  else if (_os_feature_enabled_impl() {
         && +[PowerUISmartChargeUtilities isInternalBuild])
  }
  {
    id v4 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"allowMCLOverride"];
    id v5 = v4;
    if (v4) {
      int v3 = (int)([v4 BOOLValue] << 31) >> 31;
    }
    else {
      LOBYTE(v3) = 0;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3 & 1;
}

- (void)client:(id)a3 setMCLLimit:(unsigned __int8)a4 withHandler:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void, void *))a5;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v11 = NSNumber;
    uint64_t v12 = log;
    long long v13 = [v11 numberWithUnsignedChar:v6];
    int v19 = 138412546;
    id v20 = v8;
    __int16 v21 = 2112;
    __int16 v22 = v13;
    _os_log_impl(&dword_22135E000, v12, OS_LOG_TYPE_DEFAULT, "Client %@ requests MCL limit: %@", (uint8_t *)&v19, 0x16u);
  }
  if (![(PowerUISmartChargeManager *)self isMCLSupported])
  {
    BOOL v16 = self->_log;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[PowerUISmartChargeManager client:setMCLLimit:withHandler:]((uint64_t)v8, v16, v6);
    }
    goto LABEL_12;
  }
  if ((v6 - 80) > 0x14)
  {
    uint64_t v17 = self->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[PowerUISmartChargeManager client:setMCLLimit:withHandler:]((uint64_t)v8, v17, v6);
    }
LABEL_12:
    unint64_t v18 = [MEMORY[0x263F087E8] errorWithDomain:@"PowerUISmartChargingErrorDomain" code:4 userInfo:0];
    v9[2](v9, 0, v18);

    goto LABEL_13;
  }
  if (!self->_manualChargeLimitWasEverEnabled)
  {
    self->_BOOL manualChargeLimitWasEverEnabled = 1;
    long long v14 = [MEMORY[0x263EFF910] now];
    [(PowerUISmartChargeManager *)self setDate:v14 forPreferenceKey:@"initialChargeLimitSetDate"];
  }
  [(PowerUISmartChargeManager *)self setMCLLimit:v6];
  long long v15 = [MEMORY[0x263EFF910] now];
  [(PowerUISmartChargeManager *)self setDate:v15 forPreferenceKey:@"mostRecentChargeLimitSetDate"];

  v9[2](v9, 1, 0);
LABEL_13:
}

- (void)client:(id)a3 getMCLLimitWithHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Client %@ queries MCL limit", (uint8_t *)&v10, 0xCu);
  }
  if ([(PowerUISmartChargeManager *)self isMCLSupported])
  {
    [(PowerUISmartChargeManager *)self checkWhetherMCLTempDisablementCanBeClearedOnPlugin:0];
    if (self->_manualChargeLimitStatus == 1) {
      (*((void (**)(id, void, void))v7 + 2))(v7, self->_mclTargetSoC, 0);
    }
    else {
      (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 100, 0);
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:@"PowerUISmartChargingErrorDomain" code:4 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
  }
}

- (void)tmpDisableMCLViaClient:(id)a3 withHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Client %@ requests MCL tmp disablement", (uint8_t *)&v12, 0xCu);
  }
  if (![(PowerUISmartChargeManager *)self isMCLSupported])
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[PowerUISmartChargeManager tmpDisableMCLViaClient:withHandler:]();
    }
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = 4;
    goto LABEL_12;
  }
  if (self->_manualChargeLimitStatus != 1)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[PowerUISmartChargeManager tmpDisableMCLViaClient:withHandler:]();
    }
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = 2;
LABEL_12:
    id v11 = [v9 errorWithDomain:@"PowerUISmartChargingErrorDomain" code:v10 userInfo:0];
    v7[2](v7, 0, v11);

    goto LABEL_13;
  }
  [(PowerUISmartChargeManager *)self tempDisableMCL];
  v7[2](v7, 1, 0);
LABEL_13:
}

- (unsigned)getUISoCChargeLimit
{
  unint64_t recommendedLimit = self->_recommendedLimit;
  if (recommendedLimit - 80 >= 0x15) {
    LOBYTE(recommendedLimit) = 100;
  }
  return recommendedLimit;
}

- (void)setMCLLimit:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  self->_int mclTargetSoC = a3;
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedChar:");
  [(PowerUISmartChargeManager *)self setNumber:v5 forPreferenceKey:@"mclLimitValue"];

  if (v3 == 100)
  {
    [(PowerUISmartChargeManager *)self disableMCL];
    log = self->_log;
    if (!os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LOWORD(v11[0]) = 0;
    id v7 = "Charge limit was disabled";
    id v8 = log;
    uint32_t v9 = 2;
  }
  else
  {
    [(PowerUISmartChargeManager *)self enableMCL];
    uint64_t v10 = self->_log;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    v11[0] = 67109120;
    v11[1] = v3;
    id v7 = "Charge limit was set to: %hhu";
    id v8 = v10;
    uint32_t v9 = 8;
  }
  _os_log_impl(&dword_22135E000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)v11, v9);
}

- (void)enableMCL
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "MCL being enabled but not supported!", v2, v3, v4, v5, v6);
}

uint64_t __38__PowerUISmartChargeManager_enableMCL__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleCallback:1];
}

- (void)disableMCL
{
  [(PowerUISmartChargeManager *)self setCheckpoint:0 withSelector:a2];
  self->_unint64_t manualChargeLimitStatus = 0;
  [(PowerUISmartChargeManager *)self setNumber:&unk_26D385768 forPreferenceKey:@"MCLFeatureState"];
  [(PowerUISmartChargeManager *)self clearManualChargeLimit];
  mclDisabledUntilDate = self->_mclDisabledUntilDate;
  self->_mclDisabledUntilDate = 0;

  [(PowerUISmartChargeManager *)self setDate:0 forPreferenceKey:@"MCLTempDisabledUntilDate"];
  analyticsManager = self->_analyticsManager;
  [(PowerUIAnalyticsManager *)analyticsManager submitEngagementEventWithBatteryLevel:0 targetSoC:0 predictedEndOfCharge:0 modeOfOperation:6 eventType:4];
}

- (void)tempDisableMCL
{
  uint64_t v4 = [(PowerUISmartChargeManager *)self queue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  _DWORD v5[2] = __43__PowerUISmartChargeManager_tempDisableMCL__block_invoke;
  v5[3] = &unk_2645A68C8;
  v5[4] = self;
  v5[5] = a2;
  dispatch_sync(v4, v5);
}

void __43__PowerUISmartChargeManager_tempDisableMCL__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 408) submitEngagementEventWithBatteryLevel:0 targetSoC:0 predictedEndOfCharge:0 modeOfOperation:6 eventType:3];
  if (+[PowerUISmartChargeUtilities isPluggedInWithContext:*(void *)(*(void *)(a1 + 32) + 48)])
  {
    [*(id *)(a1 + 32) setCheckpoint:6 withSelector:*(void *)(a1 + 40)];
  }
  *(void *)(*(void *)(a1 + 32) + 480) = 2;
  [*(id *)(a1 + 32) setNumber:&unk_26D3856F0 forPreferenceKey:@"MCLFeatureState"];
  [*(id *)(a1 + 32) clearManualChargeLimit];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [MEMORY[0x263EFF910] date];
  uint64_t v4 = [v2 defaultDateToDisableUntilGivenDate:v3];
  uint64_t v5 = *(void *)(a1 + 32);
  uint8_t v6 = *(void **)(v5 + 504);
  *(void *)(v5 + 504) = v4;

  [*(id *)(a1 + 32) setDate:*(void *)(*(void *)(a1 + 32) + 504) forPreferenceKey:@"MCLTempDisabledUntilDate"];
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 504);
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl(&dword_22135E000, v7, OS_LOG_TYPE_DEFAULT, "MCL has been temp disabled until %@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)checkWhetherMCLTempDisablementCanBeClearedOnPlugin:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v5 = +[PowerUISmartChargeUtilities isPluggedInWithContext:self->_context];
  mclDisabledUntilDate = self->_mclDisabledUntilDate;
  int v7 = !v5 || v3;
  if (mclDisabledUntilDate) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    [(NSDate *)mclDisabledUntilDate timeIntervalSinceNow];
    double v10 = v9;
    log = self->_log;
    BOOL v12 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
    if (v10 <= 0.0)
    {
      if (v12)
      {
        uint64_t v14 = self->_mclDisabledUntilDate;
        *(_DWORD *)long long buf = 138412290;
        unint64_t v18 = v14;
        _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "MCL temp disablement date of %@ has passed, reenable feature", buf, 0xCu);
      }
      long long v15 = [(PowerUISmartChargeManager *)self queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __80__PowerUISmartChargeManager_checkWhetherMCLTempDisablementCanBeClearedOnPlugin___block_invoke;
      block[3] = &unk_2645A5CF0;
      void block[4] = self;
      dispatch_async(v15, block);
    }
    else if (v12)
    {
      id v13 = self->_mclDisabledUntilDate;
      *(_DWORD *)long long buf = 138412290;
      unint64_t v18 = v13;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "MCL temp disablement date of %@ still upcoming", buf, 0xCu);
    }
  }
}

uint64_t __80__PowerUISmartChargeManager_checkWhetherMCLTempDisablementCanBeClearedOnPlugin___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) enableMCL];
}

- (void)isMCLCurrentlyEnabledWithHandler:(id)a3
{
  int v7 = (void (**)(id, uint64_t, void))a3;
  [(PowerUISmartChargeManager *)self checkWhetherMCLTempDisablementCanBeClearedOnPlugin:0];
  unint64_t manualChargeLimitStatus = self->_manualChargeLimitStatus;
  uint64_t v5 = 3;
  if (manualChargeLimitStatus != 2) {
    uint64_t v5 = 0;
  }
  if (manualChargeLimitStatus == 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v5;
  }
  v7[2](v7, v6, 0);
}

- (unint64_t)currentRecommendedChargeLimit
{
  return self->_recommendedLimit;
}

- (void)currentRecommendedChargeLimitWithHandler:(id)a3
{
}

- (unint64_t)currentChargeLimit
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263EFF910] now];
  [(NSLock *)self->_deocCurrentStatusLock lock];
  uint64_t v4 = [MEMORY[0x263EFF910] date];
  uint64_t v5 = +[PowerUISmartChargeUtilities readDictForPreferenceKey:@"CurrentDEoCStatus" inDomain:self->_defaultsDomain];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"cacheDate"];
  [v4 timeIntervalSinceDate:v6];
  double v8 = v7;

  double v9 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v5];
  [v9 setObject:v4 forKeyedSubscript:@"committedDate"];
  if (!v5 || v8 < 0.0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 134217984;
      uint64_t v21 = 100;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Cached DEoC state nonexistent. Committed to charge limit: %lu", (uint8_t *)&v20, 0xCu);
    }
    [v9 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"limitCharge"];
    [v9 setObject:&unk_26D385768 forKeyedSubscript:@"DEoCStatus"];
    +[PowerUISmartChargeUtilities setDict:v9 forPreferenceKey:@"CurrentDEoCStatus" inDomain:self->_defaultsDomain];
    [(NSLock *)self->_deocCurrentStatusLock unlock];
    goto LABEL_16;
  }
  +[PowerUISmartChargeUtilities setDict:v9 forPreferenceKey:@"CurrentDEoCStatus" inDomain:self->_defaultsDomain];
  [(NSLock *)self->_deocCurrentStatusLock unlock];
  double v10 = self->_log;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v10;
    [v3 timeIntervalSinceNow];
    int v20 = 134217984;
    *(double *)&uint64_t v21 = v12 * -1000.0;
    _os_log_impl(&dword_22135E000, v11, OS_LOG_TYPE_DEFAULT, "Elapsed time for currentChargeLimit: %f ms", (uint8_t *)&v20, 0xCu);
  }
  id v13 = [v9 objectForKeyedSubscript:@"limitCharge"];
  if ([v13 BOOLValue])
  {
    uint64_t v14 = [v9 objectForKeyedSubscript:@"dryRun"];
    char v15 = [v14 BOOLValue];

    if ((v15 & 1) == 0)
    {
      BOOL v16 = self->_log;
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v17 = 80;
        goto LABEL_17;
      }
      int v20 = 134217984;
      unint64_t v17 = 80;
      uint64_t v21 = 80;
      goto LABEL_15;
    }
  }
  else
  {
  }
  BOOL v16 = self->_log;
  if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
LABEL_16:
    unint64_t v17 = 100;
    goto LABEL_17;
  }
  int v20 = 134217984;
  unint64_t v17 = 100;
  uint64_t v21 = 100;
LABEL_15:
  _os_log_impl(&dword_22135E000, v16, OS_LOG_TYPE_DEFAULT, "Committed to charge limit: %lu", (uint8_t *)&v20, 0xCu);
LABEL_17:

  return v17;
}

- (BOOL)isDEoCSupported
{
  if (MGGetBoolAnswer())
  {
    LOBYTE(v3) = 1;
  }
  else if (+[PowerUISmartChargeUtilities isInternalBuild])
  {
    uint64_t v4 = [(PowerUISmartChargeManager *)self readNumberForPreferenceKey:@"allowDEoCOverride"];
    uint64_t v5 = v4;
    if (v4) {
      int v3 = (int)([v4 BOOLValue] << 31) >> 31;
    }
    else {
      LOBYTE(v3) = 0;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3 & 1;
}

- (void)isDEoCSupportedWithHandler:(id)a3
{
  id v5 = a3;
  (*((void (**)(id, BOOL, void))a3 + 2))(v5, [(PowerUISmartChargeManager *)self isDEoCSupported], 0);
}

- (void)isDEoCCurrentlyEnabledWithHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, unint64_t, void))a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSNumber;
    unint64_t deocFeatureState = self->_deocFeatureState;
    double v8 = log;
    double v9 = [v6 numberWithUnsignedInteger:deocFeatureState];
    int v10 = 138412290;
    uint64_t v11 = v9;
    _os_log_impl(&dword_22135E000, v8, OS_LOG_TYPE_DEFAULT, "Returning current DEoC state: %@", (uint8_t *)&v10, 0xCu);
  }
  v4[2](v4, self->_deocFeatureState, 0);
}

- (void)client:(id)a3 setDEoCState:(unint64_t)a4 withHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  double v9 = (void (**)(id, void, void *))a5;
  BOOL v10 = [(PowerUISmartChargeManager *)self isDEoCSupported];
  log = self->_log;
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[PowerUISmartChargeManager client:setDEoCState:withHandler:]();
    }
    char v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = 4;
    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = NSNumber;
    id v13 = log;
    uint64_t v14 = [v12 numberWithUnsignedInteger:a4];
    int v18 = 138412546;
    id v19 = v8;
    __int16 v20 = 2112;
    uint64_t v21 = v14;
    _os_log_impl(&dword_22135E000, v13, OS_LOG_TYPE_DEFAULT, "%@ requests DEoC state: %@", (uint8_t *)&v18, 0x16u);
  }
  if (!a4)
  {
    [(PowerUISmartChargeManager *)self disableDEoC];
    goto LABEL_13;
  }
  if (a4 != 1)
  {
    char v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = 1;
LABEL_12:
    unint64_t v17 = [v15 errorWithDomain:@"PowerUISmartChargingErrorDomain" code:v16 userInfo:0];
    v9[2](v9, 0, v17);

    goto LABEL_13;
  }
  [(PowerUISmartChargeManager *)self enableDEoC];
LABEL_13:
  v9[2](v9, 1, 0);
}

- (void)disableDEoC
{
  [(PowerUISmartChargeManager *)self setNumber:&unk_26D385768 forPreferenceKey:@"DEoCFeatureState"];
  self->_unint64_t deocFeatureState = 0;
  self->_BOOL isDesktopDevice = 0;
  [(PowerUISmartChargeManager *)self forceDEoCReevaluation];
  [(PowerUIChargingController *)self->_chargingController clearChargeLimitForLimitType:2];
  int v3 = [(PowerUISmartChargeManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__PowerUISmartChargeManager_disableDEoC__block_invoke;
  block[3] = &unk_2645A5CF0;
  void block[4] = self;
  dispatch_async(v3, block);

  uint64_t v6 = MEMORY[0x263EF8330];
  AnalyticsSendEventLazy();
  analyticsManager = self->_analyticsManager;
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", self->_context, v6, 3221225472, __40__PowerUISmartChargeManager_disableDEoC__block_invoke_2, &unk_2645A5FD0, self));
  [(PowerUIAnalyticsManager *)analyticsManager submitEngagementEventWithBatteryLevel:v5 targetSoC:0 predictedEndOfCharge:0 modeOfOperation:5 eventType:4];
}

uint64_t __40__PowerUISmartChargeManager_disableDEoC__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleCallback:1];
}

id __40__PowerUISmartChargeManager_disableDEoC__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = +[PowerUISmartChargeUtilities recentEngagementHistory];
  int v3 = (void *)[v2 mutableCopy];
  [v3 setObject:@"DEoCDisabled" forKeyedSubscript:@"DisableType"];
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_22135E000, v4, OS_LOG_TYPE_INFO, "After DEoC disablement, reporting %@", (uint8_t *)&v7, 0xCu);
  }
  id v5 = (void *)[v3 copy];

  return v5;
}

- (void)enableDEoC
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "ERROR: DEoC is enabling OBC. This should not happen unless the OBC configuration was changed manually.", v2, v3, v4, v5, v6);
}

- (void)currentChargeLimitWithHandler:(id)a3
{
  id v5 = a3;
  (*((void (**)(id, unint64_t, void))a3 + 2))(v5, [(PowerUISmartChargeManager *)self currentChargeLimit], 0);
}

- (void)getDEoCPredictionsWithHandler:(id)a3
{
  v33[3] = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)MEMORY[0x263EFF910];
  unint64_t v28 = (void (**)(id, void *, void))a3;
  id v5 = [v4 date];
  uint64_t v6 = +[PowerUISmartChargeUtilities drainSessionsInfoBetweenRelevantChargesBefore:v5 withMinimumDuration:0.0];

  int v7 = [[PowerUIMLRelevantDrainPredictor alloc] initWithDefaultsDomain:self->_defaultsDomain withContextStore:self->_context withTrialManager:self->_trialManager];
  int64_t v8 = +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:self->_context];
  uint64_t v9 = [MEMORY[0x263EFF910] date];
  BOOL v10 = [NSNumber numberWithInteger:v8];
  __int16 v29 = (void *)v6;
  uint64_t v11 = [(PowerUIMLRelevantDrainPredictor *)v7 featuresForChargeSessionAtDate:v9 withChargeStartSoC:v10 withChargeAndDrainSessionHistory:v6];

  uint64_t v12 = [(PowerUIMLRelevantDrainPredictor *)v7 predictedRelevantDrainwithFeatures:v11];
  int64_t v26 = [(PowerUITrialManager *)self->_trialManager longFactorForName:@"minDaysOfChargingHistoryRequiredForDEoCModel"];
  int64_t v27 = [(PowerUITrialManager *)self->_trialManager longFactorForName:@"minNumberOfRelevantDrainsRequiredForDEoCModel"];
  v32[0] = @"confidence";
  id v13 = NSNumber;
  [v12 confidence];
  uint64_t v14 = objc_msgSend(v13, "numberWithDouble:");
  v33[0] = v14;
  v32[1] = @"significantDrainAhead";
  char v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "significantDrainAhead"));
  v33[1] = v15;
  v32[2] = @"threshold";
  uint64_t v16 = NSNumber;
  [v12 threshold];
  unint64_t v17 = objc_msgSend(v16, "numberWithDouble:");
  v33[2] = v17;
  int v18 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];

  id v19 = [(PowerUITrialManager *)self->_trialManager experimentID];

  if (v19)
  {
    __int16 v20 = [(PowerUITrialManager *)self->_trialManager experimentID];
  }
  else
  {
    __int16 v20 = @"Nil";
  }
  uint64_t v21 = [(PowerUITrialManager *)self->_trialManager treatmentID];

  if (v21)
  {
    uint64_t v22 = [(PowerUITrialManager *)self->_trialManager treatmentID];
  }
  else
  {
    uint64_t v22 = @"Nil";
  }
  v30[0] = @"predictions";
  v30[1] = @"features";
  v31[0] = v18;
  v31[1] = v11;
  v31[2] = v29;
  v30[2] = @"drainInfo";
  v30[3] = @"minDaysCharging";
  uint64_t v23 = [NSNumber numberWithInteger:v26];
  v31[3] = v23;
  v30[4] = @"minNumberOfRelevantDrains";
  uint64_t v24 = [NSNumber numberWithInteger:v27];
  v31[4] = v24;
  v31[5] = v20;
  v30[5] = @"trialexperiment";
  v30[6] = @"trialTreatment";
  v31[6] = v22;
  int v25 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:7];

  v28[2](v28, v25, 0);
}

- (void)isOBCEngagedOrChargeLimitedWithHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  context = self->_context;
  id v5 = (void (**)(id, BOOL, unint64_t, BOOL, void))a3;
  BOOL v6 = +[PowerUISmartChargeUtilities isPluggedInWithContext:context];
  unint64_t checkpoint = self->_checkpoint;
  BOOL v8 = checkpoint - 2 < 3 && v6;
  BOOL v9 = checkpoint - 1 < 4 && v6;
  unint64_t v10 = [(PowerUISmartChargeManager *)self currentChargeLimit];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109632;
    v12[1] = v8;
    __int16 v13 = 2048;
    unint64_t v14 = v10;
    __int16 v15 = 1024;
    BOOL v16 = v9;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Returning currently engaged state: %u, charge limit: %lu, chargingOverrideAllowed: %u", (uint8_t *)v12, 0x18u);
  }
  v5[2](v5, v8, v10, v9, 0);
}

- (void)updateCurrentDEoCStatusAsGaugingMitigated
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "ERROR: No currentDEoCStatus for gauging adjustment", v2, v3, v4, v5, v6);
}

- (BOOL)isCECSupported
{
  return +[PowerUICECManager isCECSupported];
}

- (void)isCECSupportedWithHandler:(id)a3
{
  id v5 = a3;
  (*((void (**)(id, BOOL, void))a3 + 2))(v5, [(PowerUISmartChargeManager *)self isCECSupported], 0);
}

- (void)isCECCurrentlyEnabledWithHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = +[PowerUICECManager manager];
  uint64_t v6 = [v5 cecState];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = NSNumber;
    BOOL v9 = log;
    unint64_t v10 = [v8 numberWithUnsignedInteger:v6];
    int v11 = 138412290;
    uint64_t v12 = v10;
    _os_log_impl(&dword_22135E000, v9, OS_LOG_TYPE_DEFAULT, "Returning current state: %@", (uint8_t *)&v11, 0xCu);
  }
  v4[2](v4, v6, 0);
}

- (void)client:(id)a3 setCECState:(unint64_t)a4 withHandler:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  BOOL v9 = (void (**)(id, void, void *))a5;
  BOOL v10 = [(PowerUISmartChargeManager *)self isCECSupported];
  log = self->_log;
  if (v10)
  {
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = NSNumber;
      uint64_t v13 = log;
      unint64_t v14 = [v12 numberWithUnsignedInteger:a4];
      int v16 = 138412546;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v14;
      _os_log_impl(&dword_22135E000, v13, OS_LOG_TYPE_DEFAULT, "%@ requests CEC state: %@", (uint8_t *)&v16, 0x16u);
    }
    __int16 v15 = +[PowerUICECManager manager];
    [v15 handlePowerUICECStateChange:a4 withHandler:v9];
  }
  else
  {
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[PowerUISmartChargeManager client:setCECState:withHandler:]();
    }
    __int16 v15 = [MEMORY[0x263F087E8] errorWithDomain:@"PowerUISmartChargingErrorDomain" code:4 userInfo:0];
    v9[2](v9, 0, v15);
  }
}

- (void)cecFullChargeDeadlineWithHandler:(id)a3
{
  id v5 = (void (**)(id, void *, void))a3;
  uint64_t v3 = +[PowerUICECManager manager];
  if ([v3 isEngaged])
  {
    uint64_t v4 = [v3 userDeadline];
  }
  else
  {
    uint64_t v4 = 0;
  }
  v5[2](v5, v4, 0);
}

- (void)shouldMCMBeDisplayedWithHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, BOOL, void))a3;
  if ([(PowerUISmartChargeManager *)self isMCMSupported])
  {
    mcmLog = self->_mcmLog;
    if (os_log_type_enabled(mcmLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = NSNumber;
      BOOL isChargePackConnected = self->_isChargePackConnected;
      id v8 = mcmLog;
      BOOL v9 = [v6 numberWithBool:isChargePackConnected];
      int v10 = 138412290;
      int v11 = v9;
      _os_log_impl(&dword_22135E000, v8, OS_LOG_TYPE_DEFAULT, "Returning whether MCM settings should be displayed: %@", (uint8_t *)&v10, 0xCu);
    }
    v4[2](v4, self->_isChargePackConnected, 0);
  }
  else
  {
    v4[2](v4, 0, 0);
  }
}

- (void)isMCMCurrentlyEnabledWithHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, unint64_t, void))a3;
  mcmLog = self->_mcmLog;
  if (os_log_type_enabled(mcmLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSNumber;
    unint64_t mcmCurrentState = self->_mcmCurrentState;
    id v8 = mcmLog;
    BOOL v9 = [v6 numberWithUnsignedInteger:mcmCurrentState];
    int v10 = 138412290;
    int v11 = v9;
    _os_log_impl(&dword_22135E000, v8, OS_LOG_TYPE_DEFAULT, "Returning current MCM state: %@", (uint8_t *)&v10, 0xCu);
  }
  v4[2](v4, self->_mcmCurrentState, 0);
}

- (void)client:(id)a3 setMCMState:(unint64_t)a4 withHandler:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  BOOL v9 = (void (**)(id, uint64_t, void))a5;
  BOOL v10 = [(PowerUISmartChargeManager *)self isMCMSupported];
  mcmLog = self->_mcmLog;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)self->_mcmLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = NSNumber;
      uint64_t v13 = mcmLog;
      unint64_t v14 = [v12 numberWithUnsignedInteger:a4];
      int v19 = 138412546;
      id v20 = v8;
      __int16 v21 = 2112;
      uint64_t v22 = v14;
      _os_log_impl(&dword_22135E000, v13, OS_LOG_TYPE_DEFAULT, "%@ requests state: %@", (uint8_t *)&v19, 0x16u);
    }
    switch(a4)
    {
      case 2uLL:
        self->_unint64_t mcmCurrentState = 2;
        __int16 v15 = &unk_26D3856F0;
        goto LABEL_13;
      case 1uLL:
        self->_unint64_t mcmCurrentState = 1;
        [(PowerUISmartChargeManager *)self setNumber:&unk_26D385600 forPreferenceKey:@"MCMCurrentState"];
        goto LABEL_15;
      case 0uLL:
        self->_unint64_t mcmCurrentState = 0;
        __int16 v15 = &unk_26D385768;
LABEL_13:
        [(PowerUISmartChargeManager *)self setNumber:v15 forPreferenceKey:@"MCMCurrentState"];
        [(PowerUISmartChargeManager *)self mcmEnableCharging];
LABEL_15:
        v9[2](v9, 1, 0);
        [(PowerUISmartChargeManager *)self reportMCMStatusWithBatteryLevel:0xFFFFFFFFLL];
        goto LABEL_16;
    }
    int v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = 1;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_mcmLog, OS_LOG_TYPE_ERROR)) {
      -[PowerUISmartChargeManager client:setMCMState:withHandler:]();
    }
    int v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = 4;
  }
  __int16 v18 = [v16 errorWithDomain:@"PowerUISmartChargingErrorDomain" code:v17 userInfo:0];
  ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v18);

LABEL_16:
}

- (void)engageFrom:(id)a3 until:(id)a4 repeatUntil:(id)a5 overrideAllSignals:(BOOL)a6 withHandler:(id)a7
{
  BOOL v8 = a6;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  __int16 v15 = (void (**)(id, uint64_t))a7;
  [(PowerUISmartChargeManager *)self setEngagementTimeOverride:v12];
  [(PowerUISmartChargeManager *)self setFullChargeDeadlineOverride:v13];
  [(PowerUISmartChargeManager *)self setRepeatEngagementOverrideEndDate:v14];
  int v16 = NSNumber;
  uint64_t v17 = [(PowerUISmartChargeManager *)self engagementTimeOverride];
  [v17 timeIntervalSinceReferenceDate];
  __int16 v18 = objc_msgSend(v16, "numberWithDouble:");
  [(PowerUISmartChargeManager *)self setNumber:v18 forPreferenceKey:@"engagementTimeOverride"];

  int v19 = NSNumber;
  id v20 = [(PowerUISmartChargeManager *)self fullChargeDeadlineOverride];
  [v20 timeIntervalSinceReferenceDate];
  __int16 v21 = objc_msgSend(v19, "numberWithDouble:");
  [(PowerUISmartChargeManager *)self setNumber:v21 forPreferenceKey:@"fullChargeDeadlineOverride"];

  uint64_t v22 = NSNumber;
  uint64_t v23 = [(PowerUISmartChargeManager *)self repeatEngagementOverrideEndDate];
  [v23 timeIntervalSinceReferenceDate];
  uint64_t v24 = objc_msgSend(v22, "numberWithDouble:");
  [(PowerUISmartChargeManager *)self setNumber:v24 forPreferenceKey:@"repeatEngagementOverrideEndDate"];

  self->_overrideAllSignals = v8;
  if (v8)
  {
    int v25 = [NSNumber numberWithBool:1];
    [(PowerUISmartChargeManager *)self setNumber:v25 forPreferenceKey:@"overrideAllSignals"];
  }
  self->_unint64_t predictorType = -1;
  int64_t v26 = [NSNumber numberWithUnsignedInteger:-1];
  [(PowerUISmartChargeManager *)self setNumber:v26 forPreferenceKey:@"chargePredictionModel"];

  [(PowerUISmartChargeManager *)self setEnabled:1];
  [(PowerUISmartChargeManager *)self setCurrentState:1];
  [(PowerUISmartChargeManager *)self setTemporarilyDisabled:0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v28 = NSNumber;
    __int16 v29 = log;
    uint64_t v30 = [v28 numberWithBool:v8];
    int v31 = 138413058;
    id v32 = v12;
    __int16 v33 = 2112;
    id v34 = v13;
    __int16 v35 = 2112;
    id v36 = v14;
    __int16 v37 = 2112;
    char v38 = v30;
    _os_log_impl(&dword_22135E000, v29, OS_LOG_TYPE_DEFAULT, "Top-off will engage after %@ targetting full deadline of %@. Repeat until %@, Signal override=%@", (uint8_t *)&v31, 0x2Au);
  }
  v15[2](v15, 1);
}

- (void)resetEngagementOverrideWithHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t))a3;
  [(PowerUISmartChargeManager *)self setEngagementTimeOverride:0];
  [(PowerUISmartChargeManager *)self setFullChargeDeadlineOverride:0];
  [(PowerUISmartChargeManager *)self setRepeatEngagementOverrideEndDate:0];
  [(PowerUISmartChargeManager *)self setNumber:0 forPreferenceKey:@"engagementTimeOverride"];
  [(PowerUISmartChargeManager *)self setNumber:0 forPreferenceKey:@"fullChargeDeadlineOverride"];
  [(PowerUISmartChargeManager *)self setNumber:0 forPreferenceKey:@"repeatEngagementOverrideEndDate"];
  self->_unint64_t predictorType = 2;
  id v5 = [NSNumber numberWithUnsignedInteger:2];
  [(PowerUISmartChargeManager *)self setNumber:v5 forPreferenceKey:@"chargePredictionModel"];

  [(PowerUISmartChargeManager *)self setEnabled:1];
  [(PowerUISmartChargeManager *)self setCurrentState:1];
  [(PowerUISmartChargeManager *)self setTemporarilyDisabled:0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Overrides removed.", v7, 2u);
  }
  v4[2](v4, 1);
}

- (void)simulateCurrentOutputAsOfDate:(id)a3 overrideAllSignals:(BOOL)a4 withHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  BOOL v9 = (void (**)(id, void *, void))a5;
  if (+[PowerUISmartChargeUtilities isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v15 = 0;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Simulating output", v15, 2u);
    }
    int v11 = v8;
    if (!v8)
    {
      int v11 = [MEMORY[0x263EFF910] date];
    }
    id v12 = [(PowerUISmartChargeManager *)self shouldDisableChargingAsOfDate:v11 atBatteryLevel:80 overrideAllSignals:v6 withPredictor:self->_modelTwoStagePredictor bypassSaved:1];
    if (!v8) {

    }
    id v13 = [v12 objectForKeyedSubscript:@"decisionDate"];
    if (v13)
    {
      v9[2](v9, v13, 0);
    }
    else
    {
      id v14 = [MEMORY[0x263EFF910] distantPast];
      v9[2](v9, v14, 0);
    }
  }
  else
  {
    id v12 = [MEMORY[0x263EFF910] distantPast];
    v9[2](v9, v12, 0);
  }
}

- (void)enterDevelopmentMode
{
  if (+[PowerUISmartChargeUtilities isInternalBuild])
  {
    [(PowerUISmartChargeManager *)self setNumber:&unk_26D385648 forPreferenceKey:@"overrideCarryDetection"];
    [(PowerUISmartChargeManager *)self setNumber:&unk_26D385648 forPreferenceKey:@"activityMinHistory"];
    [(PowerUISmartChargeManager *)self setNumber:&unk_26D385648 forPreferenceKey:@"locIgnored"];
    [(PowerUISmartChargeManager *)self resetDeviceHasLegitimateUsage];
  }
}

- (void)resetDevelopmentMode
{
  if (+[PowerUISmartChargeUtilities isInternalBuild])
  {
    [(PowerUISmartChargeManager *)self setNumber:0 forPreferenceKey:@"overrideCarryDetection"];
    [(PowerUISmartChargeManager *)self setNumber:0 forPreferenceKey:@"activityMinHistory"];
    [(PowerUISmartChargeManager *)self setNumber:0 forPreferenceKey:@"locIgnored"];
    [(PowerUISmartChargeManager *)self resetDeviceHasLegitimateUsage];
  }
}

- (void)currentLeewayWithHandler:(id)a3
{
  id v5 = NSNumber;
  id v6 = a3;
  id v8 = [(PowerUISmartChargeManager *)self modelTwoStagePredictor];
  [v8 adjustedDuration];
  int v7 = objc_msgSend(v5, "numberWithDouble:");
  (*((void (**)(id, void *, void))a3 + 2))(v6, v7, 0);
}

- (void)listMonitorSignals
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = self->_monitors;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v44;
    *(void *)&long long v4 = 138412290;
    long long v33 = v4;
    uint64_t v34 = *(void *)v44;
    do
    {
      uint64_t v7 = 0;
      uint64_t v35 = v5;
      do
      {
        if (*(void *)v44 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v43 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v37 = v7;
          BOOL v9 = [v8 detectedSignals];
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v51 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v40;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v40 != v12) {
                  objc_enumerationMutation(v9);
                }
                log = self->_log;
                if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                {
                  __int16 v15 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                  int v16 = log;
                  uint64_t v17 = objc_opt_class();
                  *(_DWORD *)long long buf = 138412546;
                  uint64_t v48 = v17;
                  __int16 v49 = 2112;
                  double v50 = v15;
                  id v18 = v17;
                  _os_log_impl(&dword_22135E000, v16, OS_LOG_TYPE_DEFAULT, "Monitor of type '%@' detected signal with start date: %@", buf, 0x16u);
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v39 objects:v51 count:16];
            }
            while (v11);
          }
          if (!objc_msgSend(v9, "count", v33))
          {
            int v19 = self->_log;
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              id v20 = v19;
              __int16 v21 = objc_opt_class();
              *(_DWORD *)long long buf = v33;
              uint64_t v48 = v21;
              id v22 = v21;
              _os_log_impl(&dword_22135E000, v20, OS_LOG_TYPE_DEFAULT, "Monitor of type '%@' did not detect any valid signals.", buf, 0xCu);
            }
          }

          uint64_t v6 = v34;
          uint64_t v5 = v35;
          uint64_t v7 = v37;
        }
        else if ([v8 signalID] == 4)
        {
          id v23 = v8;
          uint64_t v24 = self->_log;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            int v25 = v24;
            int64_t v26 = objc_opt_class();
            uint64_t v38 = v7;
            id v27 = v26;
            unint64_t v28 = [v23 requiredFullChargeDate];
            *(_DWORD *)long long buf = 138412546;
            uint64_t v48 = v26;
            __int16 v49 = 2112;
            double v50 = v28;
            _os_log_impl(&dword_22135E000, v25, OS_LOG_TYPE_DEFAULT, "Required full charge date from %@: %@", buf, 0x16u);

            uint64_t v7 = v38;
          }
        }
        else
        {
          __int16 v29 = self->_log;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v30 = v29;
            int v31 = objc_opt_class();
            *(_DWORD *)long long buf = v33;
            uint64_t v48 = v31;
            id v32 = v31;
            _os_log_impl(&dword_22135E000, v30, OS_LOG_TYPE_DEFAULT, "Monitor of type '%@' does not respond to signals debug query.", buf, 0xCu);
          }
        }
        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v43 objects:v52 count:16];
    }
    while (v5);
  }
}

- (void)mcmEnableCharging
{
  self->_mcmForbidsCharging = 0;
  [(PowerUISmartChargeManager *)self setNumber:MEMORY[0x263EFFA80] forPreferenceKey:@"MCMForbidsCharging"];
  chargingController = self->_chargingController;
  [(PowerUIChargingController *)chargingController clearChargeLimitForLimitType:5];
}

- (void)mcmDisableCharging
{
  self->_mcmForbidsCharging = 1;
  [(PowerUISmartChargeManager *)self setNumber:MEMORY[0x263EFFA88] forPreferenceKey:@"MCMForbidsCharging"];
  chargingController = self->_chargingController;
  [(PowerUIChargingController *)chargingController setChargeLimitTo:91 forLimitType:5];
}

- (BOOL)isMCMSupported
{
  return MGGetBoolAnswer();
}

- (id)mcmActiveNotificationRequest
{
  id v2 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  uint64_t v3 = (void *)[objc_alloc(NSURL) initFileURLWithPath:@"/System/Library/PrivateFrameworks/PowerUI.framework"];
  long long v4 = [MEMORY[0x263F086E0] bundleWithURL:v3];
  uint64_t v5 = [v4 localizedStringForKey:@"MCM_FEATURE_TITLE" value:&stru_26D3439E8 table:@"Localizable-A149"];
  [v2 setTitle:v5];

  id v6 = objc_alloc_init(MEMORY[0x263F08A30]);
  uint64_t v7 = [MEMORY[0x263EFF960] currentLocale];
  [v6 setLocale:v7];

  [v6 setNumberStyle:3];
  [v6 setMaximumFractionDigits:0];
  [v6 setMultiplier:&unk_26D385648];
  id v8 = NSString;
  BOOL v9 = [v4 localizedStringForKey:@"MCM_ACTIVE_BODY" value:&stru_26D3439E8 table:@"Localizable-A149"];
  uint64_t v10 = [v6 stringFromNumber:&unk_26D385948];
  uint64_t v11 = objc_msgSend(v8, "stringWithFormat:", v9, v10);
  [v2 setBody:v11];

  [v2 setCategoryIdentifier:@"mcmActiveCategory"];
  [v2 setShouldHideDate:1];
  [v2 setShouldHideTime:1];
  [v2 setShouldSuppressDefaultAction:1];
  [v2 setShouldIgnoreDowntime:1];
  [v2 setShouldIgnoreDoNotDisturb:1];
  uint64_t v12 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:480.0];
  [v2 setExpirationDate:v12];

  id v13 = [MEMORY[0x263F1DF40] iconForSystemImageNamed:@"bolt.fill"];
  [v2 setIcon:v13];

  id v14 = (void *)MEMORY[0x263F1DF48];
  __int16 v15 = [MEMORY[0x263F1DFA8] triggerWithTimeInterval:0 repeats:1.0];
  int v16 = [v14 requestWithIdentifier:@"mcmActiveNotification" content:v2 trigger:v15];

  [v16 setDestinations:6];
  return v16;
}

- (void)reportMCMStatusWithBatteryLevel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  id v6 = [NSNumber numberWithUnsignedInteger:self->_mcmCurrentState];
  [v5 setObject:v6 forKeyedSubscript:@"mcmCurrentState"];

  uint64_t v7 = [NSNumber numberWithBool:self->_isChargePackConnected];
  [v5 setObject:v7 forKeyedSubscript:@"isChargePackConnected"];

  id v8 = [NSNumber numberWithBool:self->_mcmForbidsCharging];
  [v5 setObject:v8 forKeyedSubscript:@"mcmForbidsCharging"];

  if (v3 <= 0x64)
  {
    BOOL v9 = [NSNumber numberWithInt:v3];
    [v5 setObject:v9 forKeyedSubscript:@"batteryLevel"];
  }
  mcmLog = self->_mcmLog;
  if (os_log_type_enabled(mcmLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_22135E000, mcmLog, OS_LOG_TYPE_DEFAULT, "Reporting to PowerLog and BDC for MCM:", buf, 2u);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v11 = [v5 allKeys];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        int v16 = self->_mcmLog;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          id v18 = v16;
          int v19 = [v5 valueForKey:v17];
          *(_DWORD *)long long buf = 138412546;
          uint64_t v27 = v17;
          __int16 v28 = 2112;
          __int16 v29 = v19;
          _os_log_impl(&dword_22135E000, v18, OS_LOG_TYPE_DEFAULT, "  %@: %@", buf, 0x16u);
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v13);
  }

  id v20 = (void *)MEMORY[0x223C80A30]();
  __int16 v21 = [NSDictionary dictionaryWithDictionary:v5];
  PLLogRegisteredEvent();
  [(NSDistributedNotificationCenter *)self->_notificationCenter postNotificationName:@"com.apple.powerui.mcmstatusasnotification" object:@"PowerUI" userInfo:v21];
}

- (void)accessoryConnectionAttached:(id)a3 type:(int)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (a4 == 9)
  {
    mcmLog = self->_mcmLog;
    if (os_log_type_enabled(mcmLog, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_22135E000, mcmLog, OS_LOG_TYPE_DEFAULT, "New accessory (%@), connection type: NFC", (uint8_t *)&v10, 0xCu);
    }
    [(PowerUISmartChargeManager *)self accessoryNFCConnectionCallback:v7];
  }
  else if (a4 == 4)
  {
    id v8 = self->_mcmLog;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_22135E000, v8, OS_LOG_TYPE_DEFAULT, "New accessory (%@), connection type: Inductive", (uint8_t *)&v10, 0xCu);
    }
    objc_storeStrong((id *)&self->_currentChargePackInductiveConnectionUUID, a3);
  }
}

- (void)accessoryNFCConnectionCallback:(id)a3
{
  connectionInfoProvider = self->_connectionInfoProvider;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  void v4[2] = __60__PowerUISmartChargeManager_accessoryNFCConnectionCallback___block_invoke;
  v4[3] = &unk_2645A6C28;
  v4[4] = self;
  [(ACCConnectionInfo *)connectionInfoProvider accessoryEndpointsForConnection:a3 withReply:v4];
}

void __60__PowerUISmartChargeManager_accessoryNFCConnectionCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 104);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    *(_DWORD *)long long buf = 134218242;
    uint64_t v25 = [v6 count];
    __int16 v26 = 2112;
    id v27 = v5;
    _os_log_impl(&dword_22135E000, v8, OS_LOG_TYPE_DEFAULT, "%lu endpoints for NFC connection (%@)", buf, 0x16u);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    uint64_t v13 = *MEMORY[0x263F341E8];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v16 = *(void *)(a1 + 32);
        uint64_t v17 = *(void **)(v16 + 424);
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __60__PowerUISmartChargeManager_accessoryNFCConnectionCallback___block_invoke_1624;
        void v18[3] = &unk_2645A6C00;
        v18[4] = v16;
        [v17 accessoryProperty:v13 forEndpoint:v15 connection:v5 withReply:v18];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
}

void __60__PowerUISmartChargeManager_accessoryNFCConnectionCallback___block_invoke_1624(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = v12;
  if (v12)
  {
    int v14 = [v12 unsignedIntValue];
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(NSObject **)(v15 + 104);
    if (v14 == 66)
    {
      if (os_log_type_enabled(*(os_log_t *)(v15 + 104), OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22135E000, v16, OS_LOG_TYPE_DEFAULT, "Charge pack connected through NFC", buf, 2u);
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 440), a3);
      uint64_t v17 = *(void *)(a1 + 32);
      if (*(void *)(v17 + 432))
      {
        id v18 = *(NSObject **)(v17 + 104);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_22135E000, v18, OS_LOG_TYPE_DEFAULT, "Cancel fidget mitigation timer", buf, 2u);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 432));
        uint64_t v17 = *(void *)(a1 + 32);
      }
      *(unsigned char *)(v17 + 17) = 1;
      [*(id *)(a1 + 32) reportMCMStatusWithBatteryLevel:0xFFFFFFFFLL];
      if (*(void *)(*(void *)(a1 + 32) + 456) <= 2uLL)
      {
        uint64_t v38 = v13;
        id v39 = v11;
        id v40 = v10;
        id v41 = v9;
        long long v19 = +[PowerUINotificationManager sharedInstance];
        long long v20 = [v19 getDeliveredNotifications];

        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v21 = v20;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v43;
          while (2)
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v43 != v24) {
                objc_enumerationMutation(v21);
              }
              __int16 v26 = [*(id *)(*((void *)&v42 + 1) + 8 * i) request];
              id v27 = [v26 content];
              uint64_t v28 = [v27 categoryIdentifier];
              int v29 = [v28 isEqualToString:@"mcmActiveCategory"];

              if (v29)
              {
                uint64_t v35 = *(NSObject **)(*(void *)(a1 + 32) + 104);
                id v32 = v21;
                id v10 = v40;
                id v9 = v41;
                uint64_t v13 = v38;
                id v11 = v39;
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_impl(&dword_22135E000, v35, OS_LOG_TYPE_DEFAULT, "MCM notification still active, don't display a new one.", buf, 2u);
                  id v32 = v21;
                }
                goto LABEL_30;
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v42 objects:v46 count:16];
            if (v23) {
              continue;
            }
            break;
          }
        }

        uint64_t v30 = +[PowerUINotificationManager sharedInstance];
        uint64_t v31 = [*(id *)(a1 + 32) mcmActiveNotificationRequest];
        id v32 = [v30 postNotificationWithRequest:v31];

        uint64_t v33 = *(void *)(a1 + 32);
        if (v32)
        {
          id v10 = v40;
          if (os_log_type_enabled(*(os_log_t *)(v33 + 104), OS_LOG_TYPE_ERROR)) {
            __60__PowerUISmartChargeManager_accessoryNFCConnectionCallback___block_invoke_1624_cold_1();
          }
          id v9 = v41;
        }
        else
        {
          ++*(void *)(v33 + 456);
          id v36 = *(void **)(a1 + 32);
          uint64_t v37 = [NSNumber numberWithUnsignedInteger:v36[57]];
          [v36 setNumber:v37 forPreferenceKey:@"NumberOfTimesMCMNotificationWasDisplayed"];

          id v10 = v40;
          id v9 = v41;
        }
        uint64_t v13 = v38;
        id v11 = v39;
LABEL_30:
      }
    }
    else if (os_log_type_enabled(*(os_log_t *)(v15 + 104), OS_LOG_TYPE_ERROR))
    {
      __60__PowerUISmartChargeManager_accessoryNFCConnectionCallback___block_invoke_1624_cold_2();
    }
  }
  else
  {
    uint64_t v34 = *(NSObject **)(*(void *)(a1 + 32) + 104);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v48 = v9;
      _os_log_impl(&dword_22135E000, v34, OS_LOG_TYPE_DEFAULT, "No NFC property value for endpoint (%@)", buf, 0xCu);
    }
  }
}

- (void)accessoryConnectionDetached:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![v4 isEqualToString:self->_currentChargePackNFCConnectionUUID])
  {
    if ([v4 isEqualToString:self->_currentChargePackInductiveConnectionUUID])
    {
      currentChargePackInductiveConnectionUUID = self->_currentChargePackInductiveConnectionUUID;
      self->_currentChargePackInductiveConnectionUUID = 0;

      mcmLog = self->_mcmLog;
      if (!os_log_type_enabled(mcmLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      int v9 = 138412290;
      id v10 = v4;
      id v8 = "Known inductive connection '%@' lost.";
    }
    else
    {
      mcmLog = self->_mcmLog;
      if (!os_log_type_enabled(mcmLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      int v9 = 138412290;
      id v10 = v4;
      id v8 = "Accessory '%@' disconnected.";
    }
    _os_log_impl(&dword_22135E000, mcmLog, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v9, 0xCu);
    goto LABEL_12;
  }
  id v5 = self->_mcmLog;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_22135E000, v5, OS_LOG_TYPE_DEFAULT, "Known charge pack disconnected (%@). Reset state.", (uint8_t *)&v9, 0xCu);
  }
  self->_BOOL isChargePackConnected = 0;
  [(PowerUISmartChargeManager *)self mcmEnableCharging];
  [(PowerUISmartChargeManager *)self reportMCMStatusWithBatteryLevel:0xFFFFFFFFLL];
  [(PowerUISmartChargeManager *)self clearManualChargeLimit];
  if (self->_mcmCurrentState == 2) {
    [(PowerUISmartChargeManager *)self startFidgetMitigationTimer];
  }
LABEL_12:
}

- (void)startFidgetMitigationTimer
{
  mcmLog = self->_mcmLog;
  if (os_log_type_enabled(mcmLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_22135E000, mcmLog, OS_LOG_TYPE_DEFAULT, "MCM is temporarily disabled, start fidget mitigation.", buf, 2u);
  }
  id v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
  mcmFidgetMitigationTimer = self->_mcmFidgetMitigationTimer;
  self->_mcmFidgetMitigationTimer = v4;

  id v6 = self->_mcmFidgetMitigationTimer;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __55__PowerUISmartChargeManager_startFidgetMitigationTimer__block_invoke;
  handler[3] = &unk_2645A5CF0;
  void handler[4] = self;
  dispatch_source_set_event_handler(v6, handler);
  id v7 = self->_mcmFidgetMitigationTimer;
  dispatch_time_t v8 = dispatch_walltime(0, 480000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_activate((dispatch_object_t)self->_mcmFidgetMitigationTimer);
}

uint64_t __55__PowerUISmartChargeManager_startFidgetMitigationTimer__block_invoke(uint64_t a1)
{
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 104);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22135E000, v2, OS_LOG_TYPE_DEFAULT, "MCM Fidget mitigation timer ran out, re-enable MCM.", v4, 2u);
  }
  *(void *)(*(void *)(a1 + 32) + 416) = 1;
  return [*(id *)(a1 + 32) setNumber:&unk_26D385600 forPreferenceKey:@"MCMCurrentState"];
}

- (void)setContext:(id)a3
{
}

- (NSString)defaultsDomain
{
  return self->_defaultsDomain;
}

- (void)setDefaultsDomain:(id)a3
{
}

- (id)beforeBatteryCallback
{
  return self->_beforeBatteryCallback;
}

- (void)setBeforeBatteryCallback:(id)a3
{
}

- (id)afterBatteryCallback
{
  return self->_afterBatteryCallback;
}

- (void)setAfterBatteryCallback:(id)a3
{
}

- (_CDContextualKeyPath)checkpointKP
{
  return self->_checkpointKP;
}

- (void)setCheckpointKP:(id)a3
{
}

- (NSDistributedNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (void)setLog:(id)a3
{
}

- (OS_os_log)mcmLog
{
  return self->_mcmLog;
}

- (void)setMcmLog:(id)a3
{
}

- (unint64_t)checkpoint
{
  return self->_checkpoint;
}

- (void)setCheckpoint:(unint64_t)a3
{
  self->_unint64_t checkpoint = a3;
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_service = a3;
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NSDate)disabledUntilDate
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDisabledUntilDate:(id)a3
{
}

- (BOOL)temporarilyDisabled
{
  return self->_temporarilyDisabled;
}

- (void)setTemporarilyDisabled:(BOOL)a3
{
  self->_temporarilyDisabled = a3;
}

- (NSDate)_fullChargeDeadline
{
  return self->__fullChargeDeadline;
}

- (void)set_fullChargeDeadline:(id)a3
{
}

- (NSDate)uiDeadline
{
  return self->_uiDeadline;
}

- (void)setUiDeadline:(id)a3
{
}

- (void)setSignalDeadline:(id)a3
{
}

- (NSDate)lastComputedSignalDeadline
{
  return self->_lastComputedSignalDeadline;
}

- (void)setLastComputedSignalDeadline:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)xpcCallbackQueue
{
  return self->_xpcCallbackQueue;
}

- (void)setXpcCallbackQueue:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (int)powerlogToken
{
  return self->_powerlogToken;
}

- (void)setPowerlogToken:(int)a3
{
  self->_powerlogToken = a3;
}

- (OS_xpc_object)bdcConnection
{
  return self->_bdcConnection;
}

- (void)setBdcConnection:(id)a3
{
}

- (BOOL)_hasLegitimateUsage
{
  return self->__hasLegitimateUsage;
}

- (void)set_hasLegitimateUsage:(BOOL)a3
{
  self->__hasLegitimateUsage = a3;
}

- (int)lastFullyCharged
{
  return self->_lastFullyCharged;
}

- (BOOL)lastChargerWasWireless
{
  return self->_lastChargerWasWireless;
}

- (void)setLastChargerWasWireless:(BOOL)a3
{
  self->_lastChargerWasWireless = a3;
}

- (NSDate)lastInterruptedTime
{
  return self->_lastInterruptedTime;
}

- (void)setLastInterruptedTime:(id)a3
{
}

- (NSDate)potentialUnplugDate
{
  return self->_potentialUnplugDate;
}

- (void)setPotentialUnplugDate:(id)a3
{
}

- (NSNumber)engagementsLastMonthBucket
{
  return self->_engagementsLastMonthBucket;
}

- (void)setEngagementsLastMonthBucket:(id)a3
{
}

- (NSNumber)lastReportedNumberOfPluginEvents
{
  return self->_lastReportedNumberOfPluginEvents;
}

- (void)setLastReportedNumberOfPluginEvents:(id)a3
{
}

- (NSNumber)medianPluginLength
{
  return self->_medianPluginLength;
}

- (void)setMedianPluginLength:(id)a3
{
}

- (double)empiricalTimeToFullChargeDurationMinutes
{
  return self->_empiricalTimeToFullChargeDurationMinutes;
}

- (void)setEmpiricalTimeToFullChargeDurationMinutes:(double)a3
{
  self->_double empiricalTimeToFullChargeDurationMinutes = a3;
}

- (int64_t)deadlineSignalID
{
  return self->_deadlineSignalID;
}

- (void)setDeadlineSignalID:(int64_t)a3
{
  self->_deadlineSignalID = a3;
}

- (BOOL)signalsIgnored
{
  return self->_signalsIgnored;
}

- (void)setSignalsIgnored:(BOOL)a3
{
  self->_BOOL signalsIgnored = a3;
}

- (double)debounceOverride
{
  return self->_debounceOverride;
}

- (void)setDebounceOverride:(double)a3
{
  self->_double debounceOverride = a3;
}

- (unint64_t)predictorType
{
  return self->_predictorType;
}

- (void)setPredictorType:(unint64_t)a3
{
  self->_unint64_t predictorType = a3;
}

- (int64_t)previousDecisionMakerID
{
  return self->_previousDecisionMakerID;
}

- (void)setPreviousDecisionMakerID:(int64_t)a3
{
  self->_int64_t previousDecisionMakerID = a3;
}

- (NSNumber)lastNonEngagementSignalID
{
  return self->_lastNonEngagementSignalID;
}

- (void)setLastNonEngagementSignalID:(id)a3
{
}

- (NSDate)previousDecisionMakerDate
{
  return self->_previousDecisionMakerDate;
}

- (void)setPreviousDecisionMakerDate:(id)a3
{
}

- (PowerUIMLTwoStageModelPredictor)modelTwoStagePredictor
{
  return self->_modelTwoStagePredictor;
}

- (void)setModelTwoStagePredictor:(id)a3
{
}

- (PowerUIIntelligenceManager)intelligenceManager
{
  return self->_intelligenceManager;
}

- (void)setIntelligenceManager:(id)a3
{
}

- (NSArray)monitors
{
  return self->_monitors;
}

- (void)setMonitors:(id)a3
{
}

- (NSDictionary)powerLogStatus
{
  return (NSDictionary *)objc_getProperty(self, a2, 320, 1);
}

- (void)setPowerLogStatus:(id)a3
{
}

- (NSDictionary)previousPowerLogStatus
{
  return (NSDictionary *)objc_getProperty(self, a2, 328, 1);
}

- (void)setPreviousPowerLogStatus:(id)a3
{
}

- (NSDate)engagementTimeOverride
{
  return (NSDate *)objc_getProperty(self, a2, 336, 1);
}

- (void)setEngagementTimeOverride:(id)a3
{
}

- (NSDate)fullChargeDeadlineOverride
{
  return (NSDate *)objc_getProperty(self, a2, 344, 1);
}

- (void)setFullChargeDeadlineOverride:(id)a3
{
}

- (NSDate)repeatEngagementOverrideEndDate
{
  return (NSDate *)objc_getProperty(self, a2, 352, 1);
}

- (void)setRepeatEngagementOverrideEndDate:(id)a3
{
}

- (BOOL)overrideAllSignals
{
  return self->_overrideAllSignals;
}

- (void)setOverrideAllSignals:(BOOL)a3
{
  self->_overrideAllSignals = a3;
}

- (BOOL)encounteredTLCDuringTopOff
{
  return self->_encounteredTLCDuringTopOff;
}

- (void)setEncounteredTLCDuringTopOff:(BOOL)a3
{
  self->_encounteredTLCDuringTopOff = a3;
}

- (BOOL)isDesktopDevice
{
  return self->_isDesktopDevice;
}

- (void)setIsDesktopDevice:(BOOL)a3
{
  self->_BOOL isDesktopDevice = a3;
}

- (NSDate)lastDesktopModeChangeDate
{
  return self->_lastDesktopModeChangeDate;
}

- (void)setLastDesktopModeChangeDate:(id)a3
{
}

- (PowerUIBatteryMitigationManager)batteryMitigationManager
{
  return self->_batteryMitigationManager;
}

- (void)setBatteryMitigationManager:(id)a3
{
}

- (PowerUIBDCDataManager)bdcDataManager
{
  return self->_bdcDataManager;
}

- (void)setBdcDataManager:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (PowerUITrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
}

- (BOOL)remoteOBCEngaged
{
  return self->_remoteOBCEngaged;
}

- (void)setRemoteOBCEngaged:(BOOL)a3
{
  self->_remoteOBCEngaged = a3;
}

- (PowerUIChargingController)chargingController
{
  return self->_chargingController;
}

- (void)setChargingController:(id)a3
{
}

- (PowerUIAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (unint64_t)mcmCurrentState
{
  return self->_mcmCurrentState;
}

- (void)setMcmCurrentState:(unint64_t)a3
{
  self->_unint64_t mcmCurrentState = a3;
}

- (ACCConnectionInfo)connectionInfoProvider
{
  return self->_connectionInfoProvider;
}

- (void)setConnectionInfoProvider:(id)a3
{
}

- (OS_dispatch_source)mcmFidgetMitigationTimer
{
  return self->_mcmFidgetMitigationTimer;
}

- (void)setMcmFidgetMitigationTimer:(id)a3
{
}

- (BOOL)isChargePackConnected
{
  return self->_isChargePackConnected;
}

- (void)setIsChargePackConnected:(BOOL)a3
{
  self->_BOOL isChargePackConnected = a3;
}

- (BOOL)mcmForbidsCharging
{
  return self->_mcmForbidsCharging;
}

- (void)setMcmForbidsCharging:(BOOL)a3
{
  self->_mcmForbidsCharging = a3;
}

- (NSString)currentChargePackNFCConnectionUUID
{
  return (NSString *)objc_getProperty(self, a2, 440, 1);
}

- (void)setCurrentChargePackNFCConnectionUUID:(id)a3
{
}

- (NSString)currentChargePackInductiveConnectionUUID
{
  return (NSString *)objc_getProperty(self, a2, 448, 1);
}

- (void)setCurrentChargePackInductiveConnectionUUID:(id)a3
{
}

- (unint64_t)numberOfTimesMCMNotificationWasDisplayed
{
  return self->_numberOfTimesMCMNotificationWasDisplayed;
}

- (void)setNumberOfTimesMCMNotificationWasDisplayed:(unint64_t)a3
{
  self->_numberOfTimesMCMNotificationWasDisplayed = a3;
}

- (BOOL)OBCReengagementEvaluated
{
  return self->_OBCReengagementEvaluated;
}

- (void)setOBCReengagementEvaluated:(BOOL)a3
{
  self->_OBCReengagementEvaluated = a3;
}

- (unint64_t)deocFeatureState
{
  return self->_deocFeatureState;
}

- (void)setDeocFeatureState:(unint64_t)a3
{
  self->_unint64_t deocFeatureState = a3;
}

- (NSLock)deocCurrentStatusLock
{
  return self->_deocCurrentStatusLock;
}

- (void)setDeocCurrentStatusLock:(id)a3
{
}

- (unint64_t)manualChargeLimitStatus
{
  return self->_manualChargeLimitStatus;
}

- (void)setManualChargeLimitStatus:(unint64_t)a3
{
  self->_unint64_t manualChargeLimitStatus = a3;
}

- (BOOL)manualChargeLimitWasEverEnabled
{
  return self->_manualChargeLimitWasEverEnabled;
}

- (void)setManualChargeLimitWasEverEnabled:(BOOL)a3
{
  self->_BOOL manualChargeLimitWasEverEnabled = a3;
}

- (__CFString)chargeLimitToken
{
  return self->_chargeLimitToken;
}

- (void)setChargeLimitToken:(__CFString *)a3
{
  self->_chargeLimitToken = a3;
}

- (unsigned)mclTargetSoC
{
  return self->_mclTargetSoC;
}

- (void)setMclTargetSoC:(unsigned __int8)a3
{
  self->_int mclTargetSoC = a3;
}

- (unint64_t)recommendedLimit
{
  return self->_recommendedLimit;
}

- (void)setRecommendedLimit:(unint64_t)a3
{
  self->_unint64_t recommendedLimit = a3;
}

- (NSDate)mclDisabledUntilDate
{
  return (NSDate *)objc_getProperty(self, a2, 504, 1);
}

- (void)setMclDisabledUntilDate:(id)a3
{
}

- (BOOL)becameOBCEligible
{
  return self->_becameOBCEligible;
}

- (void)setBecameOBCEligible:(BOOL)a3
{
  self->_becameOBCEligible = a3;
}

- (BOOL)reachedTargetSoC
{
  return self->_reachedTargetSoC;
}

- (void)setReachedTargetSoC:(BOOL)a3
{
  self->_reachedTargetSoC = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mclDisabledUntilDate, 0);
  objc_storeStrong((id *)&self->_deocCurrentStatusLock, 0);
  objc_storeStrong((id *)&self->_currentChargePackInductiveConnectionUUID, 0);
  objc_storeStrong((id *)&self->_currentChargePackNFCConnectionUUID, 0);
  objc_storeStrong((id *)&self->_mcmFidgetMitigationTimer, 0);
  objc_storeStrong((id *)&self->_connectionInfoProvider, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_chargingController, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_bdcDataManager, 0);
  objc_storeStrong((id *)&self->_batteryMitigationManager, 0);
  objc_storeStrong((id *)&self->_lastDesktopModeChangeDate, 0);
  objc_storeStrong((id *)&self->_repeatEngagementOverrideEndDate, 0);
  objc_storeStrong((id *)&self->_fullChargeDeadlineOverride, 0);
  objc_storeStrong((id *)&self->_engagementTimeOverride, 0);
  objc_storeStrong((id *)&self->_previousPowerLogStatus, 0);
  objc_storeStrong((id *)&self->_powerLogStatus, 0);
  objc_storeStrong((id *)&self->_monitors, 0);
  objc_storeStrong((id *)&self->_intelligenceManager, 0);
  objc_storeStrong((id *)&self->_modelTwoStagePredictor, 0);
  objc_storeStrong((id *)&self->_previousDecisionMakerDate, 0);
  objc_storeStrong((id *)&self->_lastNonEngagementSignalID, 0);
  objc_storeStrong((id *)&self->_medianPluginLength, 0);
  objc_storeStrong((id *)&self->_lastReportedNumberOfPluginEvents, 0);
  objc_storeStrong((id *)&self->_engagementsLastMonthBucket, 0);
  objc_storeStrong((id *)&self->_potentialUnplugDate, 0);
  objc_storeStrong((id *)&self->_lastInterruptedTime, 0);
  objc_storeStrong((id *)&self->_bdcConnection, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_xpcCallbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lastComputedSignalDeadline, 0);
  objc_storeStrong((id *)&self->_signalDeadline, 0);
  objc_storeStrong((id *)&self->_uiDeadline, 0);
  objc_storeStrong((id *)&self->__fullChargeDeadline, 0);
  objc_storeStrong((id *)&self->_disabledUntilDate, 0);
  objc_storeStrong((id *)&self->_mcmLog, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_checkpointKP, 0);
  objc_storeStrong(&self->_afterBatteryCallback, 0);
  objc_storeStrong(&self->_beforeBatteryCallback, 0);
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_3_627_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_3(&dword_22135E000, v0, v1, "Gauging mitigation callback, but state did not change", v2, v3, v4, v5, v6);
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_663_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_3(&dword_22135E000, v0, v1, "ReportAnalyticsRepeatingActivity checking in!", v2, v3, v4, v5, v6);
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_666_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_3(&dword_22135E000, v0, v1, "ReportMonthlyAnalyticsActivity checking in!", v2, v3, v4, v5, v6);
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_667_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_3(&dword_22135E000, v0, v1, "BatteryHealthMetrics checking in!", v2, v3, v4, v5, v6);
}

- (void)idleDurationWithEngagedCheckpoints:(void *)a1 withTopOffStartCheckpoints:withDisabledCheckpoints:withTopOffStart:withIdleStart:withTemporarilyDisabledStart:withPluginEnd:.cold.1(void *a1)
{
  id v2 = a1;
  double v3 = OUTLINED_FUNCTION_8();
  uint64_t v5 = [v4 numberWithDouble:v3];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_22135E000, v6, v7, "ERROR: idleStart after topOffStart, duration: %@", v8, v9, v10, v11, v12);
}

- (void)idleDurationWithEngagedCheckpoints:(void *)a1 withTopOffStartCheckpoints:withDisabledCheckpoints:withTopOffStart:withIdleStart:withTemporarilyDisabledStart:withPluginEnd:.cold.2(void *a1)
{
  id v2 = a1;
  double v3 = OUTLINED_FUNCTION_8();
  uint64_t v5 = [v4 numberWithDouble:v3];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_22135E000, v6, v7, "ERROR: idleStart after temporarilyDisabledStart, duration: %@", v8, v9, v10, v11, v12);
}

- (void)idleDurationWithEngagedCheckpoints:(void *)a1 withTopOffStartCheckpoints:withDisabledCheckpoints:withTopOffStart:withIdleStart:withTemporarilyDisabledStart:withPluginEnd:.cold.3(void *a1)
{
  id v2 = a1;
  double v3 = OUTLINED_FUNCTION_8();
  uint64_t v5 = [v4 numberWithDouble:v3];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_22135E000, v6, v7, "ERROR: idleStart after pluginEnd, duration: %@", v8, v9, v10, v11, v12);
}

- (void)constructAnalyticsStatusFromEvents:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend(NSNumber, "numberWithDouble:");
  OUTLINED_FUNCTION_4_0();
  uint64_t v6 = a1;
  _os_log_fault_impl(&dword_22135E000, a2, OS_LOG_TYPE_FAULT, "Negative idleDuration %@, events are %@", v5, 0x16u);
}

- (void)recordDEoCAnalytics:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_22135E000, a2, OS_LOG_TYPE_ERROR, "ERROR: Most recent drain out of bounds: %d", (uint8_t *)v2, 8u);
}

- (void)incomingBDCRequest:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_3(&dword_22135E000, v0, v1, "incomingBDCRequest done", v2, v3, v4, v5, v6);
}

void __48__PowerUISmartChargeManager_incomingBDCRequest___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "ERROR: unknown incoming xpc connection event", v2, v3, v4, v5, v6);
}

void __48__PowerUISmartChargeManager_incomingBDCRequest___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_3(&dword_22135E000, v0, v1, "incoming xpc connection event", v2, v3, v4, v5, v6);
}

- (void)sendBDCData:withMessage:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "Cannot create reply dictionary", v2, v3, v4, v5, v6);
}

- (void)sendBDCData:withMessage:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "ERROR: Ignoring BDC data message from unprivileged sender", v2, v3, v4, v5, v6);
}

- (void)sendBDCData:withMessage:.cold.3()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4_0();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_22135E000, v1, OS_LOG_TYPE_ERROR, "Invalid parameters. remoteConn: %@ msg: %@", v2, 0x16u);
}

- (void)handleCallback:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_22135E000, v0, OS_LOG_TYPE_DEBUG, "Plugin date set to %@", v1, 0xCu);
}

- (void)handleCallback:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 9);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_22135E000, a2, OS_LOG_TYPE_DEBUG, "Skipping prediction check: Feature disabled (temporarily %d)", (uint8_t *)v3, 8u);
}

- (void)handleCallback:(NSObject *)a3 .cold.3(void *a1, int a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 67109376;
  v5[1] = [a1 lastPluginStatus];
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_debug_impl(&dword_22135E000, a3, OS_LOG_TYPE_DEBUG, "lastPluginStatus: %d - newPluginStatus: %d", (uint8_t *)v5, 0xEu);
}

- (void)handleCallback:.cold.4()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_3(&dword_22135E000, v0, v1, "Continue OBC evaluation", v2, v3, v4, v5, v6);
}

- (void)handleCallback:.cold.5()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_3(&dword_22135E000, v0, v1, "Skipping prediction check: Nothing has changed", v2, v3, v4, v5, v6);
}

- (void)shouldContinueAfterMCMCheckWithBatteryLevel:withIsCharging:withIsExternalConnected:withIsPluggedIn:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "MCM was incorrectly forbidding charging.", v2, v3, v4, v5, v6);
}

- (void)constructDailyStats:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  double v3 = OUTLINED_FUNCTION_8();
  uint64_t v5 = [v4 numberWithDouble:v3];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_22135E000, v6, v7, "ERROR: Suspicious number of eligibleDurationHours: %@", v8, v9, v10, v11, v12);
}

- (void)constructDailyStats:(void *)a1 .cold.2(void *a1)
{
  id v2 = a1;
  double v3 = OUTLINED_FUNCTION_8();
  uint64_t v5 = [v4 numberWithDouble:v3];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_22135E000, v6, v7, "ERROR: Suspicious number of idleDurationHours: %@", v8, v9, v10, v11, v12);
}

- (void)handleNewBatteryLevel:whileExternalConnected:fullyCharged:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_3(&dword_22135E000, v0, v1, "Skipping prediction check: Device does not seem like a legitimate carry device", v2, v3, v4, v5, v6);
}

- (void)shouldDisableChargingAsOfDate:atBatteryLevel:overrideAllSignals:withPredictor:bypassSaved:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "ERROR: No currentDEoCStatus at deadline adjustment stage", v2, v3, v4, v5, v6);
}

- (void)shouldDisableChargingAsOfDate:atBatteryLevel:overrideAllSignals:withPredictor:bypassSaved:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "ERROR: No signalID key in deadlineResult", v2, v3, v4, v5, v6);
}

- (void)shouldDisableChargingAsOfDate:atBatteryLevel:overrideAllSignals:withPredictor:bypassSaved:.cold.3()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "ERROR: DEoC limited by unexpected monitor", v2, v3, v4, v5, v6);
}

- (void)chargePrediction:fullyCharged:previousCheckpoint:predictor:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_3(&dword_22135E000, v0, v1, "Skipping prediction check: Device is already fully charged", v2, v3, v4, v5, v6);
}

- (void)chargePrediction:fullyCharged:previousCheckpoint:predictor:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "ERROR: Uncaught state in charge prediction.", v2, v3, v4, v5, v6);
}

- (void)cacheCurrentDEoCBehaviorForced:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  _os_log_fault_impl(&dword_22135E000, v0, OS_LOG_TYPE_FAULT, "ERROR: Drain predictor model did not provide a result", v1, 2u);
}

- (void)cacheCurrentDEoCBehaviorForced:(os_log_t)log .cold.3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_22135E000, log, OS_LOG_TYPE_FAULT, "Opting out of DEoC due to unexpected monitor", buf, 2u);
}

- (void)cacheCurrentDEoCBehaviorForced:(uint64_t)a3 .cold.4(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 134217984;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_1_0(&dword_22135E000, a2, a3, "ERROR: unknown DEoC feature state : %lu", (uint8_t *)&v4);
}

- (void)cacheCurrentDEoCBehaviorForced:.cold.5()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_3(&dword_22135E000, v0, v1, "Do not cache DEoC while plugged in", v2, v3, v4, v5, v6);
}

- (void)cacheCurrentDEoCBehaviorForced:(unsigned __int8 *)a1 .cold.6(unsigned __int8 *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = NSNumber;
  uint64_t v4 = a1[8];
  uint64_t v5 = a2;
  uint8_t v6 = [v3 numberWithBool:v4];
  uint64_t v7 = [NSNumber numberWithBool:a1[9]];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", +[PowerUISmartChargeUtilities isOBCSupported](PowerUISmartChargeUtilities, "isOBCSupported") ^ 1);
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a1, "isDEoCSupported") ^ 1);
  int v10 = 138413058;
  uint64_t v11 = v6;
  __int16 v12 = 2112;
  uint64_t v13 = v7;
  __int16 v14 = 2112;
  uint64_t v15 = v8;
  __int16 v16 = 2112;
  uint64_t v17 = v9;
  _os_log_debug_impl(&dword_22135E000, v5, OS_LOG_TYPE_DEBUG, "!_enabled: %@ - _temporarilyDisabled: %@ - ![PowerUISmartChargeUtilities isOBCSupported]: %@ - ![self isDEoCSupported]: %@", (uint8_t *)&v10, 0x2Au);
}

- (void)handleNotificationResponse:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "Unknown action on charge recommendation response", v2, v3, v4, v5, v6);
}

- (void)listener:shouldAcceptNewConnection:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_3(&dword_22135E000, v0, v1, "NSXPCListenerDelegate callback.", v2, v3, v4, v5, v6);
}

- (void)client:setState:withHandler:.cold.1()
{
  OUTLINED_FUNCTION_11();
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = v1;
  uint64_t v3 = [v0 stringFromState:1];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_22135E000, v2, OS_LOG_TYPE_ERROR, "%@ requests state: %@, but the state is not supported!", v4, 0x16u);
}

void __57__PowerUISmartChargeManager_client_setState_withHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_3(&dword_22135E000, v0, v1, "About to post OBC state change notification due to client set state request", v2, v3, v4, v5, v6);
}

- (void)client:(uint64_t)a1 setMCLLimit:(void *)a2 withHandler:(unsigned __int8)a3 .cold.1(uint64_t a1, void *a2, unsigned __int8 a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a2;
  uint8_t v6 = [v4 numberWithUnsignedChar:a3];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_22135E000, v7, v8, "%@ requests MCL limit: %@, but this number is out of bounds!", v9, v10, v11, v12, v13);
}

- (void)client:(uint64_t)a1 setMCLLimit:(void *)a2 withHandler:(unsigned __int8)a3 .cold.2(uint64_t a1, void *a2, unsigned __int8 a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a2;
  uint8_t v6 = [v4 numberWithUnsignedChar:a3];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_22135E000, v7, v8, "%@ requests MCL limit: %@, but MCL is not supported on this hardware!", v9, v10, v11, v12, v13);
}

- (void)tmpDisableMCLViaClient:withHandler:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_22135E000, v0, v1, "%@ requests MCL tmp disable, but MCL already disabled or temp disabled", v2);
}

- (void)tmpDisableMCLViaClient:withHandler:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_22135E000, v0, v1, "%@ requests MCL tmp disable, but MCL is not supported on this hardware!", v2);
}

- (void)client:setDEoCState:withHandler:.cold.1()
{
  OUTLINED_FUNCTION_11();
  id v2 = v1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_9(), "numberWithUnsignedInteger:");
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_22135E000, v4, v5, "%@ requests DEoC state: %@, but DEoC is not supported on this hardware!", v6, v7, v8, v9, v10);
}

- (void)client:setCECState:withHandler:.cold.1()
{
  OUTLINED_FUNCTION_11();
  id v2 = v1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_9(), "numberWithUnsignedInteger:");
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_22135E000, v4, v5, "%@ requests state: %@, but CEC is not supported on this device!", v6, v7, v8, v9, v10);
}

- (void)client:setMCMState:withHandler:.cold.1()
{
  OUTLINED_FUNCTION_11();
  id v2 = v1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_9(), "numberWithUnsignedInteger:");
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_22135E000, v4, v5, "%@ requests state: %@, but MCM is not supported on this hardware!", v6, v7, v8, v9, v10);
}

void __60__PowerUISmartChargeManager_accessoryNFCConnectionCallback___block_invoke_1624_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_22135E000, v0, v1, "Unable to display MCM notification: %@", v2);
}

void __60__PowerUISmartChargeManager_accessoryNFCConnectionCallback___block_invoke_1624_cold_2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_22135E000, v0, v1, "Unknown NFC property value: %@", v2);
}

@end