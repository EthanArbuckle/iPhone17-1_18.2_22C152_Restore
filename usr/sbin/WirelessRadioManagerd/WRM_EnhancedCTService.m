@interface WRM_EnhancedCTService
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)wrm_EnhancedCTServiceSingleton;
- (BOOL)CTClientInitDone;
- (BOOL)cellularDataEnabled;
- (BOOL)checkIfServingCellNonLTE;
- (BOOL)dataAttachedWithCellularNetwork;
- (BOOL)dataAttachedWithCellularNetwork:(int64_t)a3;
- (BOOL)dataPreferredSlotOnCBRS;
- (BOOL)determineifSABWCriteriaMet;
- (BOOL)deviceICheapFR2Coverage;
- (BOOL)deviceInRoaming;
- (BOOL)exitSaDepriotizationEval;
- (BOOL)getDataStallState:(int64_t)a3;
- (BOOL)getFR2Status;
- (BOOL)ifAutomatedDeviceGroup;
- (BOOL)ifInternalDevice;
- (BOOL)ifLimitSpeedTest;
- (BOOL)ifMAV20Device;
- (BOOL)isAudioQualityGood;
- (BOOL)isBetaBuild;
- (BOOL)isCommCenterAsserted;
- (BOOL)isDataLQMValid;
- (BOOL)isDataLQMValid:(int64_t)a3;
- (BOOL)isDataPreferredSlotCBRS;
- (BOOL)isDeviceUsingFR2Radio;
- (BOOL)isIMSPreferenceEnabled;
- (BOOL)isSaAllowedOnWiFiAssociation:(int64_t)a3;
- (BOOL)isSimActive;
- (BOOL)isSuppressSOSOnlyWithLimitedServiceEnabled;
- (BOOL)isVoLTESupported;
- (BOOL)isVoiceLQMValid;
- (BOOL)isVoiceLQMValid:(int64_t)a3;
- (BOOL)isWatchAssociated;
- (BOOL)isWiFiCallingAllowedInAPM;
- (BOOL)isWiFiCallingSupportedAnySlot;
- (BOOL)isWiFiCallingSupportedSlot1;
- (BOOL)isWiFiCallingSupportedSlot2;
- (BOOL)mSubscriptionInfoDidChange;
- (BOOL)qmiClientRunning;
- (BOOL)registeredWithCellularNetwork;
- (BOOL)shouldScheduleSpeedTests;
- (BOOL)validateStrongestSOSTimeStamp:(double)a3;
- (CoreTelephonyClient)CTClient;
- (NSMutableArray)DataLqmIsValid;
- (NSMutableArray)DataLqmValue;
- (NSMutableArray)PrevAudioErasurePercent;
- (NSMutableArray)PrevAudioQualityWasGood;
- (NSMutableArray)VoiceLqmIsValid;
- (NSMutableArray)VoiceLqmReasonCode;
- (NSMutableArray)VoiceLqmValue;
- (NSMutableArray)bars;
- (NSMutableArray)cbrsCoreAnalyticsMetricsSent;
- (NSMutableArray)cellARFCN;
- (NSMutableArray)cellBandInfo;
- (NSMutableArray)cellBandwidth;
- (NSMutableArray)cellID;
- (NSMutableArray)configuredMaxDLBW;
- (NSMutableArray)configuredMaxULBW;
- (NSMutableArray)currCBRSCellFound;
- (NSMutableArray)currNRCellFound;
- (NSMutableArray)currentHarvestedCellTypeFR2Capable;
- (NSMutableArray)currentNRCellType;
- (NSMutableArray)dataBW;
- (NSMutableArray)dataEnabled;
- (NSMutableArray)dataIndicator;
- (NSMutableArray)dataModeLTE;
- (NSMutableArray)detectedFR1CellBW;
- (NSMutableArray)detectedFR1CellCountLocDB;
- (NSMutableArray)detectedFR2CellCountLocDB;
- (NSMutableArray)estimatedBWDL;
- (NSMutableArray)estimatedBWDLConf;
- (NSMutableArray)estimatedBWUL;
- (NSMutableArray)estimatedBWULConf;
- (NSMutableArray)highDataRateObserved;
- (NSMutableArray)imsVoiceOverPSSupported;
- (NSMutableArray)isDataAttached;
- (NSMutableArray)isDataEnabled;
- (NSMutableArray)isDeviceRegistered;
- (NSMutableArray)isExpensive;
- (NSMutableArray)isFR2Radio;
- (NSMutableArray)isPrivateNetworkPreferredOverWifi;
- (NSMutableArray)isPrivateNetworkSim;
- (NSMutableArray)isRoaming;
- (NSMutableArray)isVolteSupported;
- (NSMutableArray)isWiFiCallingSupported;
- (NSMutableArray)loads;
- (NSMutableArray)locDbRequired;
- (NSMutableArray)mcc;
- (NSMutableArray)mnc;
- (NSMutableArray)movingAverageSignalBars;
- (NSMutableArray)neighberCellType;
- (NSMutableArray)nrCellRSRP;
- (NSMutableArray)nrCellRSRQ;
- (NSMutableArray)nrCellSNR;
- (NSMutableArray)radioCoverage;
- (NSMutableArray)radioFrequency;
- (NSMutableArray)rrcState;
- (NSMutableArray)servCellECIO;
- (NSMutableArray)servCellRSCP;
- (NSMutableArray)servCellRSRP;
- (NSMutableArray)servCellRSRQ;
- (NSMutableArray)servCellRSSI;
- (NSMutableArray)servCellRadioTechnologyType;
- (NSMutableArray)servCellSINR;
- (NSMutableArray)servCellSNR;
- (NSMutableArray)stallDetected;
- (NSMutableArray)subscriptions;
- (NSMutableArray)wifiCBRSCellFound;
- (NSMutableArray)wifiNRCellFound;
- (OS_dispatch_queue)cellularAvailabilityStatusQueue;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)serverQueue;
- (WRM_CTService)mCTService;
- (WRM_EnhancedCTService)init;
- (char)getDataSlotLoad;
- (double)getCurrentAudioErasure;
- (double)getLastKnownLatitude;
- (double)getLastKnownLocationTimestamp;
- (double)getLastKnownLongitude;
- (double)getMeasureBWDataSlot;
- (double)getNrRSRP;
- (double)getNrRSRP:(int64_t)a3;
- (double)getNrRSRQ;
- (double)getNrRSRQ:(int64_t)a3;
- (double)getNrSNR;
- (double)getNrSNR:(int64_t)a3;
- (double)getServingCellECIO;
- (double)getServingCellECIO:(int64_t)a3;
- (double)getServingCellRSCP;
- (double)getServingCellRSCP:(int64_t)a3;
- (double)getServingCellRSRP;
- (double)getServingCellRSRP:(int64_t)a3;
- (double)getServingCellRSRQ;
- (double)getServingCellRSRQ:(int64_t)a3;
- (double)getServingCellRSSI;
- (double)getServingCellSINR;
- (double)getServingCellSNR;
- (double)getServingCellSNR:(int64_t)a3;
- (double)initSOSWaypointThreshold;
- (float)getCurrentMovAvgSignalBars;
- (id)getCurrentCellularAvailabilityStatus;
- (id)getInternetInterfaceName;
- (id)getPreviousCellularAvailabilityStatus;
- (id)intializeInterfaceClient:(int64_t)a3;
- (int)combinedRegistrationStatus;
- (int)getBandInfoDataSlot;
- (int)getBandInfoOnSlot:(int64_t)a3;
- (int)getBandWidthDataSlot;
- (int)getCTDataIndictor;
- (int)getCTDataIndictor:(int64_t)a3;
- (int)getCellRSRP4G5GvsWiFiThreshold;
- (int)getCellRSRQ4G5GvsWiFiThreshold;
- (int)getCellularDataLQM;
- (int)getCellularDataLQM:(int64_t)a3;
- (int)getConfiguredMaxBW;
- (int)getCurrentNRStatusDataSlot;
- (int)getLteVoiceLQM;
- (int)getLteVoiceLQM:(int64_t)a3;
- (int)getRRCState;
- (int)getServingCellType;
- (int)getServingCellType:(int64_t)a3;
- (int)getUARFCNDataSlot;
- (int)getWatchAssociated;
- (int)getWiFiNRStatusDataSlot;
- (int)parseRegistrationStatusForBiomeStream:(id)a3;
- (int64_t)activeSlot;
- (int64_t)dataPreferredSlot;
- (int64_t)getCellularLQM;
- (int64_t)getCurrentSignalBars;
- (int64_t)getCurrentSignalBars:(int64_t)a3;
- (unint64_t)numberofSubscriptions;
- (unint64_t)retainCount;
- (unsigned)getCellConfiguredBandwidthThreshold;
- (unsigned)getLocationDBFR1Count;
- (unsigned)getLocationDBFR2Count;
- (unsigned)getRadioCoverage;
- (unsigned)getRadioFrequency;
- (unsigned)getWRMCellOutrankWifiBWThreshold;
- (void)cellChanged:(id)a3 cell:(id)a4;
- (void)cellMonitorUpdate:(id)a3 info:(id)a4;
- (void)checkAndScheduleSpeedTest;
- (void)context:(id)a3 capabilitiesChanged:(id)a4;
- (void)createWrmSdmLocationManager;
- (void)currentDataSimChanged:(id)a3;
- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4;
- (void)dealloc;
- (void)displayStatusChanged:(id)a3 status:(id)a4;
- (void)enhancedDataLinkQualityChanged:(id)a3 metric:(id)a4;
- (void)enhancedVoiceLinkQualityChanged:(id)a3 metric:(id)a4;
- (void)evaluateCbrsInDualSimMode:(BOOL)a3;
- (void)evaluateCbrsInSingleSimMode;
- (void)evaluateCellularScore:(unsigned __int8)a3 currnetConf:(unsigned __int8)a4 score:(char *)a5 conf:(char *)a6 evalMode:(BOOL)a7 outrankExit:(BOOL)a8;
- (void)evaluateCellularScorePrivateNw:(unsigned __int8)a3 currnetConf:(unsigned __int8)a4 score:(char *)a5 conf:(char *)a6 evalMode:(BOOL)a7 outrankExit:(BOOL)a8;
- (void)feedCellularMetricsWithUUID:(id)a3;
- (void)fetchSmartDataModeDataForLocation:(double)a3 :(double)a4 :(unsigned __int16)a5 :(unsigned __int16)a6 :(unint64_t)a7 :(int64_t)a8;
- (void)fetchWrmSdmLocationDbInfoWithMcc:(unsigned int)a3 Mnc:(unsigned int)a4 CellId:(unint64_t)a5 ForSim:(int64_t)a6;
- (void)getCurrentEnhancedCTMetrics;
- (void)handleSettingCellularSpeedTestSetting:(BOOL)a3;
- (void)imsRegistrationChanged:(id)a3 info:(id)a4;
- (void)initCellStationManager;
- (void)initCellularProductExperimentsManager;
- (void)initCellularSpeedTest;
- (void)initCoreTelephonyClient;
- (void)initLocationController;
- (void)initMovAverageOfSignalBar;
- (void)initializeStrongestSOSSignal:(double)a3;
- (void)interfaceCostExpensiveChanged:(id)a3 isExpensive:(BOOL)a4;
- (void)internetConnectionStateChanged:(id)a3;
- (void)invalidateAudioQualityMetrics;
- (void)monitorStrongSOSSignal:(double)a3;
- (void)nrSliceAppStateChanged:(id)a3 status:(BOOL)a4 trafficDescriptors:(id)a5;
- (void)plmnChanged:(id)a3 plmn:(id)a4;
- (void)privateNetworkInfoDidChange:(BOOL)a3;
- (void)processDataAttached:(BOOL)a3 :(int64_t)a4;
- (void)processDataStatus:(id)a3 :(int64_t)a4;
- (void)processEnhancedDataLQMBlob:(id)a3 :(int64_t)a4;
- (void)processEnhancedVoiceLinkQualityBlob:(id)a3 :(int64_t)a4;
- (void)processMobileCountryCode:(id)a3 :(int64_t)a4;
- (void)processMobileNetworkCode:(id)a3 :(int64_t)a4;
- (void)processPrivateNwPreferredOverWifiStatus:(BOOL)a3 slot:(int64_t)a4;
- (void)processPrivateNwSimStatus:(BOOL)a3 slot:(int64_t)a4;
- (void)processRadioTechnologyInfo:(id)a3 :(int64_t)a4;
- (void)processRegistrationStatus:(id)a3 :(int64_t)a4;
- (void)processSignalStrengthInfo:(id)a3 :(int64_t)a4;
- (void)processSubscriptionInfo:(id)a3 :(id)a4;
- (void)processVoiceLinkQualityInfo:(id)a3 :(int64_t)a4;
- (void)processVoiceLqmQMI:(unsigned __int8)a3 VLQM:(unsigned __int8)a4 IMSPreference:(BOOL)a5 AudioErasure:(double)a6 RSRP:(double)a7;
- (void)processVolteStatus:(BOOL)a3 :(int64_t)a4;
- (void)processWiFiCallingStatus:(BOOL)a3 :(int64_t)a4;
- (void)queryLocationdDBForHarvestingData:(double)a3 :(double)a4;
- (void)reloadCellularSpeedTestSettingsFromPreferences;
- (void)resetCbrsCAMetricSentOnSimSlot:(int64_t)a3;
- (void)resetCellularDataLQM;
- (void)resetLteVoiceLQM;
- (void)resetMovAverageOfSignalBar;
- (void)resetWiFiNRStatusDataSlot;
- (void)setActiveSlot:(int64_t)a3;
- (void)setBars:(id)a3;
- (void)setCTClient:(id)a3;
- (void)setCTClientInitDone:(BOOL)a3;
- (void)setCbrsCoreAnalyticsMetricsSent:(id)a3;
- (void)setCellARFCN:(id)a3;
- (void)setCellBandInfo:(id)a3;
- (void)setCellBandwidth:(id)a3;
- (void)setCellID:(id)a3;
- (void)setCellularAvailabilityStatusQueue:(id)a3;
- (void)setCellularSpeedTestSettingsToPreferences:(BOOL)a3;
- (void)setCellularSpeedTestsDisabled:(BOOL)a3;
- (void)setConfiguredMaxDLBW:(id)a3;
- (void)setConfiguredMaxULBW:(id)a3;
- (void)setCurrCBRSCellFound:(id)a3;
- (void)setCurrNRCellFound:(id)a3;
- (void)setCurrentHarvestedCellTypeFR2Capable:(id)a3;
- (void)setCurrentNRCellType:(id)a3;
- (void)setDataBW:(id)a3;
- (void)setDataEnabled:(id)a3;
- (void)setDataIndicator:(id)a3;
- (void)setDataLqmIsValid:(id)a3;
- (void)setDataLqmValue:(id)a3;
- (void)setDataModeLTE:(id)a3;
- (void)setDataPreferredSlot:(int64_t)a3;
- (void)setDataPreferredSlotOnCBRS:(BOOL)a3;
- (void)setDetectedFR1CellBW:(id)a3;
- (void)setDetectedFR1CellCountLocDB:(id)a3;
- (void)setDetectedFR2CellCountLocDB:(id)a3;
- (void)setEstimatedBWDL:(id)a3;
- (void)setEstimatedBWDLConf:(id)a3;
- (void)setEstimatedBWUL:(id)a3;
- (void)setEstimatedBWULConf:(id)a3;
- (void)setHighDataRateObserved:(id)a3;
- (void)setImsVoiceOverPSSupported:(id)a3;
- (void)setIsDataAttached:(id)a3;
- (void)setIsDataEnabled:(id)a3;
- (void)setIsDeviceRegistered:(id)a3;
- (void)setIsExpensive:(id)a3;
- (void)setIsFR2Radio:(id)a3;
- (void)setIsPrivateNetworkPreferredOverWifi:(id)a3;
- (void)setIsPrivateNetworkSim:(id)a3;
- (void)setIsRoaming:(id)a3;
- (void)setIsVolteSupported:(id)a3;
- (void)setIsWiFiCallingSupported:(id)a3;
- (void)setLoads:(id)a3;
- (void)setLocDbRequired:(id)a3;
- (void)setMCTService:(id)a3;
- (void)setMSubscriptionInfoDidChange:(BOOL)a3;
- (void)setMcc:(id)a3;
- (void)setMnc:(id)a3;
- (void)setMovingAverageSignalBars:(id)a3;
- (void)setNeighberCellType:(id)a3;
- (void)setNrCellRSRP:(id)a3;
- (void)setNrCellRSRQ:(id)a3;
- (void)setNrCellSNR:(id)a3;
- (void)setNrRSRP:(double)a3 forSim:(int64_t)a4;
- (void)setNrRSRQ:(double)a3 forSim:(int64_t)a4;
- (void)setNrSNR:(double)a3 forSim:(int64_t)a4;
- (void)setNumberofSubscriptions:(unint64_t)a3;
- (void)setPrevAudioErasurePercent:(id)a3;
- (void)setPrevAudioQualityWasGood:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRadioCoverage:(id)a3;
- (void)setRadioFrequency:(id)a3;
- (void)setRrcState:(id)a3;
- (void)setServCellECIO:(id)a3;
- (void)setServCellRSCP:(id)a3;
- (void)setServCellRSRP:(id)a3;
- (void)setServCellRSRQ:(id)a3;
- (void)setServCellRSSI:(id)a3;
- (void)setServCellRadioTechnologyType:(id)a3;
- (void)setServCellSINR:(id)a3;
- (void)setServCellSNR:(id)a3;
- (void)setServerQueue:(id)a3;
- (void)setServingCellECIO:(double)a3 forSim:(int64_t)a4;
- (void)setServingCellRSCP:(double)a3 forSim:(int64_t)a4;
- (void)setServingCellRSRP:(double)a3 forSim:(int64_t)a4;
- (void)setServingCellRSRQ:(double)a3 forSim:(int64_t)a4;
- (void)setServingCellRSSI:(double)a3 forSim:(int64_t)a4;
- (void)setServingCellSINR:(double)a3 forSim:(int64_t)a4;
- (void)setServingCellSNR:(double)a3 forSim:(int64_t)a4;
- (void)setStallDetected:(id)a3;
- (void)setSubscriptions:(id)a3;
- (void)setTrialParameters:(id)a3;
- (void)setVoiceLqmIsValid:(id)a3;
- (void)setVoiceLqmReasonCode:(id)a3;
- (void)setVoiceLqmValue:(id)a3;
- (void)setWifiCBRSCellFound:(id)a3;
- (void)setWifiNRCellFound:(id)a3;
- (void)signalStrengthChanged:(id)a3 info:(id)a4;
- (void)smartDataModeChanged:(id)a3 userEnabled:(BOOL)a4;
- (void)subscriptionInfoDidChange;
- (void)switchPrivateNwDataSim:(int64_t)a3 currentSlotQuality:(int)a4 anyCallState:(int)a5 forceRecommend:(BOOL)a6;
- (void)tiggerEnhanceLQMConfiguration;
- (void)triggerCommCenterForActivation;
- (void)triggerCommCenterForDeActivation;
- (void)triggerHarvestedCellEval;
- (void)triggerLocationUpdate;
- (void)updateAudioQuality:(id)a3 :(int64_t)a4;
- (void)updateAudioQualityKaroo:(id *)a3 :(int64_t)a4;
- (void)updateCallState:(int)a3;
- (void)updateCellularAvailabilityStatus:(id)a3 :(int64_t)a4 :(double)a5 :(BOOL)a6;
- (void)updateConfiguredMaxBW:(int64_t)a3 dlbw:(unsigned int)a4 ulbw:(unsigned int)a5;
- (void)updateConnectedStateSummary:(int64_t)a3 neighberNRCell:(int)a4 highrateIndicator:(BOOL)a5;
- (void)updateCurrentRatInfo:(int64_t)a3 currentNRCell:(int)a4;
- (void)updateDataStallState:(int64_t)a3 stall:(BOOL)a4;
- (void)updateDownlinkEstimatedBW:(unsigned __int8)a3 bw:(unsigned int)a4 conf:(unsigned int)a5 lte:(unsigned int)a6 nr:(unsigned int)a7;
- (void)updateGlobalCellID:(unsigned __int8)a3 gci:(id)a4 cellprefix:(int)a5;
- (void)updateHighRateLikely:(int64_t)a3 highrateIndicator:(BOOL)a4;
- (void)updateLTEBandwidth:(int64_t)a3 LTEBW:(unsigned int)a4;
- (void)updateMovAverageOfSignalBar;
- (void)updateUplinkEstimatedBW:(unsigned __int8)a3 bw:(unsigned int)a4 conf:(unsigned int)a5 queue:(unsigned int)a6;
- (void)updateVoLTESpeechErasure:(unint64_t)a3;
- (void)updateWrmSdmLocationDbInfoRegister:(BOOL)a3 forSim:(int64_t)a4;
- (void)voiceLinkQualityChanged:(id)a3 metric:(id)a4;
- (void)writeToCellularAvailabilityStatusBiomeStream:(double)a3 :(BOOL)a4;
@end

@implementation WRM_EnhancedCTService

- (BOOL)cellularDataEnabled
{
  if ([(WRM_EnhancedCTService *)self activeSlot])
  {
    if ((id)[(WRM_EnhancedCTService *)self activeSlot] == (id)1)
    {
      v3 = "CTSubscriptionSlotOne";
    }
    else if ((id)[(WRM_EnhancedCTService *)self activeSlot] == (id)2)
    {
      v3 = "CTSubscriptionSlotTwo";
    }
    else
    {
      v3 = "Unknown CTSubscriptionSlot!!!";
    }
  }
  else
  {
    v3 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: active slot %s isDataEnabled %@", "-[WRM_EnhancedCTService cellularDataEnabled]", v3, [(WRM_EnhancedCTService *)self isDataEnabled]);
  id v4 = [(NSMutableArray *)[(WRM_EnhancedCTService *)self isDataEnabled] objectAtIndex:(char *)[(WRM_EnhancedCTService *)self activeSlot] - 1];

  return [v4 BOOLValue];
}

- (NSMutableArray)isDataEnabled
{
  return *(NSMutableArray **)((char *)&self->_isDataAttached + 4);
}

- (BOOL)isIMSPreferenceEnabled
{
  if ([(WRM_EnhancedCTService *)self activeSlot])
  {
    if ((id)[(WRM_EnhancedCTService *)self activeSlot] == (id)1)
    {
      v3 = "CTSubscriptionSlotOne";
    }
    else if ((id)[(WRM_EnhancedCTService *)self activeSlot] == (id)2)
    {
      v3 = "CTSubscriptionSlotTwo";
    }
    else
    {
      v3 = "Unknown CTSubscriptionSlot!!!";
    }
  }
  else
  {
    v3 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: active slot %s imsVoiceOverPSSupported %@", "-[WRM_EnhancedCTService isIMSPreferenceEnabled]", v3, [(WRM_EnhancedCTService *)self imsVoiceOverPSSupported]);
  id v4 = [(NSMutableArray *)[(WRM_EnhancedCTService *)self imsVoiceOverPSSupported] objectAtIndex:(char *)[(WRM_EnhancedCTService *)self activeSlot] - 1];

  return [v4 BOOLValue];
}

- (NSMutableArray)imsVoiceOverPSSupported
{
  return *(NSMutableArray **)((char *)&self->_VoiceLqmReasonCode + 4);
}

- (BOOL)registeredWithCellularNetwork
{
  if ([(WRM_EnhancedCTService *)self activeSlot])
  {
    if ((id)[(WRM_EnhancedCTService *)self activeSlot] == (id)1)
    {
      v3 = "CTSubscriptionSlotOne";
    }
    else if ((id)[(WRM_EnhancedCTService *)self activeSlot] == (id)2)
    {
      v3 = "CTSubscriptionSlotTwo";
    }
    else
    {
      v3 = "Unknown CTSubscriptionSlot!!!";
    }
  }
  else
  {
    v3 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: active slot %s isDeviceRegistered %@", "-[WRM_EnhancedCTService registeredWithCellularNetwork]", v3, [(WRM_EnhancedCTService *)self isDeviceRegistered]);
  id v4 = [(NSMutableArray *)[(WRM_EnhancedCTService *)self isDeviceRegistered] objectAtIndex:(char *)[(WRM_EnhancedCTService *)self activeSlot] - 1];

  return [v4 BOOLValue];
}

- (NSMutableArray)isDeviceRegistered
{
  return *(NSMutableArray **)((char *)&self->_isDataEnabled + 4);
}

- (void)cellChanged:(id)a3 cell:(id)a4
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s context %@ cell info %@", "-[WRM_EnhancedCTService cellChanged:cell:]", a3, a4);
  if (a4)
  {
    id v7 = [a4 objectForKey:@"kCTRegistrationRadioAccessTechnology"];
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s rat info %@", "-[WRM_EnhancedCTService cellChanged:cell:]", v7);
    if (v7)
    {
      id v8 = [a3 slotID];
      [(WRM_EnhancedCTService *)self processRadioTechnologyInfo:v7 :v8];
    }
  }
}

- (float)getCurrentMovAvgSignalBars
{
  uint64_t v5 = 0;
  v6 = (float *)&v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000F988;
  v4[3] = &unk_10020DBB8;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v4);
  float v2 = v6[6];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (int64_t)getCurrentSignalBars
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001FDA4;
  v4[3] = &unk_10020DBB8;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v4);
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isVoLTESupported
{
  if ([(WRM_EnhancedCTService *)self activeSlot])
  {
    if ((id)[(WRM_EnhancedCTService *)self activeSlot] == (id)1)
    {
      v3 = "CTSubscriptionSlotOne";
    }
    else if ((id)[(WRM_EnhancedCTService *)self activeSlot] == (id)2)
    {
      v3 = "CTSubscriptionSlotTwo";
    }
    else
    {
      v3 = "Unknown CTSubscriptionSlot!!!";
    }
  }
  else
  {
    v3 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: active slot %s isVoLTESupported %@", "-[WRM_EnhancedCTService isVoLTESupported]", v3, [(WRM_EnhancedCTService *)self isVolteSupported]);
  id v4 = [(NSMutableArray *)[(WRM_EnhancedCTService *)self isVolteSupported] objectAtIndex:(char *)[(WRM_EnhancedCTService *)self activeSlot] - 1];

  return [v4 BOOLValue];
}

- (NSMutableArray)isVolteSupported
{
  return *(NSMutableArray **)((char *)&self->_isPrivateNetworkPreferredOverWifi + 4);
}

- (BOOL)dataAttachedWithCellularNetwork
{
  if ([(WRM_EnhancedCTService *)self activeSlot])
  {
    if ((id)[(WRM_EnhancedCTService *)self activeSlot] == (id)1)
    {
      v3 = "CTSubscriptionSlotOne";
    }
    else if ((id)[(WRM_EnhancedCTService *)self activeSlot] == (id)2)
    {
      v3 = "CTSubscriptionSlotTwo";
    }
    else
    {
      v3 = "Unknown CTSubscriptionSlot!!!";
    }
  }
  else
  {
    v3 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: active slot %s isDataAttached %@", "-[WRM_EnhancedCTService dataAttachedWithCellularNetwork]", v3, [(WRM_EnhancedCTService *)self isDataAttached]);
  id v4 = [(NSMutableArray *)[(WRM_EnhancedCTService *)self isDataAttached] objectAtIndex:(char *)[(WRM_EnhancedCTService *)self activeSlot] - 1];

  return [v4 BOOLValue];
}

- (NSMutableArray)isDataAttached
{
  return *(NSMutableArray **)((char *)&self->_dataPreferredSlot + 4);
}

- (BOOL)isVoiceLQMValid
{
  unsigned int v3 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService VoiceLqmIsValid](self, "VoiceLqmIsValid"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") - 1) BOOLValue];
  if ([(WRM_EnhancedCTService *)self activeSlot])
  {
    if ((id)[(WRM_EnhancedCTService *)self activeSlot] == (id)1)
    {
      id v4 = "CTSubscriptionSlotOne";
    }
    else
    {
      int64_t v5 = [(WRM_EnhancedCTService *)self activeSlot];
      id v4 = "Unknown CTSubscriptionSlot!!!";
      if (v5 == 2) {
        id v4 = "CTSubscriptionSlotTwo";
      }
    }
  }
  else
  {
    id v4 = "CTSubscriptionSlotUnknown";
  }
  v6 = "No";
  if (v3) {
    v6 = "Yes";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: active slot %s vLQM is valid? %s", "-[WRM_EnhancedCTService isVoiceLQMValid]", v4, v6);
  return v3;
}

- (NSMutableArray)VoiceLqmIsValid
{
  return *(NSMutableArray **)((char *)&self->_VoiceLqmValue + 4);
}

- (int)getLteVoiceLQM
{
  id v3 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService VoiceLqmValue](self, "VoiceLqmValue"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") - 1) intValue];
  if ([(WRM_EnhancedCTService *)self activeSlot])
  {
    if ((id)[(WRM_EnhancedCTService *)self activeSlot] == (id)1)
    {
      id v4 = "CTSubscriptionSlotOne";
    }
    else
    {
      int64_t v5 = [(WRM_EnhancedCTService *)self activeSlot];
      id v4 = "Unknown CTSubscriptionSlot!!!";
      if (v5 == 2) {
        id v4 = "CTSubscriptionSlotTwo";
      }
    }
  }
  else
  {
    id v4 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: active slot %s vLQM %d", "-[WRM_EnhancedCTService getLteVoiceLQM]", v4, v3);
  return (int)v3;
}

- (NSMutableArray)movingAverageSignalBars
{
  return *(NSMutableArray **)((char *)&self->_bars + 4);
}

- (void)cellMonitorUpdate:(id)a3 info:(id)a4
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s context %@ cell info %@", "-[WRM_EnhancedCTService cellMonitorUpdate:info:]", a3, a4);
  id v7 = [a4 legacyInfo];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v8 = (char *)[v7 countByEnumeratingWithState:&v63 objects:v67 count:16];
  if (v8)
  {
    v9 = v8;
    uint64_t v10 = *(void *)v64;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(void *)v64 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          return;
        }
      }
      v9 = (char *)[v7 countByEnumeratingWithState:&v63 objects:v67 count:16];
    }
    while (v9);
  }
  if (!v7 || ![v7 count]) {
    return;
  }
  id v62 = a3;
  v12 = &xpc_dictionary_get_BOOL_ptr;
  v13 = self;
  if (![v7 count])
  {
    id v47 = 0;
    LODWORD(v17) = 0;
    id v49 = 0;
    id v48 = 0;
    uint64_t v61 = 0;
    v46 = WRM_MotionController;
    goto LABEL_42;
  }
  unint64_t v14 = 0;
  id v54 = 0;
  id v55 = 0;
  id v15 = 0;
  char v52 = 0;
  id v53 = 0;
  uint64_t v16 = 0;
  uint64_t v60 = kCTCellMonitorCellId;
  uint64_t v59 = kCTCellMonitorUARFCN;
  uint64_t v58 = kCTCellMonitorBandInfo;
  uint64_t v57 = kCTCellMonitorBandwidth;
  uint64_t v56 = kCTCellMonitorNRARFCN;
  do
  {
    id v17 = v15;
    uint64_t v18 = v16;
    v19 = v12;
    id v20 = [v7 objectAtIndex:v14];
    id v21 = [v20 objectForKeyedSubscript:v60];
    if (v21) {
      id v17 = [v21 intValue];
    }
    id v22 = [v20 objectForKeyedSubscript:v59];
    if (v22)
    {
      id v23 = [v22 intValue];
      v24 = [(WRM_EnhancedCTService *)self cellARFCN];
      v25 = (char *)[v62 slotID] - 1;
      id v54 = v23;
      id v26 = [v19[76] numberWithInt:v23];
      v27 = v24;
      self = v13;
      [(NSMutableArray *)v27 replaceObjectAtIndex:v25 withObject:v26];
    }
    id v28 = [v20 objectForKeyedSubscript:v58];
    if (v28)
    {
      id v29 = [v28 intValue];
      v30 = [(WRM_EnhancedCTService *)self cellBandInfo];
      v31 = (char *)[v62 slotID] - 1;
      id v53 = v29;
      id v32 = [v19[76] numberWithInt:v29];
      v33 = v31;
      self = v13;
      [(NSMutableArray *)v30 replaceObjectAtIndex:v33 withObject:v32];
    }
    id v34 = [v20 objectForKeyedSubscript:v57];
    v12 = v19;
    uint64_t v16 = v18;
    id v15 = v17;
    if (v34)
    {
      int v35 = [v34 intValue];
      if (v35 > 49)
      {
        switch(v35)
        {
          case '2':
            uint64_t v16 = 10;
            goto LABEL_34;
          case 'K':
            uint64_t v16 = 15;
            goto LABEL_34;
          case 'd':
            uint64_t v16 = 20;
            goto LABEL_34;
        }
      }
      else
      {
        switch(v35)
        {
          case 6:
            uint64_t v16 = 1;
            goto LABEL_34;
          case 16:
            uint64_t v16 = 3;
            goto LABEL_34;
          case 25:
            uint64_t v16 = 5;
LABEL_34:
            v36 = [(WRM_EnhancedCTService *)self cellBandwidth];
            v37 = (char *)[v62 slotID] - 1;
            id v38 = [v12[76] numberWithInt:v16];
            v39 = v37;
            self = v13;
            [(NSMutableArray *)v36 replaceObjectAtIndex:v39 withObject:v38];
            goto LABEL_35;
        }
      }
      uint64_t v16 = 0;
      goto LABEL_34;
    }
LABEL_35:
    id v40 = [v20 objectForKeyedSubscript:v56];
    if (v40)
    {
      id v55 = [v40 intValue];
      char v52 = 1;
    }
    ++v14;
  }
  while ((unint64_t)[v7 count] > v14);
  if (v52)
  {
    uint64_t v61 = v16;
    v41 = v13;
    v42 = [(WRM_EnhancedCTService *)v13 cellID];
    v43 = v62;
    [-[NSMutableArray replaceObjectAtIndex:withObject:](v42, "replaceObjectAtIndex:withObject:", (char *)[v62 slotID] - 1, [v12[76] numberWithInt:v17]);
    uint64_t v44 = 1;
    [-[WRM_EnhancedCTService currNRCellFound](v41, "currNRCellFound") replaceObjectAtIndex:[v62 slotID] - 1 withObject:[v12[76] numberWithInt:1]];
    v45 = [(WRM_EnhancedCTService *)v41 wifiNRCellFound];
    v46 = WRM_MotionController;
    id v48 = v53;
    id v47 = v54;
    goto LABEL_45;
  }
  uint64_t v61 = v16;
  v46 = WRM_MotionController;
  id v48 = v53;
  id v47 = v54;
  id v49 = v55;
LABEL_42:
  v50 = v13;
  v51 = [(WRM_EnhancedCTService *)v13 cellID];
  v43 = v62;
  if (objc_msgSend(-[NSMutableArray objectAtIndex:](v51, "objectAtIndex:", (char *)objc_msgSend(v62, "slotID") - 1), "intValue") == v17)
  {
    uint64_t v44 = 0;
  }
  else
  {
    id v55 = v49;
    [-[WRM_EnhancedCTService wifiNRCellFound](v50, "wifiNRCellFound") replaceObjectAtIndex:((char *)[v62 slotID] - 1) withObject:[v12[76] numberWithInt:0]];
    v45 = [(WRM_EnhancedCTService *)v50 currNRCellFound];
    uint64_t v44 = 0;
LABEL_45:
    -[NSMutableArray replaceObjectAtIndex:withObject:](v45, "replaceObjectAtIndex:withObject:", (char *)[v43 slotID] - 1, [v12[76] numberWithInt:v44]);
    id v49 = v55;
  }
  [&v46[50] logLevel:22, @"%s ARFCN: %d, CellBW: %d, CellBandInfo: %d, NRCellFound: %d, nARFCN: %d", "-[WRM_EnhancedCTService cellMonitorUpdate:info:]", v47, v61, v48, v44, v49 message];
}

- (BOOL)exitSaDepriotizationEval
{
  return dword_10027CFA8 > 0;
}

+ (id)wrm_EnhancedCTServiceSingleton
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C0C0;
  block[3] = &unk_10020D980;
  block[4] = a1;
  if (qword_10027CF98 != -1) {
    dispatch_once(&qword_10027CF98, block);
  }
  return (id)qword_10027CFA0;
}

- (BOOL)isWiFiCallingSupportedSlot2
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001ECE0;
  v4[3] = &unk_10020DB68;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isWiFiCallingSupportedSlot1
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001ECA0;
  v4[3] = &unk_10020DB68;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isWiFiCallingSupportedAnySlot
{
  char v2 = self;
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001ED20;
  block[3] = &unk_10020DB68;
  block[4] = self;
  void block[5] = &v5;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: isWiFiCallingSupported %@", "-[WRM_EnhancedCTService isWiFiCallingSupportedAnySlot]", [(WRM_EnhancedCTService *)v2 isWiFiCallingSupported]);
  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

- (OS_dispatch_queue)queue
{
  return *(CoreTelephonyClient **)((char *)&self->_CTClient + 4);
}

- (NSMutableArray)isWiFiCallingSupported
{
  return *(NSMutableArray **)((char *)&self->_isDeviceRegistered + 4);
}

- (BOOL)isDataPreferredSlotCBRS
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100024630;
  v4[3] = &unk_10020DB68;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (int)getCurrentNRStatusDataSlot
{
  id v3 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService currNRCellFound](self, "currNRCellFound"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
  if ([(WRM_EnhancedCTService *)self dataPreferredSlot])
  {
    if ((id)[(WRM_EnhancedCTService *)self dataPreferredSlot] == (id)1)
    {
      id v4 = "CTSubscriptionSlotOne";
    }
    else
    {
      int64_t v5 = [(WRM_EnhancedCTService *)self dataPreferredSlot];
      id v4 = "Unknown CTSubscriptionSlot!!!";
      if (v5 == 2) {
        id v4 = "CTSubscriptionSlotTwo";
      }
    }
  }
  else
  {
    id v4 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: active slot %s NR Available %d", "-[WRM_EnhancedCTService getCurrentNRStatusDataSlot]", v4, v3);
  return (int)v3;
}

- (NSMutableArray)currNRCellFound
{
  return *(NSMutableArray **)((char *)&self->_cellBandwidth + 4);
}

- (int)getCTDataIndictor
{
  unsigned int v3 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService dataIndicator](self, "dataIndicator"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
  if ([(WRM_EnhancedCTService *)self dataPreferredSlot])
  {
    if ((id)[(WRM_EnhancedCTService *)self dataPreferredSlot] == (id)1)
    {
      id v4 = "CTSubscriptionSlotOne";
    }
    else
    {
      int64_t v5 = [(WRM_EnhancedCTService *)self dataPreferredSlot];
      id v4 = "Unknown CTSubscriptionSlot!!!";
      if (v5 == 2) {
        id v4 = "CTSubscriptionSlotTwo";
      }
    }
  }
  else
  {
    id v4 = "CTSubscriptionSlotUnknown";
  }
  if (v3 < 0x13 && ((0x7FFF7u >> v3) & 1) != 0)
  {
    v6 = (&off_10020E258)[v3];
  }
  else
  {
    v6 = "Unknown kCTDataIndicatorStatusUnknown!!!";
    if (v3 == 19) {
      v6 = "5G_CA";
    }
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: active slot %s Data indicator: %s", "-[WRM_EnhancedCTService getCTDataIndictor]", v4, v6);
  return v3;
}

- (void)evaluateCellularScore:(unsigned __int8)a3 currnetConf:(unsigned __int8)a4 score:(char *)a5 conf:(char *)a6 evalMode:(BOOL)a7 outrankExit:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  *a5 = a3;
  *a6 = a4;
  unsigned int v13 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellRadioTechnologyType](self, "servCellRadioTechnologyType"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
  id v14 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService currentNRCellType](self, "currentNRCellType"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
  id v15 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService rrcState](self, "rrcState"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
  if (v13 == 9 || v14 == 3)
  {
    [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService nrCellRSRP](self, "nrCellRSRP"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) doubleValue];
    double v17 = v21;
    [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService nrCellSNR](self, "nrCellSNR"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) doubleValue];
    uint64_t v19 = v22;
    id v20 = [(WRM_EnhancedCTService *)self nrCellRSRQ];
LABEL_6:
    [[-[NSMutableArray objectAtIndex:](v20, "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) doubleValue];
    double v24 = v23;
    BOOL v45 = v17 >= (double)(int)self->mCellConfiguredBandwidth && v23 >= (double)self->mCellRSRP4G5GvsWiFiThreshold;
    id v48 = a5;
    unsigned int v46 = v13;
    id v51 = v14;
    if ([(WRM_EnhancedCTService *)self dataPreferredSlot])
    {
      if ((id)[(WRM_EnhancedCTService *)self dataPreferredSlot] == (id)1)
      {
        v25 = "CTSubscriptionSlotOne";
      }
      else
      {
        int64_t v27 = [(WRM_EnhancedCTService *)self dataPreferredSlot];
        v25 = "Unknown CTSubscriptionSlot!!!";
        if (v27 == 2) {
          v25 = "CTSubscriptionSlotTwo";
        }
      }
    }
    else
    {
      v25 = "CTSubscriptionSlotUnknown";
    }
    BOOL v47 = v9;
    int v50 = (int)v15;
    +[WCM_Logging logLevel:24, @"evaluateCellularScore: RRC state: %d, forceActiveEval:%d, RSRP: %f, SNR: %f, RSRQ: %f, data slot: %s, locationEnabled:%d, exitOutrank: %d", v15, v9, *(void *)&v17, v19, *(void *)&v24, v25, byte_10027C878, v8 message];
    unsigned int v54 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService currentHarvestedCellTypeFR2Capable](self, "currentHarvestedCellTypeFR2Capable"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
    unsigned int v44 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService stallDetected](self, "stallDetected"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
    id v28 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService neighberCellType](self, "neighberCellType"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
    unsigned int v49 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService highDataRateObserved](self, "highDataRateObserved"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) BOOLValue];
    id v53 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService estimatedBWDL](self, "estimatedBWDL"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
    id v29 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService estimatedBWDLConf](self, "estimatedBWDLConf"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
    id v43 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService DataLqmValue](self, "DataLqmValue"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
    id v42 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService VoiceLqmValue](self, "VoiceLqmValue"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
    unsigned int v30 = [(WRM_EnhancedCTService *)self getWiFiNRStatusDataSlot];
    id v52 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService detectedFR1CellCountLocDB](self, "detectedFR1CellCountLocDB"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
    id v31 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService detectedFR2CellCountLocDB](self, "detectedFR2CellCountLocDB"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
    unsigned int v32 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService detectedFR1CellBW](self, "detectedFR1CellBW"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
    uint64_t v33 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService cellBandwidth](self, "cellBandwidth"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue] + v32;
    if ([(WRM_EnhancedCTService *)self dataPreferredSlot])
    {
      if ((id)[(WRM_EnhancedCTService *)self dataPreferredSlot] == (id)1)
      {
        id v34 = "CTSubscriptionSlotOne";
      }
      else
      {
        int64_t v35 = [(WRM_EnhancedCTService *)self dataPreferredSlot];
        id v34 = "Unknown CTSubscriptionSlot!!!";
        if (v35 == 2) {
          id v34 = "CTSubscriptionSlotTwo";
        }
      }
    }
    else
    {
      id v34 = "CTSubscriptionSlotUnknown";
    }
    +[WCM_Logging logLevel:24, @"evaluateCellularScore: LocationDB FR1 count: %d, FR2 count: %d: BW:%d  %s", v52, v31, v33, v34 message];
    +[WCM_Logging logLevel:24, @"evaluateCellularScore: HarvestedCellFR2: %d, NeighberCell: %d, Connected Cell: %d, High rate likely : %d, DL BW:%d, DL Conf:%d isWiFiCellNR: %d", v54 != 0, v28, v51, v49, v53, v29, v30 != 0 message];
    if (v50 != 1 && !v47 && !v8)
    {
      if (v28 == 2 || v51 == 2 || v31 || !byte_10027C878 && v54)
      {
        *id v48 = 1;
        *a6 = 2;
        CFStringRef v26 = @"evaluateCellularScore: FR2 evaluation";
        goto LABEL_31;
      }
      if (v46 != 9
        && (v28 & 0xFFFFFFFD) != 1
        && v51 != 1
        && v28 != 4
        && v51 != 3
        && v51 != 4
        && !v52
        && !v30)
      {
        if (v54)
        {
          *id v48 = 2;
          *a6 = 1;
          +[WCM_Logging logLevel:24, @"evaluateCellularScore: Fall back FR2 eval, auth: %d", byte_10027C878 message];
          return;
        }
        *id v48 = 3;
        *a6 = 2;
        CFStringRef v26 = @"evaluateCellularScore: default evaluation";
        goto LABEL_31;
      }
      if (v17 < (double)(int)self->mCellConfiguredBandwidth)
      {
        +[WCM_Logging logLevel:24, @"evaluateCellularScore: FR1 evaluation, radio Condition good: %d", 0 message];
        v39 = v48;
        v36 = a6;
LABEL_59:
        char v40 = 2;
LABEL_70:
        char *v39 = v40;
        goto LABEL_71;
      }
      double mCellRSRP4G5GvsWiFiThreshold = (double)self->mCellRSRP4G5GvsWiFiThreshold;
      +[WCM_Logging logLevel:24, @"evaluateCellularScore: FR1 evaluation, radio Condition good: %d", v24 >= mCellRSRP4G5GvsWiFiThreshold message];
      if (v49)
      {
        v39 = v48;
        v36 = a6;
        if (v24 < mCellRSRP4G5GvsWiFiThreshold) {
          goto LABEL_59;
        }
      }
      else
      {
        v39 = v48;
        v36 = a6;
        if (v24 < mCellRSRP4G5GvsWiFiThreshold
          || v33 < HIDWORD(self->mInternetInterfaceName)
          || !v52)
        {
          goto LABEL_59;
        }
      }
      char v40 = 1;
      goto LABEL_70;
    }
    if (v8)
    {
      +[WCM_Logging logLevel:24 message:@"evaluateCellularScore: exit outrank WiFi quality good, NR not added and LTE can't support high bandwidth"];
      *id v48 = 3;
      v36 = a6;
LABEL_71:
      char *v36 = 2;
      return;
    }
    if ((int)v29 < 5)
    {
      +[WCM_Logging logLevel:24, @"evaluateCellularScore: dLQM: %d, vLQM: %d, RLGS stal: %d", v43, v42, v44 != 0 message];
      if (v43 != 10 && v42 != 10 && !v44)
      {
        if (v45 & v49)
        {
          CFStringRef v26 = @"evaluateCellularScore: RRC Connected mode";
          goto LABEL_31;
        }
        goto LABEL_60;
      }
    }
    else
    {
      +[WCM_Logging logLevel:24, @"evaluateCellularScore: DLBW: %d, Conf:%d", v53, v29 message];
      if ((int)v53 > 1999)
      {
        if (v45 & v49)
        {
          char v37 = 1;
LABEL_56:
          *id v48 = v37;
          char v38 = 2;
LABEL_61:
          *a6 = v38;
          return;
        }
LABEL_60:
        *id v48 = 2;
        char v38 = 1;
        goto LABEL_61;
      }
    }
    char v37 = 3;
    goto LABEL_56;
  }
  if (v13 == 1)
  {
    [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellRSRP](self, "servCellRSRP"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) doubleValue];
    double v17 = v16;
    [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellSNR](self, "servCellSNR"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) doubleValue];
    uint64_t v19 = v18;
    id v20 = [(WRM_EnhancedCTService *)self servCellRSRQ];
    goto LABEL_6;
  }
  *a5 = 3;
  *a6 = 2;
  CFStringRef v26 = @"evaluateCellularScore: score: bad";
LABEL_31:

  +[WCM_Logging logLevel:24 message:v26];
}

- (int64_t)dataPreferredSlot
{
  return *(int64_t *)((char *)&self->_subscriptions + 4);
}

- (int)getWiFiNRStatusDataSlot
{
  id v3 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService wifiNRCellFound](self, "wifiNRCellFound"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
  if ([(WRM_EnhancedCTService *)self dataPreferredSlot])
  {
    if ((id)[(WRM_EnhancedCTService *)self dataPreferredSlot] == (id)1)
    {
      id v4 = "CTSubscriptionSlotOne";
    }
    else
    {
      int64_t v5 = [(WRM_EnhancedCTService *)self dataPreferredSlot];
      id v4 = "Unknown CTSubscriptionSlot!!!";
      if (v5 == 2) {
        id v4 = "CTSubscriptionSlotTwo";
      }
    }
  }
  else
  {
    id v4 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: active slot %s NR Available %d", "-[WRM_EnhancedCTService getWiFiNRStatusDataSlot]", v4, v3);
  return (int)v3;
}

- (NSMutableArray)wifiNRCellFound
{
  return *(NSMutableArray **)((char *)&self->_currNRCellFound + 4);
}

- (NSMutableArray)VoiceLqmValue
{
  return *(NSMutableArray **)((char *)&self->_servCellRadioTechnologyType + 4);
}

- (NSMutableArray)stallDetected
{
  return *(NSMutableArray **)((char *)&self->_currentHarvestedCellTypeFR2Capable + 4);
}

- (NSMutableArray)servCellSNR
{
  return *(NSMutableArray **)((char *)&self->_servCellRSRQ + 4);
}

- (NSMutableArray)servCellRSRQ
{
  return *(NSMutableArray **)((char *)&self->_servCellRSSI + 4);
}

- (NSMutableArray)servCellRSRP
{
  return *(NSMutableArray **)((char *)&self->_imsVoiceOverPSSupported + 4);
}

- (NSMutableArray)rrcState
{
  return *(NSMutableArray **)((char *)&self->_loads + 4);
}

- (NSMutableArray)neighberCellType
{
  return *(NSMutableArray **)((char *)&self->_estimatedBWULConf + 4);
}

- (NSMutableArray)highDataRateObserved
{
  return *(NSMutableArray **)((char *)&self->_neighberCellType + 4);
}

- (int)getBandWidthDataSlot
{
  id v3 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService cellBandwidth](self, "cellBandwidth"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
  if ([(WRM_EnhancedCTService *)self dataPreferredSlot])
  {
    if ((id)[(WRM_EnhancedCTService *)self dataPreferredSlot] == (id)1)
    {
      id v4 = "CTSubscriptionSlotOne";
    }
    else
    {
      int64_t v5 = [(WRM_EnhancedCTService *)self dataPreferredSlot];
      id v4 = "Unknown CTSubscriptionSlot!!!";
      if (v5 == 2) {
        id v4 = "CTSubscriptionSlotTwo";
      }
    }
  }
  else
  {
    id v4 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: active slot %s Cell BW %d", "-[WRM_EnhancedCTService getBandWidthDataSlot]", v4, v3);
  return (int)v3;
}

- (NSMutableArray)cellBandwidth
{
  return *(NSMutableArray **)((char *)&self->_cellBandInfo + 4);
}

- (NSMutableArray)estimatedBWDL
{
  return *(NSMutableArray **)((char *)&self->_configuredMaxULBW + 4);
}

- (NSMutableArray)estimatedBWDLConf
{
  return *(NSMutableArray **)((char *)&self->_estimatedBWDL + 4);
}

- (NSMutableArray)detectedFR2CellCountLocDB
{
  return *(NSMutableArray **)((char *)&self->_detectedFR1CellBW + 4);
}

- (NSMutableArray)detectedFR1CellCountLocDB
{
  return *(NSMutableArray **)((char *)&self->_cbrsCoreAnalyticsMetricsSent + 4);
}

- (NSMutableArray)detectedFR1CellBW
{
  return *(NSMutableArray **)((char *)&self->_detectedFR1CellCountLocDB + 4);
}

- (NSMutableArray)dataIndicator
{
  return *(NSMutableArray **)((char *)&self->_nrCellSNR + 4);
}

- (NSMutableArray)currentNRCellType
{
  return *(NSMutableArray **)((char *)&self->_highDataRateObserved + 4);
}

- (NSMutableArray)currentHarvestedCellTypeFR2Capable
{
  return *(NSMutableArray **)((char *)&self->_currentNRCellType + 4);
}

- (NSMutableArray)DataLqmValue
{
  return *(NSMutableArray **)((char *)&self->_VoiceLqmIsValid + 4);
}

- (NSMutableArray)bars
{
  return *(NSMutableArray **)((char *)&self->_dataEnabled + 4);
}

- (int)getServingCellType
{
  int v3 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellRadioTechnologyType](self, "servCellRadioTechnologyType"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") - 1) intValue];
  if ([(WRM_EnhancedCTService *)self activeSlot])
  {
    if ((id)[(WRM_EnhancedCTService *)self activeSlot] == (id)1)
    {
      id v4 = "CTSubscriptionSlotOne";
    }
    else if ((id)[(WRM_EnhancedCTService *)self activeSlot] == (id)2)
    {
      id v4 = "CTSubscriptionSlotTwo";
    }
    else
    {
      id v4 = "Unknown CTSubscriptionSlot!!!";
    }
  }
  else
  {
    id v4 = "CTSubscriptionSlotUnknown";
  }
  int64_t v5 = [(WRM_EnhancedCTService *)self servCellRadioTechnologyType];
  int v6 = v3 - 1;
  if (v3 - 1) < 0xA && ((0x2FFu >> v6))
  {
    uint64_t v7 = (&off_10020E170)[v6];
  }
  else
  {
    uint64_t v7 = "UNKNOWN_RADIO!!!";
    if (v3 == 9) {
      uint64_t v7 = "N_RADIO";
    }
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: active slot %s rat property %@ rat %s", "-[WRM_EnhancedCTService getServingCellType]", v4, v5, v7);
  return v3;
}

- (NSMutableArray)servCellRadioTechnologyType
{
  return *(NSMutableArray **)((char *)&self->_movingAverageSignalBars + 4);
}

- (BOOL)isDeviceUsingFR2Radio
{
  if ([(WRM_EnhancedCTService *)self activeSlot])
  {
    if ((id)[(WRM_EnhancedCTService *)self activeSlot] == (id)1)
    {
      int v3 = "CTSubscriptionSlotOne";
    }
    else if ((id)[(WRM_EnhancedCTService *)self activeSlot] == (id)2)
    {
      int v3 = "CTSubscriptionSlotTwo";
    }
    else
    {
      int v3 = "Unknown CTSubscriptionSlot!!!";
    }
  }
  else
  {
    int v3 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: active slot %s isFR2 %@", "-[WRM_EnhancedCTService isDeviceUsingFR2Radio]", v3, [(WRM_EnhancedCTService *)self isFR2Radio]);
  id v4 = [(NSMutableArray *)[(WRM_EnhancedCTService *)self isFR2Radio] objectAtIndex:(char *)[(WRM_EnhancedCTService *)self dataPreferredSlot] - 1];

  return [v4 BOOLValue];
}

- (int64_t)activeSlot
{
  return *(void *)(&self->_dataPreferredSlotOnCBRS + 1);
}

- (NSMutableArray)isFR2Radio
{
  return *(NSMutableArray **)((char *)&self->_isRoaming + 4);
}

- (NSMutableArray)cellID
{
  return *(NSMutableArray **)((char *)&self->_wifiNRCellFound + 4);
}

- (NSMutableArray)cellBandInfo
{
  return *(NSMutableArray **)((char *)&self->_cellARFCN + 4);
}

- (NSMutableArray)cellARFCN
{
  return *(NSMutableArray **)((char *)&self->_locDbRequired + 4);
}

- (void)setActiveSlot:(int64_t)a3
{
  if (!a3)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: Slot set to %s, changing it to Slot 1", "-[WRM_EnhancedCTService setActiveSlot:]", "CTSubscriptionSlotUnknown");
    a3 = 1;
  }
  *(void *)(&self->_dataPreferredSlotOnCBRS + 1) = a3;
}

- (void)updateMovAverageOfSignalBar
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FA70;
  block[3] = &unk_10020D980;
  block[4] = self;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)processRadioTechnologyInfo:(id)a3 :(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012714;
  block[3] = &unk_10020DDC0;
  block[4] = a3;
  void block[5] = self;
  void block[6] = a4;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (WRM_CTService)mCTService
{
  return *(WRM_CTService **)((char *)&self->_numberofSubscriptions + 4);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  id v3 = [a1 wrm_EnhancedCTServiceSingleton:a3];

  return v3;
}

- (unint64_t)retainCount
{
  return -1;
}

- (WRM_EnhancedCTService)init
{
  v13.receiver = self;
  v13.super_class = (Class)WRM_EnhancedCTService;
  char v2 = [(WRM_CTService *)&v13 init];
  if (v2)
  {
    [v2 setQueue:dispatch_queue_create("com.apple.WirelessRadioManager.enhancedCTClient", 0)];
    [v2 setServerQueue:dispatch_queue_create("com.apple.WirelessRadioManager.enhancedCTServer", 0)];
    [v2 setCellularAvailabilityStatusQueue:dispatch_queue_create("com.apple.WirelessRadioManager.enhancedCTCellularAvailabilityStatus", 0)];
    [v2 setCTClientInitDone:0];
    [v2 setMSubscriptionInfoDidChange:0];
    [v2 setActiveSlot:1];
    [v2 setSubscriptions:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setIsDataAttached:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setIsDataEnabled:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setIsDeviceRegistered:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setIsVolteSupported:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setIsWiFiCallingSupported:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setIsPrivateNetworkSim:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setIsPrivateNetworkPreferredOverWifi:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setIsRoaming:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setIsFR2Radio:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setRadioCoverage:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setRadioFrequency:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setDataEnabled:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setBars:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setMovingAverageSignalBars:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setServCellRadioTechnologyType:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setVoiceLqmValue:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setVoiceLqmIsValid:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setVoiceLqmReasonCode:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setImsVoiceOverPSSupported:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setServCellRSRP:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setServCellRSRQ:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setServCellRSSI:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setServCellSNR:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setServCellSINR:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setServCellRSCP:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setServCellECIO:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setPrevAudioQualityWasGood:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setPrevAudioErasurePercent:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setLoads:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setRrcState:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setMcc:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setMnc:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setNrCellRSRP:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setNrCellRSRQ:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setNrCellSNR:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setDataIndicator:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setDataBW:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setCellARFCN:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setCellBandInfo:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setCellBandwidth:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setLocDbRequired:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setCurrNRCellFound:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setWifiNRCellFound:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setCurrCBRSCellFound:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setDataPreferredSlotOnCBRS:0];
    [v2 setWifiCBRSCellFound:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setCbrsCoreAnalyticsMetricsSent:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setDetectedFR1CellCountLocDB:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setDetectedFR1CellBW:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setDetectedFR2CellCountLocDB:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setCellID:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setConfiguredMaxDLBW:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setConfiguredMaxULBW:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setEstimatedBWDL:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setEstimatedBWDLConf:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setEstimatedBWUL:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setEstimatedBWULConf:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setNeighberCellType:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setHighDataRateObserved:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setCurrentNRCellType:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setCurrentHarvestedCellTypeFR2Capable:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setStallDetected:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setDataModeLTE:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    [v2 setIsExpensive:[objc_alloc((Class)NSMutableArray) initWithCapacity:2]];
    *(void *)(v2 + 372) = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
    *((_DWORD *)v2 + 95) = -1;
    id v3 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getSCService];
    *(void *)(v2 + 428) = v3;
    if (!v3)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"%s: Creating SC Service WRM_SCServiceControllerSingleton", "-[WRM_EnhancedCTService init]");
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003D57C;
      block[3] = &unk_10020D980;
      block[4] = v2;
      dispatch_async(global_queue, block);
    }
    uint64_t v5 = 0;
    char v6 = 1;
    do
    {
      char v7 = v6;
      [objc_msgSend(v2, "isDataAttached") insertObject:[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0) atIndex:v5];
      [objc_msgSend(v2, "isDataEnabled") insertObject:[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1) atIndex:v5];
      [objc_msgSend(v2, "isDeviceRegistered") insertObject:[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0) atIndex:v5];
      [objc_msgSend(v2, "isVolteSupported") insertObject:[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0) atIndex:v5];
      [objc_msgSend(v2, "isWiFiCallingSupported") insertObject:[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0) atIndex:v5];
      [objc_msgSend(v2, "isPrivateNetworkSim") insertObject:[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0) atIndex:v5];
      [objc_msgSend(v2, "isPrivateNetworkPreferredOverWifi") insertObject:[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0) atIndex:v5];
      [objc_msgSend(v2, "isRoaming") insertObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0)] atIndex:v5];
      [objc_msgSend(v2, "isFR2Radio") insertObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0)] atIndex:v5];
      [objc_msgSend(v2, "radioCoverage") insertObject:[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0) atIndex:v5];
      [objc_msgSend(v2, "radioFrequency") insertObject:[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0) atIndex:v5];
      [objc_msgSend(v2, "dataEnabled") insertObject:[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0) atIndex:v5];
      [objc_msgSend(v2, "bars") insertObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 5)] atIndex:v5];
      id v8 = [v2 movingAverageSignalBars];
      LODWORD(v9) = 5.0;
      [v8 insertObject:[NSNumber numberWithFloat:v9] atIndex:v5];
      [objc_msgSend(v2, "servCellRadioTechnologyType") insertObject:[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 10) atIndex:v5];
      [objc_msgSend(v2, "VoiceLqmValue") insertObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0xFFFFFFFFLL)] atIndex:v5];
      [objc_msgSend(objc_msgSend(v2, "VoiceLqmIsValid"), "insertObject:atIndex:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), v5);
      [objc_msgSend(objc_msgSend(v2, "VoiceLqmReasonCode"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      [objc_msgSend(v2, "imsVoiceOverPSSupported") insertObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1)] atIndex:v5];
      [objc_msgSend(v2, "servCellRSRP") insertObject:[NSNumber numberWithDouble:0.0] atIndex:v5];
      [objc_msgSend(v2, "servCellRSRQ") insertObject:[NSNumber numberWithDouble:0.0] atIndex:v5];
      [objc_msgSend(v2, "servCellRSSI") insertObject:[NSNumber numberWithDouble:0.0] atIndex:v5];
      [objc_msgSend(v2, "servCellSNR") insertObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0)] atIndex:v5];
      [objc_msgSend(v2, "servCellSINR") insertObject:[NSNumber numberWithDouble:0.0] atIndex:v5];
      [objc_msgSend(v2, "servCellRSCP") insertObject:[NSNumber numberWithDouble:0.0] atIndex:v5];
      [objc_msgSend(v2, "servCellECIO") insertObject:[NSNumber numberWithDouble:0.0] atIndex:v5];
      [objc_msgSend(v2, "PrevAudioQualityWasGood") insertObject:[NSNumber numberWithBool:1] atIndex:v5];
      [objc_msgSend(v2, "PrevAudioErasurePercent") insertObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0)] atIndex:v5];
      [objc_msgSend(v2, "loads") insertObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0)] atIndex:v5];
      [objc_msgSend(v2, "rrcState") insertObject:[NSNumber numberWithInt:0] atIndex:v5];
      [objc_msgSend(v2, "nrCellRSRP") insertObject:[NSNumber numberWithDouble:0.0] atIndex:v5];
      [objc_msgSend(v2, "nrCellRSRQ") insertObject:[NSNumber numberWithDouble:0.0] atIndex:v5];
      [objc_msgSend(v2, "nrCellSNR") insertObject:[NSNumber numberWithDouble:0.0] atIndex:v5];
      [objc_msgSend(v2, "dataIndicator") insertObject:[NSNumber numberWithInt:0] atIndex:v5];
      [objc_msgSend(v2, "dataBW") insertObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0)] atIndex:v5];
      [objc_msgSend(v2, "mcc") insertObject:[NSNumber numberWithInt:0] atIndex:v5];
      [objc_msgSend(v2, "mnc") insertObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0)] atIndex:v5];
      [objc_msgSend(v2, "locDbRequired") insertObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0)] atIndex:v5];
      [objc_msgSend(v2, "cellARFCN") insertObject:[NSNumber numberWithInt:0] atIndex:v5];
      [objc_msgSend(objc_msgSend(v2, "cellBandInfo"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      [objc_msgSend(v2, "cellBandwidth") insertObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0)] atIndex:v5];
      [objc_msgSend(v2, "currNRCellFound") insertObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0)] atIndex:v5];
      [objc_msgSend(v2, "wifiNRCellFound") insertObject:[NSNumber numberWithInt:0] atIndex:v5];
      [objc_msgSend(v2, "currCBRSCellFound") insertObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0)] atIndex:v5];
      [objc_msgSend(v2, "cbrsCoreAnalyticsMetricsSent") insertObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0)] atIndex:v5];
      [objc_msgSend(v2, "detectedFR1CellCountLocDB") insertObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0)] atIndex:v5];
      [objc_msgSend(v2, "detectedFR1CellBW") insertObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0)] atIndex:v5];
      [objc_msgSend(v2, "detectedFR2CellCountLocDB") insertObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0)] atIndex:v5];
      [objc_msgSend(v2, "cellID") insertObject:[NSNumber numberWithInt:0] atIndex:v5];
      [objc_msgSend(v2, "configuredMaxDLBW") insertObject:[NSNumber numberWithInt:0] atIndex:v5];
      [objc_msgSend(v2, "configuredMaxULBW") insertObject:[NSNumber numberWithInt:0] atIndex:v5];
      [objc_msgSend(v2, "estimatedBWDL") insertObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0)] atIndex:v5];
      [objc_msgSend(v2, "estimatedBWDLConf") insertObject:[NSNumber numberWithInt:0] atIndex:v5];
      [objc_msgSend(v2, "estimatedBWUL") insertObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0)] atIndex:v5];
      [objc_msgSend(v2, "estimatedBWULConf") insertObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0)] atIndex:v5];
      [objc_msgSend(v2, "neighberCellType") insertObject:[NSNumber numberWithInt:0] atIndex:v5];
      [objc_msgSend(v2, "highDataRateObserved") insertObject:[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0) atIndex:v5];
      [objc_msgSend(v2, "currentNRCellType") insertObject:[NSNumber numberWithInt:0] atIndex:v5];
      [objc_msgSend(v2, "currentHarvestedCellTypeFR2Capable") insertObject:[NSNumber numberWithInt:0] atIndex:v5];
      [objc_msgSend(v2, "stallDetected") insertObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0)] atIndex:v5];
      [objc_msgSend(v2, "dataModeLTE") insertObject:[NSNumber numberWithInt:0] atIndex:v5];
      [objc_msgSend(v2, "isExpensive") insertObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0)] atIndex:v5];
      [*(id *)(v2 + 372) insertObject:[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0) atIndex:v5];
      char v6 = 0;
      uint64_t v5 = 1;
    }
    while ((v7 & 1) != 0);
    [v2 setNumberofSubscriptions:1];
    [v2 setDataPreferredSlot:1];
    *(void *)(v2 + 316) = 0;
    *(void *)(v2 + 324) = 0;
    *(void *)(v2 + 332) = 0;
    *(void *)(v2 + 340) = 0;
    *(void *)(v2 + 348) = 0;
    v2[364] = 0;
    *(void *)(v2 + 388) = 0;
    *(void *)(v2 + 396) = 0;
    *(void *)(v2 + 404) = 0xC08F400000000000;
    [v2 initSOSWaypointThreshold];
    *(void *)(v2 + 412) = v10;
    v2[420] = 0;
    *((_DWORD *)v2 + 113) = 40;
    *((_DWORD *)v2 + 114) = 250000;
    *((_DWORD *)v2 + 115) = -105;
    *((_DWORD *)v2 + 116) = -20;
    *(void *)(v2 + 468) = 0;
    *(void *)(v2 + 476) = 0;
    *((_DWORD *)v2 + 109) = 0;
    v2[484] = 0;
    *(void *)(v2 + 444) = 0;
    [v2 initCellularProductExperimentsManager];
    [v2 initCellStationManager];
    [v2 initLocationController];
    [v2 createWrmSdmLocationManager];
    +[WCM_Logging logLevel:22 message:@"enhancedCTService: module initialized"];
  }
  return (WRM_EnhancedCTService *)v2;
}

- (void)dealloc
{
  +[WCM_Logging logLevel:22 message:@"enhancedCTService: Dealloc !!"];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self subscriptions] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self isDataAttached] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self isDataEnabled] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self bars] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self movingAverageSignalBars] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self isDeviceRegistered] removeAllObjects];
  [*(id *)(&self->mWrmSdmLocationMonitoringStarted + 4) removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self isVolteSupported] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self isWiFiCallingSupported] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self isPrivateNetworkSim] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self isPrivateNetworkPreferredOverWifi] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self isRoaming] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self isFR2Radio] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self radioCoverage] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self radioFrequency] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self dataEnabled] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self servCellRadioTechnologyType] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self VoiceLqmIsValid] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self VoiceLqmValue] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self VoiceLqmReasonCode] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self imsVoiceOverPSSupported] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self servCellRSRP] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self servCellRSSI] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self servCellRSRQ] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self servCellSNR] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self servCellSINR] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self servCellECIO] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self servCellRSCP] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self PrevAudioQualityWasGood] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self PrevAudioErasurePercent] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self loads] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self rrcState] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self nrCellRSRP] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self nrCellRSRQ] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self nrCellSNR] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self mcc] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self mnc] removeAllObjects];
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self locDbRequired] removeAllObjects];
  if ([(WRM_EnhancedCTService *)self isDataAttached])
  {

    [(WRM_EnhancedCTService *)self setIsDataAttached:0];
  }
  if ([(WRM_EnhancedCTService *)self isDataEnabled])
  {

    [(WRM_EnhancedCTService *)self setIsDataEnabled:0];
  }
  if ([(WRM_EnhancedCTService *)self isDeviceRegistered])
  {

    [(WRM_EnhancedCTService *)self setIsDeviceRegistered:0];
  }
  id v3 = *(void **)(&self->mWrmSdmLocationMonitoringStarted + 4);
  if (v3)
  {

    *(void *)(&self->mWrmSdmLocationMonitoringStarted + 4) = 0;
  }
  if ([(WRM_EnhancedCTService *)self isVolteSupported])
  {

    [(WRM_EnhancedCTService *)self setIsVolteSupported:0];
  }
  if ([(WRM_EnhancedCTService *)self isWiFiCallingSupported])
  {

    [(WRM_EnhancedCTService *)self setIsWiFiCallingSupported:0];
  }
  if ([(WRM_EnhancedCTService *)self isPrivateNetworkSim])
  {

    [(WRM_EnhancedCTService *)self setIsPrivateNetworkSim:0];
  }
  if ([(WRM_EnhancedCTService *)self isPrivateNetworkPreferredOverWifi])
  {

    [(WRM_EnhancedCTService *)self setIsPrivateNetworkPreferredOverWifi:0];
  }
  if ([(WRM_EnhancedCTService *)self imsVoiceOverPSSupported])
  {

    [(WRM_EnhancedCTService *)self setImsVoiceOverPSSupported:0];
  }
  if ([(WRM_EnhancedCTService *)self PrevAudioQualityWasGood])
  {

    [(WRM_EnhancedCTService *)self setPrevAudioQualityWasGood:0];
  }
  if ([(WRM_EnhancedCTService *)self servCellRSRP])
  {

    [(WRM_EnhancedCTService *)self setServCellRSRP:0];
  }
  if ([(WRM_EnhancedCTService *)self servCellRSRQ])
  {

    [(WRM_EnhancedCTService *)self setServCellRSRQ:0];
  }
  if ([(WRM_EnhancedCTService *)self mcc])
  {

    [(WRM_EnhancedCTService *)self setMcc:0];
  }
  if ([(WRM_EnhancedCTService *)self mnc])
  {

    [(WRM_EnhancedCTService *)self setMnc:0];
  }
  if ([(WRM_EnhancedCTService *)self servCellRSSI])
  {

    [(WRM_EnhancedCTService *)self setServCellRSSI:0];
  }
  if ([(WRM_EnhancedCTService *)self servCellRSCP])
  {

    [(WRM_EnhancedCTService *)self setServCellRSCP:0];
  }
  if ([(WRM_EnhancedCTService *)self servCellECIO])
  {

    [(WRM_EnhancedCTService *)self setServCellECIO:0];
  }
  if ([(WRM_EnhancedCTService *)self servCellSNR])
  {

    [(WRM_EnhancedCTService *)self setServCellSNR:0];
  }
  if ([(WRM_EnhancedCTService *)self servCellSINR])
  {

    [(WRM_EnhancedCTService *)self setServCellSINR:0];
  }
  if ([(WRM_EnhancedCTService *)self isDeviceRegistered])
  {

    [(WRM_EnhancedCTService *)self setIsDeviceRegistered:0];
  }
  if ([(WRM_EnhancedCTService *)self isVolteSupported])
  {

    [(WRM_EnhancedCTService *)self setIsVolteSupported:0];
  }
  if ([(WRM_EnhancedCTService *)self servCellRadioTechnologyType])
  {

    [(WRM_EnhancedCTService *)self setServCellRadioTechnologyType:0];
  }
  if ([(WRM_EnhancedCTService *)self VoiceLqmIsValid])
  {

    [(WRM_EnhancedCTService *)self setVoiceLqmIsValid:0];
  }
  if ([(WRM_EnhancedCTService *)self VoiceLqmReasonCode])
  {

    [(WRM_EnhancedCTService *)self setVoiceLqmReasonCode:0];
  }
  if ([(WRM_EnhancedCTService *)self VoiceLqmValue])
  {

    [(WRM_EnhancedCTService *)self setVoiceLqmValue:0];
  }
  if ([(WRM_EnhancedCTService *)self dataEnabled])
  {

    [(WRM_EnhancedCTService *)self setDataEnabled:0];
  }
  if ([(WRM_EnhancedCTService *)self bars])
  {

    [(WRM_EnhancedCTService *)self setBars:0];
  }
  if ([(WRM_EnhancedCTService *)self movingAverageSignalBars])
  {

    [(WRM_EnhancedCTService *)self setMovingAverageSignalBars:0];
  }
  if ([(WRM_EnhancedCTService *)self subscriptions])
  {

    [(WRM_EnhancedCTService *)self setSubscriptions:0];
  }
  if ([(WRM_EnhancedCTService *)self queue])
  {
    dispatch_release((dispatch_object_t)[(WRM_EnhancedCTService *)self queue]);
    [(WRM_EnhancedCTService *)self setQueue:0];
  }
  if ([(WRM_EnhancedCTService *)self cellularAvailabilityStatusQueue])
  {
    dispatch_release((dispatch_object_t)[(WRM_EnhancedCTService *)self cellularAvailabilityStatusQueue]);
    [(WRM_EnhancedCTService *)self setCellularAvailabilityStatusQueue:0];
  }
  if ([(WRM_EnhancedCTService *)self loads])
  {

    [(WRM_EnhancedCTService *)self setLoads:0];
  }
  if ([(WRM_EnhancedCTService *)self rrcState])
  {

    [(WRM_EnhancedCTService *)self setRrcState:0];
  }
  if ([(WRM_EnhancedCTService *)self nrCellRSRP])
  {

    [(WRM_EnhancedCTService *)self setNrCellRSRP:0];
  }
  if ([(WRM_EnhancedCTService *)self nrCellRSRQ])
  {

    [(WRM_EnhancedCTService *)self setNrCellRSRQ:0];
  }
  if ([(WRM_EnhancedCTService *)self nrCellSNR])
  {

    [(WRM_EnhancedCTService *)self setNrCellSNR:0];
  }
  if ([(WRM_EnhancedCTService *)self locDbRequired])
  {

    [(WRM_EnhancedCTService *)self setLocDbRequired:0];
  }
  if ([(WRM_EnhancedCTService *)self dataIndicator])
  {

    [(WRM_EnhancedCTService *)self setDataIndicator:0];
  }
  if ([(WRM_EnhancedCTService *)self dataBW])
  {

    [(WRM_EnhancedCTService *)self setDataBW:0];
  }
  if ([(WRM_EnhancedCTService *)self cellARFCN])
  {

    [(WRM_EnhancedCTService *)self setCellARFCN:0];
  }
  if ([(WRM_EnhancedCTService *)self cellBandInfo])
  {

    [(WRM_EnhancedCTService *)self setCellBandInfo:0];
  }
  if ([(WRM_EnhancedCTService *)self cellBandwidth])
  {

    [(WRM_EnhancedCTService *)self setCellBandwidth:0];
  }
  if ([(WRM_EnhancedCTService *)self currNRCellFound])
  {

    [(WRM_EnhancedCTService *)self setCurrNRCellFound:0];
  }
  if ([(WRM_EnhancedCTService *)self wifiNRCellFound])
  {

    [(WRM_EnhancedCTService *)self setWifiNRCellFound:0];
  }
  if ([(WRM_EnhancedCTService *)self cellID])
  {

    [(WRM_EnhancedCTService *)self setCellID:0];
  }
  if ([(WRM_EnhancedCTService *)self currCBRSCellFound])
  {

    [(WRM_EnhancedCTService *)self setCurrCBRSCellFound:0];
  }
  if ([(WRM_EnhancedCTService *)self cbrsCoreAnalyticsMetricsSent])
  {

    [(WRM_EnhancedCTService *)self setCbrsCoreAnalyticsMetricsSent:0];
  }
  if ([(WRM_EnhancedCTService *)self wifiCBRSCellFound])
  {

    [(WRM_EnhancedCTService *)self setWifiCBRSCellFound:0];
  }
  if ([(WRM_EnhancedCTService *)self detectedFR1CellCountLocDB])
  {

    [(WRM_EnhancedCTService *)self setDetectedFR1CellCountLocDB:0];
  }
  if ([(WRM_EnhancedCTService *)self detectedFR1CellBW])
  {

    [(WRM_EnhancedCTService *)self setDetectedFR1CellBW:0];
  }
  if ([(WRM_EnhancedCTService *)self detectedFR2CellCountLocDB])
  {

    [(WRM_EnhancedCTService *)self setDetectedFR2CellCountLocDB:0];
  }
  if ([(WRM_EnhancedCTService *)self configuredMaxDLBW])
  {

    [(WRM_EnhancedCTService *)self setConfiguredMaxDLBW:0];
  }
  if ([(WRM_EnhancedCTService *)self configuredMaxULBW])
  {

    [(WRM_EnhancedCTService *)self setConfiguredMaxULBW:0];
  }
  if ([(WRM_EnhancedCTService *)self estimatedBWDL])
  {

    [(WRM_EnhancedCTService *)self setEstimatedBWDL:0];
  }
  if ([(WRM_EnhancedCTService *)self estimatedBWDLConf])
  {

    [(WRM_EnhancedCTService *)self setEstimatedBWDLConf:0];
  }
  if ([(WRM_EnhancedCTService *)self estimatedBWUL])
  {

    [(WRM_EnhancedCTService *)self setEstimatedBWUL:0];
  }
  if ([(WRM_EnhancedCTService *)self estimatedBWULConf])
  {

    [(WRM_EnhancedCTService *)self setEstimatedBWULConf:0];
  }
  if ([(WRM_EnhancedCTService *)self neighberCellType])
  {

    [(WRM_EnhancedCTService *)self setNeighberCellType:0];
  }
  if ([(WRM_EnhancedCTService *)self highDataRateObserved])
  {

    [(WRM_EnhancedCTService *)self setHighDataRateObserved:0];
  }
  if ([(WRM_EnhancedCTService *)self currentNRCellType])
  {

    [(WRM_EnhancedCTService *)self setCurrentNRCellType:0];
  }
  if ([(WRM_EnhancedCTService *)self currentHarvestedCellTypeFR2Capable])
  {

    [(WRM_EnhancedCTService *)self setCurrentHarvestedCellTypeFR2Capable:0];
  }
  if ([(WRM_EnhancedCTService *)self stallDetected])
  {

    [(WRM_EnhancedCTService *)self setStallDetected:0];
  }
  if ([(WRM_EnhancedCTService *)self dataModeLTE])
  {

    [(WRM_EnhancedCTService *)self setDataModeLTE:0];
  }
  if ([(WRM_EnhancedCTService *)self isExpensive])
  {

    [(WRM_EnhancedCTService *)self setIsExpensive:0];
  }
  id v4 = *(void **)(&self->super.m_PDPAssertionRefCount + 1);
  if (v4)
  {

    *(void *)(&self->super.m_PDPAssertionRefCount + 1) = 0;
  }
  uint64_t v5 = *(CellularProductExperimentsManager **)((char *)&self->cellularProductExperimentsManager + 4);
  if (v5)
  {

    *(CellularProductExperimentsManager **)((char *)&self->cellularProductExperimentsManager + 4) = 0;
  }
  char v6 = *(WRM_CellStationManagerIOS **)((char *)&self->cellStationManager + 4);
  if (v6)
  {

    *(WRM_CellStationManagerIOS **)((char *)&self->cellStationManager + 4) = 0;
  }
  char v7 = *(void **)((char *)&self->mLastKnownLocationTimestamp + 4);
  if (v7)
  {
    [v7 stopMonitoring];

    *(double *)((char *)&self->mLastKnownLocationTimestamp + 4) = 0.0;
  }
  if (qword_10027CE20)
  {

    qword_10027CE20 = 0;
  }
  if (*(void *)(&self->mWatchAssociated + 4)) {
    *(void *)(&self->mWatchAssociated + 4) = 0;
  }
  id v8 = *(void **)&self->mCellRSRQ4G5GvsWiFiThreshold;
  if (v8)
  {

    *(void *)&self->mCellRSRQ4G5GvsWiFiThreshold = 0;
  }
  double v9 = *(void **)(&self->mAnyCallState + 1);
  if (v9)
  {

    *(void *)(&self->mAnyCallState + 1) = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)WRM_EnhancedCTService;
  [(WRM_CTService *)&v10 dealloc];
}

- (BOOL)qmiClientRunning
{
  char v2 = [(WRM_EnhancedCTService *)self mCTService];

  return [(WRM_CTService *)v2 qmiClientRunning];
}

- (BOOL)isSimActive
{
  char v2 = [(WRM_EnhancedCTService *)self mCTService];

  return [(WRM_CTService *)v2 isSimActive];
}

- (void)triggerCommCenterForActivation
{
  char v2 = [(WRM_EnhancedCTService *)self mCTService];

  [(WRM_CTService *)v2 triggerCommCenterForActivation];
}

- (void)triggerCommCenterForDeActivation
{
  char v2 = [(WRM_EnhancedCTService *)self mCTService];

  [(WRM_CTService *)v2 triggerCommCenterForDeActivation];
}

- (BOOL)isCommCenterAsserted
{
  char v2 = [(WRM_EnhancedCTService *)self mCTService];

  return [(WRM_CTService *)v2 isCommCenterAsserted];
}

- (void)tiggerEnhanceLQMConfiguration
{
  char v2 = [(WRM_EnhancedCTService *)self mCTService];

  [(WRM_CTService *)v2 tiggerEnhanceLQMConfiguration];
}

- (BOOL)dataAttachedWithCellularNetwork:(int64_t)a3
{
  id v4 = "CTSubscriptionSlotOne";
  uint64_t v5 = "Unknown CTSubscriptionSlot!!!";
  if (a3 == 2) {
    uint64_t v5 = "CTSubscriptionSlotTwo";
  }
  int64_t v6 = a3 - 1;
  if (a3 != 1) {
    id v4 = v5;
  }
  if (a3) {
    char v7 = v4;
  }
  else {
    char v7 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: sim slot %s isDataAttached %@", "-[WRM_EnhancedCTService dataAttachedWithCellularNetwork:]", v7, [(WRM_EnhancedCTService *)self isDataAttached]);
  id v8 = [(NSMutableArray *)[(WRM_EnhancedCTService *)self isDataAttached] objectAtIndex:v6];

  return [v8 BOOLValue];
}

- (unsigned)getWRMCellOutrankWifiBWThreshold
{
  uint64_t v5 = 0;
  int64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003E41C;
  v4[3] = &unk_10020DB68;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v4);
  unsigned int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (unsigned)getCellConfiguredBandwidthThreshold
{
  uint64_t v5 = 0;
  int64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003E53C;
  v4[3] = &unk_10020DB68;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v4);
  unsigned int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (int)getCellRSRP4G5GvsWiFiThreshold
{
  uint64_t v5 = 0;
  int64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003E65C;
  v4[3] = &unk_10020DB68;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v4);
  int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (int)getCellRSRQ4G5GvsWiFiThreshold
{
  uint64_t v5 = 0;
  int64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003E77C;
  v4[3] = &unk_10020DB68;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v4);
  int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setTrialParameters:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003E858;
  v3[3] = &unk_10020DAB0;
  v3[4] = a3;
  v3[5] = self;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v3);
}

- (int)getServingCellType:(int64_t)a3
{
  int v5 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellRadioTechnologyType](self, "servCellRadioTechnologyType"), "objectAtIndex:", a3 - 1) intValue];
  int64_t v6 = "CTSubscriptionSlotOne";
  uint64_t v7 = "Unknown CTSubscriptionSlot!!!";
  if (a3 == 2) {
    uint64_t v7 = "CTSubscriptionSlotTwo";
  }
  if (a3 != 1) {
    int64_t v6 = v7;
  }
  if (a3) {
    int v8 = v6;
  }
  else {
    int v8 = "CTSubscriptionSlotUnknown";
  }
  double v9 = [(WRM_EnhancedCTService *)self servCellRadioTechnologyType];
  int v10 = v5 - 1;
  if (v5 - 1) < 0xA && ((0x2FFu >> v10))
  {
    v11 = (&off_10020E170)[v10];
  }
  else
  {
    v11 = "UNKNOWN_RADIO!!!";
    if (v5 == 9) {
      v11 = "N_RADIO";
    }
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: sim slot %s rat property %@ rat %s", "-[WRM_EnhancedCTService getServingCellType:]", v8, v9, v11);
  return v5;
}

- (void)invalidateAudioQualityMetrics
{
  id v3 = [(WRM_EnhancedCTService *)self PrevAudioQualityWasGood];
  id v4 = (char *)[(WRM_EnhancedCTService *)self activeSlot] - 1;
  int v5 = +[NSNumber numberWithBool:1];

  [(NSMutableArray *)v3 replaceObjectAtIndex:v4 withObject:v5];
}

- (double)getCurrentAudioErasure
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  if ([(WRM_EnhancedCTService *)self activeSlot])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10003EBD8;
    v5[3] = &unk_10020DB68;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v5);
  }
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)updateVoLTESpeechErasure:(unint64_t)a3
{
  if ([(WRM_EnhancedCTService *)self activeSlot])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10003ED48;
    v5[3] = &unk_10020DB90;
    v5[4] = self;
    v5[5] = a3;
    dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v5);
  }
}

- (BOOL)isAudioQualityGood
{
  unsigned int v3 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService PrevAudioQualityWasGood](self, "PrevAudioQualityWasGood"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") - 1) BOOLValue];
  if ([(WRM_EnhancedCTService *)self activeSlot])
  {
    if ((id)[(WRM_EnhancedCTService *)self activeSlot] == (id)1)
    {
      id v4 = "CTSubscriptionSlotOne";
    }
    else
    {
      int64_t v5 = [(WRM_EnhancedCTService *)self activeSlot];
      id v4 = "Unknown CTSubscriptionSlot!!!";
      if (v5 == 2) {
        id v4 = "CTSubscriptionSlotTwo";
      }
    }
  }
  else
  {
    id v4 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: active slot %s PrevAudioQualityWasGood %d", "-[WRM_EnhancedCTService isAudioQualityGood]", v4, v3);
  return v3;
}

- (int)getLteVoiceLQM:(int64_t)a3
{
  id v4 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService VoiceLqmValue](self, "VoiceLqmValue"), "objectAtIndex:", a3 - 1) intValue];
  int64_t v5 = "CTSubscriptionSlotUnknown";
  uint64_t v6 = "CTSubscriptionSlotOne";
  uint64_t v7 = "Unknown CTSubscriptionSlot!!!";
  if (a3 == 2) {
    uint64_t v7 = "CTSubscriptionSlotTwo";
  }
  if (a3 != 1) {
    uint64_t v6 = v7;
  }
  if (a3) {
    int64_t v5 = v6;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: sim slot %s vLQM %d", "-[WRM_EnhancedCTService getLteVoiceLQM:]", v5, v4);
  return (int)v4;
}

- (char)getDataSlotLoad
{
  return [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService loads](self, "loads"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
}

- (int)getRRCState
{
  id v2 = [(NSMutableArray *)[(WRM_EnhancedCTService *)self rrcState] objectAtIndex:(char *)[(WRM_EnhancedCTService *)self dataPreferredSlot] - 1];

  return [v2 intValue];
}

- (int64_t)getCellularLQM
{
  id v3 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService DataLqmValue](self, "DataLqmValue"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") - 1) intValue];
  if ([(WRM_EnhancedCTService *)self activeSlot])
  {
    if ((id)[(WRM_EnhancedCTService *)self activeSlot] == (id)1)
    {
      id v4 = "CTSubscriptionSlotOne";
    }
    else
    {
      int64_t v5 = [(WRM_EnhancedCTService *)self activeSlot];
      id v4 = "Unknown CTSubscriptionSlot!!!";
      if (v5 == 2) {
        id v4 = "CTSubscriptionSlotTwo";
      }
    }
  }
  else
  {
    id v4 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: active slot %s data LQM %d", "-[WRM_EnhancedCTService getCellularLQM]", v4, v3);
  return (int)v3;
}

- (BOOL)isVoiceLQMValid:(int64_t)a3
{
  unsigned int v4 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService VoiceLqmIsValid](self, "VoiceLqmIsValid"), "objectAtIndex:", a3 - 1) BOOLValue];
  int64_t v5 = "CTSubscriptionSlotUnknown";
  uint64_t v6 = "CTSubscriptionSlotOne";
  uint64_t v7 = "Unknown CTSubscriptionSlot!!!";
  if (a3 == 2) {
    uint64_t v7 = "CTSubscriptionSlotTwo";
  }
  if (a3 != 1) {
    uint64_t v6 = v7;
  }
  if (a3) {
    int64_t v5 = v6;
  }
  uint64_t v8 = "No";
  if (v4) {
    uint64_t v8 = "Yes";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: sim slot %s vLQM is valid? %s", "-[WRM_EnhancedCTService isVoiceLQMValid:]", v5, v8);
  return v4;
}

- (void)resetLteVoiceLQM
{
  id v3 = [(WRM_EnhancedCTService *)self VoiceLqmIsValid];
  unsigned int v4 = (char *)[(WRM_EnhancedCTService *)self activeSlot] - 1;
  int64_t v5 = +[NSNumber numberWithBool:0];

  [(NSMutableArray *)v3 replaceObjectAtIndex:v4 withObject:v5];
}

- (void)resetCellularDataLQM
{
  id v3 = [(WRM_EnhancedCTService *)self DataLqmIsValid];
  unsigned int v4 = (char *)[(WRM_EnhancedCTService *)self activeSlot] - 1;
  int64_t v5 = +[NSNumber numberWithBool:0];

  [(NSMutableArray *)v3 replaceObjectAtIndex:v4 withObject:v5];
}

- (BOOL)isDataLQMValid
{
  unsigned int v3 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService DataLqmIsValid](self, "DataLqmIsValid"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") - 1) boolValue];
  if ([(WRM_EnhancedCTService *)self activeSlot])
  {
    if ((id)[(WRM_EnhancedCTService *)self activeSlot] == (id)1)
    {
      unsigned int v4 = "CTSubscriptionSlotOne";
    }
    else
    {
      int64_t v5 = [(WRM_EnhancedCTService *)self activeSlot];
      unsigned int v4 = "Unknown CTSubscriptionSlot!!!";
      if (v5 == 2) {
        unsigned int v4 = "CTSubscriptionSlotTwo";
      }
    }
  }
  else
  {
    unsigned int v4 = "CTSubscriptionSlotUnknown";
  }
  uint64_t v6 = "No";
  if (v3) {
    uint64_t v6 = "Yes";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: active slot %s data LQM is valid? %s", "-[WRM_EnhancedCTService isDataLQMValid]", v4, v6);
  return v3;
}

- (BOOL)isDataLQMValid:(int64_t)a3
{
  unsigned int v4 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService DataLqmIsValid](self, "DataLqmIsValid"), "objectAtIndex:", a3 - 1) BOOLValue];
  int64_t v5 = "CTSubscriptionSlotUnknown";
  uint64_t v6 = "CTSubscriptionSlotOne";
  uint64_t v7 = "Unknown CTSubscriptionSlot!!!";
  if (a3 == 2) {
    uint64_t v7 = "CTSubscriptionSlotTwo";
  }
  if (a3 != 1) {
    uint64_t v6 = v7;
  }
  if (a3) {
    int64_t v5 = v6;
  }
  uint64_t v8 = "No";
  if (v4) {
    uint64_t v8 = "Yes";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: sim slot %s data LQM is valid? %s", "-[WRM_EnhancedCTService isDataLQMValid:]", v5, v8);
  return v4;
}

- (void)initMovAverageOfSignalBar
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003F4B8;
  block[3] = &unk_10020D980;
  block[4] = self;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)resetMovAverageOfSignalBar
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003F5F4;
  block[3] = &unk_10020D980;
  block[4] = self;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (int)getCellularDataLQM
{
  id v3 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService DataLqmValue](self, "DataLqmValue"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") - 1) intValue];
  if ([(WRM_EnhancedCTService *)self activeSlot])
  {
    if ((id)[(WRM_EnhancedCTService *)self activeSlot] == (id)1)
    {
      unsigned int v4 = "CTSubscriptionSlotOne";
    }
    else
    {
      int64_t v5 = [(WRM_EnhancedCTService *)self activeSlot];
      unsigned int v4 = "Unknown CTSubscriptionSlot!!!";
      if (v5 == 2) {
        unsigned int v4 = "CTSubscriptionSlotTwo";
      }
    }
  }
  else
  {
    unsigned int v4 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: active slot %s data LQM %d", "-[WRM_EnhancedCTService getCellularDataLQM]", v4, v3);
  return (int)v3;
}

- (BOOL)getDataStallState:(int64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003F828;
  block[3] = &unk_10020DBE0;
  block[4] = self;
  void block[5] = &v6;
  void block[6] = a3;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)getCellularDataLQM:(int64_t)a3
{
  id v4 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService DataLqmValue](self, "DataLqmValue"), "objectAtIndex:", a3 - 1) intValue];
  int64_t v5 = "CTSubscriptionSlotUnknown";
  uint64_t v6 = "CTSubscriptionSlotOne";
  uint64_t v7 = "Unknown CTSubscriptionSlot!!!";
  if (a3 == 2) {
    uint64_t v7 = "CTSubscriptionSlotTwo";
  }
  if (a3 != 1) {
    uint64_t v6 = v7;
  }
  if (a3) {
    int64_t v5 = v6;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: sim slot %s data LQM %d", "-[WRM_EnhancedCTService getCellularDataLQM:]", v5, v4);
  return (int)v4;
}

- (void)setServingCellRSSI:(double)a3 forSim:(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003F9A4;
  block[3] = &unk_10020DC08;
  block[4] = self;
  void block[5] = a4;
  *(double *)&void block[6] = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)setServingCellRSRP:(double)a3 forSim:(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003FB00;
  block[3] = &unk_10020DC08;
  block[4] = self;
  void block[5] = a4;
  *(double *)&void block[6] = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)setServingCellSNR:(double)a3 forSim:(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003FC9C;
  block[3] = &unk_10020DC08;
  block[4] = self;
  void block[5] = a4;
  *(double *)&void block[6] = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)setServingCellSINR:(double)a3 forSim:(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003FDF8;
  block[3] = &unk_10020DC08;
  block[4] = self;
  void block[5] = a4;
  *(double *)&void block[6] = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)setServingCellRSRQ:(double)a3 forSim:(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003FF54;
  block[3] = &unk_10020DC08;
  block[4] = self;
  void block[5] = a4;
  *(double *)&void block[6] = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (double)getServingCellRSSI
{
  uint64_t v5 = 0;
  uint64_t v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000400EC;
  v4[3] = &unk_10020DB68;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v4);
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)getServingCellRSRP
{
  uint64_t v5 = 0;
  uint64_t v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004029C;
  v4[3] = &unk_10020DB68;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v4);
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)getServingCellRSRP:(int64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004045C;
  block[3] = &unk_10020DBE0;
  block[4] = self;
  void block[5] = &v6;
  void block[6] = a3;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)getServingCellSNR
{
  uint64_t v5 = 0;
  uint64_t v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000405E4;
  v4[3] = &unk_10020DB68;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v4);
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)getServingCellSNR:(int64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000407A4;
  block[3] = &unk_10020DBE0;
  block[4] = self;
  void block[5] = &v6;
  void block[6] = a3;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)getServingCellSINR
{
  uint64_t v5 = 0;
  uint64_t v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100040928;
  v4[3] = &unk_10020DB68;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v4);
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)getServingCellRSRQ
{
  uint64_t v5 = 0;
  uint64_t v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100040AD8;
  v4[3] = &unk_10020DB68;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v4);
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)getServingCellRSRQ:(int64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040C98;
  block[3] = &unk_10020DBE0;
  block[4] = self;
  void block[5] = &v6;
  void block[6] = a3;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)getServingCellRSCP
{
  uint64_t v5 = 0;
  uint64_t v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100040E1C;
  v4[3] = &unk_10020DB68;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v4);
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)getServingCellRSCP:(int64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040FDC;
  block[3] = &unk_10020DBE0;
  block[4] = self;
  void block[5] = &v6;
  void block[6] = a3;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)getServingCellECIO
{
  uint64_t v5 = 0;
  uint64_t v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100041160;
  v4[3] = &unk_10020DB68;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v4);
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)getServingCellECIO:(int64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041320;
  block[3] = &unk_10020DBE0;
  block[4] = self;
  void block[5] = &v6;
  void block[6] = a3;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)getCurrentSignalBars:(int64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000414AC;
  block[3] = &unk_10020DC30;
  void block[5] = &v6;
  void block[6] = a3;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)deviceInRoaming
{
  if ([(WRM_EnhancedCTService *)self activeSlot])
  {
    if ((id)[(WRM_EnhancedCTService *)self activeSlot] == (id)1)
    {
      int64_t v3 = "CTSubscriptionSlotOne";
    }
    else if ((id)[(WRM_EnhancedCTService *)self activeSlot] == (id)2)
    {
      int64_t v3 = "CTSubscriptionSlotTwo";
    }
    else
    {
      int64_t v3 = "Unknown CTSubscriptionSlot!!!";
    }
  }
  else
  {
    int64_t v3 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: active slot %s isRoaming %@", "-[WRM_EnhancedCTService deviceInRoaming]", v3, [(WRM_EnhancedCTService *)self isRoaming]);
  id v4 = [(NSMutableArray *)[(WRM_EnhancedCTService *)self isRoaming] objectAtIndex:(char *)[(WRM_EnhancedCTService *)self activeSlot] - 1];

  return [v4 BOOLValue];
}

- (unsigned)getRadioCoverage
{
  id v2 = [(NSMutableArray *)[(WRM_EnhancedCTService *)self radioCoverage] objectAtIndex:(char *)[(WRM_EnhancedCTService *)self dataPreferredSlot] - 1];

  return [v2 intValue];
}

- (unsigned)getRadioFrequency
{
  id v2 = [(NSMutableArray *)[(WRM_EnhancedCTService *)self radioFrequency] objectAtIndex:(char *)[(WRM_EnhancedCTService *)self dataPreferredSlot] - 1];

  return [v2 intValue];
}

- (BOOL)isSaAllowedOnWiFiAssociation:(int64_t)a3
{
  if ([(WRM_EnhancedCTService *)self CTClient])
  {
    uint64_t v12 = 0;
    id v5 = [objc_alloc((Class)CTBundle) initWithBundleType:1];
    id v6 = [objc_alloc((Class)CTXPCServiceSubscriptionContext) initWithSlot:a3];
    id v7 = [(CoreTelephonyClient *)[(WRM_EnhancedCTService *)self CTClient] copyCarrierBundleValue:v6 key:@"AllowSAOnWiFiAssociation" bundleType:v5 error:&v12];
    if (v7) {
      BOOL v8 = v12 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      int v10 = v7;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"AllowSAOnWiFiAssociation %ld, slotID:%ld", [v10 integerValue], a3);
        BOOL v9 = [v10 integerValue] != 0;
LABEL_12:

        goto LABEL_13;
      }
      +[WCM_Logging logLevel:22, @"AllowSAOnWiFiAssociation mis-configured in CB, slotID:%ld", a3 message];
    }
    else
    {
      +[WCM_Logging logLevel:22, @"AllowSAOnWiFiAssociation key not present in CB, slotID:%ld", a3 message];
    }
    BOOL v9 = 0;
    goto LABEL_12;
  }
  +[WCM_Logging logLevel:22, @"CoreTelephony client not ready yet, slotID:%ld", a3 message];
  BOOL v9 = 0;
LABEL_13:
  +[WCM_Logging logLevel:22, @"AllowSAOnWiFiAssociation %d, slotID:%ld", v9, a3 message];
  return v9;
}

- (BOOL)isWiFiCallingAllowedInAPM
{
  if ([(WRM_EnhancedCTService *)self CTClient])
  {
    uint64_t v11 = 0;
    id v3 = [objc_alloc((Class)CTBundle) initWithBundleType:1];
    id v4 = [objc_alloc((Class)CTXPCServiceSubscriptionContext) initWithSlot:-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot")];
    id v5 = [(CoreTelephonyClient *)[(WRM_EnhancedCTService *)self CTClient] copyCarrierBundleValue:v4 keyHierarchy:&off_10024DDF8 bundleType:v3 error:&v11];
    if (v5) {
      BOOL v6 = v11 == 0;
    }
    else {
      BOOL v6 = 0;
    }
    if (v6)
    {
      BOOL v9 = v5;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"AllowWiFiCallingInAirplaneMode %d", [v9 integerValue]);
        BOOL v8 = [v9 integerValue] != 0;
LABEL_12:

        return v8;
      }
      CFStringRef v7 = @"AllowWiFiCallingInAirplaneMode misconfigured in CB";
    }
    else
    {
      CFStringRef v7 = @"AllowWiFiCallingInAirplaneMode key not present in CB";
    }
    +[WCM_Logging logLevel:22 message:v7];
    BOOL v8 = 1;
    goto LABEL_12;
  }
  +[WCM_Logging logLevel:22 message:@"CoreTelephony client not ready yet"];
  return 1;
}

- (void)getCurrentEnhancedCTMetrics
{
  id v69 = 0;
  unsigned int v3 = [(CoreTelephonyClient *)[(WRM_EnhancedCTService *)self CTClient] isPrivateNetworkEvaluationNeeded:&v69];
  id v4 = WRM_MotionController;
  if (v69)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"isPrivateNetworkEvaluationNeeded: error %@", [v69 localizedDescription]);
  }
  else
  {
    BYTE4(self->mLastCbrsRecommendation) = v3;
    +[WCM_Logging logLevel:22, @"isPrivateNetworkEvaluationNeeded: %d", v3 message];
  }
  long long v68 = 0u;
  long long v67 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  obj = [(WRM_EnhancedCTService *)self subscriptions];
  id v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v65 objects:v70 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v66;
    uint64_t v43 = kCTCapabilityAgent;
    uint64_t v42 = kCTCapabilityAgent2;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v66 != v7) {
          objc_enumerationMutation(obj);
        }
        BOOL v9 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        if ([v9 slotID])
        {
          id v10 = [(CoreTelephonyClient *)[(WRM_EnhancedCTService *)self CTClient] getPrivateNetworkCapabilitiesForContext:v9 error:&v69];
          id v11 = v69;
          uint64_t v12 = v4;
          objc_super v13 = v4 + 50;
          id v14 = [v9 slotID];
          if (v11 || !v10)
          {
            if (v14)
            {
              uint64_t v18 = "CTSubscriptionSlotOne";
              if ([v9 slotID] != (id)1)
              {
                if ([v9 slotID] == (id)2) {
                  uint64_t v18 = "CTSubscriptionSlotTwo";
                }
                else {
                  uint64_t v18 = "Unknown CTSubscriptionSlot!!!";
                }
              }
            }
            else
            {
              uint64_t v18 = "CTSubscriptionSlotUnknown";
            }
            -[__objc2_class logLevel:message:](v13, "logLevel:message:", 22, @"%s: getPrivateNetworkCapabilitiesForContext error=%@", v18, [v69 localizedDescription]);
            uint64_t v19 = 0;
            id v20 = 0;
          }
          else
          {
            if (v14)
            {
              id v15 = [v9 slotID];
              double v16 = "CTSubscriptionSlotOne";
              if (v15 != (id)1)
              {
                id v17 = [v9 slotID];
                double v16 = "Unknown CTSubscriptionSlot!!!";
                if (v17 == (id)2) {
                  double v16 = "CTSubscriptionSlotTwo";
                }
              }
            }
            else
            {
              double v16 = "CTSubscriptionSlotUnknown";
            }
            [(__objc2_class *)v13 logLevel:22, @"%s: getPrivateNetworkCapabilitiesForContext %@", v16, v10 message];
            unsigned int v21 = [v10 isPrivateNetworkModeEnabled];
            id v20 = [v10 isPrivateNetworkPreferredOverWifi];
            if (v21)
            {
              uint64_t v19 = 1;
              BYTE4(self->mLastCbrsRecommendation) = 1;
            }
            else
            {
              uint64_t v19 = 0;
            }
          }
          -[WRM_EnhancedCTService processPrivateNwSimStatus:slot:](self, "processPrivateNwSimStatus:slot:", v19, [v9 slotID]);
          -[WRM_EnhancedCTService processPrivateNwPreferredOverWifiStatus:slot:](self, "processPrivateNwPreferredOverWifiStatus:slot:", v20, [v9 slotID]);
          if ([v9 slotID] == (id)1)
          {
            uint64_t v22 = [(WRM_EnhancedCTService *)self CTClient];
            v64[0] = _NSConcreteStackBlock;
            v64[1] = 3221225472;
            v64[2] = sub_100042464;
            v64[3] = &unk_10020DC58;
            v64[4] = self;
            [(CoreTelephonyClient *)v22 getSignalStrengthInfo:v9 completion:v64];
            double v23 = [(WRM_EnhancedCTService *)self CTClient];
            v63[0] = _NSConcreteStackBlock;
            v63[1] = 3221225472;
            v63[2] = sub_1000424FC;
            v63[3] = &unk_10020DC80;
            v63[4] = self;
            [(CoreTelephonyClient *)v23 copyIsDataAttached:v9 completion:v63];
            double v24 = [(WRM_EnhancedCTService *)self CTClient];
            v62[0] = _NSConcreteStackBlock;
            v62[1] = 3221225472;
            v62[2] = sub_100042594;
            v62[3] = &unk_10020DCA8;
            v62[4] = self;
            [(CoreTelephonyClient *)v24 copyRegistrationStatus:v9 completion:v62];
            v25 = [(WRM_EnhancedCTService *)self CTClient];
            v61[0] = _NSConcreteStackBlock;
            v61[1] = 3221225472;
            v61[2] = sub_10004262C;
            v61[3] = &unk_10020DCA8;
            v61[4] = self;
            [(CoreTelephonyClient *)v25 copyMobileCountryCode:v9 completion:v61];
            CFStringRef v26 = [(WRM_EnhancedCTService *)self CTClient];
            v60[0] = _NSConcreteStackBlock;
            v60[1] = 3221225472;
            v60[2] = sub_1000426C4;
            v60[3] = &unk_10020DCA8;
            v60[4] = self;
            [(CoreTelephonyClient *)v26 copyMobileNetworkCode:v9 completion:v60];
            int64_t v27 = [(WRM_EnhancedCTService *)self CTClient];
            v59[0] = _NSConcreteStackBlock;
            v59[1] = 3221225472;
            v59[2] = sub_10004275C;
            v59[3] = &unk_10020DCD0;
            v59[4] = self;
            [(CoreTelephonyClient *)v27 context:v9 getCapability:v43 completion:v59];
            id v28 = [(WRM_EnhancedCTService *)self CTClient];
            v58[0] = _NSConcreteStackBlock;
            v58[1] = 3221225472;
            v58[2] = sub_100042808;
            v58[3] = &unk_10020DCD0;
            v58[4] = self;
            [(CoreTelephonyClient *)v28 context:v9 getCapability:v42 completion:v58];
            id v29 = [(WRM_EnhancedCTService *)self CTClient];
            v57[0] = _NSConcreteStackBlock;
            v57[1] = 3221225472;
            v57[2] = sub_1000428B4;
            v57[3] = &unk_10020DCA8;
            v57[4] = self;
            [(CoreTelephonyClient *)v29 copyRadioAccessTechnology:v9 completion:v57];
            unsigned int v30 = [(WRM_EnhancedCTService *)self CTClient];
            v56[0] = _NSConcreteStackBlock;
            v56[1] = 3221225472;
            v56[2] = sub_10004294C;
            v56[3] = &unk_10020DCF8;
            v56[4] = self;
            [(CoreTelephonyClient *)v30 getVoiceLinkQualityMetric:v9 completion:v56];
            id v31 = [(WRM_EnhancedCTService *)self CTClient];
            v55[0] = _NSConcreteStackBlock;
            v55[1] = 3221225472;
            v55[2] = sub_1000429E4;
            v55[3] = &unk_10020DD20;
            v55[4] = self;
            [(CoreTelephonyClient *)v31 getEnhancedVoiceLinkQualityMetric:v9 completion:v55];
            id v4 = v12;
          }
          else
          {
            id v4 = v12;
            if ([v9 slotID] == (id)2)
            {
              unsigned int v32 = [(WRM_EnhancedCTService *)self CTClient];
              v54[0] = _NSConcreteStackBlock;
              v54[1] = 3221225472;
              v54[2] = sub_100042A7C;
              v54[3] = &unk_10020DC80;
              v54[4] = self;
              [(CoreTelephonyClient *)v32 copyIsDataAttached:v9 completion:v54];
              uint64_t v33 = [(WRM_EnhancedCTService *)self CTClient];
              v53[0] = _NSConcreteStackBlock;
              v53[1] = 3221225472;
              v53[2] = sub_100042B14;
              v53[3] = &unk_10020DC58;
              v53[4] = self;
              [(CoreTelephonyClient *)v33 getSignalStrengthInfo:v9 completion:v53];
              id v34 = [(WRM_EnhancedCTService *)self CTClient];
              v52[0] = _NSConcreteStackBlock;
              v52[1] = 3221225472;
              v52[2] = sub_100042BAC;
              v52[3] = &unk_10020DCA8;
              v52[4] = self;
              [(CoreTelephonyClient *)v34 copyRegistrationStatus:v9 completion:v52];
              int64_t v35 = [(WRM_EnhancedCTService *)self CTClient];
              v51[0] = _NSConcreteStackBlock;
              v51[1] = 3221225472;
              v51[2] = sub_100042C44;
              v51[3] = &unk_10020DCA8;
              v51[4] = self;
              [(CoreTelephonyClient *)v35 copyMobileCountryCode:v9 completion:v51];
              v36 = [(WRM_EnhancedCTService *)self CTClient];
              v50[0] = _NSConcreteStackBlock;
              v50[1] = 3221225472;
              v50[2] = sub_100042CDC;
              v50[3] = &unk_10020DCA8;
              v50[4] = self;
              [(CoreTelephonyClient *)v36 copyMobileNetworkCode:v9 completion:v50];
              char v37 = [(WRM_EnhancedCTService *)self CTClient];
              v49[0] = _NSConcreteStackBlock;
              v49[1] = 3221225472;
              v49[2] = sub_100042D74;
              v49[3] = &unk_10020DCD0;
              v49[4] = self;
              [(CoreTelephonyClient *)v37 context:v9 getCapability:v43 completion:v49];
              char v38 = [(WRM_EnhancedCTService *)self CTClient];
              v48[0] = _NSConcreteStackBlock;
              v48[1] = 3221225472;
              v48[2] = sub_100042E20;
              v48[3] = &unk_10020DCD0;
              v48[4] = self;
              [(CoreTelephonyClient *)v38 context:v9 getCapability:v42 completion:v48];
              v39 = [(WRM_EnhancedCTService *)self CTClient];
              v47[0] = _NSConcreteStackBlock;
              v47[1] = 3221225472;
              v47[2] = sub_100042ECC;
              v47[3] = &unk_10020DCA8;
              v47[4] = self;
              [(CoreTelephonyClient *)v39 copyRadioAccessTechnology:v9 completion:v47];
              char v40 = [(WRM_EnhancedCTService *)self CTClient];
              v46[0] = _NSConcreteStackBlock;
              v46[1] = 3221225472;
              v46[2] = sub_100042F64;
              v46[3] = &unk_10020DCF8;
              v46[4] = self;
              [(CoreTelephonyClient *)v40 getVoiceLinkQualityMetric:v9 completion:v46];
              v41 = [(WRM_EnhancedCTService *)self CTClient];
              v45[0] = _NSConcreteStackBlock;
              v45[1] = 3221225472;
              v45[2] = sub_100042FFC;
              v45[3] = &unk_10020DD20;
              v45[4] = self;
              [(CoreTelephonyClient *)v41 getEnhancedVoiceLinkQualityMetric:v9 completion:v45];
            }
          }
        }
      }
      id v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v65 objects:v70 count:16];
    }
    while (v6);
  }
  [(WRM_EnhancedCTService *)self setMSubscriptionInfoDidChange:0];
}

- (void)processDataAttached:(BOOL)a3 :(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043124;
  block[3] = &unk_10020DD48;
  block[4] = self;
  void block[5] = a4;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)processVolteStatus:(BOOL)a3 :(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004321C;
  block[3] = &unk_10020DD48;
  block[4] = self;
  void block[5] = a4;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)interfaceCostExpensiveChanged:(id)a3 isExpensive:(BOOL)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043314;
  block[3] = &unk_10020DD70;
  BOOL v5 = a4;
  block[4] = a3;
  void block[5] = self;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (BOOL)deviceICheapFR2Coverage
{
  id v2 = self;
  [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService isExpensive](self, "isExpensive"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) BOOLValue];
  [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService dataModeLTE](v2, "dataModeLTE"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](v2, "dataPreferredSlot") - 1) BOOLValue];
  id v3 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService detectedFR2CellCountLocDB](v2, "detectedFR2CellCountLocDB"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](v2, "dataPreferredSlot") - 1) intValue];
  LODWORD(v2) = v3;
  +[WCM_Logging logLevel:22, @"deviceICheapFR2Coverage:%d", v3 message];
  return v2 != 0;
}

- (void)smartDataModeChanged:(id)a3 userEnabled:(BOOL)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004353C;
  block[3] = &unk_10020DD70;
  BOOL v5 = a4;
  block[4] = a3;
  void block[5] = self;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)processWiFiCallingStatus:(BOOL)a3 :(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043794;
  block[3] = &unk_10020DD48;
  block[4] = self;
  void block[5] = a4;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)processPrivateNwSimStatus:(BOOL)a3 slot:(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004388C;
  block[3] = &unk_10020DD48;
  block[4] = self;
  void block[5] = a4;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)processPrivateNwPreferredOverWifiStatus:(BOOL)a3 slot:(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043984;
  block[3] = &unk_10020DD48;
  block[4] = self;
  void block[5] = a4;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)processRegistrationStatus:(id)a3 :(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043A7C;
  block[3] = &unk_10020DDC0;
  block[4] = self;
  void block[5] = a3;
  void block[6] = a4;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (BOOL)isWatchAssociated
{
  if (!+[NRPairedDeviceRegistry sharedInstance])
  {
    CFStringRef v9 = @"%s: Skipping CellularAvailabilityStatusBiomeStream event on iPhone as weak link to NanoRegistry framework missing.";
LABEL_13:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 17, v9, "-[WRM_EnhancedCTService isWatchAssociated]");
    return 0;
  }
  id v2 = [+[NRPairedDeviceRegistry sharedInstance] getAllDevicesWithArchivedDevices];
  if ((int)[v2 count] < 1)
  {
    CFStringRef v9 = @"%s: Skipping CellularAvailabilityStatusBiomeStream event on iPhone as no associated watches";
    goto LABEL_13;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    uint64_t v6 = NRDevicePropertyProductType;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: Associated watches. %@", "-[WRM_EnhancedCTService isWatchAssociated]", [*(id *)(*((void *)&v10 + 1) + 8 * (void)v7) valueForProperty:v6]);
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  return 1;
}

- (void)updateCellularAvailabilityStatus:(id)a3 :(int64_t)a4 :(double)a5 :(BOOL)a6
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043E40;
  block[3] = &unk_10020DDE8;
  block[4] = self;
  void block[5] = a3;
  void block[6] = a4;
  *(double *)&void block[7] = a5;
  BOOL v7 = a6;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self cellularAvailabilityStatusQueue], block);
}

- (void)processMobileCountryCode:(id)a3 :(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043FE0;
  block[3] = &unk_10020DDC0;
  void block[5] = self;
  void block[6] = a4;
  block[4] = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)processMobileNetworkCode:(id)a3 :(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044138;
  block[3] = &unk_10020DDC0;
  void block[5] = self;
  void block[6] = a4;
  block[4] = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)processVoiceLinkQualityInfo:(id)a3 :(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044290;
  block[3] = &unk_10020DDC0;
  block[4] = a3;
  void block[5] = self;
  void block[6] = a4;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)updateAudioQuality:(id)a3 :(int64_t)a4
{
  uint64_t v4 = *(void *)&a3.var2;
  uint64_t v5 = *(void *)&a3.var0;
  uint64_t var1 = a3.var1;
  double v8 = (double)(100 * a3.var0) / ((double)a3.var1 + 0.000001);
  int64_t v9 = a4 - 1;
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self PrevAudioErasurePercent] replaceObjectAtIndex:a4 - 1 withObject:+[NSNumber numberWithDouble:v8]];
  BOOL v11 = v8 < 80.0 || var1 < 0x1F5;
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self PrevAudioQualityWasGood] replaceObjectAtIndex:v9 withObject:+[NSNumber numberWithBool:v11]];
  [(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellRSCP](self, "servCellRSCP"), "objectAtIndex:", v9)) doubleValue];
  uint64_t v13 = v12;
  [(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellECIO](self, "servCellECIO"), "objectAtIndex:", v9)) doubleValue];
  +[WCM_Logging logLevel:message:](WCM_Logging, @"BB Audio Metrics, CodecType: %d, Total Erasures: %d, Total playbacks: %d, Percent Erasures: %f, RSCP: %f, ECIO:%f, Eval Quality: %d", v4, v5, var1, *(void *)&v8, v13, v14, [WRM_EnhancedCTService PrevAudioQualityWasGood][v9 boolValue]);
}

- (void)updateAudioQualityKaroo:(id *)a3 :(int64_t)a4
{
  unsigned int var1 = a3->var1;
  double v8 = (double)(100 * a3->var0) / ((double)var1 + 0.000001);
  BOOL v10 = v8 < 80.0 || var1 < 0x1F5;
  [(NSMutableArray *)[(WRM_EnhancedCTService *)self PrevAudioQualityWasGood] replaceObjectAtIndex:a4 - 1 withObject:+[NSNumber numberWithBool:v10]];
  uint64_t var0 = a3->var0;
  p_unsigned int var1 = &a3->var1;
  uint64_t v12 = a3->var1;
  uint64_t v13 = p_var1[1];
  [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellRSCP](self, "servCellRSCP"), "objectAtIndex:", a4 - 1) doubleValue];
  uint64_t v16 = v15;
  [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellECIO](self, "servCellECIO"), "objectAtIndex:", a4 - 1) doubleValue];
  +[WCM_Logging logLevel:message:](WCM_Logging, @"BB Audio Metrics, CodecType: %d, Total Erasures: %d, Total playbacks: %d, Percent Erasures: %f, RSCP: %f, ECIO:%f, Eval Quality: %d", v13, var0, v12, *(void *)&v8, v16, v17, [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService PrevAudioQualityWasGood](self, "PrevAudioQualityWasGood"), "objectAtIndex:", a4 - 1) BOOLValue];
}

- (void)processEnhancedDataLQMBlob:(id)a3 :(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044744;
  block[3] = &unk_10020DDC0;
  void block[5] = a3;
  void block[6] = a4;
  block[4] = self;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)processEnhancedVoiceLinkQualityBlob:(id)a3 :(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044BE0;
  block[3] = &unk_10020DDC0;
  block[4] = a3;
  void block[5] = self;
  void block[6] = a4;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)nrSliceAppStateChanged:(id)a3 status:(BOOL)a4 trafficDescriptors:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000458C8;
  v5[3] = &unk_10020DE10;
  v5[4] = a3;
  BOOL v6 = a4;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v5);
}

- (void)processDataStatus:(id)a3 :(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045A24;
  block[3] = &unk_10020DDC0;
  block[4] = a3;
  void block[5] = self;
  void block[6] = a4;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)processSignalStrengthInfo:(id)a3 :(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000461F8;
  block[3] = &unk_10020DDC0;
  block[4] = a3;
  void block[5] = self;
  void block[6] = a4;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)processSubscriptionInfo:(id)a3 :(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100046390;
  v4[3] = &unk_10020DAB0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v4);
}

- (void)initCoreTelephonyClient
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s CTClientInitDone %d", "-[WRM_EnhancedCTService initCoreTelephonyClient]", [(WRM_EnhancedCTService *)self CTClientInitDone]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100046724;
  block[3] = &unk_10020D980;
  block[4] = self;
  if (qword_10027CFB0 != -1) {
    dispatch_once(&qword_10027CFB0, block);
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s Done CTClientInitDone %d", "-[WRM_EnhancedCTService initCoreTelephonyClient]", [(WRM_EnhancedCTService *)self CTClientInitDone]);
  if (*(WRM_SpeedTestSchedulerServicesIOS **)((char *)&self->speedTestSchedulerServices + 4))
  {
    +[WCM_Logging logLevel:22 message:@"CellularProductExperimentsManager: initCellularProductExperimentsManager"];
    [*(id *)((char *)&self->speedTestSchedulerServices + 4) subscribeToTrial];
  }
  else
  {
    +[WCM_Logging logLevel:22 message:@"CellularProductExperimentsManager: Not initialized"];
  }
}

- (id)getInternetInterfaceName
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x3052000000;
  double v8 = sub_100046A4C;
  int64_t v9 = sub_100046A5C;
  uint64_t v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100046A68;
  v4[3] = &unk_10020DB68;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v4);
  id v2 = (void *)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)internetConnectionStateChanged:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100046B04;
  v3[3] = &unk_10020DAB0;
  v3[4] = a3;
  v3[5] = self;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v3);
}

- (void)subscriptionInfoDidChange
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s", "-[WRM_EnhancedCTService subscriptionInfoDidChange]");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100046C6C;
  v3[3] = &unk_10020DE38;
  v3[4] = self;
  [(CoreTelephonyClient *)[(WRM_EnhancedCTService *)self CTClient] getSubscriptionInfo:v3];
}

- (void)signalStrengthChanged:(id)a3 info:(id)a4
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s context %@ info %@", "-[WRM_EnhancedCTService signalStrengthChanged:info:]", a3, a4);
  id v7 = [a3 slotID];

  [(WRM_EnhancedCTService *)self processSignalStrengthInfo:a4 :v7];
}

- (void)displayStatusChanged:(id)a3 status:(id)a4
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s context %@ status %@", "-[WRM_EnhancedCTService displayStatusChanged:status:]", a3, a4);
  -[WRM_EnhancedCTService processRegistrationStatus::](self, "processRegistrationStatus::", [a4 registrationDisplayStatus], [a3 slotID]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100046E68;
  v7[3] = &unk_10020DE60;
  v7[4] = self;
  v7[5] = a3;
  [(CoreTelephonyClient *)[(WRM_EnhancedCTService *)self CTClient] copyRegistrationStatus:a3 completion:v7];
}

- (int)parseRegistrationStatusForBiomeStream:(id)a3
{
  if (([a3 isEqualToString:@"kCTRegistrationStatusRegisteredHome"] & 1) != 0
    || ([a3 isEqualToString:@"kCTRegistrationStatusRegisteredRoaming"] & 1) != 0)
  {
    return 1;
  }
  if ([a3 isEqualToString:@"kCTRegistrationStatusEmergencyOnly"])
  {
    if (![(WRM_EnhancedCTService *)self isSuppressSOSOnlyWithLimitedServiceEnabled])return 2; {
    +[WCM_Logging logLevel:22 message:@"parseRegistrationStatusForBiomeStream:: Suppressed SOS with Limited Services."];
    }
    return 3;
  }
  if ([a3 isEqualToString:@"kCTRegistrationStatusNotRegistered"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"kCTRegistrationStatusDenied"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"kCTRegistrationStatusSearching"]) {
    return 3;
  }
  int result = [a3 isEqualToString:@"kCTRegistrationStatusUnknown"];
  if (result) {
    return 3;
  }
  return result;
}

- (int)combinedRegistrationStatus
{
  id v2 = *(void **)(&self->mWrmSdmLocationMonitoringStarted + 4);
  if (!v2) {
    return 0;
  }
  int v4 = 1;
  if ((objc_msgSend(v2, "containsObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1)) & 1) == 0)
  {
    int v4 = 2;
    if ((objc_msgSend(*(id *)(&self->mWrmSdmLocationMonitoringStarted + 4), "containsObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2)) & 1) == 0)
    {
      if ([*(id *)(&self->mWrmSdmLocationMonitoringStarted + 4) containsObject:[NSNumber numberWithInt:3]])return 3; {
      else
      }
        return 0;
    }
  }
  return v4;
}

- (id)getPreviousCellularAvailabilityStatus
{
  uint64_t mCellularAvailabilityStatus_high = HIDWORD(self->mCellularAvailabilityStatus);
  if (mCellularAvailabilityStatus_high != -1) {
    return (id)sub_1000470D8(mCellularAvailabilityStatus_high);
  }
  HIDWORD(self->mCellularAvailabilityStatus) = 0;
  return (id)sub_1000470D8(0);
}

- (id)getCurrentCellularAvailabilityStatus
{
  [*(id *)(&self->mWatchAssociated + 4) getAirPlaneMode];
  if ([*(id *)(&self->mWatchAssociated + 4) isAirPlaneModeEnabled]) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = [(WRM_EnhancedCTService *)self combinedRegistrationStatus];
  }

  return (id)sub_1000470D8(v3);
}

- (int)getWatchAssociated
{
  return BYTE4(self->mSOSRSRPThreshold);
}

- (BOOL)isSuppressSOSOnlyWithLimitedServiceEnabled
{
  if ([(WRM_EnhancedCTService *)self CTClient])
  {
    uint64_t v11 = 0;
    id v3 = [objc_alloc((Class)CTBundle) initWithBundleType:6];
    id v4 = [objc_alloc((Class)CTXPCServiceSubscriptionContext) initWithSlot:-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot")];
    id v5 = [(CoreTelephonyClient *)[(WRM_EnhancedCTService *)self CTClient] copyCarrierBundleValue:v4 keyHierarchy:&off_10024DE10 bundleType:v3 error:&v11];
    if (v5) {
      BOOL v6 = v11 == 0;
    }
    else {
      BOOL v6 = 0;
    }
    if (v6)
    {
      int64_t v9 = v5;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"isSuppressSOSOnlyWithLimitedServiceEnabled:: SuppressSOSOnlyWithLimitedService %d", [v9 integerValue]);
        BOOL v8 = [v9 integerValue] != 0;
LABEL_12:

        return v8;
      }
      CFStringRef v7 = @"isSuppressSOSOnlyWithLimitedServiceEnabled:: SuppressSOSOnlyWithLimitedService misconfigured in CB";
    }
    else
    {
      CFStringRef v7 = @"isSuppressSOSOnlyWithLimitedServiceEnabled:: SuppressSOSOnlyWithLimitedService key not present in CB. Setting it to default value of True";
    }
    +[WCM_Logging logLevel:22 message:v7];
    BOOL v8 = 1;
    goto LABEL_12;
  }
  +[WCM_Logging logLevel:22 message:@"isSuppressSOSOnlyWithLimitedServiceEnabled::CoreTelephony client not ready yet"];
  return 1;
}

- (void)monitorStrongSOSSignal:(double)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"%s mStrongestSOSRSRP %f, rsrp %f", "-[WRM_EnhancedCTService monitorStrongSOSSignal:]", *(void *)((char *)&self->mEnterSOSTimeStamp + 4), *(void *)&a3);
  if (*(double *)((char *)&self->mStrongestSOSRSRP + 4) <= a3
    || *(double *)((char *)&self->mEnterSOSTimeStamp + 4) <= a3)
  {
    if (a3 > -44.0 || a3 < -140.0)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"%s Invalid RSRP: %f", "-[WRM_EnhancedCTService monitorStrongSOSSignal:]", *(void *)&a3, v6);
    }
    else
    {
      *(double *)((char *)&self->mEnterSOSTimeStamp + 4) = a3;
      [+[NSDate date] timeIntervalSince1970];
      *(void *)(&self->mPrevCombinedRegistrationStatus + 1) = v5;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"%s mStrongestSOSRSRP %f, mStrongestSOSTimeStamp %@", "-[WRM_EnhancedCTService monitorStrongSOSSignal:]", *(void *)((char *)&self->mEnterSOSTimeStamp + 4), +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));
    }
  }
}

- (BOOL)validateStrongestSOSTimeStamp:(double)a3
{
  double v4 = *(double *)(&self->mPrevCombinedRegistrationStatus + 1);
  if (v4 <= 0.0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"%s Invalid mStrongestSOSTimeStamp %@", "-[WRM_EnhancedCTService validateStrongestSOSTimeStamp:]", +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"), v10, v12, v14);
    return 0;
  }
  double v6 = *(double *)((char *)&self->mEnterSOSTimeStamp + 4);
  if (v6 > -44.0 || v6 < -140.0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"%s Invalid mStrongestSOSRSRP %f", "-[WRM_EnhancedCTService validateStrongestSOSTimeStamp:]", *(void *)&v6, v10, v12, v14);
    return 0;
  }
  double v7 = v4 - *(double *)((char *)&self->mStrongestSOSTimeStamp + 4);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"%s mStrongestSOSTimeStamp %@ within %f seconds of mEnterSOSTimeStamp %@. ", "-[WRM_EnhancedCTService validateStrongestSOSTimeStamp:]", +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"), *(void *)&v7, +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", *(double *)((char *)&self->mStrongestSOSTimeStamp + 4)));
  if (v7 <= 0.0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"%s Invalid mStrongestSOSTimeStamp as before mEnterSOSTimeStamp ", "-[WRM_EnhancedCTService validateStrongestSOSTimeStamp:]", v9, v11, v13, v14);
    return 0;
  }
  if (v7 < 180.0)
  {
    *(double *)(&self->mPrevCombinedRegistrationStatus + 1) = *(double *)((char *)&self->mStrongestSOSTimeStamp + 4)
                                                            + 180.0;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"%s Resetting mStrongestSOSTimeStamp to %@ as too close to entry SOS timestamp", "-[WRM_EnhancedCTService validateStrongestSOSTimeStamp:]", +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));
    if (*(double *)(&self->mPrevCombinedRegistrationStatus + 1) > a3)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"%s Invalid mStrongestSOSTimeStamp %@ as SOS patch is less than %d seconds (mEnterSOSTimeStamp %@ - changeTimeStamp %@)", "-[WRM_EnhancedCTService validateStrongestSOSTimeStamp:]", +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"), 180, +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", *(double *)((char *)&self->mStrongestSOSTimeStamp + 4)), +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", a3));
      return 0;
    }
  }
  return 1;
}

- (void)initializeStrongestSOSSignal:(double)a3
{
  *(double *)((char *)&self->mStrongestSOSTimeStamp + 4) = a3;
  *(void *)(&self->mPrevCombinedRegistrationStatus + 1) = 0;
  *(double *)((char *)&self->mEnterSOSTimeStamp + 4) = -1000.0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"%s Reset to initial values. mEnterSOSTimeStamp %@ mStrongestSOSRSRP %f, mStrongestSOSTimeStamp %@", ""[(WRM_EnhancedCTService *)NSDate initializeStrongestSOSSignal:*(double *)((char *)&self->mStrongestSOSTimeStamp + 4)], *(void *)((char *)&self->mEnterSOSTimeStamp + 4), +[NSDate dateWithTimeIntervalSince1970:*(double *)(&self->mPrevCombinedRegistrationStatus + 1)]);
}

- (void)writeToCellularAvailabilityStatusBiomeStream:(double)a3 :(BOOL)a4
{
  if (a4) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = [(WRM_EnhancedCTService *)self combinedRegistrationStatus];
  }
  double v7 = WRM_MotionController;
  if (HIDWORD(self->mCellularAvailabilityStatus) == v6)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 17, @"%s: Skipping event as %d same as previous status %d\n", "-[WRM_EnhancedCTService writeToCellularAvailabilityStatusBiomeStream::]", v6, v6);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 17, @"%s: changeTimeStamp %@ combinedRegistrationStatus: %d mCellularAvailabilityStatus %@\n", "-[WRM_EnhancedCTService writeToCellularAvailabilityStatusBiomeStream::]", +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", a3), v6, *(void *)(&self->mWrmSdmLocationMonitoringStarted + 4));
    double v8 = 0.0;
    uint64_t v9 = &selRef_setMMitigationRequired_;
    if (HIDWORD(self->mCellularAvailabilityStatus) == 2)
    {
      if ([(WRM_EnhancedCTService *)self validateStrongestSOSTimeStamp:a3])
      {
        double v8 = *(double *)(&self->mPrevCombinedRegistrationStatus + 1);
        uint64_t v9 = &selRef_setMMitigationRequired_;
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 17, @"%s Setting latestStrongTimeStamp %@ to mStrongestSOSTimeStamp %@ with RSRP %f aboveThreshold %d", "-[WRM_EnhancedCTService writeToCellularAvailabilityStatusBiomeStream::]", +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", v8), +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", v8), *(void *)((char *)&self->mEnterSOSTimeStamp + 4), *(double *)((char *)&self->mEnterSOSTimeStamp + 4) >= *(double *)((char *)&self->mStrongestSOSRSRP + 4));
      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 17, @"%s Invalid latestStrongTimeStamp %@. Persisting changeTimeStamp %@ for SOS", "-[WRM_EnhancedCTService writeToCellularAvailabilityStatusBiomeStream::]", +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", 0.0), +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", a3), v22, v23);
      }
    }
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    uint64_t v10 = (uint64_t (*)(void))off_10027CFD8;
    int64_t v27 = off_10027CFD8;
    if (!off_10027CFD8)
    {
      uint64_t v11 = (void *)sub_10004F8B0();
      v25[3] = (uint64_t)dlsym(v11, "__BMRootLibrary");
      off_10027CFD8 = (_UNKNOWN *)v25[3];
      uint64_t v10 = (uint64_t (*)(void))v25[3];
    }
    _Block_object_dispose(&v24, 8);
    if (!v10) {
      sub_10013A450();
    }
    id v12 = [[[[[objc_msgSend((id)v10(), "Device") Wireless] CellularAvailabilityStatus] source];
    if (HIDWORD(self->mCellularAvailabilityStatus) == -1) {
      HIDWORD(self->mCellularAvailabilityStatus) = 0;
    }
    uint64_t v13 = *(uint64_t *)((char *)&self->super.super.isa + *((int *)v9 + 465));
    if (v8 == 0.0)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 17, @"%s NIL latestStrongTimeStamp %f  mStrongestSOSTimeStamp %f", "-[WRM_EnhancedCTService writeToCellularAvailabilityStatusBiomeStream::]", *(void *)&v8, v13);
      id v20 = [objc_alloc((Class)sub_100047B84()) initWithTimeStamp:+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", a3) deviceType:2 deviceRegistrationStatus:v6 previousDeviceRegistrationStatus:HIDWORD(self->mCellularAvailabilityStatus)];
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 17, @"%s NOT NIL latestStrongTimeStamp %f mStrongestSOSTimeStamp %f", "-[WRM_EnhancedCTService writeToCellularAvailabilityStatusBiomeStream::]", *(void *)&v8, v13);
      id v14 = objc_alloc((Class)sub_100047B84());
      uint64_t v15 = +[NSDate dateWithTimeIntervalSince1970:a3];
      uint64_t mCellularAvailabilityStatus_high = HIDWORD(self->mCellularAvailabilityStatus);
      uint64_t v17 = +[NSNumber numberWithBool:0];
      uint64_t v18 = +[NSDate dateWithTimeIntervalSince1970:v8];
      uint64_t v19 = v15;
      double v7 = WRM_MotionController;
      id v20 = [v14 initWithTimeStamp:v19 deviceType:2 deviceRegistrationStatus:v6 previousDeviceRegistrationStatus:mCellularAvailabilityStatus_high aboveThreshold:v17 latestStrongTimeStamp:v18];
    }
    unsigned int v21 = v20;
    [&v7[50] logLevel:17, @"%s Event: %@", "-[WRM_EnhancedCTService writeToCellularAvailabilityStatusBiomeStream::]", [v20 description];
    HIDWORD(self->mCellularAvailabilityStatus) = v6;
    [v12 sendEvent:v21];

    if (HIDWORD(self->mCellularAvailabilityStatus) == 2) {
      [(WRM_EnhancedCTService *)self initializeStrongestSOSSignal:a3];
    }
  }
}

- (void)plmnChanged:(id)a3 plmn:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100047D04;
  block[3] = &unk_10020DE88;
  block[4] = a3;
  void block[5] = self;
  void block[6] = a4;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)privateNetworkInfoDidChange:(BOOL)a3
{
  BOOL v19 = a3;
  +[WCM_Logging logLevel:22, @"privateNetworkInfoDidChange startEvaluation=%d", a3 message];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v4 = [(WRM_EnhancedCTService *)self subscriptions];
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v9 slotID])
        {
          id v20 = 0;
          id v10 = [(CoreTelephonyClient *)[(WRM_EnhancedCTService *)self CTClient] getPrivateNetworkCapabilitiesForContext:v9 error:&v20];
          id v11 = v20;
          id v12 = [v9 slotID];
          if (v11 || !v10)
          {
            if (v12)
            {
              uint64_t v16 = "CTSubscriptionSlotOne";
              if ([v9 slotID] != (id)1)
              {
                if ([v9 slotID] == (id)2) {
                  uint64_t v16 = "CTSubscriptionSlotTwo";
                }
                else {
                  uint64_t v16 = "Unknown CTSubscriptionSlot!!!";
                }
              }
            }
            else
            {
              uint64_t v16 = "CTSubscriptionSlotUnknown";
            }
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: privateNetworkInfoDidChange cap error=%@", v16, [v20 localizedDescription]);
            id v17 = 0;
            id v18 = 0;
          }
          else
          {
            if (v12)
            {
              id v13 = [v9 slotID];
              id v14 = "CTSubscriptionSlotOne";
              if (v13 != (id)1)
              {
                id v15 = [v9 slotID];
                id v14 = "Unknown CTSubscriptionSlot!!!";
                if (v15 == (id)2) {
                  id v14 = "CTSubscriptionSlotTwo";
                }
              }
            }
            else
            {
              id v14 = "CTSubscriptionSlotUnknown";
            }
            +[WCM_Logging logLevel:22, @"%s: privateNetworkInfoDidChange cap=%@", v14, v10 message];
            id v17 = [v10 isPrivateNetworkModeEnabled];
            id v18 = [v10 isPrivateNetworkPreferredOverWifi];
          }
          -[WRM_EnhancedCTService processPrivateNwSimStatus:slot:](self, "processPrivateNwSimStatus:slot:", v17, [v9 slotID]);
          -[WRM_EnhancedCTService processPrivateNwPreferredOverWifiStatus:slot:](self, "processPrivateNwPreferredOverWifiStatus:slot:", v18, [v9 slotID]);
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }
  *(WRM_Timer **)((char *)&self->mCbrsSwitchingTimer + 4) = 0;
  BYTE4(self->mLastCbrsRecommendation) = v19;
  if (v19)
  {
    if ((id)[(WRM_EnhancedCTService *)self numberofSubscriptions] == (id)1)
    {
      [(WRM_EnhancedCTService *)self evaluateCbrsInSingleSimMode];
    }
    else if ([(WRM_EnhancedCTService *)self numberofSubscriptions] >= 2)
    {
      [(WRM_EnhancedCTService *)self evaluateCbrsInDualSimMode:1];
    }
  }
}

- (void)evaluateCbrsInSingleSimMode
{
  if (BYTE4(self->mLastCbrsRecommendation)
    && objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isRecentDevice")&& (id)-[WRM_EnhancedCTService numberofSubscriptions](self, "numberofSubscriptions") == (id)1)
  {
    if ([(WRM_EnhancedCTService *)self dataPreferredSlot])
    {
      if ((id)[(WRM_EnhancedCTService *)self dataPreferredSlot] == (id)1)
      {
        id v3 = "CTSubscriptionSlotOne";
      }
      else
      {
        int64_t v4 = [(WRM_EnhancedCTService *)self dataPreferredSlot];
        id v3 = "Unknown CTSubscriptionSlot!!!";
        if (v4 == 2) {
          id v3 = "CTSubscriptionSlotTwo";
        }
      }
    }
    else
    {
      id v3 = "CTSubscriptionSlotUnknown";
    }
    +[WCM_Logging logLevel:22, @"evaluateCbrsInSingleSimMode SingleSim DataSlot=%s", v3 message];
    if ([(WRM_EnhancedCTService *)self dataPreferredSlot])
    {
      id v5 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getiRATConfigController];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = (char *)[(WRM_EnhancedCTService *)self dataPreferredSlot] - 1;
        unsigned int v8 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellRadioTechnologyType](self, "servCellRadioTechnologyType"), "objectAtIndex:", v7) intValue];
        if (v8 == 9)
        {
          [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService nrCellRSRP](self, "nrCellRSRP"), "objectAtIndex:", v7) doubleValue];
          double v9 = v13;
          id v12 = [(WRM_EnhancedCTService *)self nrCellRSRQ];
        }
        else
        {
          double v9 = 0.0;
          double v10 = 0.0;
          if (v8 != 1) {
            goto LABEL_21;
          }
          [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellRSRP](self, "servCellRSRP"), "objectAtIndex:", v7) doubleValue];
          double v9 = v11;
          id v12 = [(WRM_EnhancedCTService *)self servCellRSRQ];
        }
        [v12 objectAtIndex:v7].doubleValue;
        double v10 = v14;
LABEL_21:
        BOOL v15 = v9 > (double)(uint64_t)[v6 nonCbrsExitRsrpMin]
           && v10 > (double)(uint64_t)[v6 nonCbrsExitRsrqMin];
        +[WCM_Logging logLevel:22, @"evaluateCbrsInSingleSimMode recommendSlot=unknown, dataSlotQuality=%d, anyCallState=%d", v15, HIDWORD(self->mSCService) message];
        uint64_t mSCService_high = HIDWORD(self->mSCService);
        [(WRM_EnhancedCTService *)self switchPrivateNwDataSim:0 currentSlotQuality:v15 anyCallState:mSCService_high forceRecommend:1];
        return;
      }
      +[WCM_Logging logLevel:22 message:@"Error: invalid tempiRATConfig"];
    }
  }
}

- (void)currentDataSimChanged:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"dataPreferredSlot changed to %ld", [a3 slotID]);
  -[WRM_EnhancedCTService setDataPreferredSlot:](self, "setDataPreferredSlot:", [a3 slotID]);
  if (!BYTE4(self->mLastCbrsRecommendation)
    || (id)[(WRM_EnhancedCTService *)self numberofSubscriptions] == (id)1)
  {
    return;
  }
  if (objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService isPrivateNetworkSim](self, "isPrivateNetworkSim"), "objectAtIndex:", 0), "BOOLValue"))
  {
    uint64_t v5 = 1;
  }
  else
  {
    if ((objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService isPrivateNetworkSim](self, "isPrivateNetworkSim"), "objectAtIndex:", 1), "BOOLValue") & 1) == 0)
    {
      CFStringRef v10 = @"currentDataSimChanged error: cbrs SIM not present in dual sim mode";
      goto LABEL_17;
    }
    uint64_t v5 = 2;
  }
  id v6 = (WRM_Timer *)[a3 slotID];
  if (v6 == *(WRM_Timer **)((char *)&self->mCbrsSwitchingTimer + 4))
  {
    if (*(void *)&self->mCellRSRQ4G5GvsWiFiThreshold)
    {
      [*(id *)&self->mCellRSRQ4G5GvsWiFiThreshold invalidate];

      *(void *)&self->mCellRSRQ4G5GvsWiFiThreshold = 0;
      id v6 = *(WRM_Timer **)((char *)&self->mCbrsSwitchingTimer + 4);
    }
    if (v6 == (WRM_Timer *)v5) {
      double v7 = 15.0;
    }
    else {
      double v7 = 60.0;
    }
    objc_initWeak(&location, self);
    unsigned int v8 = [WRM_Timer alloc];
    double v9 = [(WRM_EnhancedCTService *)self queue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000485A0;
    v11[3] = &unk_10020DEB0;
    objc_copyWeak(&v12, &location);
    *(void *)&self->mCellRSRQ4G5GvsWiFiThreshold = [(WRM_Timer *)v8 initWithFireTimeIntervalSinceNow:v9 queue:v11 block:v7];
    +[WCM_Logging logLevel:22, @"CBRS ping-pong timer started for %f seconds", *(void *)&v7 message];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    return;
  }
  CFStringRef v10 = @"Do not start CBRS ping-pong timer as CT hasn't honored WRM's recommendation";
LABEL_17:

  +[WCM_Logging logLevel:22 message:v10];
}

- (void)updateCallState:(int)a3
{
  if (HIDWORD(self->mSCService) == a3)
  {
    id v3 = "inactive";
    if (a3 == 1) {
      id v3 = "active";
    }
    +[WCM_Logging logLevel:22, @"EnhancedCTService: updateCallState no change %s", v3 message];
  }
  else
  {
    HIDWORD(self->mSCService) = a3;
    if (a3 == 1) {
      uint64_t v5 = "active";
    }
    else {
      uint64_t v5 = "inactive";
    }
    +[WCM_Logging logLevel:22, @"EnhancedCTService: updateCallState=%s, mWrmCbrsMonitorRequired=%d, numberofSubscriptions=%lu", v5, BYTE4(self->mLastCbrsRecommendation), [(WRM_EnhancedCTService *)self numberofSubscriptions] message];
    if (BYTE4(self->mLastCbrsRecommendation))
    {
      if ((id)[(WRM_EnhancedCTService *)self numberofSubscriptions] == (id)1)
      {
        [(WRM_EnhancedCTService *)self evaluateCbrsInSingleSimMode];
      }
      else if ([(WRM_EnhancedCTService *)self numberofSubscriptions] >= 2)
      {
        [(WRM_EnhancedCTService *)self evaluateCbrsInDualSimMode:1];
      }
    }
  }
}

- (void)evaluateCbrsInDualSimMode:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100048804;
  v3[3] = &unk_10020DE10;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v3);
}

- (void)switchPrivateNwDataSim:(int64_t)a3 currentSlotQuality:(int)a4 anyCallState:(int)a5 forceRecommend:(BOOL)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  if (!a6 && (double v9 = *(void **)&self->mCellRSRQ4G5GvsWiFiThreshold) != 0 && [v9 isValid])
  {
    +[WCM_Logging logLevel:22 message:@"CBRS ping-pong timer not expired yet. Suppress switching"];
  }
  else
  {
    id v10 = +[WRM_HandoverManager WRM_HandoverManagerSingleton];
    [v10 switchPrivateNwDataSim:a3 currentSlotQuality:v7 anyCallState:v6];
  }
}

- (void)voiceLinkQualityChanged:(id)a3 metric:(id)a4
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s context %@ metric %@", "-[WRM_EnhancedCTService voiceLinkQualityChanged:metric:]", a3, a4);
  id v7 = [a3 slotID];

  [(WRM_EnhancedCTService *)self processVoiceLinkQualityInfo:a4 :v7];
}

- (void)enhancedVoiceLinkQualityChanged:(id)a3 metric:(id)a4
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s context %@ metric %@", "-[WRM_EnhancedCTService enhancedVoiceLinkQualityChanged:metric:]", a3, a4);
  id v7 = [a3 slotID];

  [(WRM_EnhancedCTService *)self processEnhancedVoiceLinkQualityBlob:a4 :v7];
}

- (void)enhancedDataLinkQualityChanged:(id)a3 metric:(id)a4
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s context %@ metric %@", "-[WRM_EnhancedCTService enhancedDataLinkQualityChanged:metric:]", a3, a4);
  id v7 = [a3 slotID];

  [(WRM_EnhancedCTService *)self processEnhancedDataLQMBlob:a4 :v7];
}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s context %@ dataStatus %@", "-[WRM_EnhancedCTService dataStatus:dataStatusInfo:]", a3, a4);
  id v7 = [a3 slotID];

  [(WRM_EnhancedCTService *)self processDataStatus:a4 :v7];
}

- (void)imsRegistrationChanged:(id)a3 info:(id)a4
{
}

- (void)context:(id)a3 capabilitiesChanged:(id)a4
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s context %@ capabilitiesChanged info %@", "-[WRM_EnhancedCTService context:capabilitiesChanged:]", a3, a4);
  id v7 = [a4 objectForKey:kCTCapabilityAgent];
  if (v7)
  {
    id v8 = [v7 objectForKey:@"kCTCapabilityStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"kCTCapabilityVoLTE status %d", [v8 BOOLValue]);
      -[WRM_EnhancedCTService processVolteStatus::](self, "processVolteStatus::", [v8 BOOLValue], [a3 slotID]);
    }
  }
  id v9 = [a4 objectForKey:kCTCapabilityAgent2];
  if (v9)
  {
    id v10 = [v9 objectForKey:@"kCTCapabilityStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"kCTCapabilityWiFiCalling status %d", [v10 BOOLValue]);
      -[WRM_EnhancedCTService processWiFiCallingStatus::](self, "processWiFiCallingStatus::", [v10 BOOLValue], [a3 slotID]);
      id v11 = +[WRM_HandoverManager WRM_HandoverManagerSingleton];
      [v11 evalSAStatusWiFiCallCallingPrefChanged];
    }
  }
}

- (BOOL)checkIfServingCellNonLTE
{
  uint64_t v3 = 0;
  char v4 = 1;
  while (1)
  {
    char v5 = v4;
    unsigned int v6 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellRadioTechnologyType](self, "servCellRadioTechnologyType"), "objectAtIndex:", v3) intValue];
    if (v6 != 10 && v6 != 1) {
      break;
    }
    char v4 = 0;
    BOOL result = 0;
    uint64_t v3 = 1;
    if ((v5 & 1) == 0) {
      return result;
    }
  }
  return 1;
}

- (void)setNrRSRP:(double)a3 forSim:(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000495C4;
  block[3] = &unk_10020DC08;
  block[4] = self;
  void block[5] = a4;
  *(double *)&void block[6] = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)setNrSNR:(double)a3 forSim:(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100049728;
  block[3] = &unk_10020DC08;
  block[4] = self;
  void block[5] = a4;
  *(double *)&void block[6] = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)setServingCellECIO:(double)a3 forSim:(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004984C;
  block[3] = &unk_10020DC08;
  block[4] = self;
  void block[5] = a4;
  *(double *)&void block[6] = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)setServingCellRSCP:(double)a3 forSim:(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100049970;
  block[3] = &unk_10020DC08;
  block[4] = self;
  void block[5] = a4;
  *(double *)&void block[6] = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)setNrRSRQ:(double)a3 forSim:(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100049A94;
  block[3] = &unk_10020DC08;
  block[4] = self;
  void block[5] = a4;
  *(double *)&void block[6] = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (double)getNrRSRP
{
  uint64_t v5 = 0;
  unsigned int v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100049BF4;
  v4[3] = &unk_10020DB68;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v4);
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)getNrRSRP:(int64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100049DB4;
  block[3] = &unk_10020DBE0;
  block[4] = self;
  void block[5] = &v6;
  void block[6] = a3;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)getNrSNR
{
  uint64_t v5 = 0;
  uint64_t v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100049F38;
  v4[3] = &unk_10020DB68;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v4);
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)getNrSNR:(int64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004A0F8;
  block[3] = &unk_10020DBE0;
  block[4] = self;
  void block[5] = &v6;
  void block[6] = a3;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)getNrRSRQ
{
  uint64_t v5 = 0;
  uint64_t v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004A27C;
  v4[3] = &unk_10020DB68;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v4);
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)getNrRSRQ:(int64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004A43C;
  block[3] = &unk_10020DBE0;
  block[4] = self;
  void block[5] = &v6;
  void block[6] = a3;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)getFR2Status
{
  return [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService currentHarvestedCellTypeFR2Capable](self, "currentHarvestedCellTypeFR2Capable"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue] != 0;
}

- (unsigned)getLocationDBFR1Count
{
  if ([(WRM_EnhancedCTService *)self dataPreferredSlot])
  {
    if ((id)[(WRM_EnhancedCTService *)self dataPreferredSlot] == (id)1)
    {
      double v3 = "CTSubscriptionSlotOne";
    }
    else if ((id)[(WRM_EnhancedCTService *)self dataPreferredSlot] == (id)2)
    {
      double v3 = "CTSubscriptionSlotTwo";
    }
    else
    {
      double v3 = "Unknown CTSubscriptionSlot!!!";
    }
  }
  else
  {
    double v3 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: active slot %s getLocationDBFR1Count %d", "-[WRM_EnhancedCTService getLocationDBFR1Count]", v3, [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService detectedFR1CellCountLocDB](self, "detectedFR1CellCountLocDB"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
  id v4 = [(NSMutableArray *)[(WRM_EnhancedCTService *)self detectedFR1CellCountLocDB] objectAtIndex:(char *)[(WRM_EnhancedCTService *)self dataPreferredSlot] - 1];

  return [v4 intValue];
}

- (unsigned)getLocationDBFR2Count
{
  if ([(WRM_EnhancedCTService *)self dataPreferredSlot])
  {
    if ((id)[(WRM_EnhancedCTService *)self dataPreferredSlot] == (id)1)
    {
      double v3 = "CTSubscriptionSlotOne";
    }
    else if ((id)[(WRM_EnhancedCTService *)self dataPreferredSlot] == (id)2)
    {
      double v3 = "CTSubscriptionSlotTwo";
    }
    else
    {
      double v3 = "Unknown CTSubscriptionSlot!!!";
    }
  }
  else
  {
    double v3 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, @"%s: active slot %s getLocationDBFR2Count %d", @"-[WRM_EnhancedCTService getLocationDBFR2Count]", v3, [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService detectedFR2CellCountLocDB](self, "detectedFR2CellCountLocDB"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
  id v4 = [(NSMutableArray *)[(WRM_EnhancedCTService *)self detectedFR2CellCountLocDB] objectAtIndex:(char *)[(WRM_EnhancedCTService *)self dataPreferredSlot] - 1];

  return [v4 intValue];
}

- (int)getCTDataIndictor:(int64_t)a3
{
  unsigned int v4 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService dataIndicator](self, "dataIndicator"), "objectAtIndex:", a3 - 1) intValue];
  uint64_t v5 = "Unknown CTSubscriptionSlot!!!";
  if (a3 == 2) {
    uint64_t v5 = "CTSubscriptionSlotTwo";
  }
  if (a3 == 1) {
    uint64_t v5 = "CTSubscriptionSlotOne";
  }
  if (!a3) {
    uint64_t v5 = "CTSubscriptionSlotUnknown";
  }
  if (v4 < 0x13 && ((0x7FFF7u >> v4) & 1) != 0)
  {
    uint64_t v6 = (&off_10020E258)[v4];
  }
  else
  {
    uint64_t v6 = "Unknown kCTDataIndicatorStatusUnknown!!!";
    if (v4 == 19) {
      uint64_t v6 = "5G_CA";
    }
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: sim slot %s Data indicator: %s", "-[WRM_EnhancedCTService getCTDataIndictor:]", v5, v6);
  return v4;
}

- (double)getMeasureBWDataSlot
{
  [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService dataBW](self, "dataBW"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) doubleValue];
  double v4 = v3;
  if ([(WRM_EnhancedCTService *)self dataPreferredSlot])
  {
    if ((id)[(WRM_EnhancedCTService *)self dataPreferredSlot] == (id)1)
    {
      uint64_t v5 = "CTSubscriptionSlotOne";
    }
    else
    {
      int64_t v6 = [(WRM_EnhancedCTService *)self dataPreferredSlot];
      uint64_t v5 = "Unknown CTSubscriptionSlot!!!";
      if (v6 == 2) {
        uint64_t v5 = "CTSubscriptionSlotTwo";
      }
    }
  }
  else
  {
    uint64_t v5 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: active slot %s BW %f", "-[WRM_EnhancedCTService getMeasureBWDataSlot]", v5, *(void *)&v4);
  return v4;
}

- (int)getUARFCNDataSlot
{
  id v3 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService cellARFCN](self, "cellARFCN"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
  if ([(WRM_EnhancedCTService *)self dataPreferredSlot])
  {
    if ((id)[(WRM_EnhancedCTService *)self dataPreferredSlot] == (id)1)
    {
      double v4 = "CTSubscriptionSlotOne";
    }
    else
    {
      int64_t v5 = [(WRM_EnhancedCTService *)self dataPreferredSlot];
      double v4 = "Unknown CTSubscriptionSlot!!!";
      if (v5 == 2) {
        double v4 = "CTSubscriptionSlotTwo";
      }
    }
  }
  else
  {
    double v4 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: active slot %s ARFCN %d", "-[WRM_EnhancedCTService getUARFCNDataSlot]", v4, v3);
  return (int)v3;
}

- (int)getBandInfoDataSlot
{
  id v3 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService cellBandInfo](self, "cellBandInfo"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
  if ([(WRM_EnhancedCTService *)self dataPreferredSlot])
  {
    if ((id)[(WRM_EnhancedCTService *)self dataPreferredSlot] == (id)1)
    {
      double v4 = "CTSubscriptionSlotOne";
    }
    else
    {
      int64_t v5 = [(WRM_EnhancedCTService *)self dataPreferredSlot];
      double v4 = "Unknown CTSubscriptionSlot!!!";
      if (v5 == 2) {
        double v4 = "CTSubscriptionSlotTwo";
      }
    }
  }
  else
  {
    double v4 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: active slot %s Band info %d", "-[WRM_EnhancedCTService getBandInfoDataSlot]", v4, v3);
  return (int)v3;
}

- (int)getBandInfoOnSlot:(int64_t)a3
{
  id v4 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService cellBandInfo](self, "cellBandInfo"), "objectAtIndex:", a3 - 1) intValue];
  int64_t v5 = "CTSubscriptionSlotUnknown";
  int64_t v6 = "CTSubscriptionSlotOne";
  uint64_t v7 = "Unknown CTSubscriptionSlot!!!";
  if (a3 == 2) {
    uint64_t v7 = "CTSubscriptionSlotTwo";
  }
  if (a3 != 1) {
    int64_t v6 = v7;
  }
  if (a3) {
    int64_t v5 = v6;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: getBandInfoOnSlot %s Band info %d", "-[WRM_EnhancedCTService getBandInfoOnSlot:]", v5, v4);
  return (int)v4;
}

- (int)getConfiguredMaxBW
{
  id v3 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService configuredMaxDLBW](self, "configuredMaxDLBW"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
  if ([(WRM_EnhancedCTService *)self dataPreferredSlot])
  {
    if ((id)[(WRM_EnhancedCTService *)self dataPreferredSlot] == (id)1)
    {
      id v4 = "CTSubscriptionSlotOne";
    }
    else
    {
      int64_t v5 = [(WRM_EnhancedCTService *)self dataPreferredSlot];
      id v4 = "Unknown CTSubscriptionSlot!!!";
      if (v5 == 2) {
        id v4 = "CTSubscriptionSlotTwo";
      }
    }
  }
  else
  {
    id v4 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: active slot %s Cell BW %d", "-[WRM_EnhancedCTService getConfiguredMaxBW]", v4, v3);
  return (int)v3;
}

- (void)resetWiFiNRStatusDataSlot
{
  id v3 = [(WRM_EnhancedCTService *)self wifiNRCellFound];
  id v4 = (char *)[(WRM_EnhancedCTService *)self dataPreferredSlot] - 1;
  int64_t v5 = +[NSNumber numberWithInt:0];

  [(NSMutableArray *)v3 replaceObjectAtIndex:v4 withObject:v5];
}

- (void)updateDataStallState:(int64_t)a3 stall:(BOOL)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004AD14;
  block[3] = &unk_10020DD48;
  BOOL v5 = a4;
  block[4] = self;
  void block[5] = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)updateCurrentRatInfo:(int64_t)a3 currentNRCell:(int)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004AF10;
  block[3] = &unk_10020DED8;
  int v5 = a4;
  block[4] = self;
  void block[5] = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)updateLTEBandwidth:(int64_t)a3 LTEBW:(unsigned int)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B078;
  block[3] = &unk_10020DED8;
  unsigned int v5 = a4;
  block[4] = self;
  void block[5] = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)updateConfiguredMaxBW:(int64_t)a3 dlbw:(unsigned int)a4 ulbw:(unsigned int)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B1E4;
  block[3] = &unk_10020DC08;
  unsigned int v6 = a4;
  unsigned int v7 = a5;
  block[4] = self;
  void block[5] = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)updateDownlinkEstimatedBW:(unsigned __int8)a3 bw:(unsigned int)a4 conf:(unsigned int)a5 lte:(unsigned int)a6 nr:(unsigned int)a7
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B384;
  block[3] = &unk_10020DD48;
  unsigned __int8 v10 = a3;
  unsigned int v8 = a4;
  unsigned int v9 = a5;
  block[4] = self;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)updateUplinkEstimatedBW:(unsigned __int8)a3 bw:(unsigned int)a4 conf:(unsigned int)a5 queue:(unsigned int)a6
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B534;
  block[3] = &unk_10020DF00;
  unsigned __int8 v10 = a3;
  unsigned int v7 = a4;
  unsigned int v8 = a5;
  unsigned int v9 = a6;
  block[4] = self;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)updateHighRateLikely:(int64_t)a3 highrateIndicator:(BOOL)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B6D4;
  block[3] = &unk_10020DD48;
  BOOL v5 = a4;
  block[4] = self;
  void block[5] = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)updateConnectedStateSummary:(int64_t)a3 neighberNRCell:(int)a4 highrateIndicator:(BOOL)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B83C;
  block[3] = &unk_10020DED8;
  int v6 = a4;
  block[4] = self;
  void block[5] = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (BOOL)ifInternalDevice
{
  +[WCM_Logging logLevel:22 message:@"CellularThroughput check for internal device"];

  return MGGetBoolAnswer();
}

- (BOOL)isBetaBuild
{
  if (qword_10027CFB8 != -1) {
    dispatch_once(&qword_10027CFB8, &stru_10020DF40);
  }
  return 0;
}

- (BOOL)ifMAV20Device
{
  unsigned int v2 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") platformManager] wrmPlatformId];
  return v2 == 13 || (v2 & 0xFFFFFFFE) == 14 || v2 == 11;
}

- (BOOL)ifAutomatedDeviceGroup
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x3052000000;
  unsigned int v8 = sub_100046A4C;
  unsigned int v9 = sub_100046A5C;
  unsigned int v2 = (void *)qword_10027CFE8;
  uint64_t v10 = qword_10027CFE8;
  if (!qword_10027CFE8)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10004FAC4;
    v4[3] = &unk_10020DAF8;
    v4[4] = &v5;
    sub_10004FAC4((uint64_t)v4);
    unsigned int v2 = (void *)v6[5];
  }
  _Block_object_dispose(&v5, 8);
  return [[v2 performSelector:NSSelectorFromString(@"automatedDeviceGroup")] length] != 0;
}

- (void)setCellularSpeedTestsDisabled:(BOOL)a3
{
  id v4 = "NO";
  if (a3) {
    id v4 = "YES";
  }
  +[WCM_Logging logLevel:22, @"CellularThroughput cellularSpeedTestsDisabled: %s", v4 message];
  byte_10027CFC0 = a3;
}

- (void)checkAndScheduleSpeedTest
{
  if (*(void *)(&self->super.m_PDPAssertionRefCount + 1)) {
    BOOL v2 = byte_10027CFC0 == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (v2)
  {
    unsigned int v4 = [(WRM_EnhancedCTService *)self getCTDataIndictor] - 8;
    if (v4 > 0xB) {
      uint64_t v5 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v5 = dword_1001E7CD8[v4];
    }
    int v6 = *(void **)(&self->super.m_PDPAssertionRefCount + 1);
    if ((byte_10027CFC1 & 1) == 0)
    {
      unsigned __int8 v7 = [v6 ifScheduleSpeedTestAfterReboot:1 probability:60];
      int v6 = *(void **)(&self->super.m_PDPAssertionRefCount + 1);
      if ((v7 & 1) == 0 && v6)
      {

        *(void *)(&self->super.m_PDPAssertionRefCount + 1) = 0;
        return;
      }
      byte_10027CFC1 = 1;
    }
    id v8 = v6;
    if ((byte_10027CFC2 & 1) == 0)
    {
      unsigned int v9 = *(void **)(&self->super.m_PDPAssertionRefCount + 1);
      byte_10027CFC2 = 1;
      [v9 scheduleTests:v5 :&stru_10020DF80];
    }
  }
}

- (BOOL)determineifSABWCriteriaMet
{
  unsigned __int8 v3 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService highDataRateObserved](self, "highDataRateObserved"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) BOOLValue];
  if ([[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService configuredMaxDLBW](self, "configuredMaxDLBW"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue] >= self->mWRMCellOutrankWifiBWThreshold])return 1; {
  else
  }
    return v3;
}

- (void)evaluateCellularScorePrivateNw:(unsigned __int8)a3 currnetConf:(unsigned __int8)a4 score:(char *)a5 conf:(char *)a6 evalMode:(BOOL)a7 outrankExit:(BOOL)a8
{
  BOOL v8 = a7;
  *a5 = a3;
  *a6 = a4;
  unsigned int v12 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellRadioTechnologyType](self, "servCellRadioTechnologyType"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
  id v13 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService currentNRCellType](self, "currentNRCellType"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
  id v14 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService rrcState](self, "rrcState"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
  if (v12 == 9 || v13 == 3)
  {
    [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService nrCellRSRP](self, "nrCellRSRP"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) doubleValue];
    double v16 = v20;
    [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService nrCellSNR](self, "nrCellSNR"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) doubleValue];
    uint64_t v18 = v21;
    BOOL v19 = [(WRM_EnhancedCTService *)self nrCellRSRQ];
  }
  else
  {
    if (v12 != 1)
    {
      *a5 = 3;
      *a6 = 2;
      CFStringRef v26 = @"evaluateCellularScore: score: bad";
      goto LABEL_44;
    }
    [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellRSRP](self, "servCellRSRP"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) doubleValue];
    double v16 = v15;
    [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellSNR](self, "servCellSNR"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) doubleValue];
    uint64_t v18 = v17;
    BOOL v19 = [(WRM_EnhancedCTService *)self servCellRSRQ];
  }
  [[-[NSMutableArray objectAtIndex:](v19, "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) doubleValue];
  double v23 = v22;
  BOOL v24 = v16 >= (double)(int)self->mCellConfiguredBandwidth && v22 >= (double)self->mCellRSRP4G5GvsWiFiThreshold;
  unsigned int v46 = a5;
  BOOL v47 = a6;
  id v49 = v13;
  BOOL v45 = v24;
  if ([(WRM_EnhancedCTService *)self dataPreferredSlot])
  {
    if ((id)[(WRM_EnhancedCTService *)self dataPreferredSlot] == (id)1)
    {
      v25 = "CTSubscriptionSlotOne";
    }
    else
    {
      int64_t v27 = [(WRM_EnhancedCTService *)self dataPreferredSlot];
      v25 = "Unknown CTSubscriptionSlot!!!";
      if (v27 == 2) {
        v25 = "CTSubscriptionSlotTwo";
      }
    }
  }
  else
  {
    v25 = "CTSubscriptionSlotUnknown";
  }
  int v48 = (int)v14;
  +[WCM_Logging logLevel:24, @"evaluateCellularScorePrivateNw: RRC state: %d, forceActiveEval:%d, RSRP: %f, SNR: %f, RSRQ: %f, data slot: %s, locationEnabled:%d", v14, v8, *(void *)&v16, v18, *(void *)&v23, v25, byte_10027C878 message];
  unsigned int v44 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService stallDetected](self, "stallDetected"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
  unsigned int v28 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService highDataRateObserved](self, "highDataRateObserved"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) BOOLValue];
  id v29 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService estimatedBWDL](self, "estimatedBWDL"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
  id v30 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService estimatedBWDLConf](self, "estimatedBWDLConf"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
  id v31 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService DataLqmValue](self, "DataLqmValue"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
  id v32 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService VoiceLqmValue](self, "VoiceLqmValue"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
  unsigned int v33 = [(WRM_EnhancedCTService *)self getWiFiNRStatusDataSlot];
  id v34 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService detectedFR1CellCountLocDB](self, "detectedFR1CellCountLocDB"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
  id v35 = [[-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService detectedFR2CellCountLocDB](self, "detectedFR2CellCountLocDB"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1) intValue];
  if ([(WRM_EnhancedCTService *)self dataPreferredSlot])
  {
    if ((id)[(WRM_EnhancedCTService *)self dataPreferredSlot] == (id)1)
    {
      v36 = "CTSubscriptionSlotOne";
    }
    else
    {
      int64_t v37 = [(WRM_EnhancedCTService *)self dataPreferredSlot];
      v36 = "Unknown CTSubscriptionSlot!!!";
      if (v37 == 2) {
        v36 = "CTSubscriptionSlotTwo";
      }
    }
  }
  else
  {
    v36 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:24, @"evaluateCellularScorePrivateNw: LocationDB FR1 count: %d, FR2 count: %d, %s", v34, v35, v36 message];
  +[WCM_Logging logLevel:24, @"evaluateCellularScorePrivateNw: Connected Cell: %d, High rate likely : %d, DL BW:%d, DL Conf:%d isWiFiCellNR: %d", v49, v28, v29, v30, v33 != 0 message];
  if (v48 != 1 && !v8)
  {
    char v38 = 1;
    if (v31 == 50)
    {
      char v40 = v46;
      v39 = v47;
    }
    else
    {
      char v40 = v46;
      v39 = v47;
      if (v31 != 100)
      {
        int v41 = v45;
        if (v34) {
          int v41 = 1;
        }
        if (v35) {
          int v41 = 1;
        }
        if (v41) {
          char v38 = 1;
        }
        else {
          char v38 = 3;
        }
      }
    }
    *char v40 = v38;
    char *v39 = 2;
    CFStringRef v26 = @"evaluateCellularScorePrivateNw: default evaluation";
    goto LABEL_44;
  }
  if ((int)v30 >= 5)
  {
    +[WCM_Logging logLevel:24, @"evaluateCellularScorePrivateNw: DLBW: %d, Conf:%d", v29, v30 message];
    if ((int)v29 > 1999)
    {
      uint64_t v42 = v47;
      if (v45 & v28)
      {
        char *v46 = 1;
        char v43 = 2;
      }
      else
      {
        char *v46 = 2;
        char v43 = 1;
      }
      goto LABEL_48;
    }
LABEL_41:
    char *v46 = 3;
    char v43 = 2;
    uint64_t v42 = v47;
LABEL_48:
    char *v42 = v43;
    return;
  }
  +[WCM_Logging logLevel:24, @"evaluateCellularScorePrivateNw: dLQM: %d, vLQM: %d, RLGS stal: %d", v31, v32, v44 != 0 message];
  if (v31 == 10 || v32 == 10 || v44) {
    goto LABEL_41;
  }
  CFStringRef v26 = @"evaluateCellularScorePrivateNw: RRC Connected mode";
LABEL_44:

  +[WCM_Logging logLevel:24 message:v26];
}

- (void)reloadCellularSpeedTestSettingsFromPreferences
{
  +[WCM_Logging logLevel:22 message:@"CellularThroughput: reloadCellularSpeedTestSettingsFromPreferences called"];
  CFDictionaryRef v3 = (const __CFDictionary *)CFPreferencesCopyAppValue(@"iRATDebug", @"com.apple.WirelessRadioManager.debug");
  if (!v3)
  {
    +[WCM_Logging logLevel:22 message:@"iRATDebug not Found"];
    BOOL v8 = 0;
    int v10 = 1;
    goto LABEL_13;
  }
  CFDictionaryRef v4 = v3;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (TypeID == CFGetTypeID(v4))
  {
    value = 0;
    if (CFDictionaryGetValueIfPresent(v4, @"CellularSpeedTest", (const void **)&value))
    {
      CFTypeID v6 = CFStringGetTypeID();
      if (v6 == CFGetTypeID(value))
      {
        BOOL v7 = CFEqual(@"FALSE", (CFStringRef)value);
        BOOL v8 = v7;
        unsigned int v9 = "FALSE";
        if (v7) {
          unsigned int v9 = "TRUE";
        }
        +[WCM_Logging logLevel:22, @"CellularThroughput: DisableCellularSpeedTest read from preference %s", v9 message];
        int v10 = 0;
        goto LABEL_12;
      }
    }
    CFStringRef v11 = @"CellularThroughput: DisableCellularSpeedTest not found";
  }
  else
  {
    CFStringRef v11 = @"iRATDebug not Found";
  }
  +[WCM_Logging logLevel:22 message:v11];
  BOOL v8 = 0;
  int v10 = 1;
LABEL_12:
  CFRelease(v4);
LABEL_13:
  +[WCM_Logging logLevel:22, @"CellularThroughput setCellularSpeedTestDisabled is %d", v8 message];
  [(WRM_EnhancedCTService *)self handleSettingCellularSpeedTestSetting:v8];
  if (v10) {
    [(WRM_EnhancedCTService *)self setCellularSpeedTestSettingsToPreferences:v8];
  }
}

- (void)handleSettingCellularSpeedTestSetting:(BOOL)a3
{
  [(WRM_EnhancedCTService *)self setCellularSpeedTestsDisabled:a3];
  if (byte_10027CFC0)
  {
    CFDictionaryRef v4 = *(void **)(&self->super.m_PDPAssertionRefCount + 1);
    if (v4)
    {
      [v4 abort];
    }
  }
}

- (void)setCellularSpeedTestSettingsToPreferences:(BOOL)a3
{
  CFDictionaryRef v3 = "FALSE";
  if (a3) {
    CFDictionaryRef v3 = "TRUE";
  }
  values = +[NSString stringWithFormat:@"%s", v3];
  keys = @"CellularSpeedTest";
  CFDictionaryRef v4 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (v4)
  {
    CFDictionaryRef v5 = v4;
    CFPreferencesSetAppValue(@"iRATDebug", v4, @"com.apple.WirelessRadioManager.debug");
    CFRelease(v5);
  }
  if (!CFPreferencesAppSynchronize(@"com.apple.WirelessRadioManager.debug")) {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: Failed to sync the preferences.", "-[WRM_EnhancedCTService setCellularSpeedTestSettingsToPreferences:]");
  }
}

- (BOOL)ifLimitSpeedTest
{
  return [[[WCM_PolicyManager singleton] platformManager] wrmPlatformId] - 22 < 4;
}

- (void)initCellularProductExperimentsManager
{
  *(WRM_SpeedTestSchedulerServicesIOS **)((char *)&self->speedTestSchedulerServices + 4) = (WRM_SpeedTestSchedulerServicesIOS *)objc_alloc_init(CellularProductExperimentsManager);
}

- (double)initSOSWaypointThreshold
{
  id v2 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getiRATConfigController];
  if (v2)
  {
    CFDictionaryRef v3 = v2;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"initSOSWaypointThreshold: Setting to %f", (double)(uint64_t)[v2 sosWaypointRSRPTh]);
    return (double)(uint64_t)[v3 sosWaypointRSRPTh];
  }
  else
  {
    +[WCM_Logging logLevel:22 message:@"initSOSWaypointThreshold Error: invalid tempiRATConfig. Setting to default value of -115"];
    return -115.0;
  }
}

- (void)initCellularSpeedTest
{
  if ([(WRM_EnhancedCTService *)self shouldScheduleSpeedTests])
  {
    +[WCM_Logging logLevel:22 message:@"CellularThroughput: initCellularSpeedTest"];
    *(void *)(&self->super.m_PDPAssertionRefCount + 1) = [[WRM_SpeedTestSchedulerServicesIOS alloc] initWithWaitTime:259200.0];
    +[WCM_Logging logLevel:22 message:@"CellularThroughput: calling reloadCellularSpeedTestSettingsFromPreferences"];
    int out_token = 0;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10004C844;
    v3[3] = &unk_10020DFA8;
    v3[4] = self;
    notify_register_dispatch("com.apple.WirelessRadioManager.DisableSpeedTestNotification", &out_token, (dispatch_queue_t)&_dispatch_main_q, v3);
    [(WRM_EnhancedCTService *)self reloadCellularSpeedTestSettingsFromPreferences];
    +[WCM_Logging logLevel:22 message:@"CellularThroughput: reloadCellularSpeedTestSettingsFromPreferences called from EnhancedCTServices"];
  }
  else
  {
    *(void *)(&self->super.m_PDPAssertionRefCount + 1) = 0;
  }
}

- (void)initCellStationManager
{
  if (objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isRecentDevice"))
  {
    CFDictionaryRef v3 = objc_alloc_init(WRM_CellStationManagerIOS);
    *(CellularProductExperimentsManager **)((char *)&self->cellularProductExperimentsManager + 4) = (CellularProductExperimentsManager *)v3;
    if (v3) {
      CFStringRef v4 = @"CellStationManager: initCellStationManager";
    }
    else {
      CFStringRef v4 = @"CellStationManager: Not initialized";
    }
  }
  else
  {
    *(CellularProductExperimentsManager **)((char *)&self->cellularProductExperimentsManager + 4) = 0;
    CFStringRef v4 = @"CellStationManager: Not a recent device";
  }

  +[WCM_Logging logLevel:22 message:v4];
}

- (void)initLocationController
{
  if (objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isRecentDevice"))
  {
    CFDictionaryRef v3 = [[WRM_LocationControllerIOS alloc] initWithDesiredAccuracy:kCLLocationAccuracyHundredMeters distanceFilter:100.0];
    *(WRM_CellStationManagerIOS **)((char *)&self->cellStationManager + 4) = (WRM_CellStationManagerIOS *)v3;
    if (v3)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10004CA04;
      v6[3] = &unk_10020DFD0;
      v6[4] = self;
      [(WRM_LocationControllerIOS *)v3 setClientLocationAuthorized:v6];
      CFStringRef v4 = *(WRM_CellStationManagerIOS **)((char *)&self->cellStationManager + 4);
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_10004CAD8;
      v5[3] = &unk_10020E020;
      v5[4] = self;
      [v4 setClientLocationHandler:v5];
    }
  }
}

- (void)createWrmSdmLocationManager
{
  if (objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isRecentDevice"))
  {
    CFDictionaryRef v3 = [WRM_LocationControllerIOS alloc];
    CFStringRef v4 = [(WRM_LocationControllerIOS *)v3 initWithDesiredAccuracy:kCLLocationAccuracyLeech distanceFilter:kCLDistanceFilterNone];
    *(void *)((char *)&self->mLastKnownLocationTimestamp + 4) = v4;
    if (v4)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10004CD7C;
      v7[3] = &unk_10020DFD0;
      v7[4] = self;
      [(WRM_LocationControllerIOS *)v4 setClientLocationAuthorized:v7];
      CFDictionaryRef v5 = *(void **)((char *)&self->mLastKnownLocationTimestamp + 4);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10000FDB0;
      v6[3] = &unk_10020E020;
      v6[4] = self;
      [v5 setClientLocationHandler:v6];
      [*(id *)((char *)&self->mLastKnownLocationTimestamp + 4) startMonitoring];
    }
    else
    {
      +[WCM_Logging logLevel:22 message:@"wrmSdmLocationController creation failed"];
    }
  }
}

- (void)updateWrmSdmLocationDbInfoRegister:(BOOL)a3 forSim:(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004CECC;
  block[3] = &unk_10020DD48;
  block[4] = self;
  void block[5] = a4;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)fetchWrmSdmLocationDbInfoWithMcc:(unsigned int)a3 Mnc:(unsigned int)a4 CellId:(unint64_t)a5 ForSim:(int64_t)a6
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004D0D4;
  v6[3] = &unk_10020DFF8;
  unsigned int v7 = a3;
  unsigned int v8 = a4;
  v6[4] = self;
  void v6[5] = a5;
  v6[6] = a6;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v6);
}

- (void)triggerLocationUpdate
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004D284;
  block[3] = &unk_10020D980;
  block[4] = self;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)triggerHarvestedCellEval
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004D31C;
  block[3] = &unk_10020D980;
  block[4] = self;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
}

- (void)updateGlobalCellID:(unsigned __int8)a3 gci:(id)a4 cellprefix:(int)a5
{
  if ((char *)[(WRM_EnhancedCTService *)self dataPreferredSlot] - 1 == (unsigned char *)a3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004D580;
    block[3] = &unk_10020E048;
    int v9 = a5;
    block[4] = a4;
    void block[5] = self;
    dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
  }
}

- (void)queryLocationdDBForHarvestingData:(double)a3 :(double)a4
{
  id v7 = [objc_alloc((Class)sub_10004D7A4()) initWithGEOCoordinate:a3, a4];
  [v7 setHorizontalAccuracy:0.0];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004D984;
  v8[3] = &unk_10020E070;
  *(double *)&v8[5] = a3;
  *(double *)&v8[6] = a4;
  v8[4] = self;
  [sub_10004D894() fetchDataForLocation:v7 type:1 responseQueue:[self queue] responseBlock:v8];
}

- (void)processVoiceLqmQMI:(unsigned __int8)a3 VLQM:(unsigned __int8)a4 IMSPreference:(BOOL)a5 AudioErasure:(double)a6 RSRP:(double)a7
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004E090;
  v7[3] = &unk_10020E0B8;
  v7[4] = self;
  unsigned __int8 v8 = a3;
  unsigned __int8 v9 = a4;
  BOOL v10 = a5;
  *(double *)&void v7[5] = a6;
  *(double *)&void v7[6] = a7;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v7);
}

- (id)intializeInterfaceClient:(int64_t)a3
{
  unsigned int v4 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") isQmiSdmSupported];
  id v5 = +[WRM_HandoverManager WRM_HandoverManagerSingleton];
  if (v4)
  {
    id v6 = [v5 getQmiClientForSim:a3];
    if (v6) {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: qmiClient is ready.", "-[WRM_EnhancedCTService intializeInterfaceClient:]");
    }
    else {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: qmiClient not ready yet", "-[WRM_EnhancedCTService intializeInterfaceClient:]");
    }
  }
  else if ([v5 isIbiSdmSupported])
  {
    id v6 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getIbiClient];
    if (v6) {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: ibiClient is ready.", "-[WRM_EnhancedCTService intializeInterfaceClient:]");
    }
    else {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: ibiClient not ready yet", "-[WRM_EnhancedCTService intializeInterfaceClient:]");
    }
  }
  else
  {
    return 0;
  }
  return v6;
}

- (void)fetchSmartDataModeDataForLocation:(double)a3 :(double)a4 :(unsigned __int16)a5 :(unsigned __int16)a6 :(unint64_t)a7 :(int64_t)a8
{
  uint64_t v10 = a6;
  uint64_t v11 = a5;
  id v15 = [(WRM_EnhancedCTService *)self intializeInterfaceClient:a8];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    if (a3 == 0.0 && a4 == 0.0)
    {
      +[WCM_Logging logLevel:22, @"fetchSmartDataModeDataForLocation for sub %d invalid location lat/long, return dB unavailable", a8 message];
      [v15 sendWrmSdmLocationDbInfo:a8 dbAvailable:0 mcc:v11 mnc:v10 cellId:a7];
    }
    else
    {
      id v16 = [objc_alloc((Class)sub_10004D7A4()) initWithGEOCoordinate:a3, a4];
      [v16 setHorizontalAccuracy:0.0];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10004E4C4;
      v17[3] = &unk_10020E0E0;
      *(double *)&v17[5] = a3;
      *(double *)&v17[6] = a4;
      v17[4] = v15;
      __int16 v18 = v11;
      __int16 v19 = v10;
      v17[7] = a8;
      v17[8] = a7;
      [sub_10004D894() fetchSmartDataModeDataForLocation:v16 mcc:v11 mnc:v10 responseQueue:[self queue] responseBlock:v17];
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, @"%s: Invalid class type for interface client.", "-[WRM_EnhancedCTService fetchSmartDataModeDataForLocation::::::]");
  }
}

- (double)getLastKnownLatitude
{
  uint64_t v5 = 0;
  id v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004E8F8;
  v4[3] = &unk_10020DB68;
  v4[4] = self;
  void v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v4);
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)getLastKnownLongitude
{
  uint64_t v5 = 0;
  id v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004E9E0;
  v4[3] = &unk_10020DB68;
  v4[4] = self;
  void v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v4);
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)getLastKnownLocationTimestamp
{
  uint64_t v5 = 0;
  id v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004EAC8;
  v4[3] = &unk_10020DB68;
  v4[4] = self;
  void v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v4);
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)shouldScheduleSpeedTests
{
  BOOL v3 = [(WRM_EnhancedCTService *)self ifInternalDevice];
  if (v3)
  {
    BOOL v3 = [(WRM_EnhancedCTService *)self ifLimitSpeedTest];
    if (v3)
    {
      if ([(WRM_EnhancedCTService *)self ifAutomatedDeviceGroup]) {
        LOBYTE(v3) = 0;
      }
      else {
        LOBYTE(v3) = ![(WRM_EnhancedCTService *)self deviceInRoaming];
      }
    }
  }
  return v3;
}

- (void)resetCbrsCAMetricSentOnSimSlot:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10004EBB8;
  v3[3] = &unk_10020DB90;
  v3[4] = self;
  void v3[5] = a3;
  dispatch_async((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], v3);
}

- (void)feedCellularMetricsWithUUID:(id)a3
{
  uint64_t v5 = [[+[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton") getWRMFaceTimeHandover];
  if (v5)
  {
    id v6 = v5;
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000;
    int64_t v23 = 0;
    int64_t v23 = [(WRM_EnhancedCTService *)self dataPreferredSlot];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004EF54;
    block[3] = &unk_10020E108;
    block[4] = self;
    void block[5] = a3;
    void block[6] = &v20;
    dispatch_sync((dispatch_queue_t)[(WRM_EnhancedCTService *)self queue], block);
    unsigned int v7 = [(WRM_EnhancedCTService *)self getCTDataIndictor:v21[3]];
    unsigned int v8 = [(WRM_EnhancedCTService *)self isVoiceLQMValid:v21[3]];
    if (v8) {
      unsigned int v8 = [(WRM_EnhancedCTService *)self getLteVoiceLQM:v21[3]];
    }
    v6[31] = v8;
    unsigned int v9 = [(WRM_EnhancedCTService *)self isDataLQMValid:v21[3]];
    if (v9) {
      unsigned int v9 = [(WRM_EnhancedCTService *)self getCellularDataLQM:v21[3]];
    }
    v6[30] = v9;
    unsigned int v10 = [(WRM_EnhancedCTService *)self dataAttachedWithCellularNetwork:v21[3]];
    if (v10) {
      unsigned int v10 = [(WRM_EnhancedCTService *)self getCurrentSignalBars:v21[3]];
    }
    v6[28] = v10;
    switch([(WRM_EnhancedCTService *)self getServingCellType:v21[3]])
    {
      case 1:
        *((void *)v6 + 13) = @"LTE";
        [(WRM_EnhancedCTService *)self getServingCellRSRP:v21[3]];
        v6[32] = (int)v11;
        [(WRM_EnhancedCTService *)self getServingCellRSRQ:v21[3]];
        v6[33] = (int)v12;
        [(WRM_EnhancedCTService *)self getServingCellSNR:v21[3]];
        v6[34] = (int)v13;
        *((unsigned char *)v6 + 141) = v7 - 16 < 4 || v7 == 8;
        goto LABEL_23;
      case 2:
        *((void *)v6 + 13) = @"UMTS";
        [(WRM_EnhancedCTService *)self getServingCellRSCP:v21[3]];
        v6[32] = (int)v15;
        [(WRM_EnhancedCTService *)self getServingCellECIO:v21[3]];
        goto LABEL_22;
      case 3:
        CFStringRef v14 = @"CDMA1X";
        goto LABEL_20;
      case 4:
        CFStringRef v14 = @"CDMAEVDO";
        goto LABEL_20;
      case 5:
        CFStringRef v14 = @"CDMAHybrid";
        goto LABEL_20;
      case 6:
        CFStringRef v14 = @"eHRPD_RADIO";
        goto LABEL_20;
      case 7:
        CFStringRef v14 = @"TDSCDMA";
        goto LABEL_20;
      case 8:
        CFStringRef v14 = @"GSM";
        goto LABEL_20;
      case 9:
        *((void *)v6 + 13) = @"N_RADIO";
        [(WRM_EnhancedCTService *)self getNrRSRP:v21[3]];
        v6[32] = (int)v17;
        [(WRM_EnhancedCTService *)self getNrRSRQ:v21[3]];
        v6[33] = (int)v18;
        [(WRM_EnhancedCTService *)self getNrSNR:v21[3]];
LABEL_22:
        v6[34] = (int)v16;
        goto LABEL_23;
      default:
        CFStringRef v14 = @"UNKNOWN";
LABEL_20:
        *((void *)v6 + 13) = v14;
LABEL_23:
        _Block_object_dispose(&v20, 8);
        break;
    }
  }
}

- (BOOL)CTClientInitDone
{
  return BYTE5(self->mLastCbrsRecommendation);
}

- (void)setCTClientInitDone:(BOOL)a3
{
  BYTE5(self->mLastCbrsRecommendation) = a3;
}

- (BOOL)mSubscriptionInfoDidChange
{
  return BYTE6(self->mLastCbrsRecommendation);
}

- (void)setMSubscriptionInfoDidChange:(BOOL)a3
{
  BYTE6(self->mLastCbrsRecommendation) = a3;
}

- (unint64_t)numberofSubscriptions
{
  return *(int64_t *)((char *)&self->_activeSlot + 4);
}

- (void)setNumberofSubscriptions:(unint64_t)a3
{
  *(int64_t *)((char *)&self->_activeSlot + 4) = a3;
}

- (void)setMCTService:(id)a3
{
}

- (CoreTelephonyClient)CTClient
{
  return *(CoreTelephonyClient **)((char *)&self->_mCTService + 4);
}

- (void)setCTClient:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)serverQueue
{
  return *(OS_dispatch_queue **)((char *)&self->_queue + 4);
}

- (void)setServerQueue:(id)a3
{
}

- (OS_dispatch_queue)cellularAvailabilityStatusQueue
{
  return *(OS_dispatch_queue **)((char *)&self->_serverQueue + 4);
}

- (void)setCellularAvailabilityStatusQueue:(id)a3
{
}

- (NSMutableArray)subscriptions
{
  return *(NSMutableArray **)((char *)&self->_cellularAvailabilityStatusQueue + 4);
}

- (void)setSubscriptions:(id)a3
{
}

- (void)setDataPreferredSlot:(int64_t)a3
{
  *(NSMutableArray **)((char *)&self->_subscriptions + 4) = (NSMutableArray *)a3;
}

- (void)setIsDataAttached:(id)a3
{
  *(int64_t *)((char *)&self->_dataPreferredSlot + 4) = (int64_t)a3;
}

- (void)setIsDataEnabled:(id)a3
{
  *(NSMutableArray **)((char *)&self->_isDataAttached + 4) = (NSMutableArray *)a3;
}

- (void)setIsDeviceRegistered:(id)a3
{
  *(NSMutableArray **)((char *)&self->_isDataEnabled + 4) = (NSMutableArray *)a3;
}

- (void)setIsWiFiCallingSupported:(id)a3
{
  *(NSMutableArray **)((char *)&self->_isDeviceRegistered + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)isPrivateNetworkSim
{
  return *(NSMutableArray **)((char *)&self->_isWiFiCallingSupported + 4);
}

- (void)setIsPrivateNetworkSim:(id)a3
{
  *(NSMutableArray **)((char *)&self->_isWiFiCallingSupported + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)isPrivateNetworkPreferredOverWifi
{
  return *(NSMutableArray **)((char *)&self->_isPrivateNetworkSim + 4);
}

- (void)setIsPrivateNetworkPreferredOverWifi:(id)a3
{
  *(NSMutableArray **)((char *)&self->_isPrivateNetworkSim + 4) = (NSMutableArray *)a3;
}

- (void)setIsVolteSupported:(id)a3
{
  *(NSMutableArray **)((char *)&self->_isPrivateNetworkPreferredOverWifi + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)isRoaming
{
  return *(NSMutableArray **)((char *)&self->_isVolteSupported + 4);
}

- (void)setIsRoaming:(id)a3
{
  *(NSMutableArray **)((char *)&self->_isVolteSupported + 4) = (NSMutableArray *)a3;
}

- (void)setIsFR2Radio:(id)a3
{
  *(NSMutableArray **)((char *)&self->_isRoaming + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)radioCoverage
{
  return *(NSMutableArray **)((char *)&self->_isFR2Radio + 4);
}

- (void)setRadioCoverage:(id)a3
{
  *(NSMutableArray **)((char *)&self->_isFR2Radio + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)radioFrequency
{
  return *(NSMutableArray **)((char *)&self->_radioCoverage + 4);
}

- (void)setRadioFrequency:(id)a3
{
  *(NSMutableArray **)((char *)&self->_radioCoverage + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)dataEnabled
{
  return *(NSMutableArray **)((char *)&self->_radioFrequency + 4);
}

- (void)setDataEnabled:(id)a3
{
  *(NSMutableArray **)((char *)&self->_radioFrequency + 4) = (NSMutableArray *)a3;
}

- (void)setBars:(id)a3
{
  *(NSMutableArray **)((char *)&self->_dataEnabled + 4) = (NSMutableArray *)a3;
}

- (void)setMovingAverageSignalBars:(id)a3
{
  *(NSMutableArray **)((char *)&self->_bars + 4) = (NSMutableArray *)a3;
}

- (void)setServCellRadioTechnologyType:(id)a3
{
  *(NSMutableArray **)((char *)&self->_movingAverageSignalBars + 4) = (NSMutableArray *)a3;
}

- (void)setVoiceLqmValue:(id)a3
{
  *(NSMutableArray **)((char *)&self->_servCellRadioTechnologyType + 4) = (NSMutableArray *)a3;
}

- (void)setVoiceLqmIsValid:(id)a3
{
  *(NSMutableArray **)((char *)&self->_VoiceLqmValue + 4) = (NSMutableArray *)a3;
}

- (void)setDataLqmValue:(id)a3
{
  *(NSMutableArray **)((char *)&self->_VoiceLqmIsValid + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)DataLqmIsValid
{
  return *(NSMutableArray **)((char *)&self->_DataLqmValue + 4);
}

- (void)setDataLqmIsValid:(id)a3
{
  *(NSMutableArray **)((char *)&self->_DataLqmValue + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)VoiceLqmReasonCode
{
  return *(NSMutableArray **)((char *)&self->_DataLqmIsValid + 4);
}

- (void)setVoiceLqmReasonCode:(id)a3
{
  *(NSMutableArray **)((char *)&self->_DataLqmIsValid + 4) = (NSMutableArray *)a3;
}

- (void)setImsVoiceOverPSSupported:(id)a3
{
  *(NSMutableArray **)((char *)&self->_VoiceLqmReasonCode + 4) = (NSMutableArray *)a3;
}

- (void)setServCellRSRP:(id)a3
{
  *(NSMutableArray **)((char *)&self->_imsVoiceOverPSSupported + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)servCellRSSI
{
  return *(NSMutableArray **)((char *)&self->_servCellRSRP + 4);
}

- (void)setServCellRSSI:(id)a3
{
  *(NSMutableArray **)((char *)&self->_servCellRSRP + 4) = (NSMutableArray *)a3;
}

- (void)setServCellRSRQ:(id)a3
{
  *(NSMutableArray **)((char *)&self->_servCellRSSI + 4) = (NSMutableArray *)a3;
}

- (void)setServCellSNR:(id)a3
{
  *(NSMutableArray **)((char *)&self->_servCellRSRQ + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)servCellSINR
{
  return *(NSMutableArray **)((char *)&self->_servCellSNR + 4);
}

- (void)setServCellSINR:(id)a3
{
  *(NSMutableArray **)((char *)&self->_servCellSNR + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)servCellRSCP
{
  return *(NSMutableArray **)((char *)&self->_servCellSINR + 4);
}

- (void)setServCellRSCP:(id)a3
{
  *(NSMutableArray **)((char *)&self->_servCellSINR + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)servCellECIO
{
  return *(NSMutableArray **)((char *)&self->_servCellRSCP + 4);
}

- (void)setServCellECIO:(id)a3
{
  *(NSMutableArray **)((char *)&self->_servCellRSCP + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)PrevAudioQualityWasGood
{
  return *(NSMutableArray **)((char *)&self->_servCellECIO + 4);
}

- (void)setPrevAudioQualityWasGood:(id)a3
{
  *(NSMutableArray **)((char *)&self->_servCellECIO + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)PrevAudioErasurePercent
{
  return *(NSMutableArray **)((char *)&self->_PrevAudioQualityWasGood + 4);
}

- (void)setPrevAudioErasurePercent:(id)a3
{
  *(NSMutableArray **)((char *)&self->_PrevAudioQualityWasGood + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)loads
{
  return *(NSMutableArray **)((char *)&self->_PrevAudioErasurePercent + 4);
}

- (void)setLoads:(id)a3
{
  *(NSMutableArray **)((char *)&self->_PrevAudioErasurePercent + 4) = (NSMutableArray *)a3;
}

- (void)setRrcState:(id)a3
{
  *(NSMutableArray **)((char *)&self->_loads + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)mcc
{
  return *(NSMutableArray **)((char *)&self->_rrcState + 4);
}

- (void)setMcc:(id)a3
{
  *(NSMutableArray **)((char *)&self->_rrcState + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)mnc
{
  return *(NSMutableArray **)((char *)&self->_mcc + 4);
}

- (void)setMnc:(id)a3
{
  *(NSMutableArray **)((char *)&self->_mcc + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)nrCellRSRP
{
  return *(NSMutableArray **)((char *)&self->_mnc + 4);
}

- (void)setNrCellRSRP:(id)a3
{
  *(NSMutableArray **)((char *)&self->_mnc + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)nrCellRSRQ
{
  return *(NSMutableArray **)((char *)&self->_nrCellRSRP + 4);
}

- (void)setNrCellRSRQ:(id)a3
{
  *(NSMutableArray **)((char *)&self->_nrCellRSRP + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)nrCellSNR
{
  return *(NSMutableArray **)((char *)&self->_nrCellRSRQ + 4);
}

- (void)setNrCellSNR:(id)a3
{
  *(NSMutableArray **)((char *)&self->_nrCellRSRQ + 4) = (NSMutableArray *)a3;
}

- (void)setDataIndicator:(id)a3
{
  *(NSMutableArray **)((char *)&self->_nrCellSNR + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)dataBW
{
  return *(NSMutableArray **)((char *)&self->_dataIndicator + 4);
}

- (void)setDataBW:(id)a3
{
  *(NSMutableArray **)((char *)&self->_dataIndicator + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)locDbRequired
{
  return *(NSMutableArray **)((char *)&self->_dataBW + 4);
}

- (void)setLocDbRequired:(id)a3
{
  *(NSMutableArray **)((char *)&self->_dataBW + 4) = (NSMutableArray *)a3;
}

- (void)setCellARFCN:(id)a3
{
  *(NSMutableArray **)((char *)&self->_locDbRequired + 4) = (NSMutableArray *)a3;
}

- (void)setCellBandInfo:(id)a3
{
  *(NSMutableArray **)((char *)&self->_cellARFCN + 4) = (NSMutableArray *)a3;
}

- (void)setCellBandwidth:(id)a3
{
  *(NSMutableArray **)((char *)&self->_cellBandInfo + 4) = (NSMutableArray *)a3;
}

- (void)setCurrNRCellFound:(id)a3
{
  *(NSMutableArray **)((char *)&self->_cellBandwidth + 4) = (NSMutableArray *)a3;
}

- (void)setWifiNRCellFound:(id)a3
{
  *(NSMutableArray **)((char *)&self->_currNRCellFound + 4) = (NSMutableArray *)a3;
}

- (void)setCellID:(id)a3
{
  *(NSMutableArray **)((char *)&self->_wifiNRCellFound + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)currCBRSCellFound
{
  return *(NSMutableArray **)((char *)&self->_cellID + 4);
}

- (void)setCurrCBRSCellFound:(id)a3
{
  *(NSMutableArray **)((char *)&self->_cellID + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)wifiCBRSCellFound
{
  return *(NSMutableArray **)((char *)&self->_currCBRSCellFound + 4);
}

- (void)setWifiCBRSCellFound:(id)a3
{
  *(NSMutableArray **)((char *)&self->_currCBRSCellFound + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)cbrsCoreAnalyticsMetricsSent
{
  return *(NSMutableArray **)((char *)&self->_wifiCBRSCellFound + 4);
}

- (void)setCbrsCoreAnalyticsMetricsSent:(id)a3
{
  *(NSMutableArray **)((char *)&self->_wifiCBRSCellFound + 4) = (NSMutableArray *)a3;
}

- (BOOL)dataPreferredSlotOnCBRS
{
  return HIBYTE(self->mLastCbrsRecommendation);
}

- (void)setDataPreferredSlotOnCBRS:(BOOL)a3
{
  HIBYTE(self->mLastCbrsRecommendation) = a3;
}

- (void)setDetectedFR1CellCountLocDB:(id)a3
{
  *(NSMutableArray **)((char *)&self->_cbrsCoreAnalyticsMetricsSent + 4) = (NSMutableArray *)a3;
}

- (void)setDetectedFR1CellBW:(id)a3
{
  *(NSMutableArray **)((char *)&self->_detectedFR1CellCountLocDB + 4) = (NSMutableArray *)a3;
}

- (void)setDetectedFR2CellCountLocDB:(id)a3
{
  *(NSMutableArray **)((char *)&self->_detectedFR1CellBW + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)configuredMaxDLBW
{
  return *(NSMutableArray **)((char *)&self->_detectedFR2CellCountLocDB + 4);
}

- (void)setConfiguredMaxDLBW:(id)a3
{
  *(NSMutableArray **)((char *)&self->_detectedFR2CellCountLocDB + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)configuredMaxULBW
{
  return *(NSMutableArray **)((char *)&self->_configuredMaxDLBW + 4);
}

- (void)setConfiguredMaxULBW:(id)a3
{
  *(NSMutableArray **)((char *)&self->_configuredMaxDLBW + 4) = (NSMutableArray *)a3;
}

- (void)setEstimatedBWDL:(id)a3
{
  *(NSMutableArray **)((char *)&self->_configuredMaxULBW + 4) = (NSMutableArray *)a3;
}

- (void)setEstimatedBWDLConf:(id)a3
{
  *(NSMutableArray **)((char *)&self->_estimatedBWDL + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)estimatedBWUL
{
  return *(NSMutableArray **)((char *)&self->_estimatedBWDLConf + 4);
}

- (void)setEstimatedBWUL:(id)a3
{
  *(NSMutableArray **)((char *)&self->_estimatedBWDLConf + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)estimatedBWULConf
{
  return *(NSMutableArray **)((char *)&self->_estimatedBWUL + 4);
}

- (void)setEstimatedBWULConf:(id)a3
{
  *(NSMutableArray **)((char *)&self->_estimatedBWUL + 4) = (NSMutableArray *)a3;
}

- (void)setNeighberCellType:(id)a3
{
  *(NSMutableArray **)((char *)&self->_estimatedBWULConf + 4) = (NSMutableArray *)a3;
}

- (void)setHighDataRateObserved:(id)a3
{
  *(NSMutableArray **)((char *)&self->_neighberCellType + 4) = (NSMutableArray *)a3;
}

- (void)setCurrentNRCellType:(id)a3
{
  *(NSMutableArray **)((char *)&self->_highDataRateObserved + 4) = (NSMutableArray *)a3;
}

- (void)setCurrentHarvestedCellTypeFR2Capable:(id)a3
{
  *(NSMutableArray **)((char *)&self->_currentNRCellType + 4) = (NSMutableArray *)a3;
}

- (void)setStallDetected:(id)a3
{
  *(NSMutableArray **)((char *)&self->_currentHarvestedCellTypeFR2Capable + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)dataModeLTE
{
  return *(NSMutableArray **)((char *)&self->_stallDetected + 4);
}

- (void)setDataModeLTE:(id)a3
{
  *(NSMutableArray **)((char *)&self->_stallDetected + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)isExpensive
{
  return *(NSMutableArray **)((char *)&self->_dataModeLTE + 4);
}

- (void)setIsExpensive:(id)a3
{
  *(NSMutableArray **)((char *)&self->_dataModeLTE + 4) = (NSMutableArray *)a3;
}

@end