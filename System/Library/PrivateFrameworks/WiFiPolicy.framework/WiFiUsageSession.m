@interface WiFiUsageSession
+ (id)disconnectReasonString:(unint64_t)a3;
+ (id)joinReasonString:(unint64_t)a3;
- ($06992ED503081CE345EDB9EEA121564E)bandUsageDuration;
- ($13477CEFC6EEA4B326536BBEC35DF1AE)roamNeighsLrgstCurrentToBestRssiByBandTransition;
- ($13477CEFC6EEA4B326536BBEC35DF1AE)roamNeighsLrgstCurrentToNextBestRssiByBandTransition;
- ($13477CEFC6EEA4B326536BBEC35DF1AE)roamNeighsSmllstCurrentToBestRssiByBandTransition;
- ($13477CEFC6EEA4B326536BBEC35DF1AE)roamNeighsSmllstCurrentToNextBestRssiByBandTransition;
- ($FEE1510A43A03BFC9F45CB2D5A0A197D)strongestRSSIByBand;
- ($FEE1510A43A03BFC9F45CB2D5A0A197D)strongestRSSICountByBand;
- (BOOL)airplaneModeEnabled;
- (BOOL)anyUsbDeviceConnected;
- (BOOL)canSubmitToCA;
- (BOOL)cellularFallbackEnabled;
- (BOOL)cellularOutrankingEnabled;
- (BOOL)controlCenterEnabled;
- (BOOL)hasDifferentIpv4DetailsThanPrevSession;
- (BOOL)hasDifferentIpv6DetailsThanPrevSession;
- (BOOL)inCoexRealTime;
- (BOOL)inCoexRealTimeAtLastJoin;
- (BOOL)inCoexRealTimeAtSessionStart;
- (BOOL)incrementCountWithPrefix:(id)a3 name:(id)a4;
- (BOOL)infraIsPartOfSplitSSID;
- (BOOL)isA2DPActive;
- (BOOL)isAssociated;
- (BOOL)isAssociatedAtSessionStart;
- (BOOL)isAutoHotspot;
- (BOOL)isBiAoSActive;
- (BOOL)isCompatibilityModeEnabled;
- (BOOL)isCompatibilityModeEnabledAtStart;
- (BOOL)isDisplayOn;
- (BOOL)isDriverAvailable;
- (BOOL)isInHomeScreen;
- (BOOL)isInTDEval;
- (BOOL)isInstantHotspot;
- (BOOL)isRoamSuppressionEnabled;
- (BOOL)isSCOActive;
- (BOOL)isSessionActive;
- (BOOL)isUniAoSActive;
- (BOOL)isUnlocked;
- (BOOL)lastInterfacePrimaryState;
- (BOOL)lastJoinWhileDeferForTD;
- (BOOL)lastRoamScanContainsRoamCandidateCount;
- (BOOL)lastRoamScanFoundSSIDTransitionPotentialCandidate;
- (BOOL)lastRoamScanFoundSSIDTransitionTarget;
- (BOOL)linkRecoveryDisabled;
- (BOOL)poweredOn;
- (BOOL)privacyRestrictionDisabled;
- (BOOL)savedInCoexRealTimeAtLastJoin;
- (BOOL)useSavedJoinStats;
- (BOOL)xctest;
- (NSDate)a2dpActiveTime;
- (NSDate)awdlActiveTime;
- (NSDate)batterySaverStateEntryTime;
- (NSDate)callStartedTime;
- (NSDate)chargingStartedTime;
- (NSDate)companionConnectionTime;
- (NSDate)hidPresentTime;
- (NSDate)inMotionStartedTime;
- (NSDate)inVehicleEntryTime;
- (NSDate)inWalkingEntryTime;
- (NSDate)lastAWDLSequenceUpdate;
- (NSDate)lastBssChangedTime;
- (NSDate)lastCellularFallbackStateChangedTime;
- (NSDate)lastCellularOutrankingStateChangedTime;
- (NSDate)lastChipResetTime;
- (NSDate)lastCoexRealTimeOff;
- (NSDate)lastCoexRealTimeOn;
- (NSDate)lastCompatibilityModeChangedTime;
- (NSDate)lastControlCenterStateChangedTime;
- (NSDate)lastDriverAvailableTime;
- (NSDate)lastDriverTerminationTime;
- (NSDate)lastJoinTime;
- (NSDate)lastLinkStateChangedTime;
- (NSDate)lastNetwork6eDisableModeChangedTime;
- (NSDate)lastPowerBudgetChangedTime;
- (NSDate)lastPowerStateChangedTime;
- (NSDate)lastRoamSuppressionToggled;
- (NSDate)lastSystemSleepTime;
- (NSDate)lastSystemWakeTime;
- (NSDate)lastUnexpectedLinkDownTime;
- (NSDate)lastUsbStatusChange;
- (NSDate)linkRecoveryDisabledTime;
- (NSDate)lowPowerStateEntryTime;
- (NSDate)lpasStateEntryTime;
- (NSDate)mediaStartedTime;
- (NSDate)processInitTime;
- (NSDate)roamingActiveTime;
- (NSDate)savedLastJoinTime;
- (NSDate)scanningActiveTime;
- (NSDate)scoActiveTime;
- (NSDate)sessionEndTime;
- (NSDate)sessionInitTime;
- (NSDate)sessionStartTime;
- (NSDate)softApActiveTime;
- (NSDate)wowStateEntryTime;
- (NSMutableArray)prevNetworkNames;
- (NSMutableDictionary)roamCandidatesPerBandWhenSuccessful;
- (NSMutableDictionary)roamCandidatesPerBandWhenUnSuccessful;
- (NSMutableDictionary)roamNeighborsByBand;
- (NSMutableSet)activeApplications;
- (NSNumber)responsivenessScore;
- (NSString)btAudioBand;
- (NSString)cellularDataStatus;
- (NSString)interfaceName;
- (NSString)lastDriverUnavailableReason;
- (NSString)lastSSIDdisable6eModeAtStart;
- (NSString)lastSmartCoverState;
- (NSString)networkDisable6eModeAtStart;
- (NSString)secondaryInterfaceName;
- (OS_dispatch_queue)completionQueue;
- (WiFiUsageBssSession)currentBssSession;
- (WiFiUsageInterfaceCapabilities)capabilities;
- (WiFiUsageInterfaceStats)ifStatsAtStart;
- (WiFiUsageInterfaceStats)secondaryIfStatsAtStart;
- (WiFiUsageNetworkDetails)networkDetails;
- (WiFiUsageNetworkDetails)networkDetailsAtEnd;
- (WiFiUsageNetworkIPv4Details)ipV4Details;
- (WiFiUsageNetworkIPv4Details)ipV4DetailsPrevSession;
- (WiFiUsageNetworkIPv6Details)ipV6Details;
- (WiFiUsageNetworkIPv6Details)ipV6DetailsPrevSession;
- (WiFiUsageSession)initWithSessionType:(unint64_t)a3 andInterfaceName:(id)a4 andCapabilities:(id)a5;
- (WiFiUsageSessionCAConfig)ca_config;
- (WiFiUsageSessionLQM)lqm;
- (double)associatedDuration;
- (double)associatedSleepDuration;
- (double)chargingDuration;
- (double)companionConnectedDuration;
- (double)driverAvailabilityLatencyFromChipReset;
- (double)driverAvailabilityLatencyFromTermination;
- (double)driverAvailabilityLifespan;
- (double)driverProcessLifespan;
- (double)inA2dpDuration;
- (double)inAWDL_BestInfraScoreDuration;
- (double)inAWDL_BestP2PScore;
- (double)inAWDL_BestP2PScoreDuration;
- (double)inAWDL_WorstInfraScoreDuration;
- (double)inAWDL_WorstP2PScore;
- (double)inAWDL_WorstP2PScoreDuration;
- (double)inAWDL_lastP2PScore;
- (double)inAwdlDuration;
- (double)inBatterySaverStateDuration;
- (double)inCallDuration;
- (double)inCellularFallbackDuration;
- (double)inCellularOutrankingDuration;
- (double)inCompatibilityModeEnabledDuration;
- (double)inControlCenterAutoJoinDisabledDuration;
- (double)inHidPresentDuration;
- (double)inLowPowerStateDuration;
- (double)inLpasStateDuration;
- (double)inMotionDuration;
- (double)inNetwork6eModeOffDuration;
- (double)inPoorLinkSessionDuration;
- (double)inRoamDuration;
- (double)inRoamSuppressionEnabled;
- (double)inRoamSuppressionWaitForRoamEnd;
- (double)inRoamSuppressionWaitForRoamStart;
- (double)inScanDuration;
- (double)inScoDuration;
- (double)inSoftApDuration;
- (double)inVehicleDuration;
- (double)inWalkingDuration;
- (double)inWowStateDuration;
- (double)joinInterfaceRankingLatencyFromDriverAvailability;
- (double)joinIpConfigurationLatencyFromDriverAvailability;
- (double)joinLinkUpLatencyFromDriverAvailability;
- (double)joinLinkUpLatencyFromSessionStart;
- (double)joinScanLatencyFromDriverAvailability;
- (double)joinStartedLatencyFromDriverAvailability;
- (double)lastSSIDIn6eModeOffDuration;
- (double)linkRecoveryDisabledDuration;
- (double)longestUnassociatedDuration;
- (double)mediaPlaybackDuration;
- (double)powerBudget10Duration;
- (double)powerBudget20Duration;
- (double)powerBudget30Duration;
- (double)powerBudget40Duration;
- (double)powerBudget50Duration;
- (double)powerBudget60Duration;
- (double)powerBudget70Duration;
- (double)powerBudget80Duration;
- (double)powerBudget90Duration;
- (double)powerBudgetMaxDuration;
- (double)powerBudgetMinDuration;
- (double)poweredOnDuration;
- (double)savedTimeSincePrevJoin;
- (double)sessionDuration;
- (double)sessionTimeSinceLastSession;
- (double)sleepPowerStatsAssociatedDuration;
- (double)sleepPowerStatsRoamingDuration;
- (double)sleepPowerStatsTotalDuration;
- (double)sleepPowerStatsUnassociatedDuration;
- (double)systemAwakeDuration;
- (double)tdEvalCumulativeDuration;
- (double)thermalIndex10Duration;
- (double)thermalIndex20Duration;
- (double)thermalIndex30Duration;
- (double)thermalIndex40Duration;
- (double)thermalIndex50Duration;
- (double)thermalIndex60Duration;
- (double)thermalIndex70Duration;
- (double)thermalIndex80Duration;
- (double)thermalIndex90Duration;
- (double)thermalIndexMaxDuration;
- (double)thermalIndexMinDuration;
- (double)timeSincePrevJoin;
- (double)usbInsertedDuration;
- (id)completionContext;
- (id)completionHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (id)countWithPrefix:(id)a3 name:(id)a4;
- (id)describeCAConfig;
- (id)description;
- (id)eventDictionary:(BOOL)a3;
- (id)eventDictionaryByBand:(int)a3 isFirst:(BOOL)a4;
- (id)lastBssSessionInfo;
- (id)metricName;
- (id)redactedDescription;
- (id)sessionName;
- (id)sessionSummary:(BOOL)a3;
- (int)bandAtSessionStart;
- (int)currentBand;
- (int)maxPhyMode;
- (int64_t)averageCca;
- (int64_t)averageRssi;
- (int64_t)averageSnr;
- (int64_t)lastDisconnectReason;
- (int64_t)lastDisconnectSubreason;
- (int64_t)lastJoinFailure;
- (int64_t)lastPowerBudget;
- (int64_t)lastRssi;
- (int64_t)lastThermalIndex;
- (int64_t)previousDisconnectReason;
- (int64_t)rssiAtSessionStart;
- (int64_t)savedLastJoinFailure;
- (int64_t)savedPreviousDisconnectReason;
- (unint64_t)airplaneModeStateChangedCount;
- (unint64_t)applicationStateChangedCount;
- (unint64_t)batterySaverStateChangedCount;
- (unint64_t)bssDropLowMemoryCount;
- (unint64_t)cellularFallbackStateChangedCount;
- (unint64_t)cellularOutrankingStateChangedCount;
- (unint64_t)chargingEventCount;
- (unint64_t)companionConnectionStateChangedCount;
- (unint64_t)compatibilityModeChangeCount;
- (unint64_t)consecutiveJoinFailureCount;
- (unint64_t)controlCenterStateChangedCount;
- (unint64_t)controlCenterToggleEventCount;
- (unint64_t)countRoamScan;
- (unint64_t)countRoamScanThatFoundSSIDTransitionPotentialCandidate;
- (unint64_t)countRoamScanThatFoundSSIDTransitionTarget;
- (unint64_t)countSSIDTransitionPotentialCandidatesInLastRoamScan;
- (unint64_t)countSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet;
- (unint64_t)countSSIDTransitionTargetInLastRoamScan;
- (unint64_t)currentBssMsgInSleepCount;
- (unint64_t)currentBssMsgInWakeCount;
- (unint64_t)currentRSSIStrongestCount;
- (unint64_t)current_subsequentTdAfterJoinAfterTDCount;
- (unint64_t)displayStateChangedCount;
- (unint64_t)driverUnavailabilityCount;
- (unint64_t)epnoScanTriggersCount;
- (unint64_t)faultReasonCount:(unint64_t)a3;
- (unint64_t)forwardedBssInSleepCount;
- (unint64_t)forwardedBssInwakeCount;
- (unint64_t)hostScanTriggersCount;
- (unint64_t)inA2dpEventCount;
- (unint64_t)inAWDL_BestInfraScore;
- (unint64_t)inAWDL_WorstInfraScore;
- (unint64_t)inAWDL_lastInfraScore;
- (unint64_t)inAwdlEventCount;
- (unint64_t)inCallEventCount;
- (unint64_t)inHidPresentCount;
- (unint64_t)inMotionEventCount;
- (unint64_t)inPoorLinkSessionCount;
- (unint64_t)inRoamEventCount;
- (unint64_t)inRoamSuppressionEnabledCount;
- (unint64_t)inScanEventCount;
- (unint64_t)inScoEventCount;
- (unint64_t)inSoftApEventCount;
- (unint64_t)inVehicleEventCount;
- (unint64_t)inWalkingEventCount;
- (unint64_t)joinStateChangedCount;
- (unint64_t)lastJoinReason;
- (unint64_t)lastRoamScanUniqueBandsCount;
- (unint64_t)lastRoamScanUniqueChannelsCount;
- (unint64_t)lastSSIDdisabled6eModeChangeCount;
- (unint64_t)linkRecoveryDisabledCount;
- (unint64_t)linkStateChangedCount;
- (unint64_t)lockStateChangedCount;
- (unint64_t)lowPowerStateChangedCount;
- (unint64_t)lpasStateChangedCount;
- (unint64_t)maxCandidatesCount;
- (unint64_t)max_subsequentTdAfterJoinAfterTDCount;
- (unint64_t)mediaPlaybackEventCount;
- (unint64_t)minCandidatesCount;
- (unint64_t)min_subsequentTdAfterJoinAfterTDCount;
- (unint64_t)neighborBssCount;
- (unint64_t)netInterfaceRxBytes;
- (unint64_t)netInterfaceTxBytes;
- (unint64_t)network6eDisabledModeChangeCount;
- (unint64_t)networkChangedCount;
- (unint64_t)otherBssCount;
- (unint64_t)pnoScanTriggersCount;
- (unint64_t)powerStateChangedCount;
- (unint64_t)powerToggleEventCount;
- (unint64_t)prevJoinReason;
- (unint64_t)primaryInterfaceStateChangeCount;
- (unint64_t)rangingEventCount;
- (unint64_t)rapidLinkTransitionCount;
- (unint64_t)roamIsWNMScoreUsedCount;
- (unint64_t)roamPingPongAboveThresholdCount;
- (unint64_t)roamPingPongAboveThresholdCountLowRssiOnly;
- (unint64_t)roamPingPongLowRssiAndReassocOnly;
- (unint64_t)roamPingPongReassocOnly;
- (unint64_t)roamReasonBeaconLostCount;
- (unint64_t)roamReasonBetterCandidateCount;
- (unint64_t)roamReasonBetterConditionCount;
- (unint64_t)roamReasonDeauthDisassocCount;
- (unint64_t)roamReasonHostTriggeredCount;
- (unint64_t)roamReasonInitialAssociationCount;
- (unint64_t)roamReasonLowRssiCount;
- (unint64_t)roamReasonMiscCount;
- (unint64_t)roamReasonReassocRequestedCount;
- (unint64_t)roamReasonSteeredByApCount;
- (unint64_t)roamReasonSteeredByBtmCount;
- (unint64_t)roamReasonSteeredByCsaCount;
- (unint64_t)roamScanTriggersCount;
- (unint64_t)roamStatusFailedCount;
- (unint64_t)roamStatusFailedNoScan;
- (unint64_t)roamStatusNoCandidateCount;
- (unint64_t)roamStatusNoQualifiedCandidateCount;
- (unint64_t)roamStatusSucceededCount;
- (unint64_t)roamsAfterSupprLifted;
- (unint64_t)savedJoinStateChangedCount;
- (unint64_t)savedLastJoinReason;
- (unint64_t)savedPrevJoinReason;
- (unint64_t)scanDataMsgInSleepCount;
- (unint64_t)scanDataMsgInWakeCount;
- (unint64_t)secondaryInterfaceRxBytes;
- (unint64_t)secondaryInterfaceTxBytes;
- (unint64_t)sessionPid;
- (unint64_t)smartCoverStateChangedCount;
- (unint64_t)spmiMsgDropMaxFilterCount;
- (unint64_t)spmiMsgDropRssiFilterCount;
- (unint64_t)spmiMsgDropSpmiFailCount;
- (unint64_t)spmiMsgInAwakeCount;
- (unint64_t)spmiMsgInSleepCount;
- (unint64_t)systemWakeStateChangedCount;
- (unint64_t)systemWokenByWiFiCount;
- (unint64_t)tdAfterJoinAfterTDCount;
- (unint64_t)tdEvalEndedCount;
- (unint64_t)tdEvalStartedByActiveProbingCount;
- (unint64_t)tdEvalStartedByBadRSSICount;
- (unint64_t)tdEvalStartedByCheckReassocCount;
- (unint64_t)tdEvalStartedByFGNetwAppChangeCount;
- (unint64_t)tdEvalStartedBySymptomsARPFailureCount;
- (unint64_t)tdEvalStartedBySymptomsDNSFailCount;
- (unint64_t)tdEvalStartedBySymptomsDNSStallCount;
- (unint64_t)tdEvalStartedBySymptomsDataStallCount;
- (unint64_t)tdEvalStartedBySymptomsRTTFailCount;
- (unint64_t)tdEvalStartedBySymptomsShortFlowCount;
- (unint64_t)tdEvalStartedByUserNotificationCount;
- (unint64_t)tdEvalStartedCount;
- (unint64_t)tdSessionStartedByBadRSSICount;
- (unint64_t)tdSessionStartedBySymptomDNSFailureCount;
- (unint64_t)tdSessionStartedByTDRecommendedCount;
- (unint64_t)totalRxFrames;
- (unint64_t)totalTxFrames;
- (unint64_t)triggerDisconnectAlertedCount;
- (unint64_t)triggerDisconnectConfirmedCount;
- (unint64_t)triggerDisconnectExecutedCount;
- (unint64_t)type;
- (unint64_t)usbDeviceEventCount;
- (unint64_t)wowStateChangedCount;
- (void)applicationStateDidChange:(id)a3 withAttributes:(id)a4;
- (void)awdlStateDidChange:(BOOL)a3 inMode:(int64_t)a4;
- (void)bluetoothStateDidChange:(BOOL)a3 connectedDeviceCount:(unint64_t)a4 inA2dp:(BOOL)a5 inSco:(BOOL)a6 inUniAoS:(BOOL)a7 inBiAoS:(BOOL)a8 btAudioBand:(BOOL)a9;
- (void)callStateDidChange:(BOOL)a3;
- (void)cellularDataStatusDidChange:(id)a3 inAirplaneMode:(BOOL)a4;
- (void)cellularFallbackStateDidChange:(BOOL)a3;
- (void)cellularOutrankingStateDidChange:(BOOL)a3;
- (void)chargingStateDidChange:(BOOL)a3;
- (void)companionStateDidChange:(BOOL)a3;
- (void)controlCenterStateDidChange:(BOOL)a3 withKnownLocation:(BOOL)a4;
- (void)displayStateDidChange:(BOOL)a3;
- (void)enableXCTestNotifications;
- (void)faultEventDetected:(unint64_t)a3;
- (void)interfaceRankingDidChange:(BOOL)a3;
- (void)ipConfigurationDidChangeWithMethod:(BOOL)a3 dhcpLeaseDuration:(double)a4 hasRoutableIpV4:(BOOL)a5 hasRoutableIpV6:(BOOL)a6;
- (void)joinStateDidChange:(id)a3 withReason:(unint64_t)a4 lastDisconnectReason:(int64_t)a5 lastJoinFailure:(int64_t)a6 andNetworkDetails:(id)a7;
- (void)linkQualityDidChange:(id)a3;
- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7;
- (void)lockStateDidChange:(BOOL)a3;
- (void)mediaStateDidChange:(BOOL)a3;
- (void)motionStateDidChange:(id)a3;
- (void)poorLinkSessionStats:(id)a3;
- (void)powerBudgetDidChange:(int64_t)a3 andThermalIndex:(int64_t)a4;
- (void)powerStateDidChange:(BOOL)a3;
- (void)processDriverAvailability:(id)a3 available:(unint64_t)a4 version:(unint64_t)a5 flags:(unint64_t)a6 eventID:(unint64_t)a7 reason:(unint64_t)a8 subReason:(unint64_t)a9 minorReason:(unint64_t)a10 reasonString:(id)a11;
- (void)processIPv4Changes:(id)a3;
- (void)processIPv6Changes:(id)a3;
- (void)rangingCompleted;
- (void)receivedBssTransitionRequestWithCandidateListIncluded:(BOOL)a3 isAbridged:(BOOL)a4 disassociationImminent:(BOOL)a5 bssTerminationIncluded:(BOOL)a6 essDisassociationImminent:(BOOL)a7;
- (void)recordCAsubmission;
- (void)roamCacheDidUpdate:(id)a3;
- (void)roamCandidatesStatsDidUpdate:(id *)a3;
- (void)roamingARConfigurationDidChange:(id *)a3;
- (void)roamingConfigurationDidChange:(int64_t)a3 withChannelList:(id)a4;
- (void)roamingStateDidChange:(BOOL)a3 reason:(unint64_t)a4 andStatus:(unint64_t)a5 andLatency:(unint64_t)a6 andRoamData:(id)a7 andPingPongStats:(id)a8;
- (void)scanningStateDidChange:(BOOL)a3 client:(unint64_t)a4 neighborBSS:(id)a5 otherBSS:(id)a6;
- (void)sentBssTransitionResponseWithStatus:(int64_t)a3 terminationDelayRequested:(BOOL)a4;
- (void)sessionDidEnd;
- (void)sessionDidStart;
- (void)setA2dpActiveTime:(id)a3;
- (void)setActiveApplications:(id)a3;
- (void)setAirplaneModeEnabled:(BOOL)a3;
- (void)setAirplaneModeStateChangedCount:(unint64_t)a3;
- (void)setAnyUsbDeviceConnected:(BOOL)a3;
- (void)setApplicationStateChangedCount:(unint64_t)a3;
- (void)setAssociatedDuration:(double)a3;
- (void)setAssociatedSleepDuration:(double)a3;
- (void)setAwdlActiveTime:(id)a3;
- (void)setAwdlSequence:(id)a3 infraScore:(unint64_t)a4 p2pScore:(double)a5;
- (void)setBandAtSessionStart:(int)a3;
- (void)setBandUsageDuration:(id *)a3;
- (void)setBatterySaverStateChangedCount:(unint64_t)a3;
- (void)setBatterySaverStateEntryTime:(id)a3;
- (void)setBssDropLowMemoryCount:(unint64_t)a3;
- (void)setBtAudioBand:(id)a3;
- (void)setCa_config:(id)a3;
- (void)setCallStartedTime:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setCellularDataStatus:(id)a3;
- (void)setCellularFallbackEnabled:(BOOL)a3;
- (void)setCellularFallbackStateChangedCount:(unint64_t)a3;
- (void)setCellularOutrankingEnabled:(BOOL)a3;
- (void)setCellularOutrankingStateChangedCount:(unint64_t)a3;
- (void)setChargingDuration:(double)a3;
- (void)setChargingEventCount:(unint64_t)a3;
- (void)setChargingStartedTime:(id)a3;
- (void)setCompanionConnectedDuration:(double)a3;
- (void)setCompanionConnectionStateChangedCount:(unint64_t)a3;
- (void)setCompanionConnectionTime:(id)a3;
- (void)setCompatibilityModeChangeCount:(unint64_t)a3;
- (void)setCompletionContext:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setCompletionHandler:(id)a3 withContext:(id)a4 onQueue:(id)a5;
- (void)setCompletionQueue:(id)a3;
- (void)setConsecutiveJoinFailureCount:(unint64_t)a3;
- (void)setControlCenterEnabled:(BOOL)a3;
- (void)setControlCenterStateChangedCount:(unint64_t)a3;
- (void)setControlCenterToggleEventCount:(unint64_t)a3;
- (void)setCountRoamScan:(unint64_t)a3;
- (void)setCountRoamScanThatFoundSSIDTransitionPotentialCandidate:(unint64_t)a3;
- (void)setCountRoamScanThatFoundSSIDTransitionTarget:(unint64_t)a3;
- (void)setCountSSIDTransitionPotentialCandidatesInLastRoamScan:(unint64_t)a3;
- (void)setCountSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet:(unint64_t)a3;
- (void)setCountSSIDTransitionTargetInLastRoamScan:(unint64_t)a3;
- (void)setCurrentBand:(int)a3;
- (void)setCurrentBssMsgInSleepCount:(unint64_t)a3;
- (void)setCurrentBssMsgInWakeCount:(unint64_t)a3;
- (void)setCurrentBssSession:(id)a3;
- (void)setCurrentRSSIStrongestCount:(unint64_t)a3;
- (void)setCurrent_subsequentTdAfterJoinAfterTDCount:(unint64_t)a3;
- (void)setDisplayStateChangedCount:(unint64_t)a3;
- (void)setDriverAvailabilityLatencyFromChipReset:(double)a3;
- (void)setDriverAvailabilityLatencyFromTermination:(double)a3;
- (void)setDriverAvailabilityLifespan:(double)a3;
- (void)setDriverProcessLifespan:(double)a3;
- (void)setDriverUnavailabilityCount:(unint64_t)a3;
- (void)setEpnoScanTriggersCount:(unint64_t)a3;
- (void)setForwardedBssInSleepCount:(unint64_t)a3;
- (void)setForwardedBssInwakeCount:(unint64_t)a3;
- (void)setHasDifferentIpv4DetailsThanPrevSession:(BOOL)a3;
- (void)setHasDifferentIpv6DetailsThanPrevSession:(BOOL)a3;
- (void)setHidPresentTime:(id)a3;
- (void)setHostScanTriggersCount:(unint64_t)a3;
- (void)setIfStatsAtStart:(id)a3;
- (void)setInA2dpDuration:(double)a3;
- (void)setInA2dpEventCount:(unint64_t)a3;
- (void)setInAWDL_BestInfraScore:(unint64_t)a3;
- (void)setInAWDL_BestInfraScoreDuration:(double)a3;
- (void)setInAWDL_BestP2PScore:(double)a3;
- (void)setInAWDL_BestP2PScoreDuration:(double)a3;
- (void)setInAWDL_WorstInfraScore:(unint64_t)a3;
- (void)setInAWDL_WorstInfraScoreDuration:(double)a3;
- (void)setInAWDL_WorstP2PScore:(double)a3;
- (void)setInAWDL_WorstP2PScoreDuration:(double)a3;
- (void)setInAWDL_lastInfraScore:(unint64_t)a3;
- (void)setInAWDL_lastP2PScore:(double)a3;
- (void)setInAwdlDuration:(double)a3;
- (void)setInAwdlEventCount:(unint64_t)a3;
- (void)setInBatterySaverStateDuration:(double)a3;
- (void)setInCallDuration:(double)a3;
- (void)setInCallEventCount:(unint64_t)a3;
- (void)setInCellularFallbackDuration:(double)a3;
- (void)setInCellularOutrankingDuration:(double)a3;
- (void)setInCoexRealTime:(BOOL)a3;
- (void)setInCoexRealTimeAtLastJoin:(BOOL)a3;
- (void)setInCoexRealTimeAtSessionStart:(BOOL)a3;
- (void)setInCompatibilityModeEnabledDuration:(double)a3;
- (void)setInControlCenterAutoJoinDisabledDuration:(double)a3;
- (void)setInHidPresentCount:(unint64_t)a3;
- (void)setInHidPresentDuration:(double)a3;
- (void)setInLowPowerStateDuration:(double)a3;
- (void)setInLpasStateDuration:(double)a3;
- (void)setInMotionDuration:(double)a3;
- (void)setInMotionEventCount:(unint64_t)a3;
- (void)setInMotionStartedTime:(id)a3;
- (void)setInNetwork6eModeOffDuration:(double)a3;
- (void)setInPoorLinkSessionCount:(unint64_t)a3;
- (void)setInPoorLinkSessionDuration:(double)a3;
- (void)setInRoamDuration:(double)a3;
- (void)setInRoamEventCount:(unint64_t)a3;
- (void)setInRoamSuppressionEnabled:(double)a3;
- (void)setInRoamSuppressionEnabledCount:(unint64_t)a3;
- (void)setInRoamSuppressionWaitForRoamEnd:(double)a3;
- (void)setInRoamSuppressionWaitForRoamStart:(double)a3;
- (void)setInScanDuration:(double)a3;
- (void)setInScanEventCount:(unint64_t)a3;
- (void)setInScoDuration:(double)a3;
- (void)setInScoEventCount:(unint64_t)a3;
- (void)setInSoftApDuration:(double)a3;
- (void)setInSoftApEventCount:(unint64_t)a3;
- (void)setInVehicleDuration:(double)a3;
- (void)setInVehicleEntryTime:(id)a3;
- (void)setInVehicleEventCount:(unint64_t)a3;
- (void)setInWalkingDuration:(double)a3;
- (void)setInWalkingEntryTime:(id)a3;
- (void)setInWalkingEventCount:(unint64_t)a3;
- (void)setInWowStateDuration:(double)a3;
- (void)setInterfaceName:(id)a3;
- (void)setIpV4Details:(id)a3;
- (void)setIpV4DetailsPrevSession:(id)a3;
- (void)setIpV6Details:(id)a3;
- (void)setIpV6DetailsPrevSession:(id)a3;
- (void)setIsA2DPActive:(BOOL)a3;
- (void)setIsAssociatedAtSessionStart:(BOOL)a3;
- (void)setIsAutoHotspot:(BOOL)a3;
- (void)setIsBiAoSActive:(BOOL)a3;
- (void)setIsCompatibilityModeEnabled:(BOOL)a3;
- (void)setIsCompatibilityModeEnabledAtStart:(BOOL)a3;
- (void)setIsDisplayOn:(BOOL)a3;
- (void)setIsDriverAvailable:(BOOL)a3;
- (void)setIsInHomeScreen:(BOOL)a3;
- (void)setIsInTDEval:(BOOL)a3;
- (void)setIsInstantHotspot:(BOOL)a3;
- (void)setIsRoamSuppressionEnabled:(BOOL)a3;
- (void)setIsSCOActive:(BOOL)a3;
- (void)setIsSessionActive:(BOOL)a3;
- (void)setIsUniAoSActive:(BOOL)a3;
- (void)setIsUnlocked:(BOOL)a3;
- (void)setJoinInterfaceRankingLatencyFromDriverAvailability:(double)a3;
- (void)setJoinIpConfigurationLatencyFromDriverAvailability:(double)a3;
- (void)setJoinLinkUpLatencyFromDriverAvailability:(double)a3;
- (void)setJoinLinkUpLatencyFromSessionStart:(double)a3;
- (void)setJoinScanLatencyFromDriverAvailability:(double)a3;
- (void)setJoinStartedLatencyFromDriverAvailability:(double)a3;
- (void)setJoinStateChangedCount:(unint64_t)a3;
- (void)setLastAWDLSequenceUpdate:(id)a3;
- (void)setLastBssChangedTime:(id)a3;
- (void)setLastCellularFallbackStateChangedTime:(id)a3;
- (void)setLastCellularOutrankingStateChangedTime:(id)a3;
- (void)setLastChipResetTime:(id)a3;
- (void)setLastCoexRealTimeOff:(id)a3;
- (void)setLastCoexRealTimeOn:(id)a3;
- (void)setLastCompatibilityModeChangedTime:(id)a3;
- (void)setLastControlCenterStateChangedTime:(id)a3;
- (void)setLastDisconnectReason:(int64_t)a3;
- (void)setLastDisconnectSubreason:(int64_t)a3;
- (void)setLastDriverAvailableTime:(id)a3;
- (void)setLastDriverTerminationTime:(id)a3;
- (void)setLastDriverUnavailableReason:(id)a3;
- (void)setLastInterfacePrimaryState:(BOOL)a3;
- (void)setLastJoinFailure:(int64_t)a3;
- (void)setLastJoinReason:(unint64_t)a3;
- (void)setLastJoinTime:(id)a3;
- (void)setLastJoinWhileDeferForTD:(BOOL)a3;
- (void)setLastLinkStateChangedTime:(id)a3;
- (void)setLastNetwork6eDisableModeChangedTime:(id)a3;
- (void)setLastPowerBudget:(int64_t)a3;
- (void)setLastPowerBudgetChangedTime:(id)a3;
- (void)setLastPowerStateChangedTime:(id)a3;
- (void)setLastRoamScanContainsRoamCandidateCount:(BOOL)a3;
- (void)setLastRoamScanFoundSSIDTransitionPotentialCandidate:(BOOL)a3;
- (void)setLastRoamScanFoundSSIDTransitionTarget:(BOOL)a3;
- (void)setLastRoamScanUniqueBandsCount:(unint64_t)a3;
- (void)setLastRoamScanUniqueChannelsCount:(unint64_t)a3;
- (void)setLastRoamSuppressionToggled:(id)a3;
- (void)setLastSSIDIn6eModeOffDuration:(double)a3;
- (void)setLastSSIDdisable6eModeAtStart:(id)a3;
- (void)setLastSSIDdisabled6eModeChangeCount:(unint64_t)a3;
- (void)setLastSmartCoverState:(id)a3;
- (void)setLastSystemSleepTime:(id)a3;
- (void)setLastSystemWakeTime:(id)a3;
- (void)setLastThermalIndex:(int64_t)a3;
- (void)setLastUnexpectedLinkDownTime:(id)a3;
- (void)setLastUsbStatusChange:(id)a3;
- (void)setLinkRecoveryDisabled:(BOOL)a3;
- (void)setLinkRecoveryDisabledCount:(unint64_t)a3;
- (void)setLinkRecoveryDisabledDuration:(double)a3;
- (void)setLinkRecoveryDisabledTime:(id)a3;
- (void)setLinkStateChangedCount:(unint64_t)a3;
- (void)setLockStateChangedCount:(unint64_t)a3;
- (void)setLongestUnassociatedDuration:(double)a3;
- (void)setLowPowerStateChangedCount:(unint64_t)a3;
- (void)setLowPowerStateEntryTime:(id)a3;
- (void)setLpasStateChangedCount:(unint64_t)a3;
- (void)setLpasStateEntryTime:(id)a3;
- (void)setLqm:(id)a3;
- (void)setMaxCandidatesCount:(unint64_t)a3;
- (void)setMaxPhyMode:(int)a3;
- (void)setMax_subsequentTdAfterJoinAfterTDCount:(unint64_t)a3;
- (void)setMediaPlaybackDuration:(double)a3;
- (void)setMediaPlaybackEventCount:(unint64_t)a3;
- (void)setMediaStartedTime:(id)a3;
- (void)setMinCandidatesCount:(unint64_t)a3;
- (void)setMin_subsequentTdAfterJoinAfterTDCount:(unint64_t)a3;
- (void)setNeighborBssCount:(unint64_t)a3;
- (void)setNetInterfaceRxBytes:(unint64_t)a3;
- (void)setNetInterfaceTxBytes:(unint64_t)a3;
- (void)setNetwork6eDisabledModeChangeCount:(unint64_t)a3;
- (void)setNetworkChangedCount:(unint64_t)a3;
- (void)setNetworkDetails:(id)a3;
- (void)setNetworkDetailsAtEnd:(id)a3;
- (void)setNetworkDisable6eModeAtStart:(id)a3;
- (void)setOtherBssCount:(unint64_t)a3;
- (void)setPnoScanTriggersCount:(unint64_t)a3;
- (void)setPowerBudget10Duration:(double)a3;
- (void)setPowerBudget20Duration:(double)a3;
- (void)setPowerBudget30Duration:(double)a3;
- (void)setPowerBudget40Duration:(double)a3;
- (void)setPowerBudget50Duration:(double)a3;
- (void)setPowerBudget60Duration:(double)a3;
- (void)setPowerBudget70Duration:(double)a3;
- (void)setPowerBudget80Duration:(double)a3;
- (void)setPowerBudget90Duration:(double)a3;
- (void)setPowerBudgetMaxDuration:(double)a3;
- (void)setPowerBudgetMinDuration:(double)a3;
- (void)setPowerStateChangedCount:(unint64_t)a3;
- (void)setPowerToggleEventCount:(unint64_t)a3;
- (void)setPoweredOn:(BOOL)a3;
- (void)setPoweredOnDuration:(double)a3;
- (void)setPrevJoinReason:(unint64_t)a3;
- (void)setPrevNetworkNames:(id)a3;
- (void)setPreviousDisconnectReason:(int64_t)a3;
- (void)setPrimaryInterfaceStateChangeCount:(unint64_t)a3;
- (void)setPrivacyRestrictionDisabled:(BOOL)a3;
- (void)setProcessInitTime:(id)a3;
- (void)setRangingEventCount:(unint64_t)a3;
- (void)setRapidLinkTransitionCount:(unint64_t)a3;
- (void)setRealtimeCoexStarted:(BOOL)a3 type:(unint64_t)a4 reasons:(id)a5;
- (void)setResponsivenessScore:(id)a3;
- (void)setRoamCandidatesPerBandWhenSuccessful:(id)a3;
- (void)setRoamCandidatesPerBandWhenUnSuccessful:(id)a3;
- (void)setRoamIsWNMScoreUsedCount:(unint64_t)a3;
- (void)setRoamNeighborsByBand:(id)a3;
- (void)setRoamNeighsLrgstCurrentToBestRssiByBandTransition:(id *)a3;
- (void)setRoamNeighsLrgstCurrentToNextBestRssiByBandTransition:(id *)a3;
- (void)setRoamNeighsSmllstCurrentToBestRssiByBandTransition:(id *)a3;
- (void)setRoamNeighsSmllstCurrentToNextBestRssiByBandTransition:(id *)a3;
- (void)setRoamPingPongAboveThresholdCount:(unint64_t)a3;
- (void)setRoamPingPongAboveThresholdCountLowRssiOnly:(unint64_t)a3;
- (void)setRoamPingPongLowRssiAndReassocOnly:(unint64_t)a3;
- (void)setRoamPingPongReassocOnly:(unint64_t)a3;
- (void)setRoamReasonBeaconLostCount:(unint64_t)a3;
- (void)setRoamReasonBetterCandidateCount:(unint64_t)a3;
- (void)setRoamReasonBetterConditionCount:(unint64_t)a3;
- (void)setRoamReasonDeauthDisassocCount:(unint64_t)a3;
- (void)setRoamReasonHostTriggeredCount:(unint64_t)a3;
- (void)setRoamReasonInitialAssociationCount:(unint64_t)a3;
- (void)setRoamReasonLowRssiCount:(unint64_t)a3;
- (void)setRoamReasonMiscCount:(unint64_t)a3;
- (void)setRoamReasonReassocRequestedCount:(unint64_t)a3;
- (void)setRoamReasonSteeredByApCount:(unint64_t)a3;
- (void)setRoamReasonSteeredByBtmCount:(unint64_t)a3;
- (void)setRoamReasonSteeredByCsaCount:(unint64_t)a3;
- (void)setRoamScanTriggersCount:(unint64_t)a3;
- (void)setRoamStatusFailedCount:(unint64_t)a3;
- (void)setRoamStatusFailedNoScan:(unint64_t)a3;
- (void)setRoamStatusNoCandidateCount:(unint64_t)a3;
- (void)setRoamStatusNoQualifiedCandidateCount:(unint64_t)a3;
- (void)setRoamStatusSucceededCount:(unint64_t)a3;
- (void)setRoamingActiveTime:(id)a3;
- (void)setRoamsAfterSupprLifted:(unint64_t)a3;
- (void)setRssiAtSessionStart:(int64_t)a3;
- (void)setSSIDTransitionCandidates:(id)a3 SSIDTransitionPotentialCandidates:(id)a4 potentialCandidatesMinusCandidates:(id)a5 roamCandidates:(unint64_t)a6 uniqueChannels:(unint64_t)a7 uniqueBands:(unint64_t)a8;
- (void)setSavedInCoexRealTimeAtLastJoin:(BOOL)a3;
- (void)setSavedJoinStateChangedCount:(unint64_t)a3;
- (void)setSavedLastJoinFailure:(int64_t)a3;
- (void)setSavedLastJoinReason:(unint64_t)a3;
- (void)setSavedLastJoinTime:(id)a3;
- (void)setSavedPrevJoinReason:(unint64_t)a3;
- (void)setSavedPreviousDisconnectReason:(int64_t)a3;
- (void)setSavedTimeSincePrevJoin:(double)a3;
- (void)setScanDataMsgInSleepCount:(unint64_t)a3;
- (void)setScanDataMsgInWakeCount:(unint64_t)a3;
- (void)setScanningActiveTime:(id)a3;
- (void)setScoActiveTime:(id)a3;
- (void)setSecondaryIfStatsAtStart:(id)a3;
- (void)setSecondaryInterfaceName:(id)a3;
- (void)setSecondaryInterfaceRxBytes:(unint64_t)a3;
- (void)setSecondaryInterfaceTxBytes:(unint64_t)a3;
- (void)setSessionDuration:(double)a3;
- (void)setSessionEndTime:(id)a3;
- (void)setSessionInitTime:(id)a3;
- (void)setSessionPid:(unint64_t)a3;
- (void)setSessionStartTime:(id)a3;
- (void)setSessionTimeSinceLastSession:(double)a3;
- (void)setSleepPowerStatsAssociatedDuration:(double)a3;
- (void)setSleepPowerStatsRoamingDuration:(double)a3;
- (void)setSleepPowerStatsTotalDuration:(double)a3;
- (void)setSleepPowerStatsUnassociatedDuration:(double)a3;
- (void)setSmartCoverStateChangedCount:(unint64_t)a3;
- (void)setSoftApActiveTime:(id)a3;
- (void)setSpmiMsgDropMaxFilterCount:(unint64_t)a3;
- (void)setSpmiMsgDropRssiFilterCount:(unint64_t)a3;
- (void)setSpmiMsgDropSpmiFailCount:(unint64_t)a3;
- (void)setSpmiMsgInAwakeCount:(unint64_t)a3;
- (void)setSpmiMsgInSleepCount:(unint64_t)a3;
- (void)setStrongestRSSIByBand:(id *)a3;
- (void)setStrongestRSSICountByBand:(id *)a3;
- (void)setSystemAwakeDuration:(double)a3;
- (void)setSystemWakeStateChangedCount:(unint64_t)a3;
- (void)setSystemWokenByWiFiCount:(unint64_t)a3;
- (void)setTdAfterJoinAfterTDCount:(unint64_t)a3;
- (void)setTdEvalCumulativeDuration:(double)a3;
- (void)setTdEvalEndedCount:(unint64_t)a3;
- (void)setTdEvalStartedByActiveProbingCount:(unint64_t)a3;
- (void)setTdEvalStartedByBadRSSICount:(unint64_t)a3;
- (void)setTdEvalStartedByCheckReassocCount:(unint64_t)a3;
- (void)setTdEvalStartedByFGNetwAppChangeCount:(unint64_t)a3;
- (void)setTdEvalStartedBySymptomsARPFailureCount:(unint64_t)a3;
- (void)setTdEvalStartedBySymptomsDNSFailCount:(unint64_t)a3;
- (void)setTdEvalStartedBySymptomsDNSStallCount:(unint64_t)a3;
- (void)setTdEvalStartedBySymptomsDataStallCount:(unint64_t)a3;
- (void)setTdEvalStartedBySymptomsRTTFailCount:(unint64_t)a3;
- (void)setTdEvalStartedBySymptomsShortFlowCount:(unint64_t)a3;
- (void)setTdEvalStartedByUserNotificationCount:(unint64_t)a3;
- (void)setTdEvalStartedCount:(unint64_t)a3;
- (void)setTdSessionStartedByBadRSSICount:(unint64_t)a3;
- (void)setTdSessionStartedBySymptomDNSFailureCount:(unint64_t)a3;
- (void)setTdSessionStartedByTDRecommendedCount:(unint64_t)a3;
- (void)setThermalIndex10Duration:(double)a3;
- (void)setThermalIndex20Duration:(double)a3;
- (void)setThermalIndex30Duration:(double)a3;
- (void)setThermalIndex40Duration:(double)a3;
- (void)setThermalIndex50Duration:(double)a3;
- (void)setThermalIndex60Duration:(double)a3;
- (void)setThermalIndex70Duration:(double)a3;
- (void)setThermalIndex80Duration:(double)a3;
- (void)setThermalIndex90Duration:(double)a3;
- (void)setThermalIndexMaxDuration:(double)a3;
- (void)setThermalIndexMinDuration:(double)a3;
- (void)setTimeSincePrevJoin:(double)a3;
- (void)setTriggerDisconnectAlertedCount:(unint64_t)a3;
- (void)setTriggerDisconnectConfirmedCount:(unint64_t)a3;
- (void)setTriggerDisconnectExecutedCount:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
- (void)setUsbDeviceEventCount:(unint64_t)a3;
- (void)setUsbInsertedDuration:(double)a3;
- (void)setWowStateChangedCount:(unint64_t)a3;
- (void)setWowStateEntryTime:(id)a3;
- (void)setXctest:(BOOL)a3;
- (void)smartCoverStateDidChange:(id)a3;
- (void)softApStateDidChange:(BOOL)a3 requester:(id)a4 status:(id)a5 changeReason:(id)a6 channelNumber:(unint64_t)a7 countryCode:(unint64_t)a8 isHidden:(BOOL)a9 isInfraConnected:(BOOL)a10 isAwdlUp:(BOOL)a11 lowPowerModeDuration:(double)a12 compatibilityMode:(BOOL)a13 requestToUpLatency:(double)a14;
- (void)summarizeAndReset6eModeStats:(id)a3;
- (void)summarizeBandUsage;
- (void)summarizeSession;
- (void)systemWakeStateDidChange:(BOOL)a3 wokenByWiFi:(BOOL)a4;
- (void)tallyAssociatedDuration:(id)a3;
- (void)tallyInfraScoreDuration:(unint64_t)a3 until:(id)a4;
- (void)tallyP2PScoreDuration:(double)a3 until:(id)a4;
- (void)tdLogic_alertedBy:(int)a3;
- (void)tdLogic_end:(int)a3 evalTime:(double)a4 rssi:(int64_t)a5 roamTime:(double)a6;
- (void)trackEventLatencies;
- (void)triggerDisconnectAlerted:(BOOL)a3 confirmed:(BOOL)a4 executed:(BOOL)a5;
- (void)update6eModeStats:(id)a3;
- (void)updateApProfile:(id)a3;
- (void)updateAssociatedNetworkDetails:(id)a3;
- (void)updateBandUsageFor:(int)a3 With:(id)a4;
- (void)updateLinkRecoveryDisabled:(BOOL)a3;
- (void)updateRssiDiffStats:(id *)a3 For:(id)a4;
- (void)updateScanForwardStats:(id)a3;
- (void)updateSleepPowerStats:(double)a3 unassociatedDuration:(double)a4 associatedDuration:(double)a5 roamingDuration:(double)a6;
- (void)updateUsbInsertedDuration:(id)a3;
- (void)updateUsbStatus:(BOOL)a3 currentDevices:(id)a4;
- (void)updateWithCompatibilityMode:(unsigned __int8)a3;
- (void)updateWithRoamingSuppression:(unsigned __int8)a3;
- (void)updateWowState:(BOOL)a3 lpasState:(BOOL)a4 lowPowerState:(BOOL)a5 batterySaverState:(BOOL)a6;
@end

@implementation WiFiUsageSession

- (void)applicationStateDidChange:(id)a3 withAttributes:(id)a4
{
  p_xctest = &self->_xctest;
  id v16 = a3;
  id v7 = a4;
  if (v16 && (char v8 = [v16 isEqualToString:@"com.apple.springboard"], v9 = v16, (v8 & 1) == 0))
  {
    ++self->_applicationStateChangedCount;
    activeApplications = self->_activeApplications;
    if (!activeApplications)
    {
      v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v13 = self->_activeApplications;
      self->_activeApplications = v12;

      id v9 = v16;
      activeApplications = self->_activeApplications;
    }
    [(NSMutableSet *)activeApplications addObject:v9];
    char v10 = 0;
  }
  else
  {
    [(WiFiUsageSession *)self setActiveApplications:0];
    char v10 = 1;
  }
  p_xctest[3] = v10;
  if (*p_xctest)
  {
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v15 = [MEMORY[0x1E4F28EA0] notificationWithName:@"applicationStateDidChange" object:0];
    [v14 postNotification:v15];
  }
}

- (NSMutableSet)activeApplications
{
  return self->_activeApplications;
}

- (void)sessionDidStart
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(WiFiUsageSession *)self isSessionActive]
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    v14 = "-[WiFiUsageSession sessionDidStart]";
    __int16 v15 = 2112;
    id v16 = self;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s on %@ -- Warning! active session is being RE-started", (uint8_t *)&v13, 0x16u);
  }
  v3 = [MEMORY[0x1E4F1C9C8] date];
  [(WiFiUsageSession *)self setSessionDuration:0.0];
  [(WiFiUsageSession *)self setSystemAwakeDuration:0.0];
  [(WiFiUsageSession *)self setMediaPlaybackDuration:0.0];
  [(WiFiUsageSession *)self setChargingDuration:0.0];
  [(WiFiUsageSession *)self setInCallDuration:0.0];
  [(WiFiUsageSession *)self setInVehicleDuration:0.0];
  [(WiFiUsageSession *)self setInMotionDuration:0.0];
  [(WiFiUsageSession *)self setInA2dpDuration:0.0];
  [(WiFiUsageSession *)self setInScoDuration:0.0];
  [(WiFiUsageSession *)self setInHidPresentDuration:0.0];
  [(WiFiUsageSession *)self setInAwdlDuration:0.0];
  [(WiFiUsageSession *)self setInRoamDuration:0.0];
  [(WiFiUsageSession *)self setInScanDuration:0.0];
  [(WiFiUsageSession *)self setPoweredOnDuration:0.0];
  [(WiFiUsageSession *)self setAssociatedDuration:0.0];
  [(WiFiUsageSession *)self setAssociatedSleepDuration:0.0];
  [(WiFiUsageSession *)self setInCellularFallbackDuration:0.0];
  [(WiFiUsageSession *)self setInCellularOutrankingDuration:0.0];
  [(WiFiUsageSession *)self setInSoftApDuration:0.0];
  *(_OWORD *)self->_bandUsageDuration.valueByBand = 0u;
  *(_OWORD *)&self->_bandUsageDuration.valueByBand[2] = 0u;
  [(WiFiUsageSession *)self setInControlCenterAutoJoinDisabledDuration:0.0];
  [(WiFiUsageSession *)self setCompanionConnectedDuration:0.0];
  [(WiFiUsageSession *)self setInWowStateDuration:0.0];
  [(WiFiUsageSession *)self setInLpasStateDuration:0.0];
  [(WiFiUsageSession *)self setInLowPowerStateDuration:0.0];
  [(WiFiUsageSession *)self setInBatterySaverStateDuration:0.0];
  [(WiFiUsageSession *)self setLinkRecoveryDisabledDuration:0.0];
  [(WiFiUsageSession *)self setSleepPowerStatsTotalDuration:0.0];
  [(WiFiUsageSession *)self setSleepPowerStatsUnassociatedDuration:0.0];
  [(WiFiUsageSession *)self setSleepPowerStatsAssociatedDuration:0.0];
  [(WiFiUsageSession *)self setSleepPowerStatsRoamingDuration:0.0];
  [(WiFiUsageSession *)self setMediaPlaybackEventCount:0];
  [(WiFiUsageSession *)self setChargingEventCount:0];
  [(WiFiUsageSession *)self setInCallEventCount:0];
  [(WiFiUsageSession *)self setInVehicleEventCount:0];
  [(WiFiUsageSession *)self setInMotionEventCount:0];
  [(WiFiUsageSession *)self setInA2dpEventCount:0];
  [(WiFiUsageSession *)self setInScoEventCount:0];
  [(WiFiUsageSession *)self setInHidPresentCount:0];
  [(WiFiUsageSession *)self setInAwdlEventCount:0];
  [(WiFiUsageSession *)self setInRoamEventCount:0];
  [(WiFiUsageSession *)self setInScanEventCount:0];
  [(WiFiUsageSession *)self setRangingEventCount:0];
  [(WiFiUsageSession *)self setCompanionConnectionStateChangedCount:0];
  [(WiFiUsageSession *)self setLinkRecoveryDisabledCount:0];
  [(WiFiUsageSession *)self setWowStateChangedCount:0];
  [(WiFiUsageSession *)self setLpasStateChangedCount:0];
  [(WiFiUsageSession *)self setLowPowerStateChangedCount:0];
  [(WiFiUsageSession *)self setBatterySaverStateChangedCount:0];
  [(WiFiUsageSession *)self setSystemWakeStateChangedCount:0];
  [(WiFiUsageSession *)self setSystemWokenByWiFiCount:0];
  [(WiFiUsageSession *)self setLockStateChangedCount:0];
  [(WiFiUsageSession *)self setDisplayStateChangedCount:0];
  [(WiFiUsageSession *)self setJoinStateChangedCount:0];
  [(WiFiUsageSession *)self setNetworkChangedCount:0];
  [(WiFiUsageSession *)self setLinkStateChangedCount:0];
  [(WiFiUsageSession *)self setRapidLinkTransitionCount:0];
  [(WiFiUsageSession *)self setPrimaryInterfaceStateChangeCount:0];
  [(WiFiUsageSession *)self setApplicationStateChangedCount:0];
  [(WiFiUsageSession *)self setPowerStateChangedCount:0];
  [(WiFiUsageSession *)self setPowerToggleEventCount:0];
  [(WiFiUsageSession *)self setControlCenterStateChangedCount:0];
  [(WiFiUsageSession *)self setControlCenterToggleEventCount:0];
  [(WiFiUsageSession *)self setCellularFallbackStateChangedCount:0];
  [(WiFiUsageSession *)self setCellularOutrankingStateChangedCount:0];
  [(WiFiUsageSession *)self setSmartCoverStateChangedCount:0];
  [(WiFiUsageSession *)self setNeighborBssCount:0];
  [(WiFiUsageSession *)self setOtherBssCount:0];
  v4 = +[WiFiUsageInterfaceStats statsForInterfaceName:self->_interfaceName];
  [(WiFiUsageSession *)self setIfStatsAtStart:v4];

  v5 = +[WiFiUsageInterfaceStats statsForInterfaceName:self->_secondaryInterfaceName];
  [(WiFiUsageSession *)self setSecondaryIfStatsAtStart:v5];

  [(WiFiUsageSession *)self setActiveApplications:0];
  [(WiFiUsageSession *)self setTriggerDisconnectAlertedCount:0];
  [(WiFiUsageSession *)self setTriggerDisconnectConfirmedCount:0];
  [(WiFiUsageSession *)self setTriggerDisconnectExecutedCount:0];
  [(WiFiUsageSession *)self setIsInTDEval:0];
  self->_perClientScanCount[26] = 0;
  *(_OWORD *)&self->_perClientScanCount[24] = 0u;
  *(_OWORD *)&self->_perClientScanCount[22] = 0u;
  *(_OWORD *)&self->_perClientScanCount[20] = 0u;
  *(_OWORD *)&self->_perClientScanCount[18] = 0u;
  *(_OWORD *)&self->_perClientScanCount[16] = 0u;
  *(_OWORD *)&self->_perClientScanCount[14] = 0u;
  *(_OWORD *)&self->_perClientScanCount[12] = 0u;
  *(_OWORD *)&self->_perClientScanCount[10] = 0u;
  *(_OWORD *)&self->_perClientScanCount[8] = 0u;
  *(_OWORD *)&self->_perClientScanCount[6] = 0u;
  *(_OWORD *)&self->_perClientScanCount[4] = 0u;
  *(_OWORD *)&self->_perClientScanCount[2] = 0u;
  *(_OWORD *)self->_perClientScanCount = 0u;
  *(_OWORD *)self->_faultReasonCount = 0u;
  *(_OWORD *)&self->_faultReasonCount[2] = 0u;
  *(_OWORD *)&self->_faultReasonCount[4] = 0u;
  *(_OWORD *)&self->_faultReasonCount[6] = 0u;
  *(_OWORD *)&self->_faultReasonCount[8] = 0u;
  *(_OWORD *)&self->_faultReasonCount[10] = 0u;
  *(_OWORD *)&self->_faultReasonCount[12] = 0u;
  *(_OWORD *)&self->_faultReasonCount[14] = 0u;
  *(_OWORD *)&self->_faultReasonCount[16] = 0u;
  *(_OWORD *)&self->_faultReasonCount[18] = 0u;
  *(_OWORD *)&self->_faultReasonCount[20] = 0u;
  *(_OWORD *)&self->_faultReasonCount[22] = 0u;
  *(_OWORD *)&self->_faultReasonCount[24] = 0u;
  *(_OWORD *)&self->_faultReasonCount[26] = 0u;
  *(_OWORD *)&self->_faultReasonCount[28] = 0u;
  *(_OWORD *)&self->_faultReasonCount[30] = 0u;
  self->_joinReasonCount[14] = 0;
  *(_OWORD *)&self->_joinReasonCount[10] = 0u;
  *(_OWORD *)&self->_joinReasonCount[12] = 0u;
  *(_OWORD *)&self->_joinReasonCount[6] = 0u;
  *(_OWORD *)&self->_joinReasonCount[8] = 0u;
  *(_OWORD *)&self->_joinReasonCount[2] = 0u;
  *(_OWORD *)&self->_joinReasonCount[4] = 0u;
  *(_OWORD *)&self->_faultReasonCount[32] = 0u;
  *(_OWORD *)self->_joinReasonCount = 0u;
  disconnectReasonMap = self->_disconnectReasonMap;
  if (disconnectReasonMap)
  {
    [(NSMutableDictionary *)disconnectReasonMap removeAllObjects];
  }
  else
  {
    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    char v8 = self->_disconnectReasonMap;
    self->_disconnectReasonMap = v7;
  }
  [(WiFiUsageSession *)self setIsSessionActive:1];
  [(WiFiUsageSession *)self setLastPowerBudgetChangedTime:v3];
  [(WiFiUsageSession *)self setPowerBudgetMaxDuration:0.0];
  [(WiFiUsageSession *)self setPowerBudget90Duration:0.0];
  [(WiFiUsageSession *)self setPowerBudget80Duration:0.0];
  [(WiFiUsageSession *)self setPowerBudget70Duration:0.0];
  [(WiFiUsageSession *)self setPowerBudget60Duration:0.0];
  [(WiFiUsageSession *)self setPowerBudget50Duration:0.0];
  [(WiFiUsageSession *)self setPowerBudget40Duration:0.0];
  [(WiFiUsageSession *)self setPowerBudget30Duration:0.0];
  [(WiFiUsageSession *)self setPowerBudget20Duration:0.0];
  [(WiFiUsageSession *)self setPowerBudget10Duration:0.0];
  [(WiFiUsageSession *)self setPowerBudgetMinDuration:0.0];
  [(WiFiUsageSession *)self setThermalIndexMaxDuration:0.0];
  [(WiFiUsageSession *)self setThermalIndex90Duration:0.0];
  [(WiFiUsageSession *)self setThermalIndex80Duration:0.0];
  [(WiFiUsageSession *)self setThermalIndex70Duration:0.0];
  [(WiFiUsageSession *)self setThermalIndex60Duration:0.0];
  [(WiFiUsageSession *)self setThermalIndex50Duration:0.0];
  [(WiFiUsageSession *)self setThermalIndex40Duration:0.0];
  [(WiFiUsageSession *)self setThermalIndex30Duration:0.0];
  [(WiFiUsageSession *)self setThermalIndex20Duration:0.0];
  [(WiFiUsageSession *)self setThermalIndex10Duration:0.0];
  [(WiFiUsageSession *)self setThermalIndexMinDuration:0.0];
  [(WiFiUsageSession *)self setRoamReasonInitialAssociationCount:0];
  [(WiFiUsageSession *)self setRoamReasonLowRssiCount:0];
  [(WiFiUsageSession *)self setRoamReasonDeauthDisassocCount:0];
  [(WiFiUsageSession *)self setRoamReasonBeaconLostCount:0];
  [(WiFiUsageSession *)self setRoamReasonSteeredByApCount:0];
  [(WiFiUsageSession *)self setRoamReasonSteeredByBtmCount:0];
  [(WiFiUsageSession *)self setRoamReasonSteeredByCsaCount:0];
  [(WiFiUsageSession *)self setRoamReasonReassocRequestedCount:0];
  [(WiFiUsageSession *)self setRoamReasonHostTriggeredCount:0];
  [(WiFiUsageSession *)self setRoamReasonBetterCandidateCount:0];
  [(WiFiUsageSession *)self setRoamReasonBetterConditionCount:0];
  [(WiFiUsageSession *)self setRoamReasonMiscCount:0];
  [(WiFiUsageSession *)self setRoamStatusSucceededCount:0];
  [(WiFiUsageSession *)self setRoamStatusFailedCount:0];
  [(WiFiUsageSession *)self setRoamStatusNoCandidateCount:0];
  [(WiFiUsageSession *)self setRoamStatusNoQualifiedCandidateCount:0];
  [(WiFiUsageSession *)self setRoamStatusFailedNoScan:0];
  [(WiFiUsageSession *)self setRoamIsWNMScoreUsedCount:0];
  [(WiFiUsageSession *)self setRoamPingPongAboveThresholdCount:0];
  [(WiFiUsageSession *)self setRoamPingPongAboveThresholdCount:0];
  [(WiFiUsageSession *)self setRoamPingPongAboveThresholdCountLowRssiOnly:0];
  [(WiFiUsageSession *)self setRoamPingPongLowRssiAndReassocOnly:0];
  [(WiFiUsageSession *)self setRoamPingPongReassocOnly:0];
  [(WiFiUsageSession *)self setRoamsAfterSupprLifted:0];
  [(WiFiUsageSession *)self setIsRoamSuppressionEnabled:0];
  [(WiFiUsageSession *)self setLastRoamSuppressionToggled:0];
  [(WiFiUsageSession *)self setInRoamSuppressionEnabled:0.0];
  [(WiFiUsageSession *)self setInRoamSuppressionEnabledCount:0];
  [(WiFiUsageSession *)self setInRoamSuppressionWaitForRoamStart:0.0];
  [(WiFiUsageSession *)self setInRoamSuppressionWaitForRoamEnd:0.0];
  [(WiFiUsageSession *)self setMinCandidatesCount:0];
  [(WiFiUsageSession *)self setMaxCandidatesCount:0];
  [(WiFiUsageSession *)self setCurrentRSSIStrongestCount:0];
  [(NSMutableDictionary *)self->_roamNeighborsByBand removeAllObjects];
  [(NSMutableDictionary *)self->_roamCandidatesPerBandWhenSuccessful removeAllObjects];
  [(NSMutableDictionary *)self->_roamCandidatesPerBandWhenUnSuccessful removeAllObjects];
  *(_OWORD *)self->_strongestRSSICountByBand.valueByBand = 0u;
  *(_OWORD *)&self->_strongestRSSICountByBand.valueByBand[2] = 0u;
  *(_OWORD *)self->_strongestRSSIByBand.valueByBand = 0u;
  *(_OWORD *)&self->_strongestRSSIByBand.valueByBand[2] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[0][0] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[0][2] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[1][1] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[2][0] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[2][2] = 0u;
  *(void *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valid[2][2] = 0;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[0][0] = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[0][2] = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[1][1] = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[2][0] = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[2][2] = 0u;
  *(void *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valid[2][2] = 0;
  *(void *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valid[2][2] = 0;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[2][0] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[2][2] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[0][2] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[1][1] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[0][0] = 0u;
  *(void *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valid[2][2] = 0;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[2][2] = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[2][0] = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[1][1] = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[0][2] = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[0][0] = 0u;
  if (self->_sessionEndTime)
  {
    objc_msgSend(v3, "timeIntervalSinceDate:");
    -[WiFiUsageSession setSessionTimeSinceLastSession:](self, "setSessionTimeSinceLastSession:");
  }
  lqm = self->_lqm;
  if (lqm) {
    [(WiFiUsageSessionLQM *)lqm reset];
  }
  [(WiFiUsageSession *)self setSessionStartTime:v3];
  [(WiFiUsageSession *)self setSessionEndTime:0];
  [(WiFiUsageSession *)self setDriverUnavailabilityCount:0];
  [(WiFiUsageSession *)self trackEventLatencies];
  [(WiFiUsageSession *)self setIsCompatibilityModeEnabledAtStart:self->_isCompatibilityModeEnabled];
  [(WiFiUsageSession *)self setLastCompatibilityModeChangedTime:v3];
  [(WiFiUsageSession *)self setCompatibilityModeChangeCount:0];
  [(WiFiUsageSession *)self setInCompatibilityModeEnabledDuration:0.0];
  [(WiFiUsageSession *)self setNetworkDetailsAtEnd:0];
  [(WiFiUsageSession *)self setIpV4DetailsPrevSession:self->_ipV4Details];
  [(WiFiUsageSession *)self setIpV4Details:0];
  [(WiFiUsageSession *)self setIpV6DetailsPrevSession:self->_ipV6Details];
  [(WiFiUsageSession *)self setIpV6Details:0];
  [(WiFiUsageSession *)self setBandAtSessionStart:self->_currentBand];
  [(WiFiUsageSession *)self setIsAssociatedAtSessionStart:self->_isAssociated];
  [(WiFiUsageSession *)self setInCoexRealTimeAtSessionStart:self->_inCoexRealTime];
  [(WiFiUsageSession *)self setRssiAtSessionStart:0x7FFFFFFFFFFFFFFFLL];
  [(WiFiUsageSession *)self setCountRoamScan:0];
  [(WiFiUsageSession *)self setLastRoamScanFoundSSIDTransitionTarget:0];
  [(WiFiUsageSession *)self setCountSSIDTransitionTargetInLastRoamScan:0];
  [(WiFiUsageSession *)self setCountRoamScanThatFoundSSIDTransitionTarget:0];
  [(WiFiUsageSession *)self setLastRoamScanFoundSSIDTransitionPotentialCandidate:0];
  [(WiFiUsageSession *)self setCountSSIDTransitionPotentialCandidatesInLastRoamScan:0];
  [(WiFiUsageSession *)self setCountSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet:0];
  [(WiFiUsageSession *)self setCountRoamScanThatFoundSSIDTransitionPotentialCandidate:0];
  [(WiFiUsageSession *)self setLastRoamScanContainsRoamCandidateCount:0];
  [(WiFiUsageSession *)self setLastRoamScanUniqueChannelsCount:0];
  [(WiFiUsageSession *)self setLastRoamScanUniqueBandsCount:0];
  [(WiFiUsageSession *)self setLastSSIDdisable6eModeAtStart:0];
  [(WiFiUsageSession *)self setLastSSIDdisabled6eModeChangeCount:0];
  [(WiFiUsageSession *)self setLastSSIDIn6eModeOffDuration:0.0];
  char v10 = [(WiFiUsageNetworkDetails *)self->_networkDetails disable6eMode];
  [(WiFiUsageSession *)self setNetworkDisable6eModeAtStart:v10];

  v11 = [(WiFiUsageNetworkDetails *)self->_networkDetails disable6eMode];
  if (v11) {
    v12 = v3;
  }
  else {
    v12 = 0;
  }
  [(WiFiUsageSession *)self setLastNetwork6eDisableModeChangedTime:v12];

  [(WiFiUsageSession *)self setInNetwork6eModeOffDuration:0.0];
  [(WiFiUsageSession *)self setNetwork6eDisabledModeChangeCount:0];
  [(WiFiUsageSession *)self setInPoorLinkSessionCount:0];
  [(WiFiUsageSession *)self setInPoorLinkSessionDuration:0.0];
  [(WiFiUsageSession *)self setTdAfterJoinAfterTDCount:0];
  [(WiFiUsageSession *)self setCurrent_subsequentTdAfterJoinAfterTDCount:0];
  [(WiFiUsageSession *)self setMin_subsequentTdAfterJoinAfterTDCount:0x7FFFFFFFFFFFFFFFLL];
  [(WiFiUsageSession *)self setMax_subsequentTdAfterJoinAfterTDCount:0];
  [(WiFiUsageSession *)self setTdSessionStartedByBadRSSICount:0];
  [(WiFiUsageSession *)self setTdSessionStartedByTDRecommendedCount:0];
  [(WiFiUsageSession *)self setTdSessionStartedBySymptomDNSFailureCount:0];
  [(WiFiUsageSession *)self setTdEvalEndedCount:0];
  [(WiFiUsageSession *)self setTdEvalCumulativeDuration:0.0];
  [(WiFiUsageSession *)self setTdEvalStartedCount:0];
  [(WiFiUsageSession *)self setTdEvalStartedByBadRSSICount:0];
  [(WiFiUsageSession *)self setTdEvalStartedBySymptomsARPFailureCount:0];
  [(WiFiUsageSession *)self setTdEvalStartedBySymptomsDNSFailCount:0];
  [(WiFiUsageSession *)self setTdEvalStartedBySymptomsShortFlowCount:0];
  [(WiFiUsageSession *)self setTdEvalStartedBySymptomsDataStallCount:0];
  [(WiFiUsageSession *)self setTdEvalStartedBySymptomsDNSStallCount:0];
  [(WiFiUsageSession *)self setTdEvalStartedBySymptomsDNSFailCount:0];
  [(WiFiUsageSession *)self setTdEvalStartedByActiveProbingCount:0];
  [(WiFiUsageSession *)self setTdEvalStartedByFGNetwAppChangeCount:0];
  [(WiFiUsageSession *)self setTdEvalStartedByUserNotificationCount:0];
  [(WiFiUsageSession *)self setTdEvalStartedByCheckReassocCount:0];
  [(WiFiUsageSession *)self setLastUsbStatusChange:0];
  [(WiFiUsageSession *)self setUsbDeviceEventCount:0];
  [(WiFiUsageSession *)self setUsbInsertedDuration:0.0];
  [(WiFiUsageSession *)self setLastAWDLSequenceUpdate:0];
  [(WiFiUsageSession *)self setInAWDL_BestInfraScoreDuration:0.0];
  [(WiFiUsageSession *)self setInAWDL_BestP2PScoreDuration:0.0];
  [(WiFiUsageSession *)self setInAWDL_WorstInfraScoreDuration:0.0];
  [(WiFiUsageSession *)self setInAWDL_WorstP2PScoreDuration:0.0];
  [(WiFiUsageSession *)self setJoinLinkUpLatencyFromSessionStart:0.0];
  [(WiFiUsageSession *)self setLongestUnassociatedDuration:0.0];
  [(WiFiUsageSession *)self setAirplaneModeStateChangedCount:0];
  [(WiFiUsageSession *)self setMaxPhyMode:0];
}

- (void)setTdEvalStartedBySymptomsDNSFailCount:(unint64_t)a3
{
  self->_tdEvalStartedBySymptomsDNSFailCount = a3;
}

- (void)setRoamPingPongAboveThresholdCount:(unint64_t)a3
{
  self->_roamPingPongAboveThresholdCount = a3;
}

- (BOOL)isSessionActive
{
  return self->_isSessionActive;
}

- (void)linkQualityDidChange:(id)a3
{
  id v8 = a3;
  if ([(WiFiUsageSession *)self isSessionActive])
  {
    lqm = self->_lqm;
    if (lqm)
    {
      [(WiFiUsageSessionLQM *)lqm updateLinkQuality:v8 forSession:self->_type];
    }
    else
    {
      v5 = [[WiFiUsageSessionLQM alloc] initWithLQMSample:v8 forInterface:self->_interfaceName];
      v6 = self->_lqm;
      self->_lqm = v5;
    }
    if (self->_rssiAtSessionStart == 0x7FFFFFFFFFFFFFFFLL) {
      int64_t v7 = 1;
    }
    else {
      int64_t v7 = [v8 rssi];
    }
    self->_rssiAtSessionStart = v7;
    [(WiFiUsageBssSession *)self->_currentBssSession linkQualityDidChange:v8];
  }
}

- (NSDate)sessionStartTime
{
  return self->_sessionStartTime;
}

- (void)trackEventLatencies
{
  [(WiFiUsageSession *)self setDriverAvailabilityLatencyFromChipReset:0.0];
  [(WiFiUsageSession *)self setDriverAvailabilityLatencyFromTermination:0.0];
  [(WiFiUsageSession *)self setJoinScanLatencyFromDriverAvailability:0.0];
  [(WiFiUsageSession *)self setJoinStartedLatencyFromDriverAvailability:0.0];
  [(WiFiUsageSession *)self setJoinLinkUpLatencyFromDriverAvailability:0.0];
  [(WiFiUsageSession *)self setJoinIpConfigurationLatencyFromDriverAvailability:0.0];
  [(WiFiUsageSession *)self setJoinInterfaceRankingLatencyFromDriverAvailability:0.0];

  [(WiFiUsageSession *)self setLastDriverUnavailableReason:0];
}

- (void)setWowStateChangedCount:(unint64_t)a3
{
  self->_wowStateChangedCount = a3;
}

- (void)setUsbInsertedDuration:(double)a3
{
  self->_usbInsertedDuration = a3;
}

- (void)setUsbDeviceEventCount:(unint64_t)a3
{
  self->_usbDeviceEventCount = a3;
}

- (void)setTriggerDisconnectExecutedCount:(unint64_t)a3
{
  self->_triggerDisconnectExecutedCount = a3;
}

- (void)setTriggerDisconnectConfirmedCount:(unint64_t)a3
{
  self->_triggerDisconnectConfirmedCount = a3;
}

- (void)setTriggerDisconnectAlertedCount:(unint64_t)a3
{
  self->_triggerDisconnectAlertedCount = a3;
}

- (void)setThermalIndexMinDuration:(double)a3
{
  self->_thermalIndexMinDuration = a3;
}

- (void)setThermalIndexMaxDuration:(double)a3
{
  self->_thermalIndexMaxDuration = a3;
}

- (void)setThermalIndex90Duration:(double)a3
{
  self->_thermalIndex90Duration = a3;
}

- (void)setThermalIndex80Duration:(double)a3
{
  self->_thermalIndex80Duration = a3;
}

- (void)setThermalIndex70Duration:(double)a3
{
  self->_thermalIndex70Duration = a3;
}

- (void)setThermalIndex60Duration:(double)a3
{
  self->_thermalIndex60Duration = a3;
}

- (void)setThermalIndex50Duration:(double)a3
{
  self->_thermalIndex50Duration = a3;
}

- (void)setThermalIndex40Duration:(double)a3
{
  self->_thermalIndex40Duration = a3;
}

- (void)setThermalIndex30Duration:(double)a3
{
  self->_thermalIndex30Duration = a3;
}

- (void)setThermalIndex20Duration:(double)a3
{
  self->_thermalIndex20Duration = a3;
}

- (void)setThermalIndex10Duration:(double)a3
{
  self->_thermalIndex10Duration = a3;
}

- (void)setTdSessionStartedByTDRecommendedCount:(unint64_t)a3
{
  self->_tdSessionStartedByTDRecommendedCount = a3;
}

- (void)setTdSessionStartedBySymptomDNSFailureCount:(unint64_t)a3
{
  self->_tdSessionStartedBySymptomDNSFailureCount = a3;
}

- (void)setTdSessionStartedByBadRSSICount:(unint64_t)a3
{
  self->_tdSessionStartedByBadRSSICount = a3;
}

- (void)setTdEvalStartedCount:(unint64_t)a3
{
  self->_tdEvalStartedCount = a3;
}

- (void)setTdEvalStartedByUserNotificationCount:(unint64_t)a3
{
  self->_tdEvalStartedByUserNotificationCount = a3;
}

- (void)setTdEvalStartedBySymptomsShortFlowCount:(unint64_t)a3
{
  self->_tdEvalStartedBySymptomsShortFlowCount = a3;
}

- (void)setTdEvalStartedBySymptomsDataStallCount:(unint64_t)a3
{
  self->_tdEvalStartedBySymptomsDataStallCount = a3;
}

- (void)setTdEvalStartedBySymptomsDNSStallCount:(unint64_t)a3
{
  self->_tdEvalStartedBySymptomsDNSStallCount = a3;
}

- (void)setTdEvalStartedBySymptomsARPFailureCount:(unint64_t)a3
{
  self->_tdEvalStartedBySymptomsARPFailureCount = a3;
}

- (void)setTdEvalStartedByFGNetwAppChangeCount:(unint64_t)a3
{
  self->_tdEvalStartedByFGNetwAppChangeCount = a3;
}

- (void)setTdEvalStartedByCheckReassocCount:(unint64_t)a3
{
  self->_tdEvalStartedByCheckReassocCount = a3;
}

- (void)setTdEvalStartedByBadRSSICount:(unint64_t)a3
{
  self->_tdEvalStartedByBadRSSICount = a3;
}

- (void)setTdEvalStartedByActiveProbingCount:(unint64_t)a3
{
  self->_tdEvalStartedByActiveProbingCount = a3;
}

- (void)setTdEvalEndedCount:(unint64_t)a3
{
  self->_tdEvalEndedCount = a3;
}

- (void)setTdEvalCumulativeDuration:(double)a3
{
  self->_tdEvalCumulativeDuration = a3;
}

- (void)setTdAfterJoinAfterTDCount:(unint64_t)a3
{
  self->_tdAfterJoinAfterTDCount = a3;
}

- (void)setSystemWokenByWiFiCount:(unint64_t)a3
{
  self->_systemWokenByWiFiCount = a3;
}

- (void)setSystemWakeStateChangedCount:(unint64_t)a3
{
  self->_systemWakeStateChangedCount = a3;
}

- (void)setSystemAwakeDuration:(double)a3
{
  self->_systemAwakeDuration = a3;
}

- (void)setSmartCoverStateChangedCount:(unint64_t)a3
{
  self->_smartCoverStateChangedCount = a3;
}

- (void)setSleepPowerStatsUnassociatedDuration:(double)a3
{
  self->_sleepPowerStatsUnassociatedDuration = a3;
}

- (void)setSleepPowerStatsTotalDuration:(double)a3
{
  self->_sleepPowerStatsTotalDuration = a3;
}

- (void)setSleepPowerStatsRoamingDuration:(double)a3
{
  self->_sleepPowerStatsRoamingDuration = a3;
}

- (void)setSleepPowerStatsAssociatedDuration:(double)a3
{
  self->_sleepPowerStatsAssociatedDuration = a3;
}

- (void)setSessionStartTime:(id)a3
{
}

- (void)setSessionEndTime:(id)a3
{
}

- (void)setSessionDuration:(double)a3
{
  self->_sessionDuration = a3;
}

- (void)setSecondaryIfStatsAtStart:(id)a3
{
}

- (void)setRssiAtSessionStart:(int64_t)a3
{
  self->_rssiAtSessionStart = a3;
}

- (void)setRoamsAfterSupprLifted:(unint64_t)a3
{
  self->_roamsAfterSupprLifted = a3;
}

- (void)setRoamStatusSucceededCount:(unint64_t)a3
{
  self->_roamStatusSucceededCount = a3;
}

- (void)setRoamStatusNoQualifiedCandidateCount:(unint64_t)a3
{
  self->_roamStatusNoQualifiedCandidateCount = a3;
}

- (void)setRoamStatusNoCandidateCount:(unint64_t)a3
{
  self->_roamStatusNoCandidateCount = a3;
}

- (void)setRoamStatusFailedNoScan:(unint64_t)a3
{
  self->_roamStatusFailedNoScan = a3;
}

- (void)setRoamStatusFailedCount:(unint64_t)a3
{
  self->_roamStatusFailedCount = a3;
}

- (void)setRoamReasonSteeredByCsaCount:(unint64_t)a3
{
  self->_roamReasonSteeredByCsaCount = a3;
}

- (void)setRoamReasonSteeredByBtmCount:(unint64_t)a3
{
  self->_roamReasonSteeredByBtmCount = a3;
}

- (void)setRoamReasonSteeredByApCount:(unint64_t)a3
{
  self->_roamReasonSteeredByApCount = a3;
}

- (void)setRoamReasonReassocRequestedCount:(unint64_t)a3
{
  self->_roamReasonReassocRequestedCount = a3;
}

- (void)setRoamReasonMiscCount:(unint64_t)a3
{
  self->_roamReasonMiscCount = a3;
}

- (void)setRoamReasonLowRssiCount:(unint64_t)a3
{
  self->_roamReasonLowRssiCount = a3;
}

- (void)setRoamReasonInitialAssociationCount:(unint64_t)a3
{
  self->_roamReasonInitialAssociationCount = a3;
}

- (void)setRoamReasonHostTriggeredCount:(unint64_t)a3
{
  self->_roamReasonHostTriggeredCount = a3;
}

- (void)setRoamReasonDeauthDisassocCount:(unint64_t)a3
{
  self->_roamReasonDeauthDisassocCount = a3;
}

- (void)setRoamReasonBetterConditionCount:(unint64_t)a3
{
  self->_roamReasonBetterConditionCount = a3;
}

- (void)setRoamReasonBetterCandidateCount:(unint64_t)a3
{
  self->_roamReasonBetterCandidateCount = a3;
}

- (void)setRoamReasonBeaconLostCount:(unint64_t)a3
{
  self->_roamReasonBeaconLostCount = a3;
}

- (void)setRoamPingPongReassocOnly:(unint64_t)a3
{
  self->_roamPingPongReassocOnly = a3;
}

- (void)setRoamPingPongLowRssiAndReassocOnly:(unint64_t)a3
{
  self->_roamPingPongLowRssiAndReassocOnly = a3;
}

- (void)setRoamPingPongAboveThresholdCountLowRssiOnly:(unint64_t)a3
{
  self->_roamPingPongAboveThresholdCountLowRssiOnly = a3;
}

- (void)setRoamIsWNMScoreUsedCount:(unint64_t)a3
{
  self->_roamIsWNMScoreUsedCount = a3;
}

- (void)setRapidLinkTransitionCount:(unint64_t)a3
{
  self->_rapidLinkTransitionCount = a3;
}

- (void)setRangingEventCount:(unint64_t)a3
{
  self->_rangingEventCount = a3;
}

- (void)setPrimaryInterfaceStateChangeCount:(unint64_t)a3
{
  self->_primaryInterfaceStateChangeCount = a3;
}

- (void)setPoweredOnDuration:(double)a3
{
  self->_poweredOnDuration = a3;
}

- (void)setPowerToggleEventCount:(unint64_t)a3
{
  self->_powerToggleEventCount = a3;
}

- (void)setPowerStateChangedCount:(unint64_t)a3
{
  self->_powerStateChangedCount = a3;
}

- (void)setPowerBudgetMinDuration:(double)a3
{
  self->_powerBudgetMinDuration = a3;
}

- (void)setPowerBudgetMaxDuration:(double)a3
{
  self->_powerBudgetMaxDuration = a3;
}

- (void)setPowerBudget90Duration:(double)a3
{
  self->_powerBudget90Duration = a3;
}

- (void)setPowerBudget80Duration:(double)a3
{
  self->_powerBudget80Duration = a3;
}

- (void)setPowerBudget70Duration:(double)a3
{
  self->_powerBudget70Duration = a3;
}

- (void)setPowerBudget60Duration:(double)a3
{
  self->_powerBudget60Duration = a3;
}

- (void)setPowerBudget50Duration:(double)a3
{
  self->_powerBudget50Duration = a3;
}

- (void)setPowerBudget40Duration:(double)a3
{
  self->_powerBudget40Duration = a3;
}

- (void)setPowerBudget30Duration:(double)a3
{
  self->_powerBudget30Duration = a3;
}

- (void)setPowerBudget20Duration:(double)a3
{
  self->_powerBudget20Duration = a3;
}

- (void)setPowerBudget10Duration:(double)a3
{
  self->_powerBudget10Duration = a3;
}

- (void)setOtherBssCount:(unint64_t)a3
{
  self->_otherBssCount = a3;
}

- (void)setNetworkDisable6eModeAtStart:(id)a3
{
}

- (void)setNetworkDetailsAtEnd:(id)a3
{
}

- (void)setNetworkChangedCount:(unint64_t)a3
{
  self->_networkChangedCount = a3;
}

- (void)setNetwork6eDisabledModeChangeCount:(unint64_t)a3
{
  self->_network6eDisabledModeChangeCount = a3;
}

- (void)setNeighborBssCount:(unint64_t)a3
{
  self->_neighborBssCount = a3;
}

- (void)setMin_subsequentTdAfterJoinAfterTDCount:(unint64_t)a3
{
  self->_min_subsequentTdAfterJoinAfterTDCount = a3;
}

- (void)setMinCandidatesCount:(unint64_t)a3
{
  self->_minCandidatesCount = a3;
}

- (void)setMediaPlaybackEventCount:(unint64_t)a3
{
  self->_mediaPlaybackEventCount = a3;
}

- (void)setMediaPlaybackDuration:(double)a3
{
  self->_mediaPlaybackDuration = a3;
}

- (void)setMax_subsequentTdAfterJoinAfterTDCount:(unint64_t)a3
{
  self->_max_subsequentTdAfterJoinAfterTDCount = a3;
}

- (void)setMaxPhyMode:(int)a3
{
  self->_maxPhyMode = a3;
}

- (void)setMaxCandidatesCount:(unint64_t)a3
{
  self->_maxCandidatesCount = a3;
}

- (void)setLpasStateChangedCount:(unint64_t)a3
{
  self->_lpasStateChangedCount = a3;
}

- (void)setLowPowerStateChangedCount:(unint64_t)a3
{
  self->_lowPowerStateChangedCount = a3;
}

- (void)setLongestUnassociatedDuration:(double)a3
{
  self->_longestUnassociatedDuration = a3;
}

- (void)setLockStateChangedCount:(unint64_t)a3
{
  self->_lockStateChangedCount = a3;
}

- (void)setLinkStateChangedCount:(unint64_t)a3
{
  self->_linkStateChangedCount = a3;
}

- (void)setLinkRecoveryDisabledDuration:(double)a3
{
  self->_linkRecoveryDisabledDuration = a3;
}

- (void)setLinkRecoveryDisabledCount:(unint64_t)a3
{
  self->_linkRecoveryDisabledCount = a3;
}

- (void)setLastUsbStatusChange:(id)a3
{
}

- (void)setLastSSIDdisabled6eModeChangeCount:(unint64_t)a3
{
  self->_lastSSIDdisabled6eModeChangeCount = a3;
}

- (void)setLastSSIDdisable6eModeAtStart:(id)a3
{
}

- (void)setLastSSIDIn6eModeOffDuration:(double)a3
{
  self->_lastSSIDIn6eModeOffDuration = a3;
}

- (void)setLastRoamSuppressionToggled:(id)a3
{
}

- (void)setLastRoamScanUniqueChannelsCount:(unint64_t)a3
{
  self->_lastRoamScanUniqueChannelsCount = a3;
}

- (void)setLastRoamScanUniqueBandsCount:(unint64_t)a3
{
  self->_lastRoamScanUniqueBandsCount = a3;
}

- (void)setLastRoamScanFoundSSIDTransitionTarget:(BOOL)a3
{
  self->_lastRoamScanFoundSSIDTransitionTarget = a3;
}

- (void)setLastRoamScanFoundSSIDTransitionPotentialCandidate:(BOOL)a3
{
  self->_lastRoamScanFoundSSIDTransitionPotentialCandidate = a3;
}

- (void)setLastRoamScanContainsRoamCandidateCount:(BOOL)a3
{
  self->_lastRoamScanContainsRoamCandidateCount = a3;
}

- (void)setLastPowerBudgetChangedTime:(id)a3
{
}

- (void)setLastNetwork6eDisableModeChangedTime:(id)a3
{
}

- (void)setLastDriverUnavailableReason:(id)a3
{
}

- (void)setLastCompatibilityModeChangedTime:(id)a3
{
}

- (void)setLastAWDLSequenceUpdate:(id)a3
{
}

- (void)setJoinStateChangedCount:(unint64_t)a3
{
  self->_joinStateChangedCount = a3;
}

- (void)setJoinStartedLatencyFromDriverAvailability:(double)a3
{
  self->_joinStartedLatencyFromDriverAvailability = a3;
}

- (void)setJoinScanLatencyFromDriverAvailability:(double)a3
{
  self->_joinScanLatencyFromDriverAvailability = a3;
}

- (void)setJoinLinkUpLatencyFromSessionStart:(double)a3
{
  self->_joinLinkUpLatencyFromSessionStart = a3;
}

- (void)setJoinLinkUpLatencyFromDriverAvailability:(double)a3
{
  self->_joinLinkUpLatencyFromDriverAvailability = a3;
}

- (void)setJoinIpConfigurationLatencyFromDriverAvailability:(double)a3
{
  self->_joinIpConfigurationLatencyFromDriverAvailability = a3;
}

- (void)setJoinInterfaceRankingLatencyFromDriverAvailability:(double)a3
{
  self->_joinInterfaceRankingLatencyFromDriverAvailability = a3;
}

- (void)setIsSessionActive:(BOOL)a3
{
  self->_isSessionActive = a3;
}

- (void)setIsRoamSuppressionEnabled:(BOOL)a3
{
  self->_isRoamSuppressionEnabled = a3;
}

- (void)setIsInTDEval:(BOOL)a3
{
  self->_isInTDEval = a3;
}

- (void)setIsCompatibilityModeEnabledAtStart:(BOOL)a3
{
  self->_isCompatibilityModeEnabledAtStart = a3;
}

- (void)setIsAssociatedAtSessionStart:(BOOL)a3
{
  self->_isAssociatedAtSessionStart = a3;
}

- (void)setIpV6DetailsPrevSession:(id)a3
{
}

- (void)setIpV6Details:(id)a3
{
}

- (void)setIpV4DetailsPrevSession:(id)a3
{
}

- (void)setIpV4Details:(id)a3
{
}

- (void)setInWowStateDuration:(double)a3
{
  self->_inWowStateDuration = a3;
}

- (void)setInVehicleEventCount:(unint64_t)a3
{
  self->_inVehicleEventCount = a3;
}

- (void)setInVehicleDuration:(double)a3
{
  self->_inVehicleDuration = a3;
}

- (void)setInSoftApDuration:(double)a3
{
  self->_inSoftApDuration = a3;
}

- (void)setInScoEventCount:(unint64_t)a3
{
  self->_inScoEventCount = a3;
}

- (void)setInScoDuration:(double)a3
{
  self->_inScoDuration = a3;
}

- (void)setInScanEventCount:(unint64_t)a3
{
  self->_inScanEventCount = a3;
}

- (void)setInScanDuration:(double)a3
{
  self->_inScanDuration = a3;
}

- (void)setInRoamSuppressionWaitForRoamStart:(double)a3
{
  self->_inRoamSuppressionWaitForRoamStart = a3;
}

- (void)setInRoamSuppressionWaitForRoamEnd:(double)a3
{
  self->_inRoamSuppressionWaitForRoamEnd = a3;
}

- (void)setInRoamSuppressionEnabledCount:(unint64_t)a3
{
  self->_inRoamSuppressionEnabledCount = a3;
}

- (void)setInRoamSuppressionEnabled:(double)a3
{
  self->_inRoamSuppressionEnabled = a3;
}

- (void)setInRoamEventCount:(unint64_t)a3
{
  self->_inRoamEventCount = a3;
}

- (void)setInRoamDuration:(double)a3
{
  self->_inRoamDuration = a3;
}

- (void)setInPoorLinkSessionDuration:(double)a3
{
  self->_inPoorLinkSessionDuration = a3;
}

- (void)setInPoorLinkSessionCount:(unint64_t)a3
{
  self->_inPoorLinkSessionCount = a3;
}

- (void)setInNetwork6eModeOffDuration:(double)a3
{
  self->_inNetwork6eModeOffDuration = a3;
}

- (void)setInMotionEventCount:(unint64_t)a3
{
  self->_inMotionEventCount = a3;
}

- (void)setInMotionDuration:(double)a3
{
  self->_inMotionDuration = a3;
}

- (void)setInLpasStateDuration:(double)a3
{
  self->_inLpasStateDuration = a3;
}

- (void)setInLowPowerStateDuration:(double)a3
{
  self->_inLowPowerStateDuration = a3;
}

- (void)setInHidPresentDuration:(double)a3
{
  self->_inHidPresentDuration = a3;
}

- (void)setInHidPresentCount:(unint64_t)a3
{
  self->_inHidPresentCount = a3;
}

- (void)setInControlCenterAutoJoinDisabledDuration:(double)a3
{
  self->_inControlCenterAutoJoinDisabledDuration = a3;
}

- (void)setInCompatibilityModeEnabledDuration:(double)a3
{
  self->_inCompatibilityModeEnabledDuration = a3;
}

- (void)setInCoexRealTimeAtSessionStart:(BOOL)a3
{
  self->_inCoexRealTimeAtSessionStart = a3;
}

- (void)setInCellularOutrankingDuration:(double)a3
{
  self->_inCellularOutrankingDuration = a3;
}

- (void)setInCellularFallbackDuration:(double)a3
{
  self->_inCellularFallbackDuration = a3;
}

- (void)setInCallEventCount:(unint64_t)a3
{
  self->_inCallEventCount = a3;
}

- (void)setInCallDuration:(double)a3
{
  self->_inCallDuration = a3;
}

- (void)setInBatterySaverStateDuration:(double)a3
{
  self->_inBatterySaverStateDuration = a3;
}

- (void)setInAwdlEventCount:(unint64_t)a3
{
  self->_inAwdlEventCount = a3;
}

- (void)setInAwdlDuration:(double)a3
{
  self->_inAwdlDuration = a3;
}

- (void)setInAWDL_WorstP2PScoreDuration:(double)a3
{
  self->_inAWDL_WorstP2PScoreDuration = a3;
}

- (void)setInAWDL_WorstInfraScoreDuration:(double)a3
{
  self->_inAWDL_WorstInfraScoreDuration = a3;
}

- (void)setInAWDL_BestP2PScoreDuration:(double)a3
{
  self->_inAWDL_BestP2PScoreDuration = a3;
}

- (void)setInAWDL_BestInfraScoreDuration:(double)a3
{
  self->_inAWDL_BestInfraScoreDuration = a3;
}

- (void)setInA2dpEventCount:(unint64_t)a3
{
  self->_inA2dpEventCount = a3;
}

- (void)setInA2dpDuration:(double)a3
{
  self->_inA2dpDuration = a3;
}

- (void)setIfStatsAtStart:(id)a3
{
}

- (void)setDriverUnavailabilityCount:(unint64_t)a3
{
  self->_driverUnavailabilityCount = a3;
}

- (void)setDriverAvailabilityLatencyFromTermination:(double)a3
{
  self->_driverAvailabilityLatencyFromTermination = a3;
}

- (void)setDriverAvailabilityLatencyFromChipReset:(double)a3
{
  self->_driverAvailabilityLatencyFromChipReset = a3;
}

- (void)setDisplayStateChangedCount:(unint64_t)a3
{
  self->_displayStateChangedCount = a3;
}

- (void)setCurrent_subsequentTdAfterJoinAfterTDCount:(unint64_t)a3
{
  self->_current_subsequentTdAfterJoinAfterTDCount = a3;
}

- (void)setCurrentRSSIStrongestCount:(unint64_t)a3
{
  self->_currentRSSIStrongestCount = a3;
}

- (void)setCountSSIDTransitionTargetInLastRoamScan:(unint64_t)a3
{
  self->_countSSIDTransitionTargetInLastRoamScan = a3;
}

- (void)setCountSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet:(unint64_t)a3
{
  self->_countSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet = a3;
}

- (void)setCountSSIDTransitionPotentialCandidatesInLastRoamScan:(unint64_t)a3
{
  self->_countSSIDTransitionPotentialCandidatesInLastRoamScan = a3;
}

- (void)setCountRoamScanThatFoundSSIDTransitionTarget:(unint64_t)a3
{
  self->_countRoamScanThatFoundSSIDTransitionTarget = a3;
}

- (void)setCountRoamScanThatFoundSSIDTransitionPotentialCandidate:(unint64_t)a3
{
  self->_countRoamScanThatFoundSSIDTransitionPotentialCandidate = a3;
}

- (void)setCountRoamScan:(unint64_t)a3
{
  self->_countRoamScan = a3;
}

- (void)setControlCenterToggleEventCount:(unint64_t)a3
{
  self->_controlCenterToggleEventCount = a3;
}

- (void)setControlCenterStateChangedCount:(unint64_t)a3
{
  self->_controlCenterStateChangedCount = a3;
}

- (void)setCompatibilityModeChangeCount:(unint64_t)a3
{
  self->_compatibilityModeChangeCount = a3;
}

- (void)setCompanionConnectionStateChangedCount:(unint64_t)a3
{
  self->_companionConnectionStateChangedCount = a3;
}

- (void)setCompanionConnectedDuration:(double)a3
{
  self->_companionConnectedDuration = a3;
}

- (void)setChargingEventCount:(unint64_t)a3
{
  self->_chargingEventCount = a3;
}

- (void)setChargingDuration:(double)a3
{
  self->_chargingDuration = a3;
}

- (void)setCellularOutrankingStateChangedCount:(unint64_t)a3
{
  self->_cellularOutrankingStateChangedCount = a3;
}

- (void)setCellularFallbackStateChangedCount:(unint64_t)a3
{
  self->_cellularFallbackStateChangedCount = a3;
}

- (void)setBatterySaverStateChangedCount:(unint64_t)a3
{
  self->_batterySaverStateChangedCount = a3;
}

- (void)setBandAtSessionStart:(int)a3
{
  self->_bandAtSessionStart = a3;
}

- (void)setAssociatedSleepDuration:(double)a3
{
  self->_associatedSleepDuration = a3;
}

- (void)setAssociatedDuration:(double)a3
{
  self->_associatedDuration = a3;
}

- (void)setApplicationStateChangedCount:(unint64_t)a3
{
  self->_applicationStateChangedCount = a3;
}

- (void)setAirplaneModeStateChangedCount:(unint64_t)a3
{
  self->_airplaneModeStateChangedCount = a3;
}

- (void)setActiveApplications:(id)a3
{
}

- (void)setSessionTimeSinceLastSession:(double)a3
{
  self->_sessionTimeSinceLastSession = a3;
}

- (WiFiUsageSession)initWithSessionType:(unint64_t)a3 andInterfaceName:(id)a4 andCapabilities:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  char v10 = [MEMORY[0x1E4F1C9C8] date];
  if (v8)
  {
    v21.receiver = self;
    v21.super_class = (Class)WiFiUsageSession;
    v11 = [(WiFiUsageSession *)&v21 init];
    [v11 setSessionInitTime:v10];
    [v11 setSessionPid:getpid()];
    [v11 setType:a3];
    [v11 setInterfaceName:v8];
    [v11 setCapabilities:v9];
    [v11 setSessionTimeSinceLastSession:-1.0];
    [v11 setIsSessionActive:0];
    [v11 setLastSystemWakeTime:v10];
    [v11 setLastPowerBudget:-1];
    [v11 setLastThermalIndex:-1];
    [v11 setLastJoinReason:-1];
    [v11 setPrevJoinReason:-1];
    [v11 setSavedLastJoinReason:-1];
    [v11 setLastJoinFailure:-1];
    [v11 setSavedLastJoinFailure:-1];
    [v11 setLastDisconnectReason:-1];
    [v11 setPreviousDisconnectReason:-1];
    [v11 setSavedPreviousDisconnectReason:-1];
    [v11 setLastDisconnectSubreason:-1];
    [v11 setSmartCoverStateChangedCount:0];
    [v11 setNetworkDetailsAtEnd:0];
    [v11 setCurrentBssSession:0];
    [v11 setResponsivenessScore:0];
    *((void *)v11 + 27) = 0;
    *(_OWORD *)(v11 + 200) = 0u;
    *(_OWORD *)(v11 + 184) = 0u;
    *(_OWORD *)(v11 + 168) = 0u;
    *(_OWORD *)(v11 + 152) = 0u;
    *(_OWORD *)(v11 + 136) = 0u;
    *(_OWORD *)(v11 + 120) = 0u;
    *(_OWORD *)(v11 + 104) = 0u;
    *(_OWORD *)(v11 + 88) = 0u;
    *(_OWORD *)(v11 + 72) = 0u;
    *(_OWORD *)(v11 + 56) = 0u;
    *(_OWORD *)(v11 + 40) = 0u;
    *(_OWORD *)(v11 + 24) = 0u;
    *(_OWORD *)(v11 + 8) = 0u;
    *((_OWORD *)v11 + 14) = 0u;
    *((_OWORD *)v11 + 15) = 0u;
    *((_OWORD *)v11 + 16) = 0u;
    *((_OWORD *)v11 + 17) = 0u;
    *((_OWORD *)v11 + 18) = 0u;
    *((_OWORD *)v11 + 19) = 0u;
    *((_OWORD *)v11 + 20) = 0u;
    *((_OWORD *)v11 + 21) = 0u;
    *((_OWORD *)v11 + 22) = 0u;
    *((_OWORD *)v11 + 23) = 0u;
    *((_OWORD *)v11 + 24) = 0u;
    *((_OWORD *)v11 + 25) = 0u;
    *((_OWORD *)v11 + 26) = 0u;
    *((_OWORD *)v11 + 27) = 0u;
    *((_OWORD *)v11 + 28) = 0u;
    *((_OWORD *)v11 + 29) = 0u;
    *((void *)v11 + 76) = 0;
    *((_OWORD *)v11 + 36) = 0u;
    *((_OWORD *)v11 + 37) = 0u;
    *((_OWORD *)v11 + 34) = 0u;
    *((_OWORD *)v11 + 35) = 0u;
    *((_OWORD *)v11 + 32) = 0u;
    *((_OWORD *)v11 + 33) = 0u;
    *((_OWORD *)v11 + 30) = 0u;
    *((_OWORD *)v11 + 31) = 0u;
    v12 = (void *)*((void *)v11 + 1126);
    if (v12)
    {
      [v12 removeAllObjects];
    }
    else
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      __int16 v15 = (void *)*((void *)v11 + 1126);
      *((void *)v11 + 1126) = v14;
    }
    [v11 setLastDriverUnavailableReason:0];
    [v11 setLastDriverTerminationTime:0];
    [v11 setLastChipResetTime:0];
    [v11 setDriverProcessLifespan:0.0];
    [v11 setDriverAvailabilityLifespan:0.0];
    [v11 setIsDriverAvailable:1];
    [v11 setDriverUnavailabilityCount:0];
    [v11 setLastDriverAvailableTime:v10];
    [v11 trackEventLatencies];
    id v16 = objc_opt_new();
    [v11 setRoamNeighborsByBand:v16];

    uint64_t v17 = objc_opt_new();
    [v11 setRoamCandidatesPerBandWhenSuccessful:v17];

    v18 = objc_opt_new();
    [v11 setRoamCandidatesPerBandWhenUnSuccessful:v18];

    v19 = objc_opt_new();
    [v11 setPrevNetworkNames:v19];

    [v11 setLastCoexRealTimeOn:0];
    [v11 setLastCoexRealTimeOff:0];
    [v11 setConsecutiveJoinFailureCount:0];
    v11[9019] = 0;
    self = v11;
    int v13 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[WiFiUsageSession initWithSessionType:andInterfaceName:andCapabilities:]";
      __int16 v24 = 2112;
      uint64_t v25 = 0;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Cannot create Session (invalid interfaceName: %@)", buf, 0x16u);
    }
    int v13 = 0;
  }

  return v13;
}

- (void)setCompletionHandler:(id)a3 withContext:(id)a4 onQueue:(id)a5
{
  id v9 = a5;
  id v8 = a4;
  [(WiFiUsageSession *)self setCompletionHandler:a3];
  [(WiFiUsageSession *)self setCompletionContext:v8];

  [(WiFiUsageSession *)self setCompletionQueue:v9];
}

- (void)setLastDisconnectReason:(int64_t)a3
{
  uint64_t v5 = +[WiFiUsageSession disconnectReasonString:](WiFiUsageSession, "disconnectReasonString:");
  uint64_t v7 = v5;
  self->_lastDisconnectReason = a3;
  if (v5)
  {
    uint64_t v15 = v5;
    id v8 = [NSString stringWithFormat:@"WiFiDisconnectReason%@", v5];
    id v9 = [(NSMutableDictionary *)self->_disconnectReasonMap objectForKeyedSubscript:v8];

    disconnectReasonMap = self->_disconnectReasonMap;
    if (v9)
    {
      v11 = [(NSMutableDictionary *)disconnectReasonMap objectForKeyedSubscript:v8];
      uint64_t v12 = [v11 integerValue];

      int v13 = self->_disconnectReasonMap;
      id v14 = [NSNumber numberWithInteger:v12 + 1];
      [(NSMutableDictionary *)v13 setObject:v14 forKey:v8];
    }
    else
    {
      [(NSMutableDictionary *)disconnectReasonMap setObject:&unk_1F2B949C0 forKey:v8];
    }

    uint64_t v7 = v15;
  }

  MEMORY[0x1F41817F8](v5, v7, v6);
}

- (void)systemWakeStateDidChange:(BOOL)a3 wokenByWiFi:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  v11 = v7;
  if (v5)
  {
    ++self->_systemWakeStateChangedCount;
    if (v4) {
      ++self->_systemWokenByWiFiCount;
    }
    [(WiFiUsageSession *)self setLastSystemWakeTime:v7];
    lastSystemSleepTime = self->_lastSystemSleepTime;
    if (lastSystemSleepTime)
    {
      if (self->_lastLinkStateChangedTime)
      {
        -[NSDate timeIntervalSinceDate:](v11, "timeIntervalSinceDate:");
        lastSystemSleepTime = 0;
        self->_associatedSleepDuration = v9 + self->_associatedSleepDuration;
      }
      else
      {
        lastSystemSleepTime = 0;
      }
    }
  }
  else
  {
    lastSystemSleepTime = v7;
    if (self->_lastSystemWakeTime)
    {
      [(NSDate *)v7 timeIntervalSinceDate:self->_lastSystemWakeTime];
      self->_systemAwakeDuration = v10 + self->_systemAwakeDuration;
      [(WiFiUsageSession *)self setLastSystemWakeTime:v11];
      lastSystemSleepTime = v11;
    }
  }
  [(WiFiUsageSession *)self setLastSystemSleepTime:lastSystemSleepTime];
}

- (void)lockStateDidChange:(BOOL)a3
{
  if (a3) {
    ++self->_lockStateChangedCount;
  }
  self->_isUnlocked = !a3;
}

- (void)displayStateDidChange:(BOOL)a3
{
  if (a3) {
    ++self->_displayStateChangedCount;
  }
  self->_isDisplayOn = a3;
}

- (void)motionStateDidChange:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v12 = [v4 date];
  int v6 = [v5 isEqualToString:@"Stationary"];
  uint64_t v7 = [v5 containsString:@"Driving"];
  int v8 = [v5 isEqualToString:@"Walking"];

  if (v6)
  {
    if (self->_inMotionStartedTime)
    {
      objc_msgSend(v12, "timeIntervalSinceDate:");
      self->_inMotionDuration = v9 + self->_inMotionDuration;
      [(WiFiUsageSession *)self setInMotionStartedTime:0];
    }
    if (v7) {
      goto LABEL_5;
    }
  }
  else
  {
    [(WiFiUsageSession *)self setInMotionStartedTime:v12];
    ++self->_inMotionEventCount;
    if (v7)
    {
LABEL_5:
      [(WiFiUsageSession *)self setInVehicleEntryTime:v12];
      ++self->_inVehicleEventCount;
      goto LABEL_9;
    }
  }
  if (self->_inVehicleEntryTime)
  {
    objc_msgSend(v12, "timeIntervalSinceDate:");
    self->_inVehicleDuration = v10 + self->_inVehicleDuration;
    [(WiFiUsageSession *)self setInVehicleEntryTime:0];
  }
LABEL_9:
  if (v8)
  {
    [(WiFiUsageSession *)self setInWalkingEntryTime:v12];
    ++self->_inWalkingEventCount;
  }
  else if (self->_inWalkingEntryTime)
  {
    objc_msgSend(v12, "timeIntervalSinceDate:");
    self->_inWalkingDuration = v11 + self->_inWalkingDuration;
    [(WiFiUsageSession *)self setInWalkingEntryTime:0];
  }
  [(WiFiUsageBssSession *)self->_currentBssSession motionStateDidChange:v6 ^ 1u andVehicularState:v7];
}

- (void)callStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = v5;
  if (v3)
  {
    [(WiFiUsageSession *)self setCallStartedTime:v5];
    ++self->_inCallEventCount;
  }
  else if (self->_callStartedTime)
  {
    objc_msgSend(v5, "timeIntervalSinceDate:");
    self->_inCallDuration = v6 + self->_inCallDuration;
    [(WiFiUsageSession *)self setCallStartedTime:0];
  }
  [(WiFiUsageBssSession *)self->_currentBssSession callStateDidChange:v3];
}

- (void)smartCoverStateDidChange:(id)a3
{
}

- (void)mediaStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  double v6 = v5;
  if (v3)
  {
    double v9 = v5;
    id v5 = (void *)[(WiFiUsageSession *)self setMediaStartedTime:v5];
    double v6 = v9;
    ++self->_mediaPlaybackEventCount;
  }
  else
  {
    mediaStartedTime = self->_mediaStartedTime;
    if (mediaStartedTime)
    {
      double v10 = v5;
      objc_msgSend(v5, "timeIntervalSinceDate:");
      self->_mediaPlaybackDuration = v8 + self->_mediaPlaybackDuration;
      id v5 = (void *)[(WiFiUsageSession *)self setMediaStartedTime:0];
      double v6 = v10;
    }
  }

  MEMORY[0x1F41817F8](v5, v6, mediaStartedTime);
}

- (void)chargingStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  double v6 = v5;
  if (v3)
  {
    double v9 = v5;
    id v5 = (void *)[(WiFiUsageSession *)self setChargingStartedTime:v5];
    double v6 = v9;
    ++self->_chargingEventCount;
  }
  else
  {
    chargingStartedTime = self->_chargingStartedTime;
    if (chargingStartedTime)
    {
      double v10 = v5;
      objc_msgSend(v5, "timeIntervalSinceDate:");
      self->_chargingDuration = v8 + self->_chargingDuration;
      id v5 = (void *)[(WiFiUsageSession *)self setChargingStartedTime:0];
      double v6 = v10;
    }
  }

  MEMORY[0x1F41817F8](v5, v6, chargingStartedTime);
}

- (void)companionStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  double v6 = v5;
  if (v3)
  {
    double v9 = v5;
    id v5 = (void *)[(WiFiUsageSession *)self setCompanionConnectionTime:v5];
    double v6 = v9;
    ++self->_companionConnectionStateChangedCount;
  }
  else
  {
    companionConnectionTime = self->_companionConnectionTime;
    if (companionConnectionTime)
    {
      double v10 = v5;
      objc_msgSend(v5, "timeIntervalSinceDate:");
      self->_companionConnectedDuration = v8 + self->_companionConnectedDuration;
      id v5 = (void *)[(WiFiUsageSession *)self setCompanionConnectionTime:0];
      double v6 = v10;
    }
  }

  MEMORY[0x1F41817F8](v5, v6, companionConnectionTime);
}

- (void)updateWowState:(BOOL)a3 lpasState:(BOOL)a4 lowPowerState:(BOOL)a5 batterySaverState:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  id v19 = [MEMORY[0x1E4F1C9C8] date];
  wowStateEntryTime = self->_wowStateEntryTime;
  if (v9)
  {
    if (!wowStateEntryTime)
    {
      [(WiFiUsageSession *)self setWowStateEntryTime:v19];
      ++self->_wowStateChangedCount;
    }
  }
  else if (wowStateEntryTime)
  {
    objc_msgSend(v19, "timeIntervalSinceDate:");
    self->_inWowStateDuration = v12 + self->_inWowStateDuration;
    [(WiFiUsageSession *)self setWowStateEntryTime:0];
  }
  lpasStateEntryTime = self->_lpasStateEntryTime;
  if (v8)
  {
    if (!lpasStateEntryTime)
    {
      [(WiFiUsageSession *)self setLpasStateEntryTime:v19];
      ++self->_lpasStateChangedCount;
    }
  }
  else if (lpasStateEntryTime)
  {
    objc_msgSend(v19, "timeIntervalSinceDate:");
    self->_inLpasStateDuration = v14 + self->_inLpasStateDuration;
    [(WiFiUsageSession *)self setLpasStateEntryTime:0];
  }
  lowPowerStateEntryTime = self->_lowPowerStateEntryTime;
  if (v7)
  {
    if (!lowPowerStateEntryTime)
    {
      [(WiFiUsageSession *)self setLowPowerStateEntryTime:v19];
      ++self->_lowPowerStateChangedCount;
    }
  }
  else if (lowPowerStateEntryTime)
  {
    objc_msgSend(v19, "timeIntervalSinceDate:");
    self->_inLowPowerStateDuration = v16 + self->_inLowPowerStateDuration;
    [(WiFiUsageSession *)self setLowPowerStateEntryTime:0];
  }
  batterySaverStateEntryTime = self->_batterySaverStateEntryTime;
  if (v6)
  {
    if (!batterySaverStateEntryTime)
    {
      [(WiFiUsageSession *)self setBatterySaverStateEntryTime:v19];
      ++self->_batterySaverStateChangedCount;
    }
  }
  else if (batterySaverStateEntryTime)
  {
    objc_msgSend(v19, "timeIntervalSinceDate:");
    self->_inBatterySaverStateDuration = v18 + self->_inBatterySaverStateDuration;
    [(WiFiUsageSession *)self setBatterySaverStateEntryTime:0];
  }
}

- (void)updateSleepPowerStats:(double)a3 unassociatedDuration:(double)a4 associatedDuration:(double)a5 roamingDuration:(double)a6
{
  self->_sleepPowerStatsTotalDuration = self->_sleepPowerStatsTotalDuration + a3;
  self->_sleepPowerStatsUnassociatedDuration = self->_sleepPowerStatsUnassociatedDuration + a4;
  self->_sleepPowerStatsAssociatedDuration = self->_sleepPowerStatsAssociatedDuration + a5;
  self->_sleepPowerStatsRoamingDuration = self->_sleepPowerStatsRoamingDuration + a6;
}

- (void)updateBandUsageFor:(int)a3 With:(id)a4
{
  lastBssChangedTime = (NSDate *)a4;
  BOOL v8 = lastBssChangedTime;
  if (a3 <= 2)
  {
    lastBssChangedTime = self->_lastBssChangedTime;
    if (lastBssChangedTime)
    {
      uint64_t v17 = v8;
      [(NSDate *)lastBssChangedTime timeIntervalSinceDate:self->_sessionStartTime];
      uint64_t v9 = 9256;
      if (v10 > 0.0) {
        uint64_t v9 = 9456;
      }
      double v11 = *(Class *)((char *)&self->super.isa + v9);
      p_bandUsageDuration = &self->_bandUsageDuration;
      valid = self->_bandUsageDuration.valid;
      uint64_t v14 = a3;
      if (!valid[a3]) {
        p_bandUsageDuration->valueByBand[a3] = 0.0;
      }
      id v15 = v11;
      [(NSDate *)v17 timeIntervalSinceDate:v15];
      p_bandUsageDuration->valueByBand[v14] = v16 + p_bandUsageDuration->valueByBand[v14];
      valid[v14] = 1;

      BOOL v8 = v17;
    }
  }

  MEMORY[0x1F41817F8](lastBssChangedTime, v8, v7);
}

- (BOOL)useSavedJoinStats
{
  return 0;
}

- (void)joinStateDidChange:(id)a3 withReason:(unint64_t)a4 lastDisconnectReason:(int64_t)a5 lastJoinFailure:(int64_t)a6 andNetworkDetails:(id)a7
{
  id v20 = a7;
  double v12 = [MEMORY[0x1E4F1C9C8] date];
  if (a3)
  {
    if ([(WiFiUsageSession *)self useSavedJoinStats])
    {
      unint64_t lastJoinReason = self->_lastJoinReason;
      if (lastJoinReason != -1)
      {
        long long v14 = *(_OWORD *)&self->_joinReasonCount[10];
        *(_OWORD *)&self->_savedJoinReasonCount[8] = *(_OWORD *)&self->_joinReasonCount[8];
        *(_OWORD *)&self->_savedJoinReasonCount[10] = v14;
        *(_OWORD *)&self->_savedJoinReasonCount[12] = *(_OWORD *)&self->_joinReasonCount[12];
        self->_savedJoinReasonCount[14] = self->_joinReasonCount[14];
        long long v15 = *(_OWORD *)&self->_joinReasonCount[2];
        *(_OWORD *)self->_savedJoinReasonCount = *(_OWORD *)self->_joinReasonCount;
        *(_OWORD *)&self->_savedJoinReasonCount[2] = v15;
        long long v16 = *(_OWORD *)&self->_joinReasonCount[6];
        *(_OWORD *)&self->_savedJoinReasonCount[4] = *(_OWORD *)&self->_joinReasonCount[4];
        *(_OWORD *)&self->_savedJoinReasonCount[6] = v16;
        self->_savedJoinStateChangedCount = self->_joinStateChangedCount;
        self->_savedPrevJoinReason = self->_prevJoinReason;
        self->_savedTimeSincePrevJoin = self->_timeSincePrevJoin;
        self->_savedInCoexRealTimeAtLastJoin = self->_inCoexRealTimeAtLastJoin;
        self->_savedLastJoinReason = lastJoinReason;
        self->_savedPreviousDisconnectReason = self->_previousDisconnectReason;
        self->_savedLastJoinFailure = self->_lastJoinFailure;
      }
    }
    if (!self->_lastJoinFailure) {
      [(WiFiUsageSession *)self setConsecutiveJoinFailureCount:0];
    }
    ++self->_joinStateChangedCount;
    ++self->_joinReasonCount[a4];
    [(WiFiUsageSession *)self setPrevJoinReason:self->_lastJoinReason];
    [v12 timeIntervalSinceDate:self->_lastJoinTime];
    -[WiFiUsageSession setTimeSincePrevJoin:](self, "setTimeSincePrevJoin:");
    [(WiFiUsageSession *)self setLastJoinTime:v12];
    [(WiFiUsageSession *)self setInCoexRealTimeAtLastJoin:self->_inCoexRealTime];
    [(WiFiUsageSession *)self setLastJoinReason:a4];
    [(WiFiUsageSession *)self setPreviousDisconnectReason:self->_lastDisconnectReason];
    [(WiFiUsageSession *)self setLastDisconnectReason:0];
    [(WiFiUsageSession *)self setLastDisconnectSubreason:0];
    [(WiFiUsageSession *)self setLastJoinFailure:0];
    if (self->_joinStartedLatencyFromDriverAvailability == 0.0 && self->_lastDriverAvailableTime)
    {
      objc_msgSend(v12, "timeIntervalSinceDate:");
      -[WiFiUsageSession setJoinStartedLatencyFromDriverAvailability:](self, "setJoinStartedLatencyFromDriverAvailability:");
    }
  }
  else
  {
    [(WiFiUsageSession *)self setPreviousDisconnectReason:self->_lastDisconnectReason];
    [(WiFiUsageSession *)self setLastDisconnectReason:a5];
    [(WiFiUsageSession *)self setLastJoinFailure:a6];
    if ([(WiFiUsageSession *)self useSavedJoinStats] && self->_lastJoinReason != -1)
    {
      self->_savedPreviousDisconnectReason = self->_previousDisconnectReason;
      self->_savedLastJoinFailure = self->_lastJoinFailure;
    }
    if (a6) {
      ++self->_consecutiveJoinFailureCount;
    }
  }
  if (self->_rssiAtSessionStart == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v17 = [v20 connectedBss];
    if ([v17 rssi] != 0x7FFFFFFFFFFFFFFFLL)
    {
      double v18 = [v20 connectedBss];
      uint64_t v19 = [v18 rssi];

      if (!v19) {
        goto LABEL_20;
      }
      uint64_t v17 = [v20 connectedBss];
      self->_rssiAtSessionStart = [v17 rssi];
    }
  }
LABEL_20:
}

- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7
{
  BOOL v53 = a4;
  BOOL v55 = a3;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v8 = a7;
  uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
  double v10 = [(WiFiUsageBssSession *)self->_currentBssSession originBssDetails];
  double v11 = [v10 bssid];

  double v12 = [v8 connectedBss];
  uint64_t v13 = [v12 bssid];

  long long v14 = [(WiFiUsageNetworkDetails *)self->_networkDetails connectedBss];
  unsigned int v54 = [v14 band];

  long long v15 = [v8 connectedBss];
  self->_currentBand = [v15 band];

  long long v16 = [(WiFiUsageNetworkDetails *)self->_networkDetails connectedBss];
  uint64_t v17 = [v16 channel];

  double v18 = [v8 connectedBss];
  uint64_t v19 = [v18 channel];

  id v20 = [v8 connectedBss];
  objc_super v21 = +[WiFiUsageAccessPointProfile profileForBSSID:v13];
  [v20 setApProfile:v21];

  v22 = v11;
  v56 = (void *)v13;
  BOOL v23 = 1;
  if ([v11 isEqual:v13] && v17 == v19) {
    BOOL v23 = v54 != self->_currentBand;
  }
  p_isAssociated = &self->_isAssociated;
  uint64_t v25 = v9;
  if (v55)
  {
    if (!*p_isAssociated)
    {
      [v9 timeIntervalSinceDate:self->_sessionStartTime];
      -[WiFiUsageSession setJoinLinkUpLatencyFromSessionStart:](self, "setJoinLinkUpLatencyFromSessionStart:");
    }
    BOOL *p_isAssociated = 1;
    networkDetails = self->_networkDetails;
    if (networkDetails
      && ([(WiFiUsageNetworkDetails *)networkDetails networkName],
          v27 = objc_claimAutoreleasedReturnValue(),
          [v8 networkName],
          v28 = objc_claimAutoreleasedReturnValue(),
          char v29 = [v27 isEqualToString:v28],
          v28,
          v27,
          (v29 & 1) == 0))
    {
      ++self->_networkChangedCount;
      if ([(NSMutableArray *)self->_prevNetworkNames count]
        && (unint64_t)[(NSMutableArray *)self->_prevNetworkNames count] >= 2)
      {
        [(NSMutableArray *)self->_prevNetworkNames removeObjectAtIndex:0];
      }
      v40 = [(WiFiUsageNetworkDetails *)self->_networkDetails networkName];

      if (!v40) {
        goto LABEL_38;
      }
      prevNetworkNames = self->_prevNetworkNames;
      v34 = [(WiFiUsageNetworkDetails *)self->_networkDetails networkName];
      [(NSMutableArray *)prevNetworkNames addObject:v34];
    }
    else
    {
      if (v22 && (!v23 || !self->_lastBssChangedTime || !self->_networkDetails)) {
        goto LABEL_38;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        v30 = [(WiFiUsageSession *)self sessionName];
        v31 = +[WiFiUsagePrivacyFilter bandAsString:v54];
        v32 = +[WiFiUsagePrivacyFilter bandAsString:self->_currentBand];
        *(_DWORD *)buf = 136317442;
        v58 = "-[WiFiUsageSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]";
        __int16 v59 = 2112;
        v60 = v30;
        __int16 v61 = 2160;
        uint64_t v62 = 1752392040;
        __int16 v63 = 2112;
        v64 = v22;
        __int16 v65 = 1024;
        int v66 = v17;
        __int16 v67 = 2112;
        v68 = v31;
        __int16 v69 = 2160;
        uint64_t v70 = 1752392040;
        __int16 v71 = 2112;
        v72 = v56;
        __int16 v73 = 1024;
        int v74 = v19;
        __int16 v75 = 2112;
        v76 = v32;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: %@: roamed from BSSID %{mask.hash}@ on channel %d(%@Ghz) to BSSID %{mask.hash}@ on channel %d(%@Ghz)", buf, 0x5Eu);
      }
      if ([(WiFiUsageSession *)self isSessionActive] && self->_lastBssChangedTime) {
        [(WiFiUsageSession *)self updateBandUsageFor:v54 With:v25];
      }
      [(WiFiUsageSession *)self setLastBssChangedTime:v25];
      currentBssSession = self->_currentBssSession;
      v34 = [v8 bssEnvironment];
      v35 = [v8 connectedBss];
      [(WiFiUsageBssSession *)currentBssSession bssDidChange:v34 withDetails:v35];
    }
LABEL_38:
    if (v8 && !self->_currentBssSession && self->_type == 4)
    {
      v42 = [WiFiUsageBssSession alloc];
      interfaceName = self->_interfaceName;
      v44 = [v8 bssEnvironment];
      v45 = [v8 connectedBss];
      v46 = [(WiFiUsageBssSession *)v42 initWithInterfaceName:interfaceName bssEnvironment:v44 andBssDetails:v45 andNetworkDetails:v8];
      [(WiFiUsageSession *)self setCurrentBssSession:v46];
    }
    ++self->_linkStateChangedCount;
    if (self->_lastLinkStateChangedTime)
    {
      objc_msgSend(v25, "timeIntervalSinceDate:");
      if (v47 > self->_longestUnassociatedDuration) {
        self->_longestUnassociatedDuration = v47;
      }
    }
    if (self->_lastUnexpectedLinkDownTime)
    {
      objc_msgSend(v25, "timeIntervalSinceDate:");
      if (v48 < 20.0) {
        ++self->_rapidLinkTransitionCount;
      }
    }
    [(WiFiUsageSession *)self setLastUnexpectedLinkDownTime:0];
    if (!self->_lastLinkStateChangedTime) {
      [(WiFiUsageSession *)self setLastLinkStateChangedTime:v25];
    }
    if (!self->_lastBssChangedTime) {
      [(WiFiUsageSession *)self setLastBssChangedTime:v25];
    }
    if (self->_joinLinkUpLatencyFromDriverAvailability == 0.0 && self->_lastDriverAvailableTime)
    {
      objc_msgSend(v25, "timeIntervalSinceDate:");
      -[WiFiUsageSession setJoinLinkUpLatencyFromDriverAvailability:](self, "setJoinLinkUpLatencyFromDriverAvailability:");
    }
    v49 = [v8 connectedBss];
    unsigned int v50 = +[WiFiUsageLQMTransformations maxPhyModeFrom:](WiFiUsageLQMTransformations, "maxPhyModeFrom:", [v49 phyMode]);

    if (v50 > self->_maxPhyMode) {
      self->_maxPhyMode = v50;
    }
    goto LABEL_57;
  }
  BOOL *p_isAssociated = 0;
  if (![(WiFiUsageSession *)self lastDisconnectReason])
  {
    [(WiFiUsageSession *)self setLastDisconnectReason:a5];
    [(WiFiUsageSession *)self setLastDisconnectSubreason:a6];
  }
  if (v53) {
    v36 = v9;
  }
  else {
    v36 = 0;
  }
  [(WiFiUsageSession *)self setLastUnexpectedLinkDownTime:v36];
  [(WiFiUsageSession *)self tallyAssociatedDuration:v9];
  if (self->_lastBssChangedTime)
  {
    v37 = self->_networkDetails;
    if (v37)
    {
      v38 = [(WiFiUsageNetworkDetails *)v37 connectedBss];
      -[WiFiUsageSession updateBandUsageFor:With:](self, "updateBandUsageFor:With:", [v38 band], v9);
    }
    [(WiFiUsageSession *)self setLastBssChangedTime:0];
  }
  v39 = self->_currentBssSession;
  if (v39) {
    [(WiFiUsageBssSession *)v39 bssDidChange:0 withDetails:0];
  }
  if (self->_lastAWDLSequenceUpdate)
  {
    [(WiFiUsageSession *)self tallyInfraScoreDuration:0 until:v9];
    [(WiFiUsageSession *)self tallyP2PScoreDuration:v9 until:self->_inAWDL_lastP2PScore];
    objc_storeStrong((id *)&self->_lastAWDLSequenceUpdate, v9);
  }
LABEL_57:
  -[WiFiUsageSession setIsInstantHotspot:](self, "setIsInstantHotspot:", [v8 isInstantHotspot]);
  -[WiFiUsageSession setIsAutoHotspot:](self, "setIsAutoHotspot:", [v8 isAutoHotspot]);
  [(WiFiUsageSession *)self updateAssociatedNetworkDetails:v8];
}

- (void)updateApProfile:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (self->_networkDetails)
  {
    BOOL v6 = [v4 bssid];
    uint64_t v7 = [(WiFiUsageNetworkDetails *)self->_networkDetails connectedBss];
    id v8 = [v7 bssid];

    if (v6 == v8)
    {
      uint64_t v9 = [(WiFiUsageNetworkDetails *)self->_networkDetails connectedBss];
      double v10 = [v5 apProfile];
      [v9 setApProfile:v10];

      goto LABEL_6;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(WiFiUsageSession *)self sessionName];
      int v11 = 136315394;
      double v12 = "-[WiFiUsageSession updateApProfile:]";
      __int16 v13 = 2112;
      long long v14 = v9;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - mismatched BSSID between beaconData and connectedBss - not updating session %@", (uint8_t *)&v11, 0x16u);
LABEL_6:
    }
  }
}

- (void)powerBudgetDidChange:(int64_t)a3 andThermalIndex:(int64_t)a4
{
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  int64_t lastPowerBudget = self->_lastPowerBudget;
  id v14 = v7;
  if (lastPowerBudget <= 99)
  {
    if (lastPowerBudget <= 89)
    {
      if (lastPowerBudget <= 79)
      {
        if (lastPowerBudget <= 69)
        {
          if (lastPowerBudget <= 59)
          {
            if (lastPowerBudget <= 49)
            {
              if (lastPowerBudget <= 39)
              {
                if (lastPowerBudget <= 29)
                {
                  if (lastPowerBudget <= 19)
                  {
                    if (lastPowerBudget <= 9)
                    {
                      if (lastPowerBudget < 0) {
                        goto LABEL_24;
                      }
                      uint64_t v9 = 10112;
                    }
                    else
                    {
                      uint64_t v9 = 10104;
                    }
                  }
                  else
                  {
                    uint64_t v9 = 10096;
                  }
                }
                else
                {
                  uint64_t v9 = 10088;
                }
              }
              else
              {
                uint64_t v9 = 10080;
              }
            }
            else
            {
              uint64_t v9 = 10072;
            }
          }
          else
          {
            uint64_t v9 = 10064;
          }
        }
        else
        {
          uint64_t v9 = 10056;
        }
      }
      else
      {
        uint64_t v9 = 10048;
      }
    }
    else
    {
      uint64_t v9 = 10040;
    }
  }
  else
  {
    uint64_t v9 = 10032;
  }
  [v7 timeIntervalSinceDate:self->_lastPowerBudgetChangedTime];
  uint64_t v7 = v14;
  *(double *)((char *)&self->super.isa + v9) = v10 + *(double *)((char *)&self->super.isa + v9);
LABEL_24:
  int64_t lastThermalIndex = self->_lastThermalIndex;
  if (lastThermalIndex <= 99)
  {
    if (lastThermalIndex <= 89)
    {
      if (lastThermalIndex <= 79)
      {
        if (lastThermalIndex <= 69)
        {
          if (lastThermalIndex <= 59)
          {
            if (lastThermalIndex <= 49)
            {
              if (lastThermalIndex <= 39)
              {
                if (lastThermalIndex <= 29)
                {
                  if (lastThermalIndex <= 19)
                  {
                    if (lastThermalIndex <= 9)
                    {
                      if (lastThermalIndex < 0) {
                        goto LABEL_47;
                      }
                      uint64_t v12 = 10200;
                      uint64_t v7 = v14;
                    }
                    else
                    {
                      uint64_t v12 = 10192;
                    }
                  }
                  else
                  {
                    uint64_t v12 = 10184;
                  }
                }
                else
                {
                  uint64_t v12 = 10176;
                }
              }
              else
              {
                uint64_t v12 = 10168;
              }
            }
            else
            {
              uint64_t v12 = 10160;
            }
          }
          else
          {
            uint64_t v12 = 10152;
          }
        }
        else
        {
          uint64_t v12 = 10144;
        }
      }
      else
      {
        uint64_t v12 = 10136;
      }
    }
    else
    {
      uint64_t v12 = 10128;
    }
  }
  else
  {
    uint64_t v12 = 10120;
  }
  [v7 timeIntervalSinceDate:self->_lastPowerBudgetChangedTime];
  *(double *)((char *)&self->super.isa + v12) = v13 + *(double *)((char *)&self->super.isa + v12);
LABEL_47:
  [(WiFiUsageSession *)self setLastPowerBudget:a3];
  [(WiFiUsageSession *)self setLastThermalIndex:a4];
  [(WiFiUsageSession *)self setLastPowerBudgetChangedTime:v14];
}

- (void)bluetoothStateDidChange:(BOOL)a3 connectedDeviceCount:(unint64_t)a4 inA2dp:(BOOL)a5 inSco:(BOOL)a6 inUniAoS:(BOOL)a7 inBiAoS:(BOOL)a8 btAudioBand:(BOOL)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  BOOL v14 = a3;
  long long v16 = [MEMORY[0x1E4F1C9C8] date];
  id v21 = v16;
  if (v12)
  {
    [(WiFiUsageSession *)self setA2dpActiveTime:v16];
    ++self->_inA2dpEventCount;
  }
  else if (self->_a2dpActiveTime)
  {
    objc_msgSend(v16, "timeIntervalSinceDate:");
    self->_inA2dpDuration = v17 + self->_inA2dpDuration;
    [(WiFiUsageSession *)self setA2dpActiveTime:0];
  }
  if (v11)
  {
    [(WiFiUsageSession *)self setScoActiveTime:v21];
    ++self->_inScoEventCount;
  }
  else if (self->_scoActiveTime)
  {
    objc_msgSend(v21, "timeIntervalSinceDate:");
    self->_inScoDuration = v18 + self->_inScoDuration;
    [(WiFiUsageSession *)self setScoActiveTime:0];
  }
  if (a4)
  {
    [(WiFiUsageSession *)self setHidPresentTime:v21];
    ++self->_inHidPresentCount;
  }
  else if (self->_hidPresentTime)
  {
    objc_msgSend(v21, "timeIntervalSinceDate:");
    self->_inHidPresentDuration = v19 + self->_inHidPresentDuration;
    [(WiFiUsageSession *)self setHidPresentTime:0];
  }
  self->_isA2DPActive = v12;
  self->_isSCOActive = v11;
  self->_isUniAoSActive = a7;
  self->_isBiAoSActive = a8;
  if (a9) {
    id v20 = @"5";
  }
  else {
    id v20 = @"2.4";
  }
  objc_storeStrong((id *)&self->_btAudioBand, v20);
  [(WiFiUsageBssSession *)self->_currentBssSession bluetoothStateDidChange:v14 connectedDeviceCount:a4 inA2dp:v12 inSco:v11];
}

- (void)awdlStateDidChange:(BOOL)a3 inMode:(int64_t)a4
{
  BOOL v5 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  id v9 = v7;
  if (v5)
  {
    [(WiFiUsageSession *)self setAwdlActiveTime:v7];
    ++self->_inAwdlEventCount;
  }
  else if (self->_awdlActiveTime)
  {
    objc_msgSend(v7, "timeIntervalSinceDate:");
    self->_inAwdlDuration = v8 + self->_inAwdlDuration;
    [(WiFiUsageSession *)self setAwdlActiveTime:0];
  }
  [(WiFiUsageBssSession *)self->_currentBssSession awdlStateDidChange:v5 inMode:a4];
}

- (void)softApStateDidChange:(BOOL)a3 requester:(id)a4 status:(id)a5 changeReason:(id)a6 channelNumber:(unint64_t)a7 countryCode:(unint64_t)a8 isHidden:(BOOL)a9 isInfraConnected:(BOOL)a10 isAwdlUp:(BOOL)a11 lowPowerModeDuration:(double)a12 compatibilityMode:(BOOL)a13 requestToUpLatency:(double)a14
{
  BOOL v14 = a3;
  long long v16 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", a3, a4, a5, a6, a7, a8, a12, a14);
  double v17 = v16;
  if (v14)
  {
    id v20 = v16;
    long long v16 = (void *)[(WiFiUsageSession *)self setSoftApActiveTime:v16];
    double v17 = v20;
    ++self->_inSoftApEventCount;
  }
  else
  {
    softApActiveTime = self->_softApActiveTime;
    if (softApActiveTime)
    {
      id v21 = v16;
      objc_msgSend(v16, "timeIntervalSinceDate:");
      self->_inSoftApDuration = v19 + self->_inSoftApDuration;
      long long v16 = (void *)[(WiFiUsageSession *)self setSoftApActiveTime:0];
      double v17 = v21;
    }
  }

  MEMORY[0x1F41817F8](v16, v17, softApActiveTime);
}

- (void)roamingStateDidChange:(BOOL)a3 reason:(unint64_t)a4 andStatus:(unint64_t)a5 andLatency:(unint64_t)a6 andRoamData:(id)a7 andPingPongStats:(id)a8
{
  BOOL v11 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v13 = a7;
  id v14 = a8;
  uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
  long long v16 = v15;
  if (v11)
  {
    [(WiFiUsageSession *)self setRoamingActiveTime:v15];
    ++self->_inRoamEventCount;
    if (self->_lastRoamSuppressionToggled)
    {
      if (!self->_isRoamSuppressionEnabled && !self->_roamsAfterSupprLifted)
      {
        objc_msgSend(v16, "timeIntervalSinceDate:");
        self->_double inRoamSuppressionWaitForRoamStart = v17 + self->_inRoamSuppressionWaitForRoamStart;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          double inRoamSuppressionWaitForRoamStart = self->_inRoamSuppressionWaitForRoamStart;
          int v27 = 136315394;
          v28 = "-[WiFiUsageSession roamingStateDidChange:reason:andStatus:andLatency:andRoamData:andPingPongStats:]";
          __int16 v29 = 2048;
          double v30 = inRoamSuppressionWaitForRoamStart;
          _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - incremented inRoamSuppressionWaitForRoamStart:%fs", (uint8_t *)&v27, 0x16u);
        }
      }
    }
    switch(a4)
    {
      case 0xE0820C00uLL:
        ++self->_roamReasonInitialAssociationCount;
        break;
      case 0xE0820C01uLL:
        ++self->_roamReasonLowRssiCount;
        break;
      case 0xE0820C02uLL:
      case 0xE0820C03uLL:
        ++self->_roamReasonDeauthDisassocCount;
        break;
      case 0xE0820C04uLL:
        ++self->_roamReasonBeaconLostCount;
        break;
      case 0xE0820C06uLL:
        ++self->_roamReasonSteeredByApCount;
        break;
      case 0xE0820C08uLL:
        ++self->_roamReasonBetterCandidateCount;
        break;
      case 0xE0820C09uLL:
      case 0xE0820C0AuLL:
      case 0xE0820C0CuLL:
      case 0xE0820C0FuLL:
        ++self->_roamReasonBetterConditionCount;
        break;
      case 0xE0820C0BuLL:
        ++self->_roamReasonSteeredByBtmCount;
        break;
      case 0xE0820C0EuLL:
        ++self->_roamReasonSteeredByCsaCount;
        break;
      case 0xE0820C13uLL:
        ++self->_roamReasonReassocRequestedCount;
        break;
      case 0xE0820C15uLL:
        ++self->_roamReasonHostTriggeredCount;
        break;
      default:
        ++self->_roamReasonMiscCount;
        break;
    }
    goto LABEL_25;
  }
  if (!self->_roamingActiveTime) {
    goto LABEL_25;
  }
  objc_msgSend(v15, "timeIntervalSinceDate:");
  self->_inRoamDuration = v19 + self->_inRoamDuration;
  [(WiFiUsageSession *)self setRoamingActiveTime:0];
  if (self->_lastRoamSuppressionToggled)
  {
    if (!self->_isRoamSuppressionEnabled && !self->_roamsAfterSupprLifted)
    {
      self->_unint64_t roamsAfterSupprLifted = 1;
      objc_msgSend(v16, "timeIntervalSinceDate:");
      self->_double inRoamSuppressionWaitForRoamEnd = v20 + self->_inRoamSuppressionWaitForRoamEnd;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        unint64_t roamsAfterSupprLifted = self->_roamsAfterSupprLifted;
        double inRoamSuppressionWaitForRoamEnd = self->_inRoamSuppressionWaitForRoamEnd;
        int v27 = 136315650;
        v28 = "-[WiFiUsageSession roamingStateDidChange:reason:andStatus:andLatency:andRoamData:andPingPongStats:]";
        __int16 v29 = 2048;
        double v30 = *(double *)&roamsAfterSupprLifted;
        __int16 v31 = 2048;
        double v32 = inRoamSuppressionWaitForRoamEnd;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - roamsAfterSupprLifted:%lu. incremented inRoamSuppressionWaitForRoamEnd :%fs", (uint8_t *)&v27, 0x20u);
      }
    }
  }
  if (a5 - 3766617153u > 0xA) {
    goto LABEL_19;
  }
  if (((1 << (a5 - 65)) & 0x1CF) != 0)
  {
LABEL_21:
    uint64_t v23 = 1;
    uint64_t v24 = 9896;
    goto LABEL_22;
  }
  if (a5 != 3766617163)
  {
LABEL_19:
    if (a5 - 3766617091u <= 0xC)
    {
      if (((1 << (a5 - 3)) & 0x1702) != 0) {
        goto LABEL_21;
      }
      if (a5 == 3766617091)
      {
        uint64_t v23 = 1;
        uint64_t v24 = 9880;
        goto LABEL_22;
      }
    }
    if (a5)
    {
      uint64_t v23 = 1;
      uint64_t v24 = 9872;
    }
    else
    {
      ++self->_roamStatusSucceededCount;
      if (!self->_inMotionStartedTime)
      {
        if ((unint64_t)[v14 pingPongNth] >= 3)
        {
          ++self->_roamPingPongAboveThresholdCount;
          self->_roamPingPongAboveThresholdCountLowRssiOnly += [v14 pingPongSequenceIsLowRssiOnly];
        }
        self->_roamPingPongLowRssiAndReassocOnly += [v14 pingPongSequenceIsReassocOrLowRSSIOnly];
      }
      uint64_t v23 = [v14 pingPongSequenceIsReassocOnly];
      uint64_t v24 = 9936;
    }
    goto LABEL_22;
  }
  uint64_t v23 = 1;
  uint64_t v24 = 9888;
LABEL_22:
  *(Class *)((char *)&self->super.isa + v24) = (Class)(*(char **)((char *)&self->super.isa + v24) + v23);
  uint64_t v25 = [v13 objectForKey:@"ROAMEDEVENT_FLAGS"];
  uint64_t v26 = v25;
  if (v25) {
    self->_roamIsWNMScoreUsedCount += ((unint64_t)[v25 unsignedIntegerValue] >> 6) & 1;
  }

LABEL_25:
}

- (void)roamingARConfigurationDidChange:(id *)a3
{
  currentBssSession = self->_currentBssSession;
  long long v4 = *(_OWORD *)&a3->var5;
  v5[0] = *(_OWORD *)&a3->var0;
  v5[1] = v4;
  [(WiFiUsageBssSession *)currentBssSession roamingARConfigurationDidChange:v5];
}

- (void)roamingConfigurationDidChange:(int64_t)a3 withChannelList:(id)a4
{
}

- (void)updateRssiDiffStats:(id *)a3 For:(id)a4
{
  id v6 = a4;
  int64_t var3 = a3->var3;
  int64_t var0 = a3->var0;
  id v9 = [NSString stringWithFormat:@"roamNeighsSmllst%@RssiByBandTransition", v6];
  uint64_t v41 = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  double v10 = [(WiFiUsageSession *)self valueForKey:v9];
  BOOL v11 = v10;
  if (v10)
  {
    [v10 integerByBandTransitionValue];
  }
  else
  {
    uint64_t v41 = 0;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v36 = 0u;
  }
  int64_t v12 = var3 - var0;

  uint64_t var1 = a3->var1;
  uint64_t var5 = a3->var5;
  uint64_t v15 = (char *)&v36 + 3 * var1 + var5;
  int v17 = v15[72];
  long long v16 = v15 + 72;
  if (!v17 || v12 < *((void *)&v36 + 3 * var1 + var5))
  {
    *((void *)&v36 + 3 * var1 + var5) = v12;
    *long long v16 = 1;
    long long v32 = v38;
    long long v33 = v39;
    long long v34 = v40;
    uint64_t v35 = v41;
    long long v30 = v36;
    long long v31 = v37;
    double v18 = [MEMORY[0x1E4F29238] valuewithIntegerByBandTransition:&v30];
    [(WiFiUsageSession *)self setValue:v18 forKey:v9];
  }
  double v19 = [NSString stringWithFormat:@"roamNeighsLrgst%@RssiByBandTransition", v6];

  uint64_t v35 = 0;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  double v20 = [(WiFiUsageSession *)self valueForKey:v19];
  id v21 = v20;
  if (v20)
  {
    [v20 integerByBandTransitionValue];
  }
  else
  {
    uint64_t v35 = 0;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v30 = 0u;
  }

  uint64_t v22 = a3->var1;
  uint64_t v23 = a3->var5;
  uint64_t v24 = (char *)&v30 + 3 * v22 + v23;
  int v26 = v24[72];
  uint64_t v25 = v24 + 72;
  if (!v26 || v12 > *((void *)&v30 + 3 * v22 + v23))
  {
    *((void *)&v30 + 3 * v22 + v23) = v12;
    *uint64_t v25 = 1;
    v28[2] = v32;
    v28[3] = v33;
    v28[4] = v34;
    uint64_t v29 = v35;
    v28[0] = v30;
    v28[1] = v31;
    int v27 = [MEMORY[0x1E4F29238] valuewithIntegerByBandTransition:v28];
    [(WiFiUsageSession *)self setValue:v27 forKey:v19];
  }
}

- (void)roamCandidatesStatsDidUpdate:(id *)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  BOOL v5 = [a3->var7 allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v57 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v56 + 1) + 8 * i);
        double v10 = [(NSMutableDictionary *)self->_roamNeighborsByBand objectForKey:v9];
        if (!v10)
        {
          double v10 = objc_opt_new();
          [(NSMutableDictionary *)self->_roamNeighborsByBand setObject:v10 forKeyedSubscript:v9];
        }
        BOOL v11 = [a3->var7 objectForKeyedSubscript:v9];
        int64_t v12 = [v11 allObjects];
        [v10 addObjectsFromArray:v12];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v56 objects:v61 count:16];
    }
    while (v6);
  }

  unint64_t minCandidatesCount = self->_minCandidatesCount;
  if (minCandidatesCount >= a3->var6) {
    unint64_t var6 = a3->var6;
  }
  else {
    unint64_t var6 = self->_minCandidatesCount;
  }
  if (minCandidatesCount) {
    unint64_t v15 = var6;
  }
  else {
    unint64_t v15 = a3->var6;
  }
  self->_unint64_t minCandidatesCount = v15;
  unint64_t maxCandidatesCount = self->_maxCandidatesCount;
  if (maxCandidatesCount <= a3->var6) {
    unint64_t v17 = a3->var6;
  }
  else {
    unint64_t v17 = self->_maxCandidatesCount;
  }
  if (maxCandidatesCount) {
    unint64_t v18 = v17;
  }
  else {
    unint64_t v18 = a3->var6;
  }
  self->_unint64_t maxCandidatesCount = v18;
  if (a3->var2 == a3->var0) {
    ++self->_currentRSSIStrongestCount;
  }
  uint64_t var4 = a3->var4;
  double v20 = &self->super.isa + var4;
  v20[1439] = (Class)((char *)v20[1439] + 1);
  id v21 = (char *)self + var4;
  v21[11536] = 1;
  v20[1443] = (Class)a3->var2;
  v21[11568] = 1;
  int64_t var0 = a3->var0;
  if (a3->var0 >= -94)
  {
    int64_t var3 = a3->var3;
    if (var3 >= -94)
    {
      if (var3 <= var0) {
        uint64_t v24 = &v55;
      }
      else {
        uint64_t v24 = &v54;
      }
      if (var3 <= var0) {
        uint64_t v25 = @"CurrentToNextBest";
      }
      else {
        uint64_t v25 = @"CurrentToBest";
      }
      long long v26 = *(_OWORD *)&a3->var2;
      *(_OWORD *)uint64_t v24 = *(_OWORD *)&a3->var0;
      *((_OWORD *)v24 + 1) = v26;
      *((_OWORD *)v24 + 2) = *(_OWORD *)&a3->var4;
      *((void *)v24 + 6) = a3->var7;
      *((void *)v24 + 7) = a3->var8;
      v24[64] = a3->var9;
      [(WiFiUsageSession *)self updateRssiDiffStats:v24 For:v25];
    }
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  int v27 = [a3->var7 allKeys];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v48 objects:v60 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v49 != v29) {
          objc_enumerationMutation(v27);
        }
        long long v31 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        unint64_t v32 = [v31 unsignedIntegerValue];
        if (v32 <= 3)
        {
          long long v33 = [a3->var7 objectForKeyedSubscript:v31];
          *((void *)&v52 + v32) = [v33 count];

          *((unsigned char *)&v53 + v32 + 8) = 1;
        }
      }
      uint64_t v28 = [v27 countByEnumeratingWithState:&v48 objects:v60 count:16];
    }
    while (v28);
  }

  v47[0] = v52;
  v47[1] = v53;
  long long v34 = +[IntegerByBandObj integerByBandWith:v47 withCap:1];
  uint64_t v35 = 10016;
  if (!a3->var9) {
    uint64_t v35 = 10024;
  }
  id v36 = *(id *)((char *)&self->super.isa + v35);
  long long v37 = [v36 objectForKeyedSubscript:v34];
  if (!v37)
  {
    long long v37 = objc_opt_new();
    [v36 setObject:v37 forKeyedSubscript:v34];
  }
  [v37 increment];
  currentBssSession = self->_currentBssSession;
  long long v39 = *(_OWORD *)&a3->var2;
  v43[0] = *(_OWORD *)&a3->var0;
  v43[1] = v39;
  v43[2] = *(_OWORD *)&a3->var4;
  id v40 = a3->var7;
  id v44 = v40;
  id v41 = a3->var8;
  id v45 = v41;
  BOOL var9 = a3->var9;
  if (currentBssSession)
  {
    [(WiFiUsageBssSession *)currentBssSession roamCandidatesStatsDidUpdate:v43];
  }
  else
  {
    v42 = v41;
  }
}

- (void)roamCacheDidUpdate:(id)a3
{
}

- (void)scanningStateDidChange:(BOOL)a3 client:(unint64_t)a4 neighborBSS:(id)a5 otherBSS:(id)a6
{
  BOOL v8 = a3;
  id v14 = a5;
  id v10 = a6;
  BOOL v11 = [MEMORY[0x1E4F1C9C8] date];
  int64_t v12 = v11;
  if (v8)
  {
    [(WiFiUsageSession *)self setScanningActiveTime:v11];
    ++self->_inScanEventCount;
    if (a4 - 1 <= 0x19) {
      ++self->_perClientScanCount[a4];
    }
    if ((a4 - 1 < 7 || a4 - 20 <= 1)
      && self->_joinScanLatencyFromDriverAvailability == 0.0
      && self->_lastDriverAvailableTime)
    {
      objc_msgSend(v12, "timeIntervalSinceDate:");
      -[WiFiUsageSession setJoinScanLatencyFromDriverAvailability:](self, "setJoinScanLatencyFromDriverAvailability:");
    }
  }
  else if (self->_scanningActiveTime)
  {
    objc_msgSend(v11, "timeIntervalSinceDate:");
    self->_inScanDuration = v13 + self->_inScanDuration;
    [(WiFiUsageSession *)self setScanningActiveTime:0];
  }
  [(WiFiUsageBssSession *)self->_currentBssSession scanningStateDidChange:v8 client:a4 neighborBSS:v14 otherBSS:v10];
}

- (void)powerStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [MEMORY[0x1E4F1C9C8] date];
  self->_poweredOn = v3;
  ++self->_powerStateChangedCount;
  lastPowerStateChangedTime = self->_lastPowerStateChangedTime;
  id v10 = v5;
  if (v3)
  {
    [v5 timeIntervalSinceDate:lastPowerStateChangedTime];
    id v7 = v10;
    if (v8 < 5.0) {
      ++self->_powerToggleEventCount;
    }
  }
  else
  {
    id v7 = v5;
    if (lastPowerStateChangedTime)
    {
      objc_msgSend(v5, "timeIntervalSinceDate:");
      id v7 = v10;
      self->_poweredOnDuration = v9 + self->_poweredOnDuration;
    }
  }
  [(WiFiUsageSession *)self setLastPowerStateChangedTime:v7];
}

- (void)controlCenterStateDidChange:(BOOL)a3 withKnownLocation:(BOOL)a4
{
  BOOL v4 = a3;
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", a3, a4);
  id v7 = v6;
  self->_controlCenterEnabled = v4;
  ++self->_controlCenterStateChangedCount;
  id v10 = v6;
  if (v4)
  {
    [v6 timeIntervalSinceDate:self->_lastControlCenterStateChangedTime];
    if (v8 < 5.0) {
      ++self->_controlCenterToggleEventCount;
    }
    id v7 = v10;
    if (self->_lastControlCenterStateChangedTime)
    {
      objc_msgSend(v10, "timeIntervalSinceDate:");
      id v7 = v10;
      self->_inControlCenterAutoJoinDisabledDuration = v9 + self->_inControlCenterAutoJoinDisabledDuration;
    }
  }
  [(WiFiUsageSession *)self setLastControlCenterStateChangedTime:v7];
}

- (void)cellularDataStatusDidChange:(id)a3 inAirplaneMode:(BOOL)a4
{
  BOOL v4 = a4;
  if (self->_airplaneModeEnabled != a4) {
    ++self->_airplaneModeStateChangedCount;
  }
  id v6 = a3;
  [(WiFiUsageSession *)self setAirplaneModeEnabled:v4];
  [(WiFiUsageSession *)self setCellularDataStatus:v6];
}

- (void)cellularFallbackStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = v5;
  self->_cellularFallbackEnabled = v3;
  ++self->_cellularFallbackStateChangedCount;
  id v8 = v5;
  if (!v3 && self->_lastCellularFallbackStateChangedTime)
  {
    objc_msgSend(v5, "timeIntervalSinceDate:");
    id v6 = v8;
    self->_inCellularFallbackDuration = v7 + self->_inCellularFallbackDuration;
  }
  [(WiFiUsageSession *)self setLastCellularFallbackStateChangedTime:v6];
  [(WiFiUsageBssSession *)self->_currentBssSession cellularFallbackStateDidChange:v3];
}

- (void)cellularOutrankingStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = v5;
  self->_cellularOutrankingEnabled = v3;
  id v8 = v5;
  if (!v3)
  {
    ++self->_cellularOutrankingStateChangedCount;
    if (self->_lastCellularOutrankingStateChangedTime)
    {
      objc_msgSend(v5, "timeIntervalSinceDate:");
      id v6 = v8;
      self->_inCellularOutrankingDuration = v7 + self->_inCellularOutrankingDuration;
    }
  }
  [(WiFiUsageSession *)self setLastCellularOutrankingStateChangedTime:v6];
  [(WiFiUsageBssSession *)self->_currentBssSession cellularOutrankingStateDidChange:v3];
}

- (void)faultEventDetected:(unint64_t)a3
{
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  if (a3 - 1 <= 0x20) {
    ++self->_faultReasonCount[a3];
  }
  if (a3 == 7)
  {
LABEL_6:
    [(WiFiUsageSession *)self setLastChipResetTime:v5];
    if (self->_driverAvailabilityLifespan == 0.0)
    {
      [v5 timeIntervalSinceDate:self->_lastDriverAvailableTime];
      -[WiFiUsageSession setDriverAvailabilityLifespan:](self, "setDriverAvailabilityLifespan:");
    }
    goto LABEL_10;
  }
  if (a3 != 24)
  {
    if (a3 != 21) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  [(WiFiUsageSession *)self setLastDriverTerminationTime:v5];
  if (self->_driverProcessLifespan == 0.0)
  {
    [v5 timeIntervalSinceDate:self->_lastDriverAvailableTime];
    -[WiFiUsageSession setDriverProcessLifespan:](self, "setDriverProcessLifespan:");
  }
LABEL_10:
  [(WiFiUsageBssSession *)self->_currentBssSession faultEventDetected:a3];
}

- (void)triggerDisconnectAlerted:(BOOL)a3 confirmed:(BOOL)a4 executed:(BOOL)a5
{
  if (!a3)
  {
    if (!a4) {
      goto LABEL_3;
    }
LABEL_7:
    ++self->_triggerDisconnectConfirmedCount;
    if (!a5) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  ++self->_triggerDisconnectAlertedCount;
  if (a4) {
    goto LABEL_7;
  }
LABEL_3:
  if (a5) {
LABEL_4:
  }
    ++self->_triggerDisconnectExecutedCount;
LABEL_5:
  -[WiFiUsageBssSession triggerDisconnectAlerted:confirmed:executed:](self->_currentBssSession, "triggerDisconnectAlerted:confirmed:executed:");
}

- (void)tdLogic_alertedBy:(int)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!self->_isInTDEval)
  {
    ++self->_tdEvalStartedCount;
    BOOL v4 = +[WiFiUsagePrivacyFilter getLabelForTDTrigger:*(void *)&a3];
    if (![(WiFiUsageSession *)self incrementCountWithPrefix:@"tdEvalStartedBy" name:v4]&& os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      id v6 = "-[WiFiUsageSession tdLogic_alertedBy:]";
      __int16 v7 = 2112;
      id v8 = v4;
      __int16 v9 = 2112;
      id v10 = self;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - tdEval started by %@ but no counter for this trigger in %@", (uint8_t *)&v5, 0x20u);
    }
    [(WiFiUsageSession *)self setIsInTDEval:1];
  }
}

- (void)tdLogic_end:(int)a3 evalTime:(double)a4 rssi:(int64_t)a5 roamTime:(double)a6
{
  +[WiFiUsagePrivacyFilter getLabelForTDTrigger:](WiFiUsagePrivacyFilter, "getLabelForTDTrigger:", *(void *)&a3, a4, a6);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  __int16 v9 = [NSNumber numberWithDouble:a4];
  id v10 = [NSNumber numberWithInteger:a5];
  NSLog(&cfstr_STdevalEndedUp_0.isa, "-[WiFiUsageSession tdLogic_end:evalTime:rssi:roamTime:]", v11, v9, v10);

  [(WiFiUsageSession *)self setIsInTDEval:0];
  ++self->_tdEvalEndedCount;
  self->_tdEvalCumulativeDuration = self->_tdEvalCumulativeDuration + a4;
}

- (BOOL)incrementCountWithPrefix:(id)a3 name:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = &stru_1F2B5AC50;
    if (v6) {
      id v8 = v6;
    }
    __int16 v9 = [NSString stringWithFormat:@"%@%@Count", v8, v7];
    id v10 = [(WiFiUsageSession *)self valueForKey:v9];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v10 unsignedIntegerValue];
      int64_t v12 = [NSNumber numberWithUnsignedInteger:v11 + 1];
      [(WiFiUsageSession *)self setValue:v12 forKey:v9];
    }
    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)countWithPrefix:(id)a3 name:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = &stru_1F2B5AC50;
    if (v6) {
      id v8 = v6;
    }
    __int16 v9 = [NSString stringWithFormat:@"%@%@Count", v8, v7];
    id v10 = [(WiFiUsageSession *)self valueForKey:v9];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)poorLinkSessionStats:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    ++self->_inPoorLinkSessionCount;
    [v5 sessionDuration];
    self->_inPoorLinkSessionDuration = v6 + self->_inPoorLinkSessionDuration;
    if (self->_lastJoinWhileDeferForTD && [v5 tdExecuted])
    {
      ++self->_tdAfterJoinAfterTDCount;
      unint64_t v7 = self->_current_subsequentTdAfterJoinAfterTDCount + 1;
      self->_unint64_t current_subsequentTdAfterJoinAfterTDCount = v7;
      if (self->_max_subsequentTdAfterJoinAfterTDCount < v7) {
        self->_max_subsequentTdAfterJoinAfterTDCount = v7;
      }
    }
    else
    {
      unint64_t current_subsequentTdAfterJoinAfterTDCount = self->_current_subsequentTdAfterJoinAfterTDCount;
      if (current_subsequentTdAfterJoinAfterTDCount)
      {
        if (self->_min_subsequentTdAfterJoinAfterTDCount > current_subsequentTdAfterJoinAfterTDCount) {
          self->_min_subsequentTdAfterJoinAfterTDCount = current_subsequentTdAfterJoinAfterTDCount;
        }
        self->_unint64_t current_subsequentTdAfterJoinAfterTDCount = 0;
      }
    }
    __int16 v9 = +[WiFiUsagePoorLinkSession sessionStartedBy:](WiFiUsagePoorLinkSession, "sessionStartedBy:", [v5 sessionStartedBy]);
    BOOL v10 = [(WiFiUsageSession *)self incrementCountWithPrefix:@"tdSessionStartedBy" name:v9];

    if (!v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v11 = +[WiFiUsagePoorLinkSession sessionStartedBy:](WiFiUsagePoorLinkSession, "sessionStartedBy:", [v5 sessionStartedBy]);
      int v12 = 136315906;
      BOOL v13 = "-[WiFiUsageSession poorLinkSessionStats:]";
      __int16 v14 = 2112;
      unint64_t v15 = v11;
      __int16 v16 = 1024;
      int v17 = [v5 sessionStartedBy];
      __int16 v18 = 2112;
      double v19 = self;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - tdSession started by %@ (%u) but no counter for this trigger in %@", (uint8_t *)&v12, 0x26u);
    }
    self->_lastJoinWhileDeferForTD = [v5 nextJoinWhileDeferJoin];
  }
}

- (void)rangingCompleted
{
}

- (void)summarizeSession
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1C9C8] date];
  if (self->_sessionStartTime)
  {
    sessionEndTime = self->_sessionEndTime;
    if (!sessionEndTime) {
      sessionEndTime = v3;
    }
    -[NSDate timeIntervalSinceDate:](sessionEndTime, "timeIntervalSinceDate:");
    self->_double sessionDuration = v5;
  }
  if (self->_mediaStartedTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_mediaPlaybackDuration = v6 + self->_mediaPlaybackDuration;
  }
  if (self->_chargingStartedTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_chargingDuration = v7 + self->_chargingDuration;
  }
  if (self->_companionConnectionTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_companionConnectedDuration = v8 + self->_companionConnectedDuration;
  }
  if (self->_wowStateEntryTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inWowStateDuration = v9 + self->_inWowStateDuration;
  }
  if (self->_lpasStateEntryTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inLpasStateDuration = v10 + self->_inLpasStateDuration;
  }
  if (self->_lowPowerStateEntryTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inLowPowerStateDuration = v11 + self->_inLowPowerStateDuration;
  }
  if (self->_batterySaverStateEntryTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inBatterySaverStateDuration = v12 + self->_inBatterySaverStateDuration;
  }
  if (self->_callStartedTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inCallDuration = v13 + self->_inCallDuration;
  }
  if (self->_inVehicleEntryTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inVehicleDuration = v14 + self->_inVehicleDuration;
  }
  if (self->_inMotionStartedTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inMotionDuration = v15 + self->_inMotionDuration;
  }
  if (self->_a2dpActiveTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inA2dpDuration = v16 + self->_inA2dpDuration;
  }
  if (self->_scoActiveTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inScoDuration = v17 + self->_inScoDuration;
  }
  if (self->_hidPresentTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inHidPresentDuration = v18 + self->_inHidPresentDuration;
  }
  if (self->_awdlActiveTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inAwdlDuration = v19 + self->_inAwdlDuration;
  }
  if (self->_roamingActiveTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inRoamDuration = v20 + self->_inRoamDuration;
  }
  if (self->_lastRoamSuppressionToggled && self->_isRoamSuppressionEnabled)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inRoamSuppressionEnabled = v21 + self->_inRoamSuppressionEnabled;
  }
  if (self->_scanningActiveTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inScanDuration = v22 + self->_inScanDuration;
  }
  if (self->_softApActiveTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inSoftApDuration = v23 + self->_inSoftApDuration;
  }
  if (self->_lastSystemWakeTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_systemAwakeDuration = v24 + self->_systemAwakeDuration;
    [(WiFiUsageSession *)self setLastSystemWakeTime:v3];
  }
  if (self->_poweredOn)
  {
    if (self->_lastPowerStateChangedTime)
    {
      -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
      self->_poweredOnDuration = v25 + self->_poweredOnDuration;
    }
    [(WiFiUsageSession *)self setLastPowerStateChangedTime:v3];
  }
  if (self->_linkRecoveryDisabledTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_linkRecoveryDisabledDuration = v26 + self->_linkRecoveryDisabledDuration;
  }
  [(WiFiUsageSession *)self tallyAssociatedDuration:v3];
  if (self->_lastBssChangedTime)
  {
    networkDetails = self->_networkDetails;
    if (networkDetails)
    {
      uint64_t v28 = [(WiFiUsageNetworkDetails *)networkDetails connectedBss];
      -[WiFiUsageSession updateBandUsageFor:With:](self, "updateBandUsageFor:With:", [v28 band], v3);
    }
    [(WiFiUsageSession *)self setLastBssChangedTime:v3];
  }
  if (self->_cellularFallbackEnabled)
  {
    if (self->_lastCellularFallbackStateChangedTime)
    {
      -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
      self->_inCellularFallbackDuration = v29 + self->_inCellularFallbackDuration;
    }
    [(WiFiUsageSession *)self setLastCellularFallbackStateChangedTime:v3];
  }
  if (self->_cellularOutrankingEnabled)
  {
    if (self->_lastCellularOutrankingStateChangedTime)
    {
      -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
      self->_inCellularOutrankingDuration = v30 + self->_inCellularOutrankingDuration;
    }
    [(WiFiUsageSession *)self setLastCellularOutrankingStateChangedTime:v3];
  }
  if (!self->_controlCenterEnabled)
  {
    if (self->_lastControlCenterStateChangedTime)
    {
      -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
      self->_inControlCenterAutoJoinDisabledDuration = v31 + self->_inControlCenterAutoJoinDisabledDuration;
    }
    [(WiFiUsageSession *)self setLastControlCenterStateChangedTime:v3];
  }
  unint64_t v32 = +[WiFiUsageInterfaceStats statsForInterfaceName:self->_interfaceName];
  long long v33 = +[WiFiUsageInterfaceStats statsForInterfaceName:self->_secondaryInterfaceName];
  -[WiFiUsageSession setNetInterfaceTxBytes:](self, "setNetInterfaceTxBytes:", [v32 txBytes] - -[WiFiUsageInterfaceStats txBytes](self->_ifStatsAtStart, "txBytes"));
  -[WiFiUsageSession setNetInterfaceRxBytes:](self, "setNetInterfaceRxBytes:", [v32 rxBytes] - -[WiFiUsageInterfaceStats rxBytes](self->_ifStatsAtStart, "rxBytes"));
  -[WiFiUsageSession setSecondaryInterfaceTxBytes:](self, "setSecondaryInterfaceTxBytes:", [v33 txBytes] - -[WiFiUsageInterfaceStats txBytes](self->_secondaryIfStatsAtStart, "txBytes"));
  -[WiFiUsageSession setSecondaryInterfaceRxBytes:](self, "setSecondaryInterfaceRxBytes:", [v33 rxBytes] - -[WiFiUsageInterfaceStats rxBytes](self->_secondaryIfStatsAtStart, "rxBytes"));
  if ([(NSDate *)self->_lastPowerBudgetChangedTime isEqualToDate:self->_sessionStartTime]) {
    [(WiFiUsageSession *)self powerBudgetDidChange:self->_lastPowerBudget andThermalIndex:self->_lastThermalIndex];
  }
  if (self->_isCompatibilityModeEnabled)
  {
    [(NSDate *)v3 timeIntervalSinceDate:self->_lastCompatibilityModeChangedTime];
    self->_inCompatibilityModeEnabledDuration = v34 + self->_inCompatibilityModeEnabledDuration;
    uint64_t v35 = MEMORY[0x1E4F14500];
    id v36 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t compatibilityModeChangeCount = self->_compatibilityModeChangeCount;
      int v53 = 136315394;
      char v54 = "-[WiFiUsageSession summarizeSession]";
      __int16 v55 = 2048;
      long long v56 = (WiFiUsageSession *)compatibilityModeChangeCount;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - _compatibilityModeChangeCount:%lu", (uint8_t *)&v53, 0x16u);
    }
  }
  long long v38 = [(WiFiUsageNetworkDetails *)self->_networkDetails disable6eMode];
  if ([v38 isEqualToString:@"off"])
  {
    lastNetwork6eDisableModeChangedTime = self->_lastNetwork6eDisableModeChangedTime;

    if (lastNetwork6eDisableModeChangedTime)
    {
      [(NSDate *)v3 timeIntervalSinceDate:self->_lastNetwork6eDisableModeChangedTime];
      self->_double inNetwork6eModeOffDuration = v40 + self->_inNetwork6eModeOffDuration;
    }
  }
  else
  {
  }
  id v41 = MEMORY[0x1E4F14500];
  id v42 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    double inNetwork6eModeOffDuration = self->_inNetwork6eModeOffDuration;
    id v44 = self->_lastNetwork6eDisableModeChangedTime;
    double sessionDuration = self->_sessionDuration;
    int v53 = 136316162;
    char v54 = "-[WiFiUsageSession summarizeSession]";
    __int16 v55 = 2112;
    long long v56 = self;
    __int16 v57 = 2048;
    double v58 = inNetwork6eModeOffDuration;
    __int16 v59 = 2112;
    v60 = v44;
    __int16 v61 = 2048;
    double v62 = sessionDuration;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s on %@ - _inNetwork6eModeOffDuration:%fs (lastNetwork6eDisableModedChangedTime:%@ sessionDuration:%fs)", (uint8_t *)&v53, 0x34u);
  }

  if ([(WiFiUsageSession *)self useSavedJoinStats] && self->_savedLastJoinReason != -1)
  {
    [(WiFiUsageSession *)self setJoinStateChangedCount:self->_savedJoinStateChangedCount];
    [(WiFiUsageSession *)self setLastJoinReason:self->_savedLastJoinReason];
    [(WiFiUsageSession *)self setLastJoinFailure:self->_savedLastJoinFailure];
    [(WiFiUsageSession *)self setPreviousDisconnectReason:self->_savedPreviousDisconnectReason];
    [(WiFiUsageSession *)self setInCoexRealTimeAtLastJoin:self->_savedInCoexRealTimeAtLastJoin];
    [(WiFiUsageSession *)self setPrevJoinReason:self->_savedPrevJoinReason];
    [(WiFiUsageSession *)self setTimeSincePrevJoin:self->_savedTimeSincePrevJoin];
    long long v46 = *(_OWORD *)&self->_savedJoinReasonCount[10];
    *(_OWORD *)&self->_joinReasonCount[8] = *(_OWORD *)&self->_savedJoinReasonCount[8];
    *(_OWORD *)&self->_joinReasonCount[10] = v46;
    *(_OWORD *)&self->_joinReasonCount[12] = *(_OWORD *)&self->_savedJoinReasonCount[12];
    self->_joinReasonCount[14] = self->_savedJoinReasonCount[14];
    long long v47 = *(_OWORD *)&self->_savedJoinReasonCount[2];
    *(_OWORD *)self->_joinReasonCount = *(_OWORD *)self->_savedJoinReasonCount;
    *(_OWORD *)&self->_joinReasonCount[2] = v47;
    long long v48 = *(_OWORD *)&self->_savedJoinReasonCount[6];
    *(_OWORD *)&self->_joinReasonCount[4] = *(_OWORD *)&self->_savedJoinReasonCount[4];
    *(_OWORD *)&self->_joinReasonCount[6] = v48;
    long long v49 = v41;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      id v50 = [(id)objc_opt_class() joinReasonString:self->_lastJoinReason];
      long long v51 = [(id)objc_opt_class() joinReasonString:self->_savedLastJoinReason];
      int v53 = 136315906;
      char v54 = "-[WiFiUsageSession summarizeSession]";
      __int16 v55 = 2112;
      long long v56 = self;
      __int16 v57 = 2112;
      double v58 = *(double *)&v50;
      __int16 v59 = 2112;
      v60 = v51;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s on %@ _lastJoinReason:%@ _savedLastJoinReason:%@", (uint8_t *)&v53, 0x2Au);
    }
  }
  if (self->_anyUsbDeviceConnected) {
    [(WiFiUsageSession *)self updateUsbInsertedDuration:self->_sessionEndTime];
  }
  if (self->_lastAWDLSequenceUpdate)
  {
    [(WiFiUsageSession *)self tallyInfraScoreDuration:self->_inAWDL_lastInfraScore until:v3];
    [(WiFiUsageSession *)self tallyP2PScoreDuration:v3 until:self->_inAWDL_lastP2PScore];
    objc_storeStrong((id *)&self->_lastAWDLSequenceUpdate, v3);
  }
  if (self->_lastLinkStateChangedTime)
  {
    if (!self->_isAssociated)
    {
      -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
      if (v52 > self->_longestUnassociatedDuration) {
        self->_longestUnassociatedDuration = v52;
      }
    }
  }
}

- (void)summarizeBandUsage
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = (NSDate *)v3;
  sessionStartTime = self->_sessionStartTime;
  uint64_t v10 = v3;
  if (sessionStartTime)
  {
    sessionEndTime = self->_sessionEndTime;
    if (!sessionEndTime) {
      sessionEndTime = v4;
    }
    uint64_t v3 = -[NSDate timeIntervalSinceDate:](sessionEndTime, "timeIntervalSinceDate:");
    self->_double sessionDuration = v7;
    id v4 = (NSDate *)v10;
  }
  if (self->_lastBssChangedTime)
  {
    networkDetails = self->_networkDetails;
    if (networkDetails)
    {
      double v9 = [(WiFiUsageNetworkDetails *)networkDetails connectedBss];
      -[WiFiUsageSession updateBandUsageFor:With:](self, "updateBandUsageFor:With:", [v9 band], v10);

      id v4 = (NSDate *)v10;
    }
    uint64_t v3 = [(WiFiUsageSession *)self setLastBssChangedTime:v4];
    id v4 = (NSDate *)v10;
  }

  MEMORY[0x1F41817F8](v3, v4, sessionStartTime);
}

- (void)sessionDidEnd
{
  if (self->_isSessionActive)
  {
    [(WiFiUsageSession *)self setIsSessionActive:0];
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    [(WiFiUsageSession *)self setSessionEndTime:v3];

    if (self->_sessionStartTime)
    {
      -[NSDate timeIntervalSinceDate:](self->_sessionEndTime, "timeIntervalSinceDate:");
      self->_double sessionDuration = v4;
    }
    if (self->_completionHandler)
    {
      if (self->_completionQueue)
      {
        double v5 = (void *)[(WiFiUsageSession *)self copy];
        [v5 summarizeBandUsage];
        double v6 = v5[1434];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __33__WiFiUsageSession_sessionDidEnd__block_invoke;
        block[3] = &unk_1E69BC8D8;
        id v9 = v5;
        double v7 = v5;
        dispatch_async(v6, block);
      }
    }
  }
}

uint64_t __33__WiFiUsageSession_sessionDidEnd__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 11456) + 16))();
}

- (id)sessionName
{
  unint64_t type = self->_type;
  if (type > 0xA) {
    return @"Unknown";
  }
  else {
    return off_1E69BE040[type];
  }
}

+ (id)joinReasonString:(unint64_t)a3
{
  if (a3 + 1 >= 0x10)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown=%u", a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E69BE098[a3 + 1];
  }

  return v3;
}

+ (id)disconnectReasonString:(unint64_t)a3
{
  switch(a3)
  {
    case 0x3E8uLL:
      double v4 = @"TriggerDisconnect";
      break;
    case 0x3E9uLL:
      double v4 = @"Application";
      break;
    case 0x3EAuLL:
      double v4 = @"TemporarilyDisabled";
      break;
    case 0x3EBuLL:
      double v4 = @"PreferenceChanged";
      break;
    case 0x3ECuLL:
      double v4 = @"DecryptFailure";
      break;
    case 0x3EDuLL:
      double v4 = @"NotPrimary";
      break;
    case 0x3EEuLL:
      double v4 = @"Thermal";
      break;
    case 0x3EFuLL:
      double v4 = @"InternetSharing";
      break;
    case 0x3F0uLL:
      double v4 = @"Settings";
      break;
    case 0x3F1uLL:
      double v4 = @"Misc";
      break;
    case 0x3F2uLL:
      double v4 = @"EapRestart";
      break;
    case 0x3F3uLL:
      double v4 = @"ControlCenter";
      break;
    case 0x3F4uLL:
      double v4 = @"EapFailure";
      break;
    case 0x3F5uLL:
      double v4 = @"Transition";
      break;
    case 0x3F6uLL:
      double v4 = @"AutoUnlock";
      break;
    case 0x3F7uLL:
      double v4 = @"Captive";
      break;
    case 0x3F8uLL:
      double v4 = @"UserNotification";
      break;
    case 0x3F9uLL:
      double v4 = @"BssSteering";
      break;
    case 0x3FAuLL:
      double v4 = @"HotspotAssociation";
      break;
    case 0x3FBuLL:
      double v4 = @"HotspotTransition";
      break;
    case 0x3FCuLL:
      double v4 = @"BssChanged";
      break;
    case 0x3FDuLL:
      double v4 = @"CarPlayDisabled";
      break;
    case 0x3FEuLL:
      double v4 = @"BatterySaverMode";
      break;
    case 0x3FFuLL:
      double v4 = @"AirPlay";
      break;
    case 0x400uLL:
      double v4 = @"6EEnabled";
      break;
    case 0x401uLL:
      double v4 = @"6EDisabled";
      break;
    case 0x402uLL:
      double v4 = @"ColocatedUserJoin";
      break;
    case 0x403uLL:
      double v4 = @"InfraRelayDisconnect";
      break;
    case 0x404uLL:
      double v4 = @"P2PRealTimeInitiated";
      break;
    case 0x405uLL:
      double v4 = @"SleepOnCaptive";
      break;
    case 0x406uLL:
      double v4 = @"ShortLease";
      break;
    case 0x407uLL:
      double v4 = @"AutoJoinDisabled";
      break;
    case 0x408uLL:
      double v4 = @"SleepDenylisted";
      break;
    case 0x409uLL:
      double v4 = @"UnspecifiedClientDisconnect";
      break;
    default:
      double v4 = @"Uninitialized";
      switch(a3)
      {
        case 0xFFFFFFFFFFFFFFFFLL:
          goto LABEL_130;
        case 0uLL:
          double v4 = @"None";
          break;
        case 1uLL:
          double v4 = @"Deauth";
          break;
        case 2uLL:
          double v4 = @"BeaconLoss";
          break;
        case 3uLL:
          double v4 = @"Internal";
          break;
        case 4uLL:
          double v4 = @"SystemSleep";
          break;
        case 5uLL:
          double v4 = @"PoweredOff";
          break;
        case 6uLL:
          double v4 = @"JoinFailure";
          break;
        case 7uLL:
          double v4 = @"ColocatedNetworkTransition";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"Unknown=%u", a3);
          double v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_130:
          break;
      }
      break;
  }
  return v4;
}

- (id)eventDictionary:(BOOL)a3
{
  BOOL v3 = a3;
  p_isSessionActive = &self->_isSessionActive;
  double v6 = [MEMORY[0x1E4F1CA60] dictionary];
  double v7 = [(WiFiUsageSession *)self sessionName];
  [v6 setObject:v7 forKeyedSubscript:@"SessionName"];

  double v8 = +[WiFiUsagePrivacyFilter numberWithDuration:self->_sessionDuration];
  [v6 setObject:v8 forKeyedSubscript:@"SessionDuration"];

  id v9 = +[WiFiUsagePrivacyFilter getBinTimeInterval:1 As:self->_sessionDuration];
  [v6 setObject:v9 forKeyedSubscript:@"SessionDurationAsString"];

  uint64_t v10 = [NSNumber numberWithUnsignedInteger:self->_sessionPid];
  [v6 setObject:v10 forKeyedSubscript:@"SessionPid"];

  double v11 = +[WiFiUsagePrivacyFilter numberWithDuration:self->_sessionTimeSinceLastSession];
  [v6 setObject:v11 forKeyedSubscript:@"SessionTimeSinceLastSession"];

  [v6 setObject:self->_interfaceName forKeyedSubscript:@"SessionInterfaceName"];
  +[WiFiUsagePrivacyFilter timeSinceBootInSeconds];
  double v12 = +[WiFiUsagePrivacyFilter numberWithDuration:](WiFiUsagePrivacyFilter, "numberWithDuration:");
  [v6 setObject:v12 forKeyedSubscript:@"SessionDeviceUptime"];

  if (v3)
  {
    if ([(WiFiUsageSession *)self type] != 5) {
      goto LABEL_10;
    }
  }
  else
  {
    if (*p_isSessionActive) {
      double v13 = @"Y";
    }
    else {
      double v13 = @"N";
    }
    [v6 setObject:v13 forKeyedSubscript:@"SessionIsActive"];
    [v6 setObject:self->_secondaryInterfaceName forKeyedSubscript:@"SessionSecondaryInterfaceName"];
    double v14 = +[WiFiUsagePrivacyFilter localTimestamp:self->_sessionStartTime];
    [v6 setObject:v14 forKeyedSubscript:@"SessionStartTimestamp"];
  }
  double v15 = [(WiFiUsageSession *)self activeApplications];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    double v17 = [(WiFiUsageSession *)self activeApplications];
    double v18 = [v17 allObjects];
    double v19 = [v18 lastObject];
    [v6 setObject:v19 forKeyedSubscript:@"ApplicationBundleId"];
  }
LABEL_10:
  double v20 = +[WiFiUsagePrivacyFilter bandAsString:[(WiFiUsageSession *)self bandAtSessionStart]];
  [v6 setObject:v20 forKeyedSubscript:@"NetworkBssBandAtSessionStart"];

  double v21 = objc_msgSend(NSNumber, "numberWithBool:", -[WiFiUsageSession isAssociatedAtSessionStart](self, "isAssociatedAtSessionStart"));
  [v6 setObject:v21 forKeyedSubscript:@"isAssociatedAtSessionStart"];

  double v22 = +[WiFiUsageLQMTransformations numberForKeyPath:@"rssiAtSessionStart" ofObject:self];
  [v6 setObject:v22 forKeyedSubscript:@"RssiAtSessionStart"];

  double v23 = +[WiFiUsagePrivacyFilter numberWithByteCount:self->_netInterfaceTxBytes];
  [v6 setObject:v23 forKeyedSubscript:@"NetIfWiFiTxBytes"];

  double v24 = +[WiFiUsagePrivacyFilter numberWithByteCount:self->_netInterfaceRxBytes];
  [v6 setObject:v24 forKeyedSubscript:@"NetIfWiFiRxBytes"];

  double v25 = +[WiFiUsagePrivacyFilter numberWithByteCount:self->_secondaryInterfaceTxBytes];
  [v6 setObject:v25 forKeyedSubscript:@"NetIfSecondaryTxBytes"];

  double v26 = +[WiFiUsagePrivacyFilter numberWithByteCount:self->_secondaryInterfaceRxBytes];
  [v6 setObject:v26 forKeyedSubscript:@"NetIfSecondaryRxBytes"];

  int v27 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_systemWakeStateChangedCount];
  [v6 setObject:v27 forKeyedSubscript:@"SystemWakeStateChangedCount"];

  uint64_t v28 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_systemWokenByWiFiCount];
  [v6 setObject:v28 forKeyedSubscript:@"SystemWokenByWiFiCount"];

  double v29 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_lockStateChangedCount];
  [v6 setObject:v29 forKeyedSubscript:@"SystemLockStateChangedCount"];

  double v30 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_displayStateChangedCount];
  [v6 setObject:v30 forKeyedSubscript:@"SystemDisplayStateChangedCount"];

  double v31 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_applicationStateChangedCount];
  [v6 setObject:v31 forKeyedSubscript:@"SystemApplicationStateChangedCount"];

  unint64_t v32 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_mediaPlaybackEventCount];
  [v6 setObject:v32 forKeyedSubscript:@"SystemMediaPlaybackCount"];

  long long v33 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_chargingEventCount];
  [v6 setObject:v33 forKeyedSubscript:@"SystemChargingCount"];

  double v34 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_inCallEventCount];
  [v6 setObject:v34 forKeyedSubscript:@"SystemInCallCount"];

  uint64_t v35 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_inVehicleEventCount];
  [v6 setObject:v35 forKeyedSubscript:@"SystemInVehicleCount"];

  id v36 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_inMotionEventCount];
  [v6 setObject:v36 forKeyedSubscript:@"SystemInMotionCount"];

  long long v37 = +[WiFiUsagePrivacyFilter timePercentage:self->_mediaPlaybackDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v37 forKeyedSubscript:@"SystemMediaPlaybackDuration"];

  long long v38 = +[WiFiUsagePrivacyFilter timePercentage:self->_chargingDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v38 forKeyedSubscript:@"SystemChargingDuration"];

  long long v39 = +[WiFiUsagePrivacyFilter timePercentage:self->_inCallDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v39 forKeyedSubscript:@"SystemInCallDuration"];

  double v40 = +[WiFiUsagePrivacyFilter timePercentage:self->_inWalkingDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v40 forKeyedSubscript:@"SystemInWalkingDuration"];

  id v41 = +[WiFiUsagePrivacyFilter timePercentage:self->_inVehicleDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v41 forKeyedSubscript:@"SystemInVehicleDuration"];

  id v42 = +[WiFiUsagePrivacyFilter timePercentage:self->_inMotionDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v42 forKeyedSubscript:@"SystemInMotionDuration"];

  v43 = +[WiFiUsagePrivacyFilter timePercentage:self->_systemAwakeDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v43 forKeyedSubscript:@"SystemAwakeDuration"];

  id v44 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_companionConnectionStateChangedCount];
  [v6 setObject:v44 forKeyedSubscript:@"SystemCompanionConnectionStateChangedCount"];

  id v45 = +[WiFiUsagePrivacyFilter timePercentage:self->_companionConnectedDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v45 forKeyedSubscript:@"SystemCompanionConnectedStateDuration"];

  [v6 setObject:self->_lastSmartCoverState forKeyedSubscript:@"SystemSmartCoverLastState"];
  long long v46 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_smartCoverStateChangedCount];
  [v6 setObject:v46 forKeyedSubscript:@"SystemSmartCoverStateChangedCount"];

  BOOL v47 = p_isSessionActive[4] && p_isSessionActive[5];
  long long v48 = [NSNumber numberWithBool:v47];
  [v6 setObject:v48 forKeyedSubscript:@"SystemIsUserInteractive"];

  long long v49 = [NSNumber numberWithBool:p_isSessionActive[6]];
  [v6 setObject:v49 forKeyedSubscript:@"SystemIsInHomeScreen"];

  id v50 = +[WiFiUsagePrivacyFilter timePercentage:self->_powerBudgetMaxDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v50 forKeyedSubscript:@"SystemPowerBudgetMaxDuration"];

  long long v51 = +[WiFiUsagePrivacyFilter timePercentage:self->_powerBudget90Duration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v51 forKeyedSubscript:@"SystemPowerBudget90Duration"];

  double v52 = +[WiFiUsagePrivacyFilter timePercentage:self->_powerBudget80Duration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v52 forKeyedSubscript:@"SystemPowerBudget80Duration"];

  int v53 = +[WiFiUsagePrivacyFilter timePercentage:self->_powerBudget70Duration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v53 forKeyedSubscript:@"SystemPowerBudget70Duration"];

  char v54 = +[WiFiUsagePrivacyFilter timePercentage:self->_powerBudget60Duration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v54 forKeyedSubscript:@"SystemPowerBudget60Duration"];

  __int16 v55 = +[WiFiUsagePrivacyFilter timePercentage:self->_powerBudget50Duration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v55 forKeyedSubscript:@"SystemPowerBudget50Duration"];

  long long v56 = +[WiFiUsagePrivacyFilter timePercentage:self->_powerBudget40Duration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v56 forKeyedSubscript:@"SystemPowerBudget40Duration"];

  __int16 v57 = +[WiFiUsagePrivacyFilter timePercentage:self->_powerBudget30Duration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v57 forKeyedSubscript:@"SystemPowerBudget30Duration"];

  double v58 = +[WiFiUsagePrivacyFilter timePercentage:self->_powerBudget20Duration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v58 forKeyedSubscript:@"SystemPowerBudget20Duration"];

  __int16 v59 = +[WiFiUsagePrivacyFilter timePercentage:self->_powerBudget10Duration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v59 forKeyedSubscript:@"SystemPowerBudget10Duration"];

  v60 = +[WiFiUsagePrivacyFilter timePercentage:self->_powerBudgetMinDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v60 forKeyedSubscript:@"SystemPowerBudgetMinDuration"];

  __int16 v61 = +[WiFiUsagePrivacyFilter timePercentage:self->_thermalIndexMaxDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v61 forKeyedSubscript:@"SystemThermalIndexMaxDuration"];

  double v62 = +[WiFiUsagePrivacyFilter timePercentage:self->_thermalIndex90Duration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v62 forKeyedSubscript:@"SystemThermalIndex90Duration"];

  uint64_t v63 = +[WiFiUsagePrivacyFilter timePercentage:self->_thermalIndex80Duration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v63 forKeyedSubscript:@"SystemThermalIndex80Duration"];

  v64 = +[WiFiUsagePrivacyFilter timePercentage:self->_thermalIndex70Duration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v64 forKeyedSubscript:@"SystemThermalIndex70Duration"];

  __int16 v65 = +[WiFiUsagePrivacyFilter timePercentage:self->_thermalIndex60Duration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v65 forKeyedSubscript:@"SystemThermalIndex60Duration"];

  int v66 = +[WiFiUsagePrivacyFilter timePercentage:self->_thermalIndex50Duration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v66 forKeyedSubscript:@"SystemThermalIndex50Duration"];

  __int16 v67 = +[WiFiUsagePrivacyFilter timePercentage:self->_thermalIndex40Duration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v67 forKeyedSubscript:@"SystemThermalIndex40Duration"];

  v68 = +[WiFiUsagePrivacyFilter timePercentage:self->_thermalIndex30Duration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v68 forKeyedSubscript:@"SystemThermalIndex30Duration"];

  __int16 v69 = +[WiFiUsagePrivacyFilter timePercentage:self->_thermalIndex20Duration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v69 forKeyedSubscript:@"SystemThermalIndex20Duration"];

  uint64_t v70 = +[WiFiUsagePrivacyFilter timePercentage:self->_thermalIndex10Duration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v70 forKeyedSubscript:@"SystemThermalIndex10Duration"];

  __int16 v71 = +[WiFiUsagePrivacyFilter timePercentage:self->_thermalIndexMinDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v71 forKeyedSubscript:@"SystemThermalIndexMinDuration"];

  v72 = +[WiFiUsagePrivacyFilter timePercentage:self->_usbInsertedDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v72 forKeyedSubscript:@"SystemUSBInsertedDurationPerc"];

  __int16 v73 = [NSNumber numberWithUnsignedInteger:self->_usbDeviceEventCount];
  [v6 setObject:v73 forKeyedSubscript:@"SystemUSBEventCount"];

  int v74 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_inA2dpEventCount];
  [v6 setObject:v74 forKeyedSubscript:@"BluetoothInA2dpCount"];

  __int16 v75 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_inScoEventCount];
  [v6 setObject:v75 forKeyedSubscript:@"BluetoothInScoCount"];

  v76 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_inHidPresentCount];
  [v6 setObject:v76 forKeyedSubscript:@"BluetoothInHidCount"];

  uint64_t v77 = +[WiFiUsagePrivacyFilter timePercentage:self->_inA2dpDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v77 forKeyedSubscript:@"BluetoothInA2dpDuration"];

  v78 = +[WiFiUsagePrivacyFilter timePercentage:self->_inScoDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v78 forKeyedSubscript:@"BluetoothInScoDuration"];

  v79 = +[WiFiUsagePrivacyFilter timePercentage:self->_inHidPresentDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v79 forKeyedSubscript:@"BluetoothInHidDuration"];

  v80 = [NSNumber numberWithBool:p_isSessionActive[24]];
  [v6 setObject:v80 forKeyedSubscript:@"isA2dpActive"];

  v81 = [NSNumber numberWithBool:p_isSessionActive[25]];
  [v6 setObject:v81 forKeyedSubscript:@"isSCOActive"];

  v82 = [NSNumber numberWithBool:p_isSessionActive[26]];
  [v6 setObject:v82 forKeyedSubscript:@"isUniAoSActive"];

  v83 = [NSNumber numberWithBool:p_isSessionActive[27]];
  [v6 setObject:v83 forKeyedSubscript:@"isBiAoSActive"];

  [v6 setObject:self->_btAudioBand forKeyedSubscript:@"BTBand"];
  v84 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_linkStateChangedCount];
  [v6 setObject:v84 forKeyedSubscript:@"WiFiLinkStateChangedCount"];

  v85 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_joinStateChangedCount];
  [v6 setObject:v85 forKeyedSubscript:@"WiFiJoinStateChangedCount"];

  v86 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_networkChangedCount];
  [v6 setObject:v86 forKeyedSubscript:@"WiFiNetworkChangedCount"];

  v87 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_rapidLinkTransitionCount];
  [v6 setObject:v87 forKeyedSubscript:@"WiFiRapidLinkTransitionCount"];

  v88 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_powerToggleEventCount];
  [v6 setObject:v88 forKeyedSubscript:@"WiFiPowerToggleEventCount"];

  v89 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_powerStateChangedCount];
  [v6 setObject:v89 forKeyedSubscript:@"WiFiPowerStateChangedCount"];

  v90 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_inAwdlEventCount];
  [v6 setObject:v90 forKeyedSubscript:@"WiFiInAwdlCount"];

  v91 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_inRoamEventCount];
  [v6 setObject:v91 forKeyedSubscript:@"WiFiInRoamCount"];

  v92 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_inScanEventCount];
  [v6 setObject:v92 forKeyedSubscript:@"WiFiInScanCount"];

  v93 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_inSoftApEventCount];
  [v6 setObject:v93 forKeyedSubscript:@"WiFiInSoftApCount"];

  v94 = +[WiFiUsagePrivacyFilter timePercentage:self->_inAwdlDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v94 forKeyedSubscript:@"WiFiInAwdlDuration"];

  v95 = +[WiFiUsagePrivacyFilter timePercentage:self->_inRoamDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v95 forKeyedSubscript:@"WiFiInRoamDuration"];

  v96 = +[WiFiUsagePrivacyFilter timePercentage:self->_inRoamSuppressionEnabled overTotalDuration:self->_sessionDuration];
  [v6 setObject:v96 forKeyedSubscript:@"WiFiInRoamSuppressedDuration"];

  v97 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_inRoamSuppressionEnabledCount];
  [v6 setObject:v97 forKeyedSubscript:@"WiFiInRoamSuppressedCount"];

  double inRoamSuppressionWaitForRoamStart = self->_inRoamSuppressionWaitForRoamStart;
  *(float *)&double inRoamSuppressionWaitForRoamStart = inRoamSuppressionWaitForRoamStart;
  v99 = [NSNumber numberWithFloat:inRoamSuppressionWaitForRoamStart];
  [v6 setObject:v99 forKeyedSubscript:@"WiFiInRoamSuppressedWaitForRoamStart"];

  double inRoamSuppressionWaitForRoamEnd = self->_inRoamSuppressionWaitForRoamEnd;
  *(float *)&double inRoamSuppressionWaitForRoamEnd = inRoamSuppressionWaitForRoamEnd;
  v101 = [NSNumber numberWithFloat:inRoamSuppressionWaitForRoamEnd];
  [v6 setObject:v101 forKeyedSubscript:@"WiFiInRoamSuppressedWaitForRoamEnd"];

  v102 = +[WiFiUsagePrivacyFilter timePercentage:self->_inScanDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v102 forKeyedSubscript:@"WiFiInScanDuration"];

  v103 = +[WiFiUsagePrivacyFilter timePercentage:self->_inSoftApDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v103 forKeyedSubscript:@"WiFiInSoftApDuration"];

  v104 = [NSNumber numberWithBool:p_isSessionActive[8]];
  [v6 setObject:v104 forKeyedSubscript:@"WiFiIsPoweredOn"];

  v105 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_neighborBssCount];
  [v6 setObject:v105 forKeyedSubscript:@"WiFiBssNeighborCount"];

  v106 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_otherBssCount];
  [v6 setObject:v106 forKeyedSubscript:@"WiFiBssOtherCount"];

  v107 = +[WiFiUsagePrivacyFilter timePercentage:self->_poweredOnDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v107 forKeyedSubscript:@"WiFiPoweredOnDuration"];

  v108 = +[WiFiUsagePrivacyFilter timePercentage:self->_associatedDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v108 forKeyedSubscript:@"WiFiAssociatedDuration"];

  v109 = +[WiFiUsagePrivacyFilter timePercentage:self->_associatedSleepDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v109 forKeyedSubscript:@"WiFiAssociatedSleepDuration"];

  v110 = +[WiFiUsagePrivacyFilter timePercentage:self->_inCellularFallbackDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v110 forKeyedSubscript:@"WiFiInCellularFallbackDuration"];

  v111 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_cellularFallbackStateChangedCount];
  [v6 setObject:v111 forKeyedSubscript:@"WiFiCellularFallbackStateChangedCount"];

  v112 = +[WiFiUsagePrivacyFilter timePercentage:self->_inCellularOutrankingDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v112 forKeyedSubscript:@"WiFiInCellularOutrankingDuration"];

  v113 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_cellularOutrankingStateChangedCount];
  [v6 setObject:v113 forKeyedSubscript:@"WiFiCellularOutrankingStateChangedCount"];

  v114 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_controlCenterStateChangedCount];
  [v6 setObject:v114 forKeyedSubscript:@"WiFiControlCenterStateChangedCount"];

  v115 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_controlCenterToggleEventCount];
  [v6 setObject:v115 forKeyedSubscript:@"WiFiControlCenterToggleEventCount"];

  v116 = +[WiFiUsagePrivacyFilter timePercentage:self->_inControlCenterAutoJoinDisabledDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v116 forKeyedSubscript:@"WiFiControlCenterAutoJoinDisabledDuration"];

  v117 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_rangingEventCount];
  [v6 setObject:v117 forKeyedSubscript:@"WiFiRangingEventCount"];

  v118 = [NSNumber numberWithBool:p_isSessionActive[15]];
  [v6 setObject:v118 forKeyedSubscript:@"SystemInAirplaneMode"];

  [v6 setObject:self->_cellularDataStatus forKeyedSubscript:@"SystemCellularDataStatus"];
  v119 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_airplaneModeStateChangedCount];
  [v6 setObject:v119 forKeyedSubscript:@"SystemAirplaneModeStateChangedCount"];

  v120 = +[WiFiUsagePrivacyFilter timePercentage:self->_linkRecoveryDisabledDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v120 forKeyedSubscript:@"WiFiLinkRecoveryDisabledDuration"];

  v121 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_linkRecoveryDisabledCount];
  [v6 setObject:v121 forKeyedSubscript:@"WiFiLinkRecoveryDisabledCount"];

  v122 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_wowStateChangedCount];
  [v6 setObject:v122 forKeyedSubscript:@"WiFiWoWStateChangedCount"];

  v123 = +[WiFiUsagePrivacyFilter timePercentage:self->_inWowStateDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v123 forKeyedSubscript:@"WiFiWoWStateDuration"];

  v124 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_lpasStateChangedCount];
  [v6 setObject:v124 forKeyedSubscript:@"WiFiLPASStateChangedCount"];

  v125 = +[WiFiUsagePrivacyFilter timePercentage:self->_inLpasStateDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v125 forKeyedSubscript:@"WiFiLPASStateDuration"];

  v126 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_lowPowerStateChangedCount];
  [v6 setObject:v126 forKeyedSubscript:@"WiFiLowPowerStateChangedCount"];

  v127 = +[WiFiUsagePrivacyFilter timePercentage:self->_inLowPowerStateDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v127 forKeyedSubscript:@"WiFiLowPowerStateDuration"];

  v128 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_batterySaverStateChangedCount];
  [v6 setObject:v128 forKeyedSubscript:@"WiFiBatterySaverStateChangedCount"];

  v129 = +[WiFiUsagePrivacyFilter timePercentage:self->_inBatterySaverStateDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v129 forKeyedSubscript:@"WiFiBatterySaverStateDuration"];

  v130 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_consecutiveJoinFailureCount];
  [v6 setObject:v130 forKeyedSubscript:@"WiFiConsecutiveJoinFailureCount"];

  v131 = +[WiFiUsagePrivacyFilter numberWithDuration:self->_longestUnassociatedDuration];
  [v6 setObject:v131 forKeyedSubscript:@"WiFiLongestUnassociatedDuration"];

  v132 = [NSNumber numberWithUnsignedInteger:(unint64_t)(self->_sleepPowerStatsTotalDuration / 1000.0)];
  [v6 setObject:v132 forKeyedSubscript:@"WiFiSleepPowerStatsDurationTotal"];

  v133 = [NSNumber numberWithUnsignedInteger:(unint64_t)(self->_sleepPowerStatsUnassociatedDuration / 1000.0)];
  [v6 setObject:v133 forKeyedSubscript:@"WiFiSleepPowerStatsDurationUnassociated"];

  v134 = [NSNumber numberWithUnsignedInteger:(unint64_t)(self->_sleepPowerStatsAssociatedDuration / 1000.0)];
  [v6 setObject:v134 forKeyedSubscript:@"WiFiSleepPowerStatsDurationAssociated"];

  v135 = [NSNumber numberWithUnsignedInteger:(unint64_t)(self->_sleepPowerStatsRoamingDuration / 1000.0)];
  [v6 setObject:v135 forKeyedSubscript:@"WiFiSleepPowerStatsDurationRoaming"];

  double sessionDuration = self->_sessionDuration;
  long long v137 = *(_OWORD *)&self->_bandUsageDuration.valueByBand[2];
  long long v387 = *(_OWORD *)self->_bandUsageDuration.valueByBand;
  long long v388 = v137;
  v138 = +[WiFiUsagePrivacyFilter getLabelForBandUsageDuration:&v387 overTotalDuration:1 binned:sessionDuration];
  [v6 setObject:v138 forKeyedSubscript:@"WiFiBandUsageDuration"];

  v139 = [(id)objc_opt_class() joinReasonString:self->_lastJoinReason];
  [v6 setObject:v139 forKeyedSubscript:@"WiFiNetworkJoinReason"];

  v140 = [NSNumber numberWithInteger:self->_lastJoinFailure];
  [v6 setObject:v140 forKeyedSubscript:@"WiFiNetworkJoinFailure"];

  v141 = [NSNumber numberWithBool:self->_lastJoinFailure == 0];
  [v6 setObject:v141 forKeyedSubscript:@"WiFiNetworkJoinResult"];

  v142 = [(id)objc_opt_class() disconnectReasonString:self->_lastDisconnectReason];
  [v6 setObject:v142 forKeyedSubscript:@"WiFiNetworkDisconnectReason"];

  v143 = [NSNumber numberWithInteger:self->_lastDisconnectSubreason];
  [v6 setObject:v143 forKeyedSubscript:@"WiFiNetworkDisconnectSubreason"];

  v144 = [(id)objc_opt_class() disconnectReasonString:self->_previousDisconnectReason];
  [v6 setObject:v144 forKeyedSubscript:@"WiFiNetworkPreviousDisconnectReason"];

  v145 = [(WiFiUsageSession *)self responsivenessScore];
  [v6 setObject:v145 forKeyedSubscript:@"WiFiNetworkResponsivenessScore"];

  v146 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_perClientScanCount[1]];
  [v6 setObject:v146 forKeyedSubscript:@"ScanCountForAutoJoinPrevChannel"];

  v147 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_perClientScanCount[2]];
  [v6 setObject:v147 forKeyedSubscript:@"ScanCountForAutoJoinMruChannels"];

  v148 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_perClientScanCount[3]];
  [v6 setObject:v148 forKeyedSubscript:@"ScanCountForAutoJoinRemChannels"];

  v149 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_perClientScanCount[4]];
  [v6 setObject:v149 forKeyedSubscript:@"ScanCountForAutoJoin2GHz"];

  v150 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_perClientScanCount[5]];
  [v6 setObject:v150 forKeyedSubscript:@"ScanCountForAutoJoin5GHz"];

  v151 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_perClientScanCount[7]];
  [v6 setObject:v151 forKeyedSubscript:@"ScanCountForAutoJoinHiddenNetwork"];

  v152 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_perClientScanCount[6]];
  [v6 setObject:v152 forKeyedSubscript:@"ScanCountForAutoJoinAllChannels"];

  v153 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_perClientScanCount[20]];
  [v6 setObject:v153 forKeyedSubscript:@"ScanCountForUnifiedAutoJoinNoSSIDList"];

  v154 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_perClientScanCount[21]];
  [v6 setObject:v154 forKeyedSubscript:@"ScanCountForUnifiedAutoJoinSSIDList"];

  v155 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_perClientScanCount[21] + self->_perClientScanCount[20]];
  [v6 setObject:v155 forKeyedSubscript:@"ScanCountForUnifiedAutoJoin"];

  v156 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_perClientScanCount[8]];
  [v6 setObject:v156 forKeyedSubscript:@"ScanCountForSettings"];

  v157 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_perClientScanCount[9]];
  [v6 setObject:v157 forKeyedSubscript:@"ScanCountForATJ"];

  v158 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_perClientScanCount[10]];
  [v6 setObject:v158 forKeyedSubscript:@"ScanCountForControlCenter"];

  v159 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_perClientScanCount[11]];
  [v6 setObject:v159 forKeyedSubscript:@"ScanCountForApp"];

  v160 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_perClientScanCount[12]];
  [v6 setObject:v160 forKeyedSubscript:@"ScanCountForHomeKit"];

  v161 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_perClientScanCount[13]];
  [v6 setObject:v161 forKeyedSubscript:@"ScanCountForConfigd"];

  v162 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_perClientScanCount[26]];
  [v6 setObject:v162 forKeyedSubscript:@"ScanCountForMilod"];

  v163 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_perClientScanCount[14]];
  [v6 setObject:v163 forKeyedSubscript:@"ScanCountForOtherClient"];

  v164 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_perClientScanCount[15]];
  [v6 setObject:v164 forKeyedSubscript:@"ScanCountForNetworkTransition"];

  v165 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_perClientScanCount[16]];
  [v6 setObject:v165 forKeyedSubscript:@"ScanCountForLocation"];

  v166 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_perClientScanCount[17]];
  [v6 setObject:v166 forKeyedSubscript:@"ScanCountForIndoor"];

  v167 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_perClientScanCount[18]];
  [v6 setObject:v167 forKeyedSubscript:@"ScanCountForAutoHotspot"];

  v168 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_perClientScanCount[19]];
  [v6 setObject:v168 forKeyedSubscript:@"ScanCountForPersonalHotspot"];

  v169 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[1]];
  [v6 setObject:v169 forKeyedSubscript:@"FaultReasonDnsFailureCount"];

  v170 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[2]];
  [v6 setObject:v170 forKeyedSubscript:@"FaultReasonArpFailureCount"];

  v171 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[4]];
  [v6 setObject:v171 forKeyedSubscript:@"FaultReasonShortFlowCount"];

  v172 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[5]];
  [v6 setObject:v172 forKeyedSubscript:@"FaultReasonRTTFailureCount"];

  v173 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[3]];
  [v6 setObject:v173 forKeyedSubscript:@"FaultReasonSymptomDataStallCount"];

  v174 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[6]];
  [v6 setObject:v174 forKeyedSubscript:@"FaultReasonL2DatapathStallCount"];

  v175 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[7]];
  [v6 setObject:v175 forKeyedSubscript:@"FaultReasonWatchdogResetCount"];

  v176 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[8]];
  [v6 setObject:v176 forKeyedSubscript:@"FaultReasonBlocklistedSsidCount"];

  v177 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[9]];
  [v6 setObject:v177 forKeyedSubscript:@"FaultReasonBlocklistedBssidCount"];

  v178 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[21]];
  [v6 setObject:v178 forKeyedSubscript:@"FaultReasonFirmwareTrapCount"];

  v179 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[24]];
  [v6 setObject:v179 forKeyedSubscript:@"FaultReasonDextCrashed"];

  v180 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[10]];
  [v6 setObject:v180 forKeyedSubscript:@"FaultReasonSlowWiFi"];

  v181 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[11]];
  [v6 setObject:v181 forKeyedSubscript:@"FaultReasonPrivateMACFallback"];

  v182 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[12]];
  [v6 setObject:v182 forKeyedSubscript:@"FaultReasonDelayedAutoJoin"];

  v183 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[13]];
  [v6 setObject:v183 forKeyedSubscript:@"FaultReasonDhcpFailure"];

  v184 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[14]];
  [v6 setObject:v184 forKeyedSubscript:@"FaultReasonLinkTestLocalCheckFailure"];

  v185 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[15]];
  [v6 setObject:v185 forKeyedSubscript:@"FaultReasonLinkTestInternetCheckFailure"];

  v186 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[16]];
  [v6 setObject:v186 forKeyedSubscript:@"FaultReasonLinkTestDNSCheckFailure"];

  v187 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[17]];
  [v6 setObject:v187 forKeyedSubscript:@"FaultReasonArpFailure"];

  v188 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[18]];
  [v6 setObject:v188 forKeyedSubscript:@"FaultReasonSlowWiFiDnsFailure"];

  v189 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[19]];
  [v6 setObject:v189 forKeyedSubscript:@"FaultReasonSlowWiFiDUT"];

  v190 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[20]];
  [v6 setObject:v190 forKeyedSubscript:@"FaultReasonUserOverridesCellularOutranking"];

  v191 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[22]];
  [v6 setObject:v191 forKeyedSubscript:@"FaultReasonSleepPowerBudgetExceeded"];

  v192 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[23]];
  [v6 setObject:v192 forKeyedSubscript:@"FaultReasonLowPowerBudgetExceeded"];

  v193 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[25]];
  [v6 setObject:v193 forKeyedSubscript:@"FaultReasonSiriTimedOut"];

  v194 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[26]];
  [v6 setObject:v194 forKeyedSubscript:@"FaultReasonApsdTimedOut"];

  v195 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_faultReasonCount[27]];
  [v6 setObject:v195 forKeyedSubscript:@"FaultReasonBrokenBackhaulLinkFailed"];

  v196 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_triggerDisconnectAlertedCount];
  [v6 setObject:v196 forKeyedSubscript:@"TriggerDisconnectAlertedCount"];

  v197 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_triggerDisconnectConfirmedCount];
  [v6 setObject:v197 forKeyedSubscript:@"TriggerDisconnectConfirmedCount"];

  v198 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_triggerDisconnectExecutedCount];
  [v6 setObject:v198 forKeyedSubscript:@"TriggerDisconnectExecutedCount"];

  v199 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_roamReasonInitialAssociationCount];
  [v6 setObject:v199 forKeyedSubscript:@"RoamReasonInitialAssociationCount"];

  v200 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_roamReasonLowRssiCount];
  [v6 setObject:v200 forKeyedSubscript:@"RoamReasonLowRssiCount"];

  v201 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_roamReasonDeauthDisassocCount];
  [v6 setObject:v201 forKeyedSubscript:@"RoamReasonDeauthDisassocCount"];

  v202 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_roamReasonBeaconLostCount];
  [v6 setObject:v202 forKeyedSubscript:@"RoamReasonBeaconLostCount"];

  v203 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_roamReasonSteeredByApCount];
  [v6 setObject:v203 forKeyedSubscript:@"RoamReasonSteeredByApCount"];

  v204 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_roamReasonSteeredByBtmCount];
  [v6 setObject:v204 forKeyedSubscript:@"RoamReasonSteeredByBtmCount"];

  v205 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_roamReasonSteeredByCsaCount];
  [v6 setObject:v205 forKeyedSubscript:@"RoamReasonSteeredByCsaCount"];

  v206 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_roamReasonReassocRequestedCount];
  [v6 setObject:v206 forKeyedSubscript:@"RoamReasonReassocRequestedCount"];

  v207 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_roamReasonHostTriggeredCount];
  [v6 setObject:v207 forKeyedSubscript:@"RoamReasonHostTriggeredCount"];

  v208 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_roamReasonBetterCandidateCount];
  [v6 setObject:v208 forKeyedSubscript:@"RoamReasonBetterCandidateCount"];

  v209 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_roamReasonBetterConditionCount];
  [v6 setObject:v209 forKeyedSubscript:@"RoamReasonBetterConditionCount"];

  v210 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_roamReasonMiscCount];
  [v6 setObject:v210 forKeyedSubscript:@"RoamReasonMiscCount"];

  v211 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_roamStatusSucceededCount];
  [v6 setObject:v211 forKeyedSubscript:@"RoamStatusSucceededCount"];

  v212 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_roamStatusFailedCount];
  [v6 setObject:v212 forKeyedSubscript:@"RoamStatusFailedCount"];

  v213 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_roamStatusNoCandidateCount];
  [v6 setObject:v213 forKeyedSubscript:@"RoamStatusNoCandidateCount"];

  v214 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_roamStatusNoQualifiedCandidateCount];
  [v6 setObject:v214 forKeyedSubscript:@"RoamStatusNoQualifiedCandidateCount"];

  v215 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_roamStatusFailedNoScan];
  [v6 setObject:v215 forKeyedSubscript:@"RoamStatusFailedNoScan"];

  v216 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_roamIsWNMScoreUsedCount];
  [v6 setObject:v216 forKeyedSubscript:@"RoamWNMScoreUsedCount"];

  v217 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_roamPingPongAboveThresholdCount];
  [v6 setObject:v217 forKeyedSubscript:@"RoamPingPongAboveThresholdCount"];

  v218 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_roamPingPongAboveThresholdCountLowRssiOnly];
  [v6 setObject:v218 forKeyedSubscript:@"RoamPingPongAboveThresholdCountLowRssiOnly"];

  v219 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_roamPingPongLowRssiAndReassocOnly];
  [v6 setObject:v219 forKeyedSubscript:@"RoamPingPongLowRssiAndReassocOnly"];

  v220 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_roamPingPongReassocOnly];
  [v6 setObject:v220 forKeyedSubscript:@"RoamPingPongReassocOnly"];

  [v6 setObject:self->_lastDriverUnavailableReason forKeyedSubscript:@"LastDriverUnavailableReason"];
  v221 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_driverUnavailabilityCount];
  [v6 setObject:v221 forKeyedSubscript:@"DriverUnavailabilityCount"];

  v222 = +[WiFiUsagePrivacyFilter numberWithDuration:self->_driverProcessLifespan];
  [v6 setObject:v222 forKeyedSubscript:@"DriverProcessLifespan"];

  v223 = +[WiFiUsagePrivacyFilter numberWithDuration:self->_driverAvailabilityLifespan];
  [v6 setObject:v223 forKeyedSubscript:@"DriverAvailabilityLifespan"];

  [(NSDate *)self->_sessionInitTime timeIntervalSinceDate:self->_processInitTime];
  v224 = +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:](WiFiUsagePrivacyFilter, "numberWithDurationMillisecond:");
  [v6 setObject:v224 forKeyedSubscript:@"DriverAvailabilityLatencyFromProcessInit"];

  v225 = +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:self->_driverAvailabilityLatencyFromChipReset];
  [v6 setObject:v225 forKeyedSubscript:@"DriverAvailableLatencyFromChipReset"];

  v226 = +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:self->_driverAvailabilityLatencyFromTermination];
  [v6 setObject:v226 forKeyedSubscript:@"DriverAvailableLatencyFromTermination"];

  v227 = +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:self->_joinScanLatencyFromDriverAvailability];
  [v6 setObject:v227 forKeyedSubscript:@"JoinScanLatencyFromDriverAvailability"];

  v228 = +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:self->_joinStartedLatencyFromDriverAvailability];
  [v6 setObject:v228 forKeyedSubscript:@"JoinStartedLatencyFromDriverAvailability"];

  v229 = +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:self->_joinLinkUpLatencyFromDriverAvailability];
  [v6 setObject:v229 forKeyedSubscript:@"JoinLinkUpLatencyFromDriverAvailability"];

  v230 = +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:self->_joinIpConfigurationLatencyFromDriverAvailability];
  [v6 setObject:v230 forKeyedSubscript:@"JoinIpConfigurationLatencyFromDriverAvailability"];

  v231 = +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:self->_joinInterfaceRankingLatencyFromDriverAvailability];
  [v6 setObject:v231 forKeyedSubscript:@"JoinInterfaceRankingLatencyFromDriverAvailability"];

  v232 = +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:self->_joinLinkUpLatencyFromSessionStart];
  [v6 setObject:v232 forKeyedSubscript:@"JoinLinkUpLatencySinceSessionStart"];

  v233 = [NSNumber numberWithBool:p_isSessionActive[12]];
  [v6 setObject:v233 forKeyedSubscript:@"WiFiCompatibilityModeEnabledAtStart"];

  v234 = [NSNumber numberWithBool:p_isSessionActive[13]];
  [v6 setObject:v234 forKeyedSubscript:@"WiFiCompatibilityModeEnabledAtEnd"];

  v235 = [NSNumber numberWithInteger:self->_compatibilityModeChangeCount];
  [v6 setObject:v235 forKeyedSubscript:@"WiFiCompatibilityModeChangeCount"];

  v236 = +[WiFiUsagePrivacyFilter timePercentage:self->_inCompatibilityModeEnabledDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v236 forKeyedSubscript:@"WiFiCompatibilityModeEnabledDuration"];

  [v6 setObject:self->_networkDisable6eModeAtStart forKeyedSubscript:@"NetworkDisable6EModeAtStart"];
  v237 = [NSNumber numberWithInteger:self->_network6eDisabledModeChangeCount];
  [v6 setObject:v237 forKeyedSubscript:@"NetworkDisable6EModeChangeCount"];

  v238 = +[WiFiUsagePrivacyFilter timePercentage:self->_inNetwork6eModeOffDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v238 forKeyedSubscript:@"NetworkIn6EModeOffDuration"];

  if ([(WiFiUsageSession *)self bandAtSessionStart] == 2)
  {
    v239 = objc_msgSend(NSNumber, "numberWithBool:", -[WiFiUsageSession infraIsPartOfSplitSSID](self, "infraIsPartOfSplitSSID"));
    [v6 setObject:v239 forKeyedSubscript:@"infraIsPartOfSplitSSID"];
  }
  v240 = +[WiFiUsagePrivacyFilter getLabelForNeighborsByBand:self->_roamNeighborsByBand];
  [v6 setObject:v240 forKeyedSubscript:@"RoamNeighborsCountByBand"];

  v241 = +[WiFiUsagePrivacyFilter getSumArrayCountAllBand:self->_roamNeighborsByBand];
  [v6 setObject:v241 forKeyedSubscript:@"RoamNeighborsCountTotal"];

  v242 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_minCandidatesCount];
  [v6 setObject:v242 forKeyedSubscript:@"RoamCandidatesCountMin"];

  v243 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_maxCandidatesCount];
  [v6 setObject:v243 forKeyedSubscript:@"RoamCandidatesCountMax"];

  unint64_t roamReasonLowRssiCount = self->_roamReasonLowRssiCount;
  if (roamReasonLowRssiCount)
  {
    v245 = +[WiFiUsagePrivacyFilter getBinEvery10Over100:100 * self->_currentRSSIStrongestCount / roamReasonLowRssiCount As:0];
    [v6 setObject:v245 forKeyedSubscript:@"RoamCandidatesLowRssiCurrentBSSIsBestPerc"];
  }
  else
  {
    [v6 setObject:0 forKeyedSubscript:@"RoamCandidatesLowRssiCurrentBSSIsBestPerc"];
  }
  long long v246 = *(_OWORD *)&self->_strongestRSSICountByBand.valueByBand[2];
  long long v387 = *(_OWORD *)self->_strongestRSSICountByBand.valueByBand;
  long long v388 = v246;
  v247 = +[WiFiUsagePrivacyFilter getLabelForPercIntegerByBand:&v387];
  [v6 setObject:v247 forKeyedSubscript:@"RoamCandidatesStrongestRssiByBandPerc"];

  long long v248 = *(_OWORD *)&self->_strongestRSSIByBand.valueByBand[2];
  long long v387 = *(_OWORD *)self->_strongestRSSIByBand.valueByBand;
  long long v388 = v248;
  v249 = +[WiFiUsagePrivacyFilter getLabelForRssiByBand:&v387];
  [v6 setObject:v249 forKeyedSubscript:@"RoamCandidatesStrongestRssiByBand"];

  long long v250 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[2][0];
  long long v389 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[1][1];
  long long v390 = v250;
  long long v391 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[2][2];
  uint64_t v392 = *(void *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valid[2][2];
  long long v251 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[0][2];
  long long v387 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[0][0];
  long long v388 = v251;
  v252 = +[WiFiUsagePrivacyFilter getLabelForRssiDeltaByBandTransition:&v387];
  [v6 setObject:v252 forKeyedSubscript:@"RoamCandidatesSmallestDiffCurrentToNextBestRSSIByBand"];

  long long v253 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[2][0];
  long long v389 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[1][1];
  long long v390 = v253;
  long long v391 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[2][2];
  uint64_t v392 = *(void *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valid[2][2];
  long long v254 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[0][2];
  long long v387 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[0][0];
  long long v388 = v254;
  v255 = +[WiFiUsagePrivacyFilter getLabelForRssiDeltaByBandTransition:&v387];
  [v6 setObject:v255 forKeyedSubscript:@"RoamCandidatesLargestDiffCurrentToNextBestRSSIByBand"];

  long long v256 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[2][0];
  long long v389 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[1][1];
  long long v390 = v256;
  long long v391 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[2][2];
  uint64_t v392 = *(void *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valid[2][2];
  long long v257 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[0][2];
  long long v387 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[0][0];
  long long v388 = v257;
  v258 = +[WiFiUsagePrivacyFilter getLabelForRssiDeltaByBandTransition:&v387];
  [v6 setObject:v258 forKeyedSubscript:@"RoamCandidatesSmallestDiffCurrentToBestRSSIByBand"];

  long long v259 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[2][0];
  long long v389 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[1][1];
  long long v390 = v259;
  long long v391 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[2][2];
  uint64_t v392 = *(void *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valid[2][2];
  long long v260 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[0][2];
  long long v387 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[0][0];
  long long v388 = v260;
  v261 = +[WiFiUsagePrivacyFilter getLabelForRssiDeltaByBandTransition:&v387];
  [v6 setObject:v261 forKeyedSubscript:@"RoamCandidatesLargestDiffCurrentToBestRSSIByBand"];

  +[WiFiUsagePrivacyFilter getModeCountersByCandidatesByBand:self->_roamCandidatesPerBandWhenSuccessful];
  v262 = +[WiFiUsagePrivacyFilter getLabelForIntegerByBand:v386 withCap:1];
  [v6 setObject:v262 forKeyedSubscript:@"RoamCandidatesModeSuccessfulRoams"];

  +[WiFiUsagePrivacyFilter getModeCountersByCandidatesByBand:self->_roamCandidatesPerBandWhenUnSuccessful];
  v263 = +[WiFiUsagePrivacyFilter getLabelForIntegerByBand:&v385 withCap:1];
  [v6 setObject:v263 forKeyedSubscript:@"RoamCandidatesModeUnsuccessfulRoams"];

  if (self->_ipV4DetailsPrevSession)
  {
    v264 = [NSNumber numberWithBool:p_isSessionActive[19]];
    [v6 setObject:v264 forKeyedSubscript:@"ipv4ParamChange"];
  }
  if (self->_ipV6DetailsPrevSession)
  {
    v265 = [NSNumber numberWithBool:p_isSessionActive[20]];
    [v6 setObject:v265 forKeyedSubscript:@"ipv6ParamChange"];
  }
  if ([(NSMutableArray *)self->_prevNetworkNames count] == 2)
  {
    v266 = NSNumber;
    v267 = [(WiFiUsageNetworkDetails *)self->_networkDetails networkName];
    v268 = [(NSMutableArray *)self->_prevNetworkNames objectAtIndex:0];
    v269 = objc_msgSend(v266, "numberWithBool:", objc_msgSend(v267, "isEqualToString:", v268));
    [v6 setObject:v269 forKeyedSubscript:@"PrevJoinLeftSameSSID"];
  }
  if (self->_prevJoinReason != -1)
  {
    v270 = [(id)objc_opt_class() joinReasonString:self->_prevJoinReason];
    [v6 setObject:v270 forKeyedSubscript:@"PrevJoinReason"];

    v271 = +[WiFiUsagePrivacyFilter getBinFor:(unint64_t)self->_timeSincePrevJoin In:&unk_1F2B95530 WithLowestEdge:@"0" As:1];
    [v6 setObject:v271 forKeyedSubscript:@"timeSincePrevJoin"];
  }
  v272 = [NSNumber numberWithBool:p_isSessionActive[23]];
  [v6 setObject:v272 forKeyedSubscript:@"inCoexRealTimeAtJoin"];

  v273 = [NSNumber numberWithBool:p_isSessionActive[22]];
  [v6 setObject:v273 forKeyedSubscript:@"inCoexRealTimeAtSessionStart"];

  v274 = [NSNumber numberWithBool:p_isSessionActive[21]];
  [v6 setObject:v274 forKeyedSubscript:@"inCoexRealTimeAtSessionEnd"];

  if (self->_lastCoexRealTimeOn)
  {
    v275 = NSNumber;
    -[NSDate timeIntervalSinceDate:](self->_sessionEndTime, "timeIntervalSinceDate:");
    v277 = [v275 numberWithInteger:(unint64_t)v276];
    [v6 setObject:v277 forKeyedSubscript:@"timeSinceLastRTCoexStarted"];
  }
  if (self->_lastCoexRealTimeOff)
  {
    v278 = NSNumber;
    -[NSDate timeIntervalSinceDate:](self->_sessionEndTime, "timeIntervalSinceDate:");
    v280 = [v278 numberWithInteger:(unint64_t)v279];
    [v6 setObject:v280 forKeyedSubscript:@"timeSinceLastRTCoexEnded"];
  }
  v281 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_joinReasonCount[1]];
  [v6 setObject:v281 forKeyedSubscript:@"JoinReasonAutoCount"];

  v282 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_joinReasonCount[2]];
  [v6 setObject:v282 forKeyedSubscript:@"JoinReasonSettingsCount"];

  v283 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_joinReasonCount[3]];
  [v6 setObject:v283 forKeyedSubscript:@"JoinReasonAskToJoinCount"];

  v284 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_joinReasonCount[4]];
  [v6 setObject:v284 forKeyedSubscript:@"JoinReasonRecommendationCount"];

  v285 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_joinReasonCount[5]];
  [v6 setObject:v285 forKeyedSubscript:@"JoinReasonApplicationCount"];

  v286 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_joinReasonCount[6]];
  [v6 setObject:v286 forKeyedSubscript:@"JoinReasonHomeKitCount"];

  v287 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_joinReasonCount[7]];
  [v6 setObject:v287 forKeyedSubscript:@"JoinReasonControlCenterCount"];

  v288 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_joinReasonCount[8]];
  [v6 setObject:v288 forKeyedSubscript:@"JoinReasonOtherClientCount"];

  v289 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_joinReasonCount[9]];
  [v6 setObject:v289 forKeyedSubscript:@"JoinReasonLegacyTransitionCount"];

  v290 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_joinReasonCount[10]];
  [v6 setObject:v290 forKeyedSubscript:@"JoinReasonAutoHotspotCount"];

  v291 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_joinReasonCount[11]];
  [v6 setObject:v291 forKeyedSubscript:@"JoinReasonUserOverridesAutoJoinDenyListCount"];

  v292 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_joinReasonCount[12]];
  [v6 setObject:v292 forKeyedSubscript:@"JoinReasonSeamlessTransitionCount"];

  v293 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_joinReasonCount[13]];
  [v6 setObject:v293 forKeyedSubscript:@"JoinReasonSetupCount"];

  v294 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_joinReasonCount[14]];
  [v6 setObject:v294 forKeyedSubscript:@"JoinReasonSharingCount"];

  if (self->_countRoamScan)
  {
    v295 = [NSNumber numberWithBool:p_isSessionActive[28]];
    [v6 setObject:v295 forKeyedSubscript:@"LastRoamScanFoundSSIDTransitionTarget"];

    v296 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_countSSIDTransitionTargetInLastRoamScan];
    [v6 setObject:v296 forKeyedSubscript:@"LastRoamScanFoundSSIDTransitionTargetCount"];

    v297 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_countRoamScanThatFoundSSIDTransitionTarget];
    [v6 setObject:v297 forKeyedSubscript:@"FoundSSIDTransitionTargetRoamScanCount"];

    v298 = [NSNumber numberWithInteger:(uint64_t)(float)((float)((float)self->_countRoamScanThatFoundSSIDTransitionTarget * 100.0)/ (float)self->_countRoamScan)];
    [v6 setObject:v298 forKeyedSubscript:@"RoamScanFoundSSIDTransitionTargetAsPercOfFailedRoam"];

    v299 = [NSNumber numberWithBool:p_isSessionActive[29]];
    [v6 setObject:v299 forKeyedSubscript:@"LastRoamScanFoundPotentialSSIDTransitionCandidate"];

    v300 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_countSSIDTransitionPotentialCandidatesInLastRoamScan];
    [v6 setObject:v300 forKeyedSubscript:@"LastRoamScanPotentialSSIDTransitionCandidateCount"];

    v301 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_countSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet];
    [v6 setObject:v301 forKeyedSubscript:@"LastRoamScanPotentialSSIDTransitionCandidateNotSSIDTransitionTargetCount"];

    v302 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_countRoamScanThatFoundSSIDTransitionPotentialCandidate];
    [v6 setObject:v302 forKeyedSubscript:@"FoundPotentialSSIDTransitionCandidateRoamScanCount"];

    v303 = [NSNumber numberWithInteger:(uint64_t)(float)((float)((float)self->_countRoamScanThatFoundSSIDTransitionPotentialCandidate * 100.0)/ (float)self->_countRoamScan)];
    [v6 setObject:v303 forKeyedSubscript:@"RoamScanFoundPotentialSSIDTransitionCandidateAsPercOfFailedRoam"];

    v304 = [NSNumber numberWithBool:p_isSessionActive[30]];
    [v6 setObject:v304 forKeyedSubscript:@"LastRoamScanContainsRoamCandidate"];

    v305 = +[WiFiUsagePrivacyFilter numberWithInstances:p_isSessionActive[30]];
    [v6 setObject:v305 forKeyedSubscript:@"LastRoamScanContainsRoamCandidateCount"];

    v306 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_lastRoamScanUniqueChannelsCount];
    [v6 setObject:v306 forKeyedSubscript:@"LastRoamScanUniqueChannelsCount"];

    v307 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_lastRoamScanUniqueBandsCount];
    [v6 setObject:v307 forKeyedSubscript:@"LastRoamScanUniqueBandsCount"];
  }
  if (self->_type != 9)
  {
    v308 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_inPoorLinkSessionCount];
    [v6 setObject:v308 forKeyedSubscript:@"WiFiInPoorLinkSessionCount"];

    v309 = +[WiFiUsagePrivacyFilter timePercentage:self->_inPoorLinkSessionDuration overTotalDuration:self->_sessionDuration];
    [v6 setObject:v309 forKeyedSubscript:@"WiFiInPoorLinkSessionDurationPerc"];

    v310 = +[WiFiUsagePrivacyFilter timePercentage:self->_inPoorLinkSessionDuration overTotalDuration:self->_associatedDuration];
    [v6 setObject:v310 forKeyedSubscript:@"WiFiInPoorLinkAssocPerc"];

    v311 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_tdAfterJoinAfterTDCount];
    [v6 setObject:v311 forKeyedSubscript:@"TDAfterJoinAfterTDCount"];

    if (self->_min_subsequentTdAfterJoinAfterTDCount == 0x7FFFFFFFFFFFFFFFLL)
    {
      [v6 setObject:0 forKeyedSubscript:@"TDAfterJoinAfterTDMinSequenceLen"];
    }
    else
    {
      v312 = +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:");
      [v6 setObject:v312 forKeyedSubscript:@"TDAfterJoinAfterTDMinSequenceLen"];
    }
    v313 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_max_subsequentTdAfterJoinAfterTDCount];
    [v6 setObject:v313 forKeyedSubscript:@"TDAfterJoinAfterTDMaxSequenceLen"];

    v314 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_tdSessionStartedByBadRSSICount];
    [v6 setObject:v314 forKeyedSubscript:@"PoorLinkSessionStartedByBadRSSICount"];

    v315 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_tdSessionStartedByTDRecommendedCount];
    [v6 setObject:v315 forKeyedSubscript:@"PoorLinkSessionStartedByTDRecommendedCount"];

    v316 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_tdSessionStartedBySymptomDNSFailureCount];
    [v6 setObject:v316 forKeyedSubscript:@"PoorLinkSessionStartedBySymptomDNSFailureCount"];
  }
  v317 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_tdEvalEndedCount];
  [v6 setObject:v317 forKeyedSubscript:@"TDEvalEndedCount"];

  v318 = +[WiFiUsagePrivacyFilter timePercentage:self->_tdEvalCumulativeDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v318 forKeyedSubscript:@"TDEvalDurationPerc"];

  v319 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_tdEvalStartedCount];
  [v6 setObject:v319 forKeyedSubscript:@"TDEvalStartedCount"];

  v320 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_tdEvalStartedByBadRSSICount];
  [v6 setObject:v320 forKeyedSubscript:@"TDEvalStartedByBadRSSICount"];

  v321 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_tdEvalStartedBySymptomsARPFailureCount];
  [v6 setObject:v321 forKeyedSubscript:@"TDEvalStartedBySymptomsARPFailureCount"];

  v322 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_tdEvalStartedBySymptomsShortFlowCount];
  [v6 setObject:v322 forKeyedSubscript:@"TDEvalStartedBySymptomsShortFlowCount"];

  v323 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_tdEvalStartedBySymptomsDataStallCount];
  [v6 setObject:v323 forKeyedSubscript:@"TDEvalStartedBySymptomsDataStallCount"];

  v324 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_tdEvalStartedBySymptomsDNSStallCount];
  [v6 setObject:v324 forKeyedSubscript:@"TDEvalStartedBySymptomsDNSStallCount"];

  v325 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_tdEvalStartedBySymptomsDNSFailCount];
  [v6 setObject:v325 forKeyedSubscript:@"TDEvalStartedBySymptomsDNSFailCount"];

  v326 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_tdEvalStartedByActiveProbingCount];
  [v6 setObject:v326 forKeyedSubscript:@"TDEvalStartedByActiveProbingCount"];

  v327 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_tdEvalStartedByFGNetwAppChangeCount];
  [v6 setObject:v327 forKeyedSubscript:@"TDEvalStartedByFGNetwAppChangeCount"];

  v328 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_tdEvalStartedByUserNotificationCount];
  [v6 setObject:v328 forKeyedSubscript:@"TDEvalStartedByUserNotificationCount"];

  v329 = +[WiFiUsagePrivacyFilter numberWithInstances:self->_tdEvalStartedByCheckReassocCount];
  [v6 setObject:v329 forKeyedSubscript:@"TDEvalStartedByCheckReassocCount"];

  v330 = [NSNumber numberWithUnsignedInteger:self->_inAWDL_BestInfraScore];
  [v6 setObject:v330 forKeyedSubscript:@"inAWDL_bestInfraScore"];

  v331 = [NSNumber numberWithUnsignedInteger:self->_inAWDL_WorstInfraScore];
  [v6 setObject:v331 forKeyedSubscript:@"inAWDL_worstInfraScore"];

  double inAWDL_BestP2PScore = self->_inAWDL_BestP2PScore;
  *(float *)&double inAWDL_BestP2PScore = inAWDL_BestP2PScore;
  v333 = [NSNumber numberWithFloat:inAWDL_BestP2PScore];
  [v6 setObject:v333 forKeyedSubscript:@"inAWDL_bestP2PScore"];

  double inAWDL_WorstP2PScore = self->_inAWDL_WorstP2PScore;
  *(float *)&double inAWDL_WorstP2PScore = inAWDL_WorstP2PScore;
  v335 = [NSNumber numberWithFloat:inAWDL_WorstP2PScore];
  [v6 setObject:v335 forKeyedSubscript:@"inAWDL_worstP2PScore"];

  v336 = +[WiFiUsagePrivacyFilter timePercentage:self->_inAWDL_BestInfraScoreDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v336 forKeyedSubscript:@"inAWDL_bestInfraScoreDurationPerc"];

  v337 = +[WiFiUsagePrivacyFilter timePercentage:self->_inAWDL_WorstInfraScoreDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v337 forKeyedSubscript:@"inAWDL_worstInfraScoreDurationPerc"];

  v338 = +[WiFiUsagePrivacyFilter timePercentage:self->_inAWDL_BestP2PScoreDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v338 forKeyedSubscript:@"inAWDL_bestP2PScoreDurationPerc"];

  v339 = +[WiFiUsagePrivacyFilter timePercentage:self->_inAWDL_WorstP2PScoreDuration overTotalDuration:self->_sessionDuration];
  [v6 setObject:v339 forKeyedSubscript:@"inAWDL_worstP2PScoreDurationPerc"];

  double inAWDL_BestInfraScoreDuration = self->_inAWDL_BestInfraScoreDuration;
  *(float *)&double inAWDL_BestInfraScoreDuration = inAWDL_BestInfraScoreDuration;
  v341 = [NSNumber numberWithFloat:inAWDL_BestInfraScoreDuration];
  [v6 setObject:v341 forKeyedSubscript:@"inAWDL_bestInfraScoreDuration"];

  double inAWDL_WorstInfraScoreDuration = self->_inAWDL_WorstInfraScoreDuration;
  *(float *)&double inAWDL_WorstInfraScoreDuration = inAWDL_WorstInfraScoreDuration;
  v343 = [NSNumber numberWithFloat:inAWDL_WorstInfraScoreDuration];
  [v6 setObject:v343 forKeyedSubscript:@"inAWDL_worstInfraScoreDuration"];

  double inAWDL_BestP2PScoreDuration = self->_inAWDL_BestP2PScoreDuration;
  *(float *)&double inAWDL_BestP2PScoreDuration = inAWDL_BestP2PScoreDuration;
  v345 = [NSNumber numberWithFloat:inAWDL_BestP2PScoreDuration];
  [v6 setObject:v345 forKeyedSubscript:@"inAWDL_bestP2PScoreDuration"];

  double inAWDL_WorstP2PScoreDuration = self->_inAWDL_WorstP2PScoreDuration;
  *(float *)&double inAWDL_WorstP2PScoreDuration = inAWDL_WorstP2PScoreDuration;
  v347 = [NSNumber numberWithFloat:inAWDL_WorstP2PScoreDuration];
  [v6 setObject:v347 forKeyedSubscript:@"inAWDL_worstP2PScoreDuration"];

  v348 = [NSNumber numberWithBool:self->_maxPhyMode == 512];
  [v6 setObject:v348 forKeyedSubscript:@"hasAssocToWiFi7"];

  v349 = [NSNumber numberWithBool:self->_maxPhyMode == 1024];
  [v6 setObject:v349 forKeyedSubscript:@"hasAssocToWiFi6E"];

  v350 = [NSNumber numberWithBool:self->_maxPhyMode == 256];
  [v6 setObject:v350 forKeyedSubscript:@"hasAssocToWiFi6"];

  v351 = [NSNumber numberWithBool:self->_maxPhyMode == 128];
  [v6 setObject:v351 forKeyedSubscript:@"hasAssocToWiFi5"];

  v352 = [NSNumber numberWithBool:self->_maxPhyMode == 16];
  [v6 setObject:v352 forKeyedSubscript:@"hasAssocToWiFi4"];

  v353 = [NSNumber numberWithBool:self->_maxPhyMode == 8];
  [v6 setObject:v353 forKeyedSubscript:@"hasAssocToWiFi3"];

  v354 = [NSNumber numberWithBool:self->_maxPhyMode == 2];
  [v6 setObject:v354 forKeyedSubscript:@"hasAssocToWiFi2"];

  v355 = [NSNumber numberWithBool:self->_maxPhyMode == 4];
  [v6 setObject:v355 forKeyedSubscript:@"hasAssocToWiFi1"];

  capabilities = self->_capabilities;
  if (!capabilities)
  {
    v357 = [[WiFiUsageInterfaceCapabilities alloc] initWithInterfaceName:self->_interfaceName];
    v358 = self->_capabilities;
    self->_capabilities = v357;

    capabilities = self->_capabilities;
  }
  v359 = +[WiFiUsagePrivacyFilter getLabelForPhyModes:](WiFiUsagePrivacyFilter, "getLabelForPhyModes:", +[WiFiUsageLQMTransformations maxPhyModeFrom:[(WiFiUsageInterfaceCapabilities *)capabilities supportedPhyModes]]);
  [v6 setObject:v359 forKeyedSubscript:@"WiFiRadioTechCapable"];

  if (self->_disconnectReasonMap) {
    objc_msgSend(v6, "addEntriesFromDictionary:");
  }
  lqm = self->_lqm;
  if (lqm)
  {
    v361 = [(WiFiUsageSessionLQM *)lqm eventDictionary:v3];
    [v6 addEntriesFromDictionary:v361];
  }
  networkDetails = self->_networkDetails;
  if (networkDetails)
  {
    v363 = [(WiFiUsageNetworkDetails *)networkDetails eventDictionary:v3];
    [v6 addEntriesFromDictionary:v363];
  }
  v364 = [NSNumber numberWithBool:self->_awdlActiveTime != 0];
  [v6 setObject:v364 forKeyedSubscript:@"WiFiIsAwdlActive"];

  v365 = [NSNumber numberWithBool:p_isSessionActive[14]];
  [v6 setObject:v365 forKeyedSubscript:@"WiFiIsLinkRecoveryDisabled"];

  v366 = [NSNumber numberWithUnsignedInteger:self->_forwardedBssInwakeCount];
  [v6 setObject:v366 forKeyedSubscript:@"forwardedBssInwakeCount"];

  v367 = [NSNumber numberWithUnsignedInteger:self->_forwardedBssInSleepCount];
  [v6 setObject:v367 forKeyedSubscript:@"forwardedBssInSleepCount"];

  v368 = [NSNumber numberWithUnsignedInteger:self->_hostScanTriggersCount];
  [v6 setObject:v368 forKeyedSubscript:@"hostScanTriggersCount"];

  v369 = [NSNumber numberWithUnsignedInteger:self->_roamScanTriggersCount];
  [v6 setObject:v369 forKeyedSubscript:@"roamScanTriggersCount"];

  v370 = [NSNumber numberWithUnsignedInteger:self->_pnoScanTriggersCount];
  [v6 setObject:v370 forKeyedSubscript:@"pnoScanTriggersCount"];

  v371 = [NSNumber numberWithUnsignedInteger:self->_epnoScanTriggersCount];
  [v6 setObject:v371 forKeyedSubscript:@"epnoScanTriggersCount"];

  v372 = [NSNumber numberWithUnsignedInteger:self->_currentBssMsgInWakeCount];
  [v6 setObject:v372 forKeyedSubscript:@"currentBssMsgInWakeCount"];

  v373 = [NSNumber numberWithUnsignedInteger:self->_currentBssMsgInSleepCount];
  [v6 setObject:v373 forKeyedSubscript:@"currentBssMsgInSleepCount"];

  v374 = [NSNumber numberWithUnsignedInteger:self->_scanDataMsgInWakeCount];
  [v6 setObject:v374 forKeyedSubscript:@"scanDataMsgInWakeCount"];

  v375 = [NSNumber numberWithUnsignedInteger:self->_scanDataMsgInSleepCount];
  [v6 setObject:v375 forKeyedSubscript:@"scanDataMsgInSleepCount"];

  v376 = [NSNumber numberWithUnsignedInteger:self->_spmiMsgInAwakeCount];
  [v6 setObject:v376 forKeyedSubscript:@"spmiMsgInAwakeCount"];

  v377 = [NSNumber numberWithUnsignedInteger:self->_spmiMsgInSleepCount];
  [v6 setObject:v377 forKeyedSubscript:@"spmiMsgInSleepCount"];

  v378 = [NSNumber numberWithUnsignedInteger:self->_spmiMsgDropRssiFilterCount];
  [v6 setObject:v378 forKeyedSubscript:@"spmiMsgDropRssiFilterCount"];

  v379 = [NSNumber numberWithUnsignedInteger:self->_spmiMsgDropMaxFilterCount];
  [v6 setObject:v379 forKeyedSubscript:@"spmiMsgDropMaxFilterCount"];

  v380 = [NSNumber numberWithUnsignedInteger:self->_spmiMsgDropSpmiFailCount];
  [v6 setObject:v380 forKeyedSubscript:@"spmiMsgDropSpmiFailCount"];

  v381 = [NSNumber numberWithUnsignedInteger:self->_bssDropLowMemoryCount];
  [v6 setObject:v381 forKeyedSubscript:@"bssDropLowMemoryCount"];

  v382 = [NSNumber numberWithBool:p_isSessionActive[35]];
  [v6 setObject:v382 forKeyedSubscript:@"NetworkIsInstantHotspot"];

  v383 = [NSNumber numberWithBool:p_isSessionActive[36]];
  [v6 setObject:v383 forKeyedSubscript:@"NetworkIsAutoHotspot"];

  return v6;
}

- (id)eventDictionaryByBand:(int)a3 isFirst:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  double v7 = [MEMORY[0x1E4F1CA60] dictionary];
  memset(v30, 0, sizeof(v30));
  double sessionDuration = self->_sessionDuration;
  long long v9 = *(_OWORD *)&self->_bandUsageDuration.valueByBand[2];
  long long v28 = *(_OWORD *)self->_bandUsageDuration.valueByBand;
  long long v29 = v9;
  +[WiFiUsagePrivacyFilter getPercForFloatByBand:&v28 Over:sessionDuration];
  uint64_t v10 = [(WiFiUsageSession *)self sessionName];
  [v7 setObject:v10 forKeyedSubscript:@"SessionName"];

  double v11 = +[WiFiUsagePrivacyFilter numberWithDuration:self->_sessionDuration];
  [v7 setObject:v11 forKeyedSubscript:@"SessionDuration"];

  double v12 = +[WiFiUsagePrivacyFilter getBinTimeInterval:1 As:self->_sessionDuration];
  [v7 setObject:v12 forKeyedSubscript:@"SessionDurationAsString"];

  double v13 = [NSNumber numberWithBool:v4];
  [v7 setObject:v13 forKeyedSubscript:@"firstEvent"];

  double v14 = +[WiFiUsagePrivacyFilter bandAsString:v5];
  [v7 setObject:v14 forKeyedSubscript:@"band"];

  [(WiFiUsageSession *)self bandUsageDuration];
  uint64_t v15 = v5;
  if (*((unsigned char *)&v27[5] + v5 + 8))
  {
    [(WiFiUsageSession *)self bandUsageDuration];
    double v16 = *((double *)&v27[2] + v5);
  }
  else
  {
    double v16 = 0.0;
  }
  double v17 = +[WiFiUsagePrivacyFilter getBinTimeInterval:1 As:v16];
  [v7 setObject:v17 forKeyedSubscript:@"durationOnBand"];

  if (*((unsigned char *)&v30[1] + v15 + 8)) {
    uint64_t v18 = *((void *)v30 + v15);
  }
  else {
    uint64_t v18 = 0;
  }
  double v19 = +[WiFiUsagePrivacyFilter getBinEvery10Over100:v18 As:0];
  [v7 setObject:v19 forKeyedSubscript:@"durationOnBandPerc"];

  long long v28 = 0u;
  long long v29 = 0u;
  double associatedDuration = self->_associatedDuration;
  long long v21 = *(_OWORD *)&self->_bandUsageDuration.valueByBand[2];
  v27[0] = *(_OWORD *)self->_bandUsageDuration.valueByBand;
  v27[1] = v21;
  +[WiFiUsagePrivacyFilter getPercForFloatByBand:v27 Over:associatedDuration];
  double v22 = +[WiFiUsagePrivacyFilter timePercentage:self->_associatedDuration overTotalDuration:self->_sessionDuration];
  [v7 setObject:v22 forKeyedSubscript:@"WiFiAssociatedDuration"];

  double v23 = +[WiFiUsagePrivacyFilter getBinTimeInterval:1 As:self->_associatedDuration];
  [v7 setObject:v23 forKeyedSubscript:@"WiFiAssociatedDurationAsString"];

  if (*((unsigned char *)&v29 + v15 + 8)) {
    uint64_t v24 = *((void *)&v28 + v15);
  }
  else {
    uint64_t v24 = 0;
  }
  double v25 = +[WiFiUsagePrivacyFilter getBinEvery10Over100:v24 As:0];
  [v7 setObject:v25 forKeyedSubscript:@"durationOnBandPercOfAssoc"];

  return v7;
}

- (id)sessionSummary:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = (void *)[(WiFiUsageSession *)self copy];
  [v4 summarizeSession];
  uint64_t v5 = [v4 eventDictionary:v3];

  return v5;
}

- (unint64_t)totalRxFrames
{
  v2 = [(WiFiUsageSession *)self lqm];
  unint64_t v3 = [v2 totalRxFrames];

  return v3;
}

- (unint64_t)totalTxFrames
{
  v2 = [(WiFiUsageSession *)self lqm];
  unint64_t v3 = [v2 totalTxFrames];

  return v3;
}

- (int64_t)averageCca
{
  v2 = [(WiFiUsageSession *)self lqm];
  int64_t v3 = [v2 avgTotalCca];

  return v3;
}

- (int64_t)averageRssi
{
  v2 = [(WiFiUsageSession *)self lqm];
  int64_t v3 = [v2 avgRssi];

  return v3;
}

- (int64_t)averageSnr
{
  v2 = [(WiFiUsageSession *)self lqm];
  int64_t v3 = [v2 avgSnr];

  return v3;
}

- (id)lastBssSessionInfo
{
  return [(WiFiUsageBssSession *)self->_currentBssSession sessionInfo];
}

- (int64_t)lastRssi
{
  v2 = [(WiFiUsageSession *)self lqm];
  int64_t v3 = [v2 lastRssi];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  p_isSessionActive = &self->_isSessionActive;
  uint64_t v5 = [objc_alloc((Class)objc_opt_class()) initWithSessionType:self->_type andInterfaceName:self->_interfaceName andCapabilities:self->_capabilities];
  [(id)v5 setCompletionQueue:self->_completionQueue];
  [(id)v5 setCompletionContext:self->_completionContext];
  [(id)v5 setCompletionHandler:self->_completionHandler];
  objc_storeStrong((id *)(v5 + 9152), self->_ca_config);
  [(id)v5 setSessionStartTime:self->_sessionStartTime];
  [(id)v5 setSessionEndTime:self->_sessionEndTime];
  uint64_t v6 = [(WiFiUsageBssSession *)self->_currentBssSession copy];
  double v7 = *(void **)(v5 + 9104);
  *(void *)(v5 + 9104) = v6;

  *(unsigned char *)(v5 + 9020) = p_isSessionActive[4];
  *(unsigned char *)(v5 + 9021) = p_isSessionActive[5];
  *(unsigned char *)(v5 + 9022) = p_isSessionActive[6];
  *(unsigned char *)(v5 + 9023) = p_isSessionActive[7];
  *(void *)(v5 + 9136) = self->_driverUnavailabilityCount;
  *(void *)(v5 + 10776) = self->_lastThermalIndex;
  *(void *)(v5 + 10768) = self->_lastPowerBudget;
  uint64_t v8 = [(NSMutableSet *)self->_activeApplications copy];
  long long v9 = *(void **)(v5 + 10760);
  *(void *)(v5 + 10760) = v8;

  uint64_t v10 = [(WiFiUsageSessionLQM *)self->_lqm copy];
  double v11 = *(void **)(v5 + 10752);
  *(void *)(v5 + 10752) = v10;

  *(void *)(v5 + 10608) = self->_triggerDisconnectAlertedCount;
  *(void *)(v5 + 10616) = self->_triggerDisconnectConfirmedCount;
  *(void *)(v5 + 10624) = self->_triggerDisconnectExecutedCount;
  *(void *)(v5 + 10576) = self->_netInterfaceTxBytes;
  *(void *)(v5 + 10584) = self->_netInterfaceRxBytes;
  *(void *)(v5 + 10592) = self->_secondaryInterfaceTxBytes;
  *(void *)(v5 + 10600) = self->_secondaryInterfaceRxBytes;
  uint64_t v12 = [(WiFiUsageInterfaceStats *)self->_ifStatsAtStart copy];
  double v13 = *(void **)(v5 + 10560);
  *(void *)(v5 + 10560) = v12;

  uint64_t v14 = [(WiFiUsageInterfaceStats *)self->_secondaryIfStatsAtStart copy];
  uint64_t v15 = *(void **)(v5 + 10568);
  *(void *)(v5 + 10568) = v14;

  *(void *)(v5 + 10544) = self->_neighborBssCount;
  *(void *)(v5 + 10552) = self->_otherBssCount;
  *(void *)(v5 + 10368) = self->_systemWakeStateChangedCount;
  *(void *)(v5 + 10376) = self->_systemWokenByWiFiCount;
  *(void *)(v5 + 10384) = self->_lockStateChangedCount;
  *(void *)(v5 + 10392) = self->_displayStateChangedCount;
  *(void *)(v5 + 10400) = self->_networkChangedCount;
  *(void *)(v5 + 10408) = self->_joinStateChangedCount;
  *(void *)(v5 + 10424) = self->_linkStateChangedCount;
  *(void *)(v5 + 10432) = self->_applicationStateChangedCount;
  *(void *)(v5 + 10440) = self->_powerStateChangedCount;
  *(void *)(v5 + 10448) = self->_powerToggleEventCount;
  *(void *)(v5 + 10504) = self->_rapidLinkTransitionCount;
  *(void *)(v5 + 10512) = self->_primaryInterfaceStateChangeCount;
  *(void *)(v5 + 10480) = self->_controlCenterToggleEventCount;
  *(void *)(v5 + 10472) = self->_controlCenterStateChangedCount;
  *(void *)(v5 + 10488) = self->_cellularFallbackStateChangedCount;
  *(void *)(v5 + 10496) = self->_cellularOutrankingStateChangedCount;
  *(void *)(v5 + 10208) = self->_mediaPlaybackEventCount;
  *(void *)(v5 + 10216) = self->_chargingEventCount;
  *(void *)(v5 + 10224) = self->_inCallEventCount;
  *(void *)(v5 + 10240) = self->_inVehicleEventCount;
  *(void *)(v5 + 10248) = self->_inMotionEventCount;
  *(void *)(v5 + 10256) = self->_inA2dpEventCount;
  *(void *)(v5 + 10264) = self->_inScoEventCount;
  *(void *)(v5 + 10272) = self->_inHidPresentCount;
  *(void *)(v5 + 10280) = self->_inAwdlEventCount;
  *(void *)(v5 + 10288) = self->_inRoamEventCount;
  *(void *)(v5 + 10296) = self->_inScanEventCount;
  *(void *)(v5 + 10304) = self->_inSoftApEventCount;
  *(void *)(v5 + 10312) = self->_rangingEventCount;
  *(void *)(v5 + 10320) = self->_companionConnectionStateChangedCount;
  *(void *)(v5 + 10456) = self->_smartCoverStateChangedCount;
  uint64_t v16 = [(NSString *)self->_lastSmartCoverState copy];
  double v17 = *(void **)(v5 + 10464);
  *(void *)(v5 + 10464) = v16;

  *(void *)(v5 + 10528) = self->_consecutiveJoinFailureCount;
  *(void *)(v5 + 10328) = self->_linkRecoveryDisabledCount;
  *(unsigned char *)(v5 + 9040) = p_isSessionActive[24];
  *(unsigned char *)(v5 + 9041) = p_isSessionActive[25];
  *(unsigned char *)(v5 + 9042) = p_isSessionActive[26];
  *(unsigned char *)(v5 + 9043) = p_isSessionActive[27];
  objc_storeStrong((id *)(v5 + 10928), self->_btAudioBand);
  *(void *)(v5 + 10336) = self->_wowStateChangedCount;
  *(void *)(v5 + 10344) = self->_lpasStateChangedCount;
  *(void *)(v5 + 10352) = self->_lowPowerStateChangedCount;
  *(void *)(v5 + 10360) = self->_batterySaverStateChangedCount;
  *(double *)(v5 + 10120) = self->_thermalIndexMaxDuration;
  *(double *)(v5 + 10128) = self->_thermalIndex90Duration;
  *(double *)(v5 + 10136) = self->_thermalIndex80Duration;
  *(double *)(v5 + 10144) = self->_thermalIndex70Duration;
  *(double *)(v5 + 10152) = self->_thermalIndex60Duration;
  *(double *)(v5 + 10160) = self->_thermalIndex50Duration;
  *(double *)(v5 + 10168) = self->_thermalIndex40Duration;
  *(double *)(v5 + 10176) = self->_thermalIndex30Duration;
  *(double *)(v5 + 10184) = self->_thermalIndex20Duration;
  *(double *)(v5 + 10192) = self->_thermalIndex10Duration;
  *(double *)(v5 + 10200) = self->_thermalIndexMinDuration;
  *(double *)(v5 + 10032) = self->_powerBudgetMaxDuration;
  *(double *)(v5 + 10040) = self->_powerBudget90Duration;
  *(double *)(v5 + 10048) = self->_powerBudget80Duration;
  *(double *)(v5 + 10056) = self->_powerBudget70Duration;
  *(double *)(v5 + 10064) = self->_powerBudget60Duration;
  *(double *)(v5 + 10072) = self->_powerBudget50Duration;
  *(double *)(v5 + 10080) = self->_powerBudget40Duration;
  *(double *)(v5 + 10088) = self->_powerBudget30Duration;
  *(double *)(v5 + 10096) = self->_powerBudget20Duration;
  *(double *)(v5 + 10104) = self->_powerBudget10Duration;
  *(double *)(v5 + 10112) = self->_powerBudgetMinDuration;
  *(void *)(v5 + 9768) = self->_roamReasonInitialAssociationCount;
  *(void *)(v5 + 9776) = self->_roamReasonLowRssiCount;
  *(void *)(v5 + 9784) = self->_roamReasonDeauthDisassocCount;
  *(void *)(v5 + 9792) = self->_roamReasonBeaconLostCount;
  *(void *)(v5 + 9800) = self->_roamReasonSteeredByApCount;
  *(void *)(v5 + 9808) = self->_roamReasonSteeredByBtmCount;
  *(void *)(v5 + 9816) = self->_roamReasonSteeredByCsaCount;
  *(void *)(v5 + 9824) = self->_roamReasonReassocRequestedCount;
  *(void *)(v5 + 9832) = self->_roamReasonHostTriggeredCount;
  *(void *)(v5 + 9840) = self->_roamReasonBetterCandidateCount;
  *(void *)(v5 + 9848) = self->_roamReasonBetterConditionCount;
  *(void *)(v5 + 9856) = self->_roamReasonMiscCount;
  *(void *)(v5 + 9864) = self->_roamStatusSucceededCount;
  *(void *)(v5 + 9872) = self->_roamStatusFailedCount;
  *(void *)(v5 + 9880) = self->_roamStatusNoCandidateCount;
  *(void *)(v5 + 9888) = self->_roamStatusNoQualifiedCandidateCount;
  *(void *)(v5 + 9896) = self->_roamStatusFailedNoScan;
  *(void *)(v5 + 9904) = self->_roamIsWNMScoreUsedCount;
  *(void *)(v5 + 9912) = self->_roamPingPongAboveThresholdCount;
  *(void *)(v5 + 9920) = self->_roamPingPongAboveThresholdCountLowRssiOnly;
  *(void *)(v5 + 9928) = self->_roamPingPongLowRssiAndReassocOnly;
  *(void *)(v5 + 9936) = self->_roamPingPongReassocOnly;
  *(unsigned char *)(v5 + 9033) = p_isSessionActive[17];
  uint64_t v18 = [(NSDate *)self->_lastRoamSuppressionToggled copy];
  double v19 = *(void **)(v5 + 9944);
  *(void *)(v5 + 9944) = v18;

  *(double *)(v5 + 9960) = self->_inRoamSuppressionEnabled;
  *(double *)(v5 + 9968) = self->_inRoamSuppressionWaitForRoamStart;
  *(double *)(v5 + 9976) = self->_inRoamSuppressionWaitForRoamEnd;
  *(void *)(v5 + 9984) = self->_minCandidatesCount;
  *(void *)(v5 + 9992) = self->_maxCandidatesCount;
  *(void *)(v5 + 10000) = self->_currentRSSIStrongestCount;
  uint64_t v20 = [(NSMutableDictionary *)self->_roamNeighborsByBand copy];
  long long v21 = *(void **)(v5 + 10008);
  *(void *)(v5 + 10008) = v20;

  long long v22 = *(_OWORD *)&self->_strongestRSSICountByBand.valueByBand[2];
  *(_OWORD *)(v5 + 11512) = *(_OWORD *)self->_strongestRSSICountByBand.valueByBand;
  *(_OWORD *)(v5 + 11528) = v22;
  long long v23 = *(_OWORD *)&self->_strongestRSSIByBand.valueByBand[2];
  *(_OWORD *)(v5 + 11544) = *(_OWORD *)self->_strongestRSSIByBand.valueByBand;
  *(_OWORD *)(v5 + 11560) = v23;
  long long v25 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[2][0];
  long long v24 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[2][2];
  long long v26 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[1][1];
  *(void *)(v5 + 11656) = *(void *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valid[2][2];
  *(_OWORD *)(v5 + 11624) = v25;
  *(_OWORD *)(v5 + 11640) = v24;
  *(_OWORD *)(v5 + 11608) = v26;
  long long v27 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[0][2];
  *(_OWORD *)(v5 + 11576) = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[0][0];
  *(_OWORD *)(v5 + 11592) = v27;
  long long v28 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[2][0];
  long long v29 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[2][2];
  uint64_t v30 = *(void *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valid[2][2];
  *(_OWORD *)(v5 + 11696) = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[1][1];
  *(void *)(v5 + 11744) = v30;
  *(_OWORD *)(v5 + 11728) = v29;
  *(_OWORD *)(v5 + 11712) = v28;
  long long v31 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[0][0];
  *(_OWORD *)(v5 + 11680) = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[0][2];
  *(_OWORD *)(v5 + 11664) = v31;
  long long v32 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[0][2];
  *(_OWORD *)(v5 + 11752) = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[0][0];
  *(_OWORD *)(v5 + 11768) = v32;
  long long v33 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[1][1];
  long long v34 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[2][0];
  long long v35 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[2][2];
  *(void *)(v5 + 11832) = *(void *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valid[2][2];
  *(_OWORD *)(v5 + 11800) = v34;
  *(_OWORD *)(v5 + 11816) = v35;
  *(_OWORD *)(v5 + 11784) = v33;
  long long v36 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[0][0];
  *(_OWORD *)(v5 + 11856) = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[0][2];
  *(_OWORD *)(v5 + 11840) = v36;
  long long v37 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[1][1];
  long long v38 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[2][0];
  long long v39 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[2][2];
  *(void *)(v5 + 11920) = *(void *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valid[2][2];
  *(_OWORD *)(v5 + 11904) = v39;
  *(_OWORD *)(v5 + 11888) = v38;
  *(_OWORD *)(v5 + 11872) = v37;
  uint64_t v40 = [(NSMutableDictionary *)self->_roamCandidatesPerBandWhenSuccessful copy];
  id v41 = *(void **)(v5 + 10016);
  *(void *)(v5 + 10016) = v40;

  uint64_t v42 = [(NSMutableDictionary *)self->_roamCandidatesPerBandWhenUnSuccessful copy];
  v43 = *(void **)(v5 + 10024);
  *(void *)(v5 + 10024) = v42;

  *(double *)(v5 + 9080) = self->_sessionDuration;
  *(double *)(v5 + 9520) = self->_systemAwakeDuration;
  *(double *)(v5 + 9528) = self->_mediaPlaybackDuration;
  *(double *)(v5 + 9536) = self->_chargingDuration;
  *(double *)(v5 + 9552) = self->_inCallDuration;
  *(double *)(v5 + 9568) = self->_inVehicleDuration;
  *(double *)(v5 + 9576) = self->_inMotionDuration;
  *(double *)(v5 + 9584) = self->_inA2dpDuration;
  *(double *)(v5 + 9592) = self->_inScoDuration;
  *(double *)(v5 + 9600) = self->_inHidPresentDuration;
  *(double *)(v5 + 9608) = self->_inAwdlDuration;
  *(double *)(v5 + 9616) = self->_inRoamDuration;
  *(double *)(v5 + 9624) = self->_inScanDuration;
  *(double *)(v5 + 9632) = self->_inSoftApDuration;
  *(double *)(v5 + 9640) = self->_poweredOnDuration;
  *(double *)(v5 + 9648) = self->_associatedDuration;
  *(unsigned char *)(v5 + 9018) = p_isSessionActive[2];
  *(double *)(v5 + 9656) = self->_associatedSleepDuration;
  *(double *)(v5 + 9664) = self->_inCellularFallbackDuration;
  *(double *)(v5 + 9672) = self->_inCellularOutrankingDuration;
  long long v44 = *(_OWORD *)&self->_bandUsageDuration.valueByBand[2];
  *(_OWORD *)(v5 + 11480) = *(_OWORD *)self->_bandUsageDuration.valueByBand;
  *(_OWORD *)(v5 + 11496) = v44;
  *(double *)(v5 + 9680) = self->_inControlCenterAutoJoinDisabledDuration;
  *(double *)(v5 + 9544) = self->_companionConnectedDuration;
  *(double *)(v5 + 9696) = self->_linkRecoveryDisabledDuration;
  *(double *)(v5 + 10744) = self->_longestUnassociatedDuration;
  *(double *)(v5 + 9704) = self->_inWowStateDuration;
  *(double *)(v5 + 9712) = self->_inLpasStateDuration;
  *(double *)(v5 + 9720) = self->_inLowPowerStateDuration;
  *(double *)(v5 + 9728) = self->_inBatterySaverStateDuration;
  *(double *)(v5 + 9736) = self->_sleepPowerStatsTotalDuration;
  *(double *)(v5 + 9744) = self->_sleepPowerStatsUnassociatedDuration;
  *(double *)(v5 + 9752) = self->_sleepPowerStatsAssociatedDuration;
  *(double *)(v5 + 9760) = self->_sleepPowerStatsRoamingDuration;
  uint64_t v45 = [(NSDate *)self->_sessionInitTime copy];
  long long v46 = *(void **)(v5 + 9248);
  *(void *)(v5 + 9248) = v45;

  uint64_t v47 = [(NSDate *)self->_sessionStartTime copy];
  long long v48 = *(void **)(v5 + 9256);
  *(void *)(v5 + 9256) = v47;

  uint64_t v49 = [(NSDate *)self->_sessionEndTime copy];
  id v50 = *(void **)(v5 + 9264);
  *(void *)(v5 + 9264) = v49;

  uint64_t v51 = [(NSDate *)self->_mediaStartedTime copy];
  double v52 = *(void **)(v5 + 9272);
  *(void *)(v5 + 9272) = v51;

  uint64_t v53 = [(NSDate *)self->_chargingStartedTime copy];
  char v54 = *(void **)(v5 + 9280);
  *(void *)(v5 + 9280) = v53;

  uint64_t v55 = [(NSDate *)self->_companionConnectionTime copy];
  long long v56 = *(void **)(v5 + 9288);
  *(void *)(v5 + 9288) = v55;

  uint64_t v57 = [(NSDate *)self->_callStartedTime copy];
  double v58 = *(void **)(v5 + 9296);
  *(void *)(v5 + 9296) = v57;

  uint64_t v59 = [(NSDate *)self->_inVehicleEntryTime copy];
  v60 = *(void **)(v5 + 9312);
  *(void *)(v5 + 9312) = v59;

  uint64_t v61 = [(NSDate *)self->_inMotionStartedTime copy];
  double v62 = *(void **)(v5 + 9320);
  *(void *)(v5 + 9320) = v61;

  uint64_t v63 = [(NSDate *)self->_a2dpActiveTime copy];
  v64 = *(void **)(v5 + 9328);
  *(void *)(v5 + 9328) = v63;

  uint64_t v65 = [(NSDate *)self->_scoActiveTime copy];
  int v66 = *(void **)(v5 + 9336);
  *(void *)(v5 + 9336) = v65;

  uint64_t v67 = [(NSDate *)self->_hidPresentTime copy];
  v68 = *(void **)(v5 + 9344);
  *(void *)(v5 + 9344) = v67;

  uint64_t v69 = [(NSDate *)self->_awdlActiveTime copy];
  uint64_t v70 = *(void **)(v5 + 9352);
  *(void *)(v5 + 9352) = v69;

  uint64_t v71 = [(NSDate *)self->_roamingActiveTime copy];
  v72 = *(void **)(v5 + 9360);
  *(void *)(v5 + 9360) = v71;

  uint64_t v73 = [(NSDate *)self->_scanningActiveTime copy];
  int v74 = *(void **)(v5 + 9368);
  *(void *)(v5 + 9368) = v73;

  uint64_t v75 = [(NSDate *)self->_softApActiveTime copy];
  v76 = *(void **)(v5 + 9376);
  *(void *)(v5 + 9376) = v75;

  uint64_t v77 = [(NSDate *)self->_lastPowerStateChangedTime copy];
  v78 = *(void **)(v5 + 9384);
  *(void *)(v5 + 9384) = v77;

  uint64_t v79 = [(NSDate *)self->_lastCellularFallbackStateChangedTime copy];
  v80 = *(void **)(v5 + 9400);
  *(void *)(v5 + 9400) = v79;

  uint64_t v81 = [(NSDate *)self->_lastCellularOutrankingStateChangedTime copy];
  v82 = *(void **)(v5 + 9408);
  *(void *)(v5 + 9408) = v81;

  uint64_t v83 = [(NSDate *)self->_lastControlCenterStateChangedTime copy];
  v84 = *(void **)(v5 + 9392);
  *(void *)(v5 + 9392) = v83;

  uint64_t v85 = [(NSDate *)self->_lastSystemWakeTime copy];
  v86 = *(void **)(v5 + 9416);
  *(void *)(v5 + 9416) = v85;

  uint64_t v87 = [(NSDate *)self->_lastSystemSleepTime copy];
  v88 = *(void **)(v5 + 9424);
  *(void *)(v5 + 9424) = v87;

  uint64_t v89 = [(NSDate *)self->_lastUnexpectedLinkDownTime copy];
  v90 = *(void **)(v5 + 9432);
  *(void *)(v5 + 9432) = v89;

  uint64_t v91 = [(NSDate *)self->_lastLinkStateChangedTime copy];
  v92 = *(void **)(v5 + 9440);
  *(void *)(v5 + 9440) = v91;

  uint64_t v93 = [(NSDate *)self->_lastPowerBudgetChangedTime copy];
  v94 = *(void **)(v5 + 9448);
  *(void *)(v5 + 9448) = v93;

  uint64_t v95 = [(NSDate *)self->_lastBssChangedTime copy];
  v96 = *(void **)(v5 + 9456);
  *(void *)(v5 + 9456) = v95;

  uint64_t v97 = [(NSDate *)self->_linkRecoveryDisabledTime copy];
  v98 = *(void **)(v5 + 9472);
  *(void *)(v5 + 9472) = v97;

  *(unsigned char *)(v5 + 9030) = p_isSessionActive[14];
  uint64_t v99 = [(NSDate *)self->_wowStateEntryTime copy];
  v100 = *(void **)(v5 + 9480);
  *(void *)(v5 + 9480) = v99;

  uint64_t v101 = [(NSDate *)self->_lpasStateEntryTime copy];
  v102 = *(void **)(v5 + 9488);
  *(void *)(v5 + 9488) = v101;

  uint64_t v103 = [(NSDate *)self->_lowPowerStateEntryTime copy];
  v104 = *(void **)(v5 + 9496);
  *(void *)(v5 + 9496) = v103;

  uint64_t v105 = [(NSDate *)self->_batterySaverStateEntryTime copy];
  v106 = *(void **)(v5 + 9504);
  *(void *)(v5 + 9504) = v105;

  *(void *)(v5 + 9184) = self->_lastJoinReason;
  *(void *)(v5 + 9192) = self->_lastJoinFailure;
  *(void *)(v5 + 9200) = self->_lastDisconnectReason;
  *(void *)(v5 + 9208) = self->_lastDisconnectSubreason;
  *(void *)(v5 + 9216) = self->_previousDisconnectReason;
  *(void *)(v5 + 10416) = self->_savedJoinStateChangedCount;
  *(void *)(v5 + 9224) = self->_savedLastJoinReason;
  *(void *)(v5 + 9232) = self->_savedLastJoinFailure;
  *(void *)(v5 + 9240) = self->_savedPreviousDisconnectReason;
  *(unsigned char *)(v5 + 9032) = p_isSessionActive[16];
  uint64_t v107 = [(NSString *)self->_secondaryInterfaceName copy];
  v108 = *(void **)(v5 + 9144);
  *(void *)(v5 + 9144) = v107;

  *(unsigned char *)(v5 + 9016) = *p_isSessionActive;
  *(unsigned char *)(v5 + 9024) = p_isSessionActive[8];
  *(unsigned char *)(v5 + 9025) = p_isSessionActive[9];
  *(unsigned char *)(v5 + 9026) = p_isSessionActive[10];
  *(unsigned char *)(v5 + 9027) = p_isSessionActive[11];
  *(void *)(v5 + 9168) = self->_sessionPid;
  uint64_t v109 = [(NSDate *)self->_processInitTime copy];
  v110 = *(void **)(v5 + 9120);
  *(void *)(v5 + 9120) = v109;

  uint64_t v111 = [(NSString *)self->_cellularDataStatus copy];
  v112 = *(void **)(v5 + 9160);
  *(void *)(v5 + 9160) = v111;

  *(unsigned char *)(v5 + 9031) = p_isSessionActive[15];
  *(void *)(v5 + 10536) = self->_airplaneModeStateChangedCount;
  uint64_t v113 = [(NSString *)self->_lastDriverUnavailableReason copy];
  v114 = *(void **)(v5 + 10656);
  *(void *)(v5 + 10656) = v113;

  uint64_t v115 = [(NSDate *)self->_lastDriverTerminationTime copy];
  v116 = *(void **)(v5 + 10632);
  *(void *)(v5 + 10632) = v115;

  uint64_t v117 = [(NSDate *)self->_lastChipResetTime copy];
  v118 = *(void **)(v5 + 10640);
  *(void *)(v5 + 10640) = v117;

  uint64_t v119 = [(NSDate *)self->_lastDriverAvailableTime copy];
  v120 = *(void **)(v5 + 10648);
  *(void *)(v5 + 10648) = v119;

  *(double *)(v5 + 10664) = self->_driverProcessLifespan;
  *(double *)(v5 + 10672) = self->_driverAvailabilityLifespan;
  *(double *)(v5 + 10688) = self->_driverAvailabilityLatencyFromTermination;
  *(double *)(v5 + 10696) = self->_joinScanLatencyFromDriverAvailability;
  *(double *)(v5 + 10704) = self->_joinStartedLatencyFromDriverAvailability;
  *(double *)(v5 + 10712) = self->_joinLinkUpLatencyFromDriverAvailability;
  *(double *)(v5 + 10720) = self->_joinIpConfigurationLatencyFromDriverAvailability;
  *(double *)(v5 + 10728) = self->_joinInterfaceRankingLatencyFromDriverAvailability;
  *(double *)(v5 + 10736) = self->_joinLinkUpLatencyFromSessionStart;
  long long v121 = *(_OWORD *)self->_perClientScanCount;
  *(_OWORD *)(v5 + 24) = *(_OWORD *)&self->_perClientScanCount[2];
  *(_OWORD *)(v5 + 8) = v121;
  long long v122 = *(_OWORD *)&self->_perClientScanCount[4];
  long long v123 = *(_OWORD *)&self->_perClientScanCount[6];
  long long v124 = *(_OWORD *)&self->_perClientScanCount[8];
  *(_OWORD *)(v5 + 88) = *(_OWORD *)&self->_perClientScanCount[10];
  *(_OWORD *)(v5 + 72) = v124;
  *(_OWORD *)(v5 + 56) = v123;
  *(_OWORD *)(v5 + 40) = v122;
  long long v125 = *(_OWORD *)&self->_perClientScanCount[12];
  long long v126 = *(_OWORD *)&self->_perClientScanCount[14];
  long long v127 = *(_OWORD *)&self->_perClientScanCount[16];
  *(_OWORD *)(v5 + 152) = *(_OWORD *)&self->_perClientScanCount[18];
  *(_OWORD *)(v5 + 136) = v127;
  *(_OWORD *)(v5 + 120) = v126;
  *(_OWORD *)(v5 + 104) = v125;
  long long v128 = *(_OWORD *)&self->_perClientScanCount[20];
  long long v129 = *(_OWORD *)&self->_perClientScanCount[22];
  long long v130 = *(_OWORD *)&self->_perClientScanCount[24];
  *(void *)(v5 + 216) = self->_perClientScanCount[26];
  *(_OWORD *)(v5 + 200) = v130;
  *(_OWORD *)(v5 + 184) = v129;
  *(_OWORD *)(v5 + 168) = v128;
  memcpy((void *)(v5 + 224), self->_faultReasonCount, 0x110uLL);
  long long v131 = *(_OWORD *)&self->_joinReasonCount[6];
  long long v133 = *(_OWORD *)self->_joinReasonCount;
  long long v132 = *(_OWORD *)&self->_joinReasonCount[2];
  *(_OWORD *)(v5 + 528) = *(_OWORD *)&self->_joinReasonCount[4];
  *(_OWORD *)(v5 + 544) = v131;
  *(_OWORD *)(v5 + 496) = v133;
  *(_OWORD *)(v5 + 512) = v132;
  long long v135 = *(_OWORD *)&self->_joinReasonCount[10];
  long long v134 = *(_OWORD *)&self->_joinReasonCount[12];
  long long v136 = *(_OWORD *)&self->_joinReasonCount[8];
  *(void *)(v5 + 608) = self->_joinReasonCount[14];
  *(_OWORD *)(v5 + 576) = v135;
  *(_OWORD *)(v5 + 592) = v134;
  *(_OWORD *)(v5 + 560) = v136;
  uint64_t v137 = [(NSMutableDictionary *)self->_disconnectReasonMap mutableCopy];
  v138 = *(void **)(v5 + 9008);
  *(void *)(v5 + 9008) = v137;

  *(unsigned char *)(v5 + 9028) = p_isSessionActive[12];
  *(unsigned char *)(v5 + 9029) = p_isSessionActive[13];
  *(void *)(v5 + 10520) = self->_compatibilityModeChangeCount;
  objc_storeStrong((id *)(v5 + 9464), self->_lastCompatibilityModeChangedTime);
  *(double *)(v5 + 9688) = self->_inCompatibilityModeEnabledDuration;
  *(_DWORD *)(v5 + 9060) = self->_bandAtSessionStart;
  *(unsigned char *)(v5 + 9034) = p_isSessionActive[18];
  *(void *)(v5 + 10784) = self->_rssiAtSessionStart;
  *(double *)(v5 + 9512) = self->_sessionTimeSinceLastSession;
  networkDetailsAtEnd = self->_networkDetailsAtEnd;
  v140 = networkDetailsAtEnd;
  if (!networkDetailsAtEnd) {
    v140 = (WiFiUsageNetworkDetails *)[(WiFiUsageNetworkDetails *)self->_networkDetails copy];
  }
  objc_storeStrong((id *)(v5 + 9096), v140);
  if (!networkDetailsAtEnd) {

  }
  uint64_t v141 = 10816;
  if (!self->_networkDetailsAtEnd) {
    uint64_t v141 = 10808;
  }
  objc_storeStrong((id *)(v5 + 10808), *(id *)((char *)&self->super.isa + v141));
  if (self->_networkDetailsAtEnd) {
    lastNetwork6eDisableModeChangedTime = 0;
  }
  else {
    lastNetwork6eDisableModeChangedTime = self->_lastNetwork6eDisableModeChangedTime;
  }
  objc_storeStrong((id *)(v5 + 10824), lastNetwork6eDisableModeChangedTime);
  uint64_t v143 = 10840;
  if (!self->_networkDetailsAtEnd) {
    uint64_t v143 = 10832;
  }
  *(void *)(v5 + 10832) = *(Class *)((char *)&self->super.isa + v143);
  uint64_t v144 = 10800;
  if (!self->_networkDetailsAtEnd) {
    uint64_t v144 = 10792;
  }
  *(void *)(v5 + 10792) = *(Class *)((char *)&self->super.isa + v144);
  objc_storeStrong((id *)(v5 + 10864), self->_ipV4DetailsPrevSession);
  *(unsigned char *)(v5 + 9035) = p_isSessionActive[19];
  objc_storeStrong((id *)(v5 + 10872), self->_ipV6DetailsPrevSession);
  *(unsigned char *)(v5 + 9036) = p_isSessionActive[20];
  *(unsigned char *)(v5 + 9037) = p_isSessionActive[21];
  uint64_t v145 = [(NSMutableArray *)self->_prevNetworkNames copy];
  v146 = *(void **)(v5 + 10896);
  *(void *)(v5 + 10896) = v145;

  *(unsigned char *)(v5 + 9039) = p_isSessionActive[23];
  *(unsigned char *)(v5 + 9038) = p_isSessionActive[22];
  *(void *)(v5 + 10904) = self->_prevJoinReason;
  *(double *)(v5 + 10920) = self->_timeSincePrevJoin;
  objc_storeStrong((id *)(v5 + 10880), self->_lastCoexRealTimeOn);
  objc_storeStrong((id *)(v5 + 10888), self->_lastCoexRealTimeOff);
  *(unsigned char *)(v5 + 9047) = p_isSessionActive[31];
  *(void *)(v5 + 11000) = self->_savedPrevJoinReason;
  *(double *)(v5 + 11016) = self->_savedTimeSincePrevJoin;
  *(void *)(v5 + 10936) = self->_countRoamScan;
  *(unsigned char *)(v5 + 9044) = p_isSessionActive[28];
  *(void *)(v5 + 10944) = self->_countSSIDTransitionTargetInLastRoamScan;
  *(void *)(v5 + 10952) = self->_countRoamScanThatFoundSSIDTransitionTarget;
  *(unsigned char *)(v5 + 9045) = p_isSessionActive[29];
  *(void *)(v5 + 10960) = self->_countSSIDTransitionPotentialCandidatesInLastRoamScan;
  *(void *)(v5 + 10968) = self->_countSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet;
  *(unsigned char *)(v5 + 9046) = p_isSessionActive[30];
  *(void *)(v5 + 10984) = self->_lastRoamScanUniqueChannelsCount;
  *(void *)(v5 + 10992) = self->_lastRoamScanUniqueBandsCount;
  *(void *)(v5 + 10976) = self->_countRoamScanThatFoundSSIDTransitionPotentialCandidate;
  *(void *)(v5 + 11024) = self->_inPoorLinkSessionCount;
  *(double *)(v5 + 11032) = self->_inPoorLinkSessionDuration;
  *(void *)(v5 + 11040) = self->_tdAfterJoinAfterTDCount;
  *(void *)(v5 + 11056) = self->_min_subsequentTdAfterJoinAfterTDCount;
  *(void *)(v5 + 11064) = self->_max_subsequentTdAfterJoinAfterTDCount;
  *(void *)(v5 + 11072) = self->_tdSessionStartedByBadRSSICount;
  *(void *)(v5 + 11080) = self->_tdSessionStartedByTDRecommendedCount;
  *(void *)(v5 + 11088) = self->_tdSessionStartedBySymptomDNSFailureCount;
  *(void *)(v5 + 11096) = self->_tdEvalEndedCount;
  *(double *)(v5 + 11104) = self->_tdEvalCumulativeDuration;
  *(void *)(v5 + 11112) = self->_tdEvalStartedCount;
  *(void *)(v5 + 11120) = self->_tdEvalStartedByBadRSSICount;
  *(void *)(v5 + 11128) = self->_tdEvalStartedBySymptomsARPFailureCount;
  *(void *)(v5 + 11136) = self->_tdEvalStartedBySymptomsDNSFailCount;
  *(void *)(v5 + 11144) = self->_tdEvalStartedBySymptomsShortFlowCount;
  *(void *)(v5 + 11160) = self->_tdEvalStartedBySymptomsDataStallCount;
  *(void *)(v5 + 11168) = self->_tdEvalStartedBySymptomsDNSStallCount;
  *(void *)(v5 + 11136) = self->_tdEvalStartedBySymptomsDNSFailCount;
  *(void *)(v5 + 11176) = self->_tdEvalStartedByActiveProbingCount;
  *(void *)(v5 + 11184) = self->_tdEvalStartedByFGNetwAppChangeCount;
  *(void *)(v5 + 11192) = self->_tdEvalStartedByUserNotificationCount;
  *(void *)(v5 + 11200) = self->_tdEvalStartedByCheckReassocCount;
  objc_storeStrong((id *)(v5 + 11216), self->_lastUsbStatusChange);
  *(unsigned char *)(v5 + 9050) = p_isSessionActive[34];
  *(void *)(v5 + 11208) = self->_usbDeviceEventCount;
  *(double *)(v5 + 11224) = self->_usbInsertedDuration;
  objc_storeStrong((id *)(v5 + 11232), self->_lastAWDLSequenceUpdate);
  *(void *)(v5 + 11240) = self->_inAWDL_BestInfraScore;
  *(void *)(v5 + 11248) = self->_inAWDL_WorstInfraScore;
  *(double *)(v5 + 11256) = self->_inAWDL_BestP2PScore;
  *(double *)(v5 + 11264) = self->_inAWDL_WorstP2PScore;
  *(void *)(v5 + 11272) = self->_inAWDL_lastInfraScore;
  *(double *)(v5 + 11280) = self->_inAWDL_lastP2PScore;
  *(double *)(v5 + 11288) = self->_inAWDL_BestInfraScoreDuration;
  *(double *)(v5 + 11296) = self->_inAWDL_BestP2PScoreDuration;
  *(double *)(v5 + 11304) = self->_inAWDL_WorstInfraScoreDuration;
  *(double *)(v5 + 11312) = self->_inAWDL_WorstP2PScoreDuration;
  *(void *)(v5 + 11320) = self->_forwardedBssInwakeCount;
  *(void *)(v5 + 11328) = self->_forwardedBssInSleepCount;
  *(void *)(v5 + 11336) = self->_hostScanTriggersCount;
  *(void *)(v5 + 11344) = self->_roamScanTriggersCount;
  *(void *)(v5 + 11352) = self->_pnoScanTriggersCount;
  *(void *)(v5 + 11360) = self->_epnoScanTriggersCount;
  *(void *)(v5 + 11368) = self->_currentBssMsgInWakeCount;
  *(void *)(v5 + 11376) = self->_currentBssMsgInSleepCount;
  *(void *)(v5 + 11384) = self->_scanDataMsgInWakeCount;
  *(void *)(v5 + 11392) = self->_scanDataMsgInSleepCount;
  *(void *)(v5 + 11400) = self->_spmiMsgInAwakeCount;
  *(void *)(v5 + 11408) = self->_spmiMsgInSleepCount;
  *(void *)(v5 + 11416) = self->_spmiMsgDropRssiFilterCount;
  *(void *)(v5 + 11424) = self->_spmiMsgDropMaxFilterCount;
  *(void *)(v5 + 11432) = self->_spmiMsgDropSpmiFailCount;
  *(void *)(v5 + 11440) = self->_bssDropLowMemoryCount;
  *(_DWORD *)(v5 + 9064) = self->_maxPhyMode;
  *(unsigned char *)(v5 + 9051) = p_isSessionActive[35];
  *(unsigned char *)(v5 + 9052) = p_isSessionActive[36];
  return (id)v5;
}

- (unint64_t)faultReasonCount:(unint64_t)a3
{
  if (a3 - 1 > 0x20) {
    return 0;
  }
  else {
    return self->_faultReasonCount[a3];
  }
}

- (id)metricName
{
  return 0;
}

- (void)enableXCTestNotifications
{
  self->_xctest = 1;
}

- (void)receivedBssTransitionRequestWithCandidateListIncluded:(BOOL)a3 isAbridged:(BOOL)a4 disassociationImminent:(BOOL)a5 bssTerminationIncluded:(BOOL)a6 essDisassociationImminent:(BOOL)a7
{
}

- (void)sentBssTransitionResponseWithStatus:(int64_t)a3 terminationDelayRequested:(BOOL)a4
{
}

- (void)processIPv4Changes:(id)a3
{
  id v4 = a3;
  uint64_t v6 = v4;
  id v9 = v4;
  if (v4 && self->_ipV4DetailsPrevSession)
  {
    int v7 = [v4 isValid];
    uint64_t v6 = v9;
    if (v7)
    {
      BOOL v8 = [(WiFiUsageNetworkIPv4Details *)self->_ipV4DetailsPrevSession isEqual:v9];
      uint64_t v6 = v9;
      self->_hasDifferentIpv4DetailsThanPrevSession = !v8;
    }
  }
  else if (!v4)
  {
    goto LABEL_8;
  }
  id v4 = (id)[v6 isValid];
  uint64_t v6 = v9;
  if (v4)
  {
    id v4 = (id)[(WiFiUsageSession *)self setIpV4Details:v9];
    uint64_t v6 = v9;
  }
LABEL_8:

  MEMORY[0x1F41817F8](v4, v6, v5);
}

- (void)processIPv6Changes:(id)a3
{
  id v4 = a3;
  uint64_t v6 = v4;
  id v9 = v4;
  if (v4 && self->_ipV6DetailsPrevSession)
  {
    int v7 = [v4 isValid];
    uint64_t v6 = v9;
    if (v7)
    {
      char v8 = [(WiFiUsageNetworkIPv6Details *)self->_ipV6DetailsPrevSession isEqual:v9];
      uint64_t v6 = v9;
      self->_hasDifferentIpv6DetailsThanPrevSession = v8 ^ 1;
    }
  }
  else if (!v4)
  {
    goto LABEL_8;
  }
  id v4 = (id)[v6 isValid];
  uint64_t v6 = v9;
  if (v4)
  {
    id v4 = (id)[(WiFiUsageSession *)self setIpV6Details:v9];
    uint64_t v6 = v9;
  }
LABEL_8:

  MEMORY[0x1F41817F8](v4, v6, v5);
}

- (void)setRealtimeCoexStarted:(BOOL)a3 type:(unint64_t)a4 reasons:(id)a5
{
  BOOL v5 = a3;
  id v14 = a5;
  p_BOOL inCoexRealTime = &self->_inCoexRealTime;
  BOOL inCoexRealTime = self->_inCoexRealTime;
  if (!self->_inCoexRealTime && v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
    lastCoexRealTimeOn = self->_lastCoexRealTimeOn;
    self->_lastCoexRealTimeOn = v10;

    BOOL inCoexRealTime = *p_inCoexRealTime;
  }
  if (inCoexRealTime && !v5)
  {
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] now];
    lastCoexRealTimeOff = self->_lastCoexRealTimeOff;
    self->_lastCoexRealTimeOff = v12;
  }
  BOOL *p_inCoexRealTime = v5;
}

- (void)setAwdlSequence:(id)a3 infraScore:(unint64_t)a4 p2pScore:(double)a5
{
  objc_msgSend(MEMORY[0x1E4F1C9C8], "now", a3);
  char v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (self->_isAssociated) {
    unint64_t v9 = a4;
  }
  else {
    unint64_t v9 = 0;
  }
  [(WiFiUsageSession *)self tallyInfraScoreDuration:v9 until:v8];
  [(WiFiUsageSession *)self tallyP2PScoreDuration:v8 until:a5];
  lastAWDLSequenceUpdate = self->_lastAWDLSequenceUpdate;
  self->_lastAWDLSequenceUpdate = v8;
}

- (void)updateLinkRecoveryDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [MEMORY[0x1E4F1C9C8] date];
  int v7 = v5;
  if (v3)
  {
    if (!self->_linkRecoveryDisabled)
    {
      unint64_t v9 = v5;
      BOOL v5 = (void *)[(WiFiUsageSession *)self setLinkRecoveryDisabledTime:v5];
      int v7 = v9;
      ++self->_linkRecoveryDisabledCount;
    }
  }
  else
  {
    linkRecoveryDisabledTime = self->_linkRecoveryDisabledTime;
    if (linkRecoveryDisabledTime)
    {
      uint64_t v10 = v5;
      objc_msgSend(v5, "timeIntervalSinceDate:");
      self->_linkRecoveryDisabledDuration = v8 + self->_linkRecoveryDisabledDuration;
      BOOL v5 = (void *)[(WiFiUsageSession *)self setLinkRecoveryDisabledTime:0];
      int v7 = v10;
    }
  }
  self->_linkRecoveryDisabled = v3;

  MEMORY[0x1F41817F8](v5, v7, linkRecoveryDisabledTime);
}

- (BOOL)infraIsPartOfSplitSSID
{
  if ([(WiFiUsageSession *)self bandAtSessionStart] != 2) {
    return 0;
  }
  networkDetails = self->_networkDetails;

  return [(WiFiUsageNetworkDetails *)networkDetails isStandalone6E];
}

- (void)processDriverAvailability:(id)a3 available:(unint64_t)a4 version:(unint64_t)a5 flags:(unint64_t)a6 eventID:(unint64_t)a7 reason:(unint64_t)a8 subReason:(unint64_t)a9 minorReason:(unint64_t)a10 reasonString:(id)a11
{
  id v16 = a11;
  double v13 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v14 = [(WiFiUsageSession *)self isDriverAvailable];
  if (a4)
  {
    if (!v14)
    {
      [(WiFiUsageSession *)self setLastDriverAvailableTime:v13];
      if (self->_lastChipResetTime && self->_driverAvailabilityLatencyFromChipReset == 0.0)
      {
        objc_msgSend(v13, "timeIntervalSinceDate:");
        -[WiFiUsageSession setDriverAvailabilityLatencyFromChipReset:](self, "setDriverAvailabilityLatencyFromChipReset:");
      }
      if (self->_lastDriverTerminationTime && self->_driverAvailabilityLatencyFromTermination == 0.0)
      {
        objc_msgSend(v13, "timeIntervalSinceDate:");
        -[WiFiUsageSession setDriverAvailabilityLatencyFromTermination:](self, "setDriverAvailabilityLatencyFromTermination:");
      }
    }
  }
  else if (v14)
  {
    unint64_t driverUnavailabilityCount = self->_driverUnavailabilityCount;
    if (!driverUnavailabilityCount)
    {
      [(WiFiUsageSession *)self trackEventLatencies];
      unint64_t driverUnavailabilityCount = self->_driverUnavailabilityCount;
    }
    self->_unint64_t driverUnavailabilityCount = driverUnavailabilityCount + 1;
  }
  if (v16 && !self->_lastDriverUnavailableReason && [v16 length]) {
    [(WiFiUsageSession *)self setLastDriverUnavailableReason:v16];
  }
  [(WiFiUsageSession *)self setIsDriverAvailable:a4 != 0];
}

- (void)ipConfigurationDidChangeWithMethod:(BOOL)a3 dhcpLeaseDuration:(double)a4 hasRoutableIpV4:(BOOL)a5 hasRoutableIpV6:(BOOL)a6
{
  unint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", a3, a4);
  if (self->_joinIpConfigurationLatencyFromDriverAvailability == 0.0
    && self->_lastDriverAvailableTime
    && (a5 || a6 || self->_lastInterfacePrimaryState))
  {
    id v10 = v9;
    objc_msgSend(v9, "timeIntervalSinceDate:");
    -[WiFiUsageSession setJoinIpConfigurationLatencyFromDriverAvailability:](self, "setJoinIpConfigurationLatencyFromDriverAvailability:");
    unint64_t v9 = v10;
  }
}

- (void)interfaceRankingDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  if (self->_joinInterfaceRankingLatencyFromDriverAvailability == 0.0 && self->_lastDriverAvailableTime && v3)
  {
    objc_msgSend(v6, "timeIntervalSinceDate:");
    -[WiFiUsageSession setJoinInterfaceRankingLatencyFromDriverAvailability:](self, "setJoinInterfaceRankingLatencyFromDriverAvailability:");
  }
  [(WiFiUsageSession *)self setLastInterfacePrimaryState:v3];
}

- (void)updateWithRoamingSuppression:(unsigned __int8)a3
{
  int v3 = a3;
  BOOL v5 = [MEMORY[0x1E4F1C9C8] now];
  if (v3)
  {
    if (self->_isRoamSuppressionEnabled) {
      goto LABEL_7;
    }
    ++self->_inRoamSuppressionEnabledCount;
    p_lastRoamSuppressionToggled = &self->_lastRoamSuppressionToggled;
  }
  else
  {
    if (!self->_isRoamSuppressionEnabled) {
      goto LABEL_7;
    }
    self->_unint64_t roamsAfterSupprLifted = 0;
    p_lastRoamSuppressionToggled = &self->_lastRoamSuppressionToggled;
    obuint64_t j = v5;
    [v5 timeIntervalSinceDate:self->_lastRoamSuppressionToggled];
    BOOL v5 = obj;
    self->_inRoamSuppressionEnabled = v7 + self->_inRoamSuppressionEnabled;
  }
  id obja = v5;
  objc_storeStrong((id *)p_lastRoamSuppressionToggled, v5);
  BOOL v5 = obja;
LABEL_7:
  self->_isRoamSuppressionEnabled = v3 != 0;
}

- (void)updateWithCompatibilityMode:(unsigned __int8)a3
{
  int v3 = a3;
  p_int isCompatibilityModeEnabled = &self->_isCompatibilityModeEnabled;
  int isCompatibilityModeEnabled = self->_isCompatibilityModeEnabled;
  if (!a3 && self->_isCompatibilityModeEnabled)
  {
    [(NSDate *)self->_lastCompatibilityModeChangedTime timeIntervalSinceNow];
    self->_inCompatibilityModeEnabledDuration = self->_inCompatibilityModeEnabledDuration - v7;
    int isCompatibilityModeEnabled = *p_isCompatibilityModeEnabled;
  }
  if (isCompatibilityModeEnabled != v3)
  {
    [(WiFiUsageSession *)self setIsCompatibilityModeEnabled:v3 != 0];
    ++self->_compatibilityModeChangeCount;
    id v8 = [MEMORY[0x1E4F1C9C8] now];
    [(WiFiUsageSession *)self setLastCompatibilityModeChangedTime:v8];
  }
}

- (void)updateAssociatedNetworkDetails:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v18 = v4;
    BOOL v5 = [MEMORY[0x1E4F1C9C8] now];
    if (self->_networkDetails)
    {
      id v6 = [v18 networkName];
      double v7 = [(WiFiUsageNetworkDetails *)self->_networkDetails networkName];
      int v8 = [v6 isEqualToString:v7];

      unint64_t v9 = [v18 disable6eMode];
      if (v8) {
        [(WiFiUsageSession *)self update6eModeStats:v9];
      }
      else {
        [(WiFiUsageSession *)self summarizeAndReset6eModeStats:v9];
      }
    }
    else
    {
      id v10 = [v18 disable6eMode];
      [(WiFiUsageSession *)self setNetworkDisable6eModeAtStart:v10];

      unint64_t v9 = [v18 disable6eMode];
      if (v9) {
        double v11 = v5;
      }
      else {
        double v11 = 0;
      }
      [(WiFiUsageSession *)self setLastNetwork6eDisableModeChangedTime:v11];
    }

    if (![(WiFiUsageSession *)self isSessionActive] || !self->_networkDetails) {
      goto LABEL_17;
    }
    uint64_t v12 = [v18 networkName];
    double v13 = [(WiFiUsageNetworkDetails *)self->_networkDetails networkName];
    if ([v12 isEqualToString:v13])
    {
      BOOL v14 = [(WiFiUsageNetworkDetails *)self->_networkDetails connectedBss];
      int v15 = [v14 band];
      id v16 = [v18 connectedBss];
      int v17 = [v16 band];

      if (v15 == v17)
      {
LABEL_17:
        [(WiFiUsageSession *)self setNetworkDetails:v18];

        id v4 = v18;
        goto LABEL_18;
      }
      uint64_t v12 = [(WiFiUsageNetworkDetails *)self->_networkDetails connectedBss];
      -[WiFiUsageSession updateBandUsageFor:With:](self, "updateBandUsageFor:With:", [v12 band], v5);
    }
    else
    {
    }
    goto LABEL_17;
  }
LABEL_18:
}

- (void)update6eModeStats:(id)a3
{
  id v14 = a3;
  id v4 = [(WiFiUsageNetworkDetails *)self->_networkDetails disable6eMode];
  char v5 = [v4 isEqualToString:v14];

  if ((v5 & 1) == 0)
  {
    id v6 = [(WiFiUsageNetworkDetails *)self->_networkDetails disable6eMode];
    int v7 = [v6 isEqualToString:@"off"];

    if (v7)
    {
      int v8 = [MEMORY[0x1E4F1C9C8] now];
      unint64_t v9 = v8;
      if (self->_lastNetwork6eDisableModeChangedTime)
      {
        objc_msgSend(v8, "timeIntervalSinceDate:");
        self->_double inNetwork6eModeOffDuration = v10 + self->_inNetwork6eModeOffDuration;
      }
    }
    double v11 = [(WiFiUsageNetworkDetails *)self->_networkDetails disable6eMode];

    if (v11)
    {
      ++self->_network6eDisabledModeChangeCount;
      uint64_t v12 = [MEMORY[0x1E4F1C9C8] now];
      [(WiFiUsageSession *)self setLastNetwork6eDisableModeChangedTime:v12];
    }
    else
    {
      [(WiFiUsageSession *)self setLastNetwork6eDisableModeChangedTime:self->_sessionStartTime];
    }
  }
  double v13 = [(WiFiUsageSession *)self networkDisable6eModeAtStart];

  if (!v13) {
    [(WiFiUsageSession *)self setNetworkDisable6eModeAtStart:v14];
  }
}

- (void)summarizeAndReset6eModeStats:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v10 = [v4 now];
  id v6 = [(WiFiUsageNetworkDetails *)self->_networkDetails disable6eMode];
  if ([v6 isEqualToString:@"off"])
  {
    lastNetwork6eDisableModeChangedTime = self->_lastNetwork6eDisableModeChangedTime;

    if (lastNetwork6eDisableModeChangedTime)
    {
      [v10 timeIntervalSinceDate:self->_lastNetwork6eDisableModeChangedTime];
      self->_double inNetwork6eModeOffDuration = v8 + self->_inNetwork6eModeOffDuration;
    }
  }
  else
  {
  }
  [(WiFiUsageSession *)self setLastSSIDdisable6eModeAtStart:self->_networkDisable6eModeAtStart];
  [(WiFiUsageSession *)self setLastSSIDdisabled6eModeChangeCount:self->_network6eDisabledModeChangeCount];
  [(WiFiUsageSession *)self setLastSSIDIn6eModeOffDuration:self->_inNetwork6eModeOffDuration];
  [(WiFiUsageSession *)self setNetworkDisable6eModeAtStart:v5];

  if (v5) {
    id v9 = v10;
  }
  else {
    id v9 = 0;
  }
  [(WiFiUsageSession *)self setLastNetwork6eDisableModeChangedTime:v9];
}

- (void)setSSIDTransitionCandidates:(id)a3 SSIDTransitionPotentialCandidates:(id)a4 potentialCandidatesMinusCandidates:(id)a5 roamCandidates:(unint64_t)a6 uniqueChannels:(unint64_t)a7 uniqueBands:(unint64_t)a8
{
  id v20 = a3;
  id v14 = a4;
  id v15 = a5;
  if ([(WiFiUsageSession *)self isSessionActive])
  {
    ++self->_countRoamScan;
    uint64_t v16 = [v20 count];
    uint64_t v17 = [v14 count];
    [(WiFiUsageSession *)self setLastRoamScanFoundSSIDTransitionTarget:v16 != 0];
    [(WiFiUsageSession *)self setCountSSIDTransitionTargetInLastRoamScan:v16];
    unint64_t countRoamScanThatFoundSSIDTransitionTarget = self->_countRoamScanThatFoundSSIDTransitionTarget;
    if (v16) {
      ++countRoamScanThatFoundSSIDTransitionTarget;
    }
    self->_unint64_t countRoamScanThatFoundSSIDTransitionTarget = countRoamScanThatFoundSSIDTransitionTarget;
    [(WiFiUsageSession *)self setLastRoamScanFoundSSIDTransitionPotentialCandidate:v17 != 0];
    [(WiFiUsageSession *)self setCountSSIDTransitionPotentialCandidatesInLastRoamScan:v17];
    unint64_t countRoamScanThatFoundSSIDTransitionPotentialCandidate = self->_countRoamScanThatFoundSSIDTransitionPotentialCandidate;
    if (v17) {
      ++countRoamScanThatFoundSSIDTransitionPotentialCandidate;
    }
    self->_unint64_t countRoamScanThatFoundSSIDTransitionPotentialCandidate = countRoamScanThatFoundSSIDTransitionPotentialCandidate;
    self->_countSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet = [v15 count];
    self->_lastRoamScanContainsRoamCandidateCount = a6 != 0;
    self->_lastRoamScanUniqueChannelsCount = a7;
    self->_lastRoamScanUniqueBandsCount = a8;
  }
}

- (void)updateUsbInsertedDuration:(id)a3
{
  id v4 = (NSDate *)a3;
  id v5 = v4;
  lastUsbStatusChange = self->_lastUsbStatusChange;
  if (!lastUsbStatusChange) {
    lastUsbStatusChange = self->_sessionStartTime;
  }
  [(NSDate *)v4 timeIntervalSinceDate:lastUsbStatusChange];
  self->_usbInsertedDuration = v7 + self->_usbInsertedDuration;
  double v8 = self->_lastUsbStatusChange;
  self->_lastUsbStatusChange = v5;
}

- (void)updateUsbStatus:(BOOL)a3 currentDevices:(id)a4
{
  id v9 = a4;
  id v5 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v6 = [v9 count];
  if (self->_lastUsbStatusChange)
  {
    if (!self->_anyUsbDeviceConnected && v6 != 0)
    {
      objc_storeStrong((id *)&self->_lastUsbStatusChange, v5);
      goto LABEL_14;
    }
    if (!self->_anyUsbDeviceConnected || v6 != 0) {
      goto LABEL_14;
    }
  }
  else if (![v9 count])
  {
    goto LABEL_14;
  }
  [(WiFiUsageSession *)self updateUsbInsertedDuration:v5];
LABEL_14:
  self->_anyUsbDeviceConnected = [v9 count] != 0;
  ++self->_usbDeviceEventCount;
}

- (id)description
{
  int v3 = NSString;
  id v4 = [(WiFiUsageSession *)self sessionName];
  if (self->_isSessionActive) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  sessionStartTime = self->_sessionStartTime;
  sessionEndTime = self->_sessionEndTime;
  double v8 = [(WiFiUsageNetworkDetails *)self->_networkDetails networkName];
  id v9 = [v3 stringWithFormat:@"%@ session (active:%@ start:%@ end:%@ network:%@)", v4, v5, sessionStartTime, sessionEndTime, v8];

  return v9;
}

- (id)redactedDescription
{
  int v3 = NSString;
  uint64_t v4 = [(WiFiUsageSession *)self sessionName];
  id v5 = (void *)v4;
  if (self->_isSessionActive) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  double v7 = [v3 stringWithFormat:@"%@ session (active:%@ start:%@ end:%@ network:<REDACTED>)", v4, v6, self->_sessionStartTime, self->_sessionEndTime];

  return v7;
}

- (void)tallyAssociatedDuration:(id)a3
{
  lastLinkStateChangedTime = self->_lastLinkStateChangedTime;
  if (lastLinkStateChangedTime)
  {
    sessionStartTime = self->_sessionStartTime;
    id v6 = a3;
    double v7 = [(NSDate *)lastLinkStateChangedTime laterDate:sessionStartTime];
    [v6 timeIntervalSinceDate:v7];
    double v9 = v8;

    self->_double associatedDuration = v9 + self->_associatedDuration;
    [(WiFiUsageSession *)self setLastLinkStateChangedTime:0];
  }
}

- (void)tallyInfraScoreDuration:(unint64_t)a3 until:(id)a4
{
  id v6 = a4;
  unint64_t inAWDL_BestInfraScore = self->_inAWDL_BestInfraScore;
  if (self->_inAWDL_lastInfraScore == inAWDL_BestInfraScore)
  {
    if (self->_lastAWDLSequenceUpdate)
    {
      id v11 = v6;
      objc_msgSend(v6, "timeIntervalSinceDate:");
      id v6 = v11;
      self->_double inAWDL_BestInfraScoreDuration = v8 + self->_inAWDL_BestInfraScoreDuration;
      unint64_t inAWDL_BestInfraScore = self->_inAWDL_BestInfraScore;
    }
    else
    {
      unint64_t inAWDL_BestInfraScore = self->_inAWDL_lastInfraScore;
    }
  }
  if (inAWDL_BestInfraScore < a3 || !self->_lastAWDLSequenceUpdate)
  {
    self->_unint64_t inAWDL_BestInfraScore = a3;
    self->_double inAWDL_BestInfraScoreDuration = 0.0;
  }
  unint64_t inAWDL_WorstInfraScore = self->_inAWDL_WorstInfraScore;
  if (self->_inAWDL_lastInfraScore == inAWDL_WorstInfraScore)
  {
    if (self->_lastAWDLSequenceUpdate)
    {
      id v12 = v6;
      objc_msgSend(v6, "timeIntervalSinceDate:");
      id v6 = v12;
      self->_double inAWDL_WorstInfraScoreDuration = v10 + self->_inAWDL_WorstInfraScoreDuration;
      unint64_t inAWDL_WorstInfraScore = self->_inAWDL_WorstInfraScore;
    }
    else
    {
      unint64_t inAWDL_WorstInfraScore = self->_inAWDL_lastInfraScore;
    }
  }
  if (inAWDL_WorstInfraScore > a3 || !self->_lastAWDLSequenceUpdate)
  {
    self->_unint64_t inAWDL_WorstInfraScore = a3;
    self->_double inAWDL_WorstInfraScoreDuration = 0.0;
  }
  self->_inAWDL_lastInfraScore = a3;
}

- (void)tallyP2PScoreDuration:(double)a3 until:(id)a4
{
  id v6 = a4;
  double inAWDL_BestP2PScore = self->_inAWDL_BestP2PScore;
  if (self->_inAWDL_lastP2PScore == inAWDL_BestP2PScore && self->_lastAWDLSequenceUpdate)
  {
    id v11 = v6;
    objc_msgSend(v6, "timeIntervalSinceDate:");
    id v6 = v11;
    self->_double inAWDL_BestP2PScoreDuration = v8 + self->_inAWDL_BestP2PScoreDuration;
    double inAWDL_BestP2PScore = self->_inAWDL_BestP2PScore;
  }
  if (inAWDL_BestP2PScore < a3 || !self->_lastAWDLSequenceUpdate)
  {
    self->_double inAWDL_BestP2PScore = a3;
    self->_double inAWDL_BestP2PScoreDuration = 0.0;
  }
  double inAWDL_WorstP2PScore = self->_inAWDL_WorstP2PScore;
  if (self->_inAWDL_lastP2PScore == inAWDL_WorstP2PScore && self->_lastAWDLSequenceUpdate)
  {
    id v12 = v6;
    objc_msgSend(v6, "timeIntervalSinceDate:");
    id v6 = v12;
    self->_double inAWDL_WorstP2PScoreDuration = v10 + self->_inAWDL_WorstP2PScoreDuration;
    double inAWDL_WorstP2PScore = self->_inAWDL_WorstP2PScore;
  }
  if (inAWDL_WorstP2PScore > a3 || !self->_lastAWDLSequenceUpdate)
  {
    self->_double inAWDL_WorstP2PScore = a3;
    self->_double inAWDL_WorstP2PScoreDuration = 0.0;
  }
  self->_inAWDL_lastP2PScore = a3;
}

- (void)updateScanForwardStats:(id)a3
{
  id v21 = a3;
  uint64_t v4 = [v21 objectForKey:@"SCAN_FWD_STATS_BSS_AWAKE_CNT"];
  id v5 = v4;
  if (v4) {
    self->_forwardedBssInwakeCount += [v4 unsignedIntegerValue];
  }
  id v6 = [v21 objectForKey:@"SCAN_FWD_STATS_BSS_SLEEP_CNT"];

  if (v6) {
    self->_forwardedBssInSleepCount += [v6 unsignedIntegerValue];
  }
  double v7 = [v21 objectForKey:@"SCAN_FWD_STATS_HOST_SCAN_CNT"];

  if (v7) {
    self->_hostScanTriggersCount += [v7 unsignedIntegerValue];
  }
  double v8 = [v21 objectForKey:@"SCAN_FWD_STATS_ROAM_SCAN_CNT"];

  if (v8) {
    self->_roamScanTriggersCount += [v8 unsignedIntegerValue];
  }
  double v9 = [v21 objectForKey:@"SCAN_FWD_STATS_PNO_SCAN_CNT"];

  if (v9) {
    self->_pnoScanTriggersCount += [v9 unsignedIntegerValue];
  }
  double v10 = [v21 objectForKey:@"SCAN_FWD_STATS_EPNO_SCAN_CNT"];

  if (v10) {
    self->_epnoScanTriggersCount += [v10 unsignedIntegerValue];
  }
  id v11 = [v21 objectForKey:@"SCAN_FWD_STATS_CUR_BSS_AWAKE_CNT"];

  if (v11) {
    self->_currentBssMsgInWakeCount += [v11 unsignedIntegerValue];
  }
  id v12 = [v21 objectForKey:@"SCAN_FWD_STATS_CUR_BSS_SLEEP_CNT"];

  if (v12) {
    self->_currentBssMsgInSleepCount += [v12 unsignedIntegerValue];
  }
  double v13 = [v21 objectForKey:@"SCAN_FWD_STATS_SCAN_DATA_AWAKE_CNT"];

  if (v13) {
    self->_scanDataMsgInWakeCount += [v13 unsignedIntegerValue];
  }
  id v14 = [v21 objectForKey:@"SCAN_FWD_STATS_SCAN_DATA_SLEEP_CNT"];

  if (v14) {
    self->_scanDataMsgInSleepCount += [v14 unsignedIntegerValue];
  }
  id v15 = [v21 objectForKey:@"SCAN_FWD_STATS_SPMI_MSG_AWAKE_CNT"];

  if (v15) {
    self->_spmiMsgInAwakeCount += [v15 unsignedIntegerValue];
  }
  uint64_t v16 = [v21 objectForKey:@"SCAN_FWD_STATS_SPMI_MSG_SLEEP_CNT"];

  if (v16) {
    self->_spmiMsgInSleepCount += [v16 unsignedIntegerValue];
  }
  uint64_t v17 = [v21 objectForKey:@"SCAN_FWD_STATS_SPMI_MSG_DROP_RSSI_CNT"];

  if (v17) {
    self->_spmiMsgDropRssiFilterCount += [v17 unsignedIntegerValue];
  }
  id v18 = [v21 objectForKey:@"SCAN_FWD_STATS_SPMI_MSG_DROP_MAX_CNT"];

  if (v18) {
    self->_spmiMsgDropMaxFilterCount += [v18 unsignedIntegerValue];
  }
  double v19 = [v21 objectForKey:@"SCAN_FWD_STATS_SPMI_MSG_DROP_FAIL_CNT"];

  if (v19) {
    self->_spmiMsgDropSpmiFailCount += [v19 unsignedIntegerValue];
  }
  id v20 = [v21 objectForKey:@"SCAN_FWD_STATS_BSS_DROP_LOW_MEM_CNT"];

  if (v20) {
    self->_bssDropLowMemoryCount += [v20 unsignedIntegerValue];
  }
}

- (BOOL)canSubmitToCA
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  ca_config = self->_ca_config;
  if (!ca_config || [(WiFiUsageSessionCAConfig *)ca_config canSubmit]) {
    return 1;
  }
  BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v5)
  {
    id v6 = [(WiFiUsageSession *)self sessionName];
    double v7 = [(WiFiUsageSession *)self metricName];
    double v8 = [(WiFiUsageSession *)self ca_config];
    int v9 = 138413058;
    double v10 = v6;
    __int16 v11 = 2080;
    id v12 = "-[WiFiUsageSession canSubmitToCA]";
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%@ %s - skipping %@ submission (%@)", (uint8_t *)&v9, 0x2Au);

    return 0;
  }
  return result;
}

- (id)describeCAConfig
{
  return [(WiFiUsageSessionCAConfig *)self->_ca_config description];
}

- (void)recordCAsubmission
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (double)sessionDuration
{
  return self->_sessionDuration;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (WiFiUsageNetworkDetails)networkDetails
{
  return self->_networkDetails;
}

- (void)setNetworkDetails:(id)a3
{
}

- (BOOL)privacyRestrictionDisabled
{
  return self->_privacyRestrictionDisabled;
}

- (void)setPrivacyRestrictionDisabled:(BOOL)a3
{
  self->_privacyRestrictionDisabled = a3;
}

- (WiFiUsageBssSession)currentBssSession
{
  return self->_currentBssSession;
}

- (void)setCurrentBssSession:(id)a3
{
}

- (NSNumber)responsivenessScore
{
  return self->_responsivenessScore;
}

- (void)setResponsivenessScore:(id)a3
{
  self->_responsivenessScore = (NSNumber *)a3;
}

- (NSDate)processInitTime
{
  return self->_processInitTime;
}

- (void)setProcessInitTime:(id)a3
{
}

- (BOOL)isAssociated
{
  return self->_isAssociated;
}

- ($06992ED503081CE345EDB9EEA121564E)bandUsageDuration
{
  long long v3 = *(_OWORD *)&self[359].var0[1];
  *(_OWORD *)retstr->int64_t var0 = *(_OWORD *)self[358].var1;
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setBandUsageDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_bandUsageDuration.valueByBand = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_bandUsageDuration.valueByBand[2] = v3;
}

- (BOOL)xctest
{
  return self->_xctest;
}

- (void)setXctest:(BOOL)a3
{
  self->_xctest = a3;
}

- (BOOL)isDisplayOn
{
  return self->_isDisplayOn;
}

- (void)setIsDisplayOn:(BOOL)a3
{
  self->_isDisplayOn = a3;
}

- (BOOL)isUnlocked
{
  return self->_isUnlocked;
}

- (void)setIsUnlocked:(BOOL)a3
{
  self->_isUnlocked = a3;
}

- (BOOL)isInHomeScreen
{
  return self->_isInHomeScreen;
}

- (void)setIsInHomeScreen:(BOOL)a3
{
  self->_isInHomeScreen = a3;
}

- (unint64_t)roamsAfterSupprLifted
{
  return self->_roamsAfterSupprLifted;
}

- (BOOL)isDriverAvailable
{
  return self->_isDriverAvailable;
}

- (void)setIsDriverAvailable:(BOOL)a3
{
  self->_isDriverAvailable = a3;
}

- (unint64_t)driverUnavailabilityCount
{
  return self->_driverUnavailabilityCount;
}

- (int)currentBand
{
  return self->_currentBand;
}

- (void)setCurrentBand:(int)a3
{
  self->_currentBand = a3;
}

- (NSString)secondaryInterfaceName
{
  return self->_secondaryInterfaceName;
}

- (void)setSecondaryInterfaceName:(id)a3
{
}

- (WiFiUsageSessionCAConfig)ca_config
{
  return self->_ca_config;
}

- (void)setCa_config:(id)a3
{
}

- (BOOL)poweredOn
{
  return self->_poweredOn;
}

- (void)setPoweredOn:(BOOL)a3
{
  self->_poweredOn = a3;
}

- (BOOL)controlCenterEnabled
{
  return self->_controlCenterEnabled;
}

- (void)setControlCenterEnabled:(BOOL)a3
{
  self->_controlCenterEnabled = a3;
}

- (BOOL)cellularFallbackEnabled
{
  return self->_cellularFallbackEnabled;
}

- (void)setCellularFallbackEnabled:(BOOL)a3
{
  self->_cellularFallbackEnabled = a3;
}

- (BOOL)cellularOutrankingEnabled
{
  return self->_cellularOutrankingEnabled;
}

- (void)setCellularOutrankingEnabled:(BOOL)a3
{
  self->_cellularOutrankingEnabled = a3;
}

- (BOOL)isCompatibilityModeEnabledAtStart
{
  return self->_isCompatibilityModeEnabledAtStart;
}

- (BOOL)isCompatibilityModeEnabled
{
  return self->_isCompatibilityModeEnabled;
}

- (void)setIsCompatibilityModeEnabled:(BOOL)a3
{
  self->_int isCompatibilityModeEnabled = a3;
}

- (BOOL)linkRecoveryDisabled
{
  return self->_linkRecoveryDisabled;
}

- (void)setLinkRecoveryDisabled:(BOOL)a3
{
  self->_linkRecoveryDisabled = a3;
}

- (NSString)cellularDataStatus
{
  return self->_cellularDataStatus;
}

- (void)setCellularDataStatus:(id)a3
{
}

- (BOOL)airplaneModeEnabled
{
  return self->_airplaneModeEnabled;
}

- (void)setAirplaneModeEnabled:(BOOL)a3
{
  self->_airplaneModeEnabled = a3;
}

- (unint64_t)sessionPid
{
  return self->_sessionPid;
}

- (void)setSessionPid:(unint64_t)a3
{
  self->_sessionPid = a3;
}

- (WiFiUsageNetworkDetails)networkDetailsAtEnd
{
  return self->_networkDetailsAtEnd;
}

- (unint64_t)lastJoinReason
{
  return self->_lastJoinReason;
}

- (void)setLastJoinReason:(unint64_t)a3
{
  self->_unint64_t lastJoinReason = a3;
}

- (int64_t)lastJoinFailure
{
  return self->_lastJoinFailure;
}

- (void)setLastJoinFailure:(int64_t)a3
{
  self->_lastJoinFailure = a3;
}

- (int64_t)lastDisconnectReason
{
  return self->_lastDisconnectReason;
}

- (int64_t)lastDisconnectSubreason
{
  return self->_lastDisconnectSubreason;
}

- (void)setLastDisconnectSubreason:(int64_t)a3
{
  self->_lastDisconnectSubreason = a3;
}

- (int64_t)previousDisconnectReason
{
  return self->_previousDisconnectReason;
}

- (void)setPreviousDisconnectReason:(int64_t)a3
{
  self->_previousDisconnectReason = a3;
}

- (unint64_t)savedLastJoinReason
{
  return self->_savedLastJoinReason;
}

- (void)setSavedLastJoinReason:(unint64_t)a3
{
  self->_savedLastJoinReason = a3;
}

- (int64_t)savedLastJoinFailure
{
  return self->_savedLastJoinFailure;
}

- (void)setSavedLastJoinFailure:(int64_t)a3
{
  self->_savedLastJoinFailure = a3;
}

- (int64_t)savedPreviousDisconnectReason
{
  return self->_savedPreviousDisconnectReason;
}

- (void)setSavedPreviousDisconnectReason:(int64_t)a3
{
  self->_savedPreviousDisconnectReason = a3;
}

- (BOOL)lastInterfacePrimaryState
{
  return self->_lastInterfacePrimaryState;
}

- (void)setLastInterfacePrimaryState:(BOOL)a3
{
  self->_lastInterfacePrimaryState = a3;
}

- (NSDate)sessionInitTime
{
  return self->_sessionInitTime;
}

- (void)setSessionInitTime:(id)a3
{
}

- (NSDate)sessionEndTime
{
  return self->_sessionEndTime;
}

- (NSDate)mediaStartedTime
{
  return self->_mediaStartedTime;
}

- (void)setMediaStartedTime:(id)a3
{
}

- (NSDate)chargingStartedTime
{
  return self->_chargingStartedTime;
}

- (void)setChargingStartedTime:(id)a3
{
}

- (NSDate)companionConnectionTime
{
  return self->_companionConnectionTime;
}

- (void)setCompanionConnectionTime:(id)a3
{
}

- (NSDate)callStartedTime
{
  return self->_callStartedTime;
}

- (void)setCallStartedTime:(id)a3
{
}

- (NSDate)inWalkingEntryTime
{
  return self->_inWalkingEntryTime;
}

- (void)setInWalkingEntryTime:(id)a3
{
}

- (NSDate)inVehicleEntryTime
{
  return self->_inVehicleEntryTime;
}

- (void)setInVehicleEntryTime:(id)a3
{
}

- (NSDate)inMotionStartedTime
{
  return self->_inMotionStartedTime;
}

- (void)setInMotionStartedTime:(id)a3
{
}

- (NSDate)a2dpActiveTime
{
  return self->_a2dpActiveTime;
}

- (void)setA2dpActiveTime:(id)a3
{
}

- (NSDate)scoActiveTime
{
  return self->_scoActiveTime;
}

- (void)setScoActiveTime:(id)a3
{
}

- (NSDate)hidPresentTime
{
  return self->_hidPresentTime;
}

- (void)setHidPresentTime:(id)a3
{
}

- (NSDate)awdlActiveTime
{
  return self->_awdlActiveTime;
}

- (void)setAwdlActiveTime:(id)a3
{
}

- (NSDate)roamingActiveTime
{
  return self->_roamingActiveTime;
}

- (void)setRoamingActiveTime:(id)a3
{
}

- (NSDate)scanningActiveTime
{
  return self->_scanningActiveTime;
}

- (void)setScanningActiveTime:(id)a3
{
}

- (NSDate)softApActiveTime
{
  return self->_softApActiveTime;
}

- (void)setSoftApActiveTime:(id)a3
{
}

- (NSDate)lastPowerStateChangedTime
{
  return self->_lastPowerStateChangedTime;
}

- (void)setLastPowerStateChangedTime:(id)a3
{
}

- (NSDate)lastControlCenterStateChangedTime
{
  return self->_lastControlCenterStateChangedTime;
}

- (void)setLastControlCenterStateChangedTime:(id)a3
{
}

- (NSDate)lastCellularFallbackStateChangedTime
{
  return self->_lastCellularFallbackStateChangedTime;
}

- (void)setLastCellularFallbackStateChangedTime:(id)a3
{
}

- (NSDate)lastCellularOutrankingStateChangedTime
{
  return self->_lastCellularOutrankingStateChangedTime;
}

- (void)setLastCellularOutrankingStateChangedTime:(id)a3
{
}

- (NSDate)lastSystemWakeTime
{
  return self->_lastSystemWakeTime;
}

- (void)setLastSystemWakeTime:(id)a3
{
}

- (NSDate)lastSystemSleepTime
{
  return self->_lastSystemSleepTime;
}

- (void)setLastSystemSleepTime:(id)a3
{
}

- (NSDate)lastUnexpectedLinkDownTime
{
  return self->_lastUnexpectedLinkDownTime;
}

- (void)setLastUnexpectedLinkDownTime:(id)a3
{
}

- (NSDate)lastLinkStateChangedTime
{
  return self->_lastLinkStateChangedTime;
}

- (void)setLastLinkStateChangedTime:(id)a3
{
}

- (NSDate)lastPowerBudgetChangedTime
{
  return self->_lastPowerBudgetChangedTime;
}

- (NSDate)lastBssChangedTime
{
  return self->_lastBssChangedTime;
}

- (void)setLastBssChangedTime:(id)a3
{
}

- (NSDate)lastCompatibilityModeChangedTime
{
  return self->_lastCompatibilityModeChangedTime;
}

- (NSDate)linkRecoveryDisabledTime
{
  return self->_linkRecoveryDisabledTime;
}

- (void)setLinkRecoveryDisabledTime:(id)a3
{
}

- (NSDate)wowStateEntryTime
{
  return self->_wowStateEntryTime;
}

- (void)setWowStateEntryTime:(id)a3
{
}

- (NSDate)lpasStateEntryTime
{
  return self->_lpasStateEntryTime;
}

- (void)setLpasStateEntryTime:(id)a3
{
}

- (NSDate)lowPowerStateEntryTime
{
  return self->_lowPowerStateEntryTime;
}

- (void)setLowPowerStateEntryTime:(id)a3
{
}

- (NSDate)batterySaverStateEntryTime
{
  return self->_batterySaverStateEntryTime;
}

- (void)setBatterySaverStateEntryTime:(id)a3
{
}

- (double)sessionTimeSinceLastSession
{
  return self->_sessionTimeSinceLastSession;
}

- (double)systemAwakeDuration
{
  return self->_systemAwakeDuration;
}

- (double)mediaPlaybackDuration
{
  return self->_mediaPlaybackDuration;
}

- (double)chargingDuration
{
  return self->_chargingDuration;
}

- (double)companionConnectedDuration
{
  return self->_companionConnectedDuration;
}

- (double)inCallDuration
{
  return self->_inCallDuration;
}

- (double)inWalkingDuration
{
  return self->_inWalkingDuration;
}

- (void)setInWalkingDuration:(double)a3
{
  self->_inWalkingDuration = a3;
}

- (double)inVehicleDuration
{
  return self->_inVehicleDuration;
}

- (double)inMotionDuration
{
  return self->_inMotionDuration;
}

- (double)inA2dpDuration
{
  return self->_inA2dpDuration;
}

- (double)inScoDuration
{
  return self->_inScoDuration;
}

- (double)inHidPresentDuration
{
  return self->_inHidPresentDuration;
}

- (double)inAwdlDuration
{
  return self->_inAwdlDuration;
}

- (double)inRoamDuration
{
  return self->_inRoamDuration;
}

- (double)inScanDuration
{
  return self->_inScanDuration;
}

- (double)inSoftApDuration
{
  return self->_inSoftApDuration;
}

- (double)poweredOnDuration
{
  return self->_poweredOnDuration;
}

- (double)associatedDuration
{
  return self->_associatedDuration;
}

- (double)associatedSleepDuration
{
  return self->_associatedSleepDuration;
}

- (double)inCellularFallbackDuration
{
  return self->_inCellularFallbackDuration;
}

- (double)inCellularOutrankingDuration
{
  return self->_inCellularOutrankingDuration;
}

- (double)inControlCenterAutoJoinDisabledDuration
{
  return self->_inControlCenterAutoJoinDisabledDuration;
}

- (double)inCompatibilityModeEnabledDuration
{
  return self->_inCompatibilityModeEnabledDuration;
}

- (double)linkRecoveryDisabledDuration
{
  return self->_linkRecoveryDisabledDuration;
}

- (double)inWowStateDuration
{
  return self->_inWowStateDuration;
}

- (double)inLpasStateDuration
{
  return self->_inLpasStateDuration;
}

- (double)inLowPowerStateDuration
{
  return self->_inLowPowerStateDuration;
}

- (double)inBatterySaverStateDuration
{
  return self->_inBatterySaverStateDuration;
}

- (double)sleepPowerStatsTotalDuration
{
  return self->_sleepPowerStatsTotalDuration;
}

- (double)sleepPowerStatsUnassociatedDuration
{
  return self->_sleepPowerStatsUnassociatedDuration;
}

- (double)sleepPowerStatsAssociatedDuration
{
  return self->_sleepPowerStatsAssociatedDuration;
}

- (double)sleepPowerStatsRoamingDuration
{
  return self->_sleepPowerStatsRoamingDuration;
}

- (unint64_t)roamReasonInitialAssociationCount
{
  return self->_roamReasonInitialAssociationCount;
}

- (unint64_t)roamReasonLowRssiCount
{
  return self->_roamReasonLowRssiCount;
}

- (unint64_t)roamReasonDeauthDisassocCount
{
  return self->_roamReasonDeauthDisassocCount;
}

- (unint64_t)roamReasonBeaconLostCount
{
  return self->_roamReasonBeaconLostCount;
}

- (unint64_t)roamReasonSteeredByApCount
{
  return self->_roamReasonSteeredByApCount;
}

- (unint64_t)roamReasonSteeredByBtmCount
{
  return self->_roamReasonSteeredByBtmCount;
}

- (unint64_t)roamReasonSteeredByCsaCount
{
  return self->_roamReasonSteeredByCsaCount;
}

- (unint64_t)roamReasonReassocRequestedCount
{
  return self->_roamReasonReassocRequestedCount;
}

- (unint64_t)roamReasonHostTriggeredCount
{
  return self->_roamReasonHostTriggeredCount;
}

- (unint64_t)roamReasonBetterCandidateCount
{
  return self->_roamReasonBetterCandidateCount;
}

- (unint64_t)roamReasonBetterConditionCount
{
  return self->_roamReasonBetterConditionCount;
}

- (unint64_t)roamReasonMiscCount
{
  return self->_roamReasonMiscCount;
}

- (unint64_t)roamStatusSucceededCount
{
  return self->_roamStatusSucceededCount;
}

- (unint64_t)roamStatusFailedCount
{
  return self->_roamStatusFailedCount;
}

- (unint64_t)roamStatusNoCandidateCount
{
  return self->_roamStatusNoCandidateCount;
}

- (unint64_t)roamStatusNoQualifiedCandidateCount
{
  return self->_roamStatusNoQualifiedCandidateCount;
}

- (unint64_t)roamStatusFailedNoScan
{
  return self->_roamStatusFailedNoScan;
}

- (unint64_t)roamIsWNMScoreUsedCount
{
  return self->_roamIsWNMScoreUsedCount;
}

- (unint64_t)roamPingPongAboveThresholdCount
{
  return self->_roamPingPongAboveThresholdCount;
}

- (unint64_t)roamPingPongAboveThresholdCountLowRssiOnly
{
  return self->_roamPingPongAboveThresholdCountLowRssiOnly;
}

- (unint64_t)roamPingPongLowRssiAndReassocOnly
{
  return self->_roamPingPongLowRssiAndReassocOnly;
}

- (unint64_t)roamPingPongReassocOnly
{
  return self->_roamPingPongReassocOnly;
}

- (BOOL)isRoamSuppressionEnabled
{
  return self->_isRoamSuppressionEnabled;
}

- (NSDate)lastRoamSuppressionToggled
{
  return self->_lastRoamSuppressionToggled;
}

- (unint64_t)inRoamSuppressionEnabledCount
{
  return self->_inRoamSuppressionEnabledCount;
}

- (double)inRoamSuppressionEnabled
{
  return self->_inRoamSuppressionEnabled;
}

- (double)inRoamSuppressionWaitForRoamStart
{
  return self->_inRoamSuppressionWaitForRoamStart;
}

- (double)inRoamSuppressionWaitForRoamEnd
{
  return self->_inRoamSuppressionWaitForRoamEnd;
}

- (unint64_t)minCandidatesCount
{
  return self->_minCandidatesCount;
}

- (unint64_t)maxCandidatesCount
{
  return self->_maxCandidatesCount;
}

- (unint64_t)currentRSSIStrongestCount
{
  return self->_currentRSSIStrongestCount;
}

- (NSMutableDictionary)roamNeighborsByBand
{
  return self->_roamNeighborsByBand;
}

- (void)setRoamNeighborsByBand:(id)a3
{
}

- ($FEE1510A43A03BFC9F45CB2D5A0A197D)strongestRSSICountByBand
{
  long long v3 = *(_OWORD *)&self[360].var0[1];
  *(_OWORD *)retstr->int64_t var0 = *(_OWORD *)self[359].var1;
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setStrongestRSSICountByBand:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_strongestRSSICountByBand.valueByBand = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_strongestRSSICountByBand.valueByBand[2] = v3;
}

- ($FEE1510A43A03BFC9F45CB2D5A0A197D)strongestRSSIByBand
{
  long long v3 = *(_OWORD *)&self[361].var0[1];
  *(_OWORD *)retstr->int64_t var0 = *(_OWORD *)self[360].var1;
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setStrongestRSSIByBand:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_strongestRSSIByBand.valueByBand = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_strongestRSSIByBand.valueByBand[2] = v3;
}

- ($13477CEFC6EEA4B326536BBEC35DF1AE)roamNeighsSmllstCurrentToBestRssiByBandTransition
{
  *(void *)&retstr->var1[2][2] = self[132].var0[1][2];
  long long v3 = *(_OWORD *)&self[132].var0[0][1];
  *(_OWORD *)&retstr->var0[1][1] = *(_OWORD *)&self[131].var1[2][2];
  *(_OWORD *)&retstr->var0[2][0] = v3;
  *(_OWORD *)&retstr->var0[2][2] = *(_OWORD *)&self[132].var0[1][0];
  long long v4 = *(_OWORD *)&self[131].var0[2][2];
  *(_OWORD *)&retstr->var0[0][0] = *(_OWORD *)&self[131].var0[2][0];
  *(_OWORD *)&retstr->var0[0][2] = v4;
  return self;
}

- (void)setRoamNeighsSmllstCurrentToBestRssiByBandTransition:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[1][1];
  long long v4 = *(_OWORD *)&a3->var0[2][0];
  long long v5 = *(_OWORD *)&a3->var0[2][2];
  *(void *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valid[2][2] = *(void *)&a3->var1[2][2];
  long long v6 = *(_OWORD *)&a3->var0[0][2];
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[0][0] = *(_OWORD *)&a3->var0[0][0];
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[0][2] = v6;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[2][0] = v4;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[2][2] = v5;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[1][1] = v3;
}

- ($13477CEFC6EEA4B326536BBEC35DF1AE)roamNeighsLrgstCurrentToBestRssiByBandTransition
{
  long long v3 = *(_OWORD *)&self[133].var0[0][1];
  *(_OWORD *)&retstr->var0[1][1] = *(_OWORD *)&self[132].var1[2][2];
  *(_OWORD *)&retstr->var0[2][0] = v3;
  *(_OWORD *)&retstr->var0[2][2] = *(_OWORD *)&self[133].var0[1][0];
  *(void *)&retstr->var1[2][2] = self[133].var0[1][2];
  long long v4 = *(_OWORD *)&self[132].var0[2][2];
  *(_OWORD *)&retstr->var0[0][0] = *(_OWORD *)&self[132].var0[2][0];
  *(_OWORD *)&retstr->var0[0][2] = v4;
  return self;
}

- (void)setRoamNeighsLrgstCurrentToBestRssiByBandTransition:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[0][0];
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[0][2] = *(_OWORD *)&a3->var0[0][2];
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[0][0] = v3;
  long long v4 = *(_OWORD *)&a3->var0[1][1];
  long long v5 = *(_OWORD *)&a3->var0[2][0];
  long long v6 = *(_OWORD *)&a3->var0[2][2];
  *(void *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valid[2][2] = *(void *)&a3->var1[2][2];
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[2][2] = v6;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[2][0] = v5;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[1][1] = v4;
}

- ($13477CEFC6EEA4B326536BBEC35DF1AE)roamNeighsSmllstCurrentToNextBestRssiByBandTransition
{
  *(void *)&retstr->var1[2][2] = self[134].var0[1][2];
  long long v3 = *(_OWORD *)&self[134].var0[0][1];
  *(_OWORD *)&retstr->var0[1][1] = *(_OWORD *)&self[133].var1[2][2];
  *(_OWORD *)&retstr->var0[2][0] = v3;
  *(_OWORD *)&retstr->var0[2][2] = *(_OWORD *)&self[134].var0[1][0];
  long long v4 = *(_OWORD *)&self[133].var0[2][2];
  *(_OWORD *)&retstr->var0[0][0] = *(_OWORD *)&self[133].var0[2][0];
  *(_OWORD *)&retstr->var0[0][2] = v4;
  return self;
}

- (void)setRoamNeighsSmllstCurrentToNextBestRssiByBandTransition:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[1][1];
  long long v4 = *(_OWORD *)&a3->var0[2][0];
  long long v5 = *(_OWORD *)&a3->var0[2][2];
  *(void *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valid[2][2] = *(void *)&a3->var1[2][2];
  long long v6 = *(_OWORD *)&a3->var0[0][2];
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[0][0] = *(_OWORD *)&a3->var0[0][0];
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[0][2] = v6;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[2][0] = v4;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[2][2] = v5;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[1][1] = v3;
}

- ($13477CEFC6EEA4B326536BBEC35DF1AE)roamNeighsLrgstCurrentToNextBestRssiByBandTransition
{
  long long v3 = *(_OWORD *)&self[135].var0[0][1];
  *(_OWORD *)&retstr->var0[1][1] = *(_OWORD *)&self[134].var1[2][2];
  *(_OWORD *)&retstr->var0[2][0] = v3;
  *(_OWORD *)&retstr->var0[2][2] = *(_OWORD *)&self[135].var0[1][0];
  *(void *)&retstr->var1[2][2] = self[135].var0[1][2];
  long long v4 = *(_OWORD *)&self[134].var0[2][2];
  *(_OWORD *)&retstr->var0[0][0] = *(_OWORD *)&self[134].var0[2][0];
  *(_OWORD *)&retstr->var0[0][2] = v4;
  return self;
}

- (void)setRoamNeighsLrgstCurrentToNextBestRssiByBandTransition:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[0][0];
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[0][2] = *(_OWORD *)&a3->var0[0][2];
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[0][0] = v3;
  long long v4 = *(_OWORD *)&a3->var0[1][1];
  long long v5 = *(_OWORD *)&a3->var0[2][0];
  long long v6 = *(_OWORD *)&a3->var0[2][2];
  *(void *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valid[2][2] = *(void *)&a3->var1[2][2];
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[2][2] = v6;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[2][0] = v5;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[1][1] = v4;
}

- (NSMutableDictionary)roamCandidatesPerBandWhenSuccessful
{
  return self->_roamCandidatesPerBandWhenSuccessful;
}

- (void)setRoamCandidatesPerBandWhenSuccessful:(id)a3
{
}

- (NSMutableDictionary)roamCandidatesPerBandWhenUnSuccessful
{
  return self->_roamCandidatesPerBandWhenUnSuccessful;
}

- (void)setRoamCandidatesPerBandWhenUnSuccessful:(id)a3
{
}

- (double)powerBudgetMaxDuration
{
  return self->_powerBudgetMaxDuration;
}

- (double)powerBudget90Duration
{
  return self->_powerBudget90Duration;
}

- (double)powerBudget80Duration
{
  return self->_powerBudget80Duration;
}

- (double)powerBudget70Duration
{
  return self->_powerBudget70Duration;
}

- (double)powerBudget60Duration
{
  return self->_powerBudget60Duration;
}

- (double)powerBudget50Duration
{
  return self->_powerBudget50Duration;
}

- (double)powerBudget40Duration
{
  return self->_powerBudget40Duration;
}

- (double)powerBudget30Duration
{
  return self->_powerBudget30Duration;
}

- (double)powerBudget20Duration
{
  return self->_powerBudget20Duration;
}

- (double)powerBudget10Duration
{
  return self->_powerBudget10Duration;
}

- (double)powerBudgetMinDuration
{
  return self->_powerBudgetMinDuration;
}

- (double)thermalIndexMaxDuration
{
  return self->_thermalIndexMaxDuration;
}

- (double)thermalIndex90Duration
{
  return self->_thermalIndex90Duration;
}

- (double)thermalIndex80Duration
{
  return self->_thermalIndex80Duration;
}

- (double)thermalIndex70Duration
{
  return self->_thermalIndex70Duration;
}

- (double)thermalIndex60Duration
{
  return self->_thermalIndex60Duration;
}

- (double)thermalIndex50Duration
{
  return self->_thermalIndex50Duration;
}

- (double)thermalIndex40Duration
{
  return self->_thermalIndex40Duration;
}

- (double)thermalIndex30Duration
{
  return self->_thermalIndex30Duration;
}

- (double)thermalIndex20Duration
{
  return self->_thermalIndex20Duration;
}

- (double)thermalIndex10Duration
{
  return self->_thermalIndex10Duration;
}

- (double)thermalIndexMinDuration
{
  return self->_thermalIndexMinDuration;
}

- (unint64_t)mediaPlaybackEventCount
{
  return self->_mediaPlaybackEventCount;
}

- (unint64_t)chargingEventCount
{
  return self->_chargingEventCount;
}

- (unint64_t)inCallEventCount
{
  return self->_inCallEventCount;
}

- (unint64_t)inWalkingEventCount
{
  return self->_inWalkingEventCount;
}

- (void)setInWalkingEventCount:(unint64_t)a3
{
  self->_inWalkingEventCount = a3;
}

- (unint64_t)inVehicleEventCount
{
  return self->_inVehicleEventCount;
}

- (unint64_t)inMotionEventCount
{
  return self->_inMotionEventCount;
}

- (unint64_t)inA2dpEventCount
{
  return self->_inA2dpEventCount;
}

- (unint64_t)inScoEventCount
{
  return self->_inScoEventCount;
}

- (unint64_t)inHidPresentCount
{
  return self->_inHidPresentCount;
}

- (unint64_t)inAwdlEventCount
{
  return self->_inAwdlEventCount;
}

- (unint64_t)inRoamEventCount
{
  return self->_inRoamEventCount;
}

- (unint64_t)inScanEventCount
{
  return self->_inScanEventCount;
}

- (unint64_t)inSoftApEventCount
{
  return self->_inSoftApEventCount;
}

- (void)setInSoftApEventCount:(unint64_t)a3
{
  self->_inSoftApEventCount = a3;
}

- (unint64_t)rangingEventCount
{
  return self->_rangingEventCount;
}

- (unint64_t)companionConnectionStateChangedCount
{
  return self->_companionConnectionStateChangedCount;
}

- (unint64_t)linkRecoveryDisabledCount
{
  return self->_linkRecoveryDisabledCount;
}

- (unint64_t)wowStateChangedCount
{
  return self->_wowStateChangedCount;
}

- (unint64_t)lpasStateChangedCount
{
  return self->_lpasStateChangedCount;
}

- (unint64_t)lowPowerStateChangedCount
{
  return self->_lowPowerStateChangedCount;
}

- (unint64_t)batterySaverStateChangedCount
{
  return self->_batterySaverStateChangedCount;
}

- (unint64_t)systemWakeStateChangedCount
{
  return self->_systemWakeStateChangedCount;
}

- (unint64_t)systemWokenByWiFiCount
{
  return self->_systemWokenByWiFiCount;
}

- (unint64_t)lockStateChangedCount
{
  return self->_lockStateChangedCount;
}

- (unint64_t)displayStateChangedCount
{
  return self->_displayStateChangedCount;
}

- (unint64_t)networkChangedCount
{
  return self->_networkChangedCount;
}

- (unint64_t)joinStateChangedCount
{
  return self->_joinStateChangedCount;
}

- (unint64_t)savedJoinStateChangedCount
{
  return self->_savedJoinStateChangedCount;
}

- (void)setSavedJoinStateChangedCount:(unint64_t)a3
{
  self->_savedJoinStateChangedCount = a3;
}

- (unint64_t)linkStateChangedCount
{
  return self->_linkStateChangedCount;
}

- (unint64_t)applicationStateChangedCount
{
  return self->_applicationStateChangedCount;
}

- (unint64_t)powerStateChangedCount
{
  return self->_powerStateChangedCount;
}

- (unint64_t)powerToggleEventCount
{
  return self->_powerToggleEventCount;
}

- (unint64_t)smartCoverStateChangedCount
{
  return self->_smartCoverStateChangedCount;
}

- (NSString)lastSmartCoverState
{
  return self->_lastSmartCoverState;
}

- (void)setLastSmartCoverState:(id)a3
{
}

- (unint64_t)controlCenterStateChangedCount
{
  return self->_controlCenterStateChangedCount;
}

- (unint64_t)controlCenterToggleEventCount
{
  return self->_controlCenterToggleEventCount;
}

- (unint64_t)cellularFallbackStateChangedCount
{
  return self->_cellularFallbackStateChangedCount;
}

- (unint64_t)cellularOutrankingStateChangedCount
{
  return self->_cellularOutrankingStateChangedCount;
}

- (unint64_t)rapidLinkTransitionCount
{
  return self->_rapidLinkTransitionCount;
}

- (unint64_t)primaryInterfaceStateChangeCount
{
  return self->_primaryInterfaceStateChangeCount;
}

- (unint64_t)compatibilityModeChangeCount
{
  return self->_compatibilityModeChangeCount;
}

- (unint64_t)consecutiveJoinFailureCount
{
  return self->_consecutiveJoinFailureCount;
}

- (void)setConsecutiveJoinFailureCount:(unint64_t)a3
{
  self->_consecutiveJoinFailureCount = a3;
}

- (unint64_t)airplaneModeStateChangedCount
{
  return self->_airplaneModeStateChangedCount;
}

- (unint64_t)neighborBssCount
{
  return self->_neighborBssCount;
}

- (unint64_t)otherBssCount
{
  return self->_otherBssCount;
}

- (WiFiUsageInterfaceStats)ifStatsAtStart
{
  return self->_ifStatsAtStart;
}

- (WiFiUsageInterfaceStats)secondaryIfStatsAtStart
{
  return self->_secondaryIfStatsAtStart;
}

- (unint64_t)netInterfaceTxBytes
{
  return self->_netInterfaceTxBytes;
}

- (void)setNetInterfaceTxBytes:(unint64_t)a3
{
  self->_netInterfaceTxBytes = a3;
}

- (unint64_t)netInterfaceRxBytes
{
  return self->_netInterfaceRxBytes;
}

- (void)setNetInterfaceRxBytes:(unint64_t)a3
{
  self->_netInterfaceRxBytes = a3;
}

- (unint64_t)secondaryInterfaceTxBytes
{
  return self->_secondaryInterfaceTxBytes;
}

- (void)setSecondaryInterfaceTxBytes:(unint64_t)a3
{
  self->_secondaryInterfaceTxBytes = a3;
}

- (unint64_t)secondaryInterfaceRxBytes
{
  return self->_secondaryInterfaceRxBytes;
}

- (void)setSecondaryInterfaceRxBytes:(unint64_t)a3
{
  self->_secondaryInterfaceRxBytes = a3;
}

- (unint64_t)triggerDisconnectAlertedCount
{
  return self->_triggerDisconnectAlertedCount;
}

- (unint64_t)triggerDisconnectConfirmedCount
{
  return self->_triggerDisconnectConfirmedCount;
}

- (unint64_t)triggerDisconnectExecutedCount
{
  return self->_triggerDisconnectExecutedCount;
}

- (NSDate)lastDriverTerminationTime
{
  return self->_lastDriverTerminationTime;
}

- (void)setLastDriverTerminationTime:(id)a3
{
}

- (NSDate)lastChipResetTime
{
  return self->_lastChipResetTime;
}

- (void)setLastChipResetTime:(id)a3
{
}

- (NSDate)lastDriverAvailableTime
{
  return self->_lastDriverAvailableTime;
}

- (void)setLastDriverAvailableTime:(id)a3
{
}

- (NSString)lastDriverUnavailableReason
{
  return self->_lastDriverUnavailableReason;
}

- (double)driverProcessLifespan
{
  return self->_driverProcessLifespan;
}

- (void)setDriverProcessLifespan:(double)a3
{
  self->_driverProcessLifespan = a3;
}

- (double)driverAvailabilityLifespan
{
  return self->_driverAvailabilityLifespan;
}

- (void)setDriverAvailabilityLifespan:(double)a3
{
  self->_driverAvailabilityLifespan = a3;
}

- (double)driverAvailabilityLatencyFromChipReset
{
  return self->_driverAvailabilityLatencyFromChipReset;
}

- (double)driverAvailabilityLatencyFromTermination
{
  return self->_driverAvailabilityLatencyFromTermination;
}

- (double)joinScanLatencyFromDriverAvailability
{
  return self->_joinScanLatencyFromDriverAvailability;
}

- (double)joinStartedLatencyFromDriverAvailability
{
  return self->_joinStartedLatencyFromDriverAvailability;
}

- (double)joinLinkUpLatencyFromDriverAvailability
{
  return self->_joinLinkUpLatencyFromDriverAvailability;
}

- (double)joinIpConfigurationLatencyFromDriverAvailability
{
  return self->_joinIpConfigurationLatencyFromDriverAvailability;
}

- (double)joinInterfaceRankingLatencyFromDriverAvailability
{
  return self->_joinInterfaceRankingLatencyFromDriverAvailability;
}

- (double)joinLinkUpLatencyFromSessionStart
{
  return self->_joinLinkUpLatencyFromSessionStart;
}

- (double)longestUnassociatedDuration
{
  return self->_longestUnassociatedDuration;
}

- (WiFiUsageSessionLQM)lqm
{
  return self->_lqm;
}

- (void)setLqm:(id)a3
{
}

- (int64_t)lastPowerBudget
{
  return self->_lastPowerBudget;
}

- (void)setLastPowerBudget:(int64_t)a3
{
  self->_int64_t lastPowerBudget = a3;
}

- (int64_t)lastThermalIndex
{
  return self->_lastThermalIndex;
}

- (void)setLastThermalIndex:(int64_t)a3
{
  self->_int64_t lastThermalIndex = a3;
}

- (int)bandAtSessionStart
{
  return self->_bandAtSessionStart;
}

- (BOOL)isAssociatedAtSessionStart
{
  return self->_isAssociatedAtSessionStart;
}

- (int64_t)rssiAtSessionStart
{
  return self->_rssiAtSessionStart;
}

- (unint64_t)network6eDisabledModeChangeCount
{
  return self->_network6eDisabledModeChangeCount;
}

- (unint64_t)lastSSIDdisabled6eModeChangeCount
{
  return self->_lastSSIDdisabled6eModeChangeCount;
}

- (NSString)networkDisable6eModeAtStart
{
  return self->_networkDisable6eModeAtStart;
}

- (NSString)lastSSIDdisable6eModeAtStart
{
  return self->_lastSSIDdisable6eModeAtStart;
}

- (NSDate)lastNetwork6eDisableModeChangedTime
{
  return self->_lastNetwork6eDisableModeChangedTime;
}

- (double)inNetwork6eModeOffDuration
{
  return self->_inNetwork6eModeOffDuration;
}

- (double)lastSSIDIn6eModeOffDuration
{
  return self->_lastSSIDIn6eModeOffDuration;
}

- (WiFiUsageNetworkIPv4Details)ipV4Details
{
  return self->_ipV4Details;
}

- (WiFiUsageNetworkIPv6Details)ipV6Details
{
  return self->_ipV6Details;
}

- (WiFiUsageNetworkIPv4Details)ipV4DetailsPrevSession
{
  return self->_ipV4DetailsPrevSession;
}

- (WiFiUsageNetworkIPv6Details)ipV6DetailsPrevSession
{
  return self->_ipV6DetailsPrevSession;
}

- (BOOL)hasDifferentIpv4DetailsThanPrevSession
{
  return self->_hasDifferentIpv4DetailsThanPrevSession;
}

- (void)setHasDifferentIpv4DetailsThanPrevSession:(BOOL)a3
{
  self->_hasDifferentIpv4DetailsThanPrevSession = a3;
}

- (BOOL)hasDifferentIpv6DetailsThanPrevSession
{
  return self->_hasDifferentIpv6DetailsThanPrevSession;
}

- (void)setHasDifferentIpv6DetailsThanPrevSession:(BOOL)a3
{
  self->_hasDifferentIpv6DetailsThanPrevSession = a3;
}

- (BOOL)inCoexRealTime
{
  return self->_inCoexRealTime;
}

- (void)setInCoexRealTime:(BOOL)a3
{
  self->_BOOL inCoexRealTime = a3;
}

- (BOOL)inCoexRealTimeAtSessionStart
{
  return self->_inCoexRealTimeAtSessionStart;
}

- (BOOL)inCoexRealTimeAtLastJoin
{
  return self->_inCoexRealTimeAtLastJoin;
}

- (void)setInCoexRealTimeAtLastJoin:(BOOL)a3
{
  self->_inCoexRealTimeAtLastJoin = a3;
}

- (NSDate)lastCoexRealTimeOn
{
  return self->_lastCoexRealTimeOn;
}

- (void)setLastCoexRealTimeOn:(id)a3
{
}

- (NSDate)lastCoexRealTimeOff
{
  return self->_lastCoexRealTimeOff;
}

- (void)setLastCoexRealTimeOff:(id)a3
{
}

- (NSMutableArray)prevNetworkNames
{
  return self->_prevNetworkNames;
}

- (void)setPrevNetworkNames:(id)a3
{
}

- (unint64_t)prevJoinReason
{
  return self->_prevJoinReason;
}

- (void)setPrevJoinReason:(unint64_t)a3
{
  self->_prevJoinReason = a3;
}

- (NSDate)lastJoinTime
{
  return self->_lastJoinTime;
}

- (void)setLastJoinTime:(id)a3
{
}

- (double)timeSincePrevJoin
{
  return self->_timeSincePrevJoin;
}

- (void)setTimeSincePrevJoin:(double)a3
{
  self->_timeSincePrevJoin = a3;
}

- (BOOL)isA2DPActive
{
  return self->_isA2DPActive;
}

- (void)setIsA2DPActive:(BOOL)a3
{
  self->_isA2DPActive = a3;
}

- (BOOL)isSCOActive
{
  return self->_isSCOActive;
}

- (void)setIsSCOActive:(BOOL)a3
{
  self->_isSCOActive = a3;
}

- (BOOL)isUniAoSActive
{
  return self->_isUniAoSActive;
}

- (void)setIsUniAoSActive:(BOOL)a3
{
  self->_isUniAoSActive = a3;
}

- (BOOL)isBiAoSActive
{
  return self->_isBiAoSActive;
}

- (void)setIsBiAoSActive:(BOOL)a3
{
  self->_isBiAoSActive = a3;
}

- (NSString)btAudioBand
{
  return self->_btAudioBand;
}

- (void)setBtAudioBand:(id)a3
{
}

- (unint64_t)countRoamScan
{
  return self->_countRoamScan;
}

- (BOOL)lastRoamScanFoundSSIDTransitionTarget
{
  return self->_lastRoamScanFoundSSIDTransitionTarget;
}

- (unint64_t)countSSIDTransitionTargetInLastRoamScan
{
  return self->_countSSIDTransitionTargetInLastRoamScan;
}

- (unint64_t)countRoamScanThatFoundSSIDTransitionTarget
{
  return self->_countRoamScanThatFoundSSIDTransitionTarget;
}

- (BOOL)lastRoamScanFoundSSIDTransitionPotentialCandidate
{
  return self->_lastRoamScanFoundSSIDTransitionPotentialCandidate;
}

- (unint64_t)countSSIDTransitionPotentialCandidatesInLastRoamScan
{
  return self->_countSSIDTransitionPotentialCandidatesInLastRoamScan;
}

- (unint64_t)countSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet
{
  return self->_countSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet;
}

- (unint64_t)countRoamScanThatFoundSSIDTransitionPotentialCandidate
{
  return self->_countRoamScanThatFoundSSIDTransitionPotentialCandidate;
}

- (BOOL)lastRoamScanContainsRoamCandidateCount
{
  return self->_lastRoamScanContainsRoamCandidateCount;
}

- (unint64_t)lastRoamScanUniqueChannelsCount
{
  return self->_lastRoamScanUniqueChannelsCount;
}

- (unint64_t)lastRoamScanUniqueBandsCount
{
  return self->_lastRoamScanUniqueBandsCount;
}

- (BOOL)savedInCoexRealTimeAtLastJoin
{
  return self->_savedInCoexRealTimeAtLastJoin;
}

- (void)setSavedInCoexRealTimeAtLastJoin:(BOOL)a3
{
  self->_savedInCoexRealTimeAtLastJoin = a3;
}

- (unint64_t)savedPrevJoinReason
{
  return self->_savedPrevJoinReason;
}

- (void)setSavedPrevJoinReason:(unint64_t)a3
{
  self->_savedPrevJoinReason = a3;
}

- (NSDate)savedLastJoinTime
{
  return self->_savedLastJoinTime;
}

- (void)setSavedLastJoinTime:(id)a3
{
}

- (double)savedTimeSincePrevJoin
{
  return self->_savedTimeSincePrevJoin;
}

- (void)setSavedTimeSincePrevJoin:(double)a3
{
  self->_savedTimeSincePrevJoin = a3;
}

- (BOOL)lastJoinWhileDeferForTD
{
  return self->_lastJoinWhileDeferForTD;
}

- (void)setLastJoinWhileDeferForTD:(BOOL)a3
{
  self->_lastJoinWhileDeferForTD = a3;
}

- (unint64_t)inPoorLinkSessionCount
{
  return self->_inPoorLinkSessionCount;
}

- (double)inPoorLinkSessionDuration
{
  return self->_inPoorLinkSessionDuration;
}

- (unint64_t)tdAfterJoinAfterTDCount
{
  return self->_tdAfterJoinAfterTDCount;
}

- (unint64_t)current_subsequentTdAfterJoinAfterTDCount
{
  return self->_current_subsequentTdAfterJoinAfterTDCount;
}

- (unint64_t)min_subsequentTdAfterJoinAfterTDCount
{
  return self->_min_subsequentTdAfterJoinAfterTDCount;
}

- (unint64_t)max_subsequentTdAfterJoinAfterTDCount
{
  return self->_max_subsequentTdAfterJoinAfterTDCount;
}

- (unint64_t)tdSessionStartedByBadRSSICount
{
  return self->_tdSessionStartedByBadRSSICount;
}

- (unint64_t)tdSessionStartedByTDRecommendedCount
{
  return self->_tdSessionStartedByTDRecommendedCount;
}

- (unint64_t)tdSessionStartedBySymptomDNSFailureCount
{
  return self->_tdSessionStartedBySymptomDNSFailureCount;
}

- (BOOL)isInTDEval
{
  return self->_isInTDEval;
}

- (unint64_t)tdEvalEndedCount
{
  return self->_tdEvalEndedCount;
}

- (double)tdEvalCumulativeDuration
{
  return self->_tdEvalCumulativeDuration;
}

- (unint64_t)tdEvalStartedCount
{
  return self->_tdEvalStartedCount;
}

- (unint64_t)tdEvalStartedByBadRSSICount
{
  return self->_tdEvalStartedByBadRSSICount;
}

- (unint64_t)tdEvalStartedBySymptomsARPFailureCount
{
  return self->_tdEvalStartedBySymptomsARPFailureCount;
}

- (unint64_t)tdEvalStartedBySymptomsDNSFailCount
{
  return self->_tdEvalStartedBySymptomsDNSFailCount;
}

- (unint64_t)tdEvalStartedBySymptomsShortFlowCount
{
  return self->_tdEvalStartedBySymptomsShortFlowCount;
}

- (unint64_t)tdEvalStartedBySymptomsRTTFailCount
{
  return self->_tdEvalStartedBySymptomsRTTFailCount;
}

- (void)setTdEvalStartedBySymptomsRTTFailCount:(unint64_t)a3
{
  self->_tdEvalStartedBySymptomsRTTFailCount = a3;
}

- (unint64_t)tdEvalStartedBySymptomsDataStallCount
{
  return self->_tdEvalStartedBySymptomsDataStallCount;
}

- (unint64_t)tdEvalStartedBySymptomsDNSStallCount
{
  return self->_tdEvalStartedBySymptomsDNSStallCount;
}

- (unint64_t)tdEvalStartedByActiveProbingCount
{
  return self->_tdEvalStartedByActiveProbingCount;
}

- (unint64_t)tdEvalStartedByFGNetwAppChangeCount
{
  return self->_tdEvalStartedByFGNetwAppChangeCount;
}

- (unint64_t)tdEvalStartedByUserNotificationCount
{
  return self->_tdEvalStartedByUserNotificationCount;
}

- (unint64_t)tdEvalStartedByCheckReassocCount
{
  return self->_tdEvalStartedByCheckReassocCount;
}

- (BOOL)anyUsbDeviceConnected
{
  return self->_anyUsbDeviceConnected;
}

- (void)setAnyUsbDeviceConnected:(BOOL)a3
{
  self->_anyUsbDeviceConnected = a3;
}

- (unint64_t)usbDeviceEventCount
{
  return self->_usbDeviceEventCount;
}

- (NSDate)lastUsbStatusChange
{
  return self->_lastUsbStatusChange;
}

- (double)usbInsertedDuration
{
  return self->_usbInsertedDuration;
}

- (NSDate)lastAWDLSequenceUpdate
{
  return self->_lastAWDLSequenceUpdate;
}

- (unint64_t)inAWDL_BestInfraScore
{
  return self->_inAWDL_BestInfraScore;
}

- (void)setInAWDL_BestInfraScore:(unint64_t)a3
{
  self->_unint64_t inAWDL_BestInfraScore = a3;
}

- (unint64_t)inAWDL_WorstInfraScore
{
  return self->_inAWDL_WorstInfraScore;
}

- (void)setInAWDL_WorstInfraScore:(unint64_t)a3
{
  self->_unint64_t inAWDL_WorstInfraScore = a3;
}

- (double)inAWDL_BestP2PScore
{
  return self->_inAWDL_BestP2PScore;
}

- (void)setInAWDL_BestP2PScore:(double)a3
{
  self->_double inAWDL_BestP2PScore = a3;
}

- (double)inAWDL_WorstP2PScore
{
  return self->_inAWDL_WorstP2PScore;
}

- (void)setInAWDL_WorstP2PScore:(double)a3
{
  self->_double inAWDL_WorstP2PScore = a3;
}

- (unint64_t)inAWDL_lastInfraScore
{
  return self->_inAWDL_lastInfraScore;
}

- (void)setInAWDL_lastInfraScore:(unint64_t)a3
{
  self->_inAWDL_lastInfraScore = a3;
}

- (double)inAWDL_lastP2PScore
{
  return self->_inAWDL_lastP2PScore;
}

- (void)setInAWDL_lastP2PScore:(double)a3
{
  self->_inAWDL_lastP2PScore = a3;
}

- (double)inAWDL_BestInfraScoreDuration
{
  return self->_inAWDL_BestInfraScoreDuration;
}

- (double)inAWDL_BestP2PScoreDuration
{
  return self->_inAWDL_BestP2PScoreDuration;
}

- (double)inAWDL_WorstInfraScoreDuration
{
  return self->_inAWDL_WorstInfraScoreDuration;
}

- (double)inAWDL_WorstP2PScoreDuration
{
  return self->_inAWDL_WorstP2PScoreDuration;
}

- (unint64_t)forwardedBssInwakeCount
{
  return self->_forwardedBssInwakeCount;
}

- (void)setForwardedBssInwakeCount:(unint64_t)a3
{
  self->_forwardedBssInwakeCount = a3;
}

- (unint64_t)forwardedBssInSleepCount
{
  return self->_forwardedBssInSleepCount;
}

- (void)setForwardedBssInSleepCount:(unint64_t)a3
{
  self->_forwardedBssInSleepCount = a3;
}

- (unint64_t)hostScanTriggersCount
{
  return self->_hostScanTriggersCount;
}

- (void)setHostScanTriggersCount:(unint64_t)a3
{
  self->_hostScanTriggersCount = a3;
}

- (unint64_t)roamScanTriggersCount
{
  return self->_roamScanTriggersCount;
}

- (void)setRoamScanTriggersCount:(unint64_t)a3
{
  self->_roamScanTriggersCount = a3;
}

- (unint64_t)pnoScanTriggersCount
{
  return self->_pnoScanTriggersCount;
}

- (void)setPnoScanTriggersCount:(unint64_t)a3
{
  self->_pnoScanTriggersCount = a3;
}

- (unint64_t)epnoScanTriggersCount
{
  return self->_epnoScanTriggersCount;
}

- (void)setEpnoScanTriggersCount:(unint64_t)a3
{
  self->_epnoScanTriggersCount = a3;
}

- (unint64_t)currentBssMsgInWakeCount
{
  return self->_currentBssMsgInWakeCount;
}

- (void)setCurrentBssMsgInWakeCount:(unint64_t)a3
{
  self->_currentBssMsgInWakeCount = a3;
}

- (unint64_t)currentBssMsgInSleepCount
{
  return self->_currentBssMsgInSleepCount;
}

- (void)setCurrentBssMsgInSleepCount:(unint64_t)a3
{
  self->_currentBssMsgInSleepCount = a3;
}

- (unint64_t)scanDataMsgInWakeCount
{
  return self->_scanDataMsgInWakeCount;
}

- (void)setScanDataMsgInWakeCount:(unint64_t)a3
{
  self->_scanDataMsgInWakeCount = a3;
}

- (unint64_t)scanDataMsgInSleepCount
{
  return self->_scanDataMsgInSleepCount;
}

- (void)setScanDataMsgInSleepCount:(unint64_t)a3
{
  self->_scanDataMsgInSleepCount = a3;
}

- (unint64_t)spmiMsgInAwakeCount
{
  return self->_spmiMsgInAwakeCount;
}

- (void)setSpmiMsgInAwakeCount:(unint64_t)a3
{
  self->_spmiMsgInAwakeCount = a3;
}

- (unint64_t)spmiMsgInSleepCount
{
  return self->_spmiMsgInSleepCount;
}

- (void)setSpmiMsgInSleepCount:(unint64_t)a3
{
  self->_spmiMsgInSleepCount = a3;
}

- (unint64_t)spmiMsgDropRssiFilterCount
{
  return self->_spmiMsgDropRssiFilterCount;
}

- (void)setSpmiMsgDropRssiFilterCount:(unint64_t)a3
{
  self->_spmiMsgDropRssiFilterCount = a3;
}

- (unint64_t)spmiMsgDropMaxFilterCount
{
  return self->_spmiMsgDropMaxFilterCount;
}

- (void)setSpmiMsgDropMaxFilterCount:(unint64_t)a3
{
  self->_spmiMsgDropMaxFilterCount = a3;
}

- (unint64_t)spmiMsgDropSpmiFailCount
{
  return self->_spmiMsgDropSpmiFailCount;
}

- (void)setSpmiMsgDropSpmiFailCount:(unint64_t)a3
{
  self->_spmiMsgDropSpmiFailCount = a3;
}

- (unint64_t)bssDropLowMemoryCount
{
  return self->_bssDropLowMemoryCount;
}

- (void)setBssDropLowMemoryCount:(unint64_t)a3
{
  self->_bssDropLowMemoryCount = a3;
}

- (BOOL)isInstantHotspot
{
  return self->_isInstantHotspot;
}

- (void)setIsInstantHotspot:(BOOL)a3
{
  self->_isInstantHotspot = a3;
}

- (BOOL)isAutoHotspot
{
  return self->_isAutoHotspot;
}

- (void)setIsAutoHotspot:(BOOL)a3
{
  self->_isAutoHotspot = a3;
}

- (int)maxPhyMode
{
  return self->_maxPhyMode;
}

- (WiFiUsageInterfaceCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionContext
{
  return self->_completionContext;
}

- (void)setCompletionContext:(id)a3
{
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong(&self->_completionContext, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_lastAWDLSequenceUpdate, 0);
  objc_storeStrong((id *)&self->_lastUsbStatusChange, 0);
  objc_storeStrong((id *)&self->_savedLastJoinTime, 0);
  objc_storeStrong((id *)&self->_btAudioBand, 0);
  objc_storeStrong((id *)&self->_lastJoinTime, 0);
  objc_storeStrong((id *)&self->_prevNetworkNames, 0);
  objc_storeStrong((id *)&self->_lastCoexRealTimeOff, 0);
  objc_storeStrong((id *)&self->_lastCoexRealTimeOn, 0);
  objc_storeStrong((id *)&self->_ipV6DetailsPrevSession, 0);
  objc_storeStrong((id *)&self->_ipV4DetailsPrevSession, 0);
  objc_storeStrong((id *)&self->_ipV6Details, 0);
  objc_storeStrong((id *)&self->_ipV4Details, 0);
  objc_storeStrong((id *)&self->_lastNetwork6eDisableModeChangedTime, 0);
  objc_storeStrong((id *)&self->_lastSSIDdisable6eModeAtStart, 0);
  objc_storeStrong((id *)&self->_networkDisable6eModeAtStart, 0);
  objc_storeStrong((id *)&self->_activeApplications, 0);
  objc_storeStrong((id *)&self->_lqm, 0);
  objc_storeStrong((id *)&self->_lastDriverUnavailableReason, 0);
  objc_storeStrong((id *)&self->_lastDriverAvailableTime, 0);
  objc_storeStrong((id *)&self->_lastChipResetTime, 0);
  objc_storeStrong((id *)&self->_lastDriverTerminationTime, 0);
  objc_storeStrong((id *)&self->_secondaryIfStatsAtStart, 0);
  objc_storeStrong((id *)&self->_ifStatsAtStart, 0);
  objc_storeStrong((id *)&self->_lastSmartCoverState, 0);
  objc_storeStrong((id *)&self->_roamCandidatesPerBandWhenUnSuccessful, 0);
  objc_storeStrong((id *)&self->_roamCandidatesPerBandWhenSuccessful, 0);
  objc_storeStrong((id *)&self->_roamNeighborsByBand, 0);
  objc_storeStrong((id *)&self->_lastRoamSuppressionToggled, 0);
  objc_storeStrong((id *)&self->_batterySaverStateEntryTime, 0);
  objc_storeStrong((id *)&self->_lowPowerStateEntryTime, 0);
  objc_storeStrong((id *)&self->_lpasStateEntryTime, 0);
  objc_storeStrong((id *)&self->_wowStateEntryTime, 0);
  objc_storeStrong((id *)&self->_linkRecoveryDisabledTime, 0);
  objc_storeStrong((id *)&self->_lastCompatibilityModeChangedTime, 0);
  objc_storeStrong((id *)&self->_lastBssChangedTime, 0);
  objc_storeStrong((id *)&self->_lastPowerBudgetChangedTime, 0);
  objc_storeStrong((id *)&self->_lastLinkStateChangedTime, 0);
  objc_storeStrong((id *)&self->_lastUnexpectedLinkDownTime, 0);
  objc_storeStrong((id *)&self->_lastSystemSleepTime, 0);
  objc_storeStrong((id *)&self->_lastSystemWakeTime, 0);
  objc_storeStrong((id *)&self->_lastCellularOutrankingStateChangedTime, 0);
  objc_storeStrong((id *)&self->_lastCellularFallbackStateChangedTime, 0);
  objc_storeStrong((id *)&self->_lastControlCenterStateChangedTime, 0);
  objc_storeStrong((id *)&self->_lastPowerStateChangedTime, 0);
  objc_storeStrong((id *)&self->_softApActiveTime, 0);
  objc_storeStrong((id *)&self->_scanningActiveTime, 0);
  objc_storeStrong((id *)&self->_roamingActiveTime, 0);
  objc_storeStrong((id *)&self->_awdlActiveTime, 0);
  objc_storeStrong((id *)&self->_hidPresentTime, 0);
  objc_storeStrong((id *)&self->_scoActiveTime, 0);
  objc_storeStrong((id *)&self->_a2dpActiveTime, 0);
  objc_storeStrong((id *)&self->_inMotionStartedTime, 0);
  objc_storeStrong((id *)&self->_inVehicleEntryTime, 0);
  objc_storeStrong((id *)&self->_inWalkingEntryTime, 0);
  objc_storeStrong((id *)&self->_callStartedTime, 0);
  objc_storeStrong((id *)&self->_companionConnectionTime, 0);
  objc_storeStrong((id *)&self->_chargingStartedTime, 0);
  objc_storeStrong((id *)&self->_mediaStartedTime, 0);
  objc_storeStrong((id *)&self->_sessionEndTime, 0);
  objc_storeStrong((id *)&self->_sessionStartTime, 0);
  objc_storeStrong((id *)&self->_sessionInitTime, 0);
  objc_storeStrong((id *)&self->_networkDetailsAtEnd, 0);
  objc_storeStrong((id *)&self->_cellularDataStatus, 0);
  objc_storeStrong((id *)&self->_ca_config, 0);
  objc_storeStrong((id *)&self->_secondaryInterfaceName, 0);
  objc_storeStrong((id *)&self->_processInitTime, 0);
  objc_storeStrong((id *)&self->_currentBssSession, 0);
  objc_storeStrong((id *)&self->_networkDetails, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);

  objc_storeStrong((id *)&self->_disconnectReasonMap, 0);
}

@end