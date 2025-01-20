@interface PLBatteryAgent
+ (BOOL)hasChargingInfoLogging;
+ (BOOL)hasExternalAccessory;
+ (BOOL)hasLightning;
+ (BOOL)hasWirelessCharger;
+ (BOOL)shouldLogBTM;
+ (BOOL)shouldLogCPMS;
+ (BOOL)shouldLogPPMDebugDetail;
+ (BOOL)supportsAccConnectionLogging;
+ (BOOL)supportsCleanEnergyCharging;
+ (BOOL)supportsFixedLimitCharging;
+ (BOOL)supportsSmartCharging;
+ (BOOL)supportsxFlags;
+ (id)connectStateStringToEnum:(id)a3;
+ (id)defaults;
+ (id)entryAggregateDefinitionUILevel;
+ (id)entryAggregateDefinitions;
+ (id)entryEventBackwardDefinitionAdapter;
+ (id)entryEventBackwardDefinitionBTM;
+ (id)entryEventBackwardDefinitionBattery;
+ (id)entryEventBackwardDefinitionBatteryUI;
+ (id)entryEventBackwardDefinitionChargingHeatMapA;
+ (id)entryEventBackwardDefinitionChargingHeatMapB;
+ (id)entryEventBackwardDefinitionChargingLimit;
+ (id)entryEventBackwardDefinitionCurrentAccumulator;
+ (id)entryEventBackwardDefinitionDischargingHeatMap;
+ (id)entryEventBackwardDefinitionEABattery;
+ (id)entryEventBackwardDefinitionKioskMode;
+ (id)entryEventBackwardDefinitionPowerOut;
+ (id)entryEventBackwardDefinitionTrustedBatteryHealth;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitionAdapterDetails;
+ (id)entryEventForwardDefinitionCalibration0;
+ (id)entryEventForwardDefinitionCalibration0Info;
+ (id)entryEventForwardDefinitionCleanEnergyCharging;
+ (id)entryEventForwardDefinitionEAPencil;
+ (id)entryEventForwardDefinitionEAPencilCharging;
+ (id)entryEventForwardDefinitionExternalCharger;
+ (id)entryEventForwardDefinitionIOPMUBootLPMLog;
+ (id)entryEventForwardDefinitionLightningConnectorStatus;
+ (id)entryEventForwardDefinitionMitigationState;
+ (id)entryEventForwardDefinitionMobileChargeMode;
+ (id)entryEventForwardDefinitionPortControllerBuffer;
+ (id)entryEventForwardDefinitionPortControllerInfo;
+ (id)entryEventForwardDefinitionSmartCharging;
+ (id)entryEventForwardDefinitionUPOStepper;
+ (id)entryEventForwardDefinitionUSBCCharging;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitionCharging;
+ (id)entryEventIntervalDefinitionGasGauge;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitionBatteryConfig;
+ (id)entryEventNoneDefinitionUserType;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitionBatteryPanicShutdown;
+ (id)entryEventPointDefinitionBatterySample;
+ (id)entryEventPointDefinitionBatteryShutdown;
+ (id)entryEventPointDefinitionBatteryTrapInfo;
+ (id)entryEventPointDefinitionBatteryUILogging;
+ (id)entryEventPointDefinitionBatteryUIVisit;
+ (id)entryEventPointDefinitionCPMSClientState;
+ (id)entryEventPointDefinitionCPMSControlState;
+ (id)entryEventPointDefinitionChargingInfo;
+ (id)entryEventPointDefinitionEABatteryConfig;
+ (id)entryEventPointDefinitionEAPencil;
+ (id)entryEventPointDefinitionGasGaugeReconnect;
+ (id)entryEventPointDefinitionPPMClientMetrics;
+ (id)entryEventPointDefinitionPPMDebug;
+ (id)entryEventPointDefinitionUPOStepper;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (AVSystemController)avSystemController;
- (BOOL)allowGasGaugeRead;
- (BOOL)batterySerialChanged:(id)a3;
- (BOOL)cameraStreamingActive;
- (BOOL)checkForPenaltyBox:(id)a3;
- (BOOL)cleanEnergyChargingEngaged;
- (BOOL)csmOverrideValue;
- (BOOL)demoMode;
- (BOOL)driverActive:(id)a3;
- (BOOL)fixedChargingEngaged;
- (BOOL)gasGaugeOpenAndStartLogging;
- (BOOL)gasGaugeStopLoggingAndClose;
- (BOOL)givePluggedInFreePass;
- (BOOL)hasAppleSmartBattery;
- (BOOL)headphonesConnected;
- (BOOL)inPenaltyBox;
- (BOOL)isEABatteryConnectedNow;
- (BOOL)isEAPencilConnectedNow;
- (BOOL)isFirstTimeCheckingPingPong;
- (BOOL)isPingPongCharging;
- (BOOL)isTLCNotificationSurfaced;
- (BOOL)isUPOEntry:(id)a3;
- (BOOL)lifetimeDataLogged;
- (BOOL)modifiedExternalChargerEntry:(id)a3;
- (BOOL)rejudgeBattery;
- (BOOL)shouldLogCPMSSnapshotWithReason:(unsigned __int8)a3 withTrigger:(int64_t)a4;
- (BOOL)shouldLogEABatteryConfig;
- (BOOL)shouldQueryForAccessory;
- (BOOL)shouldWaitForLifetimeDataWithRawData:(id)a3;
- (BOOL)smartChargingEngaged;
- (BOOL)tlcIncreased;
- (NSData)previousPortBuffer1Read;
- (NSData)previousPortBuffer2Read;
- (NSData)previousPortBuffer3Read;
- (NSData)previousPortBuffer4Read;
- (NSDate)csmLastFlushMonotonicDate;
- (NSDate)lastEABatteryConnectedTime;
- (NSDate)lastGasGaugeLogTime;
- (NSDate)lastTLCEntryStartTime;
- (NSDate)lastTimeChargingInfoUpdated;
- (NSDate)lastTimeInPenaltyBox;
- (NSDate)lastTimePenaltyBoxIntervalUpdated;
- (NSDate)previousCurrentAccumulatorDate;
- (NSDate)previousPortControllerRead;
- (NSDictionary)lastITMiscStatus;
- (NSMutableArray)trackedAccessories;
- (NSMutableDictionary)openChargingIntervals;
- (NSNumber)TLCOverrideValue;
- (NSNumber)deviceIsPluggedIn;
- (NSNumber)lastAdapterPower;
- (NSNumber)lastDOD0;
- (NSNumber)lastTLCCounter;
- (NSNumber)lastVacVoltageLimit;
- (NSNumber)lastkIOPSAppleBatteryCaseCumulativeCurrentKey;
- (NSNumber)mitigatedUPOCount;
- (NSNumber)prevBatteryCellDisconnectCount;
- (NSNumber)prevGGResetCount;
- (NSString)chargingIntervalsEntryKey;
- (NSString)entryKeyEABattery;
- (NSString)entryKeyEAPencilStats;
- (NSString)lastAdapterManufacturer;
- (NSString)serialNumber;
- (PLBatteryAgent)init;
- (PLCFNotificationOperatorComposition)batteryChargingUIVisitNotification;
- (PLCFNotificationOperatorComposition)batteryHealthUIVisitNotification;
- (PLCFNotificationOperatorComposition)batteryUIVisitNotification;
- (PLCFNotificationOperatorComposition)cpmsDebugNotification;
- (PLCFNotificationOperatorComposition)csmFlushNotification;
- (PLCFNotificationOperatorComposition)csmOverrideNotification;
- (PLCFNotificationOperatorComposition)tlcOverrideNotification;
- (PLEntry)entryChargingOld;
- (PLEntry)lastBatteryConfigEntry;
- (PLEntry)lastChargerEntry;
- (PLEntryNotificationOperatorComposition)batteryLevelChanged;
- (PLEntryNotificationOperatorComposition)canSleepEntryNotifications;
- (PLEntryNotificationOperatorComposition)wakeEntryNotifications;
- (PLIOKitOperatorComposition)chargerIOService;
- (PLIOKitOperatorComposition)ioAccessoryManager;
- (PLIOKitOperatorComposition)iokitPPM;
- (PLIOKitOperatorComposition)iokitPowerSource;
- (PLIOKitOperatorComposition)magsafeIOService;
- (PLMonotonicTimer)significantBatteryChangeTimer;
- (PLNSNotificationOperatorComposition)thermalMonitorListener;
- (PLSemaphore)canSleepSemaphore;
- (PLTimer)EABatteryTimer;
- (PLTimer)eaBatteryConnectCountTimer;
- (PLTimer)gasGaugeTimer;
- (PLTimer)periodicAggdTimer;
- (PLTimer)ppmEventThresholdTimer;
- (PLTimer)xFlagsRetryTimer;
- (PLXPCListenerOperatorComposition)UPOStepperListener;
- (PLXPCListenerOperatorComposition)acamSBCListener;
- (PLXPCListenerOperatorComposition)bdcAMAListener;
- (PLXPCListenerOperatorComposition)cleanEnergyChargingListener;
- (PLXPCListenerOperatorComposition)mobileChargeModeListener;
- (PLXPCListenerOperatorComposition)smartChargingListener;
- (PLXPCResponderOperatorComposition)batteryChargingStateResponder;
- (PLXPCResponderOperatorComposition)batteryConfigResponder;
- (PLXPCResponderOperatorComposition)batteryDischargeCurrentResponder;
- (PLXPCResponderOperatorComposition)batteryInfoResponder;
- (PLXPCResponderOperatorComposition)batteryShutdownDataResponder;
- (PLXPCResponderOperatorComposition)batteryTemperatureResponder;
- (PLXPCResponderOperatorComposition)batteryUPOStepperResponder;
- (__IOHIDManager)BTMmanager;
- (double)EABatteryLevel;
- (double)EAEnergyDrained;
- (double)batteryLevelPercent;
- (double)csmFlushInterval;
- (double)deltaAccumulatedPower;
- (double)deltaAccumulatorCount;
- (double)deltaAccumulatorErrorCount;
- (double)filteredPower;
- (double)powerOutTotalCount;
- (double)powerOutTotalPower;
- (double)prevAccumulatedPower;
- (double)prevAccumulatorCount;
- (double)prevAccumulatorErrorCount;
- (double)rawBatteryVoltageVolt;
- (ggcontext)gasGagueConnection;
- (id)ApplyPolicyToDOFU:(id)a3 forSerial:(id)a4;
- (id)batteryEEEECode:(id)a3;
- (id)createTimerForEABatteryCountLogging;
- (id)dataFromHexString:(id)a3;
- (id)dateNoEarlierThan:(unint64_t)a3 since:(id)a4 withDelta:(id)a5;
- (id)getBaseIdentifierFromDevice:(id)a3;
- (id)getBatteryCalibration0Data;
- (id)getBatteryShutdownData;
- (id)getGaugingMitigationDict;
- (id)getIOPSDevices;
- (id)getMitigatedUPOCountDefault;
- (id)getPPMDebugData;
- (id)getUPOStepperData;
- (id)isOriginalBattery;
- (id)logEventBackwardBatteryWithRawData:(id)a3;
- (id)lowBatteryLogPath;
- (id)lowBatteryLogString;
- (id)overrideBatteryData:(id)a3 withPath:(id)a4;
- (id)parseBatterySerialNumber:(id)a3;
- (id)parseFlashWearLevelData:(id)a3;
- (id)parseITMiscStatusCounters:(id)a3;
- (id)parseLowVoltageResidencyCounters:(id)a3;
- (id)parseRawRaTableData:(id)a3;
- (id)parseRawSafetyFaultCounter:(id)a3;
- (id)parseTimeAtHighSoc:(id)a3;
- (id)parseTimeAtHighSocHex:(id)a3;
- (id)presentMaxRaFromRawData:(id)a3;
- (id)weekOfManufacture:(id)a3;
- (int)aggregatedTimeTLC;
- (int)batteryLifetimeUPOCount;
- (int)calculateChargingState:(id)a3;
- (int)calculateConnectedState:(id)a3;
- (int)deviceType;
- (int)gasGaugeConsecutiveEmptyEntriesCount;
- (int)getBatteryHealthServiceFlags;
- (int)getBatteryHealthServiceState;
- (int)getBatteryMaximumCapacityPercent;
- (int)getMitigationDefaults;
- (int)lastUILevel;
- (int)lifetimeMaxRa;
- (int)presentBatteryHealthMetric;
- (int)presentChemicalWeightedRa;
- (int)presentMaxRa;
- (int)presentOCV;
- (int)presentOCVCount;
- (int)presentPeakPerformanceCapacity;
- (int)presentQmaxUpdateDisqualified;
- (int)presentRaUpdateDisqualified;
- (int)presentTimeSinceLastOCV;
- (int)presentWeightedRa;
- (int)prevChargingState;
- (int)prevConnectedState;
- (int)previousCurrentAccumulator;
- (int)previousCurrentAccumulatorCount;
- (int)priIOAccessoryPowerMode;
- (int64_t)csmFailureCount;
- (int64_t)csmTotalCount;
- (int64_t)ppmEventLoggingCount;
- (int64_t)xFlags;
- (unint64_t)customConvertBase34ToBase10:(id)a3;
- (void)accessoryConnected:(id)a3;
- (void)accessoryConnectionEventNotification:(id)a3;
- (void)accessoryDisconnectEventNotification:(id)a3;
- (void)accessoryDisconnected:(id)a3;
- (void)accountGaugePowerFromCurrentAccumulatorEntry:(id)a3;
- (void)accountUSBCPowerOut;
- (void)addPowerMeasurementToAccounting:(double)a3 withStartDate:(id)a4 withEndDate:(id)a5;
- (void)aggdTimerFired;
- (void)cancelEALogging;
- (void)checkChargingInfoChange:(id)a3;
- (void)createFixedChargingIntervals:(id)a3;
- (void)dealloc;
- (void)detectEAPencilConnectionWithNotification:(id)a3;
- (void)deviceType;
- (void)fakeLogEntry:(id)a3;
- (void)flushCSMToAggdAtDate:(id)a3;
- (void)flushPowerOut;
- (void)gasGaugeRead;
- (void)getGaugingMitigationDict;
- (void)handleBDCAMALogging:(id)a3;
- (void)handleCameraStreaming:(BOOL)a3 withProperties:(id)a4;
- (void)handleCameraStreamingLogging:(id)a3;
- (void)handleGaugingMitigationStateCallback:(int)a3;
- (void)handleHeadphoneConnected:(id)a3;
- (void)handleMitigationStateCallback:(int)a3;
- (void)handleOnDeviceACAMSBC:(id)a3;
- (void)handlePPMCallback;
- (void)handleSBC;
- (void)handleTLCNotification:(id)a3 externalConnected:(BOOL)a4;
- (void)init;
- (void)initCameraStreamingIntervalTracking;
- (void)initCleanEnergyChargingLogging;
- (void)initOperatorDependancies;
- (void)initSmartChargingLogging;
- (void)initializeChargingStateIntervals;
- (void)log;
- (void)logAdapterDetails:(id)a3;
- (void)logAdapterDetailsEntry:(id)a3;
- (void)logAdapterDetailsToCA:(id)a3;
- (void)logAdapterInfo:(id)a3;
- (void)logAuthFail:(id)a3;
- (void)logBTM;
- (void)logBaselineToAggD:(id)a3;
- (void)logBaselineToCA:(id)a3;
- (void)logBatteryConfigToAggd:(id)a3;
- (void)logBatteryConfigToCA:(id)a3;
- (void)logBatteryEntry:(id)a3;
- (void)logBatteryShutdownToCA:(id)a3;
- (void)logCPMSSnapshotWithTrigger:(int64_t)a3;
- (void)logChargingParametersToAggd:(id)a3;
- (void)logChargingTimeToAggd:(double)a3;
- (void)logCurrentAccumulatorWithRawData:(id)a3;
- (void)logEABatteryConfig:(id)a3;
- (void)logEABatteryConfigToCA:(id)a3;
- (void)logEABatteryConnectedEventToAnalyticsIgnoreLastLogTimestamp:(BOOL)a3;
- (void)logEABatteryConnectedTimeToAnalyticsWithEAConnectionState:(BOOL)a3;
- (void)logEABatteryStatistics;
- (void)logEventBackwardBattery;
- (void)logEventBackwardChargingLimit;
- (void)logEventBackwardHeatMap;
- (void)logEventBackwardHeatMapCallback:(id)a3 andHeatMapType:(int64_t)a4;
- (void)logEventBackwardKioskMode;
- (void)logEventBackwardKioskModeCallback:(id)a3;
- (void)logEventBackwardTrustedBatteryHealth;
- (void)logEventForwardCalibration0InfowithData:(id)a3;
- (void)logEventForwardCalibration0withData:(id)a3;
- (void)logEventForwardCleanEnergyChargingWithPayload:(id)a3;
- (void)logEventForwardLPEM;
- (void)logEventForwardMitigationStateWithState:(unint64_t)a3 userDisabled:(BOOL)a4;
- (void)logEventForwardMobileChargeMode:(id)a3;
- (void)logEventForwardSmartChargingWithPayload:(id)a3;
- (void)logEventForwardUPOStepperWithPayload:(id)a3;
- (void)logEventIntervalGasGauge;
- (void)logEventNoneBatteryConfigCycleCountData;
- (void)logEventNoneBatteryConfigWithRawData:(id)a3;
- (void)logEventNoneUserType;
- (void)logEventPointBatteryChargingUIVisit;
- (void)logEventPointBatteryHealthUIVisit;
- (void)logEventPointBatteryPanicShutdown:(id)a3;
- (void)logEventPointBatteryShutdown;
- (void)logEventPointBatteryTrapInfo:(id)a3;
- (void)logEventPointBatteryUIVisit;
- (void)logEventPointChargingInfoWithChargingData:(id)a3;
- (void)logEventPointUPOStepper;
- (void)logFedDetails:(id)a3;
- (void)logFlashAgingToCA:(id)a3;
- (void)logKioskModeEntryToAggd:(id)a3;
- (void)logKioskModeEntryToCA:(id)a3;
- (void)logPPMDebug;
- (void)logPenaltyBoxDurationToAggd:(double)a3;
- (void)logPortControllerInfo:(id)a3;
- (void)logPortControllerInfoToCA:(id)a3 forPort:(int)a4;
- (void)logPowerOutDetails:(id)a3;
- (void)logSlowChargingReasonToCA:(id)a3;
- (void)logWatchdogDebugDumpToCA:(id)a3;
- (void)logkBatteryRsenseOpenCountToCA:(id)a3;
- (void)populateClientEntry:(id)a3 withBudget:(id)a4 withTemplate:(id)a5;
- (void)pushFlashWearLevelDataToCA:(id)a3;
- (void)pushLowVoltageResidencyCountersToCA:(id)a3;
- (void)pushTimeAtHighSocToAggD:(id)a3;
- (void)pushTimeAtHighSocToCA:(id)a3;
- (void)refreshEABatteryStatusTriggeredByConnectionEvent:(BOOL)a3;
- (void)setAcamSBCListener:(id)a3;
- (void)setAggdIntegerValueFromEntry:(id)a3 forKey:(id)a4 withPrefix:(id)a5;
- (void)setAggregatedTimeTLC:(int)a3;
- (void)setAllowGasGaugeRead:(BOOL)a3;
- (void)setAvSystemController:(id)a3;
- (void)setBTMmanager:(__IOHIDManager *)a3;
- (void)setBatteryChargingStateResponder:(id)a3;
- (void)setBatteryChargingUIVisitNotification:(id)a3;
- (void)setBatteryConfigResponder:(id)a3;
- (void)setBatteryDischargeCurrentResponder:(id)a3;
- (void)setBatteryHealthUIVisitNotification:(id)a3;
- (void)setBatteryInfoResponder:(id)a3;
- (void)setBatteryLevelChanged:(id)a3;
- (void)setBatteryLevelPercent:(double)a3;
- (void)setBatteryShutdownDataResponder:(id)a3;
- (void)setBatteryTemperatureResponder:(id)a3;
- (void)setBatteryUIVisitNotification:(id)a3;
- (void)setBatteryUPOStepperResponder:(id)a3;
- (void)setBdcAMAListener:(id)a3;
- (void)setCameraStreamingActive:(BOOL)a3;
- (void)setCanSleepSemaphore:(id)a3;
- (void)setChargerIOService:(id)a3;
- (void)setChargingIntervalsEntryKey:(id)a3;
- (void)setCleanEnergyChargingEngaged:(BOOL)a3;
- (void)setCleanEnergyChargingListener:(id)a3;
- (void)setCpmsDebugNotification:(id)a3;
- (void)setCsmFailureCount:(int64_t)a3;
- (void)setCsmFlushInterval:(double)a3;
- (void)setCsmFlushNotification:(id)a3;
- (void)setCsmLastFlushMonotonicDate:(id)a3;
- (void)setCsmOverrideNotification:(id)a3;
- (void)setCsmOverrideValue:(BOOL)a3;
- (void)setCsmTotalCount:(int64_t)a3;
- (void)setDeltaAccumulatedPower:(double)a3;
- (void)setDeltaAccumulatorCount:(double)a3;
- (void)setDeltaAccumulatorErrorCount:(double)a3;
- (void)setDemoMode:(BOOL)a3;
- (void)setDeviceIsPluggedIn:(id)a3;
- (void)setEABatteryLevel:(double)a3;
- (void)setEABatteryTimer:(id)a3;
- (void)setEAEnergyDrained:(double)a3;
- (void)setEaBatteryConnectCountTimer:(id)a3;
- (void)setEntryChargingOld:(id)a3;
- (void)setFilteredPower:(double)a3;
- (void)setFixedChargingEngaged:(BOOL)a3;
- (void)setGasGagueConnection:(ggcontext *)a3;
- (void)setGasGaugeConsecutiveEmptyEntriesCount:(int)a3;
- (void)setGasGaugeTimer:(id)a3;
- (void)setHeadphonesConnected:(BOOL)a3;
- (void)setInPenaltyBox:(BOOL)a3;
- (void)setIsFirstTimeCheckingPingPong:(BOOL)a3;
- (void)setIsPingPongCharging:(BOOL)a3;
- (void)setIsTLCNotificationSurfaced:(BOOL)a3;
- (void)setLastAdapterManufacturer:(id)a3;
- (void)setLastAdapterPower:(id)a3;
- (void)setLastBatteryConfigEntry:(id)a3;
- (void)setLastChargerEntry:(id)a3;
- (void)setLastDOD0:(id)a3;
- (void)setLastEABatteryConnectedTime:(id)a3;
- (void)setLastGasGaugeLogTime:(id)a3;
- (void)setLastITMiscStatus:(id)a3;
- (void)setLastTLCCounter:(id)a3;
- (void)setLastTLCEntryStartTime:(id)a3;
- (void)setLastTimeChargingInfoUpdated:(id)a3;
- (void)setLastTimeInPenaltyBox:(id)a3;
- (void)setLastTimePenaltyBoxIntervalUpdated:(id)a3;
- (void)setLastUILevel:(int)a3;
- (void)setLastVacVoltageLimit:(id)a3;
- (void)setLastkIOPSAppleBatteryCaseCumulativeCurrentKey:(id)a3;
- (void)setLifetimeDataLogged:(BOOL)a3;
- (void)setLifetimeMaxRa:(int)a3;
- (void)setMagsafeIOService:(id)a3;
- (void)setMitigatedUPOCount:(id)a3;
- (void)setMitigatedUPOCountDefault:(id)a3;
- (void)setMitigationStateDefault:(unint64_t)a3;
- (void)setMobileChargeModeListener:(id)a3;
- (void)setOpenChargingIntervals:(id)a3;
- (void)setPeriodicAggdTimer:(id)a3;
- (void)setPowerOutTotalCount:(double)a3;
- (void)setPowerOutTotalPower:(double)a3;
- (void)setPpmEventLoggingCount:(int64_t)a3;
- (void)setPpmEventThresholdTimer:(id)a3;
- (void)setPresentBatteryHealthMetric:(int)a3;
- (void)setPresentChemicalWeightedRa:(int)a3;
- (void)setPresentMaxRa:(int)a3;
- (void)setPresentOCV:(int)a3;
- (void)setPresentOCVCount:(int)a3;
- (void)setPresentPeakPerformanceCapacity:(int)a3;
- (void)setPresentQmaxUpdateDisqualified:(int)a3;
- (void)setPresentRaUpdateDisqualified:(int)a3;
- (void)setPresentTimeSinceLastOCV:(int)a3;
- (void)setPresentWeightedRa:(int)a3;
- (void)setPrevAccumulatedPower:(double)a3;
- (void)setPrevAccumulatorCount:(double)a3;
- (void)setPrevAccumulatorErrorCount:(double)a3;
- (void)setPrevBatteryCellDisconnectCount:(id)a3;
- (void)setPrevChargingState:(int)a3;
- (void)setPrevConnectedState:(int)a3;
- (void)setPrevGGResetCount:(id)a3;
- (void)setPreviousCurrentAccumulator:(int)a3;
- (void)setPreviousCurrentAccumulatorCount:(int)a3;
- (void)setPreviousCurrentAccumulatorDate:(id)a3;
- (void)setPreviousPortBuffer1Read:(id)a3;
- (void)setPreviousPortBuffer2Read:(id)a3;
- (void)setPreviousPortBuffer3Read:(id)a3;
- (void)setPreviousPortBuffer4Read:(id)a3;
- (void)setPreviousPortControllerRead:(id)a3;
- (void)setPriIOAccessoryPowerMode:(int)a3;
- (void)setRawBatteryVoltageVolt:(double)a3;
- (void)setRejudgeBattery:(BOOL)a3;
- (void)setSerialNumber:(id)a3;
- (void)setShouldLogEABatteryConfig:(BOOL)a3;
- (void)setShouldQueryForAccessory:(BOOL)a3;
- (void)setSignificantBatteryChangeTimer:(id)a3;
- (void)setSmartChargingEngaged:(BOOL)a3;
- (void)setSmartChargingListener:(id)a3;
- (void)setTLCOverrideValue:(id)a3;
- (void)setThermalMonitorListener:(id)a3;
- (void)setTlcIncreased:(BOOL)a3;
- (void)setTlcOverrideNotification:(id)a3;
- (void)setTrackedAccessories:(id)a3;
- (void)setUPOStepperListener:(id)a3;
- (void)setXFlagsRetryTimer:(id)a3;
- (void)setupAVSystemController;
- (void)setupCSMLogging;
- (void)setupEALoggingTriggeredByConnectionEvent:(BOOL)a3;
- (void)showOrHideTLCNotification:(BOOL)a3 timeInTLC:(double)a4;
- (void)updateCurrentSenseMonitorStatusWithEntry:(id)a3;
- (void)updateIntervalForType:(signed __int16)a3 withState:(BOOL)a4 andTime:(id)a5;
- (void)updateIntervalForType:(signed __int16)a3 withState:(BOOL)a4 andTime:(id)a5 selectedChargedLimit:(id)a6;
- (void)updateLastChargeLevel:(int)a3 withTimestamp:(double)a4;
@end

@implementation PLBatteryAgent

+ (BOOL)hasExternalAccessory
{
  return 1;
}

+ (BOOL)hasLightning
{
  return 1;
}

+ (BOOL)hasWirelessCharger
{
  if (hasWirelessCharger_onceToken != -1) {
    dispatch_once(&hasWirelessCharger_onceToken, &__block_literal_global_31);
  }
  return hasWirelessCharger___hasWirelessCharger;
}

uint64_t __36__PLBatteryAgent_hasWirelessCharger__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  hasWirelessCharger___hasWirelessCharger = result;
  return result;
}

+ (BOOL)supportsFixedLimitCharging
{
  if (supportsFixedLimitCharging_onceToken != -1) {
    dispatch_once(&supportsFixedLimitCharging_onceToken, &__block_literal_global_1740);
  }
  return supportsFixedLimitCharging_supportsFixedCharge;
}

uint64_t __44__PLBatteryAgent_supportsFixedLimitCharging__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  supportsFixedLimitCharging_supportsFixedCharge = result;
  return result;
}

+ (BOOL)supportsxFlags
{
  if (supportsxFlags_onceToken != -1) {
    dispatch_once(&supportsxFlags_onceToken, &__block_literal_global_1745);
  }
  return supportsxFlags___supportsBatteryModuleAuthentication;
}

uint64_t __32__PLBatteryAgent_supportsxFlags__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  supportsxFlags___supportsBatteryModuleAuthentication = result;
  return result;
}

+ (BOOL)supportsSmartCharging
{
  return [MEMORY[0x1E4F92A38] isiPhone];
}

+ (BOOL)supportsCleanEnergyCharging
{
  return [MEMORY[0x1E4F92A38] isiPhone];
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLBatteryAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventIntervalDefinitions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"GasGauge";
  v3 = [a1 entryEventIntervalDefinitionGasGauge];
  v7[1] = @"Charging";
  v8[0] = v3;
  v4 = [a1 entryEventIntervalDefinitionCharging];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)entryEventIntervalDefinitionGasGauge
{
  v35[2] = *MEMORY[0x1E4F143B8];
  if (+[PLUtilities hasGasGauge])
  {
    v34[0] = *MEMORY[0x1E4F92C50];
    uint64_t v32 = *MEMORY[0x1E4F92CD0];
    v33 = &unk_1F4012358;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    v35[0] = v27;
    v34[1] = *MEMORY[0x1E4F92CA8];
    v30[0] = @"timestampEnd";
    v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    v25 = objc_msgSend(v26, "commonTypeDict_DateFormat");
    v31[0] = v25;
    v30[1] = @"AvgCurrent";
    uint64_t v2 = *MEMORY[0x1E4F92D18];
    v28[0] = *MEMORY[0x1E4F92D10];
    v28[1] = v2;
    v29[0] = &unk_1F400DF78;
    v29[1] = @"mA";
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
    v31[1] = v24;
    v30[2] = @"MinCurrent";
    v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat_withUnit_mA");
    v31[2] = v22;
    v30[3] = @"MaxCurrent";
    v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat_withUnit_mA");
    v31[3] = v20;
    v30[4] = @"MinCurrentOffset";
    v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat_withUnit_s");
    v31[4] = v18;
    v30[5] = @"MaxCurrentOffset";
    v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat_withUnit_s");
    v31[5] = v16;
    v30[6] = @"Readings";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v31[6] = v14;
    v30[7] = @"AvgPower";
    v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    v4 = objc_msgSend(v3, "commonTypeDict_RealFormat_withUnit_mW");
    v31[7] = v4;
    v30[8] = @"TotalEnergy";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_RealFormat_withUnit_mWhr");
    v31[8] = v6;
    v30[9] = @"OverAllEnergy";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_RealFormat_withUnit_mWhr");
    v31[9] = v8;
    v30[10] = @"OverAllPower";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    v10 = objc_msgSend(v9, "commonTypeDict_RealFormat_withUnit_mWhr");
    v31[10] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:11];
    v35[1] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventIntervalDefinitionCharging
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CF8];
  v15[0] = *MEMORY[0x1E4F92CD0];
  v15[1] = v2;
  v16[0] = &unk_1F4012368;
  v16[1] = &unk_1F400DF90;
  v15[2] = *MEMORY[0x1E4F92CF0];
  v16[2] = &unk_1F4012378;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E4F92CA8];
  v13[0] = @"timestampEnd";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_DateFormat");
  v14[0] = v5;
  v13[1] = @"intervalType";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v14[1] = v7;
  v13[2] = @"chargeLimitTargetSoC";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v14[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v18[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v11;
}

+ (id)entryEventNoneDefinitions
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"BatteryConfig";
  uint64_t v2 = +[PLBatteryAgent entryEventNoneDefinitionBatteryConfig];
  v6[1] = @"UserType";
  v7[0] = v2;
  v3 = +[PLBatteryAgent entryEventNoneDefinitionUserType];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)entryEventNoneDefinitionBatteryConfig
{
  v250[2] = *MEMORY[0x1E4F143B8];
  v249[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CF8];
  v247[0] = *MEMORY[0x1E4F92CD0];
  v247[1] = v2;
  v248[0] = &unk_1F4012388;
  v248[1] = &unk_1F400DF90;
  v247[2] = *MEMORY[0x1E4F92CF0];
  v248[2] = &unk_1F4012398;
  v238 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v248 forKeys:v247 count:3];
  v250[0] = v238;
  v249[1] = *MEMORY[0x1E4F92CA8];
  v245[0] = @"QmaxCell0";
  uint64_t v4 = *MEMORY[0x1E4F92CA0];
  v243[0] = *MEMORY[0x1E4F92D10];
  uint64_t v3 = v243[0];
  v243[1] = v4;
  v244[0] = &unk_1F400DFA8;
  v244[1] = &unk_1F40145A8;
  v237 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v244 forKeys:v243 count:2];
  v246[0] = v237;
  v245[1] = @"Flags";
  v241[0] = v3;
  v241[1] = v4;
  v242[0] = &unk_1F400DFA8;
  v242[1] = &unk_1F40145C0;
  v236 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v242 forKeys:v241 count:2];
  v246[1] = v236;
  v245[2] = @"NominalChargeCapacity";
  v235 = [MEMORY[0x1E4F929D8] sharedInstance];
  v234 = objc_msgSend(v235, "commonTypeDict_IntegerFormat");
  v246[2] = v234;
  v245[3] = @"AppleRawMaxCapacity";
  v233 = [MEMORY[0x1E4F929D8] sharedInstance];
  v232 = objc_msgSend(v233, "commonTypeDict_IntegerFormat_withUnit_mAh");
  v246[3] = v232;
  v245[4] = @"TotalOperatingTime";
  uint64_t v5 = *MEMORY[0x1E4F92D18];
  v239[0] = v3;
  v239[1] = v5;
  v240[0] = &unk_1F400DFA8;
  v240[1] = @"hr";
  v231 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v240 forKeys:v239 count:2];
  v246[4] = v231;
  v245[5] = @"AverageTemperature";
  v230 = [MEMORY[0x1E4F929D8] sharedInstance];
  v229 = objc_msgSend(v230, "commonTypeDict_IntegerFormat");
  v246[5] = v229;
  v245[6] = @"CycleCount";
  v228 = [MEMORY[0x1E4F929D8] sharedInstance];
  v227 = objc_msgSend(v228, "commonTypeDict_IntegerFormat");
  v246[6] = v227;
  v245[7] = @"CycleCountLastQmax";
  v226 = [MEMORY[0x1E4F929D8] sharedInstance];
  v225 = objc_msgSend(v226, "commonTypeDict_IntegerFormat");
  v246[7] = v225;
  v245[8] = @"EEEECode";
  v224 = [MEMORY[0x1E4F929D8] sharedInstance];
  v223 = objc_msgSend(v224, "commonTypeDict_StringFormat");
  v246[8] = v223;
  v245[9] = @"FlashWriteCount";
  v222 = [MEMORY[0x1E4F929D8] sharedInstance];
  v221 = objc_msgSend(v222, "commonTypeDict_IntegerFormat");
  v246[9] = v221;
  v245[10] = @"HighAvgCurrentLastRun";
  v220 = [MEMORY[0x1E4F929D8] sharedInstance];
  v219 = objc_msgSend(v220, "commonTypeDict_IntegerFormat");
  v246[10] = v219;
  v245[11] = @"ITMiscStatus";
  v218 = [MEMORY[0x1E4F929D8] sharedInstance];
  v217 = objc_msgSend(v218, "commonTypeDict_IntegerFormat");
  v246[11] = v217;
  v245[12] = @"ITSimulationCounter";
  v216 = [MEMORY[0x1E4F929D8] sharedInstance];
  v215 = objc_msgSend(v216, "commonTypeDict_IntegerFormat");
  v246[12] = v215;
  v245[13] = @"LifetimeUPOCount";
  v214 = [MEMORY[0x1E4F929D8] sharedInstance];
  v213 = objc_msgSend(v214, "commonTypeDict_IntegerFormat");
  v246[13] = v213;
  v245[14] = @"LowAvgCurrentLastRun";
  v212 = [MEMORY[0x1E4F929D8] sharedInstance];
  v211 = objc_msgSend(v212, "commonTypeDict_IntegerFormat");
  v246[14] = v211;
  v245[15] = @"MaximumDeltaVoltage";
  v210 = [MEMORY[0x1E4F929D8] sharedInstance];
  v209 = objc_msgSend(v210, "commonTypeDict_IntegerFormat");
  v246[15] = v209;
  v245[16] = @"MinimumDeltaVoltage";
  v208 = [MEMORY[0x1E4F929D8] sharedInstance];
  v207 = objc_msgSend(v208, "commonTypeDict_IntegerFormat");
  v246[16] = v207;
  v245[17] = @"MaximumFCC";
  v206 = [MEMORY[0x1E4F929D8] sharedInstance];
  v205 = objc_msgSend(v206, "commonTypeDict_IntegerFormat");
  v246[17] = v205;
  v245[18] = @"MinimumFCC";
  v204 = [MEMORY[0x1E4F929D8] sharedInstance];
  v203 = objc_msgSend(v204, "commonTypeDict_IntegerFormat");
  v246[18] = v203;
  v245[19] = @"MaximumPackVoltage";
  v202 = [MEMORY[0x1E4F929D8] sharedInstance];
  v201 = objc_msgSend(v202, "commonTypeDict_IntegerFormat");
  v246[19] = v201;
  v245[20] = @"MinimumPackVoltage";
  v200 = [MEMORY[0x1E4F929D8] sharedInstance];
  v199 = objc_msgSend(v200, "commonTypeDict_IntegerFormat");
  v246[20] = v199;
  v245[21] = @"MaximumQmax";
  v198 = [MEMORY[0x1E4F929D8] sharedInstance];
  v197 = objc_msgSend(v198, "commonTypeDict_IntegerFormat");
  v246[21] = v197;
  v245[22] = @"MinimumQmax";
  v196 = [MEMORY[0x1E4F929D8] sharedInstance];
  v195 = objc_msgSend(v196, "commonTypeDict_IntegerFormat");
  v246[22] = v195;
  v245[23] = @"MaximumRa0-8";
  v194 = [MEMORY[0x1E4F929D8] sharedInstance];
  v193 = objc_msgSend(v194, "commonTypeDict_IntegerFormat");
  v246[23] = v193;
  v245[24] = @"MinimumRa0-8";
  v192 = [MEMORY[0x1E4F929D8] sharedInstance];
  v191 = objc_msgSend(v192, "commonTypeDict_IntegerFormat");
  v246[24] = v191;
  v245[25] = @"MaximumTemperature";
  v190 = [MEMORY[0x1E4F929D8] sharedInstance];
  v189 = objc_msgSend(v190, "commonTypeDict_IntegerFormat");
  v246[25] = v189;
  v245[26] = @"MinimumTemperature";
  v188 = [MEMORY[0x1E4F929D8] sharedInstance];
  v187 = objc_msgSend(v188, "commonTypeDict_IntegerFormat");
  v246[26] = v187;
  v245[27] = @"MaximumCapacityPercent";
  v186 = [MEMORY[0x1E4F929D8] sharedInstance];
  v185 = objc_msgSend(v186, "commonTypeDict_IntegerFormat");
  v246[27] = v185;
  v245[28] = @"MaximumChargeCurrent";
  v184 = [MEMORY[0x1E4F929D8] sharedInstance];
  v183 = objc_msgSend(v184, "commonTypeDict_IntegerFormat");
  v246[28] = v183;
  v245[29] = @"MaximumDischargeCurrent";
  v182 = [MEMORY[0x1E4F929D8] sharedInstance];
  v181 = objc_msgSend(v182, "commonTypeDict_IntegerFormat");
  v246[29] = v181;
  v245[30] = @"MaximumOverChargedCapacity";
  v180 = [MEMORY[0x1E4F929D8] sharedInstance];
  v179 = objc_msgSend(v180, "commonTypeDict_IntegerFormat");
  v246[30] = v179;
  v245[31] = @"MaximumOverDischargedCapacity";
  v178 = [MEMORY[0x1E4F929D8] sharedInstance];
  v177 = objc_msgSend(v178, "commonTypeDict_IntegerFormat");
  v246[31] = v177;
  v245[32] = @"OriginalBattery";
  v176 = [MEMORY[0x1E4F929D8] sharedInstance];
  v175 = objc_msgSend(v176, "commonTypeDict_BoolFormat");
  v246[32] = v175;
  v245[33] = @"RaTable_1";
  v174 = [MEMORY[0x1E4F929D8] sharedInstance];
  v173 = objc_msgSend(v174, "commonTypeDict_IntegerFormat");
  v246[33] = v173;
  v245[34] = @"RaTable_2";
  v172 = [MEMORY[0x1E4F929D8] sharedInstance];
  v171 = objc_msgSend(v172, "commonTypeDict_IntegerFormat");
  v246[34] = v171;
  v245[35] = @"RaTable_3";
  v170 = [MEMORY[0x1E4F929D8] sharedInstance];
  v169 = objc_msgSend(v170, "commonTypeDict_IntegerFormat");
  v246[35] = v169;
  v245[36] = @"RaTable_4";
  v168 = [MEMORY[0x1E4F929D8] sharedInstance];
  v167 = objc_msgSend(v168, "commonTypeDict_IntegerFormat");
  v246[36] = v167;
  v245[37] = @"RaTable_5";
  v166 = [MEMORY[0x1E4F929D8] sharedInstance];
  v165 = objc_msgSend(v166, "commonTypeDict_IntegerFormat");
  v246[37] = v165;
  v245[38] = @"RaTable_6";
  v164 = [MEMORY[0x1E4F929D8] sharedInstance];
  v163 = objc_msgSend(v164, "commonTypeDict_IntegerFormat");
  v246[38] = v163;
  v245[39] = @"RaTable_7";
  v162 = [MEMORY[0x1E4F929D8] sharedInstance];
  v161 = objc_msgSend(v162, "commonTypeDict_IntegerFormat");
  v246[39] = v161;
  v245[40] = @"RaTable_8";
  v160 = [MEMORY[0x1E4F929D8] sharedInstance];
  v159 = objc_msgSend(v160, "commonTypeDict_IntegerFormat");
  v246[40] = v159;
  v245[41] = @"RaTable_9";
  v158 = [MEMORY[0x1E4F929D8] sharedInstance];
  v157 = objc_msgSend(v158, "commonTypeDict_IntegerFormat");
  v246[41] = v157;
  v245[42] = @"RaTable_10";
  v156 = [MEMORY[0x1E4F929D8] sharedInstance];
  v155 = objc_msgSend(v156, "commonTypeDict_IntegerFormat");
  v246[42] = v155;
  v245[43] = @"RaTable_11";
  v154 = [MEMORY[0x1E4F929D8] sharedInstance];
  v153 = objc_msgSend(v154, "commonTypeDict_IntegerFormat");
  v246[43] = v153;
  v245[44] = @"RaTable_12";
  v152 = [MEMORY[0x1E4F929D8] sharedInstance];
  v151 = objc_msgSend(v152, "commonTypeDict_IntegerFormat");
  v246[44] = v151;
  v245[45] = @"RaTable_13";
  v150 = [MEMORY[0x1E4F929D8] sharedInstance];
  v149 = objc_msgSend(v150, "commonTypeDict_IntegerFormat");
  v246[45] = v149;
  v245[46] = @"RaTable_14";
  v148 = [MEMORY[0x1E4F929D8] sharedInstance];
  v147 = objc_msgSend(v148, "commonTypeDict_IntegerFormat");
  v246[46] = v147;
  v245[47] = @"RaTable_15";
  v146 = [MEMORY[0x1E4F929D8] sharedInstance];
  v145 = objc_msgSend(v146, "commonTypeDict_IntegerFormat");
  v246[47] = v145;
  v245[48] = @"RaUpdateCounter";
  v144 = [MEMORY[0x1E4F929D8] sharedInstance];
  v143 = objc_msgSend(v144, "commonTypeDict_IntegerFormat");
  v246[48] = v143;
  v245[49] = @"RDISCnt";
  v142 = [MEMORY[0x1E4F929D8] sharedInstance];
  v141 = objc_msgSend(v142, "commonTypeDict_IntegerFormat");
  v246[49] = v141;
  v245[50] = @"TemperatureSamples";
  v140 = [MEMORY[0x1E4F929D8] sharedInstance];
  v139 = objc_msgSend(v140, "commonTypeDict_IntegerFormat");
  v246[50] = v139;
  v245[51] = @"TimeAbove95Perc";
  v138 = [MEMORY[0x1E4F929D8] sharedInstance];
  v137 = objc_msgSend(v138, "commonTypeDict_IntegerFormat");
  v246[51] = v137;
  v245[52] = @"UpdateTime";
  v136 = [MEMORY[0x1E4F929D8] sharedInstance];
  v135 = objc_msgSend(v136, "commonTypeDict_IntegerFormat");
  v246[52] = v135;
  v245[53] = @"WeekMfd";
  v134 = [MEMORY[0x1E4F929D8] sharedInstance];
  v133 = objc_msgSend(v134, "commonTypeDict_IntegerFormat");
  v246[53] = v133;
  v245[54] = @"Wom_1";
  v132 = [MEMORY[0x1E4F929D8] sharedInstance];
  v131 = objc_msgSend(v132, "commonTypeDict_IntegerFormat");
  v246[54] = v131;
  v245[55] = @"Wom_2";
  v130 = [MEMORY[0x1E4F929D8] sharedInstance];
  v129 = objc_msgSend(v130, "commonTypeDict_IntegerFormat");
  v246[55] = v129;
  v245[56] = @"LastUPOTimestamp";
  v128 = [MEMORY[0x1E4F929D8] sharedInstance];
  v127 = objc_msgSend(v128, "commonTypeDict_IntegerFormat");
  v246[56] = v127;
  v245[57] = @"ChemicalWeightedRa";
  v126 = [MEMORY[0x1E4F929D8] sharedInstance];
  v125 = objc_msgSend(v126, "commonTypeDict_IntegerFormat");
  v246[57] = v125;
  v245[58] = @"WeightedRa";
  v124 = [MEMORY[0x1E4F929D8] sharedInstance];
  v123 = objc_msgSend(v124, "commonTypeDict_IntegerFormat");
  v246[58] = v123;
  v245[59] = @"DOFU";
  v122 = [MEMORY[0x1E4F929D8] sharedInstance];
  v121 = objc_msgSend(v122, "commonTypeDict_IntegerFormat");
  v246[59] = v121;
  v245[60] = @"BatteryHealthMetric";
  v120 = [MEMORY[0x1E4F929D8] sharedInstance];
  v119 = objc_msgSend(v120, "commonTypeDict_IntegerFormat");
  v246[60] = v119;
  v245[61] = @"PeakPerformanceCapacity";
  v118 = [MEMORY[0x1E4F929D8] sharedInstance];
  v117 = objc_msgSend(v118, "commonTypeDict_IntegerFormat");
  v246[61] = v117;
  v245[62] = @"ServiceOption";
  v116 = [MEMORY[0x1E4F929D8] sharedInstance];
  v115 = objc_msgSend(v116, "commonTypeDict_IntegerFormat");
  v246[62] = v115;
  v245[63] = @"QmaxUpdSuccessCount";
  v114 = [MEMORY[0x1E4F929D8] sharedInstance];
  v113 = objc_msgSend(v114, "commonTypeDict_IntegerFormat");
  v246[63] = v113;
  v245[64] = @"QmaxUpdFailCount";
  v112 = [MEMORY[0x1E4F929D8] sharedInstance];
  v111 = objc_msgSend(v112, "commonTypeDict_IntegerFormat");
  v246[64] = v111;
  v245[65] = @"MinimumRa8";
  v110 = [MEMORY[0x1E4F929D8] sharedInstance];
  v109 = objc_msgSend(v110, "commonTypeDict_IntegerFormat");
  v246[65] = v109;
  v245[66] = @"MaximumRa8";
  v108 = [MEMORY[0x1E4F929D8] sharedInstance];
  v107 = objc_msgSend(v108, "commonTypeDict_IntegerFormat");
  v246[66] = v107;
  v245[67] = @"TimeAbove95PercRange1";
  v106 = [MEMORY[0x1E4F929D8] sharedInstance];
  v105 = objc_msgSend(v106, "commonTypeDict_IntegerFormat");
  v246[67] = v105;
  v245[68] = @"TimeAbove95PercRange2";
  v104 = [MEMORY[0x1E4F929D8] sharedInstance];
  v103 = objc_msgSend(v104, "commonTypeDict_IntegerFormat");
  v246[68] = v103;
  v245[69] = @"TimeAbove95PercRange3";
  v102 = [MEMORY[0x1E4F929D8] sharedInstance];
  v101 = objc_msgSend(v102, "commonTypeDict_IntegerFormat");
  v246[69] = v101;
  v245[70] = @"ResetCnt";
  v100 = [MEMORY[0x1E4F929D8] sharedInstance];
  v99 = objc_msgSend(v100, "commonTypeDict_IntegerFormat");
  v246[70] = v99;
  v245[71] = @"DailyMaxSoc";
  v98 = [MEMORY[0x1E4F929D8] sharedInstance];
  v97 = objc_msgSend(v98, "commonTypeDict_IntegerFormat");
  v246[71] = v97;
  v245[72] = @"DailyMinSoc";
  v96 = [MEMORY[0x1E4F929D8] sharedInstance];
  v95 = objc_msgSend(v96, "commonTypeDict_IntegerFormat");
  v246[72] = v95;
  v245[73] = @"KioskModeHighSocDays";
  v94 = [MEMORY[0x1E4F929D8] sharedInstance];
  v93 = objc_msgSend(v94, "commonTypeDict_IntegerFormat");
  v246[73] = v93;
  v245[74] = @"KioskModeLastHighSocHours";
  v92 = [MEMORY[0x1E4F929D8] sharedInstance];
  v91 = objc_msgSend(v92, "commonTypeDict_IntegerFormat");
  v246[74] = v91;
  v245[75] = @"xFlags";
  v90 = [MEMORY[0x1E4F929D8] sharedInstance];
  v89 = objc_msgSend(v90, "commonTypeDict_IntegerFormat");
  v246[75] = v89;
  v245[76] = @"GasGaugeFirmwareVersion";
  v88 = [MEMORY[0x1E4F929D8] sharedInstance];
  v87 = objc_msgSend(v88, "commonTypeDict_IntegerFormat");
  v246[76] = v87;
  v245[77] = @"batteryServiceFlags";
  v86 = [MEMORY[0x1E4F929D8] sharedInstance];
  v85 = objc_msgSend(v86, "commonTypeDict_IntegerFormat");
  v246[77] = v85;
  v245[78] = @"BatterySerialChanged";
  v84 = [MEMORY[0x1E4F929D8] sharedInstance];
  v83 = objc_msgSend(v84, "commonTypeDict_IntegerFormat");
  v246[78] = v83;
  v245[79] = @"ResetDataComms";
  v82 = [MEMORY[0x1E4F929D8] sharedInstance];
  v81 = objc_msgSend(v82, "commonTypeDict_IntegerFormat");
  v246[79] = v81;
  v245[80] = @"ResetDataFirmware";
  v80 = [MEMORY[0x1E4F929D8] sharedInstance];
  v79 = objc_msgSend(v80, "commonTypeDict_IntegerFormat");
  v246[80] = v79;
  v245[81] = @"ResetDataHardware";
  v78 = [MEMORY[0x1E4F929D8] sharedInstance];
  v77 = objc_msgSend(v78, "commonTypeDict_IntegerFormat");
  v246[81] = v77;
  v245[82] = @"ResetDataSoftware";
  v76 = [MEMORY[0x1E4F929D8] sharedInstance];
  v75 = objc_msgSend(v76, "commonTypeDict_IntegerFormat");
  v246[82] = v75;
  v245[83] = @"ResetDataWatchDog";
  v74 = [MEMORY[0x1E4F929D8] sharedInstance];
  v73 = objc_msgSend(v74, "commonTypeDict_IntegerFormat");
  v246[83] = v73;
  v245[84] = @"ResetDataSwWatchDog";
  v72 = [MEMORY[0x1E4F929D8] sharedInstance];
  v71 = objc_msgSend(v72, "commonTypeDict_IntegerFormat");
  v246[84] = v71;
  v245[85] = @"ResetDataHardFault";
  v70 = [MEMORY[0x1E4F929D8] sharedInstance];
  v69 = objc_msgSend(v70, "commonTypeDict_IntegerFormat");
  v246[85] = v69;
  v245[86] = @"ResetDataCorruption";
  v68 = [MEMORY[0x1E4F929D8] sharedInstance];
  v67 = objc_msgSend(v68, "commonTypeDict_IntegerFormat");
  v246[86] = v67;
  v245[87] = @"AlgoChemID";
  v66 = [MEMORY[0x1E4F929D8] sharedInstance];
  v65 = objc_msgSend(v66, "commonTypeDict_IntegerFormat");
  v246[87] = v65;
  v245[88] = @"ServiceOption";
  v64 = [MEMORY[0x1E4F929D8] sharedInstance];
  v63 = objc_msgSend(v64, "commonTypeDict_IntegerFormat");
  v246[88] = v63;
  v245[89] = @"GGUpdateStatus";
  v62 = [MEMORY[0x1E4F929D8] sharedInstance];
  v61 = objc_msgSend(v62, "commonTypeDict_IntegerFormat");
  v246[89] = v61;
  v245[90] = @"GGUpdateError";
  v60 = [MEMORY[0x1E4F929D8] sharedInstance];
  v59 = objc_msgSend(v60, "commonTypeDict_IntegerFormat");
  v246[90] = v59;
  v245[91] = @"GGUpdatePhase";
  v58 = [MEMORY[0x1E4F929D8] sharedInstance];
  v57 = objc_msgSend(v58, "commonTypeDict_IntegerFormat");
  v246[91] = v57;
  v245[92] = @"GGUpdateErrorPhase";
  v56 = [MEMORY[0x1E4F929D8] sharedInstance];
  v55 = objc_msgSend(v56, "commonTypeDict_IntegerFormat");
  v246[92] = v55;
  v245[93] = @"GGUpdateSubclassID";
  v54 = [MEMORY[0x1E4F929D8] sharedInstance];
  v53 = objc_msgSend(v54, "commonTypeDict_IntegerFormat");
  v246[93] = v53;
  v245[94] = @"GGUpdateBlock";
  v52 = [MEMORY[0x1E4F929D8] sharedInstance];
  v51 = objc_msgSend(v52, "commonTypeDict_IntegerFormat");
  v246[94] = v51;
  v245[95] = @"NCCMin";
  v50 = [MEMORY[0x1E4F929D8] sharedInstance];
  v49 = objc_msgSend(v50, "commonTypeDict_IntegerFormat");
  v246[95] = v49;
  v245[96] = @"NCCMax";
  v48 = [MEMORY[0x1E4F929D8] sharedInstance];
  v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
  v246[96] = v47;
  v245[97] = @"TimeAtHighSoc";
  v46 = [MEMORY[0x1E4F929D8] sharedInstance];
  v45 = objc_msgSend(v46, "commonTypeDict_RawDataFormat");
  v246[97] = v45;
  v245[98] = @"LowVoltageResidencyCounters";
  v44 = [MEMORY[0x1E4F929D8] sharedInstance];
  v43 = objc_msgSend(v44, "commonTypeDict_RawDataFormat");
  v246[98] = v43;
  v245[99] = @"ncc";
  v42 = [MEMORY[0x1E4F929D8] sharedInstance];
  v41 = objc_msgSend(v42, "commonTypeDict_IntegerFormat");
  v246[99] = v41;
  v245[100] = @"nccAlt";
  v40 = [MEMORY[0x1E4F929D8] sharedInstance];
  v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat");
  v246[100] = v39;
  v245[101] = @"vact";
  v38 = [MEMORY[0x1E4F929D8] sharedInstance];
  v37 = objc_msgSend(v38, "commonTypeDict_BoolFormat");
  v246[101] = v37;
  v245[102] = @"DataFlashWriteCount";
  v36 = [MEMORY[0x1E4F929D8] sharedInstance];
  v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
  v246[102] = v35;
  v245[103] = @"calibrationFlags";
  v34 = [MEMORY[0x1E4F929D8] sharedInstance];
  v33 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
  v246[103] = v33;
  v245[104] = @"filteredNCC";
  uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
  v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
  v246[104] = v31;
  v245[105] = @"exitTotalOperatingTime";
  v30 = [MEMORY[0x1E4F929D8] sharedInstance];
  v29 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
  v246[105] = v29;
  v245[106] = @"svcTotalOperatingTime";
  v28 = [MEMORY[0x1E4F929D8] sharedInstance];
  v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
  v246[106] = v27;
  v245[107] = @"LastResetReason";
  v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v246[107] = v25;
  v245[108] = @"LifeTimeOCVRestCounter";
  v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v246[108] = v23;
  v245[109] = @"LifeTimeQmaxUpdateCounter";
  v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v246[109] = v21;
  v245[110] = @"LifeTimeOCVRestCounterHsp";
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v246[110] = v19;
  v245[111] = @"LifeTimeQmaxUpdateCounterHsp";
  v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v246[111] = v17;
  v245[112] = @"VacVoltageLimit";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v246[112] = v7;
  v245[113] = @"FlashWearLevelData";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_RawDataFormat");
  v246[113] = v9;
  v245[114] = @"CommunicationError";
  v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
  v246[114] = v11;
  v245[115] = @"CoProcError";
  v12 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v12, "commonTypeDict_IntegerFormat");
  v246[115] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v246 forKeys:v245 count:116];
  v250[1] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v250 forKeys:v249 count:2];

  return v15;
}

+ (id)entryEventNoneDefinitionUserType
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CE8];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F40123A8;
  v12[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"UserType";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventPointDefinitions
{
  v21[15] = *MEMORY[0x1E4F143B8];
  v20[0] = @"BatteryShutdown";
  v19 = [a1 entryEventPointDefinitionBatteryShutdown];
  v21[0] = v19;
  v20[1] = @"BatteryPanicShutdown";
  v18 = [a1 entryEventPointDefinitionBatteryPanicShutdown];
  v21[1] = v18;
  v20[2] = @"TrapInfo";
  v17 = [a1 entryEventPointDefinitionBatteryTrapInfo];
  v21[2] = v17;
  v20[3] = @"ChargingInfo";
  v16 = [a1 entryEventPointDefinitionChargingInfo];
  v21[3] = v16;
  v20[4] = @"EABatteryConfig";
  v15 = [a1 entryEventPointDefinitionEABatteryConfig];
  v21[4] = v15;
  v20[5] = @"EAPencilConnect";
  v14 = +[PLBatteryAgent entryEventPointDefinitionEAPencil];
  v21[5] = v14;
  v20[6] = @"BatteryUILogging";
  uint64_t v3 = [a1 entryEventPointDefinitionBatteryUILogging];
  v21[6] = v3;
  v20[7] = @"BatteryUIVisit";
  uint64_t v4 = [a1 entryEventPointDefinitionBatteryUIVisit];
  v21[7] = v4;
  v20[8] = @"PPMDebug";
  uint64_t v5 = [a1 entryEventPointDefinitionPPMDebug];
  v21[8] = v5;
  v20[9] = @"PPMClientMetrics";
  v6 = [a1 entryEventPointDefinitionPPMClientMetrics];
  v21[9] = v6;
  v20[10] = @"UPOStepper";
  v7 = [a1 entryEventPointDefinitionUPOStepper];
  v21[10] = v7;
  v20[11] = @"BatterySample";
  v8 = [a1 entryEventPointDefinitionBatterySample];
  v21[11] = v8;
  v20[12] = @"CPMSControlState";
  v9 = [a1 entryEventPointDefinitionCPMSControlState];
  v21[12] = v9;
  v20[13] = @"CPMSClientState";
  v10 = [a1 entryEventPointDefinitionCPMSClientState];
  v21[13] = v10;
  v20[14] = @"GasGaugeReconnect";
  v11 = [a1 entryEventPointDefinitionGasGaugeReconnect];
  v21[14] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:15];

  return v12;
}

+ (BOOL)shouldLogCPMS
{
  if (shouldLogCPMS_onceToken != -1) {
    dispatch_once(&shouldLogCPMS_onceToken, &__block_literal_global_1847);
  }
  return shouldLogCPMS___cpmsEnabled;
}

uint64_t __31__PLBatteryAgent_shouldLogCPMS__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F56678] isCPMSSupported];
  shouldLogCPMS___cpmsEnabled = result;
  return result;
}

+ (id)entryEventPointDefinitionCPMSControlState
{
  v82[2] = *MEMORY[0x1E4F143B8];
  if (+[PLBatteryAgent shouldLogCPMS])
  {
    v81[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92C40];
    v79[0] = *MEMORY[0x1E4F92CD0];
    v79[1] = v2;
    v80[0] = &unk_1F40123B8;
    v80[1] = MEMORY[0x1E4F1CC38];
    v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:2];
    v82[0] = v76;
    v81[1] = *MEMORY[0x1E4F92CA8];
    v77[0] = @"mode";
    v75 = [MEMORY[0x1E4F929D8] sharedInstance];
    v74 = objc_msgSend(v75, "commonTypeDict_IntegerFormat");
    v78[0] = v74;
    v77[1] = @"source";
    v73 = [MEMORY[0x1E4F929D8] sharedInstance];
    v72 = objc_msgSend(v73, "commonTypeDict_IntegerFormat");
    v78[1] = v72;
    v77[2] = @"flags";
    v71 = [MEMORY[0x1E4F929D8] sharedInstance];
    v70 = objc_msgSend(v71, "commonTypeDict_IntegerFormat");
    v78[2] = v70;
    v77[3] = @"reason";
    v69 = [MEMORY[0x1E4F929D8] sharedInstance];
    v68 = objc_msgSend(v69, "commonTypeDict_IntegerFormat");
    v78[3] = v68;
    v77[4] = @"droopCE";
    v67 = [MEMORY[0x1E4F929D8] sharedInstance];
    v66 = objc_msgSend(v67, "commonTypeDict_IntegerFormat");
    v78[4] = v66;
    v77[5] = @"zeroSumCE";
    v65 = [MEMORY[0x1E4F929D8] sharedInstance];
    v64 = objc_msgSend(v65, "commonTypeDict_IntegerFormat");
    v78[5] = v64;
    v77[6] = @"undroopCE";
    v63 = [MEMORY[0x1E4F929D8] sharedInstance];
    v62 = objc_msgSend(v63, "commonTypeDict_IntegerFormat");
    v78[6] = v62;
    v77[7] = @"brownoutRiskEngaged";
    v61 = [MEMORY[0x1E4F929D8] sharedInstance];
    v60 = objc_msgSend(v61, "commonTypeDict_BoolFormat");
    v78[7] = v60;
    v77[8] = @"brownoutRiskSysCap";
    v59 = [MEMORY[0x1E4F929D8] sharedInstance];
    v58 = objc_msgSend(v59, "commonTypeDict_IntegerFormat");
    v78[8] = v58;
    v77[9] = @"brownoutRiskPu";
    v57 = [MEMORY[0x1E4F929D8] sharedInstance];
    v56 = objc_msgSend(v57, "commonTypeDict_IntegerFormat");
    v78[9] = v56;
    v77[10] = @"peakPowerPressureLevel";
    v55 = [MEMORY[0x1E4F929D8] sharedInstance];
    v54 = objc_msgSend(v55, "commonTypeDict_IntegerFormat");
    v78[10] = v54;
    v77[11] = @"servoCE0";
    v53 = [MEMORY[0x1E4F929D8] sharedInstance];
    v52 = objc_msgSend(v53, "commonTypeDict_IntegerFormat");
    v78[11] = v52;
    v77[12] = @"servoCE1";
    v51 = [MEMORY[0x1E4F929D8] sharedInstance];
    v50 = objc_msgSend(v51, "commonTypeDict_IntegerFormat");
    v78[12] = v50;
    v77[13] = @"servoCE2";
    v49 = [MEMORY[0x1E4F929D8] sharedInstance];
    v48 = objc_msgSend(v49, "commonTypeDict_IntegerFormat");
    v78[13] = v48;
    v77[14] = @"servoCE3";
    v47 = [MEMORY[0x1E4F929D8] sharedInstance];
    v46 = objc_msgSend(v47, "commonTypeDict_IntegerFormat");
    v78[14] = v46;
    v77[15] = @"servoCE4";
    v45 = [MEMORY[0x1E4F929D8] sharedInstance];
    v44 = objc_msgSend(v45, "commonTypeDict_IntegerFormat");
    v78[15] = v44;
    v77[16] = @"servoCE5";
    v43 = [MEMORY[0x1E4F929D8] sharedInstance];
    v42 = objc_msgSend(v43, "commonTypeDict_IntegerFormat");
    v78[16] = v42;
    v77[17] = @"servoCE6";
    v41 = [MEMORY[0x1E4F929D8] sharedInstance];
    v40 = objc_msgSend(v41, "commonTypeDict_IntegerFormat");
    v78[17] = v40;
    v77[18] = @"battPC0";
    v39 = [MEMORY[0x1E4F929D8] sharedInstance];
    v38 = objc_msgSend(v39, "commonTypeDict_IntegerFormat");
    v78[18] = v38;
    v77[19] = @"battPC1";
    v37 = [MEMORY[0x1E4F929D8] sharedInstance];
    v36 = objc_msgSend(v37, "commonTypeDict_IntegerFormat");
    v78[19] = v36;
    v77[20] = @"battPC2";
    v35 = [MEMORY[0x1E4F929D8] sharedInstance];
    v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat");
    v78[20] = v34;
    v77[21] = @"battPC3";
    v33 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
    v78[21] = v32;
    v77[22] = @"battPC4";
    v31 = [MEMORY[0x1E4F929D8] sharedInstance];
    v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
    v78[22] = v30;
    v77[23] = @"battPC5";
    v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
    v78[23] = v28;
    v77[24] = @"battPC6";
    v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
    v78[24] = v26;
    v77[25] = @"battPC7";
    v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
    v78[25] = v24;
    v77[26] = @"sysCap0";
    v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v78[26] = v22;
    v77[27] = @"sysCap1";
    v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
    v78[27] = v20;
    v77[28] = @"sysCap2";
    v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v78[28] = v18;
    v77[29] = @"remCapCE0";
    v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v78[29] = v16;
    v77[30] = @"remCapCE1";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v78[30] = v14;
    v77[31] = @"remCapCE2";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v78[31] = v4;
    v77[32] = @"remCapCE3";
    uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v78[32] = v6;
    v77[33] = @"remCapCE4";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v78[33] = v8;
    v77[34] = @"remCapCE5";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v78[34] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:35];
    v82[1] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:2];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventPointDefinitionCPMSClientState
{
  v26[2] = *MEMORY[0x1E4F143B8];
  if (+[PLBatteryAgent shouldLogCPMS])
  {
    v25[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92C40];
    v23[0] = *MEMORY[0x1E4F92CD0];
    v23[1] = v2;
    v24[0] = &unk_1F40123A8;
    v24[1] = MEMORY[0x1E4F1CC38];
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
    v26[0] = v20;
    v25[1] = *MEMORY[0x1E4F92CA8];
    v21[0] = @"client";
    v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v22[0] = v18;
    v21[1] = @"req0";
    v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v22[1] = v16;
    v21[2] = @"req1";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v22[2] = v14;
    v21[3] = @"req2";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v22[3] = v4;
    v21[4] = @"grant0";
    uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v22[4] = v6;
    v21[5] = @"grant1";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v22[5] = v8;
    v21[6] = @"grant2";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v22[6] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:7];
    v26[1] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (BOOL)shouldLogPPMDebugDetail
{
  if (shouldLogPPMDebugDetail_onceToken != -1) {
    dispatch_once(&shouldLogPPMDebugDetail_onceToken, &__block_literal_global_1852);
  }
  return shouldLogPPMDebugDetail_result;
}

uint64_t __41__PLBatteryAgent_shouldLogPPMDebugDetail__block_invoke()
{
  if ([MEMORY[0x1E4F929C0] taskMode]) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = [MEMORY[0x1E4F929C0] fullMode];
  }
  shouldLogPPMDebugDetail_uint64_t result = result;
  return result;
}

+ (id)entryEventForwardDefinitionIOPMUBootLPMLog
{
  v35[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] hasLPEM])
  {
    v34[0] = *MEMORY[0x1E4F92C50];
    uint64_t v32 = *MEMORY[0x1E4F92CD0];
    v33 = &unk_1F40123C8;
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    v35[0] = v29;
    v34[1] = *MEMORY[0x1E4F92CA8];
    v30[0] = @"TMS0";
    v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v31[0] = v27;
    v30[1] = @"CAPA";
    v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
    v31[1] = v25;
    v30[2] = @"CCCs";
    v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v31[2] = v23;
    v30[3] = @"PDD0";
    v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v31[3] = v21;
    v30[4] = @"PDDc";
    v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v31[4] = v19;
    v30[5] = @"GGTm";
    v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    v31[5] = v17;
    v30[6] = @"VOLT";
    v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v31[6] = v15;
    v30[7] = @"STAT";
    v14 = [MEMORY[0x1E4F929D8] sharedInstance];
    v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
    v31[7] = v13;
    v30[8] = @"TMSc";
    uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
    v31[8] = v3;
    v30[9] = @"CCCu";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v31[9] = v5;
    v30[10] = @"CurrentTimeRTC";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_RealFormat");
    v31[10] = v7;
    void v30[11] = @"BTLC";
    v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    void v31[11] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:12];
    v35[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventForwardDefinitionMobileChargeMode
{
  v21[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiPhone])
  {
    v20[0] = *MEMORY[0x1E4F92C50];
    uint64_t v18 = *MEMORY[0x1E4F92CD0];
    v19 = &unk_1F40123A8;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v21[0] = v15;
    v20[1] = *MEMORY[0x1E4F92CA8];
    v16[0] = @"mcmCurrentState";
    v14 = [MEMORY[0x1E4F929D8] sharedInstance];
    v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
    v17[0] = v13;
    v16[1] = @"isChargePackConnected";
    uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
    v17[1] = v3;
    v16[2] = @"mcmToppedOffInThisChargeSession";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    void v17[2] = v5;
    void v16[3] = @"mcmForbidsCharging";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v17[3] = v7;
    v16[4] = @"batteryLevel";
    v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v17[4] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
    v21[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventPointDefinitionPPMDebug
{
  v63[2] = *MEMORY[0x1E4F143B8];
  v62[0] = *MEMORY[0x1E4F92C50];
  uint64_t v60 = *MEMORY[0x1E4F92CD0];
  v61 = &unk_1F4012368;
  v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
  v63[0] = v57;
  v62[1] = *MEMORY[0x1E4F92CA8];
  v58[0] = @"TStamp";
  v56 = [MEMORY[0x1E4F929D8] sharedInstance];
  v55 = objc_msgSend(v56, "commonTypeDict_DateFormat");
  v59[0] = v55;
  v58[1] = @"BaselineSysCap";
  v54 = [MEMORY[0x1E4F929D8] sharedInstance];
  v53 = objc_msgSend(v54, "commonTypeDict_IntegerFormat");
  v59[1] = v53;
  v58[2] = @"ModeledSysCap";
  v52 = [MEMORY[0x1E4F929D8] sharedInstance];
  v51 = objc_msgSend(v52, "commonTypeDict_IntegerFormat");
  v59[2] = v51;
  v58[3] = @"NetSysCap";
  v50 = [MEMORY[0x1E4F929D8] sharedInstance];
  v49 = objc_msgSend(v50, "commonTypeDict_IntegerFormat");
  v59[3] = v49;
  v58[4] = @"OverrideSysCap";
  v48 = [MEMORY[0x1E4F929D8] sharedInstance];
  v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
  v59[4] = v47;
  v58[5] = @"ProactiveSysCap";
  v46 = [MEMORY[0x1E4F929D8] sharedInstance];
  v45 = objc_msgSend(v46, "commonTypeDict_IntegerFormat");
  v59[5] = v45;
  v58[6] = @"TotalDemandAdj";
  v44 = [MEMORY[0x1E4F929D8] sharedInstance];
  v43 = objc_msgSend(v44, "commonTypeDict_IntegerFormat");
  v59[6] = v43;
  v58[7] = @"TotalDemandRaw";
  v42 = [MEMORY[0x1E4F929D8] sharedInstance];
  v41 = objc_msgSend(v42, "commonTypeDict_IntegerFormat");
  v59[7] = v41;
  v58[8] = @"baselineR0";
  v40 = [MEMORY[0x1E4F929D8] sharedInstance];
  v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat");
  v59[8] = v39;
  v58[9] = @"baselineR1";
  v38 = [MEMORY[0x1E4F929D8] sharedInstance];
  v37 = objc_msgSend(v38, "commonTypeDict_IntegerFormat");
  v59[9] = v37;
  v58[10] = @"baselineR2";
  v36 = [MEMORY[0x1E4F929D8] sharedInstance];
  v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
  v59[10] = v35;
  v58[11] = @"baselineR3";
  v34 = [MEMORY[0x1E4F929D8] sharedInstance];
  v33 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
  v59[11] = v33;
  v58[12] = @"avgRdcRatio";
  uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
  v31 = objc_msgSend(v32, "commonTypeDict_RealFormat");
  v59[12] = v31;
  v58[13] = @"R0";
  v30 = [MEMORY[0x1E4F929D8] sharedInstance];
  v29 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
  v59[13] = v29;
  v58[14] = @"R1";
  v28 = [MEMORY[0x1E4F929D8] sharedInstance];
  v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
  v59[14] = v27;
  v58[15] = @"R2";
  v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v59[15] = v25;
  v58[16] = @"R3";
  v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v59[16] = v23;
  v58[17] = @"Iss";
  v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v59[17] = v21;
  v58[18] = @"outputFlag";
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v59[18] = v19;
  v58[19] = @"Ps";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v59[19] = v17;
  v58[20] = @"Pb";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v59[20] = v15;
  v58[21] = @"Pp";
  v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v59[21] = v13;
  v58[22] = @"mPb";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v59[22] = v3;
  v58[23] = @"mPp";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v59[23] = v5;
  v58[24] = @"Vgg";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v59[24] = v7;
  v58[25] = @"DroopCtrlEff";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v59[25] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:26];
  v63[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:2];

  return v11;
}

+ (id)entryEventPointDefinitionPPMClientMetrics
{
  void v25[2] = *MEMORY[0x1E4F143B8];
  v24[0] = *MEMORY[0x1E4F92C50];
  uint64_t v22 = *MEMORY[0x1E4F92CD0];
  v23 = &unk_1F4012368;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  v25[0] = v19;
  v24[1] = *MEMORY[0x1E4F92CA8];
  v20[0] = @"TStamp";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_DateFormat");
  v21[0] = v17;
  v20[1] = @"Client";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v21[1] = v15;
  void v20[2] = @"Idx";
  v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v21[2] = v13;
  v20[3] = @"Bdg";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v21[3] = v3;
  v20[4] = @"Car";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  void v21[4] = v5;
  v20[5] = @"Pwr";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v21[5] = v7;
  v20[6] = @"reqBdg";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v21[6] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:7];
  v25[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];

  return v11;
}

+ (id)entryEventPointDefinitionGasGaugeReconnect
{
  v14[2] = *MEMORY[0x1E4F143B8];
  if (+[PLUtilities hasGasGauge])
  {
    v13[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CE8];
    v11[0] = *MEMORY[0x1E4F92CD0];
    v11[1] = v2;
    v12[0] = &unk_1F40123A8;
    v12[1] = MEMORY[0x1E4F1CC38];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    v14[0] = v3;
    v13[1] = *MEMORY[0x1E4F92CA8];
    v9 = @"Reason";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
    v10 = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    v14[1] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v7;
}

+ (id)entryEventPointDefinitionEAPencil
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiPad])
  {
    v12[0] = *MEMORY[0x1E4F92C50];
    uint64_t v10 = *MEMORY[0x1E4F92CD0];
    v11 = &unk_1F40123A8;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    v13[0] = v2;
    v12[1] = *MEMORY[0x1E4F92CA8];
    v8 = @"isPhysicallyAttached";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
    v9 = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    v13[1] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v6;
}

+ (id)entryEventPointDefinitionBatteryShutdown
{
  v160[2] = *MEMORY[0x1E4F143B8];
  v159[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CF8];
  v157[0] = *MEMORY[0x1E4F92CD0];
  v157[1] = v2;
  v158[0] = &unk_1F40123D8;
  v158[1] = &unk_1F400DF90;
  v157[2] = *MEMORY[0x1E4F92CF0];
  v158[2] = &unk_1F4012398;
  v154 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v158 forKeys:v157 count:3];
  v160[0] = v154;
  v159[1] = *MEMORY[0x1E4F92CA8];
  v155[0] = @"BatteryShutdownTimestamp";
  v153 = [MEMORY[0x1E4F929D8] sharedInstance];
  v152 = objc_msgSend(v153, "commonTypeDict_DateFormat");
  v156[0] = v152;
  v155[1] = @"UISOC";
  v151 = [MEMORY[0x1E4F929D8] sharedInstance];
  v150 = objc_msgSend(v151, "commonTypeDict_RealFormat");
  v156[1] = v150;
  v155[2] = @"Temperature";
  v149 = [MEMORY[0x1E4F929D8] sharedInstance];
  v148 = objc_msgSend(v149, "commonTypeDict_IntegerFormat");
  v156[2] = v148;
  v155[3] = @"PresentDOD";
  v147 = [MEMORY[0x1E4F929D8] sharedInstance];
  v146 = objc_msgSend(v147, "commonTypeDict_IntegerFormat");
  v156[3] = v146;
  v155[4] = @"MaximumRa0-8";
  v145 = [MEMORY[0x1E4F929D8] sharedInstance];
  v144 = objc_msgSend(v145, "commonTypeDict_IntegerFormat");
  v156[4] = v144;
  v155[5] = @"NominalChargeCapacity";
  v143 = [MEMORY[0x1E4F929D8] sharedInstance];
  v142 = objc_msgSend(v143, "commonTypeDict_IntegerFormat");
  v156[5] = v142;
  v155[6] = @"NominalChargeCapacityPrevious";
  v141 = [MEMORY[0x1E4F929D8] sharedInstance];
  v140 = objc_msgSend(v141, "commonTypeDict_IntegerFormat");
  v156[6] = v140;
  v155[7] = @"FullChargeCapacity";
  v139 = [MEMORY[0x1E4F929D8] sharedInstance];
  v138 = objc_msgSend(v139, "commonTypeDict_IntegerFormat");
  v156[7] = v138;
  v155[8] = @"FullChargeCapacityPrevious";
  v137 = [MEMORY[0x1E4F929D8] sharedInstance];
  v136 = objc_msgSend(v137, "commonTypeDict_IntegerFormat");
  v156[8] = v136;
  v155[9] = @"RemainingCapacity";
  v135 = [MEMORY[0x1E4F929D8] sharedInstance];
  v134 = objc_msgSend(v135, "commonTypeDict_IntegerFormat");
  v156[9] = v134;
  v155[10] = @"RemainingCapacityPrevious";
  v133 = [MEMORY[0x1E4F929D8] sharedInstance];
  v132 = objc_msgSend(v133, "commonTypeDict_IntegerFormat");
  v156[10] = v132;
  v155[11] = @"CycleCount";
  v131 = [MEMORY[0x1E4F929D8] sharedInstance];
  v130 = objc_msgSend(v131, "commonTypeDict_IntegerFormat");
  v156[11] = v130;
  v155[12] = @"MaximumDischargeCurrent";
  v129 = [MEMORY[0x1E4F929D8] sharedInstance];
  v128 = objc_msgSend(v129, "commonTypeDict_IntegerFormat");
  v156[12] = v128;
  v155[13] = @"TimeAbove95Perc";
  v127 = [MEMORY[0x1E4F929D8] sharedInstance];
  v126 = objc_msgSend(v127, "commonTypeDict_IntegerFormat");
  v156[13] = v126;
  v155[14] = @"Voltage";
  v125 = [MEMORY[0x1E4F929D8] sharedInstance];
  v124 = objc_msgSend(v125, "commonTypeDict_IntegerFormat");
  v156[14] = v124;
  v155[15] = @"VoltagePrevious";
  v123 = [MEMORY[0x1E4F929D8] sharedInstance];
  v122 = objc_msgSend(v123, "commonTypeDict_IntegerFormat");
  v156[15] = v122;
  v155[16] = @"AverageCurrent";
  v121 = [MEMORY[0x1E4F929D8] sharedInstance];
  v120 = objc_msgSend(v121, "commonTypeDict_IntegerFormat");
  v156[16] = v120;
  v155[17] = @"AverageCurrentPrevious";
  v119 = [MEMORY[0x1E4F929D8] sharedInstance];
  v118 = objc_msgSend(v119, "commonTypeDict_IntegerFormat");
  v156[17] = v118;
  v155[18] = @"CycleCountLastQmax";
  v117 = [MEMORY[0x1E4F929D8] sharedInstance];
  v116 = objc_msgSend(v117, "commonTypeDict_IntegerFormat");
  v156[18] = v116;
  v155[19] = @"ResScale";
  v115 = [MEMORY[0x1E4F929D8] sharedInstance];
  v114 = objc_msgSend(v115, "commonTypeDict_IntegerFormat");
  v156[19] = v114;
  v155[20] = @"Qstart";
  v113 = [MEMORY[0x1E4F929D8] sharedInstance];
  v112 = objc_msgSend(v113, "commonTypeDict_IntegerFormat");
  v156[20] = v112;
  v155[21] = @"PassedCharge";
  v111 = [MEMORY[0x1E4F929D8] sharedInstance];
  v110 = objc_msgSend(v111, "commonTypeDict_IntegerFormat");
  v156[21] = v110;
  v155[22] = @"TimeSinceWake";
  v109 = [MEMORY[0x1E4F929D8] sharedInstance];
  v108 = objc_msgSend(v109, "commonTypeDict_IntegerFormat");
  v156[22] = v108;
  v155[23] = @"DOD0";
  v107 = [MEMORY[0x1E4F929D8] sharedInstance];
  v106 = objc_msgSend(v107, "commonTypeDict_IntegerFormat");
  v156[23] = v106;
  v155[24] = @"DLOG_0";
  v105 = [MEMORY[0x1E4F929D8] sharedInstance];
  v104 = objc_msgSend(v105, "commonTypeDict_IntegerFormat");
  v156[24] = v104;
  v155[25] = @"DLOG_1";
  v103 = [MEMORY[0x1E4F929D8] sharedInstance];
  v102 = objc_msgSend(v103, "commonTypeDict_IntegerFormat");
  v156[25] = v102;
  v155[26] = @"DLOG_2";
  v101 = [MEMORY[0x1E4F929D8] sharedInstance];
  v100 = objc_msgSend(v101, "commonTypeDict_IntegerFormat");
  v156[26] = v100;
  v155[27] = @"DLOG_3";
  v99 = [MEMORY[0x1E4F929D8] sharedInstance];
  v98 = objc_msgSend(v99, "commonTypeDict_IntegerFormat");
  v156[27] = v98;
  v155[28] = @"DLOG_4";
  v97 = [MEMORY[0x1E4F929D8] sharedInstance];
  v96 = objc_msgSend(v97, "commonTypeDict_IntegerFormat");
  v156[28] = v96;
  v155[29] = @"DLOG_5";
  v95 = [MEMORY[0x1E4F929D8] sharedInstance];
  v94 = objc_msgSend(v95, "commonTypeDict_IntegerFormat");
  v156[29] = v94;
  v155[30] = @"DLOG_6";
  v93 = [MEMORY[0x1E4F929D8] sharedInstance];
  v92 = objc_msgSend(v93, "commonTypeDict_IntegerFormat");
  v156[30] = v92;
  v155[31] = @"DLOG_7";
  v91 = [MEMORY[0x1E4F929D8] sharedInstance];
  v90 = objc_msgSend(v91, "commonTypeDict_IntegerFormat");
  v156[31] = v90;
  v155[32] = @"DLOG_8";
  v89 = [MEMORY[0x1E4F929D8] sharedInstance];
  v88 = objc_msgSend(v89, "commonTypeDict_IntegerFormat");
  v156[32] = v88;
  v155[33] = @"DLOG_9";
  v87 = [MEMORY[0x1E4F929D8] sharedInstance];
  v86 = objc_msgSend(v87, "commonTypeDict_IntegerFormat");
  v156[33] = v86;
  v155[34] = @"DLOG_10";
  v85 = [MEMORY[0x1E4F929D8] sharedInstance];
  v84 = objc_msgSend(v85, "commonTypeDict_IntegerFormat");
  v156[34] = v84;
  v155[35] = @"DLOG_11";
  v83 = [MEMORY[0x1E4F929D8] sharedInstance];
  v82 = objc_msgSend(v83, "commonTypeDict_IntegerFormat");
  v156[35] = v82;
  v155[36] = @"DLOG_12";
  v81 = [MEMORY[0x1E4F929D8] sharedInstance];
  v80 = objc_msgSend(v81, "commonTypeDict_IntegerFormat");
  v156[36] = v80;
  v155[37] = @"DLOG_13";
  v79 = [MEMORY[0x1E4F929D8] sharedInstance];
  v78 = objc_msgSend(v79, "commonTypeDict_IntegerFormat");
  v156[37] = v78;
  v155[38] = @"DLOG_14";
  v77 = [MEMORY[0x1E4F929D8] sharedInstance];
  v76 = objc_msgSend(v77, "commonTypeDict_IntegerFormat");
  v156[38] = v76;
  v155[39] = @"DLOG_15";
  v75 = [MEMORY[0x1E4F929D8] sharedInstance];
  v74 = objc_msgSend(v75, "commonTypeDict_IntegerFormat");
  v156[39] = v74;
  v155[40] = @"DLOG_16";
  v73 = [MEMORY[0x1E4F929D8] sharedInstance];
  v72 = objc_msgSend(v73, "commonTypeDict_IntegerFormat");
  v156[40] = v72;
  v155[41] = @"DLOG_17";
  v71 = [MEMORY[0x1E4F929D8] sharedInstance];
  v70 = objc_msgSend(v71, "commonTypeDict_IntegerFormat");
  v156[41] = v70;
  v155[42] = @"DLOG_18";
  v69 = [MEMORY[0x1E4F929D8] sharedInstance];
  v68 = objc_msgSend(v69, "commonTypeDict_IntegerFormat");
  v156[42] = v68;
  v155[43] = @"DLOG_19";
  v67 = [MEMORY[0x1E4F929D8] sharedInstance];
  v66 = objc_msgSend(v67, "commonTypeDict_IntegerFormat");
  v156[43] = v66;
  v155[44] = @"RaTable_1";
  v65 = [MEMORY[0x1E4F929D8] sharedInstance];
  v64 = objc_msgSend(v65, "commonTypeDict_IntegerFormat");
  v156[44] = v64;
  v155[45] = @"RaTable_2";
  v63 = [MEMORY[0x1E4F929D8] sharedInstance];
  v62 = objc_msgSend(v63, "commonTypeDict_IntegerFormat");
  v156[45] = v62;
  v155[46] = @"RaTable_3";
  v61 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v60 = objc_msgSend(v61, "commonTypeDict_IntegerFormat");
  v156[46] = v60;
  v155[47] = @"RaTable_4";
  v59 = [MEMORY[0x1E4F929D8] sharedInstance];
  v58 = objc_msgSend(v59, "commonTypeDict_IntegerFormat");
  v156[47] = v58;
  v155[48] = @"RaTable_5";
  v57 = [MEMORY[0x1E4F929D8] sharedInstance];
  v56 = objc_msgSend(v57, "commonTypeDict_IntegerFormat");
  v156[48] = v56;
  v155[49] = @"RaTable_6";
  v55 = [MEMORY[0x1E4F929D8] sharedInstance];
  v54 = objc_msgSend(v55, "commonTypeDict_IntegerFormat");
  v156[49] = v54;
  v155[50] = @"RaTable_7";
  v53 = [MEMORY[0x1E4F929D8] sharedInstance];
  v52 = objc_msgSend(v53, "commonTypeDict_IntegerFormat");
  v156[50] = v52;
  v155[51] = @"RaTable_8";
  v51 = [MEMORY[0x1E4F929D8] sharedInstance];
  v50 = objc_msgSend(v51, "commonTypeDict_IntegerFormat");
  v156[51] = v50;
  v155[52] = @"RaTable_9";
  v49 = [MEMORY[0x1E4F929D8] sharedInstance];
  v48 = objc_msgSend(v49, "commonTypeDict_IntegerFormat");
  v156[52] = v48;
  v155[53] = @"RaTable_10";
  v47 = [MEMORY[0x1E4F929D8] sharedInstance];
  v46 = objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v156[53] = v46;
  v155[54] = @"RaTable_11";
  v45 = [MEMORY[0x1E4F929D8] sharedInstance];
  v44 = objc_msgSend(v45, "commonTypeDict_IntegerFormat");
  v156[54] = v44;
  v155[55] = @"RaTable_12";
  v43 = [MEMORY[0x1E4F929D8] sharedInstance];
  v42 = objc_msgSend(v43, "commonTypeDict_IntegerFormat");
  v156[55] = v42;
  v155[56] = @"RaTable_13";
  v41 = [MEMORY[0x1E4F929D8] sharedInstance];
  v40 = objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v156[56] = v40;
  v155[57] = @"RaTable_14";
  v39 = [MEMORY[0x1E4F929D8] sharedInstance];
  v38 = objc_msgSend(v39, "commonTypeDict_IntegerFormat");
  v156[57] = v38;
  v155[58] = @"RaTable_15";
  v37 = [MEMORY[0x1E4F929D8] sharedInstance];
  v36 = objc_msgSend(v37, "commonTypeDict_IntegerFormat");
  v156[58] = v36;
  v155[59] = @"RSS";
  v35 = [MEMORY[0x1E4F929D8] sharedInstance];
  v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v156[59] = v34;
  v155[60] = @"LowBatteryLog";
  v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v32 = objc_msgSend(v33, "commonTypeDict_StringFormat");
  v156[60] = v32;
  v155[61] = @"UpoReboot";
  v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  v30 = objc_msgSend(v31, "commonTypeDict_BoolFormat");
  v156[61] = v30;
  v155[62] = @"DataError";
  v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v156[62] = v28;
  v155[63] = @"FilteredCurrent";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v156[63] = v26;
  v155[64] = @"ShutdownVoltage";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v156[64] = v24;
  v155[65] = @"SOCFThreshold";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v156[65] = v22;
  v155[66] = @"ShutdownSoc";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v156[66] = v20;
  v155[67] = @"LPEMMode";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v156[67] = v18;
  v155[68] = @"SOCAlarm";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v156[68] = v16;
  v155[69] = @"SWRemcap";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v156[69] = v14;
  v155[70] = @"SocSoc2";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v156[70] = v4;
  v155[71] = @"SWFcc";
  uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v156[71] = v6;
  v155[72] = @"DynamicSOCVcut";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v156[72] = v8;
  v155[73] = @"DataCriticalFlagsKey";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v156[73] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v156 forKeys:v155 count:74];
  v160[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v160 forKeys:v159 count:2];

  return v12;
}

+ (id)entryEventPointDefinitionBatteryPanicShutdown
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F40123A8;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  v8 = @"I2CLogData";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RawDataFormat");
  v9 = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventPointDefinitionBatteryTrapInfo
{
  v45[2] = *MEMORY[0x1E4F143B8];
  v44[0] = *MEMORY[0x1E4F92C50];
  uint64_t v42 = *MEMORY[0x1E4F92CD0];
  v43 = &unk_1F40123E8;
  v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
  v45[0] = v39;
  v44[1] = *MEMORY[0x1E4F92CA8];
  v40[0] = @"ActivePayloads";
  v38 = [MEMORY[0x1E4F929D8] sharedInstance];
  v37 = objc_msgSend(v38, "commonTypeDict_IntegerFormat");
  v41[0] = v37;
  v40[1] = @"TimeOnCharger";
  v36 = [MEMORY[0x1E4F929D8] sharedInstance];
  v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat_withUnit_s");
  v41[1] = v35;
  v40[2] = @"CloakEntryCount";
  v34 = [MEMORY[0x1E4F929D8] sharedInstance];
  v33 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
  v41[2] = v33;
  v40[3] = @"PrechargeCount";
  uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
  v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
  v41[3] = v31;
  v40[4] = @"AverageBattVirtualTemp";
  v30 = [MEMORY[0x1E4F929D8] sharedInstance];
  v29 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
  v41[4] = v29;
  v40[5] = @"AverageBattSkinTemp";
  v28 = [MEMORY[0x1E4F929D8] sharedInstance];
  v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
  v41[5] = v27;
  v40[6] = @"StartBatteryCapacity";
  v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat_withUnit_mAh");
  v41[6] = v25;
  v40[7] = @"StartBatteryVoltage";
  v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat_withUnit_mV");
  v41[7] = v23;
  v40[8] = @"VbusType";
  uint64_t v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  v21 = objc_msgSend(v22, "commonTypeDict_BoolFormat");
  v41[8] = v21;
  v40[9] = @"AdapterType";
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v41[9] = v19;
  v40[10] = @"WirelessChargingMode";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_BoolFormat");
  v41[10] = v17;
  v40[11] = @"AdapterPower";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat_withUnit_W");
  v41[11] = v15;
  v40[12] = @"ResetCount";
  v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v41[12] = v13;
  v40[13] = @"HighPoweriBootCount";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v41[13] = v3;
  v40[14] = @"APBootCount";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v41[14] = v5;
  v40[15] = @"DisplayTimeBootCount";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v41[15] = v7;
  v40[16] = @"Ok2SwitchCount";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v41[16] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:17];
  v45[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];

  return v11;
}

+ (id)entryEventPointDefinitionBatteryUILogging
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F4012368;
  v14[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"Rbattx";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v11[1] = @"Rbattxy";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventPointDefinitionBatteryUIVisit
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v12[0] = *MEMORY[0x1E4F92CD0];
  v12[1] = v2;
  v13[0] = &unk_1F40123A8;
  v13[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CF0];
  void v12[2] = *MEMORY[0x1E4F92CF8];
  v12[3] = v3;
  void v13[2] = &unk_1F400DF90;
  void v13[3] = &unk_1F4012378;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
  v15[0] = v4;
  v14[1] = *MEMORY[0x1E4F92CA8];
  uint64_t v10 = @"Visit";
  uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v11 = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventPointDefinitionChargingInfo
{
  v96[2] = *MEMORY[0x1E4F143B8];
  if (+[PLBatteryAgent hasChargingInfoLogging])
  {
    v95[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB8];
    v93[0] = *MEMORY[0x1E4F92CD0];
    v93[1] = v2;
    v94[0] = &unk_1F40123F8;
    v94[1] = MEMORY[0x1E4F1CC28];
    v90 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:2];
    v96[0] = v90;
    v95[1] = *MEMORY[0x1E4F92CA8];
    v91[0] = @"Connected";
    v89 = [MEMORY[0x1E4F929D8] sharedInstance];
    v88 = objc_msgSend(v89, "commonTypeDict_IntegerFormat");
    v92[0] = v88;
    v91[1] = @"Charging";
    v87 = [MEMORY[0x1E4F929D8] sharedInstance];
    v86 = objc_msgSend(v87, "commonTypeDict_IntegerFormat");
    v92[1] = v86;
    v91[2] = @"DriverState";
    v85 = [MEMORY[0x1E4F929D8] sharedInstance];
    v84 = objc_msgSend(v85, "commonTypeDict_IntegerFormat");
    v92[2] = v84;
    v91[3] = @"DriverStatusBits";
    v83 = [MEMORY[0x1E4F929D8] sharedInstance];
    v82 = objc_msgSend(v83, "commonTypeDict_IntegerFormat");
    v92[3] = v82;
    v91[4] = @"FirmwareStatus";
    v81 = [MEMORY[0x1E4F929D8] sharedInstance];
    v80 = objc_msgSend(v81, "commonTypeDict_IntegerFormat");
    v92[4] = v80;
    v91[5] = @"Frequency";
    v79 = [MEMORY[0x1E4F929D8] sharedInstance];
    v78 = objc_msgSend(v79, "commonTypeDict_IntegerFormat");
    v92[5] = v78;
    v91[6] = @"RectifierCurrent";
    v77 = [MEMORY[0x1E4F929D8] sharedInstance];
    v76 = objc_msgSend(v77, "commonTypeDict_IntegerFormat");
    v92[6] = v76;
    v91[7] = @"RectifierVoltage";
    v75 = [MEMORY[0x1E4F929D8] sharedInstance];
    v74 = objc_msgSend(v75, "commonTypeDict_IntegerFormat");
    v92[7] = v74;
    v91[8] = @"PowerTarget";
    v73 = [MEMORY[0x1E4F929D8] sharedInstance];
    v72 = objc_msgSend(v73, "commonTypeDict_IntegerFormat");
    v92[8] = v72;
    v91[9] = @"VoltageTarget";
    v71 = [MEMORY[0x1E4F929D8] sharedInstance];
    v70 = objc_msgSend(v71, "commonTypeDict_IntegerFormat");
    v92[9] = v70;
    v91[10] = @"PowerBudget";
    v69 = [MEMORY[0x1E4F929D8] sharedInstance];
    v68 = objc_msgSend(v69, "commonTypeDict_IntegerFormat");
    v92[10] = v68;
    v91[11] = @"TxGain1";
    v67 = [MEMORY[0x1E4F929D8] sharedInstance];
    v66 = objc_msgSend(v67, "commonTypeDict_IntegerFormat");
    v92[11] = v66;
    v91[12] = @"TxGain2";
    v65 = [MEMORY[0x1E4F929D8] sharedInstance];
    v64 = objc_msgSend(v65, "commonTypeDict_IntegerFormat");
    v92[12] = v64;
    v91[13] = @"TxVersion";
    v63 = [MEMORY[0x1E4F929D8] sharedInstance];
    v62 = objc_msgSend(v63, "commonTypeDict_IntegerFormat");
    v92[13] = v62;
    v91[14] = @"SignalStrength";
    v61 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v60 = objc_msgSend(v61, "commonTypeDict_IntegerFormat");
    v92[14] = v60;
    v91[15] = @"NotCloakReason";
    v59 = [MEMORY[0x1E4F929D8] sharedInstance];
    v58 = objc_msgSend(v59, "commonTypeDict_IntegerFormat");
    v92[15] = v58;
    v91[16] = @"ModDepth";
    v57 = [MEMORY[0x1E4F929D8] sharedInstance];
    v56 = objc_msgSend(v57, "commonTypeDict_IntegerFormat");
    v92[16] = v56;
    v91[17] = @"HighFreq";
    v55 = [MEMORY[0x1E4F929D8] sharedInstance];
    v54 = objc_msgSend(v55, "commonTypeDict_BoolFormat");
    v92[17] = v54;
    v91[18] = @"CloakReason";
    v53 = [MEMORY[0x1E4F929D8] sharedInstance];
    v52 = objc_msgSend(v53, "commonTypeDict_IntegerFormat");
    v92[18] = v52;
    v91[19] = @"InductiveFWMode";
    v51 = [MEMORY[0x1E4F929D8] sharedInstance];
    v50 = objc_msgSend(v51, "commonTypeDict_IntegerFormat");
    v92[19] = v50;
    v91[20] = @"OVPCount";
    v49 = [MEMORY[0x1E4F929D8] sharedInstance];
    v48 = objc_msgSend(v49, "commonTypeDict_IntegerFormat");
    v92[20] = v48;
    v91[21] = @"MagnetAttach";
    v47 = [MEMORY[0x1E4F929D8] sharedInstance];
    v46 = objc_msgSend(v47, "commonTypeDict_BoolFormat");
    v92[21] = v46;
    v91[22] = @"PTxType";
    v45 = [MEMORY[0x1E4F929D8] sharedInstance];
    v44 = objc_msgSend(v45, "commonTypeDict_IntegerFormat");
    v92[22] = v44;
    v91[23] = @"PowerNegotiable";
    v43 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v42 = objc_msgSend(v43, "commonTypeDict_IntegerFormat");
    v92[23] = v42;
    v91[24] = @"PowerPotential";
    v41 = [MEMORY[0x1E4F929D8] sharedInstance];
    v40 = objc_msgSend(v41, "commonTypeDict_IntegerFormat");
    v92[24] = v40;
    v91[25] = @"PowerLimitReason";
    v39 = [MEMORY[0x1E4F929D8] sharedInstance];
    v38 = objc_msgSend(v39, "commonTypeDict_IntegerFormat");
    v92[25] = v38;
    v91[26] = @"Prect";
    v37 = [MEMORY[0x1E4F929D8] sharedInstance];
    v36 = objc_msgSend(v37, "commonTypeDict_IntegerFormat");
    v92[26] = v36;
    v91[27] = @"IlimTarget";
    v35 = [MEMORY[0x1E4F929D8] sharedInstance];
    v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat");
    v92[27] = v34;
    v91[28] = @"IlimHeadroom";
    v33 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
    v92[28] = v32;
    v91[29] = @"TxGain3";
    v31 = [MEMORY[0x1E4F929D8] sharedInstance];
    v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
    v92[29] = v30;
    v91[30] = @"TxGain4";
    v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
    v92[30] = v28;
    v91[31] = @"PowerProfile";
    v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
    v92[31] = v26;
    v91[32] = @"PowerProfSwitch";
    v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
    v92[32] = v24;
    v91[33] = @"TxKest";
    v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v92[33] = v22;
    v91[34] = @"RxQippVer";
    v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
    v92[34] = v20;
    v91[35] = @"DplossStat";
    v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v92[35] = v18;
    v91[36] = @"MainCurrent";
    v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v92[36] = v16;
    v91[37] = @"AuthFodStatus";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v92[37] = v14;
    v91[38] = @"InductiveCoexStatus";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v92[38] = v4;
    v91[39] = @"VMID";
    uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v92[39] = v6;
    v91[40] = @"PowerConverterStatus";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v92[40] = v8;
    v91[41] = @"CommStatus";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v92[41] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v91 count:42];
    v96[1] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:2];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventPointDefinitionUPOStepper
{
  void v24[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiPhone])
  {
    v23[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CF8];
    v21[0] = *MEMORY[0x1E4F92CD0];
    v21[1] = v2;
    v22[0] = &unk_1F40123A8;
    v22[1] = &unk_1F400DF90;
    v21[2] = *MEMORY[0x1E4F92CF0];
    v22[2] = &unk_1F4012398;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
    v24[0] = v18;
    v23[1] = *MEMORY[0x1E4F92CA8];
    v19[0] = @"mitigatedUPOCount";
    v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v20[0] = v16;
    v19[1] = @"mitigationState";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v20[1] = v14;
    v19[2] = @"BatteryShutdownTimestamp";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_DateFormat");
    void v20[2] = v4;
    v19[3] = @"timeWindow";
    uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v20[3] = v6;
    v19[4] = @"trueRa";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v20[4] = v8;
    v19[5] = @"virtualRa";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v20[5] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
    v24[1] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventPointDefinitionBatterySample
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitions
{
  v31[25] = *MEMORY[0x1E4F143B8];
  v30[0] = @"ExternalCharger";
  v29 = +[PLBatteryAgent entryEventForwardDefinitionExternalCharger];
  v31[0] = v29;
  v30[1] = @"EAPencilStats";
  v28 = +[PLBatteryAgent entryEventForwardDefinitionEAPencil];
  v31[1] = v28;
  v30[2] = @"LightningConnectorStatus";
  v27 = +[PLBatteryAgent entryEventForwardDefinitionLightningConnectorStatus];
  v31[2] = v27;
  v30[3] = @"UPOStepper";
  v26 = +[PLBatteryAgent entryEventForwardDefinitionUPOStepper];
  v31[3] = v26;
  v30[4] = @"MitigationState";
  v25 = +[PLBatteryAgent entryEventForwardDefinitionMitigationState];
  v31[4] = v25;
  v30[5] = @"IOPMUBootLPMLog";
  v24 = [a1 entryEventForwardDefinitionIOPMUBootLPMLog];
  v31[5] = v24;
  v30[6] = @"SmartCharging";
  v23 = +[PLBatteryAgent entryEventForwardDefinitionSmartCharging];
  v31[6] = v23;
  v30[7] = @"CleanEnergyCharging";
  uint64_t v22 = +[PLBatteryAgent entryEventForwardDefinitionCleanEnergyCharging];
  v31[7] = v22;
  v30[8] = @"EAPencilCharging";
  v21 = +[PLBatteryAgent entryEventForwardDefinitionEAPencilCharging];
  v31[8] = v21;
  v30[9] = @"USBCCharging0";
  v20 = +[PLBatteryAgent entryEventForwardDefinitionUSBCCharging];
  v31[9] = v20;
  v30[10] = @"USBCCharging1";
  v19 = +[PLBatteryAgent entryEventForwardDefinitionUSBCCharging];
  v31[10] = v19;
  void v30[11] = @"USBCCharging2";
  uint64_t v18 = +[PLBatteryAgent entryEventForwardDefinitionUSBCCharging];
  void v31[11] = v18;
  void v30[12] = @"USBCCharging3";
  v17 = +[PLBatteryAgent entryEventForwardDefinitionUSBCCharging];
  void v31[12] = v17;
  v30[13] = @"PortControllerInfo0";
  v16 = +[PLBatteryAgent entryEventForwardDefinitionPortControllerInfo];
  v31[13] = v16;
  v30[14] = @"PortControllerInfo1";
  v15 = +[PLBatteryAgent entryEventForwardDefinitionPortControllerInfo];
  v31[14] = v15;
  v30[15] = @"PortControllerInfo2";
  uint64_t v3 = +[PLBatteryAgent entryEventForwardDefinitionPortControllerInfo];
  v31[15] = v3;
  v30[16] = @"PortControllerInfo3";
  uint64_t v4 = +[PLBatteryAgent entryEventForwardDefinitionPortControllerInfo];
  v31[16] = v4;
  v30[17] = @"PortControllerBuffer0";
  uint64_t v5 = +[PLBatteryAgent entryEventForwardDefinitionPortControllerBuffer];
  v31[17] = v5;
  v30[18] = @"PortControllerBuffer1";
  v6 = +[PLBatteryAgent entryEventForwardDefinitionPortControllerBuffer];
  v31[18] = v6;
  v30[19] = @"PortControllerBuffer2";
  v7 = +[PLBatteryAgent entryEventForwardDefinitionPortControllerBuffer];
  v31[19] = v7;
  v30[20] = @"PortControllerBuffer3";
  v8 = +[PLBatteryAgent entryEventForwardDefinitionPortControllerBuffer];
  v31[20] = v8;
  v30[21] = @"BatteryCalibration0Baseline";
  v9 = [a1 entryEventForwardDefinitionCalibration0];
  v31[21] = v9;
  v30[22] = @"Calibration0Info";
  uint64_t v10 = [a1 entryEventForwardDefinitionCalibration0Info];
  v31[22] = v10;
  v30[23] = @"MobileChargeMode";
  v11 = +[PLBatteryAgent entryEventForwardDefinitionMobileChargeMode];
  v31[23] = v11;
  v30[24] = @"AdapterDetails";
  v12 = +[PLBatteryAgent entryEventForwardDefinitionAdapterDetails];
  v31[24] = v12;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:25];

  return v14;
}

+ (id)entryEventForwardDefinitionCalibration0
{
  void v79[2] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isiPhone] & 1) != 0
    || [MEMORY[0x1E4F92A38] isWatch])
  {
    v78[0] = *MEMORY[0x1E4F92C50];
    uint64_t v76 = *MEMORY[0x1E4F92CD0];
    v77 = &unk_1F40123A8;
    v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
    v79[0] = v73;
    v78[1] = *MEMORY[0x1E4F92CA8];
    v74[0] = @"AlgoChemID";
    v72 = [MEMORY[0x1E4F929D8] sharedInstance];
    v71 = objc_msgSend(v72, "commonTypeDict_IntegerFormat");
    v75[0] = v71;
    v74[1] = @"AppleRawMaxCapacity";
    v70 = [MEMORY[0x1E4F929D8] sharedInstance];
    v69 = objc_msgSend(v70, "commonTypeDict_IntegerFormat");
    v75[1] = v69;
    v74[2] = @"batteryServiceFlags";
    v68 = [MEMORY[0x1E4F929D8] sharedInstance];
    v67 = objc_msgSend(v68, "commonTypeDict_IntegerFormat");
    v75[2] = v67;
    v74[3] = @"CycleCount";
    v66 = [MEMORY[0x1E4F929D8] sharedInstance];
    v65 = objc_msgSend(v66, "commonTypeDict_IntegerFormat");
    v75[3] = v65;
    v74[4] = @"epoch";
    v64 = [MEMORY[0x1E4F929D8] sharedInstance];
    v63 = objc_msgSend(v64, "commonTypeDict_IntegerFormat");
    v75[4] = v63;
    v74[5] = @"GasGaugeFirmwareVersion";
    v62 = [MEMORY[0x1E4F929D8] sharedInstance];
    v61 = objc_msgSend(v62, "commonTypeDict_IntegerFormat");
    v75[5] = v61;
    v74[6] = @"LifetimeUPOCount";
    uint64_t v60 = [MEMORY[0x1E4F929D8] sharedInstance];
    v59 = objc_msgSend(v60, "commonTypeDict_IntegerFormat");
    v75[6] = v59;
    v74[7] = @"MaximumCapacityPercent";
    v58 = [MEMORY[0x1E4F929D8] sharedInstance];
    v57 = objc_msgSend(v58, "commonTypeDict_IntegerFormat");
    v75[7] = v57;
    v74[8] = @"MaximumFCC";
    v56 = [MEMORY[0x1E4F929D8] sharedInstance];
    v55 = objc_msgSend(v56, "commonTypeDict_IntegerFormat");
    v75[8] = v55;
    v74[9] = @"MinimumFCC";
    v54 = [MEMORY[0x1E4F929D8] sharedInstance];
    v53 = objc_msgSend(v54, "commonTypeDict_IntegerFormat");
    v75[9] = v53;
    v74[10] = @"MaximumQmax";
    v52 = [MEMORY[0x1E4F929D8] sharedInstance];
    v51 = objc_msgSend(v52, "commonTypeDict_IntegerFormat");
    v75[10] = v51;
    v74[11] = @"MinimumQmax";
    v50 = [MEMORY[0x1E4F929D8] sharedInstance];
    v49 = objc_msgSend(v50, "commonTypeDict_IntegerFormat");
    v75[11] = v49;
    v74[12] = @"NCCMin";
    v48 = [MEMORY[0x1E4F929D8] sharedInstance];
    v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
    v75[12] = v47;
    v74[13] = @"NCCMax";
    v46 = [MEMORY[0x1E4F929D8] sharedInstance];
    v45 = objc_msgSend(v46, "commonTypeDict_IntegerFormat");
    v75[13] = v45;
    v74[14] = @"NominalChargeCapacity";
    v44 = [MEMORY[0x1E4F929D8] sharedInstance];
    v43 = objc_msgSend(v44, "commonTypeDict_IntegerFormat");
    v75[14] = v43;
    v74[15] = @"Qmax";
    uint64_t v42 = [MEMORY[0x1E4F929D8] sharedInstance];
    v41 = objc_msgSend(v42, "commonTypeDict_IntegerFormat");
    v75[15] = v41;
    v74[16] = @"Ra00";
    v40 = [MEMORY[0x1E4F929D8] sharedInstance];
    v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat");
    v75[16] = v39;
    v74[17] = @"Ra01";
    v38 = [MEMORY[0x1E4F929D8] sharedInstance];
    v37 = objc_msgSend(v38, "commonTypeDict_IntegerFormat");
    v75[17] = v37;
    v74[18] = @"Ra02";
    v36 = [MEMORY[0x1E4F929D8] sharedInstance];
    v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
    v75[18] = v35;
    v74[19] = @"Ra03";
    v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    v33 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
    v75[19] = v33;
    v74[20] = @"Ra04";
    uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
    v75[20] = v31;
    v74[21] = @"Ra05";
    v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    v29 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
    v75[21] = v29;
    v74[22] = @"Ra06";
    v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v75[22] = v27;
    v74[23] = @"Ra07";
    v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
    v75[23] = v25;
    v74[24] = @"Ra08";
    v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v75[24] = v23;
    v74[25] = @"Ra09";
    uint64_t v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v75[25] = v21;
    v74[26] = @"Ra10";
    v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v75[26] = v19;
    v74[27] = @"Ra11";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    v75[27] = v17;
    v74[28] = @"Ra12";
    v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v75[28] = v15;
    v74[29] = @"Ra13";
    id v14 = [MEMORY[0x1E4F929D8] sharedInstance];
    v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
    v75[29] = v13;
    v74[30] = @"Ra14";
    uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
    v75[30] = v3;
    v74[31] = @"TotalOperatingTime";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v75[31] = v5;
    v74[32] = @"WeightedRa";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v75[32] = v7;
    v74[33] = @"TimeAtHighSoc";
    v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
    v75[33] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:34];
    v79[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:2];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventForwardDefinitionCalibration0Info
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitionEAPencilCharging
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiPad])
  {
    v18[0] = *MEMORY[0x1E4F92C50];
    uint64_t v16 = *MEMORY[0x1E4F92CD0];
    v17 = &unk_1F40123A8;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    v19[0] = v13;
    v18[1] = *MEMORY[0x1E4F92CA8];
    v14[0] = @"IOAccessoryDetect";
    uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
    v15[0] = v3;
    v14[1] = @"IOAccessoryPowerMode";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v15[1] = v5;
    void v14[2] = @"IOAccessoryActivePowerMode";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    void v15[2] = v7;
    void v14[3] = @"Pencil";
    v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_BoolFormat");
    void v15[3] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
    v19[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventForwardDefinitionUSBCCharging
{
  v36[2] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isiPad] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isiPhone] & 1) != 0
    || [MEMORY[0x1E4F92A38] isMac])
  {
    v35[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92C70];
    v33[0] = *MEMORY[0x1E4F92CD0];
    v33[1] = v2;
    v34[0] = &unk_1F4012368;
    v34[1] = MEMORY[0x1E4F1CC38];
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
    v36[0] = v30;
    v35[1] = *MEMORY[0x1E4F92CA8];
    v31[0] = @"FedDualRolePower";
    v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    v28 = objc_msgSend(v29, "commonTypeDict_BoolFormat");
    v32[0] = v28;
    v31[1] = @"FedPortPowerRole";
    v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    v26 = objc_msgSend(v27, "commonTypeDict_BoolFormat");
    v32[1] = v26;
    v31[2] = @"FedRemainingCapacity";
    v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
    v32[2] = v24;
    v31[3] = @"FedExternalConnected";
    v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v22 = objc_msgSend(v23, "commonTypeDict_BoolFormat");
    v32[3] = v22;
    v31[4] = @"FedDesignCapacity";
    v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
    v32[4] = v20;
    v31[5] = @"FedProductID";
    v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v32[5] = v18;
    v31[6] = @"FedVendorID";
    v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v32[6] = v16;
    v31[7] = @"FedStateOfCharge";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v32[7] = v14;
    v31[8] = @"FedPdSpecRevision";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v32[8] = v4;
    v31[9] = @"FedPwrPolicySt";
    uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v32[9] = v6;
    v31[10] = @"FedSnkConfReason";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v32[10] = v8;
    void v31[11] = @"FedSrcConfReason";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v32[11] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:12];
    v36[1] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventForwardDefinitionPortControllerInfo
{
  v160[2] = *MEMORY[0x1E4F143B8];
  v159[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v157[0] = *MEMORY[0x1E4F92CD0];
  v157[1] = v2;
  v158[0] = &unk_1F40123B8;
  v158[1] = MEMORY[0x1E4F1CC38];
  v154 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v158 forKeys:v157 count:2];
  v160[0] = v154;
  v159[1] = *MEMORY[0x1E4F92CA8];
  v155[0] = @"PortControllerPortPDO0";
  v153 = [MEMORY[0x1E4F929D8] sharedInstance];
  v152 = objc_msgSend(v153, "commonTypeDict_IntegerFormat");
  v156[0] = v152;
  v155[1] = @"PortControllerPortPDO1";
  v151 = [MEMORY[0x1E4F929D8] sharedInstance];
  v150 = objc_msgSend(v151, "commonTypeDict_IntegerFormat");
  v156[1] = v150;
  v155[2] = @"PortControllerPortPDO2";
  v149 = [MEMORY[0x1E4F929D8] sharedInstance];
  v148 = objc_msgSend(v149, "commonTypeDict_IntegerFormat");
  v156[2] = v148;
  v155[3] = @"PortControllerPortPDO3";
  v147 = [MEMORY[0x1E4F929D8] sharedInstance];
  v146 = objc_msgSend(v147, "commonTypeDict_IntegerFormat");
  v156[3] = v146;
  v155[4] = @"PortControllerPortPDO4";
  v145 = [MEMORY[0x1E4F929D8] sharedInstance];
  v144 = objc_msgSend(v145, "commonTypeDict_IntegerFormat");
  v156[4] = v144;
  v155[5] = @"PortControllerPortPDO5";
  v143 = [MEMORY[0x1E4F929D8] sharedInstance];
  v142 = objc_msgSend(v143, "commonTypeDict_IntegerFormat");
  v156[5] = v142;
  v155[6] = @"PortControllerPortPDO6";
  v141 = [MEMORY[0x1E4F929D8] sharedInstance];
  v140 = objc_msgSend(v141, "commonTypeDict_IntegerFormat");
  v156[6] = v140;
  v155[7] = @"PortControllerPortPDO7";
  v139 = [MEMORY[0x1E4F929D8] sharedInstance];
  v138 = objc_msgSend(v139, "commonTypeDict_IntegerFormat");
  v156[7] = v138;
  v155[8] = @"PortControllerPortPDO8";
  v137 = [MEMORY[0x1E4F929D8] sharedInstance];
  v136 = objc_msgSend(v137, "commonTypeDict_IntegerFormat");
  v156[8] = v136;
  v155[9] = @"PortControllerPortPDO9";
  v135 = [MEMORY[0x1E4F929D8] sharedInstance];
  v134 = objc_msgSend(v135, "commonTypeDict_IntegerFormat");
  v156[9] = v134;
  v155[10] = @"PortControllerPortPDO10";
  v133 = [MEMORY[0x1E4F929D8] sharedInstance];
  v132 = objc_msgSend(v133, "commonTypeDict_IntegerFormat");
  v156[10] = v132;
  v155[11] = @"PortControllerPortPDO11";
  v131 = [MEMORY[0x1E4F929D8] sharedInstance];
  v130 = objc_msgSend(v131, "commonTypeDict_IntegerFormat");
  v156[11] = v130;
  v155[12] = @"PortControllerPortPDO12";
  v129 = [MEMORY[0x1E4F929D8] sharedInstance];
  v128 = objc_msgSend(v129, "commonTypeDict_IntegerFormat");
  v156[12] = v128;
  v155[13] = @"PortControllerPortPDO13";
  v127 = [MEMORY[0x1E4F929D8] sharedInstance];
  v126 = objc_msgSend(v127, "commonTypeDict_IntegerFormat");
  v156[13] = v126;
  v155[14] = @"PortControllerPortPDO14";
  v125 = [MEMORY[0x1E4F929D8] sharedInstance];
  v124 = objc_msgSend(v125, "commonTypeDict_IntegerFormat");
  v156[14] = v124;
  v155[15] = @"PortControllerPortMode";
  v123 = [MEMORY[0x1E4F929D8] sharedInstance];
  v122 = objc_msgSend(v123, "commonTypeDict_IntegerFormat");
  v156[15] = v122;
  v155[16] = @"PortControllerFwVersion";
  v121 = [MEMORY[0x1E4F929D8] sharedInstance];
  v120 = objc_msgSend(v121, "commonTypeDict_IntegerFormat");
  v156[16] = v120;
  v155[17] = @"PortControllerElectionFailReason";
  v119 = [MEMORY[0x1E4F929D8] sharedInstance];
  v118 = objc_msgSend(v119, "commonTypeDict_IntegerFormat");
  v156[17] = v118;
  v155[18] = @"PortControllerActiveContractRdo";
  v117 = [MEMORY[0x1E4F929D8] sharedInstance];
  v116 = objc_msgSend(v117, "commonTypeDict_IntegerFormat");
  v156[18] = v116;
  v155[19] = @"PortControllerDnSt";
  v115 = [MEMORY[0x1E4F929D8] sharedInstance];
  v114 = objc_msgSend(v115, "commonTypeDict_IntegerFormat");
  v156[19] = v114;
  v155[20] = @"PortControllerFetStatus";
  v113 = [MEMORY[0x1E4F929D8] sharedInstance];
  v112 = objc_msgSend(v113, "commonTypeDict_IntegerFormat");
  v156[20] = v112;
  v155[21] = @"PortControllerPowerState";
  v111 = [MEMORY[0x1E4F929D8] sharedInstance];
  v110 = objc_msgSend(v111, "commonTypeDict_IntegerFormat");
  v156[21] = v110;
  v155[22] = @"PortControllerUvdmStatus";
  v109 = [MEMORY[0x1E4F929D8] sharedInstance];
  v108 = objc_msgSend(v109, "commonTypeDict_IntegerFormat");
  v156[22] = v108;
  v155[23] = @"PortControllerSrcTypes";
  v107 = [MEMORY[0x1E4F929D8] sharedInstance];
  v106 = objc_msgSend(v107, "commonTypeDict_IntegerFormat");
  v156[23] = v106;
  v155[24] = @"PortControllerLoserReason";
  v105 = [MEMORY[0x1E4F929D8] sharedInstance];
  v104 = objc_msgSend(v105, "commonTypeDict_IntegerFormat");
  v156[24] = v104;
  v155[25] = @"PortControllerNPDOs";
  v103 = [MEMORY[0x1E4F929D8] sharedInstance];
  v102 = objc_msgSend(v103, "commonTypeDict_IntegerFormat");
  v156[25] = v102;
  v155[26] = @"PortControllerNEprPDOs";
  v101 = [MEMORY[0x1E4F929D8] sharedInstance];
  v100 = objc_msgSend(v101, "commonTypeDict_IntegerFormat");
  v156[26] = v100;
  v155[27] = @"PortControllerPDst";
  v99 = [MEMORY[0x1E4F929D8] sharedInstance];
  v98 = objc_msgSend(v99, "commonTypeDict_IntegerFormat");
  v156[27] = v98;
  v155[28] = @"PortControllerCapMismatch";
  v97 = [MEMORY[0x1E4F929D8] sharedInstance];
  v96 = objc_msgSend(v97, "commonTypeDict_IntegerFormat");
  v156[28] = v96;
  v155[29] = @"PortControllerSrdoCount";
  v95 = [MEMORY[0x1E4F929D8] sharedInstance];
  v94 = objc_msgSend(v95, "commonTypeDict_IntegerFormat");
  v156[29] = v94;
  v155[30] = @"PortControllerSrdoRetryCount";
  v93 = [MEMORY[0x1E4F929D8] sharedInstance];
  v92 = objc_msgSend(v93, "commonTypeDict_IntegerFormat");
  v156[30] = v92;
  v155[31] = @"PortControllerSrdyCount";
  v91 = [MEMORY[0x1E4F929D8] sharedInstance];
  v90 = objc_msgSend(v91, "commonTypeDict_IntegerFormat");
  v156[31] = v90;
  v155[32] = @"PortControllerSrdyRejectCount";
  v89 = [MEMORY[0x1E4F929D8] sharedInstance];
  v88 = objc_msgSend(v89, "commonTypeDict_IntegerFormat");
  v156[32] = v88;
  v155[33] = @"PortControllerShortDetectCount";
  v87 = [MEMORY[0x1E4F929D8] sharedInstance];
  v86 = objc_msgSend(v87, "commonTypeDict_IntegerFormat");
  v156[33] = v86;
  v155[34] = @"PortControllerSrdoRejectCount";
  v85 = [MEMORY[0x1E4F929D8] sharedInstance];
  v84 = objc_msgSend(v85, "commonTypeDict_IntegerFormat");
  v156[34] = v84;
  v155[35] = @"PortControllerVdoFailCount";
  v83 = [MEMORY[0x1E4F929D8] sharedInstance];
  v82 = objc_msgSend(v83, "commonTypeDict_IntegerFormat");
  v156[35] = v82;
  v155[36] = @"PortControllerI2cErrCount";
  v81 = [MEMORY[0x1E4F929D8] sharedInstance];
  v80 = objc_msgSend(v81, "commonTypeDict_IntegerFormat");
  v156[36] = v80;
  v155[37] = @"PortControllerSurpriseAckCount";
  v79 = [MEMORY[0x1E4F929D8] sharedInstance];
  v78 = objc_msgSend(v79, "commonTypeDict_IntegerFormat");
  v156[37] = v78;
  v155[38] = @"PortControllerSurpriseNackCount";
  v77 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v76 = objc_msgSend(v77, "commonTypeDict_IntegerFormat");
  v156[38] = v76;
  v155[39] = @"PortControllerStuckCmdCount";
  v75 = [MEMORY[0x1E4F929D8] sharedInstance];
  v74 = objc_msgSend(v75, "commonTypeDict_IntegerFormat");
  v156[39] = v74;
  v155[40] = @"PortControllerWakeFailCount";
  v73 = [MEMORY[0x1E4F929D8] sharedInstance];
  v72 = objc_msgSend(v73, "commonTypeDict_IntegerFormat");
  v156[40] = v72;
  v155[41] = @"PortControllerAttachCount";
  v71 = [MEMORY[0x1E4F929D8] sharedInstance];
  v70 = objc_msgSend(v71, "commonTypeDict_IntegerFormat");
  v156[41] = v70;
  v155[42] = @"PortControllerDetachCount";
  v69 = [MEMORY[0x1E4F929D8] sharedInstance];
  v68 = objc_msgSend(v69, "commonTypeDict_IntegerFormat");
  v156[42] = v68;
  v155[43] = @"PortControllerPwrRoleSwapFailCount";
  v67 = [MEMORY[0x1E4F929D8] sharedInstance];
  v66 = objc_msgSend(v67, "commonTypeDict_IntegerFormat");
  v156[43] = v66;
  v155[44] = @"PortControllerPwrRoleSwapCount";
  v65 = [MEMORY[0x1E4F929D8] sharedInstance];
  v64 = objc_msgSend(v65, "commonTypeDict_IntegerFormat");
  v156[44] = v64;
  v155[45] = @"PortControllerDataRoleSwapFailCount";
  v63 = [MEMORY[0x1E4F929D8] sharedInstance];
  v62 = objc_msgSend(v63, "commonTypeDict_IntegerFormat");
  v156[45] = v62;
  v155[46] = @"PortControllerDataRoleSwapCount";
  v61 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v60 = objc_msgSend(v61, "commonTypeDict_IntegerFormat");
  v156[46] = v60;
  v155[47] = @"PortControllerInpFetEnFailCount";
  v59 = [MEMORY[0x1E4F929D8] sharedInstance];
  v58 = objc_msgSend(v59, "commonTypeDict_IntegerFormat");
  v156[47] = v58;
  v155[48] = @"PortControllerHardResetCount";
  v57 = [MEMORY[0x1E4F929D8] sharedInstance];
  v56 = objc_msgSend(v57, "commonTypeDict_IntegerFormat");
  v156[48] = v56;
  v155[49] = @"PortControllerIrqCntAppLd";
  v55 = [MEMORY[0x1E4F929D8] sharedInstance];
  v54 = objc_msgSend(v55, "commonTypeDict_IntegerFormat");
  v156[49] = v54;
  v155[50] = @"PortControllerIrqCntHrdRst";
  v53 = [MEMORY[0x1E4F929D8] sharedInstance];
  v52 = objc_msgSend(v53, "commonTypeDict_IntegerFormat");
  v156[50] = v52;
  v155[51] = @"PortControllerIrqCntPlg";
  v51 = [MEMORY[0x1E4F929D8] sharedInstance];
  v50 = objc_msgSend(v51, "commonTypeDict_IntegerFormat");
  v156[51] = v50;
  v155[52] = @"PortControllerIrqCntStsUpd";
  v49 = [MEMORY[0x1E4F929D8] sharedInstance];
  v48 = objc_msgSend(v49, "commonTypeDict_IntegerFormat");
  v156[52] = v48;
  v155[53] = @"PortControllerIrqCntPwrStsUpd";
  v47 = [MEMORY[0x1E4F929D8] sharedInstance];
  v46 = objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v156[53] = v46;
  v155[54] = @"PortControllerIrqCntRxSrcCap";
  v45 = [MEMORY[0x1E4F929D8] sharedInstance];
  v44 = objc_msgSend(v45, "commonTypeDict_IntegerFormat");
  v156[54] = v44;
  v155[55] = @"PortControllerIrqCntPdStsUpd";
  v43 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v42 = objc_msgSend(v43, "commonTypeDict_IntegerFormat");
  v156[55] = v42;
  v155[56] = @"PortControllerIrqCntRxIdSop";
  v41 = [MEMORY[0x1E4F929D8] sharedInstance];
  v40 = objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v156[56] = v40;
  v155[57] = @"PortControllerIrqCntUvdmEnum";
  v39 = [MEMORY[0x1E4F929D8] sharedInstance];
  v38 = objc_msgSend(v39, "commonTypeDict_IntegerFormat");
  v156[57] = v38;
  v155[58] = @"PortControllerIrqCntUvdmStsUpd";
  v37 = [MEMORY[0x1E4F929D8] sharedInstance];
  v36 = objc_msgSend(v37, "commonTypeDict_IntegerFormat");
  v156[58] = v36;
  v155[59] = @"PortControllerIrqCntUsb2Plg";
  v35 = [MEMORY[0x1E4F929D8] sharedInstance];
  v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v156[59] = v34;
  v155[60] = @"PortControllerIrqCntUsb2Wak";
  v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v156[60] = v32;
  v155[61] = @"PortControllerIrqCntConSrc";
  v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
  v156[61] = v30;
  v155[62] = @"PortControllerIrqCntRxSnkCap";
  v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v156[62] = v28;
  v155[63] = @"PortControllerIrqCntRxRdo";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v156[63] = v26;
  v155[64] = @"PortControllerIrqCntAlert";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v156[64] = v24;
  v155[65] = @"PortControllerIrqCntldcm";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v156[65] = v22;
  v155[66] = @"PortControllerBootFlags";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v156[66] = v20;
  v155[67] = @"PortControllerSlpWakDisTime";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v156[67] = v18;
  v155[68] = @"PortControllerSlpWakDisCause";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v156[68] = v16;
  v155[69] = @"PortControllerSlpWakIsSleepEnabled";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v156[69] = v14;
  v155[70] = @"PortControllerWakeCmdFailCount";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v156[70] = v4;
  v155[71] = @"PortControllerSleepCmdFailCount";
  uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v156[71] = v6;
  v155[72] = @"PortControllerWakeTimeoutCount";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v156[72] = v8;
  v155[73] = @"PortControllerPortControllerIrqCntWakeAck";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v156[73] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v156 forKeys:v155 count:74];
  v160[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v160 forKeys:v159 count:2];

  return v12;
}

+ (id)entryEventForwardDefinitionPortControllerBuffer
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isiPad] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isiPhone] & 1) != 0
    || [MEMORY[0x1E4F92A38] isMac])
  {
    v13[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92C70];
    v11[0] = *MEMORY[0x1E4F92CD0];
    v11[1] = v2;
    v12[0] = &unk_1F40123A8;
    v12[1] = MEMORY[0x1E4F1CC38];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    v14[0] = v3;
    v13[1] = *MEMORY[0x1E4F92CA8];
    v9 = @"PortControllerEvtBuffer";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v5 = objc_msgSend(v4, "commonTypeDict_RawDataFormat");
    uint64_t v10 = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    v14[1] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v7;
}

+ (id)entryEventForwardDefinitionEAPencil
{
  void v29[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiPad])
  {
    v28[0] = *MEMORY[0x1E4F92C50];
    uint64_t v26 = *MEMORY[0x1E4F92CD0];
    v27 = &unk_1F40123A8;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v29[0] = v23;
    v28[1] = *MEMORY[0x1E4F92CA8];
    v24[0] = @"Is Present";
    uint64_t v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v25[0] = v21;
    v24[1] = @"Power Source State";
    v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    v19 = objc_msgSend(v20, "commonTypeDict_StringFormat");
    v25[1] = v19;
    void v24[2] = @"Max Capacity";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat_withUnit_mAh");
    void v25[2] = v17;
    v24[3] = @"Current Capacity";
    uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat_withUnit_mAh");
    v25[3] = v15;
    void v24[4] = @"Transport Type";
    id v14 = [MEMORY[0x1E4F929D8] sharedInstance];
    v13 = objc_msgSend(v14, "commonTypeDict_StringFormat");
    void v25[4] = v13;
    v24[5] = @"Is Charging";
    uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
    v25[5] = v3;
    v24[6] = @"Power Source ID";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v25[6] = v5;
    v24[7] = @"Type";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
    v25[7] = v7;
    v24[8] = @"Temperature";
    v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v25[8] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:9];
    v29[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventForwardDefinitionLightningConnectorStatus
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  if (+[PLBatteryAgent hasLightning])
  {
    v12[0] = *MEMORY[0x1E4F92C50];
    uint64_t v10 = *MEMORY[0x1E4F92CD0];
    v11 = &unk_1F40123A8;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    v13[0] = v2;
    v12[1] = *MEMORY[0x1E4F92CA8];
    v8 = @"IOAccessoryPowerMode";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v9 = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    v13[1] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v6;
}

+ (id)entryEventForwardDefinitionExternalCharger
{
  void v33[2] = *MEMORY[0x1E4F143B8];
  if (+[PLBatteryAgent hasWirelessCharger])
  {
    v32[0] = *MEMORY[0x1E4F92C50];
    uint64_t v30 = *MEMORY[0x1E4F92CD0];
    v31 = &unk_1F40123E8;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    v33[0] = v27;
    v32[1] = *MEMORY[0x1E4F92CA8];
    v28[0] = @"ConnectState";
    uint64_t v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
    v29[0] = v25;
    v28[1] = @"ResetCount";
    v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v29[1] = v23;
    void v28[2] = @"EEEECode";
    uint64_t v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    v21 = objc_msgSend(v22, "commonTypeDict_StringFormat");
    void v29[2] = v21;
    v28[3] = @"Cloaked";
    v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    v19 = objc_msgSend(v20, "commonTypeDict_BoolFormat");
    v29[3] = v19;
    v28[4] = @"FWStatus";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    void v29[4] = v17;
    v28[5] = @"LinkEfficiency";
    uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v29[5] = v15;
    v28[6] = @"CloakReason";
    id v14 = [MEMORY[0x1E4F929D8] sharedInstance];
    v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
    v29[6] = v13;
    v28[7] = @"DeviceInfoChipVariant";
    uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
    v29[7] = v3;
    v28[8] = @"DeviceInfoRegionCode";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v29[8] = v5;
    v28[9] = @"PuckClassification";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v29[9] = v7;
    v28[10] = @"HFPolicy";
    v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_RawDataFormat");
    v29[10] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:11];
    v33[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)connectStateStringToEnum:(id)a3
{
  uint64_t v3 = [&unk_1F40145D8 indexOfObject:a3];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = &unk_1F400DFC0;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v3 + 1];
  }
  return v4;
}

+ (id)entryEventForwardDefinitionUPOStepper
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiPhone])
  {
    v18[0] = *MEMORY[0x1E4F92C50];
    uint64_t v16 = *MEMORY[0x1E4F92CD0];
    v17 = &unk_1F40123A8;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    v19[0] = v13;
    v18[1] = *MEMORY[0x1E4F92CA8];
    v14[0] = @"RAv";
    uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
    v15[0] = v3;
    v14[1] = @"VirtualRADelta";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v15[1] = v5;
    void v14[2] = @"MitigationState";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    void v15[2] = v7;
    void v14[3] = @"RAvTimeWindow";
    v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    void v15[3] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
    v19[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventForwardDefinitionMitigationState
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiPhone])
  {
    v14[0] = *MEMORY[0x1E4F92C50];
    uint64_t v12 = *MEMORY[0x1E4F92CD0];
    v13 = &unk_1F40123A8;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    v15[0] = v2;
    v14[1] = *MEMORY[0x1E4F92CA8];
    v10[0] = @"MitigationState";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v10[1] = @"MitigationDisabled";
    v11[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_BoolFormat");
    v11[1] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    v15[1] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v8;
}

+ (id)entryEventForwardDefinitionSmartCharging
{
  v41[2] = *MEMORY[0x1E4F143B8];
  if (+[PLBatteryAgent supportsSmartCharging]
    || +[PLBatteryAgent supportsFixedLimitCharging])
  {
    v40[0] = *MEMORY[0x1E4F92C50];
    uint64_t v38 = *MEMORY[0x1E4F92CD0];
    v39 = &unk_1F4012408;
    v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    v41[0] = v35;
    v40[1] = *MEMORY[0x1E4F92CA8];
    v36[0] = @"status";
    v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    v33 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
    v37[0] = v33;
    v36[1] = @"checkpoint";
    uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
    v37[1] = v31;
    v36[2] = @"decisionMaker";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    v29 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
    v37[2] = v29;
    v36[3] = @"decisionTime";
    v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v37[3] = v27;
    void v36[4] = @"timeTillTopOff";
    uint64_t v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
    v37[4] = v25;
    v36[5] = @"modelVersion";
    v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    v23 = objc_msgSend(v24, "commonTypeDict_RealFormat");
    v37[5] = v23;
    v36[6] = @"engagementModelVersion";
    uint64_t v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    v21 = objc_msgSend(v22, "commonTypeDict_RealFormat");
    v37[6] = v21;
    v36[7] = @"engagementProbability";
    v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v37[7] = v19;
    v36[8] = @"durationPrediction";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    v37[8] = v17;
    v36[9] = @"state";
    uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v37[9] = v15;
    v36[10] = @"isEngaged";
    id v14 = [MEMORY[0x1E4F929D8] sharedInstance];
    v13 = objc_msgSend(v14, "commonTypeDict_BoolFormat");
    v37[10] = v13;
    v36[11] = @"isLimited";
    uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v3 = objc_msgSend(v2, "commonTypeDict_BoolFormat");
    v37[11] = v3;
    v36[12] = @"isFixed";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
    v37[12] = v5;
    v36[13] = @"chargeLimitTargetSoC";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v37[13] = v7;
    v36[14] = @"recommendedChargeLimit";
    v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v37[14] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:15];
    v41[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventForwardDefinitionCleanEnergyCharging
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  if (+[PLBatteryAgent supportsCleanEnergyCharging])
  {
    v16[0] = *MEMORY[0x1E4F92C50];
    uint64_t v14 = *MEMORY[0x1E4F92CD0];
    v15 = &unk_1F4012368;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v17[0] = v2;
    v16[1] = *MEMORY[0x1E4F92CA8];
    v12[0] = @"status";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v13[0] = v4;
    v12[1] = @"isPaused";
    uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_BoolFormat");
    v13[1] = v6;
    void v12[2] = @"cecState";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    void v13[2] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
    v17[1] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v10;
}

+ (id)entryEventForwardDefinitionAdapterDetails
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v20[0] = *MEMORY[0x1E4F92C50];
  uint64_t v18 = *MEMORY[0x1E4F92CD0];
  v19 = &unk_1F4012368;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v21[0] = v15;
  v20[1] = *MEMORY[0x1E4F92CA8];
  v16[0] = @"Manufacturer";
  uint64_t v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_StringFormat");
  v17[0] = v13;
  v16[1] = @"Model";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_StringFormat");
  v17[1] = v3;
  void v16[2] = @"Watts";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  void v17[2] = v5;
  void v16[3] = @"isWireless";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_BoolFormat");
  void v17[3] = v7;
  v16[4] = @"AdapterPowerTier";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v17[4] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
  v21[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

  return v11;
}

+ (id)entryEventBackwardDefinitions
{
  v19[14] = *MEMORY[0x1E4F143B8];
  v18[0] = @"Battery";
  v17 = +[PLBatteryAgent entryEventBackwardDefinitionBattery];
  v19[0] = v17;
  v18[1] = @"EABattery";
  uint64_t v16 = +[PLBatteryAgent entryEventBackwardDefinitionEABattery];
  v19[1] = v16;
  void v18[2] = @"BatteryUI";
  v15 = +[PLBatteryAgent entryEventBackwardDefinitionBatteryUI];
  v19[2] = v15;
  void v18[3] = @"CurrentAccumulator";
  uint64_t v14 = +[PLBatteryAgent entryEventBackwardDefinitionCurrentAccumulator];
  void v19[3] = v14;
  v18[4] = @"ChargingHeatMapA";
  v13 = +[PLBatteryAgent entryEventBackwardDefinitionChargingHeatMapA];
  v19[4] = v13;
  v18[5] = @"ChargingHeatMapB";
  uint64_t v2 = +[PLBatteryAgent entryEventBackwardDefinitionChargingHeatMapB];
  v19[5] = v2;
  v18[6] = @"DischargingHeatMap";
  uint64_t v3 = +[PLBatteryAgent entryEventBackwardDefinitionDischargingHeatMap];
  void v19[6] = v3;
  v18[7] = @"KioskMode";
  uint64_t v4 = +[PLBatteryAgent entryEventBackwardDefinitionKioskMode];
  v19[7] = v4;
  v18[8] = @"BTM";
  uint64_t v5 = +[PLBatteryAgent entryEventBackwardDefinitionBTM];
  v19[8] = v5;
  v18[9] = @"TrustedBatteryHealth";
  v6 = +[PLBatteryAgent entryEventBackwardDefinitionTrustedBatteryHealth];
  v19[9] = v6;
  v18[10] = @"Adapter";
  v7 = +[PLBatteryAgent entryEventBackwardDefinitionAdapter];
  v19[10] = v7;
  v18[11] = @"PowerOut0";
  v8 = +[PLBatteryAgent entryEventBackwardDefinitionPowerOut];
  v19[11] = v8;
  v18[12] = @"PowerOut1";
  v9 = +[PLBatteryAgent entryEventBackwardDefinitionPowerOut];
  v19[12] = v9;
  v18[13] = @"ChargingLimit";
  uint64_t v10 = +[PLBatteryAgent entryEventBackwardDefinitionChargingLimit];
  v19[13] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:14];

  return v11;
}

+ (id)entryEventBackwardDefinitionBattery
{
  v277[2] = *MEMORY[0x1E4F143B8];
  v276[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C40];
  v274[0] = *MEMORY[0x1E4F92CD0];
  v274[1] = v2;
  uint64_t v3 = MEMORY[0x1E4F1CC38];
  v275[0] = &unk_1F4012418;
  v275[1] = MEMORY[0x1E4F1CC38];
  v274[2] = *MEMORY[0x1E4F92CD8];
  v273[0] = @"Level";
  v273[1] = @"RawLevel";
  v273[2] = @"AtCriticalLevel";
  v273[3] = @"Voltage";
  v273[4] = @"AppleRawBatteryVoltage";
  v273[5] = @"AdapterVoltage";
  v273[6] = @"InstantAmperage";
  v273[7] = @"FullAvailableCapacity";
  v273[8] = @"CurrentCapacity";
  v273[9] = @"AppleRawCurrentCapacity";
  v273[10] = @"MaxCapacity";
  v273[11] = @"AppleRawMaxCapacity";
  v273[12] = @"DesignCapacity";
  v273[13] = @"CycleCount";
  v273[14] = @"ChargeStatus";
  v273[15] = @"IsCharging";
  v273[16] = @"FullyCharged";
  v273[17] = @"Amperage";
  v273[18] = @"Temperature";
  v273[19] = @"AdapterInfo";
  v273[20] = @"ExternalConnected";
  v273[21] = @"ChemID";
  v273[22] = @"AbsoluteCapacity";
  v273[23] = @"PresentDOD";
  v273[24] = @"QmaxCell0";
  v273[25] = @"QmaxCell1";
  v273[26] = @"QmaxCell2";
  v273[27] = @"AbsoluteLevel";
  v273[28] = @"PMUConfiguration";
  v273[29] = @"DOD0";
  v273[30] = @"DOD1";
  v273[31] = @"DOD2";
  v273[32] = @"PassedCharge";
  v273[33] = @"Qstart";
  v273[34] = @"ResScale";
  v273[35] = @"RSS";
  v273[36] = @"ITMiscStatus";
  v273[37] = @"PresentMaxRa0-8";
  v273[38] = @"LifetimeMaxRa0-8Updated";
  v273[39] = @"Flags";
  v273[40] = @"BatteryCellDisconnectCount";
  v273[41] = @"GaugeResetCounter";
  v273[42] = @"ChemicalWeightedRa";
  v273[43] = @"WeightedRa";
  v273[44] = @"BatteryHealthMetric";
  v273[45] = @"PeakPerformanceCapacity";
  v273[46] = @"QmaxDisqualificationReason";
  v273[47] = @"SimRate";
  v273[48] = @"ChargeAccum";
  v273[49] = @"FilteredCurrent";
  v273[50] = @"VacVoltageLimit";
  v273[51] = @"KioskModeHighSocSeconds";
  v273[52] = @"KioskModeMode";
  v273[53] = @"CurrentSenseMonitorStatus";
  v130 = [MEMORY[0x1E4F1C978] arrayWithObjects:v273 count:54];
  v275[2] = v130;
  v129 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v275 forKeys:v274 count:3];
  v276[1] = *MEMORY[0x1E4F92CA8];
  v277[0] = v129;
  v271[0] = @"Level";
  uint64_t v5 = *MEMORY[0x1E4F92D18];
  v268[0] = *MEMORY[0x1E4F92D10];
  uint64_t v4 = v268[0];
  v268[1] = v5;
  v270[0] = &unk_1F400DF78;
  v270[1] = @"%";
  uint64_t v269 = *MEMORY[0x1E4F92C48];
  uint64_t v6 = v269;
  v270[2] = v3;
  v128 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v270 forKeys:v268 count:3];
  v272[0] = v128;
  v271[1] = @"RawLevel";
  v266[0] = v4;
  v266[1] = v5;
  v267[0] = &unk_1F400DF78;
  v267[1] = @"%";
  v266[2] = v6;
  v267[2] = v3;
  v127 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v267 forKeys:v266 count:3];
  v272[1] = v127;
  v271[2] = @"AtCriticalLevel";
  v126 = [MEMORY[0x1E4F929D8] sharedInstance];
  v125 = objc_msgSend(v126, "commonTypeDict_BoolFormat");
  v272[2] = v125;
  v271[3] = @"Voltage";
  v124 = [MEMORY[0x1E4F929D8] sharedInstance];
  v123 = objc_msgSend(v124, "commonTypeDict_IntegerFormat_withUnit_mV");
  v272[3] = v123;
  v271[4] = @"AppleRawBatteryVoltage";
  v122 = [MEMORY[0x1E4F929D8] sharedInstance];
  v121 = objc_msgSend(v122, "commonTypeDict_IntegerFormat_withUnit_mV");
  v272[4] = v121;
  v271[5] = @"AdapterVoltage";
  uint64_t v7 = *MEMORY[0x1E4F92CA0];
  v264[0] = v4;
  v264[1] = v7;
  v265[0] = &unk_1F400DFA8;
  v265[1] = &unk_1F40145F0;
  v120 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v265 forKeys:v264 count:2];
  v272[5] = v120;
  v271[6] = @"InstantAmperage";
  v119 = [MEMORY[0x1E4F929D8] sharedInstance];
  v118 = objc_msgSend(v119, "commonTypeDict_IntegerFormat_withUnit_mA");
  v272[6] = v118;
  v271[7] = @"FullAvailableCapacity";
  v262[0] = v4;
  v262[1] = v5;
  v263[0] = &unk_1F400DFA8;
  v263[1] = @"mAh";
  v262[2] = v7;
  v263[2] = &unk_1F4014608;
  v117 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v263 forKeys:v262 count:3];
  v272[7] = v117;
  v271[8] = @"CurrentCapacity";
  v116 = [MEMORY[0x1E4F929D8] sharedInstance];
  v115 = objc_msgSend(v116, "commonTypeDict_IntegerFormat_withUnit_mAh");
  v272[8] = v115;
  v271[9] = @"AppleRawCurrentCapacity";
  v114 = [MEMORY[0x1E4F929D8] sharedInstance];
  v113 = objc_msgSend(v114, "commonTypeDict_IntegerFormat_withUnit_mAh");
  v272[9] = v113;
  v271[10] = @"MaxCapacity";
  v112 = [MEMORY[0x1E4F929D8] sharedInstance];
  v111 = objc_msgSend(v112, "commonTypeDict_IntegerFormat_withUnit_mAh");
  v272[10] = v111;
  v271[11] = @"AppleRawMaxCapacity";
  v110 = [MEMORY[0x1E4F929D8] sharedInstance];
  v109 = objc_msgSend(v110, "commonTypeDict_IntegerFormat_withUnit_mAh");
  v272[11] = v109;
  v271[12] = @"DesignCapacity";
  v108 = [MEMORY[0x1E4F929D8] sharedInstance];
  v107 = objc_msgSend(v108, "commonTypeDict_IntegerFormat_withUnit_mAh");
  v272[12] = v107;
  v271[13] = @"CycleCount";
  v106 = [MEMORY[0x1E4F929D8] sharedInstance];
  v105 = objc_msgSend(v106, "commonTypeDict_IntegerFormat");
  v272[13] = v105;
  v271[14] = @"ChargeStatus";
  v104 = [MEMORY[0x1E4F929D8] sharedInstance];
  v103 = objc_msgSend(v104, "commonTypeDict_StringFormat");
  v272[14] = v103;
  v271[15] = @"IsCharging";
  v102 = [MEMORY[0x1E4F929D8] sharedInstance];
  v101 = objc_msgSend(v102, "commonTypeDict_BoolFormat");
  v272[15] = v101;
  v271[16] = @"FullyCharged";
  v100 = [MEMORY[0x1E4F929D8] sharedInstance];
  v99 = objc_msgSend(v100, "commonTypeDict_BoolFormat");
  v272[16] = v99;
  v271[17] = @"ChargingCurrent";
  v260[0] = v4;
  v260[1] = v5;
  v261[0] = &unk_1F400DFA8;
  v261[1] = @"mA";
  v260[2] = v7;
  v261[2] = &unk_1F4014620;
  v98 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v261 forKeys:v260 count:3];
  v272[17] = v98;
  v271[18] = @"NotChargingReason";
  v258[0] = v4;
  v258[1] = v7;
  v259[0] = &unk_1F400DFA8;
  v259[1] = &unk_1F4014638;
  v97 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v259 forKeys:v258 count:2];
  v272[18] = v97;
  v271[19] = @"ChargerAlert";
  v256[0] = v4;
  v256[1] = v7;
  v257[0] = &unk_1F400DFA8;
  v257[1] = &unk_1F4014650;
  v96 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v257 forKeys:v256 count:2];
  v272[19] = v96;
  v271[20] = @"ChargerStatus";
  v254[0] = v4;
  v254[1] = v7;
  v255[0] = &unk_1F400DFA8;
  v255[1] = &unk_1F4014668;
  v95 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v255 forKeys:v254 count:2];
  v272[20] = v95;
  v271[21] = @"ChargingVoltage";
  v252[0] = v4;
  v252[1] = v7;
  v253[0] = &unk_1F400DFA8;
  v253[1] = &unk_1F4014680;
  v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v253 forKeys:v252 count:2];
  v272[21] = v94;
  v271[22] = @"Amperage";
  v250[0] = v4;
  v250[1] = v5;
  v251[0] = &unk_1F400DFA8;
  v251[1] = @"mA";
  v250[2] = v7;
  v251[2] = &unk_1F4014698;
  v93 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v251 forKeys:v250 count:3];
  v272[22] = v93;
  v271[23] = @"Temperature";
  v248[0] = v4;
  v248[1] = v5;
  v249[0] = &unk_1F400DF78;
  v249[1] = @"C";
  v248[2] = v6;
  void v249[2] = v3;
  v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v249 forKeys:v248 count:3];
  v272[23] = v92;
  v271[24] = @"AdapterInfo";
  v246[0] = v4;
  v246[1] = v7;
  v247[0] = &unk_1F400DFA8;
  v247[1] = &unk_1F40146B0;
  v91 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v247 forKeys:v246 count:2];
  v272[24] = v91;
  v271[25] = @"ExternalConnected";
  v90 = [MEMORY[0x1E4F929D8] sharedInstance];
  v89 = objc_msgSend(v90, "commonTypeDict_BoolFormat");
  v272[25] = v89;
  v271[26] = @"NominalChargeCapacity";
  v88 = [MEMORY[0x1E4F929D8] sharedInstance];
  v87 = objc_msgSend(v88, "commonTypeDict_IntegerFormat");
  v272[26] = v87;
  v271[27] = @"ChemID";
  v244[0] = v4;
  v244[1] = v7;
  v245[0] = &unk_1F400DFA8;
  v245[1] = &unk_1F40146C8;
  v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v245 forKeys:v244 count:2];
  v272[27] = v86;
  v271[28] = @"AbsoluteCapacity";
  v85 = [MEMORY[0x1E4F929D8] sharedInstance];
  v84 = objc_msgSend(v85, "commonTypeDict_IntegerFormat");
  v272[28] = v84;
  v271[29] = @"PresentDOD";
  v83 = [MEMORY[0x1E4F929D8] sharedInstance];
  v82 = objc_msgSend(v83, "commonTypeDict_IntegerFormat");
  v272[29] = v82;
  v271[30] = @"QmaxCell0";
  v242[0] = v4;
  v242[1] = v6;
  v243[0] = &unk_1F400DFA8;
  v243[1] = v3;
  v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v243 forKeys:v242 count:2];
  v272[30] = v81;
  v271[31] = @"QmaxCell1";
  v240[0] = v4;
  v240[1] = v6;
  v241[0] = &unk_1F400DFA8;
  v241[1] = v3;
  v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v241 forKeys:v240 count:2];
  v272[31] = v80;
  v271[32] = @"QmaxCell2";
  v238[0] = v4;
  v238[1] = v6;
  v239[0] = &unk_1F400DFA8;
  v239[1] = v3;
  v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v239 forKeys:v238 count:2];
  v272[32] = v79;
  v271[33] = @"AbsoluteLevel";
  v236[0] = v4;
  v236[1] = v5;
  v237[0] = &unk_1F400DF78;
  v237[1] = @"%";
  v236[2] = v6;
  v237[2] = v3;
  v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v237 forKeys:v236 count:3];
  v272[33] = v78;
  v271[34] = @"PMUConfiguration";
  v234[0] = v4;
  v234[1] = v7;
  v235[0] = &unk_1F400DFA8;
  v235[1] = &unk_1F40146E0;
  v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v235 forKeys:v234 count:2];
  v272[34] = v77;
  v271[35] = @"DOD0";
  v232[0] = v4;
  v232[1] = v6;
  v233[0] = &unk_1F400DFA8;
  v233[1] = v3;
  uint64_t v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v233 forKeys:v232 count:2];
  v272[35] = v76;
  v271[36] = @"DOD1";
  v230[0] = v4;
  v230[1] = v6;
  v231[0] = &unk_1F400DFA8;
  v231[1] = v3;
  v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v231 forKeys:v230 count:2];
  v272[36] = v75;
  v271[37] = @"DOD2";
  v228[0] = v4;
  v228[1] = v6;
  v229[0] = &unk_1F400DFA8;
  v229[1] = v3;
  v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v229 forKeys:v228 count:2];
  v272[37] = v74;
  v271[38] = @"PassedCharge";
  v226[0] = v4;
  v226[1] = v7;
  v227[0] = &unk_1F400DFA8;
  v227[1] = &unk_1F40146F8;
  v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v227 forKeys:v226 count:2];
  v272[38] = v73;
  v271[39] = @"Qstart";
  v224[0] = v4;
  v224[1] = v7;
  v225[0] = &unk_1F400DFA8;
  v225[1] = &unk_1F4014710;
  v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v225 forKeys:v224 count:2];
  v272[39] = v72;
  v271[40] = @"ResScale";
  v222[0] = v4;
  v222[1] = v7;
  v223[0] = &unk_1F400DFA8;
  v223[1] = &unk_1F4014728;
  v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v223 forKeys:v222 count:2];
  v272[40] = v71;
  v271[41] = @"RSS";
  v220[0] = v4;
  v220[1] = v7;
  v221[0] = &unk_1F400DFA8;
  v221[1] = &unk_1F4014740;
  v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v221 forKeys:v220 count:2];
  v272[41] = v70;
  v271[42] = @"ITMiscStatus";
  v219[0] = &unk_1F400DFA8;
  v218[0] = v4;
  v218[1] = v7;
  v217[0] = @"BatteryData";
  v217[1] = @"ITMiscStatus";
  v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:v217 count:2];
  v219[1] = v69;
  v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v219 forKeys:v218 count:2];
  v272[42] = v68;
  v271[43] = @"PresentMaxRa0-8";
  v67 = [MEMORY[0x1E4F929D8] sharedInstance];
  v66 = objc_msgSend(v67, "commonTypeDict_IntegerFormat");
  v272[43] = v66;
  v271[44] = @"LifetimeMaxRa0-8Updated";
  v65 = [MEMORY[0x1E4F929D8] sharedInstance];
  v64 = objc_msgSend(v65, "commonTypeDict_BoolFormat");
  v272[44] = v64;
  v271[45] = @"Flags";
  v215[0] = v4;
  v215[1] = v7;
  v216[0] = &unk_1F400DFA8;
  v216[1] = &unk_1F4014758;
  v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v216 forKeys:v215 count:2];
  v272[45] = v63;
  v271[46] = @"BatteryCellDisconnectCount";
  v213[0] = v4;
  v213[1] = v7;
  v214[0] = &unk_1F400DFA8;
  v214[1] = &unk_1F4014770;
  v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v214 forKeys:v213 count:2];
  v272[46] = v62;
  v271[47] = @"GaugeResetCounter";
  v211[0] = v4;
  v211[1] = v7;
  v212[0] = &unk_1F400DFA8;
  v212[1] = &unk_1F4014788;
  v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v212 forKeys:v211 count:2];
  v272[47] = v61;
  v271[48] = @"ChemicalWeightedRa";
  v209[0] = v4;
  v209[1] = v7;
  v210[0] = &unk_1F400DFA8;
  v210[1] = &unk_1F40147A0;
  uint64_t v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v210 forKeys:v209 count:2];
  v272[48] = v60;
  v271[49] = @"WeightedRa";
  v207[0] = v4;
  v207[1] = v6;
  v208[0] = &unk_1F400DFA8;
  v208[1] = v3;
  v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v208 forKeys:v207 count:2];
  v272[49] = v59;
  v271[50] = @"BatteryHealthMetric";
  v205[0] = v4;
  v205[1] = v7;
  v206[0] = &unk_1F400DFA8;
  v206[1] = &unk_1F40147B8;
  v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v206 forKeys:v205 count:2];
  v272[50] = v58;
  v271[51] = @"PeakPerformanceCapacity";
  v203[0] = v4;
  v203[1] = v7;
  v204[0] = &unk_1F400DFA8;
  v204[1] = &unk_1F40147D0;
  v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v204 forKeys:v203 count:2];
  v272[51] = v57;
  v271[52] = @"QmaxDisqualificationReason";
  v201[0] = v4;
  v201[1] = v7;
  v202[0] = &unk_1F400DFA8;
  v202[1] = &unk_1F40147E8;
  v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v202 forKeys:v201 count:2];
  v272[52] = v56;
  v271[53] = @"SimRate";
  v199[0] = v4;
  v199[1] = v7;
  v200[0] = &unk_1F400DFA8;
  v200[1] = &unk_1F4014800;
  v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v200 forKeys:v199 count:2];
  v272[53] = v55;
  v271[54] = @"ChargeAccum";
  v197[0] = v4;
  v197[1] = v7;
  v198[0] = &unk_1F400DFA8;
  v198[1] = &unk_1F4014818;
  v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v198 forKeys:v197 count:2];
  v272[54] = v54;
  v271[55] = @"FilteredCurrent";
  v195[0] = v4;
  v195[1] = v7;
  v196[0] = &unk_1F400DFA8;
  v196[1] = &unk_1F4014830;
  v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v196 forKeys:v195 count:2];
  v272[55] = v53;
  v271[56] = @"VacVoltageLimit";
  v193[0] = v4;
  v193[1] = v7;
  v194[0] = &unk_1F400DFA8;
  v194[1] = &unk_1F4014848;
  v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v194 forKeys:v193 count:2];
  v272[56] = v52;
  v271[57] = @"KioskModeHighSocSeconds";
  v191[0] = v4;
  v191[1] = v7;
  v192[0] = &unk_1F400DFA8;
  v192[1] = &unk_1F4014860;
  v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v192 forKeys:v191 count:2];
  v272[57] = v51;
  v271[58] = @"KioskModeMode";
  v189[0] = v4;
  v189[1] = v7;
  v190[0] = &unk_1F400DFA8;
  v190[1] = &unk_1F4014878;
  v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v190 forKeys:v189 count:2];
  v272[58] = v50;
  v271[59] = @"CurrentSenseMonitorStatus";
  v187[0] = v4;
  v187[1] = v7;
  v188[0] = &unk_1F400DFA8;
  v188[1] = &unk_1F4014890;
  v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v188 forKeys:v187 count:2];
  v272[59] = v49;
  v271[60] = @"AdapterPower";
  v185[0] = v4;
  v185[1] = v7;
  v186[0] = &unk_1F400DF78;
  v186[1] = &unk_1F40148A8;
  v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v186 forKeys:v185 count:2];
  v272[60] = v48;
  v271[61] = @"SystemPower";
  v183[0] = v4;
  v183[1] = v7;
  v184[0] = &unk_1F400DF78;
  v184[1] = &unk_1F40148C0;
  v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v184 forKeys:v183 count:2];
  v272[61] = v47;
  v271[62] = @"PMUConfigured";
  v181[0] = v4;
  v181[1] = v7;
  v182[0] = &unk_1F400DF78;
  v182[1] = &unk_1F40148D8;
  v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v182 forKeys:v181 count:2];
  v272[62] = v46;
  v271[63] = @"VirtualTemperature";
  v45 = [MEMORY[0x1E4F929D8] sharedInstance];
  v44 = objc_msgSend(v45, "commonTypeDict_IntegerFormat");
  v272[63] = v44;
  v271[64] = @"SWRemCap";
  v179[0] = v4;
  v179[1] = v7;
  v180[0] = &unk_1F400DFA8;
  v180[1] = &unk_1F40148F0;
  v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v180 forKeys:v179 count:2];
  v272[64] = v43;
  v271[65] = @"SWRawFCC";
  v177[0] = v4;
  v177[1] = v7;
  v178[0] = &unk_1F400DFA8;
  v178[1] = &unk_1F4014908;
  uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v178 forKeys:v177 count:2];
  v272[65] = v42;
  v271[66] = @"SWRawSOC";
  v175[0] = v4;
  v175[1] = v7;
  v176[0] = &unk_1F400DFA8;
  v176[1] = &unk_1F4014920;
  v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v176 forKeys:v175 count:2];
  v272[66] = v41;
  v271[67] = @"OCVCount";
  v173[0] = v4;
  v173[1] = v7;
  v174[0] = &unk_1F400DFA8;
  v174[1] = &unk_1F4014938;
  v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v174 forKeys:v173 count:2];
  v272[67] = v40;
  v271[68] = @"OCV";
  v171[0] = v4;
  v171[1] = v7;
  v172[0] = &unk_1F400DFA8;
  v172[1] = &unk_1F4014950;
  v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v172 forKeys:v171 count:2];
  v272[68] = v39;
  v271[69] = @"RaUpdateDisqualified";
  v169[0] = v4;
  v169[1] = v7;
  v170[0] = &unk_1F400DFA8;
  v170[1] = &unk_1F4014968;
  uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v170 forKeys:v169 count:2];
  v272[69] = v38;
  v271[70] = @"QmaxUpdateDisqualified";
  v167[0] = v4;
  v167[1] = v7;
  v168[0] = &unk_1F400DFA8;
  v168[1] = &unk_1F4014980;
  v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v168 forKeys:v167 count:2];
  v272[70] = v37;
  v271[71] = @"TimeSinceLastOCV";
  v165[0] = v4;
  v165[1] = v7;
  v166[0] = &unk_1F400DFA8;
  v166[1] = &unk_1F4014998;
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v166 forKeys:v165 count:2];
  v272[71] = v36;
  v271[72] = @"LPEMMode";
  v163[0] = v4;
  v163[1] = v7;
  v164[0] = &unk_1F400DFA8;
  v164[1] = &unk_1F40149B0;
  v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v164 forKeys:v163 count:2];
  v272[72] = v35;
  v271[73] = @"InductiveFWMode";
  v161[0] = v4;
  v161[1] = v7;
  v162[0] = &unk_1F400DFA8;
  v162[1] = &unk_1F40149C8;
  v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v162 forKeys:v161 count:2];
  v272[73] = v34;
  v271[74] = @"Port1FilteredPower";
  v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v272[74] = v32;
  v271[75] = @"Port1Current";
  v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
  v272[75] = v30;
  v271[76] = @"Port1Voltage";
  v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v272[76] = v28;
  v271[77] = @"Port1Power";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v272[77] = v26;
  v271[78] = @"ChargerRegisterStatus";
  v159[0] = v4;
  v159[1] = v7;
  v160[0] = &unk_1F400DFD8;
  v160[1] = &unk_1F40149E0;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v160 forKeys:v159 count:2];
  v272[78] = v25;
  v271[79] = @"SOCFThreshold";
  v157[0] = v4;
  v157[1] = v7;
  v158[0] = &unk_1F400DFA8;
  v158[1] = &unk_1F40149F8;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v158 forKeys:v157 count:2];
  v272[79] = v24;
  v271[80] = @"SOCAlarm";
  v155[0] = v4;
  v155[1] = v7;
  v156[0] = &unk_1F400DFA8;
  v156[1] = &unk_1F4014A10;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v156 forKeys:v155 count:2];
  v272[80] = v23;
  v271[81] = @"DynamicEntryStatus";
  v153[0] = v4;
  v153[1] = v7;
  v154[0] = &unk_1F400DFA8;
  v154[1] = &unk_1F4014A28;
  uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v154 forKeys:v153 count:2];
  v272[81] = v22;
  v271[82] = @"ShallowDischargeLevels";
  v151[0] = v4;
  v151[1] = v7;
  v152[0] = &unk_1F400DFA8;
  v152[1] = &unk_1F4014A40;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v152 forKeys:v151 count:2];
  v272[82] = v21;
  v271[83] = @"ShallowDischargeScore";
  v149[0] = v4;
  v149[1] = v7;
  v150[0] = &unk_1F400DFA8;
  v150[1] = &unk_1F4014A58;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v150 forKeys:v149 count:2];
  v272[83] = v20;
  v271[84] = @"ShallowDischargeFlag";
  v147[0] = v4;
  v147[1] = v7;
  v148[0] = &unk_1F400DFA8;
  v148[1] = &unk_1F4014A70;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v148 forKeys:v147 count:2];
  v272[84] = v19;
  v271[85] = @"TLCDuration";
  v145[0] = v4;
  v145[1] = v7;
  v146[0] = &unk_1F400DFA8;
  v146[1] = &unk_1F4014A88;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v146 forKeys:v145 count:2];
  v272[85] = v18;
  v271[86] = @"AverageAmperage";
  v143[0] = v4;
  v143[1] = v7;
  v144[0] = &unk_1F400DFA8;
  v144[1] = &unk_1F4014AA0;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v144 forKeys:v143 count:2];
  v272[86] = v8;
  v271[87] = @"DODatEOC";
  v141[0] = v4;
  v141[1] = v7;
  v142[0] = &unk_1F400DFA8;
  v142[1] = &unk_1F4014AB8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v142 forKeys:v141 count:2];
  v272[87] = v9;
  v271[88] = @"SOC1Voltage";
  v139[0] = v4;
  v139[1] = v7;
  v140[0] = &unk_1F400DFA8;
  v140[1] = &unk_1F4014AD0;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v140 forKeys:v139 count:2];
  v272[88] = v10;
  v271[89] = @"ChargerInhibitReason";
  v137[0] = v4;
  v137[1] = v7;
  v138[0] = &unk_1F400DFA8;
  v138[1] = &unk_1F4014AE8;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v138 forKeys:v137 count:2];
  v272[89] = v11;
  v271[90] = @"Dod0AtQualifiedQmax";
  v135[0] = v4;
  v135[1] = v7;
  v136[0] = &unk_1F400DFA8;
  v136[1] = &unk_1F4014B00;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v136 forKeys:v135 count:2];
  v272[90] = v12;
  v271[91] = @"SlowChargingReason";
  v133[0] = v4;
  v133[1] = v7;
  v134[0] = &unk_1F400DFA8;
  v134[1] = &unk_1F4014B18;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v134 forKeys:v133 count:2];
  v272[91] = v13;
  v271[92] = @"BatteryRsenseOpenCount";
  v131[0] = v4;
  v131[1] = v7;
  v132[0] = &unk_1F400DFA8;
  v132[1] = &unk_1F4014B30;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v132 forKeys:v131 count:2];
  v272[92] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v272 forKeys:v271 count:93];
  v277[1] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v277 forKeys:v276 count:2];

  return v16;
}

+ (id)entryEventBackwardDefinitionBatteryUI
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CF8];
  v15[0] = *MEMORY[0x1E4F92CD0];
  v15[1] = v2;
  v16[0] = &unk_1F4012368;
  v16[1] = &unk_1F400DF90;
  void v15[2] = *MEMORY[0x1E4F92CF0];
  void v16[2] = &unk_1F4012378;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E4F92CA8];
  v13[0] = @"Level";
  uint64_t v4 = *MEMORY[0x1E4F92D18];
  v11[0] = *MEMORY[0x1E4F92D10];
  v11[1] = v4;
  v12[0] = &unk_1F400DF78;
  v12[1] = @"%";
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v13[1] = @"IsCharging";
  v14[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v7 = objc_msgSend(v6, "commonTypeDict_BoolFormat");
  v14[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v18[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v9;
}

+ (id)entryEventBackwardDefinitionEABattery
{
  v87[2] = *MEMORY[0x1E4F143B8];
  if (+[PLBatteryAgent hasExternalAccessory])
  {
    v86[0] = *MEMORY[0x1E4F92C50];
    uint64_t v84 = *MEMORY[0x1E4F92CD0];
    v85 = &unk_1F4012428;
    v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
    v87[0] = v55;
    v86[1] = *MEMORY[0x1E4F92CA8];
    v82[0] = @"Battery Case Available Current";
    v54 = [MEMORY[0x1E4F929D8] sharedInstance];
    v53 = objc_msgSend(v54, "commonTypeDict_IntegerFormat");
    v83[0] = v53;
    v82[1] = @"Is Present";
    v52 = [MEMORY[0x1E4F929D8] sharedInstance];
    v51 = objc_msgSend(v52, "commonTypeDict_IntegerFormat");
    v83[1] = v51;
    v82[2] = @"Power Source State";
    v50 = [MEMORY[0x1E4F929D8] sharedInstance];
    v49 = objc_msgSend(v50, "commonTypeDict_StringFormat");
    v83[2] = v49;
    v82[3] = @"Name";
    v48 = [MEMORY[0x1E4F929D8] sharedInstance];
    v47 = objc_msgSend(v48, "commonTypeDict_StringFormat");
    v83[3] = v47;
    void v82[4] = @"Max Capacity";
    v46 = [MEMORY[0x1E4F929D8] sharedInstance];
    v45 = objc_msgSend(v46, "commonTypeDict_IntegerFormat_withUnit_mAh");
    v83[4] = v45;
    v82[5] = @"Current";
    v44 = [MEMORY[0x1E4F929D8] sharedInstance];
    v43 = objc_msgSend(v44, "commonTypeDict_IntegerFormat_withUnit_mA");
    v83[5] = v43;
    v82[6] = @"Voltage";
    uint64_t v42 = [MEMORY[0x1E4F929D8] sharedInstance];
    v41 = objc_msgSend(v42, "commonTypeDict_IntegerFormat_withUnit_mV");
    v83[6] = v41;
    v82[7] = @"Current Capacity";
    v40 = [MEMORY[0x1E4F929D8] sharedInstance];
    v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat_withUnit_mAh");
    v83[7] = v39;
    v82[8] = @"Transport Type";
    uint64_t v38 = [MEMORY[0x1E4F929D8] sharedInstance];
    v37 = objc_msgSend(v38, "commonTypeDict_StringFormat");
    v83[8] = v37;
    v82[9] = @"Is Charging";
    v36 = [MEMORY[0x1E4F929D8] sharedInstance];
    v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
    v83[9] = v35;
    v82[10] = @"Power Source ID";
    v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    v33 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
    v83[10] = v33;
    v82[11] = @"Time to Empty";
    uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
    v83[11] = v31;
    v82[12] = @"Type";
    uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    v29 = objc_msgSend(v30, "commonTypeDict_StringFormat");
    v83[12] = v29;
    v82[13] = @"Temperature";
    v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v83[13] = v27;
    v82[14] = @"AppleRawCurrentCapacity";
    uint64_t v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat_withUnit_mAh");
    v83[14] = v25;
    v82[15] = @"Battery Case Cumulative Current";
    uint64_t v3 = *MEMORY[0x1E4F92D18];
    v80[0] = *MEMORY[0x1E4F92D10];
    uint64_t v2 = v80[0];
    v80[1] = v3;
    v81[0] = &unk_1F400DFA8;
    v81[1] = @"As";
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:2];
    v83[15] = v24;
    v82[16] = @"IncomingVoltage";
    uint64_t v4 = *MEMORY[0x1E4F92CA0];
    v78[0] = v2;
    v78[1] = v4;
    v79[0] = &unk_1F400DFA8;
    v79[1] = &unk_1F4014B48;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:2];
    v83[16] = v23;
    v82[17] = @"IncomingCurrent";
    v76[0] = v2;
    v76[1] = v4;
    v77[0] = &unk_1F400DFA8;
    v77[1] = &unk_1F4014B60;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:2];
    v83[17] = v22;
    v82[18] = @"Cell0Voltage";
    v74[0] = v2;
    v74[1] = v4;
    v75[0] = &unk_1F400DFA8;
    v75[1] = &unk_1F4014B78;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:2];
    v83[18] = v21;
    v82[19] = @"Cell1Voltage";
    v72[0] = v2;
    v72[1] = v4;
    v73[0] = &unk_1F400DFA8;
    v73[1] = &unk_1F4014B90;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:2];
    v83[19] = v20;
    v82[20] = @"PowerStatus";
    v70[0] = v2;
    v70[1] = v4;
    v71[0] = &unk_1F400DFA8;
    v71[1] = &unk_1F4014BA8;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:2];
    v83[20] = v19;
    v82[21] = @"ChargingStatus";
    v68[0] = v2;
    v68[1] = v4;
    v69[0] = &unk_1F400DFA8;
    v69[1] = &unk_1F4014BC0;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:2];
    v83[21] = v18;
    v82[22] = @"InductiveStatus";
    v66[0] = v2;
    v66[1] = v4;
    v67[0] = &unk_1F400DFA8;
    v67[1] = &unk_1F4014BD8;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:2];
    v83[22] = v17;
    v82[23] = @"FamilyCode";
    uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v83[23] = v15;
    v82[24] = @"AvailablePower";
    v64[0] = v2;
    v64[1] = v4;
    v65[0] = &unk_1F400DFA8;
    v65[1] = &unk_1F4014BF0;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];
    v83[24] = v14;
    v82[25] = @"RxPowerLimit";
    v62[0] = v2;
    v62[1] = v4;
    v63[0] = &unk_1F400DFA8;
    v63[1] = &unk_1F4014C08;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:2];
    v83[25] = v5;
    v82[26] = @"ChargingCurrent";
    v60[0] = v2;
    v60[1] = v4;
    v61[0] = &unk_1F400DFA8;
    v61[1] = &unk_1F4014C20;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];
    v83[26] = v6;
    v82[27] = @"CycleCount";
    uint64_t v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v83[27] = v8;
    v82[28] = @"NominalChargeCapacity";
    v58[0] = v2;
    v58[1] = v4;
    v59[0] = &unk_1F400DFA8;
    v59[1] = &unk_1F4014C38;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];
    v83[28] = v9;
    v82[29] = @"ChargingVoltage";
    v56[0] = v2;
    v56[1] = v4;
    v57[0] = &unk_1F400DFA8;
    v57[1] = &unk_1F4014C50;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];
    v83[29] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:30];
    v87[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventPointDefinitionEABatteryConfig
{
  v91[2] = *MEMORY[0x1E4F143B8];
  if (+[PLBatteryAgent supportsAccConnectionLogging])
  {
    v90[0] = *MEMORY[0x1E4F92C50];
    uint64_t v88 = *MEMORY[0x1E4F92CD0];
    v89 = &unk_1F40123A8;
    v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
    v91[0] = v33;
    v90[1] = *MEMORY[0x1E4F92CA8];
    v86[0] = @"AttachCountType0";
    uint64_t v3 = *MEMORY[0x1E4F92CA0];
    v84[0] = *MEMORY[0x1E4F92D10];
    uint64_t v2 = v84[0];
    v84[1] = v3;
    v85[0] = &unk_1F400DFA8;
    v85[1] = &unk_1F4014C68;
    uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:2];
    v87[0] = v32;
    v86[1] = @"AttachCountType1";
    v82[0] = v2;
    v82[1] = v3;
    v83[0] = &unk_1F400DFA8;
    v83[1] = &unk_1F4014C80;
    v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:2];
    v87[1] = v31;
    void v86[2] = @"AttachCountType2";
    v80[0] = v2;
    v80[1] = v3;
    v81[0] = &unk_1F400DFA8;
    v81[1] = &unk_1F4014C98;
    uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:2];
    v87[2] = v30;
    v86[3] = @"AttachCountAdapter5";
    v78[0] = v2;
    v78[1] = v3;
    v79[0] = &unk_1F400DFA8;
    v79[1] = &unk_1F4014CB0;
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:2];
    v87[3] = v29;
    v86[4] = @"AttachCountAdapter7";
    v76[0] = v2;
    v76[1] = v3;
    v77[0] = &unk_1F400DFA8;
    v77[1] = &unk_1F4014CC8;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:2];
    void v87[4] = v28;
    v86[5] = @"AttachCountAdapter10";
    v74[0] = v2;
    v74[1] = v3;
    v75[0] = &unk_1F400DFA8;
    v75[1] = &unk_1F4014CE0;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:2];
    v87[5] = v27;
    v86[6] = @"AttachCountAdapter12";
    v72[0] = v2;
    v72[1] = v3;
    v73[0] = &unk_1F400DFA8;
    v73[1] = &unk_1F4014CF8;
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:2];
    v87[6] = v26;
    v86[7] = @"AttachCountAdapter15";
    v70[0] = v2;
    v70[1] = v3;
    v71[0] = &unk_1F400DFA8;
    v71[1] = &unk_1F4014D10;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:2];
    v87[7] = v25;
    v86[8] = @"AttachCountAdapter18";
    v68[0] = v2;
    v68[1] = v3;
    v69[0] = &unk_1F400DFA8;
    v69[1] = &unk_1F4014D28;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:2];
    v87[8] = v24;
    v86[9] = @"AttachCountAdapter20";
    v66[0] = v2;
    v66[1] = v3;
    v67[0] = &unk_1F400DFA8;
    v67[1] = &unk_1F4014D40;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:2];
    v87[9] = v23;
    v86[10] = @"QmaxCell0";
    v64[0] = v2;
    v64[1] = v3;
    v65[0] = &unk_1F400DFA8;
    v65[1] = &unk_1F4014D58;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];
    v87[10] = v22;
    v86[11] = @"QmaxCell1";
    v62[0] = v2;
    v62[1] = v3;
    v63[0] = &unk_1F400DFA8;
    v63[1] = &unk_1F4014D70;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:2];
    v87[11] = v21;
    v86[12] = @"MaximumTemperature";
    v60[0] = v2;
    v60[1] = v3;
    v61[0] = &unk_1F400DFA8;
    v61[1] = &unk_1F4014D88;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];
    v87[12] = v20;
    v86[13] = @"MinimumTemperature";
    v58[0] = v2;
    v58[1] = v3;
    v59[0] = &unk_1F400DFA8;
    v59[1] = &unk_1F4014DA0;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];
    v87[13] = v19;
    v86[14] = @"MaximumVoltageCell0";
    v56[0] = v2;
    v56[1] = v3;
    v57[0] = &unk_1F400DFA8;
    v57[1] = &unk_1F4014DB8;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];
    v87[14] = v18;
    v86[15] = @"MaximumVoltageCell1";
    v54[0] = v2;
    v54[1] = v3;
    v55[0] = &unk_1F400DFA8;
    v55[1] = &unk_1F4014DD0;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:2];
    v87[15] = v17;
    v86[16] = @"MinimumVoltageCell0";
    v52[0] = v2;
    v52[1] = v3;
    v53[0] = &unk_1F400DFA8;
    v53[1] = &unk_1F4014DE8;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];
    v87[16] = v16;
    v86[17] = @"MinimumVoltageCell1";
    v50[0] = v2;
    v50[1] = v3;
    v51[0] = &unk_1F400DFA8;
    v51[1] = &unk_1F4014E00;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];
    v87[17] = v15;
    v86[18] = @"MaximumChargeCurrent";
    v48[0] = v2;
    v48[1] = v3;
    v49[0] = &unk_1F400DFA8;
    v49[1] = &unk_1F4014E18;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];
    v87[18] = v14;
    v86[19] = @"MaximumDischargeCurrent";
    v46[0] = v2;
    v46[1] = v3;
    v47[0] = &unk_1F400DFA8;
    v47[1] = &unk_1F4014E30;
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
    v87[19] = v4;
    v86[20] = @"TimeBelowLowTemperature";
    v44[0] = v2;
    v44[1] = v3;
    v45[0] = &unk_1F400DFA8;
    v45[1] = &unk_1F4014E48;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
    v87[20] = v5;
    v86[21] = @"TimeAboveLowTemperature";
    v42[0] = v2;
    v42[1] = v3;
    v43[0] = &unk_1F400DFA8;
    v43[1] = &unk_1F4014E60;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
    v87[21] = v6;
    v86[22] = @"TimeAboveMedTemperature";
    v40[0] = v2;
    v40[1] = v3;
    v41[0] = &unk_1F400DFA8;
    v41[1] = &unk_1F4014E78;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
    v87[22] = v7;
    v86[23] = @"TimeAboveHighTemperature";
    v38[0] = v2;
    v38[1] = v3;
    v39[0] = &unk_1F400DFA8;
    v39[1] = &unk_1F4014E90;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
    v87[23] = v8;
    v86[24] = @"TotalOperatingTime";
    v36[0] = v2;
    v36[1] = v3;
    v37[0] = &unk_1F400DFA8;
    v37[1] = &unk_1F4014EA8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
    v87[24] = v9;
    v86[25] = @"KioskModeCount";
    v34[0] = v2;
    v34[1] = v3;
    v35[0] = &unk_1F400DFA8;
    v35[1] = &unk_1F4014EC0;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
    v87[25] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:26];
    v91[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionBTM
{
  void v28[2] = *MEMORY[0x1E4F143B8];
  if (+[PLBatteryAgent shouldLogBTM])
  {
    v27[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92C40];
    v25[0] = *MEMORY[0x1E4F92CD0];
    v25[1] = v2;
    v26[0] = &unk_1F40123E8;
    v26[1] = MEMORY[0x1E4F1CC38];
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
    v28[0] = v22;
    v27[1] = *MEMORY[0x1E4F92CA8];
    v23[0] = @"BTMProperty_TimestampforImax1";
    v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    v20 = objc_msgSend(v21, "commonTypeDict_DateFormat");
    v24[0] = v20;
    v23[1] = @"BTMProperty_OCVforImax";
    v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v24[1] = v18;
    void v23[2] = @"BTMProperty_Imax";
    v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    void v24[2] = v16;
    v23[3] = @"BTMProperty_VforImax";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v24[3] = v14;
    v23[4] = @"BTMProperty_TimestampforVmin1";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_DateFormat");
    void v24[4] = v4;
    v23[5] = @"BTMProperty_OCVforVmin";
    uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v24[5] = v6;
    v23[6] = @"BTMProperty_Vmin";
    uint64_t v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v24[6] = v8;
    v23[7] = @"BTMProperty_IforVmin";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v24[7] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:8];
    v28[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionTrustedBatteryHealth
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v18[0] = *MEMORY[0x1E4F92C50];
  uint64_t v16 = *MEMORY[0x1E4F92CD0];
  v17 = &unk_1F40123A8;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E4F92CA8];
  v14[0] = @"TrustedDataEnabled";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v15[0] = v3;
  v14[1] = @"TrustedDataFailedTimestamp";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_DateFormat");
  v15[1] = v5;
  void v14[2] = @"TrustedDataTimestamp";
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v7 = objc_msgSend(v6, "commonTypeDict_DateFormat");
  void v15[2] = v7;
  void v14[3] = @"TrustedDataFailedCount";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  void v15[3] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v19[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  return v11;
}

+ (id)entryEventBackwardDefinitionAdapter
{
  void v35[2] = *MEMORY[0x1E4F143B8];
  v34[0] = *MEMORY[0x1E4F92C50];
  uint64_t v32 = *MEMORY[0x1E4F92CD0];
  v33 = &unk_1F4012368;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  v35[0] = v29;
  v34[1] = *MEMORY[0x1E4F92CA8];
  v30[0] = @"AccumulatedAdapterEfficiencyLoss";
  v28 = [MEMORY[0x1E4F929D8] sharedInstance];
  v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
  v31[0] = v27;
  v30[1] = @"AccumulatedSystemLoad";
  uint64_t v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v31[1] = v25;
  v30[2] = @"AccumulatedSystemPowerIn";
  v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v31[2] = v23;
  v30[3] = @"AdapterEfficiencyLoss";
  uint64_t v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v31[3] = v21;
  v30[4] = @"AdapterEfficiencyLossAccumulatorCount";
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v31[4] = v19;
  v30[5] = @"SystemLoad";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v31[5] = v17;
  v30[6] = @"SystemLoadAccumulatorCount";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v31[6] = v15;
  v30[7] = @"SystemPowerIn";
  uint64_t v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v31[7] = v13;
  v30[8] = @"SystemPowerInAccumulatorCount";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v31[8] = v3;
  v30[9] = @"SystemInputVoltage";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v31[9] = v5;
  v30[10] = @"SystemInputCurrent";
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v31[10] = v7;
  void v30[11] = @"PowerTelemetryErrorCount";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  void v31[11] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:12];
  v35[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];

  return v11;
}

+ (id)entryEventBackwardDefinitionPowerOut
{
  void v57[2] = *MEMORY[0x1E4F143B8];
  v56[0] = *MEMORY[0x1E4F92C50];
  uint64_t v54 = *MEMORY[0x1E4F92CD0];
  v55 = &unk_1F40123B8;
  v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  v57[0] = v51;
  v56[1] = *MEMORY[0x1E4F92CA8];
  v52[0] = @"FilteredPower";
  v50 = [MEMORY[0x1E4F929D8] sharedInstance];
  v49 = objc_msgSend(v50, "commonTypeDict_IntegerFormat");
  v53[0] = v49;
  v52[1] = @"Current";
  v48 = [MEMORY[0x1E4F929D8] sharedInstance];
  v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
  v53[1] = v47;
  void v52[2] = @"AdapterVoltage";
  v46 = [MEMORY[0x1E4F929D8] sharedInstance];
  v45 = objc_msgSend(v46, "commonTypeDict_IntegerFormat");
  void v53[2] = v45;
  v52[3] = @"Watts";
  v44 = [MEMORY[0x1E4F929D8] sharedInstance];
  v43 = objc_msgSend(v44, "commonTypeDict_IntegerFormat");
  v53[3] = v43;
  v52[4] = @"ConfiguredCurrent";
  uint64_t v42 = [MEMORY[0x1E4F929D8] sharedInstance];
  v41 = objc_msgSend(v42, "commonTypeDict_IntegerFormat");
  v53[4] = v41;
  v52[5] = @"ConfiguredVoltage";
  v40 = [MEMORY[0x1E4F929D8] sharedInstance];
  v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat");
  v53[5] = v39;
  v52[6] = @"AccumulatedPower";
  uint64_t v38 = [MEMORY[0x1E4F929D8] sharedInstance];
  v37 = objc_msgSend(v38, "commonTypeDict_IntegerFormat");
  v53[6] = v37;
  v52[7] = @"AccumulatorCount";
  v36 = [MEMORY[0x1E4F929D8] sharedInstance];
  v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
  v53[7] = v35;
  v52[8] = @"AccumulatorErrorCount";
  v34 = [MEMORY[0x1E4F929D8] sharedInstance];
  v33 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
  v53[8] = v33;
  v52[9] = @"PortType";
  uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
  v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
  v53[9] = v31;
  v52[10] = @"PortIndex";
  uint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
  v29 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
  v53[10] = v29;
  v52[11] = @"VConnAccumulatedPower";
  v28 = [MEMORY[0x1E4F929D8] sharedInstance];
  v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
  v53[11] = v27;
  v52[12] = @"VConnMaxCurrent";
  uint64_t v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v53[12] = v25;
  v52[13] = @"VConnCurrent";
  v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v53[13] = v23;
  v52[14] = @"VConnAccumulatorErrorCount";
  uint64_t v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v53[14] = v21;
  v52[15] = @"VConnAccumulatorCount";
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v53[15] = v19;
  v52[16] = @"VConnPower";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v53[16] = v17;
  v52[17] = @"CPMSBudget";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v53[17] = v15;
  v52[18] = @"PowerState";
  uint64_t v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v53[18] = v13;
  v52[19] = @"PDPowermW";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v53[19] = v3;
  v52[20] = @"USBSleepPoolPowermW";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v53[20] = v5;
  v52[21] = @"USBWakePoolPowermW";
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v53[21] = v7;
  v52[22] = @"NumLDCMCollisions";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v53[22] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:23];
  v57[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];

  return v11;
}

+ (id)entryEventBackwardDefinitionCurrentAccumulator
{
  v21[2] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isiOS] & 1) != 0
    || [MEMORY[0x1E4F92A38] isWatch])
  {
    v20[0] = *MEMORY[0x1E4F92C50];
    uint64_t v18 = *MEMORY[0x1E4F92CD0];
    v19 = &unk_1F40123A8;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v21[0] = v15;
    v20[1] = *MEMORY[0x1E4F92CA8];
    v16[0] = @"CurrentAccumulator";
    uint64_t v14 = [MEMORY[0x1E4F929D8] sharedInstance];
    v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
    v17[0] = v13;
    v16[1] = @"CurrentAccumulatorCount";
    uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
    v17[1] = v3;
    void v16[2] = @"Cell1CurrentAccumulator";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    void v17[2] = v5;
    void v16[3] = @"Cell2CurrentAccumulator";
    uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    void v17[3] = v7;
    v16[4] = @"CellCurrentAccumulatorCount";
    v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v17[4] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
    v21[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventBackwardDefinitionChargingHeatMapA
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v18[0] = *MEMORY[0x1E4F92C50];
  uint64_t v16 = *MEMORY[0x1E4F92CD0];
  v17 = &unk_1F40123E8;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E4F92CA8];
  v14[0] = @"Temperature";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v15[0] = v3;
  v14[1] = @"Bin";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v15[1] = v5;
  void v14[2] = @"TimeInMinutes";
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  void v15[2] = v7;
  void v14[3] = @"HeatMapType";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  void v15[3] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v19[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  return v11;
}

+ (id)entryEventBackwardDefinitionChargingHeatMapB
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v18[0] = *MEMORY[0x1E4F92C50];
  uint64_t v16 = *MEMORY[0x1E4F92CD0];
  v17 = &unk_1F40123E8;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E4F92CA8];
  v14[0] = @"Temperature";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v15[0] = v3;
  v14[1] = @"Bin";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v15[1] = v5;
  void v14[2] = @"TimeInMinutes";
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  void v15[2] = v7;
  void v14[3] = @"HeatMapType";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  void v15[3] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v19[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  return v11;
}

+ (id)entryEventBackwardDefinitionDischargingHeatMap
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v18[0] = *MEMORY[0x1E4F92C50];
  uint64_t v16 = *MEMORY[0x1E4F92CD0];
  v17 = &unk_1F40123E8;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E4F92CA8];
  v14[0] = @"Temperature";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v15[0] = v3;
  v14[1] = @"Bin";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v15[1] = v5;
  void v14[2] = @"TimeInMinutes";
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  void v15[2] = v7;
  void v14[3] = @"HeatMapType";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  void v15[3] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v19[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  return v11;
}

+ (id)entryEventBackwardDefinitionKioskMode
{
  v31[2] = *MEMORY[0x1E4F143B8];
  v30[0] = *MEMORY[0x1E4F92C50];
  uint64_t v28 = *MEMORY[0x1E4F92CD0];
  v29 = &unk_1F40123A8;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  v31[0] = v25;
  v30[1] = *MEMORY[0x1E4F92CA8];
  v26[0] = @"KioskModeEntries";
  v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v27[0] = v23;
  v26[1] = @"KioskModeExits";
  uint64_t v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v27[1] = v21;
  void v26[2] = @"KioskModeResidency0";
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  void v27[2] = v19;
  v26[3] = @"KioskModeResidency1";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v27[3] = v17;
  void v26[4] = @"KioskModeResidency2";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v27[4] = v15;
  v26[5] = @"KioskModeResidency3";
  uint64_t v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v27[5] = v13;
  v26[6] = @"KioskModeHighSocResidency0";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v27[6] = v3;
  v26[7] = @"KioskModeHighSocResidency1";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v27[7] = v5;
  v26[8] = @"KioskModeHighSocResidency2";
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v27[8] = v7;
  v26[9] = @"KioskModeHighSocResidency3";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v27[9] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:10];
  v31[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

  return v11;
}

+ (id)entryEventBackwardDefinitionChargingLimit
{
  void v23[2] = *MEMORY[0x1E4F143B8];
  v22[0] = *MEMORY[0x1E4F92C50];
  uint64_t v20 = *MEMORY[0x1E4F92CD0];
  v21 = &unk_1F40123A8;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  v23[0] = v17;
  v22[1] = *MEMORY[0x1E4F92CA8];
  v18[0] = @"lastDOD0Update";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v19[0] = v15;
  v18[1] = @"lastFullChargeDate";
  uint64_t v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v19[1] = v13;
  void v18[2] = @"lastFullChargeReq";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_BoolFormat");
  v19[2] = v3;
  void v18[3] = @"lastQMaxUpdate";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  void v19[3] = v5;
  v18[4] = @"lastQualQMaxDate";
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v19[4] = v7;
  v18[5] = @"lastQualQmaxDODValue";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v19[5] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:6];
  v23[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

  return v11;
}

+ (id)entryAggregateDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"UILevel";
  uint64_t v2 = +[PLBatteryAgent entryAggregateDefinitionUILevel];
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryAggregateDefinitionUILevel
{
  void v24[4] = *MEMORY[0x1E4F143B8];
  v23[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CF8];
  v21[0] = *MEMORY[0x1E4F92CD0];
  v21[1] = v2;
  v22[0] = &unk_1F4012368;
  v22[1] = &unk_1F400DF90;
  v21[2] = *MEMORY[0x1E4F92CF0];
  void v22[2] = &unk_1F4012378;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  v24[0] = v3;
  v23[1] = *MEMORY[0x1E4F92CA8];
  v19[0] = @"Level";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v19[1] = @"energyConsumed";
  v20[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v20[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v24[1] = v8;
  void v23[2] = *MEMORY[0x1E4F92BE0];
  v17 = &unk_1F4012438;
  uint64_t v15 = *MEMORY[0x1E4F92BD8];
  uint64_t v16 = &unk_1F4012378;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  uint64_t v18 = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  void v24[2] = v10;
  v23[3] = *MEMORY[0x1E4F92BF0];
  v14[0] = @"Level";
  v14[1] = @"energyConsumed";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v24[3] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:4];

  return v12;
}

+ (id)defaults
{
  return &unk_1F40115E0;
}

- (void)updateLastChargeLevel:(int)a3 withTimestamp:(double)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F929C0];
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithDouble:a4];
  [v5 setObject:v6 forKey:@"lastChargingTimestamp" saveToDisk:1];

  uint64_t v7 = (void *)MEMORY[0x1E4F929C0];
  id v8 = [MEMORY[0x1E4F28ED0] numberWithInt:v4];
  [v7 setObject:v8 forKey:@"lastChargingValue" saveToDisk:1];
}

- (PLBatteryAgent)init
{
  if (+[PLUtilities hasBattery])
  {
    if (!+[PLUtilities isPowerlogHelperd])
    {
      v62.receiver = self;
      v62.super_class = (Class)PLBatteryAgent;
      uint64_t v3 = [(PLAgent *)&v62 init];
      uint64_t v4 = v3;
      if (!v3)
      {
LABEL_59:
        self = v4;
        v25 = self;
        goto LABEL_30;
      }
      v3->_lastUILevel = 0;
      v3->_presentMaxRa = -1;
      v3->_lifetimeMaxRa = -1;
      v3->_EAEnergyDrained = 0.0;
      v3->_EABatteryLevel = -1.0;
      lastkIOPSAppleBatteryCaseCumulativeCurrentKey = v3->_lastkIOPSAppleBatteryCaseCumulativeCurrentKey;
      v3->_lastkIOPSAppleBatteryCaseCumulativeCurrentKey = 0;

      v4->_isFirstTimeCheckingPingPong = 1;
      v4->_presentMaxRa = -1;
      v4->_lifetimeMaxRa = -1;
      v4->_prevConnectedState = 0;
      v4->_prevChargingState = 0;
      v4->_inPenaltyBox = 0;
      uint64_t v6 = [(PLBatteryAgent *)v4 getMitigatedUPOCountDefault];
      mitigatedUPOCount = v4->_mitigatedUPOCount;
      v4->_mitigatedUPOCount = (NSNumber *)v6;

      v4->_lifetimeDataLogged = 0;
      v4->_ppmEventLoggingCount = 0;
      lastBatteryConfigEntry = v4->_lastBatteryConfigEntry;
      v4->_lastBatteryConfigEntry = 0;

      lastDOD0 = v4->_lastDOD0;
      v4->_lastDOD0 = 0;

      lastVacVoltageLimit = v4->_lastVacVoltageLimit;
      v4->_lastVacVoltageLimit = 0;

      v4->_presentOCVCount = -1;
      v4->_presentOCV = -1;
      v4->_presentRaUpdateDisqualified = -1;
      v4->_presentQmaxUpdateDisqualified = -1;
      v4->_presentTimeSinceLastOCV = -1;
      v4->_shouldQueryForAccessory = 0;
      v4->_prevAccumulatorCount = 0.0;
      v4->_prevAccumulatorErrorCount = 0.0;
      v4->_prevAccumulatedPower = 0.0;
      v4->_deltaAccumulatorCount = 0.0;
      v4->_deltaAccumulatorErrorCount = 0.0;
      v4->_deltaAccumulatedPower = 0.0;
      v4->_powerOutTotalCount = 0.0;
      v4->_powerOutTotalPower = 0.0;
      v4->_filteredPower = 0.0;
      lastAdapterPower = v4->_lastAdapterPower;
      v4->_lastAdapterPower = 0;

      lastAdapterManufacturer = v4->_lastAdapterManufacturer;
      v4->_lastAdapterManufacturer = 0;

      [(PLBatteryAgent *)v4 setupCSMLogging];
      if (+[PLUtilities hasGasGauge]) {
        v4->_gasGaugeConsecutiveEmptyEntriesCount = 0;
      }
      if (+[PLBatteryAgent hasExternalAccessory])
      {
        uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
        trackedAccessories = v4->_trackedAccessories;
        v4->_trackedAccessories = (NSMutableArray *)v13;

        v4->_priIOAccessoryPowerMode = -1;
      }
      if (+[PLBatteryAgent hasWirelessCharger])
      {
        uint64_t v15 = [objc_alloc(MEMORY[0x1E4F92A00]) initWithOperator:v4 forService:@"AppleC26Charger" withBlock:&__block_literal_global_3339];
        chargerIOService = v4->_chargerIOService;
        v4->_chargerIOService = (PLIOKitOperatorComposition *)v15;

        if (+[PLBatteryAgent supportsAccConnectionLogging])
        {
          uint64_t v17 = [objc_alloc(MEMORY[0x1E4F92A00]) initWithOperator:0 forService:@"IOAccessoryDock0PinBuiltin"];
          magsafeIOService = v4->_magsafeIOService;
          v4->_magsafeIOService = (PLIOKitOperatorComposition *)v17;

          v19 = PLLogCommon();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
            [(PLBatteryAgent *)(id *)&v4->_magsafeIOService init];
          }

          [(PLBatteryAgent *)v4 setShouldLogEABatteryConfig:1];
        }
        [(PLBatteryAgent *)v4 setLastChargerEntry:0];
      }
      if (+[PLBatteryAgent hasChargingInfoLogging])
      {
        v4->_prevConnectedState = 0;
        v4->_prevChargingState = 0;
        v4->_inPenaltyBox = 0;
      }
      if (+[PLUtilities deviceRebooted]) {
        [MEMORY[0x1E4F929C0] setObject:0 forKey:@"LastPanicData" saveToDisk:1];
      }
      uint64_t v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryAgent init].cold.6();
      }

      -[PLBatteryAgent setIsTLCNotificationSurfaced:](v4, "setIsTLCNotificationSurfaced:", [MEMORY[0x1E4F929C0] BOOLForKey:@"kPLDefaultTLCNotificationSurfaced" ifNotSet:0]);
      v21 = PLLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryAgent init].cold.5(v4);
      }

      [(PLBatteryAgent *)v4 setSmartChargingEngaged:0];
      [(PLBatteryAgent *)v4 setCleanEnergyChargingEngaged:0];
      [(PLBatteryAgent *)v4 setLastTLCEntryStartTime:0];
      uint64_t v22 = PLLogCommon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        [(PLBatteryAgent *)v4 init];
      }

      if ([MEMORY[0x1E4F929C0] objectExistsForKey:@"BUI_DEMO_MODE"]) {
        uint64_t v23 = [MEMORY[0x1E4F929C0] BOOLForKey:@"BUI_DEMO_MODE"];
      }
      else {
        uint64_t v23 = 0;
      }
      [(PLBatteryAgent *)v4 setDemoMode:v23];
      v27 = PLLogCommon();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryAgent init](v4);
      }

      id v28 = objc_alloc(MEMORY[0x1E4F92A00]);
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      void v60[2] = __22__PLBatteryAgent_init__block_invoke_3352;
      v60[3] = &unk_1E6E4A260;
      self = v4;
      v61 = self;
      v29 = (PLIOKitOperatorComposition *)[v28 initWithOperator:self forService:@"IOPMPowerSource" withBlock:v60];
      iokitPowerSource = self->_iokitPowerSource;
      self->_iokitPowerSource = v29;

      if (self->_iokitPowerSource)
      {
        if (+[PLUtilities hasGasGauge]
          && ![(PLBatteryAgent *)self hasAppleSmartBattery])
        {
          id v32 = objc_alloc(MEMORY[0x1E4F92A80]);
          v33 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:20.0];
          v34 = [(PLOperator *)self workQueue];
          v58[0] = MEMORY[0x1E4F143A8];
          v58[1] = 3221225472;
          void v58[2] = __22__PLBatteryAgent_init__block_invoke_3414;
          v58[3] = &unk_1E6E489A8;
          v35 = self;
          v59 = v35;
          uint64_t v36 = [v32 initWithFireDate:v33 withInterval:1 withTolerance:0 repeats:v34 withUserInfo:v58 withQueue:20.0 withBlock:0.0];
          gasGaugeTimer = v35->_gasGaugeTimer;
          v35->_gasGaugeTimer = (PLTimer *)v36;

          [(PLBatteryAgent *)v35 setAllowGasGaugeRead:0];
          [(PLBatteryAgent *)v35 gasGaugeOpenAndStartLogging];
        }
        else
        {
          v31 = self->_gasGaugeTimer;
          self->_gasGaugeTimer = 0;

          [(PLBatteryAgent *)self setAllowGasGaugeRead:0];
        }
        if ([(PLOperator *)self isDebugEnabled])
        {
          uint64_t v38 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v38 addObserver:self selector:sel_fakeLogEntry_ name:@"PLBatteryAgent.fakeLogEntry" object:0];
        }
        BOOL v39 = +[PLBatteryAgent supportsAccConnectionLogging];
        v40 = [MEMORY[0x1E4F28EB8] defaultCenter];
        v41 = v40;
        if (v39)
        {
          [v40 addObserver:self selector:sel_accessoryConnectionEventNotification_ name:@"PLCAAccessoryAttachedNotification" object:0];

          uint64_t v42 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v42 addObserver:self selector:sel_accessoryDisconnectEventNotification_ name:@"PLCAAccessoryDetachedNotification" object:0];
        }
        else
        {
          [v40 addObserver:self selector:sel_accessoryConnected_ name:*MEMORY[0x1E4F258C0] object:0];

          v43 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v43 addObserver:self selector:sel_accessoryDisconnected_ name:*MEMORY[0x1E4F258C8] object:0];

          uint64_t v42 = [MEMORY[0x1E4F258F8] sharedAccessoryManager];
          [v42 registerForLocalNotifications];
        }

        if (+[PLBatteryAgent hasExternalAccessory])
        {
          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v44 = objc_opt_class();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __22__PLBatteryAgent_init__block_invoke_2_3436;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v44;
            if (init_defaultOnce_2 != -1) {
              dispatch_once(&init_defaultOnce_2, block);
            }
            if (init_classDebugEnabled_2)
            {
              v45 = [NSString stringWithFormat:@"Notification registered"];
              v46 = (void *)MEMORY[0x1E4F929B8];
              v47 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
              v48 = [v47 lastPathComponent];
              v49 = [NSString stringWithUTF8String:"-[PLBatteryAgent init]"];
              [v46 logMessage:v45 fromFile:v48 fromFunction:v49 fromLineNumber:3632];

              v50 = PLLogCommon();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
                __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
              }
            }
          }
          v51 = PLLogCommon();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
            -[PLBatteryAgent init]();
          }

          [(PLBatteryAgent *)self refreshEABatteryStatusTriggeredByConnectionEvent:0];
          v52 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"EABattery"];
          entryKeyEABattery = self->_entryKeyEABattery;
          self->_entryKeyEABattery = v52;

          uint64_t v54 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"EAPencilStats"];
          entryKeyEAPencilStats = self->_entryKeyEAPencilStats;
          self->_entryKeyEAPencilStats = v54;
        }
        if ([(PLOperator *)self isDebugEnabled])
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)pushConfigToAggd, @"com.apple.powerlogd.PLBatteryAgent.pushConfigToAggd", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
        }

        goto LABEL_59;
      }
    }
  }
  else
  {
    v24 = PLLogCommon();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4220000, v24, OS_LOG_TYPE_DEFAULT, "no battery detected", buf, 2u);
    }
  }
  v25 = 0;
LABEL_30:

  return v25;
}

void __22__PLBatteryAgent_init__block_invoke_3352(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == -536723200)
  {
    uint64_t v209 = v8;
    uint64_t v210 = v7;
    uint64_t v211 = v6;
    uint64_t v212 = v5;
    uint64_t v213 = v3;
    uint64_t v214 = v4;
    uint64_t v10 = (id *)(a1 + 32);
    v11 = *(void **)(a1 + 32);
    uint64_t v12 = +[PLEventBackwardBatteryEntry entryKey];
    [v11 timeIntervalSinceLastLogForEntryKey:v12];
    double v14 = v13;
    v207[0] = MEMORY[0x1E4F143A8];
    v207[1] = 3221225472;
    void v207[2] = __22__PLBatteryAgent_init__block_invoke_2;
    v207[3] = &unk_1E6E47848;
    id v208 = *v10;
    uint64_t v15 = v207;
    if (kPLBatteryAgentStringUserType_block_invoke_defaultOnce != -1) {
      dispatch_once(&kPLBatteryAgentStringUserType_block_invoke_defaultOnce, v15);
    }

    double v16 = *(double *)&kPLBatteryAgentStringUserType_block_invoke_objectForKey;
    int v17 = [MEMORY[0x1E4F929C0] debugEnabled];
    if (v14 > v16)
    {
      if (v17)
      {
        uint64_t v18 = objc_opt_class();
        v206[0] = MEMORY[0x1E4F143A8];
        v206[1] = 3221225472;
        void v206[2] = __22__PLBatteryAgent_init__block_invoke_3;
        v206[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v206[4] = v18;
        v19 = v206;
        if (kPLBatteryAgentStringUserType_block_invoke_defaultOnce_3354 != -1) {
          dispatch_once(&kPLBatteryAgentStringUserType_block_invoke_defaultOnce_3354, v19);
        }

        if (kPLBatteryAgentStringUserType_block_invoke_classDebugEnabled)
        {
          uint64_t v20 = NSString;
          id v21 = *v10;
          uint64_t v22 = +[PLEventBackwardBatteryEntry entryKey];
          [v21 timeIntervalSinceLastLogForEntryKey:v22];
          v24 = objc_msgSend(v20, "stringWithFormat:", @"kIOPMMessageBatteryStatusHasChanged ok for ratelimit %f", v23);

          v25 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
          v27 = [v26 lastPathComponent];
          id v28 = [NSString stringWithUTF8String:"-[PLBatteryAgent init]_block_invoke"];
          [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:3327];

          v29 = PLLogCommon();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
      id v30 = [MEMORY[0x1E4F92A00] snapshotFromIOEntry:a2];
      v31 = [*v10 logEventBackwardBatteryWithRawData:v30];
      if ([*v10 hasAppleSmartBattery]) {
        id v32 = @"ChargerStatus";
      }
      else {
        id v32 = @"ChargerRegisterStatus";
      }
      [v31 setObject:0 forKeyedSubscript:v32];
      [*v10 sampleBatteryEntryWithRawData:v30 andProperties:v31];
      if (([*v10 lifetimeDataLogged] & 1) != 0
        || ([*v10 shouldWaitForLifetimeDataWithRawData:v30] & 1) != 0)
      {
        if ([*v10 lifetimeDataLogged])
        {
LABEL_36:
          [*v10 logAdapterInfo:v30];
          [*v10 logPowerOutDetails:v30];
          [*v10 logAdapterDetails:v30];
          v52 = [MEMORY[0x1E4F1C9C8] monotonicDate];
          uint64_t v53 = [*v10 previousPortControllerRead];
          if (!v53
            || (uint64_t v54 = (void *)v53,
                [*v10 previousPortControllerRead],
                v55 = objc_claimAutoreleasedReturnValue(),
                [v52 timeIntervalSinceDate:v55],
                double v57 = v56,
                v55,
                v54,
                v57 >= 600.0))
          {
            [*v10 setPreviousPortControllerRead:v52];
            v58 = PLLogCommon();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
              __22__PLBatteryAgent_init__block_invoke_3352_cold_7();
            }

            [*v10 logPortControllerInfo:v30];
          }
          [*v10 logFedDetails:v30];
          [*v10 logEventPointBatteryPanicShutdown:v30];
          v59 = [v31 objectForKeyedSubscript:@"ExternalConnected"];
          if ([v59 BOOLValue])
          {
            uint64_t v60 = [v31 objectForKeyedSubscript:@"CurrentCapacity"];
            [v60 doubleValue];
            double v62 = v61 * 100.0;
            v63 = [v31 objectForKeyedSubscript:@"MaxCapacity"];
            [v63 doubleValue];
            BOOL v65 = v62 / v64 > 95.0;
          }
          else
          {
            BOOL v65 = 0;
          }

          if (([*v10 isFirstTimeCheckingPingPong] & 1) != 0
            || v65 != [*v10 isPingPongCharging])
          {
            v66 = (void *)MEMORY[0x1E4F1CBF0];
            if (v65) {
              v66 = &unk_1F4014ED8;
            }
            id v67 = v66;
            v68 = [MEMORY[0x1E4F92900] sharedInstance];
            v69 = [v31 entryDate];
            [v68 createQualificationEventForwardWithQualificationID:7 withChildNodeNames:v67 withStartDate:v69];

            [*v10 setIsPingPongCharging:v65];
            [*v10 setIsFirstTimeCheckingPingPong:0];
          }
          unint64_t v70 = 0x1E6E46000uLL;
          unsigned int v190 = a2;
          v189 = v52;
          if (+[PLBatteryAgent hasWirelessCharger])
          {
            v71 = [*v10 chargerIOService];
            v72 = [v71 properties];

            if (v72)
            {
              v73 = [v72 objectForKeyedSubscript:@"ConnectState"];

              if (v73)
              {
                v74 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ExternalCharger"];
                v75 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v74];
                uint64_t v76 = [v72 objectForKeyedSubscript:@"DeviceInfoInterfaceSerialNumber"];
                if (!v76)
                {
                  uint64_t v76 = [*v10 magsafeIOService];

                  if (v76)
                  {
                    v77 = [*v10 magsafeIOService];
                    v78 = [v77 properties];

                    uint64_t v76 = [v78 objectForKeyedSubscript:@"IOAccessoryAccessorySerialNumber"];
                  }
                }
                v79 = [v72 objectForKeyedSubscript:@"ConnectState"];
                v80 = +[PLBatteryAgent connectStateStringToEnum:v79];
                [v75 setObject:v80 forKeyedSubscript:@"ConnectState"];

                v81 = [v72 objectForKeyedSubscript:@"ResetCount"];
                [v75 setObject:v81 forKeyedSubscript:@"ResetCount"];

                v82 = [*v10 parseBatterySerialNumber:v76];
                v83 = [v82 objectForKeyedSubscript:@"eeee_code"];
                [v75 setObject:v83 forKeyedSubscript:@"EEEECode"];

                uint64_t v84 = [v72 objectForKeyedSubscript:@"Cloaked"];
                [v75 setObject:v84 forKeyedSubscript:@"Cloaked"];

                v85 = [v72 objectForKeyedSubscript:@"FWStatus"];
                [v75 setObject:v85 forKeyedSubscript:@"FWStatus"];

                v86 = [v72 objectForKeyedSubscript:@"LinkEfficiency"];
                [v75 setObject:v86 forKeyedSubscript:@"LinkEfficiency"];

                v87 = [v72 objectForKeyedSubscript:@"CloakReason"];
                [v75 setObject:v87 forKeyedSubscript:@"CloakReason"];

                uint64_t v88 = [v72 objectForKeyedSubscript:@"DeviceInfoChipVariant"];
                [v75 setObject:v88 forKeyedSubscript:@"DeviceInfoChipVariant"];

                v89 = [v72 objectForKeyedSubscript:@"DeviceInfoRegionCode"];
                [v75 setObject:v89 forKeyedSubscript:@"DeviceInfoRegionCode"];

                v90 = [v72 objectForKeyedSubscript:@"PuckClassification"];
                [v75 setObject:v90 forKeyedSubscript:@"PuckClassification"];

                v91 = [v72 objectForKeyedSubscript:@"HFPolicy"];
                [v75 setObject:v91 forKeyedSubscript:@"HFPolicy"];

                uint64_t v92 = [*v10 lastChargerEntry];
                if (!v92
                  || (v93 = (void *)v92,
                      int v94 = [*v10 modifiedExternalChargerEntry:v75],
                      v93,
                      v94))
                {
                  [*v10 logEntry:v75];
                }
                [*v10 setLastChargerEntry:v75];

                unint64_t v70 = 0x1E6E46000uLL;
              }
            }
          }
          uint64_t v95 = *MEMORY[0x1E4F92D28];
          v193 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"BatteryUI"];
          [*v10 EABatteryLevel];
          double v97 = v96;
          v98 = [v31 objectForKeyedSubscript:@"ExternalConnected"];
          unsigned int v99 = [v98 BOOLValue];
          if (v97 >= 1.0) {
            uint64_t v100 = 1;
          }
          else {
            uint64_t v100 = v99;
          }

          uint64_t v101 = [*v10 deviceIsPluggedIn];
          if (!v101) {
            goto LABEL_65;
          }
          v102 = (void *)v101;
          v103 = [*v10 deviceIsPluggedIn];
          int v104 = [v103 BOOLValue];

          BOOL v105 = v100 == v104;
          unint64_t v70 = 0x1E6E46000;
          if (!v105)
          {
LABEL_65:
            id v106 = *v10;
            v107 = [v31 entryDate];
            [v106 updateIntervalForType:1 withState:v100 andTime:v107];
          }
          v108 = [v31 objectForKeyedSubscript:@"TimeChargingThermallyLimited"];
          v109 = [*v10 TLCOverrideValue];

          if (v109)
          {
            v110 = PLLogCommon();
            if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG)) {
              __22__PLBatteryAgent_init__block_invoke_3352_cold_6((uint64_t)v108, v10, v110);
            }

            uint64_t v111 = [*v10 TLCOverrideValue];

            v108 = (void *)v111;
          }
          v112 = PLLogCommon();
          if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG)) {
            __22__PLBatteryAgent_init__block_invoke_3352_cold_5(v10, (uint64_t)v108, v112);
          }

          int v113 = [v108 intValue];
          v114 = [*v10 lastTLCCounter];
          BOOL v115 = v113 > (int)[v114 intValue];

          [*v10 setTlcIncreased:v115];
          if ([MEMORY[0x1E4F92A10] supportsSlowCharging])
          {
            v116 = [v31 objectForKeyedSubscript:@"AdapterPowerTier"];

            if (v116)
            {
              v191 = [v31 objectForKeyedSubscript:@"AdapterPowerTier"];
            }
            else
            {
              v191 = &unk_1F400E008;
            }
          }
          else
          {
            v191 = 0;
          }
          [*v10 handleCameraStreaming:v100 withProperties:v31];
          v117 = [*v10 lastTLCCounter];

          v192 = v108;
          if (v117)
          {
            uint64_t v118 = [*v10 tlcIncreased];
            id v119 = *v10;
            v120 = [v31 entryDate];
            [v119 updateIntervalForType:3 withState:v118 andTime:v120];

            v108 = v192;
          }
          int v121 = _os_feature_enabled_impl();
          v122 = PLLogCommon();
          BOOL v123 = os_log_type_enabled(v122, OS_LOG_TYPE_DEBUG);
          if (v121)
          {
            if (v123) {
              __22__PLBatteryAgent_init__block_invoke_3352_cold_3();
            }

            [*v10 handleTLCNotification:v30 externalConnected:v100];
          }
          else
          {
            if (v123) {
              __22__PLBatteryAgent_init__block_invoke_3352_cold_4();
            }
          }
          [*v10 setLastTLCCounter:v108];
          if (![MEMORY[0x1E4F92A10] supportsSlowCharging])
          {
LABEL_95:
            uint64_t v130 = [*v10 deviceIsPluggedIn];
            if (v130)
            {
              v131 = (void *)v130;
              v132 = [*v10 deviceIsPluggedIn];
              if (v100 == [v132 BOOLValue])
              {
                [*v10 timeIntervalSinceLastLogForEntryKey:v193];
                double v134 = v133;
                v199[0] = MEMORY[0x1E4F143A8];
                v199[1] = 3221225472;
                void v199[2] = __22__PLBatteryAgent_init__block_invoke_3393;
                v199[3] = &unk_1E6E47848;
                id v200 = *v10;
                v135 = v199;
                if (kPLBatteryAgentStringUserType_block_invoke_defaultOnce_3391 != -1) {
                  dispatch_once(&kPLBatteryAgentStringUserType_block_invoke_defaultOnce_3391, v135);
                }

                double v136 = *(double *)&kPLBatteryAgentStringUserType_block_invoke_objectForKey_3392;
                v137 = v192;
                if (v134 <= v136) {
                  goto LABEL_114;
                }
              }
              else
              {
              }
            }
            v138 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v193];
            v139 = [v31 objectForKeyedSubscript:@"Level"];
            uint64_t v140 = [v139 intValue];

            v141 = [*v10 deviceIsPluggedIn];

            if (v141)
            {
              if ((v100 & 1) == 0)
              {
                v142 = [*v10 deviceIsPluggedIn];
                int v143 = [v142 BOOLValue];

                if (v143)
                {
                  v144 = [v138 entryDate];
                  [v144 timeIntervalSince1970];
                  double v146 = v145;

                  [*v10 updateLastChargeLevel:v140 withTimestamp:v146];
                }
              }
            }
            else
            {
              v147 = [(id)objc_opt_class() entryKeyForType:v95 andName:@"BatteryUI"];
              v148 = [*v10 storage];
              v149 = [v148 lastEntryForKey:v147];

              if (v149)
              {
                v150 = [v149 objectForKeyedSubscript:@"IsCharging"];
                int v151 = [v150 BOOLValue];

                if (((v151 ^ 1 | v100) & 1) == 0)
                {
                  v152 = [MEMORY[0x1E4F1C9C8] monotonicDate];
                  [v152 timeIntervalSince1970];
                  double v154 = v153;

                  [*v10 updateLastChargeLevel:v140 withTimestamp:v154];
                }
              }
            }
            v155 = [MEMORY[0x1E4F28ED0] numberWithInt:v140];
            [v138 setObject:v155 forKeyedSubscript:@"Level"];

            v156 = [MEMORY[0x1E4F28ED0] numberWithBool:v100];
            [v138 setObject:v156 forKeyedSubscript:@"IsCharging"];

            v157 = PLLogCommon();
            if (os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1E4220000, v157, OS_LOG_TYPE_DEFAULT, "Updating level and plugged in status", buf, 2u);
            }

            [*v10 logEntry:v138];
            int v158 = [*v10 lastUILevel];
            uint64_t v159 = (v158 - v140);
            unint64_t v70 = 0x1E6E46000uLL;
            if (v158 - (int)v140 >= 0)
            {
              v160 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"UILevel"];
              v161 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v160];
              v162 = [MEMORY[0x1E4F28ED0] numberWithInt:v159];
              [v161 setObject:v162 forKeyedSubscript:@"Level"];

              [*v10 logEntry:v161];
              unint64_t v70 = 0x1E6E46000;
            }
            [*v10 setLastUILevel:v140];

            v137 = v192;
LABEL_114:
            v163 = [v30 objectForKeyedSubscript:@"CurrentCapacity"];
            [v163 doubleValue];
            double v165 = v164;

            v166 = [v30 objectForKeyedSubscript:@"MaxCapacity"];
            [v166 doubleValue];
            double v168 = v167;

            double v169 = 0.0;
            if (v168 > 0.0) {
              double v169 = v165 * 100.0 / v168;
            }
            [*v10 setBatteryLevelPercent:v169];
            v170 = [MEMORY[0x1E4F28ED0] numberWithBool:v100];
            [*v10 setDeviceIsPluggedIn:v170];

            id v171 = *v10;
            v172 = [v30 objectForKeyedSubscript:@"Voltage"];
            [v172 doubleValue];
            [v171 setRawBatteryVoltageVolt:v173 / 1000.0];

            if ([MEMORY[0x1E4F929C0] debugEnabled])
            {
              uint64_t v174 = objc_opt_class();
              v197[0] = MEMORY[0x1E4F143A8];
              v197[1] = 3221225472;
              void v197[2] = __22__PLBatteryAgent_init__block_invoke_3396;
              v197[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v197[4] = v174;
              v175 = v197;
              if (kPLBatteryAgentStringUserType_block_invoke_defaultOnce_3394 != -1) {
                dispatch_once(&kPLBatteryAgentStringUserType_block_invoke_defaultOnce_3394, v175);
              }

              if (kPLBatteryAgentStringUserType_block_invoke_classDebugEnabled_3395)
              {
                v176 = NSString;
                [*v10 rawBatteryVoltageVolt];
                v178 = objc_msgSend(v176, "stringWithFormat:", @"rawBatteryVoltageVolt: %f", v177);
                v179 = (void *)MEMORY[0x1E4F929B8];
                v180 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
                v181 = [v180 lastPathComponent];
                v182 = [NSString stringWithUTF8String:"-[PLBatteryAgent init]_block_invoke_2"];
                [v179 logMessage:v178 fromFile:v181 fromFunction:v182 fromLineNumber:3570];

                v183 = PLLogCommon();
                if (os_log_type_enabled(v183, OS_LOG_TYPE_DEBUG)) {
                  __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
                }

                unint64_t v70 = 0x1E6E46000uLL;
                v137 = v192;
              }
            }
            if ([*v10 hasAppleSmartBattery]) {
              [*v10 logCurrentAccumulatorWithRawData:v30];
            }
            if ([*(id *)(v70 + 3016) hasChargingInfoLogging])
            {
              [*v10 checkChargingInfoChange:v30];
              v184 = [MEMORY[0x1E4F92A00] snapshotFromIOEntry:v190 forKey:@"ChargingParameters"];
              v185 = (void *)[v184 mutableCopy];

              v186 = [v30 objectForKeyedSubscript:@"InductiveData"];
              v187 = [v186 objectForKeyedSubscript:@"FirmwareMode"];
              [v185 setObject:v187 forKeyedSubscript:@"InductiveFWMode"];

              [*v10 logEventPointChargingInfoWithChargingData:v185];
            }
            if ([*(id *)(v70 + 3016) supportsAccConnectionLogging])
            {
              if ([*v10 shouldQueryForAccessory])
              {
                v188 = [*v10 workQueue];
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __22__PLBatteryAgent_init__block_invoke_3404;
                block[3] = &unk_1E6E47848;
                id v196 = *v10;
                dispatch_async(v188, block);
              }
            }

LABEL_131:
            return;
          }
          int v124 = [v191 intValue];
          if (v124 == 1)
          {
            id v125 = *v10;
            v126 = [v31 entryDate];
            v127 = v125;
            uint64_t v128 = 1;
          }
          else
          {
            if ((v124 & 0xFFFFFFFD) != 0)
            {
              v126 = PLLogCommon();
              if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR)) {
                __22__PLBatteryAgent_init__block_invoke_3352_cold_2();
              }
              goto LABEL_94;
            }
            id v129 = *v10;
            v126 = [v31 entryDate];
            v127 = v129;
            uint64_t v128 = 0;
          }
          [v127 updateIntervalForType:9 withState:v128 andTime:v126];
LABEL_94:

          goto LABEL_95;
        }
        v33 = PLLogCommon();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          __22__PLBatteryAgent_init__block_invoke_3352_cold_8();
        }
      }
      else
      {
        v33 = [MEMORY[0x1E4F929C0] objectForKey:@"overrideBatteryData"];
        if (v33)
        {
          uint64_t v43 = [*v10 overrideBatteryData:v30 withPath:v33];

          id v30 = (id)v43;
        }
        v203[0] = MEMORY[0x1E4F143A8];
        v203[1] = 3221225472;
        void v203[2] = __22__PLBatteryAgent_init__block_invoke_3364;
        v203[3] = &unk_1E6E47EB8;
        id v204 = *v10;
        id v30 = v30;
        id v205 = v30;
        uint64_t v44 = v203;
        if (kPLBatteryAgentStringUserType_block_invoke_once != -1) {
          dispatch_once(&kPLBatteryAgentStringUserType_block_invoke_once, v44);
        }

        v45 = PLLogCommon();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
          __22__PLBatteryAgent_init__block_invoke_3352_cold_9();
        }

        [*v10 setLifetimeDataLogged:1];
        if (+[PLUtilities deviceRebooted]) {
          [*v10 logEventPointBatteryTrapInfo:v30];
        }
        [*v10 defaultDoubleForKey:@"AggdTimerBatteryConfig"];
        double v47 = v46;
        id v48 = objc_alloc(MEMORY[0x1E4F92A80]);
        v49 = [MEMORY[0x1E4F1C9C8] monotonicDateWithTimeIntervalSinceNow:v47];
        v50 = [*v10 workQueue];
        v201[0] = MEMORY[0x1E4F143A8];
        v201[1] = 3221225472;
        void v201[2] = __22__PLBatteryAgent_init__block_invoke_3367;
        v201[3] = &unk_1E6E489A8;
        id v202 = *v10;
        v51 = (void *)[v48 initWithFireDate:v49 withInterval:1 withTolerance:0 repeats:v50 withUserInfo:v201 withQueue:v47 withBlock:0.0];
        [*v10 setPeriodicAggdTimer:v51];
      }
      goto LABEL_36;
    }
    if (v17)
    {
      uint64_t v34 = objc_opt_class();
      v194[0] = MEMORY[0x1E4F143A8];
      v194[1] = 3221225472;
      void v194[2] = __22__PLBatteryAgent_init__block_invoke_3410;
      v194[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v194[4] = v34;
      if (kPLBatteryAgentStringUserType_block_invoke_defaultOnce_3408 != -1) {
        dispatch_once(&kPLBatteryAgentStringUserType_block_invoke_defaultOnce_3408, v194);
      }
      if (kPLBatteryAgentStringUserType_block_invoke_classDebugEnabled_3409)
      {
        v35 = NSString;
        id v36 = *v10;
        v37 = +[PLEventBackwardBatteryEntry entryKey];
        [v36 timeIntervalSinceLastLogForEntryKey:v37];
        objc_msgSend(v35, "stringWithFormat:", @"kIOPMMessageBatteryStatusHasChanged ignored due to ratelimit %f", v38);
        id v30 = (id)objc_claimAutoreleasedReturnValue();

        BOOL v39 = (void *)MEMORY[0x1E4F929B8];
        v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
        v41 = [v40 lastPathComponent];
        uint64_t v42 = [NSString stringWithUTF8String:"-[PLBatteryAgent init]_block_invoke_2"];
        [v39 logMessage:v30 fromFile:v41 fromFunction:v42 fromLineNumber:3598];

        v31 = PLLogCommon();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
        goto LABEL_131;
      }
    }
  }
}

uint64_t __22__PLBatteryAgent_init__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultDoubleForKey:@"RateLimiterBattery"];
  kPLBatteryAgentStringUserType_block_invoke_objectForKey = v2;
  return result;
}

uint64_t __22__PLBatteryAgent_init__block_invoke_3(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLBatteryAgentStringUserType_block_invoke_classDebugEnabled = result;
  return result;
}

uint64_t __22__PLBatteryAgent_init__block_invoke_3364(uint64_t a1)
{
  return [*(id *)(a1 + 32) logEventNoneBatteryConfigWithRawData:*(void *)(a1 + 40)];
}

uint64_t __22__PLBatteryAgent_init__block_invoke_3367(uint64_t a1)
{
  return [*(id *)(a1 + 32) aggdTimerFired];
}

uint64_t __22__PLBatteryAgent_init__block_invoke_3393(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultDoubleForKey:@"RateLimiterBatteryUI"];
  kPLBatteryAgentStringUserType_block_invoke_objectForKey_3392 = v2;
  return result;
}

uint64_t __22__PLBatteryAgent_init__block_invoke_3396(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLBatteryAgentStringUserType_block_invoke_classDebugEnabled_3395 = result;
  return result;
}

void __22__PLBatteryAgent_init__block_invoke_3404(uint64_t a1)
{
  uint64_t v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __22__PLBatteryAgent_init__block_invoke_3404_cold_2();
  }

  [*(id *)(a1 + 32) refreshEABatteryStatusTriggeredByConnectionEvent:1];
  uint64_t v3 = [*(id *)(a1 + 32) trackedAccessories];
  int v4 = [v3 containsObject:@"1452-5017"];

  if (v4)
  {
    [*(id *)(a1 + 32) setShouldQueryForAccessory:0];
    uint64_t v5 = PLLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __22__PLBatteryAgent_init__block_invoke_3404_cold_1();
    }
  }
}

uint64_t __22__PLBatteryAgent_init__block_invoke_3410(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLBatteryAgentStringUserType_block_invoke_classDebugEnabled_3409 = result;
  return result;
}

uint64_t __22__PLBatteryAgent_init__block_invoke_3414(uint64_t a1)
{
  return [*(id *)(a1 + 32) logEventIntervalGasGauge];
}

uint64_t __22__PLBatteryAgent_init__block_invoke_2_3436(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  init_classDebugEnabled_2 = result;
  return result;
}

- (void)dealloc
{
  if (!+[PLUtilities isPowerlogHelperd])
  {
    [(PLBatteryAgent *)self gasGaugeStopLoggingAndClose];
    if (!+[PLBatteryAgent supportsAccConnectionLogging])
    {
      uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v3 removeObserver:self name:*MEMORY[0x1E4F258C0] object:0];

      int v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v4 removeObserver:self name:*MEMORY[0x1E4F258C8] object:0];

      uint64_t v5 = [MEMORY[0x1E4F258F8] sharedAccessoryManager];
      [v5 unregisterForLocalNotifications];
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)PLBatteryAgent;
  [(PLAgent *)&v6 dealloc];
}

- (BOOL)hasAppleSmartBattery
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__PLBatteryAgent_hasAppleSmartBattery__block_invoke;
  block[3] = &unk_1E6E47848;
  void block[4] = self;
  if (hasAppleSmartBattery_onceToken != -1) {
    dispatch_once(&hasAppleSmartBattery_onceToken, block);
  }
  return hasAppleSmartBattery_hasASM;
}

void __38__PLBatteryAgent_hasAppleSmartBattery__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) iokitPowerSource];
  uint64_t v2 = (__CFString *)IOObjectCopyClass([v1 service]);

  hasAppleSmartBattery_hasASM = [(__CFString *)v2 isEqualToString:@"AppleSmartBattery"];
}

- (BOOL)modifiedExternalChargerEntry:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [v3 keys];
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v4) {
    goto LABEL_16;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v22 != v6) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void *)(*((void *)&v21 + 1) + 8 * i);
      v9 = [v3 objectForKeyedSubscript:v8];
      if (v9)
      {
      }
      else
      {
        uint64_t v10 = [(PLEntry *)self->_lastChargerEntry objectForKeyedSubscript:v8];

        if (!v10) {
          continue;
        }
      }
      v11 = [v3 objectForKeyedSubscript:v8];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v12 = [(PLEntry *)self->_lastChargerEntry objectForKeyedSubscript:v8];
        char v13 = objc_opt_respondsToSelector();

        if (v13)
        {
          double v14 = [v3 objectForKeyedSubscript:v8];
          uint64_t v15 = [(PLEntry *)self->_lastChargerEntry objectForKeyedSubscript:v8];
          uint64_t v16 = [v14 compare:v15];

          if (v16)
          {
            BOOL v17 = 1;
            goto LABEL_17;
          }
        }
      }
      else
      {
      }
    }
    uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v5);
LABEL_16:
  BOOL v17 = 0;
LABEL_17:

  return v17;
}

+ (BOOL)hasChargingInfoLogging
{
  if (hasChargingInfoLogging_onceToken != -1) {
    dispatch_once(&hasChargingInfoLogging_onceToken, &__block_literal_global_3451);
  }
  return hasChargingInfoLogging_result;
}

uint64_t __40__PLBatteryAgent_hasChargingInfoLogging__block_invoke()
{
  hasChargingInfoLogging_uint64_t result = 0;
  if ([MEMORY[0x1E4F92A38] isWatch]
    && (objc_msgSend(MEMORY[0x1E4F92A38], "kPLDeviceClassIsOneOf:", 200007, 200008, 200009, 200010, 0) & 1) == 0)
  {
    hasChargingInfoLogging_uint64_t result = 1;
  }
  uint64_t result = +[PLBatteryAgent hasWirelessCharger];
  if (result)
  {
    uint64_t result = [MEMORY[0x1E4F92A38] isiOS];
    if (hasChargingInfoLogging_result) {
      char v1 = 1;
    }
    else {
      char v1 = result;
    }
  }
  else
  {
    char v1 = 0;
  }
  hasChargingInfoLogging_uint64_t result = v1;
  return result;
}

- (void)handleTLCNotification:(id)a3 externalConnected:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(PLBatteryAgent *)self lastTLCEntryStartTime];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    uint64_t v8 = [(PLBatteryAgent *)self lastTLCEntryStartTime];
    [v7 timeIntervalSinceDate:v8];
    double v10 = v9;
  }
  else
  {
    double v10 = 0.0;
  }
  if ([(PLBatteryAgent *)self demoMode])
  {
    v11 = [MEMORY[0x1E4F929C0] objectForKey:@"BUICTL_TLCAggregatedCounter"];
    uint64_t v12 = v11;
    if (v11)
    {
      double v10 = (double)(int)[v11 intValue];
      char v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 134217984;
        double v15 = v10;
        _os_log_impl(&dword_1E4220000, v13, OS_LOG_TYPE_DEFAULT, "Overriding TLC duration from BUICTL to: %f", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  [(PLBatteryAgent *)self showOrHideTLCNotification:v4 timeInTLC:v10];
}

- (void)showOrHideTLCNotification:(BOOL)a3 timeInTLC:(double)a4
{
  BOOL v5 = a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    BOOL v16 = [(PLBatteryAgent *)self isTLCNotificationSurfaced];
    [(PLBatteryAgent *)self batteryLevelPercent];
    v36[0] = 67110144;
    v36[1] = v5;
    __int16 v37 = 1024;
    BOOL v38 = v16;
    __int16 v39 = 2048;
    double v40 = a4;
    __int16 v41 = 2048;
    uint64_t v42 = v17;
    __int16 v43 = 1024;
    BOOL v44 = [(PLBatteryAgent *)self smartChargingEngaged];
    _os_log_debug_impl(&dword_1E4220000, v7, OS_LOG_TYPE_DEBUG, "TLC: External Connected: %d  TLC notification surfaced: %d  TLC aggregated time: %f   Battery Level: %f  OBC Engaged: %d", (uint8_t *)v36, 0x28u);
  }

  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryAgent showOrHideTLCNotification:timeInTLC:]3(self);
  }

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(PLBatteryAgent *)self batteryLevelPercent];
  char v11 = v10 >= 95.0 || !v5;
  if (a4 < 960.0
    || (v11 & 1) != 0
    || [(PLBatteryAgent *)self isTLCNotificationSurfaced]
    || [(PLBatteryAgent *)self smartChargingEngaged])
  {
    if (![(PLBatteryAgent *)self isTLCNotificationSurfaced])
    {
      char v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryAgent showOrHideTLCNotification:timeInTLC:]1();
      }
      goto LABEL_54;
    }
    if (v11)
    {
      BOOL v12 = 1;
    }
    else
    {
      BOOL v14 = [(PLBatteryAgent *)self smartChargingEngaged];
      BOOL v12 = 1;
      if (a4 >= 960.0 && !v14 && ![(PLBatteryAgent *)self cleanEnergyChargingEngaged])
      {
        if ([(PLBatteryAgent *)self fixedChargingEngaged]) {
          BOOL v12 = [(PLBatteryAgent *)self smartChargingEngaged];
        }
        else {
          BOOL v12 = 0;
        }
      }
    }
    uint64_t v18 = PLLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryAgent showOrHideTLCNotification:timeInTLC:]0(v12, v18, v19);
    }

    char v13 = PLLogCommon();
    BOOL v20 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    if (!v12)
    {
      if (v20) {
        -[PLBatteryAgent showOrHideTLCNotification:timeInTLC:].cold.9();
      }
      goto LABEL_54;
    }
    if (v20) {
      -[PLBatteryAgent showOrHideTLCNotification:timeInTLC:].cold.8();
    }

    [v9 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"ShowTLCNotification"];
LABEL_33:
    AnalyticsSendEventLazy();
    long long v21 = PLLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryAgent showOrHideTLCNotification:timeInTLC:].cold.7();
    }

    long long v22 = PLQueryRegistered();
    char v13 = v22;
    if (v22
      && ([v22 objectForKeyedSubscript:@"TLCNotificationState"],
          long long v23 = objc_claimAutoreleasedReturnValue(),
          v23,
          v23))
    {
      long long v24 = PLLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryAgent showOrHideTLCNotification:timeInTLC:].cold.6();
      }

      v25 = [v13 objectForKeyedSubscript:@"TLCNotificationState"];
      uint64_t v26 = PLLogCommon();
      v27 = v26;
      if (v25)
      {
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          -[PLBatteryAgent showOrHideTLCNotification:timeInTLC:].cold.5(v25);
        }

        [(PLBatteryAgent *)self setIsTLCNotificationSurfaced:[v25 BOOLValue]];
        id v28 = PLLogCommon();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          -[PLBatteryAgent showOrHideTLCNotification:timeInTLC:].cold.4(v25);
        }

        [MEMORY[0x1E4F929C0] setObject:v25 forKey:@"kPLDefaultTLCNotificationSurfaced" saveToDisk:1];
        v27 = PLLogCommon();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          -[PLBatteryAgent showOrHideTLCNotification:timeInTLC:]();
        }
      }
      else if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        -[PLBatteryAgent showOrHideTLCNotification:timeInTLC:](v27, v29, v30, v31, v32, v33, v34, v35);
      }
    }
    else
    {
      v25 = PLLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryAgent showOrHideTLCNotification:timeInTLC:]();
      }
    }

LABEL_54:
    goto LABEL_55;
  }
  if (![(PLBatteryAgent *)self cleanEnergyChargingEngaged])
  {
    double v15 = PLLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryAgent showOrHideTLCNotification:timeInTLC:]2();
    }

    [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ShowTLCNotification"];
    goto LABEL_33;
  }
LABEL_55:
}

void *__54__PLBatteryAgent_showOrHideTLCNotification_timeInTLC___block_invoke()
{
  return &unk_1F4011608;
}

void *__54__PLBatteryAgent_showOrHideTLCNotification_timeInTLC___block_invoke_3477()
{
  return &unk_1F4011630;
}

- (void)refreshEABatteryStatusTriggeredByConnectionEvent:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[PLBatteryAgent hasExternalAccessory])
  {
    BOOL v5 = [(PLBatteryAgent *)self isEABatteryConnectedNow];
    uint64_t v6 = [(PLBatteryAgent *)self trackedAccessories];
    uint64_t v7 = v6;
    if (v5)
    {
      [v6 addObject:@"1452-5013"];

      uint64_t v8 = [(PLBatteryAgent *)self trackedAccessories];
      [v8 addObject:@"1452-5016"];

      id v9 = [(PLBatteryAgent *)self trackedAccessories];
      [v9 addObject:@"1452-5017"];
    }
    else
    {
      [v6 removeObject:@"1452-5013"];

      double v10 = [(PLBatteryAgent *)self trackedAccessories];
      [v10 removeObject:@"1452-5016"];

      char v11 = [(PLBatteryAgent *)self trackedAccessories];
      [v11 removeObject:@"1452-5017"];

      [(PLBatteryAgent *)self setEABatteryLevel:-1.0];
    }
    if (![(PLBatteryAgent *)self isEAPencilConnectedNow])
    {
      BOOL v12 = [(PLBatteryAgent *)self trackedAccessories];
      [v12 removeObject:@"76-546"];
    }
    char v13 = [(PLBatteryAgent *)self trackedAccessories];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      [(PLBatteryAgent *)self setupEALoggingTriggeredByConnectionEvent:v3];
    }
    else
    {
      [(PLBatteryAgent *)self cancelEALogging];
    }
  }
}

- (void)setupEALoggingTriggeredByConnectionEvent:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[PLBatteryAgent hasExternalAccessory])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v5 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59__PLBatteryAgent_setupEALoggingTriggeredByConnectionEvent___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v5;
      if (setupEALoggingTriggeredByConnectionEvent__defaultOnce != -1) {
        dispatch_once(&setupEALoggingTriggeredByConnectionEvent__defaultOnce, block);
      }
      if (setupEALoggingTriggeredByConnectionEvent__classDebugEnabled)
      {
        uint64_t v6 = [NSString stringWithFormat:@"In Setup EA Logging"];
        uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
        id v9 = [v8 lastPathComponent];
        double v10 = [NSString stringWithUTF8String:"-[PLBatteryAgent setupEALoggingTriggeredByConnectionEvent:]"];
        [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:3852];

        char v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    if (v3)
    {
      BOOL v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryAgent setupEALoggingTriggeredByConnectionEvent:]();
      }

      [(PLBatteryAgent *)self logEABatteryConnectedEventToAnalyticsIgnoreLastLogTimestamp:1];
    }
    char v13 = [(PLBatteryAgent *)self EABatteryTimer];

    if (!v13)
    {
      [(PLBatteryAgent *)self logEABatteryConnectedEventToAnalyticsIgnoreLastLogTimestamp:0];
      id v14 = objc_alloc(MEMORY[0x1E4F92A80]);
      double v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:20.0];
      BOOL v16 = [(PLOperator *)self workQueue];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      void v33[2] = __59__PLBatteryAgent_setupEALoggingTriggeredByConnectionEvent___block_invoke_3505;
      v33[3] = &unk_1E6E489A8;
      void v33[4] = self;
      uint64_t v17 = (void *)[v14 initWithFireDate:v15 withInterval:1 withTolerance:0 repeats:v16 withUserInfo:v33 withQueue:20.0 withBlock:0.0];
      [(PLBatteryAgent *)self setEABatteryTimer:v17];

      [(PLOperator *)self defaultDoubleForKey:@"B244SBCInterval"];
      double v19 = v18;
      BOOL v20 = (void *)MEMORY[0x1E4F92A18];
      long long v21 = objc_msgSend(MEMORY[0x1E4F1C9C8], "monotonicDateWithTimeIntervalSinceNow:");
      long long v22 = [(PLOperator *)self workQueue];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      void v32[2] = __59__PLBatteryAgent_setupEALoggingTriggeredByConnectionEvent___block_invoke_2;
      v32[3] = &unk_1E6E48B20;
      v32[4] = self;
      long long v23 = [v20 scheduledTimerWithMonotonicFireDate:v21 withInterval:v22 withQueue:v32 withBlock:v19];
      [(PLBatteryAgent *)self setSignificantBatteryChangeTimer:v23];
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v24 = objc_opt_class();
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __59__PLBatteryAgent_setupEALoggingTriggeredByConnectionEvent___block_invoke_3;
      v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void v31[4] = v24;
      if (setupEALoggingTriggeredByConnectionEvent__defaultOnce_3515 != -1) {
        dispatch_once(&setupEALoggingTriggeredByConnectionEvent__defaultOnce_3515, v31);
      }
      if (setupEALoggingTriggeredByConnectionEvent__classDebugEnabled_3516)
      {
        v25 = [NSString stringWithFormat:@"In Setup EA Logging: Done"];
        uint64_t v26 = (void *)MEMORY[0x1E4F929B8];
        v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
        id v28 = [v27 lastPathComponent];
        uint64_t v29 = [NSString stringWithUTF8String:"-[PLBatteryAgent setupEALoggingTriggeredByConnectionEvent:]"];
        [v26 logMessage:v25 fromFile:v28 fromFunction:v29 fromLineNumber:3878];

        uint64_t v30 = PLLogCommon();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
  }
}

uint64_t __59__PLBatteryAgent_setupEALoggingTriggeredByConnectionEvent___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  setupEALoggingTriggeredByConnectionEvent__classDebugEnabled = result;
  return result;
}

uint64_t __59__PLBatteryAgent_setupEALoggingTriggeredByConnectionEvent___block_invoke_3505(uint64_t a1)
{
  return [*(id *)(a1 + 32) logEABatteryStatistics];
}

void __59__PLBatteryAgent_setupEALoggingTriggeredByConnectionEvent___block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  BOOL v4 = @"entry";
  uint64_t v2 = [MEMORY[0x1E4F1CA98] null];
  v5[0] = v2;
  BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  +[PLUtilities postNotificationName:@"PLBatteryAgent_EventBackward_Battery.filtered.Level_0_1.Level_7_1800.Level_8_300" object:v1 userInfo:v3];
}

uint64_t __59__PLBatteryAgent_setupEALoggingTriggeredByConnectionEvent___block_invoke_3(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  setupEALoggingTriggeredByConnectionEvent__classDebugEnabled_3516 = result;
  return result;
}

- (void)cancelEALogging
{
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    id v28 = __33__PLBatteryAgent_cancelEALogging__block_invoke;
    uint64_t v29 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v30 = v3;
    if (cancelEALogging_defaultOnce != -1) {
      dispatch_once(&cancelEALogging_defaultOnce, &block);
    }
    if (cancelEALogging_classDebugEnabled)
    {
      BOOL v4 = [NSString stringWithFormat:@"In Cancel EA Logging"];
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      uint64_t v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLBatteryAgent cancelEALogging]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:3884];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  double v10 = [(PLBatteryAgent *)self EABatteryTimer];

  if (v10)
  {
    [(PLBatteryAgent *)self logEABatteryConnectedTimeToAnalyticsWithEAConnectionState:1];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v11 = objc_opt_class();
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      long long v23 = __33__PLBatteryAgent_cancelEALogging__block_invoke_3525;
      uint64_t v24 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v25 = v11;
      if (cancelEALogging_defaultOnce_3523 != -1) {
        dispatch_once(&cancelEALogging_defaultOnce_3523, &v21);
      }
      if (cancelEALogging_classDebugEnabled_3524)
      {
        BOOL v12 = objc_msgSend(NSString, "stringWithFormat:", @"In Cancel EA Logging: Cancelled timer", v21, v22, v23, v24, v25);
        char v13 = (void *)MEMORY[0x1E4F929B8];
        id v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
        double v15 = [v14 lastPathComponent];
        BOOL v16 = [NSString stringWithUTF8String:"-[PLBatteryAgent cancelEALogging]"];
        [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:3888];

        uint64_t v17 = PLLogCommon();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    double v18 = [(PLBatteryAgent *)self EABatteryTimer];
    [v18 setTimerActive:0];

    double v19 = [(PLBatteryAgent *)self EABatteryTimer];
    [v19 invalidate];

    [(PLBatteryAgent *)self setEABatteryTimer:0];
    BOOL v20 = [(PLBatteryAgent *)self significantBatteryChangeTimer];
    [v20 cancel];

    [(PLBatteryAgent *)self setLastkIOPSAppleBatteryCaseCumulativeCurrentKey:0];
  }
}

uint64_t __33__PLBatteryAgent_cancelEALogging__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  cancelEALogging_classDebugEnabled = result;
  return result;
}

uint64_t __33__PLBatteryAgent_cancelEALogging__block_invoke_3525(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  cancelEALogging_classDebugEnabled_3524 = result;
  return result;
}

- (void)accessoryDisconnected:(id)a3
{
  id v4 = a3;
  if (+[PLBatteryAgent hasExternalAccessory])
  {
    uint64_t v5 = [(PLOperator *)self workQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __40__PLBatteryAgent_accessoryDisconnected___block_invoke;
    v6[3] = &unk_1E6E47EB8;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

uint64_t __40__PLBatteryAgent_accessoryDisconnected___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) detectEAPencilConnectionWithNotification:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 refreshEABatteryStatusTriggeredByConnectionEvent:1];
}

- (void)accessoryConnected:(id)a3
{
  id v4 = a3;
  if (+[PLBatteryAgent hasExternalAccessory])
  {
    uint64_t v5 = [(PLOperator *)self workQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __37__PLBatteryAgent_accessoryConnected___block_invoke;
    v6[3] = &unk_1E6E47EB8;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

uint64_t __37__PLBatteryAgent_accessoryConnected___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) detectEAPencilConnectionWithNotification:*(void *)(a1 + 40)];
  uint64_t v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1E4220000, v2, OS_LOG_TYPE_DEFAULT, "[BATTERY] EA connected!", v4, 2u);
  }

  return [*(id *)(a1 + 32) refreshEABatteryStatusTriggeredByConnectionEvent:1];
}

+ (BOOL)supportsAccConnectionLogging
{
  if (supportsAccConnectionLogging_onceToken != -1) {
    dispatch_once(&supportsAccConnectionLogging_onceToken, &__block_literal_global_3530);
  }
  return supportsAccConnectionLogging_ret;
}

uint64_t __46__PLBatteryAgent_supportsAccConnectionLogging__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  supportsAccConnectionLogging_ret = result;
  return result;
}

- (void)accessoryConnectionEventNotification:(id)a3
{
  if (+[PLBatteryAgent hasExternalAccessory])
  {
    id v4 = [(PLOperator *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__PLBatteryAgent_accessoryConnectionEventNotification___block_invoke;
    block[3] = &unk_1E6E47848;
    void block[4] = self;
    dispatch_async(v4, block);
  }
}

uint64_t __55__PLBatteryAgent_accessoryConnectionEventNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1E4220000, v2, OS_LOG_TYPE_DEFAULT, "[EABattery]: accessory connect", v4, 2u);
  }

  [*(id *)(a1 + 32) setShouldQueryForAccessory:1];
  return [*(id *)(a1 + 32) setShouldLogEABatteryConfig:1];
}

- (void)accessoryDisconnectEventNotification:(id)a3
{
  if (+[PLBatteryAgent hasExternalAccessory])
  {
    id v4 = [(PLOperator *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__PLBatteryAgent_accessoryDisconnectEventNotification___block_invoke;
    block[3] = &unk_1E6E47848;
    void block[4] = self;
    dispatch_async(v4, block);
  }
}

uint64_t __55__PLBatteryAgent_accessoryDisconnectEventNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1E4220000, v2, OS_LOG_TYPE_DEFAULT, "[EABattery]: accessory disconnect", v4, 2u);
  }

  return [*(id *)(a1 + 32) setShouldQueryForAccessory:0];
}

- (id)getIOPSDevices
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v3 = 0x1E4F92000uLL;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    void v39[2] = __32__PLBatteryAgent_getIOPSDevices__block_invoke;
    v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v39[4] = v4;
    if (getIOPSDevices_defaultOnce != -1) {
      dispatch_once(&getIOPSDevices_defaultOnce, v39);
    }
    if (getIOPSDevices_classDebugEnabled)
    {
      uint64_t v5 = [NSString stringWithFormat:@"check Connected devices ..."];
      uint64_t v6 = (void *)MEMORY[0x1E4F929B8];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      uint64_t v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLBatteryAgent getIOPSDevices]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:3958];

      double v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  if (+[PLBatteryAgent hasExternalAccessory])
  {
    uint64_t v11 = (const void *)IOPSCopyPowerSourcesByType();
    if (!v11) {
      goto LABEL_32;
    }
    BOOL v12 = v11;
    CFArrayRef v13 = IOPSCopyPowerSourcesList(v11);
    if (v13)
    {
      CFArrayRef v14 = v13;
      CFIndex Count = CFArrayGetCount(v13);
      if (Count >= 1)
      {
        CFIndex v16 = Count;
        CFIndex v17 = 0;
        id v36 = v2;
        uint64_t v35 = v12;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v14, v17);
          if (ValueAtIndex)
          {
            double v19 = IOPSGetPowerSourceDescription(v12, ValueAtIndex);
            if ([*(id *)(v3 + 2496) debugEnabled])
            {
              uint64_t v20 = objc_opt_class();
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __32__PLBatteryAgent_getIOPSDevices__block_invoke_3539;
              block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              void block[4] = v20;
              if (getIOPSDevices_defaultOnce_3537 != -1) {
                dispatch_once(&getIOPSDevices_defaultOnce_3537, block);
              }
              if (getIOPSDevices_classDebugEnabled_3538)
              {
                uint64_t v21 = [NSString stringWithFormat:@"%s-%d: powerSourceDescription=%@", "-[PLBatteryAgent getIOPSDevices]", 3978, v19];
                uint64_t v22 = (void *)MEMORY[0x1E4F929B8];
                long long v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
                uint64_t v24 = [v23 lastPathComponent];
                uint64_t v25 = [NSString stringWithUTF8String:"-[PLBatteryAgent getIOPSDevices]"];
                [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:3978];

                uint64_t v26 = PLLogCommon();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  __int16 v41 = v21;
                  _os_log_debug_impl(&dword_1E4220000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                uint64_t v2 = v36;
                unint64_t v3 = 0x1E4F92000;
                BOOL v12 = v35;
              }
            }
            [v2 addObject:v19];
          }
          ++v17;
        }
        while (v16 != v17);
      }
      CFRelease(v14);
    }
    CFRelease(v12);
  }
  if ([*(id *)(v3 + 2496) debugEnabled])
  {
    uint64_t v27 = objc_opt_class();
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    void v37[2] = __32__PLBatteryAgent_getIOPSDevices__block_invoke_3545;
    v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v37[4] = v27;
    if (getIOPSDevices_defaultOnce_3543 != -1) {
      dispatch_once(&getIOPSDevices_defaultOnce_3543, v37);
    }
    if (getIOPSDevices_classDebugEnabled_3544)
    {
      id v28 = [NSString stringWithFormat:@"Connected devices=%@", v2];
      uint64_t v29 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      uint64_t v31 = [v30 lastPathComponent];
      uint64_t v32 = [NSString stringWithUTF8String:"-[PLBatteryAgent getIOPSDevices]"];
      [v29 logMessage:v28 fromFile:v31 fromFunction:v32 fromLineNumber:3992];

      uint64_t v33 = PLLogCommon();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
LABEL_32:
  return v2;
}

uint64_t __32__PLBatteryAgent_getIOPSDevices__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  getIOPSDevices_classDebugEnabled = result;
  return result;
}

uint64_t __32__PLBatteryAgent_getIOPSDevices__block_invoke_3539(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  getIOPSDevices_classDebugEnabled_3538 = result;
  return result;
}

uint64_t __32__PLBatteryAgent_getIOPSDevices__block_invoke_3545(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  getIOPSDevices_classDebugEnabled_3544 = result;
  return result;
}

- (id)getBaseIdentifierFromDevice:(id)a3
{
  id v3 = a3;
  if (+[PLBatteryAgent hasExternalAccessory])
  {
    uint64_t v4 = [NSString stringWithUTF8String:"Vendor ID"];
    uint64_t v5 = [v3 objectForKey:v4];
    uint64_t v6 = [v5 intValue];

    id v7 = [NSString stringWithUTF8String:"Product ID"];
    uint64_t v8 = [v3 objectForKey:v7];
    uint64_t v9 = [v8 intValue];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v10 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46__PLBatteryAgent_getBaseIdentifierFromDevice___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v10;
      if (getBaseIdentifierFromDevice__defaultOnce != -1) {
        dispatch_once(&getBaseIdentifierFromDevice__defaultOnce, block);
      }
      if (getBaseIdentifierFromDevice__classDebugEnabled)
      {
        uint64_t v11 = [NSString stringWithFormat:@"%s-%d: vendorID=%d, productID=%d", "-[PLBatteryAgent getBaseIdentifierFromDevice:]", 4003, v6, v9];
        BOOL v12 = (void *)MEMORY[0x1E4F929B8];
        CFArrayRef v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
        CFArrayRef v14 = [v13 lastPathComponent];
        double v15 = [NSString stringWithUTF8String:"-[PLBatteryAgent getBaseIdentifierFromDevice:]"];
        [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:4003];

        CFIndex v16 = PLLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    CFIndex v17 = 0;
    if (v6 != 0xFFFF && v6 && v9 && v9 != 0xFFFF)
    {
      CFIndex v17 = objc_msgSend(NSString, "stringWithFormat:", @"%d-%d", v6, v9);
    }
  }
  else
  {
    CFIndex v17 = 0;
  }

  return v17;
}

uint64_t __46__PLBatteryAgent_getBaseIdentifierFromDevice___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  getBaseIdentifierFromDevice__classDebugEnabled = result;
  return result;
}

- (void)logEABatteryStatistics
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!+[PLBatteryAgent hasExternalAccessory]) {
    return;
  }
  id v3 = [(PLBatteryAgent *)self getIOPSDevices];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (!v4) {
    goto LABEL_26;
  }
  uint64_t v6 = v4;
  char v7 = 0;
  uint64_t v8 = *(void *)v40;
  *(void *)&long long v5 = 134218240;
  long long v38 = v5;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v40 != v8) {
        objc_enumerationMutation(v3);
      }
      uint64_t v10 = *(void *)(*((void *)&v39 + 1) + 8 * i);
      uint64_t v11 = -[PLBatteryAgent getBaseIdentifierFromDevice:](self, "getBaseIdentifierFromDevice:", v10, v38);
      BOOL v12 = [(PLBatteryAgent *)self trackedAccessories];
      int v13 = [v12 containsObject:v11];

      if (v13)
      {
        if ([v11 isEqualToString:@"76-546"])
        {
          id v14 = objc_alloc(MEMORY[0x1E4F929D0]);
          double v15 = [(PLBatteryAgent *)self entryKeyEAPencilStats];
          CFIndex v16 = (void *)[v14 initWithEntryKey:v15 withRawData:v10];

          [(PLOperator *)self logEntry:v16];
          goto LABEL_21;
        }
        if (([v11 isEqualToString:@"1452-5013"] & 1) != 0
          || ([v11 isEqualToString:@"1452-5016"] & 1) != 0
          || [v11 isEqualToString:@"1452-5017"])
        {
          id v17 = objc_alloc(MEMORY[0x1E4F929D0]);
          double v18 = [(PLBatteryAgent *)self entryKeyEABattery];
          CFIndex v16 = (void *)[v17 initWithEntryKey:v18 withRawData:v10];

          [(PLOperator *)self logEntry:v16];
          [(PLBatteryAgent *)self logEABatteryConfig:v10];
          double v19 = [v16 objectForKeyedSubscript:@"Current Capacity"];
          [v19 doubleValue];
          double v21 = v20;

          uint64_t v22 = [v16 objectForKeyedSubscript:@"Max Capacity"];
          int v23 = [v22 intValue];

          uint64_t v24 = PLLogCommon();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v38;
            double v44 = v21;
            __int16 v45 = 1024;
            int v46 = v23;
            _os_log_debug_impl(&dword_1E4220000, v24, OS_LOG_TYPE_DEBUG, "EALevel: %f / %d", buf, 0x12u);
          }

          if (v23 < 1) {
            double v25 = -1.0;
          }
          else {
            double v25 = v21 / (double)v23 * 100.0;
          }
          [(PLBatteryAgent *)self setEABatteryLevel:v25];
          uint64_t v26 = [(PLBatteryAgent *)self lastkIOPSAppleBatteryCaseCumulativeCurrentKey];

          if (v26)
          {
            uint64_t v27 = [(PLBatteryAgent *)self lastkIOPSAppleBatteryCaseCumulativeCurrentKey];
            [v27 doubleValue];
            double v29 = v28;
            uint64_t v30 = [v16 objectForKeyedSubscript:@"Battery Case Cumulative Current"];
            [v30 doubleValue];
            double v32 = v29 - v31;
            uint64_t v33 = [v16 objectForKeyedSubscript:@"Voltage"];
            [v33 doubleValue];
            double v35 = v32 * v34 / 3600.0;

            [(PLBatteryAgent *)self EAEnergyDrained];
            [(PLBatteryAgent *)self setEAEnergyDrained:v35 + v36];
          }
          __int16 v37 = [v16 objectForKeyedSubscript:@"Battery Case Cumulative Current"];
          [(PLBatteryAgent *)self setLastkIOPSAppleBatteryCaseCumulativeCurrentKey:v37];

          [(PLBatteryAgent *)self logEABatteryConnectedTimeToAnalyticsWithEAConnectionState:0];
LABEL_21:
        }
        char v7 = 1;
      }
    }
    uint64_t v6 = [v3 countByEnumeratingWithState:&v39 objects:v47 count:16];
  }
  while (v6);
  if ((v7 & 1) == 0) {
LABEL_26:
  }
    [(PLBatteryAgent *)self refreshEABatteryStatusTriggeredByConnectionEvent:0];
}

- (void)logEABatteryConfigToCA:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = [v4 definedKeys];
  uint64_t v6 = (void *)[v5 mutableCopy];

  id v17 = objc_opt_new();
  [v6 addObjectsFromArray:&unk_1F4014EF0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        [(PLBatteryAgent *)self setAggdIntegerValueFromEntry:v4 forKey:v11 withPrefix:@"com.apple.power.battery.eabatteryconfig."];
        BOOL v12 = [v4 objectForKeyedSubscript:v11];
        id v13 = v11;
        if ([v13 rangeOfString:@"-"] != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v14 = [v13 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

          id v13 = (id)v14;
        }
        if (v12)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v12, "integerValue"));
            [v17 setValue:v15 forKey:v13];
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  id v16 = v17;
  AnalyticsSendEventLazy();
}

id __41__PLBatteryAgent_logEABatteryConfigToCA___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)logEABatteryConfig:(id)a3
{
  id v4 = a3;
  if ([(PLBatteryAgent *)self shouldLogEABatteryConfig])
  {
    long long v5 = [v4 objectForKeyedSubscript:@"Debug Information"];

    if (v5)
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v6 = objc_opt_class();
        uint64_t block = MEMORY[0x1E4F143A8];
        uint64_t v18 = 3221225472;
        long long v19 = __37__PLBatteryAgent_logEABatteryConfig___block_invoke;
        long long v20 = &__block_descriptor_40_e5_v8__0lu32l8;
        uint64_t v21 = v6;
        if (logEABatteryConfig__defaultOnce != -1) {
          dispatch_once(&logEABatteryConfig__defaultOnce, &block);
        }
        if (logEABatteryConfig__classDebugEnabled)
        {
          uint64_t v7 = [NSString stringWithFormat:@"The payload is %@", v4, block, v18, v19, v20, v21];
          uint64_t v8 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
          uint64_t v10 = [v9 lastPathComponent];
          uint64_t v11 = [NSString stringWithUTF8String:"-[PLBatteryAgent logEABatteryConfig:]"];
          [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:4120];

          BOOL v12 = PLLogCommon();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
      id v13 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"EABatteryConfig"];
      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v13 withRawData:v4];
      [(PLOperator *)self logEntry:v14];
      double v15 = [v4 objectForKeyedSubscript:@"Nominal Capacity"];
      [v14 setObject:v15 forKeyedSubscript:@"NominalChargeCapacity"];

      id v16 = [v4 objectForKeyedSubscript:@"CycleCount"];
      [v14 setObject:v16 forKeyedSubscript:@"CycleCount"];

      [(PLBatteryAgent *)self logEABatteryConfigToCA:v14];
      [(PLBatteryAgent *)self setShouldLogEABatteryConfig:0];
    }
  }
}

uint64_t __37__PLBatteryAgent_logEABatteryConfig___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEABatteryConfig__classDebugEnabled = result;
  return result;
}

- (BOOL)isEABatteryConnectedNow
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(PLBatteryAgent *)self getIOPSDevices];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = -[PLBatteryAgent getBaseIdentifierFromDevice:](self, "getBaseIdentifierFromDevice:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        if (([v8 isEqualToString:@"1452-5013"] & 1) != 0
          || ([v8 isEqualToString:@"1452-5016"] & 1) != 0)
        {

LABEL_13:
          BOOL v10 = 1;
          goto LABEL_15;
        }
        char v9 = [v8 isEqualToString:@"1452-5017"];

        if (v9) {
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      BOOL v10 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_15:

  return v10;
}

- (BOOL)isEAPencilConnectedNow
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(PLBatteryAgent *)self getIOPSDevices];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = -[PLBatteryAgent getBaseIdentifierFromDevice:](self, "getBaseIdentifierFromDevice:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        char v9 = [v8 isEqualToString:@"76-546"];

        if (v9)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)logEABatteryConnectedEventToAnalyticsIgnoreLastLogTimestamp:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [(PLBatteryAgent *)self setLastEABatteryConnectedTime:v5];

  uint64_t v6 = PLLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryAgent logEABatteryConnectedEventToAnalyticsIgnoreLastLogTimestamp:].cold.4();
  }

  uint64_t v7 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [MEMORY[0x1E4F929C0] doubleForKey:@"LastEABatteryConnectCountLogTimestamp" ifNotSet:0.0];
  double v9 = v8;
  [v7 timeIntervalSince1970];
  double v11 = v10;
  if (v9 == 0.0 || v3)
  {
    long long v13 = PLLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryAgent logEABatteryConnectedEventToAnalyticsIgnoreLastLogTimestamp:]();
    }

    goto LABEL_14;
  }
  if (v10 - v9 >= 86400.0)
  {
LABEL_14:
    long long v15 = (void *)MEMORY[0x1E4F929C0];
    id v16 = [MEMORY[0x1E4F28ED0] numberWithDouble:v11];
    [v15 setObject:v16 forKey:@"LastEABatteryConnectCountLogTimestamp" saveToDisk:1];

    uint64_t v17 = [(PLBatteryAgent *)self eaBatteryConnectCountTimer];

    if (v17)
    {
      uint64_t v18 = [(PLBatteryAgent *)self eaBatteryConnectCountTimer];
      [v18 invalidate];

      long long v19 = [MEMORY[0x1E4F1C9C8] date];
      long long v20 = [v19 dateByAddingTimeInterval:86400.0];
      uint64_t v21 = [(PLBatteryAgent *)self eaBatteryConnectCountTimer];
      [v21 setFireDate:v20];
    }
    else
    {
      long long v19 = [(PLBatteryAgent *)self createTimerForEABatteryCountLogging];
      [(PLBatteryAgent *)self setEaBatteryConnectCountTimer:v19];
    }

    long long v22 = PLLogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryAgent logEABatteryConnectedEventToAnalyticsIgnoreLastLogTimestamp:]();
    }

    MEMORY[0x1E4E7E330](@"com.apple.powerlog.EABattery.connected", 1);
    AnalyticsSendEventLazy();
    goto LABEL_20;
  }
  long long v14 = PLLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryAgent logEABatteryConnectedEventToAnalyticsIgnoreLastLogTimestamp:]();
  }

LABEL_20:
}

void *__78__PLBatteryAgent_logEABatteryConnectedEventToAnalyticsIgnoreLastLogTimestamp___block_invoke()
{
  return &unk_1F4011658;
}

- (void)logEABatteryConnectedTimeToAnalyticsWithEAConnectionState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PLBatteryAgent *)self lastEABatteryConnectedTime];

  if (v5)
  {
    uint64_t v6 = PLLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryAgent logEABatteryConnectedTimeToAnalyticsWithEAConnectionState:]();
    }

    uint64_t v7 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    double v8 = [(PLBatteryAgent *)self lastEABatteryConnectedTime];
    [v7 timeIntervalSinceDate:v8];
    double v10 = v9;

    if (v3)
    {
      [(PLBatteryAgent *)self setLastEABatteryConnectedTime:0];
    }
    else
    {
      double v11 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      [(PLBatteryAgent *)self setLastEABatteryConnectedTime:v11];
    }
    long long v12 = [(PLBatteryAgent *)self deviceIsPluggedIn];
    char v13 = [v12 BOOLValue];

    if ((v13 & 1) == 0)
    {
      long long v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryAgent logEABatteryConnectedTimeToAnalyticsWithEAConnectionState:]();
      }

      MEMORY[0x1E4E7E330](@"com.apple.powerlog.EABattery.connectedTime", (uint64_t)v10);
      AnalyticsSendEventLazy();
    }
  }
}

id __76__PLBatteryAgent_logEABatteryConnectedTimeToAnalyticsWithEAConnectionState___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = @"timeConnected";
  uint64_t v1 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (id)createTimerForEABatteryCountLogging
{
  id v3 = objc_alloc(MEMORY[0x1E4F92A80]);
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v5 = [v4 dateByAddingTimeInterval:86400.0];
  uint64_t v6 = [(PLOperator *)self workQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__PLBatteryAgent_createTimerForEABatteryCountLogging__block_invoke;
  v9[3] = &unk_1E6E489A8;
  v9[4] = self;
  uint64_t v7 = (void *)[v3 initWithFireDate:v5 withInterval:1 withTolerance:0 repeats:v6 withUserInfo:v9 withQueue:86400.0 withBlock:1.0];

  return v7;
}

uint64_t __53__PLBatteryAgent_createTimerForEABatteryCountLogging__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) logEABatteryConnectedEventToAnalyticsIgnoreLastLogTimestamp:0];
}

- (BOOL)isUPOEntry:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F929C0] BOOLForKey:@"UPO_Debug" ifNotSet:0])
  {
    BOOL v4 = 1;
  }
  else if (v3)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:@"UISOC"];
    int v6 = [v5 intValue];

    uint64_t v7 = [v3 objectForKeyedSubscript:@"Temperature"];
    int v8 = [v7 intValue];

    BOOL v4 = v6 > 10 && v8 > 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)detectEAPencilConnectionWithNotification:(id)a3
{
  BOOL v4 = [a3 userInfo];
  id v14 = [v4 objectForKey:@"EAAccessoryKey"];

  uint64_t v5 = [v14 name];
  int v6 = [v5 isEqualToString:@"Apple Pencil"];

  uint64_t v7 = v14;
  if (v6)
  {
    uint64_t v8 = [v14 isConnected];
    double v9 = [(PLBatteryAgent *)self trackedAccessories];
    double v10 = v9;
    if (v8) {
      [v9 addObject:@"76-546"];
    }
    else {
      [v9 removeObject:@"76-546"];
    }

    double v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"EAPencilConnect"];
    long long v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
    char v13 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
    [v12 setObject:v13 forKeyedSubscript:@"isPhysicallyAttached"];

    [(PLOperator *)self logEntry:v12];
    uint64_t v7 = v14;
  }
}

- (void)initOperatorDependancies
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "manager is not existent", v2, v3, v4, v5, v6);
}

void __42__PLBatteryAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__PLBatteryAgent_initOperatorDependancies__block_invoke_2;
    block[3] = &unk_1E6E4A300;
    uint64_t v24 = @"GasGauge";
    uint64_t v25 = v2;
    if (kPLBatteryAgentStringUserType_block_invoke_2_defaultOnce != -1) {
      dispatch_once(&kPLBatteryAgentStringUserType_block_invoke_2_defaultOnce, block);
    }
    int v3 = kPLBatteryAgentStringUserType_block_invoke_2_classDebugEnabled;

    if (v3)
    {
      uint64_t v4 = [NSString stringWithFormat:@"Blocking GasGauge reads"];
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      uint8_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      uint64_t v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLBatteryAgent initOperatorDependancies]_block_invoke"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:4321];

      double v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  [*(id *)(a1 + 32) setAllowGasGaugeRead:0];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    long long v20 = __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3617;
    uint64_t v21 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v22 = v10;
    if (kPLBatteryAgentStringUserType_block_invoke_2_defaultOnce_3615 != -1) {
      dispatch_once(&kPLBatteryAgentStringUserType_block_invoke_2_defaultOnce_3615, &v18);
    }
    if (kPLBatteryAgentStringUserType_block_invoke_2_classDebugEnabled_3616)
    {
      double v11 = [NSString stringWithFormat:@"%@ signaling done", *(void *)(a1 + 32), v18, v19, v20, v21, v22];
      long long v12 = (void *)MEMORY[0x1E4F929B8];
      char v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      id v14 = [v13 lastPathComponent];
      long long v15 = [NSString stringWithUTF8String:"-[PLBatteryAgent initOperatorDependancies]_block_invoke_2"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:4323];

      id v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  uint64_t v17 = [*(id *)(a1 + 32) canSleepSemaphore];
  [v17 signalDoneByObject:*(void *)(a1 + 32)];
}

uint64_t __42__PLBatteryAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  kPLBatteryAgentStringUserType_block_invoke_2_classDebugEnabled = result;
  return result;
}

uint64_t __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3617(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLBatteryAgentStringUserType_block_invoke_2_classDebugEnabled_3616 = result;
  return result;
}

uint64_t __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3623(uint64_t a1)
{
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    char v13 = __42__PLBatteryAgent_initOperatorDependancies__block_invoke_2_3624;
    id v14 = &unk_1E6E4A300;
    long long v15 = @"GasGauge";
    uint64_t v16 = v2;
    if (kPLBatteryAgentStringUserType_block_invoke_3_defaultOnce != -1) {
      dispatch_once(&kPLBatteryAgentStringUserType_block_invoke_3_defaultOnce, &v11);
    }
    int v3 = kPLBatteryAgentStringUserType_block_invoke_3_classDebugEnabled;

    if (v3)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"Opening GasGauge reads", v11, v12, v13, v14);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      uint8_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      uint64_t v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLBatteryAgent initOperatorDependancies]_block_invoke"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:4327];

      double v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "setAllowGasGaugeRead:", 1, v11, v12, v13, v14);
}

uint64_t __42__PLBatteryAgent_initOperatorDependancies__block_invoke_2_3624(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  kPLBatteryAgentStringUserType_block_invoke_3_classDebugEnabled = result;
  return result;
}

id __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3639()
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F92A40] sharedSQLiteConnection];
  uint64_t v1 = [v0 performQuery:@"SELECT ID, CycleCount FROM PLBatteryAgent_EventBackward_Battery GROUP BY CycleCount;"];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v1;
  uint64_t v2 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    int v6 = 0;
    uint64_t v7 = *(void *)v27;
    do
    {
      uint64_t v8 = 0;
      int v9 = v6;
      do
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * v8);
        uint64_t v11 = [v10 objectForKeyedSubscript:@"CycleCount"];
        int v6 = [v11 integerValue];

        unsigned int v12 = v6 - v9;
        if (v6 - v9 < 0) {
          unsigned int v12 = v9 - v6;
        }
        if (v12 > 5) {
          uint64_t v5 = v4;
        }
        char v13 = [v10 objectForKeyedSubscript:@"ID"];
        uint64_t v4 = [v13 longLongValue];

        ++v8;
        int v9 = v6;
      }
      while (v3 != v8);
      uint64_t v3 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v5 = 0;
  }

  id v14 = [MEMORY[0x1E4F92A40] sharedSQLiteConnection];
  long long v15 = [NSString stringWithFormat:@"select MAX(AppleRawMaxCapacity) AS Max, MIN(AppleRawMaxCapacity) AS Min, AVG(AppleRawMaxCapacity) AS Avg from PLBatteryAgent_EventBackward_Battery where ID > %lld", v5];
  uint64_t v16 = [v14 performQuery:v15];

  if ([v16 count])
  {
    v30[0] = @"fullChargeCapacityMax";
    uint64_t v17 = [v16 objectAtIndexedSubscript:0];
    uint64_t v18 = [v17 objectForKeyedSubscript:@"Max"];
    v31[0] = v18;
    v30[1] = @"fullChargeCapacityMin";
    uint64_t v19 = [v16 objectAtIndexedSubscript:0];
    long long v20 = [v19 objectForKeyedSubscript:@"Min"];
    v31[1] = v20;
    void v30[2] = @"fullChargeCapacityAvg";
    uint64_t v21 = [v16 objectAtIndexedSubscript:0];
    uint64_t v22 = [v21 objectForKeyedSubscript:@"Avg"];
    v31[2] = v22;
    int v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
  }
  else
  {
    int v23 = 0;
  }

  return v23;
}

id __42__PLBatteryAgent_initOperatorDependancies__block_invoke_2_3669(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  void v26[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"BatteryConfig"];
  unsigned int v12 = [MEMORY[0x1E4F92AD0] sharedCore];
  char v13 = [v12 storage];
  id v14 = [v13 entriesForKey:v11];

  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__17;
  int v23 = __Block_byref_object_dispose__17;
  id v24 = (id)objc_opt_new();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3671;
  void v18[3] = &unk_1E6E4A398;
  v18[4] = &v19;
  [v14 enumerateObjectsUsingBlock:v18];
  v25[0] = @"dataReady";
  long long v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "lifetimeDataLogged"));
  v25[1] = @"BatteryConfig";
  v26[0] = v15;
  v26[1] = v20[5];
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];

  _Block_object_dispose(&v19, 8);
  return v16;
}

void __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3671(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 dictionary];
  [v2 addObject:v3];
}

id __42__PLBatteryAgent_initOperatorDependancies__block_invoke_2_3683(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  void v37[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"UPOStepper"];
  uint64_t v11 = [MEMORY[0x1E4F92AD0] sharedCore];
  unsigned int v12 = [v11 storage];
  char v13 = [v12 entriesForKey:v10];

  id v14 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"UPOStepper"];
  long long v15 = [MEMORY[0x1E4F92AD0] sharedCore];
  uint64_t v16 = [v15 storage];
  uint64_t v17 = [v16 entriesForKey:v14];

  uint64_t v30 = 0;
  double v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__17;
  double v34 = __Block_byref_object_dispose__17;
  id v35 = (id)objc_opt_new();
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  long long v27 = __Block_byref_object_copy__17;
  long long v28 = __Block_byref_object_dispose__17;
  id v29 = (id)objc_opt_new();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3;
  v23[3] = &unk_1E6E4A398;
  void v23[4] = &v24;
  [v13 enumerateObjectsUsingBlock:v23];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  void v22[2] = __42__PLBatteryAgent_initOperatorDependancies__block_invoke_4;
  void v22[3] = &unk_1E6E4A398;
  v22[4] = &v30;
  [v17 enumerateObjectsUsingBlock:v22];
  uint64_t v18 = v25[5];
  v36[0] = @"State";
  v36[1] = @"Metrics";
  uint64_t v19 = v31[5];
  v37[0] = v18;
  v37[1] = v19;
  long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v20;
}

void __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 dictionary];
  [v2 addObject:v3];
}

void __42__PLBatteryAgent_initOperatorDependancies__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 dictionary];
  [v2 addObject:v3];
}

id __42__PLBatteryAgent_initOperatorDependancies__block_invoke_5()
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v0 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"BatteryShutdown"];
  uint64_t v1 = [MEMORY[0x1E4F92AD0] sharedCore];
  uint64_t v2 = [v1 storage];
  id v3 = [v2 entriesForKey:v0];

  uint64_t v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionary", (void)v16);
        uint64_t v11 = [v10 objectForKeyedSubscript:@"BatteryShutdownTimestamp"];
        unsigned int v12 = v11;
        if (v11)
        {
          char v13 = [v11 convertFromMonotonicToSystem];
          [v10 setObject:v13 forKeyedSubscript:@"BatteryShutdownTimestamp"];
        }
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v7);
  }

  long long v20 = @"BatteryShutdownData";
  uint64_t v21 = v4;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];

  return v14;
}

id __42__PLBatteryAgent_initOperatorDependancies__block_invoke_6()
{
  v0 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"Battery"];
  objc_msgSend(NSString, "stringWithFormat:", @"SELECT MIN(%@) TemperatureMin, MAX(%@) TemperatureMax, AVG(%@) TemperatureAvg FROM %@;",
    @"Temperature",
    @"Temperature",
    @"Temperature",
  uint64_t v1 = v0);
  uint64_t v2 = [MEMORY[0x1E4F92A40] sharedSQLiteConnection];
  id v3 = [v2 performQuery:v1];

  if ([v3 count])
  {
    uint64_t v4 = [v3 objectAtIndexedSubscript:0];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id __42__PLBatteryAgent_initOperatorDependancies__block_invoke_7()
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v0 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"Battery"];
  objc_msgSend(NSString, "stringWithFormat:", @"                                           SELECT AmperageBucket, COUNT(*) NumSamples                                           FROM(                                          SELECT %@, -ROUND(%@/%f + 0.5)*%f AmperageBucket                                           FROM %@                                           WHERE %@ <= -%f AND timestamp > (-%f +(                                          SELECT MAX(timestamp)                                            FROM %@                                          ))                                          )                                           GROUP BY AmperageBucket                                           ORDER BY AmperageBucket;",
    @"InstantAmperage",
    @"InstantAmperage",
    0x4049000000000000,
    0x4049000000000000,
    v0,
    @"InstantAmperage",
    0x4054000000000000,
    0x40F5180000000000,
  uint64_t v1 = v0);
  uint64_t v6 = @"DischargeCurrentHist";
  uint64_t v2 = [MEMORY[0x1E4F92A40] sharedSQLiteConnection];
  id v3 = [v2 performQuery:v1];
  v7[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

id __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3731(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v6;
    _os_log_impl(&dword_1E4220000, v7, OS_LOG_TYPE_DEFAULT, "[BatteryQueryForChargingState] Received query with payload=%@!", buf, 0xCu);
  }

  if (v6
    && ([v6 objectForKeyedSubscript:@"StartEpochTime"],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    id v9 = (void *)MEMORY[0x1E4F1C9C8];
    id v10 = [v6 objectForKeyedSubscript:@"StartEpochTime"];
    [v10 doubleValue];
    uint64_t v11 = objc_msgSend(v9, "dateWithTimeIntervalSince1970:");

    unsigned int v12 = [v11 convertFromSystemToMonotonic];
    [v12 timeIntervalSinceNow];
    if (v13 >= -3600.0)
    {
      id v14 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"Battery"];
      long long v16 = NSString;
      [v12 timeIntervalSince1970];
      long long v18 = [v16 stringWithFormat:@"SELECT timestamp, %@, %@ FROM %@ where timestamp > %f", @"ExternalConnected", @"IsCharging", v14, v17];
      long long v19 = [MEMORY[0x1E4F92A40] sharedSQLiteConnection];
      long long v20 = [v19 performQuery:v18];

      if ([v20 count])
      {
        uint64_t v21 = [MEMORY[0x1E4F92A60] entryKeyForType:*MEMORY[0x1E4F92D30] andName:*MEMORY[0x1E4F92D90]];
        uint64_t v22 = [*(id *)(a1 + 32) storage];
        uint64_t v23 = [v22 lastEntryForKey:v21];

        uint64_t v24 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F92D98]];
        [v24 doubleValue];
        double v26 = v25;

        v29[0] = @"Result";
        v29[1] = @"TimeOffset";
        v30[0] = v20;
        long long v27 = [MEMORY[0x1E4F28ED0] numberWithDouble:v26];
        v30[1] = v27;
        long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
      }
      else
      {
        uint64_t v21 = PLLogCommon();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3731_cold_3();
        }
        long long v15 = 0;
      }
    }
    else
    {
      id v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3731_cold_2();
      }
      long long v15 = 0;
    }
  }
  else
  {
    uint64_t v11 = PLLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3731_cold_1();
    }
    long long v15 = 0;
  }

  return v15;
}

void __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3748(uint64_t a1, uint64_t a2, int a3)
{
  if ([MEMORY[0x1E4F92A38] isiPad])
  {
    if ((a3 + 469794800) >= 2)
    {
      if (a3 == -469794798) {
        goto LABEL_11;
      }
      if (a3 != -536870608) {
        return;
      }
    }
    id v6 = [MEMORY[0x1E4F92A00] snapshotFromIOEntry:a2];
    if (!v6)
    {
LABEL_25:

      return;
    }
    id v28 = v6;
    uint64_t v7 = [v6 objectForKeyedSubscript:@"IOAccessoryPrimaryDevicePort"];
    int v8 = [v7 intValue];

    if (v8 == 257)
    {
      id v9 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"EAPencilCharging"];
      id v10 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v9 withRawData:v28];
      uint64_t v11 = [v28 objectForKeyedSubscript:@"IOAccessoryID"];
      int v12 = [v11 intValue];

      double v13 = [MEMORY[0x1E4F28ED0] numberWithInt:v12 == 71];
      [v10 setObject:v13 forKeyedSubscript:@"Pencil"];

      [*(id *)(a1 + 32) logEntry:v10];
LABEL_24:

      id v6 = v28;
      goto LABEL_25;
    }
  }
  if (a3 == -469794799)
  {
    if ([*(id *)(a1 + 32) priIOAccessoryPowerMode] == 1) {
      return;
    }
    id v28 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"LightningConnectorStatus"];
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v28];
    double v26 = [MEMORY[0x1E4F28ED0] numberWithInt:1];
    [v9 setObject:v26 forKeyedSubscript:@"IOAccessoryPowerMode"];

    [*(id *)(a1 + 32) logEntry:v9];
    long long v27 = *(void **)(a1 + 32);
    id v10 = [MEMORY[0x1E4F28ED0] numberWithInt:1];
    objc_msgSend(v27, "setPriIOAccessoryPowerMode:", objc_msgSend(v10, "intValue"));
    goto LABEL_24;
  }
  if (a3 != -469794798) {
    return;
  }
LABEL_11:
  id v14 = [MEMORY[0x1E4F92A00] snapshotFromIOEntry:a2];
  long long v15 = [v14 objectForKeyedSubscript:@"IOAccessoryActivePowerMode"];
  int v16 = [v15 intValue];
  if (v16 != [*(id *)(a1 + 32) priIOAccessoryPowerMode])
  {
    uint64_t v17 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"LightningConnectorStatus"];
    long long v18 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v17];
    [v18 setObject:v15 forKeyedSubscript:@"IOAccessoryPowerMode"];
    [*(id *)(a1 + 32) logEntry:v18];
    objc_msgSend(*(id *)(a1 + 32), "setPriIOAccessoryPowerMode:", objc_msgSend(v15, "intValue"));
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v19 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__PLBatteryAgent_initOperatorDependancies__block_invoke_2_3755;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v19;
      if (kPLBatteryAgentStringUserType_block_invoke_4_defaultOnce != -1) {
        dispatch_once(&kPLBatteryAgentStringUserType_block_invoke_4_defaultOnce, block);
      }
      if (kPLBatteryAgentStringUserType_block_invoke_4_classDebugEnabled)
      {
        long long v20 = objc_msgSend(NSString, "stringWithFormat:", @"IOAccessoryPowerMode: %d", objc_msgSend(*(id *)(a1 + 32), "priIOAccessoryPowerMode"));
        uint64_t v21 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
        uint64_t v23 = [v22 lastPathComponent];
        uint64_t v24 = [NSString stringWithUTF8String:"-[PLBatteryAgent initOperatorDependancies]_block_invoke"];
        [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:4527];

        double v25 = PLLogCommon();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
  }
}

uint64_t __42__PLBatteryAgent_initOperatorDependancies__block_invoke_2_3755(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLBatteryAgentStringUserType_block_invoke_4_classDebugEnabled = result;
  return result;
}

uint64_t __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3759(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  initOperatorDependancies_classDebugEnabled_2 = result;
  return result;
}

uint64_t __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3763(uint64_t a1)
{
  uint64_t v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3763_cold_1();
  }

  return [*(id *)(a1 + 32) handleSBC];
}

void __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3771(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    int v16 = __42__PLBatteryAgent_initOperatorDependancies__block_invoke_2_3772;
    uint64_t v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (kPLBatteryAgentStringUserType_block_invoke_5_defaultOnce != -1) {
      dispatch_once(&kPLBatteryAgentStringUserType_block_invoke_5_defaultOnce, &block);
    }
    if (kPLBatteryAgentStringUserType_block_invoke_5_classDebugEnabled)
    {
      int v8 = [NSString stringWithFormat:@"UPOStepper Callback %@", v6, block, v15, v16, v17, v18];
      id v9 = (void *)MEMORY[0x1E4F929B8];
      id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      uint64_t v11 = [v10 lastPathComponent];
      int v12 = [NSString stringWithUTF8String:"-[PLBatteryAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:4567];

      double v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  [*(id *)(a1 + 32) logEventForwardUPOStepperWithPayload:v6];
}

uint64_t __42__PLBatteryAgent_initOperatorDependancies__block_invoke_2_3772(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLBatteryAgentStringUserType_block_invoke_5_classDebugEnabled = result;
  return result;
}

uint64_t __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3778(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleMitigationStateCallback:a2];
}

uint64_t __42__PLBatteryAgent_initOperatorDependancies__block_invoke_2_3782(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  initOperatorDependancies_classDebugEnabled_3781 = result;
  return result;
}

uint64_t __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3787(uint64_t a1)
{
  return [*(id *)(a1 + 32) logEventForwardMitigationStateWithState:0 userDisabled:1];
}

uint64_t __42__PLBatteryAgent_initOperatorDependancies__block_invoke_2_3790(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  initOperatorDependancies_classDebugEnabled_3789 = result;
  return result;
}

uint64_t __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3793(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  initOperatorDependancies_classDebugEnabled_3792 = result;
  return result;
}

void __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3800(uint64_t a1, uint64_t a2, int a3)
{
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __42__PLBatteryAgent_initOperatorDependancies__block_invoke_2_3801;
    int v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v17 = v5;
    if (kPLBatteryAgentStringUserType_block_invoke_6_defaultOnce != -1) {
      dispatch_once(&kPLBatteryAgentStringUserType_block_invoke_6_defaultOnce, &block);
    }
    if (kPLBatteryAgentStringUserType_block_invoke_6_classDebugEnabled)
    {
      id v6 = "NOT ";
      if (a3 == -528318208) {
        id v6 = "";
      }
      uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Message recieved from ApplePPM (messageType = %skIOApplePPMMessagePowerlogTrigger"), v6, block, v14, v15, v16, v17;
      int v8 = (void *)MEMORY[0x1E4F929B8];
      id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      id v10 = [v9 lastPathComponent];
      uint64_t v11 = [NSString stringWithUTF8String:"-[PLBatteryAgent initOperatorDependancies]_block_invoke"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:4603];

      int v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  if (a3 == -528318208) {
    [*(id *)(a1 + 32) handlePPMCallback];
  }
}

uint64_t __42__PLBatteryAgent_initOperatorDependancies__block_invoke_2_3801(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLBatteryAgentStringUserType_block_invoke_6_classDebugEnabled = result;
  return result;
}

void __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3807(uint64_t a1)
{
  [*(id *)(a1 + 32) setPpmEventLoggingCount:0];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__PLBatteryAgent_initOperatorDependancies__block_invoke_2_3808;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v2;
    if (kPLBatteryAgentStringUserType_block_invoke_7_defaultOnce != -1) {
      dispatch_once(&kPLBatteryAgentStringUserType_block_invoke_7_defaultOnce, block);
    }
    if (kPLBatteryAgentStringUserType_block_invoke_7_classDebugEnabled)
    {
      id v3 = NSString;
      uint64_t v4 = [*(id *)(a1 + 32) ppmEventLoggingCount];
      uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
      id v6 = [v3 stringWithFormat:@"PPMEvent count reset to %ld at %@", v4, v5];

      uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      int v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      id v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLBatteryAgent initOperatorDependancies]_block_invoke"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:4615];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __42__PLBatteryAgent_initOperatorDependancies__block_invoke_2_3808(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLBatteryAgentStringUserType_block_invoke_7_classDebugEnabled = result;
  return result;
}

void __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3821(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3821_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardMobileChargeMode:v6];
}

void __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3826(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __41__PLCameraAgent_initOperatorDependancies__block_invoke_172_cold_1();
  }
}

uint64_t __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3833(uint64_t a1)
{
  return [*(id *)(a1 + 32) logCPMSSnapshotWithTrigger:912265];
}

uint64_t __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3856(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) handleBDCAMALogging:a5];
}

uint64_t __42__PLBatteryAgent_initOperatorDependancies__block_invoke_2_3864(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) handleOnDeviceACAMSBC:a5];
}

uint64_t __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3_3868(uint64_t a1)
{
  return [*(id *)(a1 + 32) logEventPointBatteryUIVisit];
}

uint64_t __42__PLBatteryAgent_initOperatorDependancies__block_invoke_4_3872(uint64_t a1)
{
  return [*(id *)(a1 + 32) logEventPointBatteryHealthUIVisit];
}

uint64_t __42__PLBatteryAgent_initOperatorDependancies__block_invoke_5_3876(uint64_t a1)
{
  return [*(id *)(a1 + 32) logEventPointBatteryChargingUIVisit];
}

uint64_t __42__PLBatteryAgent_initOperatorDependancies__block_invoke_6_3878(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleGaugingMitigationStateCallback:a2];
}

+ (BOOL)shouldLogBTM
{
  if (shouldLogBTM_onceToken != -1) {
    dispatch_once(&shouldLogBTM_onceToken, &__block_literal_global_3880);
  }
  return shouldLogBTM__supportedTarget;
}

uint64_t __30__PLBatteryAgent_shouldLogBTM__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F92A38] isiPhone];
  if (result)
  {
    uint64_t result = [MEMORY[0x1E4F92A38] kPLDeviceClass];
    BOOL v1 = (int)result > 102033;
  }
  else
  {
    BOOL v1 = 0;
  }
  shouldLogBTM__supportedTarget = v1;
  return result;
}

- (void)handleSBC
{
  if (+[PLBatteryAgent shouldLogBTM] && self->_BTMmanager) {
    [(PLBatteryAgent *)self logBTM];
  }
  if (+[PLBatteryAgent shouldLogCPMS])
  {
    [(PLBatteryAgent *)self logCPMSSnapshotWithTrigger:0];
  }
  else
  {
    [(PLBatteryAgent *)self logPPMDebug];
  }
}

- (void)handlePPMCallback
{
  if (+[PLBatteryAgent shouldLogCPMS])
  {
    [(PLBatteryAgent *)self logCPMSSnapshotWithTrigger:1];
  }
  else
  {
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    long long v20 = __35__PLBatteryAgent_handlePPMCallback__block_invoke;
    uint64_t v21 = &unk_1E6E4A4C8;
    uint64_t v22 = @"disablePPMEventThreshold";
    char v23 = 0;
    if (handlePPMCallback_defaultOnce != -1) {
      dispatch_once(&handlePPMCallback_defaultOnce, &block);
    }
    int v3 = handlePPMCallback_objectForKey;

    if (v3 || [(PLBatteryAgent *)self ppmEventLoggingCount] <= 49)
    {
      [(PLBatteryAgent *)self logPPMDebug];
      [(PLBatteryAgent *)self setPpmEventLoggingCount:[(PLBatteryAgent *)self ppmEventLoggingCount] + 1];
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v4 = objc_opt_class();
        uint64_t v13 = MEMORY[0x1E4F143A8];
        uint64_t v14 = 3221225472;
        uint64_t v15 = __35__PLBatteryAgent_handlePPMCallback__block_invoke_2;
        int v16 = &__block_descriptor_40_e5_v8__0lu32l8;
        uint64_t v17 = v4;
        if (handlePPMCallback_defaultOnce_3884 != -1) {
          dispatch_once(&handlePPMCallback_defaultOnce_3884, &v13);
        }
        if (handlePPMCallback_classDebugEnabled)
        {
          uint64_t v5 = NSString;
          int64_t v6 = [(PLBatteryAgent *)self ppmEventLoggingCount];
          uint64_t v7 = objc_msgSend(v5, "stringWithFormat:", @"PPMDebug logging at PPMEvent count %ld", v6, v13, v14, v15, v16, v17, block, v19, v20, v21);
          int v8 = (void *)MEMORY[0x1E4F929B8];
          id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
          id v10 = [v9 lastPathComponent];
          uint64_t v11 = [NSString stringWithUTF8String:"-[PLBatteryAgent handlePPMCallback]"];
          [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:4774];

          int v12 = PLLogCommon();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
    }
  }
}

uint64_t __35__PLBatteryAgent_handlePPMCallback__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] BOOLForKey:*(void *)(a1 + 32) ifNotSet:*(unsigned __int8 *)(a1 + 40)];
  handlePPMCallback_objectForKey = result;
  return result;
}

uint64_t __35__PLBatteryAgent_handlePPMCallback__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handlePPMCallback_classDebugEnabled = result;
  return result;
}

- (void)handleBDCAMALogging:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4
    && ([v4 objectForKeyedSubscript:@"StartTimestamp"],
        int64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:@"StartTimestamp"];
    [v7 doubleValue];
    double v9 = v8 * 1000.0 / 1000000000.0;

    id v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v9];
    uint64_t v11 = [v10 convertFromSystemToMonotonic];
    int v12 = [v5 allKeys];
    uint64_t v13 = (void *)[v12 mutableCopy];

    [v13 removeObject:@"StartTimestamp"];
    uint64_t v14 = PLLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      double v23 = v9;
      __int16 v24 = 2112;
      double v25 = v10;
      __int16 v26 = 2112;
      long long v27 = v11;
      _os_log_impl(&dword_1E4220000, v14, OS_LOG_TYPE_DEFAULT, "[BDC_AMA] StartTimestamp = %f StartDate = %@ StartDateMonotonic = %@", buf, 0x20u);
    }

    uint64_t v15 = [v13 sortedArrayUsingComparator:&__block_literal_global_3893];
    int v16 = PLLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryAgent handleBDCAMALogging:](v15, v16);
    }

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __38__PLBatteryAgent_handleBDCAMALogging___block_invoke_3894;
    void v18[3] = &unk_1E6E48580;
    id v19 = v11;
    long long v20 = self;
    id v21 = v5;
    id v17 = v11;
    [v15 enumerateObjectsUsingBlock:v18];
  }
  else
  {
    id v10 = PLLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PLBatteryAgent handleBDCAMALogging:]();
    }
  }
}

uint64_t __38__PLBatteryAgent_handleBDCAMALogging___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __38__PLBatteryAgent_handleBDCAMALogging___block_invoke_3894(uint64_t a1, void *a2)
{
  int v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v3, "dateByAddingTimeInterval:", (double)objc_msgSend(v4, "integerValue"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = *(void **)(a1 + 40);
  int64_t v6 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];

  [v5 logForSubsystem:@"BatteryDataCollection" category:@"BDC_AMA" data:v6 date:v7];
}

- (void)handleOnDeviceACAMSBC:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    int64_t v6 = [v4 allKeys];
    id v7 = [v6 mutableCopy];

    double v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_3903];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __40__PLBatteryAgent_handleOnDeviceACAMSBC___block_invoke_2;
    v9[3] = &unk_1E6E4B5C0;
    id v10 = v5;
    uint64_t v11 = self;
    [v8 enumerateObjectsUsingBlock:v9];
  }
  else
  {
    id v7 = PLLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PLBatteryAgent handleOnDeviceACAMSBC:]();
    }
  }
}

uint64_t __40__PLBatteryAgent_handleOnDeviceACAMSBC___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __40__PLBatteryAgent_handleOnDeviceACAMSBC___block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"timeSinceLastSBC"];
  [v5 doubleValue];
  int64_t v6 = objc_msgSend(v4, "dateWithTimeIntervalSince1970:");

  id v7 = [v6 convertFromSystemToMonotonic];

  double v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __40__PLBatteryAgent_handleOnDeviceACAMSBC___block_invoke_2_cold_1();
  }

  [*(id *)(a1 + 40) logForSubsystem:@"BatteryIntelligence" category:@"OnDeviceACAMSBC" data:v3 date:v7];
}

- (void)log
{
  [(PLBatteryAgent *)self logEventBackwardBattery];
  [(PLBatteryAgent *)self logEventIntervalGasGauge];
  [(PLBatteryAgent *)self logEABatteryStatistics];
  [(PLBatteryAgent *)self logEventNoneUserType];
}

- (void)fakeLogEntry:(id)a3
{
  id v4 = [a3 userInfo];
  uint64_t v5 = v4;
  if (v4)
  {
    int64_t v6 = [v4 objectForKeyedSubscript:@"entry"];
    if (v6)
    {
      id v7 = [(PLOperator *)self workQueue];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __31__PLBatteryAgent_fakeLogEntry___block_invoke;
      void v8[3] = &unk_1E6E47EB8;
      v8[4] = self;
      id v9 = v6;
      dispatch_async(v7, v8);
    }
  }
}

void __31__PLBatteryAgent_fakeLogEntry___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4E7EF70]();
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    int v12 = __31__PLBatteryAgent_fakeLogEntry___block_invoke_2;
    uint64_t v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v14 = v3;
    if (kPLBatteryAgentStringUserType_block_invoke_8_defaultOnce != -1) {
      dispatch_once(&kPLBatteryAgentStringUserType_block_invoke_8_defaultOnce, &block);
    }
    if (kPLBatteryAgentStringUserType_block_invoke_8_classDebugEnabled)
    {
      id v4 = [NSString stringWithFormat:@"logging fake entry=%@", *(void *)(a1 + 40), block, v11, v12, v13, v14];
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      int64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      id v7 = [v6 lastPathComponent];
      double v8 = [NSString stringWithUTF8String:"-[PLBatteryAgent fakeLogEntry:]_block_invoke"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:4883];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  [*(id *)(a1 + 32) logEntry:*(void *)(a1 + 40)];
}

uint64_t __31__PLBatteryAgent_fakeLogEntry___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLBatteryAgentStringUserType_block_invoke_8_classDebugEnabled = result;
  return result;
}

- (void)logEventPointUPOStepper
{
  id v16 = [(PLBatteryAgent *)self getUPOStepperData];
  if (v16)
  {
    uint64_t v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"UPOStepper"];
    id v4 = [v16 objectForKeyedSubscript:@"upoMetrics"];
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v3 withRawData:v4];
    int64_t v6 = (void *)MEMORY[0x1E4F1C9C8];
    id v7 = [v4 objectForKeyedSubscript:@"timestamp"];
    [v7 doubleValue];
    double v8 = objc_msgSend(v6, "dateWithTimeIntervalSince1970:");

    id v9 = [v8 convertFromSystemToMonotonic];
    [v5 setObject:v9 forKeyedSubscript:@"BatteryShutdownTimestamp"];

    id v10 = [v16 objectForKeyedSubscript:@"mitigatedUPOCount"];
    [v5 setObject:v10 forKeyedSubscript:@"mitigatedUPOCount"];

    uint64_t v11 = [v5 objectForKeyedSubscript:@"mitigatedUPOCount"];
    [v11 intValue];
    ADClientSetValueForScalarKey();

    int v12 = [v5 objectForKeyedSubscript:@"mitigationState"];
    [v12 intValue];
    ADClientSetValueForScalarKey();

    uint64_t v13 = [v5 objectForKeyedSubscript:@"timeWindow"];
    [v13 intValue];
    ADClientSetValueForScalarKey();

    uint64_t v14 = [v5 objectForKeyedSubscript:@"trueRa"];
    [v14 intValue];
    ADClientSetValueForScalarKey();

    uint64_t v15 = [v5 objectForKeyedSubscript:@"virtualRa"];
    [v15 intValue];
    ADClientSetValueForScalarKey();

    [(PLOperator *)self logEntry:v5];
  }
}

- (void)logEventPointBatteryUIVisit
{
  if (([MEMORY[0x1E4F929C0] objectExistsForKey:@"BUIVisitDefaultKey"] & 1) == 0) {
    [MEMORY[0x1E4F929C0] setObject:MEMORY[0x1E4F1CC38] forKey:@"BUIVisitDefaultKey" saveToDisk:1];
  }
  id v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"BatteryUIVisit"];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4];
  [v3 setObject:&unk_1F400E098 forKeyedSubscript:@"Visit"];
  [(PLOperator *)self logEntry:v3];
}

- (void)logEventPointBatteryHealthUIVisit
{
  if (([MEMORY[0x1E4F929C0] objectExistsForKey:@"BUIVisitDefaultKey"] & 1) == 0) {
    [MEMORY[0x1E4F929C0] setObject:MEMORY[0x1E4F1CC38] forKey:@"BUIVisitDefaultKey" saveToDisk:1];
  }
  id v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"BatteryUIVisit"];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4];
  [v3 setObject:&unk_1F400E0B0 forKeyedSubscript:@"Visit"];
  [(PLOperator *)self logEntry:v3];
}

- (void)logEventPointBatteryChargingUIVisit
{
  if (([MEMORY[0x1E4F929C0] objectExistsForKey:@"BUIVisitDefaultKey"] & 1) == 0) {
    [MEMORY[0x1E4F929C0] setObject:MEMORY[0x1E4F1CC38] forKey:@"BUIVisitDefaultKey" saveToDisk:1];
  }
  id v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"BatteryUIVisit"];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4];
  [v3 setObject:&unk_1F400E0C8 forKeyedSubscript:@"Visit"];
  [(PLOperator *)self logEntry:v3];
}

- (void)logEventForwardLPEM
{
  if ([MEMORY[0x1E4F92A38] hasLPEM])
  {
    uint64_t v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"IOPMUBootLPMLog"];
    CFMutableDictionaryRef v4 = IOServiceMatching("IOService");
    if (v4)
    {
      uint64_t v5 = v4;
      valuePtr[0] = 0;
      CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, valuePtr);
      CFDictionaryRef v7 = CFDictionaryCreate(v6, (const void **)logEventForwardLPEM_dictKey, (const void **)&values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      if (v7)
      {
        CFDictionaryRef v8 = v7;
        CFDictionarySetValue(v5, @"IOPropertyMatch", v7);
        CFRelease(v8);
        uint64_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E4F2EF00], v5);
        if (MatchingService)
        {
          io_object_t v10 = MatchingService;
          uint64_t v11 = [MEMORY[0x1E4F92A00] snapshotFromIOEntry:MatchingService];
          int v12 = v11;
          if (v11)
          {
            uint64_t v13 = [v11 objectForKeyedSubscript:@"IOPMUBootLPMLog"];

            if (v13)
            {
              uint64_t v14 = [v12 objectForKeyedSubscript:@"IOPMUBootLPMLog"];
              uint64_t v15 = [v14 objectForKeyedSubscript:@"TMS0"];
              uint64_t v16 = [v15 unsignedIntegerValue];

              id v17 = [v12 objectForKeyedSubscript:@"IOPMUBootLPMLog"];
              uint64_t v18 = [v17 objectForKeyedSubscript:@"TMSc"];
              uint64_t v19 = [v18 unsignedIntegerValue];

              long long v20 = [(PLOperator *)self storage];
              id v21 = [v20 lastEntryForKey:v3];

              if (v21)
              {
                uint64_t v22 = [v21 objectForKeyedSubscript:@"TMS0"];
                if ([v22 unsignedIntegerValue] == v16)
                {
                  double v23 = [v21 objectForKeyedSubscript:@"TMSc"];
                  BOOL v24 = [v23 unsignedIntegerValue] != v19;
                }
                else
                {
                  BOOL v24 = 1;
                }
              }
              else
              {
                BOOL v24 = 1;
              }
              if (v16 && v19 && v24)
              {
                double v25 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v3];
                __int16 v26 = (void *)MEMORY[0x1E4F28ED0];
                long long v27 = [MEMORY[0x1E4F92A78] sharedInstance];
                [v27 currentTimeFromTimeReference:2 toTimeReference:2];
                uint64_t v28 = v74 = v21;
                [v28 timeIntervalSince1970];
                v75 = objc_msgSend(v26, "numberWithDouble:");

                id v29 = [v12 objectForKeyedSubscript:@"IOPMUBootLPMLog"];
                uint64_t v30 = [v29 objectForKeyedSubscript:@"TMS0"];
                [v25 setObject:v30 forKeyedSubscript:@"TMS0"];

                double v31 = [v12 objectForKeyedSubscript:@"IOPMUBootLPMLog"];
                id v32 = [v31 objectForKeyedSubscript:@"CAPA"];
                [v25 setObject:v32 forKeyedSubscript:@"CAPA"];

                uint64_t v33 = [v12 objectForKeyedSubscript:@"IOPMUBootLPMLog"];
                double v34 = [v33 objectForKeyedSubscript:@"CCCs"];
                [v25 setObject:v34 forKeyedSubscript:@"CCCs"];

                id v35 = [v12 objectForKeyedSubscript:@"IOPMUBootLPMLog"];
                double v36 = [v35 objectForKeyedSubscript:@"PDD0"];
                [v25 setObject:v36 forKeyedSubscript:@"PDD0"];

                __int16 v37 = [v12 objectForKeyedSubscript:@"IOPMUBootLPMLog"];
                long long v38 = [v37 objectForKeyedSubscript:@"PDDc"];
                [v25 setObject:v38 forKeyedSubscript:@"PDDc"];

                long long v39 = [v12 objectForKeyedSubscript:@"IOPMUBootLPMLog"];
                long long v40 = [v39 objectForKeyedSubscript:@"GGTm"];
                [v25 setObject:v40 forKeyedSubscript:@"GGTm"];

                long long v41 = [v12 objectForKeyedSubscript:@"IOPMUBootLPMLog"];
                long long v42 = [v41 objectForKeyedSubscript:@"VOLT"];
                [v25 setObject:v42 forKeyedSubscript:@"VOLT"];

                __int16 v43 = [v12 objectForKeyedSubscript:@"IOPMUBootLPMLog"];
                double v44 = [v43 objectForKeyedSubscript:@"STAT"];
                [v25 setObject:v44 forKeyedSubscript:@"STAT"];

                __int16 v45 = [v12 objectForKeyedSubscript:@"IOPMUBootLPMLog"];
                int v46 = [v45 objectForKeyedSubscript:@"TMSc"];
                [v25 setObject:v46 forKeyedSubscript:@"TMSc"];

                double v47 = [v12 objectForKeyedSubscript:@"IOPMUBootLPMLog"];
                uint64_t v48 = [v47 objectForKeyedSubscript:@"CCCu"];
                [v25 setObject:v48 forKeyedSubscript:@"CCCu"];

                v49 = [v12 objectForKeyedSubscript:@"IOPMUBootLPMLog"];
                v50 = [v49 objectForKeyedSubscript:@"BTLC"];
                [v25 setObject:v50 forKeyedSubscript:@"BTLC"];

                [v25 setObject:v75 forKeyedSubscript:@"CurrentTimeRTC"];
                [(PLOperator *)self logEntry:v25];
                ADClientSetValueForScalarKey();
                [v75 longLongValue];
                ADClientSetValueForScalarKey();
                v51 = [v12 objectForKeyedSubscript:@"IOPMUBootLPMLog"];
                v52 = [v51 objectForKeyedSubscript:@"CAPA"];
                [v52 unsignedLongLongValue];
                ADClientSetValueForScalarKey();

                uint64_t v53 = [v12 objectForKeyedSubscript:@"IOPMUBootLPMLog"];
                uint64_t v54 = [v53 objectForKeyedSubscript:@"CCCs"];
                [v54 unsignedLongLongValue];
                ADClientSetValueForScalarKey();

                v55 = [v12 objectForKeyedSubscript:@"IOPMUBootLPMLog"];
                double v56 = [v55 objectForKeyedSubscript:@"PDD0"];
                [v56 unsignedLongLongValue];
                ADClientSetValueForScalarKey();

                double v57 = [v12 objectForKeyedSubscript:@"IOPMUBootLPMLog"];
                v58 = [v57 objectForKeyedSubscript:@"PDDc"];
                [v58 unsignedLongLongValue];
                ADClientSetValueForScalarKey();

                v59 = [v12 objectForKeyedSubscript:@"IOPMUBootLPMLog"];
                uint64_t v60 = [v59 objectForKeyedSubscript:@"GGTm"];
                [v60 unsignedLongLongValue];
                ADClientSetValueForScalarKey();

                double v61 = [v12 objectForKeyedSubscript:@"IOPMUBootLPMLog"];
                double v62 = [v61 objectForKeyedSubscript:@"VOLT"];
                [v62 unsignedLongLongValue];
                ADClientSetValueForScalarKey();

                v63 = [v12 objectForKeyedSubscript:@"IOPMUBootLPMLog"];
                double v64 = [v63 objectForKeyedSubscript:@"STAT"];
                [v64 unsignedLongLongValue];
                ADClientSetValueForScalarKey();

                BOOL v65 = [v12 objectForKeyedSubscript:@"IOPMUBootLPMLog"];
                v66 = [v65 objectForKeyedSubscript:@"CCCu"];
                [v66 unsignedLongLongValue];
                ADClientSetValueForScalarKey();

                id v67 = [v12 objectForKeyedSubscript:@"IOPMUBootLPMLog"];
                v68 = [v67 objectForKeyedSubscript:@"BTLC"];
                [v68 unsignedLongLongValue];
                ADClientSetValueForScalarKey();

                v69 = [v12 objectForKeyedSubscript:@"IOPMUBootLPMLog"];
                unint64_t v70 = [v69 objectForKeyedSubscript:@"CCCn"];
                [v70 unsignedLongLongValue];
                ADClientSetValueForScalarKey();

                v71 = [v12 objectForKeyedSubscript:@"IOPMUBootLPMLog"];
                v72 = [v71 objectForKeyedSubscript:@"STAT"];
                [v72 unsignedCharValue];

                id v21 = v74;
                ADClientSetValueForScalarKey();
                ADClientSetValueForScalarKey();
                ADClientSetValueForScalarKey();
                id v76 = v12;
                id v73 = v75;
                AnalyticsSendEventLazy();
              }
            }
          }
          IOObjectRelease(v10);
        }
      }
      else
      {
        CFRelease(v5);
      }
    }
  }
}

id __37__PLBatteryAgent_logEventForwardLPEM__block_invoke(uint64_t a1)
{
  v48[15] = *MEMORY[0x1E4F143B8];
  v47[0] = @"tmsdiff";
  int v46 = [MEMORY[0x1E4F28ED0] numberWithLongLong:*(void *)(a1 + 48) - *(void *)(a1 + 56)];
  v48[0] = v46;
  v47[1] = @"tmsdifftms0";
  __int16 v45 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", *(void *)(a1 + 48) - objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  v48[1] = v45;
  void v47[2] = @"capa";
  id v2 = (void *)MEMORY[0x1E4F28ED0];
  double v44 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"IOPMUBootLPMLog"];
  __int16 v43 = [v44 objectForKeyedSubscript:@"CAPA"];
  long long v42 = objc_msgSend(v2, "numberWithUnsignedLongLong:", objc_msgSend(v43, "unsignedLongLongValue"));
  void v48[2] = v42;
  v47[3] = @"cccs";
  uint64_t v3 = (void *)MEMORY[0x1E4F28ED0];
  long long v41 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"IOPMUBootLPMLog"];
  long long v40 = [v41 objectForKeyedSubscript:@"CCCs"];
  long long v39 = objc_msgSend(v3, "numberWithUnsignedLongLong:", objc_msgSend(v40, "unsignedLongLongValue"));
  v48[3] = v39;
  v47[4] = @"pdd0";
  CFMutableDictionaryRef v4 = (void *)MEMORY[0x1E4F28ED0];
  long long v38 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"IOPMUBootLPMLog"];
  __int16 v37 = [v38 objectForKeyedSubscript:@"PDD0"];
  double v36 = objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(v37, "unsignedLongLongValue"));
  v48[4] = v36;
  v47[5] = @"pddc";
  uint64_t v5 = (void *)MEMORY[0x1E4F28ED0];
  id v35 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"IOPMUBootLPMLog"];
  double v34 = [v35 objectForKeyedSubscript:@"PDDc"];
  uint64_t v33 = objc_msgSend(v5, "numberWithUnsignedLongLong:", objc_msgSend(v34, "unsignedLongLongValue"));
  v48[5] = v33;
  v47[6] = @"ggtm";
  CFAllocatorRef v6 = (void *)MEMORY[0x1E4F28ED0];
  id v32 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"IOPMUBootLPMLog"];
  double v31 = [v32 objectForKeyedSubscript:@"GGTm"];
  uint64_t v30 = objc_msgSend(v6, "numberWithUnsignedLongLong:", objc_msgSend(v31, "unsignedLongLongValue"));
  v48[6] = v30;
  v47[7] = @"volt";
  CFDictionaryRef v7 = (void *)MEMORY[0x1E4F28ED0];
  id v29 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"IOPMUBootLPMLog"];
  uint64_t v28 = [v29 objectForKeyedSubscript:@"VOLT"];
  long long v27 = objc_msgSend(v7, "numberWithUnsignedLongLong:", objc_msgSend(v28, "unsignedLongLongValue"));
  v48[7] = v27;
  v47[8] = @"stat";
  CFDictionaryRef v8 = (void *)MEMORY[0x1E4F28ED0];
  __int16 v26 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"IOPMUBootLPMLog"];
  double v25 = [v26 objectForKeyedSubscript:@"STAT"];
  BOOL v24 = objc_msgSend(v8, "numberWithUnsignedLongLong:", objc_msgSend(v25, "unsignedLongLongValue"));
  v48[8] = v24;
  v47[9] = @"cccu";
  id v9 = (void *)MEMORY[0x1E4F28ED0];
  double v23 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"IOPMUBootLPMLog"];
  uint64_t v22 = [v23 objectForKeyedSubscript:@"CCCu"];
  io_object_t v10 = objc_msgSend(v9, "numberWithUnsignedLongLong:", objc_msgSend(v22, "unsignedLongLongValue"));
  v48[9] = v10;
  v47[10] = @"btlc";
  uint64_t v11 = (void *)MEMORY[0x1E4F28ED0];
  int v12 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"IOPMUBootLPMLog"];
  uint64_t v13 = [v12 objectForKeyedSubscript:@"BTLC"];
  uint64_t v14 = objc_msgSend(v11, "numberWithUnsignedLongLong:", objc_msgSend(v13, "unsignedLongLongValue"));
  v48[10] = v14;
  v47[11] = @"cccn";
  uint64_t v15 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"IOPMUBootLPMLog"];
  uint64_t v16 = [v15 objectForKeyedSubscript:@"CCCn"];
  v48[11] = v16;
  v47[12] = @"uvlo0";
  id v17 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:(*(unsigned __int8 *)(a1 + 102) >> 2) & 1];
  v48[12] = v17;
  v47[13] = @"uvlo1";
  uint64_t v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:(*(unsigned __int8 *)(a1 + 102) >> 3) & 1];
  v48[13] = v18;
  v47[14] = @"uvlo2";
  uint64_t v19 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:(*(unsigned __int8 *)(a1 + 102) >> 4) & 1];
  v48[14] = v19;
  long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:15];

  return v20;
}

- (id)getPPMDebugData
{
  mach_port_t v2 = *MEMORY[0x1E4F2EF00];
  CFDictionaryRef v3 = IOServiceMatching("ApplePPM");
  uint64_t MatchingService = IOServiceGetMatchingService(v2, v3);
  if (MatchingService)
  {
    uint64_t v5 = [MEMORY[0x1E4F92A00] snapshotFromIOEntry:MatchingService];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (void)logPPMDebug
{
  v71[1] = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v3 = [(PLBatteryAgent *)self getPPMDebugData];
  if (v3)
  {
    uint64_t v4 = *MEMORY[0x1E4F92D48];
    uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"PPMDebug"];
    v69 = +[PLOperator entryKeyForType:v4 andName:@"PPMClientMetrics"];
    CFAllocatorRef v6 = [v3 objectForKeyedSubscript:@"PPMVector"];
    CFDictionaryRef v7 = v6;
    if (v6 && [v6 count])
    {
      v68 = v3;
      CFDictionaryRef v8 = [v7 objectForKeyedSubscript:@"PPMBatteryModel"];
      id v67 = v5;
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
      io_object_t v10 = (void *)MEMORY[0x1E4F1C9C8];
      uint64_t v11 = [v7 objectForKeyedSubscript:@"TStamp"];
      [v11 doubleValue];
      uint64_t v13 = [v10 dateWithTimeIntervalSince1970:v12 / 1000000000.0];
      uint64_t v14 = [v13 convertFromSystemToMonotonic];

      [v9 setObject:v14 forKeyedSubscript:@"TStamp"];
      uint64_t v15 = [v7 objectForKeyedSubscript:@"BaselineSysCap"];
      uint64_t v16 = [v15 objectAtIndex:0];
      [v9 setObject:v16 forKeyedSubscript:@"BaselineSysCap"];

      id v17 = [v7 objectForKeyedSubscript:@"ModeledSysCap"];
      uint64_t v18 = [v17 objectAtIndex:0];
      [v9 setObject:v18 forKeyedSubscript:@"ModeledSysCap"];

      uint64_t v19 = [v7 objectForKeyedSubscript:@"NetSysCap"];
      long long v20 = [v19 objectAtIndex:0];
      [v9 setObject:v20 forKeyedSubscript:@"NetSysCap"];

      id v21 = [v7 objectForKeyedSubscript:@"OverrideSysCap"];
      uint64_t v22 = [v21 objectAtIndex:0];
      [v9 setObject:v22 forKeyedSubscript:@"OverrideSysCap"];

      double v23 = [v7 objectForKeyedSubscript:@"ProactiveSysCap"];
      BOOL v24 = [v23 objectAtIndex:0];
      [v9 setObject:v24 forKeyedSubscript:@"ProactiveSysCap"];

      double v25 = [v7 objectForKeyedSubscript:@"TotalDemandAdj"];
      __int16 v26 = [v25 objectAtIndex:0];
      [v9 setObject:v26 forKeyedSubscript:@"TotalDemandAdj"];

      long long v27 = [v7 objectForKeyedSubscript:@"TotalDemandRaw"];
      uint64_t v28 = [v27 objectAtIndex:0];
      [v9 setObject:v28 forKeyedSubscript:@"TotalDemandRaw"];

      if (v8)
      {
        id v29 = [v8 objectForKeyedSubscript:@"baselineR0"];
        [v9 setObject:v29 forKeyedSubscript:@"baselineR0"];

        uint64_t v30 = [v8 objectForKeyedSubscript:@"baselineR1"];
        [v9 setObject:v30 forKeyedSubscript:@"baselineR1"];

        double v31 = [v8 objectForKeyedSubscript:@"baselineR2"];
        [v9 setObject:v31 forKeyedSubscript:@"baselineR2"];

        id v32 = [v8 objectForKeyedSubscript:@"baselineR3"];
        [v9 setObject:v32 forKeyedSubscript:@"baselineR3"];

        uint64_t v33 = [v8 objectForKeyedSubscript:@"avgRdcRatio"];
        [v9 setObject:v33 forKeyedSubscript:@"avgRdcRatio"];

        double v34 = [v8 objectForKeyedSubscript:@"R0"];
        [v9 setObject:v34 forKeyedSubscript:@"R0"];

        id v35 = [v8 objectForKeyedSubscript:@"R1"];
        [v9 setObject:v35 forKeyedSubscript:@"R1"];

        double v36 = [v8 objectForKeyedSubscript:@"R2"];
        [v9 setObject:v36 forKeyedSubscript:@"R2"];

        __int16 v37 = [v8 objectForKeyedSubscript:@"R3"];
        [v9 setObject:v37 forKeyedSubscript:@"R3"];

        long long v38 = [v8 objectForKeyedSubscript:@"Iss"];
        [v9 setObject:v38 forKeyedSubscript:@"Iss"];

        long long v39 = [v8 objectForKeyedSubscript:@"outputFlag"];
        [v9 setObject:v39 forKeyedSubscript:@"outputFlag"];

        long long v40 = [v8 objectForKeyedSubscript:@"Ps"];
        [v9 setObject:v40 forKeyedSubscript:@"Ps"];

        long long v41 = [v8 objectForKeyedSubscript:@"Pb"];
        [v9 setObject:v41 forKeyedSubscript:@"Pb"];

        long long v42 = [v8 objectForKeyedSubscript:@"Pp"];
        [v9 setObject:v42 forKeyedSubscript:@"Pp"];

        if (+[PLBatteryAgent shouldLogPPMDebugDetail])
        {
          __int16 v43 = [v8 objectForKeyedSubscript:@"mPb"];
          [v9 setObject:v43 forKeyedSubscript:@"mPb"];

          double v44 = [v8 objectForKeyedSubscript:@"mPp"];
          [v9 setObject:v44 forKeyedSubscript:@"mPp"];

          __int16 v45 = [v8 objectForKeyedSubscript:@"Vgg"];
          [v9 setObject:v45 forKeyedSubscript:@"Vgg"];

          int v46 = [v7 objectForKeyedSubscript:@"DroopCtrlEff"];

          if (v46)
          {
            double v47 = [v7 objectForKeyedSubscript:@"DroopCtrlEff"];
            uint64_t v48 = [v47 objectAtIndex:0];
            [v9 setObject:v48 forKeyedSubscript:@"DroopCtrlEff"];
          }
        }
      }
      v66 = v8;
      BOOL v65 = v9;
      [(PLOperator *)self logEntry:v9];
      v49 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v50 = 0;
      do
      {
        v51 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v69];
        v52 = objc_msgSend(NSString, "stringWithFormat:", @"Client%d", v50);
        uint64_t v53 = [v7 objectForKeyedSubscript:v52];

        if (v53)
        {
          uint64_t v54 = v7;
          v55 = [v7 objectForKeyedSubscript:v52];
          [v51 setObject:v14 forKeyedSubscript:@"TStamp"];
          double v56 = [MEMORY[0x1E4F28ED0] numberWithInt:v50];
          [v51 setObject:v56 forKeyedSubscript:@"Client"];

          double v57 = [v55 objectForKeyedSubscript:@"Car"];
          v58 = [v57 objectAtIndex:0];
          [v51 setObject:v58 forKeyedSubscript:@"Car"];

          v59 = [v55 objectForKeyedSubscript:@"Pwr"];
          uint64_t v60 = [v59 objectAtIndex:0];
          [v51 setObject:v60 forKeyedSubscript:@"Pwr"];

          double v61 = [v55 objectForKeyedSubscript:@"Idx"];
          [v51 setObject:v61 forKeyedSubscript:@"Idx"];

          double v62 = [v55 objectForKeyedSubscript:@"Bdg"];
          [v51 setObject:v62 forKeyedSubscript:@"Bdg"];

          if (+[PLBatteryAgent shouldLogPPMDebugDetail])
          {
            v63 = [v55 objectForKeyedSubscript:@"reqBdg"];
            [v51 setObject:v63 forKeyedSubscript:@"reqBdg"];
          }
          [v49 addObject:v51];

          CFDictionaryRef v7 = v54;
        }

        uint64_t v50 = (v50 + 1);
      }
      while (v50 != 20);
      unint64_t v70 = v69;
      v71[0] = v49;
      double v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:&v70 count:1];
      [(PLOperator *)self logEntries:v64 withGroupID:v69];

      uint64_t v5 = v67;
      CFDictionaryRef v3 = v68;
    }
  }
}

- (void)logEventIntervalGasGauge
{
  BOOL v3 = [(PLBatteryAgent *)self allowGasGaugeRead];
  int v4 = [MEMORY[0x1E4F929C0] debugEnabled];
  if (v3)
  {
    if (v4)
    {
      uint64_t v5 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__PLBatteryAgent_logEventIntervalGasGauge__block_invoke;
      block[3] = &unk_1E6E4A300;
      uint64_t v28 = @"GasGauge";
      uint64_t v29 = v5;
      if (logEventIntervalGasGauge_defaultOnce != -1) {
        dispatch_once(&logEventIntervalGasGauge_defaultOnce, block);
      }
      int v6 = logEventIntervalGasGauge_classDebugEnabled;

      if (v6)
      {
        CFDictionaryRef v7 = [NSString stringWithFormat:@"reading the GasGauge"];
        CFDictionaryRef v8 = (void *)MEMORY[0x1E4F929B8];
        id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
        io_object_t v10 = [v9 lastPathComponent];
        uint64_t v11 = [NSString stringWithUTF8String:"-[PLBatteryAgent logEventIntervalGasGauge]"];
        [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:5146];

        double v12 = PLLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    [(PLBatteryAgent *)self gasGaugeRead];
  }
  else if (v4)
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    double v23 = __42__PLBatteryAgent_logEventIntervalGasGauge__block_invoke_4060;
    BOOL v24 = &unk_1E6E4A300;
    double v25 = @"GasGauge";
    uint64_t v26 = v13;
    if (logEventIntervalGasGauge_defaultOnce_4058 != -1) {
      dispatch_once(&logEventIntervalGasGauge_defaultOnce_4058, &v21);
    }
    int v14 = logEventIntervalGasGauge_classDebugEnabled_4059;

    if (v14)
    {
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"no reading the GasGauge allowed!", v21, v22, v23, v24);
      uint64_t v16 = (void *)MEMORY[0x1E4F929B8];
      id v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      uint64_t v18 = [v17 lastPathComponent];
      uint64_t v19 = [NSString stringWithUTF8String:"-[PLBatteryAgent logEventIntervalGasGauge]"];
      [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:5149];

      long long v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __42__PLBatteryAgent_logEventIntervalGasGauge__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  logEventIntervalGasGauge_classDebugEnabled = result;
  return result;
}

uint64_t __42__PLBatteryAgent_logEventIntervalGasGauge__block_invoke_4060(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  logEventIntervalGasGauge_classDebugEnabled_4059 = result;
  return result;
}

- (void)logEventPointChargingInfoWithChargingData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"ChargingInfo"];
    int v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
    CFDictionaryRef v7 = [MEMORY[0x1E4F28ED0] numberWithInt:self->_prevConnectedState];
    [v6 setObject:v7 forKeyedSubscript:@"Connected"];

    CFDictionaryRef v8 = [MEMORY[0x1E4F28ED0] numberWithInt:self->_prevChargingState];
    [v6 setObject:v8 forKeyedSubscript:@"Charging"];

    id v9 = [v4 objectForKeyedSubscript:@"DriverState"];
    [v6 setObject:v9 forKeyedSubscript:@"DriverState"];

    io_object_t v10 = [v4 objectForKeyedSubscript:@"DriverStatusBits"];
    [v6 setObject:v10 forKeyedSubscript:@"DriverStatusBits"];

    uint64_t v11 = [v4 objectForKeyedSubscript:@"FirmwareStatus"];
    [v6 setObject:v11 forKeyedSubscript:@"FirmwareStatus"];

    double v12 = [v4 objectForKeyedSubscript:@"Frequency"];
    [v6 setObject:v12 forKeyedSubscript:@"Frequency"];

    uint64_t v13 = [v4 objectForKeyedSubscript:@"RectifierCurrent"];
    [v6 setObject:v13 forKeyedSubscript:@"RectifierCurrent"];

    int v14 = [v4 objectForKeyedSubscript:@"RectifierVoltage"];
    [v6 setObject:v14 forKeyedSubscript:@"RectifierVoltage"];

    uint64_t v15 = [v4 objectForKeyedSubscript:@"PowerTarget"];
    [v6 setObject:v15 forKeyedSubscript:@"PowerTarget"];

    uint64_t v16 = [v4 objectForKeyedSubscript:@"VoltageTarget"];
    [v6 setObject:v16 forKeyedSubscript:@"VoltageTarget"];

    id v17 = [v4 objectForKeyedSubscript:@"PowerBudget"];
    [v6 setObject:v17 forKeyedSubscript:@"PowerBudget"];

    uint64_t v18 = [v4 objectForKeyedSubscript:@"TxGain1"];
    [v6 setObject:v18 forKeyedSubscript:@"TxGain1"];

    uint64_t v19 = [v4 objectForKeyedSubscript:@"TxGain2"];
    [v6 setObject:v19 forKeyedSubscript:@"TxGain2"];

    long long v20 = [v4 objectForKeyedSubscript:@"TxVersion"];
    [v6 setObject:v20 forKeyedSubscript:@"TxVersion"];

    uint64_t v21 = [v4 objectForKeyedSubscript:@"SignalStrength"];
    [v6 setObject:v21 forKeyedSubscript:@"SignalStrength"];

    uint64_t v22 = [v4 objectForKeyedSubscript:@"NotCloakReason"];
    [v6 setObject:v22 forKeyedSubscript:@"NotCloakReason"];

    double v23 = [v4 objectForKeyedSubscript:@"ModDepth"];
    [v6 setObject:v23 forKeyedSubscript:@"ModDepth"];

    BOOL v24 = [v4 objectForKeyedSubscript:@"HighFreq"];
    [v6 setObject:v24 forKeyedSubscript:@"HighFreq"];

    double v25 = [v4 objectForKeyedSubscript:@"CloakReason"];
    [v6 setObject:v25 forKeyedSubscript:@"CloakReason"];

    uint64_t v26 = [v4 objectForKeyedSubscript:@"InductiveFWMode"];
    [v6 setObject:v26 forKeyedSubscript:@"InductiveFWMode"];

    long long v27 = [v4 objectForKeyedSubscript:@"OVPCount"];
    [v6 setObject:v27 forKeyedSubscript:@"OVPCount"];

    uint64_t v28 = [v4 objectForKeyedSubscript:@"MagnetAttach"];
    [v6 setObject:v28 forKeyedSubscript:@"MagnetAttach"];

    uint64_t v29 = [v4 objectForKeyedSubscript:@"PTxType"];
    [v6 setObject:v29 forKeyedSubscript:@"PTxType"];

    uint64_t v30 = [v4 objectForKeyedSubscript:@"PowerNegotiable"];
    [v6 setObject:v30 forKeyedSubscript:@"PowerNegotiable"];

    double v31 = [v4 objectForKeyedSubscript:@"PowerLimitReason"];
    [v6 setObject:v31 forKeyedSubscript:@"PowerLimitReason"];

    id v32 = [v4 objectForKeyedSubscript:@"PowerPotential"];
    [v6 setObject:v32 forKeyedSubscript:@"PowerPotential"];

    uint64_t v33 = [v4 objectForKeyedSubscript:@"Prect"];
    [v6 setObject:v33 forKeyedSubscript:@"Prect"];

    double v34 = [v4 objectForKeyedSubscript:@"IlimTarget"];
    [v6 setObject:v34 forKeyedSubscript:@"IlimTarget"];

    id v35 = [v4 objectForKeyedSubscript:@"IlimHeadroom"];
    [v6 setObject:v35 forKeyedSubscript:@"IlimHeadroom"];

    double v36 = [v4 objectForKeyedSubscript:@"TxGain3"];
    [v6 setObject:v36 forKeyedSubscript:@"TxGain3"];

    __int16 v37 = [v4 objectForKeyedSubscript:@"TxGain4"];
    [v6 setObject:v37 forKeyedSubscript:@"TxGain4"];

    long long v38 = [v4 objectForKeyedSubscript:@"PowerProfile"];
    [v6 setObject:v38 forKeyedSubscript:@"PowerProfile"];

    long long v39 = [v4 objectForKeyedSubscript:@"PowerProfSwitch"];
    [v6 setObject:v39 forKeyedSubscript:@"PowerProfSwitch"];

    long long v40 = [v4 objectForKeyedSubscript:@"TxKest"];
    [v6 setObject:v40 forKeyedSubscript:@"TxKest"];

    long long v41 = [v4 objectForKeyedSubscript:@"RxQippVer"];
    [v6 setObject:v41 forKeyedSubscript:@"RxQippVer"];

    long long v42 = [v4 objectForKeyedSubscript:@"DplossStat"];
    [v6 setObject:v42 forKeyedSubscript:@"DplossStat"];

    __int16 v43 = [v4 objectForKeyedSubscript:@"MainCurrent"];
    [v6 setObject:v43 forKeyedSubscript:@"MainCurrent"];

    double v44 = [v4 objectForKeyedSubscript:@"AuthFodStatus"];
    [v6 setObject:v44 forKeyedSubscript:@"AuthFodStatus"];

    __int16 v45 = [v4 objectForKeyedSubscript:@"InductiveCoexStatus"];
    [v6 setObject:v45 forKeyedSubscript:@"InductiveCoexStatus"];

    int v46 = [v4 objectForKeyedSubscript:@"VMID"];
    [v6 setObject:v46 forKeyedSubscript:@"VMID"];

    double v47 = [v4 objectForKeyedSubscript:@"PowerConverterStatus"];
    [v6 setObject:v47 forKeyedSubscript:@"PowerConverterStatus"];

    uint64_t v48 = [v4 objectForKeyedSubscript:@"CommStatus"];
    [v6 setObject:v48 forKeyedSubscript:@"CommStatus"];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v49 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v61 = 3221225472;
      double v62 = __60__PLBatteryAgent_logEventPointChargingInfoWithChargingData___block_invoke;
      v63 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v64 = v49;
      if (logEventPointChargingInfoWithChargingData__defaultOnce != -1) {
        dispatch_once(&logEventPointChargingInfoWithChargingData__defaultOnce, &block);
      }
      if (logEventPointChargingInfoWithChargingData__classDebugEnabled)
      {
        uint64_t v50 = [NSString stringWithFormat:@"Charging Data: %@", v4, block, v61, v62, v63, v64];
        v51 = (void *)MEMORY[0x1E4F929B8];
        v52 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
        uint64_t v53 = [v52 lastPathComponent];
        uint64_t v54 = [NSString stringWithUTF8String:"-[PLBatteryAgent logEventPointChargingInfoWithChargingData:]"];
        [v51 logMessage:v50 fromFile:v53 fromFunction:v54 fromLineNumber:5201];

        v55 = PLLogCommon();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    if (!self->_entryChargingOld
      || ([(PLBatteryAgent *)self entryChargingOld],
          double v56 = objc_claimAutoreleasedReturnValue(),
          uint64_t v57 = [v6 compare:v56],
          v56,
          v57))
    {
      [(PLOperator *)self logEntry:v6];
    }
    [(PLBatteryAgent *)self setEntryChargingOld:v6];
    if ((self->_prevChargingState & 0x1B) != 0
      || ([v6 objectForKeyedSubscript:@"DriverState"],
          v58 = objc_claimAutoreleasedReturnValue(),
          BOOL v59 = [(PLBatteryAgent *)self driverActive:v58],
          v58,
          v59))
    {
      [(PLBatteryAgent *)self logChargingParametersToAggd:v4];
    }
  }
}

uint64_t __60__PLBatteryAgent_logEventPointChargingInfoWithChargingData___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointChargingInfoWithChargingData__classDebugEnabled = result;
  return result;
}

- (BOOL)driverActive:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  BOOL v5 = v3 && [v3 intValue] == 3;

  return v5;
}

- (void)logChargingParametersToAggd:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int prevChargingState = self->_prevChargingState;
    if (prevChargingState == 8) {
      int v6 = @"com.apple.power.state.b3.rectifierVoltage";
    }
    else {
      int v6 = @"com.apple.power.state.rectifierVoltage";
    }
    if (prevChargingState == 8) {
      CFDictionaryRef v7 = @"com.apple.power.state.b3.rectifierCurrent";
    }
    else {
      CFDictionaryRef v7 = @"com.apple.power.state.rectifierCurrent";
    }
    CFDictionaryRef v8 = objc_opt_new();
    id v9 = [v4 objectForKeyedSubscript:@"Frequency"];

    if (v9)
    {
      if (prevChargingState == 8) {
        io_object_t v10 = @"com.apple.power.state.b3.frequency";
      }
      else {
        io_object_t v10 = @"com.apple.power.state.frequency";
      }
      uint64_t v11 = [v4 objectForKeyedSubscript:@"Frequency"];
      [v11 doubleValue];
      double v13 = v12;

      MEMORY[0x1E4E7E350](v10, v13);
      int v14 = [MEMORY[0x1E4F28ED0] numberWithDouble:v13];
      [v8 setObject:v14 forKeyedSubscript:@"Frequency"];
    }
    uint64_t v15 = [v4 objectForKeyedSubscript:@"RectifierCurrent"];

    if (v15)
    {
      uint64_t v16 = [v4 objectForKeyedSubscript:@"RectifierCurrent"];
      [v16 doubleValue];
      double v18 = v17;

      MEMORY[0x1E4E7E350](v7, v18);
      uint64_t v19 = [MEMORY[0x1E4F28ED0] numberWithDouble:v18];
      [v8 setObject:v19 forKeyedSubscript:@"RectifierCurrent"];
    }
    long long v20 = [v4 objectForKeyedSubscript:@"RectifierVoltage"];

    if (v20)
    {
      uint64_t v21 = [v4 objectForKeyedSubscript:@"RectifierVoltage"];
      [v21 doubleValue];
      double v23 = v22;

      MEMORY[0x1E4E7E350](v6, v23);
      BOOL v24 = [MEMORY[0x1E4F28ED0] numberWithDouble:v23];
      [v8 setObject:v24 forKeyedSubscript:@"RectifierVoltage"];
    }
    if ([v8 count])
    {
      id v25 = v8;
      AnalyticsSendEventLazy();
    }
  }
}

id __46__PLBatteryAgent_logChargingParametersToAggd___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)checkChargingInfoChange:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    goto LABEL_28;
  }
  BOOL v5 = [MEMORY[0x1E4F1CA48] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  int v6 = [v4 objectForKey:@"AppleRawAdapterDetails"];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        double v12 = [v11 objectForKeyedSubscript:@"FamilyCode"];

        if (v12)
        {
          double v13 = [v11 objectForKeyedSubscript:@"FamilyCode"];
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }

  int v14 = [(PLBatteryAgent *)self calculateConnectedState:v5];
  int v23 = [(PLBatteryAgent *)self calculateChargingState:v4];
  uint64_t v15 = [v4 objectForKeyedSubscript:@"ChargerData"];
  BOOL v16 = [(PLBatteryAgent *)self checkForPenaltyBox:v15];
  double v17 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  double v18 = v17;
  if (v16)
  {
    if (self->_lastTimePenaltyBoxIntervalUpdated)
    {
      objc_msgSend(v17, "timeIntervalSinceDate:");
      -[PLBatteryAgent logPenaltyBoxDurationToAggd:](self, "logPenaltyBoxDurationToAggd:");
      uint64_t v19 = 0;
    }
    else
    {
      uint64_t v19 = v17;
    }
    lastTimePenaltyBoxIntervalUpdated = self->_lastTimePenaltyBoxIntervalUpdated;
    self->_lastTimePenaltyBoxIntervalUpdated = v19;

    if (self->_inPenaltyBox)
    {
      uint64_t v21 = v18;
    }
    else
    {
      if (!self->_lastTimeInPenaltyBox) {
        goto LABEL_20;
      }
      objc_msgSend(v18, "timeIntervalSinceDate:");
      MEMORY[0x1E4E7E350](@"com.apple.power.state.penaltybox");
      AnalyticsSendEventLazy();
      uint64_t v21 = 0;
    }
    lastTimeInPenaltyBox = self->_lastTimeInPenaltyBox;
    self->_lastTimeInPenaltyBox = v21;
  }
LABEL_20:
  if (v14 != self->_prevConnectedState || v23 != self->_prevChargingState)
  {
    if (self->_lastTimeChargingInfoUpdated)
    {
      objc_msgSend(v18, "timeIntervalSinceDate:");
      -[PLBatteryAgent logChargingTimeToAggd:](self, "logChargingTimeToAggd:");
    }
    if (self->_lastTimePenaltyBoxIntervalUpdated)
    {
      objc_msgSend(v18, "timeIntervalSinceDate:");
      -[PLBatteryAgent logPenaltyBoxDurationToAggd:](self, "logPenaltyBoxDurationToAggd:");
      objc_storeStrong((id *)&self->_lastTimePenaltyBoxIntervalUpdated, v18);
    }
    self->_prevConnectedState = v14;
    self->_int prevChargingState = v23;
    objc_storeStrong((id *)&self->_lastTimeChargingInfoUpdated, v18);
  }

LABEL_28:
}

id __42__PLBatteryAgent_checkChargingInfoChange___block_invoke(uint64_t a1)
{
  mach_port_t v2 = objc_opt_new();
  [v2 setObject:&unk_1F400E0E0 forKeyedSubscript:@"State"];
  id v3 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 32)];
  [v2 setObject:v3 forKeyedSubscript:@"Duration"];

  return v2;
}

- (BOOL)checkForPenaltyBox:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  int v6 = [v4 objectForKeyedSubscript:@"NotChargingReason"];

  if (!v6) {
    goto LABEL_4;
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:@"NotChargingReason"];
  __int16 v8 = [v7 intValue];

  BOOL v9 = (v8 & 0x180) == 256;
  if (self->_inPenaltyBox != v9)
  {
    self->_inPenaltyBox = v9;
    BOOL v10 = 1;
  }
  else
  {
LABEL_4:
    BOOL v10 = 0;
  }

  return v10;
}

- (void)logPenaltyBoxDurationToAggd:(double)a3
{
  switch(self->_prevConnectedState)
  {
    case 1:
      if (self->_prevChargingState == 1) {
        goto LABEL_10;
      }
      goto LABEL_16;
    case 2:
      if (self->_prevChargingState != 2) {
        goto LABEL_16;
      }
      goto LABEL_10;
    case 4:
      if (self->_prevChargingState != 4) {
        goto LABEL_16;
      }
      id v4 = @"com.apple.power.state.a.penaltybox";
      break;
    case 5:
    case 6:
      if (self->_prevChargingState != 4) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 8:
      if (self->_prevChargingState != 8) {
        goto LABEL_16;
      }
      MEMORY[0x1E4E7E350](@"com.apple.power.state.e.penaltybox", a2, a3);
LABEL_10:
      id v4 = @"com.apple.power.state.b.penaltybox";
      break;
    case 0xC:
      if (self->_prevChargingState != 4) {
        goto LABEL_16;
      }
      MEMORY[0x1E4E7E350](@"com.apple.power.state.f.penaltybox", a2, a3);
LABEL_13:
      id v4 = @"com.apple.power.state.c.penaltybox";
      break;
    default:
LABEL_16:
      id v4 = @"com.apple.power.state.d.penaltybox";
      break;
  }
  MEMORY[0x1E4E7E350](v4, a3);
  AnalyticsSendEventLazy();
}

id __46__PLBatteryAgent_logPenaltyBoxDurationToAggd___block_invoke(uint64_t a1)
{
  mach_port_t v2 = objc_opt_new();
  id v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "prevConnectedState"));
  [v2 setObject:v3 forKeyedSubscript:@"State"];

  id v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 40)];
  [v2 setObject:v4 forKeyedSubscript:@"Duration"];

  return v2;
}

- (void)logChargingTimeToAggd:(double)a3
{
  switch(self->_prevConnectedState)
  {
    case 1:
      if (self->_prevChargingState == 1)
      {
        id v3 = @"com.apple.power.state.b2.chargetime";
        goto LABEL_14;
      }
      break;
    case 2:
      if (self->_prevChargingState == 2)
      {
        id v3 = @"com.apple.power.state.b1.chargetime";
        goto LABEL_14;
      }
      break;
    case 5:
      if (self->_prevChargingState == 4)
      {
        id v3 = @"com.apple.power.state.c2.chargetime";
        goto LABEL_14;
      }
      break;
    case 6:
      if (self->_prevChargingState == 4)
      {
        id v3 = @"com.apple.power.state.c1.chargetime";
        goto LABEL_14;
      }
      break;
    case 8:
      if (self->_prevChargingState == 8)
      {
        id v3 = @"com.apple.power.state.b3.chargetime";
        goto LABEL_14;
      }
      break;
    case 0xC:
      if (self->_prevChargingState == 4)
      {
        id v3 = @"com.apple.power.state.c3.chargetime";
LABEL_14:
        MEMORY[0x1E4E7E350]([NSString stringWithFormat:v3], a3);
        AnalyticsSendEventLazy();
      }
      break;
    default:
      return;
  }
}

id __40__PLBatteryAgent_logChargingTimeToAggd___block_invoke(uint64_t a1)
{
  mach_port_t v2 = objc_opt_new();
  id v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "prevConnectedState"));
  [v2 setObject:v3 forKeyedSubscript:@"State"];

  id v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 40)];
  [v2 setObject:v4 forKeyedSubscript:@"Duration"];

  return v2;
}

- (int)calculateConnectedState:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        int v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) intValue];
        switch(v9)
        {
          case -536723453:
            v6 |= 2u;
            break;
          case -536723452:
          case -536723451:
            goto LABEL_9;
          case -536723450:
            v6 |= 1u;
            break;
          case -536723449:
            v6 |= 8u;
            break;
          case -536723448:
            v6 |= 0x10u;
            break;
          default:
            if (v9) {
LABEL_9:
            }
              v6 |= 4u;
            break;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (int)calculateChargingState:(id)a3
{
  id v3 = [a3 objectForKey:@"AdapterDetails"];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:@"FamilyCode"];
    int v6 = [v5 intValue];

    int v7 = v6 + 536723453;
    int v8 = 2;
    switch(v7)
    {
      case 0:
        break;
      case 3:
        int v8 = 1;
        break;
      case 4:
        int v8 = 8;
        break;
      case 5:
        int v8 = 16;
        break;
      default:
        int v8 = 4;
        break;
    }
  }
  else
  {
    int v8 = -1;
  }

  return v8;
}

- (void)logEventForwardCalibration0withData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PLLogCommon();
  int v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryAgent logEventForwardCalibration0withData:]();
    }

    int v6 = [v4 objectForKeyedSubscript:@"baseline"];

    int v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"BatteryCalibration0Baseline"];
    int v8 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v6];
    int v9 = [v6 objectForKeyedSubscript:@"Battery Service State"];
    [v8 setObject:v9 forKeyedSubscript:@"batteryServiceRecommended"];

    BOOL v10 = [v6 objectForKeyedSubscript:@"Maximum Capacity Percent"];
    [v8 setObject:v10 forKeyedSubscript:@"MaximumCapacityPercent"];

    long long v11 = [v6 objectForKeyedSubscript:@"Battery Service Flags"];
    [v8 setObject:v11 forKeyedSubscript:@"batteryServiceFlags"];

    [(PLOperator *)self logEntry:v8];
    [(PLBatteryAgent *)self logBaselineToAggD:v8];
    [(PLBatteryAgent *)self logBaselineToCA:v8];
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    -[PLBatteryAgent logEventForwardCalibration0withData:]();
  }
}

- (void)logEventForwardCalibration0InfowithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PLLogCommon();
  int v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryAgent logEventForwardCalibration0InfowithData:]();
    }

    int v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"Calibration0Info"];
    int v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6];
    int v8 = [v4 objectForKeyedSubscript:@"status0"];

    if (v8)
    {
      int v9 = [v4 objectForKeyedSubscript:@"status0"];
      BOOL v10 = [v9 objectForKeyedSubscript:@"correction"];
      [v7 setObject:v10 forKeyedSubscript:@"status0correction"];

      long long v11 = [v4 objectForKeyedSubscript:@"status0"];
      long long v12 = [v11 objectForKeyedSubscript:@"status"];
      [v7 setObject:v12 forKeyedSubscript:@"status0status"];

      long long v13 = (void *)MEMORY[0x1E4F28ED0];
      long long v14 = [v4 objectForKeyedSubscript:@"status0"];
      uint64_t v15 = [v14 objectForKeyedSubscript:@"epoch"];
      [v15 doubleValue];
      double v17 = [v13 numberWithDouble:round(v16 / 1800.0) * 3600.0];
      [v7 setObject:v17 forKeyedSubscript:@"status0epoch"];
    }
    double v18 = [v4 objectForKeyedSubscript:@"status1"];

    if (v18)
    {
      uint64_t v19 = [v4 objectForKeyedSubscript:@"status1"];
      long long v20 = [v19 objectForKeyedSubscript:@"correction"];
      [v7 setObject:v20 forKeyedSubscript:@"status1correction"];

      uint64_t v21 = [v4 objectForKeyedSubscript:@"status1"];
      double v22 = [v21 objectForKeyedSubscript:@"status"];
      [v7 setObject:v22 forKeyedSubscript:@"status1status"];

      int v23 = (void *)MEMORY[0x1E4F28ED0];
      long long v24 = [v4 objectForKeyedSubscript:@"status1"];
      long long v25 = [v24 objectForKeyedSubscript:@"epoch"];
      [v25 doubleValue];
      long long v27 = [v23 numberWithDouble:round(v26 / 1800.0) * 3600.0];
      [v7 setObject:v27 forKeyedSubscript:@"status1epoch"];
    }
    uint64_t v28 = [v4 objectForKeyedSubscript:@"postCalibrationSnapshot"];

    if (v28)
    {
      uint64_t v29 = [v4 objectForKeyedSubscript:@"postCalibrationSnapshot"];
      uint64_t v30 = [v29 objectForKeyedSubscript:@"ncc"];
      [v7 setObject:v30 forKeyedSubscript:@"ncc"];

      double v31 = [v4 objectForKeyedSubscript:@"postCalibrationSnapshot"];
      id v32 = [v31 objectForKeyedSubscript:@"nccAlt"];
      [v7 setObject:v32 forKeyedSubscript:@"nccAlt"];

      uint64_t v33 = [v4 objectForKeyedSubscript:@"postCalibrationSnapshot"];
      double v34 = [v33 objectForKeyedSubscript:@"Battery Service State"];
      [v7 setObject:v34 forKeyedSubscript:@"batteryServiceRecommended"];

      id v35 = [v4 objectForKeyedSubscript:@"postCalibrationSnapshot"];
      double v36 = [v35 objectForKeyedSubscript:@"Maximum Capacity Percent"];
      [v7 setObject:v36 forKeyedSubscript:@"MaximumCapacityPercent"];

      __int16 v37 = [v4 objectForKeyedSubscript:@"postCalibrationSnapshot"];
      long long v38 = [v37 objectForKeyedSubscript:@"Battery Service Flags"];
      [v7 setObject:v38 forKeyedSubscript:@"batteryServiceFlags"];
    }
    [(PLOperator *)self logEntry:v7];
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    -[PLBatteryAgent logEventForwardCalibration0InfowithData:]();
  }
}

- (void)logEventForwardUPOStepperWithPayload:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  int v6 = +[PLOperator entryKeyForType:v4 andName:@"UPOStepper"];
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6 withRawData:v5];

  int v8 = [v7 objectForKeyedSubscript:@"RAv"];
  [v8 intValue];
  ADClientSetValueForScalarKey();

  int v9 = [v7 objectForKeyedSubscript:@"VirtualRADelta"];
  [v9 intValue];
  ADClientSetValueForScalarKey();

  BOOL v10 = [v7 objectForKeyedSubscript:@"MitigationState"];
  [v10 intValue];
  ADClientSetValueForScalarKey();

  long long v11 = [v7 objectForKeyedSubscript:@"RAvTimeWindow"];
  [v11 intValue];
  ADClientSetValueForScalarKey();

  long long v14 = v7;
  id v12 = v7;
  AnalyticsSendEventLazy();
  [(PLOperator *)self logEntry:v12];
  long long v13 = [(PLOperator *)self storage];
  [v13 flushCachesWithReason:@"UPOStepper"];
}

id __55__PLBatteryAgent_logEventForwardUPOStepperWithPayload___block_invoke(uint64_t a1)
{
  mach_port_t v2 = objc_opt_new();
  id v3 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"RAv"];
  id v5 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "intValue"));
  [v2 setObject:v5 forKeyedSubscript:@"RAv"];

  int v6 = (void *)MEMORY[0x1E4F28ED0];
  int v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"RAv"];
  int v8 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "intValue"));
  [v2 setObject:v8 forKeyedSubscript:@"VirtualRaDelta"];

  int v9 = (void *)MEMORY[0x1E4F28ED0];
  BOOL v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"MitigationState"];
  long long v11 = objc_msgSend(v9, "numberWithInt:", objc_msgSend(v10, "intValue"));
  [v2 setObject:v11 forKeyedSubscript:@"MitigationState"];

  id v12 = (void *)MEMORY[0x1E4F28ED0];
  long long v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"RAvTimeWindow"];
  long long v14 = objc_msgSend(v12, "numberWithInt:", objc_msgSend(v13, "intValue"));
  [v2 setObject:v14 forKeyedSubscript:@"RAvTimeWindow"];

  return v2;
}

- (void)createFixedChargingIntervals:(id)a3
{
  id v4 = a3;
  id v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryAgent createFixedChargingIntervals:].cold.6(self);
  }

  if (!+[PLBatteryAgent supportsFixedLimitCharging])
  {
    if ([(PLBatteryAgent *)self fixedChargingEngaged])
    {
      BOOL v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[PLBatteryAgent createFixedChargingIntervals:].cold.5();
      }
    }
    long long v11 = PLLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryAgent createFixedChargingIntervals:].cold.4();
    }

    BOOL v12 = [(PLBatteryAgent *)self smartChargingEngaged];
    int v8 = [v4 entryDate];
    long long v13 = self;
    uint64_t v14 = v12;
    goto LABEL_24;
  }
  if (![(PLBatteryAgent *)self smartChargingEngaged]
    || ![(PLBatteryAgent *)self fixedChargingEngaged])
  {
    if ([(PLBatteryAgent *)self smartChargingEngaged]
      && ![(PLBatteryAgent *)self fixedChargingEngaged])
    {
      double v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryAgent createFixedChargingIntervals:]();
      }

      double v18 = [v4 entryDate];
      [(PLBatteryAgent *)self updateIntervalForType:8 withState:0 andTime:v18];

      int v8 = [v4 entryDate];
      long long v13 = self;
      uint64_t v14 = 1;
    }
    else
    {
      uint64_t v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryAgent createFixedChargingIntervals:]();
      }

      double v16 = [v4 entryDate];
      [(PLBatteryAgent *)self updateIntervalForType:8 withState:0 andTime:v16];

      int v8 = [v4 entryDate];
      long long v13 = self;
      uint64_t v14 = 0;
    }
LABEL_24:
    [(PLBatteryAgent *)v13 updateIntervalForType:2 withState:v14 andTime:v8];
    goto LABEL_25;
  }
  int v6 = PLLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryAgent createFixedChargingIntervals:]();
  }

  int v7 = [v4 entryDate];
  [(PLBatteryAgent *)self updateIntervalForType:2 withState:0 andTime:v7];

  int v8 = [v4 entryDate];
  int v9 = [v4 objectForKeyedSubscript:@"chargeLimitTargetSoC"];
  [(PLBatteryAgent *)self updateIntervalForType:8 withState:1 andTime:v8 selectedChargedLimit:v9];

LABEL_25:
}

- (void)logEventForwardMitigationStateWithState:(unint64_t)a3 userDisabled:(BOOL)a4
{
  BOOL v4 = a4;
  int v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"MitigationState"];
  int v8 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7];
  if (!v4)
  {
    [(PLBatteryAgent *)self setMitigationStateDefault:a3];
    int v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a3];
    [v8 setObject:v9 forKeyedSubscript:@"MitigationState"];

    ADClientSetValueForScalarKey();
    AnalyticsSendEventLazy();
  }
  BOOL v10 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  [v8 setObject:v10 forKeyedSubscript:@"MitigationDisabled"];

  [(PLOperator *)self logEntry:v8];
}

id __71__PLBatteryAgent_logEventForwardMitigationStateWithState_userDisabled___block_invoke(uint64_t a1)
{
  mach_port_t v2 = objc_opt_new();
  id v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*(void *)(a1 + 32)];
  [v2 setObject:v3 forKeyedSubscript:@"MitigationState"];

  return v2;
}

- (void)logEventForwardSmartChargingWithPayload:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"SmartCharging"];
    int v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5 withRawData:v4];
    int v7 = [v6 objectForKeyedSubscript:@"decisionTime"];
    if (v7)
    {
      int v8 = (void *)MEMORY[0x1E4F28ED0];
      int v9 = [v6 objectForKeyedSubscript:@"decisionTime"];
      BOOL v10 = [v9 convertFromSystemToMonotonic];
      [v10 timeIntervalSince1970];
      BOOL v12 = [v8 numberWithInt:(int)v11];
      [v6 setObject:v12 forKeyedSubscript:@"decisionTime"];
    }
    else
    {
      [v6 setObject:&unk_1F400DFC0 forKeyedSubscript:@"decisionTime"];
    }

    long long v13 = [v4 objectForKeyedSubscript:@"engagementProbability"];
    if (v13)
    {
      uint64_t v14 = [v4 objectForKeyedSubscript:@"engagementProbability"];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v15 = (void *)MEMORY[0x1E4F28ED0];
        double v16 = [v4 objectForKeyedSubscript:@"engagementProbability"];
        [v16 doubleValue];
        double v18 = [v15 numberWithInt:(int)(v17 * 100.0)];
        [v6 setObject:v18 forKeyedSubscript:@"engagementProbability"];
      }
      else
      {
        [v6 setObject:&unk_1F400DFC0 forKeyedSubscript:@"engagementProbability"];
      }
    }
    else
    {
      [v6 setObject:&unk_1F400DFC0 forKeyedSubscript:@"engagementProbability"];
    }

    uint64_t v19 = [v4 objectForKeyedSubscript:@"durationPrediction"];
    if (v19)
    {
      long long v20 = [v4 objectForKeyedSubscript:@"durationPrediction"];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v21 = (void *)MEMORY[0x1E4F28ED0];
        double v22 = [v4 objectForKeyedSubscript:@"durationPrediction"];
        [v22 doubleValue];
        long long v24 = [v21 numberWithInt:(int)(v23 * 10.0)];
        [v6 setObject:v24 forKeyedSubscript:@"durationPrediction"];
      }
      else
      {
        [v6 setObject:&unk_1F400DFC0 forKeyedSubscript:@"durationPrediction"];
      }
    }
    else
    {
      [v6 setObject:&unk_1F400DFC0 forKeyedSubscript:@"durationPrediction"];
    }

    long long v25 = [v4 objectForKeyedSubscript:@"state"];
    [v6 setObject:v25 forKeyedSubscript:@"state"];

    double v26 = PLLogCommon();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v39) = 0;
      _os_log_impl(&dword_1E4220000, v26, OS_LOG_TYPE_DEFAULT, "Logging smart charging", (uint8_t *)&v39, 2u);
    }

    [(PLOperator *)self logEntry:v6];
    long long v27 = [v6 dictionary];
    uint64_t v28 = [v6 entryDate];
    [(PLOperator *)self logForSubsystem:@"BatteryMetrics" category:@"SmartCharging" data:v27 date:v28];

    uint64_t v29 = [v4 objectForKeyedSubscript:@"isManuallyChargeLimited"];
    [v6 setObject:v29 forKeyedSubscript:@"isFixed"];

    uint64_t v30 = [v6 objectForKeyedSubscript:@"isEngaged"];
    -[PLBatteryAgent setSmartChargingEngaged:](self, "setSmartChargingEngaged:", [v30 BOOLValue]);

    double v31 = PLLogCommon();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      BOOL v32 = [(PLBatteryAgent *)self smartChargingEngaged];
      int v39 = 67109120;
      BOOL v40 = v32;
      _os_log_impl(&dword_1E4220000, v31, OS_LOG_TYPE_INFO, "Smart Charging State: %d", (uint8_t *)&v39, 8u);
    }

    uint64_t v33 = [v6 objectForKeyedSubscript:@"isFixed"];
    -[PLBatteryAgent setFixedChargingEngaged:](self, "setFixedChargingEngaged:", [v33 intValue] == 1);

    double v34 = PLLogCommon();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      id v35 = [v6 objectForKeyedSubscript:@"isFixed"];
      int v36 = [v35 intValue];
      int v39 = 67109120;
      BOOL v40 = v36;
      _os_log_impl(&dword_1E4220000, v34, OS_LOG_TYPE_INFO, "Fixed limit enum: %d", (uint8_t *)&v39, 8u);
    }
    __int16 v37 = PLLogCommon();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      BOOL v38 = [(PLBatteryAgent *)self fixedChargingEngaged];
      int v39 = 67109120;
      BOOL v40 = v38;
      _os_log_impl(&dword_1E4220000, v37, OS_LOG_TYPE_INFO, "Fixed limit State: %d", (uint8_t *)&v39, 8u);
    }

    [(PLBatteryAgent *)self createFixedChargingIntervals:v6];
  }
}

- (void)logEventForwardCleanEnergyChargingWithPayload:(id)a3
{
  if (a3)
  {
    uint64_t v4 = *MEMORY[0x1E4F92D30];
    id v5 = a3;
    int v6 = +[PLOperator entryKeyForType:v4 andName:@"CleanEnergyCharging"];
    int v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6 withRawData:v5];

    int v8 = PLLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_1E4220000, v8, OS_LOG_TYPE_DEFAULT, "Logging clean charging", v14, 2u);
    }

    [(PLOperator *)self logEntry:v7];
    int v9 = [v7 dictionary];
    BOOL v10 = [v7 entryDate];
    [(PLOperator *)self logForSubsystem:@"EnergyMetrics" category:@"CleanEnergyCharging" data:v9 date:v10];

    double v11 = [v7 objectForKeyedSubscript:@"isPaused"];
    -[PLBatteryAgent setCleanEnergyChargingEngaged:](self, "setCleanEnergyChargingEngaged:", [v11 BOOLValue]);

    BOOL v12 = [(PLBatteryAgent *)self cleanEnergyChargingEngaged];
    long long v13 = [v7 entryDate];
    [(PLBatteryAgent *)self updateIntervalForType:7 withState:v12 andTime:v13];
  }
}

- (void)logEventForwardMobileChargeMode:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"MobileChargeMode"];
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventBackwardTrustedBatteryHealth
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "Failed to retrieve power sources Internal.", v2, v3, v4, v5, v6);
}

- (id)dateNoEarlierThan:(unint64_t)a3 since:(id)a4 withDelta:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  [v7 timeIntervalSinceDate:v8];
  if ((unint64_t)(v9 / 86400.0) <= a3)
  {
    id v12 = v8;
  }
  else
  {
    int v10 = (int)((double)a3 * 86400.0);
    double v11 = PLLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryAgent dateNoEarlierThan:since:withDelta:]();
    }

    id v12 = [v7 dateByAddingTimeInterval:(double)-v10];
  }
  long long v13 = v12;

  return v13;
}

- (void)logEventBackwardHeatMap
{
  uint64_t v3 = [(PLOperator *)self workQueue];
  void block[5] = MEMORY[0x1E4F143A8];
  void block[6] = 3221225472;
  block[7] = __41__PLBatteryAgent_logEventBackwardHeatMap__block_invoke;
  block[8] = &unk_1E6E47C98;
  block[9] = self;
  uint64_t v4 = IOPMCopyBatteryHeatMap();

  if (v4 && [MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__PLBatteryAgent_logEventBackwardHeatMap__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v5;
    if (logEventBackwardHeatMap_defaultOnce != -1) {
      dispatch_once(&logEventBackwardHeatMap_defaultOnce, block);
    }
    if (logEventBackwardHeatMap_classDebugEnabled)
    {
      uint8_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"ChargingA Heat Map Error: %x", v4);
      id v7 = (void *)MEMORY[0x1E4F929B8];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      double v9 = [v8 lastPathComponent];
      int v10 = [NSString stringWithUTF8String:"-[PLBatteryAgent logEventBackwardHeatMap]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:5793];

      double v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  id v12 = [(PLOperator *)self workQueue];
  void v31[5] = MEMORY[0x1E4F143A8];
  v31[6] = 3221225472;
  v31[7] = __41__PLBatteryAgent_logEventBackwardHeatMap__block_invoke_4195;
  v31[8] = &unk_1E6E47C98;
  v31[9] = self;
  uint64_t v13 = IOPMCopyBatteryHeatMap();

  if (v13 && [MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v14 = objc_opt_class();
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __41__PLBatteryAgent_logEventBackwardHeatMap__block_invoke_2_4198;
    void v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void v31[4] = v14;
    if (logEventBackwardHeatMap_defaultOnce_4196 != -1) {
      dispatch_once(&logEventBackwardHeatMap_defaultOnce_4196, v31);
    }
    if (logEventBackwardHeatMap_classDebugEnabled_4197)
    {
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"ChargingB Heat Map Error: %x", v13);
      double v16 = (void *)MEMORY[0x1E4F929B8];
      double v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      double v18 = [v17 lastPathComponent];
      uint64_t v19 = [NSString stringWithUTF8String:"-[PLBatteryAgent logEventBackwardHeatMap]"];
      [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:5799];

      long long v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  uint64_t v21 = [(PLOperator *)self workQueue];
  v30[5] = MEMORY[0x1E4F143A8];
  v30[6] = 3221225472;
  v30[7] = __41__PLBatteryAgent_logEventBackwardHeatMap__block_invoke_4202;
  v30[8] = &unk_1E6E47C98;
  v30[9] = self;
  uint64_t v22 = IOPMCopyBatteryHeatMap();

  if (v22 && [MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v23 = objc_opt_class();
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    void v30[2] = __41__PLBatteryAgent_logEventBackwardHeatMap__block_invoke_2_4205;
    void v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v30[4] = v23;
    if (logEventBackwardHeatMap_defaultOnce_4203 != -1) {
      dispatch_once(&logEventBackwardHeatMap_defaultOnce_4203, v30);
    }
    if (logEventBackwardHeatMap_classDebugEnabled_4204)
    {
      long long v24 = objc_msgSend(NSString, "stringWithFormat:", @"Discharging Heat Map Error: %x", v22);
      long long v25 = (void *)MEMORY[0x1E4F929B8];
      double v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      long long v27 = [v26 lastPathComponent];
      uint64_t v28 = [NSString stringWithUTF8String:"-[PLBatteryAgent logEventBackwardHeatMap]"];
      [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:5805];

      uint64_t v29 = PLLogCommon();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

void __41__PLBatteryAgent_logEventBackwardHeatMap__block_invoke(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 32) logEventBackwardHeatMapCallback:a2 andHeatMapType:0];
}

uint64_t __41__PLBatteryAgent_logEventBackwardHeatMap__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventBackwardHeatMap_classDebugEnabled = result;
  return result;
}

void __41__PLBatteryAgent_logEventBackwardHeatMap__block_invoke_4195(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 32) logEventBackwardHeatMapCallback:a2 andHeatMapType:1];
}

uint64_t __41__PLBatteryAgent_logEventBackwardHeatMap__block_invoke_2_4198(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventBackwardHeatMap_classDebugEnabled_4197 = result;
  return result;
}

void __41__PLBatteryAgent_logEventBackwardHeatMap__block_invoke_4202(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 32) logEventBackwardHeatMapCallback:a2 andHeatMapType:2];
}

uint64_t __41__PLBatteryAgent_logEventBackwardHeatMap__block_invoke_2_4205(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventBackwardHeatMap_classDebugEnabled_4204 = result;
  return result;
}

- (void)logEventBackwardHeatMapCallback:(id)a3 andHeatMapType:(int64_t)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 objectForKeyedSubscript:@"batteryHeatMapData"];
  uint8_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectForKeyedSubscript:@"HeatMapType"];
    if (v7)
    {
      id v8 = [v6 objectForKeyedSubscript:@"HeatMapType"];
      uint64_t v9 = (int)[v8 intValue];
    }
    else
    {
      uint64_t v9 = 0;
    }

    int v10 = &unk_1F4014F50;
    if (v9 == 1) {
      int v10 = &unk_1F4014F38;
    }
    double v47 = v10;
    if (v9 == 1) {
      double v11 = @"SoC";
    }
    else {
      double v11 = @"voltage";
    }
    if (v9 == 1) {
      id v12 = @"com.apple.power.battery.heatmap.soc";
    }
    else {
      id v12 = @"com.apple.power.battery.heatmap.voltage";
    }
    uint64_t v48 = v12;
    uint64_t v49 = v11;
    __int16 v45 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    if ((unint64_t)a4 > 2)
    {
      int v46 = 0;
      __int16 v43 = 0;
    }
    else
    {
      int v46 = off_1E6E4B7C8[a4];
      __int16 v43 = off_1E6E4B7E0[a4];
    }
    long long v55 = 0u;
    long long v56 = 0u;
    long long v54 = 0u;
    long long v53 = 0u;
    id v13 = v6;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v53 objects:v61 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v54;
      uint64_t v42 = *MEMORY[0x1E4F92D28];
      uint64_t v38 = *(void *)v54;
      id v39 = v13;
      do
      {
        uint64_t v17 = 0;
        uint64_t v40 = v15;
        do
        {
          if (*(void *)v54 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v41 = v17;
          uint64_t v18 = *(void *)(*((void *)&v53 + 1) + 8 * v17);
          uint64_t v19 = [&unk_1F4014F08 indexOfObject:v18];
          if (v19 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v20 = v19;
            uint64_t v21 = [v13 objectForKey:v18];
            for (uint64_t i = 0; i != 25; ++i)
            {
              uint64_t v23 = [v21 objectAtIndex:i];
              uint64_t v24 = [v23 intValue];

              if (v24)
              {
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __65__PLBatteryAgent_logEventBackwardHeatMapCallback_andHeatMapType___block_invoke;
                block[3] = &unk_1E6E4A4C8;
                v51 = @"forceLogBatteryHeatmap";
                char v52 = 0;
                if (logEventBackwardHeatMapCallback_andHeatMapType__defaultOnce != -1) {
                  dispatch_once(&logEventBackwardHeatMapCallback_andHeatMapType__defaultOnce, block);
                }
                int v25 = logEventBackwardHeatMapCallback_andHeatMapType__objectForKey;

                int v26 = [MEMORY[0x1E4F929C0] taskMode];
                if (v25 || v26)
                {
                  long long v27 = +[PLOperator entryKeyForType:v42 andName:v43];
                  uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v27];
                  [v28 setEntryDate:v45];
                  uint64_t v29 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v20];
                  [v28 setObject:v29 forKeyedSubscript:@"Temperature"];

                  uint64_t v30 = [MEMORY[0x1E4F28ED0] numberWithInt:i];
                  [v28 setObject:v30 forKeyedSubscript:@"Bin"];

                  double v31 = [MEMORY[0x1E4F28ED0] numberWithInteger:v9];
                  [v28 setObject:v31 forKeyedSubscript:@"HeatMapType"];

                  BOOL v32 = [MEMORY[0x1E4F28ED0] numberWithInt:v24];
                  [v28 setObject:v32 forKeyedSubscript:@"TimeInMinutes"];

                  [(PLOperator *)self logEntry:v28];
                }
                uint64_t v33 = PLLogCommon();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  v58 = v48;
                  __int16 v59 = 2112;
                  uint64_t v60 = v49;
                  _os_log_debug_impl(&dword_1E4220000, v33, OS_LOG_TYPE_DEBUG, "Sending CA event %@ with field %@", buf, 0x16u);
                }

                AnalyticsSendEventLazy();
                double v34 = NSString;
                id v35 = [&unk_1F4014F20 objectAtIndexedSubscript:v20];
                int v36 = [v47 objectAtIndexedSubscript:i];
                __int16 v37 = [v34 stringWithFormat:@"%@.%@.%@", v46, v35, v36];

                ADClientSetValueForScalarKey();
              }
            }

            id v13 = v39;
            uint64_t v15 = v40;
            uint64_t v16 = v38;
          }
          uint64_t v17 = v41 + 1;
        }
        while (v41 + 1 != v15);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v53 objects:v61 count:16];
      }
      while (v15);
    }
  }
}

uint64_t __65__PLBatteryAgent_logEventBackwardHeatMapCallback_andHeatMapType___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] BOOLForKey:*(void *)(a1 + 32) ifNotSet:*(unsigned __int8 *)(a1 + 40)];
  logEventBackwardHeatMapCallback_andHeatMapType__objectForKey = result;
  return result;
}

id __65__PLBatteryAgent_logEventBackwardHeatMapCallback_andHeatMapType___block_invoke_4458(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 40)];
  [v2 setObject:v3 forKeyedSubscript:@"action"];

  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 48)];
  [v2 setObject:v4 forKeyedSubscript:@"temperature"];

  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned int *)(a1 + 64)];
  [v2 setObject:v5 forKeyedSubscript:*(void *)(a1 + 32)];

  uint8_t v6 = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned int *)(a1 + 68)];
  [v2 setObject:v6 forKeyedSubscript:@"timeSpent"];

  id v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 56)];
  [v2 setObject:v7 forKeyedSubscript:@"version"];

  return v2;
}

- (void)logEventBackwardKioskMode
{
  uint64_t v3 = [(PLOperator *)self workQueue];
  void block[5] = MEMORY[0x1E4F143A8];
  void block[6] = 3221225472;
  block[7] = __43__PLBatteryAgent_logEventBackwardKioskMode__block_invoke;
  block[8] = &unk_1E6E47C98;
  block[9] = self;
  uint64_t v4 = IOPMCopyKioskModeData();

  if (v4 && [MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__PLBatteryAgent_logEventBackwardKioskMode__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v5;
    if (logEventBackwardKioskMode_defaultOnce != -1) {
      dispatch_once(&logEventBackwardKioskMode_defaultOnce, block);
    }
    if (logEventBackwardKioskMode_classDebugEnabled)
    {
      uint8_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Kiosk Mode Lifetime Data Error: %x", v4);
      id v7 = (void *)MEMORY[0x1E4F929B8];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      uint64_t v9 = [v8 lastPathComponent];
      int v10 = [NSString stringWithUTF8String:"-[PLBatteryAgent logEventBackwardKioskMode]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:5925];

      double v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

void __43__PLBatteryAgent_logEventBackwardKioskMode__block_invoke(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 32) logEventBackwardKioskModeCallback:a2];
}

uint64_t __43__PLBatteryAgent_logEventBackwardKioskMode__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventBackwardKioskMode_classDebugEnabled = result;
  return result;
}

- (void)logEventBackwardKioskModeCallback:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 objectForKeyedSubscript:@"batteryKioskModeData"];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v5 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      uint64_t v16 = __52__PLBatteryAgent_logEventBackwardKioskModeCallback___block_invoke;
      uint64_t v17 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v18 = v5;
      if (logEventBackwardKioskModeCallback__defaultOnce != -1) {
        dispatch_once(&logEventBackwardKioskModeCallback__defaultOnce, &block);
      }
      if (logEventBackwardKioskModeCallback__classDebugEnabled)
      {
        uint8_t v6 = [NSString stringWithFormat:@"Kiosk Mode callback: %@", v4, block, v15, v16, v17, v18];
        id v7 = (void *)MEMORY[0x1E4F929B8];
        id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
        uint64_t v9 = [v8 lastPathComponent];
        int v10 = [NSString stringWithUTF8String:"-[PLBatteryAgent logEventBackwardKioskModeCallback:]"];
        [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:5934];

        double v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    if (v4)
    {
      id v12 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"KioskMode"];
      id v13 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v12 withRawData:v4];
      [(PLOperator *)self logEntry:v13];
      [(PLBatteryAgent *)self logKioskModeEntryToCA:v13];
      [(PLBatteryAgent *)self logKioskModeEntryToAggd:v13];
    }
  }
}

uint64_t __52__PLBatteryAgent_logEventBackwardKioskModeCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventBackwardKioskModeCallback__classDebugEnabled = result;
  return result;
}

- (void)logEventBackwardBattery
{
  id v5 = [(PLBatteryAgent *)self iokitPowerSource];
  uint64_t v3 = [v5 properties];
  id v4 = [(PLBatteryAgent *)self logEventBackwardBatteryWithRawData:v3];
}

- (void)logBatteryEntry:(id)a3
{
  id v4 = a3;
  id v6 = [v4 dictionary];
  id v5 = [v4 entryDate];

  [(PLOperator *)self logForSubsystem:@"BatteryMetrics" category:@"Battery" data:v6 date:v5];
}

- (id)logEventBackwardBatteryWithRawData:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v16 = 0;
    goto LABEL_92;
  }
  id v5 = [[PLEventBackwardBatteryEntry alloc] initEntryWithRawData:v4];
  id v6 = [(PLBatteryAgent *)self presentMaxRaFromRawData:v4];
  BOOL v123 = v6;
  if (v6)
  {
    id v7 = v6;
    if ((int)[v6 intValue] >= 1 && objc_msgSend(v7, "intValue") != self->_presentMaxRa)
    {
      [v5 setObject:v7 forKeyedSubscript:@"PresentMaxRa0-8"];
      self->_presentMaxRa = [v7 intValue];
      uint64_t v8 = [v4 objectForKey:@"BatteryData"];
      if (v8)
      {
        uint64_t v9 = (void *)v8;
        int v10 = [v4 objectForKey:@"BatteryData"];
        double v11 = [v10 objectForKey:@"LifetimeData"];

        if (v11)
        {
          id v12 = [v11 objectForKeyedSubscript:@"MaximumRa0-8"];
          id v13 = v12;
          int lifetimeMaxRa = self->_lifetimeMaxRa;
          BOOL v15 = lifetimeMaxRa != -1;
          if (lifetimeMaxRa == -1 || v12 && [v12 intValue] != self->_lifetimeMaxRa) {
            self->_int lifetimeMaxRa = objc_msgSend(v13, "intValue", v123);
          }
          else {
            BOOL v15 = 0;
          }
          uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", v15, v123);
          [v5 setObject:v17 forKeyedSubscript:@"LifetimeMaxRa0-8Updated"];
        }
      }
    }
  }
  uint64_t v18 = objc_msgSend(v5, "objectForKeyedSubscript:", @"ChemicalWeightedRa", v123);
  if (v18
    && (uint64_t v19 = (void *)v18,
        [v5 objectForKeyedSubscript:@"ChemicalWeightedRa"],
        uint64_t v20 = objc_claimAutoreleasedReturnValue(),
        int v21 = [v20 intValue],
        int presentChemicalWeightedRa = self->_presentChemicalWeightedRa,
        v20,
        v19,
        v21 == presentChemicalWeightedRa))
  {
    [v5 setObject:0 forKeyedSubscript:@"ChemicalWeightedRa"];
    int v23 = 0;
  }
  else
  {
    uint64_t v24 = [v5 objectForKeyedSubscript:@"ChemicalWeightedRa"];
    self->_int presentChemicalWeightedRa = [v24 intValue];

    ADClientSetValueForScalarKey();
    int v25 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", -[PLBatteryAgent presentChemicalWeightedRa](self, "presentChemicalWeightedRa"));
    int v26 = [(PLBatteryAgent *)self lastBatteryConfigEntry];
    [v26 setObject:v25 forKeyedSubscript:@"ChemicalWeightedRa"];

    int v23 = 1;
  }
  uint64_t v27 = [v5 objectForKeyedSubscript:@"WeightedRa"];
  if (v27
    && (uint64_t v28 = (void *)v27,
        [v5 objectForKeyedSubscript:@"WeightedRa"],
        uint64_t v29 = objc_claimAutoreleasedReturnValue(),
        int v30 = [v29 intValue],
        int presentWeightedRa = self->_presentWeightedRa,
        v29,
        v28,
        v30 == presentWeightedRa))
  {
    [v5 setObject:0 forKeyedSubscript:@"WeightedRa"];
  }
  else
  {
    BOOL v32 = [v5 objectForKeyedSubscript:@"WeightedRa"];
    self->_int presentWeightedRa = [v32 intValue];

    ADClientSetValueForScalarKey();
    uint64_t v33 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", -[PLBatteryAgent presentWeightedRa](self, "presentWeightedRa"));
    double v34 = [(PLBatteryAgent *)self lastBatteryConfigEntry];
    [v34 setObject:v33 forKeyedSubscript:@"WeightedRa"];

    int v23 = 1;
  }
  uint64_t v35 = [v5 objectForKeyedSubscript:@"BatteryHealthMetric"];
  if (v35
    && (int v36 = (void *)v35,
        [v5 objectForKeyedSubscript:@"BatteryHealthMetric"],
        __int16 v37 = objc_claimAutoreleasedReturnValue(),
        int v38 = [v37 intValue],
        int presentBatteryHealthMetric = self->_presentBatteryHealthMetric,
        v37,
        v36,
        v38 == presentBatteryHealthMetric))
  {
    [v5 setObject:0 forKeyedSubscript:@"BatteryHealthMetric"];
  }
  else
  {
    uint64_t v40 = [v5 objectForKeyedSubscript:@"BatteryHealthMetric"];
    self->_int presentBatteryHealthMetric = [v40 intValue];

    ADClientSetValueForScalarKey();
  }
  uint64_t v41 = [v5 objectForKeyedSubscript:@"PeakPerformanceCapacity"];
  if (!v41
    || (uint64_t v42 = (void *)v41,
        [v5 objectForKeyedSubscript:@"PeakPerformanceCapacity"],
        __int16 v43 = objc_claimAutoreleasedReturnValue(),
        int v44 = [v43 intValue],
        int presentPeakPerformanceCapacity = self->_presentPeakPerformanceCapacity,
        v43,
        v42,
        v44 != presentPeakPerformanceCapacity))
  {
    int v46 = [v5 objectForKeyedSubscript:@"PeakPerformanceCapacity"];
    self->_int presentPeakPerformanceCapacity = [v46 intValue];

    ADClientSetValueForScalarKey();
    if (!v23) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  [v5 setObject:0 forKeyedSubscript:@"PeakPerformanceCapacity"];
  if (v23)
  {
LABEL_31:
    double v47 = [(PLBatteryAgent *)self lastBatteryConfigEntry];
    [(PLBatteryAgent *)self logBatteryConfigToCA:v47];
  }
LABEL_32:
  uint64_t v48 = [v5 objectForKeyedSubscript:@"OCVCount"];
  if (v48
    && (uint64_t v49 = (void *)v48,
        [v5 objectForKeyedSubscript:@"OCVCount"],
        uint64_t v50 = objc_claimAutoreleasedReturnValue(),
        int v51 = [v50 intValue],
        presentOCVCFIndex Count = self->_presentOCVCount,
        v50,
        v49,
        v51 == presentOCVCount))
  {
    [v5 setObject:0 forKeyedSubscript:@"OCVCount"];
  }
  else
  {
    long long v53 = [v5 objectForKeyedSubscript:@"OCVCount"];
    self->_presentOCVCFIndex Count = [v53 intValue];
  }
  uint64_t v54 = [v5 objectForKeyedSubscript:@"OCV"];
  if (v54
    && (long long v55 = (void *)v54,
        [v5 objectForKeyedSubscript:@"OCV"],
        long long v56 = objc_claimAutoreleasedReturnValue(),
        int v57 = [v56 intValue],
        int presentOCV = self->_presentOCV,
        v56,
        v55,
        v57 == presentOCV))
  {
    [v5 setObject:0 forKeyedSubscript:@"OCV"];
  }
  else
  {
    __int16 v59 = [v5 objectForKeyedSubscript:@"OCV"];
    self->_int presentOCV = [v59 intValue];
  }
  uint64_t v60 = [v5 objectForKeyedSubscript:@"RaUpdateDisqualified"];
  if (v60
    && (uint64_t v61 = (void *)v60,
        [v5 objectForKeyedSubscript:@"RaUpdateDisqualified"],
        uint64_t v62 = objc_claimAutoreleasedReturnValue(),
        int v63 = [v62 intValue],
        int presentRaUpdateDisqualified = self->_presentRaUpdateDisqualified,
        v62,
        v61,
        v63 == presentRaUpdateDisqualified))
  {
    [v5 setObject:0 forKeyedSubscript:@"RaUpdateDisqualified"];
  }
  else
  {
    BOOL v65 = [v5 objectForKeyedSubscript:@"RaUpdateDisqualified"];
    self->_int presentRaUpdateDisqualified = [v65 intValue];
  }
  uint64_t v66 = [v5 objectForKeyedSubscript:@"QmaxUpdateDisqualified"];
  if (v66
    && (id v67 = (void *)v66,
        [v5 objectForKeyedSubscript:@"QmaxUpdateDisqualified"],
        v68 = objc_claimAutoreleasedReturnValue(),
        int v69 = [v68 intValue],
        int presentQmaxUpdateDisqualified = self->_presentQmaxUpdateDisqualified,
        v68,
        v67,
        v69 == presentQmaxUpdateDisqualified))
  {
    [v5 setObject:0 forKeyedSubscript:@"QmaxUpdateDisqualified"];
  }
  else
  {
    v71 = [v5 objectForKeyedSubscript:@"QmaxUpdateDisqualified"];
    self->_int presentQmaxUpdateDisqualified = [v71 intValue];
  }
  uint64_t v72 = [v5 objectForKeyedSubscript:@"TimeSinceLastOCV"];
  if (v72
    && (id v73 = (void *)v72,
        [v5 objectForKeyedSubscript:@"TimeSinceLastOCV"],
        v74 = objc_claimAutoreleasedReturnValue(),
        int v75 = [v74 intValue],
        int presentTimeSinceLastOCV = self->_presentTimeSinceLastOCV,
        v74,
        v73,
        v75 == presentTimeSinceLastOCV))
  {
    [v5 setObject:0 forKeyedSubscript:@"TimeSinceLastOCV"];
  }
  else
  {
    v77 = [v5 objectForKeyedSubscript:@"TimeSinceLastOCV"];
    self->_int presentTimeSinceLastOCV = [v77 intValue];
  }
  v78 = [v5 objectForKeyedSubscript:@"ITMiscStatus"];
  v79 = [(PLBatteryAgent *)self parseITMiscStatusCounters:v78];
  if (v79)
  {
    v80 = [(PLBatteryAgent *)self lastITMiscStatus];

    if (v80)
    {
      v81 = objc_opt_new();
      v127[0] = MEMORY[0x1E4F143A8];
      v127[1] = 3221225472;
      v127[2] = __53__PLBatteryAgent_logEventBackwardBatteryWithRawData___block_invoke;
      v127[3] = &unk_1E6E4B638;
      v127[4] = self;
      id v82 = v81;
      id v128 = v82;
      [v79 enumerateKeysAndObjectsUsingBlock:v127];
      if ([v82 count])
      {
        id v126 = v82;
        AnalyticsSendEventLazy();
      }
    }
    [(PLBatteryAgent *)self setLastITMiscStatus:v79];
  }
  v83 = [v5 objectForKeyedSubscript:@"BatteryCellDisconnectCount"];

  if (v83)
  {
    uint64_t v84 = [(PLBatteryAgent *)self prevBatteryCellDisconnectCount];
    if (!v84) {
      goto LABEL_61;
    }
    v85 = (void *)v84;
    v86 = [(PLBatteryAgent *)self prevBatteryCellDisconnectCount];
    v87 = [v5 objectForKeyedSubscript:@"BatteryCellDisconnectCount"];

    if (v86 != v87)
    {
LABEL_61:
      uint64_t v88 = [v5 objectForKeyedSubscript:@"BatteryCellDisconnectCount"];
      [v88 intValue];
      ADClientSetValueForScalarKey();

      id v125 = v5;
      AnalyticsSendEventLazy();
    }
    v89 = [v5 objectForKeyedSubscript:@"BatteryCellDisconnectCount"];
    [(PLBatteryAgent *)self setPrevBatteryCellDisconnectCount:v89];
  }
  v90 = [v5 objectForKeyedSubscript:@"GaugeResetCounter"];

  if (v90)
  {
    v91 = [v5 objectForKeyedSubscript:@"GaugeResetCounter"];
    int v92 = [v91 intValue];

    v93 = [(PLBatteryAgent *)self prevGGResetCount];

    if (v93)
    {
      int v94 = [(PLBatteryAgent *)self prevGGResetCount];
      uint64_t v95 = (void *)[v94 intValue];
    }
    else
    {
      int v94 = +[PLEventBackwardBatteryEntry entryKey];
      double v96 = [(PLOperator *)self storage];
      double v97 = [v96 lastEntryForKey:v94];

      if (v97)
      {
        uint64_t v95 = [v97 objectForKeyedSubscript:@"GaugeResetCounter"];

        if (v95)
        {
          v98 = [v97 objectForKeyedSubscript:@"GaugeResetCounter"];
          uint64_t v95 = (void *)[v98 intValue];
        }
      }
      else
      {
        uint64_t v95 = 0;
      }
    }
    uint64_t v99 = (v92 - v95);
    if ((int)v99 >= 1)
    {
      MEMORY[0x1E4E7E330](@"com.apple.power.battery.GaugeResetCounter", v99);
      AnalyticsSendEventLazy();
      uint64_t v100 = [v5 objectForKeyedSubscript:@"GaugeResetCounter"];
      [(PLBatteryAgent *)self setPrevGGResetCount:v100];
    }
    uint64_t v101 = [(PLBatteryAgent *)self prevGGResetCount];

    if (!v101)
    {
      v102 = [MEMORY[0x1E4F28ED0] numberWithInt:v95];
      [(PLBatteryAgent *)self setPrevGGResetCount:v102];
    }
  }
  v103 = [v5 objectForKeyedSubscript:@"DOD0"];

  if (v103)
  {
    int v104 = [v5 objectForKeyedSubscript:@"DOD0"];
    uint64_t v105 = [v104 intValue];

    uint64_t v106 = [(PLBatteryAgent *)self lastDOD0];
    if (v106)
    {
      v107 = (void *)v106;
      v108 = [(PLBatteryAgent *)self lastDOD0];
      int v109 = [v108 intValue];

      if (v109 != v105)
      {
        MEMORY[0x1E4E7E330](@"com.apple.power.battery.DOD0Updated", 1);
        AnalyticsSendEventLazy();
      }
    }
    v110 = [MEMORY[0x1E4F28ED0] numberWithInt:v105];
    [(PLBatteryAgent *)self setLastDOD0:v110];
  }
  uint64_t v111 = [v5 objectForKeyedSubscript:@"VacVoltageLimit"];

  if (v111)
  {
    v112 = [v5 objectForKeyedSubscript:@"VacVoltageLimit"];
    uint64_t v113 = [v112 intValue];

    uint64_t v114 = [(PLBatteryAgent *)self lastVacVoltageLimit];
    if (v114)
    {
      BOOL v115 = (void *)v114;
      v116 = [(PLBatteryAgent *)self lastVacVoltageLimit];
      int v117 = [v116 intValue];

      if (v117 != v113)
      {
        uint64_t v118 = [MEMORY[0x1E4F28ED0] numberWithInt:v113];
        [(PLBatteryAgent *)self setLastVacVoltageLimit:v118];
      }
    }
    AnalyticsSendEventLazy();
    id v119 = [MEMORY[0x1E4F28ED0] numberWithInt:v113];
    [(PLBatteryAgent *)self setLastVacVoltageLimit:v119];
  }
  v120 = [v5 objectForKeyedSubscript:@"CurrentSenseMonitorStatus"];

  if (v120)
  {
    if ([(PLBatteryAgent *)self csmOverrideValue])
    {
      int v121 = PLLogCommon();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryAgent logEventBackwardBatteryWithRawData:]();
      }

      [v5 setObject:&unk_1F400E020 forKeyedSubscript:@"CurrentSenseMonitorStatus"];
    }
    [(PLBatteryAgent *)self updateCurrentSenseMonitorStatusWithEntry:v5];
  }
  [(PLOperator *)self logEntry:v5];
  [(PLBatteryAgent *)self logBatteryEntry:v5];
  id v16 = v5;

LABEL_92:
  return v16;
}

void __53__PLBatteryAgent_logEventBackwardBatteryWithRawData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [*(id *)(a1 + 32) lastITMiscStatus];
    id v7 = [v6 objectForKeyedSubscript:v13];
    int v8 = [v7 intValue];

    int v9 = [v5 intValue];
    unsigned int v10 = v9 - v8;
    uint64_t v11 = v9 >= v8 ? v10 : v10 + 4;
    if ((int)v11 >= 1)
    {
      id v12 = [MEMORY[0x1E4F28ED0] numberWithInt:v11];
      [*(id *)(a1 + 40) setObject:v12 forKeyedSubscript:v13];

      MEMORY[0x1E4E7E330]([NSString stringWithFormat:@"com.apple.power.battery.ITMiscStatus.%@.count", v13], v11);
    }
  }
}

id __53__PLBatteryAgent_logEventBackwardBatteryWithRawData___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __53__PLBatteryAgent_logEventBackwardBatteryWithRawData___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)MEMORY[0x1E4F28ED0];
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"BatteryCellDisconnectCount"];
  id v5 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "intValue"));
  [v2 setObject:v5 forKeyedSubscript:@"value"];

  return v2;
}

id __53__PLBatteryAgent_logEventBackwardBatteryWithRawData___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned int *)(a1 + 32)];
  [v2 setObject:v3 forKeyedSubscript:@"value"];

  return v2;
}

id __53__PLBatteryAgent_logEventBackwardBatteryWithRawData___block_invoke_5()
{
  v0 = objc_opt_new();
  [v0 setObject:&unk_1F400E020 forKeyedSubscript:@"DOD0Count"];
  return v0;
}

id __53__PLBatteryAgent_logEventBackwardBatteryWithRawData___block_invoke_6(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"VacVoltageLimit";
  uint64_t v1 = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned int *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (id)getGaugingMitigationDict
{
  if (IOPSGaugingMitigationGetState())
  {
    uint64_t v2 = PLLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      -[PLBatteryAgent getGaugingMitigationDict]();
    }
    id v3 = 0;
  }
  else
  {
    id v3 = 0;
    CFRelease(v3);
    uint64_t v2 = PLLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryAgent getGaugingMitigationDict]();
    }
  }

  return v3;
}

- (void)logEventBackwardChargingLimit
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 dictionary];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, a2, v4, "Logging current mitigation state: %@", v5);
}

- (void)logEventNoneUserType
{
  if (([MEMORY[0x1E4F929C0] liteMode] & 1) == 0)
  {
    id v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"UserType"];
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7];
    uint64_t v4 = (void *)MEMORY[0x1E4F28ED0];
    id v5 = [MEMORY[0x1E4F83A30] predictor];
    uint64_t v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "historicalClassification"));
    [v3 setObject:v6 forKeyedSubscript:@"UserType"];

    [(PLOperator *)self logEntry:v3];
  }
}

- (int)batteryLifetimeUPOCount
{
  CFMutableDictionaryRef v2 = IOServiceMatching("IOService");
  if (!v2) {
    return -1;
  }
  CFMutableDictionaryRef v3 = v2;
  int valuePtr = 0;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFNumberRef v15 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &valuePtr);
  CFDictionaryRef v5 = CFDictionaryCreate(v4, (const void **)&batteryLifetimeUPOCount_tmp, (const void **)&v15, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!v5)
  {
    CFRelease(v3);
    return -1;
  }
  CFDictionaryRef v6 = v5;
  CFDictionarySetValue(v3, @"IOPropertyMatch", v5);
  CFRelease(v6);
  uint64_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E4F2EF00], v3);
  if (!MatchingService) {
    return -1;
  }
  io_object_t v8 = MatchingService;
  int v9 = [MEMORY[0x1E4F92A00] snapshotFromIOEntry:MatchingService];
  unsigned int v10 = v9;
  if (v9
    && ([v9 objectForKeyedSubscript:@"IOPMUBootUPOCounter"],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    id v12 = [v10 objectForKeyedSubscript:@"IOPMUBootUPOCounter"];
    int v13 = [v12 intValue];
  }
  else
  {
    int v13 = -1;
  }
  IOObjectRelease(v8);

  return v13;
}

- (id)lowBatteryLogPath
{
  uint64_t v24 = 0;
  int v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__17;
  uint64_t v28 = __Block_byref_object_dispose__17;
  id v29 = 0;
  CFMutableDictionaryRef v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  CFMutableDictionaryRef v3 = [v2 contentsOfDirectoryAtPath:@"/var/mobile/Library/Logs/CrashReporter/" error:0];
  if (v3)
  {
    CFAllocatorRef v4 = (void *)MEMORY[0x1E4F28F60];
    CFDictionaryRef v5 = [NSString stringWithFormat:@"%@.*%@%@", @"LowBatteryLog-", @".ips", @"(\\.synced)?"];
    CFDictionaryRef v6 = [v4 predicateWithFormat:@"SELF MATCHES[c] %@", v5];

    id v7 = [v3 filteredArrayUsingPredicate:v6];
    io_object_t v8 = v7;
    if (v7 && [v7 count])
    {
      v22[0] = 0;
      v22[1] = v22;
      void v22[2] = 0x3032000000;
      void v22[3] = __Block_byref_object_copy__17;
      v22[4] = __Block_byref_object_dispose__17;
      id v23 = 0;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      void v16[2] = __35__PLBatteryAgent_lowBatteryLogPath__block_invoke;
      void v16[3] = &unk_1E6E4B660;
      id v9 = v8;
      id v17 = v9;
      uint64_t v18 = @"LowBatteryLog-";
      uint64_t v19 = @"yyyy-MM-dd-HHmmss";
      uint64_t v20 = v22;
      int v21 = &v24;
      [v9 enumerateObjectsUsingBlock:v16];
      if (!v25[5])
      {
        uint64_t v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") - 1);
        uint64_t v11 = (void *)v25[5];
        v25[5] = v10;
      }
      _Block_object_dispose(v22, 8);
    }
    uint64_t v12 = [NSString stringWithFormat:@"%@%@", @"/var/mobile/Library/Logs/CrashReporter/", v25[5]];
    int v13 = (void *)v25[5];
    v25[5] = v12;
  }
  id v14 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v14;
}

void __35__PLBatteryAgent_lowBatteryLogPath__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [obj length];
  if (v2 == 42 || v2 == 35)
  {
    CFMutableDictionaryRef v3 = objc_msgSend(obj, "substringWithRange:", objc_msgSend(*(id *)(a1 + 40), "length"), objc_msgSend(*(id *)(a1 + 48), "length"));
    id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v4 setDateFormat:*(void *)(a1 + 48)];
    CFDictionaryRef v5 = [v4 dateFromString:v3];
    if (v5)
    {
      CFDictionaryRef v6 = [MEMORY[0x1E4F1C9C8] date];
      id v7 = [v6 dateByAddingTimeInterval:-86400.0];
      uint64_t v8 = [v5 compare:v7];

      if (v8 == 1)
      {
        id v9 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        if (!v9 || [v9 compare:v5] == -1)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), obj);
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v5);
        }
      }
    }
  }
}

- (id)lowBatteryLogString
{
  uint64_t v2 = [(PLBatteryAgent *)self lowBatteryLogPath];
  if (v2)
  {
    CFMutableDictionaryRef v3 = [NSString stringWithContentsOfFile:v2 encoding:4 error:0];
    id v4 = [v3 componentsSeparatedByString:@"\n"];
    CFDictionaryRef v5 = (char *)[v4 count];
    if (v5)
    {
      uint64_t v6 = 0;
      while (1)
      {
        id v7 = [v4 objectAtIndexedSubscript:v6];
        char v8 = [v7 hasPrefix:@"Date:"];

        if (v8) {
          break;
        }
        if (v5 == (char *)++v6)
        {
          CFDictionaryRef v5 = 0;
          goto LABEL_9;
        }
      }
      id v9 = objc_msgSend(v4, "subarrayWithRange:", v6, &v5[-v6]);
      CFDictionaryRef v5 = [v9 componentsJoinedByString:@"\n"];
    }
LABEL_9:
  }
  else
  {
    CFDictionaryRef v5 = 0;
  }

  return v5;
}

- (id)isOriginalBattery
{
  BOOL v2 = +[PLBatteryAgent supportsxFlags];
  int v3 = objc_msgSend(MEMORY[0x1E4F92A38], "kPLDeviceClassIsOneOf:", 102027, 102028, 102029, 0);
  id v4 = 0;
  if (!v2 || v3 != 0)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F92A08]) initWithGroup:@"Battery" andSubGroup:0 withChannelIDs:&unk_1F4014F68];
    id v7 = [v6 currentValueForSimpleChannel:@"BatteryIDChanged"];
    char v8 = v7;
    if (v7)
    {
      id v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v7, "BOOLValue") ^ 1);
    }
    else
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v9 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __35__PLBatteryAgent_isOriginalBattery__block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        void block[4] = v9;
        if (isOriginalBattery_defaultOnce != -1) {
          dispatch_once(&isOriginalBattery_defaultOnce, block);
        }
        if (isOriginalBattery_classDebugEnabled)
        {
          uint64_t v10 = [NSString stringWithFormat:@"Could not determine original battery"];
          uint64_t v11 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
          int v13 = [v12 lastPathComponent];
          id v14 = [NSString stringWithUTF8String:"-[PLBatteryAgent isOriginalBattery]"];
          [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:6377];

          CFNumberRef v15 = PLLogCommon();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
      id v4 = 0;
    }
  }
  return v4;
}

uint64_t __35__PLBatteryAgent_isOriginalBattery__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  isOriginalBattery_classDebugEnabled = result;
  return result;
}

- (id)parseBatterySerialNumber:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = objc_opt_new();
  if (v4)
  {
    if ([v4 length] == 18)
    {
      uint64_t v6 = objc_msgSend(v4, "substringWithRange:", 0, 3);
      [v5 setObject:v6 forKeyedSubscript:@"vendor"];

      id v7 = objc_msgSend(v4, "substringWithRange:", 3, 3);
      [v5 setObject:v7 forKeyedSubscript:@"dom"];

      char v8 = objc_msgSend(v4, "substringWithRange:", 6, 5);
      [v5 setObject:v8 forKeyedSubscript:@"sequence"];

      uint64_t v9 = objc_msgSend(v4, "substringWithRange:", 11, 7);
      [v5 setObject:v9 forKeyedSubscript:@"eeee_code"];

      uint64_t v10 = [v5 objectForKeyedSubscript:@"dom"];
      unint64_t v11 = [(PLBatteryAgent *)self customConvertBase34ToBase10:v10];

      uint64_t v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v11 * 86400.0];
      id v13 = objc_alloc(MEMORY[0x1E4F1C9A8]);
      id v14 = (void *)[v13 initWithCalendarIdentifier:*MEMORY[0x1E4F1C3B0]];
      [v5 setObject:v12 forKeyedSubscript:@"SNDate"];
      CFNumberRef v15 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"UTC"];
      [v14 setTimeZone:v15];

      id v16 = [v14 components:24576 fromDate:v12];
      uint64_t v17 = [v16 valueForComponent:0x2000];
      uint64_t v18 = [v16 valueForComponent:0x4000];
      uint64_t v19 = [MEMORY[0x1E4F28ED0] numberWithInteger:v18];
      uint64_t v20 = [v19 stringValue];

      int v21 = objc_msgSend(v20, "substringFromIndex:", objc_msgSend(v20, "length") - 1);
      [v5 setObject:v21 forKeyedSubscript:@"year"];

      uint64_t v22 = [MEMORY[0x1E4F28ED0] numberWithInteger:v17];
      id v23 = [v22 stringValue];
      [v5 setObject:v23 forKeyedSubscript:@"week"];
    }
    else
    {
      if ([v4 length] == 17)
      {
        uint64_t v24 = objc_msgSend(v4, "substringWithRange:", 3, 1);
        [v5 setObject:v24 forKeyedSubscript:@"year"];

        int v25 = objc_msgSend(v4, "substringWithRange:", 4, 2);
        [v5 setObject:v25 forKeyedSubscript:@"week"];

        uint64_t v26 = v4;
        uint64_t v27 = 11;
      }
      else
      {
        if ([v4 length] != 12) {
          goto LABEL_10;
        }
        uint64_t v26 = v4;
        uint64_t v27 = 8;
      }
      uint64_t v12 = objc_msgSend(v26, "substringWithRange:", v27, 4);
      [v5 setObject:v12 forKeyedSubscript:@"eeee_code"];
    }
  }
LABEL_10:

  return v5;
}

- (unint64_t)customConvertBase34ToBase10:(id)a3
{
  v18[24] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v17[0] = &unk_1F400E110;
  v17[1] = &unk_1F400E140;
  v18[0] = &unk_1F400E128;
  v18[1] = &unk_1F400E158;
  void v17[2] = &unk_1F400E170;
  void v17[3] = &unk_1F400E1A0;
  void v18[2] = &unk_1F400E188;
  void v18[3] = &unk_1F400E1B8;
  v17[4] = &unk_1F400E1D0;
  void v17[5] = &unk_1F400E200;
  void v18[4] = &unk_1F400E1E8;
  void v18[5] = &unk_1F400E218;
  v17[6] = &unk_1F400E230;
  v17[7] = &unk_1F400E260;
  void v18[6] = &unk_1F400E248;
  v18[7] = &unk_1F400E278;
  v17[8] = &unk_1F400E290;
  v17[9] = &unk_1F400E2C0;
  v18[8] = &unk_1F400E2A8;
  v18[9] = &unk_1F400E2D8;
  v17[10] = &unk_1F400E2F0;
  v17[11] = &unk_1F400E320;
  v18[10] = &unk_1F400E308;
  v18[11] = &unk_1F400E338;
  v17[12] = &unk_1F400E350;
  v17[13] = &unk_1F400E380;
  v18[12] = &unk_1F400E368;
  v18[13] = &unk_1F400E398;
  v17[14] = &unk_1F400E3B0;
  v17[15] = &unk_1F400E3E0;
  void v18[14] = &unk_1F400E3C8;
  v18[15] = &unk_1F400E3F8;
  v17[16] = &unk_1F400E410;
  v17[17] = &unk_1F400E440;
  v18[16] = &unk_1F400E428;
  v18[17] = &unk_1F400E458;
  v17[18] = &unk_1F400E470;
  v17[19] = &unk_1F400E4A0;
  v18[18] = &unk_1F400E488;
  v18[19] = &unk_1F400E4B8;
  v17[20] = &unk_1F400E4D0;
  v17[21] = &unk_1F400E500;
  v18[20] = &unk_1F400E4E8;
  v18[21] = &unk_1F400E518;
  v17[22] = &unk_1F400E530;
  v17[23] = &unk_1F400E560;
  v18[22] = &unk_1F400E548;
  v18[23] = &unk_1F400E578;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:24];
  if ([v3 isEqualToString:@"000"])
  {
    unint64_t v5 = 39304;
    goto LABEL_15;
  }
  if (![v3 length]) {
    goto LABEL_14;
  }
  unint64_t v6 = 0;
  unint64_t v5 = 0;
  int v7 = 2;
  while (1)
  {
    uint64_t v8 = [v3 characterAtIndex:v6];
    uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedShort:v8];
    uint64_t v10 = [v4 objectForKey:v9];

    if (!v10) {
      break;
    }
    double v11 = pow(34.0, (double)v7);
    uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedShort:v8];
    id v13 = [v4 objectForKeyedSubscript:v12];
    double v14 = (double)v5 + v11 * (double)(int)[v13 intValue];

LABEL_9:
    unint64_t v5 = (unint64_t)v14;
    ++v6;
    --v7;
    if ([v3 length] <= v6) {
      goto LABEL_15;
    }
  }
  if ((v8 - 48) <= 9)
  {
    double v14 = (double)v5 + pow(34.0, (double)v7) * (double)((int)v8 - 48);
    goto LABEL_9;
  }
  CFNumberRef v15 = PLLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[PLBatteryAgent customConvertBase34ToBase10:]();
  }

LABEL_14:
  unint64_t v5 = 0;
LABEL_15:

  return v5;
}

- (id)weekOfManufacture:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 objectForKeyedSubscript:@"Serial"];
  if (!v5) {
    goto LABEL_8;
  }
  unint64_t v6 = [(PLBatteryAgent *)self parseBatterySerialNumber:v5];
  int v7 = [v6 objectForKeyedSubscript:@"year"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"week"];
  uint64_t v9 = v8;
  if (!v7 || !v8)
  {

LABEL_8:
    id v13 = &unk_1F400DFC0;
    goto LABEL_9;
  }
  if ([v8 length] == 1)
  {
    uint64_t v10 = [NSString stringWithFormat:@"0%@", v9];

    uint64_t v9 = (void *)v10;
  }
  double v11 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v12 = [v7 stringByAppendingString:v9];
  id v13 = objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "integerValue"));

LABEL_9:
  return v13;
}

- (id)batteryEEEECode:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 objectForKeyedSubscript:@"Serial"];
  if (v5)
  {
    unint64_t v6 = [(PLBatteryAgent *)self parseBatterySerialNumber:v5];
    int v7 = [v6 objectForKeyedSubscript:@"eeee_code"];
  }
  else
  {
    int v7 = &stru_1F3FCA098;
  }

  return v7;
}

- (id)parseRawSafetyFaultCounter:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  if (v3)
  {
    id v5 = v3;
    unint64_t v6 = (unsigned __int8 *)[v5 bytes];
    uint64_t v7 = [v5 length];
    unint64_t v8 = (unint64_t)(2 * v7) >= 0x13 ? 19 : 2 * v7;
    if (v8)
    {
      unint64_t v9 = 0;
      do
      {
        unsigned int v11 = *v6++;
        unsigned int v10 = v11;
        uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithUnsignedShort:v11 & 0xF];
        [v4 addObject:v12];
        unint64_t v13 = v9 + 1;
        if (v9 + 1 < v8)
        {
          uint64_t v14 = [objc_alloc(MEMORY[0x1E4F28ED0]) initWithUnsignedShort:v10 >> 4];

          [v4 addObject:v14];
          unint64_t v13 = v9 + 2;
          uint64_t v12 = (void *)v14;
        }

        unint64_t v9 = v13;
      }
      while (v13 < v8);
    }
  }

  return v4;
}

- (id)parseRawRaTableData:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  if (v3)
  {
    unint64_t v5 = [v3 length];
    if (v5 >= 2)
    {
      unint64_t v6 = v5;
      uint64_t v7 = [v3 bytes];
      if (v6 >= 4)
      {
        uint64_t v8 = v6 >> 1;
        if (v6 >> 1 <= 2) {
          uint64_t v8 = 2;
        }
        unint64_t v9 = (unsigned __int8 *)(v7 + 1);
        uint64_t v10 = v8 - 1;
        do
        {
          uint64_t v11 = *(v9 - 1);
          id v12 = objc_alloc(MEMORY[0x1E4F28ED0]);
          unsigned int v13 = *v9;
          v9 += 2;
          uint64_t v14 = (void *)[v12 initWithUnsignedLong:v13 | (unint64_t)(v11 << 8)];
          [v4 addObject:v14];

          --v10;
        }
        while (v10);
      }
    }
  }

  return v4;
}

- (id)presentMaxRaFromRawData:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:-2147483647];
  if (v4)
  {
    unint64_t v6 = [v4 objectForKeyedSubscript:@"BatteryData"];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"RaTableRaw"];

    uint64_t v8 = [v7 firstObject];
    unint64_t v9 = [(PLBatteryAgent *)self parseRawRaTableData:v8];
    if ([v9 count] == 15)
    {
      uint64_t v20 = v7;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v10 = objc_msgSend(v9, "subarrayWithRange:", 0, 8);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v10);
            }
            CFNumberRef v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            int v16 = [v15 intValue];
            if (v16 > (int)[v5 intValue])
            {
              id v17 = v15;

              id v5 = v17;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v12);
      }

      id v5 = v5;
      uint64_t v18 = v5;
      uint64_t v7 = v20;
    }
    else
    {
      uint64_t v18 = 0;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (id)parseITMiscStatusCounters:(id)a3
{
  v15[8] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    unsigned int v3 = [a3 unsignedShortValue];
    v14[0] = @"QmaxDisqualified";
    id v4 = [MEMORY[0x1E4F28ED0] numberWithInt:v3 >> 14];
    v15[0] = v4;
    v14[1] = @"QmaxDOD0";
    id v5 = [MEMORY[0x1E4F28ED0] numberWithInt:(v3 >> 12) & 3];
    v15[1] = v5;
    void v14[2] = @"DOD0Update";
    unint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithInt:(v3 >> 10) & 3];
    void v15[2] = v6;
    void v14[3] = @"QmaxAtEOC";
    uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithInt:(v3 >> 8) & 3];
    void v15[3] = v7;
    void v14[4] = @"FastQmaxUpdate";
    uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithInt:v3 >> 6];
    void v15[4] = v8;
    v14[5] = @"QmaxUpdate";
    unint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithInt:(v3 >> 4) & 3];
    v15[5] = v9;
    v14[6] = @"RaUpdate";
    uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithInt:(v3 >> 2) & 3];
    v15[6] = v10;
    v14[7] = @"ITSimulation";
    uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithInt:v3 & 3];
    v15[7] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:8];
  }
  else
  {
    uint64_t v12 = 0;
  }
  return v12;
}

- (id)parseTimeAtHighSoc:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v3)
  {
    unint64_t v5 = [v3 length];
    uint64_t v6 = [v3 bytes];
    if (v5 >= 4)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      do
      {
        NSLog(&cfstr_BinDU.isa, v8, *(unsigned int *)(v7 + 4 * v8));
        unint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"bin%d", v8);
        uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:*(unsigned int *)(v7 + 4 * v8)];
        [v4 setObject:v10 forKeyedSubscript:v9];

        ++v8;
      }
      while (v5 >> 2 != v8);
    }
  }
  if ([v4 count]) {
    id v11 = v4;
  }
  else {
    id v11 = 0;
  }

  return v11;
}

- (id)parseLowVoltageResidencyCounters:(id)a3
{
  id v3 = a3;
  uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v3)
  {
    unint64_t v4 = [v3 length];
    uint64_t v5 = [v3 bytes];
    if (v4 >= 4)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      do
      {
        NSLog(&cfstr_Lowvoltageresi_0.isa, v7, *(unsigned int *)(v6 + 4 * v7));
        uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"bin%d", v7);
        unint64_t v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLong:", +[PLUtilities roundToSigFig:withSigFig:](PLUtilities, "roundToSigFig:withSigFig:", *(unsigned int *)(v6 + 4 * v7), 2));
        [v12 setObject:v9 forKeyedSubscript:v8];

        ++v7;
      }
      while (v4 >> 2 != v7);
    }
  }
  if ([v12 count]) {
    id v10 = v12;
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (id)parseFlashWearLevelData:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v3)
  {
    unint64_t v5 = [v3 length];
    uint64_t v6 = [v3 bytes];
    unint64_t v7 = [&unk_1F4014F80 count];
    unint64_t v8 = v5 >> 2 >= v7 ? v7 : v5 >> 2;
    if (v8)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        id v10 = PLLogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          int v13 = *(_DWORD *)(v6 + 4 * i);
          *(_DWORD *)buf = 67109376;
          int v17 = i;
          __int16 v18 = 1024;
          int v19 = v13;
          _os_log_debug_impl(&dword_1E4220000, v10, OS_LOG_TYPE_DEBUG, "flashWearLevelData %d: %u", buf, 0xEu);
        }

        id v11 = [&unk_1F4014F80 objectAtIndexedSubscript:i];
        uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:*(unsigned int *)(v6 + 4 * i)];
        [v4 setObject:v12 forKeyedSubscript:v11];
      }
    }
  }
  if ([v4 count]) {
    id v14 = v4;
  }
  else {
    id v14 = 0;
  }

  return v14;
}

- (void)pushLowVoltageResidencyCountersToCA:(id)a3
{
}

void __54__PLBatteryAgent_pushLowVoltageResidencyCountersToCA___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v4 = v7;
  id v5 = v6;
  AnalyticsSendEventLazy();
}

id __54__PLBatteryAgent_pushLowVoltageResidencyCountersToCA___block_invoke_2(uint64_t a1)
{
  BOOL v2 = objc_opt_new();
  id v3 = [*(id *)(a1 + 32) substringFromIndex:objc_msgSend(@"bin", "length")];
  [v2 setObject:v3 forKeyedSubscript:@"bin"];

  [v2 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"value"];
  return v2;
}

- (id)parseTimeAtHighSocHex:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PLBatteryAgent *)self dataFromHexString:v4];
    id v6 = [(PLBatteryAgent *)self parseTimeAtHighSoc:v5];
  }
  else
  {
    id v6 = 0;
  }
  if ([v6 count]) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)dataFromHexString:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA58] data];
  __int16 v9 = 0;
  int v5 = [v3 length];
  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      __str[0] = [v3 characterAtIndex:v6];
      __str[1] = [v3 characterAtIndex:v6 + 1];
      HIBYTE(v9) = strtol(__str, 0, 16);
      [v4 appendBytes:(char *)&v9 + 1 length:1];
      v6 += 2;
    }
    while ((int)v6 < v5);
  }

  return v4;
}

- (void)pushTimeAtHighSocToAggD:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  int v5 = [v3 dictionary];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __42__PLBatteryAgent_pushTimeAtHighSocToAggD___block_invoke;
  void v7[3] = &unk_1E6E49E88;
  id v6 = v5;
  id v8 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  if ([v6 count]) {
    MEMORY[0x1E4E7E340](0, v6);
  }
}

void __42__PLBatteryAgent_pushTimeAtHighSocToAggD___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [@"com.apple.power.battery.TimeAtHighSoc." stringByAppendingString:a2];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

- (void)pushTimeAtHighSocToCA:(id)a3
{
}

void __40__PLBatteryAgent_pushTimeAtHighSocToCA___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v4 = v7;
  id v5 = v6;
  AnalyticsSendEventLazy();
}

id __40__PLBatteryAgent_pushTimeAtHighSocToCA___block_invoke_2(uint64_t a1)
{
  BOOL v2 = objc_opt_new();
  id v3 = [*(id *)(a1 + 32) substringFromIndex:objc_msgSend(@"bin", "length")];
  [v2 setObject:v3 forKeyedSubscript:@"bin"];

  [v2 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"value"];
  return v2;
}

- (void)pushFlashWearLevelDataToCA:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"factory"];
  id v5 = [v3 objectForKeyedSubscript:@"usr"];
  id v6 = [v3 objectForKeyedSubscript:@"log"];
  id v7 = [v3 objectForKeyedSubscript:@"bdc"];

  if (v4 && v5 && v6 && v7)
  {
    id v8 = PLLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      id v14 = v4;
      __int16 v15 = 2112;
      int v16 = v5;
      __int16 v17 = 2112;
      __int16 v18 = v6;
      __int16 v19 = 2112;
      uint64_t v20 = v7;
      _os_log_impl(&dword_1E4220000, v8, OS_LOG_TYPE_INFO, "Pushing FlashWearLevelData to CA - factory:%@ usr:%@ log:%@ bdc:%@", buf, 0x2Au);
    }

    id v9 = v4;
    id v10 = v5;
    id v11 = v6;
    id v12 = v7;
    AnalyticsSendEventLazy();
  }
}

id __45__PLBatteryAgent_pushFlashWearLevelDataToCA___block_invoke(void *a1)
{
  BOOL v2 = objc_opt_new();
  [v2 setObject:a1[4] forKeyedSubscript:@"factory"];
  [v2 setObject:a1[5] forKeyedSubscript:@"usr"];
  [v2 setObject:a1[6] forKeyedSubscript:@"log"];
  [v2 setObject:a1[7] forKeyedSubscript:@"bdc"];
  return v2;
}

- (id)getUPOStepperData
{
  id v3 = objc_opt_new();
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3D0];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  id v6 = (void *)CFPreferencesCopyValue(@"mitigatedUPOCount", @"com.apple.thermalmonitor.upostepper.metrics", (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  CFPropertyListRef v7 = CFPreferencesCopyValue(@"upoMetrics", @"com.apple.thermalmonitor.upostepper.metrics", v4, v5);
  id v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    id v11 = 0;
  }
  else
  {
    [v3 setObject:v6 forKeyedSubscript:@"mitigatedUPOCount"];
    id v10 = [v8 lastObject];
    [v3 setObject:v10 forKeyedSubscript:@"upoMetrics"];

    [(PLBatteryAgent *)self setMitigatedUPOCountDefault:v6];
    id v11 = v3;
  }

  return v11;
}

- (void)setMitigatedUPOCountDefault:(id)a3
{
  objc_storeStrong((id *)&self->_mitigatedUPOCount, a3);
  id v4 = a3;
  +[PLUtilities containerPath];
  _CFPreferencesSetValueWithContainer();
  id v5 = +[PLUtilities containerPath];

  MEMORY[0x1F40D8F38](@"com.apple.powerlogd", v5);
}

- (id)getMitigatedUPOCountDefault
{
  +[PLUtilities containerPath];
  BOOL v2 = (void *)_CFPreferencesCopyValueWithContainer();
  return v2;
}

- (id)getBatteryShutdownData
{
  mach_port_t v2 = *MEMORY[0x1E4F2EF00];
  CFDictionaryRef v3 = IOServiceMatching("IOPMPowerSource");
  uint64_t MatchingService = IOServiceGetMatchingService(v2, v3);
  id v5 = (void *)MEMORY[0x1E4F92A00];
  return (id)[v5 snapshotFromIOEntry:MatchingService];
}

- (void)setAggdIntegerValueFromEntry:(id)a3 forKey:(id)a4 withPrefix:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  BOOL v9 = [a3 objectForKeyedSubscript:v7];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [v8 stringByAppendingString:v7];
      id v11 = PLLogBH();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryAgent setAggdIntegerValueFromEntry:forKey:withPrefix:]();
      }

      [v9 integerValue];
      ADClientSetValueForScalarKey();
    }
  }
}

- (void)logBatteryShutdownToCA:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v24 = objc_opt_new();
  id v5 = [v4 objectForKeyedSubscript:@"DataError"];
  long long v23 = v5;
  if (v5)
  {
    int v6 = [v5 intValue];
    MEMORY[0x1E4E7E330](@"com.apple.power.batteryshutdown.Count", 1);
    if (v6) {
      goto LABEL_7;
    }
  }
  else
  {
    MEMORY[0x1E4E7E330](@"com.apple.power.batteryshutdown.Count", 1);
  }
  id v7 = [v4 objectForKeyedSubscript:@"UISOC"];
  int v8 = [v7 intValue];

  if (v8 >= 11)
  {
    MEMORY[0x1E4E7E330](@"com.apple.power.batteryshutdown.UPOCount", 1);
    [v24 setObject:&unk_1F400E020 forKeyedSubscript:@"UPOCount"];
  }
LABEL_7:
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  BOOL v9 = [v4 definedKeys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    int v13 = @"LowBatteryLog";
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        __int16 v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (([v15 isEqualToString:@"BatteryShutdownTimestamp"] & 1) == 0
          && ([v15 isEqualToString:v13] & 1) == 0)
        {
          int v16 = [v4 objectForKeyedSubscript:v15];
          if (v16)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              __int16 v17 = v9;
              __int16 v18 = v13;
              id v19 = v4;
              uint64_t v20 = self;
              uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v16, "integerValue"));
              [v24 setValue:v21 forKey:v15];

              self = v20;
              id v4 = v19;
              int v13 = v18;
              BOOL v9 = v17;
            }
          }
          [(PLBatteryAgent *)self setAggdIntegerValueFromEntry:v4 forKey:v15 withPrefix:@"com.apple.power.batteryshutdown."];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  id v22 = v24;
  AnalyticsSendEventLazy();
}

id __41__PLBatteryAgent_logBatteryShutdownToCA___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)aggdTimerFired
{
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__PLBatteryAgent_aggdTimerFired__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v3;
    if (aggdTimerFired_defaultOnce != -1) {
      dispatch_once(&aggdTimerFired_defaultOnce, block);
    }
    if (aggdTimerFired_classDebugEnabled)
    {
      id v4 = [NSString stringWithFormat:@"Aggd Timer Fired"];
      id v5 = (void *)MEMORY[0x1E4F929B8];
      int v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      id v7 = [v6 lastPathComponent];
      int v8 = [NSString stringWithUTF8String:"-[PLBatteryAgent aggdTimerFired]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:6910];

      BOOL v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  uint64_t v10 = [(PLBatteryAgent *)self lastBatteryConfigEntry];

  if (v10)
  {
    uint64_t v11 = [(PLBatteryAgent *)self lastBatteryConfigEntry];
    [(PLBatteryAgent *)self logBatteryConfigToAggd:v11];

    uint64_t v12 = [(PLBatteryAgent *)self lastBatteryConfigEntry];
    [(PLBatteryAgent *)self logBatteryConfigToCA:v12];

    int v13 = [(PLBatteryAgent *)self lastBatteryConfigEntry];
    id v14 = [v13 objectForKeyedSubscript:@"xFlags"];

    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v14;
        AnalyticsSendEventLazy();
      }
    }
  }
}

uint64_t __32__PLBatteryAgent_aggdTimerFired__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  aggdTimerFired_classDebugEnabled = result;
  return result;
}

id __32__PLBatteryAgent_aggdTimerFired__block_invoke_4795(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"flags";
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "integerValue"));
  v5[0] = v1;
  mach_port_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)logBatteryConfigToAggd:(id)a3
{
  v19[24] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    int v6 = [v4 definedKeys];
    id v7 = (void *)[v6 mutableCopy];

    v19[0] = @"RSS";
    v19[1] = @"ChemID";
    void v19[2] = @"QmaxCell0";
    void v19[3] = @"KioskModeHighSocSeconds";
    v19[4] = @"NominalChargeCapacity";
    v19[5] = @"SafetyEvent0";
    void v19[6] = @"SafetyEvent1";
    v19[7] = @"SafetyEvent2";
    v19[8] = @"SafetyEvent3";
    v19[9] = @"SafetyEvent4";
    v19[10] = @"SafetyEvent5";
    v19[11] = @"SafetyEvent6";
    v19[12] = @"SafetyEvent7";
    v19[13] = @"SafetyEvent8";
    v19[14] = @"SafetyEvent9";
    v19[15] = @"SafetyEvent10";
    void v19[16] = @"SafetyEvent11";
    v19[17] = @"SafetyEvent12";
    v19[18] = @"SafetyEvent13";
    v19[19] = @"SafetyEvent14";
    v19[20] = @"SafetyEvent15";
    v19[21] = @"SafetyEvent16";
    v19[22] = @"SafetyEvent17";
    v19[23] = @"SafetyEvent18";
    int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:24];
    [v7 addObjectsFromArray:v8];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [(PLBatteryAgent *)self setAggdIntegerValueFromEntry:v5, *(void *)(*((void *)&v14 + 1) + 8 * v13++), @"com.apple.power.battery.", (void)v14 forKey withPrefix];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void)logBatteryConfigToCA:(id)a3
{
  v35[26] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryAgent logBatteryConfigToCA:].cold.4();
  }

  if (v4)
  {
    id v26 = v4;
    int v6 = [v4 definedKeys];
    id v7 = (void *)[v6 mutableCopy];

    int v8 = PLLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryAgent logBatteryConfigToCA:]();
    }

    long long v25 = objc_opt_new();
    id v9 = PLLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryAgent logBatteryConfigToCA:]();
    }

    v35[0] = @"RSS";
    v35[1] = @"ChemID";
    void v35[2] = @"QmaxCell0";
    v35[3] = @"KioskModeHighSocSeconds";
    void v35[4] = @"LastUPOSystemTimestamp";
    v35[5] = @"NominalChargeCapacity";
    v35[6] = @"SafetyEvent0";
    v35[7] = @"SafetyEvent1";
    v35[8] = @"SafetyEvent2";
    v35[9] = @"SafetyEvent3";
    v35[10] = @"SafetyEvent4";
    v35[11] = @"SafetyEvent5";
    v35[12] = @"SafetyEvent6";
    v35[13] = @"SafetyEvent7";
    v35[14] = @"SafetyEvent8";
    v35[15] = @"SafetyEvent9";
    v35[16] = @"SafetyEvent10";
    v35[17] = @"SafetyEvent11";
    v35[18] = @"SafetyEvent12";
    v35[19] = @"SafetyEvent13";
    v35[20] = @"SafetyEvent14";
    v35[21] = @"SafetyEvent15";
    v35[22] = @"SafetyEvent16";
    v35[23] = @"SafetyEvent17";
    v35[24] = @"SafetyEvent18";
    v35[25] = @"LTDataCorruptionOffset";
    long long v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:26];
    objc_msgSend(v7, "addObjectsFromArray:");
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v7;
    uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    id v4 = v26;
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v29;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(obj);
          }
          long long v14 = *(void **)(*((void *)&v28 + 1) + 8 * v13);
          long long v15 = PLLogCommon();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v33 = v14;
            _os_log_debug_impl(&dword_1E4220000, v15, OS_LOG_TYPE_DEBUG, "In logBatteryConfigtoCA. Adding key %@", buf, 0xCu);
          }

          long long v16 = [v4 objectForKeyedSubscript:v14];
          if ([v14 isEqualToString:@"DOFU"])
          {
            long long v17 = [(PLBatteryAgent *)self serialNumber];
            uint64_t v18 = [(PLBatteryAgent *)self ApplyPolicyToDOFU:v16 forSerial:v17];

            long long v16 = (void *)v18;
            id v4 = v26;
          }
          id v19 = v14;
          if ([v19 rangeOfString:@"-"] != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v20 = [v19 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

            id v19 = (id)v20;
          }
          if (v16)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v25 setValue:v16 forKey:v19];
            }
          }

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v11);
    }

    uint64_t v21 = PLLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryAgent logBatteryConfigToCA:]();
    }

    id v22 = v25;
    AnalyticsSendEventLazy();
    long long v23 = PLLogCommon();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4220000, v23, OS_LOG_TYPE_DEFAULT, "In logBatteryConfigtoCA. Sent to CA", buf, 2u);
    }
  }
}

id __39__PLBatteryAgent_logBatteryConfigToCA___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)logBaselineToAggD:(id)a3
{
  id v4 = a3;
  id v5 = [v4 definedKeys];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __36__PLBatteryAgent_logBaselineToAggD___block_invoke;
  void v13[3] = &unk_1E6E49128;
  void v13[4] = self;
  id v6 = v4;
  id v14 = v6;
  [v5 enumerateObjectsUsingBlock:v13];
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  int v8 = [v6 objectForKeyedSubscript:@"TimeAtHighSoc"];
  id v9 = [(PLBatteryAgent *)self parseTimeAtHighSocHex:v8];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __36__PLBatteryAgent_logBaselineToAggD___block_invoke_2;
  v11[3] = &unk_1E6E49E88;
  id v10 = v7;
  id v12 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v11];
  if ([v10 count]) {
    MEMORY[0x1E4E7E340](0, v10);
  }
}

uint64_t __36__PLBatteryAgent_logBaselineToAggD___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setAggdIntegerValueFromEntry:*(void *)(a1 + 40) forKey:a2 withPrefix:@"com.apple.power.battery.calibration0.baseline."];
}

void __36__PLBatteryAgent_logBaselineToAggD___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [@"com.apple.power.battery.calibration0.baseline.TimeAtHighSoc." stringByAppendingString:a2];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

- (void)logBaselineToCA:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 definedKeys];
  uint64_t v20 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
        uint64_t v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v26 = v10;
          _os_log_debug_impl(&dword_1E4220000, v11, OS_LOG_TYPE_DEBUG, "In logBaselinetoCA. Adding key %@", buf, 0xCu);
        }

        id v12 = [v3 objectForKeyedSubscript:v10];
        id v13 = v10;
        if ([v13 rangeOfString:@"-"] != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v14 = [v13 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

          id v13 = (id)v14;
        }
        if (v12)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v20 setObject:v12 forKeyedSubscript:v13];
          }
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v7);
  }

  long long v15 = PLLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryAgent logBaselineToCA:]();
  }

  id v16 = v20;
  AnalyticsSendEventLazy();
  long long v17 = [v3 objectForKeyedSubscript:@"TimeAtHighSoc"];
  uint64_t v18 = [(PLBatteryAgent *)self parseTimeAtHighSocHex:v17];

  [v18 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_4813];
}

id __34__PLBatteryAgent_logBaselineToCA___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __34__PLBatteryAgent_logBaselineToCA___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v4 = v7;
  id v5 = v6;
  AnalyticsSendEventLazy();
}

id __34__PLBatteryAgent_logBaselineToCA___block_invoke_3(uint64_t a1)
{
  mach_port_t v2 = objc_opt_new();
  id v3 = [*(id *)(a1 + 32) substringFromIndex:objc_msgSend(@"bin", "length")];
  [v2 setObject:v3 forKeyedSubscript:@"bin"];

  [v2 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"value"];
  return v2;
}

- (void)logKioskModeEntryToAggd:(id)a3
{
  id v4 = a3;
  id v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryAgent logKioskModeEntryToAggd:]();
  }

  id v6 = [v4 definedKeys];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__PLBatteryAgent_logKioskModeEntryToAggd___block_invoke;
  void v8[3] = &unk_1E6E49128;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateObjectsUsingBlock:v8];
}

uint64_t __42__PLBatteryAgent_logKioskModeEntryToAggd___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setAggdIntegerValueFromEntry:*(void *)(a1 + 40) forKey:a2 withPrefix:@"com.apple.power.battery."];
}

- (void)logKioskModeEntryToCA:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 definedKeys];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __40__PLBatteryAgent_logKioskModeEntryToCA___block_invoke;
  v10[3] = &unk_1E6E49128;
  id v11 = v3;
  id v6 = v4;
  id v12 = v6;
  id v7 = v3;
  [v5 enumerateObjectsUsingBlock:v10];

  id v9 = v6;
  id v8 = v6;
  AnalyticsSendEventLazy();
}

void __40__PLBatteryAgent_logKioskModeEntryToCA___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  id v8 = v3;
  id v5 = v8;
  if ([v8 rangeOfString:@"-"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = [v8 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
  }
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = *(void **)(a1 + 40);
      id v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v4, "integerValue"));
      [v6 setValue:v7 forKey:v5];
    }
  }
}

id __40__PLBatteryAgent_logKioskModeEntryToCA___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)logFlashAgingToCA:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"BatteryData"];
  id v5 = [v4 objectForKeyedSubscript:@"LifetimeData"];
  id v6 = [v5 objectForKeyedSubscript:@"FlashEraseCounter"];

  id v7 = [v3 objectForKeyedSubscript:@"BatteryData"];

  id v8 = [v7 objectForKeyedSubscript:@"LifetimeData"];
  id v9 = [v8 objectForKeyedSubscript:@"FlashFailureCounter"];

  if (v9)
  {
    [v9 unsignedIntValue];
    id v10 = v6;
    AnalyticsSendEventLazy();
  }
}

id __36__PLBatteryAgent_logFlashAgingToCA___block_invoke(uint64_t a1)
{
  void v7[3] = *MEMORY[0x1E4F143B8];
  v7[0] = *(void *)(a1 + 32);
  v6[0] = @"dnvd_flash_erase_counters";
  v6[1] = @"flash_failure_counters";
  mach_port_t v2 = [MEMORY[0x1E4F28ED0] numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 40)];
  v7[1] = v2;
  void v6[2] = @"last_flash_failure_error";
  id v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 42)];
  void v7[2] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (void)logSlowChargingReasonToCA:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"ChargerData"];

  if (v4)
  {
    id v5 = [v3 objectForKeyedSubscript:@"ChargerData"];
    id v6 = [v5 objectForKeyedSubscript:@"SlowChargingReason"];

    if (v6)
    {
      id v7 = v6;
      AnalyticsSendEventLazy();
    }
  }
}

id __44__PLBatteryAgent_logSlowChargingReasonToCA___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"slow_charging_reason";
  v5[0] = v1;
  mach_port_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (void)logkBatteryRsenseOpenCountToCA:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"BatteryData"];

  if (v4)
  {
    id v5 = [v3 objectForKeyedSubscript:@"BatteryData"];
    id v6 = [v5 objectForKeyedSubscript:@"BatteryRsenseOpenCount"];

    if (v6)
    {
      id v7 = v6;
      AnalyticsSendEventLazy();
    }
  }
}

id __49__PLBatteryAgent_logkBatteryRsenseOpenCountToCA___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"battery_Rsense_opencount";
  v5[0] = v1;
  mach_port_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (id)ApplyPolicyToDOFU:(id)a3 forSerial:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = v6;
  id v8 = 0;
  if (a3 && v6)
  {
    int v9 = [a3 intValue];
    if (v9)
    {
      int v10 = v9;
      id v11 = [(PLBatteryAgent *)self parseBatterySerialNumber:v7];
      id v12 = v11;
      if (v11)
      {
        id v13 = [v11 objectForKeyedSubscript:@"SNDate"];
        uint64_t v14 = v13;
        if (v13)
        {
          int v15 = v10;
          [v13 timeIntervalSince1970];
          uint64_t v17 = v10 - (uint64_t)(int)v16;
          uint64_t v18 = PLLogCommon();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            -[PLBatteryAgent ApplyPolicyToDOFU:forSerial:]();
          }

          if (v17 < 0)
          {
            id v19 = PLLogCommon();
            uint64_t v17 = -v17;
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              int v22 = 134217984;
              uint64_t v23 = v17;
              _os_log_error_impl(&dword_1E4220000, v19, OS_LOG_TYPE_ERROR, "diff of the DOFU and SN is negative with the value of %ld", (uint8_t *)&v22, 0xCu);
            }
          }
          double v20 = dbl_1E44048A0[(double)v17 / 604800.0 > 52.0];
          id v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:floor((double)v15 / v20) * v20];
        }
        else
        {
          id v8 = 0;
        }
      }
      else
      {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (void)logEventPointBatteryShutdown
{
  v81[1] = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = [(PLBatteryAgent *)self getBatteryShutdownData];
  id v79 = v2;
  if (v2)
  {
    id v3 = [v2 objectForKeyedSubscript:@"BatteryShutdownReason"];
    id v4 = v3;
    if (v3 && [v3 count])
    {
      id v76 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"BatteryShutdown"];
      id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v76];
      v77 = [MEMORY[0x1E4F929C0] objectForKey:@"LastShutdownSystemTimestamp"];
      id v6 = [v4 objectForKeyedSubscript:@"ShutDownTimestamp"];
      if (v6)
      {
        id v7 = [v4 objectForKeyedSubscript:@"ShutDownTimestamp"];
        [v7 doubleValue];
        double v9 = v8;
      }
      else
      {
        double v9 = 0.0;
      }

      if (!v77 || ([v77 doubleValue], v10 != v9))
      {
        id v73 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v9];
        int v75 = [v73 convertFromSystemToMonotonic];
        [v75 timeIntervalSince1970];
        double v12 = v11;
        [v5 setObject:v75 forKeyedSubscript:@"BatteryShutdownTimestamp"];
        id v13 = [v4 objectForKeyedSubscript:@"ShutDownUISoc"];
        [v5 setObject:v13 forKeyedSubscript:@"UISOC"];

        uint64_t v14 = [v4 objectForKeyedSubscript:@"ShutDownTemperature"];
        [v5 setObject:v14 forKeyedSubscript:@"Temperature"];

        int v15 = [v4 objectForKeyedSubscript:@"ShutDownPresentDOD"];
        [v5 setObject:v15 forKeyedSubscript:@"PresentDOD"];

        double v16 = [v4 objectForKeyedSubscript:@"ShutDownMaxRa08"];
        [v5 setObject:v16 forKeyedSubscript:@"MaximumRa0-8"];

        uint64_t v17 = [v4 objectForKeyedSubscript:@"ShutDownNominalChargeCapacity"];
        [v5 setObject:v17 forKeyedSubscript:@"NominalChargeCapacity"];

        uint64_t v18 = [v4 objectForKeyedSubscript:@"ShutDownPrevNominalChargeCapacity"];
        [v5 setObject:v18 forKeyedSubscript:@"NominalChargeCapacityPrevious"];

        id v19 = [v4 objectForKeyedSubscript:@"ShutDownFullChargeCapacity"];
        [v5 setObject:v19 forKeyedSubscript:@"FullChargeCapacity"];

        double v20 = [v4 objectForKeyedSubscript:@"ShutDownPrevFullChargeCapacity"];
        [v5 setObject:v20 forKeyedSubscript:@"FullChargeCapacityPrevious"];

        long long v21 = [v4 objectForKeyedSubscript:@"ShutDownRemainingCapacity"];
        [v5 setObject:v21 forKeyedSubscript:@"RemainingCapacity"];

        int v22 = [v4 objectForKeyedSubscript:@"ShutDownPrevRemainingCapacity"];
        [v5 setObject:v22 forKeyedSubscript:@"RemainingCapacityPrevious"];

        uint64_t v23 = [v4 objectForKeyedSubscript:@"ShutDownCycleCount"];
        [v5 setObject:v23 forKeyedSubscript:@"CycleCount"];

        uint64_t v24 = [v4 objectForKeyedSubscript:@"ShutDownMaxDischargeCurrent"];
        [v5 setObject:v24 forKeyedSubscript:@"MaximumDischargeCurrent"];

        long long v25 = [v4 objectForKeyedSubscript:@"ShutDownTimeAbove95"];
        [v5 setObject:v25 forKeyedSubscript:@"TimeAbove95Perc"];

        id v26 = [v4 objectForKeyedSubscript:@"ShutDownVoltage"];
        [v5 setObject:v26 forKeyedSubscript:@"Voltage"];

        long long v27 = [v4 objectForKeyedSubscript:@"ShutDownPrevVoltage"];
        [v5 setObject:v27 forKeyedSubscript:@"VoltagePrevious"];

        uint64_t v28 = [v4 objectForKeyedSubscript:@"ShutDownAverageCurrent"];
        [v5 setObject:v28 forKeyedSubscript:@"AverageCurrent"];

        long long v29 = [v4 objectForKeyedSubscript:@"ShutDownPrevAverageCurrent"];
        [v5 setObject:v29 forKeyedSubscript:@"AverageCurrentPrevious"];

        long long v30 = [v4 objectForKeyedSubscript:@"ShutDownCycleCountLastQmax"];
        [v5 setObject:v30 forKeyedSubscript:@"CycleCountLastQmax"];

        long long v31 = [v4 objectForKeyedSubscript:@"ShutDownResScale"];
        [v5 setObject:v31 forKeyedSubscript:@"ResScale"];

        BOOL v32 = [v4 objectForKeyedSubscript:@"ShutDownQstart"];
        [v5 setObject:v32 forKeyedSubscript:@"Qstart"];

        uint64_t v33 = [v4 objectForKeyedSubscript:@"ShutDownPassedCharge"];
        [v5 setObject:v33 forKeyedSubscript:@"PassedCharge"];

        double v34 = [v4 objectForKeyedSubscript:@"ShutDownDOD0"];
        [v5 setObject:v34 forKeyedSubscript:@"DOD0"];

        uint64_t v35 = [v4 objectForKeyedSubscript:@"timeSinceAwake"];
        [v5 setObject:v35 forKeyedSubscript:@"TimeSinceWake"];

        int v36 = [v4 objectForKeyedSubscript:@"ShutDownRSS"];
        [v5 setObject:v36 forKeyedSubscript:@"RSS"];

        __int16 v37 = [v4 objectForKeyedSubscript:@"ShutDownUpoReboot"];
        [v5 setObject:v37 forKeyedSubscript:@"UpoReboot"];

        int v38 = [v4 objectForKeyedSubscript:@"ShutDownDataError"];
        [v5 setObject:v38 forKeyedSubscript:@"DataError"];

        id v39 = [v4 objectForKeyedSubscript:@"ShutDownFilteredCurrent"];
        [v5 setObject:v39 forKeyedSubscript:@"FilteredCurrent"];

        uint64_t v40 = [v4 objectForKeyedSubscript:@"ShutDownDynSdVoltage"];
        [v5 setObject:v40 forKeyedSubscript:@"ShutdownVoltage"];

        uint64_t v41 = [v4 objectForKeyedSubscript:@"ShutDownLpemSocfThresh"];
        [v5 setObject:v41 forKeyedSubscript:@"SOCFThreshold"];

        uint64_t v42 = [v4 objectForKeyedSubscript:@"ShutDownDynSdSoc"];
        [v5 setObject:v42 forKeyedSubscript:@"ShutdownSoc"];

        __int16 v43 = [v4 objectForKeyedSubscript:@"ShutDownLPEMMode"];
        [v5 setObject:v43 forKeyedSubscript:@"LPEMMode"];

        int v44 = [v4 objectForKeyedSubscript:@"ShutDownSocAlarm"];
        [v5 setObject:v44 forKeyedSubscript:@"SOCAlarm"];

        __int16 v45 = [v4 objectForKeyedSubscript:@"ShutDownSWRemcap"];
        [v5 setObject:v45 forKeyedSubscript:@"SWRemcap"];

        int v46 = [v4 objectForKeyedSubscript:@"ShutDownSocSoc2"];
        [v5 setObject:v46 forKeyedSubscript:@"SocSoc2"];

        double v47 = [v4 objectForKeyedSubscript:@"ShutDownSWFcc"];
        [v5 setObject:v47 forKeyedSubscript:@"SWFcc"];

        uint64_t v48 = [v4 objectForKeyedSubscript:@"ShutDownDynamicSOCVcut"];
        [v5 setObject:v48 forKeyedSubscript:@"DynamicSOCVcut"];

        uint64_t v49 = [v4 objectForKeyedSubscript:@"ShutdownDataCriticalFlagsKey"];
        [v5 setObject:v49 forKeyedSubscript:@"DataCriticalFlagsKey"];

        uint64_t v50 = [(PLBatteryAgent *)self lowBatteryLogString];
        if (v50) {
          [v5 setObject:v50 forKeyedSubscript:@"LowBatteryLog"];
        }
        id v74 = [v4 objectForKeyedSubscript:@"ShutDownDLog"];
        if (v74)
        {
          unint64_t v51 = [v74 length];
          if (v51 >= 2)
          {
            uint64_t v52 = [v74 bytes];
            uint64_t v53 = 0;
            uint64_t v54 = 0;
            uint64_t v55 = (v51 >> 1) + 1;
            do
            {
              long long v56 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithUnsignedLong:*(unsigned __int16 *)(v52 + 2 * v53)];

              int v57 = objc_msgSend(NSString, "stringWithFormat:", @"DLOG_%d", v53);
              [v5 setObject:v56 forKeyedSubscript:v57];

              ++v53;
              uint64_t v54 = v56;
            }
            while (v55 != v53);
          }
        }
        v58 = [v4 objectForKeyedSubscript:@"ShutDownRaTableRaw"];
        __int16 v59 = [(PLBatteryAgent *)self parseRawRaTableData:v58];
        for (unint64_t i = 0; [v59 count] > i; ++i)
        {
          uint64_t v61 = [v59 objectAtIndexedSubscript:i];
          uint64_t v62 = objc_msgSend(NSString, "stringWithFormat:", @"RaTable_%d", i + 1);
          [v5 setObject:v61 forKeyedSubscript:v62];
        }
        [(PLOperator *)self logEntry:v5];
        v80 = @"BatteryShutdownTimestamp";
        int v63 = objc_msgSend(v5, "objectForKeyedSubscript:");
        v81[0] = v63;
        uint64_t v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:&v80 count:1];

        [(PLOperator *)self logForSubsystem:@"BatteryMetrics" category:@"BatteryShutdown" data:v64];
        BOOL v65 = [MEMORY[0x1E4F92AD0] sharedCore];
        uint64_t v66 = [v65 storage];
        [v66 flushCachesWithReason:@"BatteryShutdownReason"];

        [(PLBatteryAgent *)self logBatteryShutdownToCA:v5];
        id v67 = (void *)MEMORY[0x1E4F929C0];
        v68 = [MEMORY[0x1E4F28ED0] numberWithDouble:v9];
        [v67 setObject:v68 forKey:@"LastShutdownSystemTimestamp" saveToDisk:1];

        if ([(PLBatteryAgent *)self isUPOEntry:v5])
        {
          int v69 = (void *)MEMORY[0x1E4F929C0];
          unint64_t v70 = [MEMORY[0x1E4F28ED0] numberWithDouble:v12];
          [v69 setObject:v70 forKey:@"LastUPOTimestamp" saveToDisk:1];

          v71 = (void *)MEMORY[0x1E4F929C0];
          uint64_t v72 = [MEMORY[0x1E4F28ED0] numberWithDouble:v9];
          [v71 setObject:v72 forKey:@"LastUPOSystemTimestamp" saveToDisk:1];
        }
      }
    }
    mach_port_t v2 = v79;
  }
}

uint64_t __46__PLBatteryAgent_logEventPointBatteryShutdown__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointBatteryShutdown_classDebugEnabled = result;
  return result;
}

- (void)logEventPointBatteryPanicShutdown:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 objectForKeyedSubscript:@"I2CLog"];
    id v7 = v6;
    if (v6 && [v6 count])
    {
      double v8 = [MEMORY[0x1E4F929C0] objectForKey:@"LastPanicData"];
      double v9 = [v7 objectForKeyedSubscript:@"I2CLogData"];
      if (!v8 || ([v8 isEqualToData:v9] & 1) == 0)
      {
        double v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"BatteryPanicShutdown"];
        double v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
        double v12 = [v5 objectForKeyedSubscript:@"I2CLog"];
        id v13 = [v12 objectForKeyedSubscript:@"I2CLogData"];
        [v11 setObject:v13 forKeyedSubscript:@"I2CLogData"];

        [(PLOperator *)self logEntry:v11];
        uint64_t v14 = [MEMORY[0x1E4F92AD0] sharedCore];
        int v15 = [v14 storage];
        [v15 flushCachesWithReason:@"PanicShutdown"];

        id v16 = v5;
        AnalyticsSendEventLazy();
        [MEMORY[0x1E4F929C0] setObject:v9 forKey:@"LastPanicData" saveToDisk:1];
      }
    }
  }
}

id __52__PLBatteryAgent_logEventPointBatteryPanicShutdown___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v5 = @"I2CLogData";
  uint64_t v1 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"I2CLog"];
  mach_port_t v2 = [v1 objectForKeyedSubscript:@"I2CLogData"];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

uint64_t __52__PLBatteryAgent_logEventPointBatteryPanicShutdown___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointBatteryPanicShutdown__classDebugEnabled = result;
  return result;
}

- (void)logEventPointBatteryTrapInfo:(id)a3
{
  if (!a3) {
    return;
  }
  id v4 = [a3 objectForKeyedSubscript:@"DeadBatteryBootData"];
  if (v4)
  {
    long long v31 = v4;
    if ([v4 count])
    {
      id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"TrapInfo"];
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
      id v7 = [v31 objectForKey:@"ActivePayloads"];
      if (v7) {
        [v31 objectForKey:@"ActivePayloads"];
      }
      else {
      double v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:1];
      }
      [v6 setObject:v8 forKeyedSubscript:@"ActivePayloads"];

      double v9 = [v6 objectForKeyedSubscript:@"ActivePayloads"];
      char v10 = [v9 unsignedIntegerValue];

      if (v10)
      {
        double v11 = [v31 objectForKeyedSubscript:@"GeneralPayload"];
        double v12 = v11;
        if (!v11 || ![v11 count])
        {

          goto LABEL_19;
        }
        id v13 = [v12 objectForKeyedSubscript:@"TimeOnCharger"];
        [v6 setObject:v13 forKeyedSubscript:@"TimeOnCharger"];

        uint64_t v14 = [v12 objectForKeyedSubscript:@"CloakEntryCount"];
        [v6 setObject:v14 forKeyedSubscript:@"CloakEntryCount"];

        int v15 = [v12 objectForKeyedSubscript:@"PrechargeCount"];
        [v6 setObject:v15 forKeyedSubscript:@"PrechargeCount"];

        id v16 = [v12 objectForKeyedSubscript:@"AverageBattVirtualTemp"];
        [v6 setObject:v16 forKeyedSubscript:@"AverageBattVirtualTemp"];

        uint64_t v17 = [v12 objectForKeyedSubscript:@"AverageBattSkinTemp"];
        [v6 setObject:v17 forKeyedSubscript:@"AverageBattSkinTemp"];

        uint64_t v18 = [v12 objectForKeyedSubscript:@"StartBatteryCapacity"];
        [v6 setObject:v18 forKeyedSubscript:@"StartBatteryCapacity"];

        id v19 = [v12 objectForKeyedSubscript:@"StartBatteryVoltage"];
        [v6 setObject:v19 forKeyedSubscript:@"StartBatteryVoltage"];

        double v20 = [v12 objectForKeyedSubscript:@"VbusType"];
        [v6 setObject:v20 forKeyedSubscript:@"VbusType"];

        long long v21 = [v12 objectForKeyedSubscript:@"AdapterType"];
        [v6 setObject:v21 forKeyedSubscript:@"AdapterType"];

        int v22 = [v12 objectForKeyedSubscript:@"WirelessChargingMode"];
        [v6 setObject:v22 forKeyedSubscript:@"WirelessChargingMode"];
      }
      if ((v10 & 2) != 0)
      {
        uint64_t v23 = [v31 objectForKeyedSubscript:@"SMCBootManagementPayload"];
        uint64_t v24 = v23;
        if (!v23 || ![v23 count])
        {

          goto LABEL_19;
        }
        long long v25 = [v24 objectForKeyedSubscript:@"AdapterPower"];
        [v6 setObject:v25 forKeyedSubscript:@"AdapterPower"];

        id v26 = [v24 objectForKeyedSubscript:@"DeviceResetCount"];
        [v6 setObject:v26 forKeyedSubscript:@"ResetCount"];

        long long v27 = [v24 objectForKeyedSubscript:@"HighPoweriBootCount"];
        [v6 setObject:v27 forKeyedSubscript:@"HighPoweriBootCount"];

        uint64_t v28 = [v24 objectForKeyedSubscript:@"APBootCount"];
        [v6 setObject:v28 forKeyedSubscript:@"APBootCount"];

        long long v29 = [v24 objectForKeyedSubscript:@"DisplayTimeBootCount"];
        [v6 setObject:v29 forKeyedSubscript:@"DisplayTimeBootCount"];

        long long v30 = [v24 objectForKeyedSubscript:@"Ok2SwitchCount"];
        [v6 setObject:v30 forKeyedSubscript:@"Ok2SwitchCount"];
      }
      [(PLOperator *)self logEntry:v6];
LABEL_19:
    }
  }
  MEMORY[0x1F41817F8]();
}

- (void)logEventNoneBatteryConfigWithRawData:(id)a3
{
  v222[6] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3 && ([MEMORY[0x1E4F92A38] isDeviceClass:101001] & 1) == 0)
  {
    v203 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"BatteryConfig"];
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v203];
    id v5 = [v3 objectForKey:@"BatteryData"];
    if (!v5
      || ([v3 objectForKey:@"BatteryData"],
          id v6 = objc_claimAutoreleasedReturnValue(),
          [v6 objectForKey:@"LifetimeData"],
          id v7 = (id)objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v5,
          !v7))
    {
      if (![MEMORY[0x1E4F92A38] isMac])
      {
LABEL_83:

        goto LABEL_84;
      }
      id v7 = 0;
    }
    +[PLEventBackwardBatteryEntry populateQmaxForEntry:v4 withRawData:v3];
    double v8 = [v3 objectForKeyedSubscript:@"BatteryData"];
    double v9 = [v8 objectForKeyedSubscript:@"Flags"];
    [v4 setObject:v9 forKeyedSubscript:@"Flags"];

    char v10 = [v3 objectForKeyedSubscript:@"NominalChargeCapacity"];
    [v4 setObject:v10 forKeyedSubscript:@"NominalChargeCapacity"];

    double v11 = [v3 objectForKeyedSubscript:@"AppleRawMaxCapacity"];
    [v4 setObject:v11 forKeyedSubscript:@"AppleRawMaxCapacity"];

    double v12 = [v7 objectForKeyedSubscript:@"TotalOperatingTime"];
    [v4 setObject:v12 forKeyedSubscript:@"TotalOperatingTime"];

    id v13 = [v7 objectForKeyedSubscript:@"AverageTemperature"];
    [v4 setObject:v13 forKeyedSubscript:@"AverageTemperature"];

    uint64_t v14 = [v7 objectForKeyedSubscript:@"CycleCountLastQmax"];
    [v4 setObject:v14 forKeyedSubscript:@"CycleCountLastQmax"];

    int v15 = [v7 objectForKeyedSubscript:@"FlashWriteCount"];
    [v4 setObject:v15 forKeyedSubscript:@"FlashWriteCount"];

    id v16 = [v7 objectForKeyedSubscript:@"HighAvgCurrentLastRun"];
    [v4 setObject:v16 forKeyedSubscript:@"HighAvgCurrentLastRun"];

    uint64_t v17 = [v7 objectForKeyedSubscript:@"LowAvgCurrentLastRun"];
    [v4 setObject:v17 forKeyedSubscript:@"LowAvgCurrentLastRun"];

    uint64_t v18 = [v7 objectForKeyedSubscript:@"MaximumDeltaVoltage"];
    [v4 setObject:v18 forKeyedSubscript:@"MaximumDeltaVoltage"];

    id v19 = [v7 objectForKeyedSubscript:@"MinimumDeltaVoltage"];
    [v4 setObject:v19 forKeyedSubscript:@"MinimumDeltaVoltage"];

    double v20 = [v7 objectForKeyedSubscript:@"MaximumFCC"];
    [v4 setObject:v20 forKeyedSubscript:@"MaximumFCC"];

    long long v21 = [v7 objectForKeyedSubscript:@"MinimumFCC"];
    [v4 setObject:v21 forKeyedSubscript:@"MinimumFCC"];

    int v22 = [v7 objectForKeyedSubscript:@"MaximumPackVoltage"];
    [v4 setObject:v22 forKeyedSubscript:@"MaximumPackVoltage"];

    uint64_t v23 = [v7 objectForKeyedSubscript:@"MinimumPackVoltage"];
    [v4 setObject:v23 forKeyedSubscript:@"MinimumPackVoltage"];

    uint64_t v24 = [v7 objectForKeyedSubscript:@"MaximumQmax"];
    [v4 setObject:v24 forKeyedSubscript:@"MaximumQmax"];

    long long v25 = [v7 objectForKeyedSubscript:@"MinimumQmax"];
    [v4 setObject:v25 forKeyedSubscript:@"MinimumQmax"];

    id v26 = [v7 objectForKeyedSubscript:@"MaximumRa0-8"];
    [v4 setObject:v26 forKeyedSubscript:@"MaximumRa0-8"];

    long long v27 = [v7 objectForKeyedSubscript:@"MinimumRa0-8"];
    [v4 setObject:v27 forKeyedSubscript:@"MinimumRa0-8"];

    uint64_t v28 = [v7 objectForKeyedSubscript:@"MaximumTemperature"];
    [v4 setObject:v28 forKeyedSubscript:@"MaximumTemperature"];

    long long v29 = [v7 objectForKeyedSubscript:@"MinimumTemperature"];
    [v4 setObject:v29 forKeyedSubscript:@"MinimumTemperature"];

    long long v30 = [v7 objectForKeyedSubscript:@"MaximumChargeCurrent"];
    [v4 setObject:v30 forKeyedSubscript:@"MaximumChargeCurrent"];

    long long v31 = [v7 objectForKeyedSubscript:@"MaximumDischargeCurrent"];
    [v4 setObject:v31 forKeyedSubscript:@"MaximumDischargeCurrent"];

    BOOL v32 = [v7 objectForKeyedSubscript:@"MaximumOverChargedCapacity"];
    [v4 setObject:v32 forKeyedSubscript:@"MaximumOverChargedCapacity"];

    uint64_t v33 = [v7 objectForKeyedSubscript:@"MaximumOverDischargedCapacity"];
    [v4 setObject:v33 forKeyedSubscript:@"MaximumOverDischargedCapacity"];

    double v34 = [v7 objectForKeyedSubscript:@"RDISCnt"];
    [v4 setObject:v34 forKeyedSubscript:@"RDISCnt"];

    uint64_t v35 = [v7 objectForKeyedSubscript:@"TemperatureSamples"];
    [v4 setObject:v35 forKeyedSubscript:@"TemperatureSamples"];

    int v36 = [v7 objectForKeyedSubscript:@"TimeAbove95Perc"];

    if (v36)
    {
      __int16 v37 = [v7 objectForKeyedSubscript:@"TimeAbove95Perc"];
      [v4 setObject:v37 forKeyedSubscript:@"TimeAbove95Perc"];

      int v38 = PLLogCommon();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        [v4 objectForKeyedSubscript:@"TimeAbove95Perc"];
        objc_claimAutoreleasedReturnValue();
        -[PLBatteryAgent logEventNoneBatteryConfigWithRawData:]1();
      }
    }
    else
    {
      int v38 = [v7 objectForKeyedSubscript:@"TimeAtHighSoc"];
      [v4 setObject:v38 forKeyedSubscript:@"TimeAtHighSoc"];
      id v39 = PLLogCommon();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        [v4 objectForKeyedSubscript:@"TimeAtHighSoc"];
        objc_claimAutoreleasedReturnValue();
        -[PLBatteryAgent logEventNoneBatteryConfigWithRawData:]0();
      }

      uint64_t v40 = [(PLBatteryAgent *)self parseTimeAtHighSoc:v38];
      [(PLBatteryAgent *)self pushTimeAtHighSocToAggD:v40];
      [(PLBatteryAgent *)self pushTimeAtHighSocToCA:v40];
    }
    uint64_t v41 = [v7 objectForKeyedSubscript:@"TimeAbove95Perc"];
    [v4 setObject:v41 forKeyedSubscript:@"TimeAbove95Perc"];

    uint64_t v42 = [v7 objectForKeyedSubscript:@"LowVoltageResidencyCounters"];
    [v4 setObject:v42 forKeyedSubscript:@"LowVoltageResidencyCounters"];

    id v202 = [v7 objectForKeyedSubscript:@"LowVoltageResidencyCounters"];
    if (v202)
    {
      __int16 v43 = PLLogCommon();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        [v4 objectForKeyedSubscript:@"LowVoltageResidencyCounters"];
        objc_claimAutoreleasedReturnValue();
        -[PLBatteryAgent logEventNoneBatteryConfigWithRawData:].cold.9();
      }

      int v44 = [(PLBatteryAgent *)self parseLowVoltageResidencyCounters:v202];
      [(PLBatteryAgent *)self pushLowVoltageResidencyCountersToCA:v44];
    }
    __int16 v45 = [v7 objectForKeyedSubscript:@"UpdateTime"];
    [v4 setObject:v45 forKeyedSubscript:@"UpdateTime"];

    int v46 = [v7 objectForKeyedSubscript:@"QmaxUpdSuccessCount"];
    [v4 setObject:v46 forKeyedSubscript:@"QmaxUpdSuccessCount"];

    double v47 = [v7 objectForKeyedSubscript:@"QmaxUpdFailCount"];
    [v4 setObject:v47 forKeyedSubscript:@"QmaxUpdFailCount"];

    uint64_t v48 = [v7 objectForKeyedSubscript:@"MinimumRa8"];
    [v4 setObject:v48 forKeyedSubscript:@"MinimumRa8"];

    uint64_t v49 = [v7 objectForKeyedSubscript:@"MaximumRa8"];
    [v4 setObject:v49 forKeyedSubscript:@"MaximumRa8"];

    uint64_t v50 = [v7 objectForKeyedSubscript:@"TimeAbove95PercRange1"];
    [v4 setObject:v50 forKeyedSubscript:@"TimeAbove95PercRange1"];

    unint64_t v51 = [v7 objectForKeyedSubscript:@"TimeAbove95PercRange2"];
    [v4 setObject:v51 forKeyedSubscript:@"TimeAbove95PercRange2"];

    uint64_t v52 = [v7 objectForKeyedSubscript:@"TimeAbove95PercRange3"];
    [v4 setObject:v52 forKeyedSubscript:@"TimeAbove95PercRange3"];

    uint64_t v53 = [v7 objectForKeyedSubscript:@"ResetCnt"];
    [v4 setObject:v53 forKeyedSubscript:@"ResetCnt"];

    uint64_t v54 = [v7 objectForKeyedSubscript:@"NCCMin"];
    [v4 setObject:v54 forKeyedSubscript:@"NCCMin"];

    uint64_t v55 = [v7 objectForKeyedSubscript:@"NCCMax"];
    [v4 setObject:v55 forKeyedSubscript:@"NCCMax"];

    long long v56 = [v3 objectForKeyedSubscript:@"BatteryData"];
    int v57 = [v56 objectForKeyedSubscript:@"DataFlashWriteCount"];
    [v4 setObject:v57 forKeyedSubscript:@"DataFlashWriteCount"];

    v58 = [v3 objectForKeyedSubscript:@"BatteryData"];
    __int16 v59 = [v58 objectForKeyedSubscript:@"ResetDataComms"];
    [v4 setObject:v59 forKeyedSubscript:@"ResetDataComms"];

    uint64_t v60 = [v3 objectForKeyedSubscript:@"BatteryData"];
    uint64_t v61 = [v60 objectForKeyedSubscript:@"ResetDataFirmware"];
    [v4 setObject:v61 forKeyedSubscript:@"ResetDataFirmware"];

    uint64_t v62 = [v3 objectForKeyedSubscript:@"BatteryData"];
    int v63 = [v62 objectForKeyedSubscript:@"ResetDataHardware"];
    [v4 setObject:v63 forKeyedSubscript:@"ResetDataHardware"];

    uint64_t v64 = [v3 objectForKeyedSubscript:@"BatteryData"];
    BOOL v65 = [v64 objectForKeyedSubscript:@"ResetDataSoftware"];
    [v4 setObject:v65 forKeyedSubscript:@"ResetDataSoftware"];

    uint64_t v66 = [v3 objectForKeyedSubscript:@"BatteryData"];
    id v67 = [v66 objectForKeyedSubscript:@"ResetDataWatchDog"];
    [v4 setObject:v67 forKeyedSubscript:@"ResetDataWatchDog"];

    if ([MEMORY[0x1E4F92A38] isiPhone]
      && (int)[MEMORY[0x1E4F92A38] kPLDeviceClass] > 102037)
    {
      v68 = [v3 objectForKeyedSubscript:@"BatteryData"];
      int v69 = [v68 objectForKeyedSubscript:@"ResetData"];

      id v70 = v69;
      v71 = (unsigned __int8 *)[v70 bytes];
      uint64_t v72 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:v71[12]];
      [v4 setObject:v72 forKeyedSubscript:@"ResetDataSwWatchDog"];

      id v73 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:v71[14]];
      [v4 setObject:v73 forKeyedSubscript:@"ResetDataHardFault"];

      id v74 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:v71[16]];
      [v4 setObject:v74 forKeyedSubscript:@"ResetDataCorruption"];

      uint64_t v75 = 16;
    }
    else
    {
      uint64_t v75 = 10;
    }
    unint64_t v206 = v75;
    id v76 = [v3 objectForKeyedSubscript:@"BatteryData"];
    v77 = [v76 objectForKeyedSubscript:@"CycleCount"];
    [v4 setObject:v77 forKeyedSubscript:@"CycleCount"];

    v78 = [v3 objectForKeyedSubscript:@"ITSimulationCounter"];
    [v4 setObject:v78 forKeyedSubscript:@"ITSimulationCounter"];

    id v79 = [v3 objectForKeyedSubscript:@"RaUpdateCounter"];
    [v4 setObject:v79 forKeyedSubscript:@"RaUpdateCounter"];

    v80 = [v3 objectForKeyedSubscript:@"BatteryData"];
    v81 = [v80 objectForKeyedSubscript:@"ITMiscStatus"];
    [v4 setObject:v81 forKeyedSubscript:@"ITMiscStatus"];

    id v82 = [v3 objectForKeyedSubscript:@"GasGaugeFirmwareVersion"];
    [v4 setObject:v82 forKeyedSubscript:@"GasGaugeFirmwareVersion"];

    v221 = @"GasGaugeFirmwareVersion";
    uint64_t v83 = [v4 objectForKeyedSubscript:@"GasGaugeFirmwareVersion"];
    v222[0] = v83;
    uint64_t v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v222 forKeys:&v221 count:1];
    v85 = [v4 entryDate];
    [(PLOperator *)self logForSubsystem:@"BatteryMetrics" category:@"BatteryConfig" data:v84 date:v85];

    v86 = [v3 objectForKeyedSubscript:@"FlashWearLevelData"];
    LOBYTE(v83) = v86 == 0;

    if ((v83 & 1) == 0)
    {
      v87 = [v3 objectForKeyedSubscript:@"FlashWearLevelData"];
      [v4 setObject:v87 forKeyedSubscript:@"FlashWearLevelData"];
      uint64_t v88 = PLLogCommon();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
      {
        [v4 objectForKeyedSubscript:@"FlashWearLevelData"];
        objc_claimAutoreleasedReturnValue();
        -[PLBatteryAgent logEventNoneBatteryConfigWithRawData:].cold.8();
      }

      v89 = [(PLBatteryAgent *)self parseFlashWearLevelData:v87];
      [(PLBatteryAgent *)self pushFlashWearLevelDataToCA:v89];
    }
    uint64_t v90 = [(PLBatteryAgent *)self getBatteryMaximumCapacityPercent];
    if ((int)v90 >= 1)
    {
      v91 = [MEMORY[0x1E4F28ED0] numberWithInt:v90];
      [v4 setObject:v91 forKeyedSubscript:@"MaximumCapacityPercent"];

      int v92 = PLLogBH();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v215) = v90;
        _os_log_impl(&dword_1E4220000, v92, OS_LOG_TYPE_INFO, "Maximum Capacity: %d", buf, 8u);
      }
    }
    v93 = [v3 objectForKeyedSubscript:@"BatteryData"];
    int v94 = [v93 objectForKeyedSubscript:@"AlgoChemID"];
    [v4 setObject:v94 forKeyedSubscript:@"AlgoChemID"];

    uint64_t v95 = [v3 objectForKeyedSubscript:@"ChargerData"];
    double v96 = [v95 objectForKeyedSubscript:@"VacVoltageLimit"];
    [v4 setObject:v96 forKeyedSubscript:@"VacVoltageLimit"];

    id v208 = [(PLBatteryAgent *)self getBatteryCalibration0Data];
    if (v208)
    {
      [(PLBatteryAgent *)self logEventForwardCalibration0withData:v208];
      double v97 = [v208 objectForKeyedSubscript:@"calibrationFlags"];
      [v4 setObject:v97 forKeyedSubscript:@"calibrationFlags"];

      v98 = [v208 objectForKeyedSubscript:@"filteredNCC"];
      [v4 setObject:v98 forKeyedSubscript:@"filteredNCC"];

      uint64_t v99 = [v208 objectForKeyedSubscript:@"exitTotalOperatingTime"];
      [v4 setObject:v99 forKeyedSubscript:@"exitTotalOperatingTime"];

      uint64_t v100 = [v208 objectForKeyedSubscript:@"svcTotalOperatingTime"];
      [v4 setObject:v100 forKeyedSubscript:@"svcTotalOperatingTime"];
    }
    uint64_t v101 = [v3 objectForKeyedSubscript:@"BatteryData"];
    v102 = [v101 objectForKeyedSubscript:@"RSS"];
    [v4 setObject:v102 forKeyedSubscript:@"RSS"];

    v103 = [v3 objectForKeyedSubscript:@"BatteryData"];
    int v104 = [v103 objectForKeyedSubscript:@"ChemID"];
    [v4 setObject:v104 forKeyedSubscript:@"ChemID"];

    uint64_t v105 = [v3 objectForKeyedSubscript:@"BatteryData"];
    v201 = [v105 objectForKeyedSubscript:@"RaTableRaw"];

    if ([v201 count])
    {
      uint64_t v106 = [v201 objectAtIndexedSubscript:0];
      v107 = [(PLBatteryAgent *)self parseRawRaTableData:v106];
      for (unint64_t i = 0; [v107 count] > i; ++i)
      {
        int v109 = [v107 objectAtIndexedSubscript:i];
        v110 = objc_msgSend(NSString, "stringWithFormat:", @"RaTable_%d", i + 1);
        [v4 setObject:v109 forKeyedSubscript:v110];
      }
    }
    uint64_t v111 = [v7 objectForKeyedSubscript:@"LTDataCorruptionOffset"];
    [v4 setObject:v111 forKeyedSubscript:@"LTDataCorruptionOffset"];

    v112 = PLLogCommon();
    if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
    {
      [v4 objectForKeyedSubscript:@"LTDataCorruptionOffset"];
      objc_claimAutoreleasedReturnValue();
      -[PLBatteryAgent logEventNoneBatteryConfigWithRawData:].cold.7();
    }

    id v200 = [v7 objectForKeyedSubscript:@"SafetyFaultCounter"];
    uint64_t v113 = -[PLBatteryAgent parseRawSafetyFaultCounter:](self, "parseRawSafetyFaultCounter:");
    uint64_t v114 = PLLogBH();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryAgent logEventNoneBatteryConfigWithRawData:].cold.6();
    }

    for (unint64_t j = 0; [v113 count] > j; ++j)
    {
      v116 = [v113 objectAtIndexedSubscript:j];
      int v117 = objc_msgSend(NSString, "stringWithFormat:", @"SafetyEvent%d", j);
      [v4 setObject:v116 forKeyedSubscript:v117];
    }
    uint64_t v118 = [v3 objectForKeyedSubscript:@"BatteryData"];
    id v204 = [v118 objectForKeyedSubscript:@"ResetData"];

    id v119 = PLLogBH();
    if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryAgent logEventNoneBatteryConfigWithRawData:].cold.5();
    }

    if (v204 && [v204 length] > v206)
    {
      uint64_t v120 = [v204 bytes];
      int v121 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:*(unsigned __int8 *)(v120 + v206)];
      [v4 setObject:v121 forKeyedSubscript:@"LastResetReason"];
    }
    v122 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", -[PLBatteryAgent batteryLifetimeUPOCount](self, "batteryLifetimeUPOCount"));
    [v4 setObject:v122 forKeyedSubscript:@"LifetimeUPOCount"];

    BOOL v123 = [v3 objectForKeyedSubscript:@"Serial"];
    [(PLBatteryAgent *)self setSerialNumber:v123];

    int v124 = [(PLBatteryAgent *)self weekOfManufacture:v3];
    [v4 setObject:v124 forKeyedSubscript:@"WeekMfd"];

    id v125 = [v3 objectForKeyedSubscript:@"BatteryData"];
    id v126 = [v125 objectForKeyedSubscript:@"DateOfFirstUse"];
    BOOL v127 = v126 == 0;

    if (!v127)
    {
      id v128 = [v3 objectForKeyedSubscript:@"BatteryData"];
      id v129 = [v128 objectForKeyedSubscript:@"DateOfFirstUse"];
      [v129 doubleValue];
      double v131 = v130;

      if (v131 == 0.0)
      {
        [v4 setObject:0 forKeyedSubscript:@"DOFU"];
      }
      else
      {
        v132 = PLLogCommon();
        if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
        {
          double v133 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v131];
          [(PLBatteryAgent *)v133 logEventNoneBatteryConfigWithRawData:v132];
        }

        double v134 = (void *)MEMORY[0x1E4F28ED0];
        v135 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v131];
        [v135 timeIntervalSince1970];
        double v136 = objc_msgSend(v134, "numberWithDouble:");
        [v4 setObject:v136 forKeyedSubscript:@"DOFU"];
      }
      v218 = @"DOFU";
      v137 = objc_msgSend(v4, "objectForKeyedSubscript:");
      if (v137) {
        [v4 objectForKeyedSubscript:@"DOFU"];
      }
      else {
      v138 = [MEMORY[0x1E4F28ED0] numberWithDouble:v131];
      }
      v219 = v138;
      v139 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v219 forKeys:&v218 count:1];
      uint64_t v140 = [v4 entryDate];
      [(PLOperator *)self logForSubsystem:@"BatteryMetrics" category:@"BatteryConfig" data:v139 date:v140];
    }
    v141 = [(PLBatteryAgent *)self batteryEEEECode:v3];
    [v4 setObject:v141 forKeyedSubscript:@"EEEECode"];

    v142 = [(PLBatteryAgent *)self isOriginalBattery];
    [v4 setObject:v142 forKeyedSubscript:@"OriginalBattery"];

    BOOL v143 = [(PLBatteryAgent *)self batterySerialChanged:v3];
    v144 = [MEMORY[0x1E4F28ED0] numberWithBool:v143];
    [v4 setObject:v144 forKeyedSubscript:@"BatterySerialChanged"];

    if (v143) {
      MEMORY[0x1E4E7E330](@"com.apple.power.battery.newSerial", 1);
    }
    +[PLEventBackwardBatteryEntry populateCellWOMForEntry:v4 withRawData:v3];
    double v145 = [v3 objectForKeyedSubscript:@"BatteryData"];
    double v146 = [v145 objectForKeyedSubscript:@"DailyMaxSoc"];
    [v4 setObject:v146 forKeyedSubscript:@"DailyMaxSoc"];

    v147 = [v3 objectForKeyedSubscript:@"BatteryData"];
    v148 = [v147 objectForKeyedSubscript:@"DailyMinSoc"];
    [v4 setObject:v148 forKeyedSubscript:@"DailyMinSoc"];

    v207 = [v3 objectForKey:@"KioskMode"];
    if (v207)
    {
      v149 = [v207 objectForKeyedSubscript:@"KioskModeHighSocDays"];
      [v4 setObject:v149 forKeyedSubscript:@"KioskModeHighSocDays"];

      v150 = [v207 objectForKeyedSubscript:@"KioskModeLastHighSocHours"];
      [v4 setObject:v150 forKeyedSubscript:@"KioskModeLastHighSocHours"];

      int v151 = [v207 objectForKeyedSubscript:@"KioskModeHighSocSeconds"];
      [v4 setObject:v151 forKeyedSubscript:@"KioskModeHighSocSeconds"];
    }
    id v205 = [v3 objectForKeyedSubscript:@"GgDataFlashUpdate"];
    if (v205)
    {
      v152 = [v205 objectForKeyedSubscript:@"Status"];
      if (v152)
      {
        [v4 setObject:v152 forKeyedSubscript:@"GGUpdateStatus"];
        if ([v152 intValue] - 3 <= 0xFFFFFFFD)
        {
          double v153 = [v205 objectForKeyedSubscript:@"Error"];
          [v4 setObject:v153 forKeyedSubscript:@"GGUpdateError"];

          double v154 = [v205 objectForKeyedSubscript:@"Phase"];
          [v4 setObject:v154 forKeyedSubscript:@"GGUpdatePhase"];

          v155 = [v205 objectForKeyedSubscript:@"ErrorPhase"];
          [v4 setObject:v155 forKeyedSubscript:@"GGUpdateErrorPhase"];

          v156 = [v205 objectForKeyedSubscript:@"SubclassId"];
          [v4 setObject:v156 forKeyedSubscript:@"GGUpdateSubclassID"];

          v157 = [v205 objectForKeyedSubscript:@"Block"];
          [v4 setObject:v157 forKeyedSubscript:@"GGUpdateBlock"];
        }
      }
    }
    int v158 = [v3 objectForKeyedSubscript:@"BatteryData"];
    uint64_t v159 = [v158 objectForKeyedSubscript:@"LifetimeData"];
    v160 = [v159 objectForKeyedSubscript:@"LTOCVRestCounter"];
    [v4 setObject:v160 forKeyedSubscript:@"LifeTimeOCVRestCounter"];

    v161 = [v3 objectForKeyedSubscript:@"BatteryData"];
    v162 = [v161 objectForKeyedSubscript:@"LifetimeData"];
    v163 = [v162 objectForKeyedSubscript:@"LTQmaxUpdateCounter"];
    [v4 setObject:v163 forKeyedSubscript:@"LifeTimeQmaxUpdateCounter"];

    double v164 = [v3 objectForKeyedSubscript:@"BatteryData"];
    double v165 = [v164 objectForKeyedSubscript:@"LifetimeData"];
    v166 = [v165 objectForKeyedSubscript:@"LTOCVRestCounterHsp"];
    [v4 setObject:v166 forKeyedSubscript:@"LifeTimeOCVRestCounterHsp"];

    double v167 = [v3 objectForKeyedSubscript:@"BatteryData"];
    double v168 = [v167 objectForKeyedSubscript:@"LifetimeData"];
    double v169 = [v168 objectForKeyedSubscript:@"LTQmaxUpdateCounterHsp"];
    [v4 setObject:v169 forKeyedSubscript:@"LifeTimeQmaxUpdateCounterHsp"];

    [MEMORY[0x1E4F929C0] doubleForKey:@"LastUPOSystemTimestamp" ifNotSet:0.0];
    double v171 = v170;
    ADClientSetValueForScalarKey();
    v172 = [MEMORY[0x1E4F28ED0] numberWithDouble:v171];
    [v4 setObject:v172 forKeyedSubscript:@"LastUPOSystemTimestamp"];

    [MEMORY[0x1E4F929C0] doubleForKey:@"LastUPOTimestamp" ifNotSet:0.0];
    double v173 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:");
    [v4 setObject:v173 forKeyedSubscript:@"LastUPOTimestamp"];

    uint64_t v174 = [v3 objectForKeyedSubscript:@"BatteryData"];
    v175 = [v174 objectForKeyedSubscript:@"ChemicalWeightedRa"];
    [v4 setObject:v175 forKeyedSubscript:@"ChemicalWeightedRa"];

    +[PLEventBackwardBatteryEntry populatewRaForEntry:v4 withRawData:v3];
    v176 = [v3 objectForKeyedSubscript:@"BatteryData"];
    uint64_t v177 = [v176 objectForKeyedSubscript:@"BatteryHealthMetric"];
    [v4 setObject:v177 forKeyedSubscript:@"BatteryHealthMetric"];

    v178 = [v3 objectForKeyedSubscript:@"BatteryData"];
    v179 = [v178 objectForKeyedSubscript:@"PeakPerformanceCapacity"];
    [v4 setObject:v179 forKeyedSubscript:@"PeakPerformanceCapacity"];

    v180 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", -[PLBatteryAgent getBatteryHealthServiceState](self, "getBatteryHealthServiceState"));
    v181 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", -[PLBatteryAgent getBatteryHealthServiceFlags](self, "getBatteryHealthServiceFlags"));
    [v4 setObject:v180 forKeyedSubscript:@"ServiceOption"];
    [v4 setObject:v181 forKeyedSubscript:@"batteryServiceFlags"];
    [v180 intValue];
    ADClientSetValueForScalarKey();
    [v181 intValue];
    ADClientSetValueForScalarKey();
    v182 = PLLogBH();
    if (os_log_type_enabled(v182, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v215 = v180;
      __int16 v216 = 2112;
      v217 = v181;
      _os_log_impl(&dword_1E4220000, v182, OS_LOG_TYPE_INFO, "BH State: %@. Flags: %@", buf, 0x16u);
    }

    [(PLBatteryAgent *)self logAuthFail:v4];
    if (+[PLBatteryAgent supportsxFlags])
    {
      int64_t v183 = [(PLBatteryAgent *)self xFlags];
      v184 = [MEMORY[0x1E4F28ED0] numberWithInteger:v183];
      [v4 setObject:v184 forKeyedSubscript:@"xFlags"];

      if ((v183 & 0x2B) != 0)
      {
        [(PLOperator *)self defaultDoubleForKey:@"xFlagsRetryTimerInterval"];
        double v186 = v185;
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v187 = objc_opt_class();
          v213[0] = MEMORY[0x1E4F143A8];
          v213[1] = 3221225472;
          void v213[2] = __55__PLBatteryAgent_logEventNoneBatteryConfigWithRawData___block_invoke;
          v213[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v213[4] = v187;
          v188 = v213;
          if (logEventNoneBatteryConfigWithRawData__defaultOnce != -1) {
            dispatch_once(&logEventNoneBatteryConfigWithRawData__defaultOnce, v188);
          }

          if (logEventNoneBatteryConfigWithRawData__classDebugEnabled)
          {
            v199 = [NSString stringWithFormat:@"xFlags indicate error, will retry in %.1f seconds", *(void *)&v186];
            v198 = (void *)MEMORY[0x1E4F929B8];
            v189 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
            unsigned int v190 = [v189 lastPathComponent];
            v191 = [NSString stringWithUTF8String:"-[PLBatteryAgent logEventNoneBatteryConfigWithRawData:]"];
            [v198 logMessage:v199 fromFile:v190 fromFunction:v191 fromLineNumber:7825];

            v192 = PLLogCommon();
            if (os_log_type_enabled(v192, OS_LOG_TYPE_DEBUG)) {
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
            }
          }
        }
        id v193 = objc_alloc(MEMORY[0x1E4F92A80]);
        v194 = [MEMORY[0x1E4F1C9C8] monotonicDateWithTimeIntervalSinceNow:v186];
        v195 = [(PLOperator *)self workQueue];
        v210[0] = MEMORY[0x1E4F143A8];
        v210[1] = 3221225472;
        void v210[2] = __55__PLBatteryAgent_logEventNoneBatteryConfigWithRawData___block_invoke_5051;
        v210[3] = &unk_1E6E4B6D0;
        v210[4] = self;
        int64_t v212 = v183;
        id v211 = v4;
        id v196 = (void *)[v193 initWithFireDate:v194 withInterval:0 withTolerance:0 repeats:v195 withUserInfo:v210 withQueue:v186 withBlock:6.0e10];
        [(PLBatteryAgent *)self setXFlagsRetryTimer:v196];
      }
      else
      {
        AnalyticsSendEventLazy();
      }
    }
    [(PLOperator *)self logEntry:v4];
    [(PLBatteryAgent *)self setLastBatteryConfigEntry:v4];
    v197 = PLLogCommon();
    if (os_log_type_enabled(v197, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryAgent logEventNoneBatteryConfigWithRawData:]();
    }

    [(PLBatteryAgent *)self logBatteryConfigToCA:v4];
    [(PLBatteryAgent *)self logBatteryConfigToAggd:v4];
    [(PLBatteryAgent *)self logWatchdogDebugDumpToCA:v3];
    [(PLBatteryAgent *)self logFlashAgingToCA:v3];
    [(PLBatteryAgent *)self logShallowChargingToCA:v3];
    [(PLBatteryAgent *)self logSlowChargingReasonToCA:v3];
    [(PLBatteryAgent *)self logkBatteryRsenseOpenCountToCA:v3];

    goto LABEL_83;
  }
LABEL_84:
}

uint64_t __55__PLBatteryAgent_logEventNoneBatteryConfigWithRawData___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventNoneBatteryConfigWithRawData__classDebugEnabled = result;
  return result;
}

void __55__PLBatteryAgent_logEventNoneBatteryConfigWithRawData___block_invoke_5051(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) xFlags];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__PLBatteryAgent_logEventNoneBatteryConfigWithRawData___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v3;
    if (kPLBatteryAgentStringUserType_block_invoke_9_defaultOnce != -1) {
      dispatch_once(&kPLBatteryAgentStringUserType_block_invoke_9_defaultOnce, block);
    }
    if (kPLBatteryAgentStringUserType_block_invoke_9_classDebugEnabled)
    {
      id v4 = [NSString stringWithFormat:@"xFlags retry value: %ld, previously: %ld", v2, *(void *)(a1 + 48)];
      id v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      id v7 = [v6 lastPathComponent];
      double v8 = [NSString stringWithUTF8String:"-[PLBatteryAgent logEventNoneBatteryConfigWithRawData:]_block_invoke"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:7834];

      double v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  if (v2 == *(void *)(a1 + 48))
  {
    AnalyticsSendEventLazy();
  }
  else
  {
    char v10 = [*(id *)(a1 + 32) storage];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __55__PLBatteryAgent_logEventNoneBatteryConfigWithRawData___block_invoke_5055;
    void v12[3] = &unk_1E6E47EE0;
    double v11 = *(void **)(a1 + 40);
    void v12[4] = *(void *)(a1 + 32);
    id v13 = v11;
    uint64_t v14 = v2;
    [v10 updateEntry:v13 withBlock:v12];
  }
}

uint64_t __55__PLBatteryAgent_logEventNoneBatteryConfigWithRawData___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLBatteryAgentStringUserType_block_invoke_9_classDebugEnabled = result;
  return result;
}

uint64_t __55__PLBatteryAgent_logEventNoneBatteryConfigWithRawData___block_invoke_5055(uint64_t a1)
{
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__PLBatteryAgent_logEventNoneBatteryConfigWithRawData___block_invoke_2_5056;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v2;
    if (kPLBatteryAgentStringUserType_block_invoke_10_defaultOnce != -1) {
      dispatch_once(&kPLBatteryAgentStringUserType_block_invoke_10_defaultOnce, block);
    }
    if (kPLBatteryAgentStringUserType_block_invoke_10_classDebugEnabled)
    {
      uint64_t v3 = [NSString stringWithFormat:@"Updating xFlags value in powerlog and aggd"];
      id v4 = (void *)MEMORY[0x1E4F929B8];
      id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      id v6 = [v5 lastPathComponent];
      id v7 = [NSString stringWithUTF8String:"-[PLBatteryAgent logEventNoneBatteryConfigWithRawData:]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:7839];

      double v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  double v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:@"xFlags"];

  [*(id *)(a1 + 32) setAggdIntegerValueFromEntry:*(void *)(a1 + 40) forKey:@"xFlags" withPrefix:@"com.apple.power.battery."];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = *(void *)(a1 + 48);
  AnalyticsSendEventLazy();
  return objc_msgSend(*(id *)(a1 + 32), "setLastBatteryConfigEntry:", *(void *)(a1 + 40), v11, 3221225472, __55__PLBatteryAgent_logEventNoneBatteryConfigWithRawData___block_invoke_5060, &__block_descriptor_40_e19___NSDictionary_8__0l, v12);
}

uint64_t __55__PLBatteryAgent_logEventNoneBatteryConfigWithRawData___block_invoke_2_5056(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLBatteryAgentStringUserType_block_invoke_10_classDebugEnabled = result;
  return result;
}

id __55__PLBatteryAgent_logEventNoneBatteryConfigWithRawData___block_invoke_5060(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"flags";
  uint64_t v1 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

id __55__PLBatteryAgent_logEventNoneBatteryConfigWithRawData___block_invoke_2_5061(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"flags";
  uint64_t v1 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

id __55__PLBatteryAgent_logEventNoneBatteryConfigWithRawData___block_invoke_3(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"flags";
  uint64_t v1 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

uint64_t __55__PLBatteryAgent_logEventNoneBatteryConfigWithRawData___block_invoke_5064(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventNoneBatteryConfigWithRawData__classDebugEnabled_5063 = result;
  return result;
}

- (void)logEventNoneBatteryConfigCycleCountData
{
  uint64_t v3 = [(PLOperator *)self workQueue];
  void block[5] = MEMORY[0x1E4F143A8];
  void block[6] = 3221225472;
  block[7] = __57__PLBatteryAgent_logEventNoneBatteryConfigCycleCountData__block_invoke;
  block[8] = &unk_1E6E47C98;
  block[9] = self;
  uint64_t v4 = IOPMCopyCycleCountData();

  if (v4 && [MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__PLBatteryAgent_logEventNoneBatteryConfigCycleCountData__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v5;
    if (logEventNoneBatteryConfigCycleCountData_defaultOnce != -1) {
      dispatch_once(&logEventNoneBatteryConfigCycleCountData_defaultOnce, block);
    }
    if (logEventNoneBatteryConfigCycleCountData_classDebugEnabled)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"Battery Config Cycle Count Data Error: %x", v4);
      id v7 = (void *)MEMORY[0x1E4F929B8];
      double v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      double v9 = [v8 lastPathComponent];
      char v10 = [NSString stringWithUTF8String:"-[PLBatteryAgent logEventNoneBatteryConfigCycleCountData]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:7946];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

void __57__PLBatteryAgent_logEventNoneBatteryConfigCycleCountData__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 objectForKeyedSubscript:@"batteryCycleCountData"];

  if (v3)
  {
    uint64_t v4 = [v3 objectForKeyedSubscript:@"Cycles"];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      uint64_t v49 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"BatteryConfig"];
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id obj = v5;
      uint64_t v6 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v48 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v52 != v48) {
              objc_enumerationMutation(obj);
            }
            double v9 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            char v10 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v49];
            uint64_t v11 = [v9 objectForKeyedSubscript:@"CycleCount"];
            [v10 setObject:v11 forKeyedSubscript:@"CycleCount"];

            uint64_t v12 = [v9 objectForKeyedSubscript:@"AppleRawMaxCapacity"];
            [v10 setObject:v12 forKeyedSubscript:@"AppleRawMaxCapacity"];

            id v13 = [v9 objectForKeyedSubscript:@"NominalChargeCapacity"];
            [v10 setObject:v13 forKeyedSubscript:@"NominalChargeCapacity"];

            uint64_t v14 = [v9 objectForKeyedSubscript:@"Flags"];
            [v10 setObject:v14 forKeyedSubscript:@"Flags"];

            int v15 = [v9 objectForKeyedSubscript:@"QmaxCell0"];
            [v10 setObject:v15 forKeyedSubscript:@"QmaxCell0"];

            id v16 = [v9 objectForKeyedSubscript:@"Ra00"];
            [v10 setObject:v16 forKeyedSubscript:@"RaTable_1"];

            uint64_t v17 = [v9 objectForKeyedSubscript:@"Ra01"];
            [v10 setObject:v17 forKeyedSubscript:@"RaTable_2"];

            uint64_t v18 = [v9 objectForKeyedSubscript:@"Ra02"];
            [v10 setObject:v18 forKeyedSubscript:@"RaTable_3"];

            id v19 = [v9 objectForKeyedSubscript:@"Ra03"];
            [v10 setObject:v19 forKeyedSubscript:@"RaTable_4"];

            double v20 = [v9 objectForKeyedSubscript:@"Ra04"];
            [v10 setObject:v20 forKeyedSubscript:@"RaTable_5"];

            long long v21 = [v9 objectForKeyedSubscript:@"Ra05"];
            [v10 setObject:v21 forKeyedSubscript:@"RaTable_6"];

            int v22 = [v9 objectForKeyedSubscript:@"Ra06"];
            [v10 setObject:v22 forKeyedSubscript:@"RaTable_7"];

            uint64_t v23 = [v9 objectForKeyedSubscript:@"Ra07"];
            [v10 setObject:v23 forKeyedSubscript:@"RaTable_8"];

            uint64_t v24 = [v9 objectForKeyedSubscript:@"Ra08"];
            [v10 setObject:v24 forKeyedSubscript:@"RaTable_9"];

            long long v25 = [v9 objectForKeyedSubscript:@"Ra09"];
            [v10 setObject:v25 forKeyedSubscript:@"RaTable_10"];

            id v26 = [v9 objectForKeyedSubscript:@"Ra10"];
            [v10 setObject:v26 forKeyedSubscript:@"RaTable_11"];

            long long v27 = [v9 objectForKeyedSubscript:@"Ra11"];
            [v10 setObject:v27 forKeyedSubscript:@"RaTable_12"];

            uint64_t v28 = [v9 objectForKeyedSubscript:@"Ra12"];
            [v10 setObject:v28 forKeyedSubscript:@"RaTable_13"];

            long long v29 = [v9 objectForKeyedSubscript:@"Ra13"];
            [v10 setObject:v29 forKeyedSubscript:@"RaTable_14"];

            long long v30 = [v9 objectForKeyedSubscript:@"Ra14"];
            [v10 setObject:v30 forKeyedSubscript:@"RaTable_15"];

            long long v31 = [v9 objectForKeyedSubscript:@"Wom1"];
            [v10 setObject:v31 forKeyedSubscript:@"Wom_1"];

            BOOL v32 = [v9 objectForKeyedSubscript:@"Wom2"];
            [v10 setObject:v32 forKeyedSubscript:@"Wom_2"];

            uint64_t v33 = [v9 objectForKeyedSubscript:@"MaximumTemperature"];
            [v10 setObject:v33 forKeyedSubscript:@"MaximumTemperature"];

            double v34 = [v9 objectForKeyedSubscript:@"MinimumTemperature"];
            [v10 setObject:v34 forKeyedSubscript:@"MinimumTemperature"];

            uint64_t v35 = [v9 objectForKeyedSubscript:@"MaximumPackVoltage"];
            [v10 setObject:v35 forKeyedSubscript:@"MaximumPackVoltage"];

            int v36 = [v9 objectForKeyedSubscript:@"MinimumPackVoltage"];
            [v10 setObject:v36 forKeyedSubscript:@"MinimumPackVoltage"];

            __int16 v37 = [v9 objectForKeyedSubscript:@"MaximimChargeCurrent"];
            [v10 setObject:v37 forKeyedSubscript:@"MaximumChargeCurrent"];

            int v38 = [v9 objectForKeyedSubscript:@"MaximimDischargeCurrent"];
            [v10 setObject:v38 forKeyedSubscript:@"MaximumDischargeCurrent"];

            id v39 = [v9 objectForKeyedSubscript:@"MinimumFCC"];
            [v10 setObject:v39 forKeyedSubscript:@"MinimumFCC"];

            uint64_t v40 = [v9 objectForKeyedSubscript:@"LowAvgCurrentLastRun"];
            [v10 setObject:v40 forKeyedSubscript:@"LowAvgCurrentLastRun"];

            uint64_t v41 = [v9 objectForKeyedSubscript:@"HighAvgCurrentLastRun"];
            [v10 setObject:v41 forKeyedSubscript:@"HighAvgCurrentLastRun"];

            uint64_t v42 = [v9 objectForKeyedSubscript:@"AverageTemperature"];
            [v10 setObject:v42 forKeyedSubscript:@"AverageTemperature"];

            __int16 v43 = [v9 objectForKeyedSubscript:@"RDISCnt"];
            [v10 setObject:v43 forKeyedSubscript:@"RDISCnt"];

            int v44 = [v9 objectForKeyedSubscript:@"CycleCountLastQmax"];
            [v10 setObject:v44 forKeyedSubscript:@"CycleCountLastQmax"];

            __int16 v45 = [v9 objectForKeyedSubscript:@"TotalOperatingTime"];
            [v10 setObject:v45 forKeyedSubscript:@"TotalOperatingTime"];

            int v46 = [v9 objectForKeyedSubscript:@"TimeAbove95Perc"];
            [v10 setObject:v46 forKeyedSubscript:@"TimeAbove95Perc"];

            [*(id *)(a1 + 32) logEntry:v10];
          }
          uint64_t v7 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
        }
        while (v7);
      }
    }
  }
}

uint64_t __57__PLBatteryAgent_logEventNoneBatteryConfigCycleCountData__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventNoneBatteryConfigCycleCountData_classDebugEnabled = result;
  return result;
}

- (BOOL)gasGaugeOpenAndStartLogging
{
  if ([(PLBatteryAgent *)self gasGagueConnection])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v3 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__PLBatteryAgent_gasGaugeOpenAndStartLogging__block_invoke;
      block[3] = &unk_1E6E4A300;
      BOOL v32 = @"GasGauge";
      uint64_t v33 = v3;
      if (gasGaugeOpenAndStartLogging_defaultOnce != -1) {
        dispatch_once(&gasGaugeOpenAndStartLogging_defaultOnce, block);
      }
      int v4 = gasGaugeOpenAndStartLogging_classDebugEnabled;

      if (v4)
      {
        uint64_t v5 = [NSString stringWithFormat:@"GasGauge Open: already have a connection"];
        uint64_t v6 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
        double v8 = [v7 lastPathComponent];
        double v9 = [NSString stringWithUTF8String:"-[PLBatteryAgent gasGaugeOpenAndStartLogging]"];
        [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:7959];

        char v10 = PLLogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
        BOOL v11 = 1;
LABEL_23:

        return v11;
      }
    }
    return 1;
  }
  else
  {
    [(PLBatteryAgent *)self setGasGagueConnection:gasgauge_open()];
    if ([(PLBatteryAgent *)self gasGagueConnection])
    {
      uint64_t v12 = gasgauge_currentlog_interval((uint64_t)[(PLBatteryAgent *)self gasGagueConnection]);
      uint64_t v13 = gasgauge_currentlog_sleepinterval((uint64_t)[(PLBatteryAgent *)self gasGagueConnection]);
      uint64_t started = gasgauge_currentlog_start_collection((unsigned int *)[(PLBatteryAgent *)self gasGagueConnection], 2);
      uint64_t v15 = started;
      if ((int)v12 < 2 || (int)v13 < 1 || started)
      {
        gasgauge_close((void *)[(PLBatteryAgent *)self gasGagueConnection]);
        [(PLBatteryAgent *)self setGasGagueConnection:0];
        BOOL v11 = 0;
      }
      else
      {
        BOOL v11 = 1;
      }
    }
    else
    {
      BOOL v11 = 0;
      uint64_t v13 = 4294967294;
      uint64_t v15 = 4294967294;
      uint64_t v12 = 4294967294;
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v16 = objc_opt_class();
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      long long v27 = __45__PLBatteryAgent_gasGaugeOpenAndStartLogging__block_invoke_5088;
      uint64_t v28 = &unk_1E6E4A300;
      long long v29 = @"GasGauge";
      uint64_t v30 = v16;
      if (gasGaugeOpenAndStartLogging_defaultOnce_5086 != -1) {
        dispatch_once(&gasGaugeOpenAndStartLogging_defaultOnce_5086, &v25);
      }
      int v17 = gasGaugeOpenAndStartLogging_classDebugEnabled_5087;

      if (v17)
      {
        uint64_t v18 = NSString;
        id v19 = NSStringFromBOOL();
        uint64_t v5 = [v18 stringWithFormat:@"GasGauge Open: result=%@ gg_log_interval=%d gg_sleep_interval=%d gg_currentlog_start=%d", v19, v12, v13, v15, v25, v26, v27, v28];

        double v20 = (void *)MEMORY[0x1E4F929B8];
        long long v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
        int v22 = [v21 lastPathComponent];
        uint64_t v23 = [NSString stringWithUTF8String:"-[PLBatteryAgent gasGaugeOpenAndStartLogging]"];
        [v20 logMessage:v5 fromFile:v22 fromFunction:v23 fromLineNumber:7984];

        char v10 = PLLogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
        goto LABEL_23;
      }
    }
  }
  return v11;
}

uint64_t __45__PLBatteryAgent_gasGaugeOpenAndStartLogging__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  gasGaugeOpenAndStartLogging_classDebugEnabled = result;
  return result;
}

uint64_t __45__PLBatteryAgent_gasGaugeOpenAndStartLogging__block_invoke_5088(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  gasGaugeOpenAndStartLogging_classDebugEnabled_5087 = result;
  return result;
}

- (BOOL)gasGaugeStopLoggingAndClose
{
  if ([(PLBatteryAgent *)self gasGagueConnection])
  {
    gasgauge_currentlog_stop((uint64_t)[(PLBatteryAgent *)self gasGagueConnection]);
    gasgauge_close((void *)[(PLBatteryAgent *)self gasGagueConnection]);
    [(PLBatteryAgent *)self setGasGagueConnection:0];
  }
  return 1;
}

- (BOOL)givePluggedInFreePass
{
  uint64_t v2 = self;
  uint64_t v3 = [(PLBatteryAgent *)self deviceIsPluggedIn];
  uint64_t v4 = [v3 BOOLValue];
  [(PLBatteryAgent *)v2 batteryLevelPercent];
  LOBYTE(v2) = +[PLUtilities isPingPongChargingWith:andBatteryLevelPercent:](PLUtilities, "isPingPongChargingWith:andBatteryLevelPercent:", v4);

  return (char)v2;
}

- (void)addPowerMeasurementToAccounting:(double)a3 withStartDate:(id)a4 withEndDate:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  char v10 = [MEMORY[0x1E4F92900] sharedInstance];
  [v10 addPowerMeasurementEventIntervalWithPower:v8 withStartDate:v9 withEndDate:a3];

  BOOL v11 = PLLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v30 = 134218498;
    double v31 = a3;
    __int16 v32 = 2112;
    id v33 = v8;
    __int16 v34 = 2112;
    id v35 = v9;
    _os_log_debug_impl(&dword_1E4220000, v11, OS_LOG_TYPE_DEBUG, "added power %.2fmW for %@-%@", (uint8_t *)&v30, 0x20u);
  }

  uint64_t v12 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"UILevel"];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v12];
  [v9 timeIntervalSinceDate:v8];
  double v15 = v14;
  double v16 = v14 / 3600.0 * a3;
  int v17 = PLLogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    [(PLBatteryAgent *)v17 addPowerMeasurementToAccounting:v15 withStartDate:v18 withEndDate:v19];
  }

  double v20 = (double)(uint64_t)llround(v16 * 1000.0);
  long long v21 = PLLogCommon();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryAgent addPowerMeasurementToAccounting:withStartDate:withEndDate:](v21, v22, v23, v24, v25, v26, v27, v28);
  }

  long long v29 = [MEMORY[0x1E4F28ED0] numberWithDouble:v20];
  [v13 setObject:v29 forKeyedSubscript:@"energyConsumed"];

  [(PLOperator *)self logEntry:v13];
}

- (void)gasGaugeRead
{
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  if (+[PLUtilities hasGasGauge])
  {
    [(PLBatteryAgent *)self gasGaugeOpenAndStartLogging];
    unint64_t v3 = 0x1E4F92000uLL;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v4 = objc_opt_class();
      v169[0] = MEMORY[0x1E4F143A8];
      v169[1] = 3221225472;
      void v169[2] = __30__PLBatteryAgent_gasGaugeRead__block_invoke;
      v169[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v169[4] = v4;
      uint64_t v5 = v169;
      if (gasGaugeRead_defaultOnce != -1) {
        dispatch_once(&gasGaugeRead_defaultOnce, v5);
      }

      if (gasGaugeRead_classDebugEnabled)
      {
        uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"gasGagueConnection=%p", -[PLBatteryAgent gasGagueConnection](self, "gasGagueConnection"));
        uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
        id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
        id v9 = [v8 lastPathComponent];
        char v10 = [NSString stringWithUTF8String:"-[PLBatteryAgent gasGaugeRead]"];
        [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:8042];

        BOOL v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    if ([(PLBatteryAgent *)self gasGagueConnection])
    {
      uint64_t v168 = -1;
      if (gasgauge_currentlog_entries((unsigned int *)[(PLBatteryAgent *)self gasGagueConnection], 0, (unint64_t *)&v168, 2)|| !v168)
      {
        uint64_t v52 = [(PLBatteryAgent *)self gasGaugeConsecutiveEmptyEntriesCount]+ 1;
        [(PLBatteryAgent *)self setGasGaugeConsecutiveEmptyEntriesCount:v52];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __30__PLBatteryAgent_gasGaugeRead__block_invoke_5152;
        block[3] = &unk_1E6E47848;
        void block[4] = self;
        if (gasGaugeRead_defaultOnce_5150 != -1) {
          dispatch_once(&gasGaugeRead_defaultOnce_5150, block);
        }
        if (*(double *)&gasGaugeRead_objectForKey_5151 <= (double)(int)v52
          && [(PLBatteryAgent *)self allowGasGaugeRead])
        {
          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v53 = objc_opt_class();
            v156[0] = MEMORY[0x1E4F143A8];
            v156[1] = 3221225472;
            void v156[2] = __30__PLBatteryAgent_gasGaugeRead__block_invoke_2_5155;
            v156[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v156[4] = v53;
            if (gasGaugeRead_defaultOnce_5153 != -1) {
              dispatch_once(&gasGaugeRead_defaultOnce_5153, v156);
            }
            if (gasGaugeRead_classDebugEnabled_5154)
            {
              long long v54 = [NSString stringWithFormat:@"Resetting the gasgauge connection"];
              uint64_t v55 = (void *)MEMORY[0x1E4F929B8];
              uint64_t v56 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
              int v57 = [v56 lastPathComponent];
              v58 = [NSString stringWithUTF8String:"-[PLBatteryAgent gasGaugeRead]"];
              [v55 logMessage:v54 fromFile:v57 fromFunction:v58 fromLineNumber:8148];

              __int16 v59 = PLLogCommon();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
                __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
              }
            }
          }
          uint64_t v60 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"GasGaugeReconnect"];
          uint64_t v61 = (void *)MEMORY[0x1E4F929E0];
          uint64_t v62 = [(PLOperator *)self className];
          LODWORD(v61) = [v61 isEntryKeySetup:v60 forOperatorName:v62];

          if (v61)
          {
            int v63 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v60];
            uint64_t v64 = objc_msgSend(NSString, "stringWithFormat:", @"Consecutive Empty Entries %d", -[PLBatteryAgent gasGaugeConsecutiveEmptyEntriesCount](self, "gasGaugeConsecutiveEmptyEntriesCount"));
            [v63 setObject:v64 forKeyedSubscript:@"Reason"];

            [(PLOperator *)self logEntry:v63];
          }
          [(PLBatteryAgent *)self gasGaugeStopLoggingAndClose];
          [(PLBatteryAgent *)self gasGaugeOpenAndStartLogging];
          [(PLBatteryAgent *)self setGasGaugeConsecutiveEmptyEntriesCount:0];
        }
      }
      else
      {
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v12 = objc_opt_class();
          v167[0] = MEMORY[0x1E4F143A8];
          v167[1] = 3221225472;
          void v167[2] = __30__PLBatteryAgent_gasGaugeRead__block_invoke_5097;
          v167[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v167[4] = v12;
          uint64_t v13 = v167;
          if (gasGaugeRead_defaultOnce_5095 != -1) {
            dispatch_once(&gasGaugeRead_defaultOnce_5095, v13);
          }

          if (gasGaugeRead_classDebugEnabled_5096)
          {
            double v14 = objc_msgSend(NSString, "stringWithFormat:", @"numReadings=%i", v168);
            double v15 = (void *)MEMORY[0x1E4F929B8];
            double v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
            int v17 = [v16 lastPathComponent];
            uint64_t v18 = [NSString stringWithUTF8String:"-[PLBatteryAgent gasGaugeRead]"];
            [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:8047];

            uint64_t v19 = PLLogCommon();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
            }
          }
        }
        double v20 = (int *)malloc_type_malloc(24 * v168, 0x100004034E20058uLL);
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v21 = objc_opt_class();
          v166[0] = MEMORY[0x1E4F143A8];
          v166[1] = 3221225472;
          void v166[2] = __30__PLBatteryAgent_gasGaugeRead__block_invoke_5103;
          v166[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v166[4] = v21;
          uint64_t v22 = v166;
          if (gasGaugeRead_defaultOnce_5101 != -1) {
            dispatch_once(&gasGaugeRead_defaultOnce_5101, v22);
          }

          if (gasGaugeRead_classDebugEnabled_5102)
          {
            uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"logs=%p", v20);
            uint64_t v24 = (void *)MEMORY[0x1E4F929B8];
            uint64_t v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
            uint64_t v26 = [v25 lastPathComponent];
            uint64_t v27 = [NSString stringWithUTF8String:"-[PLBatteryAgent gasGaugeRead]"];
            [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:8050];

            uint64_t v28 = PLLogCommon();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
            }
          }
        }
        if (v20)
        {
          if (!gasgauge_currentlog_entries((unsigned int *)[(PLBatteryAgent *)self gasGagueConnection], (uint64_t)v20, (unint64_t *)&v168, 2)&& v168)
          {
            if ([MEMORY[0x1E4F929C0] debugEnabled])
            {
              uint64_t v29 = objc_opt_class();
              v165[0] = MEMORY[0x1E4F143A8];
              v165[1] = 3221225472;
              void v165[2] = __30__PLBatteryAgent_gasGaugeRead__block_invoke_5109;
              v165[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v165[4] = v29;
              int v30 = v165;
              if (gasGaugeRead_defaultOnce_5107 != -1) {
                dispatch_once(&gasGaugeRead_defaultOnce_5107, v30);
              }

              if (gasGaugeRead_classDebugEnabled_5108)
              {
                double v31 = [NSString stringWithFormat:@"numReadings=%i, logs=%p", v168, v20];
                __int16 v32 = (void *)MEMORY[0x1E4F929B8];
                id v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
                __int16 v34 = [v33 lastPathComponent];
                id v35 = [NSString stringWithUTF8String:"-[PLBatteryAgent gasGaugeRead]"];
                [v32 logMessage:v31 fromFile:v34 fromFunction:v35 fromLineNumber:8054];

                uint64_t v36 = PLLogCommon();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
                  __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
                }
              }
            }
            uint64_t v154 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"GasGauge"];
            v155 = v20;
            __int16 v37 = &handlePeer_forEvent__classDebugEnabled_685;
            int v38 = &handlePeer_forEvent__classDebugEnabled_685;
            id v39 = v20;
            if (v168 >= 1)
            {
              id v39 = v20;
              do
              {
                double v40 = (double)*v39;
                *(double *)&gasGaugeRead_totalCurrent = *(double *)&gasGaugeRead_totalCurrent + v40;
                [(PLBatteryAgent *)self rawBatteryVoltageVolt];
                *((double *)v37 + 160) = *((double *)v37 + 160) + v41 * v40 / -3600.0;
                if ([*(id *)(v3 + 2496) debugEnabled])
                {
                  uint64_t v42 = objc_opt_class();
                  v164[0] = MEMORY[0x1E4F143A8];
                  v164[1] = 3221225472;
                  void v164[2] = __30__PLBatteryAgent_gasGaugeRead__block_invoke_5115;
                  v164[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                  v164[4] = v42;
                  __int16 v43 = v164;
                  if (gasGaugeRead_defaultOnce_5113 != -1) {
                    dispatch_once(&gasGaugeRead_defaultOnce_5113, v43);
                  }

                  if (gasGaugeRead_classDebugEnabled_5114)
                  {
                    int v44 = NSString;
                    [(PLBatteryAgent *)self rawBatteryVoltageVolt];
                    int v46 = objc_msgSend(v44, "stringWithFormat:", @"======================= Device Battery - Adding: %f", v45 * -v40 / 3600.0);
                    double v47 = (void *)MEMORY[0x1E4F929B8];
                    uint64_t v48 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
                    uint64_t v49 = [v48 lastPathComponent];
                    uint64_t v50 = [NSString stringWithUTF8String:"-[PLBatteryAgent gasGaugeRead]"];
                    [v47 logMessage:v46 fromFile:v49 fromFunction:v50 fromLineNumber:8063];

                    long long v51 = PLLogCommon();
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      double v171 = v46;
                      _os_log_debug_impl(&dword_1E4220000, v51, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }

                    unint64_t v3 = 0x1E4F92000;
                    double v20 = v155;
                    __int16 v37 = &handlePeer_forEvent__classDebugEnabled_685;
                    int v38 = &handlePeer_forEvent__classDebugEnabled_685;
                  }
                }
                if (*(double *)&gasGaugeRead_minCurrent > v40)
                {
                  gasGaugeRead_minCurrent = *(void *)&v40;
                  *(double *)&gasGaugeRead_minCurrentTime = (double)v39[4] / 1000000.0 + (double)*((uint64_t *)v39 + 1);
                }
                if (*(double *)&gasGaugeRead_maxCurrent < v40)
                {
                  gasGaugeRead_maxCurrent = *(void *)&v40;
                  *(double *)&gasGaugeRead_maxCurrentTime = (double)v39[4] / 1000000.0 + (double)*((uint64_t *)v39 + 1);
                }
                ++*((_DWORD *)v38 + 322);
                v39 += 6;
              }
              while (v39 < &v20[6 * v168]);
            }
            BOOL v65 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v20[4] / 1000000.0 + (double)*((uint64_t *)v20 + 1)];
            uint64_t v66 = [v65 convertFromSystemToMonotonic];

            if (!gasGaugeRead_savedStartDate) {
              objc_storeStrong((id *)&gasGaugeRead_savedStartDate, v66);
            }
            id v67 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)*(v39 - 2) / 1000000.0 + (double)*((uint64_t *)v39 - 2) + 1.0];
            v68 = [v67 convertFromSystemToMonotonic];

            double v153 = v68;
            [v68 timeIntervalSinceDate:gasGaugeRead_savedStartDate];
            double v70 = v69;
            v163[0] = MEMORY[0x1E4F143A8];
            v163[1] = 3221225472;
            void v163[2] = __30__PLBatteryAgent_gasGaugeRead__block_invoke_5120;
            v163[3] = &unk_1E6E47848;
            v163[4] = self;
            v71 = v163;
            if (gasGaugeRead_defaultOnce_5119 != -1) {
              dispatch_once(&gasGaugeRead_defaultOnce_5119, v71);
            }
            uint64_t v72 = (void *)v154;
            id v73 = &handlePeer_forEvent__classDebugEnabled_685;

            if (v70 > *(double *)&gasGaugeRead_objectForKey)
            {
              if ([MEMORY[0x1E4F929C0] debugEnabled])
              {
                uint64_t v74 = objc_opt_class();
                v162[0] = MEMORY[0x1E4F143A8];
                v162[1] = 3221225472;
                void v162[2] = __30__PLBatteryAgent_gasGaugeRead__block_invoke_2;
                v162[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                v162[4] = v74;
                uint64_t v75 = v162;
                if (gasGaugeRead_defaultOnce_5121 != -1) {
                  dispatch_once(&gasGaugeRead_defaultOnce_5121, v75);
                }

                if (gasGaugeRead_classDebugEnabled_5122)
                {
                  id v76 = objc_msgSend(NSString, "stringWithFormat:", @"duration=%f", *(void *)&v70);
                  v77 = (void *)MEMORY[0x1E4F929B8];
                  v78 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
                  id v79 = [v78 lastPathComponent];
                  v80 = [NSString stringWithUTF8String:"-[PLBatteryAgent gasGaugeRead]"];
                  [v77 logMessage:v76 fromFile:v79 fromFunction:v80 fromLineNumber:8090];

                  v81 = PLLogCommon();
                  if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG)) {
                    __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
                  }

                  __int16 v37 = &handlePeer_forEvent__classDebugEnabled_685;
                  id v73 = &handlePeer_forEvent__classDebugEnabled_685;
                }
              }
              int v82 = *((_DWORD *)v73 + 322);
              double v83 = 0.0;
              if (v82 >= 1) {
                double v83 = *(double *)&gasGaugeRead_totalCurrent / (double)v82;
              }
              double v85 = *((double *)v37 + 160) / (v70 / 3600.0);
              v86 = (void *)MEMORY[0x1E4F28ED0];
              v87 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:*(double *)&gasGaugeRead_minCurrentTime];
              uint64_t v88 = [v87 convertFromSystemToMonotonic];
              [v88 timeIntervalSinceDate:gasGaugeRead_savedStartDate];
              uint64_t v89 = objc_msgSend(v86, "numberWithDouble:");

              uint64_t v90 = (void *)MEMORY[0x1E4F28ED0];
              v91 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:*(double *)&gasGaugeRead_maxCurrentTime];
              int v92 = [v91 convertFromSystemToMonotonic];
              [v92 timeIntervalSinceDate:gasGaugeRead_savedStartDate];
              uint64_t v93 = objc_msgSend(v90, "numberWithDouble:");

              id v94 = objc_alloc(MEMORY[0x1E4F929D0]);
              uint64_t v95 = (void *)[v94 initWithEntryKey:v154 withDate:gasGaugeRead_savedStartDate];
              [v95 setObject:v153 forKeyedSubscript:@"timestampEnd"];
              double v96 = [MEMORY[0x1E4F28ED0] numberWithDouble:v83];
              [v95 setObject:v96 forKeyedSubscript:@"AvgCurrent"];

              double v97 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)&gasGaugeRead_minCurrent];
              [v95 setObject:v97 forKeyedSubscript:@"MinCurrent"];

              v98 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)&gasGaugeRead_maxCurrent];
              [v95 setObject:v98 forKeyedSubscript:@"MaxCurrent"];

              uint64_t v99 = [MEMORY[0x1E4F28ED0] numberWithInt:gasGaugeRead_totalNumReadings];
              [v95 setObject:v99 forKeyedSubscript:@"Readings"];

              uint64_t v100 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)&gasGaugeRead_totalEnergy];
              [v95 setObject:v100 forKeyedSubscript:@"TotalEnergy"];

              uint64_t v101 = [MEMORY[0x1E4F28ED0] numberWithDouble:v85];
              [v95 setObject:v101 forKeyedSubscript:@"AvgPower"];

              v152 = (void *)v89;
              [v95 setObject:v89 forKeyedSubscript:@"MinCurrentOffset"];
              int v151 = (void *)v93;
              [v95 setObject:v93 forKeyedSubscript:@"MaxCurrentOffset"];
              double v102 = *(double *)&gasGaugeRead_totalEnergy;
              [(PLBatteryAgent *)self EAEnergyDrained];
              double v104 = fmax(v102 + v103, 0.0);
              double v84 = v70 / 3600.0;
              uint64_t v105 = [MEMORY[0x1E4F28ED0] numberWithDouble:v104];
              [v95 setObject:v105 forKeyedSubscript:@"OverAllEnergy"];

              uint64_t v106 = [MEMORY[0x1E4F28ED0] numberWithDouble:v104 / (v70 / 3600.0)];
              [v95 setObject:v106 forKeyedSubscript:@"OverAllPower"];

              [(PLOperator *)self logEntry:v95];
              if ([MEMORY[0x1E4F929C0] debugEnabled])
              {
                uint64_t v107 = objc_opt_class();
                v161[0] = MEMORY[0x1E4F143A8];
                v161[1] = 3221225472;
                void v161[2] = __30__PLBatteryAgent_gasGaugeRead__block_invoke_5128;
                v161[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                v161[4] = v107;
                v108 = v161;
                if (gasGaugeRead_defaultOnce_5126 != -1) {
                  dispatch_once(&gasGaugeRead_defaultOnce_5126, v108);
                }

                if (gasGaugeRead_classDebugEnabled_5127)
                {
                  int v109 = [NSString stringWithFormat:@"======================= Adding energy to accounting, duration: %f", *(void *)&v70];
                  v110 = (void *)MEMORY[0x1E4F929B8];
                  uint64_t v111 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
                  v112 = [v111 lastPathComponent];
                  uint64_t v113 = [NSString stringWithUTF8String:"-[PLBatteryAgent gasGaugeRead]"];
                  [v110 logMessage:v109 fromFile:v112 fromFunction:v113 fromLineNumber:8119];

                  uint64_t v114 = PLLogCommon();
                  if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG)) {
                    __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
                  }
                }
              }
              BOOL v115 = &handlePeer_forEvent__classDebugEnabled_685;
              if ([MEMORY[0x1E4F929C0] debugEnabled])
              {
                uint64_t v116 = objc_opt_class();
                v160[0] = MEMORY[0x1E4F143A8];
                v160[1] = 3221225472;
                void v160[2] = __30__PLBatteryAgent_gasGaugeRead__block_invoke_5134;
                v160[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                void v160[4] = v116;
                int v117 = v160;
                if (gasGaugeRead_defaultOnce_5132 != -1) {
                  dispatch_once(&gasGaugeRead_defaultOnce_5132, v117);
                }

                if (gasGaugeRead_classDebugEnabled_5133)
                {
                  uint64_t v118 = NSString;
                  id v119 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)&gasGaugeRead_totalEnergy];
                  uint64_t v120 = [v118 stringWithFormat:@"======================= Local Battery: Energy drained %@", v119];

                  int v121 = (void *)MEMORY[0x1E4F929B8];
                  v122 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
                  BOOL v123 = [v122 lastPathComponent];
                  int v124 = [NSString stringWithUTF8String:"-[PLBatteryAgent gasGaugeRead]"];
                  [v121 logMessage:v120 fromFile:v123 fromFunction:v124 fromLineNumber:8120];

                  id v125 = PLLogCommon();
                  if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG)) {
                    __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
                  }

                  BOOL v115 = &handlePeer_forEvent__classDebugEnabled_685;
                }
              }
              if ([MEMORY[0x1E4F929C0] debugEnabled])
              {
                uint64_t v126 = objc_opt_class();
                v159[0] = MEMORY[0x1E4F143A8];
                v159[1] = 3221225472;
                void v159[2] = __30__PLBatteryAgent_gasGaugeRead__block_invoke_5140;
                v159[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                v159[4] = v126;
                BOOL v127 = v159;
                if (gasGaugeRead_defaultOnce_5138 != -1) {
                  dispatch_once(&gasGaugeRead_defaultOnce_5138, v127);
                }

                if (gasGaugeRead_classDebugEnabled_5139)
                {
                  id v128 = NSString;
                  id v129 = (void *)MEMORY[0x1E4F28ED0];
                  [(PLBatteryAgent *)self EAEnergyDrained];
                  double v130 = objc_msgSend(v129, "numberWithDouble:");
                  double v131 = [v128 stringWithFormat:@"======================= B244: Energy Drained %@", v130];

                  v132 = (void *)MEMORY[0x1E4F929B8];
                  double v133 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
                  double v134 = [v133 lastPathComponent];
                  v135 = [NSString stringWithUTF8String:"-[PLBatteryAgent gasGaugeRead]"];
                  [v132 logMessage:v131 fromFile:v134 fromFunction:v135 fromLineNumber:8121];

                  double v136 = PLLogCommon();
                  if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG)) {
                    __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
                  }

                  BOOL v115 = &handlePeer_forEvent__classDebugEnabled_685;
                }
              }
              if ([MEMORY[0x1E4F929C0] debugEnabled])
              {
                uint64_t v137 = objc_opt_class();
                v158[0] = MEMORY[0x1E4F143A8];
                v158[1] = 3221225472;
                void v158[2] = __30__PLBatteryAgent_gasGaugeRead__block_invoke_5146;
                void v158[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                v158[4] = v137;
                v138 = v158;
                if (gasGaugeRead_defaultOnce_5144 != -1) {
                  dispatch_once(&gasGaugeRead_defaultOnce_5144, v138);
                }

                if (gasGaugeRead_classDebugEnabled_5145)
                {
                  v139 = NSString;
                  uint64_t v140 = [MEMORY[0x1E4F28ED0] numberWithDouble:v104];
                  v141 = [MEMORY[0x1E4F28ED0] numberWithDouble:v104 / v84];
                  v142 = [v139 stringWithFormat:@"======================= Overall Energy Drained %@, Power %@", v140, v141];

                  BOOL v143 = (void *)MEMORY[0x1E4F929B8];
                  v144 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
                  double v145 = [v144 lastPathComponent];
                  double v146 = [NSString stringWithUTF8String:"-[PLBatteryAgent gasGaugeRead]"];
                  [v143 logMessage:v142 fromFile:v145 fromFunction:v146 fromLineNumber:8122];

                  v147 = PLLogCommon();
                  if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG)) {
                    __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
                  }

                  BOOL v115 = &handlePeer_forEvent__classDebugEnabled_685;
                }
              }
              BOOL v148 = [(PLBatteryAgent *)self givePluggedInFreePass];
              double v149 = 0.0;
              if (!v148) {
                double v149 = v104 / v84;
              }
              [(PLBatteryAgent *)self addPowerMeasurementToAccounting:gasGaugeRead_savedStartDate withStartDate:v153 withEndDate:v149];
              v150 = (void *)gasGaugeRead_savedStartDate;
              gasGaugeRead_savedStartDate = 0;

              gasGaugeRead_totalCurrent = 0;
              gasGaugeRead_minCurrent = 0x7FEFFFFFFFFFFFFFLL;
              gasGaugeRead_maxCurrent = 0xFFEFFFFFFFFFFFFFLL;
              gasGaugeRead_minCurrentTime = 0xBFF0000000000000;
              gasGaugeRead_maxCurrentTime = 0xBFF0000000000000;
              gasGaugeRead_totalEnergy = 0;
              *((_DWORD *)v115 + 322) = 0;
              [(PLBatteryAgent *)self setEAEnergyDrained:0.0];

              uint64_t v72 = (void *)v154;
            }

            double v20 = v155;
          }
          free(v20);
        }
        [(PLBatteryAgent *)self setGasGaugeConsecutiveEmptyEntriesCount:0];
      }
    }
  }
}

uint64_t __30__PLBatteryAgent_gasGaugeRead__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  gasGaugeRead_classDebugEnabled = result;
  return result;
}

uint64_t __30__PLBatteryAgent_gasGaugeRead__block_invoke_5097(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  gasGaugeRead_classDebugEnabled_5096 = result;
  return result;
}

uint64_t __30__PLBatteryAgent_gasGaugeRead__block_invoke_5103(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  gasGaugeRead_classDebugEnabled_5102 = result;
  return result;
}

uint64_t __30__PLBatteryAgent_gasGaugeRead__block_invoke_5109(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  gasGaugeRead_classDebugEnabled_5108 = result;
  return result;
}

uint64_t __30__PLBatteryAgent_gasGaugeRead__block_invoke_5115(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  gasGaugeRead_classDebugEnabled_5114 = result;
  return result;
}

uint64_t __30__PLBatteryAgent_gasGaugeRead__block_invoke_5120(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultDoubleForKey:@"GasGaugeLogInterval"];
  gasGaugeRead_objectForKey = v2;
  return result;
}

uint64_t __30__PLBatteryAgent_gasGaugeRead__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  gasGaugeRead_classDebugEnabled_5122 = result;
  return result;
}

uint64_t __30__PLBatteryAgent_gasGaugeRead__block_invoke_5128(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  gasGaugeRead_classDebugEnabled_5127 = result;
  return result;
}

uint64_t __30__PLBatteryAgent_gasGaugeRead__block_invoke_5134(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  gasGaugeRead_classDebugEnabled_5133 = result;
  return result;
}

uint64_t __30__PLBatteryAgent_gasGaugeRead__block_invoke_5140(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  gasGaugeRead_classDebugEnabled_5139 = result;
  return result;
}

uint64_t __30__PLBatteryAgent_gasGaugeRead__block_invoke_5146(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  gasGaugeRead_classDebugEnabled_5145 = result;
  return result;
}

uint64_t __30__PLBatteryAgent_gasGaugeRead__block_invoke_5152(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultDoubleForKey:@"GasGaugeConsecutiveEmptyEntriesCountThreshold"];
  gasGaugeRead_objectForKey_5151 = v2;
  return result;
}

uint64_t __30__PLBatteryAgent_gasGaugeRead__block_invoke_2_5155(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  gasGaugeRead_classDebugEnabled_5154 = result;
  return result;
}

- (void)logCurrentAccumulatorWithRawData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"BatteryData"];

    if (v6)
    {
      uint64_t v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"CurrentAccumulator"];
      [(PLOperator *)self timeIntervalSinceLastLogForEntryKey:v7];
      double v9 = v8;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__PLBatteryAgent_logCurrentAccumulatorWithRawData___block_invoke;
      block[3] = &unk_1E6E47848;
      void block[4] = self;
      if (logCurrentAccumulatorWithRawData__defaultOnce != -1) {
        dispatch_once(&logCurrentAccumulatorWithRawData__defaultOnce, block);
      }
      if (v9 > *(double *)&logCurrentAccumulatorWithRawData__objectForKey)
      {
        char v10 = [v5 objectForKeyedSubscript:@"BatteryData"];
        BOOL v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7];
        uint64_t v12 = [v10 objectForKeyedSubscript:@"CellCurrentAccumulator"];
        uint64_t v17 = MEMORY[0x1E4F143A8];
        uint64_t v18 = 3221225472;
        uint64_t v19 = __51__PLBatteryAgent_logCurrentAccumulatorWithRawData___block_invoke_2;
        double v20 = &unk_1E6E49F50;
        id v21 = v11;
        id v13 = v11;
        [v12 enumerateObjectsUsingBlock:&v17];
        double v14 = objc_msgSend(v10, "objectForKeyedSubscript:", @"PackCurrentAccumulator", v17, v18, v19, v20);
        [v13 setObject:v14 forKeyedSubscript:@"CurrentAccumulator"];

        double v15 = [v10 objectForKeyedSubscript:@"PackCurrentAccumulatorCount"];
        [v13 setObject:v15 forKeyedSubscript:@"CurrentAccumulatorCount"];

        double v16 = [v10 objectForKeyedSubscript:@"CellCurrentAccumulatorCount"];
        [v13 setObject:v16 forKeyedSubscript:@"CellCurrentAccumulatorCount"];

        [(PLBatteryAgent *)self accountGaugePowerFromCurrentAccumulatorEntry:v13];
        [(PLOperator *)self logEntry:v13];
      }
    }
  }
}

uint64_t __51__PLBatteryAgent_logCurrentAccumulatorWithRawData___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultDoubleForKey:@"RateLimiterCurrentAccumulator"];
  logCurrentAccumulatorWithRawData__objectForKey = v2;
  return result;
}

void __51__PLBatteryAgent_logCurrentAccumulatorWithRawData___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v4 = NSString;
  uint64_t v5 = (a3 + 1);
  id v6 = a2;
  objc_msgSend(v4, "stringWithFormat:", @"Cell%dCurrentAccumulator", v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

- (void)accountGaugePowerFromCurrentAccumulatorEntry:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v32 = v4;
    uint64_t v5 = [v4 objectForKeyedSubscript:@"CurrentAccumulator"];
    id v4 = v32;
    if (v5)
    {
      id v6 = [v32 objectForKeyedSubscript:@"CurrentAccumulatorCount"];

      id v4 = v32;
      if (v6)
      {
        id v7 = [v32 objectForKeyedSubscript:@"CurrentAccumulator"];
        uint64_t v8 = [v7 intValue];

        double v9 = [v32 objectForKeyedSubscript:@"CurrentAccumulatorCount"];
        uint64_t v10 = [v9 intValue];

        BOOL v11 = (void *)MEMORY[0x1E4F1C9C8];
        uint64_t v12 = [v32 objectForKeyedSubscript:@"timestamp"];
        [v12 doubleValue];
        id v13 = objc_msgSend(v11, "dateWithTimeIntervalSince1970:");

        if (![(PLBatteryAgent *)self previousCurrentAccumulator]
          || ![(PLBatteryAgent *)self previousCurrentAccumulatorCount]
          || ([(PLBatteryAgent *)self previousCurrentAccumulatorDate],
              double v14 = objc_claimAutoreleasedReturnValue(),
              v14,
              !v14))
        {
          double v15 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"CurrentAccumulator"];
          double v16 = [(PLOperator *)self storage];
          uint64_t v17 = [v16 lastEntryForKey:v15];

          if (v17)
          {
            uint64_t v18 = [v17 objectForKeyedSubscript:@"CurrentAccumulator"];

            if (v18)
            {
              uint64_t v19 = [v17 objectForKeyedSubscript:@"CurrentAccumulator"];
              -[PLBatteryAgent setPreviousCurrentAccumulator:](self, "setPreviousCurrentAccumulator:", [v19 intValue]);
            }
            double v20 = [v17 objectForKeyedSubscript:@"CurrentAccumulatorCount"];

            if (v20)
            {
              id v21 = [v17 objectForKeyedSubscript:@"CurrentAccumulatorCount"];
              -[PLBatteryAgent setPreviousCurrentAccumulatorCount:](self, "setPreviousCurrentAccumulatorCount:", [v21 intValue]);
            }
            uint64_t v22 = (void *)MEMORY[0x1E4F1C9C8];
            uint64_t v23 = [v17 objectForKeyedSubscript:@"timestamp"];
            [v23 doubleValue];
            uint64_t v24 = objc_msgSend(v22, "dateWithTimeIntervalSince1970:");
            [(PLBatteryAgent *)self setPreviousCurrentAccumulatorDate:v24];
          }
          if (![(PLBatteryAgent *)self previousCurrentAccumulator]
            || ![(PLBatteryAgent *)self previousCurrentAccumulatorCount])
          {
            [(PLBatteryAgent *)self setPreviousCurrentAccumulator:v8];
            [(PLBatteryAgent *)self setPreviousCurrentAccumulatorCount:v10];
            [(PLBatteryAgent *)self setPreviousCurrentAccumulatorDate:v13];

LABEL_25:
            id v4 = v32;
            goto LABEL_26;
          }
        }
        if ((int)v10 > [(PLBatteryAgent *)self previousCurrentAccumulatorCount])
        {
          int v25 = [(PLBatteryAgent *)self previousCurrentAccumulator] - v8;
          double v26 = (double)v25
              / (double)(int)(v10
                            - [(PLBatteryAgent *)self previousCurrentAccumulatorCount]);
          [(PLBatteryAgent *)self rawBatteryVoltageVolt];
          double v28 = v27 * v26;
          BOOL v29 = [(PLBatteryAgent *)self givePluggedInFreePass];
          if (v28 <= 0.0 || v29) {
            double v28 = 0.0;
          }
          double v31 = [(PLBatteryAgent *)self previousCurrentAccumulatorDate];
          [(PLBatteryAgent *)self addPowerMeasurementToAccounting:v31 withStartDate:v13 withEndDate:v28];
        }
        [(PLBatteryAgent *)self setPreviousCurrentAccumulator:v8];
        [(PLBatteryAgent *)self setPreviousCurrentAccumulatorCount:v10];
        [(PLBatteryAgent *)self setPreviousCurrentAccumulatorDate:v13];
        goto LABEL_25;
      }
    }
  }
LABEL_26:
}

- (BOOL)shouldWaitForLifetimeDataWithRawData:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F92A38] isWatch])
  {
LABEL_8:
    LOBYTE(v4) = 0;
    goto LABEL_9;
  }
  if (([MEMORY[0x1E4F929C0] BOOLForKey:@"ForceFullGGUpdateOnBoot" ifNotSet:1] & 1) == 0)
  {
    id v6 = PLLogBH();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[PLBatteryAgent shouldWaitForLifetimeDataWithRawData:](v6, v7, v8, v9, v10, v11, v12, v13);
    }

    goto LABEL_8;
  }
  id v4 = [v3 objectForKeyedSubscript:@"ForceFullGGUpdateOnBoot"];

  if (v4)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:@"ForceFullGGUpdateOnBoot"];
    LOBYTE(v4) = [v5 BOOLValue];
  }
LABEL_9:

  return (char)v4;
}

- (int64_t)xFlags
{
  uint64_t v2 = IOServiceMatching("IOPMPowerSource");
  CFMutableDictionaryRef v3 = IOServiceMatching("AppleAuthCPRelay");
  CFDictionaryRef v4 = v3;
  if (v3) {
    BOOL v5 = v2 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (v3) {
      CFRelease(v3);
    }
    if (!v2) {
      goto LABEL_43;
    }
    CFRelease(v2);
LABEL_42:
    uint64_t v2 = 0;
LABEL_43:
    int64_t v37 = 1;
    goto LABEL_44;
  }
  CFDictionarySetValue(v3, @"IOParentMatch", v2);
  CFRelease(v2);
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F92A00], "snapshotFromIOEntry:", IOServiceGetMatchingService(*MEMORY[0x1E4F2EF00], v4));
  int v6 = [MEMORY[0x1E4F929C0] debugEnabled];
  if (!v2)
  {
    if (v6)
    {
      uint64_t v38 = objc_opt_class();
      v105[0] = MEMORY[0x1E4F143A8];
      v105[1] = 3221225472;
      v105[2] = __24__PLBatteryAgent_xFlags__block_invoke;
      v105[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v105[4] = v38;
      if (xFlags_defaultOnce != -1) {
        dispatch_once(&xFlags_defaultOnce, v105);
      }
      if (xFlags_classDebugEnabled)
      {
        id v39 = objc_msgSend(NSString, "stringWithFormat:", @"Unable to snapshot %s", "AppleAuthCPRelay");
        double v40 = (void *)MEMORY[0x1E4F929B8];
        double v41 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
        uint64_t v42 = [v41 lastPathComponent];
        __int16 v43 = [NSString stringWithUTF8String:"-[PLBatteryAgent xFlags]"];
        [v40 logMessage:v39 fromFile:v42 fromFunction:v43 fromLineNumber:8279];

        int v44 = PLLogCommon();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    goto LABEL_42;
  }
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __24__PLBatteryAgent_xFlags__block_invoke_5188;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v7;
    if (xFlags_defaultOnce_5186 != -1) {
      dispatch_once(&xFlags_defaultOnce_5186, block);
    }
    if (xFlags_classDebugEnabled_5187)
    {
      uint64_t v8 = NSString;
      uint64_t v9 = [v2 objectForKeyedSubscript:@"isTrustedForUI"];
      uint64_t v10 = [v8 stringWithFormat:@"isTrustedForUI: %@", v9];

      uint64_t v11 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      uint64_t v13 = [v12 lastPathComponent];
      double v14 = [NSString stringWithUTF8String:"-[PLBatteryAgent xFlags]"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:8284];

      double v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v16 = objc_opt_class();
    v103[0] = MEMORY[0x1E4F143A8];
    v103[1] = 3221225472;
    v103[2] = __24__PLBatteryAgent_xFlags__block_invoke_5197;
    v103[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v103[4] = v16;
    if (xFlags_defaultOnce_5195 != -1) {
      dispatch_once(&xFlags_defaultOnce_5195, v103);
    }
    if (xFlags_classDebugEnabled_5196)
    {
      uint64_t v17 = NSString;
      uint64_t v18 = [v2 objectForKeyedSubscript:@"AuthPassed"];
      uint64_t v19 = [v17 stringWithFormat:@"AuthPassed: %@", v18];

      double v20 = (void *)MEMORY[0x1E4F929B8];
      id v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      uint64_t v22 = [v21 lastPathComponent];
      uint64_t v23 = [NSString stringWithUTF8String:"-[PLBatteryAgent xFlags]"];
      [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:8285];

      uint64_t v24 = PLLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v25 = objc_opt_class();
    v102[0] = MEMORY[0x1E4F143A8];
    v102[1] = 3221225472;
    v102[2] = __24__PLBatteryAgent_xFlags__block_invoke_5206;
    v102[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v102[4] = v25;
    if (xFlags_defaultOnce_5204 != -1) {
      dispatch_once(&xFlags_defaultOnce_5204, v102);
    }
    if (xFlags_classDebugEnabled_5205)
    {
      double v26 = NSString;
      double v27 = [v2 objectForKeyedSubscript:@"FdrValidationStatus"];
      double v28 = [v26 stringWithFormat:@"FDR Val St: %@", v27];

      BOOL v29 = (void *)MEMORY[0x1E4F929B8];
      int v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      double v31 = [v30 lastPathComponent];
      id v32 = [NSString stringWithUTF8String:"-[PLBatteryAgent xFlags]"];
      [v29 logMessage:v28 fromFile:v31 fromFunction:v32 fromLineNumber:8286];

      id v33 = PLLogCommon();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  __int16 v34 = [v2 objectForKeyedSubscript:@"isTrustedForUI"];

  if (v34)
  {
    id v35 = [v2 objectForKeyedSubscript:@"isTrustedForUI"];
    char v36 = [v35 BOOLValue];

    if (v36)
    {
      int64_t v37 = 4;
      goto LABEL_61;
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v53 = objc_opt_class();
      v101[0] = MEMORY[0x1E4F143A8];
      v101[1] = 3221225472;
      v101[2] = __24__PLBatteryAgent_xFlags__block_invoke_5215;
      v101[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v101[4] = v53;
      if (xFlags_defaultOnce_5213 != -1) {
        dispatch_once(&xFlags_defaultOnce_5213, v101);
      }
      if (xFlags_classDebugEnabled_5214)
      {
        double v47 = [NSString stringWithFormat:@"isTrustedForUI failed"];
        long long v54 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v55 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
        uint64_t v56 = [v55 lastPathComponent];
        int v57 = [NSString stringWithUTF8String:"-[PLBatteryAgent xFlags]"];
        [v54 logMessage:v47 fromFile:v56 fromFunction:v57 fromLineNumber:8293];

        uint64_t v52 = PLLogCommon();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
        int64_t v37 = 0;
LABEL_58:

        goto LABEL_61;
      }
    }
    int64_t v37 = 0;
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v46 = objc_opt_class();
      v100[0] = MEMORY[0x1E4F143A8];
      v100[1] = 3221225472;
      v100[2] = __24__PLBatteryAgent_xFlags__block_invoke_5221;
      v100[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v100[4] = v46;
      if (xFlags_defaultOnce_5219 != -1) {
        dispatch_once(&xFlags_defaultOnce_5219, v100);
      }
      if (xFlags_classDebugEnabled_5220)
      {
        double v47 = [NSString stringWithFormat:@"isTrustedForUI missing"];
        uint64_t v48 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v49 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
        uint64_t v50 = [v49 lastPathComponent];
        long long v51 = [NSString stringWithUTF8String:"-[PLBatteryAgent xFlags]"];
        [v48 logMessage:v47 fromFile:v50 fromFunction:v51 fromLineNumber:8297];

        uint64_t v52 = PLLogCommon();
        int64_t v37 = 2;
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          int64_t v37 = 2;
        }
        goto LABEL_58;
      }
    }
    int64_t v37 = 2;
  }
LABEL_61:
  v58 = [v2 objectForKeyedSubscript:@"AuthPassed"];

  if (v58)
  {
    __int16 v59 = [v2 objectForKeyedSubscript:@"AuthPassed"];
    int v60 = [v59 BOOLValue];

    if (v60)
    {
      v37 |= 0x10uLL;
      goto LABEL_77;
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v68 = objc_opt_class();
      v99[0] = MEMORY[0x1E4F143A8];
      v99[1] = 3221225472;
      v99[2] = __24__PLBatteryAgent_xFlags__block_invoke_5227;
      v99[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v99[4] = v68;
      if (xFlags_defaultOnce_5225 != -1) {
        dispatch_once(&xFlags_defaultOnce_5225, v99);
      }
      if (xFlags_classDebugEnabled_5226)
      {
        uint64_t v62 = [NSString stringWithFormat:@"Auth Failed"];
        double v69 = (void *)MEMORY[0x1E4F929B8];
        double v70 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
        v71 = [v70 lastPathComponent];
        uint64_t v72 = [NSString stringWithUTF8String:"-[PLBatteryAgent xFlags]"];
        [v69 logMessage:v62 fromFile:v71 fromFunction:v72 fromLineNumber:8305];

        id v67 = PLLogCommon();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
LABEL_76:
      }
    }
  }
  else
  {
    v37 |= 8uLL;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v61 = objc_opt_class();
      v98[0] = MEMORY[0x1E4F143A8];
      v98[1] = 3221225472;
      v98[2] = __24__PLBatteryAgent_xFlags__block_invoke_5233;
      v98[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v98[4] = v61;
      if (xFlags_defaultOnce_5231 != -1) {
        dispatch_once(&xFlags_defaultOnce_5231, v98);
      }
      if (xFlags_classDebugEnabled_5232)
      {
        uint64_t v62 = [NSString stringWithFormat:@"AuthPassed missing"];
        int v63 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v64 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
        BOOL v65 = [v64 lastPathComponent];
        uint64_t v66 = [NSString stringWithUTF8String:"-[PLBatteryAgent xFlags]"];
        [v63 logMessage:v62 fromFile:v65 fromFunction:v66 fromLineNumber:8309];

        id v67 = PLLogCommon();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
        goto LABEL_76;
      }
    }
  }
LABEL_77:
  id v73 = [v2 objectForKeyedSubscript:@"FdrValidationStatus"];

  if (!v73)
  {
    v37 |= 0x20uLL;
    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_96;
    }
    uint64_t v83 = objc_opt_class();
    v96[0] = MEMORY[0x1E4F143A8];
    v96[1] = 3221225472;
    v96[2] = __24__PLBatteryAgent_xFlags__block_invoke_5248;
    v96[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void v96[4] = v83;
    if (xFlags_defaultOnce_5246 != -1) {
      dispatch_once(&xFlags_defaultOnce_5246, v96);
    }
    if (!xFlags_classDebugEnabled_5247) {
      goto LABEL_96;
    }
    uint64_t v75 = [NSString stringWithFormat:@"FDR Validation Missing"];
    double v84 = (void *)MEMORY[0x1E4F929B8];
    double v85 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
    v86 = [v85 lastPathComponent];
    v87 = [NSString stringWithUTF8String:"-[PLBatteryAgent xFlags]"];
    [v84 logMessage:v75 fromFile:v86 fromFunction:v87 fromLineNumber:8322];

    v77 = PLLogCommon();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG)) {
      __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
    }
LABEL_94:

    goto LABEL_95;
  }
  uint64_t v74 = [v2 objectForKeyedSubscript:@"FdrValidationStatus"];
  uint64_t v75 = v74;
  if (!v74 || ![v74 isEqualToString:@"Pass"])
  {
    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_95;
    }
    uint64_t v76 = objc_opt_class();
    v97[0] = MEMORY[0x1E4F143A8];
    v97[1] = 3221225472;
    v97[2] = __24__PLBatteryAgent_xFlags__block_invoke_5242;
    v97[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v97[4] = v76;
    if (xFlags_defaultOnce_5240 != -1) {
      dispatch_once(&xFlags_defaultOnce_5240, v97);
    }
    if (!xFlags_classDebugEnabled_5241) {
      goto LABEL_95;
    }
    v77 = [NSString stringWithFormat:@"FDR Validation Failed: %@", v75];
    v78 = (void *)MEMORY[0x1E4F929B8];
    id v79 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
    v80 = [v79 lastPathComponent];
    v81 = [NSString stringWithUTF8String:"-[PLBatteryAgent xFlags]"];
    [v78 logMessage:v77 fromFile:v80 fromFunction:v81 fromLineNumber:8318];

    int v82 = PLLogCommon();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG)) {
      __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
    }

    goto LABEL_94;
  }
  v37 |= 0x40uLL;
LABEL_95:

LABEL_96:
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v88 = objc_opt_class();
    v95[0] = MEMORY[0x1E4F143A8];
    v95[1] = 3221225472;
    void v95[2] = __24__PLBatteryAgent_xFlags__block_invoke_5254;
    v95[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v95[4] = v88;
    if (xFlags_defaultOnce_5252 != -1) {
      dispatch_once(&xFlags_defaultOnce_5252, v95);
    }
    if (xFlags_classDebugEnabled_5253)
    {
      uint64_t v89 = objc_msgSend(NSString, "stringWithFormat:", @"Got auth flags: %ld", v37);
      uint64_t v90 = (void *)MEMORY[0x1E4F929B8];
      v91 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      int v92 = [v91 lastPathComponent];
      uint64_t v93 = [NSString stringWithUTF8String:"-[PLBatteryAgent xFlags]"];
      [v90 logMessage:v89 fromFile:v92 fromFunction:v93 fromLineNumber:8324];

      id v94 = PLLogCommon();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
LABEL_44:

  return v37;
}

uint64_t __24__PLBatteryAgent_xFlags__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  xFlags_classDebugEnabled = result;
  return result;
}

uint64_t __24__PLBatteryAgent_xFlags__block_invoke_5188(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  xFlags_classDebugEnabled_5187 = result;
  return result;
}

uint64_t __24__PLBatteryAgent_xFlags__block_invoke_5197(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  xFlags_classDebugEnabled_5196 = result;
  return result;
}

uint64_t __24__PLBatteryAgent_xFlags__block_invoke_5206(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  xFlags_classDebugEnabled_5205 = result;
  return result;
}

uint64_t __24__PLBatteryAgent_xFlags__block_invoke_5215(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  xFlags_classDebugEnabled_5214 = result;
  return result;
}

uint64_t __24__PLBatteryAgent_xFlags__block_invoke_5221(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  xFlags_classDebugEnabled_5220 = result;
  return result;
}

uint64_t __24__PLBatteryAgent_xFlags__block_invoke_5227(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  xFlags_classDebugEnabled_5226 = result;
  return result;
}

uint64_t __24__PLBatteryAgent_xFlags__block_invoke_5233(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  xFlags_classDebugEnabled_5232 = result;
  return result;
}

uint64_t __24__PLBatteryAgent_xFlags__block_invoke_5242(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  xFlags_classDebugEnabled_5241 = result;
  return result;
}

uint64_t __24__PLBatteryAgent_xFlags__block_invoke_5248(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  xFlags_classDebugEnabled_5247 = result;
  return result;
}

uint64_t __24__PLBatteryAgent_xFlags__block_invoke_5254(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  xFlags_classDebugEnabled_5253 = result;
  return result;
}

- (void)setupCSMLogging
{
  OUTLINED_FUNCTION_13(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "csm: flush interval %f", v2, v3, v4, v5, 0);
}

void __33__PLBatteryAgent_setupCSMLogging__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(a2, "objectForKeyedSubscript:");
  objc_msgSend(*(id *)(a1 + 32), "setCsmOverrideValue:", objc_msgSend(v3, "intValue") != 0);
  uint64_t v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [*(id *)(a1 + 32) csmOverrideValue];
    v6[0] = 67109120;
    v6[1] = v5;
    _os_log_impl(&dword_1E4220000, v4, OS_LOG_TYPE_DEFAULT, "csm: setting override %d", (uint8_t *)v6, 8u);
  }
}

void __33__PLBatteryAgent_setupCSMLogging__block_invoke_5267(uint64_t a1)
{
  uint64_t v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_1E4220000, v2, OS_LOG_TYPE_DEFAULT, "csm: flushing due to notification", v5, 2u);
  }

  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [v3 flushCSMToAggdAtDate:v4];
}

- (void)updateCurrentSenseMonitorStatusWithEntry:(id)a3
{
  id v4 = a3;
  int v5 = [v4 objectForKeyedSubscript:@"CurrentSenseMonitorStatus"];
  int v6 = [v5 intValue];

  if (v6) {
    [(PLBatteryAgent *)self setCsmFailureCount:[(PLBatteryAgent *)self csmFailureCount] + 1];
  }
  [(PLBatteryAgent *)self setCsmTotalCount:[(PLBatteryAgent *)self csmTotalCount] + 1];
  id v11 = [v4 entryDate];

  uint64_t v7 = [(PLBatteryAgent *)self csmLastFlushMonotonicDate];
  [v11 timeIntervalSinceDate:v7];
  double v9 = v8;

  [(PLBatteryAgent *)self csmFlushInterval];
  if (v9 > v10) {
    [(PLBatteryAgent *)self flushCSMToAggdAtDate:v11];
  }
}

- (void)flushCSMToAggdAtDate:(id)a3
{
  void v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(PLBatteryAgent *)self csmTotalCount];
  int64_t v6 = [(PLBatteryAgent *)self csmFailureCount];
  v11[0] = @"com.apple.power.battery.csm.totalCount";
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v5];
  v11[1] = @"com.apple.power.battery.csm.failureCount";
  v12[0] = v7;
  double v8 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v6];
  v12[1] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  double v10 = PLLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryAgent flushCSMToAggdAtDate:]();
  }

  MEMORY[0x1E4E7E340](v9, 0);
  AnalyticsSendEventLazy();
  [(PLBatteryAgent *)self setCsmTotalCount:0];
  [(PLBatteryAgent *)self setCsmFailureCount:0];
  [(PLBatteryAgent *)self setCsmLastFlushMonotonicDate:v4];
}

id __39__PLBatteryAgent_flushCSMToAggdAtDate___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithLongLong:*(void *)(a1 + 32)];
  [v2 setObject:v3 forKeyedSubscript:@"totalCount"];

  id v4 = [MEMORY[0x1E4F28ED0] numberWithLongLong:*(void *)(a1 + 40)];
  [v2 setObject:v4 forKeyedSubscript:@"failureCount"];

  return v2;
}

- (void)logAdapterInfo:(id)a3
{
  id v18 = [a3 objectForKeyedSubscript:@"PowerTelemetryData"];
  if (v18)
  {
    id v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"Adapter"];
    int64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4];
    int64_t v6 = [v18 objectForKeyedSubscript:@"AccumulatedAdapterEfficiencyLoss"];
    [v5 setObject:v6 forKeyedSubscript:@"AccumulatedAdapterEfficiencyLoss"];

    uint64_t v7 = [v18 objectForKeyedSubscript:@"AccumulatedSystemLoad"];
    [v5 setObject:v7 forKeyedSubscript:@"AccumulatedSystemLoad"];

    double v8 = [v18 objectForKeyedSubscript:@"AccumulatedSystemPowerIn"];
    [v5 setObject:v8 forKeyedSubscript:@"AccumulatedSystemPowerIn"];

    double v9 = [v18 objectForKeyedSubscript:@"AdapterEfficiencyLoss"];
    [v5 setObject:v9 forKeyedSubscript:@"AdapterEfficiencyLoss"];

    double v10 = [v18 objectForKeyedSubscript:@"SystemLoad"];
    [v5 setObject:v10 forKeyedSubscript:@"SystemLoad"];

    id v11 = [v18 objectForKeyedSubscript:@"SystemLoadAccumulatorCount"];
    [v5 setObject:v11 forKeyedSubscript:@"SystemLoadAccumulatorCount"];

    uint64_t v12 = [v18 objectForKeyedSubscript:@"SystemPowerIn"];
    [v5 setObject:v12 forKeyedSubscript:@"SystemPowerIn"];

    uint64_t v13 = [v18 objectForKeyedSubscript:@"AccumulatedAdapterEfficiencyLoss"];
    [v5 setObject:v13 forKeyedSubscript:@"AccumulatedAdapterEfficiencyLoss"];

    double v14 = [v18 objectForKeyedSubscript:@"SystemPowerInAccumulatorCount"];
    [v5 setObject:v14 forKeyedSubscript:@"SystemPowerInAccumulatorCount"];

    double v15 = [v18 objectForKeyedSubscript:@"SystemVoltageIn"];
    [v5 setObject:v15 forKeyedSubscript:@"SystemInputVoltage"];

    uint64_t v16 = [v18 objectForKeyedSubscript:@"SystemCurrentIn"];
    [v5 setObject:v16 forKeyedSubscript:@"SystemInputCurrent"];

    uint64_t v17 = [v18 objectForKeyedSubscript:@"PowerTelemetryErrorCount"];
    [v5 setObject:v17 forKeyedSubscript:@"PowerTelemetryErrorCount"];

    [(PLOperator *)self logEntry:v5];
  }
}

- (void)logPowerOutDetails:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = [a3 objectForKeyedSubscript:@"PowerOutDetails"];
    int64_t v5 = PLLogCommon();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v6)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v4;
        _os_log_impl(&dword_1E4220000, v5, OS_LOG_TYPE_INFO, "Logging powerout details: %@", buf, 0xCu);
      }

      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      void v14[2] = __37__PLBatteryAgent_logPowerOutDetails___block_invoke;
      void v14[3] = &unk_1E6E4A5B8;
      void v14[4] = self;
      [v4 enumerateObjectsUsingBlock:v14];
    }
    else
    {
      if (v6)
      {
        [(PLBatteryAgent *)self powerOutTotalPower];
        double v8 = v7;
        [(PLBatteryAgent *)self powerOutTotalCount];
        *(_DWORD *)buf = 134218240;
        uint64_t v16 = v8;
        __int16 v17 = 2048;
        uint64_t v18 = v9;
        _os_log_impl(&dword_1E4220000, v5, OS_LOG_TYPE_INFO, "Total Power: %f  Total Count: %f", buf, 0x16u);
      }

      [(PLBatteryAgent *)self powerOutTotalCount];
      if (v10 <= 0.0 || ([(PLBatteryAgent *)self powerOutTotalPower], v11 <= 100.0))
      {
        uint64_t v13 = PLLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[PLBatteryAgent logPowerOutDetails:]();
        }
      }
      else
      {
        uint64_t v12 = PLLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[PLBatteryAgent logPowerOutDetails:]();
        }

        [(PLBatteryAgent *)self flushPowerOut];
      }
    }
  }
}

void __37__PLBatteryAgent_logPowerOutDetails___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"PortIndex"];
  uint64_t v5 = [v4 intValue];

  if (v5 >= 8)
  {
    BOOL v6 = PLLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __37__PLBatteryAgent_logPowerOutDetails___block_invoke_cold_1();
    }
  }
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"PowerOut%d", v5);
  double v8 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:v7];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v8 withRawData:v3];
  double v10 = [v3 objectForKeyedSubscript:@"AccumulatorCount"];
  double v11 = (double)(int)[v10 intValue];
  [*(id *)(a1 + 32) prevAccumulatorCount];
  int v13 = (int)(v11 - v12);

  double v14 = [v3 objectForKeyedSubscript:@"AccumulatorErrorCount"];
  int v15 = [v14 intValue];
  [*(id *)(a1 + 32) prevAccumulatorErrorCount];
  double v17 = v16;

  uint64_t v18 = [v3 objectForKeyedSubscript:@"AccumulatedPower"];
  int v19 = [v18 intValue];
  [*(id *)(a1 + 32) prevAccumulatedPower];
  double v21 = v20;

  uint64_t v22 = *(void **)(a1 + 32);
  if (v13 < 0 || (int v23 = (int)((double)v15 - v17), v23 < 0) || (v24 = (int)((double)v19 - v21), v24 < 0))
  {
    [v22 setDeltaAccumulatorCount:0.0];
    [*(id *)(a1 + 32) setDeltaAccumulatorErrorCount:0.0];
    [*(id *)(a1 + 32) setDeltaAccumulatedPower:0.0];
    [*(id *)(a1 + 32) setPowerOutTotalCount:0.0];
    [*(id *)(a1 + 32) setPowerOutTotalPower:0.0];
  }
  else
  {
    [v22 prevAccumulatorCount];
    if (v25 > 0.0)
    {
      [*(id *)(a1 + 32) prevAccumulatedPower];
      if (v26 > 0.0)
      {
        [*(id *)(a1 + 32) setDeltaAccumulatorCount:(double)v13];
        [*(id *)(a1 + 32) setDeltaAccumulatorErrorCount:(double)v23];
        [*(id *)(a1 + 32) setDeltaAccumulatedPower:(double)v24];
      }
    }
  }
  double v27 = [v3 objectForKeyedSubscript:@"AccumulatorCount"];
  objc_msgSend(*(id *)(a1 + 32), "setPrevAccumulatorCount:", (double)(int)objc_msgSend(v27, "intValue"));

  double v28 = [v3 objectForKeyedSubscript:@"AccumulatorErrorCount"];
  objc_msgSend(*(id *)(a1 + 32), "setPrevAccumulatorErrorCount:", (double)(int)objc_msgSend(v28, "intValue"));

  BOOL v29 = [v3 objectForKeyedSubscript:@"AccumulatedPower"];
  objc_msgSend(*(id *)(a1 + 32), "setPrevAccumulatedPower:", (double)(int)objc_msgSend(v29, "intValue"));

  if (_os_feature_enabled_impl())
  {
    int v30 = [v3 objectForKeyedSubscript:@"FilteredPower"];
    objc_msgSend(*(id *)(a1 + 32), "setFilteredPower:", (double)(int)objc_msgSend(v30, "intValue"));

    double v31 = PLLogCommon();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      [*(id *)(a1 + 32) filteredPower];
      *(_DWORD *)buf = 134217984;
      uint64_t v34 = v32;
      _os_log_impl(&dword_1E4220000, v31, OS_LOG_TYPE_INFO, "Filtered Power: %f", buf, 0xCu);
    }

    [*(id *)(a1 + 32) accountUSBCPowerOut];
  }
  [*(id *)(a1 + 32) logEntry:v9];
}

- (void)logAdapterDetails:(id)a3
{
  if (!a3) {
    return;
  }
  id v4 = [a3 objectForKeyedSubscript:@"AdapterDetails"];
  if (v4)
  {
    id v12 = v4;
    uint64_t v5 = [v4 objectForKeyedSubscript:@"Watts"];
    uint64_t v6 = [v5 intValue];

    uint64_t v7 = [v12 objectForKeyedSubscript:@"Manufacturer"];
    double v8 = [(PLBatteryAgent *)self lastAdapterPower];

    if (!v8)
    {
      if (!v6) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    if (v6)
    {
      double v8 = [(PLBatteryAgent *)self lastAdapterPower];
      if ([v8 intValue] != v6)
      {

LABEL_17:
        [(PLBatteryAgent *)self logAdapterDetailsEntry:v12];
        goto LABEL_18;
      }
      if (!v7)
      {

LABEL_18:
        [(PLBatteryAgent *)self setLastAdapterManufacturer:v7];
        double v11 = [MEMORY[0x1E4F28ED0] numberWithInt:v6];
        [(PLBatteryAgent *)self setLastAdapterPower:v11];

        id v4 = v12;
        goto LABEL_19;
      }
    }
    else if (!v7)
    {
      goto LABEL_18;
    }
    uint64_t v9 = [(PLBatteryAgent *)self lastAdapterManufacturer];
    char v10 = [v9 isEqualToString:v7];

    if (v6) {
    if (v10)
    }
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_19:
}

- (void)logAdapterDetailsEntry:(id)a3
{
  id v23 = a3;
  id v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"AdapterDetails"];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4];
  uint64_t v6 = [v23 objectForKeyedSubscript:@"Watts"];
  uint64_t v7 = [v6 intValue];

  double v8 = [v23 objectForKeyedSubscript:@"Manufacturer"];
  uint64_t v9 = [v23 objectForKeyedSubscript:@"Model"];
  if (([(__CFString *)v8 isEqualToString:@"Apple, Inc"] & 1) != 0
    || [(__CFString *)v8 isEqualToString:@"Apple Inc."])
  {
    char v10 = v5;
    double v11 = v8;
  }
  else
  {
    double v11 = &stru_1F3FCA098;
    char v10 = v5;
  }
  [v10 setObject:v11 forKeyedSubscript:@"Manufacturer"];
  uint64_t v12 = [(__CFString *)v9 length];
  int v13 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  double v14 = [(__CFString *)v9 stringByTrimmingCharactersInSet:v13];
  int v15 = [v14 isEqualToString:&stru_1F3FCA098];

  if ([(__CFString *)v9 hasPrefix:@"0x"] && v12 == 6 && v15)
  {
    double v16 = v5;
    double v17 = v9;
  }
  else
  {
    double v17 = &stru_1F3FCA098;
    double v16 = v5;
  }
  [v16 setObject:v17 forKeyedSubscript:@"Model"];
  uint64_t v18 = [v23 objectForKeyedSubscript:@"IsWireless"];
  uint64_t v19 = [v18 BOOLValue];

  double v20 = [MEMORY[0x1E4F28ED0] numberWithBool:v19];
  [v5 setObject:v20 forKeyedSubscript:@"isWireless"];

  double v21 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
  [v5 setObject:v21 forKeyedSubscript:@"Watts"];

  uint64_t v22 = [v23 objectForKeyedSubscript:@"AdapterPowerTier"];
  [v5 setObject:v22 forKeyedSubscript:@"AdapterPowerTier"];

  [(PLOperator *)self logEntry:v5];
  [(PLBatteryAgent *)self logAdapterDetailsToCA:v5];
}

- (void)logAdapterDetailsToCA:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [v3 dictionary];
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1E4220000, v4, OS_LOG_TYPE_INFO, "Pushing AdapterDetails to CA: %@", buf, 0xCu);
  }
  uint64_t v7 = v3;
  id v6 = v3;
  AnalyticsSendEventLazy();
}

id __40__PLBatteryAgent_logAdapterDetailsToCA___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"Model"];
  [v2 setObject:v3 forKeyedSubscript:@"AdapterModel"];

  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"Manufacturer"];
  [v2 setObject:v4 forKeyedSubscript:@"Manufacturer"];

  uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"isWireless"];
  [v2 setObject:v5 forKeyedSubscript:@"isWireless"];

  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"Watts"];
  [v2 setObject:v6 forKeyedSubscript:@"Watts"];

  return v2;
}

- (void)flushPowerOut
{
}

- (void)accountUSBCPowerOut
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [a1 powerOutTotalCount];
  int v5 = 134217984;
  uint64_t v6 = v3;
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, a2, v4, "Count did not meet threshold: %f", (uint8_t *)&v5);
}

- (void)logFedDetails:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 objectForKeyedSubscript:@"FedDetails"];
    int v5 = v4;
    if (v4)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      _DWORD v6[2] = __32__PLBatteryAgent_logFedDetails___block_invoke;
      void v6[3] = &unk_1E6E4A5B8;
      v6[4] = self;
      [v4 enumerateObjectsUsingBlock:v6];
    }
  }
}

void __32__PLBatteryAgent_logFedDetails___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  int v5 = NSString;
  id v6 = a2;
  objc_msgSend(v5, "stringWithFormat:", @"USBCCharging%d", a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:v9];
  double v8 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v6];

  [*(id *)(a1 + 32) logEntry:v8];
}

- (void)logAuthFail:(id)a3
{
  id v3 = a3;
  CFMutableDictionaryRef v4 = IOServiceMatching("IOPMPowerSource");
  CFMutableDictionaryRef v5 = IOServiceMatching("AppleBatteryAuth");
  id v6 = v5;
  if (v5 && v4) {
    goto LABEL_7;
  }
  if (v5) {
    CFRelease(v5);
  }
  if (v4)
  {
    CFRelease(v4);
LABEL_7:
    CFDictionarySetValue(v6, @"IOParentMatch", v4);
    CFRelease(v4);
    goto LABEL_9;
  }
  CFDictionarySetValue(v6, @"IOParentMatch", 0);
LABEL_9:
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F92A00], "snapshotFromIOEntry:", IOServiceGetMatchingService(*MEMORY[0x1E4F2EF00], v6));
  double v8 = v7;
  if (v7)
  {
    id v9 = [v7 objectForKeyedSubscript:@"CommunicationError"];

    if (v9)
    {
      uint64_t v10 = [v8 objectForKeyedSubscript:@"CommunicationError"];
      [v3 setObject:v10 forKeyedSubscript:@"CommunicationError"];
    }
    double v11 = [v8 objectForKeyedSubscript:@"CoProcError"];

    if (v11)
    {
      uint64_t v12 = [v8 objectForKeyedSubscript:@"CoProcError"];
      [v3 setObject:v12 forKeyedSubscript:@"CoProcError"];
    }
    id v13 = v8;
    AnalyticsSendEventLazy();
  }
}

id __30__PLBatteryAgent_logAuthFail___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"CommunicationError"];
  [v2 setObject:v3 forKeyedSubscript:@"communication_error"];

  CFMutableDictionaryRef v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"CoProcError"];
  [v2 setObject:v4 forKeyedSubscript:@"coprocerror"];

  return v2;
}

- (void)logPortControllerInfo:(id)a3
{
  if (a3)
  {
    CFMutableDictionaryRef v4 = [a3 objectForKeyedSubscript:@"PortControllerInfo"];
    if (v4)
    {
      CFMutableDictionaryRef v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      id v6 = PLLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryAgent logPortControllerInfo:]();
      }

      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      void v12[2] = __40__PLBatteryAgent_logPortControllerInfo___block_invoke;
      void v12[3] = &unk_1E6E49100;
      id v7 = v5;
      id v13 = v7;
      double v14 = self;
      [v4 enumerateObjectsUsingBlock:v12];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __40__PLBatteryAgent_logPortControllerInfo___block_invoke_3;
      v9[3] = &unk_1E6E49100;
      id v10 = v7;
      double v11 = self;
      id v8 = v7;
      [v4 enumerateObjectsUsingBlock:v9];
    }
  }
}

void __40__PLBatteryAgent_logPortControllerInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  CFMutableDictionaryRef v5 = NSString;
  id v6 = a2;
  id v7 = objc_msgSend(v5, "stringWithFormat:", @"PortControllerInfo%d", a3);
  id v8 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:v7];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v8 withRawData:v6];
  id v10 = [v6 objectForKeyedSubscript:@"PortControllerPortPDO"];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __40__PLBatteryAgent_logPortControllerInfo___block_invoke_2;
  void v12[3] = &unk_1E6E4A5E0;
  id v13 = v9;
  id v11 = v9;
  [v10 enumerateObjectsUsingBlock:v12];

  [v11 setEntryDate:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) logEntry:v11];
  [*(id *)(a1 + 40) logPortControllerInfoToCA:v11 forPort:a3];
}

void __40__PLBatteryAgent_logPortControllerInfo___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  CFMutableDictionaryRef v5 = NSString;
  id v6 = a2;
  objc_msgSend(v5, "stringWithFormat:", @"PortControllerPortPDO%d", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

void __40__PLBatteryAgent_logPortControllerInfo___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"PortControllerBuffer%d", a3);
  id v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:v6];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withDate:*(void *)(a1 + 32)];
  id v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __40__PLBatteryAgent_logPortControllerInfo___block_invoke_3_cold_1((uint64_t *)(a1 + 32), v5, v9);
  }

  switch(a3)
  {
    case 0:
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = 432;
      goto LABEL_10;
    case 1:
      uint64_t v12 = *(void *)(a1 + 40);
      if (*(void *)(v12 + 432))
      {
        id v13 = *(void **)(v12 + 440);
        double v14 = [v5 objectForKeyedSubscript:@"PortControllerEvtBuffer"];
        LOBYTE(v13) = [v13 isEqualToData:v14];

        if (v13) {
          goto LABEL_15;
        }
      }
      uint64_t v15 = [v5 objectForKeyedSubscript:@"PortControllerEvtBuffer"];
      uint64_t v16 = *(void *)(a1 + 40);
      double v17 = *(void **)(v16 + 440);
      *(void *)(v16 + 440) = v15;
      goto LABEL_13;
    case 2:
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = 448;
      goto LABEL_10;
    case 3:
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = 456;
LABEL_10:
      uint64_t v18 = *(void **)(v10 + v11);
      if (v18)
      {
        uint64_t v19 = [v5 objectForKeyedSubscript:@"PortControllerEvtBuffer"];
        char v20 = [v18 isEqualToData:v19];

        if (v20) {
          goto LABEL_15;
        }
      }
      uint64_t v21 = [v5 objectForKeyedSubscript:@"PortControllerEvtBuffer"];
      uint64_t v22 = *(void *)(a1 + 40);
      double v17 = *(void **)(v22 + v11);
      *(void *)(v22 + v11) = v21;
LABEL_13:

LABEL_14:
      id v23 = [v5 objectForKeyedSubscript:@"PortControllerEvtBuffer"];
      [v8 setObject:v23 forKeyedSubscript:@"PortControllerEvtBuffer"];

      [*(id *)(a1 + 40) logEntry:v8];
LABEL_15:

      return;
    default:
      goto LABEL_14;
  }
}

- (void)logPortControllerInfoToCA:(id)a3 forPort:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_opt_new();
  id v7 = [v5 objectForKeyedSubscript:@"PortControllerBootFlags"];
  unsigned int v8 = [v7 unsignedShortValue];

  id v9 = [MEMORY[0x1E4F28ED0] numberWithInt:v8 & 0x1F];
  [v6 setObject:v9 forKeyedSubscript:@"DFUReason"];

  uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithInt:(v8 >> 5) & 1];
  [v6 setObject:v10 forKeyedSubscript:@"TrustEvalStatus"];

  uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithInt:(v8 >> 6) & 0x1F];
  [v6 setObject:v11 forKeyedSubscript:@"Img4DecodeStatus"];

  uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithInt:v8 >> 11];
  [v6 setObject:v12 forKeyedSubscript:@"Img4PropertyErrorCode"];

  id v13 = [v5 objectForKeyedSubscript:@"PortControllerPortMode"];
  [v6 setObject:v13 forKeyedSubscript:@"PortControllerPortMode"];

  double v14 = [v5 objectForKeyedSubscript:@"PortControllerSlpWakDisCause"];
  [v6 setObject:v14 forKeyedSubscript:@"PortControllerSlpWakDisCause"];

  uint64_t v15 = [v5 objectForKeyedSubscript:@"PortControllerSlpWakIsSleepEnabled"];

  [v6 setObject:v15 forKeyedSubscript:@"PortControllerSlpWakIsSleepEnabled"];
  uint64_t v16 = [MEMORY[0x1E4F28ED0] numberWithInt:v4];
  [v6 setObject:v16 forKeyedSubscript:@"PortIndex"];

  double v17 = PLLogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v21 = v4;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_1E4220000, v17, OS_LOG_TYPE_INFO, "Pushing PortControllerInfo metrics for port %d to CA: %@", buf, 0x12u);
  }

  uint64_t v19 = v6;
  id v18 = v6;
  AnalyticsSendEventLazy();
}

id __52__PLBatteryAgent_logPortControllerInfoToCA_forPort___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)logWatchdogDebugDumpToCA:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 objectForKeyedSubscript:@"BatteryData"];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"WatchdogDebugDump"];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F929C0] objectForKey:@"WatchdogDebugDump" ifNotSet:0];
    if (!v5 || ([v4 isEqualToData:v5] & 1) == 0)
    {
      id v6 = PLLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v9 = v4;
        _os_log_impl(&dword_1E4220000, v6, OS_LOG_TYPE_INFO, "pushing WatchDogDebug to CA :%@", buf, 0xCu);
      }

      id v7 = v4;
      AnalyticsSendEventLazy();
      [MEMORY[0x1E4F929C0] setObject:v7 forKey:@"WatchdogDebugDump" saveToDisk:1];
    }
  }
}

id __43__PLBatteryAgent_logWatchdogDebugDumpToCA___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v4 = @"reset_data";
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (void)handleGaugingMitigationStateCallback:(int)a3
{
  uint64_t state64 = 0;
  if (notify_get_state(a3, &state64))
  {
    uint64_t v4 = PLLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[PLBatteryAgent handleGaugingMitigationStateCallback:]();
    }
  }
  else if (state64)
  {
    [(PLBatteryAgent *)self logEventBackwardChargingLimit];
  }
}

- (void)handleMitigationStateCallback:(int)a3
{
  uint64_t state64 = 0;
  uint64_t state = notify_get_state(a3, &state64);
  if (state)
  {
    uint64_t v5 = state;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v6 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      uint64_t v15 = __48__PLBatteryAgent_handleMitigationStateCallback___block_invoke;
      uint64_t v16 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v17 = v6;
      if (handleMitigationStateCallback__defaultOnce != -1) {
        dispatch_once(&handleMitigationStateCallback__defaultOnce, &block);
      }
      if (handleMitigationStateCallback__classDebugEnabled)
      {
        id v7 = objc_msgSend(NSString, "stringWithFormat:", @"notify_get_state failed %d %s", v5, "com.apple.thermalmonitor.ageAwareMitigationState", block, v14, v15, v16, v17);
        unsigned int v8 = (void *)MEMORY[0x1E4F929B8];
        id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
        uint64_t v10 = [v9 lastPathComponent];
        uint64_t v11 = [NSString stringWithUTF8String:"-[PLBatteryAgent handleMitigationStateCallback:]"];
        [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:8941];

        uint64_t v12 = PLLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
  }
  else
  {
    [(PLBatteryAgent *)self logEventForwardMitigationStateWithState:state64 userDisabled:0];
  }
}

uint64_t __48__PLBatteryAgent_handleMitigationStateCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleMitigationStateCallback__classDebugEnabled = result;
  return result;
}

- (void)setMitigationStateDefault:(unint64_t)a3
{
  uint64_t v4 = [MEMORY[0x1E4F929C0] objectForKey:@"perfManagementState" ifNotSet:0];
  id v7 = v4;
  if (!v4 || (int)[v4 intValue] != a3)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F929C0];
    uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a3];
    [v5 setObject:v6 forKey:@"perfManagementState" saveToDisk:1];
  }
}

- (int)getMitigationDefaults
{
  +[PLUtilities containerPath];
  uint64_t v2 = (void *)_CFPreferencesCopyValueWithContainer();
  id v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (int)getBatteryHealthServiceState
{
  uint64_t v2 = (void *)IOPSCopyPowerSourcesByType();
  id v3 = v2;
  if (v2
    && [v2 count]
    && ([v3 objectAtIndexedSubscript:0],
        int v4 = objc_claimAutoreleasedReturnValue(),
        [v4 objectForKeyedSubscript:@"Battery Service State"],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    uint64_t v6 = [v3 objectAtIndexedSubscript:0];
    id v7 = [v6 objectForKeyedSubscript:@"Battery Service State"];
    int v8 = [v7 intValue];
  }
  else
  {
    int v8 = -1;
  }

  return v8;
}

- (int)getBatteryHealthServiceFlags
{
  uint64_t v2 = (void *)IOPSCopyPowerSourcesByType();
  id v3 = v2;
  if (v2
    && [v2 count]
    && ([v3 objectAtIndexedSubscript:0],
        int v4 = objc_claimAutoreleasedReturnValue(),
        [v4 objectForKeyedSubscript:@"Battery Service Flags"],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    uint64_t v6 = [v3 objectAtIndexedSubscript:0];
    id v7 = [v6 objectForKeyedSubscript:@"Battery Service Flags"];
    int v8 = [v7 intValue];
  }
  else
  {
    int v8 = 256;
  }

  return v8;
}

- (int)getBatteryMaximumCapacityPercent
{
  uint64_t v2 = (void *)IOPSCopyPowerSourcesByType();
  id v3 = v2;
  if (v2
    && [v2 count]
    && ([v3 objectAtIndexedSubscript:0],
        int v4 = objc_claimAutoreleasedReturnValue(),
        [v4 objectForKeyedSubscript:@"Maximum Capacity Percent"],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    uint64_t v6 = [v3 objectAtIndexedSubscript:0];
    id v7 = [v6 objectForKeyedSubscript:@"Maximum Capacity Percent"];
    int v8 = [v7 intValue];
  }
  else
  {
    int v8 = -1;
  }

  return v8;
}

- (id)getBatteryCalibration0Data
{
  uint64_t v2 = (void *)IOPSCopyPowerSourcesByType();
  id v3 = v2;
  if (v2
    && [v2 count]
    && ([v3 objectAtIndexedSubscript:0],
        int v4 = objc_claimAutoreleasedReturnValue(),
        [v4 objectForKeyedSubscript:@"calibration0"],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    uint64_t v6 = [v3 objectAtIndexedSubscript:0];
    id v7 = [v6 objectForKeyedSubscript:@"calibration0"];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)batterySerialChanged:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PLBatteryAgent_batterySerialChanged___block_invoke;
  block[3] = &unk_1E6E47848;
  id v9 = v3;
  uint64_t v4 = batterySerialChanged__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&batterySerialChanged__onceToken, block);
  }
  char v6 = batterySerialChanged__isNewBattery;

  return v6;
}

void __39__PLBatteryAgent_batterySerialChanged___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F929C0] objectForKey:@"BatterySerial" ifNotSet:&stru_1F3FCA098];
  uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"Serial"];
  uint64_t v4 = (void *)v3;
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  else {
    id v5 = &stru_1F3FCA098;
  }
  char v6 = v5;

  if (v2 && ([v2 isEqualToString:v6] & 1) != 0)
  {
    char v7 = 0;
  }
  else
  {
    char v7 = 1;
    [MEMORY[0x1E4F929C0] setObject:v6 forKey:@"BatterySerial" saveToDisk:1];
  }
  batterySerialChanged__isNewBattery = v7;
  int v8 = PLLogBH();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __39__PLBatteryAgent_batterySerialChanged___block_invoke_cold_1(v8, v9, v10);
  }
}

- (id)overrideBatteryData:(id)a3 withPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    char v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v6];
    int v8 = PLLogBH();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v9) {
        -[PLBatteryAgent overrideBatteryData:withPath:].cold.4();
      }

      uint64_t v10 = [v7 objectForKey:@"iopm"];
      uint64_t v11 = v10;
      if (v10 && [v10 intValue] == -1)
      {
        uint64_t v12 = PLLogBH();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[PLBatteryAgent overrideBatteryData:withPath:]();
        }
        id v18 = 0;
      }
      else
      {
        uint64_t v38 = v11;
        uint64_t v12 = [v5 mutableCopy];
        id v13 = [v5 objectForKey:@"BatteryData"];
        uint64_t v14 = (void *)[v13 mutableCopy];

        uint64_t v15 = [v14 objectForKey:@"LifetimeData"];
        double v40 = (void *)[v15 mutableCopy];

        uint64_t v16 = [v7 objectForKey:@"MaximumRa0-8"];
        uint64_t v17 = v16;
        if (v16)
        {
          if ([v16 intValue] == -1) {
            [v40 removeObjectForKey:@"MaximumRa0-8"];
          }
          else {
            [v40 setObject:v17 forKeyedSubscript:@"MaximumRa0-8"];
          }
        }
        [v14 setObject:v40 forKey:@"LifetimeData"];
        uint64_t v19 = [v7 objectForKey:@"WeightedRa"];
        char v20 = v19;
        if (v19)
        {
          if ([v19 intValue] == -1) {
            [v14 removeObjectForKey:@"WeightedRa"];
          }
          else {
            [v14 setObject:v20 forKeyedSubscript:@"WeightedRa"];
          }
        }
        int v21 = [v7 objectForKey:@"ChemID"];
        __int16 v22 = v21;
        if (v21)
        {
          if ([v21 intValue] == -1) {
            [v14 removeObjectForKey:@"ChemID"];
          }
          else {
            [v14 setObject:v22 forKeyedSubscript:@"ChemID"];
          }
        }
        id v39 = [v7 objectForKey:@"DesignCapacity"];
        if (v39)
        {
          if ([v39 intValue] == -1) {
            [v14 removeObjectForKey:@"DesignCapacity"];
          }
          else {
            [v14 setObject:v39 forKeyedSubscript:@"DesignCapacity"];
          }
        }
        int64_t v37 = v17;
        [v12 setObject:v14 forKey:@"BatteryData"];
        id v23 = [v7 objectForKey:@"NominalChargeCapacity"];
        uint64_t v24 = v23;
        if (v23)
        {
          if ([v23 intValue] == -1) {
            [v12 removeObjectForKey:@"NominalChargeCapacity"];
          }
          else {
            [v12 setObject:v24 forKeyedSubscript:@"NominalChargeCapacity"];
          }
        }
        char v36 = v20;
        double v25 = [v7 objectForKey:@"BatteryCellDisconnectCount"];
        double v26 = v25;
        if (v25)
        {
          if ([v25 intValue] == -1) {
            [v12 removeObjectForKey:@"BatteryCellDisconnectCount"];
          }
          else {
            [v12 setObject:v26 forKeyedSubscript:@"BatteryCellDisconnectCount"];
          }
        }
        uint64_t v35 = v22;
        double v27 = [v7 objectForKey:@"Serial"];
        double v28 = v27;
        if (v27)
        {
          if ([v27 intValue] == -1) {
            [v12 removeObjectForKey:@"Serial"];
          }
          else {
            [v12 setObject:v28 forKeyedSubscript:@"Serial"];
          }
        }
        BOOL v29 = [v7 objectForKey:@"mitigatedUPOCount"];
        int v30 = v29;
        if (v29)
        {
          if ([v29 intValue] == -1)
          {
            double v31 = self;
            uint64_t v32 = 0;
          }
          else
          {
            double v31 = self;
            uint64_t v32 = v30;
          }
          [(PLBatteryAgent *)v31 setMitigatedUPOCount:v32];
        }
        id v33 = PLLogBH();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          -[PLBatteryAgent overrideBatteryData:withPath:]();
        }

        id v18 = [v12 copy];
        uint64_t v11 = v38;
      }
    }
    else
    {
      if (v9) {
        -[PLBatteryAgent overrideBatteryData:withPath:]();
      }

      id v18 = v5;
    }
  }
  else
  {
    id v18 = v5;
  }

  return v18;
}

- (int)deviceType
{
  int v2 = [MEMORY[0x1E4F92A38] kPLDeviceClass];
  if ([MEMORY[0x1E4F929C0] objectExistsForKey:@"overrideDeviceType"])
  {
    int v2 = [MEMORY[0x1E4F929C0] longForKey:@"overrideDeviceType"];
    uint64_t v3 = PLLogBH();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[PLBatteryAgent deviceType]();
    }
  }
  return v2;
}

- (void)initCameraStreamingIntervalTracking
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  [(PLBatteryAgent *)self setupAVSystemController];
  uint64_t v3 = [(PLBatteryAgent *)self avSystemController];
  uint64_t v4 = [v3 attributeForKey:*MEMORY[0x1E4F74F10]];
  -[PLBatteryAgent setCameraStreamingActive:](self, "setCameraStreamingActive:", [v4 BOOLValue]);

  id v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v35 = [(PLBatteryAgent *)self cameraStreamingActive];
    _os_log_impl(&dword_1E4220000, v5, OS_LOG_TYPE_INFO, "Init Camera Streaming Active: %d", buf, 8u);
  }

  id v6 = (uint64_t *)MEMORY[0x1E4F74E28];
  char v7 = (uint64_t *)MEMORY[0x1E4F74F20];
  uint64_t v8 = *MEMORY[0x1E4F74F20];
  v33[0] = *MEMORY[0x1E4F74E28];
  v33[1] = v8;
  BOOL v9 = (uint64_t *)MEMORY[0x1E4F74BF8];
  void v33[2] = *MEMORY[0x1E4F74BF8];
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  if (v10)
  {
    uint64_t v11 = [(PLBatteryAgent *)self avSystemController];
    [v11 setAttribute:v10 forKey:*MEMORY[0x1E4F74EB0] error:0];

    uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v13 = *v6;
    uint64_t v14 = [(PLBatteryAgent *)self avSystemController];
    [v12 addObserver:self selector:sel_setupAVSystemController name:v13 object:v14];

    uint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v16 = *v7;
    uint64_t v17 = [(PLBatteryAgent *)self avSystemController];
    [v15 addObserver:self selector:sel_handleCameraStreamingLogging_ name:v16 object:v17];

    id v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v19 = *v9;
    char v20 = [(PLBatteryAgent *)self avSystemController];
    [v18 addObserver:self selector:sel_handleHeadphoneConnected_ name:v19 object:v20];

    int v21 = [(PLBatteryAgent *)self avSystemController];
    __int16 v22 = [v21 attributeForKey:*MEMORY[0x1E4F74BE8]];
    [(PLBatteryAgent *)self setHeadphonesConnected:[v22 BOOLValue]];
LABEL_5:

    goto LABEL_12;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v23 = objc_opt_class();
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    int v30 = __53__PLBatteryAgent_initCameraStreamingIntervalTracking__block_invoke;
    double v31 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v32 = v23;
    if (initCameraStreamingIntervalTracking_defaultOnce != -1) {
      dispatch_once(&initCameraStreamingIntervalTracking_defaultOnce, &v28);
    }
    if (initCameraStreamingIntervalTracking_classDebugEnabled)
    {
      int v21 = objc_msgSend(NSString, "stringWithFormat:", @"No AV System Controller Notifications", v28, v29, v30, v31, v32);
      uint64_t v24 = (void *)MEMORY[0x1E4F929B8];
      double v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      double v26 = [v25 lastPathComponent];
      double v27 = [NSString stringWithUTF8String:"-[PLBatteryAgent initCameraStreamingIntervalTracking]"];
      [v24 logMessage:v21 fromFile:v26 fromFunction:v27 fromLineNumber:9245];

      __int16 v22 = PLLogCommon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
      goto LABEL_5;
    }
  }
LABEL_12:
}

uint64_t __53__PLBatteryAgent_initCameraStreamingIntervalTracking__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  initCameraStreamingIntervalTracking_classDebugEnabled = result;
  return result;
}

- (void)setupAVSystemController
{
  uint64_t v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v3, OS_LOG_TYPE_INFO, "Setting up AV System Controller", buf, 2u);
  }

  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v5 = *MEMORY[0x1E4F74E28];
  id v6 = [(PLBatteryAgent *)self avSystemController];
  [v4 removeObserver:self name:v5 object:v6];

  char v7 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  [(PLBatteryAgent *)self setAvSystemController:v7];

  uint64_t v8 = [(PLBatteryAgent *)self avSystemController];

  if (!v8 && [MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__PLBatteryAgent_setupAVSystemController__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v9;
    if (setupAVSystemController_defaultOnce != -1) {
      dispatch_once(&setupAVSystemController_defaultOnce, block);
    }
    if (setupAVSystemController_classDebugEnabled)
    {
      uint64_t v10 = [NSString stringWithFormat:@"AV System Controller not available"];
      uint64_t v11 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      uint64_t v13 = [v12 lastPathComponent];
      uint64_t v14 = [NSString stringWithUTF8String:"-[PLBatteryAgent setupAVSystemController]"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:9261];

      uint64_t v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __41__PLBatteryAgent_setupAVSystemController__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  setupAVSystemController_classDebugEnabled = result;
  return result;
}

- (void)handleCameraStreamingLogging:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412290;
    id v16 = v4;
    _os_log_impl(&dword_1E4220000, v5, OS_LOG_TYPE_INFO, "received notification: %@\n", (uint8_t *)&v15, 0xCu);
  }

  id v6 = [v4 userInfo];
  char v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 objectForKey:*MEMORY[0x1E4F74F38]];
    uint64_t v9 = v8;
    if (v8)
    {
      [(PLBatteryAgent *)self setCameraStreamingActive:[v8 BOOLValue]];
      uint64_t v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        BOOL v11 = [(PLBatteryAgent *)self cameraStreamingActive];
        int v15 = 67109120;
        LODWORD(v16) = v11;
        uint64_t v12 = "cameraStreamingActive: %d\n";
        uint64_t v13 = v10;
        uint32_t v14 = 8;
LABEL_11:
        _os_log_impl(&dword_1E4220000, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v15, v14);
      }
    }
    else
    {
      uint64_t v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        id v16 = v7;
        uint64_t v12 = "userInfo misses feature status:%@\n";
        uint64_t v13 = v10;
        uint32_t v14 = 12;
        goto LABEL_11;
      }
    }

    goto LABEL_13;
  }
  uint64_t v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412290;
    id v16 = v4;
    _os_log_impl(&dword_1E4220000, v9, OS_LOG_TYPE_INFO, "notification misses userInfo dict:%@\n", (uint8_t *)&v15, 0xCu);
  }
LABEL_13:
}

- (void)handleHeadphoneConnected:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(PLBatteryAgent *)self flushPowerOut];
  id v4 = [(PLBatteryAgent *)self avSystemController];
  uint64_t v5 = [v4 attributeForKey:*MEMORY[0x1E4F74BE8]];
  -[PLBatteryAgent setHeadphonesConnected:](self, "setHeadphonesConnected:", [v5 BOOLValue]);

  id v6 = PLLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = [(PLBatteryAgent *)self headphonesConnected];
    _os_log_impl(&dword_1E4220000, v6, OS_LOG_TYPE_INFO, "headphones connected = %d", (uint8_t *)v7, 8u);
  }
}

- (void)handleCameraStreaming:(BOOL)a3 withProperties:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  char v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v24[0]) = 0;
    _os_log_impl(&dword_1E4220000, v7, OS_LOG_TYPE_INFO, "Start Camera Streaming Interval Tracking Section", (uint8_t *)v24, 2u);
  }

  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = [(PLBatteryAgent *)self cameraStreamingActive];
    v24[0] = 67109120;
    v24[1] = v9;
    _os_log_impl(&dword_1E4220000, v8, OS_LOG_TYPE_INFO, "Camera Streaming State: %d", (uint8_t *)v24, 8u);
  }

  if (![(PLBatteryAgent *)self cameraStreamingActive] || !a3)
  {
    id v18 = PLLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24[0]) = 0;
      _os_log_impl(&dword_1E4220000, v18, OS_LOG_TYPE_INFO, "Camera Streaming not active OR device not plugged in", (uint8_t *)v24, 2u);
    }

    uint64_t v19 = [v6 entryDate];
    [(PLBatteryAgent *)self updateIntervalForType:4 withState:0 andTime:v19];

    int v15 = [v6 entryDate];
    id v16 = self;
    uint64_t v17 = 6;
    goto LABEL_14;
  }
  BOOL v10 = [(PLBatteryAgent *)self tlcIncreased];
  BOOL v11 = PLLogCommon();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v12)
    {
      LOWORD(v24[0]) = 0;
      _os_log_impl(&dword_1E4220000, v11, OS_LOG_TYPE_INFO, "Open WTLC, close TLC, close camera streaming", (uint8_t *)v24, 2u);
    }

    uint64_t v13 = [v6 entryDate];
    [(PLBatteryAgent *)self updateIntervalForType:6 withState:1 andTime:v13];

    uint32_t v14 = [v6 entryDate];
    [(PLBatteryAgent *)self updateIntervalForType:4 withState:0 andTime:v14];

    int v15 = [v6 entryDate];
    id v16 = self;
    uint64_t v17 = 3;
LABEL_14:
    uint64_t v20 = 0;
LABEL_15:
    [(PLBatteryAgent *)v16 updateIntervalForType:v17 withState:v20 andTime:v15];

    goto LABEL_16;
  }
  if (v12)
  {
    LOWORD(v24[0]) = 0;
    _os_log_impl(&dword_1E4220000, v11, OS_LOG_TYPE_INFO, "Close WTLC, close TLC, open camera streaming", (uint8_t *)v24, 2u);
  }

  int v21 = [v6 entryDate];
  [(PLBatteryAgent *)self updateIntervalForType:6 withState:0 andTime:v21];

  __int16 v22 = [v6 entryDate];
  [(PLBatteryAgent *)self updateIntervalForType:3 withState:0 andTime:v22];

  [(PLBatteryAgent *)self batteryLevelPercent];
  if (v23 >= 75.0)
  {
    int v15 = [v6 entryDate];
    id v16 = self;
    uint64_t v17 = 4;
    uint64_t v20 = 1;
    goto LABEL_15;
  }
LABEL_16:
}

- (void)initSmartChargingLogging
{
  if (+[PLBatteryAgent supportsSmartCharging]
    || +[PLBatteryAgent supportsFixedLimitCharging])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__PLBatteryAgent_initSmartChargingLogging__block_invoke;
    void v8[3] = &unk_1E6E47740;
    v8[4] = self;
    id v4 = (PLXPCListenerOperatorComposition *)[v3 initWithOperator:self withRegistration:&unk_1F4011888 withBlock:v8];
    smartChargingListener = self->_smartChargingListener;
    self->_smartChargingListener = v4;

    dispatch_time_t v6 = dispatch_time(0, 60000000000);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    _DWORD v7[2] = __42__PLBatteryAgent_initSmartChargingLogging__block_invoke_5419;
    void v7[3] = &unk_1E6E47848;
    void v7[4] = self;
    dispatch_after(v6, MEMORY[0x1E4F14428], v7);
  }
}

void __42__PLBatteryAgent_initSmartChargingLogging__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __42__PLBatteryAgent_initSmartChargingLogging__block_invoke_2;
    uint64_t v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (kPLBatteryAgentStringUserType_block_invoke_11_defaultOnce != -1) {
      dispatch_once(&kPLBatteryAgentStringUserType_block_invoke_11_defaultOnce, &block);
    }
    if (kPLBatteryAgentStringUserType_block_invoke_11_classDebugEnabled)
    {
      uint64_t v8 = [NSString stringWithFormat:@"Smart Charging Callback %@", v6, block, v15, v16, v17, v18];
      BOOL v9 = (void *)MEMORY[0x1E4F929B8];
      BOOL v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      BOOL v11 = [v10 lastPathComponent];
      BOOL v12 = [NSString stringWithUTF8String:"-[PLBatteryAgent initSmartChargingLogging]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:9348];

      uint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  [*(id *)(a1 + 32) logEventForwardSmartChargingWithPayload:v6];
}

uint64_t __42__PLBatteryAgent_initSmartChargingLogging__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLBatteryAgentStringUserType_block_invoke_11_classDebugEnabled = result;
  return result;
}

void __42__PLBatteryAgent_initSmartChargingLogging__block_invoke_5419()
{
  uint32_t v0 = notify_post("com.apple.perfpowerservices.reportobcanalytics");
  int v1 = [MEMORY[0x1E4F929C0] debugEnabled];
  if (v0)
  {
    if (v1)
    {
      uint64_t v2 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__PLBatteryAgent_initSmartChargingLogging__block_invoke_2_5421;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v2;
      if (kPLBatteryAgentStringUserType_block_invoke_12_defaultOnce != -1) {
        dispatch_once(&kPLBatteryAgentStringUserType_block_invoke_12_defaultOnce, block);
      }
      if (kPLBatteryAgentStringUserType_block_invoke_12_classDebugEnabled)
      {
        id v3 = objc_msgSend(NSString, "stringWithFormat:", @"failed to post %s", "com.apple.perfpowerservices.reportobcanalytics");
        id v4 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
        id v6 = [v5 lastPathComponent];
        uint64_t v7 = [NSString stringWithUTF8String:"-[PLBatteryAgent initSmartChargingLogging]_block_invoke"];
        [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:9356];

        uint64_t v8 = PLLogCommon();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
LABEL_14:
      }
    }
  }
  else if (v1)
  {
    uint64_t v9 = objc_opt_class();
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __42__PLBatteryAgent_initSmartChargingLogging__block_invoke_5427;
    void v14[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void v14[4] = v9;
    if (kPLBatteryAgentStringUserType_block_invoke_12_defaultOnce_5425 != -1) {
      dispatch_once(&kPLBatteryAgentStringUserType_block_invoke_12_defaultOnce_5425, v14);
    }
    if (kPLBatteryAgentStringUserType_block_invoke_12_classDebugEnabled_5426)
    {
      id v3 = objc_msgSend(NSString, "stringWithFormat:", @"posted %s", "com.apple.perfpowerservices.reportobcanalytics");
      BOOL v10 = (void *)MEMORY[0x1E4F929B8];
      BOOL v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      BOOL v12 = [v11 lastPathComponent];
      uint64_t v13 = [NSString stringWithUTF8String:"-[PLBatteryAgent initSmartChargingLogging]_block_invoke_2"];
      [v10 logMessage:v3 fromFile:v12 fromFunction:v13 fromLineNumber:9358];

      uint64_t v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
      goto LABEL_14;
    }
  }
}

uint64_t __42__PLBatteryAgent_initSmartChargingLogging__block_invoke_2_5421(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLBatteryAgentStringUserType_block_invoke_12_classDebugEnabled = result;
  return result;
}

uint64_t __42__PLBatteryAgent_initSmartChargingLogging__block_invoke_5427(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLBatteryAgentStringUserType_block_invoke_12_classDebugEnabled_5426 = result;
  return result;
}

- (void)initCleanEnergyChargingLogging
{
  if (+[PLBatteryAgent supportsCleanEnergyCharging])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __48__PLBatteryAgent_initCleanEnergyChargingLogging__block_invoke;
    void v6[3] = &unk_1E6E47740;
    v6[4] = self;
    id v4 = (PLXPCListenerOperatorComposition *)[v3 initWithOperator:self withRegistration:&unk_1F40118B0 withBlock:v6];
    cleanEnergyChargingListener = self->_cleanEnergyChargingListener;
    self->_cleanEnergyChargingListener = v4;
  }
}

void __48__PLBatteryAgent_initCleanEnergyChargingLogging__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __48__PLBatteryAgent_initCleanEnergyChargingLogging__block_invoke_2;
    uint64_t v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (kPLBatteryAgentStringUserType_block_invoke_13_defaultOnce != -1) {
      dispatch_once(&kPLBatteryAgentStringUserType_block_invoke_13_defaultOnce, &block);
    }
    if (kPLBatteryAgentStringUserType_block_invoke_13_classDebugEnabled)
    {
      uint64_t v8 = [NSString stringWithFormat:@"Clean Energy Charging Callback %@", v6, block, v15, v16, v17, v18];
      uint64_t v9 = (void *)MEMORY[0x1E4F929B8];
      BOOL v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m"];
      BOOL v11 = [v10 lastPathComponent];
      BOOL v12 = [NSString stringWithUTF8String:"-[PLBatteryAgent initCleanEnergyChargingLogging]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:9387];

      uint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  [*(id *)(a1 + 32) logEventForwardCleanEnergyChargingWithPayload:v6];
}

uint64_t __48__PLBatteryAgent_initCleanEnergyChargingLogging__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLBatteryAgentStringUserType_block_invoke_13_classDebugEnabled = result;
  return result;
}

- (void)initializeChargingStateIntervals
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v3, OS_LOG_TYPE_INFO, "Initializing Camera Streaming Interval Tracking", buf, 2u);
  }

  [(PLBatteryAgent *)self initCameraStreamingIntervalTracking];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  [(PLBatteryAgent *)self setOpenChargingIntervals:v4];

  uint64_t v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  id v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"Charging"];
  [(PLBatteryAgent *)self setChargingIntervalsEntryKey:v6];

  uint64_t v7 = 0;
  int v30 = v5;
  do
  {
    uint64_t v8 = [NSString stringWithFormat:@"%@=%d", @"intervalType", v7];
    uint64_t v9 = [(PLOperator *)self storage];
    BOOL v10 = [(PLBatteryAgent *)self chargingIntervalsEntryKey];
    v43[0] = v8;
    BOOL v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
    BOOL v12 = [v9 lastEntryForKey:v10 withFilters:v11];

    if (!v12)
    {
      uint32_t v14 = PLLogCommon();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)uint64_t v42 = v7;
      uint64_t v15 = v14;
      id v16 = "no previous %d interval";
      uint32_t v17 = 8;
      goto LABEL_25;
    }
    uint64_t v13 = [v12 objectForKeyedSubscript:@"timestampEnd"];

    if (v13)
    {
      uint32_t v14 = PLLogCommon();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)uint64_t v42 = v7;
      *(_WORD *)&v42[4] = 2112;
      *(void *)&v42[6] = v12;
      uint64_t v15 = v14;
      id v16 = "last %d interval closed: %@";
      uint32_t v17 = 18;
LABEL_25:
      _os_log_debug_impl(&dword_1E4220000, v15, OS_LOG_TYPE_DEBUG, v16, buf, v17);
      goto LABEL_9;
    }
    switch((unsigned __int16)v7)
    {
      case 6u:
        [v12 setObject:v5 forKeyedSubscript:@"timestampEnd"];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        void v32[2] = __50__PLBatteryAgent_initializeChargingStateIntervals__block_invoke_5445;
        v32[3] = &unk_1E6E4B718;
        __int16 v34 = 6;
        id v33 = v12;
        [(PLOperator *)self updateEntry:v33 withBlock:v32];
        uint32_t v14 = v33;
        break;
      case 4u:
        [v12 setObject:v5 forKeyedSubscript:@"timestampEnd"];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        void v35[2] = __50__PLBatteryAgent_initializeChargingStateIntervals__block_invoke_5444;
        v35[3] = &unk_1E6E4B718;
        __int16 v37 = 4;
        uint64_t v36 = v12;
        [(PLOperator *)self updateEntry:v36 withBlock:v35];
        uint32_t v14 = v36;
        break;
      case 3u:
        [v12 setObject:v5 forKeyedSubscript:@"timestampEnd"];
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        void v38[2] = __50__PLBatteryAgent_initializeChargingStateIntervals__block_invoke;
        v38[3] = &unk_1E6E4B718;
        __int16 v40 = 3;
        id v39 = v12;
        [(PLOperator *)self updateEntry:v39 withBlock:v38];
        uint32_t v14 = v39;
        break;
      default:
        uint64_t v18 = PLLogCommon();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)uint64_t v42 = v7;
          *(_WORD *)&v42[4] = 2112;
          *(void *)&v42[6] = v12;
          _os_log_debug_impl(&dword_1E4220000, v18, OS_LOG_TYPE_DEBUG, "open %d interval %@", buf, 0x12u);
        }

        uint64_t v19 = [(PLBatteryAgent *)self openChargingIntervals];
        uint64_t v20 = [MEMORY[0x1E4F28ED0] numberWithShort:(__int16)v7];
        int v21 = [v19 objectForKeyedSubscript:v20];

        if (v21)
        {
          __int16 v22 = PLLogCommon();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)uint64_t v42 = v7;
            _os_log_error_impl(&dword_1E4220000, v22, OS_LOG_TYPE_ERROR, "multiple open %d intervals", buf, 8u);
          }
        }
        uint32_t v14 = [(PLBatteryAgent *)self openChargingIntervals];
        double v23 = [MEMORY[0x1E4F28ED0] numberWithShort:(__int16)v7];
        [v14 setObject:v12 forKeyedSubscript:v23];

        uint64_t v5 = v30;
        break;
    }
LABEL_9:

    uint64_t v7 = (v7 + 1);
  }
  while (v7 != 10);
  uint64_t v24 = PLLogCommon();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = [(PLBatteryAgent *)self openChargingIntervals];
    uint64_t v26 = [v25 count];
    *(_DWORD *)buf = 134217984;
    *(void *)uint64_t v42 = v26;
    _os_log_impl(&dword_1E4220000, v24, OS_LOG_TYPE_DEFAULT, "initialized charging interval tracking, %lu open", buf, 0xCu);

    uint64_t v5 = v30;
  }

  [(PLBatteryAgent *)self setTLCOverrideValue:0];
  if ([MEMORY[0x1E4F92A38] internalBuild])
  {
    id v27 = objc_alloc(MEMORY[0x1E4F929A0]);
    uint64_t v28 = [(PLOperator *)self workQueue];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __50__PLBatteryAgent_initializeChargingStateIntervals__block_invoke_5449;
    void v31[3] = &unk_1E6E47908;
    void v31[4] = self;
    uint64_t v29 = (void *)[v27 initWithWorkQueue:v28 forNotification:@"com.apple.powerlogd.tlc.override" requireState:1 withBlock:v31];
    [(PLBatteryAgent *)self setTlcOverrideNotification:v29];

    uint64_t v5 = v30;
  }
}

void __50__PLBatteryAgent_initializeChargingStateIntervals__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(__int16 *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 32);
    v5[0] = 67109378;
    v5[1] = v3;
    __int16 v6 = 2112;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1E4220000, v2, OS_LOG_TYPE_INFO, "closed %d interval at init: %@", (uint8_t *)v5, 0x12u);
  }
}

void __50__PLBatteryAgent_initializeChargingStateIntervals__block_invoke_5444(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(__int16 *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 32);
    v5[0] = 67109378;
    v5[1] = v3;
    __int16 v6 = 2112;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1E4220000, v2, OS_LOG_TYPE_INFO, "closed %d interval at init: %@", (uint8_t *)v5, 0x12u);
  }
}

void __50__PLBatteryAgent_initializeChargingStateIntervals__block_invoke_5445(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(__int16 *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 32);
    v5[0] = 67109378;
    v5[1] = v3;
    __int16 v6 = 2112;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1E4220000, v2, OS_LOG_TYPE_INFO, "closed %d interval at init: %@", (uint8_t *)v5, 0x12u);
  }
}

void __50__PLBatteryAgent_initializeChargingStateIntervals__block_invoke_5449(uint64_t a1, void *a2)
{
  int v3 = objc_msgSend(a2, "objectForKeyedSubscript:");
  if ([v3 intValue] == -1)
  {
    uint64_t v7 = PLLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __50__PLBatteryAgent_initializeChargingStateIntervals__block_invoke_5449_cold_1();
    }

    [*(id *)(a1 + 32) setTLCOverrideValue:0];
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v4 = (id *)(a1 + 32);
    [v5 setTLCOverrideValue:v3];
    __int16 v6 = PLLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __50__PLBatteryAgent_initializeChargingStateIntervals__block_invoke_5449_cold_2(v4, v6);
    }
  }
}

- (void)updateIntervalForType:(signed __int16)a3 withState:(BOOL)a4 andTime:(id)a5
{
}

- (void)updateIntervalForType:(signed __int16)a3 withState:(BOOL)a4 andTime:(id)a5 selectedChargedLimit:(id)a6
{
  BOOL v7 = a4;
  uint64_t v8 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  BOOL v12 = PLLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    int v40 = v8;
    __int16 v41 = 1024;
    int v42 = v7;
    _os_log_impl(&dword_1E4220000, v12, OS_LOG_TYPE_DEFAULT, "intervalType=%d state=%d", buf, 0xEu);
  }

  uint64_t v13 = [(PLBatteryAgent *)self openChargingIntervals];

  if (v13)
  {
    uint32_t v14 = [(PLBatteryAgent *)self openChargingIntervals];
    uint64_t v15 = [MEMORY[0x1E4F28ED0] numberWithShort:v8];
    id v16 = [v14 objectForKeyedSubscript:v15];

    if (v10)
    {
      if (v7)
      {
LABEL_6:
        if (v16)
        {
          uint32_t v17 = PLLogCommon();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            int v40 = v8;
            _os_log_impl(&dword_1E4220000, v17, OS_LOG_TYPE_INFO, "%d interval is already open", buf, 8u);
          }

          goto LABEL_29;
        }
        uint64_t v26 = [(PLBatteryAgent *)self openChargingIntervals];
        id v27 = [v26 objectForKeyedSubscript:&unk_1F400DF78];

        if (v8 != 3 || !v27)
        {
          id v30 = objc_alloc(MEMORY[0x1E4F929D0]);
          double v31 = [(PLBatteryAgent *)self chargingIntervalsEntryKey];
          id v16 = (void *)[v30 initWithEntryKey:v31 withDate:v10];

          uint64_t v32 = [MEMORY[0x1E4F28ED0] numberWithShort:v8];
          [v16 setObject:v32 forKeyedSubscript:@"intervalType"];

          if (v8 == 8 && v11) {
            [v16 setObject:v11 forKeyedSubscript:@"chargeLimitTargetSoC"];
          }
          id v33 = [(PLBatteryAgent *)self openChargingIntervals];
          __int16 v34 = [MEMORY[0x1E4F28ED0] numberWithShort:v8];
          [v33 setObject:v16 forKeyedSubscript:v34];

          [(PLOperator *)self logEntry:v16];
          BOOL v35 = PLLogCommon();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            int v40 = v8;
            _os_log_impl(&dword_1E4220000, v35, OS_LOG_TYPE_DEFAULT, "opened %d interval", buf, 8u);
          }

          if (v8 == 3)
          {
            uint64_t v36 = [v16 entryDate];
            [(PLBatteryAgent *)self setLastTLCEntryStartTime:v36];
          }
          goto LABEL_29;
        }
        uint64_t v28 = PLLogCommon();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109376;
          int v40 = 6;
          __int16 v41 = 1024;
          int v42 = 3;
          _os_log_impl(&dword_1E4220000, v28, OS_LOG_TYPE_INFO, "%d interval is already open, not opening a %d interval", buf, 0xEu);
        }

LABEL_28:
        id v16 = 0;
LABEL_29:

        goto LABEL_30;
      }
    }
    else
    {
      uint64_t v18 = PLLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[PLBatteryAgent updateIntervalForType:withState:andTime:selectedChargedLimit:]();
      }

      id v10 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      if (v7) {
        goto LABEL_6;
      }
    }
    if (v16)
    {
      uint64_t v19 = [v16 entryDate];
      uint64_t v20 = [v19 laterDate:v10];
      int v21 = [v16 entryDate];

      if (v20 == v21)
      {
        __int16 v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[PLBatteryAgent updateIntervalForType:withState:andTime:selectedChargedLimit:]();
        }

        uint64_t v23 = [MEMORY[0x1E4F1C9C8] monotonicDate];

        id v10 = (id)v23;
      }
      [v16 setObject:v10 forKeyedSubscript:@"timestampEnd"];
      uint64_t v24 = [(PLBatteryAgent *)self openChargingIntervals];
      uint64_t v25 = [MEMORY[0x1E4F28ED0] numberWithShort:v8];
      [v24 setObject:0 forKeyedSubscript:v25];

      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      void v37[2] = __79__PLBatteryAgent_updateIntervalForType_withState_andTime_selectedChargedLimit___block_invoke;
      void v37[3] = &__block_descriptor_34_e5_v8__0l;
      __int16 v38 = v8;
      [(PLOperator *)self updateEntry:v16 withBlock:v37];
      if (v8 == 3) {
        [(PLBatteryAgent *)self setLastTLCEntryStartTime:0];
      }
      goto LABEL_29;
    }
    uint64_t v29 = PLLogCommon();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v40 = v8;
      _os_log_impl(&dword_1E4220000, v29, OS_LOG_TYPE_INFO, "failed to find open %d interval", buf, 8u);
    }

    goto LABEL_28;
  }
LABEL_30:
}

void __79__PLBatteryAgent_updateIntervalForType_withState_andTime_selectedChargedLimit___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(__int16 *)(a1 + 32);
    v4[0] = 67109120;
    v4[1] = v3;
    _os_log_impl(&dword_1E4220000, v2, OS_LOG_TYPE_DEFAULT, "closed %d interval", (uint8_t *)v4, 8u);
  }
}

- (BOOL)shouldLogCPMSSnapshotWithReason:(unsigned __int8)a3 withTrigger:(int64_t)a4
{
  if (a4) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = a3 == 0;
  }
  if (a4 == 1) {
    return a3 != 0;
  }
  else {
    return v4;
  }
}

- (void)logCPMSSnapshotWithTrigger:(int64_t)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  BOOL v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = a3;
    _os_log_impl(&dword_1E4220000, v4, OS_LOG_TYPE_INFO, "cpms: getting snapshots with trigger 0x%X", buf, 8u);
  }

  uint64_t v5 = (void *)[MEMORY[0x1E4F56690] copyCPMSControlStateSnapshots];
  __int16 v6 = v5;
  if (v5)
  {
    BOOL v7 = [v5 sortedArrayUsingComparator:&__block_literal_global_5454];
    uint64_t v8 = *MEMORY[0x1E4F92D48];
    uint64_t v9 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"CPMSControlState"];
    uint64_t v18 = +[PLOperator entryKeyForType:v8 andName:@"CPMSClientState"];
    id v10 = objc_opt_new();
    id v11 = objc_opt_new();
    *(void *)buf = 0;
    uint64_t v49 = buf;
    uint64_t v50 = 0x2020000000;
    char v51 = 0;
    uint64_t v44 = 0;
    double v45 = &v44;
    uint64_t v46 = 0x2020000000;
    char v47 = 0;
    uint64_t v40 = 0;
    __int16 v41 = &v40;
    uint64_t v42 = 0x2020000000;
    char v43 = 0;
    uint64_t v36 = 0;
    __int16 v37 = &v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 0;
    uint64_t v32 = 0;
    id v33 = &v32;
    uint64_t v34 = 0x2020000000;
    char v35 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_2;
    void v21[3] = &unk_1E6E4B7A8;
    void v21[4] = self;
    int64_t v31 = a3;
    id v22 = v9;
    uint64_t v26 = &v44;
    id v27 = &v40;
    uint64_t v28 = &v36;
    uint64_t v29 = &v32;
    id v12 = v22;
    id v30 = buf;
    id v13 = v10;
    id v23 = v13;
    id v14 = v18;
    id v24 = v14;
    id v15 = v11;
    id v25 = v15;
    [v7 enumerateObjectsUsingBlock:v21];
    if ([v13 count] || objc_msgSend(v15, "count"))
    {
      id v16 = objc_opt_new();
      if ([v13 count]) {
        [v16 setObject:v13 forKeyedSubscript:v12];
      }
      if (objc_msgSend(v15, "count", v18)) {
        [v16 setObject:v15 forKeyedSubscript:v14];
      }
      [(PLOperator *)self logEntries:v16 withGroupID:v12];
    }
    uint32_t v17 = objc_opt_new();
    MEMORY[0x1E4E7E330](@"com.apple.power.battery.cpms.count", 1);
    [v17 setObject:&unk_1F400E020 forKeyedSubscript:@"snapshotCount"];
    if (v49[24])
    {
      MEMORY[0x1E4E7E330](@"com.apple.power.battery.cpms.fullMode", 1);
      [v17 setObject:&unk_1F400E020 forKeyedSubscript:@"fullModeCount"];
    }
    if (*((unsigned char *)v45 + 24))
    {
      MEMORY[0x1E4E7E330](@"com.apple.power.battery.cpms.droopCE", 1);
      [v17 setObject:&unk_1F400E020 forKeyedSubscript:@"droopCECount"];
    }
    if (*((unsigned char *)v41 + 24))
    {
      MEMORY[0x1E4E7E330](@"com.apple.power.battery.cpms.source.generic", 1);
      [v17 setObject:&unk_1F400E020 forKeyedSubscript:@"genericSourceCount"];
    }
    if (*((unsigned char *)v37 + 24))
    {
      MEMORY[0x1E4E7E330](@"com.apple.power.battery.cpms.source.specific", 1);
      [v17 setObject:&unk_1F400E020 forKeyedSubscript:@"specificSourceCount"];
    }
    if (*((unsigned char *)v33 + 24))
    {
      MEMORY[0x1E4E7E330](@"com.apple.power.battery.cpms.source.safeharbor", 1);
      [v17 setObject:&unk_1F400E020 forKeyedSubscript:@"safeharborSourceCount"];
    }
    id v20 = v17;
    AnalyticsSendEventLazy();

    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v7 = PLLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PLBatteryAgent logCPMSSnapshotWithTrigger:]();
    }
  }
}

uint64_t __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 objectForKeyedSubscript:@"timestamp"];
  __int16 v6 = [v4 objectForKeyedSubscript:@"timestamp"];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"reason"];
  unsigned __int8 v5 = [v4 intValue];

  char v6 = [*(id *)(a1 + 32) shouldLogCPMSSnapshotWithReason:v5 withTrigger:*(void *)(a1 + 112)];
  uint64_t v7 = PLLogCommon();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    int v9 = v5;
    if (v8)
    {
      uint64_t v60 = *(void *)(a1 + 112);
      *(_DWORD *)buf = 67109376;
      int v83 = v5;
      __int16 v84 = 1024;
      int v85 = v60;
      _os_log_debug_impl(&dword_1E4220000, v7, OS_LOG_TYPE_DEBUG, "cpms: logging snapshot with reason %d and trigger 0x%X", buf, 0xEu);
    }

    id v10 = [v3 objectForKeyedSubscript:@"timestamp"];
    unint64_t v11 = [v10 unsignedLongLongValue];

    id v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)(v11 / 0x3B9ACA00)];
    id v13 = [v12 convertFromSystemToMonotonic];

    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:*(void *)(a1 + 40) withDate:v13];
    id v15 = [v3 objectForKeyedSubscript:@"overrideFlags"];
    [v14 setObject:v15 forKeyedSubscript:@"flags"];

    id v16 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:v5];
    [v14 setObject:v16 forKeyedSubscript:@"reason"];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) |= v9 == 2;
    uint32_t v17 = [v3 objectForKeyedSubscript:@"systemCapabilitySource"];
    LOBYTE(v15) = [v17 intValue];

    LODWORD(v17) = v15;
    BOOL v18 = v15 == 0;
    uint64_t v19 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:v15];
    [v14 setObject:v19 forKeyedSubscript:@"source"];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) |= v17 == 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) |= v17 == 2;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) |= v18;
    id v20 = [v3 objectForKeyedSubscript:@"mode"];
    uint64_t v21 = [v20 intValue];

    id v22 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v21];
    [v14 setObject:v22 forKeyedSubscript:@"mode"];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) |= v21 == 2;
    id v23 = [v3 objectForKeyedSubscript:@"batteryPowerConsumption"];
    if (!v23)
    {
      id v24 = PLLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_2_cold_6();
      }
    }
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    void v80[2] = __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_5455;
    v80[3] = &unk_1E6E49F50;
    id v25 = v14;
    id v81 = v25;
    uint64_t v61 = v23;
    [v23 enumerateObjectsUsingBlock:v80];
    uint64_t v26 = [v3 objectForKeyedSubscript:@"systemCapability"];
    if (!v26)
    {
      id v27 = PLLogCommon();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_2_cold_5();
      }
    }
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    void v78[2] = __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_5456;
    v78[3] = &unk_1E6E49F50;
    id v28 = v25;
    id v79 = v28;
    [v26 enumerateObjectsUsingBlock:v78];
    uint64_t v29 = [v3 objectForKeyedSubscript:@"droopCE"];
    [v29 floatValue];
    float v31 = v30;

    uint64_t v32 = [MEMORY[0x1E4F28ED0] numberWithInt:(int)(float)(v31 * 65535.0)];
    [v28 setObject:v32 forKeyedSubscript:@"droopCE"];

    id v33 = [v3 objectForKeyedSubscript:@"zeroSumCE"];
    [v33 floatValue];
    float v35 = v34;

    uint64_t v36 = [MEMORY[0x1E4F28ED0] numberWithInt:(int)(float)(v35 * 65535.0)];
    [v28 setObject:v36 forKeyedSubscript:@"zeroSumCE"];

    __int16 v37 = [v3 objectForKeyedSubscript:@"undroopCE"];
    [v37 floatValue];
    float v39 = v38;

    uint64_t v40 = [MEMORY[0x1E4F28ED0] numberWithInt:(int)(float)(v39 * 65535.0)];
    [v28 setObject:v40 forKeyedSubscript:@"undroopCE"];

    __int16 v41 = [v3 objectForKeyedSubscript:@"brownoutRiskNotificationEngaged"];
    [v28 setObject:v41 forKeyedSubscript:@"brownoutRiskEngaged"];

    uint64_t v42 = [v3 objectForKeyedSubscript:@"brownoutRiskSysCap"];
    [v28 setObject:v42 forKeyedSubscript:@"brownoutRiskSysCap"];

    char v43 = [v3 objectForKeyedSubscript:@"brownoutRiskPu"];
    [v28 setObject:v43 forKeyedSubscript:@"brownoutRiskPu"];

    uint64_t v44 = [v3 objectForKeyedSubscript:@"peakPowerPressureLevel"];
    [v28 setObject:v44 forKeyedSubscript:@"peakPowerPressureLevel"];

    double v45 = [v3 objectForKeyedSubscript:@"servoCEs"];
    if (!v45)
    {
      uint64_t v46 = PLLogCommon();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_2_cold_4();
      }
    }
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    void v76[2] = __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_5457;
    v76[3] = &unk_1E6E49F50;
    id v47 = v28;
    id v77 = v47;
    [v45 enumerateObjectsUsingBlock:v76];
    uint64_t v48 = [v3 objectForKeyedSubscript:@"remCapCEFloors"];
    if (!v48)
    {
      uint64_t v49 = PLLogCommon();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_2_cold_3();
      }
    }
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    void v74[2] = __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_5458;
    v74[3] = &unk_1E6E49F50;
    uint64_t v7 = v47;
    uint64_t v75 = v7;
    [v48 enumerateObjectsUsingBlock:v74];
    [*(id *)(a1 + 48) addObject:v7];
    uint64_t v50 = [v3 objectForKeyedSubscript:@"requestedBudgets"];
    if (!v50)
    {
      char v51 = PLLogCommon();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_2_cold_2();
      }
    }
    uint64_t v52 = [v3 objectForKeyedSubscript:@"grantedBudgets"];
    if (!v52)
    {
      uint64_t v53 = PLLogCommon();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_2_cold_1();
      }
    }
    long long v54 = objc_opt_new();
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    void v69[2] = __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_5459;
    v69[3] = &unk_1E6E48858;
    id v70 = *(id *)(a1 + 56);
    id v55 = v13;
    id v71 = v55;
    id v56 = v54;
    uint64_t v57 = *(void *)(a1 + 32);
    id v72 = v56;
    uint64_t v73 = v57;
    [v50 enumerateObjectsUsingBlock:v69];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    void v64[2] = __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_5460;
    v64[3] = &unk_1E6E48858;
    id v65 = v56;
    id v66 = *(id *)(a1 + 56);
    id v67 = v55;
    uint64_t v68 = *(void *)(a1 + 32);
    id v58 = v55;
    id v59 = v56;
    [v52 enumerateObjectsUsingBlock:v64];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    void v62[2] = __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_5461;
    v62[3] = &unk_1E6E4B780;
    id v63 = *(id *)(a1 + 64);
    [v59 enumerateKeysAndObjectsUsingBlock:v62];
  }
  else if (v8)
  {
    __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_2_cold_7(v5, (uint64_t *)(a1 + 112), v7);
  }
}

void __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_5455(uint64_t a1, void *a2, uint64_t a3)
{
  unsigned __int8 v5 = NSString;
  id v6 = a2;
  objc_msgSend(v5, "stringWithFormat:", @"battPC%d", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

void __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_5456(uint64_t a1, void *a2, uint64_t a3)
{
  unsigned __int8 v5 = NSString;
  id v6 = a2;
  objc_msgSend(v5, "stringWithFormat:", @"sysCap%d", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

void __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_5457(uint64_t a1, void *a2, uint64_t a3)
{
  unsigned __int8 v5 = NSString;
  id v6 = a2;
  objc_msgSend(v5, "stringWithFormat:", @"servoCE%d", a3);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v6 floatValue];
  float v8 = v7;

  int v9 = [MEMORY[0x1E4F28ED0] numberWithInt:(int)(float)(v8 * 65535.0)];
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v10];
}

void __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_5458(uint64_t a1, void *a2, uint64_t a3)
{
  unsigned __int8 v5 = NSString;
  id v6 = a2;
  objc_msgSend(v5, "stringWithFormat:", @"remCapCE%d", a3);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v6 floatValue];
  float v8 = v7;

  int v9 = [MEMORY[0x1E4F28ED0] numberWithInt:(int)(float)(v8 * 65535.0)];
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v10];
}

void __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_5459(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"clientID"];
  if (v4)
  {
    unsigned __int8 v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:*(void *)(a1 + 32) withDate:*(void *)(a1 + 40)];
    [v5 setObject:v4 forKeyedSubscript:@"client"];
    [*(id *)(a1 + 48) setObject:v5 forKeyedSubscript:v4];
    [*(id *)(a1 + 56) populateClientEntry:v5 withBudget:v3 withTemplate:@"req%d"];
  }
  else
  {
    id v6 = PLLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_5459_cold_1();
    }
  }
}

void __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_5460(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"clientID"];
  if (v4)
  {
    unsigned __int8 v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
    if (!v5)
    {
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:*(void *)(a1 + 40) withDate:*(void *)(a1 + 48)];
      [v6 setObject:v4 forKeyedSubscript:@"client"];
      [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v4];
    }
    [*(id *)(a1 + 56) populateClientEntry:v5 withBudget:v3 withTemplate:@"grant%d"];
  }
  else
  {
    float v7 = PLLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_5460_cold_1();
    }
  }
}

void __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_5461(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [*(id *)(a1 + 32) addObject:a3];
  id v6 = PLLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_5461_cold_1();
  }
}

id __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_5502(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)logBTM
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "device in hand is :%@", v2, v3, v4, v5, v6);
}

- (void)populateClientEntry:(id)a3 withBudget:(id)a4 withTemplate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v7 && v8 && v9)
  {
    unint64_t v11 = [v8 objectForKeyedSubscript:@"timescales"];
    if (v11)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      void v13[2] = __62__PLBatteryAgent_populateClientEntry_withBudget_withTemplate___block_invoke;
      void v13[3] = &unk_1E6E49100;
      id v14 = v10;
      id v15 = v7;
      [v11 enumerateObjectsUsingBlock:v13];

      id v12 = v14;
    }
    else
    {
      id v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[PLBatteryAgent populateClientEntry:withBudget:withTemplate:]();
      }
    }
  }
}

void __62__PLBatteryAgent_populateClientEntry_withBudget_withTemplate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"timescale"];
  uint64_t v5 = v4;
  if (v4)
  {
    uint8_t v6 = objc_msgSend(NSString, "stringWithFormat:", *(void *)(a1 + 32), objc_msgSend(v4, "intValue"));
    id v7 = [v3 objectForKeyedSubscript:@"level"];
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v6];
  }
  else
  {
    id v8 = PLLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __62__PLBatteryAgent_populateClientEntry_withBudget_withTemplate___block_invoke_cold_1();
    }
  }
}

- (PLIOKitOperatorComposition)iokitPowerSource
{
  return (PLIOKitOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (PLIOKitOperatorComposition)iokitPPM
{
  return (PLIOKitOperatorComposition *)objc_getProperty(self, a2, 152, 1);
}

- (PLNSNotificationOperatorComposition)thermalMonitorListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void)setThermalMonitorListener:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)batteryLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 168, 1);
}

- (void)setBatteryLevelChanged:(id)a3
{
}

- (NSNumber)deviceIsPluggedIn
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setDeviceIsPluggedIn:(id)a3
{
}

- (double)batteryLevelPercent
{
  return self->_batteryLevelPercent;
}

- (void)setBatteryLevelPercent:(double)a3
{
  self->_batteryLevelPercent = a3;
}

- (double)rawBatteryVoltageVolt
{
  return self->_rawBatteryVoltageVolt;
}

- (void)setRawBatteryVoltageVolt:(double)a3
{
  self->_rawBatteryVoltageVolt = a3;
}

- (int)presentMaxRa
{
  return self->_presentMaxRa;
}

- (void)setPresentMaxRa:(int)a3
{
  self->_presentMaxRa = a3;
}

- (int)lifetimeMaxRa
{
  return self->_lifetimeMaxRa;
}

- (void)setLifetimeMaxRa:(int)a3
{
  self->_int lifetimeMaxRa = a3;
}

- (NSDictionary)lastITMiscStatus
{
  return (NSDictionary *)objc_getProperty(self, a2, 200, 1);
}

- (void)setLastITMiscStatus:(id)a3
{
}

- (int)previousCurrentAccumulator
{
  return self->_previousCurrentAccumulator;
}

- (void)setPreviousCurrentAccumulator:(int)a3
{
  self->_previousCurrentAccumulator = a3;
}

- (int)previousCurrentAccumulatorCount
{
  return self->_previousCurrentAccumulatorCount;
}

- (void)setPreviousCurrentAccumulatorCount:(int)a3
{
  self->_previousCurrentAccumulatorCFIndex Count = a3;
}

- (NSDate)previousCurrentAccumulatorDate
{
  return (NSDate *)objc_getProperty(self, a2, 208, 1);
}

- (void)setPreviousCurrentAccumulatorDate:(id)a3
{
}

- (PLTimer)EABatteryTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 216, 1);
}

- (void)setEABatteryTimer:(id)a3
{
}

- (PLMonotonicTimer)significantBatteryChangeTimer
{
  return (PLMonotonicTimer *)objc_getProperty(self, a2, 224, 1);
}

- (void)setSignificantBatteryChangeTimer:(id)a3
{
}

- (NSString)entryKeyEABattery
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (NSString)entryKeyEAPencilStats
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (double)EAEnergyDrained
{
  return self->_EAEnergyDrained;
}

- (void)setEAEnergyDrained:(double)a3
{
  self->_EAEnergyDrained = a3;
}

- (double)EABatteryLevel
{
  return self->_EABatteryLevel;
}

- (void)setEABatteryLevel:(double)a3
{
  self->_EABatteryLevel = a3;
}

- (NSNumber)lastkIOPSAppleBatteryCaseCumulativeCurrentKey
{
  return (NSNumber *)objc_getProperty(self, a2, 264, 1);
}

- (void)setLastkIOPSAppleBatteryCaseCumulativeCurrentKey:(id)a3
{
}

- (NSDate)lastEABatteryConnectedTime
{
  return (NSDate *)objc_getProperty(self, a2, 272, 1);
}

- (void)setLastEABatteryConnectedTime:(id)a3
{
}

- (PLTimer)eaBatteryConnectCountTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 280, 1);
}

- (void)setEaBatteryConnectCountTimer:(id)a3
{
}

- (BOOL)isPingPongCharging
{
  return self->_isPingPongCharging;
}

- (void)setIsPingPongCharging:(BOOL)a3
{
  self->_isPingPongCharging = a3;
}

- (BOOL)isFirstTimeCheckingPingPong
{
  return self->_isFirstTimeCheckingPingPong;
}

- (void)setIsFirstTimeCheckingPingPong:(BOOL)a3
{
  self->_isFirstTimeCheckingPingPong = a3;
}

- (BOOL)lifetimeDataLogged
{
  return self->_lifetimeDataLogged;
}

- (void)setLifetimeDataLogged:(BOOL)a3
{
  self->_lifetimeDataLogged = a3;
}

- (PLTimer)periodicAggdTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 288, 1);
}

- (void)setPeriodicAggdTimer:(id)a3
{
}

- (PLTimer)xFlagsRetryTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 296, 1);
}

- (void)setXFlagsRetryTimer:(id)a3
{
}

- (PLEntry)lastBatteryConfigEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 304, 1);
}

- (void)setLastBatteryConfigEntry:(id)a3
{
}

- (NSNumber)lastDOD0
{
  return (NSNumber *)objc_getProperty(self, a2, 312, 1);
}

- (void)setLastDOD0:(id)a3
{
}

- (NSNumber)lastVacVoltageLimit
{
  return (NSNumber *)objc_getProperty(self, a2, 320, 1);
}

- (void)setLastVacVoltageLimit:(id)a3
{
}

- (__IOHIDManager)BTMmanager
{
  return self->_BTMmanager;
}

- (void)setBTMmanager:(__IOHIDManager *)a3
{
  self->_BTMmanager = a3;
}

- (double)prevAccumulatorCount
{
  return self->_prevAccumulatorCount;
}

- (void)setPrevAccumulatorCount:(double)a3
{
  self->_prevAccumulatorCFIndex Count = a3;
}

- (double)prevAccumulatorErrorCount
{
  return self->_prevAccumulatorErrorCount;
}

- (void)setPrevAccumulatorErrorCount:(double)a3
{
  self->_prevAccumulatorErrorCFIndex Count = a3;
}

- (double)prevAccumulatedPower
{
  return self->_prevAccumulatedPower;
}

- (void)setPrevAccumulatedPower:(double)a3
{
  self->_prevAccumulatedPower = a3;
}

- (double)deltaAccumulatorCount
{
  return self->_deltaAccumulatorCount;
}

- (void)setDeltaAccumulatorCount:(double)a3
{
  self->_deltaAccumulatorCFIndex Count = a3;
}

- (double)deltaAccumulatorErrorCount
{
  return self->_deltaAccumulatorErrorCount;
}

- (void)setDeltaAccumulatorErrorCount:(double)a3
{
  self->_deltaAccumulatorErrorCFIndex Count = a3;
}

- (double)deltaAccumulatedPower
{
  return self->_deltaAccumulatedPower;
}

- (void)setDeltaAccumulatedPower:(double)a3
{
  self->_deltaAccumulatedPower = a3;
}

- (double)powerOutTotalCount
{
  return self->_powerOutTotalCount;
}

- (void)setPowerOutTotalCount:(double)a3
{
  self->_powerOutTotalCFIndex Count = a3;
}

- (double)powerOutTotalPower
{
  return self->_powerOutTotalPower;
}

- (void)setPowerOutTotalPower:(double)a3
{
  self->_powerOutTotalPower = a3;
}

- (double)filteredPower
{
  return self->_filteredPower;
}

- (void)setFilteredPower:(double)a3
{
  self->_filteredPower = a3;
}

- (BOOL)headphonesConnected
{
  return self->_headphonesConnected;
}

- (void)setHeadphonesConnected:(BOOL)a3
{
  self->_headphonesConnected = a3;
}

- (NSNumber)lastAdapterPower
{
  return (NSNumber *)objc_getProperty(self, a2, 408, 1);
}

- (void)setLastAdapterPower:(id)a3
{
}

- (NSString)lastAdapterManufacturer
{
  return (NSString *)objc_getProperty(self, a2, 416, 1);
}

- (void)setLastAdapterManufacturer:(id)a3
{
}

- (NSDate)previousPortControllerRead
{
  return (NSDate *)objc_getProperty(self, a2, 424, 1);
}

- (void)setPreviousPortControllerRead:(id)a3
{
}

- (NSData)previousPortBuffer1Read
{
  return (NSData *)objc_getProperty(self, a2, 432, 1);
}

- (void)setPreviousPortBuffer1Read:(id)a3
{
}

- (NSData)previousPortBuffer2Read
{
  return (NSData *)objc_getProperty(self, a2, 440, 1);
}

- (void)setPreviousPortBuffer2Read:(id)a3
{
}

- (NSData)previousPortBuffer3Read
{
  return (NSData *)objc_getProperty(self, a2, 448, 1);
}

- (void)setPreviousPortBuffer3Read:(id)a3
{
}

- (NSData)previousPortBuffer4Read
{
  return (NSData *)objc_getProperty(self, a2, 456, 1);
}

- (void)setPreviousPortBuffer4Read:(id)a3
{
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 464, 1);
}

- (void)setSerialNumber:(id)a3
{
}

- (PLXPCResponderOperatorComposition)batteryInfoResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 472, 1);
}

- (void)setBatteryInfoResponder:(id)a3
{
}

- (PLXPCResponderOperatorComposition)batteryTemperatureResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 480, 1);
}

- (void)setBatteryTemperatureResponder:(id)a3
{
}

- (PLXPCResponderOperatorComposition)batteryDischargeCurrentResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 488, 1);
}

- (void)setBatteryDischargeCurrentResponder:(id)a3
{
}

- (PLXPCResponderOperatorComposition)batteryChargingStateResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 496, 1);
}

- (void)setBatteryChargingStateResponder:(id)a3
{
}

- (PLIOKitOperatorComposition)chargerIOService
{
  return (PLIOKitOperatorComposition *)objc_getProperty(self, a2, 504, 1);
}

- (void)setChargerIOService:(id)a3
{
}

- (PLEntry)lastChargerEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 512, 1);
}

- (void)setLastChargerEntry:(id)a3
{
}

- (PLIOKitOperatorComposition)magsafeIOService
{
  return (PLIOKitOperatorComposition *)objc_getProperty(self, a2, 520, 1);
}

- (void)setMagsafeIOService:(id)a3
{
}

- (BOOL)isTLCNotificationSurfaced
{
  return self->_isTLCNotificationSurfaced;
}

- (void)setIsTLCNotificationSurfaced:(BOOL)a3
{
  self->_isTLCNotificationSurfaced = a3;
}

- (BOOL)smartChargingEngaged
{
  return self->_smartChargingEngaged;
}

- (void)setSmartChargingEngaged:(BOOL)a3
{
  self->_smartChargingEngaged = a3;
}

- (BOOL)demoMode
{
  return self->_demoMode;
}

- (void)setDemoMode:(BOOL)a3
{
  self->_demoMode = a3;
}

- (int)aggregatedTimeTLC
{
  return self->_aggregatedTimeTLC;
}

- (void)setAggregatedTimeTLC:(int)a3
{
  self->_aggregatedTimeTLC = a3;
}

- (NSDate)lastTLCEntryStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 528, 1);
}

- (void)setLastTLCEntryStartTime:(id)a3
{
}

- (BOOL)fixedChargingEngaged
{
  return self->_fixedChargingEngaged;
}

- (void)setFixedChargingEngaged:(BOOL)a3
{
  self->_fixedChargingEngaged = a3;
}

- (BOOL)cleanEnergyChargingEngaged
{
  return self->_cleanEnergyChargingEngaged;
}

- (void)setCleanEnergyChargingEngaged:(BOOL)a3
{
  self->_cleanEnergyChargingEngaged = a3;
}

- (PLEntryNotificationOperatorComposition)canSleepEntryNotifications
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 536, 1);
}

- (PLSemaphore)canSleepSemaphore
{
  return (PLSemaphore *)objc_getProperty(self, a2, 544, 1);
}

- (void)setCanSleepSemaphore:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)wakeEntryNotifications
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 552, 1);
}

- (PLTimer)gasGaugeTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 560, 1);
}

- (void)setGasGaugeTimer:(id)a3
{
}

- (NSDate)lastGasGaugeLogTime
{
  return (NSDate *)objc_getProperty(self, a2, 568, 1);
}

- (void)setLastGasGaugeLogTime:(id)a3
{
}

- (int)gasGaugeConsecutiveEmptyEntriesCount
{
  return self->_gasGaugeConsecutiveEmptyEntriesCount;
}

- (void)setGasGaugeConsecutiveEmptyEntriesCount:(int)a3
{
  self->_gasGaugeConsecutiveEmptyEntriesCFIndex Count = a3;
}

- (BOOL)allowGasGaugeRead
{
  return self->_allowGasGaugeRead;
}

- (void)setAllowGasGaugeRead:(BOOL)a3
{
  self->_allowGasGaugeRead = a3;
}

- (PLIOKitOperatorComposition)ioAccessoryManager
{
  return (PLIOKitOperatorComposition *)objc_getProperty(self, a2, 576, 1);
}

- (PLXPCResponderOperatorComposition)batteryShutdownDataResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 584, 1);
}

- (void)setBatteryShutdownDataResponder:(id)a3
{
}

- (PLXPCResponderOperatorComposition)batteryUPOStepperResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 592, 1);
}

- (void)setBatteryUPOStepperResponder:(id)a3
{
}

- (PLXPCResponderOperatorComposition)batteryConfigResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 600, 1);
}

- (void)setBatteryConfigResponder:(id)a3
{
}

- (PLXPCListenerOperatorComposition)UPOStepperListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 608, 1);
}

- (void)setUPOStepperListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)smartChargingListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 616, 1);
}

- (void)setSmartChargingListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)cleanEnergyChargingListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 624, 1);
}

- (void)setCleanEnergyChargingListener:(id)a3
{
}

- (AVSystemController)avSystemController
{
  return (AVSystemController *)objc_getProperty(self, a2, 632, 1);
}

- (void)setAvSystemController:(id)a3
{
}

- (BOOL)cameraStreamingActive
{
  return self->_cameraStreamingActive;
}

- (void)setCameraStreamingActive:(BOOL)a3
{
  self->_cameraStreamingActive = a3;
}

- (PLXPCListenerOperatorComposition)mobileChargeModeListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 640, 1);
}

- (void)setMobileChargeModeListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)bdcAMAListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 648, 1);
}

- (void)setBdcAMAListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)acamSBCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 656, 1);
}

- (void)setAcamSBCListener:(id)a3
{
}

- (BOOL)shouldLogEABatteryConfig
{
  return self->_shouldLogEABatteryConfig;
}

- (void)setShouldLogEABatteryConfig:(BOOL)a3
{
  self->_shouldLogEABatteryConfig = a3;
}

- (NSMutableArray)trackedAccessories
{
  return (NSMutableArray *)objc_getProperty(self, a2, 664, 1);
}

- (void)setTrackedAccessories:(id)a3
{
}

- (int)priIOAccessoryPowerMode
{
  return self->_priIOAccessoryPowerMode;
}

- (void)setPriIOAccessoryPowerMode:(int)a3
{
  self->_priIOAccessoryPowerMode = a3;
}

- (BOOL)shouldQueryForAccessory
{
  return self->_shouldQueryForAccessory;
}

- (void)setShouldQueryForAccessory:(BOOL)a3
{
  self->_shouldQueryForAccessory = a3;
}

- (NSMutableDictionary)openChargingIntervals
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 672, 1);
}

- (void)setOpenChargingIntervals:(id)a3
{
}

- (NSString)chargingIntervalsEntryKey
{
  return (NSString *)objc_getProperty(self, a2, 680, 1);
}

- (void)setChargingIntervalsEntryKey:(id)a3
{
}

- (NSNumber)lastTLCCounter
{
  return (NSNumber *)objc_getProperty(self, a2, 688, 1);
}

- (void)setLastTLCCounter:(id)a3
{
}

- (BOOL)tlcIncreased
{
  return self->_tlcIncreased;
}

- (void)setTlcIncreased:(BOOL)a3
{
  self->_tlcIncreased = a3;
}

- (PLCFNotificationOperatorComposition)tlcOverrideNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 696, 1);
}

- (void)setTlcOverrideNotification:(id)a3
{
}

- (NSNumber)TLCOverrideValue
{
  return (NSNumber *)objc_getProperty(self, a2, 704, 1);
}

- (void)setTLCOverrideValue:(id)a3
{
}

- (PLCFNotificationOperatorComposition)batteryUIVisitNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 712, 1);
}

- (void)setBatteryUIVisitNotification:(id)a3
{
}

- (PLCFNotificationOperatorComposition)batteryHealthUIVisitNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 720, 1);
}

- (void)setBatteryHealthUIVisitNotification:(id)a3
{
}

- (PLCFNotificationOperatorComposition)batteryChargingUIVisitNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 728, 1);
}

- (void)setBatteryChargingUIVisitNotification:(id)a3
{
}

- (NSDate)lastTimeChargingInfoUpdated
{
  return (NSDate *)objc_getProperty(self, a2, 736, 1);
}

- (void)setLastTimeChargingInfoUpdated:(id)a3
{
}

- (int)prevConnectedState
{
  return self->_prevConnectedState;
}

- (void)setPrevConnectedState:(int)a3
{
  self->_prevConnectedState = a3;
}

- (int)prevChargingState
{
  return self->_prevChargingState;
}

- (void)setPrevChargingState:(int)a3
{
  self->_int prevChargingState = a3;
}

- (PLEntry)entryChargingOld
{
  return (PLEntry *)objc_getProperty(self, a2, 744, 1);
}

- (void)setEntryChargingOld:(id)a3
{
}

- (NSDate)lastTimePenaltyBoxIntervalUpdated
{
  return (NSDate *)objc_getProperty(self, a2, 752, 1);
}

- (void)setLastTimePenaltyBoxIntervalUpdated:(id)a3
{
}

- (NSDate)lastTimeInPenaltyBox
{
  return (NSDate *)objc_getProperty(self, a2, 760, 1);
}

- (void)setLastTimeInPenaltyBox:(id)a3
{
}

- (BOOL)inPenaltyBox
{
  return self->_inPenaltyBox;
}

- (void)setInPenaltyBox:(BOOL)a3
{
  self->_inPenaltyBox = a3;
}

- (NSNumber)prevGGResetCount
{
  return (NSNumber *)objc_getProperty(self, a2, 768, 1);
}

- (void)setPrevGGResetCount:(id)a3
{
}

- (NSNumber)prevBatteryCellDisconnectCount
{
  return (NSNumber *)objc_getProperty(self, a2, 776, 1);
}

- (void)setPrevBatteryCellDisconnectCount:(id)a3
{
}

- (int)presentChemicalWeightedRa
{
  return self->_presentChemicalWeightedRa;
}

- (void)setPresentChemicalWeightedRa:(int)a3
{
  self->_int presentChemicalWeightedRa = a3;
}

- (int)presentWeightedRa
{
  return self->_presentWeightedRa;
}

- (void)setPresentWeightedRa:(int)a3
{
  self->_int presentWeightedRa = a3;
}

- (int)presentBatteryHealthMetric
{
  return self->_presentBatteryHealthMetric;
}

- (void)setPresentBatteryHealthMetric:(int)a3
{
  self->_int presentBatteryHealthMetric = a3;
}

- (int)presentPeakPerformanceCapacity
{
  return self->_presentPeakPerformanceCapacity;
}

- (void)setPresentPeakPerformanceCapacity:(int)a3
{
  self->_int presentPeakPerformanceCapacity = a3;
}

- (int)presentOCVCount
{
  return self->_presentOCVCount;
}

- (void)setPresentOCVCount:(int)a3
{
  self->_presentOCVCFIndex Count = a3;
}

- (int)presentOCV
{
  return self->_presentOCV;
}

- (void)setPresentOCV:(int)a3
{
  self->_int presentOCV = a3;
}

- (int)presentRaUpdateDisqualified
{
  return self->_presentRaUpdateDisqualified;
}

- (void)setPresentRaUpdateDisqualified:(int)a3
{
  self->_int presentRaUpdateDisqualified = a3;
}

- (int)presentQmaxUpdateDisqualified
{
  return self->_presentQmaxUpdateDisqualified;
}

- (void)setPresentQmaxUpdateDisqualified:(int)a3
{
  self->_int presentQmaxUpdateDisqualified = a3;
}

- (int)presentTimeSinceLastOCV
{
  return self->_presentTimeSinceLastOCV;
}

- (void)setPresentTimeSinceLastOCV:(int)a3
{
  self->_int presentTimeSinceLastOCV = a3;
}

- (NSNumber)mitigatedUPOCount
{
  return (NSNumber *)objc_getProperty(self, a2, 784, 1);
}

- (void)setMitigatedUPOCount:(id)a3
{
}

- (BOOL)rejudgeBattery
{
  return self->_rejudgeBattery;
}

- (void)setRejudgeBattery:(BOOL)a3
{
  self->_rejudgeBattery = a3;
}

- (ggcontext)gasGagueConnection
{
  return self->_gasGagueConnection;
}

- (void)setGasGagueConnection:(ggcontext *)a3
{
  self->_gasGagueConnection = a3;
}

- (int)lastUILevel
{
  return self->_lastUILevel;
}

- (void)setLastUILevel:(int)a3
{
  self->_lastUILevel = a3;
}

- (int64_t)ppmEventLoggingCount
{
  return self->_ppmEventLoggingCount;
}

- (void)setPpmEventLoggingCount:(int64_t)a3
{
  self->_ppmEventLoggingCFIndex Count = a3;
}

- (PLTimer)ppmEventThresholdTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 808, 1);
}

- (void)setPpmEventThresholdTimer:(id)a3
{
}

- (PLCFNotificationOperatorComposition)cpmsDebugNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 816, 1);
}

- (void)setCpmsDebugNotification:(id)a3
{
}

- (int64_t)csmTotalCount
{
  return self->_csmTotalCount;
}

- (void)setCsmTotalCount:(int64_t)a3
{
  self->_csmTotalCFIndex Count = a3;
}

- (int64_t)csmFailureCount
{
  return self->_csmFailureCount;
}

- (void)setCsmFailureCount:(int64_t)a3
{
  self->_csmFailureCFIndex Count = a3;
}

- (NSDate)csmLastFlushMonotonicDate
{
  return (NSDate *)objc_getProperty(self, a2, 840, 1);
}

- (void)setCsmLastFlushMonotonicDate:(id)a3
{
}

- (double)csmFlushInterval
{
  return self->_csmFlushInterval;
}

- (void)setCsmFlushInterval:(double)a3
{
  self->_csmFlushInterval = a3;
}

- (PLCFNotificationOperatorComposition)csmFlushNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 856, 1);
}

- (void)setCsmFlushNotification:(id)a3
{
}

- (PLCFNotificationOperatorComposition)csmOverrideNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 864, 1);
}

- (void)setCsmOverrideNotification:(id)a3
{
}

- (BOOL)csmOverrideValue
{
  return self->_csmOverrideValue;
}

- (void)setCsmOverrideValue:(BOOL)a3
{
  self->_csmOverrideValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_csmOverrideNotification, 0);
  objc_storeStrong((id *)&self->_csmFlushNotification, 0);
  objc_storeStrong((id *)&self->_csmLastFlushMonotonicDate, 0);
  objc_storeStrong((id *)&self->_cpmsDebugNotification, 0);
  objc_storeStrong((id *)&self->_ppmEventThresholdTimer, 0);
  objc_storeStrong((id *)&self->_mitigatedUPOCount, 0);
  objc_storeStrong((id *)&self->_prevBatteryCellDisconnectCount, 0);
  objc_storeStrong((id *)&self->_prevGGResetCount, 0);
  objc_storeStrong((id *)&self->_lastTimeInPenaltyBox, 0);
  objc_storeStrong((id *)&self->_lastTimePenaltyBoxIntervalUpdated, 0);
  objc_storeStrong((id *)&self->_entryChargingOld, 0);
  objc_storeStrong((id *)&self->_lastTimeChargingInfoUpdated, 0);
  objc_storeStrong((id *)&self->_batteryChargingUIVisitNotification, 0);
  objc_storeStrong((id *)&self->_batteryHealthUIVisitNotification, 0);
  objc_storeStrong((id *)&self->_batteryUIVisitNotification, 0);
  objc_storeStrong((id *)&self->_TLCOverrideValue, 0);
  objc_storeStrong((id *)&self->_tlcOverrideNotification, 0);
  objc_storeStrong((id *)&self->_lastTLCCounter, 0);
  objc_storeStrong((id *)&self->_chargingIntervalsEntryKey, 0);
  objc_storeStrong((id *)&self->_openChargingIntervals, 0);
  objc_storeStrong((id *)&self->_trackedAccessories, 0);
  objc_storeStrong((id *)&self->_acamSBCListener, 0);
  objc_storeStrong((id *)&self->_bdcAMAListener, 0);
  objc_storeStrong((id *)&self->_mobileChargeModeListener, 0);
  objc_storeStrong((id *)&self->_avSystemController, 0);
  objc_storeStrong((id *)&self->_cleanEnergyChargingListener, 0);
  objc_storeStrong((id *)&self->_smartChargingListener, 0);
  objc_storeStrong((id *)&self->_UPOStepperListener, 0);
  objc_storeStrong((id *)&self->_batteryConfigResponder, 0);
  objc_storeStrong((id *)&self->_batteryUPOStepperResponder, 0);
  objc_storeStrong((id *)&self->_batteryShutdownDataResponder, 0);
  objc_storeStrong((id *)&self->_ioAccessoryManager, 0);
  objc_storeStrong((id *)&self->_lastGasGaugeLogTime, 0);
  objc_storeStrong((id *)&self->_gasGaugeTimer, 0);
  objc_storeStrong((id *)&self->_wakeEntryNotifications, 0);
  objc_storeStrong((id *)&self->_canSleepSemaphore, 0);
  objc_storeStrong((id *)&self->_canSleepEntryNotifications, 0);
  objc_storeStrong((id *)&self->_lastTLCEntryStartTime, 0);
  objc_storeStrong((id *)&self->_magsafeIOService, 0);
  objc_storeStrong((id *)&self->_lastChargerEntry, 0);
  objc_storeStrong((id *)&self->_chargerIOService, 0);
  objc_storeStrong((id *)&self->_batteryChargingStateResponder, 0);
  objc_storeStrong((id *)&self->_batteryDischargeCurrentResponder, 0);
  objc_storeStrong((id *)&self->_batteryTemperatureResponder, 0);
  objc_storeStrong((id *)&self->_batteryInfoResponder, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_previousPortBuffer4Read, 0);
  objc_storeStrong((id *)&self->_previousPortBuffer3Read, 0);
  objc_storeStrong((id *)&self->_previousPortBuffer2Read, 0);
  objc_storeStrong((id *)&self->_previousPortBuffer1Read, 0);
  objc_storeStrong((id *)&self->_previousPortControllerRead, 0);
  objc_storeStrong((id *)&self->_lastAdapterManufacturer, 0);
  objc_storeStrong((id *)&self->_lastAdapterPower, 0);
  objc_storeStrong((id *)&self->_lastVacVoltageLimit, 0);
  objc_storeStrong((id *)&self->_lastDOD0, 0);
  objc_storeStrong((id *)&self->_lastBatteryConfigEntry, 0);
  objc_storeStrong((id *)&self->_xFlagsRetryTimer, 0);
  objc_storeStrong((id *)&self->_periodicAggdTimer, 0);
  objc_storeStrong((id *)&self->_eaBatteryConnectCountTimer, 0);
  objc_storeStrong((id *)&self->_lastEABatteryConnectedTime, 0);
  objc_storeStrong((id *)&self->_lastkIOPSAppleBatteryCaseCumulativeCurrentKey, 0);
  objc_storeStrong((id *)&self->_entryKeyEAPencilStats, 0);
  objc_storeStrong((id *)&self->_entryKeyEABattery, 0);
  objc_storeStrong((id *)&self->_significantBatteryChangeTimer, 0);
  objc_storeStrong((id *)&self->_EABatteryTimer, 0);
  objc_storeStrong((id *)&self->_previousCurrentAccumulatorDate, 0);
  objc_storeStrong((id *)&self->_lastITMiscStatus, 0);
  objc_storeStrong((id *)&self->_deviceIsPluggedIn, 0);
  objc_storeStrong((id *)&self->_batteryLevelChanged, 0);
  objc_storeStrong((id *)&self->_thermalMonitorListener, 0);
  objc_storeStrong((id *)&self->_iokitPPM, 0);
  objc_storeStrong((id *)&self->_iokitPowerSource, 0);
}

- (void)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [*a1 serviceName];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, a2, v4, "connected to IOKit: %@", v5);
}

void __22__PLBatteryAgent_init__block_invoke_3352_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_3(&dword_1E4220000, v0, v1, "Invalid value for PLkIOPMPSAdapterDetailsPowerTierKey, currentSlowChargingState=%@", v2, v3, v4, v5, v6);
}

void __22__PLBatteryAgent_init__block_invoke_3352_cold_3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "\"bui_tlc_notif_iOS\" feature flag is enabled.", v2, v3, v4, v5, v6);
}

void __22__PLBatteryAgent_init__block_invoke_3352_cold_4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "\"bui_tlc_notif_iOS\" feature flag is disabled.", v2, v3, v4, v5, v6);
}

void __22__PLBatteryAgent_init__block_invoke_3352_cold_5(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*a1 lastTLCCounter];
  int v7 = 138412546;
  id v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  OUTLINED_FUNCTION_3_2(&dword_1E4220000, a3, v6, "TLC: was:%@ now:%@", (uint8_t *)&v7);
}

void __22__PLBatteryAgent_init__block_invoke_3352_cold_6(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*a2 TLCOverrideValue];
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  OUTLINED_FUNCTION_3_2(&dword_1E4220000, a3, v6, "TLC: override %@ -> %@", (uint8_t *)&v7);
}

void __22__PLBatteryAgent_init__block_invoke_3352_cold_7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "PortControlInfo is sampled at %@", v2, v3, v4, v5, v6);
}

void __22__PLBatteryAgent_init__block_invoke_3352_cold_8()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Lifetime data deferred", v2, v3, v4, v5, v6);
}

void __22__PLBatteryAgent_init__block_invoke_3352_cold_9()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Lifetime data logged", v2, v3, v4, v5, v6);
}

void __22__PLBatteryAgent_init__block_invoke_3404_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "[EABattery]: accessory found", v2, v3, v4, v5, v6);
}

void __22__PLBatteryAgent_init__block_invoke_3404_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "[EABattery]: checking for accessory", v2, v3, v4, v5, v6);
}

- (void)showOrHideTLCNotification:timeInTLC:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "TLC: Invalid response from Notification Service: %@", v2, v3, v4, v5, v6);
}

- (void)showOrHideTLCNotification:(uint64_t)a3 timeInTLC:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)showOrHideTLCNotification:timeInTLC:.cold.3()
{
  [MEMORY[0x1E4F929C0] BOOLForKey:@"kPLDefaultTLCNotificationSurfaced"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1E4220000, v0, v1, "TLC: Reading Notification Surfaced Default Value: %d", v2, v3, v4, v5, v6);
}

- (void)showOrHideTLCNotification:(void *)a1 timeInTLC:.cold.4(void *a1)
{
  [a1 BOOLValue];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1E4220000, v1, v2, "TLC: Writing %d response to defaults", v3, v4, v5, v6, v7);
}

- (void)showOrHideTLCNotification:(void *)a1 timeInTLC:.cold.5(void *a1)
{
  [a1 BOOLValue];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1E4220000, v1, v2, "TLC: Reading response from Notification Service: %d", v3, v4, v5, v6, v7);
}

- (void)showOrHideTLCNotification:timeInTLC:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "TLC: Entire response from Notification Service: %@", v2, v3, v4, v5, v6);
}

- (void)showOrHideTLCNotification:timeInTLC:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Sending Query Payload to Notification Service: %@", v2, v3, v4, v5, v6);
}

- (void)showOrHideTLCNotification:timeInTLC:.cold.8()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "TLC: aggD --> helperD to hide TLC notification", v2, v3, v4, v5, v6);
}

- (void)showOrHideTLCNotification:timeInTLC:.cold.9()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "TLC: removal conditions not met, notification should remain", v2, v3, v4, v5, v6);
}

- (void)showOrHideTLCNotification:(uint64_t)a3 timeInTLC:.cold.10(char a1, NSObject *a2, uint64_t a3)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109120;
  v3[1] = a1 & 1;
  OUTLINED_FUNCTION_13_0(&dword_1E4220000, a2, a3, "TLC: Removal Conditions Satisfied: %d", (uint8_t *)v3);
}

- (void)showOrHideTLCNotification:timeInTLC:.cold.11()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "TLC conditions not met OR TLC notification already surfaced", v2, v3, v4, v5, v6);
}

- (void)showOrHideTLCNotification:timeInTLC:.cold.12()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "TLC: aggD --> helperD to show TLC notification", v2, v3, v4, v5, v6);
}

- (void)showOrHideTLCNotification:(void *)a1 timeInTLC:.cold.13(void *a1)
{
  [a1 cleanEnergyChargingEngaged];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1E4220000, v1, v2, "TLC: CEC Engaged: %d", v3, v4, v5, v6, v7);
}

- (void)setupEALoggingTriggeredByConnectionEvent:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "[BATTERY] log new connection count", v2, v3, v4, v5, v6);
}

- (void)logEABatteryConnectedEventToAnalyticsIgnoreLastLogTimestamp:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "[BATTERY] log EA connect count", v2, v3, v4, v5, v6);
}

- (void)logEABatteryConnectedEventToAnalyticsIgnoreLastLogTimestamp:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "[BATTERY] No recorded last EA Battery connect time", v2, v3, v4, v5, v6);
}

- (void)logEABatteryConnectedEventToAnalyticsIgnoreLastLogTimestamp:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "[BATTERY] Last EA Battery connect time too recent", v2, v3, v4, v5, v6);
}

- (void)logEABatteryConnectedEventToAnalyticsIgnoreLastLogTimestamp:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "[BATTERY] logEABatteryConnectedEventToAnalytics", v2, v3, v4, v5, v6);
}

- (void)logEABatteryConnectedTimeToAnalyticsWithEAConnectionState:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "[BATTERY] log EA connection time", v2, v3, v4, v5, v6);
}

- (void)logEABatteryConnectedTimeToAnalyticsWithEAConnectionState:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "[BATTERY] logEABatteryConnectedTimeToAnalyticsWithEAConnectionState", v2, v3, v4, v5, v6);
}

void __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3731_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "[BatteryQueryForChargingState] Invalid payload!", v2, v3, v4, v5, v6);
}

void __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3731_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_1E4220000, v0, OS_LOG_TYPE_ERROR, "[BatteryQueryForChargingState] Invalid StartDate=%@, MonotonicStartDate=%@", v1, 0x16u);
}

void __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3731_cold_3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "[BatteryQueryForChargingState] No entries found", v2, v3, v4, v5, v6);
}

void __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3763_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "SBC trigger occurred", v2, v3, v4, v5, v6);
}

void __42__PLBatteryAgent_initOperatorDependancies__block_invoke_3821_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "MCM callback %@", v2, v3, v4, v5, v6);
}

- (void)handleBDCAMALogging:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_3(&dword_1E4220000, v0, v1, "[BDC_AMA] Expected date keys not found in payload %@!", v2, v3, v4, v5, v6);
}

- (void)handleBDCAMALogging:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, a2, v3, "[BDC_AMA] #Samples = %lu", v4);
}

- (void)handleOnDeviceACAMSBC:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "[OnDeviceACAMSBC] No payload found!", v2, v3, v4, v5, v6);
}

void __40__PLBatteryAgent_handleOnDeviceACAMSBC___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1E4220000, v0, v1, "Logging ACAMSBC Entry: %@ at %@");
}

- (void)logEventForwardCalibration0withData:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "failed to read calibration data", v2, v3, v4, v5, v6);
}

- (void)logEventForwardCalibration0withData:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "calibration data %@", v2, v3, v4, v5, v6);
}

- (void)logEventForwardCalibration0InfowithData:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "failed to read calibration0Info data", v2, v3, v4, v5, v6);
}

- (void)logEventForwardCalibration0InfowithData:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "calibration0Info data %@", v2, v3, v4, v5, v6);
}

- (void)createFixedChargingIntervals:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Open only fixed interval, close OBC", v2, v3, v4, v5, v6);
}

- (void)createFixedChargingIntervals:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Close fixed and OBC intervals", v2, v3, v4, v5, v6);
}

- (void)createFixedChargingIntervals:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Open only OBC interval, close fixed", v2, v3, v4, v5, v6);
}

- (void)createFixedChargingIntervals:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Unsupported device, just update OBC interval", v2, v3, v4, v5, v6);
}

- (void)createFixedChargingIntervals:.cold.5()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "Fixed Charging true for unsupported device", v2, v3, v4, v5, v6);
}

- (void)createFixedChargingIntervals:(void *)a1 .cold.6(void *a1)
{
  [a1 smartChargingEngaged];
  [a1 fixedChargingEngaged];
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_1(&dword_1E4220000, v2, v3, "Smart Charging: %d, Fixed Charging: %d", v4, v5, v6, v7, v8);
}

- (void)dateNoEarlierThan:since:withDelta:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_13_0(&dword_1E4220000, v0, v1, "offset of day to go backward is %d", v2);
}

- (void)logEventBackwardBatteryWithRawData:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "csm: overriding value", v2, v3, v4, v5, v6);
}

- (void)getGaugingMitigationDict
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_2(&dword_1E4220000, v0, v1, "Failed to get gauging mitigation state dictionary, ret = %x", v2, v3, v4, v5, v6);
}

- (void)customConvertBase34ToBase10:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_2(&dword_1E4220000, v0, v1, "SN parsed a digit %hu", v2, v3, v4, v5, v6);
}

- (void)parseTimeAtHighSoc:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_3(&dword_1E4220000, v0, v1, "Error parsing TAHighSoc: %@", v2, v3, v4, v5, v6);
}

- (void)parseLowVoltageResidencyCounters:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_3(&dword_1E4220000, v0, v1, "Error parsing lowVoltageResidencyCounters: %@", v2, v3, v4, v5, v6);
}

- (void)parseFlashWearLevelData:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_3(&dword_1E4220000, v0, v1, "Error parsing flashWearLevelData: %@", v2, v3, v4, v5, v6);
}

- (void)setAggdIntegerValueFromEntry:forKey:withPrefix:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1E4220000, v0, v1, "Logging battery data to aggd - key:\"%@\", value:%@");
}

- (void)logBatteryConfigToCA:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "In logBatteryConfigtoCA. Sending to CA", v2, v3, v4, v5, v6);
}

- (void)logBatteryConfigToCA:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Created dictionary", v2, v3, v4, v5, v6);
}

- (void)logBatteryConfigToCA:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Copied Keys", v2, v3, v4, v5, v6);
}

- (void)logBatteryConfigToCA:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "In logBatteryConfigtoCA", v2, v3, v4, v5, v6);
}

- (void)logBaselineToCA:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "In logBaselinetoCA. Sending to CA", v2, v3, v4, v5, v6);
}

- (void)logKioskModeEntryToAggd:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "In log KioskMode aggd", v2, v3, v4, v5, v6);
}

- (void)ApplyPolicyToDOFU:forSerial:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "diff of the DOFU and SN is %ld", v2, v3, v4, v5, v6);
}

- (void)logEventNoneBatteryConfigWithRawData:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "About to push data to CA", v2, v3, v4, v5, v6);
}

- (void)logEventNoneBatteryConfigWithRawData:(NSObject *)a3 .cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  id v5 = a1;
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = v5;
  _os_log_debug_impl(&dword_1E4220000, a3, OS_LOG_TYPE_DEBUG, "DOFU is %@", (uint8_t *)a2, 0xCu);
}

- (void)logEventNoneBatteryConfigWithRawData:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "ResetData: %@", v2, v3, v4, v5, v6);
}

- (void)logEventNoneBatteryConfigWithRawData:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "SafetyFaultCounter: %@", v2, v3, v4, v5, v6);
}

- (void)logEventNoneBatteryConfigWithRawData:.cold.7()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, v3, (uint64_t)v3, "DataCorruptionOffset: %@", v4);
}

- (void)logEventNoneBatteryConfigWithRawData:.cold.8()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, v3, (uint64_t)v3, "collected flashWearLevelDataRaw: %@", v4);
}

- (void)logEventNoneBatteryConfigWithRawData:.cold.9()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, v3, (uint64_t)v3, "collected LowVoltageResidencyCounters: %@", v4);
}

- (void)logEventNoneBatteryConfigWithRawData:.cold.10()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, v3, (uint64_t)v3, "collected TAHighSoc: %@", v4);
}

- (void)logEventNoneBatteryConfigWithRawData:.cold.11()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, v3, (uint64_t)v3, "collected TA95%% %@", v4);
}

- (void)addPowerMeasurementToAccounting:(uint64_t)a3 withStartDate:(uint64_t)a4 withEndDate:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addPowerMeasurementToAccounting:(double)a3 withStartDate:(uint64_t)a4 withEndDate:(uint64_t)a5 .cold.2(NSObject *a1, double a2, double a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 134218240;
  double v6 = a2;
  __int16 v7 = 2048;
  double v8 = a3;
  OUTLINED_FUNCTION_3_2(&dword_1E4220000, a1, a5, "calculated energy %.2fmWh for %.2fs", (uint8_t *)&v5);
}

- (void)shouldWaitForLifetimeDataWithRawData:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)flushCSMToAggdAtDate:.cold.1()
{
  OUTLINED_FUNCTION_1();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  OUTLINED_FUNCTION_5(&dword_1E4220000, v0, v1, "csm: updating aggd with total %lld failures %lld", v2, v3);
}

- (void)logPowerOutDetails:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Values have been accumulated above threshold but no new data incoming", v2, v3, v4, v5, v6);
}

- (void)logPowerOutDetails:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "No need to create power out event", v2, v3, v4, v5, v6);
}

void __37__PLBatteryAgent_logPowerOutDetails___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "powerout is happening in an illegal port", v2, v3, v4, v5, v6);
}

- (void)logPortControllerInfo:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1E4220000, v0, v1, "PortControllerInfo received at time:%@ is: %@");
}

void __40__PLBatteryAgent_logPortControllerInfo___block_invoke_3_cold_1(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  uint64_t v5 = [a2 objectForKeyedSubscript:@"PortControllerEvtBuffer"];
  int v7 = 138412546;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  OUTLINED_FUNCTION_3_2(&dword_1E4220000, a3, v6, "portControllerInfodict received at time:%@ is: %@", (uint8_t *)&v7);
}

- (void)handleGaugingMitigationStateCallback:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_2(&dword_1E4220000, v0, v1, "Failed to get current mitigation state, ret = %d", v2, v3, v4, v5, v6);
}

void __39__PLBatteryAgent_batterySerialChanged___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109120;
  v3[1] = batterySerialChanged__isNewBattery;
  OUTLINED_FUNCTION_13_0(&dword_1E4220000, a1, a3, "batterySerialChanged: %d", (uint8_t *)v3);
}

- (void)overrideBatteryData:withPath:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_3(&dword_1E4220000, v0, v1, "Invalid override dictionary at %@", v2, v3, v4, v5, v6);
}

- (void)overrideBatteryData:withPath:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_3(&dword_1E4220000, v0, v1, "New raw data: %@", v2, v3, v4, v5, v6);
}

- (void)overrideBatteryData:withPath:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "raw data removed", v2, v3, v4, v5, v6);
}

- (void)overrideBatteryData:withPath:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_3(&dword_1E4220000, v0, v1, "override battery data %@", v2, v3, v4, v5, v6);
}

- (void)deviceType
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_2(&dword_1E4220000, v0, v1, "overriding device type to %d", v2, v3, v4, v5, v6);
}

void __50__PLBatteryAgent_initializeChargingStateIntervals__block_invoke_5449_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "tlc: clearing value", v2, v3, v4, v5, v6);
}

void __50__PLBatteryAgent_initializeChargingStateIntervals__block_invoke_5449_cold_2(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*a1 TLCOverrideValue];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, a2, v4, "tlc: overriding value=%@", v5);
}

- (void)updateIntervalForType:withState:andTime:selectedChargedLimit:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "out of order date", v2, v3, v4, v5, v6);
}

- (void)updateIntervalForType:withState:andTime:selectedChargedLimit:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "missing date", v2, v3, v4, v5, v6);
}

- (void)logCPMSSnapshotWithTrigger:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "cpms: could not get snapshots", v2, v3, v4, v5, v6);
}

void __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "cpms: could not get client granted budgets", v2, v3, v4, v5, v6);
}

void __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "cpms: could not get client requested budgets", v2, v3, v4, v5, v6);
}

void __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "cpms: could not get remCap control efforts", v2, v3, v4, v5, v6);
}

void __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_2_cold_4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "cpms: could not get servo control efforts", v2, v3, v4, v5, v6);
}

void __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_2_cold_5()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "cpms: could not get system capability", v2, v3, v4, v5, v6);
}

void __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_2_cold_6()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "cpms: could not get power consumptions", v2, v3, v4, v5, v6);
}

void __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_2_cold_7(unsigned __int8 a1, uint64_t *a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  v4[0] = 67109376;
  v4[1] = a1;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "cpms: ignoring snapshot with reason %d and trigger 0x%X", (uint8_t *)v4, 0xEu);
}

void __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_5459_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_3(&dword_1E4220000, v0, v1, "cpms: could not get clientID for requested budget %@", v2, v3, v4, v5, v6);
}

void __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_5460_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_3(&dword_1E4220000, v0, v1, "cpms: could not get clientID for granted budget %@", v2, v3, v4, v5, v6);
}

void __45__PLBatteryAgent_logCPMSSnapshotWithTrigger___block_invoke_5461_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "cpms: adding entry for clientID %@", v2, v3, v4, v5, v6);
}

- (void)populateClientEntry:withBudget:withTemplate:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_3(&dword_1E4220000, v0, v1, "cpms: could not get timescale information for budget %@", v2, v3, v4, v5, v6);
}

void __62__PLBatteryAgent_populateClientEntry_withBudget_withTemplate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_3(&dword_1E4220000, v0, v1, "cpms: could not get timescale for %@", v2, v3, v4, v5, v6);
}

@end