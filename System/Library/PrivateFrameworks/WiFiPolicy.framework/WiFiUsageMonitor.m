@interface WiFiUsageMonitor
+ (id)LQMAnalysisReasonForFault:(unint64_t)a3;
+ (id)getTDConfirmedEventStringForDisplay:(id *)a3;
+ (id)getTDEvalCompleteEventStringForDisplay:(int)a3;
+ (id)sharedInstance;
+ (void)appendTDStateToDict:(id)a3 from:(id)a4;
- (AnalyticsProcessor)analyticsProcessor;
- (BOOL)airplaneModeEnabled;
- (BOOL)cellularFallbackEnabled;
- (BOOL)cellularOutrankingEnabled;
- (BOOL)companionConnected;
- (BOOL)compatibilityModeEnabled;
- (BOOL)controlCenterEnabled;
- (BOOL)curBTAudioBand;
- (BOOL)detectedJoinAfterIPConfig;
- (BOOL)deviceCharging;
- (BOOL)deviceLocked;
- (BOOL)displayOn;
- (BOOL)inActiveA2dp;
- (BOOL)inActiveAwdl;
- (BOOL)inActiveBiAoS;
- (BOOL)inActiveCall;
- (BOOL)inActiveRoam;
- (BOOL)inActiveScan;
- (BOOL)inActiveSco;
- (BOOL)inActiveUniAoS;
- (BOOL)inMediaPlayback;
- (BOOL)isAnyUsbInserted;
- (BOOL)isBSPActive;
- (BOOL)isSystemAwake;
- (BOOL)lastTDEvalConfirmed;
- (BOOL)lastTDEvalExecuted;
- (BOOL)poweredOn;
- (BOOL)privacyRestrictionDisabled;
- (BOOL)submitAnalytics:(id)a3;
- (BOOL)xctest;
- (BOOL)xctest_disableSampling;
- (NSArray)lastChannelInfoList;
- (NSArray)usbDevices;
- (NSDate)lastCallStarted;
- (NSDate)lastInCallAnalysis;
- (NSDate)lastLQMAnalysisForSlowWiFiDNSFailureTime;
- (NSDate)processInitTime;
- (NSDate)timeOfFirstUnlockAfterBoot;
- (NSDate)timeOfIPv4;
- (NSDate)timeOfIPv6;
- (NSDate)timeOfLastJoin;
- (NSDate)timeOfLastLinkUp;
- (NSDictionary)lastScanData;
- (NSDictionary)lastScanRequest;
- (NSMutableArray)pendingLqmAnalysis;
- (NSMutableDictionary)interfaceLqmWindows;
- (NSMutableDictionary)interfacesCapabilities;
- (NSMutableDictionary)linkSessions;
- (NSMutableDictionary)usageSessions;
- (NSNumber)bootToIPv4;
- (NSNumber)bootToIPv6;
- (NSNumber)bootToLastJoin;
- (NSNumber)bootToLastLinkUp;
- (NSNumber)firstUnlockToIPv4;
- (NSNumber)firstUnlockToIPv6;
- (NSNumber)firstUnlockToLastJoin;
- (NSNumber)firstUnlockToLastLinkUp;
- (NSNumber)lastJoinToIPv4;
- (NSNumber)lastJoinToIPv6;
- (NSNumber)lastJoinToLastLinkUp;
- (NSNumber)lastLinkUpToIPv4;
- (NSNumber)lastLinkUpToIPv6;
- (NSString)currentCellularStatus;
- (NSString)lastTDConfirmedDisplayStr;
- (NSString)lastTDEvalStartedBy;
- (NSString)motionState;
- (NSString)secondaryInterfaceName;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)internalQueue;
- (WAMessage)dummyWAMessage;
- (WiFiSoftError)rnfSoftError;
- (WiFiSoftError)tdSoftError;
- (WiFiUsageInterfaceStats)ifStatsAtLastLqmUpdate;
- (WiFiUsageInterfaceStats)secondaryIfStatsAtLastLqmUpdate;
- (WiFiUsageMonitor)init;
- (WiFiUsageNetworkDetails)currentNetworkDetails;
- (WiFiUsageRangingSession)rangingSession;
- (id)canStartLQMAnalysisforTrigger:(id)a3 andReason:(id)a4 onWindow:(id)a5;
- (id)completionHandler;
- (id)faultEventHandler;
- (id)faultReasonCount:(unint64_t)a3 forInterface:(id)a4;
- (id)getProperty:(id)a3 forAllSessionsOfInterface:(id)a4;
- (id)lastBssSessionInfoForInterface:(id)a3;
- (id)lastRangingSessionMetric;
- (id)lqmAnalysisCompletionHandler;
- (id)summaryForInterface:(id)a3;
- (int64_t)noiseDeltaUponUSBInsertion;
- (int64_t)tdLogic_badRssiThreshold;
- (int64_t)tdLogic_goodRssiThreshold;
- (unint64_t)hidCount;
- (unint64_t)numberOfJoins;
- (unint64_t)pid;
- (void)addFaultEvent:(unint64_t)a3 forInterface:(id)a4;
- (void)addRangingRttSampleWithRssi:(int64_t)a3 rtt:(int64_t)a4 snr:(unint64_t)a5 flags:(unint64_t)a6 channel:(unint64_t)a7 coreId:(unint64_t)a8 bitErrorRate:(unint64_t)a9 phyError:(unint64_t)a10 andPeerSnr:(unint64_t)a11 andPeerCoreId:(unint64_t)a12 andPeerBitErrorRate:(unint64_t)a13 andPeerPhyError:(unint64_t)a14;
- (void)addSoftApClientEvent:(BOOL)a3 identifier:(id)a4 isAppleClient:(BOOL)a5 isInstantHotspot:(BOOL)a6 isAutoHotspot:(BOOL)a7 isHidden:(BOOL)a8;
- (void)addSoftApCoexEvent:(unint64_t)a3 deniedUnii1ChannelMap:(unint64_t)a4 deniedUnii2aChannelMap:(unint64_t)a5 deniedUnii2cChannelMap:(unint64_t)a6 deniedUnii3ChannelMap:(unint64_t)a7;
- (void)addTriggerDisconnectEvent:(id)a3 isAlerted:(BOOL)a4 isConfirmed:(BOOL)a5 isExecuted:(BOOL)a6;
- (void)appendBTStatsToDict:(id)a3;
- (void)appendUsbStatsToDict:(id)a3;
- (void)brokenLinkDetected:(id)a3;
- (void)completionContext;
- (void)enableSubmitAnalyticsNoSampling:(BOOL)a3;
- (void)enableXCTestNotifications;
- (void)faultEventDetected:(id)a3;
- (void)getMobileAssets;
- (void)initializeDeviceLockState:(BOOL)a3 displayState:(BOOL)a4 motionState:(id)a5 callState:(BOOL)a6 mediaState:(BOOL)a7 chargingState:(BOOL)a8 companionConnectionState:(BOOL)a9 andSecondaryInterfaceName:(id)a10 compatibilityMode:(BOOL)a11 badLinkRssi:(int64_t)a12 goodLinkRssi:(int64_t)a13;
- (void)linkTestEvent:(id)a3 withReason:(id)a4 forInterface:(id)a5;
- (void)notifyDHCPChanges:(id)a3;
- (void)notifyDriverAvailability:(id)a3 available:(unint64_t)a4 version:(unint64_t)a5 flags:(unint64_t)a6 eventID:(unint64_t)a7 reason:(unint64_t)a8 subReason:(unint64_t)a9 minorReason:(unint64_t)a10 reasonString:(id)a11;
- (void)notifyIPv4Changes:(id)a3;
- (void)notifyIPv6Changes:(id)a3;
- (void)notifyInterfaceRankingState:(BOOL)a3 forInterface:(id)a4;
- (void)notifyIpConfigurationStateWithMethod:(BOOL)a3 dhcpLeaseDuration:(double)a4 hasRoutableIpV4:(BOOL)a5 hasRoutableIpV6:(BOOL)a6;
- (void)notifyNetworkQualityResults:(id)a3 forInterface:(id)a4;
- (void)pushRNFEventToHUD:(BOOL)a3;
- (void)pushTDEventToHUD:(id)a3;
- (void)rangingCompletedWithValidCount:(unint64_t)a3 resultStatus:(int64_t)a4 resultFlags:(unint64_t)a5;
- (void)rangingSessionRequestedWithSelfPreferredChannel:(unint64_t)a3 selfMainChannel:(unint64_t)a4 selfChannelFlags:(unint64_t)a5 peerPreferredChannel:(unint64_t)a6 peerMainChannel:(unint64_t)a7 peerChannelFlags:(unint64_t)a8 requester:(id)a9;
- (void)rangingStartedWithNumMeasurements:(unint64_t)a3;
- (void)receiveKernelLQMRollingWindow:(id)a3 ForInterface:(id)a4;
- (void)receivedBssTransitionRequest:(id)a3 candidateListIncluded:(BOOL)a4 isAbridged:(BOOL)a5 disassociationImminent:(BOOL)a6 bssTerminationIncluded:(BOOL)a7 essDisassociationImminent:(BOOL)a8;
- (void)resetDeviceSessionforInterface:(id)a3;
- (void)sendFaultToDB:(id)a3;
- (void)sentBssTransitionResponse:(id)a3 status:(int64_t)a4 terminationDelayRequested:(BOOL)a5;
- (void)setAirplaneModeEnabled:(BOOL)a3;
- (void)setAnalyticsProcessor:(id)a3;
- (void)setAwdlSequence:(id)a3;
- (void)setAwdlState:(BOOL)a3 inMode:(int64_t)a4;
- (void)setBluetoothState:(BOOL)a3 connectedDeviceCount:(unint64_t)a4 inA2dp:(BOOL)a5 inSco:(BOOL)a6 inUniAoS:(BOOL)a7 inBiAoS:(BOOL)a8 btAudioBand:(BOOL)a9;
- (void)setBootToIPv4:(id)a3;
- (void)setBootToIPv6:(id)a3;
- (void)setBootToLastJoin:(id)a3;
- (void)setBootToLastLinkUp:(id)a3;
- (void)setCallState:(BOOL)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setCellularDataStatus:(id)a3 inAirplaneMode:(BOOL)a4;
- (void)setCellularFallbackEnabled:(BOOL)a3;
- (void)setCellularFallbackState:(BOOL)a3 forInterface:(id)a4;
- (void)setCellularOutrankingEnabled:(BOOL)a3;
- (void)setCellularOutrankingState:(BOOL)a3 forInterface:(id)a4;
- (void)setCompanionConnected:(BOOL)a3;
- (void)setCompanionConnectionState:(BOOL)a3;
- (void)setCompatibilityModeEnabled:(BOOL)a3;
- (void)setCompletionContext:(void *)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setCompletionHandler:(id)a3 withContext:(void *)a4 onQueue:(id)a5;
- (void)setControlCenterEnabled:(BOOL)a3;
- (void)setControlCenterState:(BOOL)a3 withKnownLocation:(BOOL)a4 forInterface:(id)a5;
- (void)setCurBTAudioBand:(BOOL)a3;
- (void)setCurrentApplicationName:(id)a3 withAttributes:(id)a4;
- (void)setCurrentCellularStatus:(id)a3;
- (void)setCurrentNetworkDetails:(id)a3;
- (void)setDetectedJoinAfterIPConfig:(BOOL)a3;
- (void)setDeviceCharging:(BOOL)a3;
- (void)setDeviceChargingState:(BOOL)a3;
- (void)setDeviceInitializationFailureReason:(id)a3 timeSinceBoot:(double)a4;
- (void)setDeviceLockState:(BOOL)a3;
- (void)setDeviceLocked:(BOOL)a3;
- (void)setDisplayOn:(BOOL)a3;
- (void)setDisplayState:(BOOL)a3;
- (void)setDummyWAMessage:(id)a3;
- (void)setFaultEventHandler:(id)a3;
- (void)setFirstUnlockToIPv4:(id)a3;
- (void)setFirstUnlockToIPv6:(id)a3;
- (void)setFirstUnlockToLastJoin:(id)a3;
- (void)setFirstUnlockToLastLinkUp:(id)a3;
- (void)setForgetNetworkEvent:(id)a3 forInterface:(id)a4;
- (void)setHidCount:(unint64_t)a3;
- (void)setIfStatsAtLastLqmUpdate:(id)a3;
- (void)setInActiveA2dp:(BOOL)a3;
- (void)setInActiveAwdl:(BOOL)a3;
- (void)setInActiveBiAoS:(BOOL)a3;
- (void)setInActiveCall:(BOOL)a3;
- (void)setInActiveRoam:(BOOL)a3;
- (void)setInActiveScan:(BOOL)a3;
- (void)setInActiveSco:(BOOL)a3;
- (void)setInActiveUniAoS:(BOOL)a3;
- (void)setInMediaPlayback:(BOOL)a3;
- (void)setInterfaceLqmWindows:(id)a3;
- (void)setInterfacesCapabilities:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setIsAnyUsbInserted:(BOOL)a3;
- (void)setIsBSPActive:(BOOL)a3;
- (void)setIsSystemAwake:(BOOL)a3;
- (void)setJoinEvent:(BOOL)a3 withReason:(unint64_t)a4 lastDisconnectReason:(unint64_t)a5 lastJoinFailure:(int64_t)a6 andNetworkDetails:(id)a7 forInterface:(id)a8;
- (void)setLastCallStarted:(id)a3;
- (void)setLastChannelInfoList:(id)a3;
- (void)setLastInCallAnalysis:(id)a3;
- (void)setLastJoinToIPv4:(id)a3;
- (void)setLastJoinToIPv6:(id)a3;
- (void)setLastJoinToLastLinkUp:(id)a3;
- (void)setLastLQMAnalysisForSlowWiFiDNSFailureTime:(id)a3;
- (void)setLastLinkUpToIPv4:(id)a3;
- (void)setLastLinkUpToIPv6:(id)a3;
- (void)setLastScanData:(id)a3;
- (void)setLastScanRequest:(id)a3;
- (void)setLastTDConfirmedDisplayStr:(id)a3;
- (void)setLastTDEvalConfirmed:(BOOL)a3;
- (void)setLastTDEvalExecuted:(BOOL)a3;
- (void)setLastTDEvalStartedBy:(id)a3;
- (void)setLinkEvent:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7 forInterface:(id)a8;
- (void)setLinkSessions:(id)a3;
- (void)setLqmAnalysisCompletionHandler:(id)a3;
- (void)setMediaState:(BOOL)a3;
- (void)setMotionState:(id)a3;
- (void)setNoiseDeltaUponUSBInsertion:(int64_t)a3;
- (void)setNumberOfJoins:(unint64_t)a3;
- (void)setPendingLqmAnalysis:(id)a3;
- (void)setPid:(unint64_t)a3;
- (void)setPowerBudget:(int64_t)a3 andThermalIndex:(int64_t)a4 forInterface:(id)a5;
- (void)setPowerState:(BOOL)a3 forInterface:(id)a4;
- (void)setPoweredOn:(BOOL)a3;
- (void)setPrivacyRestrictionDisabled:(BOOL)a3;
- (void)setProcessInitTime:(id)a3;
- (void)setRangingSession:(id)a3;
- (void)setRnfSoftError:(id)a3;
- (void)setRoamingARCriteria:(id *)a3 forInterface:(id)a4;
- (void)setRoamingConfiguration:(int64_t)a3 withChannelList:(id)a4 forInterface:(id)a5;
- (void)setRoamingState:(BOOL)a3 withReason:(unint64_t)a4 asString:(id)a5 andStatus:(unint64_t)a6 asString:(id)a7 andLatency:(unint64_t)a8 andRoamData:(id)a9 andPingPongSequence:(id)a10 forInterface:(id)a11;
- (void)setScanningState:(BOOL)a3 client:(unint64_t)a4 neighborBSS:(id)a5 otherBSS:(id)a6 withChannelInfoList:(id)a7 withRequest:(id)a8 forInterface:(id)a9;
- (void)setSecondaryIfStatsAtLastLqmUpdate:(id)a3;
- (void)setSecondaryInterfaceName:(id)a3;
- (void)setSmartCoverState:(id)a3;
- (void)setSoftApState:(BOOL)a3 requester:(id)a4 status:(id)a5 changeReason:(id)a6 channelNumber:(unint64_t)a7 countryCode:(unint64_t)a8 isHidden:(BOOL)a9 isInfraConnected:(BOOL)a10 isAwdlUp:(BOOL)a11 lowPowerModeDuration:(double)a12 compatibilityMode:(BOOL)a13 requestToUpLatency:(double)a14;
- (void)setSteeringRequest:(unint64_t)a3 preferredChannel:(unint64_t)a4 preferredBand:(int)a5 preferredSSID:(id)a6 targetSSIDDiffersFromCurrent:(BOOL)a7 preferredBSS:(id)a8 ssidIsSplit:(BOOL)a9 transitionCandidates:(BOOL)a10;
- (void)setSystemWakeState:(BOOL)a3 wokenByWiFi:(BOOL)a4;
- (void)setTdLogic_alertedBy:(int)a3 forInterface:(id)a4;
- (void)setTdLogic_badRssiThreshold:(int64_t)a3;
- (void)setTdLogic_badRssiThreshold:(int64_t)a3 goodRssiThreshold:(int64_t)a4;
- (void)setTdLogic_decisionState:(id *)a3 forInterface:(id)a4;
- (void)setTdLogic_deferJoin:(unint64_t)a3 perBSSID:(unint64_t)a4;
- (void)setTdLogic_end:(int)a3 evalTime:(double)a4 rssi:(int64_t)a5 roamTime:(double)a6 forInterface:(id)a7;
- (void)setTdLogic_execState:(id)a3 forInterface:(id)a4;
- (void)setTdLogic_fastTdState:(id)a3 forInterface:(id)a4;
- (void)setTdLogic_goodRssiThreshold:(int64_t)a3;
- (void)setTdLogic_waitForRoamTime:(double)a3 forInterface:(id)a4;
- (void)setTdSoftError:(id)a3;
- (void)setTimeOfFirstUnlockAfterBoot:(id)a3;
- (void)setTimeOfIPv4:(id)a3;
- (void)setTimeOfIPv6:(id)a3;
- (void)setTimeOfLastJoin:(id)a3;
- (void)setTimeOfLastLinkUp:(id)a3;
- (void)setUsageSessions:(id)a3;
- (void)setUsbDevices:(id)a3;
- (void)setUsbStatus:(BOOL)a3 currentDevices:(id)a4 currentNoiseDelta:(int64_t)a5;
- (void)setXctest:(BOOL)a3;
- (void)setXctest_disableSampling:(BOOL)a3;
- (void)startLQMAnalysis:(id)a3;
- (void)startMonitoringWiFiInterface:(id)a3 withLinkSessionOnly:(BOOL)a4;
- (void)submitBootLatenciesToCA;
- (void)submitLqmToCA:(id)a3 forInterface:(id)a4;
- (void)submitScanResultWithNeighborBSS:(id)a3 withOtherBSS:(id)a4 withChannelInfoList:(id)a5;
- (void)updateBeaconCache:(id)a3 afterRoamAttempt:(id)a4 whileCurrentBSSID:(id)a5 forInterface:(id)a6;
- (void)updateBeaconInfo:(id)a3 andParsedIE:(id)a4 forInterface:(id)a5;
- (void)updateBssPerChannelWith:(id)a3 into:(id)a4 and:(id)a5 withChannelInfoList:(id)a6;
- (void)updateCurrentNetworkDetails:(id)a3;
- (void)updateIsBSPActive:(BOOL)a3;
- (void)updateKnownNetworksSupportingSeamless:(id)a3 forBSS:(id)a4 andSSID:(id)a5 beaconCache:(id)a6;
- (void)updateLQMWindowCriteria;
- (void)updateLinkQuality:(id)a3 forInterface:(id)a4 supportsLinkRecommendations:(BOOL)a5;
- (void)updateLinkRecoveryDisabled:(BOOL)a3;
- (void)updateLinkTestInterval:(unint64_t)a3;
- (void)updateRealTimeCoex:(BOOL)a3 type:(unint64_t)a4 reasons:(id)a5;
- (void)updateRoamCache:(id)a3 forInterface:(id)a4;
- (void)updateScanForwardStats:(id)a3;
- (void)updateSleepPowerStats:(double)a3 unassociatedDuration:(double)a4 associatedDuration:(double)a5 roamingDuration:(double)a6;
- (void)updateWPSInfo:(id)a3;
- (void)updateWithBspOverflowed:(BOOL)a3 IsBSPActive:(BOOL)a4 BspTimeToTST:(unint64_t)a5 BspSampleDurationMS:(unint64_t)a6 IsScanActiveBSP:(BOOL)a7 IsP2PActiveBSP:(BOOL)a8 BspTriggerCount:(unint64_t)a9 BspMutePercentage:(unint64_t)a10 BspMaxMuteMS:(unint64_t)a11 BspAvgMuteMS:(unint64_t)a12 BspErrorPercentage:(unint64_t)a13 BspTimeOutPercentageOfTriggers:(unint64_t)a14 BspRejectOrFailPercentageOfTriggers:(unint64_t)a15 bspMaxConsecutiveFails:(unint64_t)a16 supportsLinkRecommendation:(BOOL)a17 forInterface:(id)a18;
- (void)updateWithChQualScore:(unint64_t)a3 txLatencyScore:(unint64_t)a4 rxLatencyScore:(unint64_t)a5 txLossScore:(unint64_t)a6 rxLossScore:(unint64_t)a7 txLatencyP95:(unint64_t)a8 linkRecommendationFlags:(unint64_t)a9 rtTrafficStatus:(unint64_t)a10 forInterface:(id)a11;
- (void)updateWithCompatibilityMode:(unsigned __int8)a3;
- (void)updateWithMLORuntimeConfig:(id *)a3 forInterface:(id)a4;
- (void)updateWithRoamingSuppression:(unsigned __int8)a3;
- (void)updateWowState:(BOOL)a3 lpasState:(BOOL)a4 lowPowerState:(BOOL)a5 batterySaverState:(BOOL)a6;
@end

@implementation WiFiUsageMonitor

void __110__WiFiUsageMonitor_setScanningState_client_neighborBSS_otherBSS_withChannelInfoList_withRequest_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    int v3 = *(unsigned __int8 *)(a1 + 88);
    if (*(unsigned __int8 *)(v2 + 22) != v3 || *(void *)(a1 + 48) || *(void *)(a1 + 56))
    {
      *(unsigned char *)(v2 + 22) = v3;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      v4 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 104), "valueForKey:", *(void *)(a1 + 32), 0);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v14 != v7) {
              objc_enumerationMutation(v4);
            }
            [*(id *)(*((void *)&v13 + 1) + 8 * i) scanningStateDidChange:*(unsigned __int8 *)(a1 + 88) client:*(void *)(a1 + 80) neighborBSS:*(void *)(a1 + 48) otherBSS:*(void *)(a1 + 56)];
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v6);
      }

      uint64_t v2 = *(void *)(a1 + 40);
    }
    v9 = *(void **)(a1 + 64);
    if (v9)
    {
      objc_storeStrong((id *)(v2 + 256), v9);
      uint64_t v2 = *(void *)(a1 + 40);
    }
    if (*(unsigned char *)(v2 + 33))
    {
      v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v11 = [MEMORY[0x1E4F28EA0] notificationWithName:@"setScanningState" object:0];
      [v10 postNotification:v11];

      uint64_t v2 = *(void *)(a1 + 40);
    }
    [(id)v2 submitScanResultWithNeighborBSS:*(void *)(a1 + 48) withOtherBSS:*(void *)(a1 + 56) withChannelInfoList:*(void *)(a1 + 72)];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v19 = "-[WiFiUsageMonitor setScanningState:client:neighborBSS:otherBSS:withChannelInfoList:withRequest:forInterface:]_block_invoke";
    __int16 v20 = 2112;
    uint64_t v21 = v12;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

void __61__WiFiUsageMonitor_setCurrentApplicationName_withAttributes___block_invoke(void *a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v2 = [*(id *)(a1[4] + 104) allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v30;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v30 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v29 + 1) + 8 * v6);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v34 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v26;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v26 != v11) {
                objc_enumerationMutation(v8);
              }
              [*(id *)(*((void *)&v25 + 1) + 8 * v12++) applicationStateDidChange:a1[5] withAttributes:a1[6]];
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v34 count:16];
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v4);
  }

  uint64_t v13 = a1[4];
  if (*(unsigned char *)(v13 + 33))
  {
    long long v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    long long v15 = [MEMORY[0x1E4F28EA0] notificationWithName:@"CurrentApplicationName" object:0];
    [v14 postNotification:v15];

    uint64_t v13 = a1[4];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v16 = objc_msgSend(*(id *)(v13 + 120), "allValues", 0);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * v20++) setCurrentApplicationName:a1[5] withAttributes:a1[6]];
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v18);
  }
}

- (void)submitScanResultWithNeighborBSS:(id)a3 withOtherBSS:(id)a4 withChannelInfoList:(id)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (+[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:](WiFiUsagePrivacyFilter, "canPerformActionWithSampleRate:", 1)&& (v7 && [v7 count] || v8 && objc_msgSend(v8, "count")))
  {
    uint64_t v10 = objc_opt_new();
    uint64_t v11 = objc_opt_new();
    id v50 = v7;
    [(WiFiUsageMonitor *)self updateBssPerChannelWith:v7 into:v10 and:v11 withChannelInfoList:v9];
    id v49 = v8;
    v52 = (void *)v10;
    v47 = (void *)v11;
    [(WiFiUsageMonitor *)self updateBssPerChannelWith:v8 into:v10 and:v11 withChannelInfoList:v9];
    uint64_t v12 = objc_opt_new();
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v48 = v9;
    id v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v62 objects:v68 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v63 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = +[WiFiUsageChannel channelWithChannelInfo:*(void *)(*((void *)&v62 + 1) + 8 * i)];
          [v12 addObject:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v62 objects:v68 count:16];
      }
      while (v15);
    }

    uint64_t v19 = objc_opt_new();
    uint64_t v20 = [(NSDictionary *)self->_lastScanRequest objectForKeyedSubscript:@"SCAN_CHANNELS"];

    long long v21 = v12;
    if (v20)
    {
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v22 = [(NSDictionary *)self->_lastScanRequest objectForKeyedSubscript:@"SCAN_CHANNELS"];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v58 objects:v67 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v59;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v59 != v25) {
              objc_enumerationMutation(v22);
            }
            long long v27 = +[WiFiUsageChannel channelWithScanChannel:*(void *)(*((void *)&v58 + 1) + 8 * j)];
            [v27 updateDFSInfoFromSupportedChannels:v12];
            [v19 addObject:v27];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v58 objects:v67 count:16];
        }
        while (v24);
      }

      long long v21 = v19;
    }
    id v28 = v21;

    long long v57 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v54 = 0u;
    obuint64_t j = v28;
    uint64_t v29 = [obj countByEnumeratingWithState:&v54 objects:v66 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v55;
      do
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v55 != v31) {
            objc_enumerationMutation(obj);
          }
          v33 = *(void **)(*((void *)&v54 + 1) + 8 * k);
          v34 = objc_opt_new();
          v35 = NSNumber;
          uint64_t v36 = [(NSDictionary *)self->_lastScanRequest objectForKeyedSubscript:@"SCAN_TYPE"];
          v37 = objc_msgSend(v35, "numberWithBool:", objc_msgSend(v36, "unsignedIntegerValue") == 1);
          [v34 setObject:v37 forKeyedSubscript:@"isActive"];

          v38 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v33, "channel"));
          [v34 setObject:v38 forKeyedSubscript:@"channel"];

          v39 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v33, "isDFSChannel"));
          [v34 setObject:v39 forKeyedSubscript:@"isDFSChannel"];

          v40 = +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", [v33 band]);
          [v34 setObject:v40 forKeyedSubscript:@"band"];

          v41 = NSNumber;
          v42 = [v52 objectForKeyedSubscript:v33];
          v43 = objc_msgSend(v41, "numberWithUnsignedInteger:", objc_msgSend(v42, "count"));
          [v34 setObject:v43 forKeyedSubscript:@"PerChannelUniqueBSSCount"];

          id v44 = v34;
          AnalyticsSendEventLazy();
        }
        uint64_t v30 = [obj countByEnumeratingWithState:&v54 objects:v66 count:16];
      }
      while (v30);
    }

    id v45 = v47;
    id v46 = obj;
    AnalyticsSendEventLazy();

    id v8 = v49;
    id v7 = v50;
    id v9 = v48;
  }
}

void __79__WiFiUsageMonitor_updateLinkQuality_forInterface_supportsLinkRecommendations___block_invoke(uint64_t a1)
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 184);
    uint64_t v3 = +[WiFiUsageInterfaceStats statsForInterfaceName:](WiFiUsageInterfaceStats, "statsForInterfaceName:");
    uint64_t v4 = (void *)v3;
    if (v2)
    {
      uint64_t v5 = +[WiFiUsageInterfaceStats statsForInterfaceName:*(void *)(*(void *)(a1 + 40) + 88)];
      objc_msgSend(*(id *)(a1 + 48), "updateWithTxBytes:RxBytes:TxL3Packets:RxL3Packets:txBytesSecondary:rxBytesSecondary:", objc_msgSend(v4, "txBytes") - objc_msgSend(*(id *)(*(void *)(a1 + 40) + 184), "txBytes"), objc_msgSend(v4, "rxBytes") - objc_msgSend(*(id *)(*(void *)(a1 + 40) + 184), "rxBytes"), objc_msgSend(v4, "txL3Packets") - objc_msgSend(*(id *)(*(void *)(a1 + 40) + 184), "txL3Packets"), objc_msgSend(v4, "rxL3Packets") - objc_msgSend(*(id *)(*(void *)(a1 + 40) + 184), "rxL3Packets"), objc_msgSend(v5, "txBytes") - objc_msgSend(*(id *)(*(void *)(a1 + 40) + 192), "txBytes"), objc_msgSend(v5, "rxBytes") - objc_msgSend(*(id *)(*(void *)(a1 + 40) + 192), "rxBytes"));
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = *(void **)(v6 + 184);
      *(void *)(v6 + 184) = v4;
      id v8 = v4;

      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void **)(v9 + 192);
      *(void *)(v9 + 192) = v5;
    }
    else
    {
      uint64_t v12 = *(void *)(a1 + 40);
      id v13 = *(void **)(v12 + 184);
      *(void *)(v12 + 184) = v3;

      uint64_t v14 = +[WiFiUsageInterfaceStats statsForInterfaceName:*(void *)(*(void *)(a1 + 40) + 88)];
      uint64_t v15 = *(void *)(a1 + 40);
      id v8 = *(id *)(v15 + 192);
      *(void *)(v15 + 192) = v14;
    }

    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    uint64_t v16 = [*(id *)(*(void *)(a1 + 40) + 104) valueForKey:*(void *)(a1 + 32)];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v76 objects:v81 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v77 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          if ([v21 expectsLQMUpdates]) {
            [v21 linkQualityDidChange:*(void *)(a1 + 48)];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v76 objects:v81 count:16];
      }
      while (v18);
    }

    uint64_t v22 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v22 + 33))
    {
      uint64_t v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v24 = [MEMORY[0x1E4F28EA0] notificationWithName:@"UpdateLinkQuality" object:0];
      [v23 postNotification:v24];

      uint64_t v22 = *(void *)(a1 + 40);
    }
    uint64_t v25 = [*(id *)(v22 + 120) valueForKey:*(void *)(a1 + 32)];
    uint64_t v26 = [v25 capabilities];
    if (!v26
      || (long long v27 = (void *)v26,
          [v25 capabilities],
          id v28 = objc_claimAutoreleasedReturnValue(),
          uint64_t v29 = [v28 maxInterfacePHYRate],
          v28,
          v27,
          !v29))
    {
      uint64_t v30 = [[WiFiUsageInterfaceCapabilities alloc] initWithInterfaceName:*(void *)(a1 + 32)];
      if (v30)
      {
        [*(id *)(*(void *)(a1 + 40) + 136) setValue:v30 forKey:*(void *)(a1 + 32)];
        [v25 setCapabilities:v30];
      }
    }
    uint64_t v31 = *(void **)(a1 + 48);
    long long v32 = [v25 capabilities];
    [v31 updateWithInterfaceCapabilities:v32 AndNetworkDetails:*(void *)(*(void *)(a1 + 40) + 264)];

    v33 = [v25 triggerCriteriaFilterList];
    if ([(WiFiUsageLQMWindowAnalysisDataTriggered *)v33 count])
    {
      int v34 = [v25 checkCriteriaBSSIDWithSample:*(void *)(a1 + 48)];

      if (!v34) {
        goto LABEL_27;
      }
      v35 = *(unsigned __int8 **)(a1 + 40);
      uint64_t v36 = v35[13];
      uint64_t v37 = v35[15];
      uint64_t v38 = v35[16];
      v39 = [WiFiUsageLQMWindowAnalysisDataTriggered alloc];
      v40 = [MEMORY[0x1E4F1C9C8] now];
      v33 = [(WiFiUsageLQMWindowAnalysisDataTriggered *)v39 initWithRollingWindow:v25 andSubReason:@"BSSID Change" andContext:v36 | (v37 << 8) | (v38 << 16) andTimestamp:v40 onQueue:*(void *)(*(void *)(a1 + 40) + 144)];

      [*(id *)(a1 + 40) startLQMAnalysis:v33];
      [v25 cleanUpStashedMedians];
      [v25 clearOngoingCriteriaDates];
    }

LABEL_27:
    [v25 addSample:*(void *)(a1 + 48)];
    if (!*(unsigned char *)(a1 + 56) && ([*(id *)(a1 + 40) isBSPActive] & 1) == 0) {
      [*(id *)(a1 + 40) submitLqmToCA:*(void *)(a1 + 48) forInterface:*(void *)(a1 + 32)];
    }
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v41 = (void *)[*(id *)(*(void *)(a1 + 40) + 208) copy];
    uint64_t v42 = [v41 countByEnumeratingWithState:&v72 objects:v80 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v73;
      do
      {
        for (uint64_t j = 0; j != v43; ++j)
        {
          if (*(void *)v73 != v44) {
            objc_enumerationMutation(v41);
          }
          [*(id *)(*((void *)&v72 + 1) + 8 * j) updateWithLQMSample:*(void *)(a1 + 48)];
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v72 objects:v80 count:16];
      }
      while (v43);
    }

    id v46 = [v25 triggerCriteriaFilterList];
    uint64_t v47 = [v46 count];

    if (v47)
    {
      id v48 = [v25 evaluateCriteriaWithStopUponFirstMatch:1];
      if ([v48 matched])
      {
        id v49 = [v48 firstTriggered];
        id v50 = [v48 currentSample];
        int v51 = [v49 isEqual:v50];
      }
      else
      {
        int v51 = 0;
      }
      if ([v48 matched])
      {
        BOOL v52 = 0;
        v53 = &stru_1F2B5AC50;
        long long v54 = @"Match Start";
        if (!v51) {
          long long v54 = &stru_1F2B5AC50;
        }
        long long v55 = &stru_1F2B5AC50;
      }
      else
      {
        long long v56 = [v48 firstTriggered];

        v53 = &stru_1F2B5AC50;
        long long v54 = @"Match Start";
        if (!v51) {
          long long v54 = &stru_1F2B5AC50;
        }
        BOOL v52 = v56 != 0;
        long long v55 = @"Match End";
        if (!v56) {
          long long v55 = &stru_1F2B5AC50;
        }
        if ((v51 & v52) != 0) {
          v53 = @"&";
        }
      }
      long long v57 = [NSString stringWithFormat:@"%@%@%@", v54, v53, v55];
      if ((v51 | v52) == 1)
      {
        long long v58 = [MEMORY[0x1E4F1C9C8] now];
        if (v51)
        {
          uint64_t v59 = [*(id *)(a1 + 40) canStartLQMAnalysisforTrigger:@"Match Start" andReason:v57 onWindow:v25];

          long long v58 = (void *)v59;
        }
        uint64_t v60 = *(void *)(a1 + 40);
        long long v61 = [[WiFiUsageLQMWindowAnalysisDataTriggered alloc] initWithRollingWindow:v25 andSubReason:v57 andContext:*(unsigned __int8 *)(v60 + 13) | ((unint64_t)*(unsigned __int8 *)(v60 + 15) << 8) | ((unint64_t)*(unsigned __int8 *)(v60 + 16) << 16) andTimestamp:v58 onQueue:*(void *)(v60 + 144)];
        [*(id *)(a1 + 40) startLQMAnalysis:v61];
      }
      [v25 cleanUpStashedMedians];
      if (v52) {
        [v25 clearOngoingCriteriaDates];
      }
    }
    if (+[WiFiUsageLQMWindowAnalysis isInCallAnalysisDue:*(void *)(*(void *)(a1 + 40) + 232)])
    {
      long long v62 = [*(id *)(*(void *)(a1 + 40) + 120) objectForKey:*(void *)(a1 + 32)];
      long long v63 = [*(id *)(a1 + 40) canStartLQMAnalysisforTrigger:@"InCall" andReason:@"in Call" onWindow:v62];
      if (v63)
      {
        long long v64 = *(unsigned __int8 **)(a1 + 40);
        uint64_t v65 = v64[13];
        uint64_t v66 = v64[15];
        uint64_t v67 = v64[16];
        v68 = [WiFiUsageLQMWindowAnalysisInCall alloc];
        uint64_t v69 = [*(id *)(*(void *)(a1 + 40) + 120) objectForKey:*(void *)(a1 + 32)];
        [*(id *)(*(void *)(a1 + 40) + 224) timeIntervalSinceNow];
        v71 = [(WiFiUsageLQMWindowAnalysisInCall *)v68 initWithRollingWindow:v69 andCallStatus:@"in Call" andCallDuration:v65 | (v66 << 8) | (v67 << 16) andContext:v63 andTimestamp:*(void *)(*(void *)(a1 + 40) + 144) onQueue:-v70];

        [*(id *)(a1 + 40) startLQMAnalysis:v71];
      }
    }
    return;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v83 = "-[WiFiUsageMonitor updateLinkQuality:forInterface:supportsLinkRecommendations:]_block_invoke";
    __int16 v84 = 2112;
    uint64_t v85 = v11;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_233);
  }
  uint64_t v2 = (void *)sharedInstance_sharedWiFiUsageMonitor;

  return v2;
}

- (void)setCurrentApplicationName:(id)a3 withAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__WiFiUsageMonitor_setCurrentApplicationName_withAttributes___block_invoke;
  block[3] = &unk_1E69BCEC8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

- (void)setScanningState:(BOOL)a3 client:(unint64_t)a4 neighborBSS:(id)a5 otherBSS:(id)a6 withChannelInfoList:(id)a7 withRequest:(id)a8 forInterface:(id)a9
{
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  internalQueue = self->_internalQueue;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __110__WiFiUsageMonitor_setScanningState_client_neighborBSS_otherBSS_withChannelInfoList_withRequest_forInterface___block_invoke;
  v26[3] = &unk_1E69BD0F8;
  id v27 = v19;
  id v28 = self;
  BOOL v34 = a3;
  id v29 = v15;
  id v30 = v16;
  id v32 = v17;
  unint64_t v33 = a4;
  id v31 = v18;
  id v21 = v17;
  id v22 = v18;
  id v23 = v16;
  id v24 = v15;
  id v25 = v19;
  dispatch_async(internalQueue, v26);
}

- (void)updateLinkQuality:(id)a3 forInterface:(id)a4 supportsLinkRecommendations:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__WiFiUsageMonitor_updateLinkQuality_forInterface_supportsLinkRecommendations___block_invoke;
  v13[3] = &unk_1E69BCF40;
  id v14 = v9;
  id v15 = self;
  id v16 = v8;
  BOOL v17 = a5;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(internalQueue, v13);
}

- (void)setDeviceChargingState:(BOOL)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__WiFiUsageMonitor_setDeviceChargingState___block_invoke;
  v4[3] = &unk_1E69BC930;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(internalQueue, v4);
}

void __162__WiFiUsageMonitor_updateWithChQualScore_txLatencyScore_rxLatencyScore_txLossScore_rxLossScore_txLatencyP95_linkRecommendationFlags_rtTrafficStatus_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 120) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 samples];
  id v5 = [v3 lastObject];

  [v5 updateWithChQualScore:*(void *)(a1 + 48) txLatencyScore:*(void *)(a1 + 56) rxLatencyScore:*(void *)(a1 + 56) txLossScore:*(void *)(a1 + 64) rxLossScore:*(void *)(a1 + 72) txLatencyP95:*(void *)(a1 + 80) linkRecommendationFlags:*(void *)(a1 + 88) rtTrafficStatus:*(void *)(a1 + 96)];
  if (![*(id *)(a1 + 32) isBSPActive]
    || ([v5 numberForKeyPath:@"bspTriggerCount"],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    [*(id *)(a1 + 32) submitLqmToCA:v5 forInterface:*(void *)(a1 + 40)];
  }
}

- (void)submitLqmToCA:(id)a3 forInterface:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_xctest_disableSampling
    || +[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:1])
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v8 = -[NSMutableDictionary valueForKey:](self->_usageSessions, "valueForKey:", v7, v7);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = 0;
      uint64_t v12 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v8);
          }
          id v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if ([v14 type] == 9)
          {
            id v15 = v14;

            id v11 = v15;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v10);
    }
    else
    {
      id v11 = 0;
    }

    id v16 = objc_opt_new();
    [(id)objc_opt_class() appendTDStateToDict:v16 from:v11];
    [(WiFiUsageMonitor *)self appendUsbStatsToDict:v16];
    [(WiFiUsageMonitor *)self appendBTStatsToDict:v16];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v27 = v6;
    BOOL v17 = [v6 mloSamples];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          id v23 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v16];
          id v24 = [v22 asDictionaryInto:v23];
          AnalyticsSendEvent();
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v19);
    }

    id v6 = v27;
    id v28 = v27;
    id v25 = v16;
    AnalyticsSendEventLazy();

    id v7 = v26;
  }
}

- (BOOL)isBSPActive
{
  return self->_isBSPActive;
}

void __43__WiFiUsageMonitor_setDeviceChargingState___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 11) != v2)
  {
    *(unsigned char *)(v1 + 11) = v2;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v22;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v10 = v9;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v18;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v18 != v13) {
                  objc_enumerationMutation(v10);
                }
                [*(id *)(*((void *)&v17 + 1) + 8 * v14++) chargingStateDidChange:*(unsigned __int8 *)(*(void *)(a1 + 32) + 11)];
              }
              while (v12 != v14);
              uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }
            while (v12);
          }

          ++v8;
        }
        while (v8 != v6);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v6);
    }

    uint64_t v1 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v1 + 33))
  {
    id v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v16 = [MEMORY[0x1E4F28EA0] notificationWithName:@"DeviceChargingState" object:0];
    [v15 postNotification:v16];
  }
}

- (void)updateWithChQualScore:(unint64_t)a3 txLatencyScore:(unint64_t)a4 rxLatencyScore:(unint64_t)a5 txLossScore:(unint64_t)a6 rxLossScore:(unint64_t)a7 txLatencyP95:(unint64_t)a8 linkRecommendationFlags:(unint64_t)a9 rtTrafficStatus:(unint64_t)a10 forInterface:(id)a11
{
  id v17 = a11;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __162__WiFiUsageMonitor_updateWithChQualScore_txLatencyScore_rxLatencyScore_txLossScore_rxLossScore_txLatencyP95_linkRecommendationFlags_rtTrafficStatus_forInterface___block_invoke;
  block[3] = &unk_1E69BD2D8;
  block[4] = self;
  id v21 = v17;
  unint64_t v22 = a3;
  unint64_t v23 = a4;
  unint64_t v24 = a6;
  unint64_t v25 = a7;
  unint64_t v26 = a8;
  unint64_t v27 = a9;
  unint64_t v28 = a10;
  id v19 = v17;
  dispatch_async(internalQueue, block);
}

uint64_t __34__WiFiUsageMonitor_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(WiFiUsageMonitor);
  uint64_t v2 = sharedInstance_sharedWiFiUsageMonitor;
  sharedInstance_sharedWiFiUsageMonitor = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v2, v1);
}

- (WiFiUsageMonitor)init
{
  v32.receiver = self;
  v32.super_class = (Class)WiFiUsageMonitor;
  id v2 = [(WiFiUsageMonitor *)&v32 init];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = (void *)*((void *)v2 + 5);
  *((void *)v2 + 5) = v3;

  *((void *)v2 + 41) = getpid();
  *((void *)v2 + 42) = 0;
  *((unsigned char *)v2 + 36) = 0;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = (void *)*((void *)v2 + 13);
  *((void *)v2 + 13) = v5;

  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v8 = (void *)*((void *)v2 + 14);
  *((void *)v2 + 14) = v7;

  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  id v10 = (void *)*((void *)v2 + 15);
  *((void *)v2 + 15) = v9;

  uint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v12 = dispatch_queue_create("com.apple.wifi.usage-monitor", v11);
  uint64_t v13 = (void *)*((void *)v2 + 18);
  *((void *)v2 + 18) = v12;

  *((_WORD *)v2 + 16) = 0;
  uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
  id v15 = (void *)*((void *)v2 + 26);
  *((void *)v2 + 26) = v14;

  *((void *)v2 + 35) = 0x7FFFFFFFFFFFFFFFLL;
  id v16 = [[WiFiSoftError alloc] initWithName:@"Trigger Disconnect"];
  id v17 = (void *)*((void *)v2 + 36);
  *((void *)v2 + 36) = v16;

  long long v18 = [[WiFiSoftError alloc] initWithName:@"Cellular Fallback"];
  id v19 = (void *)*((void *)v2 + 37);
  *((void *)v2 + 37) = v18;

  long long v20 = (void *)*((void *)v2 + 10);
  *((void *)v2 + 10) = 0;

  objc_initWeak(&location, v2);
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  unint64_t v28 = __24__WiFiUsageMonitor_init__block_invoke;
  long long v29 = &unk_1E69BCDB0;
  objc_copyWeak(&v30, &location);
  uint64_t v21 = MEMORY[0x1D94403E0](&v26);
  unint64_t v22 = (void *)*((void *)v2 + 27);
  *((void *)v2 + 27) = v21;

  dispatch_async(*((dispatch_queue_t *)v2 + 18), &__block_literal_global_252);
  unint64_t v23 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v26, v27, v28, v29);
  [v23 addObserver:v2 selector:sel_faultEventDetected_ name:@"SessionNotificationFaultEventDetected" object:0];

  unint64_t v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v24 addObserver:v2 selector:sel_brokenLinkDetected_ name:@"SessionNotificationBrokenLinkDetected" object:0];

  [v2 getMobileAssets];
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
  return (WiFiUsageMonitor *)v2;
}

void __24__WiFiUsageMonitor_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if ([v3 canSubmitToCA])
  {
    uint64_t v14 = WeakRetained;
    [v3 summary];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v18 = v28 = 0u;
    obuint64_t j = [v18 allKeys];
    uint64_t v17 = [obj countByEnumeratingWithState:&v25 objects:v36 count:16];
    if (v17)
    {
      uint64_t v16 = *(void *)v26;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = v5;
          uint64_t v6 = *(void *)(*((void *)&v25 + 1) + 8 * v5);
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v7 = [v18 objectForKeyedSubscript:v6];
            uint64_t v8 = [v7 count];
            *(_DWORD *)buf = 136315650;
            long long v31 = "-[WiFiUsageMonitor init]_block_invoke";
            __int16 v32 = 2112;
            uint64_t v33 = v6;
            __int16 v34 = 2048;
            uint64_t v35 = v8;
            _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: calling AnalyticsSendEventLazy for LQM window analysis as %@ (%lu metrics)", buf, 0x20u);
          }
          long long v23 = 0u;
          long long v24 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          uint64_t v9 = [v18 objectForKeyedSubscript:v6];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v22;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v22 != v12) {
                  objc_enumerationMutation(v9);
                }
                id v20 = v3;
                AnalyticsSendEventLazy();
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }
            while (v11);
          }

          uint64_t v5 = v19 + 1;
        }
        while (v19 + 1 != v17);
        uint64_t v17 = [obj countByEnumeratingWithState:&v25 objects:v36 count:16];
      }
      while (v17);
    }

    WeakRetained = v14;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v31 = "-[WiFiUsageMonitor init]_block_invoke_2";
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - not submitting this analysis to CA (downsampled)", buf, 0xCu);
  }
  [WeakRetained[26] removeObject:v3];
}

uint64_t __24__WiFiUsageMonitor_init__block_invoke_246(uint64_t a1)
{
  return [*(id *)(a1 + 32) metricCallbackForMetric:*(void *)(a1 + 40) AndField:*(void *)(a1 + 48)];
}

void __24__WiFiUsageMonitor_init__block_invoke_250()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v0 = objc_opt_class();
    id v1 = v0;
    int v3 = 136315650;
    uint64_t v4 = "-[WiFiUsageMonitor init]_block_invoke";
    __int16 v5 = 2112;
    uint64_t v6 = v0;
    __int16 v7 = 2112;
    id v8 = (id)objc_opt_class();
    id v2 = v8;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: started configuration of %@ and %@", (uint8_t *)&v3, 0x20u);
  }
}

- (void)faultEventDetected:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __int16 v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"SessionNotificationFaultType"];

  __int16 v7 = [v4 userInfo];

  id v8 = [v7 objectForKeyedSubscript:@"SessionNotificationInterfaceName"];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    uint64_t v10 = "-[WiFiUsageMonitor faultEventDetected:]";
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: fault event %@ detected on interface %@", (uint8_t *)&v9, 0x20u);
  }
  if (v6 && v8) {
    -[WiFiUsageMonitor addFaultEvent:forInterface:](self, "addFaultEvent:forInterface:", (int)[v6 intValue], v8);
  }
}

- (void)brokenLinkDetected:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__WiFiUsageMonitor_brokenLinkDetected___block_invoke;
  v7[3] = &unk_1E69BC8B0;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __39__WiFiUsageMonitor_brokenLinkDetected___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) userInfo];
  int v3 = [v2 objectForKeyedSubscript:@"SessionNotificationBrokenLinkReason"];

  id v4 = [*(id *)(a1 + 32) userInfo];
  __int16 v5 = [v4 objectForKeyedSubscript:@"SessionNotificationInterfaceName"];

  if (*(void *)(*(void *)(a1 + 40) + 160))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315650;
      __int16 v11 = "-[WiFiUsageMonitor brokenLinkDetected:]_block_invoke";
      __int16 v12 = 2112;
      __int16 v13 = v3;
      __int16 v14 = 2112;
      uint64_t v15 = v5;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: handling broken link with reason %@ detected on interface %@", (uint8_t *)&v10, 0x20u);
    }
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 160);
    id v8 = [v6 userInfo];
    int v9 = [v8 objectForKeyedSubscript:@"SessionNotificationBrokenLinkReason"];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);
  }
}

- (void)initializeDeviceLockState:(BOOL)a3 displayState:(BOOL)a4 motionState:(id)a5 callState:(BOOL)a6 mediaState:(BOOL)a7 chargingState:(BOOL)a8 companionConnectionState:(BOOL)a9 andSecondaryInterfaceName:(id)a10 compatibilityMode:(BOOL)a11 badLinkRssi:(int64_t)a12 goodLinkRssi:(int64_t)a13
{
  BOOL v13 = a8;
  BOOL v14 = a7;
  BOOL v15 = a6;
  BOOL v17 = a4;
  BOOL v18 = a3;
  id v21 = a10;
  id v20 = a5;
  [(WiFiUsageMonitor *)self setDeviceLockState:v18];
  [(WiFiUsageMonitor *)self setDisplayState:v17];
  [(WiFiUsageMonitor *)self setMotionState:v20];

  [(WiFiUsageMonitor *)self setCallState:v15];
  [(WiFiUsageMonitor *)self setMediaState:v14];
  [(WiFiUsageMonitor *)self setDeviceChargingState:v13];
  [(WiFiUsageMonitor *)self setCompanionConnectionState:a9];
  [(WiFiUsageMonitor *)self setCompatibilityModeEnabled:a11];
  [(WiFiUsageMonitor *)self setTdLogic_badRssiThreshold:a12];
  [(WiFiUsageMonitor *)self setTdLogic_goodRssiThreshold:a13];
  [(WiFiUsageMonitor *)self setSecondaryInterfaceName:v21];
}

- (void)setCompletionHandler:(id)a3 withContext:(void *)a4 onQueue:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__WiFiUsageMonitor_setCompletionHandler_withContext_onQueue___block_invoke;
  v13[3] = &unk_1E69BCDD8;
  id v15 = v8;
  uint64_t v16 = a4;
  void v13[4] = self;
  id v14 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(internalQueue, v13);
}

void __61__WiFiUsageMonitor_setCompletionHandler_withContext_onQueue___block_invoke(void *a1)
{
  uint64_t v2 = MEMORY[0x1D94403E0](a1[6]);
  uint64_t v3 = a1[4];
  id v4 = *(void **)(v3 + 152);
  *(void *)(v3 + 152) = v2;

  *(void *)(a1[4] + 168) = a1[7];
  __int16 v5 = (void *)a1[5];
  id v6 = (id *)(a1[4] + 176);

  objc_storeStrong(v6, v5);
}

- (void)setFaultEventHandler:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__WiFiUsageMonitor_setFaultEventHandler___block_invoke;
  v7[3] = &unk_1E69BCE00;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __41__WiFiUsageMonitor_setFaultEventHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 160) = MEMORY[0x1D94403E0](*(void *)(a1 + 40));

  return MEMORY[0x1F41817F8]();
}

- (void)startMonitoringWiFiInterface:(id)a3 withLinkSessionOnly:(BOOL)a4
{
  id v6 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__WiFiUsageMonitor_startMonitoringWiFiInterface_withLinkSessionOnly___block_invoke;
  block[3] = &unk_1E69BCE78;
  id v10 = v6;
  id v11 = self;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

void __69__WiFiUsageMonitor_startMonitoringWiFiInterface_withLinkSessionOnly___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 104) allKeys];
    uint64_t v3 = v2;
    if (*(void *)(a1 + 32) && (objc_msgSend(v2, "containsObject:") & 1) == 0)
    {
      id v4 = [[WiFiUsageInterfaceCapabilities alloc] initWithInterfaceName:*(void *)(a1 + 32)];
      [*(id *)(*(void *)(a1 + 40) + 136) setValue:v4 forKey:*(void *)(a1 + 32)];
      __int16 v5 = [MEMORY[0x1E4F1CA48] array];
      id v6 = [[WiFiUsageLinkSession alloc] initWithInterfaceName:*(void *)(a1 + 32) andCapabilities:v4];
      uint64_t v7 = v6;
      if (*(unsigned char *)(*(void *)(a1 + 40) + 33)) {
        [(WiFiUsageSession *)v6 enableXCTestNotifications];
      }
      [v5 addObject:v7];
      long long v25 = v7;
      if (!*(unsigned char *)(a1 + 48))
      {
        long long v26 = [[WiFiUsageDeviceSession alloc] initWithInterfaceName:*(void *)(a1 + 32) andCapabilities:v4];
        id v8 = [[WiFiUsageNetworkSession alloc] initWithInterfaceName:*(void *)(a1 + 32) andCapabilities:v4];
        id v9 = [[WiFiUsageApplicationSession alloc] initWithInterfaceName:*(void *)(a1 + 32) andCapabilities:v4];
        id v10 = [[WiFiUsageSoftApSession alloc] initWithInterfaceName:*(void *)(a1 + 32) andCapabilities:v4];
        id v11 = [[WiFiUsageBatterySaveSession alloc] initWithInterfaceName:*(void *)(a1 + 32) andCapabilities:v4];
        BOOL v12 = [[WiFiUsageRealTimeCoexSession alloc] initWithInterfaceName:*(void *)(a1 + 32) andCapabilities:v4];
        BOOL v13 = [[WiFiUsagePoorLinkSession alloc] initWithInterfaceName:*(void *)(a1 + 32) andCapabilities:v4 onQueue:*(void *)(*(void *)(a1 + 40) + 144)];
        if (*(unsigned char *)(*(void *)(a1 + 40) + 33))
        {
          [(WiFiUsageSession *)v26 enableXCTestNotifications];
          if (*(unsigned char *)(*(void *)(a1 + 40) + 33))
          {
            [(WiFiUsageSession *)v8 enableXCTestNotifications];
            if (*(unsigned char *)(*(void *)(a1 + 40) + 33))
            {
              [(WiFiUsageSession *)v9 enableXCTestNotifications];
              if (*(unsigned char *)(*(void *)(a1 + 40) + 33))
              {
                [(WiFiUsageSession *)v10 enableXCTestNotifications];
                if (*(unsigned char *)(*(void *)(a1 + 40) + 33))
                {
                  [(WiFiUsageSession *)v11 enableXCTestNotifications];
                  if (*(unsigned char *)(*(void *)(a1 + 40) + 33))
                  {
                    [(WiFiUsageSession *)v12 enableXCTestNotifications];
                    if (*(unsigned char *)(*(void *)(a1 + 40) + 33)) {
                      [(WiFiUsageSession *)v13 enableXCTestNotifications];
                    }
                  }
                }
              }
            }
          }
        }
        objc_msgSend(v5, "addObject:", v26, v3);
        [v5 addObject:v8];
        [v5 addObject:v9];
        [v5 addObject:v10];
        [v5 addObject:v11];
        [v5 addObject:v12];
        [v5 addObject:v13];

        uint64_t v3 = v24;
      }
      long long v27 = v4;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v14 = v5;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v31 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            v28[0] = MEMORY[0x1E4F143A8];
            v28[1] = 3221225472;
            v28[2] = __69__WiFiUsageMonitor_startMonitoringWiFiInterface_withLinkSessionOnly___block_invoke_269;
            v28[3] = &unk_1E69BCE50;
            uint64_t v29 = *(void *)(a1 + 40);
            [v19 setCompletionHandler:v28 withContext:v29 onQueue:*(void *)(v29 + 144)];
            [v19 systemWakeStateDidChange:1 wokenByWiFi:0];
            [v19 lockStateDidChange:*(unsigned __int8 *)(*(void *)(a1 + 40) + 9)];
            [v19 displayStateDidChange:*(unsigned __int8 *)(*(void *)(a1 + 40) + 10)];
            [v19 motionStateDidChange:*(void *)(*(void *)(a1 + 40) + 48)];
            [v19 callStateDidChange:*(unsigned __int8 *)(*(void *)(a1 + 40) + 13)];
            [v19 mediaStateDidChange:*(unsigned __int8 *)(*(void *)(a1 + 40) + 14)];
            [v19 chargingStateDidChange:*(unsigned __int8 *)(*(void *)(a1 + 40) + 11)];
            [v19 companionStateDidChange:*(unsigned __int8 *)(*(void *)(a1 + 40) + 12)];
            [v19 secondaryInterfaceNameDidChange:*(void *)(*(void *)(a1 + 40) + 88)];
            [v19 setPrivacyRestrictionDisabled:*(unsigned __int8 *)(*(void *)(a1 + 40) + 32)];
            [v19 setProcessInitTime:*(void *)(*(void *)(a1 + 40) + 40)];
            objc_msgSend(v19, "tdLogic_badRssi:goodRSSI:", *(void *)(*(void *)(a1 + 40) + 64), *(void *)(*(void *)(a1 + 40) + 72));
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v16);
      }

      [*(id *)(*(void *)(a1 + 40) + 104) setValue:v14 forKey:*(void *)(a1 + 32)];
      [*(id *)(*(void *)(a1 + 40) + 112) setValue:v25 forKey:*(void *)(a1 + 32)];
      if (*(unsigned char *)(*(void *)(a1 + 40) + 33))
      {
        id v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
        id v21 = [MEMORY[0x1E4F28EA0] notificationWithName:@"interface usage session was set" object:0];
        [v20 postNotification:v21];
      }
      long long v22 = [[WiFiUsageLQMRollingWindow alloc] initWithInterfaceName:*(void *)(a1 + 32) andInterfaceCapabilities:v27];
      [(WiFiUsageLQMRollingWindow *)v22 configureDataTriggeredCriteria];
      [*(id *)(*(void *)(a1 + 40) + 120) setObject:v22 forKey:*(void *)(a1 + 32)];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    long long v36 = "-[WiFiUsageMonitor startMonitoringWiFiInterface:withLinkSessionOnly:]_block_invoke";
    __int16 v37 = 2112;
    uint64_t v38 = v23;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName:%@", buf, 0x16u);
  }
}

void __69__WiFiUsageMonitor_startMonitoringWiFiInterface_withLinkSessionOnly___block_invoke_269(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  if ([v6 type] == 9)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v8 = [v7 usageSessions];
    id v9 = [v6 interfaceName];
    id v10 = [v8 objectForKeyedSubscript:v9];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if ([v14 type] != 9 && objc_msgSend(v14, "isSessionActive")) {
            [v14 poorLinkSessionStats:v6];
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v11);
    }
  }
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v15 = *(void *)(a1 + 32);
  if (!*(void *)(v15 + 152)) {
    goto LABEL_16;
  }
  if (!*(void *)(v15 + 176)) {
    goto LABEL_16;
  }
  uint64_t v16 = (void *)MEMORY[0x1D9440170]();
  uint64_t v17 = *(void *)(a1 + 32);
  BOOL v18 = *(NSObject **)(v17 + 176);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__WiFiUsageMonitor_startMonitoringWiFiInterface_withLinkSessionOnly___block_invoke_2;
  block[3] = &unk_1E69BCE28;
  long long v26 = &v27;
  void block[4] = v17;
  id v25 = v6;
  dispatch_sync(v18, block);

  if (!*((unsigned char *)v28 + 24))
  {
LABEL_16:
    uint64_t v19 = (void *)MEMORY[0x1D9440170]();
    [v7 submitAnalytics:v6];
  }
  id v20 = +[WiFiSoftApUsageMonitor sharedInstance];
  if (v20)
  {
    BOOL v21 = [v6 type] == 6;

    if (v21)
    {
      long long v22 = +[WiFiSoftApUsageMonitor sharedInstance];
      uint64_t v23 = [v6 sessionSummary:0];
      [v22 updateStats:v23];
    }
  }
  _Block_object_dispose(&v27, 8);
}

void __69__WiFiUsageMonitor_startMonitoringWiFiInterface_withLinkSessionOnly___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 152);
  uint64_t v4 = *(void *)(v2 + 168);
  uint64_t v5 = [*(id *)(a1 + 40) type];
  id v6 = [*(id *)(a1 + 40) sessionSummary:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, id))(v3 + 16))(v3, v4, v5, v6);
}

- (void)setPrivacyRestrictionDisabled:(BOOL)a3
{
  self->_privacyRestrictionDisabled = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__WiFiUsageMonitor_setPrivacyRestrictionDisabled___block_invoke;
  block[3] = &unk_1E69BC8D8;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

void __50__WiFiUsageMonitor_setPrivacyRestrictionDisabled___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v19 + 1) + 8 * v6);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v16;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v16 != v11) {
                objc_enumerationMutation(v8);
              }
              [*(id *)(*((void *)&v15 + 1) + 8 * v12++) setPrivacyRestrictionDisabled:*(unsigned __int8 *)(*(void *)(a1 + 32) + 32)];
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v4);
  }

  if (*(unsigned char *)(*(void *)(a1 + 32) + 33))
  {
    BOOL v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v14 = [MEMORY[0x1E4F28EA0] notificationWithName:@"setPrivacyRestrictionDisabled" object:0];
    [v13 postNotification:v14];
  }
}

- (void)setSystemWakeState:(BOOL)a3 wokenByWiFi:(BOOL)a4
{
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__WiFiUsageMonitor_setSystemWakeState_wokenByWiFi___block_invoke;
  v5[3] = &unk_1E69BCEA0;
  v5[4] = self;
  BOOL v6 = a3;
  BOOL v7 = a4;
  dispatch_async(internalQueue, v5);
}

void __51__WiFiUsageMonitor_setSystemWakeState_wokenByWiFi___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 8) != v2)
  {
    *(unsigned char *)(v1 + 8) = v2;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v22;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v10 = v9;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v18;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v18 != v13) {
                  objc_enumerationMutation(v10);
                }
                [*(id *)(*((void *)&v17 + 1) + 8 * v14++) systemWakeStateDidChange:*(unsigned __int8 *)(*(void *)(a1 + 32) + 8) wokenByWiFi:*(unsigned __int8 *)(a1 + 41)];
              }
              while (v12 != v14);
              uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }
            while (v12);
          }

          ++v8;
        }
        while (v8 != v6);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v6);
    }

    uint64_t v1 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v1 + 33))
  {
    long long v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    long long v16 = [MEMORY[0x1E4F28EA0] notificationWithName:@"setSystemWakeState" object:0];
    [v15 postNotification:v16];
  }
}

- (void)setDeviceLockState:(BOOL)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__WiFiUsageMonitor_setDeviceLockState___block_invoke;
  v4[3] = &unk_1E69BC930;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(internalQueue, v4);
}

void __39__WiFiUsageMonitor_setDeviceLockState___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 9) != v2)
  {
    *(unsigned char *)(v1 + 9) = v2;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v25;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * v8);
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v10 = v9;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v21;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v21 != v13) {
                  objc_enumerationMutation(v10);
                }
                [*(id *)(*((void *)&v20 + 1) + 8 * v14++) lockStateDidChange:*(unsigned __int8 *)(*(void *)(a1 + 32) + 9)];
              }
              while (v12 != v14);
              uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v12);
          }

          ++v8;
        }
        while (v8 != v6);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v6);
    }

    uint64_t v1 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v1 + 9) && !*(void *)(v1 + 344) && *(void *)(v1 + 328) <= 0x64uLL)
    {
      uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v16 = *(void *)(a1 + 32);
      long long v17 = *(void **)(v16 + 344);
      *(void *)(v16 + 344) = v15;

      uint64_t v1 = *(void *)(a1 + 32);
    }
  }
  if (*(unsigned char *)(v1 + 33))
  {
    long long v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    long long v19 = [MEMORY[0x1E4F28EA0] notificationWithName:@"DeviceLockState" object:0];
    [v18 postNotification:v19];
  }
}

- (void)setDisplayState:(BOOL)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__WiFiUsageMonitor_setDisplayState___block_invoke;
  v4[3] = &unk_1E69BC930;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(internalQueue, v4);
}

void __36__WiFiUsageMonitor_setDisplayState___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 10) != v2)
  {
    *(unsigned char *)(v1 + 10) = v2;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v22;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v10 = v9;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v18;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v18 != v13) {
                  objc_enumerationMutation(v10);
                }
                [*(id *)(*((void *)&v17 + 1) + 8 * v14++) displayStateDidChange:*(unsigned __int8 *)(*(void *)(a1 + 32) + 10)];
              }
              while (v12 != v14);
              uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }
            while (v12);
          }

          ++v8;
        }
        while (v8 != v6);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v6);
    }

    uint64_t v1 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v1 + 33))
  {
    uint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v16 = [MEMORY[0x1E4F28EA0] notificationWithName:@"setDisplayState" object:0];
    [v15 postNotification:v16];
  }
}

- (void)setMotionState:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__WiFiUsageMonitor_setMotionState___block_invoke;
  v7[3] = &unk_1E69BC8B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __35__WiFiUsageMonitor_setMotionState___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(*(void *)(a1 + 32) + 48) isEqualToString:*(void *)(a1 + 40)] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    int v2 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v20;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v20 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void **)(*((void *)&v19 + 1) + 8 * v6);
          long long v15 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          id v8 = v7;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v16;
            do
            {
              uint64_t v12 = 0;
              do
              {
                if (*(void *)v16 != v11) {
                  objc_enumerationMutation(v8);
                }
                [*(id *)(*((void *)&v15 + 1) + 8 * v12++) motionStateDidChange:*(void *)(a1 + 40)];
              }
              while (v10 != v12);
              uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
            }
            while (v10);
          }

          ++v6;
        }
        while (v6 != v4);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v4);
    }
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 33))
  {
    uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v14 = [MEMORY[0x1E4F28EA0] notificationWithName:@"setMotionState" object:0];
    [v13 postNotification:v14];
  }
}

- (void)setSmartCoverState:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__WiFiUsageMonitor_setSmartCoverState___block_invoke;
  v7[3] = &unk_1E69BC8B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __39__WiFiUsageMonitor_setSmartCoverState___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v2 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v19 + 1) + 8 * v6);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v16;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v16 != v11) {
                objc_enumerationMutation(v8);
              }
              [*(id *)(*((void *)&v15 + 1) + 8 * v12++) smartCoverStateDidChange:*(void *)(a1 + 40)];
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v4);
  }

  if (*(unsigned char *)(*(void *)(a1 + 32) + 33))
  {
    uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v14 = [MEMORY[0x1E4F28EA0] notificationWithName:@"setSmartCoverState" object:0];
    [v13 postNotification:v14];
  }
}

- (void)setCallState:(BOOL)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__WiFiUsageMonitor_setCallState___block_invoke;
  v4[3] = &unk_1E69BC930;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(internalQueue, v4);
}

void __33__WiFiUsageMonitor_setCallState___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 13) != v2)
  {
    *(unsigned char *)(v1 + 13) = v2;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v48 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          id v10 = v9;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v43 objects:v52 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v44;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v44 != v13) {
                  objc_enumerationMutation(v10);
                }
                [*(id *)(*((void *)&v43 + 1) + 8 * j) callStateDidChange:*(unsigned __int8 *)(*(void *)(a1 + 32) + 13)];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v43 objects:v52 count:16];
            }
            while (v12);
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v47 objects:v53 count:16];
      }
      while (v6);
    }

    uint64_t v15 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v15 + 13))
    {
      uint64_t v16 = [MEMORY[0x1E4F1C9C8] now];
      uint64_t v17 = *(void *)(a1 + 32);
      long long v18 = *(void **)(v17 + 224);
      *(void *)(v17 + 224) = v16;

      uint64_t v15 = *(void *)(a1 + 32);
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    obuint64_t j = [*(id *)(v15 + 120) allValues];
    uint64_t v36 = [obj countByEnumeratingWithState:&v39 objects:v51 count:16];
    if (v36)
    {
      uint64_t v35 = *(void *)v40;
      do
      {
        for (uint64_t k = 0; k != v36; ++k)
        {
          if (*(void *)v40 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v39 + 1) + 8 * k);
          long long v21 = *(unsigned char **)(a1 + 32);
          if (v21[13]) {
            long long v22 = @"Call Start";
          }
          else {
            long long v22 = @"Call End";
          }
          long long v23 = [v21 canStartLQMAnalysisforTrigger:@"InCall" andReason:v22 onWindow:*(void *)(*((void *)&v39 + 1) + 8 * k)];
          if (v23)
          {
            long long v24 = *(unsigned __int8 **)(a1 + 32);
            uint64_t v37 = v24[13];
            uint64_t v25 = v24[15];
            uint64_t v26 = v24[16];
            uint64_t v27 = [WiFiUsageLQMWindowAnalysisInCall alloc];
            uint64_t v28 = *(void *)(a1 + 32);
            if (*(unsigned char *)(v28 + 13)) {
              uint64_t v29 = @"Call Start";
            }
            else {
              uint64_t v29 = @"Call End";
            }
            [*(id *)(v28 + 224) timeIntervalSinceNow];
            unint64_t v38 = v38 & 0xFFFFFFFFFF000000 | v37 | (v25 << 8) | (v26 << 16);
            long long v31 = -[WiFiUsageLQMWindowAnalysisInCall initWithRollingWindow:andCallStatus:andCallDuration:andContext:andTimestamp:onQueue:](v27, "initWithRollingWindow:andCallStatus:andCallDuration:andContext:andTimestamp:onQueue:", v20, v29, -v30);
            [*(id *)(a1 + 32) startLQMAnalysis:v31];
          }
        }
        uint64_t v36 = [obj countByEnumeratingWithState:&v39 objects:v51 count:16];
      }
      while (v36);
    }

    uint64_t v1 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v1 + 33))
  {
    long long v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
    long long v33 = [MEMORY[0x1E4F28EA0] notificationWithName:@"setCallState" object:0];
    [v32 postNotification:v33];
  }
}

- (void)setMediaState:(BOOL)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__WiFiUsageMonitor_setMediaState___block_invoke;
  v4[3] = &unk_1E69BC930;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(internalQueue, v4);
}

void __34__WiFiUsageMonitor_setMediaState___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 14) != v2)
  {
    *(unsigned char *)(v1 + 14) = v2;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v22;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v10 = v9;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v18;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v18 != v13) {
                  objc_enumerationMutation(v10);
                }
                [*(id *)(*((void *)&v17 + 1) + 8 * v14++) mediaStateDidChange:*(unsigned __int8 *)(*(void *)(a1 + 32) + 14)];
              }
              while (v12 != v14);
              uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }
            while (v12);
          }

          ++v8;
        }
        while (v8 != v6);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v6);
    }

    uint64_t v1 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v1 + 33))
  {
    uint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v16 = [MEMORY[0x1E4F28EA0] notificationWithName:@"setMediaState" object:0];
    [v15 postNotification:v16];
  }
}

- (void)setCompanionConnectionState:(BOOL)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__WiFiUsageMonitor_setCompanionConnectionState___block_invoke;
  v4[3] = &unk_1E69BC930;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(internalQueue, v4);
}

void __48__WiFiUsageMonitor_setCompanionConnectionState___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 12) != v2)
  {
    *(unsigned char *)(v1 + 12) = v2;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
          long long v15 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          id v10 = v9;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v16;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v16 != v13) {
                  objc_enumerationMutation(v10);
                }
                [*(id *)(*((void *)&v15 + 1) + 8 * v14++) companionStateDidChange:*(unsigned __int8 *)(*(void *)(a1 + 32) + 12)];
              }
              while (v12 != v14);
              uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
            }
            while (v12);
          }

          ++v8;
        }
        while (v8 != v6);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v6);
    }
  }
}

- (void)setCompatibilityModeEnabled:(BOOL)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__WiFiUsageMonitor_setCompatibilityModeEnabled___block_invoke;
  v4[3] = &unk_1E69BC930;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(internalQueue, v4);
}

void __48__WiFiUsageMonitor_setCompatibilityModeEnabled___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 28) != v2)
  {
    *(unsigned char *)(v1 + 28) = v2;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v10 = v9;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v18;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v18 != v13) {
                  objc_enumerationMutation(v10);
                }
                long long v15 = *(void **)(*((void *)&v17 + 1) + 8 * j);
                [v15 updateWithCompatibilityMode:*(unsigned __int8 *)(a1 + 40)];
                if ([v15 type] == 4)
                {
                  long long v16 = [v15 currentBssSession];
                  [v16 updateWithCompatibilityMode:*(unsigned __int8 *)(a1 + 40)];
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }
            while (v12);
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v6);
    }
  }
}

- (void)setSecondaryInterfaceName:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__WiFiUsageMonitor_setSecondaryInterfaceName___block_invoke;
  v7[3] = &unk_1E69BC8B0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __46__WiFiUsageMonitor_setSecondaryInterfaceName___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 88);
    if (v3)
    {
      if (objc_msgSend(v3, "isEqualToString:"))
      {
LABEL_20:
        if (*(unsigned char *)(*(void *)(a1 + 40) + 33))
        {
          long long v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
          long long v19 = [MEMORY[0x1E4F28EA0] notificationWithName:@"secondary interface name set" object:0];
          [v18 postNotification:v19];
        }
        return;
      }
      uint64_t v1 = *(void **)(a1 + 32);
    }
    uint64_t v4 = [v1 copy];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v4;

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 104) allValues];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v13 = v12;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v21;
            do
            {
              uint64_t v17 = 0;
              do
              {
                if (*(void *)v21 != v16) {
                  objc_enumerationMutation(v13);
                }
                [*(id *)(*((void *)&v20 + 1) + 8 * v17++) secondaryInterfaceNameDidChange:*(void *)(*(void *)(a1 + 40) + 88)];
              }
              while (v15 != v17);
              uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v15);
          }

          ++v11;
        }
        while (v11 != v9);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v9);
    }

    goto LABEL_20;
  }
}

- (void)updateLQMWindowCriteria
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__WiFiUsageMonitor_updateLQMWindowCriteria__block_invoke;
  block[3] = &unk_1E69BC8D8;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

void __43__WiFiUsageMonitor_updateLQMWindowCriteria__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v1 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "allValues", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) configureDataTriggeredCriteria];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)setJoinEvent:(BOOL)a3 withReason:(unint64_t)a4 lastDisconnectReason:(unint64_t)a5 lastJoinFailure:(int64_t)a6 andNetworkDetails:(id)a7 forInterface:(id)a8
{
  id v14 = a7;
  id v15 = a8;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__WiFiUsageMonitor_setJoinEvent_withReason_lastDisconnectReason_lastJoinFailure_andNetworkDetails_forInterface___block_invoke;
  block[3] = &unk_1E69BCEF0;
  void block[4] = self;
  id v20 = v15;
  BOOL v25 = a3;
  id v21 = v14;
  unint64_t v22 = a4;
  unint64_t v23 = a5;
  int64_t v24 = a6;
  id v17 = v14;
  id v18 = v15;
  dispatch_async(internalQueue, block);
}

void __112__WiFiUsageMonitor_setJoinEvent_withReason_lastDisconnectReason_lastJoinFailure_andNetworkDetails_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "valueForKey:", *(void *)(a1 + 40), 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v39;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v39 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v38 + 1) + 8 * v7);
        int v9 = *(unsigned __int8 *)(a1 + 80);
        if (*(unsigned char *)(a1 + 80))
        {
          uint64_t v1 = [*(id *)(a1 + 48) networkName];
          uint64_t v10 = v1;
        }
        else
        {
          uint64_t v10 = 0;
        }
        [v8 joinStateDidChange:v10 withReason:*(void *)(a1 + 56) lastDisconnectReason:*(void *)(a1 + 64) lastJoinFailure:*(void *)(a1 + 72) andNetworkDetails:*(void *)(a1 + 48)];
        if (v9) {

        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v5);
  }

  if (*(unsigned char *)(*(void *)(a1 + 32) + 33))
  {
    uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v12 = [MEMORY[0x1E4F28EA0] notificationWithName:@"SetJoinEvent" object:0];
    [v11 postNotification:v12];
  }
  if (*(unsigned char *)(a1 + 80))
  {
    id v13 = [*(id *)(*(void *)(a1 + 32) + 120) objectForKey:*(void *)(a1 + 40)];
    id v14 = *(void **)(a1 + 32);
    id v15 = +[WiFiUsageSession joinReasonString:*(void *)(a1 + 56)];
    uint64_t v16 = [v14 canStartLQMAnalysisforTrigger:@"Join" andReason:v15 onWindow:v13];

    if (v16)
    {
      id v17 = *(unsigned __int8 **)(a1 + 32);
      uint64_t v18 = v17[13];
      uint64_t v19 = v17[15];
      uint64_t v20 = v17[16];
      id v21 = [WiFiUsageLQMWindowAnalysisJoin alloc];
      unint64_t v22 = [*(id *)(*(void *)(a1 + 32) + 120) objectForKey:*(void *)(a1 + 40)];
      unint64_t v23 = +[WiFiUsageSession joinReasonString:*(void *)(a1 + 56)];
      int64_t v24 = [(WiFiUsageLQMWindowAnalysisJoin *)v21 initWithRollingWindow:v22 andReasonString:v23 andContext:v18 | (v19 << 8) | (v20 << 16) andTimestamp:v16 onQueue:*(void *)(*(void *)(a1 + 32) + 144)];

      [*(id *)(a1 + 32) startLQMAnalysis:v24];
    }
    uint64_t v25 = *(void *)(a1 + 32);
    if (*(void *)(v25 + 328) <= 0x64uLL)
    {
      if (*(void *)(v25 + 408) || *(void *)(v25 + 448))
      {
        *(unsigned char *)(v25 + 36) = 1;
      }
      else
      {
        ++*(void *)(v25 + 336);
        uint64_t v26 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v27 = *(void *)(a1 + 32);
        uint64_t v28 = *(void **)(v27 + 352);
        *(void *)(v27 + 352) = v26;

        uint64_t v29 = NSNumber;
        +[WiFiUsagePrivacyFilter timeSinceBootInSeconds];
        uint64_t v30 = objc_msgSend(v29, "numberWithDouble:");
        uint64_t v31 = *(void *)(a1 + 32);
        long long v32 = *(void **)(v31 + 360);
        *(void *)(v31 + 360) = v30;

        uint64_t v33 = *(void *)(a1 + 32);
        if (*(void *)(v33 + 344))
        {
          long long v34 = NSNumber;
          objc_msgSend(*(id *)(v33 + 352), "timeIntervalSinceDate:");
          uint64_t v35 = objc_msgSend(v34, "numberWithDouble:");
          uint64_t v36 = *(void *)(a1 + 32);
          uint64_t v37 = *(void **)(v36 + 368);
          *(void *)(v36 + 368) = v35;
        }
      }
    }
  }
}

- (void)setForgetNetworkEvent:(id)a3 forInterface:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl())
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__WiFiUsageMonitor_setForgetNetworkEvent_forInterface___block_invoke;
    block[3] = &unk_1E69BCEC8;
    id v10 = v6;
    uint64_t v11 = self;
    id v12 = v7;
    dispatch_async(internalQueue, block);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v14 = "-[WiFiUsageMonitor setForgetNetworkEvent:forInterface:]";
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s Do Nothing as WiFiDirectDonation Feature Flag Disabled! details:%@", buf, 0x16u);
  }
}

void __55__WiFiUsageMonitor_setForgetNetworkEvent_forInterface___block_invoke(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = a1[4];
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "-[WiFiUsageMonitor setForgetNetworkEvent:forInterface:]_block_invoke";
    __int16 v16 = 2112;
    uint64_t v17 = v2;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s details:%@", buf, 0x16u);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)(a1[5] + 104), "valueForKey:", a1[6], 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v8 type] == 3) {
          [v8 processForgetNetwork:a1[4]];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)setLinkEvent:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7 forInterface:(id)a8
{
  id v14 = a7;
  id v15 = a8;
  internalQueue = self->_internalQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __116__WiFiUsageMonitor_setLinkEvent_isInvoluntary_linkChangeReason_linkChangeSubreason_withNetworkDetails_forInterface___block_invoke;
  v19[3] = &unk_1E69BCF18;
  v19[4] = self;
  id v20 = v15;
  BOOL v24 = a3;
  BOOL v25 = a4;
  id v21 = v14;
  int64_t v22 = a5;
  int64_t v23 = a6;
  id v17 = v14;
  id v18 = v15;
  dispatch_async(internalQueue, v19);
}

void __116__WiFiUsageMonitor_setLinkEvent_isInvoluntary_linkChangeReason_linkChangeSubreason_withNetworkDetails_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 112) objectForKey:*(void *)(a1 + 40)];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = @"YES";
    uint64_t v4 = *(void *)(a1 + 48);
    if (!*(unsigned char *)(a1 + 72)) {
      uint64_t v3 = @"NO";
    }
    *(_DWORD *)buf = 136315651;
    double v70 = "-[WiFiUsageMonitor setLinkEvent:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:forInter"
          "face:]_block_invoke";
    __int16 v71 = 2112;
    long long v72 = v3;
    __int16 v73 = 2113;
    uint64_t v74 = v4;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - isUp:%@ details:%{private}@", buf, 0x20u);
  }
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(id *)(a1 + 48);
    id v7 = *(void **)(v5 + 264);
    *(void *)(v5 + 264) = v6;
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v7 = *(void **)(v8 + 264);
    *(void *)(v8 + 264) = 0;
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v9 = [*(id *)(*(void *)(a1 + 32) + 104) valueForKey:*(void *)(a1 + 40)];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v64 objects:v68 count:16];
  uint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = *(void *)v65;
    uint64_t v13 = v10;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v65 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v64 + 1) + 8 * i) linkStateDidChange:*(unsigned __int8 *)(a1 + 72) isInvoluntary:*(unsigned __int8 *)(a1 + 73) linkChangeReason:*(void *)(a1 + 56) linkChangeSubreason:*(void *)(a1 + 64) withNetworkDetails:*(void *)(a1 + 48)];
      }
      uint64_t v13 = [v9 countByEnumeratingWithState:&v64 objects:v68 count:16];
    }
    while (v13);
  }

  if (*(unsigned char *)(*(void *)(a1 + 32) + 33))
  {
    id v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    __int16 v16 = [MEMORY[0x1E4F28EA0] notificationWithName:@"SetLinkEvent" object:0];
    [v15 postNotification:v16];
  }
  if (!v11)
  {
LABEL_32:
    if (!*(unsigned char *)(a1 + 72))
    {
      if (v2)
      {
        [v2 sessionDuration];
        double v42 = v41;
      }
      else
      {
        double v42 = 9.22337204e18;
      }
      uint64_t v43 = [*(id *)(a1 + 48) connectedBss];
      long long v44 = [v43 bssid];
      +[WiFiUsageAccessPointProfile updateWithAssocTime:v44 forBssid:v42];

      if (!*(unsigned char *)(a1 + 72)) {
        goto LABEL_41;
      }
    }
    goto LABEL_37;
  }
  if (!*(unsigned char *)(a1 + 72))
  {
    if (*(void *)(a1 + 40))
    {
      id v17 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "objectForKey:");
      id v18 = *(void **)(a1 + 32);
      uint64_t v19 = +[WiFiUsageSession disconnectReasonString:*(void *)(a1 + 56)];
      id v20 = [v18 canStartLQMAnalysisforTrigger:@"LinkDown" andReason:v19 onWindow:v17];

      if (v20)
      {
        id v21 = *(unsigned __int8 **)(a1 + 32);
        uint64_t v63 = v21[13];
        uint64_t v62 = v21[15];
        uint64_t v22 = v21[16];
        int64_t v23 = [WiFiUsageLQMWindowAnalysisLinkDown alloc];
        BOOL v24 = [*(id *)(*(void *)(a1 + 32) + 120) objectForKey:*(void *)(a1 + 40)];
        int v25 = *(unsigned __int8 *)(a1 + 73);
        uint64_t v26 = *(void *)(a1 + 56);
        uint64_t v27 = *(void *)(a1 + 64);
        if (v2)
        {
          [v2 sessionDuration];
          unint64_t v29 = (unint64_t)v28;
        }
        else
        {
          unint64_t v29 = 0x8000000000000000;
        }
        uint64_t v31 = [(WiFiUsageLQMWindowAnalysisLinkDown *)v23 initWithRollingWindow:v24 WithIsInvoluntary:v25 != 0 AndLinkChangeReason:v26 AndLinkChangeSubreason:v27 AndDuration:v29 andContext:v63 | (v62 << 8) | (v22 << 16) AndTimestamp:v20 onQueue:*(void *)(*(void *)(a1 + 32) + 144)];

        [*(id *)(a1 + 32) startLQMAnalysis:v31];
      }
      if (v17)
      {
        long long v32 = [v17 triggerCriteriaFilterList];
        uint64_t v33 = [v32 count];

        if (v33)
        {
          if ([v17 endOngoingCriteria])
          {
            long long v34 = *(unsigned __int8 **)(a1 + 32);
            uint64_t v35 = v34[13];
            uint64_t v36 = v34[15];
            uint64_t v37 = v34[16];
            long long v38 = [WiFiUsageLQMWindowAnalysisDataTriggered alloc];
            long long v39 = [MEMORY[0x1E4F1C9C8] now];
            long long v40 = [(WiFiUsageLQMWindowAnalysisDataTriggered *)v38 initWithRollingWindow:v17 andSubReason:@"LinkDown" andContext:v35 | (v36 << 8) | (v37 << 16) andTimestamp:v39 onQueue:*(void *)(*(void *)(a1 + 32) + 144)];

            [*(id *)(a1 + 32) startLQMAnalysis:v40];
            [v17 cleanUpStashedMedians];
            [v17 clearOngoingCriteriaDates];
          }
        }
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = *(__CFString **)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      double v70 = "-[WiFiUsageMonitor setLinkEvent:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:forInt"
            "erface:]_block_invoke";
      __int16 v71 = 2112;
      long long v72 = v30;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName:%@", buf, 0x16u);
    }
    goto LABEL_32;
  }
LABEL_37:
  uint64_t v45 = *(void *)(a1 + 32);
  if (*(void *)(v45 + 328) <= 0x64uLL)
  {
    if (*(void *)(v45 + 408) || *(void *)(v45 + 448))
    {
      *(unsigned char *)(v45 + 36) = 1;
    }
    else
    {
      uint64_t v46 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v47 = *(void *)(a1 + 32);
      long long v48 = *(void **)(v47 + 376);
      *(void *)(v47 + 376) = v46;

      long long v49 = NSNumber;
      +[WiFiUsagePrivacyFilter timeSinceBootInSeconds];
      uint64_t v50 = objc_msgSend(v49, "numberWithDouble:");
      uint64_t v51 = *(void *)(a1 + 32);
      BOOL v52 = *(void **)(v51 + 384);
      *(void *)(v51 + 384) = v50;

      uint64_t v53 = *(void *)(a1 + 32);
      if (*(void *)(v53 + 344))
      {
        uint64_t v54 = NSNumber;
        objc_msgSend(*(id *)(v53 + 376), "timeIntervalSinceDate:");
        uint64_t v55 = objc_msgSend(v54, "numberWithDouble:");
        uint64_t v56 = *(void *)(a1 + 32);
        long long v57 = *(void **)(v56 + 392);
        *(void *)(v56 + 392) = v55;

        uint64_t v53 = *(void *)(a1 + 32);
      }
      if (*(void *)(v53 + 352))
      {
        long long v58 = NSNumber;
        objc_msgSend(*(id *)(v53 + 376), "timeIntervalSinceDate:");
        uint64_t v59 = objc_msgSend(v58, "numberWithDouble:");
        uint64_t v60 = *(void *)(a1 + 32);
        long long v61 = *(void **)(v60 + 400);
        *(void *)(v60 + 400) = v59;
      }
    }
  }
LABEL_41:
}

+ (void)appendTDStateToDict:(id)a3 from:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  uint64_t v8 = NSNumber;
  if (!v6)
  {
    uint64_t v10 = [NSNumber numberWithBool:0];
    uint64_t v11 = @"TD_inTDEval";
LABEL_18:
    [v5 setObject:v10 forKeyedSubscript:v11];

    goto LABEL_19;
  }
  if ([v6 isSessionActive]) {
    uint64_t v9 = [v7 isInTDEval];
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v12 = [v8 numberWithBool:v9];
  [v5 setObject:v12 forKeyedSubscript:@"TD_inTDEval"];

  if ([v7 isSessionActive])
  {
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "tdConfirmed"));
    [v5 setObject:v13 forKeyedSubscript:@"TD_Triggered"];

    if ([v7 isLastDecisionStateValid])
    {
      id v14 = NSNumber;
      objc_msgSend(v7, "last_DecisionState");
      id v15 = [v14 numberWithBool:v104];
      [v5 setObject:v15 forKeyedSubscript:@"TD_Decision_TxPER"];

      __int16 v16 = NSNumber;
      objc_msgSend(v7, "last_DecisionState");
      id v17 = [v16 numberWithBool:v103];
      [v5 setObject:v17 forKeyedSubscript:@"TD_Decision_FWTxPER"];

      id v18 = NSNumber;
      objc_msgSend(v7, "last_DecisionState");
      uint64_t v19 = [v18 numberWithBool:v102];
      [v5 setObject:v19 forKeyedSubscript:@"TD_Decision_BeaconPER"];

      id v20 = NSNumber;
      objc_msgSend(v7, "last_DecisionState");
      id v21 = [v20 numberWithBool:v101];
      [v5 setObject:v21 forKeyedSubscript:@"TD_Decision_GatewayARPFailure"];

      uint64_t v22 = NSNumber;
      objc_msgSend(v7, "last_DecisionState");
      int64_t v23 = [v22 numberWithBool:v100];
      [v5 setObject:v23 forKeyedSubscript:@"TD_Decision_SymptomsDNSError"];

      BOOL v24 = NSNumber;
      objc_msgSend(v7, "last_DecisionState");
      int v25 = [v24 numberWithBool:v99];
      [v5 setObject:v25 forKeyedSubscript:@"TD_Decision_AutoLeave"];

      uint64_t v26 = NSNumber;
      objc_msgSend(v7, "last_DecisionState");
      uint64_t v27 = [v26 numberWithBool:v98];
      [v5 setObject:v27 forKeyedSubscript:@"TD_Decision_ActiveProbe"];

      double v28 = NSNumber;
      objc_msgSend(v7, "last_DecisionState");
      unint64_t v29 = [v28 numberWithBool:v97];
      [v5 setObject:v29 forKeyedSubscript:@"TD_Decision_FastTD"];

      uint64_t v30 = NSNumber;
      objc_msgSend(v7, "last_DecisionState");
      uint64_t v31 = [v30 numberWithInteger:v96];
      [v5 setObject:v31 forKeyedSubscript:@"TD_AutoLeaveRSSIthreshold"];
    }
    if ([v7 isLastFastTdVotesValid])
    {
      long long v32 = NSNumber;
      objc_msgSend(v7, "last_FastTdVotes");
      long long v34 = [v32 numberWithBool:v33 & 1];
      [v5 setObject:v34 forKeyedSubscript:@"TD_VoteFastTD_LinkRecommendation"];

      uint64_t v35 = NSNumber;
      objc_msgSend(v7, "last_FastTdVotes");
      uint64_t v37 = [v35 numberWithBool:(v36 >> 8) & 1];
      [v5 setObject:v37 forKeyedSubscript:@"TD_VoteFastTD_TXPER"];

      long long v38 = NSNumber;
      objc_msgSend(v7, "last_FastTdVotes");
      long long v40 = [v38 numberWithBool:(v39 >> 24) & 1];
      [v5 setObject:v40 forKeyedSubscript:@"TD_VoteFastTD_FWTXPER"];

      double v41 = NSNumber;
      objc_msgSend(v7, "last_FastTdVotes");
      uint64_t v43 = [v41 numberWithBool:(v42 >> 16) & 1];
      [v5 setObject:v43 forKeyedSubscript:@"TD_VoteFastTD_BeaconPER"];

      long long v44 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "last_FastTdVotes"));
      [v5 setObject:v44 forKeyedSubscript:@"TD_VoteFastTD_VoteCount"];

      uint64_t v45 = NSNumber;
      objc_msgSend(v7, "last_FastTdVotes");
      uint64_t v47 = [v45 numberWithBool:HIDWORD(v46) & 1];
      [v5 setObject:v47 forKeyedSubscript:@"TD_StateFastTD_RTApp"];

      long long v48 = NSNumber;
      objc_msgSend(v7, "last_FastTdVotes");
      uint64_t v50 = [v48 numberWithBool:(v49 >> 40) & 1];
      [v5 setObject:v50 forKeyedSubscript:@"TD_StateFastTD_Cheap5G"];
    }
    uint64_t v51 = objc_msgSend(v7, "lastTDEval_ConfirmedAt");
    if (v51)
    {
      BOOL v52 = (void *)v51;
      int v53 = [v7 isLastSuppressStateValid];

      if (v53)
      {
        uint64_t v54 = objc_msgSend(NSNumber, "numberWithBool:", ((unint64_t)objc_msgSend(v7, "last_SuppressState") >> 24) & 1);
        [v5 setObject:v54 forKeyedSubscript:@"TD_Suppress_SymptomsNODataStall"];

        uint64_t v55 = objc_msgSend(NSNumber, "numberWithBool:", ((unint64_t)objc_msgSend(v7, "last_SuppressState") >> 32) & 1);
        [v5 setObject:v55 forKeyedSubscript:@"TD_Suppress_SymptomsAppPolicy"];

        uint64_t v56 = objc_msgSend(NSNumber, "numberWithBool:", ((unint64_t)objc_msgSend(v7, "last_SuppressState") >> 40) & 1);
        [v5 setObject:v56 forKeyedSubscript:@"TD_Suppress_FastCheapCellular"];

        long long v57 = objc_msgSend(NSNumber, "numberWithBool:", ((unint64_t)objc_msgSend(v7, "last_SuppressState") >> 48) & 1);
        [v5 setObject:v57 forKeyedSubscript:@"TD_Suppress_2dBGuard"];

        long long v58 = objc_msgSend(NSNumber, "numberWithBool:", ((unint64_t)objc_msgSend(v7, "last_SuppressState") >> 56) & 1);
        [v5 setObject:v58 forKeyedSubscript:@"TD_Suppress_NoFGnetwApp"];

        uint64_t v59 = NSNumber;
        objc_msgSend(v7, "last_SuppressState");
        long long v61 = [v59 numberWithBool:v60 & 1];
        [v5 setObject:v61 forKeyedSubscript:@"TD_Suppress_TTR"];

        uint64_t v62 = NSNumber;
        objc_msgSend(v7, "last_SuppressState");
        long long v64 = [v62 numberWithBool:(v63 >> 8) & 1];
        [v5 setObject:v64 forKeyedSubscript:@"TD_Suppress_UserInput"];

        long long v65 = NSNumber;
        objc_msgSend(v7, "last_SuppressState");
        long long v67 = [v65 numberWithBool:(v66 >> 16) & 1];
        [v5 setObject:v67 forKeyedSubscript:@"TD_Suppress_GoodAfterRoam"];

        v68 = NSNumber;
        objc_msgSend(v7, "last_SuppressState");
        double v70 = [v68 numberWithBool:(v69 >> 24) & 1];
        [v5 setObject:v70 forKeyedSubscript:@"TD_Suppress_ActiveProbing"];

        __int16 v71 = NSNumber;
        objc_msgSend(v7, "last_SuppressState");
        __int16 v73 = [v71 numberWithBool:HIDWORD(v72) & 1];
        [v5 setObject:v73 forKeyedSubscript:@"TD_Suppress_Roam"];
      }
    }
    if ([v7 isLastDecisionStateValid])
    {
      objc_msgSend(v7, "last_DecisionState");
      uint64_t v74 = +[WiFiUsagePrivacyFilter getLabelForTDMode:v95];
      [v5 setObject:v74 forKeyedSubscript:@"TD_Mode"];

      uint64_t v75 = NSNumber;
      objc_msgSend(v7, "last_DecisionState");
      long long v76 = [v75 numberWithBool:v94];
      [v5 setObject:v76 forKeyedSubscript:@"TD_EdgeBSS"];

      long long v77 = NSNumber;
      objc_msgSend(v7, "last_DecisionState");
      long long v78 = [v77 numberWithBool:v93];
      [v5 setObject:v78 forKeyedSubscript:@"TD_MotionDetected"];

      long long v79 = NSNumber;
      objc_msgSend(v7, "last_DecisionState");
      v80 = [v79 numberWithBool:v92];
      [v5 setObject:v80 forKeyedSubscript:@"TD_WalkoutDetected"];

      v81 = NSNumber;
      objc_msgSend(v7, "last_DecisionState");
      v82 = [v81 numberWithBool:v91];
      [v5 setObject:v82 forKeyedSubscript:@"TD_WaitForRoam"];

      v83 = NSNumber;
      objc_msgSend(v7, "last_DecisionState");
      __int16 v84 = [v83 numberWithBool:v90];
      [v5 setObject:v84 forKeyedSubscript:@"TD_AppsUsingWiFi"];

      uint64_t v85 = NSNumber;
      objc_msgSend(v7, "last_DecisionState");
      uint64_t v86 = [v85 numberWithBool:v89];
      [v5 setObject:v86 forKeyedSubscript:@"TD_monitorOnly"];
    }
    if ([v7 isLastSuppressStateValid])
    {
      v87 = objc_msgSend(NSNumber, "numberWithBool:", ((unint64_t)objc_msgSend(v7, "last_SuppressState") >> 16) & 1);
      [v5 setObject:v87 forKeyedSubscript:@"TD_FastTDEvaluation"];

      v88 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "last_SuppressState") & 1);
      [v5 setObject:v88 forKeyedSubscript:@"TD_AggressiveTD"];

      uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", ((unint64_t)objc_msgSend(v7, "last_SuppressState") >> 8) & 1);
      uint64_t v11 = @"TD_RNF_allowed";
      goto LABEL_18;
    }
  }
LABEL_19:
}

- (void)appendUsbStatsToDict:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [NSNumber numberWithBool:self->_isAnyUsbInserted];
  [v4 setObject:v5 forKeyedSubscript:@"isUsbInserted"];

  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSArray count](self->_usbDevices, "count"));
  [v4 setObject:v6 forKeyedSubscript:@"usbDevicesCount"];

  if ([(NSArray *)self->_usbDevices count])
  {
    uint64_t v7 = [(NSArray *)self->_usbDevices firstObject];
    uint64_t v8 = +[WiFiUsagePrivacyFilter getLabelForUsbVendor:](WiFiUsagePrivacyFilter, "getLabelForUsbVendor:", [(id)v7 vid]);
    [v4 setObject:v8 forKeyedSubscript:@"usbVendor"];

    uint64_t v9 = [v4 objectForKeyedSubscript:@"usbVendor"];
    LOBYTE(v7) = [v9 isEqualToString:@"Other"];

    if ((v7 & 1) == 0)
    {
      uint64_t v10 = NSNumber;
      uint64_t v11 = [(NSArray *)self->_usbDevices firstObject];
      uint64_t v12 = objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "vid"));
      [v4 setObject:v12 forKeyedSubscript:@"usbVendorID"];
    }
  }
  int v25 = v4;
  uint64_t v13 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = self->_usbDevices;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    char v17 = 0;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v14);
        }
        id v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v20 vidIsApple]) {
          char v17 = [v20 vidIsApple];
        }
        id v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v20, "controllerID"));
        [v13 addObject:v21];
      }
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v16);
  }
  else
  {
    char v17 = 0;
  }

  uint64_t v22 = [NSNumber numberWithBool:v17 & 1];
  [v25 setObject:v22 forKeyedSubscript:@"isAnyUSBDeviceVendorApple"];

  if ([v13 count] == 1)
  {
    int64_t v23 = [v13 anyObject];
    [v25 setObject:v23 forKeyedSubscript:@"usbController"];
  }
  if ([(NSArray *)self->_usbDevices count] && self->_noiseDeltaUponUSBInsertion != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v24 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v25 setObject:v24 forKeyedSubscript:@"noiseDeltaUponUSBInsertion"];
  }
}

- (void)appendBTStatsToDict:(id)a3
{
  id v4 = NSNumber;
  BOOL inActiveSco = self->_inActiveSco;
  id v6 = a3;
  uint64_t v7 = [v4 numberWithBool:inActiveSco];
  [v6 setObject:v7 forKeyedSubscript:@"isSCOActive"];

  uint64_t v8 = [NSNumber numberWithBool:self->_inActiveA2dp];
  [v6 setObject:v8 forKeyedSubscript:@"isA2dpActive"];

  uint64_t v9 = [NSNumber numberWithBool:self->_inActiveCall];
  [v6 setObject:v9 forKeyedSubscript:@"inCall"];

  if (self->_curBTAudioBand) {
    uint64_t v10 = @"5";
  }
  else {
    uint64_t v10 = @"2.4";
  }
  [v6 setObject:v10 forKeyedSubscript:@"BTBand"];
  uint64_t v11 = [NSNumber numberWithBool:self->_inActiveUniAoS];
  [v6 setObject:v11 forKeyedSubscript:@"isUniAoSActive"];

  id v12 = [NSNumber numberWithBool:self->_inActiveBiAoS];
  [v6 setObject:v12 forKeyedSubscript:@"isBiAoSActive"];
}

- (void)updateBeaconInfo:(id)a3 andParsedIE:(id)a4 forInterface:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = (void *)[v8 copy];
    id v12 = (void *)[v9 copy];
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__WiFiUsageMonitor_updateBeaconInfo_andParsedIE_forInterface___block_invoke;
    block[3] = &unk_1E69BCF68;
    id v17 = v8;
    id v18 = v11;
    id v19 = v12;
    id v20 = self;
    id v21 = v10;
    id v14 = v12;
    id v15 = v11;
    dispatch_async(internalQueue, block);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int64_t v23 = "-[WiFiUsageMonitor updateBeaconInfo:andParsedIE:forInterface:]";
    __int16 v24 = 2112;
    uint64_t v25 = 0;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

void __62__WiFiUsageMonitor_updateBeaconInfo_andParsedIE_forInterface___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    uint64_t v2 = +[WiFiUsageAccessPointProfile profileFromBeaconData:a1[5] andParsedIE:a1[6]];
  }
  else
  {
    uint64_t v2 = 0;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)(a1[7] + 104), "valueForKey:", a1[8], 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v8 isSessionActive]) {
          [v8 updateApProfile:v2];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)updateWPSInfo:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__WiFiUsageMonitor_updateWPSInfo___block_invoke;
  block[3] = &unk_1E69BC8D8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, block);
}

uint64_t __34__WiFiUsageMonitor_updateWPSInfo___block_invoke(uint64_t a1)
{
  return +[WiFiUsageAccessPointProfile updateWithWPS:*(void *)(a1 + 32)];
}

- (void)setPowerBudget:(int64_t)a3 andThermalIndex:(int64_t)a4 forInterface:(id)a5
{
  id v8 = a5;
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__WiFiUsageMonitor_setPowerBudget_andThermalIndex_forInterface___block_invoke;
  v11[3] = &unk_1E69BCF90;
  id v12 = v8;
  uint64_t v13 = self;
  int64_t v14 = a3;
  int64_t v15 = a4;
  id v10 = v8;
  dispatch_async(internalQueue, v11);
}

void __64__WiFiUsageMonitor_setPowerBudget_andThermalIndex_forInterface___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v2 = [*(id *)(a1[5] + 104) valueForKey:0];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v11;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v6++) powerBudgetDidChange:a1[6] andThermalIndex:a1[7]];
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v4);
    }

    if (*(unsigned char *)(a1[5] + 33))
    {
      uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v8 = [MEMORY[0x1E4F28EA0] notificationWithName:@"SetPowerBudgetAndThermalIndex" object:0];
      [v7 postNotification:v8];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = a1[4];
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[WiFiUsageMonitor setPowerBudget:andThermalIndex:forInterface:]_block_invoke";
    __int16 v17 = 2112;
    uint64_t v18 = v9;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)setBluetoothState:(BOOL)a3 connectedDeviceCount:(unint64_t)a4 inA2dp:(BOOL)a5 inSco:(BOOL)a6 inUniAoS:(BOOL)a7 inBiAoS:(BOOL)a8 btAudioBand:(BOOL)a9
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__WiFiUsageMonitor_setBluetoothState_connectedDeviceCount_inA2dp_inSco_inUniAoS_inBiAoS_btAudioBand___block_invoke;
  block[3] = &unk_1E69BCFB8;
  BOOL v11 = a5;
  BOOL v12 = a6;
  void block[4] = self;
  void block[5] = a4;
  BOOL v13 = a7;
  BOOL v14 = a8;
  BOOL v15 = a9;
  BOOL v16 = a3;
  dispatch_async(internalQueue, block);
}

void __101__WiFiUsageMonitor_setBluetoothState_connectedDeviceCount_inA2dp_inSco_inUniAoS_inBiAoS_btAudioBand___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(a1 + 48);
  if (*(unsigned __int8 *)(v2 + 15) != v3
    || *(unsigned __int8 *)(v2 + 16) != *(unsigned __int8 *)(a1 + 49)
    || *(void *)(v2 + 56) != *(void *)(a1 + 40)
    || *(unsigned __int8 *)(v2 + 17) != *(unsigned __int8 *)(a1 + 50)
    || *(unsigned __int8 *)(v2 + 18) != *(unsigned __int8 *)(a1 + 51)
    || *(unsigned __int8 *)(v2 + 19) != *(unsigned __int8 *)(a1 + 52))
  {
    *(unsigned char *)(v2 + 15) = v3;
    uint64_t v4 = *(void *)(a1 + 40);
    *(unsigned char *)(*(void *)(a1 + 32) + 16) = *(unsigned char *)(a1 + 49);
    *(void *)(*(void *)(a1 + 32) + 56) = v4;
    *(unsigned char *)(*(void *)(a1 + 32) + 17) = *(unsigned char *)(a1 + 50);
    *(unsigned char *)(*(void *)(a1 + 32) + 18) = *(unsigned char *)(a1 + 51);
    *(unsigned char *)(*(void *)(a1 + 32) + 19) = *(unsigned char *)(a1 + 52);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          id v11 = v10;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v20;
            do
            {
              uint64_t v15 = 0;
              do
              {
                if (*(void *)v20 != v14) {
                  objc_enumerationMutation(v11);
                }
                LOBYTE(v18) = *(unsigned char *)(a1 + 52);
                [*(id *)(*((void *)&v19 + 1) + 8 * v15++) bluetoothStateDidChange:*(unsigned __int8 *)(a1 + 53) connectedDeviceCount:*(void *)(a1 + 40) inA2dp:*(unsigned __int8 *)(a1 + 48) inSco:*(unsigned __int8 *)(a1 + 49) inUniAoS:*(unsigned __int8 *)(a1 + 50) inBiAoS:*(unsigned __int8 *)(a1 + 51) btAudioBand:v18];
              }
              while (v13 != v15);
              uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v13);
          }

          ++v9;
        }
        while (v9 != v7);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v2 + 33))
  {
    BOOL v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    __int16 v17 = [MEMORY[0x1E4F28EA0] notificationWithName:@"SetBluetoothStateAndConnectedDeviceCountAndInA2dpAndInSco" object:0];
    [v16 postNotification:v17];
  }
}

- (void)setAwdlState:(BOOL)a3 inMode:(int64_t)a4
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__WiFiUsageMonitor_setAwdlState_inMode___block_invoke;
  block[3] = &unk_1E69BCFE0;
  BOOL v6 = a3;
  void block[4] = self;
  void block[5] = a4;
  dispatch_async(internalQueue, block);
}

void __40__WiFiUsageMonitor_setAwdlState_inMode___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  int v3 = *(unsigned __int8 *)(a1 + 48);
  if (v2[20] != v3)
  {
    v2[20] = v3;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          id v10 = v9;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v19;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v19 != v13) {
                  objc_enumerationMutation(v10);
                }
                [*(id *)(*((void *)&v18 + 1) + 8 * j) awdlStateDidChange:*(unsigned __int8 *)(a1 + 48) inMode:*(void *)(a1 + 40)];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
            }
            while (v12);
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v6);
    }

    uint64_t v2 = *(unsigned char **)(a1 + 32);
    if (v2[20])
    {
      uint64_t v15 = [v2 rangingSession];
      [v15 rangingLinkUp];

      uint64_t v2 = *(unsigned char **)(a1 + 32);
    }
  }
  if (v2[33])
  {
    BOOL v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    __int16 v17 = [MEMORY[0x1E4F28EA0] notificationWithName:@"setAwdlState" object:0];
    [v16 postNotification:v17];
  }
}

- (void)setSoftApState:(BOOL)a3 requester:(id)a4 status:(id)a5 changeReason:(id)a6 channelNumber:(unint64_t)a7 countryCode:(unint64_t)a8 isHidden:(BOOL)a9 isInfraConnected:(BOOL)a10 isAwdlUp:(BOOL)a11 lowPowerModeDuration:(double)a12 compatibilityMode:(BOOL)a13 requestToUpLatency:(double)a14
{
  id v21 = a4;
  id v22 = a5;
  id v23 = a6;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __184__WiFiUsageMonitor_setSoftApState_requester_status_changeReason_channelNumber_countryCode_isHidden_isInfraConnected_isAwdlUp_lowPowerModeDuration_compatibilityMode_requestToUpLatency___block_invoke;
  block[3] = &unk_1E69BD008;
  BOOL v37 = a3;
  void block[4] = self;
  id v30 = v21;
  id v31 = v22;
  id v32 = v23;
  unint64_t v33 = a7;
  unint64_t v34 = a8;
  BOOL v38 = a9;
  BOOL v39 = a10;
  BOOL v40 = a11;
  BOOL v41 = a13;
  double v35 = a12;
  double v36 = a14;
  id v25 = v23;
  id v26 = v22;
  id v27 = v21;
  dispatch_async(internalQueue, block);
}

void __184__WiFiUsageMonitor_setSoftApState_requester_status_changeReason_channelNumber_countryCode_isHidden_isInfraConnected_isAwdlUp_lowPowerModeDuration_compatibilityMode_requestToUpLatency___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v18 + 1) + 8 * v6);
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v15;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v15 != v11) {
                objc_enumerationMutation(v8);
              }
              LODWORD(v13) = *(_DWORD *)(a1 + 97);
              objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12++), "softApStateDidChange:requester:status:changeReason:channelNumber:countryCode:isHidden:isInfraConnected:isAwdlUp:lowPowerModeDuration:compatibilityMode:requestToUpLatency:", *(unsigned __int8 *)(a1 + 96), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), v13);
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }
}

- (void)addSoftApClientEvent:(BOOL)a3 identifier:(id)a4 isAppleClient:(BOOL)a5 isInstantHotspot:(BOOL)a6 isAutoHotspot:(BOOL)a7 isHidden:(BOOL)a8
{
  id v14 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__WiFiUsageMonitor_addSoftApClientEvent_identifier_isAppleClient_isInstantHotspot_isAutoHotspot_isHidden___block_invoke;
  block[3] = &unk_1E69BD030;
  BOOL v19 = a3;
  void block[4] = self;
  id v18 = v14;
  BOOL v20 = a5;
  BOOL v21 = a6;
  BOOL v22 = a7;
  BOOL v23 = a8;
  id v16 = v14;
  dispatch_async(internalQueue, block);
}

void __106__WiFiUsageMonitor_addSoftApClientEvent_identifier_isAppleClient_isInstantHotspot_isAutoHotspot_isHidden___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v15;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v15 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * j);
              if ([v13 type] == 6) {
                [v13 addSoftApClientEvent:*(unsigned __int8 *)(a1 + 48) identifier:*(void *)(a1 + 40) isAppleClient:*(unsigned __int8 *)(a1 + 49) isInstantHotspot:*(unsigned __int8 *)(a1 + 50) isAutoHotspot:*(unsigned __int8 *)(a1 + 51) isHidden:*(unsigned __int8 *)(a1 + 52)];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
          }
          while (v10);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }
}

- (void)addSoftApCoexEvent:(unint64_t)a3 deniedUnii1ChannelMap:(unint64_t)a4 deniedUnii2aChannelMap:(unint64_t)a5 deniedUnii2cChannelMap:(unint64_t)a6 deniedUnii3ChannelMap:(unint64_t)a7
{
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __129__WiFiUsageMonitor_addSoftApCoexEvent_deniedUnii1ChannelMap_deniedUnii2aChannelMap_deniedUnii2cChannelMap_deniedUnii3ChannelMap___block_invoke;
  v8[3] = &unk_1E69BD058;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  v8[7] = a5;
  v8[8] = a6;
  v8[9] = a7;
  dispatch_async(internalQueue, v8);
}

void __129__WiFiUsageMonitor_addSoftApCoexEvent_deniedUnii1ChannelMap_deniedUnii2aChannelMap_deniedUnii2cChannelMap_deniedUnii3ChannelMap___block_invoke(void *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v2 = [*(id *)(a1[4] + 104) allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v15;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v15 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * j);
              if ([v13 type] == 6) {
                [v13 addSoftApCoexEvent:a1[5] deniedUnii1ChannelMap:a1[6] deniedUnii2aChannelMap:a1[7] deniedUnii2cChannelMap:a1[8] deniedUnii3ChannelMap:a1[9]];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
          }
          while (v10);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }
}

- (void)setRoamingState:(BOOL)a3 withReason:(unint64_t)a4 asString:(id)a5 andStatus:(unint64_t)a6 asString:(id)a7 andLatency:(unint64_t)a8 andRoamData:(id)a9 andPingPongSequence:(id)a10 forInterface:(id)a11
{
  id v16 = a5;
  id v17 = a7;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __131__WiFiUsageMonitor_setRoamingState_withReason_asString_andStatus_asString_andLatency_andRoamData_andPingPongSequence_forInterface___block_invoke;
  block[3] = &unk_1E69BD080;
  id v29 = v19;
  id v30 = self;
  BOOL v38 = a3;
  unint64_t v35 = a4;
  unint64_t v36 = a6;
  unint64_t v37 = a8;
  id v31 = v20;
  id v32 = v18;
  id v33 = v16;
  id v34 = v17;
  id v22 = v17;
  id v23 = v16;
  id v24 = v18;
  id v25 = v20;
  id v26 = v19;
  dispatch_async(internalQueue, block);
}

void __131__WiFiUsageMonitor_setRoamingState_withReason_asString_andStatus_asString_andLatency_andRoamData_andPingPongSequence_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32)) {
    uint64_t v2 = [[WiFiUsageSessionPingPongStats alloc] initWithPingPongSequence:*(void *)(a1 + 32)];
  }
  else {
    uint64_t v2 = 0;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = *(unsigned __int8 *)(a1 + 104);
  if (*(unsigned __int8 *)(v3 + 21) == v4)
  {
    uint64_t v5 = 0;
    goto LABEL_21;
  }
  *(unsigned char *)(v3 + 21) = v4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 40) + 104) valueForKey:*(void *)(a1 + 48)];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v7)
  {
    uint64_t v5 = 0;
LABEL_20:

    goto LABEL_21;
  }
  uint64_t v8 = v7;
  uint64_t v5 = 0;
  uint64_t v9 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      [v11 roamingStateDidChange:*(unsigned __int8 *)(a1 + 104) reason:*(void *)(a1 + 80) andStatus:*(void *)(a1 + 88) andLatency:*(void *)(a1 + 96) andRoamData:*(void *)(a1 + 56) andPingPongStats:v2];
      if ([v11 type] == 4)
      {
        uint64_t v12 = [v11 currentBssSession];

        uint64_t v5 = (void *)v12;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v8);

  if (!v4)
  {
    uint64_t v6 = [*(id *)(*(void *)(a1 + 40) + 120) objectForKey:*(void *)(a1 + 48)];
    uint64_t v13 = [*(id *)(a1 + 40) canStartLQMAnalysisforTrigger:@"Roaming" andReason:*(void *)(a1 + 64) onWindow:v6];
    if (v13)
    {
      uint64_t v14 = *(void *)(a1 + 40);
      long long v15 = [[WiFiUsageLQMWindowAnalysisRoaming alloc] initWithRollingWindow:v6 WithRoamingState:*(unsigned __int8 *)(a1 + 104) andReasonString:*(void *)(a1 + 64) andStatus:*(void *)(a1 + 88) asString:*(void *)(a1 + 72) andLatency:*(void *)(a1 + 96) andRoamData:*(void *)(a1 + 56) andCurrentBSSSession:v5 andContext:*(unsigned __int8 *)(v14 + 13) | ((unint64_t)*(unsigned __int8 *)(v14 + 15) << 8) | ((unint64_t)*(unsigned __int8 *)(v14 + 16) << 16) andPingPongStats:v2 andTimestamp:v13 onQueue:*(void *)(v14 + 144)];
      [*(id *)(a1 + 40) startLQMAnalysis:v15];
    }
    goto LABEL_20;
  }
LABEL_21:
  objc_msgSend(v5, "roamingStateDidChange:reason:andStatus:andLatency:andRoamData:andPingPongNth:", *(unsigned __int8 *)(a1 + 104), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 56), -[WiFiUsageSessionPingPongStats pingPongNth](v2, "pingPongNth") != 0);
  if (*(unsigned char *)(*(void *)(a1 + 40) + 33))
  {
    id v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v17 = [MEMORY[0x1E4F28EA0] notificationWithName:@"setRoamingState" object:0];
    [v16 postNotification:v17];
  }
}

- (void)setRoamingARCriteria:(id *)a3 forInterface:(id)a4
{
  id v6 = a4;
  internalQueue = self->_internalQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__WiFiUsageMonitor_setRoamingARCriteria_forInterface___block_invoke;
  v10[3] = &unk_1E69BD0A8;
  id v11 = v6;
  uint64_t v12 = self;
  long long v8 = *(_OWORD *)&a3->var5;
  long long v13 = *(_OWORD *)&a3->var0;
  long long v14 = v8;
  id v9 = v6;
  dispatch_async(internalQueue, v10);
}

void __54__WiFiUsageMonitor_setRoamingARCriteria_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 104) valueForKey:0];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v12;
      id v6 = (_OWORD *)(a1 + 48);
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v2);
          }
          long long v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
          long long v9 = v6[1];
          *(_OWORD *)buf = *v6;
          *(_OWORD *)&buf[16] = v9;
          [v8 roamingARConfigurationDidChange:buf];
          ++v7;
        }
        while (v4 != v7);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v4);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[WiFiUsageMonitor setRoamingARCriteria:forInterface:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)setRoamingConfiguration:(int64_t)a3 withChannelList:(id)a4 forInterface:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__WiFiUsageMonitor_setRoamingConfiguration_withChannelList_forInterface___block_invoke;
  v13[3] = &unk_1E69BCCE0;
  id v14 = v9;
  long long v15 = self;
  id v16 = v8;
  int64_t v17 = a3;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(internalQueue, v13);
}

void __73__WiFiUsageMonitor_setRoamingConfiguration_withChannelList_forInterface___block_invoke(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v2 = [*(id *)(a1[5] + 104) valueForKey:0];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * v6++) roamingConfigurationDidChange:a1[7] withChannelList:a1[6]];
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = a1[4];
    *(_DWORD *)buf = 136315394;
    id v14 = "-[WiFiUsageMonitor setRoamingConfiguration:withChannelList:forInterface:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)updateRoamCache:(id)a3 forInterface:(id)a4
{
  id v5 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__WiFiUsageMonitor_updateRoamCache_forInterface___block_invoke;
  block[3] = &unk_1E69BC8D8;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(internalQueue, block);
}

void __49__WiFiUsageMonitor_updateRoamCache_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = 136315394;
    uint64_t v4 = "-[WiFiUsageMonitor updateRoamCache:forInterface:]_block_invoke";
    __int16 v5 = 2112;
    uint64_t v6 = v2;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", (uint8_t *)&v3, 0x16u);
  }
}

- (void)updateBeaconCache:(id)a3 afterRoamAttempt:(id)a4 whileCurrentBSSID:(id)a5 forInterface:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__WiFiUsageMonitor_updateBeaconCache_afterRoamAttempt_whileCurrentBSSID_forInterface___block_invoke;
  block[3] = &unk_1E69BCF68;
  id v20 = v13;
  id v21 = v11;
  id v22 = v12;
  id v23 = v10;
  id v24 = self;
  id v15 = v10;
  id v16 = v12;
  id v17 = v11;
  id v18 = v13;
  dispatch_async(internalQueue, block);
}

void __86__WiFiUsageMonitor_updateBeaconCache_afterRoamAttempt_whileCurrentBSSID_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = (id *)(a1 + 40);
    unint64_t v63 = [*(id *)(a1 + 40) objectForKey:@"ROAMEDEVENT_REASON"];
    long long v64 = [*v2 objectForKey:@"ROAMEDEVENT_STATUS"];
    v68 = [*v2 objectForKey:@"ROAMEDEVENT_ORIGIN_CHANNEL_FLAGS"];
    long long v67 = [*v2 objectForKey:@"ROAMEDEVENT_ORIGIN_CHANNEL"];
    unint64_t v66 = [*v2 objectForKey:@"ROAMEDEVENT_TARGET_CHANNEL_FLAGS"];
    long long v65 = [*v2 objectForKey:@"ROAMEDEVENT_TARGET_CHANNEL"];
    uint64_t v3 = +[WiFiUsagePrivacyFilter bandFromFlags:v68 OrChannel:v67];
    uint64_t v4 = +[WiFiUsagePrivacyFilter bandFromFlags:v66 OrChannel:v65];
    __int16 v5 = NSString;
    uint64_t v6 = +[WiFiUsagePrivacyFilter bandAsString:v3];
    uint64_t v7 = +[WiFiUsagePrivacyFilter bandAsString:v4];
    uint64_t v62 = [v5 stringWithFormat:@"%@GHz->%@GHz", v6, v7];

    int v60 = [v64 intValue] & 0x1FF;
    uint64_t v8 = [v63 unsignedIntegerValue];
    if (v8 != 3766619137)
    {
      uint64_t v14 = v8;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v114 = "-[WiFiUsageMonitor updateBeaconCache:afterRoamAttempt:whileCurrentBSSID:forInterface:]_block_invoke";
        __int16 v115 = 2048;
        uint64_t v116 = v14;
        id v10 = MEMORY[0x1E4F14500];
        id v11 = "%s - ignoring beaconCache for CandidatesStats (reason(%lu) is not LowRssi)";
        uint32_t v12 = 22;
        goto LABEL_10;
      }
LABEL_79:

      return;
    }
    if ((unint64_t)[*(id *)(a1 + 48) length] <= 5)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 136315650;
        v114 = "-[WiFiUsageMonitor updateBeaconCache:afterRoamAttempt:whileCurrentBSSID:forInterface:]_block_invoke";
        __int16 v115 = 2160;
        uint64_t v116 = 1752392040;
        __int16 v117 = 2112;
        uint64_t v118 = v9;
        id v10 = MEMORY[0x1E4F14500];
        id v11 = "%s - currentBSSID (%{mask.hash}@) too short";
        uint32_t v12 = 32;
LABEL_10:
        _os_log_impl(&dword_1D3CCD000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, v12);
        goto LABEL_79;
      }
      goto LABEL_79;
    }
    __int16 v111 = 0;
    int v110 = 0;
    [*(id *)(a1 + 48) getBytes:&v110 length:6];
    v82 = objc_msgSend(NSString, "stringWithFormat:", @"%x:%02x:%02x:%02x:%02x:%02x", v110, BYTE1(v110), BYTE2(v110), HIBYTE(v110), v111, HIBYTE(v111));
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v15 = *(id *)(a1 + 56);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v106 objects:v133 count:16];
    if (v16)
    {
      v80 = 0;
      uint64_t v17 = *(void *)v107;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v107 != v17) {
            objc_enumerationMutation(v15);
          }
          long long v19 = *(void **)(*((void *)&v106 + 1) + 8 * i);
          id v20 = [v19 objectForKey:@"BSSID"];
          id v21 = [v19 objectForKey:@"SSID"];
          if ([v20 isEqualToString:v82])
          {
            id v22 = v21;

            v80 = v22;
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v106 objects:v133 count:16];
      }
      while (v16);

      if (v80)
      {
        long long v77 = objc_opt_new();
        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        id v23 = *(id *)(a1 + 56);
        uint64_t v24 = [v23 countByEnumeratingWithState:&v102 objects:v132 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v103;
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v103 != v25) {
                objc_enumerationMutation(v23);
              }
              id v27 = *(void **)(*((void *)&v102 + 1) + 8 * j);
              uint64_t v28 = [v27 objectForKey:@"AGE"];
              id v29 = [v27 objectForKey:@"SSID"];
              if ((unint64_t)[v28 unsignedIntegerValue] <= 0x1388
                && [v29 isEqualToData:v80])
              {
                [v77 addObject:v27];
              }
            }
            uint64_t v24 = [v23 countByEnumeratingWithState:&v102 objects:v132 count:16];
          }
          while (v24);
        }

        uint64_t v79 = [v77 count];
        v81 = objc_opt_new();
        id v69 = v62;
        long long v98 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        obuint64_t j = v77;
        uint64_t v30 = [obj countByEnumeratingWithState:&v98 objects:v131 count:16];
        if (v30)
        {
          uint64_t v76 = -95;
          int v75 = 3;
          uint64_t v71 = *(void *)v99;
          uint64_t v78 = -95;
          uint64_t v74 = -95;
          unsigned int v72 = 3;
          unsigned int v73 = 3;
          do
          {
            for (uint64_t k = 0; k != v30; ++k)
            {
              if (*(void *)v99 != v71) {
                objc_enumerationMutation(obj);
              }
              id v32 = *(void **)(*((void *)&v98 + 1) + 8 * k);
              id v33 = [v32 objectForKey:@"BSSID"];
              id v34 = [v32 objectForKey:@"CHANNEL_FLAGS"];
              unint64_t v35 = [v32 objectForKey:@"CHANNEL"];
              unint64_t v36 = [v32 objectForKey:@"RSSI"];
              uint64_t v37 = +[WiFiUsagePrivacyFilter bandFromFlags:v34 OrChannel:v35];
              BOOL v38 = [NSNumber numberWithInteger:v37];
              BOOL v39 = [v81 objectForKeyedSubscript:v38];
              BOOL v40 = v39 == 0;

              if (v40)
              {
                BOOL v41 = objc_opt_new();
                [v81 setObject:v41 forKeyedSubscript:v38];
              }
              unint64_t v42 = [v81 objectForKeyedSubscript:v38];
              [v42 addObject:v33];

              if (v79)
              {
                if (v36 && [v36 integerValue] >= v78)
                {
                  uint64_t v78 = [v36 integerValue];
                  unsigned int v73 = v37;
                }
                if ([v33 isEqualToString:v82])
                {
                  uint64_t v76 = [v36 integerValue];
                  int v75 = v37;
                }
                else if (v36 && [v36 integerValue] >= v74)
                {
                  uint64_t v74 = [v36 integerValue];
                  unsigned int v72 = v37;
                }
                uint64_t v43 = MEMORY[0x1E4F14500];
                id v44 = MEMORY[0x1E4F14500];
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  id v45 = +[WiFiUsagePrivacyFilter bandAsString:v37];
                  int v46 = [v33 isEqualToString:v82];
                  *(_DWORD *)buf = 136316418;
                  uint64_t v47 = &stru_1F2B5AC50;
                  if (v46) {
                    uint64_t v47 = @"(current BSSID)";
                  }
                  v114 = "-[WiFiUsageMonitor updateBeaconCache:afterRoamAttempt:whileCurrentBSSID:forInterface:]_block_invoke";
                  __int16 v115 = 2160;
                  uint64_t v116 = 1752392040;
                  __int16 v117 = 2112;
                  uint64_t v118 = (uint64_t)v33;
                  __int16 v119 = 2112;
                  id v120 = v45;
                  __int16 v121 = 2112;
                  uint64_t v122 = (uint64_t)v36;
                  __int16 v123 = 2112;
                  uint64_t v124 = (uint64_t)v47;
                  _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - bssid:%{mask.hash}@ %@Ghz rssi:%@dBm %@", buf, 0x3Eu);
                }
              }
            }
            uint64_t v30 = [obj countByEnumeratingWithState:&v98 objects:v131 count:16];
          }
          while (v30);
        }
        else
        {
          uint64_t v76 = -95;
          int v75 = 3;
          uint64_t v78 = -95;
          uint64_t v74 = -95;
          unsigned int v72 = 3;
          unsigned int v73 = 3;
        }

        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v114 = "-[WiFiUsageMonitor updateBeaconCache:afterRoamAttempt:whileCurrentBSSID:forInterface:]_block_invoke";
          __int16 v115 = 2112;
          uint64_t v116 = (uint64_t)v81;
          _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - roamCandidatesByBand:%@", buf, 0x16u);
        }
        if (v79)
        {
          long long v48 = MEMORY[0x1E4F14500];
          id v49 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            id v50 = +[WiFiUsagePrivacyFilter bandAsString:v73];
            uint64_t v51 = +[WiFiUsagePrivacyFilter bandAsString:v72];
            BOOL v52 = (void *)v51;
            int v53 = @"NO";
            *(_DWORD *)buf = 136317186;
            v114 = "-[WiFiUsageMonitor updateBeaconCache:afterRoamAttempt:whileCurrentBSSID:forInterface:]_block_invoke";
            __int16 v115 = 2048;
            uint64_t v116 = v76;
            if (!v60) {
              int v53 = @"YES";
            }
            __int16 v117 = 2048;
            uint64_t v118 = v78;
            __int16 v119 = 2112;
            id v120 = v50;
            __int16 v121 = 2048;
            uint64_t v122 = v74;
            __int16 v123 = 2112;
            uint64_t v124 = v51;
            __int16 v125 = 2048;
            uint64_t v126 = v79;
            __int16 v127 = 2112;
            id v128 = v69;
            __int16 v129 = 2112;
            v130 = v53;
            _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - \ncurrentBSSrssi:%lddBm strongestRSSI:%lddBm strongestRssiBand:%@ strongestRssiExcludingCurrent:%lddBm strongestRSSIbandExcludingCurrent:%@Ghz candidatesCount:%lu roamBandTransition:%@ roamSuccessful:%@", buf, 0x5Cu);
          }
        }
        long long v96 = 0u;
        long long v97 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        uint64_t v54 = [*(id *)(*(void *)(a1 + 64) + 104) valueForKey:*(void *)(a1 + 32)];
        uint64_t v55 = [v54 countByEnumeratingWithState:&v94 objects:v112 count:16];
        uint64_t v56 = v69;
        if (v55)
        {
          uint64_t v57 = *(void *)v95;
          do
          {
            for (uint64_t m = 0; m != v55; ++m)
            {
              if (*(void *)v95 != v57) {
                objc_enumerationMutation(v54);
              }
              uint64_t v59 = *(void **)(*((void *)&v94 + 1) + 8 * m);
              uint64_t v83 = v76;
              int v84 = v75;
              int v85 = 0;
              uint64_t v86 = v78;
              uint64_t v87 = v74;
              unsigned int v88 = v73;
              unsigned int v89 = v72;
              uint64_t v90 = v79;
              id v91 = v81;
              id v92 = v56;
              BOOL v93 = v60 == 0;
              if (v59)
              {
                [v59 roamCandidatesStatsDidUpdate:&v83];
              }
              else
              {

                uint64_t v56 = v69;
              }
            }
            uint64_t v55 = [v54 countByEnumeratingWithState:&v94 objects:v112 count:16];
          }
          while (v55);
        }

LABEL_78:
        goto LABEL_79;
      }
    }
    else
    {
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v114 = "-[WiFiUsageMonitor updateBeaconCache:afterRoamAttempt:whileCurrentBSSID:forInterface:]_block_invoke";
      __int16 v115 = 2160;
      uint64_t v116 = 1752392040;
      __int16 v117 = 2112;
      uint64_t v118 = (uint64_t)v82;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - currentBSSID (%{mask.hash}@) not in beaconCache", buf, 0x20u);
    }
    goto LABEL_78;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v114 = "-[WiFiUsageMonitor updateBeaconCache:afterRoamAttempt:whileCurrentBSSID:forInterface:]_block_invoke";
    __int16 v115 = 2112;
    uint64_t v116 = v13;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)updateBssPerChannelWith:(id)a3 into:(id)a4 and:(id)a5 withChannelInfoList:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v34 = a5;
  id v12 = a6;
  uint64_t v13 = (NSArray *)[v12 copy];
  lastChannelInfoList = self->_lastChannelInfoList;
  self->_lastChannelInfoList = v13;

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v15 = v12;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v40 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = +[WiFiUsageChannel channelWithChannelInfo:*(void *)(*((void *)&v39 + 1) + 8 * i)];
        id v21 = [v11 objectForKeyedSubscript:v20];

        if (!v21)
        {
          id v22 = objc_opt_new();
          [v11 setObject:v22 forKeyedSubscript:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v17);
  }
  id v33 = v15;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v23 = v10;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void **)(*((void *)&v35 + 1) + 8 * j);
        id v29 = +[WiFiUsageChannel channelWithBssDetails:](WiFiUsageChannel, "channelWithBssDetails:", v28, v33);
        uint64_t v30 = [v11 objectForKeyedSubscript:v29];
        id v31 = [v28 bssid];
        [v30 addObject:v31];

        id v32 = [v28 bssid];
        [v34 addObject:v32];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v25);
  }
}

id __85__WiFiUsageMonitor_submitScanResultWithNeighborBSS_withOtherBSS_withChannelInfoList___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __85__WiFiUsageMonitor_submitScanResultWithNeighborBSS_withOtherBSS_withChannelInfoList___block_invoke_2(uint64_t a1)
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v7[0] = @"All";
  v6[0] = @"band";
  v6[1] = @"scannedChannels";
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v7[1] = v2;
  v6[2] = @"PerChannelUniqueBSSCount";
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v7[2] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (void)setPowerState:(BOOL)a3 forInterface:(id)a4
{
  id v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__WiFiUsageMonitor_setPowerState_forInterface___block_invoke;
  block[3] = &unk_1E69BCE78;
  id v10 = v6;
  id v11 = self;
  BOOL v12 = a3;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

void __47__WiFiUsageMonitor_setPowerState_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    int v3 = *(unsigned __int8 *)(a1 + 48);
    if (*(unsigned __int8 *)(v2 + 23) != v3)
    {
      *(unsigned char *)(v2 + 23) = v3;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v4 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 104), "valueForKey:", *(void *)(a1 + 32), 0);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v13;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v4);
            }
            [*(id *)(*((void *)&v12 + 1) + 8 * v8++) powerStateDidChange:*(unsigned __int8 *)(a1 + 48)];
          }
          while (v6 != v8);
          uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v6);
      }

      uint64_t v2 = *(void *)(a1 + 40);
    }
    if (*(unsigned char *)(v2 + 33))
    {
      uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v10 = [MEMORY[0x1E4F28EA0] notificationWithName:@"setPowerState" object:0];
      [v9 postNotification:v10];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "-[WiFiUsageMonitor setPowerState:forInterface:]_block_invoke";
    __int16 v19 = 2112;
    uint64_t v20 = v11;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)setControlCenterState:(BOOL)a3 withKnownLocation:(BOOL)a4 forInterface:(id)a5
{
  id v8 = a5;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__WiFiUsageMonitor_setControlCenterState_withKnownLocation_forInterface___block_invoke;
  block[3] = &unk_1E69BD120;
  id v12 = v8;
  long long v13 = self;
  BOOL v14 = a3;
  BOOL v15 = a4;
  id v10 = v8;
  dispatch_async(internalQueue, block);
}

void __73__WiFiUsageMonitor_setControlCenterState_withKnownLocation_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    int v3 = *(unsigned __int8 *)(a1 + 48);
    if (*(unsigned __int8 *)(v2 + 24) != v3)
    {
      *(unsigned char *)(v2 + 24) = v3;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v4 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 104), "valueForKey:", *(void *)(a1 + 32), 0);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v13;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v4);
            }
            [*(id *)(*((void *)&v12 + 1) + 8 * v8++) controlCenterStateDidChange:*(unsigned __int8 *)(a1 + 48) withKnownLocation:*(unsigned __int8 *)(a1 + 49)];
          }
          while (v6 != v8);
          uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v6);
      }

      uint64_t v2 = *(void *)(a1 + 40);
    }
    if (*(unsigned char *)(v2 + 33))
    {
      uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v10 = [MEMORY[0x1E4F28EA0] notificationWithName:@"setControlCenterState" object:0];
      [v9 postNotification:v10];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "-[WiFiUsageMonitor setControlCenterState:withKnownLocation:forInterface:]_block_invoke";
    __int16 v19 = 2112;
    uint64_t v20 = v11;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)setCellularDataStatus:(id)a3 inAirplaneMode:(BOOL)a4
{
  id v6 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__WiFiUsageMonitor_setCellularDataStatus_inAirplaneMode___block_invoke;
  block[3] = &unk_1E69BCE78;
  id v10 = v6;
  uint64_t v11 = self;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

uint64_t __57__WiFiUsageMonitor_setCellularDataStatus_inAirplaneMode___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isEqual:*(void *)(*(void *)(a1 + 40) + 96)];
  uint64_t v3 = *(void *)(a1 + 40);
  if (!result || *(unsigned __int8 *)(v3 + 25) != *(unsigned __int8 *)(a1 + 48))
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v4 = [*(id *)(v3 + 104) allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
          long long v15 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          id v10 = v9;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v16;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v16 != v13) {
                  objc_enumerationMutation(v10);
                }
                [*(id *)(*((void *)&v15 + 1) + 8 * v14++) cellularDataStatusDidChange:*(void *)(a1 + 32) inAirplaneMode:*(unsigned __int8 *)(a1 + 48)];
              }
              while (v12 != v14);
              uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
            }
            while (v12);
          }

          ++v8;
        }
        while (v8 != v6);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v6);
    }

    [*(id *)(a1 + 40) setCurrentCellularStatus:*(void *)(a1 + 32)];
    return [*(id *)(a1 + 40) setAirplaneModeEnabled:*(unsigned __int8 *)(a1 + 48)];
  }
  return result;
}

- (void)setCellularFallbackState:(BOOL)a3 forInterface:(id)a4
{
  id v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__WiFiUsageMonitor_setCellularFallbackState_forInterface___block_invoke;
  block[3] = &unk_1E69BCE78;
  id v10 = v6;
  uint64_t v11 = self;
  BOOL v12 = a3;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

void __58__WiFiUsageMonitor_setCellularFallbackState_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    int v3 = *(unsigned __int8 *)(a1 + 48);
    if (*(unsigned __int8 *)(v2 + 26) != v3)
    {
      *(unsigned char *)(v2 + 26) = v3;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v4 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 104), "valueForKey:", *(void *)(a1 + 32), 0);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v13;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v4);
            }
            [*(id *)(*((void *)&v12 + 1) + 8 * v8++) cellularFallbackStateDidChange:*(unsigned __int8 *)(a1 + 48)];
          }
          while (v6 != v8);
          uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v6);
      }

      uint64_t v2 = *(void *)(a1 + 40);
      if (*(void *)(v2 + 264))
      {
        [(id)v2 pushRNFEventToHUD:*(unsigned __int8 *)(a1 + 48)];
        uint64_t v2 = *(void *)(a1 + 40);
      }
    }
    if (*(unsigned char *)(v2 + 33))
    {
      uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v10 = [MEMORY[0x1E4F28EA0] notificationWithName:@"CellularFallbackState" object:0];
      [v9 postNotification:v10];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    long long v18 = "-[WiFiUsageMonitor setCellularFallbackState:forInterface:]_block_invoke";
    __int16 v19 = 2112;
    uint64_t v20 = v11;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)setCellularOutrankingState:(BOOL)a3 forInterface:(id)a4
{
  id v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__WiFiUsageMonitor_setCellularOutrankingState_forInterface___block_invoke;
  block[3] = &unk_1E69BCE78;
  id v10 = v6;
  uint64_t v11 = self;
  BOOL v12 = a3;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

void __60__WiFiUsageMonitor_setCellularOutrankingState_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    int v3 = *(unsigned __int8 *)(a1 + 48);
    if (*(unsigned __int8 *)(v2 + 27) != v3)
    {
      *(unsigned char *)(v2 + 27) = v3;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v4 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 104), "valueForKey:", *(void *)(a1 + 32), 0);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v13;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v4);
            }
            [*(id *)(*((void *)&v12 + 1) + 8 * v8++) cellularOutrankingStateDidChange:*(unsigned __int8 *)(a1 + 48)];
          }
          while (v6 != v8);
          uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v6);
      }

      uint64_t v2 = *(void *)(a1 + 40);
    }
    if (*(unsigned char *)(v2 + 33))
    {
      uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v10 = [MEMORY[0x1E4F28EA0] notificationWithName:@"CellularOutrankingState" object:0];
      [v9 postNotification:v10];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    long long v18 = "-[WiFiUsageMonitor setCellularOutrankingState:forInterface:]_block_invoke";
    __int16 v19 = 2112;
    uint64_t v20 = v11;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)notifyNetworkQualityResults:(id)a3 forInterface:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__WiFiUsageMonitor_notifyNetworkQualityResults_forInterface___block_invoke;
  block[3] = &unk_1E69BCEC8;
  id v12 = v7;
  long long v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(internalQueue, block);
}

void __61__WiFiUsageMonitor_notifyNetworkQualityResults_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 104), "valueForKey:");
    uint64_t v3 = [v2 count];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v4 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 104), "valueForKey:", *(void *)(a1 + 32), 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v10 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"networkQualityResponsiveness"];
          [v9 setResponsivenessScore:v10];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v6);
    }

    if (v3)
    {
      uint64_t v11 = [*(id *)(*(void *)(a1 + 40) + 120) objectForKey:*(void *)(a1 + 32)];
      id v12 = [*(id *)(a1 + 40) canStartLQMAnalysisforTrigger:@"NetworkQuality" andReason:0 onWindow:v11];
      if (v12)
      {
        long long v13 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"networkQualityResponsiveness"];
        id v14 = +[WiFiUsageLQMTransformations getBinNetworkQualityResponsiveness:As:](WiFiUsageLQMTransformations, "getBinNetworkQualityResponsiveness:As:", [v13 unsignedLongValue], 0);
        [*(id *)(a1 + 48) setObject:v14 forKeyedSubscript:@"networkQualityResponsiveness"];

        uint64_t v15 = *(void *)(a1 + 40);
        long long v16 = [[WiFiUsageLQMWindowAnalysisNetworkQuality alloc] initWithRollingWindow:v11 AndDictionary:*(void *)(a1 + 48) andContext:*(unsigned __int8 *)(v15 + 13) | ((unint64_t)*(unsigned __int8 *)(v15 + 15) << 8) | ((unint64_t)*(unsigned __int8 *)(v15 + 16) << 16) andTimestamp:v12 onQueue:*(void *)(v15 + 144)];
        [*(id *)(a1 + 40) startLQMAnalysis:v16];
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    uint64_t v24 = "-[WiFiUsageMonitor notifyNetworkQualityResults:forInterface:]_block_invoke";
    __int16 v25 = 2112;
    uint64_t v26 = v17;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

+ (id)LQMAnalysisReasonForFault:(unint64_t)a3
{
  unint64_t v4 = a3 - 1;
  if (a3 - 1 <= 0x1A && ((0x707023Fu >> v4) & 1) != 0)
  {
    uint64_t v5 = *off_1E69BD478[v4];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (void)sendFaultToDB:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    uint64_t v3 = [MEMORY[0x1E4FB6F38] sharedAnalyticsProcessor];
    [v3 processWAMessageMetric:*MEMORY[0x1E4FB6F88] data:v4];
  }
}

- (void)addFaultEvent:(unint64_t)a3 forInterface:(id)a4
{
  id v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__WiFiUsageMonitor_addFaultEvent_forInterface___block_invoke;
  block[3] = &unk_1E69BD148;
  void block[4] = self;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

void __47__WiFiUsageMonitor_addFaultEvent_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class())
  {
    if (!*(void *)(*(void *)(a1 + 32) + 320))
    {
      id v2 = objc_alloc_init(MEMORY[0x1E4FB6F48]);
      uint64_t v3 = *(void *)(a1 + 32);
      id v4 = *(void **)(v3 + 320);
      *(void *)(v3 + 320) = v2;
    }
    uint64_t v5 = (__CFString *)*(id *)(a1 + 40);
    id v6 = *(void **)(a1 + 40);
    if (!v6 || ![v6 length])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(__CFString **)(a1 + 40);
        uint64_t v8 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 136315650;
        int v46 = "-[WiFiUsageMonitor addFaultEvent:forInterface:]_block_invoke";
        __int16 v47 = 2112;
        long long v48 = v7;
        __int16 v49 = 2048;
        uint64_t v50 = v8;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: Invalid interfaceName %@ reason %lu", buf, 0x20u);
      }

      uint64_t v5 = @"UnkownInterface";
    }
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v9)
    {
      id v10 = [MEMORY[0x1E4F1C9C8] date];
      if (v10) {
        [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4FB6F68]];
      }
      unint64_t v11 = WiFiUsageFaultReasonStringMap(*(void *)(a1 + 48));

      if (v11)
      {
        id v12 = WiFiUsageFaultReasonStringMap(*(void *)(a1 + 48));
        [v9 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4FB6F78]];
      }
      if (v5) {
        [v9 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4FB6F70]];
      }
      long long v13 = *(void **)(*(void *)(a1 + 32) + 264);
      if (v13)
      {
        uint64_t v14 = [v13 connectedBss];
        if (v14)
        {
          uint64_t v15 = (void *)v14;
          long long v16 = [*(id *)(*(void *)(a1 + 32) + 264) connectedBss];
          uint64_t v17 = [v16 bssid];

          if (v17)
          {
            long long v18 = [*(id *)(*(void *)(a1 + 32) + 264) connectedBss];
            long long v19 = [v18 bssid];
            [v9 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4FB6F60]];
          }
        }
      }
      long long v20 = *(void **)(*(void *)(a1 + 32) + 264);
      if (v20)
      {
        long long v21 = [v20 networkName];

        if (v21)
        {
          long long v22 = [*(id *)(*(void *)(a1 + 32) + 264) networkName];
          [v9 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4FB6F80]];
        }
      }
      if ([v9 count]) {
        [*(id *)(a1 + 32) sendFaultToDB:v9];
      }
    }
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v23 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "valueForKey:", *(void *)(a1 + 40), 0);
  uint64_t v24 = [v23 countByEnumeratingWithState:&v40 objects:v44 count:16];
  uint64_t v25 = v24;
  if (v24)
  {
    uint64_t v26 = *(void *)v41;
    uint64_t v27 = v24;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v41 != v26) {
          objc_enumerationMutation(v23);
        }
        [*(id *)(*((void *)&v40 + 1) + 8 * i) faultEventDetected:*(void *)(a1 + 48)];
      }
      uint64_t v27 = [v23 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v27);
  }

  if (*(unsigned char *)(*(void *)(a1 + 32) + 33))
  {
    id v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v30 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AddFaultEvent" object:0];
    [v29 postNotification:v30];
  }
  if (v25)
  {
    id v31 = [*(id *)(*(void *)(a1 + 32) + 120) objectForKey:*(void *)(a1 + 40)];
    id v32 = +[WiFiUsageMonitor LQMAnalysisReasonForFault:*(void *)(a1 + 48)];
    if (v32)
    {
      id v33 = [*(id *)(a1 + 32) canStartLQMAnalysisforTrigger:v32 andReason:0 onWindow:v31];
      if (*(void *)(a1 + 48) == 18)
      {
        id v34 = [MEMORY[0x1E4F1C9C8] now];
        long long v35 = v34;
        if (*(void *)(*(void *)(a1 + 32) + 128))
        {
          objc_msgSend(v34, "timeIntervalSinceDate:");
          if (v36 <= 60.0)
          {
            objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), v35);

            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v37 = *(void *)(*(void *)(a1 + 32) + 128);
              *(_DWORD *)buf = 136315650;
              int v46 = "-[WiFiUsageMonitor addFaultEvent:forInterface:]_block_invoke";
              __int16 v47 = 2112;
              long long v48 = @"SlowWiFiDnsFailure";
              __int16 v49 = 2112;
              uint64_t v50 = v37;
              _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: Not starting LQM window analysis triggered by %@. Last triggered: %@", buf, 0x20u);
            }
            id v33 = 0;
          }
        }
      }
      if (v33)
      {
        uint64_t v38 = *(void *)(a1 + 32);
        long long v39 = [[WiFiUsageLQMWindowAnalysis alloc] initWithRollingWindow:v31 andReason:v32 andContext:*(unsigned __int8 *)(v38 + 13) | ((unint64_t)*(unsigned __int8 *)(v38 + 15) << 8) | ((unint64_t)*(unsigned __int8 *)(v38 + 16) << 16) andTimestamp:v33 onQueue:*(void *)(v38 + 144)];
        [*(id *)(a1 + 32) startLQMAnalysis:v39];
      }
    }
  }
}

- (void)linkTestEvent:(id)a3 withReason:(id)a4 forInterface:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__WiFiUsageMonitor_linkTestEvent_withReason_forInterface___block_invoke;
  v15[3] = &unk_1E69BD170;
  v15[4] = self;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(internalQueue, v15);
}

uint64_t __58__WiFiUsageMonitor_linkTestEvent_withReason_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 120) objectForKey:*(void *)(a1 + 40)];
  uint64_t v4 = v2;
  if (v2)
  {
    uint64_t v9 = v2;
    uint64_t v5 = [*(id *)(a1 + 32) canStartLQMAnalysisforTrigger:@"LinkTest" andReason:*(void *)(a1 + 48) onWindow:v2];
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = [[WiFiUsageLQMWindowAnalysisLinkTest alloc] initWithRollingWindow:v9 andReason:*(void *)(a1 + 48) withWFMeasureResults:*(void *)(a1 + 56) andContext:*(unsigned __int8 *)(v6 + 13) | ((unint64_t)*(unsigned __int8 *)(v6 + 15) << 8) | ((unint64_t)*(unsigned __int8 *)(v6 + 16) << 16) andTimestamp:v5 onQueue:*(void *)(v6 + 144)];
      [*(id *)(a1 + 32) startLQMAnalysis:v7];
    }
    uint64_t v4 = v9;
  }

  return MEMORY[0x1F41817F8](v2, v4, v3);
}

- (void)addTriggerDisconnectEvent:(id)a3 isAlerted:(BOOL)a4 isConfirmed:(BOOL)a5 isExecuted:(BOOL)a6
{
  id v10 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__WiFiUsageMonitor_addTriggerDisconnectEvent_isAlerted_isConfirmed_isExecuted___block_invoke;
  block[3] = &unk_1E69BD198;
  id v14 = v10;
  uint64_t v15 = self;
  BOOL v16 = a4;
  BOOL v17 = a5;
  BOOL v18 = a6;
  id v12 = v10;
  dispatch_async(internalQueue, block);
}

void __79__WiFiUsageMonitor_addTriggerDisconnectEvent_isAlerted_isConfirmed_isExecuted___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 104) valueForKey:0];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v14 != v5) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * i) triggerDisconnectAlerted:*(unsigned __int8 *)(a1 + 48) confirmed:*(unsigned __int8 *)(a1 + 49) executed:*(unsigned __int8 *)(a1 + 50)];
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v4);
    }

    uint64_t v7 = *(unsigned char **)(a1 + 40);
    if (*(unsigned char *)(a1 + 49) && !v7[30])
    {
      [v7 setLastTDEvalConfirmed:1];
      uint64_t v7 = *(unsigned char **)(a1 + 40);
    }
    if (*(unsigned char *)(a1 + 50) && !v7[31])
    {
      v7[31] = 1;
      [*(id *)(a1 + 40) setLastTDEvalStartedBy:0];
      id v8 = *(void **)(a1 + 40);
      uint64_t v9 = [NSString stringWithFormat:@"TD evaluation complete: disconnected the link"];
      [v8 pushTDEventToHUD:v9];

      uint64_t v7 = *(unsigned char **)(a1 + 40);
    }
    if (v7[33])
    {
      id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      unint64_t v11 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AddTriggerDisconnectEvent" object:0];
      [v10 postNotification:v11];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    long long v19 = "-[WiFiUsageMonitor addTriggerDisconnectEvent:isAlerted:isConfirmed:isExecuted:]_block_invoke";
    __int16 v20 = 2112;
    uint64_t v21 = v12;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)setTdLogic_badRssiThreshold:(int64_t)a3 goodRssiThreshold:(int64_t)a4
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__WiFiUsageMonitor_setTdLogic_badRssiThreshold_goodRssiThreshold___block_invoke;
  block[3] = &unk_1E69BD1C0;
  void block[4] = self;
  void block[5] = a3;
  void block[6] = a4;
  dispatch_async(internalQueue, block);
}

void __66__WiFiUsageMonitor_setTdLogic_badRssiThreshold_goodRssiThreshold___block_invoke(void *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  if (*(void *)(v2 + 64) != v3 || *(void *)(v2 + 72) != a1[6])
  {
    *(void *)(v2 + 64) = v3;
    *(void *)(a1[4] + 72) = a1[6];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v4 = [*(id *)(a1[4] + 104) allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
          long long v15 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          id v10 = v9;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v16;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v16 != v13) {
                  objc_enumerationMutation(v10);
                }
                objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "tdLogic_badRssi:goodRSSI:", *(void *)(a1[4] + 64), *(void *)(a1[4] + 72));
              }
              while (v12 != v14);
              uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
            }
            while (v12);
          }

          ++v8;
        }
        while (v8 != v6);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v6);
    }
  }
}

- (void)setTdLogic_deferJoin:(unint64_t)a3 perBSSID:(unint64_t)a4
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__WiFiUsageMonitor_setTdLogic_deferJoin_perBSSID___block_invoke;
  block[3] = &unk_1E69BD1C0;
  void block[4] = self;
  void block[5] = a3;
  void block[6] = a4;
  dispatch_async(internalQueue, block);
}

void __50__WiFiUsageMonitor_setTdLogic_deferJoin_perBSSID___block_invoke(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v2 = [*(id *)(a1[4] + 104) allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * v6);
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v14;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v14 != v11) {
                objc_enumerationMutation(v8);
              }
              objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "tdLogic_deferJoin:perBSSID:", a1[5], a1[6]);
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }
}

- (void)setTdLogic_alertedBy:(int)a3 forInterface:(id)a4
{
  id v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__WiFiUsageMonitor_setTdLogic_alertedBy_forInterface___block_invoke;
  block[3] = &unk_1E69BC958;
  id v10 = v6;
  uint64_t v11 = self;
  int v12 = a3;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

void __54__WiFiUsageMonitor_setTdLogic_alertedBy_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 104) valueForKey:0];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v14;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v14 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v6++), "tdLogic_alertedBy:", *(unsigned int *)(a1 + 48));
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v4);
    }

    uint64_t v7 = *(void *)(a1 + 40);
    if (!*(void *)(v7 + 80))
    {
      *(unsigned char *)(v7 + 30) = 0;
      *(unsigned char *)(*(void *)(a1 + 40) + 31) = 0;
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void **)(v8 + 304);
      *(void *)(v8 + 304) = 0;

      id v10 = *(void **)(a1 + 40);
      uint64_t v11 = +[WiFiUsagePrivacyFilter getLabelForTDTrigger:*(unsigned int *)(a1 + 48)];
      [v10 setLastTDEvalStartedBy:v11];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    long long v19 = "-[WiFiUsageMonitor setTdLogic_alertedBy:forInterface:]_block_invoke";
    __int16 v20 = 2112;
    uint64_t v21 = v12;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)setTdLogic_decisionState:(id *)a3 forInterface:(id)a4
{
  id v6 = a4;
  internalQueue = self->_internalQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__WiFiUsageMonitor_setTdLogic_decisionState_forInterface___block_invoke;
  v10[3] = &unk_1E69BD0A8;
  id v11 = v6;
  uint64_t v12 = self;
  long long v8 = *(_OWORD *)&a3->var13;
  long long v13 = *(_OWORD *)&a3->var0;
  long long v14 = v8;
  id v9 = v6;
  dispatch_async(internalQueue, v10);
}

void __58__WiFiUsageMonitor_setTdLogic_decisionState_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 104) valueForKey:0];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v14 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          long long v8 = *(_OWORD *)(a1 + 64);
          *(_OWORD *)buf = *(_OWORD *)(a1 + 48);
          *(_OWORD *)&buf[16] = v8;
          objc_msgSend(v7, "tdLogic_decisionState:", buf);
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v4);
    }

    if (*(unsigned char *)(*(void *)(a1 + 40) + 30))
    {
      long long v9 = *(_OWORD *)(a1 + 64);
      *(_OWORD *)buf = *(_OWORD *)(a1 + 48);
      *(_OWORD *)&buf[16] = v9;
      id v10 = +[WiFiUsageMonitor getTDConfirmedEventStringForDisplay:buf];
      id v11 = v10;
      if (v10)
      {
        if (([v10 isEqualToString:*(void *)(*(void *)(a1 + 40) + 304)] & 1) == 0) {
          [*(id *)(a1 + 40) setLastTDConfirmedDisplayStr:v11];
        }
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[WiFiUsageMonitor setTdLogic_decisionState:forInterface:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v12;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)setTdLogic_fastTdState:(id)a3 forInterface:(id)a4
{
  uint64_t v4 = *(void *)&a3.var1;
  unint64_t var0 = a3.var0;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__WiFiUsageMonitor_setTdLogic_fastTdState_forInterface___block_invoke;
  v10[3] = &unk_1E69BCF90;
  id v11 = v7;
  uint64_t v12 = self;
  unint64_t v13 = var0;
  uint64_t v14 = v4;
  id v9 = v7;
  dispatch_async(internalQueue, v10);
}

void __56__WiFiUsageMonitor_setTdLogic_fastTdState_forInterface___block_invoke(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v2 = [*(id *)(a1[5] + 104) valueForKey:0];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "tdLogic_fastTdState:", a1[6], a1[7]);
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = a1[4];
    *(_DWORD *)buf = 136315394;
    uint64_t v14 = "-[WiFiUsageMonitor setTdLogic_fastTdState:forInterface:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)setTdLogic_execState:(id)a3 forInterface:(id)a4
{
  uint64_t v4 = *(void *)&a3.var8;
  uint64_t v5 = *(void *)&a3.var0;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__WiFiUsageMonitor_setTdLogic_execState_forInterface___block_invoke;
  v10[3] = &unk_1E69BD1E8;
  id v11 = v7;
  uint64_t v12 = self;
  uint64_t v13 = v5;
  int v14 = v4;
  char v15 = BYTE4(v4);
  id v9 = v7;
  dispatch_async(internalQueue, v10);
}

void __54__WiFiUsageMonitor_setTdLogic_execState_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 104) valueForKey:0];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          unint64_t v1 = v1 & 0xFFFFFF0000000000 | *(unsigned int *)(a1 + 56) | ((unint64_t)*(unsigned __int8 *)(a1 + 60) << 32);
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "tdLogic_execState:", *(void *)(a1 + 48), v1);
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    char v15 = "-[WiFiUsageMonitor setTdLogic_execState:forInterface:]_block_invoke";
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)setTdLogic_end:(int)a3 evalTime:(double)a4 rssi:(int64_t)a5 roamTime:(double)a6 forInterface:(id)a7
{
  id v12 = a7;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__WiFiUsageMonitor_setTdLogic_end_evalTime_rssi_roamTime_forInterface___block_invoke;
  v15[3] = &unk_1E69BD210;
  id v16 = v12;
  uint64_t v17 = self;
  int v21 = a3;
  double v18 = a4;
  int64_t v19 = a5;
  double v20 = a6;
  id v14 = v12;
  dispatch_async(internalQueue, v15);
}

void __71__WiFiUsageMonitor_setTdLogic_end_evalTime_rssi_roamTime_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 104) valueForKey:0];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v11;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v6++), "tdLogic_end:evalTime:rssi:roamTime:", *(unsigned int *)(a1 + 72), *(void *)(a1 + 56), *(double *)(a1 + 48), *(double *)(a1 + 64));
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v4);
    }

    uint64_t v7 = *(void **)(a1 + 40);
    if (v7[10])
    {
      [v7 setLastTDEvalStartedBy:0];
      uint64_t v8 = +[WiFiUsageMonitor getTDEvalCompleteEventStringForDisplay:*(unsigned int *)(a1 + 72)];
      if (v8) {
        [*(id *)(a1 + 40) setLastTDEvalStartedBy:0];
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v16 = "-[WiFiUsageMonitor setTdLogic_end:evalTime:rssi:roamTime:forInterface:]_block_invoke";
    __int16 v17 = 2112;
    uint64_t v18 = v9;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)setTdLogic_waitForRoamTime:(double)a3 forInterface:(id)a4
{
  id v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__WiFiUsageMonitor_setTdLogic_waitForRoamTime_forInterface___block_invoke;
  block[3] = &unk_1E69BD148;
  id v10 = v6;
  long long v11 = self;
  double v12 = a3;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

void __60__WiFiUsageMonitor_setTdLogic_waitForRoamTime_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 104) valueForKey:0];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "tdLogic_waitForRoamTime:", *(double *)(a1 + 48));
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v14 = "-[WiFiUsageMonitor setTdLogic_waitForRoamTime:forInterface:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)updateWithMLORuntimeConfig:(id *)a3 forInterface:(id)a4
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v5 = *(_OWORD *)&a3->var1[2];
  long long v7 = *(_OWORD *)&a3->var0;
  long long v8 = v5;
  block[2] = __60__WiFiUsageMonitor_updateWithMLORuntimeConfig_forInterface___block_invoke;
  block[3] = &unk_1E69BD238;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

void __60__WiFiUsageMonitor_updateWithMLORuntimeConfig_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = +[WiFiUsagePrivacyFilter bandAsString:*(unsigned int *)(a1 + 48)];
  uint64_t v4 = +[WiFiUsagePrivacyFilter bandAsString:*(unsigned int *)(a1 + 52)];
  long long v5 = +[WiFiUsagePrivacyFilter bandAsString:*(unsigned int *)(a1 + 56)];
  uint64_t v6 = +[WiFiUsagePrivacyFilter bandAsString:*(unsigned int *)(a1 + 60)];
  long long v7 = (void *)v6;
  if (*(unsigned char *)(a1 + 64)) {
    long long v8 = @"trafficSwitchEnabled";
  }
  else {
    long long v8 = &stru_1F2B5AC50;
  }
  NSLog(&cfstr_SNumlinksLuPre.isa, "-[WiFiUsageMonitor updateWithMLORuntimeConfig:forInterface:]_block_invoke", v2, v3, v4, v5, v6, v8);

  long long v9 = [*(id *)(*(void *)(a1 + 32) + 264) connectedBss];
  long long v10 = *(_OWORD *)(a1 + 56);
  v11[0] = *(_OWORD *)(a1 + 40);
  v11[1] = v10;
  [v9 updateMLORuntimeConfig:v11];
}

- (BOOL)submitAnalytics:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = v4;
  if (self->_xctest_disableSampling)
  {
    BOOL v6 = 1;
LABEL_7:
    int v8 = 1;
    goto LABEL_8;
  }
  [v4 sessionDuration];
  BOOL v6 = v7 >= 10.0 || [v5 type] == 4;
  if (self->_xctest_disableSampling) {
    goto LABEL_7;
  }
  int v8 = [v5 canSubmitToCA];
LABEL_8:
  int v9 = v8 & v6;
  BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    char v23 = v9;
    if (v10)
    {
      id v11 = [v5 sessionName];
      BOOL xctest_disableSampling = self->_xctest_disableSampling;
      if (self->_xctest_disableSampling)
      {
        long long v13 = @"xctest_disableSampling";
      }
      else
      {
        long long v13 = [v5 describeCAConfig];
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v26 = "-[WiFiUsageMonitor submitAnalytics:]";
      __int16 v27 = 2112;
      id v28 = v11;
      __int16 v29 = 2112;
      uint64_t v30 = v13;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: submitting analytics for session type %@ (%@)", buf, 0x20u);
      if (!xctest_disableSampling) {
    }
      }
    [v5 recordCAsubmission];
    uint64_t v16 = [v5 metricName];
    id v17 = v5;
    AnalyticsSendEventLazy();

    for (int i = 0; i != 3; ++i)
    {
      uint64_t v19 = NSString;
      double v20 = [v17 metricName];
      int v21 = [v19 stringWithFormat:@"%@.durationByBand", v20];
      id v24 = v17;
      AnalyticsSendEventLazy();
    }
    LOBYTE(v9) = v23;
  }
  else if (v10)
  {
    id v14 = [v5 sessionName];
    __int16 v15 = [v5 describeCAConfig];
    *(_DWORD *)buf = 136315650;
    uint64_t v26 = "-[WiFiUsageMonitor submitAnalytics:]";
    __int16 v27 = 2112;
    id v28 = v14;
    __int16 v29 = 2112;
    uint64_t v30 = v15;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: NOT submitting analytics for session type %@ (%@)", buf, 0x20u);
  }
  return v9;
}

id __36__WiFiUsageMonitor_submitAnalytics___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = [*(id *)(a1 + 32) metricName];
    int v5 = 136315394;
    BOOL v6 = "-[WiFiUsageMonitor submitAnalytics:]_block_invoke";
    __int16 v7 = 2112;
    int v8 = v2;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: AnalyticsSendEventLazy callback for %@", (uint8_t *)&v5, 0x16u);
  }
  uint64_t v3 = [*(id *)(a1 + 32) sessionSummary:1];

  return v3;
}

uint64_t __36__WiFiUsageMonitor_submitAnalytics___block_invoke_666(uint64_t a1)
{
  return [*(id *)(a1 + 32) sessionByBand:*(unsigned int *)(a1 + 40) isFirst:*(unsigned __int8 *)(a1 + 44)];
}

- (id)summaryForInterface:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    int v5 = [MEMORY[0x1E4F1CA60] dictionary];
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__WiFiUsageMonitor_summaryForInterface___block_invoke;
    block[3] = &unk_1E69BCEC8;
    void block[4] = self;
    id v14 = v4;
    id v7 = v5;
    id v15 = v7;
    dispatch_sync(internalQueue, block);
    if (self->_xctest)
    {
      int v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v9 = [MEMORY[0x1E4F28EA0] notificationWithName:@"summaryForInterface" object:0];
      [v8 postNotification:v9];
    }
    BOOL v10 = v15;
    id v11 = v7;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v17 = "-[WiFiUsageMonitor summaryForInterface:]";
      __int16 v18 = 2112;
      uint64_t v19 = 0;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
    }
    id v11 = 0;
  }

  return v11;
}

void __40__WiFiUsageMonitor_summaryForInterface___block_invoke(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1[4] + 104), "valueForKey:", a1[5], 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
        int v8 = (void *)MEMORY[0x1D9440170]();
        if ([v7 isSessionActive])
        {
          uint64_t v9 = [v7 sessionSummary:0];
          BOOL v10 = (void *)a1[6];
          id v11 = [v9 objectForKeyedSubscript:@"SessionName"];
          [v10 setValue:v9 forKey:v11];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

- (void)rangingSessionRequestedWithSelfPreferredChannel:(unint64_t)a3 selfMainChannel:(unint64_t)a4 selfChannelFlags:(unint64_t)a5 peerPreferredChannel:(unint64_t)a6 peerMainChannel:(unint64_t)a7 peerChannelFlags:(unint64_t)a8 requester:(id)a9
{
  id v16 = a9;
  uint64_t v17 = objc_alloc_init(WiFiUsageRangingSession);
  [(WiFiUsageRangingSession *)v17 rangingSessionRequestedWithSelfPreferredChannel:a3 selfMainChannel:a4 selfChannelFlags:a5 peerPreferredChannel:a6 peerMainChannel:a7 peerChannelFlags:a8 requester:v16];

  [(WiFiUsageMonitor *)self setRangingSession:v17];
}

- (void)rangingStartedWithNumMeasurements:(unint64_t)a3
{
  uint64_t v5 = [(WiFiUsageMonitor *)self rangingSession];

  if (!v5)
  {
    uint64_t v6 = objc_alloc_init(WiFiUsageRangingSession);
    [(WiFiUsageMonitor *)self setRangingSession:v6];
  }
  id v7 = [(WiFiUsageMonitor *)self rangingSession];
  [v7 rangingStartedWithNumMeasurements:a3];
}

- (void)rangingCompletedWithValidCount:(unint64_t)a3 resultStatus:(int64_t)a4 resultFlags:(unint64_t)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = [(WiFiUsageMonitor *)self rangingSession];

  if (v9)
  {
    BOOL v10 = [(WiFiUsageMonitor *)self rangingSession];
    [v10 rangingCompletedWithValidCount:a3 resultStatus:a4 resultFlags:a5];

    id v11 = [(WiFiUsageMonitor *)self rangingSession];
    long long v12 = [v11 sessionSummary:1];
    long long v13 = (void *)[v12 copy];

    long long v14 = [(WiFiUsageMonitor *)self rangingSession];
    long long v15 = [v14 metricName];
    id v16 = (void *)[v15 copy];

    if (v13 && v16)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        int v21 = "-[WiFiUsageMonitor rangingCompletedWithValidCount:resultStatus:resultFlags:]";
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: submitting analytics for ranging session", buf, 0xCu);
      }
      v18[5] = MEMORY[0x1E4F143A8];
      v18[6] = 3221225472;
      v18[7] = __76__WiFiUsageMonitor_rangingCompletedWithValidCount_resultStatus_resultFlags___block_invoke;
      v18[8] = &unk_1E69BCC68;
      id v19 = v13;
      AnalyticsSendEventLazy();
    }
    internalQueue = self->_internalQueue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __76__WiFiUsageMonitor_rangingCompletedWithValidCount_resultStatus_resultFlags___block_invoke_2;
    v18[3] = &unk_1E69BC8D8;
    v18[4] = self;
    dispatch_async(internalQueue, v18);
  }
}

id __76__WiFiUsageMonitor_rangingCompletedWithValidCount_resultStatus_resultFlags___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __76__WiFiUsageMonitor_rangingCompletedWithValidCount_resultStatus_resultFlags___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v1 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
  uint64_t v2 = [v1 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v17;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v16 + 1) + 8 * v5);
        long long v12 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v13;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v13 != v10) {
                objc_enumerationMutation(v7);
              }
              [*(id *)(*((void *)&v12 + 1) + 8 * v11++) rangingCompleted];
            }
            while (v9 != v11);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
          }
          while (v9);
        }

        ++v5;
      }
      while (v5 != v3);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v3);
  }
}

- (void)addRangingRttSampleWithRssi:(int64_t)a3 rtt:(int64_t)a4 snr:(unint64_t)a5 flags:(unint64_t)a6 channel:(unint64_t)a7 coreId:(unint64_t)a8 bitErrorRate:(unint64_t)a9 phyError:(unint64_t)a10 andPeerSnr:(unint64_t)a11 andPeerCoreId:(unint64_t)a12 andPeerBitErrorRate:(unint64_t)a13 andPeerPhyError:(unint64_t)a14
{
  long long v17 = [(WiFiUsageMonitor *)self rangingSession];

  if (v17)
  {
    id v18 = [(WiFiUsageMonitor *)self rangingSession];
    [v18 addRangingRttSampleWithRssi:a3 rtt:a4 snr:a5 flags:a6 channel:a7 coreId:a8 bitErrorRate:a9 phyError:a10 andPeerSnr:a11 andPeerCoreId:a12 andPeerBitErrorRate:a13 andPeerPhyError:a14];
  }
}

- (id)lastRangingSessionMetric
{
  uint64_t v2 = [(WiFiUsageMonitor *)self rangingSession];
  uint64_t v3 = [v2 sessionSummary:1];

  return v3;
}

- (id)lastBssSessionInfoForInterface:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = -[NSMutableDictionary valueForKey:](self->_usageSessions, "valueForKey:", v4, 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v10 type] == 4)
          {
            uint64_t v11 = [v10 lastBssSessionInfo];

            goto LABEL_15;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v19 = "-[WiFiUsageMonitor lastBssSessionInfoForInterface:]";
    __int16 v20 = 2112;
    uint64_t v21 = 0;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
  uint64_t v11 = 0;
LABEL_15:

  return v11;
}

- (void)enableXCTestNotifications
{
  if (!self->_xctest)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__WiFiUsageMonitor_enableXCTestNotifications__block_invoke;
    block[3] = &unk_1E69BC8D8;
    void block[4] = self;
    dispatch_async(internalQueue, block);
  }
  self->_xctest = 1;
}

void __45__WiFiUsageMonitor_enableXCTestNotifications__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v1 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
  uint64_t v2 = [v1 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v17;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v16 + 1) + 8 * v5);
        long long v12 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v13;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v13 != v10) {
                objc_enumerationMutation(v7);
              }
              [*(id *)(*((void *)&v12 + 1) + 8 * v11++) enableXCTestNotifications];
            }
            while (v9 != v11);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
          }
          while (v9);
        }

        ++v5;
      }
      while (v5 != v3);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v3);
  }
}

- (void)enableSubmitAnalyticsNoSampling:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  self->_BOOL xctest_disableSampling = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = @"YES";
    if (!self->_xctest_disableSampling) {
      uint64_t v4 = @"NO";
    }
    int v5 = 136315394;
    uint64_t v6 = "-[WiFiUsageMonitor enableSubmitAnalyticsNoSampling:]";
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - _xctest_disableSampling:%@", (uint8_t *)&v5, 0x16u);
  }
}

- (id)canStartLQMAnalysisforTrigger:(id)a3 andReason:(id)a4 onWindow:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] now];
  long long v12 = [[WiFiUsageLQMRelatedTrigger alloc] initWithTrigger:v8 andReason:v9 andTimestamp:v11];
  [v10 addTrigger:v12];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v13 = self->_pendingLqmAnalysis;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "updateWithSubsequentTrigger:", v12, (void)v23);
      }
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v15);
  }

  unint64_t v18 = [(NSMutableArray *)self->_pendingLqmAnalysis count];
  if (v18 >= +[WiFiUsageLQMWindowAnalysis maxConcurrentAnalysis])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v20 = +[WiFiUsageLQMWindowAnalysis maxConcurrentAnalysis];
      int v21 = [(NSMutableArray *)self->_pendingLqmAnalysis count];
      *(_DWORD *)buf = 136315906;
      id v28 = "-[WiFiUsageMonitor canStartLQMAnalysisforTrigger:andReason:onWindow:]";
      __int16 v29 = 2112;
      id v30 = v9;
      __int16 v31 = 2048;
      unint64_t v32 = v20;
      __int16 v33 = 1024;
      int v34 = v21;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Cannot start WiFiUsageLQMWindowAnalysis for %@ (max number of concurrent analysis (%lu) reached: %u)", buf, 0x26u);
    }
    id v19 = 0;
  }
  else
  {
    id v19 = v11;
  }

  return v19;
}

- (void)startLQMAnalysis:(id)a3
{
  id v8 = a3;
  [v8 setCompletionHandler:self->_lqmAnalysisCompletionHandler];
  if (v8)
  {
    if (([v8 isDone] & 1) == 0)
    {
      [(NSMutableArray *)self->_pendingLqmAnalysis addObject:v8];
      uint64_t v4 = [v8 reason];
      int v5 = [v4 isEqualToString:@"InCall"];

      if (v5)
      {
        uint64_t v6 = [v8 timestamp];
        lastInCallAnalysis = self->_lastInCallAnalysis;
        self->_lastInCallAnalysis = v6;
      }
    }
  }
}

- (void)receiveKernelLQMRollingWindow:(id)a3 ForInterface:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[WiFiUsageMonitor receiveKernelLQMRollingWindow:ForInterface:]";
    __int16 v16 = 2112;
    uint64_t v17 = 0;
    id v9 = MEMORY[0x1E4F14500];
    id v10 = "%s - Invalid interfaceName: %@";
    uint32_t v11 = 22;
LABEL_8:
    _os_log_impl(&dword_1D3CCD000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, v11);
    goto LABEL_9;
  }
  if (!+[WiFiUsageLQMWindowAnalysis isKernerlParsingEnabled])
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "-[WiFiUsageMonitor receiveKernelLQMRollingWindow:ForInterface:]";
    id v9 = MEMORY[0x1E4F14500];
    id v10 = "%s - kernel parsing not enabled";
    uint32_t v11 = 12;
    goto LABEL_8;
  }
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__WiFiUsageMonitor_receiveKernelLQMRollingWindow_ForInterface___block_invoke;
  v12[3] = &unk_1E69BC8B0;
  v12[4] = self;
  id v13 = v6;
  dispatch_async(internalQueue, v12);

LABEL_9:
}

void __63__WiFiUsageMonitor_receiveKernelLQMRollingWindow_ForInterface___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  obuint64_t j = (id)[*(id *)(*(void *)(a1 + 32) + 208) copy];
  uint64_t v2 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v7 = *(void *)(a1 + 40);
        id v8 = [v6 windowBeforeTrigger];
        id v9 = [v6 lqmWindowsFeatures];
        id v10 = +[WiFiUsageLQMKernelRollingWindow kernelLQMRollingWindow:v7 withReferenceWindow:v8 andLqmFeatures:v9];
        [v6 setLqmWindowsFeatures:v10];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }
}

- (void)receivedBssTransitionRequest:(id)a3 candidateListIncluded:(BOOL)a4 isAbridged:(BOOL)a5 disassociationImminent:(BOOL)a6 bssTerminationIncluded:(BOOL)a7 essDisassociationImminent:(BOOL)a8
{
  id v14 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __154__WiFiUsageMonitor_receivedBssTransitionRequest_candidateListIncluded_isAbridged_disassociationImminent_bssTerminationIncluded_essDisassociationImminent___block_invoke;
  block[3] = &unk_1E69BD030;
  id v18 = v14;
  id v19 = self;
  BOOL v20 = a4;
  BOOL v21 = a5;
  BOOL v22 = a6;
  BOOL v23 = a7;
  BOOL v24 = a8;
  id v16 = v14;
  dispatch_async(internalQueue, block);
}

void __154__WiFiUsageMonitor_receivedBssTransitionRequest_candidateListIncluded_isAbridged_disassociationImminent_bssTerminationIncluded_essDisassociationImminent___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 104) valueForKey:0];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * v6++) receivedBssTransitionRequestWithCandidateListIncluded:*(unsigned __int8 *)(a1 + 48) isAbridged:*(unsigned __int8 *)(a1 + 49) disassociationImminent:*(unsigned __int8 *)(a1 + 50) bssTerminationIncluded:*(unsigned __int8 *)(a1 + 51) essDisassociationImminent:*(unsigned __int8 *)(a1 + 52)];
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v14 = "-[WiFiUsageMonitor receivedBssTransitionRequest:candidateListIncluded:isAbridged:disassociationImminent:bssTer"
          "minationIncluded:essDisassociationImminent:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)sentBssTransitionResponse:(id)a3 status:(int64_t)a4 terminationDelayRequested:(BOOL)a5
{
  id v8 = a3;
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  _OWORD v11[2] = __79__WiFiUsageMonitor_sentBssTransitionResponse_status_terminationDelayRequested___block_invoke;
  v11[3] = &unk_1E69BD288;
  id v12 = v8;
  long long v13 = self;
  int64_t v14 = a4;
  BOOL v15 = a5;
  id v10 = v8;
  dispatch_async(internalQueue, v11);
}

void __79__WiFiUsageMonitor_sentBssTransitionResponse_status_terminationDelayRequested___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 104) valueForKey:0];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * v6++) sentBssTransitionResponseWithStatus:*(void *)(a1 + 48) terminationDelayRequested:*(unsigned __int8 *)(a1 + 56)];
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    int64_t v14 = "-[WiFiUsageMonitor sentBssTransitionResponse:status:terminationDelayRequested:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)setDeviceInitializationFailureReason:(id)a3 timeSinceBoot:(double)a4
{
  uint64_t v6 = @"Success";
  if (a3) {
    uint64_t v6 = (__CFString *)a3;
  }
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA60];
  long long v8 = v6;
  id v9 = a3;
  long long v10 = [v7 dictionary];
  [v10 setObject:v8 forKeyedSubscript:@"WiFiDeviceInitializationFailureReason"];

  long long v11 = +[WiFiUsagePrivacyFilter numberWithDuration:a4];
  [v10 setObject:v11 forKeyedSubscript:@"WiFiTimeSinceBoot"];

  long long v13 = v10;
  id v12 = v10;
  AnalyticsSendEventLazy();
}

id __71__WiFiUsageMonitor_setDeviceInitializationFailureReason_timeSinceBoot___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)updateWowState:(BOOL)a3 lpasState:(BOOL)a4 lowPowerState:(BOOL)a5 batterySaverState:(BOOL)a6
{
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__WiFiUsageMonitor_updateWowState_lpasState_lowPowerState_batterySaverState___block_invoke;
  v7[3] = &unk_1E69BD2B0;
  void v7[4] = self;
  BOOL v8 = a3;
  BOOL v9 = a4;
  BOOL v10 = a5;
  BOOL v11 = a6;
  dispatch_async(internalQueue, v7);
}

void __77__WiFiUsageMonitor_updateWowState_lpasState_lowPowerState_batterySaverState___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * v6);
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v14;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v14 != v11) {
                objc_enumerationMutation(v8);
              }
              [*(id *)(*((void *)&v13 + 1) + 8 * v12++) updateWowState:*(unsigned __int8 *)(a1 + 40) lpasState:*(unsigned __int8 *)(a1 + 41) lowPowerState:*(unsigned __int8 *)(a1 + 42) batterySaverState:*(unsigned __int8 *)(a1 + 43)];
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }
}

- (void)updateSleepPowerStats:(double)a3 unassociatedDuration:(double)a4 associatedDuration:(double)a5 roamingDuration:(double)a6
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__WiFiUsageMonitor_updateSleepPowerStats_unassociatedDuration_associatedDuration_roamingDuration___block_invoke;
  block[3] = &unk_1E69BD238;
  void block[4] = self;
  *(double *)&void block[5] = a3;
  *(double *)&void block[6] = a4;
  *(double *)&void block[7] = a5;
  *(double *)&block[8] = a6;
  dispatch_async(internalQueue, block);
}

void __98__WiFiUsageMonitor_updateSleepPowerStats_unassociatedDuration_associatedDuration_roamingDuration___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * v6);
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v14;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v14 != v11) {
                objc_enumerationMutation(v8);
              }
              [*(id *)(*((void *)&v13 + 1) + 8 * v12++) updateSleepPowerStats:*(double *)(a1 + 40) unassociatedDuration:*(double *)(a1 + 48) associatedDuration:*(double *)(a1 + 56) roamingDuration:*(double *)(a1 + 64)];
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }
}

uint64_t __47__WiFiUsageMonitor_submitLqmToCA_forInterface___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) asDictionaryInto:*(void *)(a1 + 40)];
}

- (void)submitBootLatenciesToCA
{
  v122[3] = *MEMORY[0x1E4F143B8];
  if (self->_numberOfJoins && !self->_detectedJoinAfterIPConfig)
  {
    if (self->_bootToLastJoin)
    {
      v121[0] = @"latencyType";
      uint64_t v3 = [NSNumber numberWithInteger:0];
      v122[0] = v3;
      v121[1] = @"latencyValue";
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSNumber integerValue](self->_bootToLastJoin, "integerValue"));
      v122[1] = v4;
      v121[2] = @"numberOfJoinsAttempts";
      uint64_t v5 = [NSNumber numberWithInteger:self->_numberOfJoins];
      v122[2] = v5;
      uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v122 forKeys:v121 count:3];

      AnalyticsSendEvent();
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [v6 description];
        *(_DWORD *)buf = 136315394;
        uint64_t v118 = "-[WiFiUsageMonitor submitBootLatenciesToCA]";
        __int16 v119 = 2080;
        uint64_t v120 = [v7 UTF8String];
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: dict_bootToLastJoin: %s\n", buf, 0x16u);
      }
      bootToLastJoin = self->_bootToLastJoin;
      self->_bootToLastJoin = 0;
    }
    if (self->_firstUnlockToLastJoin)
    {
      v115[0] = @"latencyType";
      uint64_t v9 = [NSNumber numberWithInteger:1];
      v116[0] = v9;
      v115[1] = @"latencyValue";
      uint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSNumber integerValue](self->_firstUnlockToLastJoin, "integerValue"));
      v116[1] = v10;
      v115[2] = @"numberOfJoinsAttempts";
      uint64_t v11 = [NSNumber numberWithInteger:self->_numberOfJoins];
      v116[2] = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:v115 count:3];

      AnalyticsSendEvent();
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [v12 description];
        uint64_t v14 = [v13 UTF8String];
        *(_DWORD *)buf = 136315394;
        uint64_t v118 = "-[WiFiUsageMonitor submitBootLatenciesToCA]";
        __int16 v119 = 2080;
        uint64_t v120 = v14;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: dict_firstUnlockToLastJoin: %s\n", buf, 0x16u);
      }
      firstUnlockToLastJoin = self->_firstUnlockToLastJoin;
      self->_firstUnlockToLastJoin = 0;
    }
    if (self->_bootToLastLinkUp)
    {
      v113[0] = @"latencyType";
      long long v16 = [NSNumber numberWithInteger:2];
      v114[0] = v16;
      v113[1] = @"latencyValue";
      long long v17 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSNumber integerValue](self->_bootToLastLinkUp, "integerValue"));
      v114[1] = v17;
      v113[2] = @"numberOfJoinsAttempts";
      long long v18 = [NSNumber numberWithInteger:self->_numberOfJoins];
      v114[2] = v18;
      long long v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v114 forKeys:v113 count:3];

      AnalyticsSendEvent();
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [v19 description];
        uint64_t v21 = [v20 UTF8String];
        *(_DWORD *)buf = 136315394;
        uint64_t v118 = "-[WiFiUsageMonitor submitBootLatenciesToCA]";
        __int16 v119 = 2080;
        uint64_t v120 = v21;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: dict_bootToLastLinkUp: %s\n", buf, 0x16u);
      }
      bootToLastLinkUp = self->_bootToLastLinkUp;
      self->_bootToLastLinkUp = 0;
    }
    if (self->_firstUnlockToLastLinkUp)
    {
      v111[0] = @"latencyType";
      uint64_t v23 = [NSNumber numberWithInteger:3];
      v112[0] = v23;
      v111[1] = @"latencyValue";
      BOOL v24 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSNumber integerValue](self->_firstUnlockToLastLinkUp, "integerValue"));
      v112[1] = v24;
      v111[2] = @"numberOfJoinsAttempts";
      long long v25 = [NSNumber numberWithInteger:self->_numberOfJoins];
      v112[2] = v25;
      long long v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v112 forKeys:v111 count:3];

      AnalyticsSendEvent();
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v27 = [v26 description];
        uint64_t v28 = [v27 UTF8String];
        *(_DWORD *)buf = 136315394;
        uint64_t v118 = "-[WiFiUsageMonitor submitBootLatenciesToCA]";
        __int16 v119 = 2080;
        uint64_t v120 = v28;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: dict_firstUnlockToLastLinkUp: %s\n", buf, 0x16u);
      }
      firstUnlockToLastLinkUp = self->_firstUnlockToLastLinkUp;
      self->_firstUnlockToLastLinkUp = 0;
    }
    if (self->_lastJoinToLastLinkUp)
    {
      v109[0] = @"latencyType";
      id v30 = [NSNumber numberWithInteger:4];
      v110[0] = v30;
      v109[1] = @"latencyValue";
      __int16 v31 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSNumber integerValue](self->_lastJoinToLastLinkUp, "integerValue"));
      v110[1] = v31;
      v109[2] = @"numberOfJoinsAttempts";
      unint64_t v32 = [NSNumber numberWithInteger:self->_numberOfJoins];
      v110[2] = v32;
      __int16 v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v110 forKeys:v109 count:3];

      AnalyticsSendEvent();
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v34 = [v33 description];
        uint64_t v35 = [v34 UTF8String];
        *(_DWORD *)buf = 136315394;
        uint64_t v118 = "-[WiFiUsageMonitor submitBootLatenciesToCA]";
        __int16 v119 = 2080;
        uint64_t v120 = v35;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: dict_lastJoinToLastLinkUp: %s\n", buf, 0x16u);
      }
      lastJoinToLastLinkUp = self->_lastJoinToLastLinkUp;
      self->_lastJoinToLastLinkUp = 0;
    }
    if (self->_bootToIPv4)
    {
      v107[0] = @"latencyType";
      uint64_t v37 = [NSNumber numberWithInteger:5];
      v108[0] = v37;
      v107[1] = @"latencyValue";
      uint64_t v38 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSNumber integerValue](self->_bootToIPv4, "integerValue"));
      v108[1] = v38;
      v107[2] = @"numberOfJoinsAttempts";
      long long v39 = [NSNumber numberWithInteger:self->_numberOfJoins];
      v108[2] = v39;
      long long v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:v107 count:3];

      AnalyticsSendEvent();
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v41 = [v40 description];
        uint64_t v42 = [v41 UTF8String];
        *(_DWORD *)buf = 136315394;
        uint64_t v118 = "-[WiFiUsageMonitor submitBootLatenciesToCA]";
        __int16 v119 = 2080;
        uint64_t v120 = v42;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: dict_bootToIPv4: %s\n", buf, 0x16u);
      }
      bootToIPuint64_t v4 = self->_bootToIPv4;
      self->_bootToIPuint64_t v4 = 0;
    }
    if (self->_firstUnlockToIPv4)
    {
      v105[0] = @"latencyType";
      id v44 = [NSNumber numberWithInteger:6];
      v106[0] = v44;
      v105[1] = @"latencyValue";
      uint64_t v45 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSNumber integerValue](self->_firstUnlockToIPv4, "integerValue"));
      v106[1] = v45;
      v105[2] = @"numberOfJoinsAttempts";
      int v46 = [NSNumber numberWithInteger:self->_numberOfJoins];
      v106[2] = v46;
      __int16 v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:v105 count:3];

      AnalyticsSendEvent();
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v48 = [v47 description];
        uint64_t v49 = [v48 UTF8String];
        *(_DWORD *)buf = 136315394;
        uint64_t v118 = "-[WiFiUsageMonitor submitBootLatenciesToCA]";
        __int16 v119 = 2080;
        uint64_t v120 = v49;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: dict_firstUnlockToIPv4: %s\n", buf, 0x16u);
      }
      firstUnlockToIPuint64_t v4 = self->_firstUnlockToIPv4;
      self->_firstUnlockToIPuint64_t v4 = 0;
    }
    if (self->_lastJoinToIPv4)
    {
      v103[0] = @"latencyType";
      uint64_t v51 = [NSNumber numberWithInteger:7];
      v104[0] = v51;
      v103[1] = @"latencyValue";
      BOOL v52 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSNumber integerValue](self->_lastJoinToIPv4, "integerValue"));
      v104[1] = v52;
      v103[2] = @"numberOfJoinsAttempts";
      int v53 = [NSNumber numberWithInteger:self->_numberOfJoins];
      v104[2] = v53;
      uint64_t v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v104 forKeys:v103 count:3];

      AnalyticsSendEvent();
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v55 = [v54 description];
        uint64_t v56 = [v55 UTF8String];
        *(_DWORD *)buf = 136315394;
        uint64_t v118 = "-[WiFiUsageMonitor submitBootLatenciesToCA]";
        __int16 v119 = 2080;
        uint64_t v120 = v56;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: dict_lastJoinToIPv4: %s\n", buf, 0x16u);
      }
      lastJoinToIPuint64_t v4 = self->_lastJoinToIPv4;
      self->_lastJoinToIPuint64_t v4 = 0;
    }
    if (self->_lastLinkUpToIPv4)
    {
      v101[0] = @"latencyType";
      long long v58 = [NSNumber numberWithInteger:8];
      v102[0] = v58;
      v101[1] = @"latencyValue";
      uint64_t v59 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSNumber integerValue](self->_lastLinkUpToIPv4, "integerValue"));
      v102[1] = v59;
      v101[2] = @"numberOfJoinsAttempts";
      int v60 = [NSNumber numberWithInteger:self->_numberOfJoins];
      v102[2] = v60;
      long long v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:v101 count:3];

      AnalyticsSendEvent();
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v62 = [v61 description];
        uint64_t v63 = [v62 UTF8String];
        *(_DWORD *)buf = 136315394;
        uint64_t v118 = "-[WiFiUsageMonitor submitBootLatenciesToCA]";
        __int16 v119 = 2080;
        uint64_t v120 = v63;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: dict_lastLinkUpToIPv4: %s\n", buf, 0x16u);
      }
      lastLinkUpToIPuint64_t v4 = self->_lastLinkUpToIPv4;
      self->_lastLinkUpToIPuint64_t v4 = 0;
    }
    if (self->_bootToIPv6)
    {
      v99[0] = @"latencyType";
      long long v65 = [NSNumber numberWithInteger:9];
      v100[0] = v65;
      v99[1] = @"latencyValue";
      unint64_t v66 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSNumber integerValue](self->_bootToIPv6, "integerValue"));
      v100[1] = v66;
      v99[2] = @"numberOfJoinsAttempts";
      long long v67 = [NSNumber numberWithInteger:self->_numberOfJoins];
      v100[2] = v67;
      v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:v99 count:3];

      AnalyticsSendEvent();
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v69 = [v68 description];
        uint64_t v70 = [v69 UTF8String];
        *(_DWORD *)buf = 136315394;
        uint64_t v118 = "-[WiFiUsageMonitor submitBootLatenciesToCA]";
        __int16 v119 = 2080;
        uint64_t v120 = v70;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: dict_bootToIPv6: %s\n", buf, 0x16u);
      }
      bootToIPuint64_t v6 = self->_bootToIPv6;
      self->_bootToIPuint64_t v6 = 0;
    }
    if (self->_firstUnlockToIPv6)
    {
      v97[0] = @"latencyType";
      unsigned int v72 = [NSNumber numberWithInteger:10];
      v98[0] = v72;
      v97[1] = @"latencyValue";
      unsigned int v73 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSNumber integerValue](self->_firstUnlockToIPv6, "integerValue"));
      v98[1] = v73;
      v97[2] = @"numberOfJoinsAttempts";
      uint64_t v74 = [NSNumber numberWithInteger:self->_numberOfJoins];
      v98[2] = v74;
      int v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:v97 count:3];

      AnalyticsSendEvent();
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v76 = [v75 description];
        uint64_t v77 = [v76 UTF8String];
        *(_DWORD *)buf = 136315394;
        uint64_t v118 = "-[WiFiUsageMonitor submitBootLatenciesToCA]";
        __int16 v119 = 2080;
        uint64_t v120 = v77;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: dict_firstUnlockToIPv6: %s\n", buf, 0x16u);
      }
      firstUnlockToIPuint64_t v6 = self->_firstUnlockToIPv6;
      self->_firstUnlockToIPuint64_t v6 = 0;
    }
    if (self->_lastJoinToIPv6)
    {
      v95[0] = @"latencyType";
      uint64_t v79 = [NSNumber numberWithInteger:11];
      v96[0] = v79;
      v95[1] = @"latencyValue";
      v80 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSNumber integerValue](self->_lastJoinToIPv6, "integerValue"));
      v96[1] = v80;
      v95[2] = @"numberOfJoinsAttempts";
      v81 = [NSNumber numberWithInteger:self->_numberOfJoins];
      v96[2] = v81;
      v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:3];

      AnalyticsSendEvent();
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v83 = [v82 description];
        uint64_t v84 = [v83 UTF8String];
        *(_DWORD *)buf = 136315394;
        uint64_t v118 = "-[WiFiUsageMonitor submitBootLatenciesToCA]";
        __int16 v119 = 2080;
        uint64_t v120 = v84;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: dict_lastJoinToIPv6: %s\n", buf, 0x16u);
      }
      lastJoinToIPuint64_t v6 = self->_lastJoinToIPv6;
      self->_lastJoinToIPuint64_t v6 = 0;
    }
    if (self->_lastLinkUpToIPv6)
    {
      uint64_t v86 = objc_msgSend(NSNumber, "numberWithInteger:", 12, @"latencyType");
      v94[0] = v86;
      v93[1] = @"latencyValue";
      uint64_t v87 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSNumber integerValue](self->_lastLinkUpToIPv6, "integerValue"));
      v94[1] = v87;
      v93[2] = @"numberOfJoinsAttempts";
      unsigned int v88 = [NSNumber numberWithInteger:self->_numberOfJoins];
      v94[2] = v88;
      unsigned int v89 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:3];

      AnalyticsSendEvent();
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v90 = [v89 description];
        uint64_t v91 = [v90 UTF8String];
        *(_DWORD *)buf = 136315394;
        uint64_t v118 = "-[WiFiUsageMonitor submitBootLatenciesToCA]";
        __int16 v119 = 2080;
        uint64_t v120 = v91;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: dict_lastLinkUpToIPv6: %s\n", buf, 0x16u);
      }
      lastLinkUpToIPuint64_t v6 = self->_lastLinkUpToIPv6;
      self->_lastLinkUpToIPuint64_t v6 = 0;
    }
  }
}

- (void)updateIsBSPActive:(BOOL)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__WiFiUsageMonitor_updateIsBSPActive___block_invoke;
  v4[3] = &unk_1E69BC930;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(internalQueue, v4);
}

uint64_t __38__WiFiUsageMonitor_updateIsBSPActive___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsBSPActive:*(unsigned __int8 *)(a1 + 40)];
}

- (void)updateWithBspOverflowed:(BOOL)a3 IsBSPActive:(BOOL)a4 BspTimeToTST:(unint64_t)a5 BspSampleDurationMS:(unint64_t)a6 IsScanActiveBSP:(BOOL)a7 IsP2PActiveBSP:(BOOL)a8 BspTriggerCount:(unint64_t)a9 BspMutePercentage:(unint64_t)a10 BspMaxMuteMS:(unint64_t)a11 BspAvgMuteMS:(unint64_t)a12 BspErrorPercentage:(unint64_t)a13 BspTimeOutPercentageOfTriggers:(unint64_t)a14 BspRejectOrFailPercentageOfTriggers:(unint64_t)a15 bspMaxConsecutiveFails:(unint64_t)a16 supportsLinkRecommendation:(BOOL)a17 forInterface:(id)a18
{
  id v24 = a18;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __329__WiFiUsageMonitor_updateWithBspOverflowed_IsBSPActive_BspTimeToTST_BspSampleDurationMS_IsScanActiveBSP_IsP2PActiveBSP_BspTriggerCount_BspMutePercentage_BspMaxMuteMS_BspAvgMuteMS_BspErrorPercentage_BspTimeOutPercentageOfTriggers_BspRejectOrFailPercentageOfTriggers_bspMaxConsecutiveFails_supportsLinkRecommendation_forInterface___block_invoke;
  block[3] = &unk_1E69BD300;
  void block[4] = self;
  id v29 = v24;
  BOOL v37 = a3;
  BOOL v38 = a4;
  unint64_t v30 = a5;
  unint64_t v31 = a6;
  BOOL v39 = a7;
  BOOL v40 = a8;
  long long v32 = *(_OWORD *)&a9;
  long long v33 = *(_OWORD *)&a11;
  long long v34 = *(_OWORD *)&a13;
  unint64_t v35 = a15;
  unint64_t v36 = a16;
  BOOL v41 = a17;
  id v26 = v24;
  dispatch_async(internalQueue, block);
}

void __329__WiFiUsageMonitor_updateWithBspOverflowed_IsBSPActive_BspTimeToTST_BspSampleDurationMS_IsScanActiveBSP_IsP2PActiveBSP_BspTriggerCount_BspMutePercentage_BspMaxMuteMS_BspAvgMuteMS_BspErrorPercentage_BspTimeOutPercentageOfTriggers_BspRejectOrFailPercentageOfTriggers_bspMaxConsecutiveFails_supportsLinkRecommendation_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 120) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 samples];
  BOOL v5 = [v3 lastObject];

  [v5 populateWithBspOverflowed:*(unsigned __int8 *)(a1 + 128) IsBSPActive:*(unsigned __int8 *)(a1 + 129) BspTimeToTST:*(void *)(a1 + 48) BspSampleDurationMS:*(void *)(a1 + 56) IsScanActiveBSP:*(unsigned __int8 *)(a1 + 130) IsP2PActiveBSP:*(unsigned __int8 *)(a1 + 131) BspTriggerCount:*(void *)(a1 + 64) BspMutePercentage:*(void *)(a1 + 72) BspMaxMuteMS:*(void *)(a1 + 80) BspAvgMuteMS:*(void *)(a1 + 88) BspErrorPercentage:*(void *)(a1 + 96) BspTimeOutPercentageOfTriggers:*(void *)(a1 + 104) BspRejectOrFailPercentageOfTriggers:*(void *)(a1 + 112) BspMaxConsecutiveFails:*(void *)(a1 + 120)];
  if ([*(id *)(a1 + 32) isBSPActive])
  {
    if (!*(unsigned char *)(a1 + 132)
      || ([v5 numberForKeyPath:@"chanQualScore"],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          v4,
          v4))
    {
      [*(id *)(a1 + 32) submitLqmToCA:v5 forInterface:*(void *)(a1 + 40)];
    }
  }
}

- (void)notifyIPv4Changes:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__WiFiUsageMonitor_notifyIPv4Changes___block_invoke;
  v7[3] = &unk_1E69BC8B0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __38__WiFiUsageMonitor_notifyIPv4Changes___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [[WiFiUsageNetworkIPv4Details alloc] initWithDictionary:*(void *)(a1 + 32)];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v46 = "-[WiFiUsageMonitor notifyIPv4Changes:]_block_invoke";
    __int16 v47 = 2112;
    id v48 = v2;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - details: %@", buf, 0x16u);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 104) allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v40;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v40 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v39 + 1) + 8 * v7);
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v36;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v36 != v12) {
                objc_enumerationMutation(v9);
              }
              [*(id *)(*((void *)&v35 + 1) + 8 * v13++) processIPv4Changes:v2];
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v43 count:16];
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v5);
  }

  if ([(WiFiUsageNetworkIPv4Details *)v2 isValid])
  {
    uint64_t v14 = *(void *)(a1 + 40);
    if (!*(void *)(v14 + 408) && *(void *)(v14 + 328) <= 0x64uLL)
    {
      uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v16 = *(void *)(a1 + 40);
      long long v17 = *(void **)(v16 + 408);
      *(void *)(v16 + 408) = v15;

      long long v18 = NSNumber;
      +[WiFiUsagePrivacyFilter timeSinceBootInSeconds];
      uint64_t v19 = objc_msgSend(v18, "numberWithDouble:");
      uint64_t v20 = *(void *)(a1 + 40);
      uint64_t v21 = *(void **)(v20 + 416);
      *(void *)(v20 + 416) = v19;

      uint64_t v22 = *(void *)(a1 + 40);
      if (*(void *)(v22 + 344))
      {
        uint64_t v23 = NSNumber;
        objc_msgSend(*(id *)(v22 + 408), "timeIntervalSinceDate:");
        uint64_t v24 = objc_msgSend(v23, "numberWithDouble:");
        uint64_t v25 = *(void *)(a1 + 40);
        id v26 = *(void **)(v25 + 424);
        *(void *)(v25 + 424) = v24;

        uint64_t v22 = *(void *)(a1 + 40);
      }
      if (*(void *)(v22 + 352))
      {
        id v27 = NSNumber;
        objc_msgSend(*(id *)(v22 + 408), "timeIntervalSinceDate:");
        uint64_t v28 = objc_msgSend(v27, "numberWithDouble:");
        uint64_t v29 = *(void *)(a1 + 40);
        unint64_t v30 = *(void **)(v29 + 432);
        *(void *)(v29 + 432) = v28;

        uint64_t v22 = *(void *)(a1 + 40);
      }
      if (*(void *)(v22 + 376))
      {
        unint64_t v31 = NSNumber;
        objc_msgSend(*(id *)(v22 + 408), "timeIntervalSinceDate:");
        uint64_t v32 = objc_msgSend(v31, "numberWithDouble:");
        uint64_t v33 = *(void *)(a1 + 40);
        long long v34 = *(void **)(v33 + 440);
        *(void *)(v33 + 440) = v32;

        uint64_t v22 = *(void *)(a1 + 40);
      }
      [(id)v22 submitBootLatenciesToCA];
    }
  }
}

- (void)notifyIPv6Changes:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__WiFiUsageMonitor_notifyIPv6Changes___block_invoke;
  v7[3] = &unk_1E69BC8B0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __38__WiFiUsageMonitor_notifyIPv6Changes___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [[WiFiUsageNetworkIPv6Details alloc] initWithDictionary:*(void *)(a1 + 32)];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v46 = "-[WiFiUsageMonitor notifyIPv6Changes:]_block_invoke";
    __int16 v47 = 2112;
    id v48 = v2;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - details: %@", buf, 0x16u);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 104) allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v40;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v40 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v39 + 1) + 8 * v7);
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v36;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v36 != v12) {
                objc_enumerationMutation(v9);
              }
              [*(id *)(*((void *)&v35 + 1) + 8 * v13++) processIPv6Changes:v2];
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v43 count:16];
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v5);
  }

  if ([(WiFiUsageNetworkIPv6Details *)v2 isValid])
  {
    uint64_t v14 = *(void *)(a1 + 40);
    if (!*(void *)(v14 + 448) && *(void *)(v14 + 328) <= 0x64uLL)
    {
      uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v16 = *(void *)(a1 + 40);
      long long v17 = *(void **)(v16 + 448);
      *(void *)(v16 + 448) = v15;

      long long v18 = NSNumber;
      +[WiFiUsagePrivacyFilter timeSinceBootInSeconds];
      uint64_t v19 = objc_msgSend(v18, "numberWithDouble:");
      uint64_t v20 = *(void *)(a1 + 40);
      uint64_t v21 = *(void **)(v20 + 456);
      *(void *)(v20 + 456) = v19;

      uint64_t v22 = *(void *)(a1 + 40);
      if (*(void *)(v22 + 344))
      {
        uint64_t v23 = NSNumber;
        objc_msgSend(*(id *)(v22 + 448), "timeIntervalSinceDate:");
        uint64_t v24 = objc_msgSend(v23, "numberWithDouble:");
        uint64_t v25 = *(void *)(a1 + 40);
        id v26 = *(void **)(v25 + 464);
        *(void *)(v25 + 464) = v24;

        uint64_t v22 = *(void *)(a1 + 40);
      }
      if (*(void *)(v22 + 352))
      {
        id v27 = NSNumber;
        objc_msgSend(*(id *)(v22 + 448), "timeIntervalSinceDate:");
        uint64_t v28 = objc_msgSend(v27, "numberWithDouble:");
        uint64_t v29 = *(void *)(a1 + 40);
        unint64_t v30 = *(void **)(v29 + 472);
        *(void *)(v29 + 472) = v28;

        uint64_t v22 = *(void *)(a1 + 40);
      }
      if (*(void *)(v22 + 376))
      {
        unint64_t v31 = NSNumber;
        objc_msgSend(*(id *)(v22 + 448), "timeIntervalSinceDate:");
        uint64_t v32 = objc_msgSend(v31, "numberWithDouble:");
        uint64_t v33 = *(void *)(a1 + 40);
        long long v34 = *(void **)(v33 + 480);
        *(void *)(v33 + 480) = v32;

        uint64_t v22 = *(void *)(a1 + 40);
      }
      [(id)v22 submitBootLatenciesToCA];
    }
  }
}

- (void)notifyDHCPChanges:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__WiFiUsageMonitor_notifyDHCPChanges___block_invoke;
  v7[3] = &unk_1E69BC8B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __38__WiFiUsageMonitor_notifyDHCPChanges___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315906;
    id v26 = "-[WiFiUsageMonitor notifyDHCPChanges:]_block_invoke";
    __int16 v27 = 1024;
    int v28 = 3143;
    __int16 v29 = 2048;
    uint64_t v30 = v2;
    __int16 v31 = 2112;
    uint64_t v32 = v3;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s:%d, self[%p], dictionary: %@", buf, 0x26u);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v16;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v16 != v13) {
                objc_enumerationMutation(v10);
              }
              [*(id *)(*((void *)&v15 + 1) + 8 * v14++) processDHCPChanges:*(void *)(a1 + 40)];
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }
}

- (void)notifyIpConfigurationStateWithMethod:(BOOL)a3 dhcpLeaseDuration:(double)a4 hasRoutableIpV4:(BOOL)a5 hasRoutableIpV6:(BOOL)a6
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__WiFiUsageMonitor_notifyIpConfigurationStateWithMethod_dhcpLeaseDuration_hasRoutableIpV4_hasRoutableIpV6___block_invoke;
  block[3] = &unk_1E69BD328;
  void block[4] = self;
  BOOL v8 = a3;
  *(double *)&void block[5] = a4;
  BOOL v9 = a5;
  BOOL v10 = a6;
  dispatch_async(internalQueue, block);
}

void __107__WiFiUsageMonitor_notifyIpConfigurationStateWithMethod_dhcpLeaseDuration_hasRoutableIpV4_hasRoutableIpV6___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * v6);
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v14;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v14 != v11) {
                objc_enumerationMutation(v8);
              }
              [*(id *)(*((void *)&v13 + 1) + 8 * v12++) ipConfigurationDidChangeWithMethod:*(unsigned __int8 *)(a1 + 48) dhcpLeaseDuration:*(unsigned __int8 *)(a1 + 49) hasRoutableIpV4:*(unsigned __int8 *)(a1 + 50) hasRoutableIpV6:*(double *)(a1 + 40)];
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }
}

- (void)notifyInterfaceRankingState:(BOOL)a3 forInterface:(id)a4
{
  id v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__WiFiUsageMonitor_notifyInterfaceRankingState_forInterface___block_invoke;
  block[3] = &unk_1E69BCE78;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

void __61__WiFiUsageMonitor_notifyInterfaceRankingState_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 104) objectForKey:*(void *)(a1 + 40)];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) interfaceRankingDidChange:*(unsigned __int8 *)(a1 + 48)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)notifyDriverAvailability:(id)a3 available:(unint64_t)a4 version:(unint64_t)a5 flags:(unint64_t)a6 eventID:(unint64_t)a7 reason:(unint64_t)a8 subReason:(unint64_t)a9 minorReason:(unint64_t)a10 reasonString:(id)a11
{
  id v17 = a3;
  id v18 = a11;
  internalQueue = self->_internalQueue;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __119__WiFiUsageMonitor_notifyDriverAvailability_available_version_flags_eventID_reason_subReason_minorReason_reasonString___block_invoke;
  v22[3] = &unk_1E69BD350;
  v22[4] = self;
  id v23 = v17;
  unint64_t v26 = a5;
  unint64_t v27 = a6;
  unint64_t v28 = a7;
  unint64_t v29 = a8;
  unint64_t v30 = a9;
  unint64_t v31 = a10;
  id v24 = v18;
  unint64_t v25 = a4;
  id v20 = v18;
  id v21 = v17;
  dispatch_async(internalQueue, v22);
}

void __119__WiFiUsageMonitor_notifyDriverAvailability_available_version_flags_eventID_reason_subReason_minorReason_reasonString___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = [*(id *)(a1[4] + 104) valueForKey:a1[5]];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) processDriverAvailability:a1[5] available:a1[7] version:a1[8] flags:a1[9] eventID:a1[10] reason:a1[11] subReason:a1[12] minorReason:a1[13] reasonString:a1[6]];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)updateWithRoamingSuppression:(unsigned __int8)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__WiFiUsageMonitor_updateWithRoamingSuppression___block_invoke;
  v4[3] = &unk_1E69BC930;
  v4[4] = self;
  unsigned __int8 v5 = a3;
  dispatch_async(internalQueue, v4);
}

void __49__WiFiUsageMonitor_updateWithRoamingSuppression___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v16;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v16 != v11) {
                objc_enumerationMutation(v8);
              }
              long long v13 = *(void **)(*((void *)&v15 + 1) + 8 * j);
              [v13 updateWithRoamingSuppression:*(unsigned __int8 *)(a1 + 40)];
              if ([v13 type] == 4)
              {
                long long v14 = [v13 currentBssSession];
                [v14 updateWithRoamingSuppression:*(unsigned __int8 *)(a1 + 40)];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v10);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v4);
  }
}

- (void)updateWithCompatibilityMode:(unsigned __int8)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__WiFiUsageMonitor_updateWithCompatibilityMode___block_invoke;
  v4[3] = &unk_1E69BC930;
  v4[4] = self;
  unsigned __int8 v5 = a3;
  dispatch_async(internalQueue, v4);
}

uint64_t __48__WiFiUsageMonitor_updateWithCompatibilityMode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCompatibilityModeEnabled:*(unsigned char *)(a1 + 40) != 0];
}

- (void)updateCurrentNetworkDetails:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__WiFiUsageMonitor_updateCurrentNetworkDetails___block_invoke;
  v7[3] = &unk_1E69BC8B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __48__WiFiUsageMonitor_updateCurrentNetworkDetails___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 264), *(id *)(a1 + 40));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = *(void **)(*((void *)&v17 + 1) + 8 * v6);
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v14;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v14 != v11) {
                objc_enumerationMutation(v8);
              }
              [*(id *)(*((void *)&v13 + 1) + 8 * v12++) updateAssociatedNetworkDetails:*(void *)(a1 + 40)];
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }
}

- (void)updateRealTimeCoex:(BOOL)a3 type:(unint64_t)a4 reasons:(id)a5
{
  id v8 = a5;
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  _OWORD v11[2] = __52__WiFiUsageMonitor_updateRealTimeCoex_type_reasons___block_invoke;
  v11[3] = &unk_1E69BD288;
  BOOL v14 = a3;
  id v12 = v8;
  unint64_t v13 = a4;
  void v11[4] = self;
  id v10 = v8;
  dispatch_async(internalQueue, v11);
}

void __52__WiFiUsageMonitor_updateRealTimeCoex_type_reasons___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = *(void **)(*((void *)&v17 + 1) + 8 * v6);
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v14;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v14 != v11) {
                objc_enumerationMutation(v8);
              }
              [*(id *)(*((void *)&v13 + 1) + 8 * v12++) setRealtimeCoexStarted:*(unsigned __int8 *)(a1 + 56) type:*(void *)(a1 + 48) reasons:*(void *)(a1 + 40)];
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }
}

- (void)setAwdlSequence:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__WiFiUsageMonitor_setAwdlSequence___block_invoke;
  v7[3] = &unk_1E69BC8B0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __36__WiFiUsageMonitor_setAwdlSequence___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v32;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        unsigned int v10 = [*(id *)(*(void *)(a1 + 40) + 264) isCurrentBssOnChannel:v9];
        if (([v9 is5GHz] & 1) != 0 || objc_msgSend(v9, "is6GHz"))
        {
          double v7 = v7 + 1.0;
        }
        else if (objc_msgSend(v9, "is2_4GHz"))
        {
          double v7 = v7 + 0.5;
        }
        v5 += v10;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
    double v7 = 0.0;
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = [*(id *)(*(void *)(a1 + 40) + 104) allValues];
  uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v22 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v35 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v24;
          do
          {
            for (uint64_t k = 0; k != v17; ++k)
            {
              if (*(void *)v24 != v18) {
                objc_enumerationMutation(v15);
              }
              long long v20 = *(void **)(*((void *)&v23 + 1) + 8 * k);
              [v20 setAwdlSequence:*(void *)(a1 + 32) infraScore:v5 p2pScore:v7];
              [v20 setRealTimeCoexStatus:v7 >= 16.0 type:0];
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v35 count:16];
          }
          while (v17);
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v12);
  }
}

- (void)updateLinkRecoveryDisabled:(BOOL)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__WiFiUsageMonitor_updateLinkRecoveryDisabled___block_invoke;
  v4[3] = &unk_1E69BC930;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(internalQueue, v4);
}

void __47__WiFiUsageMonitor_updateLinkRecoveryDisabled___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "allValues", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) updateLinkRecoveryDisabled:*(unsigned __int8 *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)updateLinkTestInterval:(unint64_t)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__WiFiUsageMonitor_updateLinkTestInterval___block_invoke;
  v4[3] = &unk_1E69BD378;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(internalQueue, v4);
}

void __43__WiFiUsageMonitor_updateLinkTestInterval___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "allValues", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) updateLinkTestInterval:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)setSteeringRequest:(unint64_t)a3 preferredChannel:(unint64_t)a4 preferredBand:(int)a5 preferredSSID:(id)a6 targetSSIDDiffersFromCurrent:(BOOL)a7 preferredBSS:(id)a8 ssidIsSplit:(BOOL)a9 transitionCandidates:(BOOL)a10
{
  id v16 = a6;
  id v17 = a8;
  internalQueue = self->_internalQueue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __159__WiFiUsageMonitor_setSteeringRequest_preferredChannel_preferredBand_preferredSSID_targetSSIDDiffersFromCurrent_preferredBSS_ssidIsSplit_transitionCandidates___block_invoke;
  v21[3] = &unk_1E69BD3A0;
  unint64_t v24 = a3;
  unint64_t v25 = a4;
  int v26 = a5;
  v21[4] = self;
  id v22 = v16;
  BOOL v27 = a7;
  id v23 = v17;
  BOOL v28 = a9;
  BOOL v29 = a10;
  id v19 = v17;
  id v20 = v16;
  dispatch_async(internalQueue, v21);
}

void __159__WiFiUsageMonitor_setSteeringRequest_preferredChannel_preferredBand_preferredSSID_targetSSIDDiffersFromCurrent_preferredBSS_ssidIsSplit_transitionCandidates___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = *(void **)(*((void *)&v18 + 1) + 8 * v6);
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v15;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v15 != v11) {
                objc_enumerationMutation(v8);
              }
              LOWORD(v13) = *(_WORD *)(a1 + 77);
              objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12++), "setSteeringRequest:preferredChannel:preferredBand:preferredSSID:targetSSIDDiffersFromCurrent:preferredBSS:ssidIsSplit:transitionCandidates:", *(void *)(a1 + 56), *(void *)(a1 + 64), *(unsigned int *)(a1 + 72), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 76), *(void *)(a1 + 48), v13);
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }
}

- (void)updateKnownNetworksSupportingSeamless:(id)a3 forBSS:(id)a4 andSSID:(id)a5 beaconCache:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__WiFiUsageMonitor_updateKnownNetworksSupportingSeamless_forBSS_andSSID_beaconCache___block_invoke;
  block[3] = &unk_1E69BCF68;
  id v20 = v11;
  id v21 = v13;
  id v22 = v12;
  id v23 = v10;
  uint64_t v24 = self;
  id v15 = v10;
  id v16 = v12;
  id v17 = v13;
  id v18 = v11;
  dispatch_async(internalQueue, block);
}

void __85__WiFiUsageMonitor_updateKnownNetworksSupportingSeamless_forBSS_andSSID_beaconCache___block_invoke(uint64_t a1)
{
  uint64_t v177 = *MEMORY[0x1E4F143B8];
  __int16 v127 = objc_opt_new();
  v114 = objc_opt_new();
  id v107 = (id)objc_opt_new();
  long long v109 = objc_opt_new();
  BOOL v111 = +[WiFiUsagePrivacyFilter isLocallyAdministeredBitSetInBSSData:*(void *)(a1 + 32)];
  long long v158 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  uint64_t v115 = a1;
  obuint64_t j = *(id *)(a1 + 40);
  uint64_t v118 = [obj countByEnumeratingWithState:&v158 objects:v176 count:16];
  if (v118)
  {
    uint64_t v128 = 0;
    id v116 = *(id *)v159;
    unint64_t v103 = -1;
    unint64_t v105 = -1;
    do
    {
      for (uint64_t i = 0; i != v118; ++i)
      {
        if (*(id *)v159 != v116) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void **)(*((void *)&v158 + 1) + 8 * i);
        uint64_t v125 = [v3 objectForKey:@"BSSID"];
        uint64_t v4 = +[WiFiUsagePrivacyFilter macAddressData:](WiFiUsagePrivacyFilter, "macAddressData:");
        BOOL v5 = +[WiFiUsagePrivacyFilter isLocallyAdministeredBitSetInBSSData:v4];
        uint64_t v6 = [v3 objectForKey:@"SSID"];
        __int16 v123 = (void *)v4;
        BOOL v120 = v5;
        if (v6) {
          long long v7 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
        }
        else {
          long long v7 = 0;
        }
        id v8 = [v3 objectForKey:@"CHANNEL"];
        uint64_t v9 = [v8 unsignedIntegerValue];
        id v10 = [v3 objectForKey:@"CHANNEL_FLAGS"];
        uint64_t v11 = [v10 unsignedIntegerValue];
        id v12 = [v3 objectForKey:@"RSSI"];
        id v13 = (void *)v125;
        long long v14 = +[WiFiUsageBssDetails bssWithIdentifier:channel:channelFlags:rssi:](WiFiUsageBssDetails, "bssWithIdentifier:channel:channelFlags:rssi:", v125, v9, v11, [v12 integerValue]);

        if (v14) {
          [v114 addObject:v14];
        }
        if (v6
          && [v6 length]
          && ([v123 isEqualToData:*(void *)(v115 + 32)] & 1) == 0
          && ((v111 ^ v120) & 1) == 0)
        {
          if ([v7 isEqualToString:*(void *)(v115 + 48)])
          {
            ++v128;
          }
          else
          {
            [v127 addObject:v6];
            id v15 = +[DataComparisonByBytes dataComparisonByBytesWithData1:v123 data2:*(void *)(v115 + 32) reference:v6];
            if (+[ObjectComparisonByTokens addComparison:to:ifMinOverlap:](ObjectComparisonByTokens, "addComparison:to:ifMinOverlap:", v15, v107, 4)&& [v15 distance] < v105)
            {
              unint64_t v105 = [v15 distance];
            }
            id v16 = +[StringComparisonByChars stringComparisonByCharsWithString1:v7 string2:*(void *)(v115 + 48) reference:v6];
            if (+[ObjectComparisonByTokens addComparison:to:ifMinOverlap:](ObjectComparisonByTokens, "addComparison:to:ifMinOverlap:", v16, v109, (unint64_t)[*(id *)(v115 + 48) length] >> 1)&& objc_msgSend(v16, "diffTokensCount") != 0x7FFFFFFFFFFFFFFFLL&& objc_msgSend(v16, "diffTokensCount") < v103)
            {
              unint64_t v103 = [v16 diffTokensCount];
            }
          }
          id v13 = (void *)v125;
        }
      }
      uint64_t v118 = [obj countByEnumeratingWithState:&v158 objects:v176 count:16];
    }
    while (v118);
  }
  else
  {
    uint64_t v128 = 0;
    unint64_t v103 = -1;
    unint64_t v105 = -1;
  }

  uint64_t v17 = v115;
  id v18 = [*(id *)(v115 + 56) set];
  [v127 intersectSet:v18];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    long long v19 = [*(id *)(v115 + 48) dataUsingEncoding:4];
    *(_DWORD *)buf = 136315907;
    v169 = "-[WiFiUsageMonitor updateKnownNetworksSupportingSeamless:forBSS:andSSID:beaconCache:]_block_invoke";
    __int16 v170 = 2160;
    uint64_t v171 = 1752392040;
    __int16 v172 = 2112;
    v173 = v19;
    __int16 v174 = 2113;
    v175 = v127;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s -  SSIDTransitionCandidates(excluding %{mask.hash}@):%{private}@\n", buf, 0x2Au);
  }
  id v20 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"distance == %lu", v105);
  [v107 filterUsingPredicate:v20];

  id v21 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"diffTokensCount == %lu", v103);
  [v109 filterUsingPredicate:v21];

  id v22 = objc_opt_new();
  long long v154 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  id v23 = v107;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v154 objects:v167 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v155;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v155 != v26) {
          objc_enumerationMutation(v23);
        }
        BOOL v28 = *(void **)(*((void *)&v154 + 1) + 8 * j);
        BOOL v29 = [v28 reference];
        long long v30 = [v22 objectForKeyedSubscript:v29];

        if (!v30)
        {
          long long v31 = objc_opt_new();
          long long v32 = [v28 reference];
          [v22 setObject:v31 forKeyedSubscript:v32];
        }
        long long v33 = [v28 reference];
        long long v34 = [v22 objectForKeyedSubscript:v33];
        [v34 addObject:v28];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v154 objects:v167 count:16];
    }
    while (v25);
  }

  long long v152 = 0u;
  long long v153 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  id v117 = v109;
  uint64_t v35 = [v117 countByEnumeratingWithState:&v150 objects:v166 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v151;
    do
    {
      for (uint64_t k = 0; k != v36; ++k)
      {
        if (*(void *)v151 != v37) {
          objc_enumerationMutation(v117);
        }
        long long v39 = *(void **)(*((void *)&v150 + 1) + 8 * k);
        long long v40 = [v39 reference];
        long long v41 = [v22 objectForKeyedSubscript:v40];

        if (!v41)
        {
          long long v42 = objc_opt_new();
          long long v43 = [v39 reference];
          [v22 setObject:v42 forKeyedSubscript:v43];
        }
        id v44 = [v39 reference];
        uint64_t v45 = [v22 objectForKeyedSubscript:v44];
        [v45 addObject:v39];
      }
      uint64_t v36 = [v117 countByEnumeratingWithState:&v150 objects:v166 count:16];
    }
    while (v36);
  }
  long long v104 = v23;

  int v46 = [v22 keysOfEntriesPassingTest:&__block_literal_global_725];
  uint64_t v47 = [v46 allObjects];
  id v48 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v49 = objc_opt_new();
  long long v106 = v22;
  uint64_t v50 = [v22 objectsForKeys:v47 notFoundMarker:v49];
  long long v101 = (void *)v47;
  uint64_t v51 = [v48 dictionaryWithObjects:v50 forKeys:v47];

  uint64_t v126 = (void *)v51;
  BOOL v52 = [NSString stringWithFormat:@"%s -  Top Potential Candidates And Votes:%@\n", "-[WiFiUsageMonitor updateKnownNetworksSupportingSeamless:forBSS:andSSID:beaconCache:]_block_invoke_2", v51];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v52, "UTF8String"));
    id v53 = objc_claimAutoreleasedReturnValue();
    uint64_t v54 = [v53 UTF8String];
    *(_DWORD *)buf = 136446210;
    v169 = (const char *)v54;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  long long v102 = v46;
  uint64_t v124 = [MEMORY[0x1E4F1CA80] setWithSet:v46];
  [v124 minusSet:v127];
  id v55 = objc_opt_new();
  [*(id *)(v115 + 64) updateBssPerChannelWith:v114 into:v55 and:0 withChannelInfoList:*(void *)(*(void *)(v115 + 64) + 248)];
  uint64_t v56 = [v55 keysOfEntriesPassingTest:&__block_literal_global_736];
  uint64_t v57 = [v56 count];

  long long v58 = [v55 keysOfEntriesPassingTest:&__block_literal_global_738];
  uint64_t v59 = [v58 count];

  uint64_t v60 = 1;
  if (v57) {
    uint64_t v60 = 2;
  }
  if (v59) {
    BOOL v61 = v60;
  }
  else {
    BOOL v61 = v57 != 0;
  }
  id v62 = [v55 keysOfEntriesPassingTest:&__block_literal_global_740];
  uint64_t v63 = [v62 count];

  if (v63) {
    BOOL v64 = v61 + 1;
  }
  else {
    BOOL v64 = v61;
  }
  if (+[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:2])
  {
    long long v148 = 0u;
    long long v149 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    id v108 = [v126 allKeys];
    id obja = (id)[v108 countByEnumeratingWithState:&v146 objects:v165 count:16];
    if (obja)
    {
      uint64_t v110 = *(void *)v147;
      do
      {
        uint64_t v65 = 0;
        do
        {
          if (*(void *)v147 != v110) {
            objc_enumerationMutation(v108);
          }
          uint64_t v119 = v65;
          uint64_t v66 = *(void *)(*((void *)&v146 + 1) + 8 * v65);
          long long v67 = objc_opt_new();
          v68 = [NSNumber numberWithInteger:v128];
          [v67 setObject:v68 forKeyedSubscript:@"roamCandidatesInScan"];

          id v69 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v127, "count"));
          [v67 setObject:v69 forKeyedSubscript:@"knownCandidatesInScan"];

          uint64_t v70 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v126, "count"));
          [v67 setObject:v70 forKeyedSubscript:@"potentialCandidatesInScan"];

          uint64_t v71 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v127, "containsObject:", v66));
          [v67 setObject:v71 forKeyedSubscript:@"potentialCandidateIsKnown"];

          unsigned int v72 = [NSNumber numberWithInteger:v64];
          [v67 setObject:v72 forKeyedSubscript:@"uniqueBandsInScan"];

          unsigned int v73 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v55, "count"));
          [v67 setObject:v73 forKeyedSubscript:@"uniqueChannelsInScan"];

          long long v144 = 0u;
          long long v145 = 0u;
          long long v142 = 0u;
          long long v143 = 0u;
          id v121 = [v126 objectForKeyedSubscript:v66];
          uint64_t v74 = [v121 countByEnumeratingWithState:&v142 objects:v164 count:16];
          if (v74)
          {
            uint64_t v75 = v74;
            uint64_t v76 = *(void *)v143;
            do
            {
              for (uint64_t m = 0; m != v75; ++m)
              {
                if (*(void *)v143 != v76) {
                  objc_enumerationMutation(v121);
                }
                uint64_t v78 = *(void **)(*((void *)&v142 + 1) + 8 * m);
                if ([v78 isMemberOfClass:objc_opt_class()])
                {
                  uint64_t v79 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v78, "sameTokensCount"));
                  [v67 setObject:v79 forKeyedSubscript:@"SSID_overlap"];

                  v80 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v78, "diffTokensCount"));
                  [v67 setObject:v80 forKeyedSubscript:@"SSID_diff"];

                  v81 = NSNumber;
                  v82 = [v78 obj1];
                  id v83 = objc_msgSend(v81, "numberWithInteger:", objc_msgSend(v82, "length"));
                  [v67 setObject:v83 forKeyedSubscript:@"SSID1_length"];

                  uint64_t v84 = NSNumber;
                  int v85 = [v78 obj2];
                  uint64_t v86 = objc_msgSend(v84, "numberWithInteger:", objc_msgSend(v85, "length"));
                  [v67 setObject:v86 forKeyedSubscript:@"SSID2_length"];
                }
                if ([v78 isMemberOfClass:objc_opt_class()])
                {
                  uint64_t v87 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v78, "sameTokensCount"));
                  [v67 setObject:v87 forKeyedSubscript:@"BSSID_overlap"];

                  unsigned int v88 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v78, "diffTokensCount"));
                  [v67 setObject:v88 forKeyedSubscript:@"BSSID_diff"];

                  unsigned int v89 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v78, "distance"));
                  [v67 setObject:v89 forKeyedSubscript:@"BSSID_distance"];
                }
              }
              uint64_t v75 = [v121 countByEnumeratingWithState:&v142 objects:v164 count:16];
            }
            while (v75);
          }

          uint64_t v137 = MEMORY[0x1E4F143A8];
          uint64_t v138 = 3221225472;
          v139 = __85__WiFiUsageMonitor_updateKnownNetworksSupportingSeamless_forBSS_andSSID_beaconCache___block_invoke_4;
          v140 = &unk_1E69BCC68;
          v141 = v67;
          id v90 = v67;
          AnalyticsSendEventLazy();

          uint64_t v65 = v119 + 1;
        }
        while ((id)(v119 + 1) != obja);
        id obja = (id)[v108 countByEnumeratingWithState:&v146 objects:v165 count:16];
      }
      while (obja);
    }

    uint64_t v17 = v115;
  }
  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id v122 = [*(id *)(*(void *)(v17 + 64) + 104) allValues];
  uint64_t v91 = [v122 countByEnumeratingWithState:&v133 objects:v163 count:16];
  if (v91)
  {
    uint64_t v92 = v91;
    uint64_t v93 = *(void *)v134;
    do
    {
      for (uint64_t n = 0; n != v92; ++n)
      {
        if (*(void *)v134 != v93) {
          objc_enumerationMutation(v122);
        }
        long long v95 = *(void **)(*((void *)&v133 + 1) + 8 * n);
        long long v129 = 0u;
        long long v130 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        id v96 = v95;
        uint64_t v97 = [v96 countByEnumeratingWithState:&v129 objects:v162 count:16];
        if (v97)
        {
          uint64_t v98 = v97;
          uint64_t v99 = *(void *)v130;
          do
          {
            for (iuint64_t i = 0; ii != v98; ++ii)
            {
              if (*(void *)v130 != v99) {
                objc_enumerationMutation(v96);
              }
              objc_msgSend(*(id *)(*((void *)&v129 + 1) + 8 * ii), "setSSIDTransitionCandidates:SSIDTransitionPotentialCandidates:potentialCandidatesMinusCandidates:roamCandidates:uniqueChannels:uniqueBands:", v127, v126, v124, v128, objc_msgSend(v55, "count"), v64);
            }
            uint64_t v98 = [v96 countByEnumeratingWithState:&v129 objects:v162 count:16];
          }
          while (v98);
        }
      }
      uint64_t v92 = [v122 countByEnumeratingWithState:&v133 objects:v163 count:16];
    }
    while (v92);
  }
}

BOOL __85__WiFiUsageMonitor_updateKnownNetworksSupportingSeamless_forBSS_andSSID_beaconCache___block_invoke_722(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 count] == 2;
}

BOOL __85__WiFiUsageMonitor_updateKnownNetworksSupportingSeamless_forBSS_andSSID_beaconCache___block_invoke_733(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  if ([a2 band]) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = [v4 count] != 0;
  }

  return v5;
}

BOOL __85__WiFiUsageMonitor_updateKnownNetworksSupportingSeamless_forBSS_andSSID_beaconCache___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 band] == 1 && objc_msgSend(v4, "count") != 0;

  return v5;
}

BOOL __85__WiFiUsageMonitor_updateKnownNetworksSupportingSeamless_forBSS_andSSID_beaconCache___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 band] == 2 && objc_msgSend(v4, "count") != 0;

  return v5;
}

id __85__WiFiUsageMonitor_updateKnownNetworksSupportingSeamless_forBSS_andSSID_beaconCache___block_invoke_4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)updateScanForwardStats:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__WiFiUsageMonitor_updateScanForwardStats___block_invoke;
  v7[3] = &unk_1E69BC8B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __43__WiFiUsageMonitor_updateScanForwardStats___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = [*(id *)(*(void *)(a1 + 32) + 104) allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = *(void **)(*((void *)&v17 + 1) + 8 * v6);
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v14;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v14 != v11) {
                objc_enumerationMutation(v8);
              }
              [*(id *)(*((void *)&v13 + 1) + 8 * v12++) updateScanForwardStats:*(void *)(a1 + 40)];
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }
}

- (void)setUsbStatus:(BOOL)a3 currentDevices:(id)a4 currentNoiseDelta:(int64_t)a5
{
  id v8 = a4;
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  _OWORD v11[2] = __66__WiFiUsageMonitor_setUsbStatus_currentDevices_currentNoiseDelta___block_invoke;
  v11[3] = &unk_1E69BD288;
  void v11[4] = self;
  id v12 = v8;
  BOOL v14 = a3;
  int64_t v13 = a5;
  id v10 = v8;
  dispatch_async(internalQueue, v11);
}

void __66__WiFiUsageMonitor_setUsbStatus_currentDevices_currentNoiseDelta___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 35) = [*(id *)(a1 + 40) count] != 0;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 272), *(id *)(a1 + 40));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = [*(id *)(*(void *)(a1 + 32) + 104) allKeys];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v17 + 1) + 8 * v6);
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "objectForKeyedSubscript:", v7, 0);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v14;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v14 != v11) {
                objc_enumerationMutation(v8);
              }
              [*(id *)(*((void *)&v13 + 1) + 8 * v12++) updateUsbStatus:*(unsigned __int8 *)(a1 + 56) currentDevices:*(void *)(a1 + 40)];
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }

  *(void *)(*(void *)(a1 + 32) + 280) = *(void *)(a1 + 48);
}

- (void)pushTDEventToHUD:(id)a3
{
  if (a3)
  {
    tdSoftError = self->_tdSoftError;
    if (tdSoftError) {
      id v4 = -[WiFiSoftError updateHUDWithMessage:](tdSoftError, "updateHUDWithMessage:");
    }
  }
}

- (void)pushRNFEventToHUD:(BOOL)a3
{
  if (self->_rnfSoftError)
  {
    if (a3) {
      id v4 = @"Wi-Fi Assist: cellular fallback is active";
    }
    else {
      id v4 = @"Wi-Fi Assist: cellular fallback is inactive";
    }
    id v6 = [NSString stringWithFormat:v4];
    id v5 = [(WiFiSoftError *)self->_rnfSoftError updateHUDWithMessage:v6];
  }
}

+ (id)getTDConfirmedEventStringForDisplay:(id *)a3
{
  uint64_t v3 = &stru_1F2B5AC50;
  if (a3->var0) {
    id v4 = @"Tx PER";
  }
  else {
    id v4 = &stru_1F2B5AC50;
  }
  id v5 = @"Beacon PER";
  if (!a3->var1) {
    id v5 = &stru_1F2B5AC50;
  }
  if (a3->var2) {
    id v6 = @"FW Tx PER";
  }
  else {
    id v6 = &stru_1F2B5AC50;
  }
  if (a3->var3) {
    uint64_t v7 = @"Gateway ARP Failures";
  }
  else {
    uint64_t v7 = &stru_1F2B5AC50;
  }
  if (a3->var4) {
    uint64_t v3 = @"Symptoms DNS Errors";
  }
  id v8 = [NSString stringWithFormat:@"%@%@%@%@%@", v4, v5, v6, v7, v3];
  if ([v8 length])
  {
    uint64_t v9 = [MEMORY[0x1E4F28E78] stringWithFormat:@"TD evaluation in progress: high %@ detected", v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)getTDEvalCompleteEventStringForDisplay:(int)a3
{
  uint64_t v3 = @"Roamed";
  id v4 = @"Unknown";
  if (a3 == 13) {
    id v4 = @"Link down";
  }
  if (a3 != 14) {
    uint64_t v3 = v4;
  }
  if (a3) {
    id v5 = v3;
  }
  else {
    id v5 = @"RSSI improved";
  }
  id v6 = (void *)[(__CFString *)v5 length];
  if (v6)
  {
    id v6 = [MEMORY[0x1E4F28E78] stringWithFormat:@"TD evaluation complete: outcome %@", v5];
  }

  return v6;
}

- (void)resetDeviceSessionforInterface:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    internalQueue = self->_internalQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__WiFiUsageMonitor_resetDeviceSessionforInterface___block_invoke;
    v7[3] = &unk_1E69BC8B0;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(internalQueue, v7);
  }
}

void __51__WiFiUsageMonitor_resetDeviceSessionforInterface___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  unint64_t v1 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "objectForKeyedSubscript:", *(void *)(a1 + 40), 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        if ([v6 type] == 1)
        {
          [v6 sessionDidStart];
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)faultReasonCount:(unint64_t)a3 forInterface:(id)a4
{
  id v6 = a4;
  id v7 = 0;
  if (v6 && a3 - 34 >= 0xFFFFFFFFFFFFFFDFLL)
  {
    uint64_t v14 = 0;
    long long v15 = &v14;
    uint64_t v16 = 0x3032000000;
    long long v17 = __Block_byref_object_copy__1;
    long long v18 = __Block_byref_object_dispose__1;
    id v19 = (id)objc_opt_new();
    internalQueue = self->_internalQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__WiFiUsageMonitor_faultReasonCount_forInterface___block_invoke;
    v10[3] = &unk_1E69BD408;
    void v10[4] = self;
    id v11 = v6;
    uint64_t v12 = &v14;
    unint64_t v13 = a3;
    dispatch_sync(internalQueue, v10);
    id v7 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }

  return v7;
}

void __50__WiFiUsageMonitor_faultReasonCount_forInterface___block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1[4] + 104), "objectForKeyedSubscript:", a1[5], 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        long long v8 = *(void **)(*(void *)(a1[6] + 8) + 40);
        long long v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "faultReasonCount:", a1[7]));
        long long v10 = [v7 sessionName];
        [v8 setValue:v9 forKey:v10];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (id)getProperty:(id)a3 forAllSessionsOfInterface:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    long long v18 = __Block_byref_object_copy__1;
    id v19 = __Block_byref_object_dispose__1;
    id v20 = (id)objc_opt_new();
    internalQueue = self->_internalQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    _OWORD v11[2] = __58__WiFiUsageMonitor_getProperty_forAllSessionsOfInterface___block_invoke;
    v11[3] = &unk_1E69BD430;
    void v11[4] = self;
    id v12 = v7;
    long long v14 = &v15;
    id v13 = v6;
    dispatch_sync(internalQueue, v11);
    id v9 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __58__WiFiUsageMonitor_getProperty_forAllSessionsOfInterface___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1[4] + 104), "objectForKeyedSubscript:", a1[5], 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v6 isSessionActive])
        {
          id v7 = *(void **)(*(void *)(a1[7] + 8) + 40);
          long long v8 = [v6 valueForKey:a1[6]];
          id v9 = [v6 sessionName];
          [v7 setObject:v8 forKey:v9];
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
}

- (void)getMobileAssets
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __35__WiFiUsageMonitor_getMobileAssets__block_invoke;
  v2[3] = &unk_1E69BD458;
  v2[4] = self;
  +[WCAFetchWiFiBehaviorParameters fetchWiFiBehaviorWithCompletion:v2];
}

void __35__WiFiUsageMonitor_getMobileAssets__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSLog(&cfstr_SReceivedWcafe.isa, "-[WiFiUsageMonitor getMobileAssets]_block_invoke", v3);
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 144);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__WiFiUsageMonitor_getMobileAssets__block_invoke_2;
  block[3] = &unk_1E69BC8D8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __35__WiFiUsageMonitor_getMobileAssets__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) datapathTelemetry];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) datapathTelemetry];
    +[WiFiUsageLQMConfiguration setConfig:v3];
  }
  else
  {
    NSLog(&cfstr_SKeyNotFoundIn.isa, "-[WiFiUsageMonitor getMobileAssets]_block_invoke_2", @"DataPathTelemetry");
  }
  uint64_t v4 = [*(id *)(a1 + 32) apProfile];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) apProfile];
    +[WiFiUsageAccessPointProfileConfiguration setConfig:v5];
  }
  else
  {
    NSLog(&cfstr_SKeyNotFoundIn.isa, "-[WiFiUsageMonitor getMobileAssets]_block_invoke_2", @"AccessPointProfile");
  }
  id v6 = [*(id *)(a1 + 32) beaconParsing];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) beaconParsing];
    +[WiFiUsageBeaconParsingConfiguration setConfig:v7];
  }
  else
  {
    NSLog(&cfstr_SKeyNotFoundIn.isa, "-[WiFiUsageMonitor getMobileAssets]_block_invoke_2", @"BeaconParsing");
  }
}

- (NSDate)processInitTime
{
  return self->_processInitTime;
}

- (void)setProcessInitTime:(id)a3
{
}

- (BOOL)isSystemAwake
{
  return self->_isSystemAwake;
}

- (void)setIsSystemAwake:(BOOL)a3
{
  self->_isSystemAwake = a3;
}

- (BOOL)deviceLocked
{
  return self->_deviceLocked;
}

- (void)setDeviceLocked:(BOOL)a3
{
  self->_deviceLocked = a3;
}

- (BOOL)displayOn
{
  return self->_displayOn;
}

- (void)setDisplayOn:(BOOL)a3
{
  self->_displayOuint64_t n = a3;
}

- (BOOL)deviceCharging
{
  return self->_deviceCharging;
}

- (void)setDeviceCharging:(BOOL)a3
{
  self->_deviceCharging = a3;
}

- (BOOL)companionConnected
{
  return self->_companionConnected;
}

- (void)setCompanionConnected:(BOOL)a3
{
  self->_companionConnected = a3;
}

- (NSString)motionState
{
  return self->_motionState;
}

- (BOOL)inActiveCall
{
  return self->_inActiveCall;
}

- (void)setInActiveCall:(BOOL)a3
{
  self->_inActiveCall = a3;
}

- (BOOL)inMediaPlayback
{
  return self->_inMediaPlayback;
}

- (void)setInMediaPlayback:(BOOL)a3
{
  self->_inMediaPlaybacuint64_t k = a3;
}

- (unint64_t)hidCount
{
  return self->_hidCount;
}

- (void)setHidCount:(unint64_t)a3
{
  self->_hidCount = a3;
}

- (BOOL)inActiveA2dp
{
  return self->_inActiveA2dp;
}

- (void)setInActiveA2dp:(BOOL)a3
{
  self->_inActiveA2dp = a3;
}

- (BOOL)inActiveSco
{
  return self->_inActiveSco;
}

- (void)setInActiveSco:(BOOL)a3
{
  self->_BOOL inActiveSco = a3;
}

- (BOOL)inActiveUniAoS
{
  return self->_inActiveUniAoS;
}

- (void)setInActiveUniAoS:(BOOL)a3
{
  self->_inActiveUniAoS = a3;
}

- (BOOL)inActiveBiAoS
{
  return self->_inActiveBiAoS;
}

- (void)setInActiveBiAoS:(BOOL)a3
{
  self->_inActiveBiAoS = a3;
}

- (BOOL)curBTAudioBand
{
  return self->_curBTAudioBand;
}

- (void)setCurBTAudioBand:(BOOL)a3
{
  self->_curBTAudioBand = a3;
}

- (BOOL)inActiveAwdl
{
  return self->_inActiveAwdl;
}

- (void)setInActiveAwdl:(BOOL)a3
{
  self->_inActiveAwdl = a3;
}

- (BOOL)inActiveRoam
{
  return self->_inActiveRoam;
}

- (void)setInActiveRoam:(BOOL)a3
{
  self->_inActiveRoauint64_t m = a3;
}

- (BOOL)inActiveScan
{
  return self->_inActiveScan;
}

- (void)setInActiveScan:(BOOL)a3
{
  self->_inActiveScauint64_t n = a3;
}

- (BOOL)poweredOn
{
  return self->_poweredOn;
}

- (void)setPoweredOn:(BOOL)a3
{
  self->_poweredOuint64_t n = a3;
}

- (BOOL)controlCenterEnabled
{
  return self->_controlCenterEnabled;
}

- (void)setControlCenterEnabled:(BOOL)a3
{
  self->_controlCenterEnabled = a3;
}

- (BOOL)airplaneModeEnabled
{
  return self->_airplaneModeEnabled;
}

- (void)setAirplaneModeEnabled:(BOOL)a3
{
  self->_airplaneModeEnabled = a3;
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

- (BOOL)compatibilityModeEnabled
{
  return self->_compatibilityModeEnabled;
}

- (void)setIsBSPActive:(BOOL)a3
{
  self->_isBSPActive = a3;
}

- (int64_t)tdLogic_badRssiThreshold
{
  return self->_tdLogic_badRssiThreshold;
}

- (void)setTdLogic_badRssiThreshold:(int64_t)a3
{
  self->_tdLogic_badRssiThreshold = a3;
}

- (int64_t)tdLogic_goodRssiThreshold
{
  return self->_tdLogic_goodRssiThreshold;
}

- (void)setTdLogic_goodRssiThreshold:(int64_t)a3
{
  self->_tdLogic_goodRssiThreshold = a3;
}

- (BOOL)lastTDEvalConfirmed
{
  return self->_lastTDEvalConfirmed;
}

- (void)setLastTDEvalConfirmed:(BOOL)a3
{
  self->_lastTDEvalConfirmed = a3;
}

- (BOOL)lastTDEvalExecuted
{
  return self->_lastTDEvalExecuted;
}

- (void)setLastTDEvalExecuted:(BOOL)a3
{
  self->_lastTDEvalExecuted = a3;
}

- (NSString)lastTDEvalStartedBy
{
  return self->_lastTDEvalStartedBy;
}

- (void)setLastTDEvalStartedBy:(id)a3
{
}

- (NSString)secondaryInterfaceName
{
  return self->_secondaryInterfaceName;
}

- (NSString)currentCellularStatus
{
  return self->_currentCellularStatus;
}

- (void)setCurrentCellularStatus:(id)a3
{
}

- (NSMutableDictionary)usageSessions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setUsageSessions:(id)a3
{
}

- (NSMutableDictionary)linkSessions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLinkSessions:(id)a3
{
}

- (NSMutableDictionary)interfaceLqmWindows
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInterfaceLqmWindows:(id)a3
{
}

- (NSDate)lastLQMAnalysisForSlowWiFiDNSFailureTime
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setLastLQMAnalysisForSlowWiFiDNSFailureTime:(id)a3
{
}

- (NSMutableDictionary)interfacesCapabilities
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setInterfacesCapabilities:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 144, 1);
}

- (void)setInternalQueue:(id)a3
{
}

- (BOOL)privacyRestrictionDisabled
{
  return self->_privacyRestrictionDisabled;
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)faultEventHandler
{
  return self->_faultEventHandler;
}

- (void)completionContext
{
  return self->_completionContext;
}

- (void)setCompletionContext:(void *)a3
{
  self->_completionContext = a3;
}

- (OS_dispatch_queue)callbackQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 176, 1);
}

- (void)setCallbackQueue:(id)a3
{
}

- (WiFiUsageInterfaceStats)ifStatsAtLastLqmUpdate
{
  return (WiFiUsageInterfaceStats *)objc_getProperty(self, a2, 184, 1);
}

- (void)setIfStatsAtLastLqmUpdate:(id)a3
{
}

- (WiFiUsageInterfaceStats)secondaryIfStatsAtLastLqmUpdate
{
  return (WiFiUsageInterfaceStats *)objc_getProperty(self, a2, 192, 1);
}

- (void)setSecondaryIfStatsAtLastLqmUpdate:(id)a3
{
}

- (WiFiUsageRangingSession)rangingSession
{
  return (WiFiUsageRangingSession *)objc_getProperty(self, a2, 200, 1);
}

- (void)setRangingSession:(id)a3
{
}

- (BOOL)xctest
{
  return self->_xctest;
}

- (void)setXctest:(BOOL)a3
{
  self->_xctest = a3;
}

- (BOOL)xctest_disableSampling
{
  return self->_xctest_disableSampling;
}

- (void)setXctest_disableSampling:(BOOL)a3
{
  self->_BOOL xctest_disableSampling = a3;
}

- (NSMutableArray)pendingLqmAnalysis
{
  return (NSMutableArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setPendingLqmAnalysis:(id)a3
{
}

- (id)lqmAnalysisCompletionHandler
{
  return self->_lqmAnalysisCompletionHandler;
}

- (void)setLqmAnalysisCompletionHandler:(id)a3
{
}

- (NSDate)lastCallStarted
{
  return self->_lastCallStarted;
}

- (void)setLastCallStarted:(id)a3
{
}

- (NSDate)lastInCallAnalysis
{
  return self->_lastInCallAnalysis;
}

- (void)setLastInCallAnalysis:(id)a3
{
}

- (NSDictionary)lastScanData
{
  return self->_lastScanData;
}

- (void)setLastScanData:(id)a3
{
}

- (NSArray)lastChannelInfoList
{
  return self->_lastChannelInfoList;
}

- (void)setLastChannelInfoList:(id)a3
{
}

- (NSDictionary)lastScanRequest
{
  return self->_lastScanRequest;
}

- (void)setLastScanRequest:(id)a3
{
}

- (WiFiUsageNetworkDetails)currentNetworkDetails
{
  return self->_currentNetworkDetails;
}

- (void)setCurrentNetworkDetails:(id)a3
{
}

- (BOOL)isAnyUsbInserted
{
  return self->_isAnyUsbInserted;
}

- (void)setIsAnyUsbInserted:(BOOL)a3
{
  self->_isAnyUsbInserted = a3;
}

- (NSArray)usbDevices
{
  return self->_usbDevices;
}

- (void)setUsbDevices:(id)a3
{
}

- (int64_t)noiseDeltaUponUSBInsertion
{
  return self->_noiseDeltaUponUSBInsertion;
}

- (void)setNoiseDeltaUponUSBInsertion:(int64_t)a3
{
  self->_noiseDeltaUponUSBInsertiouint64_t n = a3;
}

- (WiFiSoftError)tdSoftError
{
  return (WiFiSoftError *)objc_getProperty(self, a2, 288, 1);
}

- (void)setTdSoftError:(id)a3
{
}

- (WiFiSoftError)rnfSoftError
{
  return (WiFiSoftError *)objc_getProperty(self, a2, 296, 1);
}

- (void)setRnfSoftError:(id)a3
{
}

- (NSString)lastTDConfirmedDisplayStr
{
  return self->_lastTDConfirmedDisplayStr;
}

- (void)setLastTDConfirmedDisplayStr:(id)a3
{
}

- (AnalyticsProcessor)analyticsProcessor
{
  return (AnalyticsProcessor *)objc_getProperty(self, a2, 312, 1);
}

- (void)setAnalyticsProcessor:(id)a3
{
}

- (WAMessage)dummyWAMessage
{
  return (WAMessage *)objc_getProperty(self, a2, 320, 1);
}

- (void)setDummyWAMessage:(id)a3
{
}

- (unint64_t)pid
{
  return self->_pid;
}

- (void)setPid:(unint64_t)a3
{
  self->_pid = a3;
}

- (unint64_t)numberOfJoins
{
  return self->_numberOfJoins;
}

- (void)setNumberOfJoins:(unint64_t)a3
{
  self->_numberOfJoins = a3;
}

- (BOOL)detectedJoinAfterIPConfig
{
  return self->_detectedJoinAfterIPConfig;
}

- (void)setDetectedJoinAfterIPConfig:(BOOL)a3
{
  self->_detectedJoinAfterIPConfig = a3;
}

- (NSDate)timeOfFirstUnlockAfterBoot
{
  return (NSDate *)objc_getProperty(self, a2, 344, 1);
}

- (void)setTimeOfFirstUnlockAfterBoot:(id)a3
{
}

- (NSDate)timeOfLastJoin
{
  return (NSDate *)objc_getProperty(self, a2, 352, 1);
}

- (void)setTimeOfLastJoin:(id)a3
{
}

- (NSNumber)bootToLastJoin
{
  return (NSNumber *)objc_getProperty(self, a2, 360, 1);
}

- (void)setBootToLastJoin:(id)a3
{
}

- (NSNumber)firstUnlockToLastJoin
{
  return (NSNumber *)objc_getProperty(self, a2, 368, 1);
}

- (void)setFirstUnlockToLastJoin:(id)a3
{
}

- (NSDate)timeOfLastLinkUp
{
  return (NSDate *)objc_getProperty(self, a2, 376, 1);
}

- (void)setTimeOfLastLinkUp:(id)a3
{
}

- (NSNumber)bootToLastLinkUp
{
  return (NSNumber *)objc_getProperty(self, a2, 384, 1);
}

- (void)setBootToLastLinkUp:(id)a3
{
}

- (NSNumber)firstUnlockToLastLinkUp
{
  return (NSNumber *)objc_getProperty(self, a2, 392, 1);
}

- (void)setFirstUnlockToLastLinkUp:(id)a3
{
}

- (NSNumber)lastJoinToLastLinkUp
{
  return (NSNumber *)objc_getProperty(self, a2, 400, 1);
}

- (void)setLastJoinToLastLinkUp:(id)a3
{
}

- (NSDate)timeOfIPv4
{
  return (NSDate *)objc_getProperty(self, a2, 408, 1);
}

- (void)setTimeOfIPv4:(id)a3
{
}

- (NSNumber)bootToIPv4
{
  return (NSNumber *)objc_getProperty(self, a2, 416, 1);
}

- (void)setBootToIPv4:(id)a3
{
}

- (NSNumber)firstUnlockToIPv4
{
  return (NSNumber *)objc_getProperty(self, a2, 424, 1);
}

- (void)setFirstUnlockToIPv4:(id)a3
{
}

- (NSNumber)lastJoinToIPv4
{
  return (NSNumber *)objc_getProperty(self, a2, 432, 1);
}

- (void)setLastJoinToIPv4:(id)a3
{
}

- (NSNumber)lastLinkUpToIPv4
{
  return (NSNumber *)objc_getProperty(self, a2, 440, 1);
}

- (void)setLastLinkUpToIPv4:(id)a3
{
}

- (NSDate)timeOfIPv6
{
  return (NSDate *)objc_getProperty(self, a2, 448, 1);
}

- (void)setTimeOfIPv6:(id)a3
{
}

- (NSNumber)bootToIPv6
{
  return (NSNumber *)objc_getProperty(self, a2, 456, 1);
}

- (void)setBootToIPv6:(id)a3
{
}

- (NSNumber)firstUnlockToIPv6
{
  return (NSNumber *)objc_getProperty(self, a2, 464, 1);
}

- (void)setFirstUnlockToIPv6:(id)a3
{
}

- (NSNumber)lastJoinToIPv6
{
  return (NSNumber *)objc_getProperty(self, a2, 472, 1);
}

- (void)setLastJoinToIPv6:(id)a3
{
}

- (NSNumber)lastLinkUpToIPv6
{
  return (NSNumber *)objc_getProperty(self, a2, 480, 1);
}

- (void)setLastLinkUpToIPv6:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLinkUpToIPv6, 0);
  objc_storeStrong((id *)&self->_lastJoinToIPv6, 0);
  objc_storeStrong((id *)&self->_firstUnlockToIPv6, 0);
  objc_storeStrong((id *)&self->_bootToIPv6, 0);
  objc_storeStrong((id *)&self->_timeOfIPv6, 0);
  objc_storeStrong((id *)&self->_lastLinkUpToIPv4, 0);
  objc_storeStrong((id *)&self->_lastJoinToIPv4, 0);
  objc_storeStrong((id *)&self->_firstUnlockToIPv4, 0);
  objc_storeStrong((id *)&self->_bootToIPv4, 0);
  objc_storeStrong((id *)&self->_timeOfIPv4, 0);
  objc_storeStrong((id *)&self->_lastJoinToLastLinkUp, 0);
  objc_storeStrong((id *)&self->_firstUnlockToLastLinkUp, 0);
  objc_storeStrong((id *)&self->_bootToLastLinkUp, 0);
  objc_storeStrong((id *)&self->_timeOfLastLinkUp, 0);
  objc_storeStrong((id *)&self->_firstUnlockToLastJoin, 0);
  objc_storeStrong((id *)&self->_bootToLastJoin, 0);
  objc_storeStrong((id *)&self->_timeOfLastJoin, 0);
  objc_storeStrong((id *)&self->_timeOfFirstUnlockAfterBoot, 0);
  objc_storeStrong((id *)&self->_dummyWAMessage, 0);
  objc_storeStrong((id *)&self->_analyticsProcessor, 0);
  objc_storeStrong((id *)&self->_lastTDConfirmedDisplayStr, 0);
  objc_storeStrong((id *)&self->_rnfSoftError, 0);
  objc_storeStrong((id *)&self->_tdSoftError, 0);
  objc_storeStrong((id *)&self->_usbDevices, 0);
  objc_storeStrong((id *)&self->_currentNetworkDetails, 0);
  objc_storeStrong((id *)&self->_lastScanRequest, 0);
  objc_storeStrong((id *)&self->_lastChannelInfoList, 0);
  objc_storeStrong((id *)&self->_lastScanData, 0);
  objc_storeStrong((id *)&self->_lastInCallAnalysis, 0);
  objc_storeStrong((id *)&self->_lastCallStarted, 0);
  objc_storeStrong(&self->_lqmAnalysisCompletionHandler, 0);
  objc_storeStrong((id *)&self->_pendingLqmAnalysis, 0);
  objc_storeStrong((id *)&self->_rangingSession, 0);
  objc_storeStrong((id *)&self->_secondaryIfStatsAtLastLqmUpdate, 0);
  objc_storeStrong((id *)&self->_ifStatsAtLastLqmUpdate, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_faultEventHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_interfacesCapabilities, 0);
  objc_storeStrong((id *)&self->_lastLQMAnalysisForSlowWiFiDNSFailureTime, 0);
  objc_storeStrong((id *)&self->_interfaceLqmWindows, 0);
  objc_storeStrong((id *)&self->_linkSessions, 0);
  objc_storeStrong((id *)&self->_usageSessions, 0);
  objc_storeStrong((id *)&self->_currentCellularStatus, 0);
  objc_storeStrong((id *)&self->_secondaryInterfaceName, 0);
  objc_storeStrong((id *)&self->_lastTDEvalStartedBy, 0);
  objc_storeStrong((id *)&self->_motionState, 0);

  objc_storeStrong((id *)&self->_processInitTime, 0);
}

@end